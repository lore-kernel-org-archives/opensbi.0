Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0732CD37B6
	for <opensbi@archiver.kernel.org>; Wed, 13 May 2026 07:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uAzoXd3IrfgRsUN7xw9hStFfVG2GefQ/pqSm+/683PU=; b=dgybiMBsRNuk71
	ngd10BEwPzlArwQtGrl/e0z8OlU1JlwjYH14ivgSdIgqamcHmXrEDmXwGwCs256Y5OYfEXf4F3ILf
	vd1Mlm4HhbIiEhN1FDZiyXhUvb3AQlfwwKwQCCyviDkocG2KX0Y9y/rasK6JNd5adeqO0+aMX1YgW
	EIe5VB9hW6aH6eJlc2FjMsKvCtNLSoEtW7pU3ZwuBek8aER0dZjjhT4JwSIsDi+Rh8QIqQVD6i9ZA
	lXQPVjFTtV2PL5DkBDlixVmhkaBz+ZU2nL9AZQEM95+dFP9vr5reKRa7HCXID3FQ8eC8idGHyB3dg
	3sqOipVWasOnuwd2u+bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3nX-00000001X86-1kA2;
	Wed, 13 May 2026 07:14:27 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3nU-00000001X72-389j
	for opensbi@lists.infradead.org;
	Wed, 13 May 2026 07:14:26 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso73026725e9.0
        for <opensbi@lists.infradead.org>; Wed, 13 May 2026 00:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778656462; x=1779261262; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rDF+xOIKqwUS7MYpSNMUCe27qoxcJqdVcBdckBdLrCE=;
        b=PZNCuCarc4/jYwX3DhG2ESZTCqethDcEaBVFI/tzNm86f7i5pqKAyXiyUpv/OLLeZA
         S9ZbDcnihn8sk17kbzz/g0FVfRU2Dio+ypPqgMlJ8exFwkMtnjYu9IVR5un1fMRtSshr
         +PkEg+TbuO8l1RUeYMSJntojkCo2MwGlS3hxsanE12Xk+KPP6+UWttNwq2mAJRTiBxPv
         v88qpWtJPal7kuVV/j5HSzjjnBaP42bC9caNIVnCBGVH6N78BUqRDyuRPD/5xf+9PPIX
         Zjflmz8qNb6rNgow1vEtqj3ukExI5MlEQjwtiLVfsUWjt+vxkK7Nrqenz3BdMJBRUR8h
         tY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778656462; x=1779261262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDF+xOIKqwUS7MYpSNMUCe27qoxcJqdVcBdckBdLrCE=;
        b=pbQUuubs6tjVB51in0x4T+BqGnL6pa4m8gC9B1QE2CbEM5BjrgvCQ93WHbiC1q2+Oz
         ai2Osca5SS0EsI0eUOZuu/ApmLAbVPJvJ08h6hhtNfVRWiGZCJLousBG10jcXhh5E61U
         U8Kb+MRYUKxexiAZYWCF/m4vxberlPVQAS09echRtVMNyQEeKRLZJhcBin6S8UPCjjGU
         AL7dzlHBm8Q8yjjkZFpt4MqvK6m5VhviGz754szxQsT4msVMBOv/E6gRjM9yTvciMmI2
         h6RiDhJ3/op1qH6OP6fKP0e2h/vsCdZm1+bBnNh+j4rYbdYZdPGVQMTQPXZmlBd+m3d1
         4qxQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/yFCFUFkSIN2t+hh6nPIxYgNldR7ozlPEi5K25CFIP1Wmx7l6o0XxsjgPt3k9yoWYnu3AQynm@lists.infradead.org
X-Gm-Message-State: AOJu0YzVl1E66Bwj6XYx/1TNGw9l7PxsdaxNVyQn7Ql2YBzGlYAbf9y+
	+ehvICbt8xMnyJb5J8uGspyGvtFPxI/FB9aod9yWCXgUUi9WjiaIrjrSMqISs6WsXm0=
X-Gm-Gg: Acq92OGdv6gEoWocX49rZ3V9L+GwU1+I8DaBvhHIOIUX1+ztBeAnWJAR2/kvSz9eg23
	+qq5FVdZjGXJi0KUx1QehjC6pI/nwu9VBKCKDBdvpRdA/5NHyWuRo+zdTUv+OLq8A1vHY7LeqtC
	/fmiBgCb8BpS/GDv02sjinTRgcyWHBx0/uzIkJlwMMuZmPbLsFvB295jdv4uiBjf5rj+z8GTOkb
	JlhGbhnXtn5yIV0fChp3Kx3laZza5r7yNJ3BcbOb4JeMqxdYo+AO9LVwPHvy3VbfT1JtiBLDOGs
	89V63D8JhKPtHtwM2fcy89Wdc3ch9UbG3oFdE/XTS9vJLGoOn8ze0BC8Yr03HnC0u6JHXdHRNm4
	eDNLUCV+XnydH+bmGXc/kunGuUqyvt+HwkRR2z57fm7id/o9Cdkv8zeaVds3f1zE5PXh745KSvx
	SIU/RQuoKrsOsFxWZJiXytfuNGJ+lMVQmKOGzUKEQQ6JkBZEBFF7jNNQKsCaSXG6nfgTPN8hXLJ
	G/pcA==
X-Received: by 2002:a05:600c:c84:b0:489:1e8a:90b4 with SMTP id 5b1f17b1804b1-48fce9e4f87mr19541165e9.21.1778656462409;
        Wed, 13 May 2026 00:14:22 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8e5efe71sm39558345e9.1.2026.05.13.00.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:14:22 -0700 (PDT)
From: dave.patel@riscstar.com
To: Anup Patel <anup.patel@oss.qualcomm.com>,
	Anup Patel <anuppate@qti.qualcomm.com>
Cc: Scott Bambrough <scott@riscstar.com>,
	Robin Randhawa <robin.randhawa@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Dave Patel <dave.patel@riscstar.com>,
	Ray Mao <raymond.mao@riscstar.com>,
	Dhaval <dhaval@rivosinc.com>,
	Peter Lin <peter.lin@sifive.com>,
	opensbi@lists.infradead.org
Subject: [PATCH v4 0/3] Add eager FP and RISC-V vector context switching support
Date: Wed, 13 May 2026 08:14:15 +0100
Message-ID: <20260513071418.50957-1-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_001424_924574_C0366737 
X-CRM114-Status: UNSURE (   6.53  )
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

Hi Anup,
        Thank you for taking out time and reviewing the patches.
Following your review comments, I have made following changes. Also I have
tested the changes.

The changes include:
	- Dropping CONFIG_SBI_MAX_VLENB and sbi_vector_domain_init()
	- struct sbi_vector_context vec_ctx is now struct * in
	  'struct hart_context'
	- changing READ_CSR and WRITE_CSR to vcsr_read and vcsr_write

I have covered all your comments, please can you have a look and let me know.

Thanks and Regards,
Dave

Signed-off-by: Dave Patel <dave.patel@riscstar.com>

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
