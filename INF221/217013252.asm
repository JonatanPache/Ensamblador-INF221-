;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o 217013252.o 217013252.asm -l 217013252.lst
;link:	   -->> gcc -o 217013252 217013252.o
;run:      -->> 217013252
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;CONDORI PACHECO JEREMIAS YONATAN
;217013252
;file: 217013252.asm (nombre programa)
	
segment .data
    reg dd 217013252
    nom db "Yonatan Jeremias Condori Pacheco"
    cod dw 1874
    fec dd 15081999
    ci  dd 12730095
    age db 21
    email db "yonatanj@email.com"
segment .bss


segment .text 

global main 					
main:	

ret
;---------------------------------------
;..........subrutinas....................	
