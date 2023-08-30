#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <cheriintrin.h>

void pp_cap(void *__capability ptr)
{
    uint64_t length = cheri_length_get(ptr);
    uint64_t address = cheri_address_get(ptr);
    uint64_t base = cheri_base_get(ptr);
    uint64_t flags = cheri_flags_get(ptr);
    uint64_t perms = cheri_perms_get(ptr);
    uint64_t type = cheri_type_get(ptr);
    bool tag = cheri_tag_get(ptr);

    uint64_t offset = cheri_offset_get(ptr);

    printf("Capability: %#lp\n", ptr);
    printf("Tag: %d, Perms: %04lx, Type: %lx, Address: %04lx, Base: %04lx, End: %04lx, Flags: %lx, "
           "Length: %04lx, Offset: %04lx\n",
           tag, perms, type, address, base, base + length, flags, length, offset);
}

int main() {
    void * __capability p = (__cheri_tocap void * __capability)malloc(256);
    pp_cap((__cheri_tocap void * __capability)p);

    void * p_nocap = malloc(256);
    pp_cap((__cheri_tocap void * __capability)p_nocap);
}
