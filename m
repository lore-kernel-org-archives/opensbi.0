From: Anup Patel <anup.patel@wdc.com>
Date: Thu,  2 Dec 2021 11:34:57 +0530
Subject: [PATCH 1/2] Makefile: Fix -mno-save-restore compile warning with CLANG
In-Reply-To: <20211202060458.616563-1-anup.patel@wdc.com>
References: <20211202060458.616563-1-anup.patel@wdc.com>
Message-ID: <20211202060458.616563-2-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The riscv target of CLANG does not support -m(no-)save-restore option
so we get compile warnings. This patch fixes compile warning by using
-m(no-)save-restore option only for GCC.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 Makefile | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 8623c1c..1e35dc0 100644
--- a/Makefile
+++ b/Makefile
@@ -275,8 +275,10 @@ GENFLAGS	+=	$(platform-genflags-y)
 GENFLAGS	+=	$(firmware-genflags-y)
 
 CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing -O2
-CFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
-CFLAGS		+=	-mno-save-restore -mstrict-align
+CFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls -mstrict-align
+ifneq ($(CC_IS_CLANG),y)
+CFLAGS		+=	-mno-save-restore
+endif
 CFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
 CFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
 CFLAGS		+=	$(RELAX_FLAG)
@@ -290,8 +292,10 @@ CPPFLAGS	+=	$(platform-cppflags-y)
 CPPFLAGS	+=	$(firmware-cppflags-y)
 
 ASFLAGS		=	-g -Wall -nostdlib
-ASFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
-ASFLAGS		+=	-mno-save-restore -mstrict-align
+ASFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls -mstrict-align
+ifneq ($(CC_IS_CLANG),y)
+ASFLAGS		+=	-mno-save-restore
+endif
 ASFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
 ASFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
 ASFLAGS		+=	$(RELAX_FLAG)
-- 
2.25.1


