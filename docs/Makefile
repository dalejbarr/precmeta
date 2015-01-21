precmeta_dist.pdf : precmeta_dist.tex refs.bib
	pdflatex -interaction nonstopmode -output-directory tex precmeta_dist.tex \
  bibtex tex/precmeta_dist \
	pdflatex -interaction nonstopmode -output-directory tex precmeta_dist.tex \
	pdflatex -interaction nonstopmode -output-directory tex precmeta_dist.tex \ 
	mv tex/precmeta_dist.pdf . 
