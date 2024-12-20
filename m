From: Ben Dooks <ben.dooks@codethink.co.uk>
Date: Fri, 20 Dec 2024 16:02:02 +0000
Subject: [RFC 3/7] opensbi: add option to set big-endian mode at run-time
In-Reply-To: <20241220160206.1989527-1-ben.dooks@codethink.co.uk>
References: <20241220160206.1989527-1-ben.dooks@codethink.co.uk>
Message-ID: <20241220160206.1989527-4-ben.dooks@codethink.co.uk>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add option to switch M-mode to BE at start by setting the
MSTATUS.MBE bit early on in the initialisation code and
ensure it stays set when hart is reinitialised.

Reviewed-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Reviewed-by: Roan Richmod <roan.richmond@codethink.co.uk>
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 Kconfig            | 4 ++++
 firmware/fw_base.S | 8 ++++++++
 lib/sbi/sbi_hart.c | 4 ++++
 3 files changed, 16 insertions(+)

diff --git a/Kconfig b/Kconfig
index cc7b5bc..6c6236f 100644
--- a/Kconfig
+++ b/Kconfig
@@ -7,6 +7,10 @@ config OPENSBI_BE
 	help
 	  Say Y here if you like fun challenges
 
+config OPENSBI_BE_SET
+	bool "Set M-Mode to be big-endian in startup code"
+	depends on OPENSBI_BE
+
 config OPENSBI_SRC_DIR
 	string
 	option env="OPENSBI_SRC_DIR"
diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index d027e5e..f8ad6db 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -46,6 +46,14 @@
 	.globl _start
 	.globl _start_warm
 _start:
+#ifdef CONFIG_OPENSBI_BE_SET
+#if __riscv_xlen == 64
+	li	s0, MSTATUS_MBE
+	csrs	CSR_MSTATUS, s0
+#else
+#error not done for 32bit
+#endif
+#endif
 	/* Find preferred boot HART id */
 	MOV_3R	s0, a0, s1, a1, s2, a2
 	call	fw_boot_hart
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 0451fcb..39311c4 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -39,6 +39,10 @@ static void mstatus_init(struct sbi_scratch *scratch)
 	uint64_t mhpmevent_init_val = 0;
 	uint64_t menvcfg_val, mstateen_val;
 
+#ifdef CONFIG_OPENSBI_BE_SET
+	mstatus_val |= MSTATUS_MBE;
+#endif
+
 	/* Enable FPU */
 	if (misa_extension('D') || misa_extension('F'))
 		mstatus_val |=  MSTATUS_FS;
-- 
2.37.2.352.g3c44437643


