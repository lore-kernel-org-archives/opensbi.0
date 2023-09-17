From: Vivian Wang <dramforever@live.com>
Date: Mon, 18 Sep 2023 01:51:41 +0800
Subject: [PATCH 0/3] Relocation-related fixes
Message-ID: <TYYP286MB1439495D0B19A0ECFD89BDABC6F4A@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I was looking into various implementations of "DIY" runtime relocations.
One thing led to another, and here are three patches.

This area does seem fairly obscure, so advice on proper/better ways to
do things are definitely needed. Thanks in advance for any help.

Patch 1 fixes a crash on RV32 that happens to 50% of built binaries
essentially randomly.

Patch 2 removes handling of R_RISCV_{32,64}. Why they have been added in
the first place is a complete mystery to me, since these are for dynamic
linking only, which is simply not a thing here. I've also never seen a
toolchain generate these for *static*-pie. And yes the generated binary
boots fine.

From what I can tell, Linux, musl, glibc all only handle
R_RISCV_RELATIVE for static-pie. (Okay, also IRELATIVE, but just don't
use ifuncs.) The only other place I can find that does anything with
.dynsym is U-Boot's RISC-V relocation code [1], and the code is there
without explanation either.

Maybe some ancient toolchains generated R_RISCV_{32,64} for static
linking? I have no idea.

Since we don't need .dynsym, I went ahead and did patch 3. I tried
fiddling around with -fvisibility= but it seems that, given that OpenSBI
is built as a static library, --exclude-libs ALL looked liked the
simplest solution. Or should we just /DISCARD/ .dynsym etc. instead?

Cc'd Vincent Chen - Since you're the author of 0f20e8adcf42 "firmware:
Support position independent execution" I'm hope you can give some
insight. Thanks in advance.

[1]: https://github.com/u-boot/u-boot/commit/e8e39597a33cc53aacbaf4ef5cae60ed86d6a20a

Vivian Wang (3):
  firmware: Remove ALIGN in .rela.dyn in linker script
  firmware: Remove handling of R_RISCV_{32,64}
  Makefile: Add --exclude-libs ALL to avoid .dynsym

 Makefile                |  1 +
 firmware/fw_base.S      | 22 ----------------------
 firmware/fw_base.ldS    |  7 -------
 include/sbi/riscv_elf.h |  8 --------
 4 files changed, 1 insertion(+), 37 deletions(-)

-- 
2.41.0


