%macro exit 0-1 0
	mov eax, 1  ; sys_exit
	mov ebx, %1 ; exit code
	int 80h     ; syscall
%endmacro

proc StdOut
	.in arg 4
	mov edx, [ebp+.in]
	call WriteString
	ret
endproc
StdOut_arglen equ 4

proc ExitProcess
	exitcode arg 4
	exit [ebp+exitcode]
endproc
ExitProcess_arglen equ 4
