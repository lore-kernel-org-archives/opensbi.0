Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E9ED358DB
	for <opensbi@archiver.kernel.org>; Thu, 29 Jan 2026 08:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PBASkCg/aw6GKOhujwsOWG/Wqoa7ISulZqx2fVoFsUY=; b=rGo8enKpMQoGxu
	p/roZGcf4p3XGVfSRh2fcrc+Wsg6363iifd0nX4f8yWwtIwXuLsNVx5CXI90Kl6DtII7E3F0McK8q
	viKfBedGC2pT2H//DZ+on4ufkwDl8Za3sBIoNwRXC0YpEVcla3brsKyeF5a7zlZPxjDRWtbmqtYfM
	93idgCAl+A5RIQ77TR4lbkCSEuuNkm0nXECqP5rSrhnW6N2taM0ISeCOnDyZi2ATQmnRrR+EydN9V
	bm/jezBGZSKhx58shkLZ7jBUEARKmm5mtqbuvomsmB8upDxrwQGAnFjc8YWqL1ntD/s9mvmgJwIVa
	SHIyj5GlcfEWRSQ62iaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNA7-0000000HQp7-1G8D;
	Thu, 29 Jan 2026 08:13:59 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNA4-0000000HQnr-1k5u
	for opensbi@lists.infradead.org;
	Thu, 29 Jan 2026 08:13:57 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-2b70abe3417so1773726eec.0
        for <opensbi@lists.infradead.org>; Thu, 29 Jan 2026 00:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1769674435; x=1770279235; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7n62z8XOKeeinQ2YHGzsytwvNjLrw/taCsCJl9rFrrI=;
        b=eQn09Kr/IMzgZh+66QdAM/RLH1oj7PSPcaf0IORAMUmu1lyoboigLgy9ubDPSYblmI
         b4cU6CX05NZGRt3jrLLUPvHSYfwOWrY77KmIhFymWqs/qib1u/QDjybf7lOd5oQwXEar
         +a6dpihMGGYMqehRbLkdc69/ASb4fSpl9nWK1q4S4AIoQM/F3/fyVmhEK+mLMJ5UR/U6
         CsuXPVQM7q5mbMA+Y1wMjD+leWx8ZQ7KC6edxCufgj6/Zal/+u1hs6W1UQiHZPlZZ1p2
         EEseesrzYxLmrjl3qFqKgXTS+h2RuGtCu576+DwWwFr6kQh8xCqx7L/ZQ836B6EHXl22
         zz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769674435; x=1770279235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7n62z8XOKeeinQ2YHGzsytwvNjLrw/taCsCJl9rFrrI=;
        b=Q/ye39v09YlFm9YoZ9Ugb48JwDEekhq+bW7g8baJfuVa+9q8Qgf1JNnqpehaGnSxgv
         3aJGY0iAG/pmaDW0Ef3b+XwE3WMrh2izSyLCNp5R/KvrTl0W3JMhV9zMM3ss9KUYy70q
         gflt+J7xdP4KmmagCdAxx/wEAlGDL3C6+68SP04guvC5WqpX3rqZm2ds4wMCnJtGV6JL
         oGHCX4XNEyNbiahuCZ1ZDLra0s4vk+4hgjZNIvSa/B4Xk56Wmqy5rQ5n4VeeNMmaoFPq
         DZAJeSvbfTOk02ciH2sTFfULTVRpCveu76glYaRSin/+dDZ6gu/Sna62jXSvskLuCVm8
         heqQ==
X-Gm-Message-State: AOJu0Yz7PbodbZlq8PlSYIjzxKSohkEU9pghqBUQi5EZwmTukJ6+TpZG
	rll4+HnDUVi1uJMaEIPnPCBA3uK6kHGN1OEppdbd3X4O+Pr1Gr0XkvET6wd79VGAsYZbDgEr7Tf
	xMQM1jHW2kE+X4t6QE14LL+bXgB9o6icRcR/pqL+vtOQayCqHpvgGYJtq1FVEcP1dHsGspuO4+B
	Ts5BhDsm7Ij7qKHADwudScUS/G8YIrr/p4CQ2MdNOplmoFNmk3Gg==
X-Gm-Gg: AZuq6aKFT0gmVqhFe3ACowYZSqhbrNdqm9FcmNvduS+fuNwEQc/5tGE48PZkb/vG9cl
	XV9XB2Y1QxUukPp7Uap0lMc1B9lmClhF6ANZXuv2e2j9EbZycKWf0MNrWI6rxqHV2xZWrxz5sMO
	1MGo/iUtYEV+9wi0oTPvgfkmE6iaKDd4vnxc1SpbuBkMUs9ZMirbQiTjOgarx78UhGTpmhujfAv
	8h98QNibK6S9ItQbcSRUzcdamV+FucviRBWP9T8tdCCh7wpFYp5/G2ILqsRDiTEHEzBo59KJWdT
	aDINVmQats2vP2CD6EgWK9DIYagfJdBu7l6O57FX6PsWsr7tT3jbsefIVCTKta5B60b8aszkL1X
	mfJSKXGz20bDGkx5am96nZpABJ3igHvrrdUkl4GNp66XKgPQ/PVv3WzLx5kkoVLytqpRwq8owCF
	KF5YAoZtc44In+0KJB04U1ZPSznlc=
X-Received: by 2002:a05:7300:50c:b0:2ae:51ae:5cfd with SMTP id 5a478bee46e88-2b78d9b50femr4803733eec.22.1769674435043;
        Thu, 29 Jan 2026 00:13:55 -0800 (PST)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1add664sm6042480eec.26.2026.01.29.00.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 00:13:54 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
Date: Thu, 29 Jan 2026 00:13:41 -0800
Subject: [PATCH 1/3] lib: sbi: Add Smrnmi extension detection
MIME-Version: 1.0
Message-Id: <20260129-smrnmi-v3-v1-1-5d297d3e2027@sifive.com>
References: <20260129-smrnmi-v3-v1-0-5d297d3e2027@sifive.com>
In-Reply-To: <20260129-smrnmi-v3-v1-0-5d297d3e2027@sifive.com>
To: opensbi@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>, Nick Hu <nick.hu@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Nylon Chen <nylon.chen@sifive.com>, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_001356_462137_C647C5A8 
X-CRM114-Status: UNSURE (   9.28  )
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

Add detection support for the RISC-V Smrnmi (Resumable Non-Maskable
Interrupts) extension.

Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Suggested-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 include/sbi/riscv_encoding.h | 11 +++++++++++
 include/sbi/sbi_hart.h       |  2 ++
 lib/sbi/sbi_hart.c           |  1 +
 3 files changed, 14 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index b5a4ce81..eb556380 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -215,6 +215,11 @@
 
 #endif
 
+/* Smrnmi extension status bits */
+#define MNSTATUS_NMIE			(_UL(0x8))
+#define MNSTATUS_MNPV			(_UL(0x80))
+#define MNSTATUS_MNPP			(_UL(0x1800))
+
 #define MHPMEVENT_SSCOF_MASK		_ULL(0xFF00000000000000)
 
 #define ENVCFG_STCE			(_ULL(1) << 63)
@@ -780,6 +785,12 @@
 #define CSR_MVIPH			0x319
 #define CSR_MIPH			0x354
 
+/* Smrnmi extension registers */
+#define CSR_MNSCRATCH			0x740
+#define CSR_MNEPC			0x741
+#define CSR_MNCAUSE			0x742
+#define CSR_MNSTATUS			0x744
+
 /* Vector extension registers */
 #define CSR_VSTART			0x8
 #define CSR_VL				0xc20
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index a788b34c..7d038a18 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -87,6 +87,8 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_XSIFIVE_CFLUSH_D_L1,
 	/** Hart has Xsfcease extension */
 	SBI_HART_EXT_XSIFIVE_CEASE,
+	/** HART has Smrnmi extension **/
+	SBI_HART_EXT_SMRNMI,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 60e95bca..495ad1d8 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -396,6 +396,7 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(ssstateen, SBI_HART_EXT_SSSTATEEN),
 	__SBI_HART_EXT_DATA(xsfcflushdlone, SBI_HART_EXT_XSIFIVE_CFLUSH_D_L1),
 	__SBI_HART_EXT_DATA(xsfcease, SBI_HART_EXT_XSIFIVE_CEASE),
+	__SBI_HART_EXT_DATA(smrnmi, SBI_HART_EXT_SMRNMI),
 };
 
 _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
