From: Anup Patel <apatel@ventanamicro.com>
Date: Tue,  6 Aug 2024 13:03:25 +0530
Subject: [PATCH 03/16] lib: utils/mailbox: Add simple FDT based mailbox framework
In-Reply-To: <20240806073338.1856901-1-apatel@ventanamicro.com>
References: <20240806073338.1856901-1-apatel@ventanamicro.com>
Message-ID: <20240806073338.1856901-4-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a simple FDT based mailbox framework which is built on top of the generic
mailbox library. The phandle of FDT mailbox DT node is treated as the unique
mailbox controller ID which is required by the generic mailbox library. The
FDT based mailbox drivers will be probed on-demand from fdt_mailbox_request_chan()
called by the mailbox client drivers.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/mailbox/fdt_mailbox.h      |  36 +++++
 lib/utils/mailbox/Kconfig                    |   6 +
 lib/utils/mailbox/fdt_mailbox.c              | 142 +++++++++++++++++++
 lib/utils/mailbox/fdt_mailbox_drivers.carray |   3 +
 lib/utils/mailbox/objects.mk                 |   3 +
 5 files changed, 190 insertions(+)
 create mode 100644 include/sbi_utils/mailbox/fdt_mailbox.h
 create mode 100644 lib/utils/mailbox/fdt_mailbox.c
 create mode 100644 lib/utils/mailbox/fdt_mailbox_drivers.carray

diff --git a/include/sbi_utils/mailbox/fdt_mailbox.h b/include/sbi_utils/mailbox/fdt_mailbox.h
new file mode 100644
index 00000000..27f425db
--- /dev/null
+++ b/include/sbi_utils/mailbox/fdt_mailbox.h
@@ -0,0 +1,36 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2024 Ventana Micro Systems Inc.
+ *
+ * Authors:
+ *   Anup Patel <apatel@ventanamicro.com>
+ */
+
+#ifndef __FDT_MAILBOX_H__
+#define __FDT_MAILBOX_H__
+
+#include <sbi_utils/mailbox/mailbox.h>
+
+struct fdt_phandle_args;
+
+/** FDT based mailbox driver */
+struct fdt_mailbox {
+	const struct fdt_match *match_table;
+	int (*xlate)(struct mbox_controller *mbox,
+		     const struct fdt_phandle_args *pargs,
+		     u32 *out_chan_args);
+	int (*init)(void *fdt, int nodeoff, u32 phandle,
+		    const struct fdt_match *match);
+};
+
+/** Request a mailbox channel using "mboxes" DT property of client DT node */
+int fdt_mailbox_request_chan(void *fdt, int nodeoff, int index,
+			     struct mbox_chan **out_chan);
+
+/** Simple xlate function to convert one mailbox FDT cell into channel args */
+int fdt_mailbox_simple_xlate(struct mbox_controller *mbox,
+			     const struct fdt_phandle_args *pargs,
+			     u32 *out_chan_args);
+
+#endif
diff --git a/lib/utils/mailbox/Kconfig b/lib/utils/mailbox/Kconfig
index f91a9bb9..3957bfba 100644
--- a/lib/utils/mailbox/Kconfig
+++ b/lib/utils/mailbox/Kconfig
@@ -2,6 +2,12 @@
 
 menu "Mailbox Support"
 
+config FDT_MAILBOX
+	bool "FDT based mailbox drivers"
+	depends on FDT
+	select MAILBOX
+	default n
+
 config MAILBOX
 	bool "Mailbox support"
 	default n
diff --git a/lib/utils/mailbox/fdt_mailbox.c b/lib/utils/mailbox/fdt_mailbox.c
new file mode 100644
index 00000000..85a71429
--- /dev/null
+++ b/lib/utils/mailbox/fdt_mailbox.c
@@ -0,0 +1,142 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2024 Ventana Micro Systems Inc.
+ *
+ * Authors:
+ *   Anup Patel <apatel@ventanamicro.com>
+ */
+
+#include <libfdt.h>
+#include <sbi/sbi_error.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/mailbox/fdt_mailbox.h>
+
+/* List of FDT mailbox drivers generated at compile time */
+extern struct fdt_mailbox *fdt_mailbox_drivers[];
+extern unsigned long fdt_mailbox_drivers_size;
+
+static struct fdt_mailbox *fdt_mailbox_driver(struct mbox_controller *mbox)
+{
+	int pos;
+
+	if (!mbox)
+		return NULL;
+
+	for (pos = 0; pos < fdt_mailbox_drivers_size; pos++) {
+		if (mbox->driver == fdt_mailbox_drivers[pos])
+			return fdt_mailbox_drivers[pos];
+	}
+
+	return NULL;
+}
+
+static int fdt_mailbox_init(void *fdt, u32 phandle)
+{
+	int pos, nodeoff, rc;
+	struct fdt_mailbox *drv;
+	const struct fdt_match *match;
+
+	/* Find node offset */
+	nodeoff = fdt_node_offset_by_phandle(fdt, phandle);
+	if (nodeoff < 0)
+		return nodeoff;
+
+	/* Try all mailbox drivers one-by-one */
+	for (pos = 0; pos < fdt_mailbox_drivers_size; pos++) {
+		drv = fdt_mailbox_drivers[pos];
+
+		match = fdt_match_node(fdt, nodeoff, drv->match_table);
+		if (match && drv->init) {
+			rc = drv->init(fdt, nodeoff, phandle, match);
+			if (rc == SBI_ENODEV)
+				continue;
+			if (rc)
+				return rc;
+			return 0;
+		}
+	}
+
+	return SBI_ENOSYS;
+}
+
+static int fdt_mbox_controller_find(void *fdt, u32 phandle,
+				    struct mbox_controller **out_mbox)
+{
+	int rc;
+	struct mbox_controller *mbox = mbox_controller_find(phandle);
+
+	if (!mbox) {
+		/* mailbox not found so initialize matching driver */
+		rc = fdt_mailbox_init(fdt, phandle);
+		if (rc)
+			return rc;
+
+		/* Try to find mailbox controller again */
+		mbox = mbox_controller_find(phandle);
+		if (!mbox)
+			return SBI_ENOSYS;
+	}
+
+	if (out_mbox)
+		*out_mbox = mbox;
+
+	return 0;
+}
+
+int fdt_mailbox_request_chan(void *fdt, int nodeoff, int index,
+			     struct mbox_chan **out_chan)
+{
+	int rc;
+	struct mbox_chan *chan;
+	struct fdt_mailbox *drv;
+	struct fdt_phandle_args pargs;
+	struct mbox_controller *mbox = NULL;
+	u32 phandle, chan_args[MBOX_CHAN_MAX_ARGS];
+
+	if (!fdt || (nodeoff < 0) || (index < 0) || !out_chan)
+		return SBI_EINVAL;
+
+	pargs.node_offset = pargs.args_count = 0;
+	rc = fdt_parse_phandle_with_args(fdt, nodeoff,
+					 "mboxes", "#mbox-cells",
+					 index, &pargs);
+	if (rc)
+		return rc;
+
+	phandle = fdt_get_phandle(fdt, pargs.node_offset);
+	rc = fdt_mbox_controller_find(fdt, phandle, &mbox);
+	if (rc)
+		return rc;
+
+	drv = fdt_mailbox_driver(mbox);
+	if (!drv || !drv->xlate)
+		return SBI_ENOSYS;
+
+	rc = drv->xlate(mbox, &pargs, chan_args);
+	if (rc)
+		return rc;
+
+	chan = mbox_controller_request_chan(mbox, chan_args);
+	if (!chan)
+		return SBI_ENOENT;
+
+	*out_chan = chan;
+	return 0;
+}
+
+int fdt_mailbox_simple_xlate(struct mbox_controller *mbox,
+			     const struct fdt_phandle_args *pargs,
+			     u32 *out_chan_args)
+{
+	int i;
+
+	if (pargs->args_count < 1)
+		return SBI_EINVAL;
+
+	out_chan_args[0] = pargs->args[0];
+	for (i = 1; i < MBOX_CHAN_MAX_ARGS; i++)
+		out_chan_args[i] = 0;
+
+	return 0;
+}
diff --git a/lib/utils/mailbox/fdt_mailbox_drivers.carray b/lib/utils/mailbox/fdt_mailbox_drivers.carray
new file mode 100644
index 00000000..fd4246df
--- /dev/null
+++ b/lib/utils/mailbox/fdt_mailbox_drivers.carray
@@ -0,0 +1,3 @@
+HEADER: sbi_utils/mailbox/fdt_mailbox.h
+TYPE: struct fdt_mailbox
+NAME: fdt_mailbox_drivers
diff --git a/lib/utils/mailbox/objects.mk b/lib/utils/mailbox/objects.mk
index 79b27e4c..2135898c 100644
--- a/lib/utils/mailbox/objects.mk
+++ b/lib/utils/mailbox/objects.mk
@@ -7,4 +7,7 @@
 #   Anup Patel <apatel@ventanamicro.com>
 #
 
+libsbiutils-objs-$(CONFIG_FDT_MAILBOX) += mailbox/fdt_mailbox.o
+libsbiutils-objs-$(CONFIG_FDT_MAILBOX) += mailbox/fdt_mailbox_drivers.carray.o
+
 libsbiutils-objs-$(CONFIG_MAILBOX) += mailbox/mailbox.o
-- 
2.34.1


