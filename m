From: Samuel Holland <samuel@sholland.org>
Date: Sun, 29 May 2022 12:00:48 -0500
Subject: [PATCH] lib: sbi_timer: Drop unnecessary get_platform_ticks wrapper
Message-ID: <20220529170048.60646-1-samuel@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The device's timer_value callback is already the right prototype to use
for the get_time_val function pointer.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 lib/sbi/sbi_timer.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
index 353886f..b0a6e63 100644
--- a/lib/sbi/sbi_timer.c
+++ b/lib/sbi/sbi_timer.c
@@ -44,11 +44,6 @@ static u64 get_ticks(void)
 }
 #endif
 
-static u64 get_platform_ticks(void)
-{
-	return timer_dev->timer_value();
-}
-
 static void nop_delay_fn(void *opaque)
 {
 	cpu_relax();
@@ -167,7 +162,7 @@ void sbi_timer_set_device(const struct sbi_timer_device *dev)
 
 	timer_dev = dev;
 	if (!get_time_val && timer_dev->timer_value)
-		get_time_val = get_platform_ticks;
+		get_time_val = timer_dev->timer_value;
 }
 
 int sbi_timer_init(struct sbi_scratch *scratch, bool cold_boot)
-- 
2.35.1


