ASSEMBLER=nasm
ASSEMBLER_FLAGS=-f elf64
LINKER=ld
LINKER_LIBC_FLAG=-dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc

all: hello_world sum_int64 mem_read_write fibonacci

hello_world:
	$(ASSEMBLER) $(ASSEMBLER_FLAGS) hello_world.asm -o hello_world.o
	$(LINKER) hello_world.o -o hello_world

sum_int64:
	$(ASSEMBLER) $(ASSEMBLER_FLAGS) sum_int64.asm -o sum_int64.o
	$(LINKER) sum_int64.o -o sum_int64

mem_read_write:
	$(ASSEMBLER) $(ASSEMBLER_FLAGS) mem_read_write.asm -o mem_read_write.o
	$(LINKER) mem_read_write.o -o mem_read_write

fibonacci:
	$(ASSEMBLER) $(ASSEMBLER_FLAGS) fibonacci.asm -o fibonacci.o
	$(LINKER) $(LINKER_LIBC_FLAG) fibonacci.o -o fibonacci

clean:
	rm hello_world hello_world.o sum_int64 sum_int64.o mem_read_write mem_read_write.o fibonacci fibonacci.o
