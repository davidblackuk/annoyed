
##
## PROJECT CONFIGURATION (you may change things there to setup this project)
##
include cfg/build_config.mk

##
## USE GLOBAL MAKEFILE (general rules for building CPCtelera projects)
##
include $(CPCT_PATH)/cfg/global_main_makefile.mk

kill_old:
	-killall --quiet -9 cpcemu

run_sna:$(SNA) kill_old
	cpcemu annoyed.sna &

run_dsk: $(DSK) kill_old
	cpcemu annoyed.dsk &

really_clean: clean
	-rm annoyed.*
