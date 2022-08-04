From: Vivian Wang <dramforever@live.com>
Date: Thu,  4 Aug 2022 22:32:31 +0800
Subject: [PATCH v2 5/5] lib: sbi_trap: Set hstatus.GVA when going to HS-mode
In-Reply-To: <TYYP286MB1439FC0A558FBF23B64D8BB4C69F9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
References: <TYYP286MB1439FC0A558FBF23B64D8BB4C69F9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <TYYP286MB1439CFF3C4F3A1BEE070B4D6C69F9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The privileged spec specifies that on a trap to HS-mode, hstatus.GVA
should be set to 1 if stval is written with a guest virtual address, and
to 0 otherwise. Implement this by setting hstatus.GVA to trap->gva when
redirecting traps to HS-mode.

Signed-off-by: Vivian Wang <dramforever@live.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 lib/sbi/sbi_trap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index 1cf2e6f..925840f 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -128,6 +128,8 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
 		}
 		hstatus &= ~HSTATUS_SPV;
 		hstatus |= (prev_virt) ? HSTATUS_SPV : 0;
+		hstatus &= ~HSTATUS_GVA;
+		hstatus |= (trap->gva) ? HSTATUS_GVA : 0;
 		csr_write(CSR_HSTATUS, hstatus);
 		csr_write(CSR_HTVAL, trap->tval2);
 		csr_write(CSR_HTINST, trap->tinst);
-- 
2.37.1


