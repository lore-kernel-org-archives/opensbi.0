From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 29 Nov 2024 21:20:39 +0530
Subject: [PATCH v2 04/17] lib/utils: Add RPMI messaging protocol and shared memory transport support
In-Reply-To: <20241129155052.2866712-1-apatel@ventanamicro.com>
References: <20241129155052.2866712-1-apatel@ventanamicro.com>
Message-ID: <20241129155052.2866712-5-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Rahul Pathak <rpathak@ventanamicro.com>

The RISC-V Platform Management Interface (RPMI) defines a messaging protocol
and shared memory based transport for bi-directional communication with an
on-chip or external microcontroller.

To support RPMI in OpenSBI, add:
1) The RPMI messaging protocol defines and helper macros
2) A FDT mailbox driver for the RPMI shared memory transport

Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
Co-developed-by: Subrahmanya Lingappa <slingappa@ventanamicro.com>
Signed-off-by: Subrahmanya Lingappa <slingappa@ventanamicro.com>
Co-developed-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/mailbox/rpmi_mailbox.h   |  32 +
 include/sbi_utils/mailbox/rpmi_msgprot.h   | 255 +++++++
 lib/utils/mailbox/Kconfig                  |  14 +
 lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c | 773 +++++++++++++++++++++
 lib/utils/mailbox/objects.mk               |   5 +
 lib/utils/mailbox/rpmi_mailbox.c           |  91 +++
 platform/generic/configs/defconfig         |   3 +
 7 files changed, 1173 insertions(+)
 create mode 100644 include/sbi_utils/mailbox/rpmi_mailbox.h
 create mode 100644 include/sbi_utils/mailbox/rpmi_msgprot.h
 create mode 100644 lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
 create mode 100644 lib/utils/mailbox/rpmi_mailbox.c

diff --git a/include/sbi_utils/mailbox/rpmi_mailbox.h b/include/sbi_utils/mailbox/rpmi_mailbox.h
new file mode 100644
index 00000000..61af51a8
--- /dev/null
+++ b/include/sbi_utils/mailbox/rpmi_mailbox.h
@@ -0,0 +1,32 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2023 Ventana Micro Systems Inc.
+ *
+ * Authors:
+ *   Anup Patel <apatel@ventanamicro.com>
+ */
+
+#ifndef __RPMI_MAILBOX_H__
+#define __RPMI_MAILBOX_H__
+
+#include <sbi/sbi_error.h>
+#include <sbi_utils/mailbox/rpmi_msgprot.h>
+
+#define rpmi_u32_count(__var)	(sizeof(__var) / sizeof(u32))
+
+/** Convert RPMI error to SBI error */
+int rpmi_xlate_error(enum rpmi_error error);
+
+/** Typical RPMI normal request with at least status code in response */
+int rpmi_normal_request_with_status(
+			struct mbox_chan *chan, u32 service_id,
+			void *req, u32 req_words, u32 req_endian_words,
+			void *resp, u32 resp_words, u32 resp_endian_words);
+
+/* RPMI posted request which is without any response*/
+int rpmi_posted_request(
+		struct mbox_chan *chan, u32 service_id,
+		void *req, u32 req_words, u32 req_endian_words);
+
+#endif /* !__RPMI_MAILBOX_H__ */
diff --git a/include/sbi_utils/mailbox/rpmi_msgprot.h b/include/sbi_utils/mailbox/rpmi_msgprot.h
new file mode 100644
index 00000000..f9f65447
--- /dev/null
+++ b/include/sbi_utils/mailbox/rpmi_msgprot.h
@@ -0,0 +1,255 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2023 Ventana Micro Systems Inc.
+ *
+ * Authors:
+ *   Rahul Pathak <rpathak@ventanamicro.com>
+ */
+
+#ifndef __RPMI_MSGPROT_H__
+#define __RPMI_MSGPROT_H__
+
+#include <sbi/sbi_byteorder.h>
+#include <sbi/sbi_error.h>
+
+/*
+ * 31                                            0
+ * +---------------------+-----------------------+
+ * | FLAGS | SERVICE_ID  |   SERVICEGROUP_ID     |
+ * +---------------------+-----------------------+
+ * |        TOKEN        |     DATA LENGTH       |
+ * +---------------------+-----------------------+
+ * |                 DATA/PAYLOAD                |
+ * +---------------------------------------------+
+ */
+
+/** Message Header byte offset */
+#define RPMI_MSG_HDR_OFFSET			(0x0)
+/** Message Header Size in bytes */
+#define RPMI_MSG_HDR_SIZE			(8)
+
+/** ServiceGroup ID field byte offset */
+#define RPMI_MSG_SERVICEGROUP_ID_OFFSET		(0x0)
+/** ServiceGroup ID field size in bytes */
+#define RPMI_MSG_SERVICEGROUP_ID_SIZE		(2)
+
+/** Service ID field byte offset */
+#define RPMI_MSG_SERVICE_ID_OFFSET		(0x2)
+/** Service ID field size in bytes */
+#define RPMI_MSG_SERVICE_ID_SIZE		(1)
+
+/** Flags field byte offset */
+#define RPMI_MSG_FLAGS_OFFSET			(0x3)
+/** Flags field size in bytes */
+#define RPMI_MSG_FLAGS_SIZE			(1)
+
+#define RPMI_MSG_FLAGS_TYPE_POS			(0U)
+#define RPMI_MSG_FLAGS_TYPE_MASK		0x7
+#define RPMI_MSG_FLAGS_TYPE			\
+	((0x7) << RPMI_MSG_FLAGS_TYPE_POS)
+
+#define RPMI_MSG_FLAGS_DOORBELL_POS		(3U)
+#define RPMI_MSG_FLAGS_DOORBELL_MASK		0x1
+#define RPMI_MSG_FLAGS_DOORBELL			\
+	((0x1) << RPMI_MSG_FLAGS_DOORBELL_POS)
+
+/** Data length field byte offset */
+#define RPMI_MSG_DATALEN_OFFSET			(0x4)
+/** Data length field size in bytes */
+#define RPMI_MSG_DATALEN_SIZE			(2)
+
+/** Token field byte offset */
+#define RPMI_MSG_TOKEN_OFFSET			(0x6)
+/** Token field size in bytes */
+#define RPMI_MSG_TOKEN_SIZE			(2)
+/** Token field mask */
+#define RPMI_MSG_TOKEN_MASK			(0xffffU)
+
+/** Data field byte offset */
+#define RPMI_MSG_DATA_OFFSET			(RPMI_MSG_HDR_SIZE)
+/** Data field size in bytes */
+#define RPMI_MSG_DATA_SIZE(__slot_size)		((__slot_size) - RPMI_MSG_HDR_SIZE)
+
+/** Minimum slot size in bytes */
+#define RPMI_SLOT_SIZE_MIN			(64)
+
+/** Name length of 16 characters */
+#define RPMI_NAME_CHARS_MAX			(16)
+
+/** Queue layout */
+#define RPMI_QUEUE_HEAD_SLOT		0
+#define RPMI_QUEUE_TAIL_SLOT		1
+#define RPMI_QUEUE_HEADER_SLOTS		2
+
+/** Default timeout values */
+#define RPMI_DEF_TX_TIMEOUT			20
+#define RPMI_DEF_RX_TIMEOUT			20
+
+/**
+ * Common macro to generate composite version from major
+ * and minor version numbers.
+ *
+ * RPMI has Specification version, Implementation version
+ * Service group versions which follow the same versioning
+ * encoding as below.
+ */
+#define RPMI_VERSION(__major, __minor) (((__major) << 16) | (__minor))
+
+/** RPMI Message Header */
+struct rpmi_message_header {
+	le16_t servicegroup_id;
+	uint8_t service_id;
+	uint8_t flags;
+	le16_t datalen;
+	le16_t token;
+} __packed;
+
+/** RPMI Message */
+struct rpmi_message {
+	struct rpmi_message_header header;
+	u8 data[0];
+} __packed;
+
+/** RPMI Messages Types */
+enum rpmi_message_type {
+	/* Normal request backed with ack */
+	RPMI_MSG_NORMAL_REQUEST = 0x0,
+	/* Request without any ack */
+	RPMI_MSG_POSTED_REQUEST = 0x1,
+	/* Acknowledgment for normal request message */
+	RPMI_MSG_ACKNOWLDGEMENT = 0x2,
+	/* Notification message */
+	RPMI_MSG_NOTIFICATION = 0x3,
+};
+
+/** RPMI Error Types */
+enum rpmi_error {
+	/* Success */
+	RPMI_SUCCESS		= 0,
+	/* General failure  */
+	RPMI_ERR_FAILED		= -1,
+	/* Service or feature not supported */
+	RPMI_ERR_NOTSUPP	= -2,
+	/* Invalid Parameter  */
+	RPMI_ERR_INVALID_PARAM    = -3,
+	/*
+	 * Denied to insufficient permissions
+	 * or due to unmet prerequisite
+	 */
+	RPMI_ERR_DENIED		= -4,
+	/* Invalid address or offset */
+	RPMI_ERR_INVALID_ADDR	= -5,
+	/*
+	 * Operation failed as it was already in
+	 * progress or the state has changed already
+	 * for which the operation was carried out.
+	 */
+	RPMI_ERR_ALREADY	= -6,
+	/*
+	 * Error in implementation which violates
+	 * the specification version
+	 */
+	RPMI_ERR_EXTENSION	= -7,
+	/* Operation failed due to hardware issues */
+	RPMI_ERR_HW_FAULT	= -8,
+	/* System, device or resource is busy */
+	RPMI_ERR_BUSY		= -9,
+	/* System or device or resource in invalid state */
+	RPMI_ERR_INVALID_STATE	= -10,
+	/* Index, offset or address is out of range */
+	RPMI_ERR_BAD_RANGE	= -11,
+	/* Operation timed out */
+	RPMI_ERR_TIMEOUT	= -12,
+	/*
+	 * Error in input or output or
+	 * error in sending or receiving data
+	 * through communication medium
+	 */
+	RPMI_ERR_IO		= -13,
+	/* No data available */
+	RPMI_ERR_NO_DATA	= -14,
+	RPMI_ERR_RESERVED_START	= -15,
+	RPMI_ERR_RESERVED_END	= -127,
+	RPMI_ERR_VENDOR_START	= -128,
+};
+
+/** RPMI Message Arguments */
+struct rpmi_message_args {
+	u32 flags;
+#define RPMI_MSG_FLAGS_NO_TX		(1U << 0)
+#define RPMI_MSG_FLAGS_NO_RX		(1U << 1)
+#define RPMI_MSG_FLAGS_NO_RX_TOKEN	(1U << 2)
+	enum rpmi_message_type type;
+	u8 service_id;
+	u32 tx_endian_words;
+	u32 rx_endian_words;
+	u16 rx_token;
+	u32 rx_data_len;
+};
+
+/*
+ * RPMI SERVICEGROUPS AND SERVICES
+ */
+
+/** RPMI ServiceGroups IDs */
+enum rpmi_servicegroup_id {
+	RPMI_SRVGRP_ID_MIN = 0,
+	RPMI_SRVGRP_BASE = 0x0001,
+	RPMI_SRVGRP_ID_MAX_COUNT,
+
+	/* Reserved range for service groups */
+	RPMI_SRVGRP_RESERVE_START = RPMI_SRVGRP_ID_MAX_COUNT,
+	RPMI_SRVGRP_RESERVE_END = 0x7FFF,
+
+	/* Vendor/Implementation-specific service groups range */
+	RPMI_SRVGRP_VENDOR_START = 0x8000,
+	RPMI_SRVGRP_VENDOR_END = 0xFFFF,
+};
+
+/** RPMI enable notification request */
+struct rpmi_enable_notification_req {
+	u32 eventid;
+};
+
+/** RPMI enable notification response */
+struct rpmi_enable_notification_resp {
+	s32 status;
+};
+
+/** RPMI Base ServiceGroup Service IDs */
+enum rpmi_base_service_id {
+	RPMI_BASE_SRV_ENABLE_NOTIFICATION = 0x01,
+	RPMI_BASE_SRV_GET_IMPLEMENTATION_VERSION = 0x02,
+	RPMI_BASE_SRV_GET_IMPLEMENTATION_IDN = 0x03,
+	RPMI_BASE_SRV_GET_SPEC_VERSION = 0x04,
+	RPMI_BASE_SRV_GET_PLATFORM_INFO = 0x05,
+	RPMI_BASE_SRV_PROBE_SERVICE_GROUP = 0x06,
+	RPMI_BASE_SRV_GET_ATTRIBUTES = 0x07,
+	RPMI_BASE_SRV_SET_MSI = 0x08,
+};
+
+#define RPMI_BASE_FLAGS_F0_PRIVILEGE		(1U << 2)
+#define RPMI_BASE_FLAGS_F0_EV_NOTIFY		(1U << 1)
+#define RPMI_BASE_FLAGS_F0_MSI_EN		(1U)
+
+enum rpmi_base_context_priv_level {
+	RPMI_BASE_CONTEXT_PRIV_S_MODE,
+	RPMI_BASE_CONTEXT_PRIV_M_MODE,
+};
+
+struct rpmi_base_get_attributes_resp {
+	s32 status_code;
+	u32 f0;
+	u32 f1;
+	u32 f2;
+	u32 f3;
+};
+
+struct rpmi_base_get_platform_info_resp {
+	s32 status;
+	u32 plat_info_len;
+	char plat_info[];
+};
+
+#endif /* !__RPMI_MSGPROT_H__ */
diff --git a/lib/utils/mailbox/Kconfig b/lib/utils/mailbox/Kconfig
index 3957bfba..6e7f2cdd 100644
--- a/lib/utils/mailbox/Kconfig
+++ b/lib/utils/mailbox/Kconfig
@@ -8,8 +8,22 @@ config FDT_MAILBOX
 	select MAILBOX
 	default n
 
+config RPMI_MAILBOX
+	bool "RPMI based mailbox drivers"
+	select MAILBOX
+	default n
+
 config MAILBOX
 	bool "Mailbox support"
 	default n
 
+if FDT_MAILBOX
+
+config FDT_MAILBOX_RPMI_SHMEM
+	bool "RPMI Shared Memory Mailbox Controller"
+	depends on RPMI_MAILBOX
+	default n
+
+endif
+
 endmenu
diff --git a/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c b/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
new file mode 100644
index 00000000..91db4e96
--- /dev/null
+++ b/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
@@ -0,0 +1,773 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2024 Ventana Micro Systems Inc.
+ *
+ * Authors:
+ *   Rahul Pathak <rpathak@ventanamicro.com>
+ *   Subrahmanya Lingappa <slingappa@ventanamicro.com>
+ *   Anup Patel <apatel@ventanamicro.com>
+ */
+
+#include <libfdt.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_heap.h>
+#include <sbi/sbi_timer.h>
+#include <sbi/riscv_io.h>
+#include <sbi/riscv_locks.h>
+#include <sbi/riscv_asm.h>
+#include <sbi/riscv_barrier.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/mailbox/mailbox.h>
+#include <sbi_utils/mailbox/fdt_mailbox.h>
+#include <sbi_utils/mailbox/rpmi_mailbox.h>
+
+/** Minimum Base group version required */
+#define RPMI_BASE_VERSION_MIN		RPMI_VERSION(1, 0)
+
+/**************** RPMI Transport Structures and Macros ***********/
+
+#define GET_SERVICEGROUP_ID(msg)		\
+({						\
+	struct rpmi_message *mbuf = msg;	\
+	le16_to_cpu(mbuf->header.servicegroup_id);\
+})
+
+#define GET_SERVICE_ID(msg)			\
+({						\
+	struct rpmi_message *mbuf = msg;	\
+	mbuf->header.service_id;		\
+})
+
+#define GET_FLAGS(msg)				\
+({						\
+	struct rpmi_message *mbuf = msg;	\
+	mbuf->header.flags;			\
+})
+
+#define GET_MESSAGE_ID(msg)			\
+({						\
+	struct rpmi_message *mbuf = msg;	\
+	((u32)mbuf->header.flags << (RPMI_MSG_FLAGS_OFFSET * 8)) | \
+	((u32)mbuf->header.service_id << (RPMI_MSG_SERVICE_ID_OFFSET * 8)) | \
+	((u32)le16_to_cpu(mbuf->header.servicegroup_id)); \
+})
+
+#define MAKE_MESSAGE_ID(__group_id, __service_id, __flags)	\
+({						\
+	u32 __ret = 0;				\
+	__ret |= (u32)(__group_id) << (RPMI_MSG_SERVICEGROUP_ID_OFFSET * 8); \
+	__ret |= (u32)(__service_id) << (RPMI_MSG_SERVICE_ID_OFFSET * 8); \
+	__ret |= (u32)(__flags) << (RPMI_MSG_FLAGS_OFFSET * 8); \
+	__ret;					\
+})
+
+#define GET_DLEN(msg)				\
+({						\
+	struct rpmi_message *mbuf = msg;	\
+	le16_to_cpu(mbuf->header.datalen);	\
+})
+
+#define GET_TOKEN(msg)				\
+({						\
+	struct rpmi_message *mbuf = msg;	\
+	le16_to_cpu(mbuf->header.token);	\
+})
+
+#define GET_MESSAGE_TYPE(msg)						\
+({									\
+	uint8_t flags = *((uint8_t *)msg + RPMI_MSG_FLAGS_OFFSET);	\
+	((flags & RPMI_MSG_FLAGS_TYPE) >> RPMI_MSG_FLAGS_TYPE_POS));	\
+})
+
+enum rpmi_queue_type {
+	RPMI_QUEUE_TYPE_REQ = 0,
+	RPMI_QUEUE_TYPE_ACK = 1,
+};
+
+enum rpmi_queue_idx {
+	RPMI_QUEUE_IDX_A2P_REQ = 0,
+	RPMI_QUEUE_IDX_P2A_ACK = 1,
+	RPMI_QUEUE_IDX_P2A_REQ = 2,
+	RPMI_QUEUE_IDX_A2P_ACK = 3,
+	RPMI_QUEUE_IDX_MAX_COUNT,
+};
+
+enum rpmi_reg_idx {
+	RPMI_REG_IDX_DB_REG = 0, /* Doorbell register */
+	RPMI_REG_IDX_MAX_COUNT,
+};
+
+/** Mailbox registers */
+struct rpmi_mb_regs {
+	/* doorbell from AP -> PuC*/
+	volatile le32_t db_reg;
+} __packed;
+
+/** Single Queue Context Structure */
+struct smq_queue_ctx {
+	u32 queue_id;
+	u32 num_slots;
+	spinlock_t queue_lock;
+	/* Type of queue - REQ or ACK */
+	enum rpmi_queue_type queue_type;
+	/* Pointers to the queue shared memory */
+	volatile le32_t *headptr;
+	volatile le32_t *tailptr;
+	volatile uint8_t *buffer;
+	/* Name of the queue */
+	char name[RPMI_NAME_CHARS_MAX];
+};
+
+struct rpmi_srvgrp_chan {
+	u32 servicegroup_id;
+	u32 servicegroup_version;
+	struct mbox_chan chan;
+};
+
+#define to_srvgrp_chan(mbox_chan)	\
+		container_of(mbox_chan, struct rpmi_srvgrp_chan, chan);
+
+struct rpmi_shmem_mbox_controller {
+	/* Driver specific members */
+	u32 slot_size;
+	u32 queue_count;
+	struct rpmi_mb_regs *mb_regs;
+	struct smq_queue_ctx queue_ctx_tbl[RPMI_QUEUE_IDX_MAX_COUNT];
+	/* Mailbox framework related members */
+	struct mbox_controller controller;
+	struct mbox_chan *base_chan;
+	u32 impl_version;
+	u32 impl_id;
+	u32 spec_version;
+	u32 plat_info_len;
+	char *plat_info;
+	struct {
+		u8 f0_priv_level;
+		bool f0_ev_notif_en;
+		bool f0_msi_en;
+	} base_flags;
+};
+
+/**************** Shared Memory Queues Helpers **************/
+
+static bool __smq_queue_full(struct smq_queue_ctx *qctx)
+{
+	return ((le32_to_cpu(*qctx->tailptr) + 1) % qctx->num_slots ==
+			le32_to_cpu(*qctx->headptr)) ? true : false;
+}
+
+static bool __smq_queue_empty(struct smq_queue_ctx *qctx)
+{
+	return (le32_to_cpu(*qctx->headptr) ==
+		le32_to_cpu(*qctx->tailptr)) ? true : false;
+}
+
+static int __smq_rx(struct smq_queue_ctx *qctx, u32 slot_size,
+		    u32 service_group_id, struct mbox_xfer *xfer)
+{
+	void *dst, *src;
+	struct rpmi_message *msg;
+	u32 i, tmp, pos, dlen, msgidn, headidx, tailidx;
+	struct rpmi_message_args *args = xfer->args;
+	bool no_rx_token = (args->flags & RPMI_MSG_FLAGS_NO_RX_TOKEN) ?
+			   true : false;
+
+	/* Rx sanity checks */
+	if ((sizeof(u32) * args->rx_endian_words) >
+	    (slot_size - sizeof(struct rpmi_message_header)))
+		return SBI_EINVAL;
+	if ((sizeof(u32) * args->rx_endian_words) > xfer->rx_len)
+		return SBI_EINVAL;
+
+	/* There should be some message in the queue */
+	if (__smq_queue_empty(qctx))
+		return SBI_ENOENT;
+
+	/* Get the head/read index and tail/write index */
+	headidx = le32_to_cpu(*qctx->headptr);
+	tailidx = le32_to_cpu(*qctx->tailptr);
+
+	/*
+	 * Compute msgidn expected in the incoming message
+	 * NOTE: DOORBELL bit is not expected to be set.
+	 */
+	msgidn = MAKE_MESSAGE_ID(service_group_id, args->service_id, args->type);
+
+	/* Find the Rx message with matching token */
+	pos = headidx;
+	while (pos != tailidx) {
+		src = (void *)qctx->buffer + (pos * slot_size);
+		if ((no_rx_token && GET_MESSAGE_ID(src) == msgidn) ||
+		    (GET_TOKEN(src) == (xfer->seq & RPMI_MSG_TOKEN_MASK)))
+			break;
+		pos = (pos + 1) % qctx->num_slots;
+	}
+	if (pos == tailidx)
+		return SBI_ENOENT;
+
+	/* If Rx message is not first message then make it first message */
+	if (pos != headidx) {
+		src = (void *)qctx->buffer + (pos * slot_size);
+		dst = (void *)qctx->buffer + (headidx * slot_size);
+		for (i = 0; i < slot_size / sizeof(u32); i++) {
+			tmp = ((u32 *)dst)[i];
+			((u32 *)dst)[i] = ((u32 *)src)[i];
+			((u32 *)src)[i] = tmp;
+		}
+	}
+
+	/* Update rx_token if not available */
+	msg = (void *)qctx->buffer + (headidx * slot_size);
+	if (no_rx_token)
+		args->rx_token = GET_TOKEN(msg);
+
+	/* Extract data from the first message */
+	if (xfer->rx) {
+		args->rx_data_len = dlen = GET_DLEN(msg);
+		if (dlen > xfer->rx_len)
+			dlen = xfer->rx_len;
+		src = (void *)msg + sizeof(struct rpmi_message_header);
+		dst = xfer->rx;
+		for (i = 0; i < args->rx_endian_words; i++)
+			((u32 *)dst)[i] = le32_to_cpu(((u32 *)src)[i]);
+		dst += sizeof(u32) * args->rx_endian_words;
+		src += sizeof(u32) * args->rx_endian_words;
+		sbi_memcpy(dst, src,
+			xfer->rx_len - (sizeof(u32) * args->rx_endian_words));
+	}
+
+	/* Update the head/read index */
+	*qctx->headptr = cpu_to_le32(headidx + 1) % qctx->num_slots;
+
+	/* Make sure updates to head are immediately visible to PuC */
+	smp_wmb();
+
+	return SBI_OK;
+}
+
+static int __smq_tx(struct smq_queue_ctx *qctx, struct rpmi_mb_regs *mb_regs,
+		    u32 slot_size, u32 service_group_id, struct mbox_xfer *xfer)
+{
+	u32 i, tailidx;
+	void *dst, *src;
+	struct rpmi_message_header header = { 0 };
+	struct rpmi_message_args *args = xfer->args;
+
+	/* Tx sanity checks */
+	if ((sizeof(u32) * args->tx_endian_words) >
+	    (slot_size - sizeof(struct rpmi_message_header)))
+		return SBI_EINVAL;
+	if ((sizeof(u32) * args->tx_endian_words) > xfer->tx_len)
+		return SBI_EINVAL;
+
+	/* There should be some room in the queue */
+	if (__smq_queue_full(qctx))
+		return SBI_ENOMEM;
+
+	/* Get the tail/write index */
+	tailidx = le32_to_cpu(*qctx->tailptr);
+
+	/* Prepare the header to be written into the slot */
+	header.servicegroup_id = cpu_to_le16(service_group_id);
+	header.service_id = args->service_id;
+	header.flags = args->type;
+	header.datalen = cpu_to_le16((u16)xfer->tx_len);
+	header.token = cpu_to_le16((u16)xfer->seq);
+
+	/* Write header into the slot */
+	dst = (char *)qctx->buffer + (tailidx * slot_size);
+	sbi_memcpy(dst, &header, sizeof(header));
+	dst += sizeof(header);
+
+	/* Write data into the slot */
+	if (xfer->tx) {
+		src = xfer->tx;
+		for (i = 0; i < args->tx_endian_words; i++)
+			((u32 *)dst)[i] = cpu_to_le32(((u32 *)src)[i]);
+		dst += sizeof(u32) * args->tx_endian_words;
+		src += sizeof(u32) * args->tx_endian_words;
+		sbi_memcpy(dst, src,
+			xfer->tx_len - (sizeof(u32) * args->tx_endian_words));
+	}
+
+	/* Make sure queue chanages are visible to PuC before updating tail */
+	smp_wmb();
+
+	/* Update the tail/write index */
+	*qctx->tailptr = cpu_to_le32(tailidx + 1) % qctx->num_slots;
+
+	/* Ring the RPMI doorbell if present */
+	if (mb_regs)
+		writel(cpu_to_le32(1), &mb_regs->db_reg);
+
+	return SBI_OK;
+}
+
+static int smq_rx(struct rpmi_shmem_mbox_controller *mctl,
+		  u32 queue_id, u32 service_group_id, struct mbox_xfer *xfer)
+{
+	int ret, rxretry = 0;
+	struct smq_queue_ctx *qctx;
+
+	if (mctl->queue_count < queue_id) {
+		sbi_printf("%s: invalid queue_id or service_group_id\n",
+			   __func__);
+		return SBI_EINVAL;
+	}
+	qctx = &mctl->queue_ctx_tbl[queue_id];
+
+	/*
+	 * Once the timeout happens and call this function is returned
+	 * to the client then there is no way to deliver the response
+	 * message after that if it comes later.
+	 *
+	 * REVISIT: In complete timeout duration how much duration
+	 * it should wait(delay) before recv retry. udelay or mdelay
+	 */
+	do {
+		spin_lock(&qctx->queue_lock);
+		ret = __smq_rx(qctx, mctl->slot_size, service_group_id, xfer);
+		spin_unlock(&qctx->queue_lock);
+		if (!ret)
+			return 0;
+
+		sbi_timer_mdelay(1);
+		rxretry += 1;
+	} while (rxretry < xfer->rx_timeout);
+
+	return SBI_ETIMEDOUT;
+}
+
+static int smq_tx(struct rpmi_shmem_mbox_controller *mctl,
+		  u32 queue_id, u32 service_group_id, struct mbox_xfer *xfer)
+{
+	int ret, txretry = 0;
+	struct smq_queue_ctx *qctx;
+
+	if (mctl->queue_count < queue_id) {
+		sbi_printf("%s: invalid queue_id or service_group_id\n",
+			   __func__);
+		return SBI_EINVAL;
+	}
+	qctx = &mctl->queue_ctx_tbl[queue_id];
+
+	/*
+	 * Ignoring the tx timeout since in RPMI has no mechanism
+	 * with which other side can let know about the reception of
+	 * message which marks as tx complete. For RPMI tx complete is
+	 * marked as done when message in successfully copied in queue.
+	 *
+	 * REVISIT: In complete timeout duration how much duration
+	 * it should wait(delay) before send retry. udelay or mdelay
+	 */
+	do {
+		spin_lock(&qctx->queue_lock);
+		ret = __smq_tx(qctx, mctl->mb_regs, mctl->slot_size,
+				service_group_id, xfer);
+		spin_unlock(&qctx->queue_lock);
+		if (!ret)
+			return 0;
+
+		sbi_timer_mdelay(1);
+		txretry += 1;
+	} while (txretry < xfer->tx_timeout);
+
+	return SBI_ETIMEDOUT;
+}
+
+static int rpmi_get_platform_info(struct rpmi_shmem_mbox_controller *mctl)
+{
+	int ret = SBI_OK;
+
+	/**
+	 * platform string can occupy max possible size
+	 * max possible space in the message data as
+	 * per the format
+	 */
+	struct rpmi_base_get_platform_info_resp *resp =
+			sbi_zalloc(RPMI_MSG_DATA_SIZE(mctl->slot_size));
+	if (!resp)
+		return SBI_ENOMEM;
+
+	ret = rpmi_normal_request_with_status(mctl->base_chan,
+				 RPMI_BASE_SRV_GET_PLATFORM_INFO,
+				 NULL, 0, 0,
+				 resp,
+				 RPMI_MSG_DATA_SIZE(mctl->slot_size)/4,
+				 RPMI_MSG_DATA_SIZE(mctl->slot_size)/4);
+	if (ret)
+		goto fail_free_resp;
+
+	mctl->plat_info_len = resp->plat_info_len;
+	mctl->plat_info = sbi_zalloc(mctl->plat_info_len);
+	if (!mctl->plat_info) {
+		ret = SBI_ENOMEM;
+		goto fail_free_resp;
+	}
+
+	sbi_strncpy(mctl->plat_info, resp->plat_info, mctl->plat_info_len);
+
+fail_free_resp:
+	sbi_free(resp);
+	return ret;
+}
+
+static int smq_base_get_two_u32(struct rpmi_shmem_mbox_controller *mctl,
+				u32 service_id, u32 *inarg, u32 *outvals)
+{
+	return rpmi_normal_request_with_status(
+			mctl->base_chan, service_id,
+			inarg, (inarg) ? 1 : 0, (inarg) ? 1 : 0,
+			outvals, 2, 2);
+}
+
+/**************** Mailbox Controller Functions **************/
+
+static int rpmi_shmem_mbox_xfer(struct mbox_chan *chan, struct mbox_xfer *xfer)
+{
+	int ret;
+	u32 tx_qid = 0, rx_qid = 0;
+	struct rpmi_shmem_mbox_controller *mctl =
+			container_of(chan->mbox,
+				     struct rpmi_shmem_mbox_controller,
+				     controller);
+	struct rpmi_srvgrp_chan *srvgrp_chan = to_srvgrp_chan(chan);
+
+	struct rpmi_message_args *args = xfer->args;
+	bool do_tx = (args->flags & RPMI_MSG_FLAGS_NO_TX) ? false : true;
+	bool do_rx = (args->flags & RPMI_MSG_FLAGS_NO_RX) ? false : true;
+
+	if (!do_tx && !do_rx)
+		return SBI_EINVAL;
+
+	switch (args->type) {
+	case RPMI_MSG_NORMAL_REQUEST:
+		if (do_tx && do_rx) {
+			tx_qid = RPMI_QUEUE_IDX_A2P_REQ;
+			rx_qid = RPMI_QUEUE_IDX_P2A_ACK;
+		} else if (do_tx) {
+			tx_qid = RPMI_QUEUE_IDX_A2P_REQ;
+		} else if (do_rx) {
+			rx_qid = RPMI_QUEUE_IDX_P2A_REQ;
+		}
+		break;
+	case RPMI_MSG_POSTED_REQUEST:
+		if (do_tx && do_rx)
+			return SBI_EINVAL;
+		if (do_tx) {
+			tx_qid = RPMI_QUEUE_IDX_A2P_REQ;
+		} else {
+			rx_qid = RPMI_QUEUE_IDX_P2A_REQ;
+		}
+		break;
+	case RPMI_MSG_ACKNOWLDGEMENT:
+		if (do_tx && do_rx)
+			return SBI_EINVAL;
+		if (do_tx) {
+			tx_qid = RPMI_QUEUE_IDX_A2P_ACK;
+		} else {
+			rx_qid = RPMI_QUEUE_IDX_P2A_ACK;
+		}
+		break;
+	default:
+		return SBI_ENOTSUPP;
+	}
+
+	if (do_tx) {
+		ret = smq_tx(mctl, tx_qid, srvgrp_chan->servicegroup_id, xfer);
+		if (ret)
+			return ret;
+	}
+
+	if (do_rx) {
+		ret = smq_rx(mctl, rx_qid, srvgrp_chan->servicegroup_id, xfer);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+
+static struct mbox_chan *rpmi_shmem_mbox_request_chan(
+						struct mbox_controller *mbox,
+						u32 *chan_args)
+{
+	int ret;
+	u32 tval[2] = { 0 };
+	struct rpmi_srvgrp_chan *srvgrp_chan;
+	struct rpmi_shmem_mbox_controller *mctl =
+			container_of(mbox,
+				     struct rpmi_shmem_mbox_controller,
+				     controller);
+
+	/* Service group id not defined or in reserved range is invalid */
+	if (chan_args[0] >= RPMI_SRVGRP_ID_MAX_COUNT &&
+		chan_args[0] <= RPMI_SRVGRP_RESERVE_END)
+		return NULL;
+
+	/* Base serivce group is always present so probe other groups */
+	if (chan_args[0] != RPMI_SRVGRP_BASE) {
+		/* Probe service group */
+		ret = smq_base_get_two_u32(mctl,
+					   RPMI_BASE_SRV_PROBE_SERVICE_GROUP,
+					   chan_args, tval);
+		if (ret || !tval[1])
+			return NULL;
+	}
+
+	srvgrp_chan = sbi_zalloc(sizeof(*srvgrp_chan));
+	if (!srvgrp_chan)
+		return NULL;
+
+	srvgrp_chan->servicegroup_id = chan_args[0];
+	srvgrp_chan->servicegroup_version = tval[1];
+
+	return &srvgrp_chan->chan;
+}
+
+static void rpmi_shmem_mbox_free_chan(struct mbox_controller *mbox,
+				      struct mbox_chan *chan)
+{
+	struct rpmi_srvgrp_chan *srvgrp_chan = to_srvgrp_chan(chan);
+	sbi_free(srvgrp_chan);
+}
+
+extern struct fdt_mailbox fdt_mailbox_rpmi_shmem;
+
+static int rpmi_shmem_transport_init(struct rpmi_shmem_mbox_controller *mctl,
+				     const void *fdt, int nodeoff)
+{
+	const char *name;
+	int count, len, ret, qid;
+	uint64_t reg_addr, reg_size;
+	const fdt32_t *prop_slotsz;
+	struct smq_queue_ctx *qctx;
+
+	ret = fdt_node_check_compatible(fdt, nodeoff,
+					"riscv,rpmi-shmem-mbox");
+	if (ret)
+		return ret;
+
+	/* get queue slot size in bytes */
+	prop_slotsz = fdt_getprop(fdt, nodeoff, "riscv,slot-size", &len);
+	if (!prop_slotsz)
+		return SBI_ENOENT;
+
+	mctl->slot_size = fdt32_to_cpu(*prop_slotsz);
+	if (mctl->slot_size < RPMI_SLOT_SIZE_MIN) {
+		sbi_printf("%s: slot_size < mimnum required message size\n",
+			   __func__);
+		mctl->slot_size = RPMI_SLOT_SIZE_MIN;
+	}
+
+	/*
+	 * queue names count is taken as the number of queues
+	 * supported which make it mandatory to provide the
+	 * name of the queue.
+	 */
+	count = fdt_stringlist_count(fdt, nodeoff, "reg-names");
+	if (count < 0 ||
+	    count > (RPMI_QUEUE_IDX_MAX_COUNT + RPMI_REG_IDX_MAX_COUNT))
+		return SBI_EINVAL;
+
+	mctl->queue_count = count - RPMI_REG_IDX_MAX_COUNT;
+
+	/* parse all queues and populate queues context structure */
+	for (qid = 0; qid < mctl->queue_count; qid++) {
+		qctx = &mctl->queue_ctx_tbl[qid];
+
+		/* get each queue share-memory base address and size*/
+		ret = fdt_get_node_addr_size(fdt, nodeoff, qid,
+					     &reg_addr, &reg_size);
+		if (ret < 0 || !reg_addr || !reg_size)
+			return SBI_ENOENT;
+
+		ret = sbi_domain_root_add_memrange(reg_addr, reg_size, reg_size,
+						   (SBI_DOMAIN_MEMREGION_MMIO |
+						    SBI_DOMAIN_MEMREGION_M_READABLE |
+						    SBI_DOMAIN_MEMREGION_M_WRITABLE));
+		if (ret)
+			return ret;
+
+		/* calculate number of slots in each queue */
+		qctx->num_slots =
+			(reg_size - (mctl->slot_size * RPMI_QUEUE_HEADER_SLOTS)) / mctl->slot_size;
+
+		/* setup queue pointers */
+		qctx->headptr = ((void *)(unsigned long)reg_addr) +
+				RPMI_QUEUE_HEAD_SLOT * mctl->slot_size;
+		qctx->tailptr = ((void *)(unsigned long)reg_addr) +
+				RPMI_QUEUE_TAIL_SLOT * mctl->slot_size;
+		qctx->buffer = ((void *)(unsigned long)reg_addr) +
+				RPMI_QUEUE_HEADER_SLOTS * mctl->slot_size;
+
+		/* get the queue name */
+		name = fdt_stringlist_get(fdt, nodeoff, "reg-names",
+					  qid, &len);
+		if (!name || (name && len < 0))
+			return len;
+
+		sbi_memcpy(qctx->name, name, len);
+
+		/* store the index as queue_id */
+		qctx->queue_id = qid;
+
+		SPIN_LOCK_INIT(qctx->queue_lock);
+	}
+
+	/* get the db-reg property name */
+	name = fdt_stringlist_get(fdt, nodeoff, "reg-names", qid, &len);
+	if (!name || (name && len < 0))
+		return len;
+
+	/* fetch doorbell register address*/
+	ret = fdt_get_node_addr_size(fdt, nodeoff, qid, &reg_addr,
+				       &reg_size);
+	if (!ret && !(strncmp(name, "db-reg", strlen("db-reg")))) {
+		mctl->mb_regs = (void *)(unsigned long)reg_addr;
+		ret = sbi_domain_root_add_memrange(reg_addr, reg_size, reg_size,
+						   (SBI_DOMAIN_MEMREGION_MMIO |
+						    SBI_DOMAIN_MEMREGION_M_READABLE |
+						    SBI_DOMAIN_MEMREGION_M_WRITABLE));
+		if (ret)
+			return ret;
+	}
+
+	return SBI_SUCCESS;
+}
+
+static int rpmi_shmem_mbox_init(const void *fdt, int nodeoff,
+				const struct fdt_match *match)
+{
+	struct rpmi_base_get_attributes_resp resp;
+	struct rpmi_shmem_mbox_controller *mctl;
+	struct rpmi_srvgrp_chan *base_srvgrp;
+	u32 tval[2], args[1];
+	int ret = 0;
+
+	mctl = sbi_zalloc(sizeof(*mctl));
+	if (!mctl)
+		return SBI_ENOMEM;
+
+	/* Initialization transport from device tree */
+	ret = rpmi_shmem_transport_init(mctl, fdt, nodeoff);
+	if (ret)
+		goto fail_free_controller;
+
+	/* Register mailbox controller */
+	mctl->controller.id = nodeoff;
+	mctl->controller.max_xfer_len =
+			mctl->slot_size - sizeof(struct rpmi_message_header);
+	mctl->controller.driver = &fdt_mailbox_rpmi_shmem;
+	mctl->controller.request_chan = rpmi_shmem_mbox_request_chan;
+	mctl->controller.free_chan = rpmi_shmem_mbox_free_chan;
+	mctl->controller.xfer = rpmi_shmem_mbox_xfer;
+	ret = mbox_controller_add(&mctl->controller);
+	if (ret)
+		goto fail_free_controller;
+
+	/* Request base service group channel */
+	tval[0] = RPMI_SRVGRP_BASE;
+	mctl->base_chan = mbox_controller_request_chan(&mctl->controller,
+							tval);
+	if (!mctl->base_chan) {
+		ret = SBI_ENOENT;
+		goto fail_remove_controller;
+	}
+
+	/* Update base service group version */
+	base_srvgrp = to_srvgrp_chan(mctl->base_chan);
+	args[0] = RPMI_SRVGRP_BASE;
+	ret = smq_base_get_two_u32(mctl, RPMI_BASE_SRV_PROBE_SERVICE_GROUP,
+				   &args[0], tval);
+	if (ret)
+		goto fail_free_chan;
+	base_srvgrp->servicegroup_version = tval[1];
+	if (base_srvgrp->servicegroup_version < RPMI_BASE_VERSION_MIN) {
+		ret = SBI_EINVAL;
+		goto fail_free_chan;
+	}
+
+	/* Get implementation id */
+	ret = smq_base_get_two_u32(mctl,
+				   RPMI_BASE_SRV_GET_IMPLEMENTATION_VERSION,
+				   NULL, tval);
+	if (ret)
+		goto fail_free_chan;
+	mctl->impl_version = tval[1];
+
+	/* Get implementation version */
+	ret = smq_base_get_two_u32(mctl, RPMI_BASE_SRV_GET_IMPLEMENTATION_IDN,
+				   NULL, tval);
+	if (ret)
+		goto fail_free_chan;
+	mctl->impl_id = tval[1];
+
+	/* Get specification version */
+	ret = smq_base_get_two_u32(mctl, RPMI_BASE_SRV_GET_SPEC_VERSION,
+				   NULL, tval);
+	if (ret)
+		goto fail_free_chan;
+	mctl->spec_version = tval[1];
+	if (mctl->spec_version < RPMI_BASE_VERSION_MIN ||
+	    mctl->spec_version != base_srvgrp->servicegroup_version) {
+		ret = SBI_EINVAL;
+		goto fail_free_chan;
+	}
+
+	/* Get optional features implementation flags */
+	ret = rpmi_normal_request_with_status(
+			mctl->base_chan, RPMI_BASE_SRV_GET_ATTRIBUTES,
+			NULL, 0, 0,
+			&resp, rpmi_u32_count(resp), rpmi_u32_count(resp));
+	if (ret)
+		goto fail_free_chan;
+
+	/* 1: M-mode, 0: S-mode */
+	mctl->base_flags.f0_priv_level =
+			resp.f0 & RPMI_BASE_FLAGS_F0_PRIVILEGE ? 1 : 0;
+	/* 1: Supported, 0: Not Supported */
+	mctl->base_flags.f0_ev_notif_en =
+			resp.f0 & RPMI_BASE_FLAGS_F0_EV_NOTIFY ? 1 : 0;
+	/* 1: Supported, 0: Not Supported */
+	mctl->base_flags.f0_msi_en =
+			resp.f0 & RPMI_BASE_FLAGS_F0_MSI_EN ? 1 : 0;
+
+	/* We only use M-mode RPMI context in OpenSBI */
+	if (!mctl->base_flags.f0_priv_level) {
+		ret = SBI_ENODEV;
+		goto fail_free_chan;
+	}
+
+	/*
+	 * Continue without platform information string if not
+	 * available or if an error is encountered while fetching
+	 */
+	rpmi_get_platform_info(mctl);
+
+	return 0;
+
+fail_free_chan:
+	mbox_controller_free_chan(mctl->base_chan);
+fail_remove_controller:
+	mbox_controller_remove(&mctl->controller);
+fail_free_controller:
+	sbi_free(mctl);
+	return ret;
+}
+
+static const struct fdt_match rpmi_shmem_mbox_match[] = {
+	{ .compatible = "riscv,rpmi-shmem-mbox" },
+	{ },
+};
+
+struct fdt_mailbox fdt_mailbox_rpmi_shmem = {
+	.driver = {
+		.match_table = rpmi_shmem_mbox_match,
+		.init = rpmi_shmem_mbox_init,
+	},
+	.xlate = fdt_mailbox_simple_xlate,
+};
diff --git a/lib/utils/mailbox/objects.mk b/lib/utils/mailbox/objects.mk
index 2135898c..746b0313 100644
--- a/lib/utils/mailbox/objects.mk
+++ b/lib/utils/mailbox/objects.mk
@@ -11,3 +11,8 @@ libsbiutils-objs-$(CONFIG_FDT_MAILBOX) += mailbox/fdt_mailbox.o
 libsbiutils-objs-$(CONFIG_FDT_MAILBOX) += mailbox/fdt_mailbox_drivers.carray.o
 
 libsbiutils-objs-$(CONFIG_MAILBOX) += mailbox/mailbox.o
+
+libsbiutils-objs-$(CONFIG_RPMI_MAILBOX) += mailbox/rpmi_mailbox.o
+
+carray-fdt_mailbox_drivers-$(CONFIG_FDT_MAILBOX_RPMI_SHMEM) += fdt_mailbox_rpmi_shmem
+libsbiutils-objs-$(CONFIG_FDT_MAILBOX_RPMI_SHMEM) += mailbox/fdt_mailbox_rpmi_shmem.o
diff --git a/lib/utils/mailbox/rpmi_mailbox.c b/lib/utils/mailbox/rpmi_mailbox.c
new file mode 100644
index 00000000..371c719b
--- /dev/null
+++ b/lib/utils/mailbox/rpmi_mailbox.c
@@ -0,0 +1,91 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2023 Ventana Micro Systems Inc.
+ *
+ * Authors:
+ *   Anup Patel <apatel@ventanamicro.com>
+ */
+
+#include <sbi/sbi_error.h>
+#include <sbi_utils/mailbox/mailbox.h>
+#include <sbi_utils/mailbox/rpmi_mailbox.h>
+
+int rpmi_xlate_error(enum rpmi_error error)
+{
+	switch(error) {
+	case RPMI_SUCCESS:
+		return SBI_OK;
+	case RPMI_ERR_FAILED:
+		return SBI_EFAIL;
+	case RPMI_ERR_NOTSUPP:
+		return SBI_ENOTSUPP;
+	case RPMI_ERR_INVALID_PARAM:
+		return SBI_EINVAL;
+	case RPMI_ERR_DENIED:
+		return SBI_EDENIED;
+	case RPMI_ERR_INVALID_ADDR:
+		return SBI_EINVALID_ADDR;
+	case RPMI_ERR_ALREADY:
+		return SBI_EALREADY;
+	case RPMI_ERR_EXTENSION:
+		return SBI_EFAIL;
+	case RPMI_ERR_HW_FAULT:
+		return SBI_EIO;
+	case RPMI_ERR_BUSY:
+		return SBI_EFAIL;
+	case RPMI_ERR_INVALID_STATE:
+		return SBI_EINVALID_STATE;
+	case RPMI_ERR_BAD_RANGE:
+		return SBI_EBAD_RANGE;
+	case RPMI_ERR_TIMEOUT:
+		return SBI_ETIMEDOUT;
+	case RPMI_ERR_IO:
+		return SBI_EIO;
+	case RPMI_ERR_NO_DATA:
+		return SBI_EFAIL;
+	default:
+		return SBI_EUNKNOWN;
+	}
+}
+
+int rpmi_normal_request_with_status(
+			struct mbox_chan *chan, u32 service_id,
+			void *req, u32 req_words, u32 req_endian_words,
+			void *resp, u32 resp_words, u32 resp_endian_words)
+{
+	int ret;
+	struct mbox_xfer xfer;
+	struct rpmi_message_args args = { 0 };
+
+	args.type = RPMI_MSG_NORMAL_REQUEST;
+	args.service_id = service_id;
+	args.tx_endian_words = req_endian_words;
+	args.rx_endian_words = resp_endian_words;
+	mbox_xfer_init_txrx(&xfer, &args,
+			req, sizeof(u32) * req_words, RPMI_DEF_TX_TIMEOUT,
+			resp, sizeof(u32) * resp_words, RPMI_DEF_RX_TIMEOUT);
+
+	ret = mbox_chan_xfer(chan, &xfer);
+	if (ret)
+		return ret;
+
+	return rpmi_xlate_error(((u32 *)resp)[0]);
+}
+
+int rpmi_posted_request(
+		struct mbox_chan *chan, u32 service_id,
+		void *req, u32 req_words, u32 req_endian_words)
+{
+	struct mbox_xfer xfer;
+	struct rpmi_message_args args = { 0 };
+
+	args.type = RPMI_MSG_POSTED_REQUEST;
+	args.flags = RPMI_MSG_FLAGS_NO_RX;
+	args.service_id = service_id;
+	args.tx_endian_words = req_endian_words;
+	mbox_xfer_init_tx(&xfer, &args,
+			  req, sizeof(u32) * req_words, RPMI_DEF_TX_TIMEOUT);
+
+	return mbox_chan_xfer(chan, &xfer);
+}
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 079bc4fe..233a9a89 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -20,6 +20,9 @@ CONFIG_FDT_IRQCHIP=y
 CONFIG_FDT_IRQCHIP_APLIC=y
 CONFIG_FDT_IRQCHIP_IMSIC=y
 CONFIG_FDT_IRQCHIP_PLIC=y
+CONFIG_FDT_MAILBOX=y
+CONFIG_RPMI_MAILBOX=y
+CONFIG_FDT_MAILBOX_RPMI_SHMEM=y
 CONFIG_FDT_REGMAP=y
 CONFIG_FDT_REGMAP_SYSCON=y
 CONFIG_FDT_RESET=y
-- 
2.43.0


