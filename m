Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395C5CA0EDC
	for <opensbi@archiver.kernel.org>; Thu, 14 Aug 2025 14:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IM0yPR7zkdJPu4NTNnXAkHxHUNg80ZeCCiIuwzRISIE=; b=K7mkkDFFDED6eg
	MMHuMa7ubg+SxvPJRAPZOhWpui1B0AHGAPGYebC8uq5j8PR2r+7Z0jIBPxRA9s3d3WkYgCORWVg+n
	IwggHJs5b1FoC+UaD8xd5bqyGiUlBuHiWiNBcOG770gXclfJGia8aY/4BlleYiGSNTT/0UWjgvHAh
	HvGvrMYr4+g/K6uupo5shIqqTWLOhIf0HXOIlfNM19D5j0ZWpI747OpD1eFy/og4UylpQ1b9Lttuf
	q9dj6ZSSb52GHcBJGD0sBqYZOTw+WuPoxGzzXgGAN92jVTjp0A957HehzH1Mb+fTWZMQZrBwljAmM
	AbstCwDdv3xK2fBlyrnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYl8-0000000HDAR-308m;
	Thu, 14 Aug 2025 14:16:50 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVlx-0000000Gi1p-0T8h
	for opensbi@lists.infradead.org;
	Thu, 14 Aug 2025 11:05:30 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-76e2e88c6a6so772194b3a.1
        for <opensbi@lists.infradead.org>; Thu, 14 Aug 2025 04:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755169528; x=1755774328; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bpMLeQLdalg4DQtMObg+Bjg1WZBeZnRDWCyt6V5p6NY=;
        b=nUyXBP10ay8vR5YL46aVK7AZExSEz0DRCW7pFPjLz0nw1X12ySofIfbojfqTCfpPv1
         FzbsQOLMEHMX9YmSyLIwLbdR1bUg/5akCHkfLtWwKC3xVm81oCmHv3D6szCd0/U2+KwI
         eit5Aa++im5Wn6i6vV1ck/bpbGAWRFfxkM0ONkNGV+BIOdFRPm7tE0W/goalXmMvGxcG
         3AP3LtmUPrsoBtBW+ns2Wt6purEOG5YDzgFzH0aDcBr2p0XKqSs9Lp3g9KB3h19THPW0
         8AEVrqgvZdCBCXVf0rbtLZg56X8lbmFtveUB6y0DdGUEZqe4dGID94BVhngPbE5bMeVR
         ftFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755169528; x=1755774328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bpMLeQLdalg4DQtMObg+Bjg1WZBeZnRDWCyt6V5p6NY=;
        b=SkGnfd5y5EEHKcx7vZNKL8YuBTlhRmMOBJu8dUOgqlr4rU1LC+x5Be1dvAPHf5qlWz
         VsK2hLUHD60DE1HNz65ilqqxohEmLbEW7iOS3XIjGT+igSLxtDt0k/OWH/t3Mi1SbQ7R
         A55INCb4ZHvNjZBNEd/FNbfoRI21XrRrp21j9TzJlJcOeMZcBztsingcoK6owHbcjalt
         1l7OKLHMx99uN1PBPU3qxayS00qlnbH7FMob1k/a5qKeBcQkoCGYRugPnWelBl/o33IF
         qMAO7O9+0rpcrbDtrPpnDYRxNw8MjOMe5QIRL7evSwAyfI13Mq87E7dQY6AyzIIytbpX
         TRQA==
X-Gm-Message-State: AOJu0Ywm9EsAsBUnNVWeZfLWaIQ36UsneAyVvA0jSkx9W5JTA80vOKno
	guhIVGPSfgYov5gTmn6g0E429ZmT7gvneH4Uryozbl0jlO9bEDPJ0IU0nEXuoxPTHpQPOQEms6N
	S3vXrF+K5x/4ii6m99MECg2hdW17r870V/PKZetwbdw8XYGMOGsjITSR4v7FJOne02y9Kzz62BB
	R+toMVPBHwO3DAQSGFKNrheoDE2+mkOripmaoHKb3TN+4x/kF0EP6CUg==
X-Gm-Gg: ASbGncvYj4br3g/ZxQOLCB18YweniR4SCVxrkYvUyvErWhNilRGPF+GC4vLq2+RYHO2
	vOmgbAaOIRQRP/kNwre6eTQx8kCp4C/j/mLolJEFz38oPErYVBRxPiQCtJ9VS9laQHIh6Ygb1zV
	YMvG8m64IgSVcdvn10miZYdCle+U52oJHL1Q3zA0wez7Uh2oZUYafE7YsNx3/IvzgReoq6rUgRu
	hxg8Vl3SpUhi9PeXY8fHc6xJe2XoxgBC2/zOkSR/I4vEZMrtqqRlAeqUa7dPEN9XKkqRzEMuL3W
	aFAWUV/f4HKIwvjpjD9mvCMSEbCIh210lBeiyTbzy3pABAQrddiKEmABknb3aTAY2EXxpHnGUz6
	N+RKFU0rmiTrTjkmjNiM+cZvKozpBZvoPB4OHwTNT/Qj90To=
X-Google-Smtp-Source: AGHT+IFHC9FHLS+JWDG2kL9jSgZsgrJjEAHMuHQA5oEWUA1rFIoyFcB6STmxTad665kBozNj/F4MaA==
X-Received: by 2002:a05:6a20:7f9a:b0:23d:b341:c2a4 with SMTP id adf61e73a8af0-240bd28603fmr4407172637.38.1755169527504;
        Thu, 14 Aug 2025 04:05:27 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4683722179sm9624755a12.13.2025.08.14.04.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 04:05:27 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	alvinga@andestech.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH 0/8] SmePMP bugfixes and improvement
Date: Thu, 14 Aug 2025 19:05:14 +0800
Message-ID: <20250814110522.18809-1-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_040529_154468_C762BC1A 
X-CRM114-Status: UNSURE (   5.19  )
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

This series improves SmePMP related functions and fixes
the access fault during domain context switch when SmePMP
is enabled.

Yu-Chien Peter Lin (8):
  lib: sbi_hart: move sbi_hart_get_smepmp_flags() to sbi_domain
  lib: sbi_domain: allow specifying inaccessible region
  lib: sbi_domain: print unsupported SmePMP permissions
  lib: sbi_hart: add error message for insufficient PMP entries
  lib: sbi_domain_context: skip the reserved entry during domain context
    switch
  lib: sbi_domain: add SBI_DOMAIN_MEMREGION_FW memregion flag
  lib: sbi_domain: ensure consistent firmware PMP entries
  lib: sbi_domain_context: preserve firmware PMP entries during domain
    context switch

 include/sbi/sbi_domain.h     | 11 ++++
 lib/sbi/sbi_domain.c         | 99 +++++++++++++++++++++++++++++++++++-
 lib/sbi/sbi_domain_context.c | 48 +++++++++++++++++
 lib/sbi/sbi_hart.c           | 86 +++++--------------------------
 4 files changed, 170 insertions(+), 74 deletions(-)

-- 
2.39.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
