#!/bin/bash
SRC="$1.asm"
ENTRY=$(tail -1 $SRC | egrep -i "end .*" | cut -d ' ' -f 2)
if [ "$ENTRY" = "" ]; then
	ENTRYPOINT="-emain";
else
	ENTRYPOINT="-e$ENTRY";
	TEMP=$(mktemp)
	echo "global $ENTRY" > $TEMP
	head -n-1 $SRC >> $TEMP
	SRC=$TEMP
fi

nasm -g \
	-p "Along32/myC32.mac" \
	-p "Along32/Along32.inc" \
	-p "Along32/more_macros.inc" \
	-f elf32 $SRC -o "$1.o" && \

gcc -nostdlib -lAlong32 -m32 -Wl,$ENTRYPOINT "$1.o" -o "$1"

rm "$1.o" $TEMP
