From: Sunil V L <sunilvl@ventanamicro.com>
Date: Tue, 21 Mar 2023 09:50:53 +0530
Subject: [RFC PATCH v1 3/4] lib: sbi: Print the CPPC device name
In-Reply-To: <20230321042054.579520-1-sunilvl@ventanamicro.com>
References: <20230321042054.579520-1-sunilvl@ventanamicro.com>
Message-ID: <20230321042054.579520-4-sunilvl@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If CPPC device is registered by the platform, print its name.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 lib/sbi/sbi_init.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index ffa214c..fa89320 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -12,6 +12,7 @@
 #include <sbi/riscv_barrier.h>
 #include <sbi/riscv_locks.h>
 #include <sbi/sbi_console.h>
+#include <sbi/sbi_cppc.h>
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_ecall.h>
 #include <sbi/sbi_hart.h>
@@ -70,6 +71,7 @@ static void sbi_boot_print_general(struct sbi_scratch *scratch)
 	const struct sbi_console_device *cdev;
 	const struct sbi_system_reset_device *srdev;
 	const struct sbi_system_suspend_device *susp_dev;
+	const struct sbi_cppc_device *cppc_dev;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
 	if (scratch->options & SBI_SCRATCH_NO_BOOT_PRINTS)
@@ -107,6 +109,9 @@ static void sbi_boot_print_general(struct sbi_scratch *scratch)
 	susp_dev = sbi_system_suspend_get_device();
 	sbi_printf("Platform Suspend Device   : %s\n",
 		   (susp_dev) ? susp_dev->name : "---");
+	cppc_dev = sbi_cppc_get_device();
+	sbi_printf("Platform CPPC Device      : %s\n",
+		   (cppc_dev) ? cppc_dev->name : "---");
 
 	/* Firmware details */
 	sbi_printf("Firmware Base             : 0x%lx\n", scratch->fw_start);
-- 
2.34.1


