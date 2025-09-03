Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D2BCA1011
	for <opensbi@archiver.kernel.org>; Wed,  3 Sep 2025 06:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4lKQ/IKvr9DZfaNItQB7qHVI7UeVNhbOGsw5StpgjC8=; b=U0iM6F1+w+w/Kj
	fblpW8aTI4ckPefK5CnUOF0t7OySglkxt85uPrplktqRQ2xTPmbhdSf1uzpswRLRQsOFDrAW+RkdH
	7MFptLmFhfYNMehPh7GQrBOPhmNEw2MLC1/PVcK8enA9yW8KLEODpcxrqO+GwucIrJqlW6NhZjNBy
	WnZxkN1Wdbrv7n1Mjq1T8vUN/nUYJtEYGEUpJUCkiwIeYLg6E8+vFD0yd6u6CWo0HSkHTa1yRmYjw
	YuveFUsj2B+u4b2Vm3rQVp+1xjZ2xpAnMTENQccbJLdgbSEGS7cNo1rnfEsexeJMa96s9Q+SYxjpK
	JsGrTRzml30jJAJqNGlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthP2-00000004pyL-2ihV;
	Wed, 03 Sep 2025 06:55:32 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthM4-00000004oCj-2kXa
	for opensbi@lists.infradead.org;
	Wed, 03 Sep 2025 06:52:30 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-248ff4403b9so46784485ad.0
        for <opensbi@lists.infradead.org>; Tue, 02 Sep 2025 23:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1756882348; x=1757487148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CwO98/6OBHm8BiHVqWWQ5Sa/LLMK6Dwm93jvkf/W6Cs=;
        b=UJoOUmKKiMuDpl/NFZHwJt3xMCDrHTUTBWaxEtSyy1ZQvmWqHjunEfTTWY6fUV/ilj
         hBnTQizNIDS+1dAmoKm3BcFRskvYvD5JUSBEnWnSwzxPvT8gE+8w3M0SDyInO+LwvfKL
         egjDRUFXHGvH3DHIAAbp206TeglbDzv5CU3Q0+NYYWmhPTTaPIvk1RSB+gRh1624pWii
         ROCRYF190st/zF4foi+d+6/Zs0oIeIYizGrLNQH02bXykwQ3F7u2ta0E9wXAbzzNCWGy
         iX7b9QYZslm32qsXre+RVkAFP0a1VOl9jeCnxP5NTdcjhorVLf4BQmV2JR26uVer2eHe
         /CwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756882348; x=1757487148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CwO98/6OBHm8BiHVqWWQ5Sa/LLMK6Dwm93jvkf/W6Cs=;
        b=cDxWJXyLNcFLuZkp6JfG8eIGSahSnG5GwlILJNNb1q43grD7uBl8kPjjIh21O+JEMM
         /XDBEO5cKZmDXo8jOQIJ/mZxF315Ym0Pt9DmWZ4aRurX9fgFiT80We3dO84nlxpGrdaF
         ZfduBEuGtinPYnWOXL50G2Km9pDnsafTrlONtWSBjBK/ip0tktNMuwrMkrHtM60BKs2K
         JaKKZ9/VwvUTWUhFDm3z9owc7pVwkT+ZMIc9Ech+3NQHZ4KjiGCen8umkUrxXUdWnd1F
         tw+iIoQ5hwmN9JWpRECJq+qU1cIRfSwLKnySn0glNPTJgO4z8DNFHI0YwAE1cuPOXs/Y
         p7Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWIYyUWV+eJt0S+CS46qs5Wd5y8fqV3l0pKqcTkN5YnPF+ecm6Rp9RpTzc9h9jKdKKkUCKiaqLM@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz/9Tdoh0rFBe/07IHF4m2kz27q9PGQpLzIcc7abUrjjonUkEd
	g3pXq+/51FhU+gvprmaJWn+q6+g8iulibZ33FTvZy8NalrdXWt87fPrPbq1DimRjRsU=
X-Gm-Gg: ASbGncs1HgYqnpur9uOojYV2X5jdWuL85qJkB3nX3/1wB8ffHLd0mg31UmMxLgk/Q7n
	jQP4/nuUTM8Pavb1kE3GAHTVRK27qqtsZfjjQ7w7MEIjhzojH9WVDHGojETQpJchyCtnil1wng4
	CvJMuBVBlRFwnZ5l3IQYbZCjf5Urg4XbSzcjrNClei0OMztM4aXfzAd/W/NhxKJsQ632uMIDurq
	T6W12pr4KrIbgRreLIHyOkR+shcPCR4zwldG5TSfYGqBSfBAfMsMPiIWUDSl6eaBtTmt2moZery
	AShfd9XtE6MvcJfOQqbFmuIK7QdK7zM6STR18qiMedaidkZEt7P1i9OUThKhCcMAH2vb638X75q
	4IBS4yMu6RD71XPfMNZo+/d5iWfM4BcTb9BRUjMFRBrslYDWYagxfmYJcCMr5WQ==
X-Google-Smtp-Source: AGHT+IEvJfSbRzpDO/Zuz4OEsH+43NEJR9jv45iCzhSM0hveLBk7yqDJpO9Gf9dColnFAE8ut4eGPA==
X-Received: by 2002:a17:903:1ab0:b0:24a:f7dc:caa3 with SMTP id d9443c01a7336-24af7dcccabmr92468895ad.37.1756882347844;
        Tue, 02 Sep 2025 23:52:27 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b905689d1sm25984655ad.64.2025.09.02.23.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 23:52:27 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 0/3] OpenSBI IPI device rating
Date: Wed,  3 Sep 2025 12:22:17 +0530
Message-ID: <20250903065220.456955-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_235228_690651_AFEE4A1F 
X-CRM114-Status: UNSURE (   9.16  )
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

Introduce IPI device rating which further allows us to remove platform
specific IPI init and convert IPI drivers as early drivers.

These patches can also found in sbi_ipi_rating_v2 branch at:
https://github.com/avpatel/opensbi.git

Changes since v1:
 - Use linked-list in PATCH1 instead of array
 - Initialize aclint_msw after serial port in PATCH2

Anup Patel (3):
  lib: sbi: Introduce IPI device rating
  include: sbi: Remove platform specific IPI init
  lib: utils/ipi: Convert IPI drivers as early drivers

 include/sbi/sbi_ipi.h                    |  5 ++-
 include/sbi/sbi_platform.h               | 17 ---------
 include/sbi_utils/ipi/fdt_ipi.h          | 26 --------------
 lib/sbi/sbi_init.c                       |  2 +-
 lib/sbi/sbi_ipi.c                        | 46 +++++++++++++++++-------
 lib/utils/ipi/aclint_mswi.c              |  1 +
 lib/utils/ipi/andes_plicsw.c             |  1 +
 lib/utils/ipi/fdt_ipi.c                  | 22 ------------
 lib/utils/ipi/fdt_ipi_drivers.carray     |  3 --
 lib/utils/ipi/fdt_ipi_mswi.c             |  2 +-
 lib/utils/ipi/fdt_ipi_plicsw.c           |  2 +-
 lib/utils/ipi/objects.mk                 |  7 ++--
 lib/utils/irqchip/imsic.c                |  1 +
 platform/fpga/ariane/platform.c          | 29 +++++++--------
 platform/generic/openhwgroup/openpiton.c | 23 +++++-------
 platform/generic/platform.c              |  2 --
 platform/kendryte/k210/platform.c        | 17 +++++----
 platform/nuclei/ux600/platform.c         | 15 ++++----
 platform/template/platform.c             | 20 +++++------
 19 files changed, 91 insertions(+), 150 deletions(-)
 delete mode 100644 include/sbi_utils/ipi/fdt_ipi.h
 delete mode 100644 lib/utils/ipi/fdt_ipi.c
 delete mode 100644 lib/utils/ipi/fdt_ipi_drivers.carray

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
