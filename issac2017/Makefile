PREFIX=paper
TEXFILE=$(PREFIX).tex
AUXFILE=$(PREFIX).aux
BLGFILE=$(PREFIX).blg
LOGFILE=$(PREFIX).log
BBLFILE=$(PREFIX).bbl

all:	
	pdflatex $(PREFIX)
	bibtex   $(PREFIX)
	pdflatex $(PREFIX)
	pdflatex $(PREFIX)

clean:
	rm -f $(AUXFILE) $(BLGFILE) $(LOGFILE) $(BBLFILE);
