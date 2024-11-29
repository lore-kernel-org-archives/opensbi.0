From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 29 Nov 2024 21:20:50 +0530
Subject: [PATCH v2 15/17] lib: sbi: Implement SBI MPXY extension
In-Reply-To: <20241129155052.2866712-1-apatel@ventanamicro.com>
References: <20241129155052.2866712-1-apatel@ventanamicro.com>
Message-ID: <20241129155052.2866712-16-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Implement the SBI MPXY extension which provides an SBI interface to
the supervisor software for send messages via MPXY framework.

Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
Co-developed-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_ecall_interface.h | 10 +++++
 lib/sbi/Kconfig                   |  3 ++
 lib/sbi/objects.mk                |  3 ++
 lib/sbi/sbi_ecall_mpxy.c          | 68 +++++++++++++++++++++++++++++++
 4 files changed, 84 insertions(+)
 create mode 100644 lib/sbi/sbi_ecall_mpxy.c

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index 90c4ce11..c015ed93 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -35,6 +35,7 @@
 #define SBI_EXT_DBTR				0x44425452
 #define SBI_EXT_SSE				0x535345
 #define SBI_EXT_FWFT				0x46574654
+#define SBI_EXT_MPXY				0x4D505859
 
 /* SBI function IDs for BASE extension*/
 #define SBI_EXT_BASE_GET_SPEC_VERSION		0x0
@@ -410,6 +411,15 @@ enum sbi_sse_state {
 #define SBI_SSE_EVENT_GLOBAL_BIT		(1 << 15)
 #define SBI_SSE_EVENT_PLATFORM_BIT		(1 << 14)
 
+/* SBI function IDs for MPXY extension */
+#define SBI_EXT_MPXY_SET_SHMEM			0x0
+#define SBI_EXT_MPXY_GET_CHANNEL_IDS		0x1
+#define SBI_EXT_MPXY_READ_ATTRS			0x2
+#define SBI_EXT_MPXY_WRITE_ATTRS		0x3
+#define SBI_EXT_MPXY_SEND_MSG_WITH_RESP		0x4
+#define SBI_EXT_MPXY_SEND_MSG_NO_RESP		0x5
+#define SBI_EXT_MPXY_GET_NOTIFICATION_EVENTS	0x6
+
 /* SBI base specification related macros */
 #define SBI_SPEC_VERSION_MAJOR_OFFSET		24
 #define SBI_SPEC_VERSION_MAJOR_MASK		0x7f
diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
index bd8ba2b6..c6cc04bc 100644
--- a/lib/sbi/Kconfig
+++ b/lib/sbi/Kconfig
@@ -66,4 +66,7 @@ config SBI_ECALL_SSE
 	bool "SSE extension"
 	default y
 
+config SBI_ECALL_MPXY
+	bool "MPXY extension"
+	default y
 endmenu
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 80b82f8e..12e9e2bd 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -61,6 +61,9 @@ libsbi-objs-$(CONFIG_SBI_ECALL_DBTR) += sbi_ecall_dbtr.o
 carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_SSE) += ecall_sse
 libsbi-objs-$(CONFIG_SBI_ECALL_SSE) += sbi_ecall_sse.o
 
+carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_MPXY) += ecall_mpxy
+libsbi-objs-$(CONFIG_SBI_ECALL_MPXY) += sbi_ecall_mpxy.o
+
 libsbi-objs-y += sbi_bitmap.o
 libsbi-objs-y += sbi_bitops.o
 libsbi-objs-y += sbi_console.o
diff --git a/lib/sbi/sbi_ecall_mpxy.c b/lib/sbi/sbi_ecall_mpxy.c
new file mode 100644
index 00000000..5f717b76
--- /dev/null
+++ b/lib/sbi/sbi_ecall_mpxy.c
@@ -0,0 +1,68 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2024 Ventana Micro Systems Inc.
+ *
+ * Authors:
+ *   Anup Patel <apatel@ventanamicro.com>
+ */
+
+#include <sbi/sbi_ecall.h>
+#include <sbi/sbi_ecall_interface.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_trap.h>
+#include <sbi/sbi_mpxy.h>
+
+static int sbi_ecall_mpxy_handler(unsigned long extid, unsigned long funcid,
+				  struct sbi_trap_regs *regs,
+				  struct sbi_ecall_return *out)
+{
+	int ret = 0;
+
+	switch (funcid) {
+	case SBI_EXT_MPXY_SET_SHMEM:
+		ret = sbi_mpxy_set_shmem(regs->a0, regs->a1, regs->a2, regs->a3);
+		break;
+	case SBI_EXT_MPXY_GET_CHANNEL_IDS:
+		ret = sbi_mpxy_get_channel_ids(regs->a0);
+		break;
+	case SBI_EXT_MPXY_READ_ATTRS:
+		ret = sbi_mpxy_read_attrs(regs->a0, regs->a1, regs->a2);
+		break;
+	case SBI_EXT_MPXY_WRITE_ATTRS:
+		ret = sbi_mpxy_write_attrs(regs->a0, regs->a1, regs->a2);
+		break;
+	case SBI_EXT_MPXY_SEND_MSG_WITH_RESP:
+		ret = sbi_mpxy_send_message(regs->a0, regs->a1,
+					    regs->a2, &out->value);
+		break;
+	case SBI_EXT_MPXY_SEND_MSG_NO_RESP:
+		ret = sbi_mpxy_send_message(regs->a0, regs->a1, regs->a2,
+					    NULL);
+		break;
+	case SBI_EXT_MPXY_GET_NOTIFICATION_EVENTS:
+		ret = sbi_mpxy_get_notification_events(regs->a0, &out->value);
+		break;
+	default:
+		ret = SBI_ENOTSUPP;
+	}
+
+	return ret;
+}
+
+struct sbi_ecall_extension ecall_mpxy;
+
+static int sbi_ecall_mpxy_register_extensions(void)
+{
+	if (!sbi_mpxy_channel_available())
+		return 0;
+
+	return sbi_ecall_register_extension(&ecall_mpxy);
+}
+
+struct sbi_ecall_extension ecall_mpxy = {
+	.extid_start		= SBI_EXT_MPXY,
+	.extid_end		= SBI_EXT_MPXY,
+	.register_extensions	= sbi_ecall_mpxy_register_extensions,
+	.handle			= sbi_ecall_mpxy_handler,
+};
-- 
2.43.0


