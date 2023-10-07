From: Inochi Amaoto <inochiama@outlook.com>
Date: Sat,  7 Oct 2023 10:57:26 +0800
Subject: [PATCH 1/3] lib: utils/timer: mtimer: add separate T-Head C9xx CLINT mtimer compatible
In-Reply-To: <IA1PR20MB49531BBE4BAA82B82316FFC1BBC8A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49531BBE4BAA82B82316FFC1BBC8A@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <IA1PR20MB4953CFE8E06B92EC9BC25E74BBC8A@IA1PR20MB4953.namprd20.prod.outlook.com>
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
 lib/utils/timer/fdt_timer_mtimer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
index 9eaa11d..0ac9aed 100644
--- a/lib/utils/timer/fdt_timer_mtimer.c
+++ b/lib/utils/timer/fdt_timer_mtimer.c
@@ -146,6 +146,8 @@ static const struct fdt_match timer_mtimer_match[] = {
 	{ .compatible = "riscv,clint0", .data = &sifive_clint_quirks },
 	{ .compatible = "sifive,clint0", .data = &sifive_clint_quirks },
 	{ .compatible = "thead,c900-clint", .data = &thead_clint_quirks },
+	{ .compatible = "thead,c900-aclint-mtimer",
+	  .data = &thead_clint_quirks },
 	{ .compatible = "riscv,aclint-mtimer" },
 	{ },
 };
-- 
2.42.0


