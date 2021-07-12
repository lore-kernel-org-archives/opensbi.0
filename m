From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 12 Jul 2021 09:50:07 +0800
Subject: [PATCH] Makefile: Pass "-Wa,
 -mno-relax" to manually forward it to the GNU assembler when linking
 with LLD
Message-ID: <20210712015007.9946-1-bmeng.cn@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When generating code with -mno-relax, GCC puts .option norelax in
the generated assembly, and so doesn?t bother passing on -mno-relax
to the assembler. This has the unfortunate effect that, when using
GCC to assemble hand-written assembly, -mno-relax does nothing,
and we have to pass -Wa,-mno-relax to manually forward it to the
assembler.

This is an old GCC bug that was fixed [1] recently. For the time
being, let's pass "-Wa,-mno-relax" to ASFLAGS for the GCC + LLD
combination to work, e.g.:

  $ make CC=riscv64-unknown-elf-gcc LLVM=1 PLATFORM=generic

[1] https://github.com/gcc-mirror/gcc/commit/3b0a7d624e64eeb81e4d5e8c62c46d86ef521857

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 129b8ed..d9bb925 100644
--- a/Makefile
+++ b/Makefile
@@ -272,6 +272,9 @@ ASFLAGS		+=	-mno-save-restore -mstrict-align
 ASFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
 ASFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
 ASFLAGS		+=	$(RELAX_FLAG)
+ifeq ($(CC_IS_CLANG)$(LD_IS_LLD),ny)
+ASFLAGS		+=	-Wa,-mno-relax
+endif
 ASFLAGS		+=	$(GENFLAGS)
 ASFLAGS		+=	$(platform-asflags-y)
 ASFLAGS		+=	$(firmware-asflags-y)
-- 
2.25.1


