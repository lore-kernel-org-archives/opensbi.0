From: Inochi Amaoto <inochiama@outlook.com>
Date: Thu, 12 Oct 2023 17:01:37 +0800
Subject: [PATCH 2/3] lib: utils/timer: mtimer: add separate T-Head C9xx CLINT mtimer compatible
In-Reply-To: <IA1PR20MB495316CD19B4976D3BF5AA8BBBD3A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495316CD19B4976D3BF5AA8BBBD3A@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <IA1PR20MB49536237AE535BE87D81558DBBD3A@IA1PR20MB4953.namprd20.prod.outlook.com>
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
---
 lib/utils/timer/fdt_timer_mtimer.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
index cd14f75..8c45fdf 100644
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


