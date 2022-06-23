From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 23 Jun 2022 21:01:35 +0530
Subject: [PATCH] include: sbi: Change spec version to 1.0
Message-ID: <20220623153135.209272-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now that SBI v1.0 specification is ratified, we change spec verion
implemented by OpenSBI to v1.0.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_ecall.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sbi/sbi_ecall.h b/include/sbi/sbi_ecall.h
index 9500d04..046a56a 100644
--- a/include/sbi/sbi_ecall.h
+++ b/include/sbi/sbi_ecall.h
@@ -13,8 +13,8 @@
 #include <sbi/sbi_types.h>
 #include <sbi/sbi_list.h>
 
-#define SBI_ECALL_VERSION_MAJOR		0
-#define SBI_ECALL_VERSION_MINOR		3
+#define SBI_ECALL_VERSION_MAJOR		1
+#define SBI_ECALL_VERSION_MINOR		0
 #define SBI_OPENSBI_IMPID		1
 
 struct sbi_trap_regs;
-- 
2.34.1


