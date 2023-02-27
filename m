From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 27 Feb 2023 11:30:59 +0100
Subject: [PATCH v2 04/11] lib: sbi_hsm: Move misplaced comment
In-Reply-To: <20230227103106.137995-1-ajones@ventanamicro.com>
References: <20230227103106.137995-1-ajones@ventanamicro.com>
Message-ID: <20230227103106.137995-5-ajones@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

While non-retentive suspend is not allowed for M-mode, the comment
at the top of sbi_hsm_hart_suspend() implied suspend wasn't allowed
for M-mode at all. Move the comment above the mode check which is
inside a suspend type is non-retentive check.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 lib/sbi/sbi_hsm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 3455520b8a94..294156a9a7bd 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -398,8 +398,6 @@ int sbi_hsm_hart_suspend(struct sbi_scratch *scratch, u32 suspend_type,
 	struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
 							    hart_data_offset);
 
-	/* For now, we only allow suspend from S-mode or U-mode. */
-
 	/* Sanity check on domain assigned to current HART */
 	if (!dom)
 		return SBI_EFAIL;
@@ -414,6 +412,10 @@ int sbi_hsm_hart_suspend(struct sbi_scratch *scratch, u32 suspend_type,
 
 	/* Additional sanity check for non-retentive suspend */
 	if (suspend_type & SBI_HSM_SUSP_NON_RET_BIT) {
+		/*
+		 * For now, we only allow non-retentive suspend from
+		 * S-mode or U-mode.
+		 */
 		if (rmode != PRV_S && rmode != PRV_U)
 			return SBI_EFAIL;
 		if (dom && !sbi_domain_check_addr(dom, raddr, rmode,
-- 
2.39.1


