From: Tsukasa OI <research_trasio@irq.a4lg.com>
Date: Sun, 27 Nov 2022 03:46:42 +0000
Subject: [RFC PATCH] lib: sbi: Disambiguation between ISA and misa register
Message-ID: <ed69e83978817232e2bf966817818bf190bfcc1d.1669520736.git.research_trasio@irq.a4lg.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Tsukasa OI <research_trasio@irq.a4lg.com>

This commit makes disambiguation between named base ISA (and extensions
implemented) and contents of "misa" CSR (ISA, some major extensions and
implemented privilege modes).

For instance, 'S' and 'U' are valid bits in the "misa" CSR (denoting
existence of supervisor mode and user mode, respectively) but not valid
extensions.

The author proposes calling "Boot HART Base ISA" something else.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 lib/sbi/sbi_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index a8500e592742..fc00cd81f6ef 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -146,7 +146,7 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
 	sbi_hart_get_priv_version_str(scratch, str, sizeof(str));
 	sbi_printf("Boot HART Priv Version    : %s\n", str);
 	misa_string(xlen, str, sizeof(str));
-	sbi_printf("Boot HART Base ISA        : %s\n", str);
+	sbi_printf("Boot HART MISA Register   : %s\n", str);
 	sbi_hart_get_extensions_str(scratch, str, sizeof(str));
 	sbi_printf("Boot HART ISA Extensions  : %s\n", str);
 	sbi_printf("Boot HART PMP Count       : %d\n",

base-commit: 1b0d71bb9ff9180c4ae0026de5f4a92a88f1884e
-- 
2.38.1


