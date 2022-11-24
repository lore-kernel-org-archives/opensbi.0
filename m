From: Xiang W <wxjstz@126.com>
Date: Thu, 24 Nov 2022 11:04:41 +0800
Subject: [PATCH 3/3] lib: sbi: fix is_region_valid
In-Reply-To: <20221124030441.214213-1-wxjstz@126.com>
References: <20221124030441.214213-1-wxjstz@126.com>
Message-ID: <20221124030441.214213-4-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When order is equal to __riscv_xlen, the shift operation will not
perform any operation, which will cause
reg->base & (BIT(reg->order) - 1) to always be 0, and the condition
has not been established. This patch fixes this bug

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_domain.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index eba60f6..1acf76c 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -142,6 +142,9 @@ static bool is_region_valid(const struct sbi_domain_memregion *reg)
 	if (reg->order < 3 || __riscv_xlen < reg->order)
 		return FALSE;
 
+	if (reg->order == __riscv_xlen && reg->base != 0)
+		return FALSE;
+
 	if (reg->base & (BIT(reg->order) - 1))
 		return FALSE;
 
-- 
2.30.2


