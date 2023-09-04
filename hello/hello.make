.DEFAULT = playground

override hello_this := $(lastword $(MAKEFILE_LIST))
override hello_curdir := $(realpath $(dir $(hello_this)))

override util_src := util/capprint.c util/morello.c
override subobject_src := $(util_src) $(cmpt_curdir)/subobject.c

SUBOBJECT_CFLAGS := $(CFLAGS) -Iutil -I$(cmpt_curdir)/include -cheri-bounds=subobject-safe

hello-purecap:
	$(CC) $(PURECAP_CFLAGS) $(CFLAGS) $(hello_curdir)/hello.c -o hello-purecap

hello-hybrid:
	$(CC) $(HYBRID_CFLAGS) $(CFLAGS) $(hello_curdir)/hello.c -o hello-hybrid

hello: hello-purecap hello-hybrid

subobject-purecap:
	$(CC) $(PURECAP_CFLAGS) $(SUBOBJECT_CFLAGS) $(subobject_src) -o subobject-purecap

subobject-hybrid:
	$(CC) $(HYBRID_CFLAGS) $(SUBOBJECT_CFLAGS) $(subobject_src) -o subobject-hybrid

subobject: subobject-purecap subobject-hybrid

playground: hello subobject
