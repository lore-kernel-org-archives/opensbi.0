From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 27 Mar 2021 13:05:25 +0800
Subject: [PATCH 1/3] lib/utils: Support the official clint DT bindings
Message-ID: <20210327050527.15955-1-bmeng.cn@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Linux kernel commit a2770b57d083 ("dt-bindings: timer: Add CLINT bindings")
adds the official DT bindings for CLINT, which uses "sifive,clint0"
as the compatible string. "riscv,clint0" is now legacy and has to
be kept for backward compatibility of legacy systems.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 lib/utils/ipi/fdt_ipi_clint.c     | 1 +
 lib/utils/timer/fdt_timer_clint.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/lib/utils/ipi/fdt_ipi_clint.c b/lib/utils/ipi/fdt_ipi_clint.c
index e992440..e799fd7 100644
--- a/lib/utils/ipi/fdt_ipi_clint.c
+++ b/lib/utils/ipi/fdt_ipi_clint.c
@@ -36,6 +36,7 @@ static int ipi_clint_cold_init(void *fdt, int nodeoff,
 
 static const struct fdt_match ipi_clint_match[] = {
 	{ .compatible = "riscv,clint0" },
+	{ .compatible = "sifive,clint0" },
 	{ },
 };
 
diff --git a/lib/utils/timer/fdt_timer_clint.c b/lib/utils/timer/fdt_timer_clint.c
index fe66708..6ba6c7b 100644
--- a/lib/utils/timer/fdt_timer_clint.c
+++ b/lib/utils/timer/fdt_timer_clint.c
@@ -38,6 +38,7 @@ static int timer_clint_cold_init(void *fdt, int nodeoff,
 
 static const struct fdt_match timer_clint_match[] = {
 	{ .compatible = "riscv,clint0" },
+	{ .compatible = "sifive,clint0" },
 	{ },
 };
 
-- 
2.25.1


