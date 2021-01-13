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
    rpt     db "%llu",0
    msj2    db 10,"Desea Salir [Y/N]",0
    fmt     db "%llc"
    bsize   db 8
segment .bss
    chtr    resq    1       ;caracter
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
            mov rdx,qword[chtr]
            call printf

            mov rbx,0x80
            ;mov r11,8
print_bit:  
            test qword[chtr],rbx
            jz print_0
            mov rcx,rpt
            mov rdx,1
            call printf
            jmp skip
print_0:    
            mov rcx,rpt
            mov rdx,0
            call printf
skip:       
            shr rbx,1
            dec byte[bsize]
            cmp byte[bsize],0
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
