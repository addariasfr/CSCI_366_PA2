
        global  set_bit_elem
        global  get_bit_elem
        section .text

set_bit_elem:
        push rbp            ; save the base pointer on the stack (at rsp+8)
        mov rbp, rsp        ; set up the rbp for the bottom of this frame

        ; rdi contains array pointer
        ; rsi contains row width
        ; rdx contains row
        ; rcx contains col

        ; get index of bit
        mov rax, rdx        ; get row
        imul rsi            ; multiply by row width
        add rax, rcx        ; add column
        mov rcx, rax        ; move index into rcx

        ; get byte offset
        mov rdx, 0          ; empty rdx
        mov r10, 8          ; move divisor into r10
        div r10             ; divide index by 8
        mov r9, rax         ; save byte offset in r9

        ; get bit offset
        imul r10            ; multiply byte offset by 8 (still in r10)
        mov r8, rax         ; move scaled byte offset into r8
        mov rax, rcx        ; move index into rax
        sub rax, r8         ; subtract byte offset from index
        mov rax, r8         ; save bit offset in r8

        ; create mask
        mov rdx, 7
        sub rdx, r8         ; subtract the bit offset
        mov rax, 1          ; move 1 into rax
        mov cl, r8b         ; move bit offset into cl
        shl rax, cl         ; shift 1 left by the bit offset
        mov rdx, rax        ; move mask into rdx

        ; access byte
        mov rax, rdi        ; move array pointer into rax
        add rax, r9         ; add byte offset

        ; set bit
        or rax, rdx         ; set bit

        mov rsp, rbp        ; restore stack pointer to before we pushed parameters onto the stack
        pop rbp             ; remove rbp from the stack to restore rsp to initial value
        ret                 ; return value in rax




get_bit_elem:
        push rbp            ; save the base pointer on the stack (at rsp+8)
        mov rbp, rsp        ; set up the rbp for the bottom of this frame

        ; rdi contains array pointer
        ; rsi contains row width
        ; rdx contains row
        ; rcx contains col

        ; add your code here - for now returning 0

        ; get index of bit
        mov rax, rdx        ; get row
        imul rax, rsi       ; multiply by row width
        add rax, rcx        ; add column
        mov rcx, rax        ; move index into rcx

        ; get byte offset
        mov rdx, 0          ; empty rdx
        mov r10, 8          ; move divisor into r10
        div r10             ; divide index by 8
        mov r9, rax         ; save byte offset in r9

        ; get bit offset
        imul r10            ; multiply byte offset by 8 (still in r10)
        mov r8, rax         ; move scaled byte offset into r8
        mov rax, rcx        ; move index into rax
        sub rax, r8         ; subtract byte offset from index
        mov rax, r8         ; save bit offset in r8

        ; create mask
        mov rdx, 7
        sub rdx, r8         ; subtract the bit offset
        mov rax, 1          ; move 1 into rax
        mov cl, r8b         ; move bit offset into cl
        shl rax, cl         ; shift 1 left by the bit offset
        mov rdx, rax        ; move mask into rdx

        ; access byte
        mov rax, rdi        ; move array pointer into rax
        add rax, r9         ; add byte offset

        ; get bit
        or rax, rdx         ; or the element and the mask
        cmp rax, 0          ; check if bit set
        setg al
        movsx rax, al

        mov rsp, rbp        ; restore stack pointer to before we pushed parameters onto the stack
        pop rbp             ; remove rbp from the stack to restore rsp to initial value
        ret                 ; return value in rax
