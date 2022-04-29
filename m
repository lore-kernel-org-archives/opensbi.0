From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 29 Apr 2022 21:21:43 +0530
Subject: [PATCH 03/11] lib: sbi: Update the name of ISA string printed at boot
 time
In-Reply-To: <20220429155151.314788-1-apatel@ventanamicro.com>
References: <20220429155151.314788-1-apatel@ventanamicro.com>
Message-ID: <20220429155151.314788-4-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The ISA string printed at boot time is not the complete ISA string
representing all single letter and multi-letter extensions rather
it is base ISA string derived from misa CSR so let us update the
boot print accordingly.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/sbi/sbi_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 660b11f..c4def58 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -142,7 +142,7 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
 	sbi_hart_get_priv_version_str(scratch, str, sizeof(str));
 	sbi_printf("Boot HART Priv Version    : %s\n", str);
 	misa_string(xlen, str, sizeof(str));
-	sbi_printf("Boot HART ISA             : %s\n", str);
+	sbi_printf("Boot HART Base ISA        : %s\n", str);
 	sbi_hart_get_features_str(scratch, str, sizeof(str));
 	sbi_printf("Boot HART Features        : %s\n", str);
 	sbi_printf("Boot HART PMP Count       : %d\n",
-- 
2.34.1


