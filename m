From: Anup Patel <anup.patel@wdc.com>
Date: Thu, 23 Dec 2021 17:57:04 +0530
Subject: [PATCH v3] firmware: Move memcpy/memset mapping to fw_base.S
Message-ID: <20211223122704.1068096-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Some of the external firmwares using OpenSBI as library are facing
issues with the weak memcpy() and memset() aliases in libsbi.a so
we move these to fw_base.S. This way mapping of implicit memcpy()
or memset() calls to sbi_memcpy() or sbi_memset() will only be done
for OpenSBI firmwares.
(Refer, https://github.com/riscv-software-src/opensbi/issues/234)

In addition, we also add memmove() and memcmp() mappings in fw_base.S
because as-per the GCC documentation the freestanding environment must
provide memcpy(), memmove(), memset(), and memcmp().

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
Changes since v2:
 - Added mapping for memmove() and memcmp() in fw_base.S
Changes since v1:
 - Use "tail" in-place of "j" instruction in fw_base.S
---
 firmware/fw_base.S   | 28 ++++++++++++++++++++++++++++
 lib/sbi/sbi_string.c |  6 ------
 2 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 1569e60..ab3e1b3 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -561,6 +561,34 @@ fw_platform_init:
 	add	a0, a1, zero
 	ret
 
+	/* Map implicit memcpy() added by compiler to sbi_memcpy() */
+	.section .text
+	.align 3
+	.globl memcpy
+memcpy:
+	tail	sbi_memcpy
+
+	/* Map implicit memset() added by compiler to sbi_memset() */
+	.section .text
+	.align 3
+	.globl memset
+memset:
+	tail	sbi_memset
+
+	/* Map implicit memmove() added by compiler to sbi_memmove() */
+	.section .text
+	.align 3
+	.globl memmove
+memmove:
+	tail	sbi_memmove
+
+	/* Map implicit memcmp() added by compiler to sbi_memcmp() */
+	.section .text
+	.align 3
+	.globl memcmp
+memcmp:
+	tail	sbi_memcmp
+
 .macro	TRAP_SAVE_AND_SETUP_SP_T0
 	/* Swap TP and MSCRATCH */
 	csrrw	tp, CSR_MSCRATCH, tp
diff --git a/lib/sbi/sbi_string.c b/lib/sbi/sbi_string.c
index c67c02e..c87bce9 100644
--- a/lib/sbi/sbi_string.c
+++ b/lib/sbi/sbi_string.c
@@ -122,9 +122,6 @@ void *sbi_memset(void *s, int c, size_t count)
 	return s;
 }
 
-void *memset(void *s, int c, size_t count) \
-__attribute__((weak, alias("sbi_memset")));
-
 void *sbi_memcpy(void *dest, const void *src, size_t count)
 {
 	char *temp1	  = dest;
@@ -138,9 +135,6 @@ void *sbi_memcpy(void *dest, const void *src, size_t count)
 	return dest;
 }
 
-void *memcpy(void *dest, const void *src, size_t count) \
-__attribute__((weak, alias("sbi_memcpy")));
-
 void *sbi_memmove(void *dest, const void *src, size_t count)
 {
 	char *temp1	  = (char *)dest;
-- 
2.25.1


