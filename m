From: Georg Kotheimer <georg.kotheimer@tu-dresden.de>
Date: Fri, 14 Aug 2020 23:01:29 +0200
Subject: [PATCH] lib: sbi_trap: Fix hstatus.SPVP update in sbi_trap_redirect()
Message-ID: <4446ff53a13d4feca0d17f84efd06b22@MSX-L201.msx.ad.zih.tu-dresden.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When redirecting from VS/VU-mode to HS-mode, hstatus.SPVP was set
to the value of mstatus.SPP, as according to the specification both
flags should be set to the same value.
However, the assignment of SPVP takes place before SPP itself is
updated, which results in SPVP having an outdated value.

Signed-off-by: Georg Kotheimer <georg.kotheimer@tu-dresden.de>
---
 lib/sbi/sbi_trap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index 930119d..c2bd061 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -123,7 +123,7 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
 		/* Update HSTATUS SPVP and SPV bits */
 		hstatus = csr_read(CSR_HSTATUS);
 		hstatus &= ~HSTATUS_SPVP;
-		hstatus |= (regs->mstatus & MSTATUS_SPP) ? HSTATUS_SPVP : 0;
+		hstatus |= (prev_mode == PRV_S) ? HSTATUS_SPVP : 0;
 		hstatus &= ~HSTATUS_SPV;
 		hstatus |= (prev_virt) ? HSTATUS_SPV : 0;
 		csr_write(CSR_HSTATUS, hstatus);
-- 
2.25.1


