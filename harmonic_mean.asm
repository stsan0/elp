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
; files included: main.c, display.cpp, control.asm, fill.asm, script.sh, harmonic_mean.asm, isfloat.cpp


global harmonic_mean

segment .data

segment .text
harmonic_mean:

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

; get input
mov r15, rdi    ; r15 = array
mov r14, rsi    ; r14 = stuff in array
mov r13, 0      ; r13 = loop

; Initialize xmm15 to 0
xorpd xmm15, xmm15 ; xmm15

; Sum the preciprocals
beginloop:
cmp r13, r14    ; r13 = count, r14 = size
jge leaveloop

; Put 1 to xmm10
mov r8, 1
cvtsi2sd xmm10, r8

; Get element and save to xmm11
movsd xmm11, [r15 + 8 * r13]
divsd xmm10, xmm11 ; 1/xmm11 -> xmm10
addsd xmm15, xmm10 ; Add the reciprocal to the sum

inc r13

jmp beginloop ; Restart loop

leaveloop:
cvtsi2sd xmm14, r14 ; Store number of elements to xmm14
divsd xmm14, xmm15  ; Calculate Harmonic Mean
movsd xmm0, xmm14   ; Return Harmoic Mean

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
