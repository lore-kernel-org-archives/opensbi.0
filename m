From: Inochi Amaoto <inochiama@outlook.com>
Date: Sat,  7 Oct 2023 10:57:27 +0800
Subject: [PATCH 2/3] lib: utils/ipi: mswi: add separate T-Head C9xx CLINT mswi compatible
In-Reply-To: <20231007025727.99904-1-inochiama@outlook.com>
References: <IA1PR20MB49531BBE4BAA82B82316FFC1BBC8A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20231007025727.99904-1-inochiama@outlook.com>
Message-ID: <IA1PR20MB4953857B6A80EA537CC4C0A7BBC8A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Like the mtimer of T-HEAD C9xx clint, the mswi also needs new compatible
string to avoid misuse.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Link: https://lore.kernel.org/linux-riscv/1f6b82a1864477a51db33d3f295889ff985b497b.1696433229.git.unicorn_wang at outlook.com/
---
 lib/utils/ipi/fdt_ipi_mswi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/utils/ipi/fdt_ipi_mswi.c b/lib/utils/ipi/fdt_ipi_mswi.c
index e3a6378..f4b2de4 100644
--- a/lib/utils/ipi/fdt_ipi_mswi.c
+++ b/lib/utils/ipi/fdt_ipi_mswi.c
@@ -56,6 +56,7 @@ static const struct fdt_match ipi_mswi_match[] = {
 	{ .compatible = "riscv,clint0", .data = &clint_offset },
 	{ .compatible = "sifive,clint0", .data = &clint_offset },
 	{ .compatible = "thead,c900-clint", .data = &clint_offset },
+	{ .compatible = "thead,c900-aclint-mswi", .data = &clint_offset },
 	{ .compatible = "riscv,aclint-mswi" },
 	{ },
 };
-- 
2.42.0


