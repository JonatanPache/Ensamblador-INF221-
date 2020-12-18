;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o Program_4_1.o Program_4_1.asm -l Program_4_1.lst
;link:	   -->> gcc -o Program_4_1 Program_4_1.o
;run:      -->> Program_4_1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------
extern printf, scanf		

segment .data
    msj     db "Por favor, ingrese un caracter: ",0,10
    msj1    db "El codigo ASCII de %llc en binario es: ",0
    msj2    db 10,"Desea Salir [Y/N]",0
    fmt     db "%llc"
segment .bss
    chtr    resq    1
    aux     resq    1
segment .text 
global main 					
main:	
sub rsp,0x20	
read_char:  
            mov rcx,msj
            call printf

            mov rcx,fmt
            mov rdx,chtr
            call scanf

            mov rcx,msj1
            mov rdx,chtr
            call printf

            mov rax,0x80
            mov r8,8
print_bit:  
            test qword[chtr],rax
            jz print_0
            mov rcx,1
            call printf
            jmp skip
print_0:    
            mov rcx,0
            call printf
skip:       
            shr rax,1
            dec r8
            cmp r8,0
            jne print_bit

            mov rcx,msj2
            call printf

            mov rcx,fmt
            mov rdx,aux
            call scanf

            cmp qword[aux],'Y'
            je read_char
add rsp,0x20
ret
;---------------------------------------
;..........subrutinas....................	
