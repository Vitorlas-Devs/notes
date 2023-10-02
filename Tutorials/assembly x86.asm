; THIS IS THE ULTIMATE ASSEMBLY TUTORIAL (for x86)

; Table of Contents

; 1. Introduction
; 1.1. What is Assembly?
; 1.2. Why learn Assembly?
; 1.3. What is NASM?
; 1.4. What is ELF?
; 1.5. What is the Linux kernel?
; 2. Hello, World!
; 2.1. The _start label
; 2.2. The mov instruction
; 2.3. The int instruction
; 2.4. The section directive
; 2.5. The global directive
; 2.6. The db directive
; 2.7. The equ directive
; 2.8. The $ symbol
; 3. The Stack
; 3.1. The push instruction
; 3.2. The pop instruction
; 3.3. The call instruction
; 3.4. The ret instruction
; 3.5. The ebp register
; 3.6. The esp register
; 3.7. The sub instruction
; 3.8. The add instruction
; 3.9. The leave instruction
; 4. The Heap
; 4.1. The brk system call
; 4.2. The mmap system call
; 4.3. The munmap system call
; 4.4. The mprotect system call
; 4.5. The mremap system call
; 4.6. The msync system call
; 4.7. The madvise system call
; 4.8. The mincore system call
; 4.9. The memfd_create system call
; 5. The Data Segment
; 5.1. The db directive
; 5.2. The dw directive
; 5.3. The dd directive
; 5.4. The dq directive
; 5.5. The dt directive
; 5.6. The do directive
; 5.7. The dy directive
; 5.8. The dz directive
; 5.9. The resb directive
; 5.10. The resw directive
; 5.11. The resd directive
; 5.12. The resq directive
; 5.13. The rest directive
; 5.14. The reso directive
; 5.15. The resy directive
; 5.16. The resz directive
; 5.17. The times directive
; 5.18. The equ directive
; 5.19. The %assign directive
; 5.20. The %define directive
; 5.21. The %elif directive
; 5.22. The %elifctk directive
; 5.23. The %elifdef directive
; 6. The BSS Segment
; 6.1. The common directive
; 6.2. The global directive
; 6.3. The extern directive
; 6.5. The align directive
; 6.6. The section directive
; 6.7. The segment directive
; 6.8. The absolute directive
; 6.9. The bits directive
; 6.10. The default rel directive
; 6.11. The default abs directive
; 6.12. The default none directive
; 6.13. The default flat directive
; 6.14. The default elf32 directive
; 6.15. The default elf64 directive
; 6.16. The default macho32 directive
; 6.17. The default macho64 directive
; 6.18. The default win32 directive
; 6.19. The default win64 directive
; 6.20. The default coff directive
; 6.21. The default aout directive
; 6.22. The default net directive
; 6.23. The default rdf directive
; 6.24. The default ieee directive

; 1. Introduction

section .data
    msg db "Hello, world!", 0xA
    len equ $ - msg

section .text
    global _start

_start:
    mov eax, 4 ; write system call
    mov ebx, 1 ; file descriptor (stdout)
    mov ecx, msg ; message to write
    mov edx, len ; message length
    int 0x80 ; call kernel

    mov eax, 1 ; exit system call
    mov ebx, 0 ; exit code
    int 0x80 ; call kernel
