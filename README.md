# uniLDthesis

Unofficial LaTeX template for English reports and theses at the University of Koblenz–Landau. A PDF preview is available [here](https://github.com/zsteinmetz/uniLDthesis/blob/master/main.pdf).

## Download

Either clone this git repository or [download](https://github.com/zsteinmetz/uniLDthesis/archive/master.zip) the complete archive.

## Build

This template is recommended to be compiled with XeLaTeX using `latexmk`:

```shell
latexmk -xelatex main
```

You may want to clean your environment by typing:

```shell
latexmk -c
```

Alternatively, the following commands may be used:

```shell
xelatex main
makeindex -s main.ist -t main.alg -o main.acr main.acn
xelatex main
```

## Features

* Optional second/external logo
* `oneside` or `twoside` layout
* Variable font size (10 - 12 pt) and type (currently palatino)

The document class is based on the LaTeX standard class `book`.

## License

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License (CC BY-SA 4.0)</a>.
