#!/bin/bash
set -e -x

# Build Base for use with https://travis-ci.org
#
# Set environment variables
# BASE= 3.15 or 3.16  (VCS branch)
# STATIC=  static or shared

die() {
    echo "$1" >&2
    exit 1
}

[ "$BASE" ] || exit 0

CDIR="$HOME/.cache/base-$BASE-$STATIC"
EPICS_BASE="$CDIR/base"

if [ ! -e "$CDIR/built" ]
then
    install -d "$CDIR"
    ( cd "$CDIR" && git clone --depth 50 --branch $BASE https://github.com/epics-base/epics-base.git base )

    EPICS_HOST_ARCH=`sh $EPICS_BASE/startup/EpicsHostArch`

    case "$STATIC" in
	static)
	    cat << EOF >> "$EPICS_BASE/configure/CONFIG_SITE"
SHARED_LIBRARIES=NO
STATIC_BUILD=YES
EOF
	    ;;
	*) ;;
    esac

    case "$CMPLR" in
	clang)
	    echo "Host compiler is clang"
	    cat << EOF >> "$EPICS_BASE/configure/os/CONFIG_SITE.Common.$EPICS_HOST_ARCH"
GNU         = NO
CMPLR_CLASS = clang
CC          = clang
CCC         = clang++
EOF

	    # hack
	    sed -i -e 's/CMPLR_CLASS = gcc/CMPLR_CLASS = clang/' "$EPICS_BASE/configure/CONFIG.gnuCommon"

	    clang --version
	    ;;
	*)
	    echo "Host compiler is default"
	    gcc --version
	    ;;
    esac

    make -C "$EPICS_BASE" -j2

    touch "$CDIR/built"
fi


# EPICS_HOST_ARCH=`sh $EPICS_BASE/startup/EpicsHostArch`

CDIR="$HOME/.cache/ecatmaster"

if [ ! -e "$CDIR/built" ]
then
    install -d "$CDIR"
    # Too slow from sf.net, so I clone it to github.com
    # 
    # hg clone http://hg.code.sf.net/p/etherlabmaster/code ecmaster -r stable-1.5
    #
    ( cd "$CDIR" && git clone --depth 50 --branch stable-1.5 https://github.com/icshwi/ecatmaster ecatmaster )

    ECATMASTER="$CDIR/ecatmaster"
    
    # ~/build/icshwi/ecat2-ess
    echo $PWD

    # apply PSI patch in order to use ecat2-ess
    patch -d ${ECATMASTER} --ignore-whitespace -p0 < patch/PSI/psi_etherlab_master.p0.patch
    
    pushd ${ECATMASTER}
    echo $PWD
    touch ChangeLog
    autoreconf --force --install -v
    ./configure --disable-8139too
    sudo make install clean
    popd

    echo $PWD
    
    touch "$CDIR/built"
    
fi


EPICS_HOST_ARCH=`sh $EPICS_BASE/startup/EpicsHostArch`

cat << EOF > configure/RELEASE.local
EPICS_BASE=$EPICS_BASE
EOF
