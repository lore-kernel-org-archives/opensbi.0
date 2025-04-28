Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E16C36005
	for <opensbi@archiver.kernel.org>; Mon, 28 Apr 2025 09:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qGOd7nQYcAo0p+IxSKROs/z2nl9b4ibSQQ1ko2/zHio=; b=sPStXpAEZx3bwm
	bWYSGTP0m/DtsvKN4S5kqNBnjCE94eL4smfBRw52FD4Urge4S1QuNBze7LccMMcA5sP9m0IpGPlEV
	s3cXi24HLJgnGunFPWoPwuOaTfoCxywyPwgD3LpPEOiQXeLPAxPv5YHDk/kZ6cInoSIdozriK1tAs
	9Tu9ZXMBjb39nkgatAsEH7+94HqEm4YQLkw4riFpV8bdOdPQGWVixRHhDxFU3CAzxo78vamJ/nRS3
	6ayhwcwsB8VL7aF3tSY/lDcpaHETn4JL6pL+jDc5Ipnitj1fTJ1Egc4nBNLHgdeMziW7SGqiCDEo/
	HWdh2JHKf18ESnJWwFkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9KyH-00000005gEo-0uI1;
	Mon, 28 Apr 2025 09:40:17 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Kjx-00000005bRT-1rpL
	for opensbi@lists.infradead.org;
	Mon, 28 Apr 2025 09:25:31 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso4409127b3a.0
        for <opensbi@lists.infradead.org>; Mon, 28 Apr 2025 02:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745832328; x=1746437128; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zc85cNrI39o9DIhVVJqZ7r/IXVFaKIMhuG7wjAAwM3U=;
        b=bvccHmX0qBd+pkzNIg+s6XPzV604YXCiPzuSvLDiBBwwbJDqKDAy9zRi9WFJRBXqVW
         n5zm9ERIPVVSlkZupo7u9vLLBybOIU1TPdLPVBRAUz8oOGSFUurpMqAy5BPc0649rsO4
         6iVvTx7NqVg48jSDgzg7lKqJsF4UWHtItkxqw82LWKuKW3E9M0bZFMS2c8VDMz9QWWxN
         e/0YJm6icqyrI0OZ4+yCx/0yemWV1fKsamky5pE+c+pw2OcwZVYDuqK/kol2ya3WR6+j
         S3u5OG/Ign7TaD1waRgr5uRjqI1k118HApRqkjRZOsjnTgOzZLu7yarsENxeOTk1rYb3
         3fDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745832328; x=1746437128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zc85cNrI39o9DIhVVJqZ7r/IXVFaKIMhuG7wjAAwM3U=;
        b=Htbi0YoNCjaWJVI5sguQ6TTw/M2/SNveMAApXCecm3TYYX/m8O3LmQKaHytTdDnG3D
         LKG/PWXU/PLWI6bR99aD0YJxb25mrmgxu/9iDLVW4Dz+WdRPnYtv3FN9FmufyTpKHXxo
         hqbvKe05hevmQMgD0Vcb/Tsac/+FPS8gJA7yq4KqVteO/vireI3PUWGR+obxuOqva5mZ
         jBqyMpzMoTQvbUwE8Jhnys9S2tWwim5TBkKwlyVj+eu4UKSCgm0FwCmbOn7E453hj3/b
         OntUnozwStGIFjXfqIzxvkdBLKJEcKOVtEfUnod0a7dVNyhkGxSMElVofJYF2M6jWTxj
         3Amg==
X-Gm-Message-State: AOJu0YznbrA0sOooqLWCwzroWjSA9v8bnlXAV9h6Oz5k7ZpPCw2jOoa8
	Xja6iuhmlBTzAHarSGlr5wJRBcSbM2Z9YgjRADn4rNbsHxJ1UiBCD4iaoDWTMuNjuyRYJDsVKvl
	IvK+4J+jqeUdELTTD4Xo3aoZKMhHzTY/XvzBAE5Ce+6j7j8BPCWGHYrOlnvUZK1z1V8cCqBs9ca
	EuDK8JlD9+3kFJ/WMETaAiaW/Y/SS1JuczmcFe/ZqHu/Agu8UK
X-Gm-Gg: ASbGncshlSAYbOcz+mLEUkKpl+9KIADSBN+x0Y9hYqdjVXCVOApq1yVjYHAhwzEF6WV
	lYUqrwYu9i1E5ECvLHmogyx/Cz0+JdUPe1IofMC7vXhyJp7Mz1G3YlyYU3vduZkqTp1ODMiAmeT
	RTEkA2p5dMsT5D6pcgtpx92tHlea8+2aT8z6bMKDnWybafaolwqNXM60eDFg7E8tpw9eW/MDwGf
	1DZokvbUlWWCX/hJVZX0e3y02yJmIBXwem37Py+K6Z50YYTzQjLAuJ23DZfu4U+rXaroPWSnzgt
	CaoN4eO0G2by3AByeuI3ZOkcS7zkcs3L12YALLC1cIw2OqhOsxfl4Hs45H6Re1PiQxRLQaKG0Ic
	drqhhUHRVmxij
X-Google-Smtp-Source: AGHT+IGmT2uh4Vw0WIQetR3oaLqDAY7EqGMAe3VmmzDIsbLgRYntmHyRtJZFCxPhvfHRnW9+3R7swA==
X-Received: by 2002:a05:6a00:cc2:b0:725:96f2:9e63 with SMTP id d2e1a72fcca58-73ff73e1d1emr12767294b3a.24.1745832327580;
        Mon, 28 Apr 2025 02:25:27 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25acc600sm7725453b3a.173.2025.04.28.02.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 02:25:27 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	yongxuan.wang@sifive.com
Subject: [PATCH] lib: sbi: Add Smrnmi extension detection
Date: Mon, 28 Apr 2025 17:36:46 +0800
Message-Id: <20250428093646.2352928-1-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_022529_573125_1A4CD619 
X-CRM114-Status: GOOD (  10.81  )
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

The commit adds detection and initialization of the Smrnmi
extension in the SBI hart initialization code.

If the extension is detected,
it sets the NMIE bit in the mnstatus CSR to enable RNMIs out of reset.

Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 include/sbi/riscv_encoding.h | 10 ++++++++++
 include/sbi/sbi_hart.h       |  2 ++
 lib/sbi/sbi_hart.c           |  6 ++++++
 3 files changed, 18 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 2082783..93228ce 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -215,6 +215,10 @@
 
 #endif
 
+#define MNSTATUS_NMIE			(_UL(0x8))
+#define MNSTATUS_MNPV			(_UL(0x80))
+#define MNSTATUS_MNPP			(_UL(0x1800))
+
 #define MHPMEVENT_SSCOF_MASK		_ULL(0xFF00000000000000)
 
 #define ENVCFG_STCE			(_ULL(1) << 63)
@@ -770,6 +774,12 @@
 #define CSR_MSTATEEN3			0x30F
 #define CSR_MSTATEEN3H			0x31F
 
+/* Smrnmi extension registers */
+#define CSR_MNSCRATCH			0x740
+#define CSR_MNEPC			0x741
+#define CSR_MNCAUSE			0x742
+#define CSR_MNSTATUS			0x744
+
 /* Machine-Level High-Half CSRs (AIA) */
 #define CSR_MIDELEGH			0x313
 #define CSR_MIEH			0x314
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index c3a7feb..07cbead 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -79,6 +79,8 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_SMCTR,
 	/** HART has CTR S-mode CSRs */
 	SBI_HART_EXT_SSCTR,
+	/** HART has Smrnmi extension */
+	SBI_HART_EXT_SMRNMI,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index eefb03f..66d5d02 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -65,6 +65,11 @@ static void mstatus_init(struct sbi_scratch *scratch)
 	/* All programmable counters will start running at runtime after S-mode request */
 	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_11)
 		csr_write(CSR_MCOUNTINHIBIT, 0xFFFFFFF8);
+	/* Detect Resumable Non-Maskable Interrupts
+	 * If it exists we must enable it before all traps.
+	 */
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMRNMI))
+		csr_set(CSR_MNSTATUS, MNSTATUS_NMIE);
 
 	/**
 	 * The mhpmeventn[h] CSR should be initialized with interrupt disabled
@@ -695,6 +700,7 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(ssdbltrp, SBI_HART_EXT_SSDBLTRP),
 	__SBI_HART_EXT_DATA(smctr, SBI_HART_EXT_SMCTR),
 	__SBI_HART_EXT_DATA(ssctr, SBI_HART_EXT_SSCTR),
+	__SBI_HART_EXT_DATA(smrnmi, SBI_HART_EXT_SMRNMI),
 };
 
 _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
-- 
2.39.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
