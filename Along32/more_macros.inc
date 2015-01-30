%macro exit 1
	mov eax, 1  ; sys_exit
	mov ebx, %1 ; exit code
	int 80h     ; syscall
%endmacro

%macro exit 0
	exit 0
%endmacro
