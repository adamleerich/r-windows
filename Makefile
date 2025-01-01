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

src/main.exe: src/main.c
	gcc $< -o $@

src/helloworld.exe: src/helloworld.cpp
	g++ $< -o $@

tests/test-example.exe: tests/test-example.c
	@gcc -I/mingw64/include -L/mingw64/lib -o $@ $< -lcmocka
	@./$@

tests/test-dunif.exe: tests/test-dunif.c
	@gcc -DMATHLIB_STANDALONE -Isrc/include -Isrc/include/R_ext -Isrc/gnuwin32/fixed/h -I/mingw64/include -L/mingw64/lib -o $@ $< -lcmocka
	@./$@


	
clean:
	rm -f src/main.exe
	rm -f src/helloworld.exe
	rm -f src/test-example.exe

superclean: clean
	rm -f $(PRISTINE_TARGETS)
