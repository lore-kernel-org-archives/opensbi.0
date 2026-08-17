Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D401C5DF66
	for <opensbi@archiver.kernel.org>; Mon, 17 Aug 2026 09:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5YmKqgWj8Gjg12dAmads2Bm9lCq63cqzDapnUWCmuGk=; b=XuD0hIuVc2iAj+
	z9hE9XoFbKAMZ636YZIzvy/CHBh/3GxXEQTO8iNqAZrXIIM29ZYbgVkntkmHpWmFvVXDEvEa92Rf0
	Antd7vbw1nt2N0CprB+VGORzPqiRky5uJ6FlSvtiswymeSr5poeXCDSJyrM3tENpu5EJceRW6taoq
	+CoqrmS4TjSZcADZZKQnfVhMiNwXQaewvS3kY/ulvEJrLen2vcqf7wIdc9udbHhZ4SlBWbPkqemwZ
	m5yL73eHcHilINTTxEOA/9PUzRz8zTmzvWAhudbJ5mRXiwEEjSknukI+uf3pftCF7IlNBX2VGobE0
	LNd6Up2ct8N7Mau7s8Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtHb-00000005lW4-02G4;
	Mon, 17 Aug 2026 09:05:27 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtHZ-00000005lUN-0jQO
	for opensbi@lists.infradead.org;
	Mon, 17 Aug 2026 09:05:26 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso1671457a12.0
        for <opensbi@lists.infradead.org>; Mon, 17 Aug 2026 02:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786957524; x=1787562324; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTv2L/JozCq+V687CwMMNUWOuHkCAATeDxlwL7QaJ0M=;
        b=Mj8q3xfK+Ohve2AJ8fyBLqjVfnS4cHG/abC8rzBq5KjgB3IZNmiju2xP4dqeBSKEj2
         7iCC+i7hqZUoTeq5ShbsZOKTs+lU1RZj3wesqMSDYZ7sMdrieb9FwhOhm6UC6XN5BHEA
         foaT+TjnLVUO1gvioD9HJp2n0Pq5MKqdU53eSTksDqEoGaK45muGQ3DO8i3ym2gid/tV
         vQZMGVcb1mn8mmXomOAejcz7i/mDcjDfSnPzvN8JvA244WaiZvvikfneH5oJwJzYKohu
         j59Ax/idVRnHXP0c/lbwf+y64hOhleX0rUpSn39A5jbBHTSu8b6yI+98RtDxDjNqxQt8
         LJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786957524; x=1787562324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rTv2L/JozCq+V687CwMMNUWOuHkCAATeDxlwL7QaJ0M=;
        b=NAUTzI55YhYaiLbdAPx/c5BZDGstM3b6Th9+mNXaXyDyJ4WLu4IFvE76MXd441BaeN
         tuSSGJx5G+R+bPBioaFyLwTkcuO7O8ygkOvbIfudLUwBwhyAr0MFEH39D7l+4QkZrqkM
         BlZqz4L3bqxPUKPBbduynMyZOv2vSbeGIaH5La3YUnQk19ck8GNtevdbJm9W8yeQ18Tm
         VsUxcxCGj+cCHrsS94qslJhNu0HvkW09Zeyggw1BfsIZAkxgq7CvHOB8ZBZNlwYR64VN
         OVA35LXl1bnL+zn7Q10fJKxAjA+BrVWSik7HMVPc3Siy9GxG6xwHp+sgXdHG4WMFHlhd
         udRw==
X-Gm-Message-State: AOJu0YyLVOHaaJpejt10f8F2gzoANL2HO90Tazdel7f/pEiz8IsDhzwf
	oXAcdy5zCNBHHXDF+FGT7BVrSRYTvj1q+nYnTHIq6W50SgZP1uJFOoAhOET5wAjitCDbVAztgWO
	gxPqSDy/8+sbFHDE5pnDPgIASAW5VrDW+GfrvCX+nXqRFBDOkfffY9FtvvzgTtUsL3IYjfJm8bC
	LO1bCM7SvBeDO2s9oVSMQ3oXxBSLb7mHFNMxHCmC5NgJ+A8AHNUBs=
X-Gm-Gg: AR+sD12Uqr/ODKOSYmkCl+1+83JIp8JkGhbr0vfURWuoibZKOT8iSlHrvmvhAp3Zl6m
	Ax+hDd5pjHlSe3X2G+j0sFhZxUNAbKSTouILMvQTd4Rt7OXv1MO3Enm0JrtVCoE2Oe0Ip0T/0ym
	YjbyGHWwd8qXXwg/a9f8EdmmRxRSmETTOIHd+h03yiFmUsOFxgCmKdAwwuv/uFocDpB5OjoAQK4
	olRnNc1AsAwuijVtMpLXBbjmzPHZYroicxSVkCzB91viU64NkxyfEL7YCqi0Vjcivual4mRoGWt
	sXP5qauagl4UfDyfXE+ZZixgbiZqS5CKiDV1qQVWjERa6AVijFl8pLqtm+0sYf29z5z5K5dhCsH
	gQTazy58k95Bnj0YEXh0iZu+54U1CuC48ZFkZosTtQDsu9gPXT4MDEACe/JMzm+IqY41sWI6EGA
	LKHX/wmijandTQmA65DVuz9U9ribpXo7uUyhGn4/MY71ziu1bNHA3wMNkWk30170cbogcp2Qiyq
	70oq3b8k5Bd
X-Received: by 2002:a05:6a00:3926:b0:84c:2e2d:57b with SMTP id d2e1a72fcca58-84fde76bf46mr21660901b3a.27.1786957523995;
        Mon, 17 Aug 2026 02:05:23 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d223f1bsm2487386b3a.38.2026.08.17.02.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 02:05:23 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	anup@brainfault.org,
	scott@riscstar.com,
	conor@kernel.org,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	pawandeep.oza@oss.qualcomm.com,
	krzk@kernel.org,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v2 2/9] lib: utils: fdt_helper: parse RISC-V Worlds per-hart WID properties
Date: Mon, 17 Aug 2026 17:04:56 +0800
Message-ID: <20260817090503.2104998-3-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260817090503.2104998-1-peter.lin@sifive.com>
References: <20260817090503.2104998-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_020525_225430_69688472 
X-CRM114-Status: GOOD (  14.60  )
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

Add fdt_parse_worlds_all_harts() to parse platform-defined DT
properties in the /cpus/cpu@X:
- riscv,pmwid: M-mode World ID
- riscv,pmwidlist: bitmap of permitted M-mode WIDs
- riscv,pmlwidlist: bitmap of permitted lower-privilege WIDs
Initialize parsed values in sbi_hart_features with has_* presence
flags.

These platform-defined values serve as the root-of-trust constraints
for per-domain WID assignment during domain creation and context
switching.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 include/sbi/sbi_hart.h             |  6 ++
 include/sbi_utils/fdt/fdt_helper.h |  2 +
 lib/utils/fdt/fdt_helper.c         | 92 ++++++++++++++++++++++++++++++
 platform/generic/platform.c        | 13 ++++-
 4 files changed, 112 insertions(+), 1 deletion(-)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 2941809e..4fcf5372 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -135,6 +135,12 @@ struct sbi_hart_features {
 	unsigned int pmp_log2gran;
 	unsigned int mhpm_mask;
 	unsigned int mhpm_bits;
+	u32 pmwid;
+	u64 pmwidlist;
+	u64 pmlwidlist;
+	bool has_pmwid;
+	bool has_pmwidlist;
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
index 747ba028..d6025705 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -457,6 +457,98 @@ int fdt_parse_isa_extensions_all_harts(const void *fdt)
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
+			hfeatures->has_pmwidlist = true;
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
+		if (hfeatures->has_pmwidlist && !hfeatures->pmwidlist) {
+			sbi_printf("%s: hart%u riscv,pmwidlist is empty\n",
+				   __func__, hartid);
+			return SBI_EINVAL;
+		}
+
+#if __riscv_xlen == 32
+		if (hfeatures->has_pmwidlist &&
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
+		if (hfeatures->has_pmwidlist && hfeatures->has_pmwid &&
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
