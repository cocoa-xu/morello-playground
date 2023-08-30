.DEFAULT = playground

override hello_this := $(lastword $(MAKEFILE_LIST))
override hello_curdir := $(realpath $(dir $(hello_this)))

playground:
	$(CC) $(PURECAP_CFLAGS) $(CFLAGS) $(hello_curdir)/hello.c -o hello-purecap
	$(CC) $(HYBRID_CFLAGS) $(CFLAGS) $(hello_curdir)/hello.c -o hello-hybrid
