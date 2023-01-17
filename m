From: Nick Hu <nick.hu@sifive.com>
Date: Tue, 17 Jan 2023 16:14:28 +0800
Subject: [PATCH 2/2] lib: sbi_hsm: Use csr_set to restore the MIP
In-Reply-To: <20230117081428.15042-1-nick.hu@sifive.com>
References: <20230117081428.15042-1-nick.hu@sifive.com>
Message-ID: <20230117081428.15042-3-nick.hu@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If we use the csr_write to restore the MIP, we may clear the SEIP.
In generic behavior of QEMU, if the pending bits of PLIC are set and we
clear the SEIP, the QEMU may not set it back immediately. It may cause
the interrupts won't be handled anymore until the new interrupts arrived
and QEMU set the bits back.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 lib/sbi/sbi_hsm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index c0a5505..39cd1ab 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -358,7 +358,7 @@ static void __sbi_hsm_suspend_non_ret_restore(struct sbi_scratch *scratch)
 							    hart_data_offset);
 
 	csr_write(CSR_MIE, hdata->saved_mie);
-	csr_write(CSR_MIP, (hdata->saved_mip & (MIP_SSIP | MIP_STIP)));
+	csr_set(CSR_MIP, (hdata->saved_mip & (MIP_SSIP | MIP_STIP)));
 }
 
 void sbi_hsm_hart_resume_start(struct sbi_scratch *scratch)
-- 
2.34.1


