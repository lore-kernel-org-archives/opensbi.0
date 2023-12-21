From: Xiang W <wxjstz@126.com>
Date: Thu, 21 Dec 2023 09:44:27 +0800
Subject: [PATCH] lib: sbi: Fix shift bug in sbi_system_reset
Message-ID: <20231221014432.393824-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There is a problem with judging whether the current hart belongs to
hmask. If cur_hartid minus hbase is greater than BITS_PER_LONG, the
previous hmask will also have a bit cleared incorrectly, which will
cause some harts to lose ipi.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_system.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_system.c b/lib/sbi/sbi_system.c
index d1fa349..e930272 100644
--- a/lib/sbi/sbi_system.c
+++ b/lib/sbi/sbi_system.c
@@ -72,7 +72,8 @@ void __noreturn sbi_system_reset(u32 reset_type, u32 reset_reason)
 
 	/* Send HALT IPI to every hart other than the current hart */
 	while (!sbi_hsm_hart_interruptible_mask(dom, hbase, &hmask)) {
-		if (hbase <= cur_hartid)
+		if ((hbase <= cur_hartid)
+			  && (cur_hartid < hbase + BITS_PER_LONG))
 			hmask &= ~(1UL << (cur_hartid - hbase));
 		if (hmask)
 			sbi_ipi_send_halt(hmask, hbase);
-- 
2.43.0


