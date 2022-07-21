PREFIX=main
TEXFILE=$(PREFIX).tex
AUXFILE=$(PREFIX).aux
BLGFILE=$(PREFIX).blg
LOGFILE=$(PREFIX).log
BBLFILE=$(PREFIX).bbl
OUTFILE=$(PREFIX).out

all: 
	pdflatex $(PREFIX)
	bibtex   $(PREFIX)
	pdflatex $(PREFIX)
	pdflatex $(PREFIX)


clean:
	rm -f $(OUTFILE) $(AUXFILE) $(BLGFILE) $(LOGFILE) $(BBLFILE);
