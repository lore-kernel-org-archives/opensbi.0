From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Mon, 3 Oct 2022 19:52:19 +0800
Subject: [PATCH v2 01/12] platform: andes/ae350: Remove enabling cache from an350_final_init
In-Reply-To: <20221003115230.10127-1-peterlin@andestech.com>
References: <20221003115230.10127-1-peterlin@andestech.com>
Message-ID: <20221003115230.10127-2-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Boot-time cache operations have been handled by U-boot SPL, so we
can drop duplicate code.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 platform/andes/ae350/platform.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/platform/andes/ae350/platform.c b/platform/andes/ae350/platform.c
index 6bd0a69..33f9c4c 100644
--- a/platform/andes/ae350/platform.c
+++ b/platform/andes/ae350/platform.c
@@ -34,25 +34,6 @@ static int ae350_final_init(bool cold_boot)
 {
 	void *fdt;
 
-	/* enable L1 cache */
-	uintptr_t mcache_ctl_val = csr_read(CSR_MCACHECTL);
-
-	if (!(mcache_ctl_val & V5_MCACHE_CTL_IC_EN))
-		mcache_ctl_val |= V5_MCACHE_CTL_IC_EN;
-	if (!(mcache_ctl_val & V5_MCACHE_CTL_DC_EN))
-		mcache_ctl_val |= V5_MCACHE_CTL_DC_EN;
-	if (!(mcache_ctl_val & V5_MCACHE_CTL_CCTL_SUEN))
-		mcache_ctl_val |= V5_MCACHE_CTL_CCTL_SUEN;
-	csr_write(CSR_MCACHECTL, mcache_ctl_val);
-
-	/* enable L2 cache */
-	uint32_t *l2c_ctl_base = (void *)AE350_L2C_ADDR + V5_L2C_CTL_OFFSET;
-	uint32_t l2c_ctl_val = *l2c_ctl_base;
-
-	if (!(l2c_ctl_val & V5_L2C_CTL_ENABLE_MASK))
-		l2c_ctl_val |= V5_L2C_CTL_ENABLE_MASK;
-	*l2c_ctl_base = l2c_ctl_val;
-
 	if (!cold_boot)
 		return 0;
 
-- 
2.34.1


