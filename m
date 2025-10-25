Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CC7CCF9EA
	for <opensbi@archiver.kernel.org>; Sat, 25 Oct 2025 09:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OnlcSqmqAOuWDzk7CjCoIxG7T3wuCP1Tq6cQ2nZhCZ4=; b=QXy7AOIIIXR5d4
	2oZWgBmn4CYGXi6+t0v8mPo/yLUYPLLnD3djkjG1/QjEZ0GQYqYVGMD2OU6/nbxbe0EcWHIyUYmyU
	yDAYdOXSEzU9P7jN0vVddBgP3ddC0TvZT6cVFtHhrt/ChuILSlzjCN+Hc0GrHjJb7Tndj47rkQhyI
	QlqU1UrEL+LVhlblJVBRHib5k0nQ5rIGkhFLGSV0r2zU/Rk9duL/jfmu+1+4dT/rRZji2ew7BNUo9
	9Rs6hZSQ6EOHy2s5g3RcRLi/WO38IZyDpPxJE/UYKSgQsIGWRcpGty5DpWikWabsEM7phUMrP2K1a
	inXrDV59+HkqaJVb8YIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCaPx-0000000B9kw-2UvX;
	Sat, 25 Oct 2025 09:18:33 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCaPv-0000000B9k8-2kl5
	for opensbi@lists.infradead.org;
	Sat, 25 Oct 2025 09:18:32 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7a26ea3bf76so3954886b3a.2
        for <opensbi@lists.infradead.org>; Sat, 25 Oct 2025 02:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1761383911; x=1761988711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5bSfItpM3CZYTkvsCuDucamYBK7LGobfVnqrkLfvqE=;
        b=j2UpBCpKpU/BxL4rUFcEEdQhPAmN7f9tU+OopA1Cb0YXAz6MzfkCZW0OV8RQ303ppO
         ZjdRkdONcmXK6mIBaFooZSbta20YvhhOCeg0ySS7EberzxV1mL57DLPtZNfJuDueqwkT
         HE6VG6tJX+ibIGIp6J3LVVyjZaG6vL9oYG5wKFm0KgHe3eDxb2qXU4xlWWbjroMWI7cc
         MH+hEE+KYGwSZsjVZe8I8DXCgUl+ISsEca5W3W+QWB1OtUj28CZGOb3BdAWP1olxDPtZ
         akhQUfTOiN1MzMEA0CsLK1H2+kDOMQSpY1WszmWXLgnJLadA6BwFiQtk00g8RtX8mdXX
         q98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761383911; x=1761988711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5bSfItpM3CZYTkvsCuDucamYBK7LGobfVnqrkLfvqE=;
        b=CgmoeO1KlqFQcx4fH3Xuo+zn8vhRcMof3vkspD/fyvW3QG6OfEVHLcaCnzVNSAaflt
         vtd8vblIVm6uBAErlYtP3fMLEuMVeTvB5Db/9OTSXY4aZzl1O+IeAyDSK+Po7JOmRyk/
         NNrq/6W771CzOS5IL3ByvVsDAgPLsCqTA4F68plH/T5f08YooHyBznRPhou2cxFjX1JX
         aNekzqi/qeOxheSRK0ateXSLz34B8m/Pki2fFsDJLIBdF7NuPwocyaWWI0QrtUY3NfYp
         tY2zK2JqbXGZiaa7lez0rkR7ONSvObknToYrG4V6DIAZ3iZECMOS8A84YhgsPGsBabYE
         eAuw==
X-Gm-Message-State: AOJu0YwEe+IeDStrTx1j6wAoQpK91OPugzkZsl+RpKyD8+eudSwXemHj
	+zwMVpuF47iCW74sl3ZUVB0bpKAitlkiHhaKXoY7yVC4WqeW6gP/2ixtcnFBnt5JGVD19dkEya8
	WA50upCP+dJnzCgYggXRGkia0+VXH57NR99HDocHYcVZBvmHnmOTz+aRuTi/9aP+XhEKrww1gbD
	8Q9nDRNqrHis7PCkLxfOjbBpQbxHWXz4iCCVIHLPpGekmKee4h
X-Gm-Gg: ASbGnctZIGbEISSXNE5HefHqFaT3vlfy29FyqNG59UncuhFEqo+SgPsUfIAYcBATQ0/
	f40Ob+5KnqtxwE8Lz5CBtWVG/oFA+lWASouuuxlMi8CXrt9x+6QuGKiqBmZL2Hihb5iwBgxAzu0
	JpbJKH8IUrArhXV8fc1wwYmVXEAhedHX8/bw4PyRAP1I0K0AYt2Ni/70927s03ANhTvHMzTrF71
	5DX/m52A30VxND9mw76mgG7JhIIY/d9tmuVUw4SW6LDvMc34+wbMvNHdnRQRja7J4ATAXWmkutv
	9FTrqU+9CXWMrdJos55ZZhKUysRNbAt+PqQX9ICDJIs1XoIHn6ObsI1oiwLbp2NxeagOCaT7jcK
	cECAEz2MVRtgX7LFoYEWFESHaHhsIagnXj97v58PtbzA7tFjeT8W6XL6KMsg9KXHSq/2bgby88n
	ULUuPXVkAIbrJkKfaC2wyfVfNHxDZI7Q9NZpU=
X-Google-Smtp-Source: AGHT+IH3mIwJpvTTdWi8pGng9Kibe3MQhQFSyFNJa+iqwTQqvakJGGwiGWTdqxwCiz/XTzO1f3NQDw==
X-Received: by 2002:a05:6a00:189f:b0:771:fdd9:efa0 with SMTP id d2e1a72fcca58-7a286804076mr6716000b3a.15.1761383910557;
        Sat, 25 Oct 2025 02:18:30 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414049f20sm1702700b3a.29.2025.10.25.02.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 02:18:30 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	samuel.holland@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH v2 1/7] lib: utils: fdt_helper: add fdt_has_isa_extension() helper
Date: Sat, 25 Oct 2025 17:18:05 +0800
Message-ID: <20251025091811.506511-2-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251025091811.506511-1-peter.lin@sifive.com>
References: <20251025091811.506511-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_021831_695513_AAC84F7B 
X-CRM114-Status: GOOD (  12.35  )
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

Add fdt_has_isa_extension() helper to search ISA string of
current hart. This helper is only used before hfeature in
per-hart scratch is initialized.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 include/sbi_utils/fdt/fdt_helper.h |  2 +
 lib/utils/fdt/fdt_helper.c         | 62 ++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 04c850cc..35b5d2ec 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -57,6 +57,8 @@ int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq);
 int fdt_parse_isa_extensions(const void *fdt, unsigned int hartid,
 			     unsigned long *extensions);
 
+bool fdt_has_isa_extension(const void *fdt, const char *extension);
+
 int fdt_parse_gaisler_uart_node(const void *fdt, int nodeoffset,
 				struct platform_uart_data *uart);
 
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 799fd48d..8f5d02c1 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -488,6 +488,68 @@ int fdt_parse_isa_extensions(const void *fdt, unsigned int hartid,
 	return 0;
 }
 
+bool fdt_has_isa_extension(const void *fdt, const char *extension)
+{
+	const struct sbi_hart_ext_data *ext_data = NULL;
+	DECLARE_BITMAP(hart_exts, SBI_HART_EXT_MAX);
+	u32 current_hart = current_hartid();
+	int cpus_offset, cpu_offset, len;
+	const char *isa_str;
+	const fdt32_t *reg;
+	int err, i;
+
+	if (!fdt || !extension)
+		return false;
+
+	for (i = 0; i < SBI_HART_EXT_MAX; i++) {
+		if (!sbi_strncmp(sbi_hart_ext[i].name, extension,
+	                         sbi_strlen(extension))) {
+			ext_data = &sbi_hart_ext[i];
+			break;
+		}
+	}
+
+	if (!ext_data) {
+		sbi_printf("%s: extension %s not found in sbi_hart_ext[]\n",
+			   __func__, extension);
+		return false;
+	}
+
+	cpus_offset = fdt_path_offset(fdt, "/cpus");
+	if (cpus_offset < 0)
+		return false;
+
+	fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {
+		if (!fdt_node_is_enabled(fdt, cpu_offset))
+			continue;
+
+		reg = fdt_getprop(fdt, cpu_offset, "reg", &len);
+		if (!reg || len < sizeof(fdt32_t))
+			continue;
+
+		if (fdt32_to_cpu(*reg) != current_hart)
+			continue;
+
+		isa_str = fdt_getprop(fdt, cpu_offset, "riscv,isa-extensions", &len);
+		if (isa_str && len > 0) {
+			fdt_parse_isa_extensions_one_hart(isa_str, hart_exts, len);
+			return bitmap_test(hart_exts, ext_data->id);
+		}
+
+		isa_str = fdt_getprop(fdt, cpu_offset, "riscv,isa", &len);
+		if (!isa_str || len <= 0)
+			return false;
+
+		err = fdt_parse_isa_one_hart(isa_str, hart_exts);
+		if (err)
+			return false;
+
+		return bitmap_test(hart_exts, ext_data->id);
+	}
+
+	return false;
+}
+
 static int fdt_parse_uart_node_common(const void *fdt, int nodeoffset,
 				      struct platform_uart_data *uart,
 				      unsigned long default_freq,
-- 
2.39.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
