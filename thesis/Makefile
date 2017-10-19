PREFIX=main
TEXFILE=$(PREFIX).tex
AUXFILE=$(PREFIX).aux
BLGFILE=$(PREFIX).blg
LOGFILE=$(PREFIX).log
BBLFILE=$(PREFIX).bbl

all: plots	
	pdflatex  --shell-escape $(PREFIX)
	bibtex   $(PREFIX)
	pdflatex  --shell-escape $(PREFIX)
	pdflatex  --shell-escape $(PREFIX)

plots: 
#	cd GP; gnuplot *.gp
#	cd Figures; ./epstopdf.sh

clean:
	rm -f $(AUXFILE) $(BLGFILE) $(LOGFILE) $(BBLFILE);
