Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F70CA1012
	for <opensbi@archiver.kernel.org>; Thu,  4 Sep 2025 05:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i1Hb2NbhK/BJDDxctkNw3TM3ofPAIyAzPZaP54sYPDs=; b=D5u5FH9gJHQ4xz
	aJ9VnFHEWcnUvJ3T5EQTxPEw7J1tBvK/tmraB0/QRC/PihHFl28z5/XVwnd0UNr1HAhYd660obZ8j
	rQ7ObCR9HX3cLxkbcDfeENrHbedy2J9BFvCRGQ7jQjNMEJyeX6F588WOr/lBBGpMReCCUUvrJqdWs
	YOgo6ptrWKTpmnB8SPQ66Xz98ZEjHhmvt40KB/KQxBYo5wzKtAtYwQGrmVRKKi/ompfRMwJv0XdLU
	aLEMV8KRa875HVcr9x0MVf1Jg6SuXfYGu/BX5D8zdVBdSWopAVBdS8C45aANU++KPy03fVHjmSkeD
	TFZqTIFWJ3eBtWsrvq5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu2SP-00000009Dtm-0dVa;
	Thu, 04 Sep 2025 05:24:25 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu2SL-00000009DsA-2YyQ
	for opensbi@lists.infradead.org;
	Thu, 04 Sep 2025 05:24:23 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7726c7ff7e5so605414b3a.3
        for <opensbi@lists.infradead.org>; Wed, 03 Sep 2025 22:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1756963459; x=1757568259; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IxgosI5+MERm8ozMYOv5ET3Cou5eNdWYvu7Sxh5NWuY=;
        b=axDXAd4yRyiTP3ezA93C+LXRWV6MuLFy2RxGvmtZZ58ZMgmxFacRL5HSP0UVY0Ncd9
         jvy+LhQIGbKv7xDz/iY0DVoYaOlkA6cZf8clYuiqpEBNMRUCDSEwd5beCcg60u40RRIN
         oy3oP/IrJ2f/rUY6CKtYoO8vl9UZpQB2y/PFlyZ8KwLw+aPxv+8O1TDHLkOweJBeaBNO
         TTpMaU4EnUixZxgxbL4+S+gajITdEsbYN6kBXMklcDK0G9UQ0xhs7rNJ/cKsUUpBVYN2
         RjjTkvxd/aX2MsB4KDYBSJUPiqGDN3SN9TmMxngeipcreP4tIfVkbb1hLzBQyRWTQNCD
         y+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756963459; x=1757568259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IxgosI5+MERm8ozMYOv5ET3Cou5eNdWYvu7Sxh5NWuY=;
        b=ElvPwbBh+Ms285Z0gPPiGG3CGKG87QaxE4ew8mZ1E+GMQQnpvRAuIdi36usaa56pTv
         YDX38jB22fuChUNUmavjGg/yY7LDMdpbPLvu49SEm3idRSzgCJze6t44E7xIPh2/xEvV
         L8ED1oR5FtdNjRVwrRcWofFa77aH38U7HRJGx1Uj0/pPSqd/2e8tNTFj49HRPhTr7Fbk
         U/1HiRAi1IAIlGcX6eXQkjR46XEpJTSq0ue9mx/SvdJDFDryQlqffzp8Q2kOJFFmK59L
         Y+UQZaASvNE4nNMSumbHMH+VSFamWRb3YU7BZ1QJzgxZIG7cKcSSpW3MNxD5zNZWgyPK
         kjxA==
X-Forwarded-Encrypted: i=1; AJvYcCXaZga9h/i1zifQMrdt06m7v3ZwmREh7/bo4SDgXECfezXoaVcF4wqhrD6UMoqC2NeBQ5BIUWzV@lists.infradead.org
X-Gm-Message-State: AOJu0YyX36VcKUz6aeWHJXKnAhCddvjrmkcmdDwnvvPAYddke8J0oV2q
	HuXckjPYa2wT1hJc68SK4YjHRfvIkan6aMuYa/RThbIe8nnbzGwDASwB5eHYzQ8qP5Q=
X-Gm-Gg: ASbGncvPFPFzKe/7zvkg43Yz/BcMYdq6GrmCFnDLCcOaYrugy92hOS1daiREHx823AI
	9njsWU9bdhGmJHmdeE/N2eoHEJzHZo3lUQ+YhWnwAnf5wmtcHY44SvFi9JCJDFZZUhE60lJ8Hz8
	QHu4iiVzgJCem8HCCG9Po/T5rHM9+5xCjfQDMA+ttCiTHVzznORVHVuvXLnAdetiZ8zHOOfupgq
	KXshMxP51uZ/S6iX34VewY1RCaor502JFaKz/QQ6/M/S7BTeIX+afGZ1m6WjaivyP9scuW4h2Cm
	Gk5HVZ/uGvZ4syySBr84eHi8M89ltW2wOWvnn2vqe0iIm6pX2cBo15N43lFp2xn9GuonUPekYcR
	yO9dmMLTI5+dbJ0q125IYJ5dJjop35/vinZbhL71kVWU5ejRS2x6+z6j/k6BtdNAgLiJBmHAn
X-Google-Smtp-Source: AGHT+IEoc/P7EWzTL5K7cjPHCSMcwAdEDaPnqfnrEapXtsWg5Pc/OMAcdwxsVCjGRVbY5bn+XT6Bqg==
X-Received: by 2002:a05:6a00:3e29:b0:736:8c0f:7758 with SMTP id d2e1a72fcca58-7723e224181mr19517467b3a.10.1756963458639;
        Wed, 03 Sep 2025 22:24:18 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772447058dbsm14251524b3a.38.2025.09.03.22.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 22:24:17 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 0/3] OpenSBI IPI device rating
Date: Thu,  4 Sep 2025 10:54:07 +0530
Message-ID: <20250904052410.546818-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_222422_467915_3212EABB 
X-CRM114-Status: UNSURE (   8.89  )
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

These patches can also found in sbi_ipi_rating_v3 branch at:
https://github.com/avpatel/opensbi.git

Changes since v2:
 - Rename sbi_ipi_set_device() to sbi_ipi_add_device()
   in PATCH1

Changes since v1:
 - Use linked-list in PATCH1 instead of array
 - Initialize aclint_msw after serial port in PATCH2

Anup Patel (3):
  lib: sbi: Introduce IPI device rating
  include: sbi: Remove platform specific IPI init
  lib: utils/ipi: Convert IPI drivers as early drivers

 include/sbi/sbi_ipi.h                    |  7 +++-
 include/sbi/sbi_platform.h               | 17 ---------
 include/sbi_utils/ipi/fdt_ipi.h          | 26 -------------
 lib/sbi/sbi_init.c                       |  2 +-
 lib/sbi/sbi_ipi.c                        | 48 +++++++++++++++++-------
 lib/utils/ipi/aclint_mswi.c              |  3 +-
 lib/utils/ipi/andes_plicsw.c             |  3 +-
 lib/utils/ipi/fdt_ipi.c                  | 22 -----------
 lib/utils/ipi/fdt_ipi_drivers.carray     |  3 --
 lib/utils/ipi/fdt_ipi_mswi.c             |  2 +-
 lib/utils/ipi/fdt_ipi_plicsw.c           |  2 +-
 lib/utils/ipi/objects.mk                 |  7 +---
 lib/utils/irqchip/imsic.c                |  3 +-
 platform/fpga/ariane/platform.c          | 29 +++++++-------
 platform/generic/openhwgroup/openpiton.c | 23 +++++-------
 platform/generic/platform.c              |  2 -
 platform/kendryte/k210/platform.c        | 17 ++++-----
 platform/nuclei/ux600/platform.c         | 15 ++++----
 platform/template/platform.c             | 20 ++++------
 19 files changed, 96 insertions(+), 155 deletions(-)
 delete mode 100644 include/sbi_utils/ipi/fdt_ipi.h
 delete mode 100644 lib/utils/ipi/fdt_ipi.c
 delete mode 100644 lib/utils/ipi/fdt_ipi_drivers.carray

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
