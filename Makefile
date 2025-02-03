ASSEMBLER=nasm
ASSEMBLER_FLAGS=-f elf64
LINKER=ld

all: sum_int64

sum_int64: sum_int64.o
	$(LINKER) sum_int64.o -o sum_int64

sum_int64.o:
	$(ASSEMBLER) $(ASSEMBLER_FLAGS) sum_int64.asm -o sum_int64.o

clean:
	rm sum_int64 sum_int64.o
