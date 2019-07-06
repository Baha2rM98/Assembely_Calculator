org 100h
.data  
n_line db 0Ah,0Dh, "$"
str0 db 13,10,"Hello! welcome to assembly calculator! ",'$'
str1 db 13,10,"Enter First Number (0-9999) : ",'$'
str2 db 13,10,"Enter Second Number (0-9999) : ",'$'
str3 db 13,10,"Sum is : ",'$'
str4 db 13,10,"Subtract is : ",'$'
str5 db 13,10,"Multiple is : ",'$'
str6 db 13,10,"Divide is : ",'$'
str7 db 13,10,"Choose one of this operators ( + , - , * , / ) Enter q to exit $"

num dw ?
num2 dw ?

numd dw 0
numa dw 0
numd2 dw 0
numa2 dw 0

d dw 10000
a dw 1000
b dw 100
c dw 10

a1 dw 0
b1 dw 0
c1 dw 0
d1 dw 0
a2 dw 0
b2 dw 0
c2 dw 0
d2 dw 0

a1xt dw 0
a2xt dw 0
a3xt dw 0
DivAns dw 0
ten dw 10
hundred dw 100

mom1 dw 0
mom2 dw 0

zero dw 0
stacksp dw 0
arrstack dw ?
len dw 0
num_tool dw 3
ans dw 0

.code
main proc

    addition:
    lea dx, str0
    mov ah, 9H
    int 21H   
    
    lea dx, n_line
    mov ah, 9H
    int 21H   
    
    lea dx, n_line
    mov ah, 9H
    int 21H

    lea dx, str1
    mov AH,9H
    int 21H

    mov ah,1
    int 21H
    sub al,30h
    mov ah,0
    mov a1,ax

    mov AH,1
    int 21H
    cmp al,0DH
    je label_2enter

    cmp al,02EH
    je label_2mom1

    sub al,30H
    mov ah,0
    mov b1,ax

    mov AH,1
    int 21H
    cmp al,0dh
    je label_3enter

    cmp al,02Eh
    je label_3mom1

    sub al,30H
    mov ah,0
    mov c1,ax

    mov ah,1
    INT 21H
    cmp al,0dh
    je label_4enter

    cmp al,02Eh
    je label_4mom1

    sub al,30H
    mov ah,0
    mov d1,ax

    mov AH,1
    int 21H
    cmp al,0dh
    je label_5enter

  ;---------------------------------
  ;if dot entered for first number

  label_2mom1:

    mov ah,1
    int 21H
    inc mom1

    sub al,30H
    mov ah,0
    mov b1,ax

    mov AH,1
    int 21H
    cmp al,0DH
    je label_3enter


    inc mom1
    sub al,30H
    mov ah,0
    mov c1,ax

    mov ah,1
    int 21H
    cmp al,0dh
    je label_4enter

    inc mom1
    sub al,30H
    mov ah,0
    mov d1,ax

    mov ah,1
    int 21H
    cmp al,0DH
    je label_5enter


    label_3mom1:

    mov ah,1
    int 21H
    inc mom1

    sub al,30H
    mov ah,0
    mov c1,ax

    mov ah,1
    int 21H
    cmp al,0dh
    je label_4enter


    inc mom1
    sub al,30H
    mov ah,0
    mov d1,ax


    mov ah,1
    int 21H
    cmp al,0dh
    je label_5enter

    label_4mom1:

    mov ah,1
    int 21H
    inc mom1

    sub al,30H
    mov ah,0
    mov d1,ax

    mov ah,1
    int 21H
    cmp al,0dh
    je label_5enter


  ;------------------------------------
  ;if Enter entered for 1st number

    label_2enter:
    mov ax,a1
    mov num,ax
    jmp label_entry2


    label_3enter:
    mov ax,a1
    mul c
    mov num,ax
    mov ax,b1
    add num,ax
    jmp label_entry2

    label_4enter:
    mov ax,a1
    mul b
    mov num,ax
    mov ax,b1
    mul c
    add num,ax
    mov ax,c1
    add num,ax
    jmp label_entry2

    label_5enter:
    mov ax,a1
    mul a
    mov num,ax
    mov ax,b1
    mul b
    add num,ax
    mov ax,c1
    mul c
    add num,ax
    mov ax,d1
    add num,ax

    ;-------------------------------
    ;inputting number 1 finished

    ;--------------------------------
    ;inputting number 2 is starting
    label_entry2:
    mov dl,10
    mov ah,02h
    int 21h

    mov dl,13
    mov ah,02h
    int 21h

    lea dx, str2
    mov ah,9H
    int 21H

    mov ah,1
    int 21H
    sub al,30H
    mov ah,0
    mov a2,ax

    mov ah,1
    int 21H
    cmp al,0dh
    je label2_2enter

    cmp al,02Eh
    je label_2mom2

    sub al,30H
    mov ah,0
    mov b2,ax

    mov ah,1
    int 21H
    cmp al,0dh
    je label2_3enter

    cmp al,02Eh
    je label_3mom2

    sub al,30H
    mov ah,0
    mov c2,ax

    mov ah,1
    int 21H
    cmp al,0DH                  
    je label2_4enter

    cmp al,02EH
    je label_4mom2

    sub al,30H
    mov ah,0
    mov d2,ax

    mov ah,1
    int 21H
    cmp al,0dh
    je label2_5enter

   ;-----------------------------------
   ;if dot entered for second number

  label_2mom2:

    mov ah,1H
    int 21H
    inc mom2

    sub al,30H
    mov ah,0
    mov b2,ax

    mov ah,1H
    int 21H
    cmp al,0DH
    je label2_3enter


    inc mom2
    sub al,30H
    mov ah,0
    mov c2,ax

    mov ah,1
    int 21H
    cmp al,0DH
    je label2_4enter

    inc mom2
    sub al,30H
    mov ah,0
    mov d2,ax

    mov AH,1
    int 21H
    cmp al,0dh
    je label2_5enter


    label_3mom2:

    mov ah,01H
    int 21H
    inc mom2

    sub al,30H
    mov ah,0
    mov c2,ax

    mov ah,01H
    INT 21H
    cmp al,0DH
    je label2_4enter


    inc mom2
    sub al,30H
    mov ah,0
    mov d2,ax


    mov AH,1
    int 21H
    cmp al,0dh
    je label2_5enter

    label_4mom2:

    mov ah,01H
    int 21H
    inc mom2

    sub al,30H
    mov ah,0
    mov d2,ax

    mov AH,1
    int 21H
    cmp al,0DH
    je label2_5enter

 ;--------------------------------
 ;if Enter entered for second number

    label2_2enter:
    mov ax,a2
    mov num2,ax
    jmp label_Zarb_num1

    label2_3enter:
    mov ax,a2
    mul c
    mov num2,ax
    mov ax,b2
    add num2,ax
    jmp label_Zarb_num1

    label2_4enter:
    mov ax,a2
    mul b
    mov num2,ax
    mov ax,b2
    mul c
    add num2,ax
    mov ax,c2
    add num2,ax
    jmp label_Zarb_num1

    label2_5enter:
    mov ax,a2
    mul a
    mov num2,ax
    mov ax,b2
    mul b
    add num2,ax
    mov ax,c2
    mul c
    add num2,ax
    mov ax,d2
    add num2,ax

 ;---------------------------------
 ;inputting number 2 is finished
 ;Scanning has finished
 ;----------------------------------

 ;mul num and num2 to 1000
    label_Zarb_num1:
    mov dx,0
    mov ax,0
    cmp mom1,0
    je label_Zarb_1000
    cmp mom1,1
    je label_Zarb_100
    cmp mom1,2
    je label_Zarb_10
    jmp label_Zarb_1

    label_Zarb_1000:
    mov ax,num
    mul a
    mov numd,dx
    mov numa,ax
    jmp label_Zarb_num2

     label_Zarb_100:
    mov ax,num
    mul b
    mov numd,dx
    mov numa,ax
    jmp label_Zarb_num2

    label_Zarb_10:
    mov ax,num
    mul c
    mov numd,dx
    mov numa,ax
    jmp label_Zarb_num2

    label_Zarb_1:
    mov ax,num
    mov numd,0
    mov numa,ax
    jmp label_Zarb_num2

;--------------------

   label_Zarb_num2:
    cmp mom2,0
    je label2_Zarb_1000
    cmp mom2,1
    je label2_Zarb_100
    cmp mom2,2
    je label2_Zarb_10
    jmp label2_Zarb_1

    label2_Zarb_1000:
    mov ax,num2
    mul a
    mov numd2,dx
    mov numa2,ax
    jmp label_func

    label2_Zarb_100:
    mov ax,num2
    mul b
    mov numd2,dx
    mov numa2,ax
    jmp label_func

    label2_Zarb_10:
    mov ax,num2
    mul c
    mov numd2,dx
    mov numa2,ax
    jmp label_func

    label2_Zarb_1:
    mov ax,num2
    mov numd2,0
    mov numa2,ax
    jmp label_func

 ;--------------------------------------------
 ;in this label you van choose your operator
    label_func:

    mov dl,10
    mov ah,02h
    int 21h

    mov dl,13
    mov ah,02h
    int 21h

    lea dx, str7
    mov ah,9H
    int 21H

    mov ah,1
    int 21h
    cmp al,02BH
    je label_add

    cmp al,02DH
    je label_sub

    cmp al,02AH
    je label_mul

    cmp al,02FH
    je label_div 
    
    cmp al, 71H
    je exit


    label_add:
    call addfunc
    jmp label_func

    label_sub:
    call subfunc
    jmp label_func

    label_mul:
    call mulfunc
    jmp label_func

    label_div:
    call divfunc
    jmp label_func

    exit:
    ret
;when you chose your operator calculation will be done
;-------------------------------------------------------

    addfunc proc    ;Add function
                    ;
    mov dl,10       ;
    mov ah,02h      ;
    int 21h         ;
                    ;
    mov dl,13       ;
    mov ah,02h      ;
    int 21h         ;
                    ;
    lea dx,str3     ;
    mov ah,09h      ;
    int 21h         ;
                    ;
    mov ax,0        ;
                    ;
    mov  ax,numa    ;
    adc  ax,numa2   ;
                    ;
    mov dx,numd     ;
    adc dx,numd2    ;
                    ;
    mov stacksp,0   ;
                    ;
    mov  bx,10      ;

    call push_pop_add_sub ;
                          ;
    ret                   ;
    addfunc endp          ;

 ;-----------------

    subfunc proc     ;Subtract function
                     ;
    mov len,0        ;
    mov stacksp,0    ;
                     ;
    mov dl,10        ;
    mov ah,02h       ;
    int 21h          ;
                     ;
    mov dl,13        ;
    mov ah,02h       ;
    int 21h          ;
                     ;
    lea dx,str4      ;
    mov ah,09h       ;
    int 21h          ;
                     ;
    mov ax,0         ;
    mov bx,0         ;
    mov cx,0         ;
    mov dx,0         ;
    mov ax,num       ;
    cmp ax,num2      ;

    jl label_2_bigger_than_1 ;
    jmp label_goon           ;
    label_2_bigger_than_1:   ;
                             ;
    mov dl,02dh              ;
    mov ah,02h               ;
    int 21h                  ;
                             ;
    mov ax,numa              ;
    mov dx,numa2             ;
                             ;
    mov numa,dx              ;
    mov numa2,ax             ;
                             ;
    mov ax,numd              ;
    mov dx,numd2             ;
                             ;
    mov numd,dx              ;
    mov numd2,ax             ;
                             ;
    label_goon:              ;
                             ;
    mov ax,0                 ;
                             ;
    mov ax,numa              ;
    sbb ax,numa2             ;
                             ;
    mov dx,numd              ;
    sbb dx,numd2             ;
                             ;
    mov stacksp,0            ;
    mov len,0                ;
                             ;
    mov  bx,10               ;
                             ;
    call push_pop_add_sub    ;
    ret                      ;
    subfunc endp             ;

;-----------------------------------------
    mulfunc proc          ;Multuple fuction
                          ;
         mov dl,10        ;
         mov ah,02h       ;
         int 21h          ;
                          ;
         mov dl,13        ;
         mov ah,02h       ;
         int 21h          ;
                          ;
         lea dx,str5      ;
         mov ah,09h       ;
         int 21h          ;
                          ;
                          ;
        mov ax,num        ;
        mul num2          ;
                          ;
        mov stacksp,0     ;
                          ;
        mov bx,10         ;
                          ;
        call push_pop_mul ;
                          ;
        ret               ;
        mulfunc endp      ;

;---------------------------------------------
     divfunc proc         ;Division functioun
                          ;
        mov dl,10         ;
        mov ah,02h        ;
        int 21h           ;
                          ;
        mov dl,13         ;
        mov ah,02h        ;
        int 21h           ;
                          ;
        lea dx,str6       ;
        mov ah,09h        ;
        int 21h           ;
        mov dx,0          ;
        mov ax, num       ;
        mov bx, num2      ;
        div bx            ;
        mov a1xt, ax      ;
        mov ax, dx        ;
        mul ten           ;
        div bx            ;
        mov a2xt, ax      ;
        mov ax, dx        ;
        mul ten           ;
        div bx            ;
        mov a3xt, ax      ;
        mov ax, a1xt      ;
        mul hundred       ;
        mov DivAns, ax    ;
        mov ax, a2xt      ;
        mul ten           ;
        add DivAns, ax    ;
        mov ax, a3xt      ;
        add DivAns, ax    ;
                          ;
        mov ax,DivAns     ;
                          ;
      mov stacksp,0       ;
                          ;
      mov bx,10           ;
                          ;
      call division       ;
                          ;
      ret                 ;
      divfunc endp        ;
     
 ;----------------------------------------------  
 
 
 
 ;this function push and pop in stack to print  
 ;this is used for mul
 
 
 
 ;----------------------------------------------

    push_pop_mul proc

    mov len,0
    mov stacksp,0

    cmp dx,0             ;if number is lower than 16 bit
    jne push2

    pushing_mul:
    inc stacksp
    inc len
    mov dx,0
    div bx
    push dx            
    cmp ax,0
    jne  pushing_mul   
    jmp labelprint
                         
    push2:                ;if number is bigger than 16 bit

    mov cx,10000
    div cx
    mov numa,ax
    mov numd,dx
    mov ax,dx
    
    pushing_mul1:
    inc stacksp
    inc len
    mov si,stacksp
    mov dx,0
    div bx
    push dx     
    cmp ax,0
    jne pushing_mul1   
    mov cx,4
    sub cx,stacksp

    label_stack1:         

    cmp cx,0
    je edame
    dec cx
    push zero
    inc stacksp
    inc len
    jmp label_stack1

    edame:
    mov ax,numa
    
    pushing_mul2:
    inc stacksp
    inc len
    mov dx,0
    div  bx
    push dx     
    cmp ax,0
    jne pushing_mul2    


    labelprint:
    mov ans,0
    mov bx,len
    sub bx,mom1
    sub bx,mom2


    poping_mul:

    dec stacksp
    pop  dx
    add  dl,30H   ;Turn into a character, from [0,9] to ["0","9"]
    mov  ah,02h  ;DOS DisplayCharacter function
    int  21h
    inc ans
    cmp ans,bx
    je label_dot_mul
    jmp label_edame_pop_mul   
    
    label_dot_mul:
    mov  dl,02EH   ;Turn into a character, from [0,9] to ["0","9"]
    mov  ah,02H ;DOS DisplayCharacter function
    int  21h   
    
    label_edame_pop_mul:
    cmp stacksp,0
    jg poping_mul
    ret

    push_pop_mul endp


    ;---------------------------------------
    
    ;this function push and pop in stack to print  
    ;this is used for sum and sub

    ;----------------------------------------

    push_pop_add_sub proc

    mov len,0
    mov stacksp,0

    cmp dx,0          ;if number is lower than 16 bit
    jne push2_add_sub

    pushing_add_sub:
    inc stacksp
    inc len
    mov dx,0
    div  bx
    push dx             
    cmp ax,0
    jne  pushing_add_sub    
    jmp labelprint_add_sub

    push2_add_sub:       ;if number is bigger than 16 bit

    mov cx,10000
    div cx
    mov numa,ax
    mov numd,dx
    mov ax,dx

    pushing_add_sub1:

    inc stacksp
    inc len
    mov si,stacksp
    mov dx,0
    div  bx
    push dx      
    cmp ax,0
    jne  pushing_add_sub1    
    mov cx,4
    sub cx,stacksp

    label_stack1add_sub:         

    cmp cx,0
    je edame_add_sub
    dec cx
    push zero
    inc stacksp
    inc len
    jmp label_stack1add_sub

    edame_add_sub:
    mov ax,numa

    pushing_add_sub2:
    inc stacksp
    inc len
    mov dx,0
    div  bx
    push dx      
    cmp ax,0
    jne  pushing_add_sub2   


    labelprint_add_sub:
    mov bx,len
    sub bx,num_tool
    mov ans,0

    poping_add_sub:
    dec stacksp
    pop  dx
    add  dl,30H   ;Turn into a character, from [0,9] to ["0","9"]
    mov  ah,02h  ;DOS DisplayCharacter function
    int  21h
    inc ans
    cmp ans,bx
    je label_dot
    jmp label_edame_pop
    label_dot:
    mov  dl,02Eh   ;Turn into a character, from [0,9] to ["0","9"]
    mov  ah,02h  ;DOS DisplayCharacter function
    int  21h
    label_edame_pop:
    cmp stacksp,0
    jg poping_add_sub
    ret
    push_pop_add_sub endp
        
        
;------------------------------
;this func is used for push pop and print for division


division proc

    mov len,0
    mov stacksp,0

    pushing_div:
    inc stacksp
    inc len
    mov dx,0
    div bx
    push dx            
    cmp ax,0
    jne  pushing_div    
    jmp labelprint_div


    labelprint_div:
    mov ans,0
    mov bx,len
    sub bx,2


    poping_div:

    dec stacksp
    pop  dx
    add  dl,30H   ;Turn into a character, from [0,9] to ["0","9"]
    mov  ah,02h  ;DOS DisplayCharacter function
    int  21h
    inc ans
    cmp ans,bx
    je label_dot_div
    jmp label_edame_pop_div
    label_dot_div:
    mov  dl,02Eh   ;Turn into a character, from [0,9] to ["0","9"]
    mov  ah,02h  ;DOS DisplayCharacter function
    int  21h
    label_edame_pop_div:
    cmp stacksp,0
    jg poping_div
    ret

    division endp


end main

