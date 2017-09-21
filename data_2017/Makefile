PREFIX=main
TEXFILE=$(PREFIX).tex
AUXFILE=$(PREFIX).aux
BLGFILE=$(PREFIX).blg
LOGFILE=$(PREFIX).log
LOTFILE=$(PREFIX).lot
LOFFILE=$(PREFIX).lof
BBLFILE=$(PREFIX).bbl

all: plots	
	pdflatex $(PREFIX)
	bibtex   $(PREFIX)
	pdflatex $(PREFIX)
	pdflatex $(PREFIX)

plots: 
#	cd GP; gnuplot *.gp
#	cd Figures; ./epstopdf.sh

clean:
	rm -f $(LOTFILE) $(LOFFILE) $(AUXFILE) $(BLGFILE) $(LOGFILE) $(BBLFILE) $(TOCFILE) $(ETDFILE) $(OUTFILE);
