From: Clément Léger <cleger@rivosinc.com>
Date: Tue,  9 Apr 2024 12:02:08 +0200
Subject: [PATCH 7/7] lib: sbi: sse: check handler entry to belong to supervisor mode
In-Reply-To: <20240409100216.263256-1-cleger@rivosinc.com>
References: <20240409100216.263256-1-cleger@rivosinc.com>
Message-ID: <20240409100216.263256-8-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When registering an SSE event, check for the handler_entry_pc to belong
to supervisor mode domain using sbi_domain_check_addr_range().

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
Reported-by: Samuel Holland <samuel.holland@sifive.com>
---
 lib/sbi/sbi_sse.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index 85137c2..8724f76 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -959,6 +959,12 @@ int sbi_sse_register(uint32_t event_id, unsigned long handler_entry_pc,
 	if (handler_entry_pc & 0x1)
 		return SBI_EINVAL;
 
+	if (!sbi_domain_check_addr_range(sbi_domain_thishart_ptr(),
+					 handler_entry_pc,
+					 sizeof(unsigned long), PRV_S,
+					 SBI_DOMAIN_EXECUTE))
+		return SBI_EINVALID_ADDR;
+
 	e = sse_event_get(event_id);
 	if (!e)
 		return SBI_EINVAL;
-- 
2.43.0


