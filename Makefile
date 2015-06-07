XELATEX=xelatex -file-line-error -interaction=nonstopmode
.PHONY: all auto clean

all: Thesis.tex
	latexmk -pdf -pdflatex="$(XELATEX)" -use-make Thesis.tex

auto: Thesis.tex
	latexmk -pdf -pdflatex="$(XELATEX)" -use-make -pvc Thesis.tex

spellcheck:
	find . -name "*.tex" -exec aspell --lang=en --mode=tex --dont-backup check "{}" \;

clean:
	rm -f Thesis.pdf *.aux *.bbl *bcf *.blg *.log *.out *.tdo *.toc *.xdv *.synctex.gz *.fdb_latexmk *.fls *.run.xml; \
	rm -f **/*.aux
