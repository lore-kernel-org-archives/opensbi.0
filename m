From: Clément Léger <cleger@rivosinc.com>
Date: Mon, 25 Nov 2024 11:52:59 +0100
Subject: [PATCH 1/2] lib: sbi: fix GLOBAL_PLAT_DEFINE
In-Reply-To: <20241125105303.1113607-1-cleger@rivosinc.com>
References: <20241125105303.1113607-1-cleger@rivosinc.com>
Message-ID: <20241125105303.1113607-2-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix GLOBAL_PLAT_0_START/END definitions. The specification states that
the beginning of the range is 0xc000 and the end is 0xffff.

Reported-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 include/sbi/sbi_ecall_interface.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index 3aa5746..7e14d6c 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -386,8 +386,8 @@ enum sbi_sse_state {
 #define SBI_SSE_EVENT_LOCAL_PLAT_0_START	0x00004000
 #define SBI_SSE_EVENT_LOCAL_PLAT_0_END		0x00007fff
 #define SBI_SSE_EVENT_GLOBAL_RAS		0x00008000
-#define SBI_SSE_EVENT_GLOBAL_PLAT_0_START	0x00004000
-#define SBI_SSE_EVENT_GLOBAL_PLAT_0_END		0x00007fff
+#define SBI_SSE_EVENT_GLOBAL_PLAT_0_START	0x0000c000
+#define SBI_SSE_EVENT_GLOBAL_PLAT_0_END		0x0000ffff
 
 #define SBI_SSE_EVENT_LOCAL_PMU			0x00010000
 #define SBI_SSE_EVENT_LOCAL_PLAT_1_START	0x00014000
-- 
2.45.2


