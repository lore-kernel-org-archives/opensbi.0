From: Anup Patel <anup.patel@wdc.com>
Date: Sun, 21 Feb 2021 14:23:20 +0530
Subject: [RFC PATCH 09/10] include: sbi: Upgrade SBI implementation version to
 v0.3
In-Reply-To: <20210221085321.180602-1-anup.patel@wdc.com>
References: <20210221085321.180602-1-anup.patel@wdc.com>
Message-ID: <20210221085321.180602-10-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The OpenSBI SBI implementation is now compliant with latest draft
SBI v0.3 specification so let's upgrade SBI implementation version.

This will also help HSM suspend function detection in S-mode because
HSM suspend function is only present when HSM extension is present
and SBI implementation version is 0.3 (or higher).

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 include/sbi/sbi_ecall.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sbi/sbi_ecall.h b/include/sbi/sbi_ecall.h
index d357085..63ef866 100644
--- a/include/sbi/sbi_ecall.h
+++ b/include/sbi/sbi_ecall.h
@@ -14,7 +14,7 @@
 #include <sbi/sbi_list.h>
 
 #define SBI_ECALL_VERSION_MAJOR		0
-#define SBI_ECALL_VERSION_MINOR		2
+#define SBI_ECALL_VERSION_MINOR		3
 #define SBI_OPENSBI_IMPID		1
 
 struct sbi_trap_regs;
-- 
2.25.1


