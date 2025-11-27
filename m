Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4BCCFD2F6
	for <opensbi@archiver.kernel.org>; Thu, 27 Nov 2025 11:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m8xHngLbgvpVD0bLaMgJIySk6ERNWiAqmlPzM8ug+U0=; b=O9mNvTLZHb0tsc
	99A0ru/ye5Hb1DXaA7407WMoVF4lVdM2kPB6KqDwBlt6+xVY4pm7K5rOzZivsd4epoT9AtIiQf42D
	WDtY0AhNIvHB2ojv6DZ8t6x1EVET7mX3QpTFNGW3bmJB26/kgNP6a1Ww81Vh4IGckrA9K+HI0LsPW
	KXVxi/vjhgPw/6rqW5LZgjl0JpRQRAl4ToWMvuIiuzLfVkaBzvx0LXEuZsm8NnqKMM0CVCxcVtFyj
	jBq8ntiJwu08FDCPd534GCkMqrf9ePC9ardVrBPIemTmf3jn+AeJM/2xuU0uq+QjiJyjUcspW+B2a
	vjfsNoDjLQbp32fFB+eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOa49-0000000GRlu-2w5A;
	Thu, 27 Nov 2025 11:21:37 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOa47-0000000GRl7-05ID
	for opensbi@lists.infradead.org;
	Thu, 27 Nov 2025 11:21:36 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2981f9ce15cso8312745ad.1
        for <opensbi@lists.infradead.org>; Thu, 27 Nov 2025 03:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1764242494; x=1764847294; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xpXPclGpEE0S+AzhE99UTyDVajF/nO+b3YmuPp79Eyc=;
        b=RHkJ7qfQ+OrwjvBxgMryUup8EADbXZrgUhPhAm6c+oPdWz5UneMt7jUK+RJrTQq2tf
         PimeAZnPaMHZhi311NiOuykpIGwsynQtm0D9Jc6KJiuG7YOMBBDDraUFbuvdoM6HIL8Q
         LT6IVkEbcWxMv4Zc6IsmD1af+ZjvjNRF4hth05jTqEkkoALCSU4kFWk8aESFoJ2GmMtO
         VM3/jWEX3NkSB2OtO2nIlx/oFrsMUCTRx9GGAwK/Od/H/e+n+v5DXkDoUrqCj/HUDUJO
         563Yc4VMUoc16ZjoV4SH2gZ0KcST7HW2ky3Uj41VclY3tbY1dt+MWiUDtRSSxcLFKRHP
         i//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764242494; x=1764847294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpXPclGpEE0S+AzhE99UTyDVajF/nO+b3YmuPp79Eyc=;
        b=MJdEKY7TT9sMwH8CYPBBcT3ixmEX0Ec5NrfrZxybPlMv+QRz6IDFfbjoVR3w1/6p6d
         IUKxZGb6iERoIZJAZjD+leOlD55q3dEvgl7n7cy4IofrWOgY83Lyw/5vbWhWsTTDI2We
         FijiJXcinqBlv94PmfckYGd/p08WnYaFHOqQmZeQuotUgOB1C5BOzETwiWdPsGG7bhv3
         HQQiyMdVP34R8xVMTztCMFglrUyc4NY0ZbsSp0feiY3ovBDFJRzTiiRzAjZ1HKBjolQY
         bAnIBrSR+w/T2R8+cT2mCqjKSVfOMBtEiCUXfzG0wV2OhzjjYLPXSv2haOJjUi46y1Q6
         HJDw==
X-Forwarded-Encrypted: i=1; AJvYcCVoJpp4FK688ASM+IIUMf8TZbU5BfrfxTB75GaRHH9Y6rcjkEHOyLcFG7ZA4eh7/YrLA8S9up5o@lists.infradead.org
X-Gm-Message-State: AOJu0YyS6aUGU95pxNaS2Z+aIqqeGI3174T2OYN8sqdNFlV/Xm9QwLgE
	nVRprFfODz6ek+j9mGk8g4cK32bN5QUdgazk93j5gWYpEkaNiqv/P/8yNfSvOdO1KaI=
X-Gm-Gg: ASbGnct6Ne1lMSbLioOqKEMmAmba6JF1n+OcKIbUtDCdE05ZAOP+XtAwelxZ/mYeP0H
	NAZ8ZKfsmEEt2EoJAIqWpLN9imm3Mk4TgGAGvsdcfY7i3/fbqzFrLz6B83V/B9vEh1ypqET3Z0v
	pC8u/ChrvZhWzBhVjMLl6xM0RCHs8csc/7H/BHyc7MebTamSoEc7S46Phz2VhIXi5xOM9Pt7DfG
	iNcPkzbQwyqIpTh6w5E0fsD/SrawSLX1cIlP8aF1NpXns4qLbiUSB6d0IA6WmFF9zB0JS8bq4dz
	HvaVH0lRKH7mvhW5AWDwK63TtX9NrTSKtayQQucjHagHwA9S3SLUuOUVhbPOSXdSt2uAQ6iMCYH
	cNvdhtZrrneoVCI3JoQYRVUDHK52RrHplUy2YNZ3a6GY4Mz+/KRcWtmlAxvkjbymH8iUjmUHhxV
	zvesWEJ6+kNBnDKlRjcB+6TO2+xy+IbXrjiLwqOGwQCA==
X-Google-Smtp-Source: AGHT+IGhNmT5tZ6eMa68my+5i2/Ocs9SbuwPdNLMShHrSaWuQvG5YTaXzt728vgb2+lbQjnZNTXyQw==
X-Received: by 2002:a17:903:19e6:b0:295:73ce:b939 with SMTP id d9443c01a7336-29b6bf3b681mr270294525ad.39.1764242494075;
        Thu, 27 Nov 2025 03:21:34 -0800 (PST)
Received: from localhost.localdomain ([122.171.21.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb27598sm15194125ad.62.2025.11.27.03.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 03:21:33 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/2] OpenSBI FWFT ADUE update fix
Date: Thu, 27 Nov 2025 16:51:19 +0530
Message-ID: <20251127112121.334023-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_032135_091703_C5806DF9 
X-CRM114-Status: UNSURE (   6.42  )
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

As-per latest RISC-V Privileged ISA spec, TLBs must be flushed
upon FWFT ADUE changes hence this series.
(Refer, https://lists.riscv.org/g/tech-privileged/message/2728)

This series based upon the "OpenSBI hart protection abstraction"
series.

These patches can also found in fwft_adue_fix_v1 branch at:
https://github.com/avpatel/opensbi.git

Andrew Waterman (2):
  lib: sbi: Expose __sbi_sfence_vma_all() function
  lib: sbi: Flush TLBs upon FWFT ADUE change

 include/sbi/sbi_tlb.h  |  2 ++
 lib/sbi/sbi_fwft.c     | 13 ++++++++++++-
 lib/sbi/sbi_hart_pmp.c |  3 ++-
 lib/sbi/sbi_tlb.c      |  4 ++--
 4 files changed, 18 insertions(+), 4 deletions(-)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
