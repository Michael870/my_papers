
PREFIX    = icpp2013
TEX_FILES = $(PREFIX).tex
DVI_FILES = $(PREFIX).dvi
PS_FILES  = $(PREFIX).ps
PDF_FILES = $(PREFIX).pdf
BIB_FILES = $(PREFIX).bib

all: $(PDF_FILES) tidy_up

test:
	echo $(PDF_FILES)

pdf: $(PDF_FILES) tidy_up

ps: $(PS_FILES) tidy_up

dvi: $(DVI_FILES)

$(DVI_FILES): $(TEX_FILES) $(BIB_FILES)
	rm -f $(DVI_FILES) *.aux
	sh -c 'latex $(TEX_FILES)'
	sh -c 'latex $(TEX_FILES)'
	bibtex $(PREFIX)
	sh -c 'latex $(TEX_FILES)'
	sh -c 'latex $(TEX_FILES)'

%.ps: %.dvi
	rm -f $@
	dvips -t letter $< -o $@

%.pdf: %.dvi
	rm -f $@
	dvipdf $< $@

tidy_up:
	rm -f *.dvi *.aux *.bbl *.blg *.log *.toc

clean: tidy_up
	rm -f $(DVI_FILES) $(PS_FILES) $(PDF_FILES)
