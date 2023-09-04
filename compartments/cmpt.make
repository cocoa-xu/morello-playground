.DEFAULT = playground

override cmpt_this := $(lastword $(MAKEFILE_LIST))
override cmpt_curdir := $(realpath $(dir $(cmpt_this)))
override util_src := util/capprint.c util/morello.c

override hellolb_src := $(util_src) $(cmpt_curdir)/src/lb.S $(cmpt_curdir)/hellolb.c
override hellolpb_src := $(util_src) $(cmpt_curdir)/src/lpb.S $(cmpt_curdir)/hellolpb.c

override CFLAGS := $(CFLAGS) -Iutil -I$(cmpt_curdir)/include

hellolb:
	$(CC) $(PURECAP_CFLAGS) $(CFLAGS) $(hellolb_src) -o hellolb-purecap

hellolpb:
	$(CC) $(PURECAP_CFLAGS) $(CFLAGS) $(hellolpb_src) -o hellolpb-purecap

playground: hellolb hellolpb

clean:
	@rm -f hellolb-purecap hellolpb-purecap
