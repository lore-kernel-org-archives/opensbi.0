Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BB9C54ED1
	for <opensbi@archiver.kernel.org>; Thu, 22 May 2025 21:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DKB+Q7VE+YhJ4tyyEVAnClJdP93RXDTmApEOYSSJBok=; b=y87jk4EfUpmJEG
	vZNulBBB4U3PhXkqPpMh6gor94RAD6aZe088Vx3O6a5ZsQBAspPBsg4ipVbC3qLcCZkTVfdgYv5gK
	ecLZDcU4QoWtqt+chazGgUtWPgseduH/8UswEak5yqjOncQjArPZnUWAfVqPKfOaZDQikwp0r0Zct
	GvevCyOMb+rGVa88I/yBlDgpjGH9fYsnsJQWGHAWFkKNSRFO+CtlaKZKklpTLiauXNhUQRliWqR1w
	wy1muCdeuZ8ph7TtpJ49gItXx6R8Rg8gjolQq76dUocOOTV4Dz8TQ8mehC4aow3l8vQoQOmhPa+9A
	Dr2m2ECjWQITaPRRn5hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIDMR-00000002Bup-3tWb;
	Thu, 22 May 2025 21:21:55 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIDMP-00000002Bu2-2VOB
	for opensbi@lists.infradead.org;
	Thu, 22 May 2025 21:21:54 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-742c3d06de3so6422879b3a.0
        for <opensbi@lists.infradead.org>; Thu, 22 May 2025 14:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747948912; x=1748553712; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXPP4Ugvn7cFa4qz83LwTQjAqK5UEQ4RHyn1+vnku1c=;
        b=CI732ygV/IkSppVpV2w4t6nHs4YJXb90IjipuAzGLfZDtGdUdZq9HYXaCQZMIh4k5T
         cEW4ZKLnZU+ITVNx+kSjxhxRYJ+TloxlBAlqU3o9FrDQYrqJqJAJSiYHg8N0wercjEIl
         aCDKVoAeVB7UF+W3ZgfLVTLWn6eiCiv5Bgz9qSbT4YLECoJWQVuaSREdPDn6baeyJhdK
         +fQN2c+eDRgGCSjd2BWOwNocgTTIN5Gr/UE+VUhErqmLBL6rSd5ysCBZqc6Yigye/UT2
         2WM6KFCZMcucsMq7fZ1lF/SfM/zED48GAzxESPUJRhn0oz6Th1nc0hDCsES832g4XAbA
         /QPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747948912; x=1748553712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXPP4Ugvn7cFa4qz83LwTQjAqK5UEQ4RHyn1+vnku1c=;
        b=voJcJRf5DgOEEnsZDXYOGZzk1IorxYGq3nOzC+2Si7xv04S3OlUYywOwHZI+bB8ClL
         2Ptidym+G2+LjTpN/tC6PMcUwPnEXye9CBlzuF9taD8muJnSvOepyMoQiKdwCocgTU+y
         OWNtr3l26oukOwFhyfs3bTYslgNT1Wi1wwghP9BoY/QGWll8O20kHmJWs6Dz8Pr7vYAW
         tKYfFWa88/5fpp/WXFYeCJ3GBIG7IUKmhSd6B3dRGAucBT4a3ItKCqsB7cLK4uITTFsa
         aFK70kjKJjLr3mydLRr8WO3Udq8C97onhb/+o2QwewgHgqXLUe2Al7lsUo4deqi7wGw5
         HyqA==
X-Gm-Message-State: AOJu0YzScaTQeax6V/PCp2U82pDyfRfCAt8J5pJJ1uuEPbQAfyNVsu+t
	4aV9ixrS25sEsyszM2U+6/T9R1YQksbEMw7O3L7sKEhK0Euds3kMIaJF2EOxuTN7
X-Gm-Gg: ASbGnctXEp8ZhYVR3uTdUebJVlIUgUxTam/Av9apC0HCqoLdMNom+pxMxBUuwlPPsyG
	aNqijhO1z8+rJsZdPgKqYhpwl0Sh9l9AnfeNHcp1+7T9UeA/6XhnWN8QUPNOX1mL25x3Hr9bZGv
	1cajjq++jElR9djre6mRPWlDPNtdTA5HH6zSa9HldIxNLdZ8o+AX+Cdegy15QTTd5xAGzgK8WAt
	1NGL46ra/AJP2KKqVxbh0EfiMVUpxmU1G+6cYcriCTEuRhZ7JGqEiE7NcCCCSm0p/2r6YNdgrYx
	PBVwUE2Mf/1+ogfACZ7+45ae0EKMFnjA4Img7NDtH8p2d0uPPFU1cKFjhQgP77iQEA==
X-Google-Smtp-Source: AGHT+IH53oUk/AVfRFwRcuP2fa1R1LjPQoKOTNF2HLTlQ/+lsAV2vv7TIeabj+/ZoVMOk0Bl5+JVxQ==
X-Received: by 2002:a05:6a00:2d22:b0:742:a7a8:4132 with SMTP id d2e1a72fcca58-742accc5834mr36446399b3a.7.1747948912174;
        Thu, 22 May 2025 14:21:52 -0700 (PDT)
Received: from localhost.localdomain ([50.175.154.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96e1fc3sm11629766b3a.8.2025.05.22.14.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 14:21:51 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [MIPS P8700 v6 0/7] Add MIPS P8700 support to generic platform 
Date: Thu, 22 May 2025 14:21:33 -0700
Message-ID: <20250522212141.3198-1-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_142153_636321_4FDE2962 
X-CRM114-Status: GOOD (  11.70  )
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

---
Changes in v6:
  Drop the dts file.
  Drop the entry function.
  Add a new platform pma_set function.
  Move PMA code to MIPS p8700.c.

Changes in v5:
  Drop the amo emulation code.
  Change to use macros to insert instructions in p8700.c.
  Add 3 new patches to recognize mmio regions and set up cacheability based on
  mmio regions.

Changes in v4:
  Remove code that overrides nascent_init.
  Update p8700.c to work with the latest override.
  Use csr_set for mipsconfig6 in p8700.c.
  Add riscv,cbom-block-size to the dts file.

Changes in v3:
  Remove stw.s, stw.h, and extra scratch space.
  Use nascent_init to initialze MIPS CSRs.
  Add amo emulation via illegal instruction exceptions.
  Change to use AMO and RDTIME illegal instruction exceptions.
  Revise the dts file.
  Remove code that jumps to mips_cps_core_entry.

Changes in v2:
  Break up one patch to 11 patches.

Changes in v1:
  Original code.
---

Chao-ying Fu (5):
  platform: generic: mips: add P8700
  platform: generic: mips: add header files
  platform: generic: mips: add the platform file
  platform: generic: mips: add objects.mk
  lib: sbi_platform: Add the platform pma_set function to set up
    cacheability

Vladimir Kondratiev (2):
  devices to use MMIO memory
  Convey MMIO flag as specified by SBI_DOMAIN_MEMREGION_MMIO

 include/sbi/riscv_asm.h                 |   2 +
 include/sbi/sbi_platform.h              |  19 ++
 lib/sbi/riscv_asm.c                     |   3 +
 lib/sbi/sbi_hart.c                      |  13 +
 lib/utils/fdt/fdt_fixup.c               |   2 +-
 platform/generic/Kconfig                |   4 +
 platform/generic/configs/defconfig      |   1 +
 platform/generic/include/mips/board.h   |  33 +++
 platform/generic/include/mips/mips-cm.h |  88 ++++++
 platform/generic/include/mips/p8700.h   | 113 ++++++++
 platform/generic/mips/objects.mk        |   6 +
 platform/generic/mips/p8700.c           | 361 ++++++++++++++++++++++++
 12 files changed, 644 insertions(+), 1 deletion(-)
 create mode 100644 platform/generic/include/mips/board.h
 create mode 100644 platform/generic/include/mips/mips-cm.h
 create mode 100644 platform/generic/include/mips/p8700.h
 create mode 100644 platform/generic/mips/objects.mk
 create mode 100644 platform/generic/mips/p8700.c

-- 
2.47.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
