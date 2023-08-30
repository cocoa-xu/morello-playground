.DEFAULT = playground

playground:
	$(CC) $(PURECAP_CFLAGS) $(CFLAGS) ./hello.c -o hello-purecap
	$(CC) $(HYBRID_CFLAGS) $(CFLAGS) ./hello.c -o hello-hybrid
