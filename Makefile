all:
	@echo "make install   - install required libraries"
	@echo "make <program> - compile <program>.asm"

install:
	make -C	Along32/src
	sudo make -C Along32/src install
	sudo ldconfig

%: %.asm
	nasm -p "Along32/more_macros.inc" -f elf32 "$@.asm"
	gcc -nostdlib -lAlong32 -m32 "$@.o" -o "$@"
	@rm "$@.o"
