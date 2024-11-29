From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 29 Nov 2024 21:20:49 +0530
Subject: [PATCH v2 14/17] lib: sbi: Add SBI Message Proxy (MPXY) framework
In-Reply-To: <20241129155052.2866712-1-apatel@ventanamicro.com>
References: <20241129155052.2866712-1-apatel@ventanamicro.com>
Message-ID: <20241129155052.2866712-15-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Rahul Pathak <rpathak@ventanamicro.com>

Introduce SBI Message Proxy (MPXY) framework which allows platform specific
code or drivers to register message protocol specific channels.

This framework enables the supervisor software to send messages belonging
to different message protocols via OpenSBI firmware.

Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
Co-developed-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
Co-developed-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_ecall_interface.h |   2 +
 include/sbi/sbi_error.h           |  15 +-
 include/sbi/sbi_mpxy.h            | 183 ++++++++
 include/sbi/sbi_platform.h        |  17 +
 lib/sbi/objects.mk                |   1 +
 lib/sbi/sbi_init.c                |   6 +
 lib/sbi/sbi_mpxy.c                | 698 ++++++++++++++++++++++++++++++
 7 files changed, 915 insertions(+), 7 deletions(-)
 create mode 100644 include/sbi/sbi_mpxy.h
 create mode 100644 lib/sbi/sbi_mpxy.c

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index 3aa57466..90c4ce11 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -432,6 +432,8 @@ enum sbi_sse_state {
 #define SBI_ERR_NO_SHMEM			-9
 #define SBI_ERR_INVALID_STATE			-10
 #define SBI_ERR_BAD_RANGE			-11
+#define SBI_ERR_TIMEOUT				-12
+#define SBI_ERR_IO				-13
 
 #define SBI_LAST_ERR				SBI_ERR_BAD_RANGE
 
diff --git a/include/sbi/sbi_error.h b/include/sbi/sbi_error.h
index fb78bf62..b40b3319 100644
--- a/include/sbi/sbi_error.h
+++ b/include/sbi/sbi_error.h
@@ -26,16 +26,17 @@
 #define SBI_ENO_SHMEM		SBI_ERR_NO_SHMEM
 #define SBI_EINVALID_STATE	SBI_ERR_INVALID_STATE
 #define SBI_EBAD_RANGE		SBI_ERR_BAD_RANGE
+#define SBI_ETIMEOUT		SBI_ERR_TIMEOUT
+#define SBI_ETIMEDOUT		SBI_ERR_TIMEOUT
+#define SBI_EIO			SBI_ERR_IO
 
 #define SBI_ENODEV		-1000
 #define SBI_ENOSYS		-1001
-#define SBI_ETIMEDOUT		-1002
-#define SBI_EIO			-1003
-#define SBI_EILL		-1004
-#define SBI_ENOSPC		-1005
-#define SBI_ENOMEM		-1006
-#define SBI_EUNKNOWN		-1007
-#define SBI_ENOENT		-1008
+#define SBI_EILL		-1002
+#define SBI_ENOSPC		-1003
+#define SBI_ENOMEM		-1004
+#define SBI_EUNKNOWN		-1005
+#define SBI_ENOENT		-1006
 
 /* clang-format on */
 
diff --git a/include/sbi/sbi_mpxy.h b/include/sbi/sbi_mpxy.h
new file mode 100644
index 00000000..e30a17d1
--- /dev/null
+++ b/include/sbi/sbi_mpxy.h
@@ -0,0 +1,183 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2024 Ventana Micro Systems Inc.
+ *
+ * Authors:
+ *   Rahul Pathak <rpathak@ventanamicro.com>
+ */
+
+#ifndef __SBI_MPXY_H__
+#define __SBI_MPXY_H__
+
+#include <sbi/sbi_list.h>
+
+struct sbi_scratch;
+
+#define SBI_MPXY_MSGPROTO_VERSION(Major, Minor) ((Major << 16) | Minor)
+
+enum sbi_mpxy_attr_id {
+	/* Standard channel attributes managed by MPXY framework */
+	SBI_MPXY_ATTR_MSG_PROT_ID		= 0x00000000,
+	SBI_MPXY_ATTR_MSG_PROT_VER		= 0x00000001,
+	SBI_MPXY_ATTR_MSG_MAX_LEN		= 0x00000002,
+	SBI_MPXY_ATTR_MSG_SEND_TIMEOUT		= 0x00000003,
+	SBI_MPXY_ATTR_MSG_COMPLETION_TIMEOUT	= 0x00000004,
+	SBI_MPXY_ATTR_CHANNEL_CAPABILITY	= 0x00000005,
+	SBI_MPXY_ATTR_SSE_EVENT_ID		= 0x00000006,
+	SBI_MPXY_ATTR_MSI_CONTROL		= 0x00000007,
+	SBI_MPXY_ATTR_MSI_ADDR_LO		= 0x00000008,
+	SBI_MPXY_ATTR_MSI_ADDR_HI		= 0x00000009,
+	SBI_MPXY_ATTR_MSI_DATA			= 0x0000000A,
+	SBI_MPXY_ATTR_EVENTS_STATE_CONTROL	= 0x0000000B,
+	SBI_MPXY_ATTR_STD_ATTR_MAX_IDX,
+	/* Message protocol specific attributes, managed by
+	 * message protocol driver */
+	SBI_MPXY_ATTR_MSGPROTO_ATTR_START	= 0x80000000,
+	SBI_MPXY_ATTR_MSGPROTO_ATTR_END		= 0xffffffff
+};
+
+/**
+ * SBI MPXY Message Protocol IDs
+ */
+enum sbi_mpxy_msgproto_id {
+	SBI_MPXY_MSGPROTO_RPMI_ID = 0x00000000,
+	SBI_MPXY_MSGPROTO_MAX_IDX,
+	/** Vendor specific message protocol IDs */
+	SBI_MPXY_MSGPROTO_VENDOR_START	= 0x80000000,
+	SBI_MPXY_MSGPROTO_VENDOR_END	= 0xffffffff
+};
+
+enum SBI_EXT_MPXY_SHMEM_FLAGS {
+	SBI_EXT_MPXY_SHMEM_FLAG_OVERWRITE		= 0b00,
+	SBI_EXT_MPXY_SHMEM_FLAG_OVERWRITE_RETURN	= 0b01,
+	SBI_EXT_MPXY_SHMEM_FLAG_MAX_IDX
+};
+
+struct sbi_mpxy_msi_info {
+	/* MSI target address low 32-bit */
+	u32 msi_addr_lo;
+	/* MSI target address high 32-bit */
+	u32 msi_addr_hi;
+	/* MSI data */
+	u32 msi_data;
+};
+
+/**
+ * Channel attributes.
+ * NOTE: The sequence of attribute fields are as per the
+ * defined sequence in the attribute table in spec(or as
+ * per the enum sbi_mpxy_attr_id).
+ */
+struct sbi_mpxy_channel_attrs {
+	/* Message protocol ID */
+	u32 msg_proto_id;
+	/* Message protocol Version */
+	u32 msg_proto_version;
+	/* Message protocol maximum message data length(bytes) */
+	u32 msg_data_maxlen;
+	/* Message protocol message send timeout
+	 * in microseconds */
+	u32 msg_send_timeout;
+	/* Message protocol message response timeout in
+	 * microseconds. Its the aggregate of msg_send_timeout
+	 * and the timeout in receiving the response */
+	u32 msg_completion_timeout;
+	/* Bit array for channel capabilities */
+	u32 capability;
+	u32 sse_event_id;
+	u32 msi_control;
+	struct sbi_mpxy_msi_info msi_info;
+	/* Events State Control */
+	u32 eventsstate_ctrl;
+};
+
+/** A Message proxy channel accessible through SBI interface */
+struct sbi_mpxy_channel {
+	/** List head to a set of channels */
+	struct sbi_dlist head;
+	u32 channel_id;
+	struct sbi_mpxy_channel_attrs attrs;
+
+	/**
+	 * Read message protocol attributes
+	 * NOTE: inmem requires little-endian byte-ordering
+	 */
+	int (*read_attributes)(struct sbi_mpxy_channel *channel,
+				u32 *outmem,
+				u32 base_attr_id,
+				u32 attr_count);
+
+	/**
+	 * Write message protocol attributes
+	 * NOTE: outmem requires little-endian byte-ordering
+	 */
+	int (*write_attributes)(struct sbi_mpxy_channel *channel,
+				u32 *inmem,
+				u32 base_attr_id,
+				u32 attr_count);
+	/**
+	 * Send a message and wait for response
+	 * NOTE: msgbuf requires little-endian byte-ordering
+	 */
+	int (*send_message_with_response)(struct sbi_mpxy_channel *channel,
+			    u32 msg_id, void *msgbuf, u32 msg_len,
+			    void *respbuf, u32 resp_max_len,
+			    unsigned long *resp_len);
+
+	/** Send message without response */
+	int (*send_message_without_response)(struct sbi_mpxy_channel *channel,
+			    u32 msg_id, void *msgbuf, u32 msg_len);
+
+	/**
+	 * Get notifications events if supported on a channel
+	 * NOTE: eventsbuf requires little-endian byte-ordering
+	 */
+	int (*get_notification_events)(struct sbi_mpxy_channel *channel,
+					void *eventsbuf, u32 bufsize,
+					unsigned long *events_len);
+
+	/**
+	 * Callback to enable the events state reporting
+	 * in the message protocol implementation
+	 */
+	void (*switch_eventsstate)(u32 enable);
+};
+
+/** Register a Message proxy channel */
+int sbi_mpxy_register_channel(struct sbi_mpxy_channel *channel);
+
+/** Initialize Message proxy subsystem */
+int sbi_mpxy_init(struct sbi_scratch *scratch);
+
+/** Check if some Message proxy channel is available */
+bool sbi_mpxy_channel_available(void);
+
+/** Set Message proxy shared memory on the calling HART */
+int sbi_mpxy_set_shmem(unsigned long shmem_size,
+			unsigned long shmem_phys_lo,
+			unsigned long shmem_phys_hi,
+			unsigned long flags);
+
+/** Get channel IDs list */
+int sbi_mpxy_get_channel_ids(u32 start_index);
+
+/** Read MPXY channel attributes */
+int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count);
+
+/** Write MPXY channel attributes */
+int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count);
+
+/**
+ * Send a message over a MPXY channel.
+ * In case if response is not expected, resp_data_len will be NULL.
+ */
+int sbi_mpxy_send_message(u32 channel_id, u8 msg_id,
+					unsigned long msg_data_len,
+					unsigned long *resp_data_len);
+
+/** Get Message proxy notification events */
+int sbi_mpxy_get_notification_events(u32 channel_id,
+					unsigned long *events_len);
+
+#endif
diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index dc852a5c..6d5fbc7d 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -126,6 +126,9 @@ struct sbi_platform_operations {
 	/** Initialize platform timer during cold boot */
 	int (*timer_init)(void);
 
+	/** Initialize the platform Message Proxy(MPXY) driver */
+	int (*mpxy_init)(void);
+
 	/** Check if SBI vendor extension is implemented or not */
 	bool (*vendor_ext_check)(void);
 	/** platform specific SBI extension implementation provider */
@@ -582,6 +585,20 @@ static inline int sbi_platform_timer_init(const struct sbi_platform *plat)
 	return 0;
 }
 
+/**
+ * Initialize the platform Message Proxy drivers
+ *
+ * @param plat pointer to struct sbi_platform
+ *
+ * @return 0 on success and negative error code on failure
+ */
+static inline int sbi_platform_mpxy_init(const struct sbi_platform *plat)
+{
+	if (plat && sbi_platform_ops(plat)->mpxy_init)
+		return sbi_platform_ops(plat)->mpxy_init();
+	return 0;
+}
+
 /**
  * Check if SBI vendor extension is implemented or not.
  *
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index a6f7c5fa..80b82f8e 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -83,6 +83,7 @@ libsbi-objs-y += sbi_irqchip.o
 libsbi-objs-y += sbi_platform.o
 libsbi-objs-y += sbi_pmu.o
 libsbi-objs-y += sbi_dbtr.o
+libsbi-objs-y += sbi_mpxy.o
 libsbi-objs-y += sbi_scratch.o
 libsbi-objs-y += sbi_sse.o
 libsbi-objs-y += sbi_string.o
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 8a2cfaef..0736345d 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -24,6 +24,7 @@
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_pmu.h>
 #include <sbi/sbi_dbtr.h>
+#include <sbi/sbi_mpxy.h>
 #include <sbi/sbi_sse.h>
 #include <sbi/sbi_system.h>
 #include <sbi/sbi_string.h>
@@ -311,6 +312,11 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 		sbi_hart_hang();
 	}
 
+	rc = sbi_mpxy_init(scratch);
+	if (rc) {
+		sbi_printf("%s: mpxy init failed (error %d)\n", __func__, rc);
+		sbi_hart_hang();
+	}
 	/*
 	 * Note: Finalize domains after HSM initialization so that we
 	 * can startup non-root domains.
diff --git a/lib/sbi/sbi_mpxy.c b/lib/sbi/sbi_mpxy.c
new file mode 100644
index 00000000..639478bf
--- /dev/null
+++ b/lib/sbi/sbi_mpxy.c
@@ -0,0 +1,698 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2024 Ventana Micro Systems Inc.
+ *
+ * Authors:
+ *   Rahul Pathak <rpathak@ventanamicro.com>
+ */
+
+#include <sbi/riscv_asm.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_hart.h>
+#include <sbi/sbi_platform.h>
+#include <sbi/sbi_mpxy.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi/sbi_string.h>
+#include <sbi/sbi_bitops.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_byteorder.h>
+
+/** Offset of pointer to MPXY state in scratch space */
+static unsigned long mpxy_state_offset;
+
+/** List of MPXY proxy channels */
+static SBI_LIST_HEAD(mpxy_channel_list);
+
+/** Invalid Physical Address(all bits 1) */
+#define INVALID_ADDR		(-1U)
+
+/** MPXY Attribute size in bytes */
+#define ATTR_SIZE		(4)
+
+/** Channel Capability - MSI */
+#define CAP_MSI_POS		0
+#define CAP_MSI_MASK		(1U << CAP_MSI_POS)
+
+/** Channel Capability - SSE */
+#define CAP_SSE_POS		1
+#define CAP_SSE_MASK		(1U << CAP_SSE_POS)
+
+/** Channel Capability - Events State */
+#define CAP_EVENTSSTATE_POS	2
+#define CAP_EVENTSSTATE_MASK	(1U << CAP_EVENTSSTATE_POS)
+
+/** Channel Capability - Get Notification function support */
+#define CAP_GET_NOTIFICATIONS_POS	3
+#define CAP_GET_NOTIFICATIONS_MASK	(1U << CAP_GET_NOTIFICATIONS_POS)
+
+/** Channel Capability - Send Message Without Response function support */
+#define CAP_SEND_MSG_WITHOUT_RESP_POS	4
+#define CAP_SEND_MSG_WITHOUT_RESP_MASK	(1U << CAP_SEND_MSG_WITHOUT_RESP_POS)
+
+/** Channel Capability - Send Message With Response function support */
+#define CAP_SEND_MSG_WITH_RESP_POS	5
+#define CAP_SEND_MSG_WITH_RESP_MASK	(1U << CAP_SEND_MSG_WITH_RESP_POS)
+
+/** Helpers to enable/disable channel capability bits
+ * _c: capability variable
+ * _m: capability mask
+ */
+#define CAP_ENABLE(_c, _m)	INSERT_FIELD(_c, _m, 1)
+#define CAP_DISABLE(_c, _m)	INSERT_FIELD(_c, _m, 0)
+#define CAP_GET(_c, _m)		EXTRACT_FIELD(_c, _m)
+
+#if __riscv_xlen == 64
+#define SHMEM_PHYS_ADDR(_hi, _lo) (_lo)
+#elif __riscv_xlen == 32
+#define SHMEM_PHYS_ADDR(_hi, _lo) (((u64)(_hi) << 32) | (_lo))
+#else
+#error "Undefined XLEN"
+#endif
+
+/** Per hart shared memory */
+struct mpxy_shmem {
+	unsigned long shmem_size;
+	unsigned long shmem_addr_lo;
+	unsigned long shmem_addr_hi;
+};
+
+struct mpxy_state {
+	/* MSI support in MPXY */
+	bool msi_avail;
+	/* SSE support in MPXY */
+	bool sse_avail;
+	/* MPXY Shared memory details */
+	struct mpxy_shmem shmem;
+};
+
+/** Disable hart shared memory */
+static inline void sbi_mpxy_shmem_disable(struct mpxy_state *ms)
+{
+	ms->shmem.shmem_size = 0;
+	ms->shmem.shmem_addr_lo = INVALID_ADDR;
+	ms->shmem.shmem_addr_hi = INVALID_ADDR;
+}
+
+/** Check if shared memory is already setup on hart */
+static inline bool mpxy_shmem_enabled(struct mpxy_state *ms)
+{
+	return (ms->shmem.shmem_addr_lo == INVALID_ADDR
+		&& ms->shmem.shmem_addr_hi == INVALID_ADDR) ?
+		false : true;
+}
+
+/** Get hart shared memory base address */
+static inline void *hart_shmem_base(struct mpxy_state *ms)
+{
+	return (void *)(unsigned long)SHMEM_PHYS_ADDR(ms->shmem.shmem_addr_hi,
+						ms->shmem.shmem_addr_lo);
+}
+
+/** Make sure all attributes are packed for direct memcpy in ATTR_READ */
+#define assert_field_offset(field, attr_offset)				\
+	_Static_assert(							\
+		((offsetof(struct sbi_mpxy_channel_attrs, field)) /	\
+		 sizeof(u32)) == attr_offset,				\
+		"field " #field						\
+		" from struct sbi_mpxy_channel_attrs invalid offset, expected " #attr_offset)
+
+assert_field_offset(msg_proto_id, SBI_MPXY_ATTR_MSG_PROT_ID);
+assert_field_offset(msg_proto_version, SBI_MPXY_ATTR_MSG_PROT_VER);
+assert_field_offset(msg_data_maxlen, SBI_MPXY_ATTR_MSG_MAX_LEN);
+assert_field_offset(msg_send_timeout, SBI_MPXY_ATTR_MSG_SEND_TIMEOUT);
+assert_field_offset(msg_completion_timeout, SBI_MPXY_ATTR_MSG_COMPLETION_TIMEOUT);
+assert_field_offset(capability, SBI_MPXY_ATTR_CHANNEL_CAPABILITY);
+assert_field_offset(sse_event_id, SBI_MPXY_ATTR_SSE_EVENT_ID);
+assert_field_offset(msi_control, SBI_MPXY_ATTR_MSI_CONTROL);
+assert_field_offset(msi_info.msi_addr_lo, SBI_MPXY_ATTR_MSI_ADDR_LO);
+assert_field_offset(msi_info.msi_addr_hi, SBI_MPXY_ATTR_MSI_ADDR_HI);
+assert_field_offset(msi_info.msi_data, SBI_MPXY_ATTR_MSI_DATA);
+assert_field_offset(eventsstate_ctrl, SBI_MPXY_ATTR_EVENTS_STATE_CONTROL);
+
+/**
+ * Check if the attribute is a standard attribute or
+ * a message protocol specific attribute
+ * attr_id[31] = 0 for standard
+ * attr_id[31] = 1 for message protocol specific
+ */
+static inline bool mpxy_is_std_attr(u32 attr_id)
+{
+	return (attr_id >> 31) ? false : true;
+}
+
+/** Find channel_id in registered channels list */
+static struct sbi_mpxy_channel *mpxy_find_channel(u32 channel_id)
+{
+	struct sbi_mpxy_channel *channel;
+
+	sbi_list_for_each_entry(channel, &mpxy_channel_list, head)
+		if (channel->channel_id == channel_id)
+			return channel;
+
+	return NULL;
+}
+
+/** Copy attributes word size */
+static void mpxy_copy_std_attrs(u32 *outmem, u32 *inmem, u32 count)
+{
+	int idx;
+	for (idx = 0; idx < count; idx++)
+		outmem[idx] = cpu_to_le32(inmem[idx]);
+}
+
+/** Check if any channel is registered with mpxy framework */
+bool sbi_mpxy_channel_available(void)
+{
+	return sbi_list_empty(&mpxy_channel_list) ? false : true;
+}
+
+static void mpxy_std_attrs_init(struct sbi_mpxy_channel *channel)
+{
+	u32 capability = 0;
+	struct mpxy_state *ms =
+		sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+
+	/* Reset values */
+	channel->attrs.msi_control = 0;
+	channel->attrs.msi_info.msi_data = 0;
+	channel->attrs.msi_info.msi_addr_lo = 0;
+	channel->attrs.msi_info.msi_addr_hi = 0;
+	channel->attrs.capability = 0;
+	channel->attrs.eventsstate_ctrl = 0;
+
+	if (channel->send_message_with_response)
+		capability = CAP_ENABLE(capability, CAP_SEND_MSG_WITH_RESP_MASK);
+
+	if (channel->send_message_without_response)
+		capability = CAP_ENABLE(capability, CAP_SEND_MSG_WITHOUT_RESP_MASK);
+
+	if (channel->get_notification_events) {
+		capability = CAP_ENABLE(capability, CAP_GET_NOTIFICATIONS_MASK);
+		/**
+		 * Check if MSI or SSE available for notification interrrupt.
+		 * Priority given to MSI if both MSI and SSE are avaialble.
+		 */
+		if (ms->msi_avail)
+			capability = CAP_ENABLE(capability, CAP_MSI_MASK);
+		else if (ms->sse_avail) {
+			capability = CAP_ENABLE(capability, CAP_SSE_MASK);
+			/* TODO: Assign SSE EVENT_ID for the channel */
+		}
+
+		/**
+		 * switch_eventstate callback support means support for events
+		 * state reporting supoprt. Enable events state reporting in
+		 * channel capability.
+		 */
+		if (channel->switch_eventsstate)
+			capability = CAP_ENABLE(capability, CAP_EVENTSSTATE_MASK);
+	}
+
+	channel->attrs.capability = capability;
+}
+
+/**
+ * Register a channel with MPXY framework.
+ * Called by message protocol drivers
+ */
+int sbi_mpxy_register_channel(struct sbi_mpxy_channel *channel)
+{
+	if (!channel)
+		return SBI_EINVAL;
+
+	if (mpxy_find_channel(channel->channel_id))
+		return SBI_EALREADY;
+
+	/* Initialize channel specific attributes */
+	mpxy_std_attrs_init(channel);
+
+	SBI_INIT_LIST_HEAD(&channel->head);
+	sbi_list_add_tail(&channel->head, &mpxy_channel_list);
+
+	return SBI_OK;
+}
+
+int sbi_mpxy_init(struct sbi_scratch *scratch)
+{
+	mpxy_state_offset = sbi_scratch_alloc_type_offset(struct mpxy_state);
+	if (!mpxy_state_offset)
+		return SBI_ENOMEM;
+
+	/**
+	 * TODO: Proper support for checking msi support from platform.
+	 * Currently disable msi and sse and use polling
+	 */
+	struct mpxy_state *ms =
+		sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+	ms->msi_avail = false;
+	ms->sse_avail = false;
+
+	sbi_mpxy_shmem_disable(ms);
+
+	return sbi_platform_mpxy_init(sbi_platform_ptr(scratch));
+}
+
+int sbi_mpxy_set_shmem(unsigned long shmem_size, unsigned long shmem_phys_lo,
+		       unsigned long shmem_phys_hi, unsigned long flags)
+{
+	struct mpxy_state *ms =
+		sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+	unsigned long *ret_buf;
+
+	/** Disable shared memory if both hi and lo have all bit 1s */
+	if (shmem_phys_lo == INVALID_ADDR &&
+	    shmem_phys_hi == INVALID_ADDR) {
+		sbi_mpxy_shmem_disable(ms);
+		return SBI_SUCCESS;
+	}
+
+	if (flags >= SBI_EXT_MPXY_SHMEM_FLAG_MAX_IDX)
+		return SBI_ERR_INVALID_PARAM;
+
+	/** Check shared memory size and address aligned to 4K Page */
+	if (!shmem_size || (shmem_size & ~PAGE_MASK) ||
+	    (shmem_phys_lo & ~PAGE_MASK))
+		return SBI_ERR_INVALID_PARAM;
+
+	if (!sbi_domain_check_addr_range(sbi_domain_thishart_ptr(),
+				SHMEM_PHYS_ADDR(shmem_phys_hi, shmem_phys_lo),
+				shmem_size, PRV_S,
+				SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
+		return SBI_ERR_INVALID_ADDRESS;
+
+	/** Save the current shmem details in new shmem region */
+	if (flags == SBI_EXT_MPXY_SHMEM_FLAG_OVERWRITE_RETURN) {
+		ret_buf = (unsigned long *)(ulong)SHMEM_PHYS_ADDR(shmem_phys_hi,
+								  shmem_phys_lo);
+		sbi_hart_map_saddr((unsigned long)ret_buf, shmem_size);
+		ret_buf[0] = cpu_to_lle(ms->shmem.shmem_size);
+		ret_buf[1] = cpu_to_lle(ms->shmem.shmem_addr_lo);
+		ret_buf[2] = cpu_to_lle(ms->shmem.shmem_addr_hi);
+		sbi_hart_unmap_saddr();
+	}
+
+	/** Setup the new shared memory */
+	ms->shmem.shmem_size	= shmem_size;
+	ms->shmem.shmem_addr_lo = shmem_phys_lo;
+	ms->shmem.shmem_addr_hi = shmem_phys_hi;
+
+	return SBI_SUCCESS;
+}
+
+int sbi_mpxy_get_channel_ids(u32 start_index)
+{
+	u32 node_index = 0, node_ret = 0;
+	u32 remaining, returned, max_channelids;
+	u32 channels_count = 0;
+	u32 *shmem_base;
+	struct sbi_mpxy_channel *channel;
+
+	/* Check if the shared memory is being setup or not. */
+	struct mpxy_state *ms =
+		sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+
+	if (!mpxy_shmem_enabled(ms))
+		return SBI_ERR_NO_SHMEM;
+
+	sbi_list_for_each_entry(channel, &mpxy_channel_list, head)
+		channels_count += 1;
+
+	if (start_index > channels_count)
+		return SBI_ERR_INVALID_PARAM;
+
+	shmem_base = hart_shmem_base(ms);
+	sbi_hart_map_saddr((unsigned long)hart_shmem_base(ms),
+				ms->shmem.shmem_size);
+
+	/** number of channel ids which can be stored in shmem adjusting
+	 * for remaining and returned fields */
+	max_channelids = (ms->shmem.shmem_size / sizeof(u32)) - 2;
+	/* total remaining from the start index */
+	remaining = channels_count - start_index;
+	/* how many can be returned */
+	returned = (remaining > max_channelids)? max_channelids : remaining;
+
+	// Iterate over the list of channels to get the channel ids.
+	sbi_list_for_each_entry(channel, &mpxy_channel_list, head) {
+		if (node_index >= start_index &&
+			node_index < (start_index + returned)) {
+			shmem_base[2 + node_ret] = cpu_to_le32(channel->channel_id);
+			node_ret += 1;
+		}
+
+		node_index += 1;
+	}
+
+	/* final remaininig channel ids */
+	remaining = channels_count - (start_index + returned);
+
+	shmem_base[0] = cpu_to_le32(remaining);
+	shmem_base[1] = cpu_to_le32(returned);
+
+	sbi_hart_unmap_saddr();
+
+	return SBI_SUCCESS;
+}
+
+int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
+{
+	int ret = SBI_SUCCESS;
+	u32 *attr_ptr, end_id;
+	void *shmem_base;
+
+	struct mpxy_state *ms =
+		sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+
+	if (!mpxy_shmem_enabled(ms))
+		return SBI_ERR_NO_SHMEM;
+
+	struct sbi_mpxy_channel *channel = mpxy_find_channel(channel_id);
+	if (!channel)
+		return SBI_ERR_NOT_SUPPORTED;
+
+	/* base attribute id is not a defined std attribute or reserved */
+	if (base_attr_id >= SBI_MPXY_ATTR_STD_ATTR_MAX_IDX &&
+		base_attr_id < SBI_MPXY_ATTR_MSGPROTO_ATTR_START)
+		return SBI_ERR_INVALID_PARAM;
+
+	/* Sanity check for base_attr_id and attr_count */
+	if (!attr_count || (attr_count > (ms->shmem.shmem_size / ATTR_SIZE)))
+		return SBI_ERR_INVALID_PARAM;
+
+	shmem_base = hart_shmem_base(ms);
+	end_id = base_attr_id + attr_count - 1;
+
+	sbi_hart_map_saddr((unsigned long)hart_shmem_base(ms),
+				ms->shmem.shmem_size);
+
+	/* Standard attributes range check */
+	if (mpxy_is_std_attr(base_attr_id)) {
+		if (end_id >= SBI_MPXY_ATTR_STD_ATTR_MAX_IDX) {
+			ret = SBI_EBAD_RANGE;
+			goto out;
+		}
+
+		attr_ptr = (u32 *)&channel->attrs;
+		mpxy_copy_std_attrs((u32 *)shmem_base, &attr_ptr[base_attr_id],
+				    attr_count);
+	} else {
+		/**
+		 * Even if the message protocol driver does not provide
+		 * read attribute callback, return bad range error instead
+		 * of not supported to let client distinguish it from channel
+		 * id not supported.
+		 * Check the complate range supported for message protocol
+		 * attributes. Actual supported attributes will be checked
+		 * by the message protocol driver.
+		 */
+		if (!channel->read_attributes ||
+				end_id > SBI_MPXY_ATTR_MSGPROTO_ATTR_END) {
+			ret = SBI_ERR_BAD_RANGE;
+			goto out;
+		}
+
+		/**
+		 * Function expected to return the SBI supported errors
+		 * At this point both base attribute id and only the mpxy
+		 * supported range been verified. Platform callback must
+		 * check if the range requested is supported by message
+		 * protocol driver */
+		ret = channel->read_attributes(channel,
+					       (u32 *)shmem_base,
+					       base_attr_id, attr_count);
+	}
+out:
+	sbi_hart_unmap_saddr();
+	return ret;
+}
+
+/**
+ * Verify the channel standard attribute wrt to write permission
+ * and the value to be set if valid or not.
+ * Only attributes needs to be checked which are defined Read/Write
+ * permission. Other with Readonly permission will result in error.
+ *
+ * Attributes values to be written must also be checked because
+ * before writing a range of attributes, we need to make sure that
+ * either complete range of attributes is written successfully or not
+ * at all.
+ */
+static int mpxy_check_write_std_attr(struct sbi_mpxy_channel *channel,
+				     u32 attr_id, u32 attr_val)
+{
+	int ret = SBI_SUCCESS;
+	struct sbi_mpxy_channel_attrs *attrs = &channel->attrs;
+
+	switch(attr_id) {
+	case SBI_MPXY_ATTR_MSI_CONTROL:
+		if (attr_val > 1)
+			ret = SBI_ERR_INVALID_PARAM;
+		if (attr_val == 1 &&
+		    (attrs->msi_info.msi_addr_lo == INVALID_ADDR) &&
+		    (attrs->msi_info.msi_addr_hi == INVALID_ADDR))
+			ret = SBI_ERR_DENIED;
+		break;
+	case SBI_MPXY_ATTR_MSI_ADDR_LO:
+	case SBI_MPXY_ATTR_MSI_ADDR_HI:
+	case SBI_MPXY_ATTR_MSI_DATA:
+		ret = SBI_SUCCESS;
+		break;
+	case SBI_MPXY_ATTR_EVENTS_STATE_CONTROL:
+		if (attr_val > 1)
+			ret = SBI_ERR_INVALID_PARAM;
+		break;
+	default:
+		/** All RO access attributes falls under default */
+		ret = SBI_ERR_BAD_RANGE;
+	};
+
+	return ret;
+}
+
+/**
+ * Write the attribute value
+ */
+static void mpxy_write_std_attr(struct sbi_mpxy_channel *channel, u32 attr_id,
+			        u32 attr_val)
+{
+	struct mpxy_state *ms =
+		sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+
+	struct sbi_mpxy_channel_attrs *attrs = &channel->attrs;
+
+	switch(attr_id) {
+	case SBI_MPXY_ATTR_MSI_CONTROL:
+		if (ms->msi_avail && attr_val <= 1)
+			attrs->msi_control = attr_val;
+		break;
+	case SBI_MPXY_ATTR_MSI_ADDR_LO:
+		if (ms->msi_avail)
+			attrs->msi_info.msi_addr_lo = attr_val;
+		break;
+	case SBI_MPXY_ATTR_MSI_ADDR_HI:
+		if (ms->msi_avail)
+			attrs->msi_info.msi_addr_hi = attr_val;
+		break;
+	case SBI_MPXY_ATTR_MSI_DATA:
+		if (ms->msi_avail)
+			attrs->msi_info.msi_data = attr_val;
+		break;
+	case SBI_MPXY_ATTR_EVENTS_STATE_CONTROL:
+		if (channel->switch_eventsstate && attr_val <= 1) {
+			attrs->eventsstate_ctrl = attr_val;
+			 /* message protocol callback to enable/disable
+			 * events state reporting. */
+			channel->switch_eventsstate(attr_val);
+		}
+
+		break;
+	};
+}
+
+int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
+{
+	int ret, mem_idx;
+	void *shmem_base;
+	u32 *mem_ptr, attr_id, end_id, attr_val;
+
+	struct mpxy_state *ms =
+		sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+
+	if (!mpxy_shmem_enabled(ms))
+		return SBI_ERR_NO_SHMEM;
+
+	struct sbi_mpxy_channel *channel = mpxy_find_channel(channel_id);
+	if (!channel)
+		return SBI_ERR_NOT_SUPPORTED;
+
+	/* base attribute id is not a defined std attribute or reserved */
+	if (base_attr_id >= SBI_MPXY_ATTR_STD_ATTR_MAX_IDX &&
+		base_attr_id < SBI_MPXY_ATTR_MSGPROTO_ATTR_START)
+		return SBI_ERR_INVALID_PARAM;
+
+	/* Sanity check for base_attr_id and attr_count */
+	if (!attr_count || (attr_count > (ms->shmem.shmem_size / ATTR_SIZE)))
+		return SBI_ERR_INVALID_PARAM;
+
+	shmem_base = hart_shmem_base(ms);
+	end_id = base_attr_id + attr_count - 1;
+
+	sbi_hart_map_saddr((unsigned long)shmem_base, ms->shmem.shmem_size);
+
+	mem_ptr = (u32 *)shmem_base;
+
+	if (mpxy_is_std_attr(base_attr_id)) {
+		if (end_id >= SBI_MPXY_ATTR_STD_ATTR_MAX_IDX) {
+			ret = SBI_ERR_BAD_RANGE;
+			goto out;
+		}
+
+		/** Verify the attribute ids range and values */
+		mem_idx = 0;
+		for (attr_id = base_attr_id; attr_id <= end_id; attr_id++) {
+			attr_val = le32_to_cpu(mem_ptr[mem_idx++]);
+			ret = mpxy_check_write_std_attr(channel,
+							attr_id, attr_val);
+			if (ret)
+				goto out;
+		}
+
+		/* Write the attribute ids values */
+		mem_idx = 0;
+		for (attr_id = base_attr_id; attr_id <= end_id; attr_id++) {
+			attr_val = le32_to_cpu(mem_ptr[mem_idx++]);
+			mpxy_write_std_attr(channel, attr_id, attr_val);
+		}
+	} else {/**
+		 * Message protocol specific attributes:
+		 * If attributes belong to message protocol, they
+		 * are simply passed to the message protocol driver
+		 * callback after checking the valid range.
+		 * Attributes contiguous range & permission & other checks
+		 * are done by the mpxy and message protocol glue layer.
+		 */
+		/**
+		 * Even if the message protocol driver does not provide
+		 * write attribute callback, return bad range error instead
+		 * of not supported to let client distinguish it from channel
+		 * id not supported.
+		 */
+		if (!channel->write_attributes ||
+				end_id > SBI_MPXY_ATTR_MSGPROTO_ATTR_END) {
+			ret = SBI_ERR_BAD_RANGE;
+			goto out;
+		}
+
+		/**
+		 * Function expected to return the SBI supported errors
+		 * At this point both base attribute id and only the mpxy
+		 * supported range been verified. Platform callback must
+		 * check if the range requested is supported by message
+		 * protocol driver */
+		ret = channel->write_attributes(channel,
+					       (u32 *)shmem_base,
+					       base_attr_id, attr_count);
+	}
+out:
+	sbi_hart_unmap_saddr();
+	return ret;
+}
+
+int sbi_mpxy_send_message(u32 channel_id, u8 msg_id,
+			  unsigned long msg_data_len,
+			  unsigned long *resp_data_len)
+{
+	int ret;
+	void *shmem_base, *resp_buf;
+	u32 resp_bufsize;
+
+	struct mpxy_state *ms =
+		sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+
+	if (!mpxy_shmem_enabled(ms))
+		return SBI_ERR_NO_SHMEM;
+
+	struct sbi_mpxy_channel *channel = mpxy_find_channel(channel_id);
+	if (!channel)
+		return SBI_ERR_NOT_SUPPORTED;
+
+	if (resp_data_len && !channel->send_message_with_response)
+		return SBI_ERR_NOT_SUPPORTED;
+
+	if (!resp_data_len && !channel->send_message_without_response)
+		return SBI_ERR_NOT_SUPPORTED;
+
+	if (msg_data_len > ms->shmem.shmem_size ||
+		msg_data_len > channel->attrs.msg_data_maxlen)
+		return SBI_ERR_INVALID_PARAM;
+
+	shmem_base = hart_shmem_base(ms);
+	sbi_hart_map_saddr((unsigned long)shmem_base, ms->shmem.shmem_size);
+
+	if (resp_data_len) {
+		resp_buf = shmem_base;
+		resp_bufsize = ms->shmem.shmem_size;
+		ret = channel->send_message_with_response(channel, msg_id,
+							  shmem_base,
+							  msg_data_len,
+							  resp_buf,
+							  resp_bufsize,
+							  resp_data_len);
+	}
+	else {
+		ret = channel->send_message_without_response(channel, msg_id,
+							     shmem_base,
+							     msg_data_len);
+	}
+
+	sbi_hart_unmap_saddr();
+
+	if (ret == SBI_ERR_TIMEOUT || ret == SBI_ERR_IO)
+		return ret;
+	else if (ret)
+		return SBI_ERR_FAILED;
+
+	if (resp_data_len &&
+	    (*resp_data_len > ms->shmem.shmem_size ||
+	     *resp_data_len > channel->attrs.msg_data_maxlen))
+		return SBI_ERR_FAILED;
+
+	return SBI_SUCCESS;
+}
+
+int sbi_mpxy_get_notification_events(u32 channel_id, unsigned long *events_len)
+{
+	int ret;
+	void *eventsbuf, *shmem_base;
+
+	struct mpxy_state *ms =
+		sbi_scratch_thishart_offset_ptr(mpxy_state_offset);
+
+	if (!mpxy_shmem_enabled(ms))
+		return SBI_ERR_NO_SHMEM;
+
+	struct sbi_mpxy_channel *channel = mpxy_find_channel(channel_id);
+	if (!channel)
+		return SBI_ERR_NOT_SUPPORTED;
+
+	if (!channel->get_notification_events)
+		return SBI_ERR_NOT_SUPPORTED;
+
+	shmem_base = hart_shmem_base(ms);
+	sbi_hart_map_saddr((unsigned long)shmem_base, ms->shmem.shmem_size);
+	eventsbuf = shmem_base;
+	ret = channel->get_notification_events(channel, eventsbuf,
+					       ms->shmem.shmem_size,
+					       events_len);
+	sbi_hart_unmap_saddr();
+
+	if (ret)
+		return ret;
+
+	if (*events_len > ms->shmem.shmem_size)
+		return SBI_ERR_FAILED;
+
+	return SBI_SUCCESS;
+}
-- 
2.43.0


