From: Inochi Amaoto <inochiama@outlook.com>
Date: Tue, 10 Oct 2023 09:00:24 +0800
Subject: [PATCH v2 2/3] lib: sbi: add more restriction to domain region subset check
In-Reply-To: <IA1PR20MB49533A7AB5888E0117F7799BBBCDA@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49533A7AB5888E0117F7799BBBCDA@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <IA1PR20MB495351E19560D833EAC11BC8BBCDA@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

make is_region_subset() check the bound of the domain region, so it can
handle the domain region with the same base and length.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 lib/sbi/sbi_domain.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 283b598..2b9d16f 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -185,8 +185,8 @@ static bool is_region_subset(const struct sbi_domain_memregion *regA,
 	ulong regB_end = regB->base + (BIT(regB->order) - 1);
 
 	if ((regB_start <= regA_start) &&
-	    (regA_start < regB_end) &&
-	    (regB_start < regA_end) &&
+	    (regB_start <= regA_end) &&
+	    (regA_start <= regB_end) &&
 	    (regA_end <= regB_end))
 		return true;
 
-- 
2.42.0


