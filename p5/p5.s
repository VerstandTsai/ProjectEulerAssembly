    .intel_syntax noprefix
    .data
f:  .string "%d\n"
    .text
    .global main
gcd:
    push rbp
    mov rbp, rsp
    cmp rdi, rsi
    jge loop_gcd
    mov rax, rdi
    mov rdi, rsi
    mov rsi, rax
loop_gcd:
    cmp rsi, 0
    je  endloop_gcd
    mov rax, rdi
    cdq
    idiv rsi
    mov rdi, rsi
    mov rsi, rdx
    jmp loop_gcd
endloop_gcd:
    mov rax, rdi
    leave
    ret
lcm:
    push rbp
    mov rbp, rsp
    sub rsp, 8
    mov rax, rdi
    mov rcx, rsi
    imul rcx
    mov [rbp - 8], rax
    call gcd
    mov rcx, rax
    mov rax, [rbp - 8]
    cdq
    idiv rcx
    leave
    ret
main:
    push rbp
    mov rbp, rsp
    sub rsp, 8
    mov QWORD PTR [rbp - 8], 1
    mov rbx, 2
loop:
    cmp rbx, 20
    jg  endloop
    mov rdi, [rbp - 8]
    mov rsi, rbx
    call lcm
    mov [rbp - 8], rax
    inc rbx
    jmp loop
endloop:
    lea rdi, [rip + f]
    mov rsi, rax
    mov rax, 0
    call printf
    mov rax, 0
    leave
    ret
