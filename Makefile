
##
## PROJECT CONFIGURATION (you may change things there to setup this project)
##
include cfg/build_config.mk

##
## USE GLOBAL MAKEFILE (general rules for building CPCtelera projects)
##
include $(CPCT_PATH)/cfg/global_main_makefile.mk


run_sna:$(SNA)
	cpct_rvm annoyed.sna

run_dsk: $(DSK)
	cpct_rvm annoyed.dsk
