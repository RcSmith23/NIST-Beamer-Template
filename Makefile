BUILD := build
TEX := lualatex --shell-escape --output-directory $(BUILD)

SLIDES := NIST-example

TARGET := $(SLIDES).pdf
TEX_FILES := $(wildcard sections/*.tex)

all: $(TARGET)

read::
	evince $(BUILD)/$(TARGET) 2> /dev/null > /dev/null &

spell: $(addsuffix .spchk,$(basename $(TEX_FILES)))

%.spchk: %.tex
	@aspell --lang=en -t -c $<

#	find . -name '*.tex' -o -name '*.sty' -exec aspell --lang=en --mode=tex check "{}" \;

$(SLIDES).pdf : $(SLIDES).tex
	$(TEX) $(SLIDES).tex

clean:
	@echo " Cleaning..."
	@echo " $(RM) -r $(BUILD)/*";  $(RM) -r $(BUILD)/*

.PHONY: clean
.PHONY: spell
