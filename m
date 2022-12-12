From: Icenowy Zheng <uwu@icenowy.me>
Date: Mon, 12 Dec 2022 16:22:38 +0800
Subject: [PATCH v2 3/3] lib: utils/timer: mtimer: add T-Head C9xx CLINT compatible
In-Reply-To: <20221212082238.265281-1-uwu@icenowy.me>
References: <20221212082238.265281-1-uwu@icenowy.me>
Message-ID: <20221212082238.265281-4-uwu@icenowy.me>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

As we already added the quirk for lacking mtime register to MTIMER
driver, add T-Head C9xx CLINT compatible to it and wire the quirk.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
No changes in v2.

 lib/utils/timer/fdt_timer_mtimer.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
index a0adc70..5244f98 100644
--- a/lib/utils/timer/fdt_timer_mtimer.c
+++ b/lib/utils/timer/fdt_timer_mtimer.c
@@ -124,9 +124,15 @@ static const struct timer_mtimer_quirks sifive_clint_quirks = {
 	.has_64bit_mmio	= true,
 };
 
+static const struct timer_mtimer_quirks thead_clint_quirks = {
+	.mtime_offset	= CLINT_MTIMER_OFFSET,
+	.without_mtime  = true,
+};
+
 static const struct fdt_match timer_mtimer_match[] = {
 	{ .compatible = "riscv,clint0", .data = &sifive_clint_quirks },
 	{ .compatible = "sifive,clint0", .data = &sifive_clint_quirks },
+	{ .compatible = "thead,c900-clint", .data = &thead_clint_quirks },
 	{ .compatible = "riscv,aclint-mtimer" },
 	{ },
 };
-- 
2.38.1


