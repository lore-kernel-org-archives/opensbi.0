From: Clément Léger <cleger@rivosinc.com>
Date: Thu, 13 Feb 2025 10:25:03 +0100
Subject: [PATCH] lib: sbi: sse: fix invalid errors returned for sse_hart_mask/unmask()
Message-ID: <20250213092507.735642-1-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When called twice, sse_hart_mask()/sse_hart_unmask() should return
SBI_EALREADY_STOPPED/SBI_EALREADY_STARTED. This was currently inverted.

Fixes: b919daf49582 ("lib: sbi: Add support to mask/unmask SSE events")
Reported-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 lib/sbi/sbi_sse.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index 9f22375f..2f9bdef8 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -882,7 +882,7 @@ int sbi_sse_hart_mask(void)
 		return SBI_EFAIL;
 
 	if (state->masked)
-		return SBI_EALREADY_STARTED;
+		return SBI_EALREADY_STOPPED;
 
 	state->masked = true;
 
@@ -897,7 +897,7 @@ int sbi_sse_hart_unmask(void)
 		return SBI_EFAIL;
 
 	if (!state->masked)
-		return SBI_EALREADY_STOPPED;
+		return SBI_EALREADY_STARTED;
 
 	state->masked = false;
 
-- 
2.47.2


