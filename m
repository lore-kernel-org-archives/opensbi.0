From: Atish Patra <atish.patra@wdc.com>
Date: Fri, 19 Mar 2021 15:12:54 -0700
Subject: [RFC 03/14] lib: sbi: Remove stray '\' character
In-Reply-To: <20210319221305.2138412-1-atish.patra@wdc.com>
References: <20210319221305.2138412-1-atish.patra@wdc.com>
Message-ID: <20210319221305.2138412-4-atish.patra@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 lib/sbi/sbi_hart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 0b3bb6237182..ee11b2133d05 100644
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
2.25.1


