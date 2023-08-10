From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 10 Aug 2023 13:02:59 +0200
Subject: [PATCH] Makefile: Fix grep warning
Message-ID: <20230810110258.52482-2-ajones@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

grep (at least my version, grep-3.8-3.fc38.x86_64) warns with
"grep: warning: stray \ before -". Fix the warning by making
the command line input to grep less ambiguous.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 730dbd910e51..03768a51f710 100644
--- a/Makefile
+++ b/Makefile
@@ -168,7 +168,7 @@ endif
 OPENSBI_LD_PIE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) $(USE_LD_FLAG) -fPIE -nostdlib -Wl,-pie -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo y || echo n)
 
 # Check whether the compiler supports -m(no-)save-restore
-CC_SUPPORT_SAVE_RESTORE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -mno-save-restore -x c /dev/null -o /dev/null 2>&1 | grep "\-save\-restore" >/dev/null && echo n || echo y)
+CC_SUPPORT_SAVE_RESTORE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -mno-save-restore -x c /dev/null -o /dev/null 2>&1 | grep -- "-save-restore" >/dev/null && echo n || echo y)
 
 # Check whether the assembler and the compiler support the Zicsr and Zifencei extensions
 CC_SUPPORT_ZICSR_ZIFENCEI := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -march=rv$(OPENSBI_CC_XLEN)imafd_zicsr_zifencei -x c /dev/null -o /dev/null 2>&1 | grep "zicsr\|zifencei" > /dev/null && echo n || echo y)
-- 
2.41.0


