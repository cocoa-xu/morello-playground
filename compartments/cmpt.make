.DEFAULT = playground

override cmpt_this := $(lastword $(MAKEFILE_LIST))
override cmpt_curdir := $(realpath $(dir $(cmpt_this)))
override util_src := util/capprint.c util/morello.c

override hellolb_src := $(util_src) $(cmpt_curdir)/src/lb.S $(cmpt_curdir)/hellolb.c
override hellolpb_src := $(util_src) $(cmpt_curdir)/src/lpb.S $(cmpt_curdir)/hellolpb.c
override subobject_src := $(util_src) $(cmpt_curdir)/subobject.c

override CFLAGS := $(CFLAGS) -Iutil -I$(cmpt_curdir)/include
SUBOBJECT_CFLAGS := $(CFLAGS) -cheri-bounds=subobject-safe

hellolb:
	$(CC) $(PURECAP_CFLAGS) $(CFLAGS) $(hellolb_src) -o hellolb-purecap

hellolpb:
	$(CC) $(PURECAP_CFLAGS) $(CFLAGS) $(hellolpb_src) -o hellolpb-purecap

subobject-purecap:
	$(CC) $(PURECAP_CFLAGS) $(SUBOBJECT_CFLAGS) $(subobject_src) -o subobject-purecap

subobject-hybrid:
	$(CC) $(HYBRID_CFLAGS) $(SUBOBJECT_CFLAGS) $(subobject_src) -o subobject-hybrid

subobject: subobject-purecap subobject-hybrid

playground: hellolb hellolpb subobject
