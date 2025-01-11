# R on Windows

Work in progress -- do not use!

Status as of 2025-01-01: 
* Makefile copies a small list of files from R source
* `dunif.c` and all its dependencies are included
* Unit test for `dunif` runs using `ctrl` + `shift` + B

TODOs:
1. Decide what the ultimate target is -- R.dll?  Embedded R?  Full build?  Something that'll work with RStudio?
1. List out modules to build and test, e.g., BLAS, LAPACK, tre, nmath, etc.
1. Is there a way to configure VSCode to have different default build tasks for different file types?  Or how can we setup the make system to work with VSCode to do this?


## Idea

Building R on Windows using the R source code and Rtools is straightforward.
However, understanding how the build system works is tricky because of the number of make files
and the way they work together.
This project is a sandbox to figure out a simpler makefile setup for R builds on Windows only.

Rules:

* No editing of files copied from R source!
* Only copy what you need
* Tests should be sufficient to prove that we've built the correct target


## Unit testing

Use `cmocka` for unit testing.

```sh
# cmocka does not come with Rtools44
# https://packages.msys2.org/base/mingw-w64-cmocka
pacman -S mingw-w64-x86_64-cmocka
```

Further reading on `cmocka`

* https://cmocka.org/
* https://api.cmocka.org/
* https://re-ws.pl/2018/10/using-cmocka-for-unit-testing-c-code/
* https://www.slideshare.net/slideshow/test-driven-development-in-c/603733#122


## GNU debugger

I haven't figured out how to get the debugger to work in VSCode.
https://code.visualstudio.com/docs/cpp/config-mingw


```sh
# gbd does not come with Rtools44 by default
# https://search.r-project.org/CRAN/refmans/BuildSys/html/BuildSys-package.html
pacman -Sy
pacman -S mingw-w64-x86_64-gdb
pacman -S --needed base-devel mingw-w64-x86_64-toolchain
```

## Some notes on compiler options

From https://ac1d.medium.com/developing-c-applications-on-windows-with-msys2-vscode-64b286d9fea1

```sh
# Basic compilation
gcc -o messagebox.exe main.c -luser32 -lkernel32
# Strip Debugging Information:
gcc -o messagebox.exe main.c -luser32 -lkernel32 -s
# Optimize for Size:
gcc -o messagebox.exe main.c -luser32 -lkernel32 -Os -s
# Static Linking:
gcc -o messagebox.exe main.c -luser32 -lkernel32 -Os -s -static
# Remove Unused Sections:
gcc -o messagebox.exe main.c -luser32 -lkernel32 -Os -s -ffunction-sections -fdata-sections -Wl, - gc-sections
# Link Time Optimization (LTO):
gcc -o messagebox.exe main.c -luser32 -lkernel32 -Os -s -flto
# Strip Symbols After Compilation:
strip -strip-all messagebox.exe
```

## Other links

* https://devblogs.microsoft.com/cppblog/now-announcing-makefile-support-in-visual-studio-code/
