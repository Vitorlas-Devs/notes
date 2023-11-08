; THIS IS THE ULTIMATE ASSEMBLY TUTORIAL (for ARM)

; This tutorial is intended for those who are not familiar with assembler at all,
; and it tries to explain the basics of assembler in a simple manner. It is
; written for the ARM architecture, but the concepts are the same for other
; architectures as well.

; Table of Contents
; 1. Introduction
; 1.1 What is assembler?
; 1.2 Why should I learn assembler?
; 1.3 What is ARM?
; 1.4 What is Linux?
; 1.5 What is the GNU Assembler?
; 1.6 What is the GNU Debugger?
; 1.7 What is the GNU Compiler Collection?
; 1.8 What is the GNU Binary Utilities?
; 1.9 What is the GNU C Library?
; 1.10 What is the GNU Core Utilities?
; 1.11 What is the GNU Make?
; 1.12 What is the GNU Binutils?
; 1.13 What is the GNU Bash?
; 1.14 What is the GNU Readline?
; 2. The Basics
; 2.1 Registers
; 2.2 Instructions
; 2.3 Directives
; 2.4 Labels
; 2.5 Comments
; 2.6 Sections
; 2.7 Data
; 3. The GNU Assembler
; 3.1 Invoking the GNU Assembler
; 3.2 Assembler Directives
; 3.3 Assembler Instructions
; 3.4 Assembler Expressions
; 3.5 Assembler Macros
; 3.6 Assembler Options
; 4. The GNU Debugger
; 4.1 Invoking the GNU Debugger
; 4.2 Debugger Commands
; 4.3 Debugger Expressions
; 4.4 Debugger Options
; 5. The GNU Compiler Collection
; 5.1 Invoking the GNU Compiler Collection
; 5.2 Compiler Options
; 6. The GNU Binary Utilities
; 6.1 Invoking the GNU Binary Utilities

.data
msg: .ascii "Hello, world!\n"
len = . - msg

.text
.global _start

_start:
    mov r0, #1 ; file descriptor (stdout)
    ldr r1, =msg ; message to write
    ldr r2, =len ; message length
    mov r7, #4 ; write system call
    svc #0 ; call kernel

    mov r0, #0 ; exit code
    mov r7, #1 ; exit system call
    svc #0 ; call kernel
