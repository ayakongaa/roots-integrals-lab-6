section .data
    two dq 2.0
    six dq 6.0
    fourteen dq 14.0

section .text
%ifdef WINDOWS
    global _f1
    global _f2
    global _f3
%define f1 _f1
%define f2 _f2
%define f3 _f3
%else
    global f1
    global f2
    global f3
%endif

f1:
    push ebp
    mov ebp, esp

    fldln2
    fld qword [ebp+8]
    fyl2x

    mov esp, ebp
    pop ebp
    ret

f2:
    push ebp
    mov ebp, esp

    fld qword [ebp+8]
    fadd st0, st0
    fchs
    fadd qword [fourteen]

    mov esp, ebp
    pop ebp
    ret

f3:
    push ebp
    mov ebp, esp

    fld qword [two]
    fsub qword [ebp+8]

    fld1
    fdivrp st1, st0

    fadd qword [six]

    mov esp, ebp
    pop ebp
    ret
