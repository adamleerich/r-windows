// https://ac1d.medium.com/developing-c-applications-on-windows-with-msys2-vscode-64b286d9fea1

// Basic compilation
// gcc -o messagebox.exe main.c -luser32 -lkernel32

// Strip Debugging Information:
// gcc -o messagebox.exe main.c -luser32 -lkernel32 -s

// Optimize for Size:
// gcc -o messagebox.exe main.c -luser32 -lkernel32 -Os -s

// Static Linking:
// gcc -o messagebox.exe main.c -luser32 -lkernel32 -Os -s -static

// Remove Unused Sections:
// gcc -o messagebox.exe main.c -luser32 -lkernel32 -Os -s -ffunction-sections -fdata-sections -Wl, - gc-sections

// Link Time Optimization (LTO):
// gcc -o messagebox.exe main.c -luser32 -lkernel32 -Os -s -flto

// Strip Symbols After Compilation:
// strip -strip-all messagebox.exe




#include <windows.h>
int main() {
 MessageBox(NULL, "Hello, World!", "Message Box", MB_OK);
 return 0;
}
