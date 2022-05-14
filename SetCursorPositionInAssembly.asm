org 100h

jmp start

setcursor:
    mov  ax, 0003h    ; BIOS.SetVideoMode 80x25 16-color text
    int  10h

    mov  dx, 0C23h    ; DH is Row (12), DL is Column (35)
    mov  bh, 0        ; DisplayPage
    mov  ah, 02h      ; BIOS.SetCursorPosition
    int  10h

    mov  cx, 10       ; ReplicationCount
    mov  bx, 002Fh    ; BH is DisplayPage (0) , BL is Attribute (BrightWhiteOnGreen)
    mov  ax, 0941h    ; BIOS.WriteCharacterAndAttribute, AL is ASCII ("A")
    int  10h

    mov  ah, 00h      ; BIOS.WaitKeyboardKey
    int  16h          ; -> AX
ret 


start: 

call setcursor

mov ax, 0x4c00 ; terminate program
int 0x21
