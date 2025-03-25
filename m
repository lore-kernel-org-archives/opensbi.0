From: Clément Léger <cleger@rivosinc.com>
Date: Tue, 25 Mar 2025 11:26:12 +0100
Subject: [PATCH v2 5/7] lib: sbi: sse: Remove superfluous parenthesis around MSTATUS_* values
In-Reply-To: <20250325102615.1587953-1-cleger@rivosinc.com>
References: <20250325102615.1587953-1-cleger@rivosinc.com>
Message-ID: <20250325102615.1587953-6-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For some reason, there was a pair of useless parenthesis around MSTATUS_*
value usage. Remove them.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 lib/sbi/sbi_sse.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index 330a5476..ac07e68a 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -518,9 +518,9 @@ static unsigned long sse_interrupted_flags(unsigned long mstatus)
 {
 	unsigned long hstatus, flags = 0;
 
-	if (mstatus & (MSTATUS_SPIE))
+	if (mstatus & MSTATUS_SPIE)
 		flags |= SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPIE;
-	if (mstatus & (MSTATUS_SPP))
+	if (mstatus & MSTATUS_SPP)
 		flags |= SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPP;
 
 	if (misa_extension('H')) {
-- 
2.47.2


