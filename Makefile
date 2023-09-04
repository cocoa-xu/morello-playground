include config.make

include hello/hello.make
include compartments/cmpt.make

playground: playground-hello playground-cmpt

clean: clean-hello clean-cmpt

.PHONY: playground
