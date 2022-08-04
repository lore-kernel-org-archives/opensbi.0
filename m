From: Vivian Wang <dramforever@live.com>
Date: Thu,  4 Aug 2022 11:17:05 +0800
Subject: [PATCH 4/5] lib: sbi_trap: Set hypervisor CSRs for HS-mode
In-Reply-To: <20220804031706.2197187-1-dramforever@live.com>
References: <TYYP286MB1439C5C64BCF8E9DB7883772C69F9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
 <20220804031706.2197187-1-dramforever@live.com>
Message-ID: <TYYP286MB1439D2AB7CFD5C0E58107ECFC69F9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The hypervisor CSRs hstatus, htval, htinst should always be set if the
trap is to be taken in HS-mode, regardless of which mode it came from.

Signed-off-by: Vivian Wang <dramforever@live.com>
---
 lib/sbi/sbi_trap.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index f782fbf..6e3202b 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -118,12 +118,14 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
 	regs->mstatus |= (next_virt) ? MSTATUS_MPV : 0UL;
 #endif
 
-	/* Update HSTATUS for VS/VU-mode to HS-mode transition */
-	if (misa_extension('H') && prev_virt && !next_virt) {
-		/* Update HSTATUS SPVP and SPV bits */
+	/* Update hypervisor CSRs if going to HS-mode */
+	if (misa_extension('H') && !next_virt) {
 		hstatus = csr_read(CSR_HSTATUS);
-		hstatus &= ~HSTATUS_SPVP;
-		hstatus |= (prev_mode == PRV_S) ? HSTATUS_SPVP : 0;
+		if (prev_virt) {
+			/* hstatus.SPVP is only updated if coming from VS/VU-mode */
+			hstatus &= ~HSTATUS_SPVP;
+			hstatus |= (prev_mode == PRV_S) ? HSTATUS_SPVP : 0;
+		}
 		hstatus &= ~HSTATUS_SPV;
 		hstatus |= (prev_virt) ? HSTATUS_SPV : 0;
 		csr_write(CSR_HSTATUS, hstatus);
-- 
2.37.1


