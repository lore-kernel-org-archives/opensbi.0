From: Atish Patra <atish.patra@wdc.com>
Date: Fri, 19 Mar 2021 15:12:53 -0700
Subject: [RFC 02/14] lib: sbi: Detect mcountinihibit support at runtime
In-Reply-To: <20210319221305.2138412-1-atish.patra@wdc.com>
References: <20210319221305.2138412-1-atish.patra@wdc.com>
Message-ID: <20210319221305.2138412-3-atish.patra@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

RISC-V ISA specification v1.11 defined mcountinhibit CSR that allows
software to stop any counter from incrementing. The SBI PMU extension
depends on this CSR support in hardware.

Define mcountinhibit as a hart specific feature and detect it at runtime.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 include/sbi/sbi_hart.h |  4 +++-
 lib/sbi/sbi_hart.c     | 12 ++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 031c7b08a815..9e317c52008c 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -18,8 +18,10 @@ enum sbi_hart_features {
 	SBI_HART_HAS_SCOUNTEREN = (1 << 0),
 	/** Hart has M-mode counter enable */
 	SBI_HART_HAS_MCOUNTEREN = (1 << 1),
+	/** Hart has counter inhibit CSR */
+	SBI_HART_HAS_MCOUNTINHIBIT = (1 << 2),
 	/** HART has timer csr implementation in hardware */
-	SBI_HART_HAS_TIME = (1 << 2),
+	SBI_HART_HAS_TIME = (1 << 3),
 
 	/** Last index of Hart features*/
 	SBI_HART_HAS_LAST_FEATURE = SBI_HART_HAS_TIME,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index d91b08cf1cec..0b3bb6237182 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -259,6 +259,9 @@ static inline char *sbi_hart_feature_id2string(unsigned long feature)
 	case SBI_HART_HAS_MCOUNTEREN:
 		fstr = "mcounteren";
 		break;
+	case SBI_HART_HAS_MCOUNTINHIBIT:
+		fstr = "mcountinhibit";
+		break;
 	case SBI_HART_HAS_TIME:
 		fstr = "time";
 		break;
@@ -423,6 +426,15 @@ __mhpm_skip:
 			hfeatures->features |= SBI_HART_HAS_MCOUNTEREN;
 	}
 
+	/* Detect if hart supports MCOUNTINHIBIT feature */
+	trap.cause = 0;
+	val = csr_read_allowed(CSR_MCOUNTINHIBIT, (unsigned long)&trap);
+	if (!trap.cause) {
+		csr_write_allowed(CSR_MCOUNTINHIBIT, (unsigned long)&trap, val);
+		if (!trap.cause)
+			hfeatures->features |= SBI_HART_HAS_MCOUNTINHIBIT;
+	}
+
 	/* Detect if hart supports time CSR */
 	trap.cause = 0;
 	csr_read_allowed(CSR_TIME, (unsigned long)&trap);
-- 
2.25.1


