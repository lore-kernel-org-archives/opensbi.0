From: Adnan Rahman Chowdhury <adnan.chowdhury@sifive.com>
Date: Thu, 30 Jun 2022 10:46:35 +0100
Subject: [PATCH v2 1/1] lib: sbi_timer: Added a blocking wait function that waits until a certain condition is satisfied or timeout occurs
In-Reply-To: <20220630094635.389645-1-adnan.chowdhury@sifive.com>
References: <20220630094635.389645-1-adnan.chowdhury@sifive.com>
Message-ID: <20220630094635.389645-2-adnan.chowdhury@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Motivation: Suppose a peripheral needs to be configured to transmit
data. There is an SFR bit which indicates that the peripheral is ready
to transmit. The firmware should check the bit and will only transmit
data when the peripheral is ready. When the firmware starts polling the
SFR, the peripheral could be busy transmitting/receiving other data so
the firmware must wait till that completes. Assuming that there is no
other way, the firmware shouldn't wait indefinitely.

The function sbi_timer_waitms_until() will constantly check whether a
certain condition is satisfied, or timeout occurs. It can be used for
the cases when a timeout is required.

Signed-off-by: Adnan Rahman Chowdhury <adnan.chowdhury@sifive.com>
Reviewed-by: Xiang W <wxjstz@126.com>
---
 include/sbi/sbi_timer.h | 18 ++++++++++++++++++
 lib/sbi/sbi_timer.c     | 13 +++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/include/sbi/sbi_timer.h b/include/sbi/sbi_timer.h
index 63ef1af..ac48e2b 100644
--- a/include/sbi/sbi_timer.h
+++ b/include/sbi/sbi_timer.h
@@ -48,6 +48,24 @@ static inline void sbi_timer_udelay(ulong usecs)
 	sbi_timer_delay_loop(usecs, 1000000, NULL, NULL);
 }
 
+/**
+ * A blocking function that will wait until @p predicate returns true or
+ * @p timeout_ms milliseconds elapsed. @p arg will be passed as argument to
+ * @p predicate function.
+ *
+ * @param predicate Pointer to a function that returns true if certain
+ * condition is met. It shouldn't block the code execution.
+ * @param arg Argument to pass to @p predicate.
+ * @param timeout_ms Timeout value in milliseconds. The function will return
+ * false if @p timeout_ms time period elapsed but still @p predicate doesn't
+ * return true.
+ *
+ * @return true if @p predicate returns true within @p timeout_ms, false
+ * otherwise.
+ */
+bool sbi_timer_waitms_until(bool (*predicate)(void *), void *arg,
+			    uint64_t timeout_ms);
+
 /** Get timer value for current HART */
 u64 sbi_timer_value(void);
 
diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
index acdba92..649a4e6 100644
--- a/lib/sbi/sbi_timer.c
+++ b/lib/sbi/sbi_timer.c
@@ -81,6 +81,19 @@ void sbi_timer_delay_loop(ulong units, u64 unit_freq,
 		delay_fn(opaque);
 }
 
+bool sbi_timer_waitms_until(bool (*predicate)(void *), void *arg,
+			    uint64_t timeout_ms)
+{
+	uint64_t start_time = sbi_timer_value();
+	uint64_t ticks =
+		(sbi_timer_get_device()->timer_freq / 1000) *
+		timeout_ms;
+	while(!predicate(arg))
+		if (sbi_timer_value() - start_time  >= ticks)
+			return false;
+	return true;
+}
+
 u64 sbi_timer_value(void)
 {
 	if (get_time_val)
-- 
2.30.2


