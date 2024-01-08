From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Mon,  8 Jan 2024 12:25:25 +0530
Subject: [PATCH v2 7/7] lib: sbi: Print number of debug triggers found
In-Reply-To: <20240108065525.208172-1-hchauhan@ventanamicro.com>
References: <20240108065525.208172-1-hchauhan@ventanamicro.com>
Message-ID: <20240108065525.208172-8-hchauhan@ventanamicro.com>
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
index 0dcde27..c5612a0 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -184,6 +184,8 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
 	sbi_printf("Boot HART MHPM Info       : %lu (0x%08x)\n",
 		   sbi_popcount(sbi_hart_mhpm_mask(scratch)),
 		   sbi_hart_mhpm_mask(scratch));
+	sbi_printf("Boot HART Debug Triggers  : %d trigger(s) found.\n",
+		   sbi_dbtr_get_total_triggers());
 	sbi_hart_delegation_dump(scratch, "Boot HART ", "         ");
 }
 
-- 
2.34.1


