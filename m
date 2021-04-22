From: Anup Patel <anup.patel@wdc.com>
Date: Thu, 22 Apr 2021 17:18:58 +0530
Subject: [PATCH] lib: sbi: Fix sbi_domain_root_add_memregion() for merging
 memregions
Message-ID: <20210422114858.676105-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We should decrement root_memregs_count by one after merging two
memregions otherwise new memregion added after a merge will be
appended after last sentinel memregion of zero order.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 lib/sbi/sbi_domain.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 69a3795..1b2e6e3 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -521,6 +521,7 @@ int sbi_domain_root_add_memregion(const struct sbi_domain_memregion *reg)
 					nreg1++;
 				}
 				reg_merged = true;
+				root_memregs_count--;
 			}
 		}
 	} while (reg_merged);
-- 
2.25.1


