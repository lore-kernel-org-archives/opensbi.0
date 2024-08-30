From: Samuel Holland <samuel.holland@sifive.com>
Date: Fri, 30 Aug 2024 08:49:09 -0700
Subject: [PATCH 05/12] lib: utils/irqchip: Look up IMSIC data by hart index
In-Reply-To: <20240830154929.3971790-1-samuel.holland@sifive.com>
References: <20240830154929.3971790-1-samuel.holland@sifive.com>
Message-ID: <20240830154929.3971790-6-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This avoids needing to map a hartid to a hart index.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi_utils/irqchip/imsic.h |  4 ++--
 lib/utils/irqchip/imsic.c         | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/sbi_utils/irqchip/imsic.h b/include/sbi_utils/irqchip/imsic.h
index e295771e..bc9292d3 100644
--- a/include/sbi_utils/irqchip/imsic.h
+++ b/include/sbi_utils/irqchip/imsic.h
@@ -37,9 +37,9 @@ struct imsic_data {
 
 int imsic_map_hartid_to_data(u32 hartid, struct imsic_data *imsic, int file);
 
-struct imsic_data *imsic_get_data(u32 hartid);
+struct imsic_data *imsic_get_data(u32 hartindex);
 
-int imsic_get_target_file(u32 hartid);
+int imsic_get_target_file(u32 hartindex);
 
 void imsic_local_irqchip_init(void);
 
diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index bac72d21..ee532bb4 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -119,28 +119,28 @@ int imsic_map_hartid_to_data(u32 hartid, struct imsic_data *imsic, int file)
 	return 0;
 }
 
-struct imsic_data *imsic_get_data(u32 hartid)
+struct imsic_data *imsic_get_data(u32 hartindex)
 {
 	struct sbi_scratch *scratch;
 
 	if (!imsic_ptr_offset)
 		return NULL;
 
-	scratch = sbi_hartid_to_scratch(hartid);
+	scratch = sbi_hartindex_to_scratch(hartindex);
 	if (!scratch)
 		return NULL;
 
 	return imsic_get_hart_data_ptr(scratch);
 }
 
-int imsic_get_target_file(u32 hartid)
+int imsic_get_target_file(u32 hartindex)
 {
 	struct sbi_scratch *scratch;
 
 	if (!imsic_file_offset)
 		return SBI_ENOENT;
 
-	scratch = sbi_hartid_to_scratch(hartid);
+	scratch = sbi_hartindex_to_scratch(hartindex);
 	if (!scratch)
 		return SBI_ENOENT;
 
@@ -257,7 +257,7 @@ void imsic_local_irqchip_init(void)
 
 int imsic_warm_irqchip_init(void)
 {
-	struct imsic_data *imsic = imsic_get_data(current_hartid());
+	struct imsic_data *imsic = imsic_get_data(current_hartindex());
 
 	/* Sanity checks */
 	if (!imsic || !imsic->targets_mmode)
-- 
2.45.1


