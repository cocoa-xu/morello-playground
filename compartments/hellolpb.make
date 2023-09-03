.DEFAULT = playground

override hellolpb_this := $(lastword $(MAKEFILE_LIST))
override hellolpb_curdir := $(realpath $(dir $(hellolpb_this)))

playground:
	$(CC) $(PURECAP_CFLAGS) $(CFLAGS) -Iutil -I$(hellolpb_curdir)/include util/capprint.c util/morello.c $(hellolpb_curdir)/src/lpb.S $(hellolpb_curdir)/hellolpb.c -o hellolpb-purecap
