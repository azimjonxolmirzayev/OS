#include <stdint.h>

// Kernelning boshlanishi
void kernel_main() {
    const char *message = "Hello, World!";
    char *video_memory = (char *) 0xB8000; // VGA ekran manzili

    for (int i = 0; message[i] != '\0'; i++) {
        video_memory[i * 2] = message[i];      // Harflarni yozamiz
        video_memory[i * 2 + 1] = 0x07;        // Rangi (oq)
    }

    while (1);  // Tizimni to'xtatish
}
