From: Anup Patel <anup.patel@wdc.com>
Date: Fri,  4 Sep 2020 17:43:41 +0530
Subject: [PATCH 3/3] lib: sbi_trap: Allow M-mode to M-mode ECALLs
In-Reply-To: <20200904121341.156416-1-anup.patel@wdc.com>
References: <20200904121341.156416-1-anup.patel@wdc.com>
Message-ID: <20200904121341.156416-4-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We should allow M-mode to M-mode ECALLs because:
1. No other mode can handle M-mode ECALLs
2. In future, we can allow M-mode baremetal application (not
   linked to OpenSBI) running independently and cooperatively
   without corrupting OpenSBI M-mode state (CSRs and memory).

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 lib/sbi/sbi_trap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index b8bb20c..db5aa2f 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -252,6 +252,7 @@ void sbi_trap_handler(struct sbi_trap_regs *regs)
 		msg = "misaligned store handler failed";
 		break;
 	case CAUSE_SUPERVISOR_ECALL:
+	case CAUSE_MACHINE_ECALL:
 		rc  = sbi_ecall_handler(regs);
 		msg = "ecall handler failed";
 		break;
-- 
2.25.1


