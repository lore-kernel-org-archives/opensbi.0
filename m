Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E06AC87FCD
	for <opensbi@archiver.kernel.org>; Fri, 25 Jul 2025 09:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:Date:Subject:Mime-Version:To:
	Message-Id:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hJMqsmx6TZ+W/pkZtQR3G/KW7Ltkc3PhBAfpFqNpTic=; b=aA6+ytr/wb7EWi
	N+VUYe2WU68T1qIkxYRJgb88UYnJ3xwflX0139eCxBwVaVp8Ya9uKMArTZ1nyc+nEAvueQbrXIhlT
	5sP6Z488UP7ffFQXlkO7fo3Ooc8JoXzKx4vjMuINlKj6GskKx4ML8rZ1bwqZRk2e7c/y8GsbGvPck
	gui+eu/ev935fwuKske7oqc4DdkWkoCUpplQQdU9+HurIsMMcYM0pvqpGkBI7au5xibvUIAd5ldzJ
	rkJzOnnl/5533gHTVxeUwZd/SresDGSxksjsStib7cbwfUVjo2Qpbma5NFUryA7zPmTMLyP6o+1X8
	q5IRYkpaMpjKuKDRqGdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufEWK-00000009RF0-3UlO;
	Fri, 25 Jul 2025 09:15:16 +0000
Received: from sg-1-37.ptr.blmpb.com ([118.26.132.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufEWH-00000009REM-1jtG
	for opensbi@lists.infradead.org;
	Fri, 25 Jul 2025 09:15:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=nzhnb-com.20200927.dkim.feishu.cn; t=1753434901;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=C6ejhh0JpgzqxC3B34PFlOWPhAFYwOH7moyMrnxaC1I=;
 b=CY3fVdWiTOZRRnEJkHey1yceaL9sFXSf4sRSuXZGpgk8JvqIygddBEDH611bmDA2PcEZke
 unuWNq7CYWd+f5GxY/ERpvJ5uHhm88hGnuY1GZQYPELRxw7gVeRlsNdmqdaiHzxCIrzaGN
 1kCeHUbx1e2nA09D2jzw+oaQ4npmRoKAJD0vBUUNGKwtJEQQC24G9v+ML4AgyeAO0AHKx1
 ZDqjk/30NhyBRhV7f2tkQUd3I1t2abQH/mC6SKlaqB4SQV4Su7jahEBVwh8lIbdtda63JB
 si8VWFHVVhKphiV9O/8paKJRlNG5Q8L3cIQ5ER5Bpo+3izR3ENDUxtzpzgRdiw==
Message-Id: <20250725091453.188077-1-zhihong@nzhnb.com>
X-Lms-Return-Path: <lba+268834b12+c51f9b+lists.infradead.org+zhihong@nzhnb.com>
To: <opensbi@lists.infradead.org>
Mime-Version: 1.0
Received: from ubuntu.. ([101.52.204.106]) by smtp.feishu.cn with ESMTPS; Fri, 25 Jul 2025 17:14:58 +0800
Subject: [PATCH] lib: utils: Add PSCI implementation support
Date: Fri, 25 Jul 2025 17:14:53 +0800
X-Original-From: Niu Zhihong <zhihong@nzhnb.com>
From: "Niu Zhihong" <zhihong@nzhnb.com>
X-Mailer: git-send-email 2.45.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_021513_856736_D38CE0EF 
X-CRM114-Status: GOOD (  26.49  )
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

This patch adds Power State Coordination Interface (PSCI) support to OpenSBI.
PSCI provides a standard interface for power management operations such as
CPU power on/off, system suspend/resume, and system reset.

The implementation includes:
- PSCI version information and feature detection
- CPU power management (on/off/suspend)
- System power management (reset/off)
- Affinity level management
- PSCI library utilities and helper functions

This follows the PSCI specification version 1.3 and provides a foundation
for platform-specific power management implementations.

Signed-off-by: Niu Zhihong <zhihong@nzhnb.com>
---
diff --git a/include/sbi_utils/psci/psci.h b/include/sbi_utils/psci/psci.h
new file mode 100644
index 0000000..f063ec2
--- /dev/null
+++ b/include/sbi_utils/psci/psci.h
@@ -0,0 +1,222 @@
+/*
+ * Copyright The OpenSBI Contributors
+ *
+ * See PSCI specification (Version 1.3 issue F.b) for more details.
+ */
+
+#ifndef __PSCI_H__
+#define __PSCI_H__
+
+#include <stdint.h>
+#include <stddef.h>
+
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_hart.h>
+
+#define psci_assert(cond)                                                   \
+	do {                                                                \
+		if (!(cond)) {                                              \
+			sbi_printf("%s:%d, invalid psci state\n", __func__, \
+				   __LINE__);                               \
+			sbi_hart_hang();                                    \
+		}                                                           \
+	} while (0)
+
+/* Version 1.1 */
+#define PSCI_MAJOR_VER (1 << 16)
+#define PSCI_MINOR_VER 1
+
+#define PSCI_E_SUCCESS 0
+#define PSCI_E_NOT_SUPPORTED -1
+#define PSCI_E_INVALID_PARAMS -2
+#define PSCI_E_DENIED -3
+#define PSCI_E_ALREADY_ON -4
+#define PSCI_E_ON_PENDING -5
+#define PSCI_E_INTERN_FAIL -6
+#define PSCI_E_NOT_PRESENT -7
+#define PSCI_E_DISABLED -8
+#define PSCI_E_INVALID_ADDRESS -9
+
+/* PSCI function IDs */
+#define PSCI_FN_VERSION 0x84000000
+#define PSCI_FN_CPU_SUSPEND_SMC32 0x84000001
+#define PSCI_FN_CPU_SUSPEND_SMC64 0xC4000001
+#define PSCI_FN_CPU_OFF 0x84000002
+#define PSCI_FN_CPU_ON_SMC32 0x84000003
+#define PSCI_FN_CPU_ON_SMC64 0xC4000003
+#define PSCI_FN_AFFINITY_INFO_SMC32 0x84000004
+#define PSCI_FN_AFFINITY_INFO_SMC64 0xC4000004
+#define PSCI_FN_SYSTEM_OFF 0x84000008
+#define PSCI_FN_SYSTEM_RESET 0x84000009
+#define PSCI_FN_PSCI_FEATURES 0x8400000A
+#define PSCI_FN_SYSTEM_OFF2_SMC32 0x84000015
+#define PSCI_FN_SYSTEM_OFF2_SMC64 0xC4000015
+
+/* SMCCC function IDs */
+#define SMCCC_VERSION 0x80000000
+
+/* PSCI AFFINITY_INFO return values */
+#define PSCI_AFFINITY_STATE_ON 0
+#define PSCI_AFFINITY_STATE_OFF 1
+#define PSCI_AFFINITY_STATE_ON_PENDING 2
+
+/* PSCI power state TYPEs */
+#define PSCI_PSTATE_TYPE_STANDBY 0x0
+#define PSCI_PSTATE_TYPE_POWERDOWN 0x1
+
+/* PSCI power state IDs */
+#define PSCI_PSTATE_ID_RUN 0x0
+#define PSCI_PSTATE_ID_STANDBY 0x1
+#define PSCI_PSTATE_ID_RETENTION 0x2
+#define PSCI_PSTATE_ID_POWERDOWN 0x3
+
+/**
+ * Description:
+ * Return the version of PSCI implemented. This function allows a caller
+ * to ascertain the current version of the PSCI interface.
+ * 
+ * Return Value:
+ * uint32_t - 31-bit unsigned integer containing version information:
+ * - Bits[31:16]: Major Version (upper 15 bits)
+ * - Bits[15:0]:  Minor Version (lower 16 bits)
+ * 
+ * Current Implementation:
+ * - Major Version: 1 (PSCI_MAJOR_VER)
+ * - Minor Version: 1 (PSCI_MINOR_VER)
+ * - Combined Version: 0x00010001
+ */
+uint32_t psci_version();
+
+/**
+ * Description:
+ * Suspend execution on a core or higher-level topology node. This call is
+ * intended for use in idle subsystems where the core is expected to return
+ * to execution through a wakeup event.
+ * 
+ * Parameters:
+ * - power_state: Describes the target power state for suspension
+ *   - uint32 value defining the power state characteristics
+ *   - Extended StateID format:
+ *     - Bit[31]: Reserved, must be zero
+ *     - Bit[30]: StateType
+ *       - PSCI_PSTATE_TYPE_STANDBY (0): Standby or retention state (no core context lost)
+ *       - PSCI_PSTATE_TYPE_POWERDOWN (1): Powerdown state (core context lost, entry_point_address and context_id valid)
+ *     - Bits[29:28]: Reserved, must be zero
+ *     - Bits[27:0]: StateID (platform-specific state identifier)
+ *         - PSCI_PSTATE_ID_RUN (0x0): Normal running state
+ *         - PSCI_PSTATE_ID_STANDBY (0x1): Standby state (quick wake-up)
+ *         - PSCI_PSTATE_ID_RETENTION (0x2): Retention state (context preserved)
+ *         - PSCI_PSTATE_ID_POWERDOWN (0x3): Powerdown state (context lost)
+ *   - Format is determined by PSCI_FEATURES bit[1] for CPU_SUSPEND
+ *
+ * - entry_point_address: Resume execution address after wakeup
+ *   - Only valid for powerdown states; ignored for standby states
+ * 
+ * - context_id: Context value for powerdown states
+ *   - Only valid for powerdown states; ignored for standby states
+ * 
+ * Return Value:
+ * intptr_t - Result of the CPU_SUSPEND operation:
+ * - PSCI_E_SUCCESS: Operation completed successfully
+ * - PSCI_E_INVALID_PARAMS: Invalid parameters provided
+ * - PSCI_E_INVALID_ADDRESS: Invalid entry point address
+ * - PSCI_E_DENIED: Operation denied (only in OS-initiated mode)
+ */
+intptr_t psci_cpu_suspend(uint32_t power_state, uintptr_t entry_point_address,
+			  uintptr_t context_id);
+
+/**
+ * Description:
+ * Power down the calling core. This call is intended for use in hotplug.
+ * A core that is powered down by CPU_OFF can only be powered up again
+ * in response to a CPU_ON call.
+ * 
+ * Return Value:
+ * int32_t - Result of the CPU_OFF operation:
+ * - Does not return when successful (core is powered down)
+ * - PSCI_E_DENIED: Operation denied (only possible return value on failure)
+ */
+int32_t psci_cpu_off();
+
+/**
+ * Description:
+ * Power up a core. This call is used to power up cores that either:
+ * - Have not yet been booted into the calling supervisory software
+ * - Have been previously powered down with a CPU_OFF call
+ * 
+ * Parameters:
+ * - target_cpu: Target CPU to power on
+ *   - In OpenSBI implementation: this corresponds to hartid
+ * 
+ * - entry_point_address: Physical address where core should start execution
+ * 
+ * - context_id: Context value passed to the target core
+ * 
+ * Return Value:
+ * intptr_t - Result of the CPU_ON operation:
+ * - PSCI_E_SUCCESS: Operation completed successfully
+ * - PSCI_E_INVALID_PARAMS: Invalid parameters provided
+ * - PSCI_E_INVALID_ADDRESS: Invalid entry point address
+ * - PSCI_E_ALREADY_ON: Target CPU is already powered on
+ * - PSCI_E_ON_PENDING: Target CPU is already being powered on
+ * - PSCI_E_INTERN_FAIL: Internal failure occurred
+ * - PSCI_E_DENIED: Operation denied
+ */
+intptr_t psci_cpu_on(uintptr_t target_cpu, uintptr_t entry_point_address,
+		     uintptr_t context_id);
+
+/**
+ * Description:
+ * Enable the caller to request status of an affinity instance.
+ * 
+ * Parameters:
+ * - target_affinity: Target affinity instance to query
+ *   - In OpenSBI implementation: this corresponds to hartid
+ * 
+ * - lowest_affinity_level: 
+ *   - From PSCI version 1.0 onwards, AFFINITY_INFO is no longer required to
+ *     support affinity levels higher than 0.
+ *
+ * Return Value:
+ * intptr_t - Status of the affinity instance:
+ * - PSCI_AFFINITY_STATE_ON (0): At least one core in the affinity instance is ON
+ * - PSCI_AFFINITY_STATE_OFF (1): Affinity instance is OFF
+ * - PSCI_AFFINITY_STATE_ON_PENDING (2): Affinity instance is transitioning to ON state
+ * - PSCI_E_INVALID_PARAMS: Invalid parameters provided
+ */
+intptr_t psci_affinity_info(uintptr_t target_affinity,
+			    uint32_t lowest_affinity_level);
+
+/**
+ * Description:
+ * Shut down the system.
+ */
+void psci_system_off();
+
+/**
+ * Description:
+ * Reset the system.
+ */
+void psci_system_reset();
+
+/**
+ * Description:
+ * Query API that allows discovering whether SMCCC_VERSION or a specific PSCI 
+ * function is implemented and its features. This function is introduced in 
+ * PSCI 1.0 specification.
+ * 
+ * Parameters:
+ * - psci_func_id: Function ID of PSCI Function or SMCCC_VERSION
+ * 
+ * Return values:
+ * - PSCI_E_NOT_SUPPORTED: if the function identified by psci_func_id is not 
+ *   implemented or is an invalid function ID
+ * - Feature flags (int32): A set of feature flags associated with the 
+ *   implemented function indicated by psci_func_id. Feature flags are specific 
+ *   to each function. Format:
+ *   - Bit[31] is zero
+ *   - Bits[30:0] represent the feature flags
+ */
+int32_t psci_features(uint32_t psci_func_id);
+
+#endif /* __PSCI_H__ */
diff --git a/lib/utils/Kconfig b/lib/utils/Kconfig
index 901ba56..5dada1e 100644
--- a/lib/utils/Kconfig
+++ b/lib/utils/Kconfig
@@ -34,4 +34,6 @@ source "$(OPENSBI_SRC_DIR)/lib/utils/timer/Kconfig"
 
 source "$(OPENSBI_SRC_DIR)/lib/utils/mpxy/Kconfig"
 
+source "$(OPENSBI_SRC_DIR)/lib/utils/psci/Kconfig"
+
 endmenu
diff --git a/lib/utils/psci/Kconfig b/lib/utils/psci/Kconfig
new file mode 100644
index 0000000..f818cf7
--- /dev/null
+++ b/lib/utils/psci/Kconfig
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: BSD-2-Clause
+# Copyright The OpenSBI Contributors
+
+menu "Arm Power State Coordination Interface Support"
+
+config ARM_PSCI
+	bool "Support PSCI protocol"
+	default n
+
+endmenu
diff --git a/lib/utils/psci/objects.mk b/lib/utils/psci/objects.mk
new file mode 100644
index 0000000..558dcae
--- /dev/null
+++ b/lib/utils/psci/objects.mk
@@ -0,0 +1,19 @@
+#
+# Copyright The OpenSBI Contributors
+#
+
+libsbiutils-objs-${CONFIG_ARM_PSCI} += psci/psci_version.o
+
+libsbiutils-objs-${CONFIG_ARM_PSCI} += psci/psci_cpu_suspend.o
+
+libsbiutils-objs-$(CONFIG_ARM_PSCI) += psci/psci_cpu_off.o
+
+libsbiutils-objs-$(CONFIG_ARM_PSCI) += psci/psci_cpu_on.o
+
+libsbiutils-objs-${CONFIG_ARM_PSCI} += psci/psci_affinity_info.o
+
+libsbiutils-objs-${CONFIG_ARM_PSCI} += psci/psci_system_off.o
+
+libsbiutils-objs-${CONFIG_ARM_PSCI} += psci/psci_system_reset.o
+
+libsbiutils-objs-${CONFIG_ARM_PSCI} += psci/psci_features.o
diff --git a/lib/utils/psci/psci_affinity_info.c b/lib/utils/psci/psci_affinity_info.c
new file mode 100644
index 0000000..e9b795f
--- /dev/null
+++ b/lib/utils/psci/psci_affinity_info.c
@@ -0,0 +1,72 @@
+/*
+ * Copyright The OpenSBI Contributors
+ */
+
+#include <sbi_utils/psci/psci.h>
+#include <sbi/sbi_hsm.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_ecall_interface.h>
+
+intptr_t psci_affinity_info(uintptr_t target_affinity,
+			    uint32_t lowest_affinity_level)
+{
+	struct sbi_scratch *scratch  = sbi_scratch_thishart_ptr();
+	const struct sbi_domain *dom = sbi_domain_thishart_ptr();
+	uint32_t target_hartid	     = (uint32_t)target_affinity;
+	int hart_state;
+
+	/* Validate that we have a valid scratch area and domain */
+	if (!scratch || !dom)
+		return PSCI_E_INTERN_FAIL;
+
+	/* 
+	 * PSCI v1.0+ allows implementations to only support level 0 (individual cores)
+	 * For now, we only support querying individual hart/core state (level 0)
+	 */
+	if (lowest_affinity_level > 0)
+		return PSCI_E_INVALID_PARAMS;
+
+	/* Check if target_affinity describes a valid hartid */
+	if (!sbi_hartid_valid(target_hartid))
+		return PSCI_E_INVALID_PARAMS;
+
+	/* Check if the target hart is assigned to the current domain */
+	if (!sbi_domain_is_assigned_hart(
+		    dom, sbi_hartid_to_hartindex(target_hartid)))
+		return PSCI_E_INVALID_PARAMS;
+
+	/* Get the current state of the target hart */
+	hart_state = sbi_hsm_hart_get_state(dom, target_hartid);
+	if (hart_state < 0)
+		return PSCI_E_INVALID_PARAMS;
+
+	/* Map SBI HSM states to PSCI affinity states */
+	switch (hart_state) {
+	case SBI_HSM_STATE_STARTED:
+	case SBI_HSM_STATE_SUSPENDED:
+	case SBI_HSM_STATE_RESUME_PENDING:
+		/*
+		 * PSCI ON: At least one core in the affinity instance is ON
+		 */
+		return PSCI_AFFINITY_STATE_ON;
+
+	case SBI_HSM_STATE_STOPPED:
+		/*
+		 * PSCI OFF: All cores in the affinity instance are OFF
+		 */
+		return PSCI_AFFINITY_STATE_OFF;
+
+	case SBI_HSM_STATE_START_PENDING:
+	case SBI_HSM_STATE_STOP_PENDING:
+	case SBI_HSM_STATE_SUSPEND_PENDING:
+		/*
+		 * PSCI ON_PENDING: The affinity instance is transitioning to an ON state
+		 */
+		return PSCI_AFFINITY_STATE_ON_PENDING;
+
+	default:
+		/* Invalid or unknown state */
+		return PSCI_E_INTERN_FAIL;
+	}
+}
diff --git a/lib/utils/psci/psci_cpu_off.c b/lib/utils/psci/psci_cpu_off.c
new file mode 100644
index 0000000..3e1940a
--- /dev/null
+++ b/lib/utils/psci/psci_cpu_off.c
@@ -0,0 +1,30 @@
+/*
+ * Copyright The OpenSBI Contributors
+ */
+
+#include <sbi_utils/psci/psci.h>
+#include <sbi/sbi_hsm.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi/sbi_domain.h>
+
+int32_t psci_cpu_off()
+{
+	struct sbi_scratch *scratch  = sbi_scratch_thishart_ptr();
+	const struct sbi_domain *dom = sbi_domain_thishart_ptr();
+	int ret;
+
+	/* Validate that we have a valid scratch area */
+	psci_assert(scratch != NULL);
+	psci_assert(dom != NULL);
+
+	ret = sbi_hsm_hart_stop(scratch, true);
+
+	/* We should never reach here if the hart stop succeeds */
+	if (ret != 0) {
+		return PSCI_E_DENIED;
+	}
+
+	/* This point should never be reached */
+	psci_assert(0);
+	return PSCI_E_DENIED;
+}
diff --git a/lib/utils/psci/psci_cpu_on.c b/lib/utils/psci/psci_cpu_on.c
new file mode 100644
index 0000000..17e5e1b
--- /dev/null
+++ b/lib/utils/psci/psci_cpu_on.c
@@ -0,0 +1,89 @@
+/*
+ * Copyright The OpenSBI Contributors
+ */
+
+#include <sbi_utils/psci/psci.h>
+#include <sbi/sbi_hsm.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_ecall_interface.h>
+#include <sbi/sbi_error.h>
+
+intptr_t psci_cpu_on(uintptr_t target_cpu, uintptr_t entry_point_address,
+		     uintptr_t context_id)
+{
+	struct sbi_scratch *scratch  = sbi_scratch_thishart_ptr();
+	const struct sbi_domain *dom = sbi_domain_thishart_ptr();
+	struct sbi_scratch *remote_scratch;
+	uint32_t target_hartid = (uint32_t)target_cpu;
+	int hart_state;
+	int ret;
+
+	/* Validate that we have a valid scratch area and domain */
+	psci_assert(scratch != NULL);
+	psci_assert(dom != NULL);
+
+	/* Check if target_cpu describes a valid MPIDR/hartid */
+	if (!sbi_hartid_valid(target_hartid)) {
+		return PSCI_E_INVALID_PARAMS;
+	}
+
+	/* Get scratch pointer for target hart */
+	remote_scratch = sbi_hartid_to_scratch(target_hartid);
+	if (!remote_scratch) {
+		return PSCI_E_INVALID_PARAMS;
+	}
+
+	/* Check if the entry point address is valid for the caller's domain */
+	if (!sbi_domain_check_addr(dom, entry_point_address, PRV_S,
+				   SBI_DOMAIN_EXECUTE)) {
+		return PSCI_E_INVALID_ADDRESS;
+	}
+
+	/* Get current state of the target hart */
+	hart_state = sbi_hsm_hart_get_state(dom, target_hartid);
+
+	switch (hart_state) {
+	case SBI_HSM_STATE_STARTED:
+		/* Hart is already running */
+		return PSCI_E_ALREADY_ON;
+
+	case SBI_HSM_STATE_START_PENDING:
+		/* Hart start is already pending */
+		return PSCI_E_ON_PENDING;
+
+	case SBI_HSM_STATE_STOPPED:
+		/* Hart is stopped, we can start it */
+		break;
+
+	default:
+		/* Invalid state or other error */
+		return PSCI_E_INVALID_PARAMS;
+	}
+
+	/* 
+	 * Start the target hart
+	 * - target_hartid: the hart to start
+	 * - entry_point_address: where the hart should start execution
+	 * - PRV_S: start in supervisor mode
+	 * - context_id: passed as argument to the started hart
+	 */
+	ret = sbi_hsm_hart_start(remote_scratch, dom, target_hartid,
+				 entry_point_address, PRV_S, context_id);
+
+	/* Convert SBI error codes to PSCI error codes */
+	switch (ret) {
+	case SBI_SUCCESS:
+		return PSCI_E_SUCCESS;
+	case SBI_ERR_INVALID_PARAM:
+		return PSCI_E_INVALID_PARAMS;
+	case SBI_ERR_INVALID_ADDRESS:
+		return PSCI_E_INVALID_ADDRESS;
+	case SBI_ERR_ALREADY_STARTED:
+		return PSCI_E_ALREADY_ON;
+	case SBI_ERR_DENIED:
+		return PSCI_E_DENIED;
+	default:
+		return PSCI_E_INTERN_FAIL;
+	}
+}
diff --git a/lib/utils/psci/psci_cpu_suspend.c b/lib/utils/psci/psci_cpu_suspend.c
new file mode 100644
index 0000000..16b0e5c
--- /dev/null
+++ b/lib/utils/psci/psci_cpu_suspend.c
@@ -0,0 +1,151 @@
+/*
+ * Copyright The OpenSBI Contributors
+ */
+
+#include <sbi_utils/psci/psci.h>
+#include <sbi/sbi_hsm.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_ecall_interface.h>
+#include <sbi/sbi_error.h>
+
+/* PSCI power state TYPEs */
+#define PSCI_PSTATE_TYPE_SHIFT 30
+#define PSCI_PSTATE_TYPE_MASK 0x1
+
+/* PSCI power state StateID */
+#define PSCI_PSTATE_ID_SHIFT 0
+#define PSCI_PSTATE_ID_MASK 0x0FFFFFFF
+
+/* Helper macros for power state */
+#define psci_get_pstate_type(pstate) \
+	(((pstate) >> PSCI_PSTATE_TYPE_SHIFT) & PSCI_PSTATE_TYPE_MASK)
+#define psci_get_pstate_id(pstate) \
+	(((pstate) >> PSCI_PSTATE_ID_SHIFT) & PSCI_PSTATE_ID_MASK)
+
+intptr_t psci_cpu_suspend(uint32_t power_state, uintptr_t entry_point_address,
+			  uintptr_t context_id)
+{
+	struct sbi_scratch *scratch  = sbi_scratch_thishart_ptr();
+	const struct sbi_domain *dom = sbi_domain_thishart_ptr();
+	uint32_t pstate_type, pstate_id, suspend_type;
+	int ret;
+
+	/* Validate runtime environment */
+	psci_assert(scratch != NULL);
+	psci_assert(dom != NULL);
+
+	/* Validate power state format - check reserved bits */
+	if (power_state & 0x80000000) { /* Bit[31] must be zero */
+		return PSCI_E_INVALID_PARAMS;
+	}
+	if (power_state & 0x30000000) { /* Bits[29:28] must be zero */
+		return PSCI_E_INVALID_PARAMS;
+	}
+
+	/* Extract StateType and StateID from power_state */
+	pstate_type = psci_get_pstate_type(power_state);
+	pstate_id   = psci_get_pstate_id(power_state);
+
+	/* Validate StateID values */
+	if (pstate_id > PSCI_PSTATE_ID_POWERDOWN) {
+		return PSCI_E_INVALID_PARAMS;
+	}
+
+	/*
+	 * Handle different suspend types based on PSCI specification:
+	 * - STANDBY: Retention state, context preserved, quick wake-up
+	 * - POWERDOWN: Context lost, requires entry_point_address and context_id
+	 * 
+	 * StateID provides platform-specific power state information:
+	 * - PSCI_PSTATE_ID_RUN (0x0): Normal running state (invalid for suspend)
+	 * - PSCI_PSTATE_ID_STANDBY (0x1): Standby state (quick wake-up)
+	 * - PSCI_PSTATE_ID_RETENTION (0x2): Retention state (context preserved)
+	 * - PSCI_PSTATE_ID_POWERDOWN (0x3): Powerdown state (context lost)
+	 */
+	if (pstate_type == PSCI_PSTATE_TYPE_STANDBY) {
+		/*
+		 * Standby/Retention suspend:
+		 * - Core context is preserved
+		 * - entry_point_address and context_id are ignored
+		 * - Use retentive suspend mode
+		 * - Valid StateIDs: STANDBY, RETENTION
+		 */
+		if (pstate_id != PSCI_PSTATE_ID_STANDBY &&
+		    pstate_id != PSCI_PSTATE_ID_RETENTION) {
+			return PSCI_E_INVALID_PARAMS;
+		}
+
+		suspend_type = SBI_HSM_SUSPEND_RET_DEFAULT;
+
+		/* For standby, entry_point_address is ignored but we use current context */
+		entry_point_address = 0; /* Will be ignored by SBI HSM */
+		context_id	    = 0; /* Will be ignored by SBI HSM */
+
+	} else if (pstate_type == PSCI_PSTATE_TYPE_POWERDOWN) {
+		/*
+		 * Powerdown suspend:
+		 * - Core context will be lost
+		 * - entry_point_address must be valid and accessible
+		 * - context_id will be passed to resumed execution
+		 * - Use non-retentive suspend mode
+		 * - Valid StateID: POWERDOWN
+		 */
+		if (pstate_id != PSCI_PSTATE_ID_POWERDOWN) {
+			return PSCI_E_INVALID_PARAMS;
+		}
+
+		suspend_type = SBI_HSM_SUSPEND_NON_RET_DEFAULT;
+
+		/* Validate entry point address for powerdown states */
+		if (!entry_point_address) {
+			return PSCI_E_INVALID_ADDRESS;
+		}
+
+		/* Verify entry point is within caller's domain and executable */
+		if (!sbi_domain_check_addr(dom, entry_point_address, PRV_S,
+					   SBI_DOMAIN_EXECUTE)) {
+			return PSCI_E_INVALID_ADDRESS;
+		}
+
+	} else {
+		/* Invalid StateType - only STANDBY(0) and POWERDOWN(1) are valid */
+		return PSCI_E_INVALID_PARAMS;
+	}
+
+	/*
+	 * Initiate hart suspension through SBI HSM:
+	 * - suspend_type: SBI_HSM_SUSPEND_RET_DEFAULT or SBI_HSM_SUSPEND_NON_RET_DEFAULT
+	 * - entry_point_address: Resume address (powerdown) or 0 (standby)
+	 * - PRV_S: Resume in supervisor privilege mode
+	 * - context_id: Context value passed to resumed execution
+	 */
+	ret = sbi_hsm_hart_suspend(scratch, suspend_type, entry_point_address,
+				   PRV_S, context_id);
+
+	/*
+	 * Handle return values:
+	 * 
+	 * For STANDBY (retentive) suspend:
+	 * - Normal return with PSCI_E_SUCCESS indicates successful wake-up
+	 * 
+	 * For POWERDOWN (non-retentive) suspend:
+	 * - Should NOT return here on success (execution resumes at entry_point_address)
+	 * - If we return here, it indicates suspend was rejected, downgraded, or failed
+	 */
+	switch (ret) {
+	case SBI_SUCCESS:
+		/* Success - either completed standby or failed powerdown */
+		return PSCI_E_SUCCESS;
+	case SBI_ERR_INVALID_PARAM:
+		return PSCI_E_INVALID_PARAMS;
+	case SBI_ERR_INVALID_ADDRESS:
+		return PSCI_E_INVALID_ADDRESS;
+	case SBI_ERR_DENIED:
+		return PSCI_E_DENIED;
+	case SBI_ERR_NOT_SUPPORTED:
+		return PSCI_E_NOT_SUPPORTED;
+	default:
+		return PSCI_E_INTERN_FAIL;
+	}
+}
diff --git a/lib/utils/psci/psci_features.c b/lib/utils/psci/psci_features.c
new file mode 100644
index 0000000..120cbc3
--- /dev/null
+++ b/lib/utils/psci/psci_features.c
@@ -0,0 +1,28 @@
+/*
+ * Copyright The OpenSBI Contributors
+ */
+
+#include <sbi_utils/psci/psci.h>
+
+int32_t psci_features(uint32_t psci_func_id)
+{
+	switch (psci_func_id) {
+	case PSCI_FN_VERSION:
+	case PSCI_FN_PSCI_FEATURES:
+	case PSCI_FN_CPU_OFF:
+	case PSCI_FN_CPU_ON_SMC32:
+	case PSCI_FN_CPU_ON_SMC64:
+	case PSCI_FN_AFFINITY_INFO_SMC32:
+	case PSCI_FN_AFFINITY_INFO_SMC64:
+	case PSCI_FN_SYSTEM_OFF:
+	case PSCI_FN_SYSTEM_RESET:
+		return 0;
+
+	case PSCI_FN_CPU_SUSPEND_SMC32:
+	case PSCI_FN_CPU_SUSPEND_SMC64:
+		return 1;
+
+	default:
+		return PSCI_E_NOT_SUPPORTED;
+	}
+}
diff --git a/lib/utils/psci/psci_system_off.c b/lib/utils/psci/psci_system_off.c
new file mode 100644
index 0000000..a2c1058
--- /dev/null
+++ b/lib/utils/psci/psci_system_off.c
@@ -0,0 +1,16 @@
+/*
+ * Copyright The OpenSBI Contributors
+ */
+
+#include <sbi_utils/psci/psci.h>
+#include <sbi/sbi_system.h>
+#include <sbi/sbi_ecall_interface.h>
+
+void __noreturn psci_system_off()
+{
+	sbi_system_reset(SBI_SRST_RESET_TYPE_SHUTDOWN,
+			 SBI_SRST_RESET_REASON_NONE);
+
+	/* We should never reach this point */
+	psci_assert(0);
+}
diff --git a/lib/utils/psci/psci_system_reset.c b/lib/utils/psci/psci_system_reset.c
new file mode 100644
index 0000000..6800322
--- /dev/null
+++ b/lib/utils/psci/psci_system_reset.c
@@ -0,0 +1,16 @@
+/*
+ * Copyright The OpenSBI Contributors
+ */
+
+#include <sbi_utils/psci/psci.h>
+#include <sbi/sbi_system.h>
+#include <sbi/sbi_ecall_interface.h>
+
+void __noreturn psci_system_reset()
+{
+	sbi_system_reset(SBI_SRST_RESET_TYPE_COLD_REBOOT,
+			 SBI_SRST_RESET_REASON_NONE);
+
+	/* We should never reach this point */
+	psci_assert(0);
+}
diff --git a/lib/utils/psci/psci_version.c b/lib/utils/psci/psci_version.c
new file mode 100644
index 0000000..1dbadf6
--- /dev/null
+++ b/lib/utils/psci/psci_version.c
@@ -0,0 +1,10 @@
+/*
+ * Copyright The OpenSBI Contributors
+ */
+
+#include <sbi_utils/psci/psci.h>
+
+uint32_t psci_version(void)
+{
+	return PSCI_MAJOR_VER | PSCI_MINOR_VER;
+}
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index c7a6531..dbb4039 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -58,3 +58,4 @@ CONFIG_FDT_MPXY=y
 CONFIG_FDT_MPXY_RPMI_MBOX=y
 CONFIG_FDT_MPXY_RPMI_CLOCK=y
 CONFIG_FDT_MPXY_RPMI_SYSMSI=y
+CONFIG_ARM_PSCI=y

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
