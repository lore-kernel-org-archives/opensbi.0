From: Clément Léger <cleger@rivosinc.com>
Date: Fri, 13 Sep 2024 16:34:01 +0200
Subject: [PATCH v2 3/6] lib: sbi: send a double trap SSE event to supervisor
In-Reply-To: <20240913143419.3258868-1-cleger@rivosinc.com>
References: <20240913143419.3258868-1-cleger@rivosinc.com>
Message-ID: <20240913143419.3258868-4-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In case the double trap handler is called and the double trap happened
in supervisor mode, send a double trap SSE event.

NOTE: this commit depends on the ratification of the new SSE event
id for double trap [1].

Link: https://lists.riscv.org/g/tech-prs/message/985 [1]
Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 include/sbi/sbi_ecall_interface.h | 1 +
 lib/sbi/sbi_double_trap.c         | 2 +-
 lib/sbi/sbi_sse.c                 | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index e9a8167..5428fba 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -379,6 +379,7 @@ enum sbi_sse_state {
 
 /* SBI SSE Event IDs. */
 #define SBI_SSE_EVENT_LOCAL_RAS			0x00000000
+#define SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP		0x00000001
 #define SBI_SSE_EVENT_LOCAL_PLAT_0_START	0x00004000
 #define SBI_SSE_EVENT_LOCAL_PLAT_0_END		0x00007fff
 #define SBI_SSE_EVENT_GLOBAL_RAS		0x00008000
diff --git a/lib/sbi/sbi_double_trap.c b/lib/sbi/sbi_double_trap.c
index b961645..60ea0b1 100644
--- a/lib/sbi/sbi_double_trap.c
+++ b/lib/sbi/sbi_double_trap.c
@@ -23,5 +23,5 @@ int sbi_double_trap_handler(struct sbi_trap_context *tcntx)
 	if (prev_virt)
 		return sbi_trap_redirect(regs, trap);
 
-	return SBI_ENOTSUPP;
+	return sbi_sse_inject_event(SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP);
 }
diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index 52172fc..b5f076a 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -41,6 +41,7 @@
 
 static const uint32_t supported_events[] = {
 	SBI_SSE_EVENT_LOCAL_RAS,
+	SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP,
 	SBI_SSE_EVENT_GLOBAL_RAS,
 	SBI_SSE_EVENT_LOCAL_PMU,
 	SBI_SSE_EVENT_LOCAL_SOFTWARE,
-- 
2.45.2


