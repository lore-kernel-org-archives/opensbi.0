From: Anup Patel <apatel@ventanamicro.com>
Date: Fri,  5 Jul 2024 12:45:03 +0530
Subject: [PATCH 5/6] include: sbi: Add macros to create FIFO as local or global variable
In-Reply-To: <20240705071504.50988-1-apatel@ventanamicro.com>
References: <20240705071504.50988-1-apatel@ventanamicro.com>
Message-ID: <20240705071504.50988-6-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The FIFO data structure is quite handy of variety of use-case so add
SBI_FIFO_INITIALIZER() and SBI_FIFO_DEFINE() helper macros to create
FIFO as local or global variable.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_fifo.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/sbi/sbi_fifo.h b/include/sbi/sbi_fifo.h
index af1632a..89a2ea2 100644
--- a/include/sbi/sbi_fifo.h
+++ b/include/sbi/sbi_fifo.h
@@ -23,6 +23,18 @@ struct sbi_fifo {
 	u16 tail;
 };
 
+#define SBI_FIFO_INITIALIZER(__queue_mem, __entries, __entry_size)	\
+{	.queue = __queue_mem,						\
+	.qlock = SPIN_LOCK_INITIALIZER,					\
+	.num_entries = __entries,					\
+	.entry_size = __entry_size,					\
+	.avail = 0,							\
+	.tail = 0,							\
+}
+
+#define SBI_FIFO_DEFINE(__name, __queue_mem, __entries, __entry_size)	\
+struct sbi_fifo __name = SBI_FIFO_INITIALIZER(__queue_mem, __entries, __entry_size)
+
 enum sbi_fifo_inplace_update_types {
 	SBI_FIFO_SKIP,
 	SBI_FIFO_UPDATED,
-- 
2.34.1


