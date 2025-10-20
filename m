Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260E6CCD1A2
	for <opensbi@archiver.kernel.org>; Mon, 20 Oct 2025 06:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tSyDINz0HPWrdD9FVOhqw0nYAcEP/C4mdDCcUt9qTFc=; b=qxbChGqBD5+bW8
	64Cwbrctsdxc6eF0pELGSYTs781X+58/ZHHRDSrCMq6f0a0QN2fIjq5fvm7kJyv/0AkdRg8wIrQ4u
	pPAG2tbXV+jksVNhl2/PuC0ExX9oyngbmtV7JWmmFS88pPfRZ5Sdz7VwlBqUFhbBM0p30L0BYH67q
	w5Us+XyzgvzDhw5JpphmOUMo3iqd073estV1AYxyWkVimJkOtuoArSOIIVPg7YuGYdk4HfsOWeDhd
	NBi/ckzIUZX1H+VEjpWwXFEeXv/LBtLtx/e922tG+lWQ1IUcz9EKWow7LRDzNqelVLMkb7YWaDUB4
	7ZuUqobHPLYujCJRs6+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjMI-0000000C27y-1bcj;
	Mon, 20 Oct 2025 06:27:06 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjME-0000000C21S-3Zis
	for opensbi@lists.infradead.org;
	Mon, 20 Oct 2025 06:27:04 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-781206cce18so4020118b3a.0
        for <opensbi@lists.infradead.org>; Sun, 19 Oct 2025 23:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760941622; x=1761546422; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YoboTUfAeKJ86JIsL5IlxW7gAp9nQMuusQs7PKZljnU=;
        b=M5WbDHu9zdwJk6/11ycCu9I7mHTyngsa/NZeSLXyw9h0Dq0NSwEKCWPG7TsZUDLQeM
         his8t7mEvuA6EpTMh3mmShfiM4vik/Y0ANrlMSKnS5wOD9h9n6E6iCs1DEH3Pyyki8V9
         lWQOS/yOiFZHaAC2zywNPm2aes37N2JPME7zhQucjNKfpHw3flugD/t/9evNaTosZ/Tt
         EpQR40bT198UPeYzCzI/dVLlM1eUGSQAXzwrHkFHhy35i95cAex4cj7XcZQpKFziJ8uc
         vjA3r01gGKD5JGwPECfr5sT11tMYav45WiQGCcf5SGdh3CeH1WS0+DcjIlnnwMAueye8
         nmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760941622; x=1761546422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YoboTUfAeKJ86JIsL5IlxW7gAp9nQMuusQs7PKZljnU=;
        b=mDb+vVQR3TUpQ6v69fSnnLl43GLKWlIXMpdhfPl5BNCbDQtwAurGH1AV1Vm3rPQHbX
         rxJnWIbM1OYWc1y0zpzBNHSU5XjbVKaNYxKsmxjyPF4kGkFzJoBIobn8xDGGvNafscSY
         7RDRRxp/g+W7la/rwTCXfRaPnGkGeWPsaWeGmx1iJxf+w7ovdrjxCs238iQ04eplC42J
         CEsItQs60fa57lXV3rI06Db+XsiPyCf1KuN8Ao3w9ZqYGZk0mdP7VEy/hA9JWBo9ZxXw
         p49S2wS8fiqmOhDutFRfajbCIGfFGhDnOxyX0FnPjFfE2DXyrbWDNqYLU4T7f7ZkcckV
         1ySA==
X-Gm-Message-State: AOJu0Ywa+JMOVWRNXr4uIAhutrHJzgcMB3GEoSsLfHfPTGCoR4CEs7N7
	0Axl5y9gKp0LUJ85KFQ8CD1jhbriUQ9Tf1RRVmWTi0j3zc5O7ArZ9QuG9ZkKpa/z6Q0=
X-Gm-Gg: ASbGncuDX3IEg2uFx54SO1umsocfHZ9LN/0+4SQRU/WOxkwWc77J6LtL52/820hApGV
	1C4Me2VhQA2QK+puYbecnI4Rxp2r8OA6CCqcosHoeN8Tgd6XMOeTZCXYSPTannPE4gZvSHevqS2
	/T+i2ggbRG02RD2da6yIm6KqWFxu6TBpTde7FOLtpFJCifjblVRL/k90tPL8CJspndn7Sn/2PFy
	CQrjcCUJSstk71yuBDDJy/NBVnBPgx/XZVSRZtqZyTgqwT6QaIzakSyzogUSk2LOwkJTS8MdkUF
	G/RZtlbPLSdSPzkOCttVJoPoKqiI37NQqTirV1Z9tBxnzbSL2PGDF+hORoWqoCl37Mw5JVrjVVG
	FYNKV8pveARezkmKr+w2JGF8RIMBe5HBMkk49+lXGkmXoOctb22j8nGNRY1NvnbH5uJFLl9zueQ
	==
X-Google-Smtp-Source: AGHT+IHgYbp+vU+ro6Py9QtRMOF01lN+eoHBG9rl/Ba0YThJGv/WtWw4NANGi9ujCN8wVTqhez4nlQ==
X-Received: by 2002:a05:6a21:99a0:b0:243:b62c:8a7d with SMTP id adf61e73a8af0-334a77a80f2mr16670224637.0.1760941621853;
        Sun, 19 Oct 2025 23:27:01 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff349bcsm7301244b3a.17.2025.10.19.23.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:27:01 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Mon, 20 Oct 2025 14:34:11 +0800
Subject: [PATCH v7 09/12] lib: utils/hsm: Add SiFive TMC0 driver
MIME-Version: 1.0
Message-Id: <20251020-cache-upstream-v7-9-69a132447d8a@sifive.com>
References: <20251020-cache-upstream-v7-0-69a132447d8a@sifive.com>
In-Reply-To: <20251020-cache-upstream-v7-0-69a132447d8a@sifive.com>
To: opensbi@lists.infradead.org
Cc: Vincent Chen <vincent.chen@sifive.com>, 
 Cyan Yang <cyan.yang@sifive.com>, Nick Hu <nick.hu@sifive.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_232702_926843_C3566600 
X-CRM114-Status: GOOD (  20.29  )
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

The SiFive TMC0 controls the tile power domains on SiFive platform. The
CPU enters the low power state via the `CEASE` instruction after
configuring the TMC0. Any devices that inside the tile power domain will
be power gated, including the private cache. Therefore flushing the
private cache before entering the low power state.

Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Reviewed-by: Cyan Yang <cyan.yang@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 include/sbi_utils/hsm/fdt_hsm_sifive_inst.h |  20 ++
 lib/utils/hsm/Kconfig                       |   5 +
 lib/utils/hsm/fdt_hsm_sifive_tmc0.c         | 310 ++++++++++++++++++++++++++++
 lib/utils/hsm/objects.mk                    |   3 +
 platform/generic/configs/defconfig          |   1 +
 5 files changed, 339 insertions(+)

diff --git a/include/sbi_utils/hsm/fdt_hsm_sifive_inst.h b/include/sbi_utils/hsm/fdt_hsm_sifive_inst.h
new file mode 100644
index 0000000000000000000000000000000000000000..de8aba190fd782e497e6f71662e734fac7b076fe
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
diff --git a/lib/utils/hsm/Kconfig b/lib/utils/hsm/Kconfig
index 1ad7958fb582a3ee561dfaec4afd738054b58906..5861b064aa35c14a8b3f78e61a4e27ae0482258e 100644
--- a/lib/utils/hsm/Kconfig
+++ b/lib/utils/hsm/Kconfig
@@ -14,6 +14,11 @@ config FDT_HSM_RPMI
 	depends on FDT_MAILBOX && RPMI_MAILBOX
 	default n
 
+config FDT_HSM_SIFIVE_TMC0
+	bool "FDT SiFive TMC v0 driver"
+	depends on FDT_CACHE
+	default n
+
 endif
 
 endmenu
diff --git a/lib/utils/hsm/fdt_hsm_sifive_tmc0.c b/lib/utils/hsm/fdt_hsm_sifive_tmc0.c
new file mode 100644
index 0000000000000000000000000000000000000000..8b08a7d1bf025f033ee0ebbe02fb97c70d0afeef
--- /dev/null
+++ b/lib/utils/hsm/fdt_hsm_sifive_tmc0.c
@@ -0,0 +1,310 @@
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
+static int sifive_tmc0_start(u32 hartid, ulong saddr)
+{
+	/*
+	 * In system suspend, the IMSIC will be reset in SiFive platform so
+	 * we use the CLINT IPI as the wake event.
+	 */
+	sbi_ipi_raw_send(sbi_hartid_to_hartindex(hartid), true);
+
+	return SBI_OK;
+}
+
+static int sifive_tmc0_stop(void)
+{
+	unsigned long mie = csr_read(CSR_MIE);
+	int rc;
+	/* Set IPI as wake up source */
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
+static int sifive_tmc0_bind_cpu(struct sifive_tmc0 *tmc0)
+{
+	const void *fdt = fdt_get_address();
+	struct sbi_scratch *scratch;
+	int cpus_off, cpu_off, rc;
+	const fdt32_t *val;
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
+		scratch = sbi_hartid_to_scratch(hartid);
+		if (!scratch)
+			continue;
+
+		val = fdt_getprop(fdt, cpu_off, "power-domains", NULL);
+		if (!val)
+			return SBI_ENOENT;
+
+		if (tmc0->id == fdt32_to_cpu(val[0])) {
+			tmc0_ptr_set(scratch, tmc0);
+			return SBI_OK;
+		}
+	}
+
+	return SBI_ENODEV;
+}
+
+static int sifive_tmc0_probe(const void *fdt, int nodeoff, const struct fdt_match *match)
+{
+	struct sifive_tmc0 *tmc0;
+	u64 addr;
+	int rc;
+
+	if (!tmc0_offset) {
+		tmc0_offset = sbi_scratch_alloc_type_offset(struct sifive_tmc0 *);
+		if (!tmc0_offset)
+			return SBI_ENOMEM;
+
+		sbi_hsm_set_device(&tmc0_hsm_dev);
+	}
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
+	tmc0->id = fdt_get_phandle(fdt_get_address(), nodeoff);
+
+	rc = sifive_tmc0_bind_cpu(tmc0);
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
diff --git a/lib/utils/hsm/objects.mk b/lib/utils/hsm/objects.mk
index c13d81f78dd69ceb37cf83b19b10bc95c3dcfaff..6fbae628aa615e8ddcd41d01973303f2e36100d1 100644
--- a/lib/utils/hsm/objects.mk
+++ b/lib/utils/hsm/objects.mk
@@ -9,3 +9,6 @@
 
 carray-fdt_early_drivers-$(CONFIG_FDT_HSM_RPMI) += fdt_hsm_rpmi
 libsbiutils-objs-$(CONFIG_FDT_HSM_RPMI) += hsm/fdt_hsm_rpmi.o
+
+carray-fdt_early_drivers-$(CONFIG_FDT_HSM_SIFIVE_TMC0) += fdt_hsm_sifive_tmc0
+libsbiutils-objs-$(CONFIG_FDT_HSM_SIFIVE_TMC0) += hsm/fdt_hsm_sifive_tmc0.o
\ No newline at end of file
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 86decbd0755e74c658b23e0097d103ded25a10d1..897d552813121f22c812e9760d2b144f41141c49 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -19,6 +19,7 @@ CONFIG_FDT_GPIO_SIFIVE=y
 CONFIG_FDT_GPIO_STARFIVE=y
 CONFIG_FDT_HSM=y
 CONFIG_FDT_HSM_RPMI=y
+CONFIG_FDT_HSM_SIFIVE_TMC0=y
 CONFIG_FDT_I2C=y
 CONFIG_FDT_I2C_SIFIVE=y
 CONFIG_FDT_I2C_DW=y

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
