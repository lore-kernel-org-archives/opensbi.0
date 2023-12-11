From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 11 Dec 2023 23:37:35 +0530
Subject: [PATCH 2/5] platform: generic: Fine tune fw_platform_calculate_heap_size()
In-Reply-To: <20231211180738.891727-1-apatel@ventanamicro.com>
References: <20231211180738.891727-1-apatel@ventanamicro.com>
Message-ID: <20231211180738.891727-3-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Let's use SBI_TLB_INFO_SIZE instead of hard-coded 0x40 in
fw_platform_calculate_heap_size() to fine tune the heap size
required for per-hart TLB fifos.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 platform/generic/platform.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 08ae92a..8507227 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -16,6 +16,7 @@
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_system.h>
+#include <sbi/sbi_tlb.h>
 #include <sbi_utils/fdt/fdt_domain.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
 #include <sbi_utils/fdt/fdt_helper.h>
@@ -63,7 +64,7 @@ static u32 fw_platform_calculate_heap_size(u32 hart_count)
 	heap_size = SBI_PLATFORM_DEFAULT_HEAP_SIZE(hart_count);
 
 	/* For TLB fifo */
-	heap_size += 0x40 * (hart_count) * (hart_count);
+	heap_size += SBI_TLB_INFO_SIZE * (hart_count) * (hart_count);
 
 	return BIT_ALIGN(heap_size, HEAP_BASE_ALIGN);
 }
-- 
2.34.1


