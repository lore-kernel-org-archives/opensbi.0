From: Samuel Holland <samuel.holland@sifive.com>
Date: Thu, 29 Aug 2024 13:08:10 -0700
Subject: [PATCH] lib: sbi: Fix writes to emulated 32-bit htimedelta CSR
Message-ID: <20240829200819.3657942-1-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Writes to the low half CSR should not affect the high half of the value.
Make this separation explicit by writing to the delta in memory as two
adjacent XLEN-sized values.

Fixes: 1e9f88889f8b ("lib: Emulate HTIMEDELTA CSR for platforms not having TIME CSR")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi/sbi_timer.h |  2 ++
 lib/sbi/sbi_timer.c     | 15 ++++++++-------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/include/sbi/sbi_timer.h b/include/sbi/sbi_timer.h
index ac48e2b8..ac2c7be5 100644
--- a/include/sbi/sbi_timer.h
+++ b/include/sbi/sbi_timer.h
@@ -78,8 +78,10 @@ u64 sbi_timer_get_delta(void);
 /** Set timer delta value for current HART */
 void sbi_timer_set_delta(ulong delta);
 
+#if __riscv_xlen == 32
 /** Set upper 32-bits of timer delta value for current HART */
 void sbi_timer_set_delta_upper(ulong delta_upper);
+#endif
 
 /** Start timer event for current HART */
 void sbi_timer_event_start(u64 next_event);
diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
index 7b618de1..32955183 100644
--- a/lib/sbi/sbi_timer.c
+++ b/lib/sbi/sbi_timer.c
@@ -114,20 +114,21 @@ u64 sbi_timer_get_delta(void)
 
 void sbi_timer_set_delta(ulong delta)
 {
-	u64 *time_delta = sbi_scratch_offset_ptr(sbi_scratch_thishart_ptr(),
-						 time_delta_off);
+	ulong *time_delta = sbi_scratch_offset_ptr(sbi_scratch_thishart_ptr(),
+						   time_delta_off);
 
-	*time_delta = (u64)delta;
+	*time_delta = delta;
 }
 
+#if __riscv_xlen == 32
 void sbi_timer_set_delta_upper(ulong delta_upper)
 {
-	u64 *time_delta = sbi_scratch_offset_ptr(sbi_scratch_thishart_ptr(),
-						 time_delta_off);
+	ulong *time_delta = sbi_scratch_offset_ptr(sbi_scratch_thishart_ptr(),
+						   time_delta_off);
 
-	*time_delta &= 0xffffffffULL;
-	*time_delta |= ((u64)delta_upper << 32);
+	*(time_delta + 1) = delta_upper;
 }
+#endif
 
 void sbi_timer_event_start(u64 next_event)
 {
-- 
2.45.1


