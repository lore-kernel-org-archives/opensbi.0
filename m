From: Anup Patel <apatel@ventanamicro.com>
Date: Sun,  9 Jan 2022 20:50:35 +0530
Subject: [PATCH v2 1/2] lib: utils/ipi: Fix size check in
 aclint_mswi_cold_init()
In-Reply-To: <20220109152036.28666-1-apatel@ventanamicro.com>
References: <20220109152036.28666-1-apatel@ventanamicro.com>
Message-ID: <20220109152036.28666-2-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, the ACLINT MSWI size check is forcing size to be at least
0x4000. This is inappropriate check because most systems will never
utilize full 16KB for a single ACLINT MSWI device so instead we should
check that ACLINT MSWI size is enough for on the associated HARTs.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Dong Du <Dd_nirvana@sjtu.edu.cn>
---
 lib/utils/ipi/aclint_mswi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
index a3de2f5..832e223 100644
--- a/lib/utils/ipi/aclint_mswi.c
+++ b/lib/utils/ipi/aclint_mswi.c
@@ -74,7 +74,7 @@ int aclint_mswi_cold_init(struct aclint_mswi_data *mswi)
 
 	/* Sanity checks */
 	if (!mswi || (mswi->addr & (ACLINT_MSWI_ALIGN - 1)) ||
-	    (mswi->size < ACLINT_MSWI_SIZE) ||
+	    (mswi->size < (mswi->hart_count * sizeof(u32))) ||
 	    (mswi->first_hartid >= SBI_HARTMASK_MAX_BITS) ||
 	    (mswi->hart_count > ACLINT_MSWI_MAX_HARTS))
 		return SBI_EINVAL;
-- 
2.25.1


