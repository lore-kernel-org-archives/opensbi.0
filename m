From: Anup Patel <apatel@ventanamicro.com>
Date: Mon,  5 Jun 2023 17:07:32 +0530
Subject: [PATCH v2 01/18] include: sbi_scratch: Add helper macros to access data type
In-Reply-To: <20230605113749.230696-1-apatel@ventanamicro.com>
References: <20230605113749.230696-1-apatel@ventanamicro.com>
Message-ID: <20230605113749.230696-2-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Reading and writing a data type in scratch space is a very common
use-case so let us add related helper macros in sbi_scratch.h.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_scratch.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
index 2966188..58f2d06 100644
--- a/include/sbi/sbi_scratch.h
+++ b/include/sbi/sbi_scratch.h
@@ -174,6 +174,23 @@ void sbi_scratch_free_offset(unsigned long offset);
 #define sbi_scratch_thishart_offset_ptr(offset)	\
 	(void *)((char *)sbi_scratch_thishart_ptr() + (offset))
 
+/** Allocate offset for a data type in sbi_scratch */
+#define sbi_scratch_alloc_type_offset(__type)				\
+	sbi_scratch_alloc_offset(sizeof(__type))
+
+/** Read a data type from sbi_scratch at given offset */
+#define sbi_scratch_read_type(__scratch, __type, __offset)		\
+({									\
+	*((__type *)sbi_scratch_offset_ptr((__scratch), (__offset)));	\
+})
+
+/** Write a data type to sbi_scratch at given offset */
+#define sbi_scratch_write_type(__scratch, __type, __offset, __ptr)	\
+do {									\
+	*((__type *)sbi_scratch_offset_ptr((__scratch), (__offset)))	\
+					= (__type)(__ptr);		\
+} while (0)
+
 /** HART id to scratch table */
 extern struct sbi_scratch *hartid_to_scratch_table[];
 
-- 
2.34.1


