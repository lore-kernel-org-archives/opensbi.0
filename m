Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB30E8FDBE
	for <opensbi@archiver.kernel.org>; Mon, 29 Dec 2025 07:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UD8++TBLTBuMqY+s7gfeeNMwUXhTvlRduOhCwj5BCE8=; b=c8FdAU2ujpCE5t
	12Fm4sdJdwrUNsz/EobU1UQupr70pxMJ0TJUTQVNB+6ohxwsw3WMZ9neD4Y3TeEJhOvrvsLYuOUxl
	/F7Jv3kU40XLCytEYOMEu/Xt0v8OsVa4ETC4GquJOwG3zeLKJF5Cqq2kPHSI+KAVHQelrbXKmhERf
	OMi4DKB67omw4MZYRp+oZWdS2ftUi0MT/NsPUKtujaXh63b9kml+VdjbJAvm8cDl+adRltRK/9nOn
	7k/3KEkfj2jd9OEhTiAFKu9nyubEwYwn5DuwRJmVj2DNAJ2Wyig1GUp3ct/u1te4Xbh00BkzZDj6M
	3Rgj0RsOue8/WZEorQpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va7XS-00000003Pvx-0tmn;
	Mon, 29 Dec 2025 07:19:34 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va7XO-00000003PuR-39H8
	for opensbi@lists.infradead.org;
	Mon, 29 Dec 2025 07:19:32 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 5BT7JMfe084287
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <opensbi@lists.infradead.org>; Mon, 29 Dec 2025 15:19:22 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Mon, 29 Dec 2025
 15:19:22 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: <opensbi@lists.infradead.org>
Subject: [PATCH 2/5] platform: generic/andes: add CSR save and restore functions for AE350 platform
Date: Mon, 29 Dec 2025 15:19:11 +0800
Message-ID: <20251229071914.1451587-3-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251229071914.1451587-1-ben717@andestech.com>
References: <20251229071914.1451587-1-ben717@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 5BT7JMfe084287
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_231931_150971_2825011F 
X-CRM114-Status: GOOD (  15.38  )
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
Cc: Leo Yu-Chi Liang <ycliang@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Implement a save and restore mechanism for Andes-specific CSRs to support
hardware power-saving modes, such as CPU hotplug or suspend to RAM.

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 lib/utils/hsm/fdt_hsm_andes_atcsmu.c   |  1 +
 platform/generic/andes/ae350.c         | 55 ++++++++++++++++++++++++++
 platform/generic/include/andes/andes.h | 22 ++++++++++-
 3 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/lib/utils/hsm/fdt_hsm_andes_atcsmu.c b/lib/utils/hsm/fdt_hsm_andes_atcsmu.c
index ee7873dc6d00..3fe931aa1816 100644
--- a/lib/utils/hsm/fdt_hsm_andes_atcsmu.c
+++ b/lib/utils/hsm/fdt_hsm_andes_atcsmu.c
@@ -126,6 +126,7 @@ static int ae350_hart_stop(void)
 	if (rc)
 		return SBI_EFAIL;
 
+	ae350_non_ret_save(sbi_scratch_thishart_ptr());
 	ae350_disable_coherency();
 	wfi();
 	return 0;
diff --git a/platform/generic/andes/ae350.c b/platform/generic/andes/ae350.c
index fa3f03685bba..9bd1554394b7 100644
--- a/platform/generic/andes/ae350.c
+++ b/platform/generic/andes/ae350.c
@@ -8,18 +8,73 @@
 #include <andes/andes_pmu.h>
 #include <andes/andes_sbi.h>
 #include <platform_override.h>
+#include <sbi/sbi_init.h>
+#include <sbi/sbi_scratch.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 
+static unsigned long andes_hart_data_offset;
 extern void _start_warm(void);
 
+void ae350_non_ret_save(struct sbi_scratch *scratch)
+{
+	struct andes_hart_data *andes_hdata = sbi_scratch_offset_ptr(scratch,
+								     andes_hart_data_offset);
+
+	andes_hdata->mcache_ctl = csr_read(CSR_MCACHE_CTL);
+	andes_hdata->mmisc_ctl = csr_read(CSR_MMISC_CTL);
+	andes_hdata->mpft_ctl = csr_read(CSR_MPFT_CTL);
+	andes_hdata->mslideleg = csr_read(CSR_MSLIDELEG);
+	andes_hdata->mxstatus = csr_read(CSR_MXSTATUS);
+	andes_hdata->slie = csr_read(CSR_SLIE);
+	andes_hdata->slip = csr_read(CSR_SLIP);
+	andes_hdata->pmacfg0 = csr_read(CSR_PMACFG0);
+	andes_hdata->pmacfg2 = csr_read_num(CSR_PMACFG0 + 2);
+	for (int i = 0; i < 16; i++)
+		andes_hdata->pmaaddrX[i] = csr_read_num(CSR_PMAADDR0 + i);
+}
+
+void ae350_non_ret_restore(struct sbi_scratch *scratch)
+{
+	struct andes_hart_data *andes_hdata = sbi_scratch_offset_ptr(scratch,
+								     andes_hart_data_offset);
+
+	csr_write(CSR_MCACHE_CTL, andes_hdata->mcache_ctl);
+	csr_write(CSR_MMISC_CTL, andes_hdata->mmisc_ctl);
+	csr_write(CSR_MPFT_CTL, andes_hdata->mpft_ctl);
+	csr_write(CSR_MSLIDELEG, andes_hdata->mslideleg);
+	csr_write(CSR_MXSTATUS, andes_hdata->mxstatus);
+	csr_write(CSR_SLIE, andes_hdata->slie);
+	csr_write(CSR_SLIP, andes_hdata->slip);
+	csr_write(CSR_PMACFG0, andes_hdata->pmacfg0);
+	csr_write_num(CSR_PMACFG0 + 2, andes_hdata->pmacfg2);
+	for (int i = 0; i < 16; i++)
+		csr_write_num(CSR_PMAADDR0 + i, andes_hdata->pmaaddrX[i]);
+}
+
 void ae350_enable_coherency_warmboot(void)
 {
 	ae350_enable_coherency();
 	_start_warm();
 }
 
+static int ae350_early_init(bool cold_boot)
+{
+	if (cold_boot) {
+		andes_hart_data_offset = sbi_scratch_alloc_offset(sizeof(struct andes_hart_data));
+		if (!andes_hart_data_offset)
+			return SBI_ENOMEM;
+	}
+
+	/* Don't restore Andes CSRs during boot */
+	if (sbi_init_count(current_hartindex()))
+		ae350_non_ret_restore(sbi_scratch_thishart_ptr());
+
+	return generic_early_init(cold_boot);
+}
+
 static int ae350_platform_init(const void *fdt, int nodeoff, const struct fdt_match *match)
 {
+	generic_platform_ops.early_init = ae350_early_init;
 	generic_platform_ops.extensions_init = andes_pmu_extensions_init;
 	generic_platform_ops.pmu_init = andes_pmu_init;
 	generic_platform_ops.vendor_ext_provider = andes_sbi_vendor_ext_provider;
diff --git a/platform/generic/include/andes/andes.h b/platform/generic/include/andes/andes.h
index 1b5893925c10..dd2451718d00 100644
--- a/platform/generic/include/andes/andes.h
+++ b/platform/generic/include/andes/andes.h
@@ -10,16 +10,21 @@
 #include <sbi/sbi_scratch.h>
 
 /* Memory and Miscellaneous Registers */
+#define CSR_MPFT_CTL		0x7c5
 #define CSR_MCACHE_CTL		0x7ca
 #define CSR_MCCTLCOMMAND	0x7cc
+#define CSR_MMISC_CTL		0x7d0
 
 /* Configuration Control & Status Registers */
 #define CSR_MICM_CFG		0xfc0
 #define CSR_MDCM_CFG		0xfc1
 #define CSR_MMSC_CFG		0xfc2
 
-/* Machine Trap Related Registers */
+/* Trap Related Registers */
+#define CSR_MXSTATUS		0x7c4
 #define CSR_MSLIDELEG		0x7d5
+#define CSR_SLIE		0x9c4
+#define CSR_SLIP		0x9c5
 
 /* Counter Related Registers */
 #define CSR_MCOUNTERWEN		0x7ce
@@ -80,6 +85,21 @@
 
 #endif /* __ASSEMBLER__ */
 
+struct andes_hart_data {
+	unsigned long mcache_ctl;
+	unsigned long mmisc_ctl;
+	unsigned long mpft_ctl;
+	unsigned long mslideleg;
+	unsigned long mxstatus;
+	unsigned long slie;
+	unsigned long slip;
+	unsigned long pmacfg0;
+	unsigned long pmacfg2;
+	unsigned long pmaaddrX[16];
+};
+
+void ae350_non_ret_save(struct sbi_scratch *scratch);
+void ae350_non_ret_restore(struct sbi_scratch *scratch);
 void ae350_enable_coherency_warmboot(void);
 
 /*
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
