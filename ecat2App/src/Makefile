TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = ecat2
# ecat2.dbd will be created and installed
DBD += ecat2.dbd

# ecat2.dbd will be made up from these files:
ecat2_DBD += base.dbd

# Include dbd files from all support applications:
#ecat2_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#ecat2_LIBS += xxx

# ecat2_registerRecordDeviceDriver.cpp derives from ecat2.dbd
ecat2_SRCS += ecat2_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
ecat2_SRCS_DEFAULT += ecat2Main.cpp
ecat2_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#ecat2_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
ecat2_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

