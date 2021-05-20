;*****************************************************************************************************************************
;Program name: "Harmonic Mean of float numbers in an Array".
;together.  Copyright (C) 2021 Kendrick Ngo                                                                                  *
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License   *
;version 3 as published by the Free Software Foundation.                                                                     *
;This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied          *
;Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.      *
;A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                             *
;*****************************************************************************************************************************

; Author Info
; Name: Kendrick Ngo
; email: kendrickngo2000@csu.fullerton.edu

; Program Info
; Name: Harmonic Mean of Float numnbers in an Array
; Creation Date: 2021-May-20
; Completion Date: 2021-May-20
; files included: main.c, display.cpp, control.asm, fill.asm, script.sh, sum.asm

; Current File
; Name: control.asm
; Language: X86-64
; Assemble: nasm -f elf64 -l control.lis -o control.o control.asm
; Link: gcc -m64 -no-pie -o assign3.out -std=c++17 main.o control.o fill.o sum.o display.o

extern scanf
extern printf
extern isfloat
extern atof

global fill

segment .data
start db "Enter float numbers separated by white space. Invalid inputs will be omitted.", 10, "Enter control+D to terminate.", 10, 0
format db "%lf", 0
stringformat db "%s", 0

segment .text
fill:

;Back up
push rbp
mov  rbp,rsp
push rdi
push rsi
push rdx
push rcx
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
push rbx
pushf

;one more push
push qword -1

; Grab inputs
mov r15, rdi
mov r14, rsi
mov r13, 0

; Print loop
push qword 0
mov qword rdi, stringformat
mov qword rsi, start
mov qword rax, 0
call printf

jmp beginloop

invalid:
pop rax

; Input loop
beginloop:
cmp r13, r14
jge exit
;*****************************************************************************************************************************
;Program name: "Harmonic Mean of float numbers in an Array".
;together.  Copyright (C) 2021 Kendrick Ngo                                                                                  *
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License   *
;version 3 as published by the Free Software Foundation.                                                                     *
;This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied          *
;Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.      *
;A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                             *
;*****************************************************************************************************************************

; Author Info
; Name: Kendrick Ngo
; email: kendrickngo2000@csu.fullerton.edu

; Program Info
; Name: Harmonic Mean of Float numnbers in an Array
; Creation Date: 2021-May-20
; Completion Date: 2021-May-20
; files included: main.c, display.cpp, control.asm, fill.asm, script.sh, hmean.asm, isfloat.cpp

; Get First Input
push qword 0
mov rdi, stringformat
mov rsi, rsp
mov rax, 1
call scanf

; Ctrl-D
cdqe            ; rax
cmp rax, -1
je leaveloop    ; ctrl-D entered, leave loop

; Validate First Input
mov rdi, rsp            ; Point rdi at rsp
mov rax, 0              ; input 0
call isfloat
cmp rax, 0              ; If rax is 0
je invalid              ; Jump to loop

; Convert to float
mov rax, 1
call atof

; Put input in array
movsd xmm15, xmm0               ; Put input to xmm15
movsd [r15 + 8 * r13], xmm15
inc r13
pop rax
jmp beginloop

; Exit of loop
leaveloop:
pop rax
exit:
pop rax

;Restore values
pop rax
mov rax, r13
popf
pop rbx
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rcx
pop rdx
pop rsi
pop rdi
pop rbp

ret
