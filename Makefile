BUILD := build
TEX := lualatex --shell-escape --output-directory $(BUILD)

SLIDES := NIST-example

TARGET := $(SLIDES).pdf

all: $(TARGET)

read::
	evince $(BUILD)/$(TARGET) &

spell::
	find . -name '*.tex' -o -name '*.sty' -exec aspell --lang=en --mode=tex check "{}" \;

$(SLIDES).pdf : $(SLIDES).tex
	$(TEX) $(SLIDES).tex

clean:
	@echo " Cleaning..."
	@echo " $(RM) -r $(BUILD)/*";  $(RM) -r $(BUILD)/*

.PHONY: clean
