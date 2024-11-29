From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 29 Nov 2024 21:20:37 +0530
Subject: [PATCH v2 02/17] lib: utils/mailbox: Add generic mailbox library
In-Reply-To: <20241129155052.2866712-1-apatel@ventanamicro.com>
References: <20241129155052.2866712-1-apatel@ventanamicro.com>
Message-ID: <20241129155052.2866712-3-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add generic mailbox library which is independent of hardware description
format. The OpenSBI platform support or mailbox drivers can register
mailbox controller instances which can be discovered and used by different
mailbox client drivers. Each mailbox controller instance has a unique ID
which can be used by mailbox client drivers for find the mailbox controller
instance. The mailbox client drivers will typically request a mailbox channel
from the mailbox controller and use it to do data transfer with the remote
end of mailbox channel.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/mailbox/mailbox.h | 180 ++++++++++++++++++++++++++++
 lib/utils/Kconfig                   |   2 +
 lib/utils/mailbox/Kconfig           |   9 ++
 lib/utils/mailbox/mailbox.c         | 138 +++++++++++++++++++++
 lib/utils/mailbox/objects.mk        |  10 ++
 5 files changed, 339 insertions(+)
 create mode 100644 include/sbi_utils/mailbox/mailbox.h
 create mode 100644 lib/utils/mailbox/Kconfig
 create mode 100644 lib/utils/mailbox/mailbox.c
 create mode 100644 lib/utils/mailbox/objects.mk

diff --git a/include/sbi_utils/mailbox/mailbox.h b/include/sbi_utils/mailbox/mailbox.h
new file mode 100644
index 00000000..46fd8770
--- /dev/null
+++ b/include/sbi_utils/mailbox/mailbox.h
@@ -0,0 +1,180 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2024 Ventana Micro Systems Inc.
+ *
+ * Authors:
+ *   Anup Patel <apatel@ventanamicro.com>
+ */
+
+#ifndef __MAILBOX_H__
+#define __MAILBOX_H__
+
+#include <sbi/sbi_types.h>
+#include <sbi/sbi_list.h>
+#include <sbi/riscv_atomic.h>
+
+/** Representation of a mailbox channel */
+struct mbox_chan {
+	/** List head */
+	struct sbi_dlist node;
+	/** Pointer to the mailbox controller */
+	struct mbox_controller *mbox;
+	/**
+	 * Arguments (or parameters) to identify a mailbox channel
+	 * within a mailbox controller.
+	 */
+#define MBOX_CHAN_MAX_ARGS	2
+	u32 chan_args[MBOX_CHAN_MAX_ARGS];
+};
+
+#define to_mbox_chan(__node)	\
+	container_of((__node), struct mbox_chan, node)
+
+/**
+ * Representation of a mailbox data transfer
+ *
+ * NOTE: If both "tx" and "rx" are non-NULL then Tx is done before Rx.
+ */
+struct mbox_xfer {
+#define MBOX_XFER_SEQ			(1UL << 0)
+	/** Transfer flags */
+	unsigned long flags;
+	/** Transfer arguments (or parameters) */
+	void *args;
+	/**
+	 * Sequence number
+	 *
+	 * If MBOX_XFER_SEQ is not set in flags then mbox_chan_xfer()
+	 * will generate a unique sequence number and update this field
+	 * else mbox_chan_xfer() will blindly use the sequence number
+	 * specified by this field.
+	 */
+	long seq;
+	/** Send data pointer */
+	void *tx;
+	/** Send data length (valid only if tx != NULL) */
+	unsigned long tx_len;
+	/**
+	 * Send timeout milliseconds (valid only if tx != NULL)
+	 *
+	 * If this field is non-zero along with tx != NULL then the
+	 * mailbox controller driver will wait specified milliseconds
+	 * for send data transfer to complete else the mailbox controller
+	 * driver will not wait.
+	 */
+	unsigned long tx_timeout;
+	/** Receive data pointer */
+	void *rx;
+	/** Receive data length (valid only if rx != NULL) */
+	unsigned long rx_len;
+	/**
+	 * Receive timeout milliseconds (valid only if rx != NULL)
+	 *
+	 * If this field is non-zero along with rx != NULL then the
+	 * mailbox controller driver will wait specified milliseconds
+	 * for receive data transfer to complete else the mailbox
+	 * controller driver will not wait.
+	 */
+	unsigned long rx_timeout;
+};
+
+#define mbox_xfer_init_tx(__p, __a, __t, __t_len, __t_tim)		\
+do {									\
+	(__p)->flags = 0;						\
+	(__p)->args = (__a);						\
+	(__p)->tx = (__t);						\
+	(__p)->tx_len = (__t_len);					\
+	(__p)->tx_timeout = (__t_tim);					\
+	(__p)->rx = NULL;						\
+	(__p)->rx_len = 0;						\
+	(__p)->rx_timeout = 0;						\
+} while (0)
+
+#define mbox_xfer_init_rx(__p, __a, __r, __r_len, __r_tim)		\
+do {									\
+	(__p)->flags = 0;						\
+	(__p)->args = (__a);						\
+	(__p)->tx = NULL;						\
+	(__p)->tx_len = 0;						\
+	(__p)->tx_timeout = 0;						\
+	(__p)->rx = (__r);						\
+	(__p)->rx_len = (__r_len);					\
+	(__p)->rx_timeout = (__r_tim);					\
+} while (0)
+
+#define mbox_xfer_init_txrx(__p, __a, __t, __t_len, __t_tim, __r, __r_len, __r_tim)\
+do {									\
+	(__p)->flags = 0;						\
+	(__p)->args = (__a);						\
+	(__p)->tx = (__t);						\
+	(__p)->tx_len = (__t_len);					\
+	(__p)->tx_timeout = (__t_tim);					\
+	(__p)->rx = (__r);						\
+	(__p)->rx_len = (__r_len);					\
+	(__p)->rx_timeout = (__r_tim);					\
+} while (0)
+
+#define mbox_xfer_set_sequence(__p, __seq)				\
+do {									\
+	(__p)->flags |= MBOX_XFER_SEQ;					\
+	(__p)->seq = (__seq);						\
+} while (0)
+
+/** Representation of a mailbox controller */
+struct mbox_controller {
+	/** List head */
+	struct sbi_dlist node;
+	/** Next sequence atomic counter */
+	atomic_t xfer_next_seq;
+	/* List of mailbox channels */
+	struct sbi_dlist chan_list;
+	/** Unique ID of the mailbox controller assigned by the driver */
+	unsigned int id;
+	/** Maximum length of transfer supported by the mailbox controller */
+	unsigned int max_xfer_len;
+	/** Pointer to mailbox driver owning this mailbox controller */
+	void *driver;
+	/** Request a mailbox channel from the mailbox controller */
+	struct mbox_chan *(*request_chan)(struct mbox_controller *mbox,
+					  u32 *chan_args);
+	/** Free a mailbox channel from the mailbox controller */
+	void (*free_chan)(struct mbox_controller *mbox,
+			  struct mbox_chan *chan);
+	/** Transfer data over mailbox channel */
+	int (*xfer)(struct mbox_chan *chan, struct mbox_xfer *xfer);
+	/** Get an attribute of mailbox channel */
+	int (*get_attribute)(struct mbox_chan *chan, int attr_id, void *out_value);
+	/** Set an attribute of mailbox channel */
+	int (*set_attribute)(struct mbox_chan *chan, int attr_id, void *new_value);
+};
+
+#define to_mbox_controller(__node)	\
+	container_of((__node), struct mbox_controller, node)
+
+/** Find a registered mailbox controller */
+struct mbox_controller *mbox_controller_find(unsigned int id);
+
+/** Register mailbox controller */
+int mbox_controller_add(struct mbox_controller *mbox);
+
+/** Un-register mailbox controller */
+void mbox_controller_remove(struct mbox_controller *mbox);
+
+/** Request a mailbox channel */
+struct mbox_chan *mbox_controller_request_chan(struct mbox_controller *mbox,
+					       u32 *chan_args);
+
+/** Free a mailbox channel */
+void mbox_controller_free_chan(struct mbox_chan *chan);
+
+/** Data transfer over mailbox channel */
+int mbox_chan_xfer(struct mbox_chan *chan, struct mbox_xfer *xfer);
+
+/** Get an attribute of mailbox channel */
+int mbox_chan_get_attribute(struct mbox_chan *chan, int attr_id, void *out_value);
+
+/** Set an attribute of mailbox channel */
+int mbox_chan_set_attribute(struct mbox_chan *chan, int attr_id, void *new_value);
+
+#endif
diff --git a/lib/utils/Kconfig b/lib/utils/Kconfig
index de8b4eb9..6aa7843c 100644
--- a/lib/utils/Kconfig
+++ b/lib/utils/Kconfig
@@ -14,6 +14,8 @@ source "$(OPENSBI_SRC_DIR)/lib/utils/irqchip/Kconfig"
 
 source "$(OPENSBI_SRC_DIR)/lib/utils/libfdt/Kconfig"
 
+source "$(OPENSBI_SRC_DIR)/lib/utils/mailbox/Kconfig"
+
 source "$(OPENSBI_SRC_DIR)/lib/utils/regmap/Kconfig"
 
 source "$(OPENSBI_SRC_DIR)/lib/utils/reset/Kconfig"
diff --git a/lib/utils/mailbox/Kconfig b/lib/utils/mailbox/Kconfig
new file mode 100644
index 00000000..f91a9bb9
--- /dev/null
+++ b/lib/utils/mailbox/Kconfig
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: BSD-2-Clause
+
+menu "Mailbox Support"
+
+config MAILBOX
+	bool "Mailbox support"
+	default n
+
+endmenu
diff --git a/lib/utils/mailbox/mailbox.c b/lib/utils/mailbox/mailbox.c
new file mode 100644
index 00000000..2ea7a005
--- /dev/null
+++ b/lib/utils/mailbox/mailbox.c
@@ -0,0 +1,138 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2024 Ventana Micro Systems Inc.
+ *
+ * Authors:
+ *   Anup Patel <apatel@ventanamicro.com>
+ */
+
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_string.h>
+#include <sbi_utils/mailbox/mailbox.h>
+
+static SBI_LIST_HEAD(mbox_list);
+
+struct mbox_controller *mbox_controller_find(unsigned int id)
+{
+	struct sbi_dlist *pos;
+
+	sbi_list_for_each(pos, &mbox_list) {
+		struct mbox_controller *mbox = to_mbox_controller(pos);
+
+		if (mbox->id == id)
+			return mbox;
+	}
+
+	return NULL;
+}
+
+int mbox_controller_add(struct mbox_controller *mbox)
+{
+	if (!mbox || !mbox->max_xfer_len)
+		return SBI_EINVAL;
+	if (mbox_controller_find(mbox->id))
+		return SBI_EALREADY;
+
+	SBI_INIT_LIST_HEAD(&mbox->node);
+	ATOMIC_INIT(&mbox->xfer_next_seq, 0);
+	SBI_INIT_LIST_HEAD(&mbox->chan_list);
+	sbi_list_add(&mbox->node, &mbox_list);
+
+	return 0;
+}
+
+void mbox_controller_remove(struct mbox_controller *mbox)
+{
+	struct mbox_chan *chan;
+
+	if (!mbox)
+		return;
+
+	while (!sbi_list_empty(&mbox->chan_list)) {
+		chan = sbi_list_first_entry(&mbox->chan_list,
+					    struct mbox_chan, node);
+		if (mbox->free_chan)
+			mbox->free_chan(mbox, chan);
+		sbi_list_del(&chan->node);
+	}
+
+	sbi_list_del(&mbox->node);
+}
+
+struct mbox_chan *mbox_controller_request_chan(struct mbox_controller *mbox,
+					       u32 *chan_args)
+{
+	struct mbox_chan *ret;
+	struct sbi_dlist *pos;
+
+	if (!chan_args || !mbox || !mbox->request_chan)
+		return NULL;
+
+	sbi_list_for_each(pos, &mbox->chan_list) {
+		ret = to_mbox_chan(pos);
+		if (!sbi_memcmp(ret->chan_args, chan_args,
+				sizeof(ret->chan_args)))
+			return ret;
+	}
+
+	ret = mbox->request_chan(mbox, chan_args);
+	if (!ret)
+		return NULL;
+
+	SBI_INIT_LIST_HEAD(&ret->node);
+	ret->mbox = mbox;
+	sbi_memcpy(ret->chan_args, chan_args, sizeof(ret->chan_args));
+	sbi_list_add(&ret->node, &mbox->chan_list);
+	return ret;
+}
+
+void mbox_controller_free_chan(struct mbox_chan *chan)
+{
+	if (!chan || !chan->mbox)
+		return;
+
+	if (chan->mbox->free_chan)
+		chan->mbox->free_chan(chan->mbox, chan);
+	sbi_list_del(&chan->node);
+}
+
+int mbox_chan_xfer(struct mbox_chan *chan, struct mbox_xfer *xfer)
+{
+	if (!xfer || !chan || !chan->mbox || !chan->mbox->xfer)
+		return SBI_EINVAL;
+
+	if (xfer->tx && (xfer->tx_len > chan->mbox->max_xfer_len))
+		return SBI_EINVAL;
+
+	if (xfer->rx && (xfer->rx_len > chan->mbox->max_xfer_len))
+		return SBI_EINVAL;
+
+	if (!(xfer->flags & MBOX_XFER_SEQ))
+		mbox_xfer_set_sequence(xfer,
+			atomic_add_return(&chan->mbox->xfer_next_seq, 1));
+
+	return chan->mbox->xfer(chan, xfer);
+}
+
+int mbox_chan_get_attribute(struct mbox_chan *chan, int attr_id, void *out_value)
+{
+	if (!chan || !chan->mbox || !out_value)
+		return SBI_EINVAL;
+
+	if (!chan->mbox->get_attribute)
+		return SBI_ENOTSUPP;
+
+	return chan->mbox->get_attribute(chan, attr_id, out_value);
+}
+
+int mbox_chan_set_attribute(struct mbox_chan *chan, int attr_id, void *new_value)
+{
+	if (!chan || !chan->mbox || !new_value)
+		return SBI_EINVAL;
+
+	if (!chan->mbox->set_attribute)
+		return SBI_ENOTSUPP;
+
+	return chan->mbox->set_attribute(chan, attr_id, new_value);
+}
diff --git a/lib/utils/mailbox/objects.mk b/lib/utils/mailbox/objects.mk
new file mode 100644
index 00000000..79b27e4c
--- /dev/null
+++ b/lib/utils/mailbox/objects.mk
@@ -0,0 +1,10 @@
+#
+# SPDX-License-Identifier: BSD-2-Clause
+#
+# Copyright (c) 2024 Ventana Micro Systems Inc.
+#
+# Authors:
+#   Anup Patel <apatel@ventanamicro.com>
+#
+
+libsbiutils-objs-$(CONFIG_MAILBOX) += mailbox/mailbox.o
-- 
2.43.0


