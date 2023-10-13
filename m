From: Inochi Amaoto <inochiama@outlook.com>
Date: Fri, 13 Oct 2023 14:47:00 +0800
Subject: [PATCH v2 2/3] lib: utils/timer: mtimer: add separate T-Head C9xx CLINT mtimer compatible
In-Reply-To: <IA1PR20MB49533BA0170E1F1A025EBF99BBD2A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49533BA0170E1F1A025EBF99BBD2A@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <IA1PR20MB4953AD97529FD723312F6C43BBD2A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

T-HEAD allows soc vendor to map the mtimer and mswi of C9xx clint on
different address, which may cause a misuse if use the same compatible
string, add a new timer compatible string to avoid this.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Link: https://lore.kernel.org/linux-riscv/6e48cbe5e60f9ada2fd1fe58e803e127f1a678e5.1696433229.git.unicorn_wang at outlook.com/
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 lib/utils/timer/fdt_timer_mtimer.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
index fb5917f..a873f1e 100644
--- a/lib/utils/timer/fdt_timer_mtimer.c
+++ b/lib/utils/timer/fdt_timer_mtimer.c
@@ -153,10 +153,16 @@ static const struct timer_mtimer_quirks thead_clint_quirks = {
 	.without_mtime  = true,
 };
 
+static const struct timer_mtimer_quirks thead_aclint_quirks = {
+	.has_64bit_mmio	= false,
+};
+
 static const struct fdt_match timer_mtimer_match[] = {
 	{ .compatible = "riscv,clint0", .data = &sifive_clint_quirks },
 	{ .compatible = "sifive,clint0", .data = &sifive_clint_quirks },
 	{ .compatible = "thead,c900-clint", .data = &thead_clint_quirks },
+	{ .compatible = "thead,c900-aclint-mtimer",
+	  .data = &thead_aclint_quirks },
 	{ .compatible = "riscv,aclint-mtimer" },
 	{ },
 };
-- 
2.42.0


