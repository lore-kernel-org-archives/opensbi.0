From: Clément Léger <cleger@rivosinc.com>
Date: Tue,  9 Apr 2024 12:02:05 +0200
Subject: [PATCH 4/7] lib: sbi: sse: remove superfluous sbi_list_empty() check
In-Reply-To: <20240409100216.263256-1-cleger@rivosinc.com>
References: <20240409100216.263256-1-cleger@rivosinc.com>
Message-ID: <20240409100216.263256-5-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The list loop below that check is actually not looping if the list is
empty so there was no need for this check.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
Reported-by: Samuel Holland <samuel.holland@sifive.com>
---
 lib/sbi/sbi_sse.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index cd8a539..61d1f78 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -578,9 +578,6 @@ void sbi_sse_process_pending_events(struct sbi_trap_regs *regs)
 
 	spin_lock(&state->enabled_event_lock);
 
-	if (sbi_list_empty(&state->enabled_event_list))
-		goto out;
-
 	sbi_list_for_each_entry(e, &state->enabled_event_list, node) {
 		ret = sse_event_check_inject(e, regs);
 		if (ret)
-- 
2.43.0


