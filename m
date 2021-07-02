From: Atish Patra <atish.patra@wdc.com>
Date: Fri,  2 Jul 2021 11:01:07 -0700
Subject: [PATCH v4 03/15] lib: sbi: Remove stray '\' character
In-Reply-To: <20210702180119.912898-1-atish.patra@wdc.com>
References: <20210702180119.912898-1-atish.patra@wdc.com>
Message-ID: <20210702180119.912898-4-atish.patra@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Reviewed-by: Xiang W <wxjstz@126.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 lib/sbi/sbi_hart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 0bd1db1ab85e..9c01cf75c0bb 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -320,7 +320,7 @@ static unsigned long hart_pmp_get_allowed_addr(void)
 	unsigned long val = 0;
 	struct sbi_trap_info trap = {0};
 
-	csr_write_allowed(CSR_PMPADDR0, (ulong)&trap, PMP_ADDR_MASK);			\
+	csr_write_allowed(CSR_PMPADDR0, (ulong)&trap, PMP_ADDR_MASK);
 	if (!trap.cause) {
 		val = csr_read_allowed(CSR_PMPADDR0, (ulong)&trap);
 		if (trap.cause)
-- 
2.31.1


