include config.make

playground:
include hello/hello.make
include compartments/cmpt.make

.PHONY: playground

clean:
include hello/hello.make
include compartments/cmpt.make
