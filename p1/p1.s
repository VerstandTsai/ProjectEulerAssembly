    .intel_syntax noprefix
    .section .data
f:  .string "%d\n"
    .text
    .global main
main:
    push rbp
    mov rbp, rsp
    sub rsp, 4
    mov DWORD PTR [rbp - 4], 0
    mov ebx, 1
loop:
    cmp ebx, 1000
    jge end_loop
    mov eax, ebx
    mov ecx, 3
    cdq
    idiv ecx
    cmp edx, 0
    je  add_ans
    mov eax, ebx
    mov ecx, 5
    cdq
    idiv ecx
    cmp edx, 0
    je  add_ans
    inc ebx
    jmp loop
add_ans:
    add [rbp - 4], ebx
    inc ebx
    jmp loop
end_loop:
    lea rdi, [rip + f]
    mov esi, [rbp - 4]
    mov eax, 0
    call printf
    mov eax, 0
    leave
    ret
