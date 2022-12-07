From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Wed,  7 Dec 2022 15:07:49 +0100
Subject: [PATCH 1/3] lib: fix is_region_valid()
In-Reply-To: <20221207140751.9135-1-heinrich.schuchardt@canonical.com>
References: <20221207140751.9135-1-heinrich.schuchardt@canonical.com>
Message-ID: <20221207140751.9135-2-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For 'reg->order == __riscv_xlen' the term 'BIT(reg->order)' is undefined.

Addresses-Coverity-ID: 1529706 ("Bad bit shift operation")
Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 lib/sbi/sbi_domain.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 3302213..52ae1a1 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -146,11 +146,12 @@ static bool is_region_valid(const struct sbi_domain_memregion *reg)
 	if (reg->order < 3 || __riscv_xlen < reg->order)
 		return FALSE;
 
-	if (reg->order == __riscv_xlen && reg->base != 0)
-		return FALSE;
-
-	if (reg->base & (BIT(reg->order) - 1))
+	if (reg->order == __riscv_xlen) {
+		if (reg->base != 0)
+			return FALSE;
+	} else if (reg->base & (BIT(reg->order) - 1)) {
 		return FALSE;
+	}
 
 	return TRUE;
 }
-- 
2.37.2


