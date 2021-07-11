From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 11 Jul 2021 21:14:37 +0800
Subject: [PATCH v5 0/6] Fully support standalone Clang/LLVM toolchains
In-Reply-To: <20210711022824.29915-1-jrtc27@jrtc27.com>
References: <20210711022824.29915-1-jrtc27@jrtc27.com>
Message-ID: <CAEUhbmW3rqtSv=MAd06mSjPw8_3UUvWnAFQ2p7tcsJzZ2wqfWQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jul 11, 2021 at 10:29 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> This patch series is comprised of six parts.
>
> The first patch fixes a warning seen when building with LLVM due to a
> bogus combination of assembly directives.
>
> The second patch fixes errors seen when trying to build OpenSBI as a
> position-independent binary using LLD that may or may not be an LLD bug
> (the exact meaning of -N/--omagic isn't clear) but can easily be worked
> around without any issue either way.
>
> The third patch bypasses the Clang driver's helpful nature of not
> honouring -pie for bare-metal binaries as it's normally not something
> you want (arguably that should be an error though, or passed on, since
> just giving a -Wunused-command-line-argument warning can get lost, and
> may be disabled).
>
> The fourth patch fixes the FW_PIC support added recently to be disabled
> by default when unsupported, since bare-metal GNU ld does not support
> PIE and so currently building with a bare-metal GNU ld will fail unless
> FW_PIC is manually disabled. Disabling FW_PIC is suboptimal but restores
> the pre-FW_PIC behaviour so is no longer a regression.
>
> The fifth patch adds build system support for using Clang and LLVM
> binutils, provided your Clang is able to locate a libgcc.a in its search
> path.
>
> However, pure LLVM toolchains do not use libgcc, they use compiler-rt
> (libclang_rt.builtins.<arch>.a). We could change the Makefile to not
> hard-code -lgcc and instead use -print-libgcc-file-name, but that still
> requires a bare metal compiler-rt built for the right -march/-mabi to be
> present, which is often not the case. Moreover, we need very little from
> libgcc/compiler-rt; RV64 needs nothing, and RV32 only needs 64-bit
> division. Thus, the sixth patch vendors part of FreeBSD's libquad and
> stops linking against libgcc entirely, allowing OpenSBI to be built with
> just a cross-compiler. This means that building with any distro-provided
> LLVM just works, as does compiling with the system Clang compiler and
> LLD linker on FreeBSD without any external packages needed (beyond GNU
> make).
>
> Note that using Clang with the current bleeding-edge riscv64 glibc
> toolchain from Bootlin's linker is currently broken; around 60
> relocations, or about a third of the number expected, go missing, with a
> big gap in the relocations emitted, causing various global data
> structures to not be correctly initialised. In particular, root's
> possible_harts and regions fields lose their relocations during linking
> so are left as NULL, causing sanitize_domain to immediately fail with
> SBI_EINVAL. The relocations exist in the object files and look
> completely sane so this appears to be a GNU ld bug, but I have not
> narrowed it down enough to be sure it's not something weird that OpenSBI
> or Clang are doing. I do not think this should be a blocker, and have
> added a note about this currently-broken combination to the README.
>
> Changes in v5:
>  * Disable FW_PIC by default when unsupported
>  * Pulled out -mno-relax and -fuse-ld flags into variables for reusing
>    in the code for the above change, and to deduplicate the existing
>    -mno-relax code
>  * Note in the README that riscv64-linux-gnu-ld + Clang is currently
>    broken due to what appears to be a GNU ld bug

There is still one build error in the following environment:

If /opt/riscv/bin/riscv64-unknown-linux-gnu- is not in my $PATH, the
following command fails:

$ make CC=clang
CROSS_COMPILE=/opt/riscv/bin/riscv64-unknown-linux-gnu-
PLATFORM=generic V=1 2>&1

mkdir -p `dirname
/home/test/git/opensbi/build/platform/generic/firmware/payloads/test.elf`;
echo " ELF       platform/generic/firmware/payloads/test.elf"; clang
-g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector
-fno-strict-aliasing -O2 -fno-omit-frame-pointer
-fno-optimize-sibling-calls -mno-save-restore -mstrict-align
-mabi=lp64 -march=rv64imafdc -mcmodel=medany
--target=riscv64-unknown-linux-gnu -Wno-unused-command-line-argument
-I/home/test/git/opensbi/platform/generic/include
-I/home/test/git/opensbi/include
-DOPENSBI_VERSION_GIT="\"v0.9-111-g401461d\""
-I/home/test/git/opensbi/lib/utils/libfdt/
-DFW_TEXT_START=0x80000000 -DFW_JUMP_ADDR=0x80200000
-DFW_JUMP_FDT_ADDR=0x82200000
-DFW_PAYLOAD_PATH=\"/home/test/git/opensbi/build/platform/generic/firmware/payloads/test.bin\"
-DFW_PAYLOAD_OFFSET=0x200000 -DFW_PAYLOAD_FDT_ADDR=0x82200000
-fno-pie -no-pie
/home/test/git/opensbi/build/platform/generic/firmware/payloads/test.o
/home/test/git/opensbi/build/platform/generic/lib/libplatsbi.a
-fuse-ld=bfd -Wl,--build-id=none -Wl,-N
-Wl,-T/home/test/git/opensbi/build/platform/generic/firmware/payloads/test.elf.ld
-o /home/test/git/opensbi/build/platform/generic/firmware/payloads/test.elf
 ELF       platform/generic/firmware/payloads/test.elf
/usr/bin/ld.bfd: unrecognised emulation mode: elf64lriscv
Supported emulations: elf_x86_64 elf32_x86_64 elf_i386 elf_iamcu
elf_l1om elf_k1om i386pep i386pe
clang-12: error: linker command failed with exit code 1 (use -v to see
invocation)
make: *** [Makefile:406:
/home/test/git/opensbi/build/platform/generic/firmware/payloads/test.elf]
Error 1

Regards,
Bin

