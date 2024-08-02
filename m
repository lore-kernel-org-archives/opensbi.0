From: Clément Léger <cleger@rivosinc.com>
Date: Fri,  2 Aug 2024 16:52:54 +0200
Subject: [PATCH] lib: sse: remove unused sse_inject_out() parameter
Message-ID: <20240802145255.3232612-1-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This parameters was a remnant of a previous version, remove it now that
it is unused.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 lib/sbi/sbi_sse.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index fe36a64..52172fc 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -678,8 +678,7 @@ static int sse_ipi_inject_send(unsigned long hartid, uint32_t event_id)
 	return SBI_OK;
 }
 
-static int sse_inject_event(uint32_t event_id, unsigned long hartid,
-			    struct sbi_ecall_return *out)
+static int sse_inject_event(uint32_t event_id, unsigned long hartid)
 {
 	int ret;
 	struct sbi_sse_event *e;
@@ -812,15 +811,12 @@ int sbi_sse_inject_from_ecall(uint32_t event_id, unsigned long hartid,
 	if (!sbi_domain_is_assigned_hart(sbi_domain_thishart_ptr(), hartid))
 		return SBI_EINVAL;
 
-	return sse_inject_event(event_id, hartid, out);
+	return sse_inject_event(event_id, hartid);
 }
 
 int sbi_sse_inject_event(uint32_t event_id)
 {
-	/* We don't really care about return value here */
-	struct sbi_ecall_return out;
-
-	return sse_inject_event(event_id, current_hartid(), &out);
+	return sse_inject_event(event_id, current_hartid());
 }
 
 int sbi_sse_set_cb_ops(uint32_t event_id, const struct sbi_sse_cb_ops *cb_ops)
-- 
2.45.2


