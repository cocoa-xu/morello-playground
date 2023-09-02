.DEFAULT = playground

override subobject_this := $(lastword $(MAKEFILE_LIST))
override subobject_curdir := $(realpath $(dir $(subobject_this)))

playground:
	$(CC) $(PURECAP_CFLAGS) $(CFLAGS) -Iutil -I$(subobject_curdir)/include util/capprint.c util/morello.c $(subobject_curdir)/subobject.c -o subobject-purecap
    $(CC) $(HYBRID_CFLAGS) $(CFLAGS) -Iutil -I$(subobject_curdir)/include util/capprint.c util/morello.c $(subobject_curdir)/subobject.c -o subobject-hybrid
