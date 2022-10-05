
##
## PROJECT CONFIGURATION (you may change things there to setup this project)
##
include cfg/build_config.mk

##
## USE GLOBAL MAKEFILE (general rules for building CPCtelera projects)
##
include $(CPCT_PATH)/cfg/global_main_makefile.mk

kill_old:
	-killall --quiet -9 RetroVirtualMac

run_sna:$(SNA) kill_old	
	cpct_rvm annoyed.sna

run_dsk: $(DSK) kill_old
	cpct_rvm annoyed.dsk
