.DEFAULT = subobject

override subobject_this := $(lastword $(MAKEFILE_LIST))
override subobject_curdir := $(realpath $(dir $(subobject_this)))
override subobject_src := util/capprint.c util/morello.c $(subobject_curdir)/subobject.c

subobject:
	$(CC) $(PURECAP_CFLAGS) $(CFLAGS) -cheri-bounds=subobject-safe -Iutil -I$(subobject_curdir)/include $(subobject_src) -o subobject-purecap
	$(CC) $(HYBRID_CFLAGS) $(CFLAGS) -cheri-bounds=subobject-safe -Iutil -I$(subobject_curdir)/include $(subobject_src) -o subobject-hybrid
