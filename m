From: Icenowy Zheng <uwu@icenowy.me>
Date: Mon, 12 Dec 2022 16:22:36 +0800
Subject: [PATCH v2 1/3] lib: utils/ipi: mswi: add T-Head C9xx CLINT compatible
In-Reply-To: <20221212082238.265281-1-uwu@icenowy.me>
References: <20221212082238.265281-1-uwu@icenowy.me>
Message-ID: <20221212082238.265281-2-uwu@icenowy.me>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Althoug the MTIMER part of a C9xx CLINT differs from a SiFive one, the
MSWI part is compliant.

Add T-Head C9xx CLINT compatible string to fdt_ipi_mswi code, sharing
the same codepath with SiFive CLINT.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
Changes in v2:
- Added Anup's reviewed tag.

 lib/utils/ipi/fdt_ipi_mswi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/utils/ipi/fdt_ipi_mswi.c b/lib/utils/ipi/fdt_ipi_mswi.c
index 0176941..4dc91f2 100644
--- a/lib/utils/ipi/fdt_ipi_mswi.c
+++ b/lib/utils/ipi/fdt_ipi_mswi.c
@@ -56,6 +56,7 @@ static const unsigned long clint_offset = CLINT_MSWI_OFFSET;
 static const struct fdt_match ipi_mswi_match[] = {
 	{ .compatible = "riscv,clint0", .data = &clint_offset },
 	{ .compatible = "sifive,clint0", .data = &clint_offset },
+	{ .compatible = "thead,c900-clint", .data = &clint_offset },
 	{ .compatible = "riscv,aclint-mswi" },
 	{ },
 };
-- 
2.38.1


