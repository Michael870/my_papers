
PREFIX    = closer2014
TEX_FILES = $(PREFIX).tex
DVI_FILES = $(PREFIX).dvi
PS_FILES  = $(PREFIX).ps
PDF_FILES = $(PREFIX).pdf
BIB_FILES = $(PREFIX).bib

all: plots
	pdflatex --shell-escape $(PREFIX)
	bibtex $(PREFIX)
	pdflatex --shell-escape $(PREFIX)
	pdflatex --shell-escape $(PREFIX)

plots:
	#rm diagrams/*.eps
	cd gp; gnuplot *.gp; 
	#rm diagrams/*converted*.pdf
	#cd gp: gnuplot mtbf_profit.gp
	#cd gp: gnuplot rho_speed.gp
	#cd gp: gnuplot rho

clean: 
	rm -f $(DVI_FILES) $(PS_FILES) *.aux *.blg *.pdf
	rm -f diagrams/*converted*.pdf
	rm -f diagrams/rho_*.eps
	rm -f diagrams/mtbf_*.eps
	rm -f diagrams/t_*.eps
	rm -f diagrams/n_*.eps
