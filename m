From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 25 Apr 2023 18:02:21 +0530
Subject: [PATCH 08/17] lib: utils/i2c: Use heap in DesignWare and SiFive I2C drivers
In-Reply-To: <20230425123230.3943447-1-apatel@ventanamicro.com>
References: <20230425123230.3943447-1-apatel@ventanamicro.com>
Message-ID: <20230425123230.3943447-9-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Let's use heap allocation in DesignWare and SiFive I2C drivers
instead of using a fixed size global array.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/utils/i2c/fdt_i2c_dw.c     | 24 ++++++++++--------------
 lib/utils/i2c/fdt_i2c_sifive.c | 23 ++++++++++-------------
 2 files changed, 20 insertions(+), 27 deletions(-)

diff --git a/lib/utils/i2c/fdt_i2c_dw.c b/lib/utils/i2c/fdt_i2c_dw.c
index 71062f4..99b2ddb 100644
--- a/lib/utils/i2c/fdt_i2c_dw.c
+++ b/lib/utils/i2c/fdt_i2c_dw.c
@@ -9,17 +9,12 @@
 
 #include <sbi/riscv_io.h>
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_heap.h>
 #include <sbi/sbi_string.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/i2c/dw_i2c.h>
 #include <sbi_utils/i2c/fdt_i2c.h>
 
-#define FDT_DW_I2C_ADAPTER_MAX	7
-
-static unsigned int fdt_dw_i2c_adapter_count;
-static struct dw_i2c_adapter
-	fdt_dw_i2c_adapter_array[FDT_DW_I2C_ADAPTER_MAX];
-
 extern struct fdt_i2c_adapter fdt_i2c_adapter_dw;
 
 static int fdt_dw_i2c_init(void *fdt, int nodeoff,
@@ -29,23 +24,24 @@ static int fdt_dw_i2c_init(void *fdt, int nodeoff,
 	struct dw_i2c_adapter *adapter;
 	u64 addr;
 
-	if (fdt_dw_i2c_adapter_count >= FDT_DW_I2C_ADAPTER_MAX)
-		return SBI_ENOSPC;
-
-	adapter = &fdt_dw_i2c_adapter_array[fdt_dw_i2c_adapter_count];
+	adapter = sbi_zalloc(sizeof(*adapter));
+	if (!adapter)
+		return SBI_ENOMEM;
 
 	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &addr, NULL);
-	if (rc)
+	if (rc) {
+		sbi_free(adapter);
 		return rc;
+	}
 
 	adapter->addr = addr;
 	adapter->adapter.driver = &fdt_i2c_adapter_dw;
 
 	rc = dw_i2c_init(&adapter->adapter, nodeoff);
-	if (rc)
+	if (rc) {
+		sbi_free(adapter);
 		return rc;
-
-	fdt_dw_i2c_adapter_count++;
+	}
 
 	return 0;
 }
diff --git a/lib/utils/i2c/fdt_i2c_sifive.c b/lib/utils/i2c/fdt_i2c_sifive.c
index 195541c..b85b245 100644
--- a/lib/utils/i2c/fdt_i2c_sifive.c
+++ b/lib/utils/i2c/fdt_i2c_sifive.c
@@ -9,12 +9,11 @@
 
 #include <sbi/riscv_io.h>
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_heap.h>
 #include <sbi/sbi_timer.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/i2c/fdt_i2c.h>
 
-#define SIFIVE_I2C_ADAPTER_MAX	2
-
 #define SIFIVE_I2C_PRELO	0x00
 #define SIFIVE_I2C_PREHI	0x04
 #define SIFIVE_I2C_CTR		0x08
@@ -47,10 +46,6 @@ struct sifive_i2c_adapter {
 	struct i2c_adapter adapter;
 };
 
-static unsigned int sifive_i2c_adapter_count;
-static struct sifive_i2c_adapter
-	sifive_i2c_adapter_array[SIFIVE_I2C_ADAPTER_MAX];
-
 extern struct fdt_i2c_adapter fdt_i2c_adapter_sifive;
 
 static inline void sifive_i2c_setreg(struct sifive_i2c_adapter *adap,
@@ -244,14 +239,15 @@ static int sifive_i2c_init(void *fdt, int nodeoff,
 	struct sifive_i2c_adapter *adapter;
 	uint64_t addr;
 
-	if (sifive_i2c_adapter_count >= SIFIVE_I2C_ADAPTER_MAX)
-		return SBI_ENOSPC;
-
-	adapter = &sifive_i2c_adapter_array[sifive_i2c_adapter_count];
+	adapter = sbi_zalloc(sizeof(*adapter));
+	if (!adapter)
+		return SBI_ENOMEM;
 
 	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &addr, NULL);
-	if (rc)
+	if (rc) {
+		sbi_free(adapter);
 		return rc;
+	}
 
 	adapter->addr = addr;
 	adapter->adapter.driver = &fdt_i2c_adapter_sifive;
@@ -259,10 +255,11 @@ static int sifive_i2c_init(void *fdt, int nodeoff,
 	adapter->adapter.write = sifive_i2c_adapter_write;
 	adapter->adapter.read = sifive_i2c_adapter_read;
 	rc = i2c_adapter_add(&adapter->adapter);
-	if (rc)
+	if (rc) {
+		sbi_free(adapter);
 		return rc;
+	}
 
-	sifive_i2c_adapter_count++;
 	return 0;
 }
 
-- 
2.34.1


