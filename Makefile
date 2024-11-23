PAPER = paper
TEX = $(wildcard *.tex)
BIB = references.bib
FIGS = $(wildcard imgs/*.png)

.PHONY: all clean view

all: $(PAPER).pdf

view: $(PAPER).pdf
	open $(PAPER).pdf

$(PAPER).pdf: $(TEX) $(BIB) $(FIGS)
	pdflatex $(PAPER)
	bibtex $(PAPER)
	pdflatex $(PAPER)
	pdflatex $(PAPER)

clean:
	rm -f *.aux *.bbl *.blg *.log *.out $(PAPER).pdf

