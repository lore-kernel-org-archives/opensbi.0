From: Igor Melnikov <imel@purelymail.com>
Date: Mon, 11 Nov 2024 20:37:07 +0100
Subject: [PATCH] Makefile: Fix POSIX grep alternation regex
Message-ID: <20241111193721.79542-1-imel@purelymail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

grep -e "-mstrict-align\|-mno-unaligned-access" makes use of GNU grep's
backslash-escaped alternation operator \| which is available in basic
regular expression syntax (BRE).

However, in POSIX grep's BRE | is an ordinary character which, when
backslash-escaped, matches itself. Therefore, the search pattern becomes
a plain string '-mstrict-align|-mno-unaligned-access', which obviously
never matches the expected error and CC_SUPPORT_STRICT _ALIGN is always
set to y.

When cross-compiling with LLVM on amd64-unknown-openbsd7.6 host for
riscv64-unknown-elf target this results in a compilation error:

clang: error: unsupported option '-mno-unaligned-access' for target
'riscv64-unknown-elf'

Using grep -E for extended regular expression syntax with non-escaped
alternation operator | lets both versions interpret the pattern
 unambiguously and the check to function properly on systems with POSIX
 grep as well.

Signed-off-by: Igor Melnikov <imel@purelymail.com>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index dae282c..6371f6f 100644
--- a/Makefile
+++ b/Makefile
@@ -184,10 +184,10 @@ OPENSBI_LD_EXCLUDE_LIBS := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) $(USE_LD_
 CC_SUPPORT_SAVE_RESTORE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -mno-save-restore -x c /dev/null -o /dev/null 2>&1 | grep -e "-save-restore" >/dev/null && echo n || echo y)
 
 # Check whether the compiler supports -m(no-)strict-align
-CC_SUPPORT_STRICT_ALIGN := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -mstrict-align -x c /dev/null -o /dev/null 2>&1 | grep -e "-mstrict-align\|-mno-unaligned-access" >/dev/null && echo n || echo y)
+CC_SUPPORT_STRICT_ALIGN := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -mstrict-align -x c /dev/null -o /dev/null 2>&1 | grep -Ee "-mstrict-align|-mno-unaligned-access" >/dev/null && echo n || echo y)
 
 # Check whether the assembler and the compiler support the Zicsr and Zifencei extensions
-CC_SUPPORT_ZICSR_ZIFENCEI := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -march=rv$(OPENSBI_CC_XLEN)imafd_zicsr_zifencei -x c /dev/null -o /dev/null 2>&1 | grep "zicsr\|zifencei" > /dev/null && echo n || echo y)
+CC_SUPPORT_ZICSR_ZIFENCEI := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -march=rv$(OPENSBI_CC_XLEN)imafd_zicsr_zifencei -x c /dev/null -o /dev/null 2>&1 | grep -E "zicsr|zifencei" > /dev/null && echo n || echo y)
 
 ifneq ($(OPENSBI_LD_PIE),y)
 $(error Your linker does not support creating PIEs, opensbi requires this.)
-- 
2.46.1


