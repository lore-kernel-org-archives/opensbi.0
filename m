From: Clément Léger <cleger@rivosinc.com>
Date: Tue, 25 Mar 2025 11:26:09 +0100
Subject: [PATCH v2 2/7] lib: sbi: sse: Remove printf from ssbi_sse_exit()
In-Reply-To: <20250325102615.1587953-1-cleger@rivosinc.com>
References: <20250325102615.1587953-1-cleger@rivosinc.com>
Message-ID: <20250325102615.1587953-3-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This printf is mainly useful for debugging, remove it.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 lib/sbi/sbi_sse.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index 39916d34..47166456 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -1268,8 +1268,6 @@ void sbi_sse_exit(struct sbi_scratch *scratch)
 			goto skip;
 
 		if (sse_event_state(e) > SBI_SSE_STATE_REGISTERED) {
-			sbi_printf("Event %d in invalid state at exit",
-				   info->event_id);
 			sse_event_set_state(e, SBI_SSE_STATE_UNUSED);
 		}
 
-- 
2.47.2


