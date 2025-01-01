
.PHONY: all


all:
	@echo Nothing defined for default recipe


src/main.exe: src/main.c
	gcc $< -o $@


src/helloworld.exe: src/helloworld.cpp
	g++ $< -o $@

tests/test-example.exe: tests/test-example.c
	@gcc -I/mingw64/include -L/mingw64/lib -o $@ $< -lcmocka
	@./$@
	
clean:
	rm -f src/main.exe
	rm -f src/helloworld.exe
	rm -f src/test-example.exe

