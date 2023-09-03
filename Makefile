include config.make

playground:
include hello/hello.make
include compartments/hellolb.make
include compartments/hellolpb.make
include compartments/subobject.make

.PHONY: playground
