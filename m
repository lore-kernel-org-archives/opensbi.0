From: Xiang W <wxjstz@126.com>
Date: Fri,  3 May 2024 21:53:37 +0800
Subject: [PATCH v3 5/6] lib: sbi: fix return type of sbi_dbtr_shmem_disabled
In-Reply-To: <20240503135340.310030-1-wxjstz@126.com>
References: <20240503135340.310030-1-wxjstz@126.com>
Message-ID: <20240503135340.310030-6-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Modify the return value of the sbi_dbtr_shmem_disabled function to
bool to make the semantics clearer.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_dbtr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index a95f087..6950378 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -55,18 +55,18 @@ static unsigned long hart_state_ptr_offset;
 #error "Undefined XLEN"
 #endif
 
-static inline int sbi_dbtr_shmem_disabled(void)
+static inline bool sbi_dbtr_shmem_disabled(void)
 {
 	struct sbi_dbtr_hart_triggers_state *hs = NULL;
 
 	hs = dbtr_get_hart_state_ptr(sbi_scratch_thishart_ptr());
 
 	if (!hs)
-		return 1;
+		return true;
 
 	return (hs->shmem.phys_lo == SBI_DBTR_SHMEM_INVALID_ADDR &&
 		hs->shmem.phys_hi == SBI_DBTR_SHMEM_INVALID_ADDR
-		? 1 : 0);
+		? true : false);
 }
 
 static inline void sbi_dbtr_disable_shmem(void)
-- 
2.43.0


