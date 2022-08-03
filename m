From: dramforever <dramforever@live.com>
Date: Wed,  3 Aug 2022 13:16:52 +0800
Subject: [RFC PATCH 3/3] lib: sbi_trap: Set hstatus.GVA when redirecting
In-Reply-To: <TYYP286MB143914043D5A77C568CDDE57C69C9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
References: <TYYP286MB143914043D5A77C568CDDE57C69C9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <TYYP286MB143966B6CB24922A0888661FC69C9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

---
 lib/sbi/sbi_trap.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index ee3e4e9..1669577 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -118,12 +118,15 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
 	regs->mstatus |= (next_virt) ? MSTATUS_MPV : 0UL;
 #endif
 
-	/* Update HSTATUS for VS/VU-mode to HS-mode transition */
-	if (misa_extension('H') && prev_virt && !next_virt) {
-		/* Update HSTATUS SPVP and SPV bits */
+	/* Update HSTATUS if going to HS-mode */
+	if (misa_extension('H') && !next_virt) {
 		hstatus = csr_read(CSR_HSTATUS);
-		hstatus &= ~HSTATUS_SPVP;
-		hstatus |= (prev_mode == PRV_S) ? HSTATUS_SPVP : 0;
+		if (prev_virt) {
+			hstatus &= ~HSTATUS_SPVP;
+			hstatus |= (prev_mode == PRV_S) ? HSTATUS_SPVP : 0;
+		}
+		hstatus &= ~HSTATUS_GVA;
+		hstatus |= (trap->gva) ? HSTATUS_GVA : 0;
 		hstatus &= ~HSTATUS_SPV;
 		hstatus |= (prev_virt) ? HSTATUS_SPV : 0;
 		csr_write(CSR_HSTATUS, hstatus);
-- 
2.37.1


