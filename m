From: Clément Léger <cleger@rivosinc.com>
Date: Fri, 18 Oct 2024 10:40:05 +0200
Subject: [PATCH v4 4/7] lib: sbi: send a double trap SSE event to supervisor
In-Reply-To: <20241018084010.406285-1-cleger@rivosinc.com>
References: <20241018084010.406285-1-cleger@rivosinc.com>
Message-ID: <20241018084010.406285-5-cleger@rivosinc.com>
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
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 include/sbi/sbi_ecall_interface.h | 1 +
 lib/sbi/sbi_double_trap.c         | 2 +-
 lib/sbi/sbi_sse.c                 | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index 2958b41..e4275b7 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -380,6 +380,7 @@ enum sbi_sse_state {
 
 /* SBI SSE Event IDs. */
 #define SBI_SSE_EVENT_LOCAL_RAS			0x00000000
+#define SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP		0x00000001
 #define SBI_SSE_EVENT_LOCAL_PLAT_0_START	0x00004000
 #define SBI_SSE_EVENT_LOCAL_PLAT_0_END		0x00007fff
 #define SBI_SSE_EVENT_GLOBAL_RAS		0x00008000
diff --git a/lib/sbi/sbi_double_trap.c b/lib/sbi/sbi_double_trap.c
index 96f2fa5..bab96fb 100644
--- a/lib/sbi/sbi_double_trap.c
+++ b/lib/sbi/sbi_double_trap.c
@@ -26,5 +26,5 @@ int sbi_double_trap_handler(struct sbi_trap_context *tcntx)
 	if (prev_virt)
 		return sbi_trap_redirect(regs, trap);
 
-	return SBI_ENOTSUPP;
+	return sbi_sse_inject_event(SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP);
 }
diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index ab03b9c..a2352a1 100644
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


