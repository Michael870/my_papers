PREFIX=main
TEXFILE=$(PREFIX).tex
AUXFILE=$(PREFIX).aux
BLGFILE=$(PREFIX).blg
LOGFILE=$(PREFIX).log
BBLFILE=$(PREFIX).bbl
LOFFILE=$(PREFIX).lof
LOTFILE=$(PREFIX).lot
TOCFILE=$(PREFIX).toc
OUTFILE=$(PREFIX).out
ETDFILE=$(PREFIX).etd

all: plots	
	pdflatex  --shell-escape $(PREFIX)
	bibtex   $(PREFIX)
	pdflatex  --shell-escape $(PREFIX)
	pdflatex  --shell-escape $(PREFIX)

plots: 
#	cd GP; gnuplot *.gp
#	cd Figures; ./epstopdf.sh

clean:
	rm -f $(AUXFILE) $(BLGFILE) $(LOGFILE) $(BBLFILE) $(LOFFILE) $(LOTFILE) $(TOCFILE) $(OUTFILE) $(ETDFILE);
