From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Thu,  8 Dec 2022 02:14:19 +0100
Subject: [PATCH v2 1/3] lib: fix is_region_valid()
In-Reply-To: <20221208011421.11624-1-heinrich.schuchardt@canonical.com>
References: <20221208011421.11624-1-heinrich.schuchardt@canonical.com>
Message-ID: <20221208011421.11624-2-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For 'reg->order == __riscv_xlen' the term 'BIT(reg->order)' is undefined.

Addresses-Coverity-ID: 1529706 ("Bad bit shift operation")
Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
v2:
	Make the logical constraint a bit easier to read.
---
 lib/sbi/sbi_domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 3302213..3205595 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -149,7 +149,7 @@ static bool is_region_valid(const struct sbi_domain_memregion *reg)
 	if (reg->order == __riscv_xlen && reg->base != 0)
 		return FALSE;
 
-	if (reg->base & (BIT(reg->order) - 1))
+	if (reg->order < __riscv_xlen && (reg->base & (BIT(reg->order) - 1)))
 		return FALSE;
 
 	return TRUE;
-- 
2.37.2


