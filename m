From: Atish Patra <atish.patra@wdc.com>
Date: Fri, 19 Mar 2021 15:12:58 -0700
Subject: [RFC 07/14] lib: sbi: Remove redundant boot time print statement
In-Reply-To: <20210319221305.2138412-1-atish.patra@wdc.com>
References: <20210319221305.2138412-1-atish.patra@wdc.com>
Message-ID: <20210319221305.2138412-8-atish.patra@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 lib/sbi/sbi_init.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 4de2dfa7c99d..acc2a81a1b53 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -117,8 +117,6 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
 		   sbi_hart_pmp_addrbits(scratch));
 	sbi_printf("Boot HART MHPM Count      : %d\n",
 		   sbi_hart_mhpm_count(scratch));
-	sbi_printf("Boot HART MHPM Count      : %d\n",
-		   sbi_hart_mhpm_count(scratch));
 	sbi_hart_delegation_dump(scratch, "Boot HART ", "         ");
 }
 
-- 
2.25.1


