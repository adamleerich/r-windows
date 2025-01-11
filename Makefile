R_SOURCE = ../r-source

PRISTINE_TARGETS = \
	src/nmath/dunif.c \
	src/nmath/nmath.h \
	src/include/Rmath.h \
	src/nmath/dpq.h \
	src/gnuwin32/fixed/h/Rconfig.h \
	src/include/R_ext/Boolean.h \
	src/include/R_ext/Print.h \
	src/include/R_ext/RS.h

# PRISTINE_SOURCES = $(patsubst %,$(R_SOURCE)/%,$(PRISTINE_TARGETS))


.PHONY: all


all: $(PRISTINE_TARGETS)

.SECONDEXPANSION:

$(PRISTINE_TARGETS): $(R_SOURCE)/$$(@D)/$$(@F)
	@mkdir -p $(@D)
	cp -r $(R_SOURCE)/$(@D)/$(@F) $(@D)/$(@F)

clean:
	rm -f src/main.exe
	rm -f src/helloworld.exe
	rm -f src/test-example.exe

superclean: clean
	rm -f $(PRISTINE_TARGETS)
