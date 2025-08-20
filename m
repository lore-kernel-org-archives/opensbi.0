Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58BBCA0EE4
	for <opensbi@archiver.kernel.org>; Wed, 20 Aug 2025 03:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VP6BUj4OQTWAwkQPf/QWY3Ujkj7ZXXYDOwzYELt8Slo=; b=tzEpqmnxGU2MqCbKDvWWQEP4w+
	QaMD/7jjadPr6A5mh1JQuZfwvTj/9x+8+5bRZAsLEVdRW48ysXpvX8W1m6kMUO0KXewF9a38wOzSO
	Ekgt7ALZ6WvBb6fH583JKjr6VVVPs0ZgLR7/dSt/B9JGTuDlG2trHQkabBJZwRKEtdpxMMm8qQODO
	n8cLSNbEibkgdsplnbcgLzbIeL7YDRMEGYG16w9iGH8rTQP4KYCdqX6toMm9xB9jSToYkZVVGEGRC
	cGJiBBTFJReUsGWPv6CYy3dWeMch0M1owkOMhTy3R4IeIk6AlHGnI8vDuwIBiavmiThpdAGUb36WE
	zEhv4dEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZbM-0000000CHSh-10W8;
	Wed, 20 Aug 2025 03:35:04 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZZd-0000000CHEZ-3iXO
	for opensbi@lists.infradead.org;
	Wed, 20 Aug 2025 03:33:19 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-323266cdf64so4739880a91.0
        for <opensbi@lists.infradead.org>; Tue, 19 Aug 2025 20:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755660797; x=1756265597; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nwS7A8k9udcTjfaCx7kzRTWeozcoQGOyqcwSvpTfT7A=;
        b=FJGm0Kktoeip7roCZS2EgEfVC6URyPkjc0qVQx9e8M04GX0EltNIUqpGRUt9NAg0TE
         HfU0B4N2MOb5r7JnLlyTAcMhX1j4r/wMr5j2qzpnxUZrISbdYger0l2OlBis0KKEJ7Ve
         4iB0u+dw1JNoxvAhJPIszEFsupOv1rK7DKi3fWGTWMHmhHwDE6k9NIJoh3nLUPcHxX4d
         kF9jVuFi4bwBwV4gujVIhQVdbyHC+ytginfBGnnE6vMdmU/vIXHc+Quvfx8lsykBuVb/
         Fc+cj8cTtbD9XRKxB/p7QbDHYGUwWirao0Ro6wmd7zb/zQ05jDDbL71DnQCjDdUaF28N
         2hdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755660797; x=1756265597;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nwS7A8k9udcTjfaCx7kzRTWeozcoQGOyqcwSvpTfT7A=;
        b=QLALBJ80JVZDDyj4nP5N4PeKSw8Ri8gWyTxbC/L7legSLpyVaN8ZAebAjU3wULMZkk
         EwaCTVKB63l2IQ0OeEFDDLG11Njy/o0yvNe1Gyrjzut/XwuafJVhYdhaVkprQfAl12JM
         5EiQQdsRez1t8apJYG7QsVyCACI5MKwn7bCc5NkrLyiTtD6wRrF4lvqQvrlkYQJZZjuU
         cKisnb8vaWfsGBAgVQDvYURfjFbXEmL+jYSQ2DBy+zQnTtBV6/LYMcSHDm1uJxEmTt5h
         DK+nqxyjD0rXQT2wdFziuGs9DqPmXU35e+uukuY1wi3TM+2lAMdYTfRvI29xg9YbdghK
         u81A==
X-Gm-Message-State: AOJu0YySEErxxf8+dPWcKZrBk0u/3JKFwnwuCTMPjIUYcIisjXRJuLBP
	Y9gsvFKgtdHSxDyD7a9MnkRs0ceIZbdvKvTIGheJD7J8k17EJd8ePC2D5TU52XT5CzVBA0KSJ13
	tW535Dd070l1Dum7kOSu6MisPOvm/T960ZjRHIwxlXJ3txu/DFnpwCjbGW5nwcWXd38Da6yjGHN
	4II3/EnKmZAefezEwnHdSKcbPmYVyWegYxBEtUJqKRwUP1Aw==
X-Gm-Gg: ASbGncu048TbncPLhrIPT2/lKgyO7x3Y5KghIlKdPFBMoioRAI0DDYQyldvJEuakNBF
	WCj3QIQbYo7TSjSvQ411CwNmq9IkKiUcHlYrR7ppAI4+4aTQ/bjGLEYnjXltyLZq9D/FLEmsncK
	Qm1oqXYzalDbISVSaMWnU3lgcDJCYWzjIn5jEmv27ZzOEWTkr/QArlsyZUuSll4VC5O/31FKnog
	GW30cxsfTtjjAEYjcX1JNosIsKDdWDkXb3x890jihjcXZ8WvBr0ZXtL2TCIJ45js7VC6brpCipB
	VX5C4ZGccsCfOn8uEm1j57dMm2OxBpU/7wNa2qGOxp+zGk9Y3uoVIbQKPsQWW3JTIiycRG3Tv3K
	WbbNK91DDT9SrD4zq+3xiI/f7rl8zd9A+mpXC0bpo+N20
X-Google-Smtp-Source: AGHT+IGntoNpa+kQ4AkTsw80uuJMTd9BaSKKNvK8OajrZ28FxhWhGoKuA2t+nl6DHXdc+kWfVKDAcQ==
X-Received: by 2002:a17:90b:2b48:b0:31f:2bd7:a4d2 with SMTP id 98e67ed59e1d1-324e148988amr2164821a91.35.1755660796624;
        Tue, 19 Aug 2025 20:33:16 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e252ea41sm738430a91.9.2025.08.19.20.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 20:33:16 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH v4 09/11] platform: sifive: Add SiFive TMC0 driver
Date: Wed, 20 Aug 2025 11:32:48 +0800
Message-Id: <20250820033250.544-10-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250820033250.544-1-nick.hu@sifive.com>
References: <20250820033250.544-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_203317_928824_5E72EAB7 
X-CRM114-Status: GOOD (  22.97  )
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
Cc: vincent.chen@sifive.com, anup@brainfault.org, Nick Hu <nick.hu@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

The SiFive TMC0 controls the tile power domains on SiFive platform. The
CPU enters the low power state via the `CEASE` instruction after
configuring the TMC0. Any devices that inside the tile power domain will
be power gated, including the private cache. Therefore flushing the
private cache before entering the low power state.

Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Cyan Yang <cyan.yang@sifive.com>
---
 include/sbi_utils/hsm/fdt_hsm_sifive_inst.h   |  20 +
 include/sbi_utils/hsm/fdt_hsm_sifive_tmc0.h   |  16 +
 lib/utils/hsm/Kconfig                         |   5 +
 lib/utils/hsm/fdt_hsm_sifive_tmc0.c           | 380 ++++++++++++++++++
 lib/utils/hsm/objects.mk                      |   2 +
 platform/generic/Kconfig                      |   5 +
 platform/generic/configs/defconfig            |   2 +
 platform/generic/sifive/objects.mk            |   3 +
 platform/generic/sifive/sifive_dev_platform.c |  57 +++
 9 files changed, 490 insertions(+)
 create mode 100644 include/sbi_utils/hsm/fdt_hsm_sifive_inst.h
 create mode 100644 include/sbi_utils/hsm/fdt_hsm_sifive_tmc0.h
 create mode 100644 lib/utils/hsm/fdt_hsm_sifive_tmc0.c
 create mode 100644 platform/generic/sifive/sifive_dev_platform.c

diff --git a/include/sbi_utils/hsm/fdt_hsm_sifive_inst.h b/include/sbi_utils/hsm/fdt_hsm_sifive_inst.h
new file mode 100644
index 00000000..de8aba19
--- /dev/null
+++ b/include/sbi_utils/hsm/fdt_hsm_sifive_inst.h
@@ -0,0 +1,20 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SiFive Inc.
+ */
+
+#ifndef __FDT_HSM_SIFIVE_INST_H__
+#define __FDT_HSM_SIFIVE_INST_H__
+
+static inline void sifive_cease(void)
+{
+	__asm__ __volatile__(".insn 0x30500073" ::: "memory");
+}
+
+static inline void sifive_cflush(void)
+{
+	__asm__ __volatile__(".insn 0xfc000073" ::: "memory");
+}
+
+#endif
diff --git a/include/sbi_utils/hsm/fdt_hsm_sifive_tmc0.h b/include/sbi_utils/hsm/fdt_hsm_sifive_tmc0.h
new file mode 100644
index 00000000..4ba048b9
--- /dev/null
+++ b/include/sbi_utils/hsm/fdt_hsm_sifive_tmc0.h
@@ -0,0 +1,16 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SiFive Inc.
+ */
+
+#ifndef __FDT_HSM_SIFIVE_TMC0_H__
+#define __FDT_HSM_SIFIVE_TMC0_H__
+
+#ifdef CONFIG_FDT_HSM_SIFIVE_TMC0
+int fdt_hsm_sifive_tmc0_cold_init(void);
+#else
+static inline int fdt_hsm_sifive_tmc0_cold_init(void) { return 0; }
+#endif
+
+#endif
diff --git a/lib/utils/hsm/Kconfig b/lib/utils/hsm/Kconfig
index 1ad7958f..3e6f8909 100644
--- a/lib/utils/hsm/Kconfig
+++ b/lib/utils/hsm/Kconfig
@@ -14,6 +14,11 @@ config FDT_HSM_RPMI
 	depends on FDT_MAILBOX && RPMI_MAILBOX
 	default n
 
+config FDT_HSM_SIFIVE_TMC0
+	bool "FDT SiFive TMC v0 driver"
+	depends on PLATFORM_SIFIVE_DEV
+	default n
+
 endif
 
 endmenu
diff --git a/lib/utils/hsm/fdt_hsm_sifive_tmc0.c b/lib/utils/hsm/fdt_hsm_sifive_tmc0.c
new file mode 100644
index 00000000..83f86c88
--- /dev/null
+++ b/lib/utils/hsm/fdt_hsm_sifive_tmc0.c
@@ -0,0 +1,380 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SiFive
+ */
+
+#include <libfdt.h>
+#include <sbi/riscv_asm.h>
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_bitops.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_hart.h>
+#include <sbi/sbi_heap.h>
+#include <sbi/sbi_hsm.h>
+#include <sbi/sbi_ipi.h>
+#include <sbi_utils/cache/fdt_cmo_helper.h>
+#include <sbi_utils/fdt/fdt_driver.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/hsm/fdt_hsm_sifive_inst.h>
+#include <sbi_utils/hsm/fdt_hsm_sifive_tmc0.h>
+#include <sbi_utils/ipi/aclint_mswi.h>
+
+struct sifive_tmc0 {
+	unsigned long reg;
+	struct sbi_dlist node;
+	u32 id;
+};
+
+static SBI_LIST_HEAD(tmc0_list);
+static unsigned long tmc0_offset;
+
+#define tmc0_ptr_get(__scratch)				\
+	sbi_scratch_read_type((__scratch), struct sifive_tmc0 *, tmc0_offset)
+
+#define tmc0_ptr_set(__scratch, __tmc0)			\
+	sbi_scratch_write_type((__scratch), struct sifive_tmc0 *, tmc0_offset, (__tmc0))
+
+/* TMC.PGPREP */
+#define SIFIVE_TMC_PGPREP_OFF			0x0
+#define SIFIVE_TMC_PGPREP_ENA_REQ		BIT(31)
+#define SIFIVE_TMC_PGPREP_ENA_ACK		BIT(30)
+#define SIFIVE_TMC_PGPREP_DIS_REQ		BIT(29)
+#define SIFIVE_TMC_PGPREP_DIS_ACK		BIT(28)
+#define SIFIVE_TMC_PGPREP_CLFPNOTQ		BIT(18)
+#define SIFIVE_TMC_PGPREP_PMCENAERR		BIT(17)
+#define SIFIVE_TMC_PGPREP_PMCDENY		BIT(16)
+#define SIFIVE_TMC_PGPREP_BUSERR		BIT(15)
+#define SIFIVE_TMC_PGPREP_WAKE_DETECT		BIT(12)
+#define SIFIVE_TMC_PGPREP_INTERNAL_ABORT	BIT(2)
+#define SIFIVE_TMC_PGPREP_ENARSP		(SIFIVE_TMC_PGPREP_CLFPNOTQ | \
+						 SIFIVE_TMC_PGPREP_PMCENAERR | \
+						 SIFIVE_TMC_PGPREP_PMCDENY | \
+						 SIFIVE_TMC_PGPREP_BUSERR | \
+						 SIFIVE_TMC_PGPREP_WAKE_DETECT)
+
+/* TMC.PG */
+#define SIFIVE_TMC_PG_OFF			0x4
+#define SIFIVE_TMC_PG_ENA_REQ			BIT(31)
+#define SIFIVE_TMC_PG_ENA_ACK			BIT(30)
+#define SIFIVE_TMC_PG_DIS_REQ			BIT(29)
+#define SIFIVE_TMC_PG_DIS_ACK			BIT(28)
+#define SIFIVE_TMC_PG_PMC_ENA_ERR		BIT(17)
+#define SIFIVE_TMC_PG_PMC_DENY			BIT(16)
+#define SIFIVE_TMC_PG_BUS_ERR			BIT(15)
+#define SIFIVE_TMC_PG_MASTNOTQ			BIT(14)
+#define SIFIVE_TMC_PG_WARM_RESET		BIT(1)
+#define SIFIVE_TMC_PG_ENARSP			(SIFIVE_TMC_PG_PMC_ENA_ERR | \
+						 SIFIVE_TMC_PG_PMC_DENY | \
+						 SIFIVE_TMC_PG_BUS_ERR | \
+						 SIFIVE_TMC_PG_MASTNOTQ)
+
+/* TMC.RESUMEPC */
+#define SIFIVE_TMC_RESUMEPC_LO			0x10
+#define SIFIVE_TMC_RESUMEPC_HI			0x14
+
+/* TMC.WAKEMASK */
+#define SIFIVE_TMC_WAKE_MASK_OFF		0x20
+#define SIFIVE_TMC_WAKE_MASK_WREQ		BIT(31)
+#define SIFIVE_TMC_WAKE_MASK_ACK		BIT(30)
+
+static void sifive_tmc0_set_resumepc(physical_addr_t addr)
+{
+	struct sifive_tmc0 *tmc0 = tmc0_ptr_get(sbi_scratch_thishart_ptr());
+
+	writel((u32)addr, (void *)(tmc0->reg + SIFIVE_TMC_RESUMEPC_LO));
+#if __riscv_xlen > 32
+	writel((u32)(addr >> 32), (void *)(tmc0->reg + SIFIVE_TMC_RESUMEPC_HI));
+#endif
+}
+
+static u32 sifive_tmc0_set_pgprep_enareq(void)
+{
+	struct sifive_tmc0 *tmc0 = tmc0_ptr_get(sbi_scratch_thishart_ptr());
+	unsigned long reg = tmc0->reg + SIFIVE_TMC_PGPREP_OFF;
+	u32 v = readl((void *)reg);
+
+	writel(v | SIFIVE_TMC_PGPREP_ENA_REQ, (void *)reg);
+	while (!(readl((void *)reg) & SIFIVE_TMC_PGPREP_ENA_ACK));
+
+	v = readl((void *)reg);
+	return v & SIFIVE_TMC_PGPREP_INTERNAL_ABORT;
+}
+
+static void sifive_tmc0_set_pgprep_disreq(void)
+{
+	struct sifive_tmc0 *tmc0 = tmc0_ptr_get(sbi_scratch_thishart_ptr());
+	unsigned long reg = tmc0->reg + SIFIVE_TMC_PGPREP_OFF;
+	u32 v = readl((void *)reg);
+
+	writel(v | SIFIVE_TMC_PGPREP_DIS_REQ, (void *)reg);
+	while (!(readl((void *)reg) & SIFIVE_TMC_PGPREP_DIS_ACK));
+}
+
+static u32 sifive_tmc0_get_pgprep_enarsp(void)
+{
+	struct sifive_tmc0 *tmc0 = tmc0_ptr_get(sbi_scratch_thishart_ptr());
+	unsigned long reg = tmc0->reg + SIFIVE_TMC_PGPREP_OFF;
+	u32 v = readl((void *)reg);
+
+	return v & SIFIVE_TMC_PGPREP_ENARSP;
+}
+
+static void sifive_tmc0_set_pg_enareq(void)
+{
+	struct sifive_tmc0 *tmc0 = tmc0_ptr_get(sbi_scratch_thishart_ptr());
+	unsigned long reg = tmc0->reg + SIFIVE_TMC_PG_OFF;
+	u32 v = readl((void *)reg);
+
+	writel(v | SIFIVE_TMC_PG_ENA_REQ, (void *)reg);
+}
+
+static int sifive_tmc0_prep(void)
+{
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	u32 rc;
+
+	if (!tmc0_ptr_get(scratch))
+		return SBI_ENODEV;
+
+	rc = sifive_tmc0_set_pgprep_enareq();
+	if (rc) {
+		sbi_printf("TMC0 error: Internal Abort (Wake detect)\n");
+		goto fail;
+	}
+
+	rc = sifive_tmc0_get_pgprep_enarsp();
+	if (rc) {
+		sifive_tmc0_set_pgprep_disreq();
+		sbi_printf("TMC0 error: error response code: 0x%x\n", rc);
+		goto fail;
+	}
+
+	sifive_tmc0_set_resumepc(scratch->warmboot_addr);
+
+	return SBI_OK;
+
+fail:
+	return SBI_EFAIL;
+}
+
+static int sifive_tmc0_enter(void)
+{
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	u32 rc;
+
+	/* Flush cache and check if there is wake detect or bus error */
+	if (fdt_cmo_private_flc_flush_all() &&
+	    sbi_hart_has_extension(scratch, SBI_HART_EXT_XSIFIVE_CFLUSH_D_L1))
+		sifive_cflush();
+
+	rc = sifive_tmc0_get_pgprep_enarsp();
+	if (rc) {
+		sbi_printf("TMC0 error: error response code: 0x%x\n", rc);
+		goto fail;
+	}
+
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_XSIFIVE_CEASE)) {
+		sifive_tmc0_set_pg_enareq();
+		while (1)
+			sifive_cease();
+	}
+
+	rc = SBI_ENOTSUPP;
+fail:
+	sifive_tmc0_set_pgprep_disreq();
+	return rc;
+}
+
+static int sifive_tmc0_tile_pg(void)
+{
+	int rc;
+
+	rc = sifive_tmc0_prep();
+	if (rc)
+		return rc;
+
+	return sifive_tmc0_enter();
+}
+
+static struct sifive_tmc0 *sifive_tmc0_find(u32 id)
+{
+	struct sifive_tmc0 *tmc0;
+
+	sbi_list_for_each_entry(tmc0, &tmc0_list, node) {
+		if (tmc0->id == id)
+			return tmc0;
+	}
+
+	return NULL;
+}
+
+static int sifive_tmc0_add(struct sifive_tmc0 *tmc0)
+{
+	if (!tmc0)
+		return SBI_ENODEV;
+
+	if (sifive_tmc0_find(tmc0->id))
+		return SBI_EALREADY;
+
+	sbi_list_add(&tmc0->node, &tmc0_list);
+
+	return SBI_OK;
+}
+
+static int sifive_tmc0_probe(const void *fdt, int nodeoff, const struct fdt_match *match)
+{
+	struct sifive_tmc0 *tmc0;
+	int rc;
+	u64 addr;
+
+	tmc0 = sbi_zalloc(sizeof(*tmc0));
+	if (!tmc0)
+		return SBI_ENOMEM;
+
+	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &addr, NULL);
+	if (rc)
+		goto free_tmc0;
+
+	tmc0->reg = (unsigned long)addr;
+	tmc0->id = nodeoff;
+
+	rc = sifive_tmc0_add(tmc0);
+	if (rc)
+		goto free_tmc0;
+
+	return SBI_OK;
+
+free_tmc0:
+	sbi_free(tmc0);
+	return rc;
+}
+
+static const struct fdt_match sifive_tmc0_match[] = {
+	{ .compatible = "sifive,tmc0" },
+	{ },
+};
+
+const struct fdt_driver fdt_hsm_sifive_tmc0 = {
+	.match_table = sifive_tmc0_match,
+	.init = sifive_tmc0_probe,
+};
+
+static const struct fdt_driver *const fdt_hsm_sifive_tmc0_drivers[] = {
+	&fdt_hsm_sifive_tmc0,
+	NULL
+};
+
+static int fdt_sifive_tmc0_get(const void *fdt, int noff, struct sifive_tmc0 **out)
+{
+	struct sifive_tmc0 *tmc0;
+	int rc;
+
+	noff = fdt_node_offset_by_phandle(fdt, noff);
+	if (noff < 0)
+		return noff;
+
+	rc = fdt_driver_init_by_offset(fdt, noff, fdt_hsm_sifive_tmc0_drivers);
+	if (rc)
+		return rc;
+
+	tmc0 = sifive_tmc0_find(noff);
+	if (!tmc0)
+		return SBI_EFAIL;
+
+	if (out)
+		*out = tmc0;
+
+	return SBI_OK;
+}
+
+static int fdt_sifive_tmc0_cold_init(const void *fdt)
+{
+	struct sbi_scratch *scratch;
+	struct sifive_tmc0 *tmc0;
+	const fdt32_t *val;
+	int cpus_off, cpu_off, rc;
+	u32 hartid;
+
+	cpus_off = fdt_path_offset(fdt, "/cpus");
+	if (cpus_off < 0)
+		return SBI_ENOENT;
+
+	fdt_for_each_subnode(cpu_off, fdt, cpus_off) {
+		rc = fdt_parse_hart_id(fdt, cpu_off, &hartid);
+		if (rc)
+			continue;
+
+		val = fdt_getprop(fdt, cpu_off, "power-domains", NULL);
+		if (!val)
+			return SBI_ENOENT;
+
+		rc = fdt_sifive_tmc0_get(fdt, fdt32_to_cpu(val[0]), &tmc0);
+		if (rc)
+			return rc;
+
+		scratch = sbi_hartid_to_scratch(hartid);
+		if (!scratch)
+			continue;
+
+		tmc0_ptr_set(scratch, tmc0);
+	}
+
+	return SBI_OK;
+}
+
+static int sifive_tmc0_start(u32 hartid, ulong saddr)
+{
+	struct sbi_ipi_device *clint = aclint_mswi_get();
+
+	/*
+	 * In system suspend, the IMSIC will be reset in SiFive platform so
+	 * we use the CLINT IPI as the wake event.
+	 */
+	if (clint && clint->ipi_send)
+		clint->ipi_send(sbi_hartid_to_hartindex(hartid));
+	else
+		sbi_ipi_raw_send(sbi_hartid_to_hartindex(hartid));
+
+	return SBI_OK;
+}
+
+static int sifive_tmc0_stop(void)
+{
+	unsigned long mie = csr_read(CSR_MIE);
+	int rc;
+	// Set IPI as wake up source
+	csr_set(CSR_MIE, MIP_MEIP | MIP_MSIP);
+
+	rc = sifive_tmc0_tile_pg();
+	if (rc) {
+		csr_write(CSR_MIE, mie);
+		return rc;
+	}
+
+	return SBI_OK;
+}
+
+static struct sbi_hsm_device tmc0_hsm_dev = {
+	.name = "SiFive TMC0",
+	.hart_start = sifive_tmc0_start,
+	.hart_stop = sifive_tmc0_stop,
+};
+
+int fdt_hsm_sifive_tmc0_cold_init(void)
+{
+	int rc;
+
+	tmc0_offset = sbi_scratch_alloc_type_offset(struct sifive_tmc0 *);
+	if (!tmc0_offset)
+		return SBI_ENOMEM;
+
+	rc = fdt_sifive_tmc0_cold_init(fdt_get_address());
+	if (rc)
+		return rc;
+
+	sbi_hsm_set_device(&tmc0_hsm_dev);
+
+	return SBI_OK;
+}
diff --git a/lib/utils/hsm/objects.mk b/lib/utils/hsm/objects.mk
index c13d81f7..04f4a208 100644
--- a/lib/utils/hsm/objects.mk
+++ b/lib/utils/hsm/objects.mk
@@ -9,3 +9,5 @@
 
 carray-fdt_early_drivers-$(CONFIG_FDT_HSM_RPMI) += fdt_hsm_rpmi
 libsbiutils-objs-$(CONFIG_FDT_HSM_RPMI) += hsm/fdt_hsm_rpmi.o
+
+libsbiutils-objs-$(CONFIG_FDT_HSM_SIFIVE_TMC0) += hsm/fdt_hsm_sifive_tmc0.o
diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index a24d6ab2..20c25a83 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -43,6 +43,11 @@ config PLATFORM_RENESAS_RZFIVE
 	select ANDES_PMU
 	default n
 
+config PLATFORM_SIFIVE_DEV
+	bool "SiFive development platform support"
+	depends on FDT_CACHE
+	default n
+
 config PLATFORM_SIFIVE_FU540
 	bool "SiFive FU540 support"
 	default n
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 6b219cfb..837acd79 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -1,6 +1,7 @@
 CONFIG_PLATFORM_ALLWINNER_D1=y
 CONFIG_PLATFORM_ANDES_AE350=y
 CONFIG_PLATFORM_RENESAS_RZFIVE=y
+CONFIG_PLATFORM_SIFIVE_DEV=y
 CONFIG_PLATFORM_SIFIVE_FU540=y
 CONFIG_PLATFORM_SIFIVE_FU740=y
 CONFIG_PLATFORM_SOPHGO_SG2042=y
@@ -17,6 +18,7 @@ CONFIG_FDT_GPIO_SIFIVE=y
 CONFIG_FDT_GPIO_STARFIVE=y
 CONFIG_FDT_HSM=y
 CONFIG_FDT_HSM_RPMI=y
+CONFIG_FDT_HSM_SIFIVE_TMC0=y
 CONFIG_FDT_I2C=y
 CONFIG_FDT_I2C_SIFIVE=y
 CONFIG_FDT_I2C_DW=y
diff --git a/platform/generic/sifive/objects.mk b/platform/generic/sifive/objects.mk
index d75e444a..d32e1273 100644
--- a/platform/generic/sifive/objects.mk
+++ b/platform/generic/sifive/objects.mk
@@ -2,6 +2,9 @@
 # SPDX-License-Identifier: BSD-2-Clause
 #
 
+carray-platform_override_modules-$(CONFIG_PLATFORM_SIFIVE_DEV) += sifive_dev_platform
+platform-objs-$(CONFIG_PLATFORM_SIFIVE_DEV) += sifive/sifive_dev_platform.o
+
 carray-platform_override_modules-$(CONFIG_PLATFORM_SIFIVE_FU540) += sifive_fu540
 platform-objs-$(CONFIG_PLATFORM_SIFIVE_FU540) += sifive/fu540.o
 
diff --git a/platform/generic/sifive/sifive_dev_platform.c b/platform/generic/sifive/sifive_dev_platform.c
new file mode 100644
index 00000000..48774492
--- /dev/null
+++ b/platform/generic/sifive/sifive_dev_platform.c
@@ -0,0 +1,57 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SiFive Inc.
+ */
+
+#include <platform_override.h>
+#include <sbi/sbi_ipi.h>
+#include <sbi_utils/cache/fdt_cmo_helper.h>
+#include <sbi_utils/hsm/fdt_hsm_sifive_tmc0.h>
+#include <sbi_utils/ipi/aclint_mswi.h>
+
+static int sifive_early_init(bool cold_boot)
+{
+	int rc;
+
+	rc = generic_early_init(cold_boot);
+	if (rc)
+		return rc;
+
+	if (cold_boot) {
+		rc = fdt_hsm_sifive_tmc0_cold_init();
+		if (rc)
+			return rc;
+	}
+
+	return 0;
+}
+
+static int sifive_final_init(bool cold_boot)
+{
+	struct sbi_ipi_device *clint = aclint_mswi_get();
+
+	if (clint && clint->ipi_clear)
+		clint->ipi_clear();
+
+	return generic_final_init(cold_boot);
+}
+
+static int sifive_platform_init(const void *fdt, int nodeoff,
+				const struct fdt_match *match)
+{
+	generic_platform_ops.early_init = sifive_early_init;
+	generic_platform_ops.final_init = sifive_final_init;
+
+	return 0;
+}
+
+static const struct fdt_match sifive_dev_platform_match[] = {
+	{ .compatible = "sifive-dev" },
+	{ },
+};
+
+const struct fdt_driver sifive_dev_platform = {
+	.match_table = sifive_dev_platform_match,
+	.init = sifive_platform_init,
+};
-- 
2.17.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
