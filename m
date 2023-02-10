From: Nylon Chen <nylon.chen@sifive.com>
Date: Fri, 10 Feb 2023 16:52:38 +0800
Subject: [PATCH] lib: sbi_hart: Enable hcontext and scontext
Message-ID: <20230210085238.19723-1-nylon.chen@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

According to the description in "riscv-state-enable[0]", to access
h/scontext in S-Mode, we need to enable the 57th bit.

If it is not enabled, an "illegal instruction" error will occur.

Link: https://github.com/riscv/riscv-state-enable/blob/a28bfae443f350d5b4c42874f428367d5b322ffe/content.adoc [0]

Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
---
 include/sbi/riscv_encoding.h | 2 ++
 lib/sbi/sbi_hart.c           | 1 +
 2 files changed, 3 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index b0f08c8..4ebed97 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -736,6 +736,8 @@
 #define SMSTATEEN0_CS			(_ULL(1) << SMSTATEEN0_CS_SHIFT)
 #define SMSTATEEN0_FCSR_SHIFT		1
 #define SMSTATEEN0_FCSR			(_ULL(1) << SMSTATEEN0_FCSR_SHIFT)
+#define SMSTATEEN0_CONTEXT_SHIFT	57
+#define SMSTATEEN0_CONTEXT		(_ULL(1) << SMSTATEEN0_CONTEXT_SHIFT)
 #define SMSTATEEN0_IMSIC_SHIFT		58
 #define SMSTATEEN0_IMSIC		(_ULL(1) << SMSTATEEN0_IMSIC_SHIFT)
 #define SMSTATEEN0_AIA_SHIFT		59
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 02ce991..5e06918 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -90,6 +90,7 @@ static void mstatus_init(struct sbi_scratch *scratch)
 		mstateen_val |= ((uint64_t)csr_read(CSR_MSTATEEN0H)) << 32;
 #endif
 		mstateen_val |= SMSTATEEN_STATEN;
+		mstateen_val |= SMSTATEEN0_CONTEXT;
 		mstateen_val |= SMSTATEEN0_HSENVCFG;
 
 		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMAIA))
-- 
2.36.1


