Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F123ED10F5A
	for <opensbi@archiver.kernel.org>; Wed, 26 Nov 2025 14:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4zLC3X7039mT38mahgz7jTmJMRST/mJhzgHQnPWDx9M=; b=HsJjCY1ZdsVMAv
	weHAFaAl9ofpPmSIY8eLa3MAMyb7IT4Z48h9ely+uQzjWb7MNhVXZZ15wXVSMR8Z9IyNneXfWfZT4
	zNTkYs8PN378bMpVcKhmvaAA7UaSrvW47aXw3m+U86tZq0zW5mbhWgGDKxfqgFatn7u6aEMIZY712
	8O/7IEm8C7X3YKHXptqq9Eb/LVbhoGI8gqMI1zxnNaqmsUd3mGyGLcSR+0eCMAhx3WqSPpMuCi9If
	8cieQsqeSZGFwba99GlATH79P61MRObMGKlQLTQYzSSBsSdZfDQ0xt1rf1xsUNm7mtjjHLDWPQcDU
	KGtRy+DuNdGPjD2qg4ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGMG-0000000F5jG-1LHn;
	Wed, 26 Nov 2025 14:19:00 +0000
Received: from mail-dl1-x1242.google.com ([2607:f8b0:4864:20::1242])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGMC-0000000F5ie-0yYn
	for opensbi@lists.infradead.org;
	Wed, 26 Nov 2025 14:18:57 +0000
Received: by mail-dl1-x1242.google.com with SMTP id a92af1059eb24-11beb0a7bd6so1006276c88.1
        for <opensbi@lists.infradead.org>; Wed, 26 Nov 2025 06:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1764166735; x=1764771535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MBMuM7cetMy9NZmUgPj7x8vMvL1vu70oKo4uelf7q/g=;
        b=e1Jq/dmLTbc5lZsqRgF4TBNnUz2SFASElRCP8Cl2CpuVVyNoXG0IyU6sdAthv1FpFK
         AHk0Mdb7Dj6WnPshn/VP+X4Wg83FJTPPQ9syGJWt0s+VoJ0NHzthlEY48VLIyo2nC9oG
         WATPEbmRam2CRqWOWXnaBsIbJ/EiDDUGCWzOjKmvJuKsp4A6i8v6vKlL60QF/jdemVP5
         toBtfT2j+4mYpaxd/kztMahCMLnYXQap/DOYCGibi21a3Rsqkz6Bj76kd5JahMo7hcTF
         X0qKCwez5RBwmLenHyoJmjb1EF0oGLyr/LIQ5OCinAfxExXGgdr0FTJF7AY50r4yTpYb
         SVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764166735; x=1764771535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBMuM7cetMy9NZmUgPj7x8vMvL1vu70oKo4uelf7q/g=;
        b=oowkvU8uCFeah/sho5bQEbirPBFapjMZB5pp8H9da6s8Xb/3vvBNagGZMzLK46Ufj+
         iShKcZ6pN/+KYnAbegbQ7xUpBX10BuAjDWPmVPDqa2L91RxDd1AVlUM0GvK+SYFYlIrU
         W8cJrdEfPXRaBTWofXkeVR5kPHA7mbZjhE5cIS3hC6XyBKOQvLHhpo000bxxXGlsVhjv
         uLhpmt6uEf8hmqGJLAecrwvNkZYLfwHJSqGWWriT6Yndv1XKfyl9QVlvEcboIiZRSoh0
         pnAMdC2lyQL5fGk1XnCTabidVCXwOTXtlzZlu+01lPwXDHo2EqbeNag9MAVRwKXtjO0x
         BA+g==
X-Forwarded-Encrypted: i=1; AJvYcCVOor8D3yvin64Niaw/XoVAXDraNpXENY4H27eQqsQ39+tFNdokfCYy+B2DcSR4wWEYU9iPu84B@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7YpSXJ428re3GBSY2dZthWyWTI7VH2BN7m9PuEphnaU1mXrrn
	c+LZH5bhJ8xDmFuJaiCB6/uiWgpu2JVtLUmpdf7gBvHacaSr9B0hL5whIEplkSJqBqY=
X-Gm-Gg: ASbGncuMfIcXFvbZlbA7lAgjfM1vK2xmg83eSwf3k5JoWd+1xpulCfPteiPsjewrR/F
	5Vr3MNvjPrgHuwLhoPQE0DaNaVKLFCh8gyOc1DZIvfnco38Wtosv+YboEQFDXX5bkCQkUdj3wdX
	zl/ny2kNdrn1sscr0zXrzPGJlpfuSvZZSf7+0DG+7Ss23HJoSbZBP7rGv4zoWSAYc0IjWqELdJg
	4AArCmgj0JpXkNKmhdtERGvQkAXeN2PlTY+TR31vJDB1xwQuz3rFU/Mdr2AaGcGbHuJ/FZ1lu7y
	3oHtiy0SYYMiPFQfDVChQg/GOKMmWkWMUAl6VeIToDnipiyGy40Fm3wtYRFD8miMs4MB7SIPfUH
	i1ktxHbzGKZbw+i+IgYOhwsWNDxPysOci5lJg70Xm/HM4B/ssUW9Rn+dPQznU6CDvQCuWR28IRb
	+JhVX/YP/J9/KsfJw9i6tC7eOnhRoTpDhgPRv8HGnhYFJzX4M6/g==
X-Google-Smtp-Source: AGHT+IFbnDxHymCLcG4dZmijXVdILnM621BxwhwZIo1CC9CQyOkVlE/jd5gJ/fo305ALWzH20VwoHw==
X-Received: by 2002:a05:7022:3d0e:b0:11b:3eb7:f9d7 with SMTP id a92af1059eb24-11c94b601c2mr13510612c88.14.1764166734700;
        Wed, 26 Nov 2025 06:18:54 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc3d0bb6sm103679339eec.2.2025.11.26.06.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 06:18:54 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/5] OpenSBI hart protection abstraction
Date: Wed, 26 Nov 2025 19:48:39 +0530
Message-ID: <20251126141845.248697-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_061856_338160_18112F83 
X-CRM114-Status: UNSURE (   9.34  )
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

Currently, PMP and ePMP are the only hart protection mechanisms
available in OpenSBI but new protection mechanisms (such as Smmpt)
will be added in the near future. This series adds hart protection
abstraction and related APIs for allowing multiple hart protection
mechanisms.

These patches can also found in hart_protection_v1 branch at:
https://github.com/avpatel/opensbi.git

Anup Patel (5):
  lib: sbi: Introduce sbi_hart_pmp_unconfigure() function
  lib: sbi: Introduce hart protection abstraction
  lib: sbi: Implement hart protection for PMP and ePMP
  lib: sbi: Replace sbi_hart_pmp_xyz() and sbi_hart_map/unmap_addr()
  lib: sbi: Factor-out PMP programming into separate sources

 include/sbi/sbi_hart.h            |  25 +--
 include/sbi/sbi_hart_pmp.h        |  20 ++
 include/sbi/sbi_hart_protection.h |  88 ++++++++
 lib/sbi/objects.mk                |   2 +
 lib/sbi/sbi_dbtr.c                |  33 +--
 lib/sbi/sbi_domain_context.c      |  13 +-
 lib/sbi/sbi_ecall_dbcn.c          |   6 +-
 lib/sbi/sbi_hart.c                | 308 +-------------------------
 lib/sbi/sbi_hart_pmp.c            | 356 ++++++++++++++++++++++++++++++
 lib/sbi/sbi_hart_protection.c     | 110 +++++++++
 lib/sbi/sbi_init.c                |  22 +-
 lib/sbi/sbi_mpxy.c                |  25 ++-
 lib/sbi/sbi_pmu.c                 |   5 +-
 lib/sbi/sbi_sse.c                 |   9 +-
 14 files changed, 648 insertions(+), 374 deletions(-)
 create mode 100644 include/sbi/sbi_hart_pmp.h
 create mode 100644 include/sbi/sbi_hart_protection.h
 create mode 100644 lib/sbi/sbi_hart_pmp.c
 create mode 100644 lib/sbi/sbi_hart_protection.c

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
