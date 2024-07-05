From: Anup Patel <apatel@ventanamicro.com>
Date: Fri,  5 Jul 2024 12:45:01 +0530
Subject: [PATCH 3/6] lib: sbi: Optimize fifo enqueue/dequeue for basic data types
In-Reply-To: <20240705071504.50988-1-apatel@ventanamicro.com>
References: <20240705071504.50988-1-apatel@ventanamicro.com>
Message-ID: <20240705071504.50988-4-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Don't use sbi_memcpy() for basic data types in fifo enqueue/dequeue
instead use direct type-cast and assignment.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/sbi/sbi_fifo.c | 43 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_fifo.c b/lib/sbi/sbi_fifo.c
index 72c6d39..9199a30 100644
--- a/lib/sbi/sbi_fifo.c
+++ b/lib/sbi/sbi_fifo.c
@@ -66,7 +66,26 @@ static inline void  __sbi_fifo_enqueue(struct sbi_fifo *fifo, void *data)
 	if (head >= fifo->num_entries)
 		head = head - fifo->num_entries;
 
-	sbi_memcpy((char *)fifo->queue + head * fifo->entry_size, data, fifo->entry_size);
+	switch (fifo->entry_size) {
+	case 1:
+		*(char *)(fifo->queue + head * fifo->entry_size) = *(char *)data;
+		break;
+	case 2:
+		*(u16 *)(fifo->queue + head * fifo->entry_size) = *(u16 *)data;
+		break;
+	case 4:
+		*(u32 *)(fifo->queue + head * fifo->entry_size) = *(u32 *)data;
+		break;
+#if __riscv_xlen > 32
+	case 8:
+		*(u64 *)(fifo->queue + head * fifo->entry_size) = *(u64 *)data;
+		break;
+#endif
+	default:
+		sbi_memcpy(fifo->queue + head * fifo->entry_size,
+			   data, fifo->entry_size);
+		break;
+	}
 
 	fifo->avail++;
 }
@@ -184,8 +203,26 @@ int sbi_fifo_dequeue(struct sbi_fifo *fifo, void *data)
 		return SBI_ENOENT;
 	}
 
-	sbi_memcpy(data, (char *)fifo->queue + (u32)fifo->tail * fifo->entry_size,
-	       fifo->entry_size);
+	switch (fifo->entry_size) {
+	case 1:
+		*(char *)data = *(char *)(fifo->queue + (u32)fifo->tail * fifo->entry_size);
+		break;
+	case 2:
+		*(u16 *)data = *(u16 *)(fifo->queue + (u32)fifo->tail * fifo->entry_size);
+		break;
+	case 4:
+		*(u32 *)data = *(u32 *)(fifo->queue + (u32)fifo->tail * fifo->entry_size);
+		break;
+#if __riscv_xlen > 32
+	case 8:
+		*(u64 *)data = *(u64 *)(fifo->queue + (u32)fifo->tail * fifo->entry_size);
+		break;
+#endif
+	default:
+		sbi_memcpy(data, fifo->queue + (u32)fifo->tail * fifo->entry_size,
+			   fifo->entry_size);
+		break;
+	}
 
 	fifo->avail--;
 	fifo->tail++;
-- 
2.34.1


