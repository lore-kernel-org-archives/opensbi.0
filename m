Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F450CA0EDC
	for <opensbi@archiver.kernel.org>; Thu, 14 Aug 2025 15:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ERIFmL8/nqdtoRJ37GlfN3WSlTIfSJJy/HubBFOpqec=; b=EfSWIf7thEEAQd
	CjjbAp8CzTCkkCfkpoLiqFUAAgOwLEkTVkAcf1ZDkFMqfldjyS61+FkAIz7p+QlNvn+t3CZpzGu7H
	mUMjU5JwYFotQVSbxeOzU1tqKmGUiupVKESKeGaVthNtE1czvJDoSLL+1Buuo56aD7Xs3zWHZ9YQO
	IvB30NyBrrATWRpdFK7ZaVmb/S5wwr8gYAu4LLriJyPEq/XzQJeKxqa+qzHucAN/cAFG6OtoWYcfh
	gcBBMAhPAKJYjfSwlRrBjoKZ8JLbNvkWxMqFTRXG7ewaEGH3AOZIiPrWhN0DXKk0iMj+CUP+h0fno
	KtJOC/95S1tkWbPpAAlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uma0t-0000000HTbO-39sJ;
	Thu, 14 Aug 2025 15:37:11 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVm1-0000000Gi2z-1aKa
	for opensbi@lists.infradead.org;
	Thu, 14 Aug 2025 11:05:34 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-76e2ea6ccb7so614997b3a.2
        for <opensbi@lists.infradead.org>; Thu, 14 Aug 2025 04:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755169532; x=1755774332; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFqyNCK/uMqaH3hQCJj+H1EslDdtqFzwa/a7ITwbl60=;
        b=Lh/eSVX3VAXF/vApg2QtEtgEmlVvN6BU/KDeSEPr2IGhRMZlMBh5/FW5IZHEFE64KV
         85ok/gzIH5m4oPd6VA2vnYRO1vVLPwSVfHe2vCgil2NRaksE9RpA3HqkZacr3taMuP5s
         kz6xiD1Sl/GqVnquWeW7KJjClhhf5O2iEiFmNkuQkhXbQ5XDB6oL1KlJd9GAJhjRnXK1
         mM+jNYRIqos/H2J/FVr1qkAtakYf2h+/NWlWNqCmwPeuaijbiV+WbjajlURbNsOrXg7M
         plfstDNci5QIVmdUL2+2qsE0AKJhVFnuBvUGM4SoHBbxFdrL9wr1XV0pBt8oTm/Ak5z0
         szaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755169532; x=1755774332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFqyNCK/uMqaH3hQCJj+H1EslDdtqFzwa/a7ITwbl60=;
        b=iJClceiZ7IIdMh6SSozScHz0faxE9snXYJBVsPuetJiF8z21iq4NRiHdpRE6bTQaS1
         GzICd+4SownDstmclEDvxl6lfpYNN5xmxZmPPJ8bmgRE15BOu+S6EMjacNHi5JqUj8Pq
         mPFd338iExmnl5Mvth+orC2CDPyTKAJzGIYxumapkXheV18N3pYlqnLSbSuigoKt2Cak
         QLXcfqRbF8QieBTrYmm/Ximgd2Zd863N2CIqpfb0RyV96w++ZhJDQKobRyRKxA6QI0Pl
         N+kInn/q2FE2oS9lmzh5nhHIrq+O8nrLg7I/z+zUV57MGelNLx1itvcYsCTGLLchix9c
         Z3cg==
X-Gm-Message-State: AOJu0YxCjpfyZMrGAQjyPEiAet+gPOo0ARGDQ9N1s2AmSmsTqQKOPvCY
	NBkIcqaRhXe5tyUNo9xETwMupzPje5OF8r7ih5zWDY1mbtcT+BHELjkYeBDvSWUbzXMsgFeTE5t
	5QOnABXpvYjOTWMmuWarcS/Pfe9YOXhqth4xSFqNPelIIvGDVgoeZVYdL7itg4e7LjS6Eg2h9Sn
	Mp8P45mFjbvkcSRJXnyMyeF+tv0vv3kEI+JLASTfPxGPUtTlPPC2hE5w==
X-Gm-Gg: ASbGncvX8yTtllwl1KNog2dEES47ZhdKjsRDlLNfYgwgmtg8bUkp0mab3EHLSO64kWZ
	9Jt9sD0kSmiRflISLR40FhXxhj22ss5BbHaRF804N/0WTZU9SIrPQ1NYZ7/8gWA00uepf+iksk+
	IfBrGW4IZi4l7EzmUqEVGk5EJW7+5EsR4LSlTHg4/NaxCogADJ2kn/lXUTfGj+wJXtS+66+Mg+6
	OUN66gKd6D8k8I72qMKEu1NkuBzFn4WiA/tL7TkDD4KrddS4vHn52WzqEkeIEOjiHddCwNuyJD3
	bm3PbGXbv6cUbU3/nknDEQCfkmAEfVon+kiQdG0FmCVe0CtLut0V4E457lF6bi7q5D9zm+y3o03
	jaTHq4GFaNEV6NvXCfLC5W9VSWmCbdp8ujLdPGFMkhiZXGQg=
X-Google-Smtp-Source: AGHT+IFBbMxzyfdgH+o0Rygcps/NVZo9dYMPsiJ3iJfa1KTaH7DGCK2TZhO7uqAH+SeasDZppbceCA==
X-Received: by 2002:a05:6a20:5483:b0:240:5f9:6359 with SMTP id adf61e73a8af0-240bd227f5dmr4176933637.34.1755169532301;
        Thu, 14 Aug 2025 04:05:32 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4683722179sm9624755a12.13.2025.08.14.04.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 04:05:32 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	alvinga@andestech.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH 3/8] lib: sbi_domain: print unsupported SmePMP permissions
Date: Thu, 14 Aug 2025 19:05:17 +0800
Message-ID: <20250814110522.18809-4-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250814110522.18809-1-peter.lin@sifive.com>
References: <20250814110522.18809-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_040533_414025_A4ACB8DE 
X-CRM114-Status: UNSURE (   9.03  )
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

The reg->flag is encoded with 6 bits to specify RWX
permissions for M-mode and S-/U-mode. However, only 16
of the possible encodings are valid on SmePMP.

Previously, specifying an unsupported encoding could fail
silently. Add a warning log when an unsupported permission
encoding is detected, improving visibility for debugging.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 lib/sbi/sbi_domain.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index e8adf66f..d6566b12 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -125,6 +125,7 @@ void sbi_domain_memregion_init(unsigned long addr,
 unsigned int sbi_domain_get_smepmp_flags(struct sbi_domain_memregion *reg)
 {
 	unsigned int pmp_flags = 0;
+	unsigned long rstart, rend;
 
 	if ((reg->flags & SBI_DOMAIN_MEMREGION_ACCESS_MASK) == 0) {
 		/*
@@ -186,6 +187,13 @@ unsigned int sbi_domain_get_smepmp_flags(struct sbi_domain_memregion *reg)
 			pmp_flags |= PMP_W;
 		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
 			pmp_flags |= PMP_X;
+	} else {
+		rstart = reg->base;
+		rend = (reg->order < __riscv_xlen) ?
+			rstart + ((1UL << reg->order) - 1) : -1UL;
+		sbi_printf("%s: Unsupported Smepmp permissions "
+			   "on region 0x%" PRILX "-0x%" PRILX "\n",
+			   __func__, rstart, rend);
 	}
 
 	return pmp_flags;
-- 
2.39.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
