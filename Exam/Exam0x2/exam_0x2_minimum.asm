INCLUDE header.inc					

.data
	hodd DWORD ?
	heven DWORD ?
	todd DWORD ?
	teven DWORD ?

.code

minimum PROC,
	oddarr: DWORD,
	evenarr: DWORD

	mov ebp, esp

	mov hodd, ebx
	mov heven, edx
	mov todd, esi
	mov teven, ecx

	mov edi, hodd
	mov eax, [edi]
	mov esi, 0

odd:
	cmp esi, todd
	je before

	cmp [edi+esi*4], eax
	jl swap

	inc esi
	jmp odd


swap:
	mov eax, [edi+esi*4]
	inc esi
	jmp odd

before:
	mov edi, heven
	mov esi, 0

eveni:
	cmp esi, teven
	je fini

	cmp [edi+esi*4], eax
	jl switch

	inc esi
	jmp eveni

switch:
	mov eax, [edi+esi*4]
	inc esi
	jmp eveni

fini:

	mov ebx, hodd
	mov edx, heven
	mov esi, todd
	mov ecx, teven

	mov esp, ebp
	ret 8

minimum ENDP
END