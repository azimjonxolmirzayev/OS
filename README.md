## Bootloaderni Kompilyatsiya Qilish

Bootloader.asm faylini kompilyatsiya qilish uchun **nasm** yordamida quyidagi buyruqni ishlating:

```bash
nasm -f bin bootloader.asm -o bootloader.bin
```

## Kernelni Kompilyatsiya Qilish

Agar kernelni **C** tilida yozgan bo'lsangiz, uni **gcc** yordamida kompilyatsiya qilish kerak. Quyidagi buyruqni ishlating:

```bash
gcc -ffreestanding -m32 -c kernel.c -o kernel.o
```

## Bootloader va Kernelni Birlashtirish

Bootloader va kernelni birlashtirish uchun quyidagi buyruqni ishlating va `os.bin` faylini yarating:

```bash
cat bootloader.bin kernel.o > os.bin
```

## ISO Faylini Yaratish

**os.bin** faylini ISO formatiga o'tkazish uchun **mkisofs** yordamida ISO faylini yaratish uchun quyidagi buyruqni ishlating:

```bash
mkisofs -o os.iso -b os.bin -no-emul-boot -boot-load-size 4 -boot-info-table .
```
