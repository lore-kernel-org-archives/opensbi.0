From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 10 Oct 2023 15:51:25 +0530
Subject: [PATCH] include: sbi: Change spec version to 2.0
Message-ID: <20231010102125.603343-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now that SBI v2.0 specification is frozen, we change spec verion
implemented by OpenSBI to v2.0.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_ecall.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sbi/sbi_ecall.h b/include/sbi/sbi_ecall.h
index 90f33ba..027213c 100644
--- a/include/sbi/sbi_ecall.h
+++ b/include/sbi/sbi_ecall.h
@@ -13,7 +13,7 @@
 #include <sbi/sbi_types.h>
 #include <sbi/sbi_list.h>
 
-#define SBI_ECALL_VERSION_MAJOR		1
+#define SBI_ECALL_VERSION_MAJOR		2
 #define SBI_ECALL_VERSION_MINOR		0
 #define SBI_OPENSBI_IMPID		1
 
-- 
2.34.1


