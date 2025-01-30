; bootloader.asm - oddiy bootloader
bits 16          ; 16-bit rejimda ishlash
org 0x7c00       ; Bootloaderning boshlanish manzili

mov ah, 0x0E     ; Ekranga chiqarish uchun xizmat qiladi (BIOS interrupt)
mov al, 'H'      ; 'H' harfini chiqarish
int 0x10         ; BIOS interrupt
mov al, 'e'      ; 'e' harfini chiqarish
int 0x10
mov al, 'l'      ; 'l' harfini chiqarish
int 0x10
mov al, 'l'      ; 'l' harfini chiqarish
int 0x10
mov al, 'o'      ; 'o' harfini chiqarish
int 0x10

jmp $            ; To'xtamasdan ishlash
times 510 - ($ - $$) db 0 ; Faylning qolgan qismi 0 bilan to'ldiriladi
dw 0xAA55        ; Bootloaderni bootable qilish uchun