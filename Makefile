
OUTPUT_DIR=/tmp/pdflatex
OPTIONS=-output-directory=$(OUTPUT_DIR) -mode=scrollmode

%.pdf: %.tex 
	@mkdir $(OUTPUT_DIR) 2> /dev/null || true
	while pdflatex $(OPTIONS) $< | tee /dev/tty | grep 'may have changed'; do true; done
	cp $(OUTPUT_DIR)/$@ .

all: crc-workshop-handout.pdf

