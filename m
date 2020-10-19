From: Alistair Francis <alistair.francis@wdc.com>
Date: Mon, 19 Oct 2020 15:41:08 -0700
Subject: [PATCH] Makefile: Don't specify mabi or march
Message-ID: <20201019224108.99481-1-alistair.francis@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

To avoid
    can't link double-float modules with soft-float modules
errors when building 32-bit openSBI don't specify mabi or march.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Makefile b/Makefile
index a231881..3f819d9 100644
--- a/Makefile
+++ b/Makefile
@@ -196,7 +196,6 @@ GENFLAGS	+=	$(firmware-genflags-y)
 CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib -fno-strict-aliasing -O2
 CFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
 CFLAGS		+=	-mno-save-restore -mstrict-align
-CFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
 CFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
 CFLAGS		+=	$(GENFLAGS)
 CFLAGS		+=	$(platform-cflags-y)
@@ -210,7 +209,6 @@ CPPFLAGS	+=	$(firmware-cppflags-y)
 ASFLAGS		=	-g -Wall -nostdlib -D__ASSEMBLY__
 ASFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
 ASFLAGS		+=	-mno-save-restore -mstrict-align
-ASFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
 ASFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
 ASFLAGS		+=	$(GENFLAGS)
 ASFLAGS		+=	$(platform-asflags-y)
-- 
2.28.0


