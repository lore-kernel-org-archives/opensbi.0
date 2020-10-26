From: Atish Patra <atish.patra@wdc.com>
Date: Mon, 26 Oct 2020 14:03:34 -0700
Subject: [PATCH v4 2/2] lib: sbi: Improve boot time print with additional PMP
 information
In-Reply-To: <20201026210334.782098-1-atish.patra@wdc.com>
References: <20201026210334.782098-1-atish.patra@wdc.com>
Message-ID: <20201026210334.782098-3-atish.patra@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We know about pmp granularity and number of bits supported by PMP.
Show those information in the boot time info print

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
---
 lib/sbi/sbi_init.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 318163602e4a..f9a88ec8e6a6 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -79,14 +79,17 @@ static void sbi_boot_prints(struct sbi_scratch *scratch, u32 hartid)
 	sbi_domain_dump_all("");
 
 	/* Boot HART details */
-	sbi_printf("Boot HART ID        : %u\n", hartid);
-	sbi_printf("Boot HART Domain    : %s\n", dom->name);
+	sbi_printf("Boot HART ID              : %u\n", hartid);
+	sbi_printf("Boot HART Domain          : %s\n", dom->name);
 	misa_string(xlen, str, sizeof(str));
-	sbi_printf("Boot HART ISA       : %s\n", str);
+	sbi_printf("Boot HART ISA             : %s\n", str);
 	sbi_hart_get_features_str(scratch, str, sizeof(str));
-	sbi_printf("Boot HART Features  : %s\n", str);
-	sbi_printf("Boot HART PMP Count : %d\n", sbi_hart_pmp_count(scratch));
-	sbi_printf("Boot HART MHPM Count: %d\n", sbi_hart_mhpm_count(scratch));
+	sbi_printf("Boot HART Features        : %s\n", str);
+	sbi_printf("Boot HART PMP Count       : %d\n", sbi_hart_pmp_count(scratch));
+	sbi_printf("Boot HART PMP Granularity : %lu\n", sbi_hart_pmp_granularity(scratch));
+	sbi_printf("Boot HART PMP Address bits: %d\n", sbi_hart_pmp_addrbits(scratch));
+	sbi_printf("Boot HART MHPM Count      : %d\n", sbi_hart_mhpm_count(scratch));
+	sbi_printf("Boot HART MHPM Count      : %d\n", sbi_hart_mhpm_count(scratch));
 	sbi_hart_delegation_dump(scratch, "Boot HART ", "   ");
 }
 
-- 
2.25.1


