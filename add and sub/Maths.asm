data segment
    msg db 0dh,0ah,"Enter first number: $"
    msg1 db 0dh,0ah,"Enter second number: $"
    result db 0dh,0ah,"The Result is: $"
data ends

code segment
    assume CS:code, DS:data
start:
    mov ax, data            ; Move data segment address to DS
    mov ds, ax

    mov dx, offset msg      ; Display contents of variable msg
    mov ah, 09h
    int 21h

    mov ah, 01h             ; To accept input and store ASCII value into al
    int 21h

    sub al, 30h             ; Accept 10's place of the number
    mov bl, al
    rol bl, 4

    mov ah, 01h             ; To accept input and store ASCII value into al
    int 21h

    sub al, 30h             ; Accept unit's place of number

    add bl, al              ; Get the number by adding 10's and unit's place

    mov dx, offset msg1     ; Display contents of variable msg1
    mov ah, 09h
    int 21h

    mov ah, 01h             ; To accept input and store ASCII value into al
    int 21h

    sub al, 30h             ; Accept 10's place of the number
    mov cl, al
    rol cl, 4

    mov ah, 01h             ; To accept input and store ASCII value into al
    int 21h

    sub al, 30h             ; Accept unit's place of number

    add cl, al              ; Get the number by adding 10's and unit's place

    add bl, cl              ; Add the two accepted numbers

    mov dx, offset result   ; Display contents of string result
    mov ah, 09h
    int 21h

    mov cl, bl              ; Store the value of the result

    and bl, 0f0h            ; Isolate 10's place of result
    ror bl, 4

    call AsciiConv          ; Convert to ASCII to display

    mov dl, bl              ; Display a number/alphabet
    mov ah, 02h
    int 21h

    mov bl, cl              ; Retrieve original result

    and bl, 0fh             ; Isolate unit's place of result

    call AsciiConv          ; Convert to ASCII to display

    mov dl, bl              ; Display a number/alphabet
    mov ah, 02h
    int 21h

    mov ah, 4ch             ; Terminate the program
    int 21h

AsciiConv proc              ; Compare to 0ah if it is less than A then
    cmp bl, 0ah             ; If it is greater than or equal to 0ah then
    jc skip 
    add bl, 07h
skip:
    add bl, 30h
    ret
AsciiConv endp

code ends
end start