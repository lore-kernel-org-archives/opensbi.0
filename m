From: Anup Patel <anup.patel@wdc.com>
Date: Fri,  4 Sep 2020 17:43:39 +0530
Subject: [PATCH 1/3] lib: sbi: Don't handle VS-mode ecall in sbi_trap_handler()
In-Reply-To: <20200904121341.156416-1-anup.patel@wdc.com>
References: <20200904121341.156416-1-anup.patel@wdc.com>
Message-ID: <20200904121341.156416-2-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The VS-mode ecall is supposed to be handled by HS-mode so
sbi_trap_handler() should fallback to default case for
VS-mode ecall trap.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 lib/sbi/sbi_trap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index c2bd061..8fe6753 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -251,7 +251,6 @@ void sbi_trap_handler(struct sbi_trap_regs *regs)
 		rc  = sbi_misaligned_store_handler(mtval, mtval2, mtinst, regs);
 		msg = "misaligned store handler failed";
 		break;
-	case CAUSE_SUPERVISOR_ECALL:
 	case CAUSE_HYPERVISOR_ECALL:
 		rc  = sbi_ecall_handler(regs);
 		msg = "ecall handler failed";
-- 
2.25.1


