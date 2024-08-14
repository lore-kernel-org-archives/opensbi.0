From: Zhang Runmin <runmin.zhang@ingenic.com>
Date: Wed, 14 Aug 2024 11:17:49 +0800
Subject: [PATCH] lib: sbi: dbtr: Delete redundant `ulong`
Message-ID: <20240814031749.2741251-1-runmin.zhang@ingenic.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Zhang RunMin <runmin.zhang@ingenic.com>

In `csr_read_allowed` and `csr_write_allowed` macros, has already
converted second param to `ulong`.
---
 lib/sbi/sbi_dbtr.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 27a8b91..60c37b4 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -167,11 +167,12 @@ int sbi_dbtr_init(struct sbi_scratch *scratch, bool coldboot)
 		goto _probed;
 
 	for (i = 0; i < RV_MAX_TRIGGERS; i++) {
-		csr_write_allowed(CSR_TSELECT, (ulong)&trap, i);
+		// CSR_TESLECT 0x7a0
+		csr_write_allowed(CSR_TSELECT, &trap, i);
 		if (trap.cause)
 			break;
 
-		val = csr_read_allowed(CSR_TSELECT, (ulong)&trap);
+		val = csr_read_allowed(CSR_TSELECT, &trap);
 		if (trap.cause)
 			break;
 
@@ -182,7 +183,7 @@ int sbi_dbtr_init(struct sbi_scratch *scratch, bool coldboot)
 		if (val != i)
 			break;
 
-		val = csr_read_allowed(CSR_TINFO, (ulong)&trap);
+		val = csr_read_allowed(CSR_TINFO, &trap);
 		if (trap.cause) {
 			/*
 			 * If reading tinfo caused an exception, the
@@ -190,7 +191,7 @@ int sbi_dbtr_init(struct sbi_scratch *scratch, bool coldboot)
 			 * type.
 			 */
 			tdata1 = csr_read_allowed(CSR_TDATA1,
-						  (ulong)&trap);
+						  &trap);
 			if (trap.cause)
 				break;
 
-- 
2.25.1


