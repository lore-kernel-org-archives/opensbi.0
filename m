Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D02CCCA470
	for <opensbi@archiver.kernel.org>; Wed,  8 Oct 2025 08:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TF00Z/h+j995w52IW9DaQpnvgjRq2EqM7tLW7HX4u60=; b=Y/8OVkXkWjJ2PQ
	EZVpdgL/V+bSXAGrbK2XvJ52MMK3IZ8eIjaSkIiKGO9V0CetD6rl8aV8lsDC5lq8j5ZZkKXwta5NR
	upamk2XtLiLakqs91nDvxzHX1jVh4WGHPceMUsWrSQz3sU0ZpFoXTG36rquEFhuY8+1kM2HOLk74o
	jSAGIqtUapGdJbMwVoFpPIL6y0Vvik47DzdtTrNK6PF81pFRGWbJmJ97IRrfgLfTSDfluIZ7ji8nP
	xnCX2i4/0+nqrkm/sxQ6zUqQCxSI193qMVMXgBerLiv8a0gCkwCHF1XpoZWj3skZkwHDkv88c7ISS
	1MqTbkupvT3EJ0DXwYtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PnA-00000003USm-1dHx;
	Wed, 08 Oct 2025 08:45:00 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Pn7-00000003UQr-2SFw
	for opensbi@lists.infradead.org;
	Wed, 08 Oct 2025 08:44:58 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-27c369f8986so70021545ad.3
        for <opensbi@lists.infradead.org>; Wed, 08 Oct 2025 01:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1759913097; x=1760517897; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fKh1Atc+T4C5/c9pHqI3Q2yLSkznXDUPDVc25pUi0HY=;
        b=fQcNuDdHVQr0W2OXJASNelAAiZbANJNP9jhftA87KSomUsS8lWTuHHbH4fizP2pF/1
         l9mT6MM5W1cw9xJbgzNwk2ZQZX4wXLKB7U+uE6pjWGYupz47y9DWlVv1TBCMHDU+w2BW
         6X9UJ2A6do13H/nQvKUa7vJyrG8atC7kIjwb3juIEe3ziAfOtJQNw8tFNip7yOQkjzt9
         p2uNxfdqen5gzZ18Oxo+vRRiGHh1WAscZzhGQ0N98L69jRg9lEzNC24tmmG+sI719OGw
         ZSqFDTJUnOyKmqXILAXWF0CFsndtspkePS8+s+R+S53btxtzMzrJGIBiSnMd/zgcYmmW
         6ruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759913097; x=1760517897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fKh1Atc+T4C5/c9pHqI3Q2yLSkznXDUPDVc25pUi0HY=;
        b=XfGebp5RbCjASqG/6imldLEFpKgmPUypCUQq/hrhbWUNu/R/CbweEy6Ol8c5y/QWqP
         Yz2L4SYlNkDl2Z2dD9cXW8mWZy/TSIXhLwqEVyrwjH9IAz2GRKxnVrl8qHjvrb1oCR4o
         +wa9FvuuCIZjBx+Uog61LRw+9b7qQz/0DleBeEJamz6L8Yxb1sOZFIjnuSpuTDfegS5+
         gR/6WfRreiozuZ/mNnuJbRWQpgdpDD4BJ0UcNAOqW6+MeCRWSFTswXwjdNgmMM3LpzVN
         I9Gfv7ZPfEdkttuFfn92eEM/UFAKdVSZct674cBuU8Co2PilwPhWpUR1LCrbBmbX6bxV
         9DeA==
X-Gm-Message-State: AOJu0Yx/QCDtcrZAtGaWyrOVutzbcLcinhBZyhRWtTXnaQPbRdMQY49W
	nuo7e/zdxjuQ/vCXr0VAz5rydDZZ9TGIvkN5nkarbewQtNn55Nxb325gW9a/Q2SKEfs0iCYgjEQ
	EOLFdRfoFTuE0Jpj7iyP6D26lXQDLh90aKEeCZ98GFeg9cxwSZIWZfTd7whTJ4waAuHxBZPbUYz
	BLHMGxUAsL9VSi7LST1V5OqgodW1klSi8vR8XhCzP8kuHg5XDCwxA=
X-Gm-Gg: ASbGncsKNRxYbIenhXTz5zIuyoBshPuijJfWwze3u7B8ZvT9mxDh10BsoP/dhI1NZYd
	ucXhIPZJsyiIrJkRBtf5s6NzheKPJA/fsUpuTYd1bb0aQgFor9hHmpMbYc66qMYT4oa3haae+9g
	PpNfwUls+6U5zddPstAfqw1AWfS03N2qtvju7v7QCMSuR7YcYMVc4aZh3AM5RxEB/cnqI+DdpBq
	qmiAre/2pSyMVtFexKZB/PXs3Fsprw5WVf+NttZPW2OalDHXOQ2R6Hq8Tw9WC9tPPdoO03I2Z+2
	HUVps5EHcEseux0LDxKte3iPLzzkW3wTQi/uwL/FJGPfpeqC0Bz0ug5OIjPRTjSMBiz92x8tt+u
	F9sXURpx5Q6Sms5m5NdnvkrUNdjBJgNNeNWr+n420xVFOQko1ZlzagIfZqJlFmNf9yAkYaX8/Q2
	Zz8A+d5vXq9opK/bff9IVMEPXcNOV92yUct5+jqreA6bnEbetoPYlwKnV+
X-Google-Smtp-Source: AGHT+IGD8DCB/ThRUejau/T7jSeDwpYxVdp0N2gICaFK46kQw/0IyiXZIj4aPh5fk3bP7Y8T4cuGPw==
X-Received: by 2002:a17:903:3807:b0:269:4741:6d33 with SMTP id d9443c01a7336-2902737a672mr35425315ad.23.1759913096084;
        Wed, 08 Oct 2025 01:44:56 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28ecaefd60fsm51327255ad.93.2025.10.08.01.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 01:44:55 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	wxjstz@126.com,
	alvinga@andestech.com,
	anup@brainfault.org,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v2 3/8] lib: sbi_domain: print unsupported SmePMP permissions
Date: Wed,  8 Oct 2025 16:44:39 +0800
Message-ID: <20251008084444.3525615-4-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251008084444.3525615-1-peter.lin@sifive.com>
References: <20251008084444.3525615-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_014457_628893_342B6865 
X-CRM114-Status: UNSURE (   9.64  )
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
permissions for M-mode and S-/U-mode. However, only
16 of the possible encodings are valid on SmePMP.

Add a warning message when an unsupported permission
encoding is detected.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 lib/sbi/sbi_domain.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 89250d4c..798e68b3 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -125,6 +125,7 @@ void sbi_domain_memregion_init(unsigned long addr,
 unsigned int sbi_domain_get_smepmp_flags(struct sbi_domain_memregion *reg)
 {
 	unsigned int pmp_flags = 0;
+	unsigned long rstart, rend;
 
 	if ((reg->flags & SBI_DOMAIN_MEMREGION_ACCESS_MASK) == 0) {
 		/*
@@ -185,6 +186,13 @@ unsigned int sbi_domain_get_smepmp_flags(struct sbi_domain_memregion *reg)
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
2.48.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
