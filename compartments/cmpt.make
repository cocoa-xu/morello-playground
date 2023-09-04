.DEFAULT = playground

override cmpt_this := $(lastword $(MAKEFILE_LIST))
override cmpt_curdir := $(realpath $(dir $(cmpt_this)))
override util_src := util/capprint.c util/morello.c

override hellolb_src := $(util_src) $(cmpt_curdir)/src/lb.S $(cmpt_curdir)/hellolb.c
override hellolpb_src := $(util_src) $(cmpt_curdir)/src/lpb.S $(cmpt_curdir)/hellolpb.c
override nestedcmpt_src := $(util_src) $(cmpt_curdir)/src/manager.c $(cmpt_curdir)/nestedcmpt.c

override CFLAGS := $(CFLAGS) -Iutil -I$(cmpt_curdir)/include

hellolb:
	$(CC) $(PURECAP_CFLAGS) $(CFLAGS) $(hellolb_src) -o hellolb-purecap

hellolpb:
	$(CC) $(PURECAP_CFLAGS) $(CFLAGS) $(hellolpb_src) -o hellolpb-purecap

nestedcmpt:
	$(CC) $(PURECAP_CFLAGS) $(CFLAGS) $(nestedcmpt_src) -o nestedcmpt-purecap

playground-cmpt: hellolb hellolpb nestedcmpt

clean-cmpt:
	@rm -f hellolb-purecap hellolpb-purecap
