From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Tue, 19 Dec 2023 16:58:56 +0530
Subject: [PATCH v1 7/7] lib: sbi: Print number of debug triggers found
In-Reply-To: <20231219112856.3865827-1-hchauhan@ventanamicro.com>
References: <20231219112856.3865827-1-hchauhan@ventanamicro.com>
Message-ID: <20231219112856.3865827-8-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Print the total number of triggers found on the boot hart.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 lib/sbi/sbi_init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 0dcde27..061c5f2 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -114,6 +114,8 @@ static void sbi_boot_print_general(struct sbi_scratch *scratch)
 	cppc_dev = sbi_cppc_get_device();
 	sbi_printf("Platform CPPC Device      : %s\n",
 		   (cppc_dev) ? cppc_dev->name : "---");
+	sbi_printf("Platform Debug Triggers   : %d trigger(s) found.\n",
+		   sbi_dbtr_get_total_triggers());
 
 	/* Firmware details */
 	sbi_printf("Firmware Base             : 0x%lx\n", scratch->fw_start);
-- 
2.34.1


