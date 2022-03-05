    .intel_syntax noprefix
    .section .data
f:  .string "%d\n"
    .text
    .global main
main:
    push rbp
    mov rbp, rsp
    sub rsp, 8
    mov ebx, 1
    mov DWORD PTR [rbp - 4], 1
    mov DWORD PTR [rbp - 8], 0
loop:
    cmp DWORD PTR [rbp - 4], 4000000
    jg  end_loop
    mov eax, [rbp - 4]
    mov ecx, 2
    cdq
    idiv ecx
    cmp edx, 0
    jne continue
    mov eax, [rbp - 4]
    add [rbp - 8], eax
continue:
    mov eax, ebx
    mov ebx, [rbp - 4]
    add [rbp - 4], eax
    jmp loop
end_loop:
    lea rdi, [rip + f]
    mov esi, [rbp - 8]
    mov eax, 0
    call printf
    mov eax, 0
    leave
    ret
