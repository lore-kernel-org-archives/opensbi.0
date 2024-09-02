From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Mon,  2 Sep 2024 13:21:10 +0300
Subject: [PATCH] lib: sbi: fix number of PMP entries detection
Message-ID: <20240902102110.1311636-1-vladimir.kondratiev@mobileye.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

CSR_PMPADDRn lower bits may read all-0 or all-1, depending on
the configuration. For TOR it is all-0, for NAPOT - all-1.

Thus if PMP entry was pre-configured as NAPOT, original code would
stop scanning because value read back not equal to the written one.

Mask lower bits before comparison to fix this

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 lib/sbi/sbi_hart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index cc364fac2cc8..61cddc2b1d0f 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -817,7 +817,7 @@ static int hart_detect_features(struct sbi_scratch *scratch)
 		} else {						\
 			csr_write_allowed(__csr, &trap, __wrval);	\
 			if (!trap.cause) {				\
-				if (csr_swap(__csr, oldval) == __wrval)	\
+				if ((csr_swap(__csr, oldval) & __wrval) == __wrval)	\
 					(hfeatures->__field)++;		\
 				else					\
 					goto __skip;			\
-- 
2.37.3


