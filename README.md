# uniLDthesis

Unofficial LaTeX template for English reports and theses at the University of Koblenz–Landau. A PDF preview is available [here](https://github.com/zsteinmetz/uniLDthesis/blob/master/main.pdf).

## Download

Either clone this git repository or [download](https://github.com/zsteinmetz/uniLDthesis/archive/master.zip) the complete archive as zip.

## Build

Building PDF files from LaTeX sources requires a complete LaTeX distribution installed on your computer, e.g. TeX Live or MiKTeX. See the [LaTeX compendium on Wikibooks](https://en.wikibooks.org/wiki/LaTeX/Installation) for a comprehensive overview and installation instructions. The following steps have been tested on Ubuntu Linux.

### Using _Make_

Simply type `make` into your command line and open the PDF. This step requires _Make_.

### Using _latexmk_

You can also use _latexmk_ by typing:

```shell
latexmk main
```

After building, you may want to clean your environment with `latexmk -c`.

### Manual compiling

Alternatively, you can manually compile from sources. The template is recommended to be compiled with _pdflatex_:

```shell
pdflatex main
makeindex -s main.ist -t main.alg -o main.acr main.acn
pdflatex main
```

## Features

* Optional second/external logo
* `oneside` or `twoside` layout
* `10pt`, `11pt`, and `12pt` base font size
* `draft` mode: enables line numbering, hides images for faster compilation
* `review` option: keeps line numbering enabled but displays images

The document class is based on the LaTeX standard class `book`.

Packages loaded by default include:

* AMS packages `amsfonts`, `amsmath`, and `amssymb`
* `babel`
* `booktabs`
* `caption`
* `glossaries`
* `graphicx`
* `hyperref`
* `microtype`
* `multirow`
* `natbib`

Have a look at [CTAN](https://www.ctan.org/) for package details.

## License

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License (CC BY-SA 4.0)</a>.
