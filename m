From: Anup Patel <anup.patel@wdc.com>
Date: Fri,  4 Dec 2020 21:22:14 +0530
Subject: [PATCH v2 01/11] lib: sbi: Fix sbi_hart_switch_mode() for u-mode
In-Reply-To: <20201204155224.733188-1-anup.patel@wdc.com>
References: <20201204155224.733188-1-anup.patel@wdc.com>
Message-ID: <20201204155224.733188-2-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We should check and access N-extension CSRs in sbi_hart_switch_mode()
when next_mode is u-mode because N-extension is optional.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
---
 lib/sbi/sbi_hart.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 30d8aef..fc86e9f 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -522,9 +522,11 @@ sbi_hart_switch_mode(unsigned long arg0, unsigned long arg1,
 		csr_write(CSR_SIE, 0);
 		csr_write(CSR_SATP, 0);
 	} else if (next_mode == PRV_U) {
-		csr_write(CSR_UTVEC, next_addr);
-		csr_write(CSR_USCRATCH, 0);
-		csr_write(CSR_UIE, 0);
+		if (misa_extension('N')) {
+			csr_write(CSR_UTVEC, next_addr);
+			csr_write(CSR_USCRATCH, 0);
+			csr_write(CSR_UIE, 0);
+		}
 	}
 
 	register unsigned long a0 asm("a0") = arg0;
-- 
2.25.1


