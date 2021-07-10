From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 10 Jul 2021 21:23:34 +0800
Subject: [PATCH v4 4/5] Makefile: Support building with Clang and LLVM
 binutils
In-Reply-To: <20210709193423.29712-5-jrtc27@jrtc27.com>
References: <20210709193423.29712-1-jrtc27@jrtc27.com>
 <20210709193423.29712-5-jrtc27@jrtc27.com>
Message-ID: <CAEUhbmVWVAMbJDC4J2DtYTP+Ji7RimRhpdZ3eApdM7H+LomkBQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jul 10, 2021 at 3:35 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> This is intended to mirror the Linux kernel. Building with CC=clang will
> use Clang as the compiler but default to using the existing binutils.
> Building with LLVM=1 will default to using Clang and LLVM binutils.
>
> Whilst GCC will accept the -N linker option and forward it on to the
> linker, Clang will not, and so in order to support both compilers we
> must use -Wl, to forward it to the linker as is required for most other
> linker options.
>
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
> ---
>  Makefile  | 65 ++++++++++++++++++++++++++++++++++++++++++++++++++-----
>  README.md | 43 ++++++++++++++++++++++++++++++++++--
>  2 files changed, 100 insertions(+), 8 deletions(-)
>

Here are test results:

Building with "riscv64-linux-gcc",

$ file build/platform/generic/firmware/fw_dynamic.elf
build/platform/generic/firmware/fw_dynamic.elf: ELF 64-bit LSB
executable, UCB RISC-V, version 1 (SYSV), dynamically linked, with
debug_info, not stripped

$ riscv64-linux-readelf -r build/platform/generic/firmware/fw_dynamic.elf
Relocation section '.rela.dyn' at offset 0x140f8 contains 184 entries:
  Offset          Info           Type           Sym. Value    Sym. Name + Addend
000080013090  000000000003 R_RISCV_RELATIVE                     80000db4
...
000080013628  000200000002 R_RISCV_64        0000000080013720
fdt_serial_uart8250 + 0
000080013830  000d00000002 R_RISCV_64        00000000800138d8
fdt_reset_sifive_test + 0

Building with "LLVM=1",

$ file build/platform/generic/firmware/fw_dynamic.elf
build/platform/generic/firmware/fw_dynamic.elf: ELF 64-bit LSB shared
object, UCB RISC-V, version 1 (SYSV), dynamically linked, with
debug_info, not stripped

$ riscv64-linux-readelf -r build/platform/generic/firmware/fw_dynamic.elf
Relocation section '.rela.dyn' at offset 0x17d98 contains 188 entries:
  Offset          Info           Type           Sym. Value    Sym. Name + Addend
000080017000  000000000003 R_RISCV_RELATIVE                     8000b680
000080017030  000000000003 R_RISCV_RELATIVE                     8001b1b8
...
000080017c90  000000000003 R_RISCV_RELATIVE                     80017628

There are two differences:

1. LLVM toolchain generates a "shared object" firmware image, while
GCC generates "executable".
2. LLVM one has 4 more entries in .rela.dyn than the GCC. All entries
of LLVM have the R_RISCV_RELATIVE type, but GCC one has two R_RISCV_64
entries.

I am not sure whether GCC / LLVM is doing things correctly for the
above 2 differences. fw_dynamic image of both can boot to S-mode
U-Boot on QEMU 'virt' though.

Using clang and GNU binutils, fw_dynamic image does not boot on QEMU
'virt', as reported before.
$ make CC=clang CROSS_COMPILE=riscv64-linux- PLATFORM=generic

Regards,
Bin

