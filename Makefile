all:
	@echo "make install   - install required libraries"
	@echo "make <program> - compile <program>.asm"

.PHONY: install
install:
	make -C	Along32/src
	sudo make -C Along32/src install
	sudo ldconfig

%: %.asm
	nasm -g -p "Along32/more_macros.inc" -p "Along32/myC32.mac" -f elf32 "$@.asm"
	gcc -nostdlib -lAlong32 -m32 -Wl,-emain "$@.o" -o "$@"
	@rm "$@.o"
