From: Anup Patel <anup.patel@wdc.com>
Date: Fri, 25 Sep 2020 16:57:54 +0530
Subject: [RFC PATCH] lib: Implement System Reset (SRST) SBI extension
Message-ID: <20200925112754.725742-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The SBI SRST extension specification is in draft state and available
in srbt_v1 branch of: https://github.com/avpatel/riscv-sbi-doc.

It allows to S-mode software to request system shutdown, cold reboot,
and warm reboot.

This patch provides implementation of SBI SRST extension.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 include/sbi/sbi_ecall.h           |  1 +
 include/sbi/sbi_ecall_interface.h |  6 +++++
 lib/sbi/objects.mk                |  1 +
 lib/sbi/sbi_ecall.c               |  3 +++
 lib/sbi/sbi_ecall_srst.c          | 44 +++++++++++++++++++++++++++++++
 5 files changed, 55 insertions(+)
 create mode 100644 lib/sbi/sbi_ecall_srst.c

diff --git a/include/sbi/sbi_ecall.h b/include/sbi/sbi_ecall.h
index 3273ba6..1ef86e2 100644
--- a/include/sbi/sbi_ecall.h
+++ b/include/sbi/sbi_ecall.h
@@ -37,6 +37,7 @@ extern struct sbi_ecall_extension ecall_rfence;
 extern struct sbi_ecall_extension ecall_ipi;
 extern struct sbi_ecall_extension ecall_vendor;
 extern struct sbi_ecall_extension ecall_hsm;
+extern struct sbi_ecall_extension ecall_srst;
 
 u16 sbi_ecall_version_major(void);
 
diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index af30500..bdc7d96 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -27,6 +27,7 @@
 #define SBI_EXT_IPI				0x735049
 #define SBI_EXT_RFENCE				0x52464E43
 #define SBI_EXT_HSM				0x48534D
+#define SBI_EXT_SRST				0x53525354
 
 /* SBI function IDs for BASE extension*/
 #define SBI_EXT_BASE_GET_SPEC_VERSION		0x0
@@ -62,6 +63,11 @@
 #define SBI_HSM_HART_STATUS_START_PENDING	0x2
 #define SBI_HSM_HART_STATUS_STOP_PENDING	0x3
 
+/* SBI function IDs for SRST extension */
+#define SBI_EXT_SRST_SHUTDOWN			0x0
+#define SBI_EXT_SRST_COLD_REBOOT		0x1
+#define SBI_EXT_SRST_WARM_REBOOT		0x2
+
 #define SBI_SPEC_VERSION_MAJOR_OFFSET		24
 #define SBI_SPEC_VERSION_MAJOR_MASK		0x7f
 #define SBI_SPEC_VERSION_MINOR_MASK		0xffffff
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index fa808a0..6ec1154 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -20,6 +20,7 @@ libsbi-objs-y += sbi_ecall_base.o
 libsbi-objs-y += sbi_ecall_hsm.o
 libsbi-objs-y += sbi_ecall_legacy.o
 libsbi-objs-y += sbi_ecall_replace.o
+libsbi-objs-y += sbi_ecall_srst.o
 libsbi-objs-y += sbi_ecall_vendor.o
 libsbi-objs-y += sbi_emulate_csr.o
 libsbi-objs-y += sbi_fifo.o
diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
index 64c9933..6d41cff 100644
--- a/lib/sbi/sbi_ecall.c
+++ b/lib/sbi/sbi_ecall.c
@@ -167,6 +167,9 @@ int sbi_ecall_init(void)
 	if (ret)
 		return ret;
 	ret = sbi_ecall_register_extension(&ecall_hsm);
+	if (ret)
+		return ret;
+	ret = sbi_ecall_register_extension(&ecall_srst);
 	if (ret)
 		return ret;
 	ret = sbi_ecall_register_extension(&ecall_legacy);
diff --git a/lib/sbi/sbi_ecall_srst.c b/lib/sbi/sbi_ecall_srst.c
new file mode 100644
index 0000000..a1b4bee
--- /dev/null
+++ b/lib/sbi/sbi_ecall_srst.c
@@ -0,0 +1,44 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2020 Western Digital Corporation or its affiliates.
+ *
+ * Authors:
+ *   Anup Patel <anup.patel@wdc.com>
+ */
+
+#include <sbi/sbi_ecall.h>
+#include <sbi/sbi_ecall_interface.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_platform.h>
+#include <sbi/sbi_system.h>
+
+static int sbi_ecall_srst_handler(unsigned long extid, unsigned long funcid,
+				  unsigned long *args, unsigned long *out_val,
+				  struct sbi_trap_info *out_trap)
+{
+	int ret = 0;
+
+	switch (funcid) {
+	case SBI_EXT_SRST_SHUTDOWN:
+		sbi_system_reset(SBI_PLATFORM_RESET_SHUTDOWN);
+		break;
+	case SBI_EXT_SRST_COLD_REBOOT:
+		sbi_system_reset(SBI_PLATFORM_RESET_COLD);
+		break;
+	case SBI_EXT_SRST_WARM_REBOOT:
+		sbi_system_reset(SBI_PLATFORM_RESET_WARM);
+		break;
+	default:
+		ret = SBI_ENOTSUPP;
+		break;
+	};
+
+	return ret;
+}
+
+struct sbi_ecall_extension ecall_srst = {
+	.extid_start = SBI_EXT_SRST,
+	.extid_end = SBI_EXT_SRST,
+	.handle = sbi_ecall_srst_handler,
+};
-- 
2.25.1


