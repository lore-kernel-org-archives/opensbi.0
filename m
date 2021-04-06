From: Christoph Muellner <cmuellner@linux.com>
Date: Tue,  6 Apr 2021 03:53:53 +0200
Subject: [PATCH v3 2/3] spinlocks: Allow direct initialization via
 SPIN_LOCK_INIT()
In-Reply-To: <20210406015354.332780-1-cmuellner@linux.com>
References: <20210406015354.332780-1-cmuellner@linux.com>
Message-ID: <20210406015354.332780-3-cmuellner@linux.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The current implementation of SPIN_LOCK_INIT() provides the spinlock
to be initialized as reference. This does not allow a direct
initialization of the spinlock object at the creation site.

Let's pass the spinlock directly instead (like Linux does as well)
and adjust all users of the macro (in fact there is only one user).

Signed-off-by: Christoph Muellner <cmuellner@linux.com>
---
 include/sbi/riscv_locks.h | 2 +-
 lib/sbi/sbi_fifo.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sbi/riscv_locks.h b/include/sbi/riscv_locks.h
index 55da7c0..faa9676 100644
--- a/include/sbi/riscv_locks.h
+++ b/include/sbi/riscv_locks.h
@@ -16,7 +16,7 @@ typedef struct {
 
 #define __RISCV_SPIN_UNLOCKED 0
 
-#define SPIN_LOCK_INIT(_lptr) (_lptr)->lock = __RISCV_SPIN_UNLOCKED
+#define SPIN_LOCK_INIT(x) (x).lock = __RISCV_SPIN_UNLOCKED
 
 #define SPIN_LOCK_INITIALIZER                  \
 	{                                      \
diff --git a/lib/sbi/sbi_fifo.c b/lib/sbi/sbi_fifo.c
index 8d1dbf0..2a5c012 100644
--- a/lib/sbi/sbi_fifo.c
+++ b/lib/sbi/sbi_fifo.c
@@ -18,7 +18,7 @@ void sbi_fifo_init(struct sbi_fifo *fifo, void *queue_mem, u16 entries,
 	fifo->queue	  = queue_mem;
 	fifo->num_entries = entries;
 	fifo->entry_size  = entry_size;
-	SPIN_LOCK_INIT(&fifo->qlock);
+	SPIN_LOCK_INIT(fifo->qlock);
 	fifo->avail = fifo->tail = 0;
 	sbi_memset(fifo->queue, 0, (size_t)entries * entry_size);
 }
-- 
2.30.2


