PROJ = main

all: latexmk clean

latexmk:
	latexmk $(PROJ)

clean:
	latexmk -c

wipe:
	latexmk -C

.PHONY: latexmk all clean
