From: Ben Dooks <ben.dooks@codethink.co.uk>
Date: Fri, 20 Dec 2024 16:02:06 +0000
Subject: [RFC 7/7] opensbi: add u/s big endian init option
In-Reply-To: <20241220160206.1989527-1-ben.dooks@codethink.co.uk>
References: <20241220160206.1989527-1-ben.dooks@codethink.co.uk>
Message-ID: <20241220160206.1989527-8-ben.dooks@codethink.co.uk>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add an option to se the UBE and SBE flags when the hart is
initialised to set them into big endian S and U modes.

Reviewed-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Reviewed-by: Roan Richmod <roan.richmond@codethink.co.uk>
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 Kconfig            | 4 ++++
 lib/sbi/sbi_hart.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/Kconfig b/Kconfig
index 6c6236f..6fccacf 100644
--- a/Kconfig
+++ b/Kconfig
@@ -11,6 +11,10 @@ config OPENSBI_BE_SET
 	bool "Set M-Mode to be big-endian in startup code"
 	depends on OPENSBI_BE
 
+config OPENSBI_SUBE_SET
+	bool "Set S and U mode to be big-endian in startup code"
+	depends on OPENSBI_BE
+
 config OPENSBI_SRC_DIR
 	string
 	option env="OPENSBI_SRC_DIR"
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 39311c4..9bd1cfd 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -42,6 +42,10 @@ static void mstatus_init(struct sbi_scratch *scratch)
 #ifdef CONFIG_OPENSBI_BE_SET
 	mstatus_val |= MSTATUS_MBE;
 #endif
+#ifdef CONFIG_OPENSBI_SUBE_SET
+	mstatus_val |= MSTATUS_SBE;
+	mstatus_val |= MSTATUS_UBE;
+#endif
 
 	/* Enable FPU */
 	if (misa_extension('D') || misa_extension('F'))
-- 
2.37.2.352.g3c44437643


