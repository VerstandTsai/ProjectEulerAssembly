    .intel_syntax noprefix
    .data
f:  .string "%d\n"
    .text
    .global main
main:
    push rbp
    mov rbp, rsp
    sub rsp, 4
    mov ebx, 1
loop_1:
    cmp ebx, 100
    jg  endloop_1
    mov eax, ebx
    imul eax
    add [rbp - 4], eax
    inc ebx
    jmp loop_1
endloop_1:
    mov ebx, 1
    mov eax, 0
loop_2:
    cmp ebx, 100
    jg  endloop_2
    add eax, ebx
    inc ebx
    jmp loop_2
endloop_2:
    imul eax
    sub eax, [rbp - 4]
    lea rdi, [rip + f]
    mov esi, eax
    mov eax, 0
    call printf
    mov eax, 0
    leave
    ret
