download
----
`git clone https://github.com/benwaffle/asm-env.git`

install
----
You need 32-bit libc and nasm:
- Ubuntu: `sudo apt-get install gcc-multilib libc6-i386 lib6-dev-i386 nasm`
- Arch Linux: enable multilib in `/etc/pacman.conf`, `sudo pacman -Sy`, then `sudo pacman -S lib32-gcc-libs lib32-glibc nasm`

Now run `make install`

use
----
For example, run `make demo` to compile demo.asm

masm to nasm
----

| masm32 | nasm |
| ------ | ---- |
| `TITLE my program` | `n/a` |
| `INCLUDE IncludeMe.inc` | `%INCLUDE "IncludeMe.inc"` |
| `.code` | `section .text` |
| `main PROC` | <code>global _start</code><br><code>_start:</code> |
