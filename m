From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 19 Nov 2024 11:34:39 -0800
Subject: [PATCH 5/5] include: sbi: Change spec version to 3.0
In-Reply-To: <20241119-pmu_event_info-v1-0-5f287a6f0135@rivosinc.com>
References: <20241119-pmu_event_info-v1-0-5f287a6f0135@rivosinc.com>
Message-ID: <20241119-pmu_event_info-v1-5-5f287a6f0135@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

SBI version 3.0 is on its way for ratification. Change the
spec version for easier testing of SBI v3.0 features.

Signed-off-by: Atish Patra <atishp@rivosinc.com>

---
This patch can be merged after SBI v3.0 is frozen.
---
---
 include/sbi/sbi_ecall.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sbi/sbi_ecall.h b/include/sbi/sbi_ecall.h
index 0b35eff76a19..eda7f14bf2af 100644
--- a/include/sbi/sbi_ecall.h
+++ b/include/sbi/sbi_ecall.h
@@ -13,7 +13,7 @@
 #include <sbi/sbi_types.h>
 #include <sbi/sbi_list.h>
 
-#define SBI_ECALL_VERSION_MAJOR		2
+#define SBI_ECALL_VERSION_MAJOR		3
 #define SBI_ECALL_VERSION_MINOR		0
 #define SBI_OPENSBI_IMPID		1
 

-- 
2.34.1


