From: Atish Patra <atish.patra@wdc.com>
Date: Wed, 26 May 2021 17:30:34 -0700
Subject: [PATCH v2 05/15] lib: sbi: Disable m/scounteren & enable mcountinhibit
In-Reply-To: <20210527003044.889681-1-atish.patra@wdc.com>
References: <20210527003044.889681-1-atish.patra@wdc.com>
Message-ID: <20210527003044.889681-6-atish.patra@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, all bits in mcountern are enabled unconditionally at
boot time. With SBI PMU extension, this should enabled only during
performance monitoring for a particular event except the TM bit. However,
this is done only if mcountinhibit is implemented because the supervisor
mode can not start/stop any event without mcountinhibit.

Similarly, supervisor should take care enabling scounteren which allows
U-mode to access pmu counters. Disable all bits in scounteren in M-mode.

Reviewed-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 lib/sbi/sbi_hart.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 0d5b7b8d3509..9f1ee20fa978 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -51,12 +51,26 @@ static void mstatus_init(struct sbi_scratch *scratch)
 
 	csr_write(CSR_MSTATUS, mstatus_val);
 
-	/* Enable user/supervisor use of perf counters */
+	/* Disable user mode usage of perf counters */
 	if (misa_extension('S') &&
 	    sbi_hart_has_feature(scratch, SBI_HART_HAS_SCOUNTEREN))
-		csr_write(CSR_SCOUNTEREN, -1);
-	if (sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTEREN))
-		csr_write(CSR_MCOUNTEREN, -1);
+		csr_write(CSR_SCOUNTEREN, 0);
+
+	if (sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTEREN)) {
+		if (sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTINHIBIT))
+			/**
+			 * Just enable TM bit now. All other counters will be
+			 * enabled at runtime after S-mode request
+			 */
+			csr_write(CSR_MCOUNTEREN, 2);
+		else
+			/* Supervisor mode usage are enabled by default */
+			csr_write(CSR_MCOUNTEREN, -1);
+	}
+
+	/* Counters will start running at runtime after S-mode request */
+	if (sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTINHIBIT))
+		csr_write(CSR_MCOUNTINHIBIT, -1);
 
 	/* Disable all interrupts */
 	csr_write(CSR_MIE, 0);
-- 
2.25.1


