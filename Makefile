LATEX-COMP=pdflatex
BIBTEX=bibtex
FLAGS=-pdf -interaction=nonstopmode -synctex=1 -file-line-error
MAIN=main

all:
	$(LATEX-COMP) $(FLAGS) $(MAIN).tex && \
	$(LATEX-COMP) $(FLAGS) $(MAIN).tex

.PHONY: format
format:
	latexindent -w -s $(MAIN).tex

.PHONY: test
test:
	latexindent -k -s $(MAIN).tex

.PHONY: pack
pack: $(MAIN).pdf
	zip $(MAIN).zip $(MAIN).pdf

.PHONY: unpack
unpack: $(MAIN).zip
	unzip $(MAIN).zip

.PHONY: clean
clean: 
	rm -f $(MAIN).aux $(MAIN).bbl $(MAIN).blg $(MAIN).log $(MAIN).out $(MAIN).synctex.gz $(MAIN).toc $(MAIN).pdf *.log *.bak* *.zip
