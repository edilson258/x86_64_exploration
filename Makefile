ASSEMBLER=nasm
ASSEMBLER_FLAGS=-f elf64
LINKER=ld

all: hello_world sum_int64

hello_world:
	$(ASSEMBLER) $(ASSEMBLER_FLAGS) hello_world.asm -o hello_world.o
	$(LINKER) hello_world.o -o hello_world

sum_int64:
	$(ASSEMBLER) $(ASSEMBLER_FLAGS) sum_int64.asm -o sum_int64.o
	$(LINKER) sum_int64.o -o sum_int64

clean:
	rm hello_world hello_world.o sum_int64 sum_int64.o
