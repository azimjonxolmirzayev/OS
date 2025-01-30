; bootloader.asm - Oddiy bootloader + klaviaturani o‘qish
bits 16
org 0x7c00

start:
    ; Ekranga "Hello" ni chiqarish
    mov ah, 0x0E
    mov al, 'H'
    int 0x10
    mov al, 'e'
    int 0x10
    mov al, 'l'
    int 0x10
    mov al, 'l'
    int 0x10
    mov al, 'o'
    int 0x10

keyboard_loop:
    ; Klaviaturadan belgi kiritilishini kutish
    mov ah, 0x00
    int 0x16   ; BIOS keyboard interrupt
    
    ; O‘qilgan belgini ekranga chiqarish
    mov ah, 0x0E
    mov al, al  ; O‘qilgan belgi to‘g‘ridan-to‘g‘ri AL registrida bo‘ladi
    int 0x10

    jmp keyboard_loop  ; Davom etish

times 510 - ($ - $$) db 0  ; Boot sektorni to'ldirish
dw 0xAA55  ; Boot sektor signaturasi
