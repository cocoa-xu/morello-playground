.DEFAULT = playground

override cmpt_this := $(lastword $(MAKEFILE_LIST))
override cmpt_curdir := $(realpath $(dir $(cmpt_this)))
override subobject_src := util/capprint.c util/morello.c $(subobject_curdir)/subobject.c

hellolb:
    $(CC) $(PURECAP_CFLAGS) $(CFLAGS) -Iutil -I$(cmpt_curdir)/include util/capprint.c util/morello.c $(cmpt_curdir)/src/lb.S $(cmpt_curdir)/hellolb.c -o hellolb-purecap

hellolpb:
    $(CC) $(PURECAP_CFLAGS) $(CFLAGS) -Iutil -I$(cmpt_curdir)/include util/capprint.c util/morello.c $(cmpt_curdir)/src/lpb.S $(cmpt_curdir)/hellolpb.c -o hellolpb-purecap

subobject-purecap:
    $(CC) $(PURECAP_CFLAGS) $(CFLAGS) -cheri-bounds=subobject-safe -Iutil -I$(subobject_curdir)/include $(subobject_src) -o subobject-purecap

subobject-hybrid:
    $(CC) $(HYBRID_CFLAGS) $(CFLAGS) -cheri-bounds=subobject-safe -Iutil -I$(subobject_curdir)/include $(subobject_src) -o subobject-hybrid

subobject: subobject-purecap subobject-hybrid

playground: hellolb hellolpb subobject
	