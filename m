From: Atish Patra <atish.patra@wdc.com>
Date: Wed, 26 May 2021 17:30:36 -0700
Subject: [PATCH v2 07/15] lib: sbi: Remove redundant boot time print statement
In-Reply-To: <20210527003044.889681-1-atish.patra@wdc.com>
References: <20210527003044.889681-1-atish.patra@wdc.com>
Message-ID: <20210527003044.889681-8-atish.patra@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Reviewed-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 lib/sbi/sbi_init.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 3f44a2b87152..65af5705f484 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -137,8 +137,6 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
 		   sbi_hart_pmp_addrbits(scratch));
 	sbi_printf("Boot HART MHPM Count      : %d\n",
 		   sbi_hart_mhpm_count(scratch));
-	sbi_printf("Boot HART MHPM Count      : %d\n",
-		   sbi_hart_mhpm_count(scratch));
 	sbi_hart_delegation_dump(scratch, "Boot HART ", "         ");
 }
 
-- 
2.25.1


