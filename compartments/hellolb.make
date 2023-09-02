.DEFAULT = playground

override hellolb_this := $(lastword $(MAKEFILE_LIST))
override hellolb_curdir := $(realpath $(dir $(hellolb_this)))

playground:
	$(CC) $(PURECAP_CFLAGS) $(CFLAGS) -Iutil -I$(hellolb_curdir)/include util/capprint.c util/morello.c $(hellolb_curdir)/src/lb.S $(hellolb_curdir)/hellolb.c -o hellolb-purecap
	$(CC) $(HYBRID_CFLAGS) $(CFLAGS) -Iutil -I$(hellolb_curdir)/include util/capprint.c util/morello.c $(hellolb_curdir)/src/lb.S $(hellolb_curdir)/hellolb.c -o hellolb-hybrid
