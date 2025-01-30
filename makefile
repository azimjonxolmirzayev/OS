
# Bo'linmalar
CC = gcc
AS = nasm
LD = ld

# Direktoriya
BOOT_DIR = boot
KERNEL_DIR = kernel

# Fayllar
BOOTLOADER = $(BOOT_DIR)/bootloader.asm
KERNEL = $(KERNEL_DIR)/kernel.c
OUTPUT = os.iso

# Kompilyatsiya qilish
all: $(OUTPUT)

$(OUTPUT): $(BOOTLOADER) $(KERNEL)
	$(AS) -f bin $(BOOTLOADER) -o $(BOOT_DIR)/bootloader.o
	$(CC) -ffreestanding -m32 -c $(KERNEL) -o $(KERNEL_DIR)/kernel.o
	$(LD) -m elf_i386 -o $(KERNEL_DIR)/kernel.bin -Ttext 0x1000 $(KERNEL_DIR)/kernel.o
	cat $(BOOT_DIR)/bootloader.o $(KERNEL_DIR)/kernel.bin > $(KERNEL_DIR)/os.bin
	mkisofs -o $(OUTPUT) $(KERNEL_DIR)

clean:
	rm -f $(KERNEL_DIR)/*.o $(KERNEL_DIR)/kernel.bin $(KERNEL_DIR)/os.bin $(OUTPUT)
