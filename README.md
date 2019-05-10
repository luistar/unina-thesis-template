# unina-thesis-template
A fancy LaTeX template for theses at the University of Naples "Federico II" (UniNA). Check out [thesis.pdf](thesis.pdf) for a demo!

## Features
* Nice front page(s) with the [unina-frontespizio](https://github.com/luistar/unina-frontespizio) package;
* Many different typefaces to chose from by just selecting the corresponding documentclass option (see [thesis.tex](thesis.tex));
* Optional inline table of contents at the beginning of each chapter with the custom `\inlineminitoc` command;
* Custom `\unnumberedchapter{},\unnumberedsection{}` commands to help add unnumbered chapters/sections to the TOC (see introduction and conclusions);
* Custom stylings for consistent (booktabs) tables, algorithms, and (lst)listings;
* Custom chapter heading;
* Built-in utilities such as the `uninadraft` option, which prints lines numbers to help revisions, and the `uninatodo` macro, which can help you write margin todo notes (an example is provided in [thesis.pdf](thesis.pdf)).
## Screenshots
![title frame](/screenshots/front-page.png)      | ![simple frame](/screenshots/front-page-inner.png) | ![title frame](/screenshots/chapter.png) 
--------------------------------------------|-------------------------------------------|------------------------------------------

## User guide
Clone this repository and start writing your own content! The documentclass in thesis.tex has a few commented options you can check out and the rest of the document is pretty self-explanatory. Full-compile as usual with `pdflatex thesis`, `biber thesis`, `pdflatex thesis`x2.

## License
This project is licensed under the GPL v3 License - see the [LICENSE](LICENSE) file for details.
