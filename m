Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849E9D21689
	for <opensbi@archiver.kernel.org>; Thu,  4 Dec 2025 14:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AoY6uK+V5M0yTC04bH35KVpKV/eASUXNZXVtUOVJabU=; b=SXw8oH+XoKUQ/v
	9szc92cXhmnT93S0v+9nuNZ50rjUuznoRmYCW4iteFrp0ccqeROh51uuuHllyKxA0A+hsoC3m/KXC
	e0BYH4taag7fA0LUpvyWH79kZHQA3ideN9toowCVppi5Tx8ApTL40hqRhkMIS38jD5RatOW+cIKoB
	IswdcK9svegZkYYDAMWgpIQpqYrmny5qCrIMqQCiMTtWHh0tK5W0IXHKo9s8Zj8z3KKlDGxm42UhT
	Dg3y5oNEDFqZuna+zipbT4BsjIaapb20oRP+TE/sw8yvs33lPtlQDuhXdWQVSlU835u9jO1OzFRG8
	5V+oy9NGpD3CU9J7sTxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRAnb-00000008AGU-1rDp;
	Thu, 04 Dec 2025 14:59:15 +0000
Received: from m16.mail.126.com ([220.197.31.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRAnZ-00000008AF8-22o8
	for opensbi@lists.infradead.org;
	Thu, 04 Dec 2025 14:59:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=4f
	+cihrWXfgYCOkAAMIzHS7vDbirpbh3DPMqdNYs0+M=; b=oUshGj7/G1YQMD95PH
	i8uKKDRyG/wSY44REpwH72HXN3UZuSTLSLNkdZZx4KG6v2/NAR9ujPaZWvRP12uB
	McQko7kBL58X17ll0S+EoCRt+9eplCB55Q2ljSLYqvua06V4HNPE8jBC7Mld+Tj/
	wRhLgVMYbJy131/rDrEluFkkc=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3pwu4oTFpKmb+AA--.24795S4;
	Thu, 04 Dec 2025 22:59:05 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	peter.lin@sifive.com,
	David Li <davidli.li@linux.alibaba.com>,
	Xiang W <wangxiang@iscas.ac.cn>
Subject: [PATCH 2/2] platform: thead: restore platform CSR when suspend
Date: Thu,  4 Dec 2025 22:58:52 +0800
Message-ID: <20251204145901.411369-3-wxjstz@126.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251204145901.411369-1-wxjstz@126.com>
References: <20251204145901.411369-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3pwu4oTFpKmb+AA--.24795S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxZryxZF1UuFyDJw13uF4DArb_yoW5KF45pa
	yDCrWUtr4kGFn7Cw4ft3Z8ArsxArWxWa13ZrZ8Za4avwnrKwn5JrykuF1fXr15trZ5Jw4r
	Ar1kA343GayqqrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zirHUkUUUUU=
X-Originating-IP: [2408:823c:b211:2949:db98:1913:e9e:6e1a]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbiFx8aOmkxi-XnxQAAss
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_065913_913484_590F17BA 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

Some CSRs in Thead need to be backed up and restored during HART
suspend.

Signed-off-by: David Li <davidli.li@linux.alibaba.com>
Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
---
 .../generic/include/thead/c9xx_encoding.h     |  1 +
 platform/generic/thead/thead-generic.c        | 53 +++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/platform/generic/include/thead/c9xx_encoding.h b/platform/generic/include/thead/c9xx_encoding.h
index a45b171e..bcbd9e24 100644
--- a/platform/generic/include/thead/c9xx_encoding.h
+++ b/platform/generic/include/thead/c9xx_encoding.h
@@ -16,6 +16,7 @@
 #define THEAD_C9XX_CSR_MCOUNTEROF	0x7cb
 #define THEAD_C9XX_CSR_MHINT2		0x7cc
 #define THEAD_C9XX_CSR_MHINT3		0x7cd
+#define THEAD_C9XX_CSR_MHINT4		0x7ce
 #define THEAD_C9XX_CSR_MRADDR		0x7e0
 #define THEAD_C9XX_CSR_MEXSTATUS	0x7e1
 #define THEAD_C9XX_CSR_MNMICAUSE	0x7e2
diff --git a/platform/generic/thead/thead-generic.c b/platform/generic/thead/thead-generic.c
index ddb4f0bf..63e33849 100644
--- a/platform/generic/thead/thead-generic.c
+++ b/platform/generic/thead/thead-generic.c
@@ -7,6 +7,7 @@
  */
 
 #include <platform_override.h>
+#include <thead/c9xx_encoding.h>
 #include <thead/c9xx_errata.h>
 #include <thead/c9xx_pmu.h>
 #include <sbi/sbi_const.h>
@@ -15,10 +16,61 @@
 #include <sbi/sbi_string.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 
+/* redefine CSR register */
+#define CSR_MXSTATUS	THEAD_C9XX_CSR_MXSTATUS
+#define CSR_MHCR	THEAD_C9XX_CSR_MHCR
+#define CSR_MCCR2	THEAD_C9XX_CSR_MCCR2
+#define CSR_MHINT	THEAD_C9XX_CSR_MHINT
+#define CSR_MHINT2_E	THEAD_C9XX_CSR_MHINT2
+#define CSR_MHINT4	THEAD_C9XX_CSR_MHINT4
+#define CSR_MSMPR	THEAD_C9XX_CSR_MSMPR
+#define CSR_SMPEN	CSR_MSMPR
+
 struct thead_generic_quirks {
 	u64	errata;
 };
 
+extern struct sbi_platform platform;
+
+static inline bool thead_has_hotplug(void)
+{
+	return platform.hart_count > 1;
+}
+
+static void thead_suspend_non_ret_save(unsigned long *data)
+{
+	data[0] = csr_read(CSR_SMPEN);
+	data[1] = csr_read(CSR_MCCR2);
+	data[2] = csr_read(CSR_MXSTATUS);
+	data[3] = csr_read(CSR_MHINT);
+	data[4] = csr_read(CSR_MHCR);
+	data[5] = csr_read(CSR_MHINT2_E);
+	data[6] = csr_read(CSR_MHINT4);
+}
+
+static void thead_suspend_non_ret_restore(unsigned long *data)
+{
+	csr_write(CSR_SMPEN, data[0]);
+	csr_write(CSR_MCCR2, data[1]);
+	csr_write(CSR_MXSTATUS, data[2]);
+	csr_write(CSR_MHINT, data[3]);
+	csr_write(CSR_MHCR, data[4]);
+	csr_write(CSR_MHINT2_E, data[5]);
+	csr_write(CSR_MHINT4, data[6]);
+}
+
+static int thead_nascent_init(void)
+{
+
+	if (thead_has_hotplug()) {
+		platform.suspend_backup_csr_count = 7;
+		generic_platform_ops.suspend_non_ret_save = thead_suspend_non_ret_save;
+		generic_platform_ops.suspend_non_ret_restore = thead_suspend_non_ret_restore;
+	}
+
+	return generic_nascent_init();
+}
+
 static int thead_tlb_flush_early_init(bool cold_boot)
 {
 	thead_register_tlb_flush_trap_handler();
@@ -44,6 +96,7 @@ static int thead_generic_platform_init(const void *fdt, int nodeoff,
 {
 	const struct thead_generic_quirks *quirks = match->data;
 
+	generic_platform_ops.nascent_init = thead_nascent_init;
 	if (quirks->errata & THEAD_QUIRK_ERRATA_TLB_FLUSH)
 		generic_platform_ops.early_init = thead_tlb_flush_early_init;
 	if (quirks->errata & THEAD_QUIRK_ERRATA_THEAD_PMU)
-- 
2.47.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
