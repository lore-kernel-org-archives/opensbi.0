From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 29 Nov 2024 21:20:36 +0530
Subject: [PATCH v2 01/17] lib: Increase ROOT_REGION_MAX to accomodate more memregions
In-Reply-To: <20241129155052.2866712-1-apatel@ventanamicro.com>
References: <20241129155052.2866712-1-apatel@ventanamicro.com>
Message-ID: <20241129155052.2866712-2-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Rahul Pathak <rpathak@ventanamicro.com>

As more drivers adding memregions into root domain, the current static limit
of ROOT_REGION_MAX is not sufficient. Increase the limit to accomodate more
memregions.

Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/sbi/sbi_domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 7fdcf9d3..1cf7e2d8 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -24,7 +24,7 @@ SBI_LIST_HEAD(domain_list);
 static u32 domain_count = 0;
 static bool domain_finalized = false;
 
-#define ROOT_REGION_MAX	16
+#define ROOT_REGION_MAX	32
 static u32 root_memregs_count = 0;
 
 struct sbi_domain root = {
-- 
2.43.0


