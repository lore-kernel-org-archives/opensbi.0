From: Xiang W <wxjstz@126.com>
Date: Mon, 21 Aug 2023 22:11:45 +0800
Subject: [PATCH] lib: sbi: improve the definition of SBI_IPI_EVENT_MAX
Message-ID: <20230821141145.23695-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The previous definition had the assumption that the machine word length
is equal to the word length of LONG. Remove this assumption and add a
static check to prevent errors in subsequent modifications.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi/sbi_ipi.h | 2 +-
 lib/sbi/sbi_ipi.c     | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/sbi/sbi_ipi.h b/include/sbi/sbi_ipi.h
index c64f422..6b5e260 100644
--- a/include/sbi/sbi_ipi.h
+++ b/include/sbi/sbi_ipi.h
@@ -14,7 +14,7 @@
 
 /* clang-format off */
 
-#define SBI_IPI_EVENT_MAX			__riscv_xlen
+#define SBI_IPI_EVENT_MAX			(8 * __SIZEOF_LONG__)
 
 /* clang-format on */
 
diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index ad09154..0d8edab 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -27,6 +27,11 @@ struct sbi_ipi_data {
 	unsigned long ipi_type;
 };
 
+_Static_assert(
+	8 * sizeof(((struct sbi_ipi_data*)0)->ipi_type) == SBI_IPI_EVENT_MAX,
+	"type of sbi_ipi_data.ipi_type has changed, please redefine SBI_IPI_EVENT_MAX"
+	);
+
 static unsigned long ipi_data_off;
 static const struct sbi_ipi_device *ipi_dev = NULL;
 static const struct sbi_ipi_event_ops *ipi_ops_array[SBI_IPI_EVENT_MAX];
-- 
2.40.1


