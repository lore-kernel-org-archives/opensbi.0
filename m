Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29ED8FF886F
	for <opensbi@archiver.kernel.org>; Thu, 30 Apr 2026 04:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iXIyh5CWvun24nfKw7vH8D1GStoj9qNSCTWN4nNz9qo=; b=oeSnYFd5CsOw56
	ehkC4jr2aAs8dK4Ou8bQKkhPajJvD5JrWK6hOPC0VrwdGQBTafymxGGcALjy3xNx5+xIlNiYCYQ2B
	LMp6YWY5JMcdO3ZLY1f1+GdBf//UV0xuEgl5kDPskQ3VH1AqSbO4AR0qP0iIq4QogA0XyrAaewk9C
	nYYDTe6Nx2q2/YCcZBDMCJh4DiHKOXWlMLBDKCiJY7idRbG3yfrehQoWeWOaFA3jR0pVw+PwAWivo
	kYVQJjxIYdmDGEfuJ/ud/o9mH4tJduJ0qH9S0c0HVDZ1VwybHsjsuzkDuX5q4QEu5XwXE82+uxL98
	K0kYTnSJo9+RLylo905Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIJR6-00000004g2M-2TJa;
	Thu, 30 Apr 2026 04:55:40 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIJR4-00000004g1w-02mx
	for opensbi@lists.infradead.org;
	Thu, 30 Apr 2026 04:55:39 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-82f69adeecbso221580b3a.2
        for <opensbi@lists.infradead.org>; Wed, 29 Apr 2026 21:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777524936; x=1778129736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jipsZ3SpvN4B/Iirw6YPssnkOymw3XF/VU9Cv16uLZo=;
        b=P3Zy/jWS2wkJSmKIkRCAZo13iAwtbqS3ICIIP0+AWj+Ru/iTkXcba2JJt9eQZAB6c3
         lNe00fPkN5yvP55bzz3bNw7ssmXE3meoYLbUj23znonYl9yEt4E/Bk8LMIuVXyKuXl5P
         lDy4ZSIohVBRT5WNF5yzD8e6jHum8eANFWboM64DBkOhhmUvhvP9TT8Y3g3r+Y9/gQoB
         INKpGK1W5JyEiTpxJ676PEOT0rmy2RSarhyT0OtFrDOKk4CBx8tc4jn8m795L9DAwHOy
         bnbJj1WxnqBkeiClo4XkE+Q5zBUJZQuyou1/CiRwTTUG5QErLIcc7V3XCslpXZIxcgKk
         0Ujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777524936; x=1778129736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jipsZ3SpvN4B/Iirw6YPssnkOymw3XF/VU9Cv16uLZo=;
        b=nu79GtMnQeQRz4OUY87c483/A2R4Mr7n7g8kK8b3BqKMnEQJvIYfQFp6TNgrVpP+GC
         0aR2IviETe3ees79qpxb/iCaUkD69y3HrQvX6XnTegF1y/6RdJbKFmsZOG6dRqwnCWSU
         tlSOn59ru1tAKbNJXHMKXXMhuESRa3ptvg2A8K4VYrh5Bo9284ClsT4+a7QwJ8mlxWM/
         J4JgS/3Rzk7PTIsE4OYactMYeV82zLKuvjioZ7QHMLEukZC1RJ67WtCjWS3h5Z9HuCPx
         0ITtaFQYgBK+1IJfEkWTIrDJFdKWM1gn0VfWS4Dy2IcGOa9JN7YTFA13TijHn/s/bpOP
         4x+w==
X-Gm-Message-State: AOJu0YzzPNeu/NP1zfO++ukWt6oinh09cmdEDszNgNiQAR+jQiJX7KgS
	5497YnhS+3+239eyKO+moBE+6Ss/cQcLNWgX7CIGjnmjIZ6gbw7kKvPI95A3/w==
X-Gm-Gg: AeBDieuNLjXVXH/t+9JJO7LpMEuZwwouUB7E5TlVgQkMdDJUSQgMRZJ8xyheLbaVWU6
	VkPMQgP9er6v2az2ZKglrwGtUyjheaYzqCD3wbKL2LjBnQSA5ykU2s++NryFwhDVRfh+D+bqr4v
	R1CqAIeuK7zmxepg/m8mP0QmIyEwRTnmX7eHAxuQz7I8dbKpGNQIPd22cYNa9v09qgwc2KHL4Zs
	pGosYSdHWklR1WVD9Z4nk4KOS0+gaQEyf1s3mVRy8FVMRYgBG7HQkgYZhZrVJjx2YFOKMRXA/m0
	IJC7JO6oOlQVd8f9sZqSVqUsfuaKPlQPhBlLgBeU8frcPMoRLsy66uMzNp1MRGx01eCSX/Fnoba
	9opDFBoQ311oqRuQBxNS5WWA5D1HV+8Ew53320bfk3Xu4VwCs6R74GtAAGrGXsnC5olBOmHcrAS
	1alIvf19Xt9e4v6TL/QnYKyLmHthnrgwA34Y4QSgtDhC4px8Z1d0RKgQ==
X-Received: by 2002:a05:6a00:4c90:b0:82c:212a:8023 with SMTP id d2e1a72fcca58-834fe092911mr1593986b3a.11.1777524936436;
        Wed, 29 Apr 2026 21:55:36 -0700 (PDT)
Received: from localhost ([124.158.97.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed6debacsm3710728b3a.33.2026.04.29.21.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 21:55:35 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 0/7] Make PMP encoding usable for non-hart PMPs
Date: Thu, 30 Apr 2026 14:55:17 +1000
Message-ID: <20260430045528.420437-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_215538_104461_64A3DEA6 
X-CRM114-Status: GOOD (  10.66  )
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

The Tenstorrent RISC-V IOMMU implements PMPs with MMRs in the same
format as specified in the RISC-V ISA for the hart CSRs. This series
splits out the PMP encoding functions so it can be shared by both
users.

I moved this series out of the Tenstorrent Atlantis platform series
that included IOMMU support, tried to do better at splitting it up,
tidied and improved code.

The new user of the API can be seen here for reference (will not
quite compile with this new series):

https://lore.kernel.org/opensbi/20260310005000.3837512-4-npiggin@gmail.com/

I will post that one out again after the base Atlantis platform and
this series is merged.

Thanks,
Nick

Nicholas Piggin (7):
  lib: sbi: Introduce pmp_t type
  lib: sbi: split PMP encoding and CSR access
  lib: sbi: Move RISC-V PMP encoding functions to sbi_pmp.c
  lib: sbi: Add PMP CSR read and write accessors
  lib: sbi: Add pmp_is_enabled() helper
  lib: sbi: Add hart_ prefix to PMP functions
  lib: sbi: Move hart PMP functions to sbi_hart_pmp.c

 include/sbi/riscv_asm.h          |  12 ---
 include/sbi/sbi_hart_pmp.h       |  12 +++
 include/sbi/sbi_pmp.h            |  23 +++++
 lib/sbi/objects.mk               |   1 +
 lib/sbi/riscv_asm.c              | 162 +------------------------------
 lib/sbi/sbi_hart_pmp.c           | 128 ++++++++++++++++++++++--
 lib/sbi/sbi_pmp.c                | 105 ++++++++++++++++++++
 platform/generic/eswin/eic770x.c |  36 +++----
 8 files changed, 279 insertions(+), 200 deletions(-)
 create mode 100644 include/sbi/sbi_pmp.h
 create mode 100644 lib/sbi/sbi_pmp.c

-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
