From: Anup Patel <anup.patel@wdc.com>
Date: Thu, 20 May 2021 21:29:11 +0530
Subject: [PATCH 1/2] lib: Check region base for merging in
 sbi_domain_root_add_memregion()
In-Reply-To: <20210520155912.1336836-1-anup.patel@wdc.com>
References: <20210520155912.1336836-1-anup.patel@wdc.com>
Message-ID: <20210520155912.1336836-2-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We can merge region B onto region A only if base of region A is
aligned to region A order + 1.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 lib/sbi/sbi_domain.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 84f30b9..3096af0 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -511,7 +511,8 @@ int sbi_domain_root_add_memregion(const struct sbi_domain_memregion *reg)
 			if (!nreg1->order)
 				continue;
 
-			if ((nreg->base + BIT(nreg->order)) == nreg1->base &&
+			if (!(nreg->base & (BIT(nreg->order + 1) - 1)) &&
+			    (nreg->base + BIT(nreg->order)) == nreg1->base &&
 			    nreg->order == nreg1->order &&
 			    nreg->flags == nreg1->flags) {
 				nreg->order++;
-- 
2.25.1


