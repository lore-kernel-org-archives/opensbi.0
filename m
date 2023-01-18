From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Wed, 18 Jan 2023 17:07:56 +0530
Subject: [PATCH v2 4/5] lib: sbi: Print the RW section offset
In-Reply-To: <20230118113757.46282-1-hchauhan@ventanamicro.com>
References: <20230118113757.46282-1-hchauhan@ventanamicro.com>
Message-ID: <20230118113757.46282-5-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Print the RW section offset when firmware base and size is
being printed.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 lib/sbi/sbi_init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 259a191..e353c33 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -108,6 +108,7 @@ static void sbi_boot_print_general(struct sbi_scratch *scratch)
 	sbi_printf("Firmware Base             : 0x%lx\n", scratch->fw_start);
 	sbi_printf("Firmware Size             : %d KB\n",
 		   (u32)(scratch->fw_size / 1024));
+	sbi_printf("Firmware RW Offset        : 0x%lx\n", scratch->fw_rw_offset);
 
 	/* SBI details */
 	sbi_printf("Runtime SBI Version       : %d.%d\n",
-- 
2.39.0


