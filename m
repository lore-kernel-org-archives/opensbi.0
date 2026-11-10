Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64FB606BF19
	for <opensbi@archiver.kernel.org>; Tue, 10 Nov 2026 09:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xULCnQQA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=cPV2Z6oh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/YF/X2SGXYoeH018pVjKO7KI8Im333laeDbp2s/METI=; b=xULCnQQA7ysZJz+XGjqk3QJ+dB
	NOWkzQ2lvgk98SjPE0NvRzb8MJXSrA7pGjrXvNq/nj2QDXcGuJVR2sK8yo5MTMBcx5qqci1KRImPJ
	x8Q1ZJrF7u5zBPSPWCt3kA29/cDmhQZM3ksYGPSt3BbfHILbthVRCiKakfbzm5T1ZR1fFrm8jMiQi
	egpiy/m87VS/sdQYR2rgpK8iRo8Jzv/HLmgHTFirWrE+5Xz1EM+qhE8qoS02sFNluJ+K/W/o8YuAD
	kZkJ9aqcDpwEy1YelF/JBL71BdkKIdzHwEnaEpF1qiBXBdRCNfmcL6Gm2IhaqoViQzXOZkUF10hth
	/4pwR34g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiV2-00000003LNt-0KNl;
	Tue, 10 Nov 2026 09:50:44 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiUz-00000003LML-2v4C
	for opensbi@lists.infradead.org;
	Tue, 10 Nov 2026 09:50:42 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8b66d1a08ccso1660347b3a.1
        for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 01:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794304241; x=1794909041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VDcxfYXC3S396U+WwNLeBki8xvOGUZ8dqFfaQCd3QhI=;
        b=cPV2Z6ohEw2eLoAOLf/8MwGkmDwxtB7sjo0Gimc74iP+QLvDc+hyNHWO9yNZRnWuTU
         SJ/NZe3ubdWpHwjvDfijsBYw0/aYUPy3MP2kT8LsQ463koLTwaAmhO+p4r3rqpRaoHz/
         nIsQ5g01Bzy27KE4fmvw8jaIoXpZSfXC7Ds9P8P+Js6LNKfGTEVn9zByd73N74vvBMHT
         g7soQK+eLz4JRlWPHF3zP6BvlqbvwhBCZExfZaywLNC6swpV4rQSOxTwXaO9EN9+1uTn
         YBsvhjBf+x3fF9JXvv5uUmysSBLT94IbYfh5XRUillUKMDmDu/VeTt3SZWr+1WLNVhG9
         rlGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304241; x=1794909041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VDcxfYXC3S396U+WwNLeBki8xvOGUZ8dqFfaQCd3QhI=;
        b=tIEbTfFRvqX74XMRUc+9rHQHQo2PzDBRHtlmAxM35uhqiX3yvqNkKmzloIF4DWMfQR
         D25Z/ohHGZjbXx/HJmO6wEKDaNLT1A6jCIE+teI9g8XtMtaChCjliI9RIDfw7v7b9pns
         285tldraXbVN7z3wavfCf1Z9LmE8lihlcwGyVaP9E6ag+2BCRHRwXWfzhM4eDGUdoI8d
         N8F3xL0Wndb4N7mwQHjYBzCOM2urjTTCJ+/xG9lMx4e1la9zZ91WQjaln+ohOnmj9YnU
         cNwfgtd4Z6XfWsKJl3d0sgiLDIzAwmtCLBI78xExo6jRmTevqgziE/xKjHTeV4/tzbKV
         fsMg==
X-Gm-Message-State: APuU4Z9gYtoTsIBTpH67jRQZmjtARxX1pkp3ALP76KQ0au1JrzmYt0o/
	Em6Um44trKf2hvkRQsECTXDz3fI+ti1ro8jdOQtOFtZgdlfBOLdG/xQo6K9T4+FCCwHKjUPG8a8
	bM50g7tivf7hEiRd4aMAuN6+YSAyh8FboTZycERX+3KI72gvJyrVPEHyqVZHh/DLra4q85LedAC
	6HQ0woMxFfswhYwy3t+XojxLf5Vu6gH1q347mKsh/+Hb6wmTQs1kE=
X-Gm-Gg: AYBFou16BB3vLWw3iyPckEbs8+1Kg5o03JM9TY91XDYbv2J7tpIowrwNAq1n4XxcMZA
	+vBC6hkn0KFOX1C9Y19Z8fzsc87WNQ2a477rAO4K72WthWVLx41cPX0wknl1cht0qXICnzGUFgj
	Wp+Znhblf9tIL3TtjM7ZC33pqrfGYJIgyuG7/e7iJ9OC6boGw9+vd/X89M6KxU7bgGoEnmSCoxU
	iOmmirdWEFAvFeYlnCphxY2Xpju4ruRJt3Yovzb9b5jH5+HHIPWq1ZX9USiEiIX9jNfKhhLfKVw
	Qc9E05aWb0HqQKaoj6BgefEPYmXR1g76tOtR+HzVi1XyOzg5nilYIqKIampX2QY2TVjibQypo3o
	8mV7TB2S+Pqr5VeKudg5amUFysFH4sEXzvcfWmhrx2sO22B1Rcm+99VxyiBBrsVnauGin5qoovQ
	D0Dgt8lbBKXSfqVoMGC3IuCkyST/nJJY1EWN+veHSvnM0PKrvufgEiE585hzE6OqbFh+XRldhro
	wJNcG1i4iRbkwkHNG2HmOtRfm0octlh8R+hK3kPqZEqUnkdLDoBvNmy6IAGxZeqsLcpi+/2kHJm
	z+ywCNut8S55vRstM93yjq97Bbs=
X-Received: by 2002:a05:6a00:b48:b0:8b5:a10a:a3e7 with SMTP id d2e1a72fcca58-8ba8773db51mr2263466b3a.49.1794304240484;
        Tue, 10 Nov 2026 01:50:40 -0800 (PST)
Received: from localhost ([136.226.240.177])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaac46b20sm680051b3a.30.2026.11.10.01.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:50:40 -0800 (PST)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org,
	anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com,
	rkrcmar@qti.qualcomm.com
Cc: raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v5 2/9] lib: utils: fdt_helper: parse RISC-V Worlds per-hart WID properties
Date: Tue, 10 Nov 2026 17:50:22 +0800
Message-Id: <20261110095029.117504-3-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110095029.117504-1-peter.lin@sifive.com>
References: <20261110095029.117504-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_015041_742642_93A01927 
X-CRM114-Status: GOOD (  13.14  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Extend fdt_parse_isa_extensions_all_harts() to also parse the
platform-defined RISC-V Worlds DT properties in /cpus/cpu@X:
- riscv,pmwid: M-mode World ID
- riscv,pmwidlist: bitmap of permitted M-mode WIDs
- riscv,pmlwidlist: bitmap of permitted lower-privilege WIDs
and store the parsed values in struct sbi_hart_features.

These platform-defined values serve as the root-of-trust constraints
for per-domain WID assignment during domain creation and context
switching.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
Changes v4->v5:
- No change
---
 include/sbi/sbi_hart.h     |  5 +++
 lib/utils/fdt/fdt_helper.c | 69 ++++++++++++++++++++++++++++++++++----
 2 files changed, 67 insertions(+), 7 deletions(-)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index ed344783..629e3f64 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -138,6 +138,11 @@ struct sbi_hart_features {
 	unsigned int mhpm_mask;
 	unsigned int mhpm_bits;
 	unsigned long expected_trap;
+	u32 pmwid;
+	u64 pmwidlist;
+	u64 pmlwidlist;
+	bool has_pmwid;
+	bool has_pmlwidlist;
 };
 
 extern unsigned long hart_features_offset;
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 747ba028..fdd25648 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -442,16 +442,71 @@ int fdt_parse_isa_extensions_all_harts(const void *fdt)
 		if (val && len > 0) {
 			fdt_parse_isa_extensions_one_hart((const char *)val,
 							  hfeatures->extensions, len);
-			continue;
+		} else {
+			val = fdt_getprop(fdt, cpu_offset, "riscv,isa", &len);
+			if (!val || len <= 0)
+				return SBI_ENOENT;
+
+			err = fdt_parse_isa_one_hart((const char *)val,
+						     hfeatures->extensions);
+			if (err)
+				return err;
 		}
 
-		val = fdt_getprop(fdt, cpu_offset, "riscv,isa", &len);
-		if (!val || len <= 0)
-			return SBI_ENOENT;
+		val = fdt_getprop(fdt, cpu_offset, "riscv,pmwid", &len);
+		if (val && len == sizeof(fdt32_t)) {
+			hfeatures->pmwid = fdt32_to_cpu(*val);
+			hfeatures->has_pmwid = true;
+		}
 
-		err = fdt_parse_isa_one_hart((const char *)val, hfeatures->extensions);
-		if (err)
-			return err;
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
 	}
 
 	return 0;
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
