.DEFAULT = playground

override cmpt_this := $(lastword $(MAKEFILE_LIST))
override cmpt_curdir := $(realpath $(dir $(cmpt_this)))
override subobject_src := util/capprint.c util/morello.c $(subobject_curdir)/subobject.c

override CFLAGS := $(CFLAGS) -Iutil -I$(cmpt_curdir)/include
SUBOBJECT_CFLAGS := $(CFLAGS) -cheri-bounds=subobject-safe

hellolb:
	$(CC) $(PURECAP_CFLAGS) $(CFLAGS) util/capprint.c util/morello.c $(cmpt_curdir)/src/lb.S $(cmpt_curdir)/hellolb.c -o hellolb-purecap

hellolpb:
	$(CC) $(PURECAP_CFLAGS) $(CFLAGS) util/capprint.c util/morello.c $(cmpt_curdir)/src/lpb.S $(cmpt_curdir)/hellolpb.c -o hellolpb-purecap

subobject-purecap:
	$(CC) $(PURECAP_CFLAGS) $(SUBOBJECT_CFLAGS) $(subobject_src) -o subobject-purecap

subobject-hybrid:
	$(CC) $(HYBRID_CFLAGS) $(SUBOBJECT_CFLAGS) $(subobject_src) -o subobject-hybrid

subobject: subobject-purecap subobject-hybrid

playground: hellolb hellolpb subobject
