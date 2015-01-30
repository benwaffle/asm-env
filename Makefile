all:
	@echo "run \`make <program>\` to compile <program>.asm"

install:
	make -C	Along32/src
	sudo make -C Along32/src install

%: 
	nasm -p "Along32/more_macros.inc" -f elf32 "$@.asm"
	gcc -nostdlib -L/usr/lib32 -lAlong32 -m32 "$@.o" -o "$@"
	@rm "$@.o"
