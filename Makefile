# Build ACM and IEEE PDFs from shared section files.
# Usage:
#   make           # builds both PDFs
#   make acm       # builds acm.pdf
#   make ieee      # builds ieee.pdf
#   make clean

PAPERS := acm ieee

COMMON_TEX := intro.tex approach.tex evaluation.tex outro.tex
BIB := references.bib
FIGS := $(wildcard imgs/*.*)

.PHONY: all clean view view-acm view-ieee acm ieee

all: $(PAPERS:=.pdf)

acm: acm.pdf
ieee: ieee.pdf

%.pdf: %.tex $(COMMON_TEX) $(BIB) $(FIGS)
	pdflatex $*
	bibtex $*
	pdflatex $*
	pdflatex $*

clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lof *.lot *.bcf *.run.xml \
	      acm.pdf ieee.pdf
