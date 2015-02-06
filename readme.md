download
----
`git clone https://github.com/benwaffle/asm-env.git`

install
----
You need 32-bit libc and nasm:
- Ubuntu: `sudo apt-get install libc6-dev-i386 nasm`
- Arch Linux: enable multilib in `/etc/pacman.conf`, `sudo pacman -Sy`, then `sudo pacman -S lib32-gcc-libs lib32-glibc nasm`

Now run `make install`

use
----
For example, run `make demo` to compile demo.asm

[masm to nasm](https://rawgit.com/benwaffle/asm-env/master/diff.html)
----
