PROJ = main

all: latexmk clean

latexmk:
	latexmk $(PROJ)

clean:
	latexmk -c

wipe:
	latexmk -C
	rm -rf *.bbl *.synctex

.PHONY: latexmk all clean
