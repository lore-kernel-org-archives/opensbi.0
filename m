From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 11 Mar 2024 21:39:43 +0530
Subject: [PATCH 8/9] lib: sbi: Pass trap context pointer to sbi_ecall_handler()
In-Reply-To: <20240311160944.1233523-1-apatel@ventanamicro.com>
References: <20240311160944.1233523-1-apatel@ventanamicro.com>
Message-ID: <20240311160944.1233523-9-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

To be consistent with other trap handlers, pass trap context pointer
to sbi_ecall_handler().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_ecall.h | 4 ++--
 lib/sbi/sbi_ecall.c     | 3 ++-
 lib/sbi/sbi_trap.c      | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/sbi/sbi_ecall.h b/include/sbi/sbi_ecall.h
index 0bf42d1..0b35eff 100644
--- a/include/sbi/sbi_ecall.h
+++ b/include/sbi/sbi_ecall.h
@@ -18,7 +18,7 @@
 #define SBI_OPENSBI_IMPID		1
 
 struct sbi_trap_regs;
-struct sbi_trap_info;
+struct sbi_trap_context;
 
 struct sbi_ecall_return {
 	/* Return flag to skip register update */
@@ -87,7 +87,7 @@ int sbi_ecall_register_extension(struct sbi_ecall_extension *ext);
 
 void sbi_ecall_unregister_extension(struct sbi_ecall_extension *ext);
 
-int sbi_ecall_handler(struct sbi_trap_regs *regs);
+int sbi_ecall_handler(struct sbi_trap_context *tcntx);
 
 int sbi_ecall_init(void);
 
diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
index 631c5dd..845e79b 100644
--- a/lib/sbi/sbi_ecall.c
+++ b/lib/sbi/sbi_ecall.c
@@ -95,9 +95,10 @@ void sbi_ecall_unregister_extension(struct sbi_ecall_extension *ext)
 		sbi_list_del_init(&ext->head);
 }
 
-int sbi_ecall_handler(struct sbi_trap_regs *regs)
+int sbi_ecall_handler(struct sbi_trap_context *tcntx)
 {
 	int ret = 0;
+	struct sbi_trap_regs *regs = tcntx->regs;
 	struct sbi_ecall_extension *ext;
 	unsigned long extension_id = regs->a7;
 	unsigned long func_id = regs->a6;
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index a50e466..b0fa5fd 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -318,7 +318,7 @@ struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs)
 		break;
 	case CAUSE_SUPERVISOR_ECALL:
 	case CAUSE_MACHINE_ECALL:
-		rc  = sbi_ecall_handler(regs);
+		rc  = sbi_ecall_handler(&tcntx);
 		msg = "ecall handler failed";
 		break;
 	case CAUSE_LOAD_ACCESS:
-- 
2.34.1


