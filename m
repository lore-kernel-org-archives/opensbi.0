From: Clément Léger <cleger@rivosinc.com>
Date: Fri,  6 Dec 2024 21:59:56 +0100
Subject: [PATCH 2/3] lib: sbi: sse: Disable injection if callbacks are set
In-Reply-To: <20241206205958.1055770-1-cleger@rivosinc.com>
References: <20241206205958.1055770-1-cleger@rivosinc.com>
Message-ID: <20241206205958.1055770-3-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Once a 'driver' as registered callback for an event, disable event
injection for that event to avoid messing up with the driver.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 lib/sbi/sbi_sse.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index 5679c26f..f9340381 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -887,6 +887,9 @@ int sbi_sse_set_cb_ops(uint32_t event_id, const struct sbi_sse_cb_ops *cb_ops)
 		return SBI_EINVAL;
 
 	e->cb_ops = cb_ops;
+	/* Do not mess with events that are handled by drivers */
+	e->attrs.status &= ~BIT(SBI_SSE_ATTR_STATUS_INJECT_OFFSET);
+
 	sse_event_put(e);
 
 	return SBI_OK;
-- 
2.45.2


