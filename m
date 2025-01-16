From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 16 Jan 2025 21:26:50 +0530
Subject: [PATCH 11/12] include: sbi_utils: Update RPMI service group IDs and BASE service group
In-Reply-To: <20250116155651.103782-1-apatel@ventanamicro.com>
References: <20250116155651.103782-1-apatel@ventanamicro.com>
Message-ID: <20250116155651.103782-12-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The service group ID assignment and some of the BASE services have
changes in the latest RPMI specification so let's update the RPMI
implementation accordingly.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/mailbox/rpmi_msgprot.h   | 16 +++++++---------
 lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c |  4 ----
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/include/sbi_utils/mailbox/rpmi_msgprot.h b/include/sbi_utils/mailbox/rpmi_msgprot.h
index 17d678a3..363cc653 100644
--- a/include/sbi_utils/mailbox/rpmi_msgprot.h
+++ b/include/sbi_utils/mailbox/rpmi_msgprot.h
@@ -208,11 +208,11 @@ enum rpmi_channel_attribute_id {
 enum rpmi_servicegroup_id {
 	RPMI_SRVGRP_ID_MIN = 0,
 	RPMI_SRVGRP_BASE = 0x0001,
-	RPMI_SRVGRP_SYSTEM_RESET = 0x0002,
-	RPMI_SRVGRP_SYSTEM_SUSPEND = 0x0003,
-	RPMI_SRVGRP_HSM = 0x0004,
-	RPMI_SRVGRP_CPPC = 0x0005,
-	RPMI_SRVGRP_CLOCK = 0x0007,
+	RPMI_SRVGRP_SYSTEM_RESET = 0x0003,
+	RPMI_SRVGRP_SYSTEM_SUSPEND = 0x0004,
+	RPMI_SRVGRP_HSM = 0x0005,
+	RPMI_SRVGRP_CPPC = 0x0006,
+	RPMI_SRVGRP_CLOCK = 0x0008,
 	RPMI_SRVGRP_ID_MAX_COUNT,
 
 	/* Reserved range for service groups */
@@ -243,12 +243,10 @@ enum rpmi_base_service_id {
 	RPMI_BASE_SRV_GET_PLATFORM_INFO = 0x05,
 	RPMI_BASE_SRV_PROBE_SERVICE_GROUP = 0x06,
 	RPMI_BASE_SRV_GET_ATTRIBUTES = 0x07,
-	RPMI_BASE_SRV_SET_MSI = 0x08,
 };
 
-#define RPMI_BASE_FLAGS_F0_PRIVILEGE		(1U << 2)
-#define RPMI_BASE_FLAGS_F0_EV_NOTIFY		(1U << 1)
-#define RPMI_BASE_FLAGS_F0_MSI_EN		(1U)
+#define RPMI_BASE_FLAGS_F0_PRIVILEGE		(1U << 1)
+#define RPMI_BASE_FLAGS_F0_EV_NOTIFY		(1U << 0)
 
 enum rpmi_base_context_priv_level {
 	RPMI_BASE_CONTEXT_PRIV_S_MODE,
diff --git a/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c b/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
index e9f52c7a..5b858d36 100644
--- a/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
+++ b/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
@@ -146,7 +146,6 @@ struct rpmi_shmem_mbox_controller {
 	struct {
 		u8 f0_priv_level;
 		bool f0_ev_notif_en;
-		bool f0_msi_en;
 	} base_flags;
 };
 
@@ -767,9 +766,6 @@ static int rpmi_shmem_mbox_init(const void *fdt, int nodeoff,
 	/* 1: Supported, 0: Not Supported */
 	mctl->base_flags.f0_ev_notif_en =
 			resp.f0 & RPMI_BASE_FLAGS_F0_EV_NOTIFY ? 1 : 0;
-	/* 1: Supported, 0: Not Supported */
-	mctl->base_flags.f0_msi_en =
-			resp.f0 & RPMI_BASE_FLAGS_F0_MSI_EN ? 1 : 0;
 
 	/* We only use M-mode RPMI context in OpenSBI */
 	if (!mctl->base_flags.f0_priv_level) {
-- 
2.43.0


