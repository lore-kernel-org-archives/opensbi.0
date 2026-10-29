Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C099E606A31D
	for <opensbi@archiver.kernel.org>; Thu, 29 Oct 2026 16:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vje3HoWD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J1nKZxIB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FJqbMHYVAjoSydz6XhkXtV5Dxjl+oGQ4DwwjjD0JTe8=; b=vje3HoWD+y9KPBFfWwyEpdefBB
	iycikPksIuuGcHmAkNt4OTZwdg11zjGEOGn3OOwrS0XMlxyziIszq+NKf0OE9cWv4tNRrj41AT2qy
	JDEHYjbGIuZGN8Bd/pd1XawUonDAzfO3w7rqf/AE2tcr5oJ9B/pli+O+DZjkXxBkQbK54amwzb34J
	m7Piv70+p8ZNR7UMMoawrFM8VjkE6W1M022GrftD3UcPpDKVeMEOTcyjdU3XIgZGGLBBpB9DadZ5s
	PTzWaowQBuBk2SfnKxGt2xrn8ms68wsLx/gxgYugQ0DxFdJGKT2/GC6UqmmswIkVvvzPN7f2yC69f
	cI+kqZNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSXt-00000009iRk-2c6L;
	Thu, 29 Oct 2026 16:00:05 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSXr-00000009iOo-0PNQ
	for opensbi@lists.infradead.org;
	Thu, 29 Oct 2026 16:00:04 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-53cd0c8614eso22176271cf.0
        for <opensbi@lists.infradead.org>; Thu, 29 Oct 2026 09:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793289602; x=1793894402; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QNWnk1WnlTEiuWVj2XqpdKYQuLgGWpb+1WiweRM0crE=;
        b=J1nKZxIBw63/Q+KV1fqU47h7HccCD+qjRgVBZzZqICCt6NW7r9xRGL32BS05D9NnNG
         O5ah5QAs6xeZi83LF5XEVXyVTfM4jn4PUWbnf1X+AdQkYehQ6roInDNgDmMngX/BuEqI
         6AHfZsRds0AZ5Q32ZaozJxun/RYwYCYzfm+BM6UX0CSRcFRgCEz2Q8AaiBN9xwmR92ZA
         3Rn4AM2/vOAdo6Bp4ajVgBU+kUMkjuQ5WDBBAmNbbIFPQ1Ai4heNg/Nx0UsAuCrWoulv
         V9Ihugm472HO0BXqrUphYWJ6yhK3HGLUQ6DOFMg2B3FN+/baRGTQMJ8Yaa4Xd4kg3Gby
         CPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793289602; x=1793894402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QNWnk1WnlTEiuWVj2XqpdKYQuLgGWpb+1WiweRM0crE=;
        b=tM8C7BAuEvaiVetn6lyN1Z8sOguYOpiO88QnlRjuqtllYMXwMQ7sYVPJv2ggPKLVRP
         s2tn7TQDXYV1gShCtNGYqmCz/AffdKWdVq3MIW2DImP2kH169iWWWbp2LkgOWZgcJFjS
         ibC6hanlM20hLvkFtWFnuxqracMnvv32op/eWxNCdl1CpFWV4+HJ5umGS4ghC5zKBdsw
         lInfoqYsT65yA0INrS4Xo7BI9vmX4r/zX/In8+ZM8wys+d3Cy5AgSxQbe8ZqOT2mI04c
         JidPWzsdZQI10Bc4kCYhEbaVxQlxImSwaj/iTEfi86ZUT1NtCYQUBh5GcaTGwuPuTsKH
         ymqw==
X-Gm-Message-State: AFq9FYLnDa9tNQbIWrYsQDgawk0sNSZYQ8XWUvQTc2/uzbqyutQDkcCH
	nKpDHM4WWEsz+tCnjNQovpwnYRH9+orZSt59hpVQEKx9/urjrNuwFPJx3QDjhg==
X-Gm-Gg: AYBFou2aPK6XFMBBmmXFRhxr17iF/DOcs0a3cdMdDcj6dsl9M0pkKrVJcYwhzumGaJy
	xHJSHHt5e78GpOp7VvtRa1d23AZPHaJuh55ynWB5NoeDn9uvJ7rGWSOFn+CXciFhxps0WVasLNg
	trtQzGlVQoQF8XUWznbCVI6aWeIOaXPFMBtdVF8+c2E60tm+9zjeazSjA7PEMIYiTbyet0AK6AM
	wjdueeMJCH3YUovIbOgPrna3EK5daumLwqTg2xd7KWI7x7/cMimzsRjU9c/cQw4hl3qAFKVT6Z9
	fcYgD8qBtrZGBke3vUlgwzHtSOTzBA2dyeER7sUZTRuvVauejo8cWBtP03TE8MG+xTmgkiYL/km
	n57b58TERxMJ7mOMJOhVmaGn0PMQWKBSieFp8ddu7O1TaKRTL4i0eHbsVqGzw8tl6g6iF06ixJv
	Tji3WdBOx6bq0jafztd4GVZ/ZYdYY8fgVCA7f+LJYTwj7XZjgtOqmU/N33++zvoOvqM0Ww1RXIe
	4RWNTXCNLOOvHEjdX1bzhbc/sdplVGvkEC4xQrvQO8jFz56u+NcyURrhjT5jw84FsaQhPjcNxGc
	P2N6uthxdDiX/iNJG9Jlti21zgbG7/zHR3MFZTW6DvnvoUuXTymMN08MjbvercjrICpZv5KScpQ
	KHyX7+Aiw57DZqw==
X-Received: by 2002:a05:622a:1824:b0:536:6ec7:9f57 with SMTP id d75a77b69052e-53fcb7fd173mr93023931cf.38.1793289601964;
        Thu, 29 Oct 2026 09:00:01 -0700 (PDT)
Received: from ubuntu.localdomain (69-171-141-154.rdns.distributel.net. [69.171.141.154])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394f82cfsm133231001cf.13.2026.10.29.09.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:00:01 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	anup.patel@oss.qualcomm.com,
	scott@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	peter.lin@sifive.com
Subject: [PATCH v2 08/12] lib: utils: irqchip: derive APLIC targets from sysirq nodes
Date: Thu, 29 Oct 2026 11:59:25 -0400
Message-Id: <20261029155929.586597-9-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261029155929.586597-1-raymondmaoca@gmail.com>
References: <20261029155929.586597-1-raymondmaoca@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_090003_162784_02194592 
X-CRM114-Status: GOOD (  17.89  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
index 8d6d871e..76b39099 100644
--- a/include/sbi_utils/irqchip/aplic.h
+++ b/include/sbi_utils/irqchip/aplic.h
@@ -48,6 +48,7 @@ struct aplic_data {
 	struct aplic_msicfg_data msicfg_smode;
 	struct aplic_delegate_data delegate[APLIC_MAX_DELEGATE];
 	u32 *idc_map;
+	u32 *hwirq_target_hartindex;
 };
 
 int aplic_cold_irqchip_init(struct aplic_data *aplic);
diff --git a/lib/utils/irqchip/fdt_irqchip_aplic.c b/lib/utils/irqchip/fdt_irqchip_aplic.c
index 4d7b1e77..0f9ba636 100644
--- a/lib/utils/irqchip/fdt_irqchip_aplic.c
+++ b/lib/utils/irqchip/fdt_irqchip_aplic.c
@@ -12,6 +12,7 @@
 #include <sbi/riscv_asm.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_heap.h>
+#include <sbi/sbi_scratch.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/irqchip/fdt_irqchip.h>
 #include <sbi_utils/irqchip/aplic.h>
@@ -53,6 +54,88 @@ static int irqchip_aplic_update_idc_map(const void *fdt, int nodeoff,
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
+			u32 hwirq;
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
+			hwirq = args.args[0];
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
@@ -79,6 +162,24 @@ static int irqchip_aplic_cold_init(const void *fdt, int nodeoff,
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
@@ -86,6 +187,8 @@ static int irqchip_aplic_cold_init(const void *fdt, int nodeoff,
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
