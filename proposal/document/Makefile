PREFIX=proposal
TEXFILE=$(PREFIX).tex
AUXFILE=$(PREFIX).aux
BLGFILE=$(PREFIX).blg
LOGFILE=$(PREFIX).log
BBLFILE=$(PREFIX).bbl
TOCFILE=$(PREFIX).toc
OUTFILE=$(PREFIX).out

all: plots	
	pdflatex $(PREFIX)
	bibtex   $(PREFIX)
	pdflatex $(PREFIX)
	pdflatex $(PREFIX)

plots: 
#	cd GP; gnuplot *.gp
#	cd Figures; ./epstopdf.sh

clean:
	rm -f $(TOCFILE) $(OUTFILE) $(AUXFILE) $(BLGFILE) $(LOGFILE) $(BBLFILE);
