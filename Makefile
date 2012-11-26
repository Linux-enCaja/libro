
SRCDIR = .

MAINDOC	= anexo1

TEXFILES=$(wildcard *.tex)
TARGETS=$(patsubst %.tex,%.pdf,$(TEXFILES))
TEXSRC	= $(MAINDOC).tex
CLEANFILES=*.aux *.bbl *.blg *.log *.dvi *.out *.nav *.snm *~ *backup *.idx *.ilg *.ind *.toc *.lot *.lof $(MAINDOC).pdf *bak

RERUN = "(There were undefined references|Rerun to get (cross-references|the bars) right|Table widths have changed. Rerun LaTeX.|Linenumber reference failed)"
RERUNBIB = "No file.*\.bbl|Citation.*undefined"

all: pdf

view: 
	evince $(MAINDOC).pdf

pdf: $(MAINDOC).tex
	pdflatex $(TEXSRC)
	bibtex $(MAINDOC)
	pdflatex $(TEXSRC)
	pdflatex $(TEXSRC)
	
	
$(MAINDOC).tex:
	@echo "Build the main tex"
	rm -rf $(MAINDOC).tex
	cp tools/dummy.tex $(MAINDOC).tex
	@echo "\include{$(MAINDOC)/$(MAINDOC)}" >> $(MAINDOC).tex
	@echo "\end{document}" >> $(MAINDOC).tex

clean:
	find $(SRCDIR) -name \*.aux -exec rm {} \;
	find $(SRCDIR) -name \*.bbl -exec rm {} \;
	find $(SRCDIR) -name \*.blg -exec rm {} \;
	find $(SRCDIR) -name \*.log -exec rm {} \;
	find $(SRCDIR) -name \*.dvi -exec rm {} \;
	find $(SRCDIR) -name \*.out -exec rm {} \;        
	find $(SRCDIR) -name \*~ -exec rm {} \;
	find $(SRCDIR) -name \*backup -exec rm {} \;
	find $(SRCDIR) -name \*.idx -exec rm {} \;
	find $(SRCDIR) -name \*.ilg -exec rm {} \;	
	find $(SRCDIR) -name \*.ind -exec rm {} \;
	find $(SRCDIR) -name \*.toc -exec rm {} \;	
	find $(SRCDIR) -name \*.lot -exec rm {} \;	
	find $(SRCDIR) -name \*.lof -exec rm {} \;
	find $(SRCDIR) -name \*.bak -exec rm {} \;	
	find $(SRCDIR) -name \$(MAINDOC).pdf -exec rm {} \;
	#This must be in a for ...so dirty make
 
