.model small    ;commmon progrsm
.stack 100h     ;code start with offset
.data           ;define the data segmemnt
message db "hello world !$"    ;message to displayed at the terminal 
.code                          ;code segment
Begin:                         ;
    mov dx,OFFSET message      ;offset of the message terminating with $ 
    mov ax,SEG message         
    mov ds,ax
    mov ah,9d                  ;functioin to terminate
    int 21h                    ;dos interrupt
    mov ah,4CH                ;function to terminate
    int 21h
    END Begin
