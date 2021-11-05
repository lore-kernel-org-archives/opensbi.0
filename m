From: Atish Patra <atish.patra@wdc.com>
Date: Fri,  5 Nov 2021 15:05:20 -0700
Subject: [PATCH v4 04/11] lib: sbi: Delegate PMU counter overflow interrupt to
 S mode
In-Reply-To: <20211105220527.2771269-1-atish.patra@wdc.com>
References: <20211105220527.2771269-1-atish.patra@wdc.com>
Message-ID: <20211105220527.2771269-5-atish.patra@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

OpenSBI doesn't handle PMU counters for now.

Delegate the overflow counter to S-mode always.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 include/sbi/riscv_encoding.h | 2 ++
 lib/sbi/sbi_hart.c           | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 14caa95d66de..ca6343537eba 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -86,6 +86,7 @@
 #define IRQ_VS_EXT			10
 #define IRQ_M_EXT			11
 #define IRQ_S_GEXT			12
+#define IRQ_PMU_OVF			13
 
 #define MIP_SSIP			(_UL(1) << IRQ_S_SOFT)
 #define MIP_VSSIP			(_UL(1) << IRQ_VS_SOFT)
@@ -97,6 +98,7 @@
 #define MIP_VSEIP			(_UL(1) << IRQ_VS_EXT)
 #define MIP_MEIP			(_UL(1) << IRQ_M_EXT)
 #define MIP_SGEIP			(_UL(1) << IRQ_S_GEXT)
+#define MIP_LCOFIP			(_UL(1) << IRQ_PMU_OVF)
 
 #define SIP_SSIP			MIP_SSIP
 #define SIP_STIP			MIP_STIP
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 1d73cd73b166..fccd19b7eb31 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -115,6 +115,9 @@ static int delegate_traps(struct sbi_scratch *scratch)
 
 	/* Send M-mode interrupts and most exceptions to S-mode */
 	interrupts = MIP_SSIP | MIP_STIP | MIP_SEIP;
+	if (sbi_hart_has_feature(scratch, SBI_HART_HAS_SSCOFPMF))
+		interrupts |= MIP_LCOFIP;
+
 	exceptions = (1U << CAUSE_MISALIGNED_FETCH) | (1U << CAUSE_BREAKPOINT) |
 		     (1U << CAUSE_USER_ECALL);
 	if (sbi_platform_has_mfaults_delegation(plat))
-- 
2.31.1


