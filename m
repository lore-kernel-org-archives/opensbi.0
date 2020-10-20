From: Anup Patel <anup.patel@wdc.com>
Date: Tue, 20 Oct 2020 15:09:19 +0530
Subject: [PATCH v4 05/16] include: sbi: Make hartmask pointer const in
 sbi_hartmask_test_hart()
In-Reply-To: <20201020093930.2551352-1-anup.patel@wdc.com>
References: <20201020093930.2551352-1-anup.patel@wdc.com>
Message-ID: <20201020093930.2551352-6-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The sbi_hartmask_test_hart() does not modify hartmask so the
hartmask pointer parameter should be declared const.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/sbi/sbi_hartmask.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sbi/sbi_hartmask.h b/include/sbi/sbi_hartmask.h
index 77e42cb..f1cef0c 100644
--- a/include/sbi/sbi_hartmask.h
+++ b/include/sbi/sbi_hartmask.h
@@ -67,7 +67,7 @@ static inline void sbi_hartmask_clear_hart(u32 h, struct sbi_hartmask *m)
  * @param h HART id to test
  * @param m the hartmask pointer
  */
-static inline int sbi_hartmask_test_hart(u32 h, struct sbi_hartmask *m)
+static inline int sbi_hartmask_test_hart(u32 h, const struct sbi_hartmask *m)
 {
 	if (h < SBI_HARTMASK_MAX_BITS)
 		return __test_bit(h, m->bits);
-- 
2.25.1


