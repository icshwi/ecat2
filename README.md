# ecat2-ess 

This is the repository for ESS customized PSI ecat2. Due to many issues, we re-start them with some reasonable and traceable history in order to find the ground zero for ESS.


# Warning
The directory has the generic EPICS compilation structure, however, we don't add real information in configure files, and Makefile. We have a plan to add them later.


# History

* forked and gave Release number according to commit history
* created and marked PSI_ae68db8
* copied all changes into PSI_ae68db8, and created ess-2-1-2
* built EPICS APP directory structure instead of flat one
* copied all available DB, tempalte, substitutions files from [2], please see README.md in Db
* 


# Future maintenance issues

* ess-2-1-2 removed local ecrt.h in order to use etherlab master ecrt.h.
* Fortunately, the stable-1.5 latest commit [1] has ecrt.h which is not quietly updated. The difference between them as

```
ecat2-ess ((PSI_ae68db8))$ diff ../../ecat_setup/etherlabmaster-code/include/ecrt.h ecrt.h

3c3
<  *  $Id$
---
>  *  $Id: ecrt.h,v 1.1 2015/07/21 07:35:54 maier_d Exp $
21c21
<  *  <http://www.gnu.org/licenses/>.
---
>  *  <http:/www.gnu.org/licenses/>.
128c128
< #include <stdlib.h> // for size_t
---
> #include <stdlib.h> /* for size_t */
130c130
< #include <sys/time.h> // for struct timeval
---
> #include <sys/time.h> /* for struct timeval */
585c585
< #endif // #ifndef __KERNEL__
---
> #endif /* #ifndef __KERNEL__ */
618c618
< #endif // #ifndef __KERNEL__
---
> #endif /* #ifndef __KERNEL__ */
1226c1226
<  * \code
---
>  *
1228,1229c1228,1229
<  *     {0x3101, 1,  8}, // status
<  *     {0x3101, 2, 16}  // value
---
>  *     {0x3101, 1,  8},
>  *     {0x3101, 2, 16}
1233,1234c1233,1234
<  *     {0x3102, 1,  8}, // status
<  *     {0x3102, 2, 16}  // value
---
>  *     {0x3102, 1,  8},
>  *     {0x3102, 2, 16}
1249c1249
<  *     // handle error
---
>  *
1260,1261c1260,1261
<  *     {0x1600}, // Channel 1
<  *     {0x1601}  // Channel 2
---
>  *     {0x1600},  Channel 1
>  *     {0x1601}   Channel 2
1269c1269
<  *     // handle error
---
>  *     handle error
2025a2026,2030
> 
> 
> 
> int ecrt_domain_received( ec_domain_t *domain );
> 
```

ESS would like to have separated patch files for Etherlab EtherCAT master, so we would like to drop that change in ecat2 respository here.  


# Reference 


[1] Date :Tuesday, February 20 13:58:31 CET 2018
```
changeset:   2272:9e65f782e8a1
branch:      stable-1.5
tag:         tip
user:        Florian Pose
date:        Tue Feb 13 17:16:01 2018 +0100
summary:     Fixed scheduler settings in dc_user example; use CLOCK_MONOTONIC.

[2] f7993ed 2018-01-23 
https://bitbucket.org/europeanspallationsource/m-epics-ecat2db
```

