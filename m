Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46015606A321
	for <opensbi@archiver.kernel.org>; Tue, 27 Oct 2026 08:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h3Y0f3DX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=YPEDrJLO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KPSK30VN9Hi0V8xyc1tWkm4ZxmHhNuW6MAEF9zLP8PU=; b=h3Y0f3DXx4u3AnnossxRc/22So
	jUK1tGPu/BU3SGG//VJEKmqnmmTNvuNoGhSeMSKJkfalYCesJSkUEeslmQhn+ftAZnVfRys1pRu4m
	VAfNMPsQeY0swpXfNHWtmNs0bG9frNwMNxfKXt2gJnHZG0njzVvru2xLv9+rLiYvhCNFh1o0vPptX
	0pxMpzgBhIZKl+0fagMhX6svqLKX/QwttWOgw/q+Yj+xczjE3+BBc+60ZslMLtkgXtEEiaYzqAfi8
	ByHAP8KmaXzBf8JbGPKnLJYl6+q59nqX48ekvotnjAJx/0FkjR6qSf66C8QaLR0JpS4D7V4Q2Earv
	V8Eat0ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLceu-000000042Ru-0gRy;
	Tue, 27 Oct 2026 08:35:52 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLces-000000042Qq-0lWG
	for opensbi@lists.infradead.org;
	Tue, 27 Oct 2026 08:35:51 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8a06e79e152so1895315b3a.0
        for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 01:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793090149; x=1793694949; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZYpfwBjxbglE2xeUtcNpSQs5QdVN70Lgde8EFvXEos8=;
        b=YPEDrJLOzhCfxFuWjuNdFa5T3RL5SJDerVcs9YNXMSV8W6KUXf/crkTBVog1MMJefy
         Vc+mJi2cHTQe6t9Fe/1hd4HXjW6NKZNIPwd/6cyThNGylci9O9cdvidDsnq6jpUBIClV
         1GcCwYJc8JUbgC8ZrQc6VqlkI7bs0+ZAcsyWUkK6lBy9u8qOF6dQv06F1ywqjX6AKO8X
         olW7qLtDHX7Mv0qnvwIyuILlDxy773l/rQoMzCUp8hnO4/xrOkxOnk0xb7fQ95b/htmV
         rq4glq+xVeDt6JGEIBC7K8FG7w1v7O/9uV7EvZd7Ilpdgil6uWmWtDJzzwN/oxeOlYor
         QMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090149; x=1793694949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZYpfwBjxbglE2xeUtcNpSQs5QdVN70Lgde8EFvXEos8=;
        b=T2QYLbT6cGVVAlh20W0F+e6rq1L1eUPBXC1JloYPLtIFv9Wsvf3h3O05kx+tbkEniT
         AuUgmK2Ir+waaKp9jqfQDXZjL4KO7eoHH1YjnqTLnE/lyZY5K3z+PCVdVuRUwcWv13qO
         VBoVUPjk1Y2oTbIREtJrRNu2KTHtvh34tOxGZe4aWz6P775w5tBCceQCc777cKBm2vdm
         a/F3PehvojxuUIzIo0dCnt8ayOO+IPhpFv0tUnYTvRM4iGpUYXjYeA+u+8VgsoihHekb
         3dXBC8WiYRAMXKOppB4kxpCrP8fylZLO7rnUsFuLEylnUsrIDn/KOUFKQYFg0BzfNFM/
         nhrw==
X-Gm-Message-State: AFq9FYJdqmkIyk6MYZcFvdzZQPhP1obHxZdCIH1K7BhofTAc6YKuWmq+
	08+1s5NAEAl16GcZ+xQhokGnSPNqQ45CBGk4W+gUMbZWlCNlFH7uqVtjKCT0zpe3cI25kHd1FFi
	+QQ33PXoHFV6JVmMdN2fZ6XocFnAatB7QKLr5WibRKGOB68X07u/T4nHuheYeoRWkBOzXli6sxM
	ieLRGmtGyd4EQKIJfeg5ypUstzwlPKP2C7EKkdSc2mkXiPlvTpbdA=
X-Gm-Gg: AYBFou3dyPWd3VEd/XlFYis2pPwZ+Z94pIr3txxF9e1y9h4/yAl8ZhAI4s/qxuQN1i5
	lvefNLQxdSOWlmklNhaL3rDEwtn5/qcJfeZaItI86GvP8aURTc+R9bZi4xWVcBrIDbVb2Ij/0aM
	PxyD3mfNJGCdRXiFUj90f+cFezcQV9FgvHCnVsyjwQ+NS+/YXMqKX5K36hJEQbGWzzGiQoIQq4c
	d8hVv97dH+rQemoLXxeyQGKpnGVeLTivy6jOfijfB3oMixevTvKub6jQuRFqyD0FyqvH5xDAvp6
	SBRpVYCXwI2T5xd2I8G63wY8FOdByXKlWBSnlNSvd3t1KOWhblM+ymbz9D019Qc+EjySxVdITdG
	qcqQ3XYFv9XDtarlWXw/tDeTit94icyuY2n3lUw8+zSNp2+00qhmj0QElAZ81fbjDugrHOnEFjS
	YTXV7mey2jF+/vV2vXZSfXM2fUTNl/mbGdWKF1LqpbRIEN1uLnMUmTI/Vnp9tn07tsaDNy8s9Tx
	91womQADt7gSGVudLPpQdhotGA+dp9skmmqkLQPHX3s/j0aqgSrMMOADMnw+zXzW+dhmNrkwsvF
	UNX+7jCJ7dsUUrE61bEr2hePhw7M
X-Received: by 2002:a05:6a00:3685:b0:88d:3f61:20e9 with SMTP id d2e1a72fcca58-8a369737d1cmr6472473b3a.48.1793090149085;
        Tue, 27 Oct 2026 01:35:49 -0700 (PDT)
Received: from localhost ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36bb29546sm2001210b3a.33.2026.10.27.01.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:35:48 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com,
	rkrcmar@qti.qualcomm.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v3 2/9] lib: utils: fdt_helper: parse RISC-V Worlds per-hart WID properties
Date: Tue, 27 Oct 2026 16:35:02 +0800
Message-Id: <20261027083509.1076577-3-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027083509.1076577-1-peter.lin@sifive.com>
References: <20261027083509.1076577-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_013550_226870_F18CA4A7 
X-CRM114-Status: GOOD (  14.96  )
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add fdt_parse_worlds_all_harts() to parse platform-defined DT
properties in the /cpus/cpu@X:
- riscv,pmwid: M-mode World ID
- riscv,pmwidlist: bitmap of permitted M-mode WIDs
- riscv,pmlwidlist: bitmap of permitted lower-privilege WIDs
Store parsed values in struct sbi_hart_features.

These platform-defined values serve as the root-of-trust constraints
for per-domain WID assignment during domain creation and context
switching.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
Change v2->v3:
- Drop has_pmwidlist presence flag and check pmwidlist directly.
---
 include/sbi/sbi_hart.h             |  5 ++
 include/sbi_utils/fdt/fdt_helper.h |  2 +
 lib/utils/fdt/fdt_helper.c         | 90 ++++++++++++++++++++++++++++++
 platform/generic/platform.c        | 13 ++++-
 4 files changed, 109 insertions(+), 1 deletion(-)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 2941809e..a1860a9c 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -135,6 +135,11 @@ struct sbi_hart_features {
 	unsigned int pmp_log2gran;
 	unsigned int mhpm_mask;
 	unsigned int mhpm_bits;
+	u32 pmwid;
+	u64 pmwidlist;
+	u64 pmlwidlist;
+	bool has_pmwid;
+	bool has_pmlwidlist;
 };
 
 extern unsigned long hart_features_offset;
diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 75a564d1..3f3d091b 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -56,6 +56,8 @@ int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq);
 
 int fdt_parse_isa_extensions_all_harts(const void *fdt);
 
+int fdt_parse_worlds_all_harts(const void *fdt);
+
 int fdt_parse_gaisler_uart_node(const void *fdt, int nodeoffset,
 				struct platform_uart_data *uart);
 
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 747ba028..4701606d 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -457,6 +457,96 @@ int fdt_parse_isa_extensions_all_harts(const void *fdt)
 	return 0;
 }
 
+int fdt_parse_worlds_all_harts(const void *fdt)
+{
+	u32 hartid;
+	const fdt32_t *val;
+	struct sbi_scratch *scratch;
+	struct sbi_hart_features *hfeatures;
+	int err, cpu_offset, cpus_offset, len;
+
+	if (!fdt)
+		return SBI_EINVAL;
+
+	cpus_offset = fdt_path_offset(fdt, "/cpus");
+	if (cpus_offset < 0)
+		return cpus_offset;
+
+	fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {
+		err = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
+		if (err)
+			continue;
+
+		if (!fdt_node_is_enabled(fdt, cpu_offset))
+			continue;
+
+		scratch = sbi_hartid_to_scratch(hartid);
+		if (!scratch)
+			return SBI_ENOENT;
+
+		hfeatures = sbi_hart_features_ptr(scratch);
+		if (!hfeatures)
+			return SBI_ENOENT;
+
+		val = fdt_getprop(fdt, cpu_offset, "riscv,pmwid", &len);
+		if (val && len == sizeof(fdt32_t)) {
+			hfeatures->pmwid = fdt32_to_cpu(*val);
+			hfeatures->has_pmwid = true;
+		}
+
+		val = fdt_getprop(fdt, cpu_offset, "riscv,pmwidlist", &len);
+		if (val && len == 2 * sizeof(fdt32_t)) {
+			hfeatures->pmwidlist = ((u64)fdt32_to_cpu(val[0]) << 32) |
+						fdt32_to_cpu(val[1]);
+			if (!hfeatures->pmwidlist) {
+				sbi_printf("%s: hart%u riscv,pmwidlist is empty\n",
+					   __func__, hartid);
+				return SBI_EINVAL;
+			}
+		}
+
+		val = fdt_getprop(fdt, cpu_offset, "riscv,pmlwidlist", &len);
+		if (val && len == 2 * sizeof(fdt32_t)) {
+			hfeatures->pmlwidlist = ((u64)fdt32_to_cpu(val[0]) << 32) |
+						 fdt32_to_cpu(val[1]);
+			hfeatures->has_pmlwidlist = true;
+		}
+
+		/* Sanity checks */
+#if __riscv_xlen == 32
+		if (hfeatures->pmwidlist &&
+		    (hfeatures->pmwidlist >> 32)) {
+			sbi_printf("%s: hart%u riscv,pmwidlist has bits beyond XLEN\n",
+				   __func__, hartid);
+			return SBI_EINVAL;
+		}
+
+		if (hfeatures->has_pmlwidlist &&
+		    (hfeatures->pmlwidlist >> 32)) {
+			sbi_printf("%s: hart%u riscv,pmlwidlist has bits beyond XLEN\n",
+				   __func__, hartid);
+			return SBI_EINVAL;
+		}
+#endif
+
+		if (hfeatures->has_pmwid &&
+		    hfeatures->pmwid >= __riscv_xlen) {
+			sbi_printf("%s: hart%u riscv,pmwid (%u) exceeds max WID\n",
+				   __func__, hartid, hfeatures->pmwid);
+			return SBI_EINVAL;
+		}
+
+		if (hfeatures->pmwidlist && hfeatures->has_pmwid &&
+		    !(hfeatures->pmwidlist & BIT_ULL(hfeatures->pmwid))) {
+			sbi_printf("%s: hart%u riscv,pmwid (%u) not in pmwidlist\n",
+				   __func__, hartid, hfeatures->pmwid);
+			return SBI_EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static int fdt_parse_uart_node_common(const void *fdt, int nodeoffset,
 				      struct platform_uart_data *uart,
 				      unsigned long default_freq,
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 1df0280d..51e9f342 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -255,11 +255,22 @@ int generic_final_init(bool cold_boot)
 
 int generic_extensions_init(bool cold_boot)
 {
+	int rc;
+
 	if (!cold_boot)
 		return 0;
 
 	/* Parse the ISA string from FDT and enable the listed extensions */
-	return fdt_parse_isa_extensions_all_harts(fdt_get_address());
+	rc = fdt_parse_isa_extensions_all_harts(fdt_get_address());
+	if (rc)
+		return rc;
+
+	/* Parse RISC-V Worlds CPU properties from FDT */
+	rc = fdt_parse_worlds_all_harts(fdt_get_address());
+	if (rc)
+		return rc;
+
+	return 0;
 }
 
 int generic_domains_init(void)
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
