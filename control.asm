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


extern printf
extern fill
extern display
extern sum
extern harmonic_mean

array_size equ 100 ; Max size for the array

global control

segment .data
stringFormat db "%s", 0
numbers db "Thank you. You entered", 10, 0
the_hm db "The harmonic mean of these numbers is %1.8lf", 10, 0
exit db "The harmonic mean will be returned to the driver", 10, 0

section .bss
array: resq 100

segment .text
control:

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
push qword -1                                  ; even pushes

; Fill array
mov qword rdi, array      ; Pass array to fill
mov qword rsi, array_size ; Pass max size to fill
mov qword rax, 0
call fill           ; Call fill
mov r15, rax        ; Save the size of array to r15

; Print numbers
mov qword rdi, stringFormat
mov qword rsi, numbers
mov qword rax, 0
call printf

; Display Array
push qword 0
mov rdi, array  ; Pass array to display function
mov rsi, r15    ; Pass array size to display function
mov rax, 0
call display    ; Call display function
pop rax

; Sum the array
mov rdi, array       ; Pass array to harmonic_mean function
mov rsi, r15         ; Pass array size to harmonic_mean function
mov rax, 0
call harmonic_mean   ; Call harmonic_mean function
movsd xmm15, xmm0    ; Save harmonic mean xmm15

; Print mean
push qword 0
mov rax, 1
mov rdi, the_hm
movsd xmm0, xmm15
call printf
pop rax

; Print exit message
mov qword rdi, stringFormat
mov qword rsi, exit
mov qword rax, 0
call printf

; Return values
movsd xmm0, xmm15

;Restore values
pop rax
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
