Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85908CD4F39
	for <opensbi@archiver.kernel.org>; Thu, 14 May 2026 22:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YcfmGtKeLnYXd+U/gksEU1BDR116YmX1TWTvTAC99mw=; b=yeaqOhBBD136hf
	GUI2k7aLmSoFdBofYYoHORvC0eup3VzsnEyZ3NL1p+Vusqw3eSA4W550fxymKzpHv76BTzn5PwAuX
	OEoBwodEymXtHu9UihiCvXNURQOIUc9SBGDgBOKHm4X94jhfOJJs+S3LnGIwIBfas41xJvvZRj3aB
	XSS7uTnsRBomfOPKyvgLTY30O8CpHuENNHHnkpq1Lc2SZ4BbErQjk17Ur7CU1S8NpFzmLNoE/ao+a
	NtFd/aH7dFBAzeAQq/RFMYtrKCG2VxI9juCT/ucHmfGkOvS9Dpodiey9HX3jdfW5h7P/fs7Y3ZY84
	WREjZBuCf4eqHtybzR8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNf0f-00000006m5l-2Zmj;
	Thu, 14 May 2026 22:58:29 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNf0d-00000006m2g-10kD
	for opensbi@lists.infradead.org;
	Thu, 14 May 2026 22:58:28 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-8b4298d271fso133128356d6.3
        for <opensbi@lists.infradead.org>; Thu, 14 May 2026 15:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778799506; x=1779404306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m1MwrApCDgBZqkiFCvRZ4dDoviULjdi5FtmKaZth3us=;
        b=I2tAUOeI0csH+it2A6tMXnbJ0gK3yEF4x96hyNowjjQb6AJBUAWz4DHPXeouBcQNrr
         JpSWdrUZbbvjP1MdLD9T4RBwJXoU3aDqlwK0cJNX8LIXMy8j4ceDz/Fcos6EukVIGpwU
         eVazeBOnvkxOhByPcogL+o8MOM9k2H55fAO7ehqZj7jD/JAUSjzePMCRcEC8EKj1Jyi6
         r3pt2SxKvgyu3vkpZW04hAZeiThaXSZQxiiwf6i+xsPnEj4anzpoHhTmz8tgaCdEX9mR
         pkjtgUbuZeMDMbkoqpaKGFfeblFtd0WCKoGawEUf46Ba32p4agb+ZJeb9Wy8N14469oz
         TB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778799506; x=1779404306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m1MwrApCDgBZqkiFCvRZ4dDoviULjdi5FtmKaZth3us=;
        b=OIUPXFWl1iA/YHbEg/NFSlaacVQPSJeD7Dc/tO6CAMYyhC2sOQx7hfKE11wXdlJotm
         6Cc+dZnnATJaHbdfYGviLSpB4gwsIfqJqrYsfRSh4/Jx0P5asUpp6vEJp/qnw1tg5dfU
         SiCG8IJ9qWv0r6mSTHTNSWuH0xN8v71HABLbWiHaU4v6Wk/JApgtabzATUkHWySSVGld
         xeazmhWhygP7jBaplSwkC3jmu8n+dlri/HS2oRcFh6K2djuWr5fb9+mvWoMMCVaVaDy7
         9Bi9eXHRsLg7sDAgQWESa8fLHfsfJbmLP7Di0HOC4lmcg7nrg4wUSF2FMn1xTGw4wkn3
         P+AQ==
X-Gm-Message-State: AOJu0Yxeqi7tX1uEM1qzWIIKYXUgJHiJlmeMdygUIDiRor519dQR5A1y
	HFFqz0edjU4a2i1ZjKZdcN8DcdC/dnt8vsj260Nhh8bQt3AQHd+rSMUDBuckDw==
X-Gm-Gg: Acq92OH0n9nHQZUpQ/d7ybCdTQpH6laHc1vn6S4mmCo8iZRhflpsqxJrbkiy19ZSJD3
	YjJLJBFL6U7OhNmWtThTFc90HQeXQ67U8KNE/PsacxCgFFQM/jkm+3jNuFBXasaM8Pkug8/RBeT
	nNKjnTYdU/ZDR8hHZllhl/2PgJ3jqdgp6gasYeTQRrAKzclzz/zpbOVOhy4BPj6ZmoT6UhhxqMx
	Y/MZcN+1NoEUvH32jXhotyVqjRZMxwjrMBb7DxBsqYUzonhPR1wIleQ0sIg8w1gGYl5pPXVxuUH
	ZD4ljhNRH2DgZ5vYrOjkhRMnLy1LP/VR6NpAU9hDiaSj6ZBsQsz+TObRqRkkTJaAJgS6M1aG5k8
	31NC6VAgusPQrxVu7z9B2C4kp8xeLmO1aAXxdGhJiTY78XHqkCxBB4PyOkl5HPJKT2P9kBTsRD6
	TQ7Z12MBElfdxUfA3fNvDGHpKN3VQ7gFZDsHBBI92x88CHu481Z9RACWzwWTxZGB1/1Ev6Q1Ucv
	EcBUejrEBTPPd0Mr6t+fQ==
X-Received: by 2002:a05:6214:601b:b0:8bd:c9ca:7b5c with SMTP id 6a1803df08f44-8ca0f6e4e26mr26494606d6.44.1778799505771;
        Thu, 14 May 2026 15:58:25 -0700 (PDT)
Received: from ubuntu.localdomain (172-97-209-197.cpe.distributel.net. [172.97.209.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90c16366csm34974426d6.40.2026.05.14.15.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:58:25 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	anup.patel@qti.qualcomm.com,
	anuppate@qti.qualcomm.com,
	anup@brainfault.org,
	dhaval@rivosinc.com,
	peter.lin@sifive.com
Subject: [PATCH 07/10] lib: utils: irqchip: derive APLIC targets from sysirq nodes
Date: Thu, 14 May 2026 18:57:53 -0400
Message-Id: <20260514225756.2255758-8-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260514225756.2255758-1-raymondmaoca@gmail.com>
References: <20260514225756.2255758-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_155827_305693_3E0AAA98 
X-CRM114-Status: GOOD (  17.30  )
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

From: Raymond Mao <raymond.mao@riscstar.com>

Derive a per-HWIRQ target hartindex map from each sysirq node's
target domain boot-hart, and store the result in aplic_data.
This is used for setting IDC target per HWIRQ under irqchip driver
instead of hardcoding to a specific target.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 include/sbi_utils/irqchip/aplic.h     |   1 +
 lib/utils/irqchip/fdt_irqchip_aplic.c | 103 ++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/include/sbi_utils/irqchip/aplic.h b/include/sbi_utils/irqchip/aplic.h
index 3461d1c7..d6e088f8 100644
--- a/include/sbi_utils/irqchip/aplic.h
+++ b/include/sbi_utils/irqchip/aplic.h
@@ -47,6 +47,7 @@ struct aplic_data {
 	struct aplic_msicfg_data msicfg_smode;
 	struct aplic_delegate_data delegate[APLIC_MAX_DELEGATE];
 	u32 *idc_map;
+	u32 *hwirq_target_hartindex;
 };
 
 int aplic_cold_irqchip_init(struct aplic_data *aplic);
diff --git a/lib/utils/irqchip/fdt_irqchip_aplic.c b/lib/utils/irqchip/fdt_irqchip_aplic.c
index f9b567f5..cbbdf8d8 100644
--- a/lib/utils/irqchip/fdt_irqchip_aplic.c
+++ b/lib/utils/irqchip/fdt_irqchip_aplic.c
@@ -13,6 +13,7 @@
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_heap.h>
+#include <sbi/sbi_scratch.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/irqchip/fdt_irqchip.h>
 #include <sbi_utils/irqchip/aplic.h>
@@ -54,6 +55,88 @@ static int irqchip_aplic_update_idc_map(const void *fdt, int nodeoff,
 	return 0;
 }
 
+static u32 irqchip_aplic_domain_boot_hartindex(void *fdt, int domain_offset)
+{
+	int len, cpu_offset;
+	const fdt32_t *val;
+
+	val = fdt_getprop(fdt, domain_offset, "boot-hart", &len);
+	if (val && len >= 4) {
+		cpu_offset = fdt_node_offset_by_phandle(fdt,
+							fdt32_to_cpu(*val));
+		if (cpu_offset >= 0) {
+			u32 hartid;
+
+			if (!fdt_parse_hart_id(fdt, cpu_offset, &hartid)) {
+				u32 hidx = sbi_hartid_to_hartindex(hartid);
+
+				if (sbi_hartindex_valid(hidx))
+					return hidx;
+			}
+		}
+	}
+
+	return current_hartindex();
+}
+
+static void irqchip_aplic_fill_hwirq_targets_from_sysirq(const void *fdt,
+							 int aplic_nodeoff,
+							 struct aplic_data *pd)
+{
+	int chosen_off, nodeoff;
+	int len, rc, index;
+	const fdt32_t *val;
+	u32 boot_hartindex;
+
+	if (!fdt || aplic_nodeoff < 0 || !pd || !pd->hwirq_target_hartindex)
+		return;
+
+	chosen_off = fdt_path_offset(fdt, "/chosen/opensbi-domains");
+	if (chosen_off < 0)
+		return;
+
+	fdt_for_each_subnode(nodeoff, fdt, chosen_off) {
+		if (fdt_node_check_compatible(fdt, nodeoff,
+					      "opensbi,mpxy-sysirq"))
+			continue;
+
+		val = fdt_getprop(fdt, nodeoff, "opensbi,domain", &len);
+		if (!val || len < 4)
+			continue;
+
+		rc = fdt_node_offset_by_phandle(fdt, fdt32_to_cpu(*val));
+		if (rc < 0)
+			continue;
+
+		boot_hartindex = irqchip_aplic_domain_boot_hartindex((void *)fdt,
+								     rc);
+
+		for (index = 0; ; index++) {
+			struct fdt_phandle_args args;
+
+			rc = fdt_parse_phandle_with_args(fdt, nodeoff,
+							 "interrupts-extended",
+							 "#interrupt-cells",
+							 index, &args);
+			if (rc)
+				break;
+			if (args.args_count < 1)
+				continue;
+			if (args.node_offset != aplic_nodeoff)
+				continue;
+
+			u32 hwirq = args.args[0];
+
+			if (!hwirq || hwirq > pd->num_source)
+				continue;
+
+			if (pd->hwirq_target_hartindex[hwirq] == -1U)
+				pd->hwirq_target_hartindex[hwirq] =
+					boot_hartindex;
+		}
+	}
+}
+
 static int irqchip_aplic_cold_init(const void *fdt, int nodeoff,
 				   const struct fdt_match *match)
 {
@@ -85,6 +168,24 @@ static int irqchip_aplic_cold_init(const void *fdt, int nodeoff,
 			goto fail_free_idc_map;
 	}
 
+	/* Precompute target hartindex per HWIRQ from DT. */
+	if (pd->targets_mmode) {
+		u32 i;
+
+		pd->hwirq_target_hartindex =
+			sbi_zalloc(sizeof(*pd->hwirq_target_hartindex) *
+				   (pd->num_source + 1));
+		if (!pd->hwirq_target_hartindex) {
+			rc = SBI_ENOMEM;
+			goto fail_free_idc_map;
+		}
+
+		for (i = 0; i <= pd->num_source; i++)
+			pd->hwirq_target_hartindex[i] = -1U;
+
+		irqchip_aplic_fill_hwirq_targets_from_sysirq(fdt, nodeoff, pd);
+	}
+
 	rc = aplic_cold_irqchip_init(pd);
 	if (rc)
 		goto fail_free_idc_map;
@@ -93,6 +194,8 @@ static int irqchip_aplic_cold_init(const void *fdt, int nodeoff,
 	return 0;
 
 fail_free_idc_map:
+	if (pd->hwirq_target_hartindex)
+		sbi_free(pd->hwirq_target_hartindex);
 	if (pd->num_idc)
 		sbi_free(pd->idc_map);
 fail_free_data:
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
