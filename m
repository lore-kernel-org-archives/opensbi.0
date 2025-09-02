Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A795ACA0FFE
	for <opensbi@archiver.kernel.org>; Tue,  2 Sep 2025 16:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vply8cR5LABMaib9W4AGHhOnWwKmNErF3v07BgKYZ18=; b=4f9j9lfHOzb2K9
	x8Fi91R5MWPAquDsKKiyfU9hUu/I/1Zmn4opTpUx6lXHrmWRxFggfZQH1kIgZIssSGwDuhDma5GJ2
	IFIpwResPDbDyHLey3Ps/XqXhiuVDCGqodP/GCEQP1D/JPsCfV9pTahkJIrmsJ54dGfMs6yYstNcK
	pgHesa8fobuXMZJpcxzujMj0pj0JMWLrBXRDyxF9156vjsH3syjuRd0gAFZasp/YoqIDYsMYmrfiZ
	KNYZ23/U5a2tSB6Tjze4k8L5+5+3kY5pxHS/iUBQjknUnAk6HaBOfZltlh4nqUmkVMIjVSsu/Bhjy
	Tpu7fGrKTKDgTPsuV0Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utTXP-00000000rWp-0Ca0;
	Tue, 02 Sep 2025 16:07:15 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPx4-0000000HAUO-3QPO
	for opensbi@lists.infradead.org;
	Tue, 02 Sep 2025 12:17:32 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7725de6b57dso2077617b3a.0
        for <opensbi@lists.infradead.org>; Tue, 02 Sep 2025 05:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1756815449; x=1757420249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P6f15dqa3EmcxXSGJDJE4slrgiBoEfoIevBsC9MwWk0=;
        b=BLUStKx7O26frpOrTyI/7yV1EXiccvu4z9VZU5VLG0Q2OUY9nDldvrIzjTW3vjbvuG
         fbzL5lAOKe9WWuJjyHBNTbFssLMELDIFpQH+j2oX2YTXH3Zg4LqAPln1AWCWbm+rGoZ0
         7oOmY3/NQjZ1u04iZT/MTbwn+21MgT8XivM8vDC+4fRvBY0I4o4BcaJCdjW6Lv+sQbVe
         DHdAUjNGYT+gTyPdqqziCCwhibp9IR3UkVVaL/y5cN4oe1qbb6AmQTh+35NKiBB7JwPM
         IoENtd2kfbfSWCurZdpYpdugcmLr0AoGFLtyoJjqB8p5Ro7jbmPa0noKpjfHE9wwZmHP
         W07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756815449; x=1757420249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P6f15dqa3EmcxXSGJDJE4slrgiBoEfoIevBsC9MwWk0=;
        b=TJAxU4K2X8hBwr0CDaz20Ae5TX2Ji6ANWsadB8uRyaeTwWv0+YGSkI6zLTJySxeFUW
         qkEn7kUWyonemw2PyrYQHfLnU5+RIhdV0ISw7spzyaiAHPFDrsh+HHhFMNE4bhXfyrJp
         Zo5a8epbwizBSSGXQmB+9EHN0CfVlLYWlfveQwktfOQUGWvWrxLKM5BBc4cQpvLJAR4j
         Gz2hAUoW9Pn2aoU1P6o7l8fyGfmprNHcXTN5T+qNYcfoKlp4iqIiZ9gJ0aB5HH7Z5SpI
         ppQEjLkpYf5zCQx+eMSo/lYK3B8x55rQRQxn/wYM7Pnjw2mSsXYBxa0n2ZvhFKQm8lOH
         3PIw==
X-Forwarded-Encrypted: i=1; AJvYcCWzZ/7Ox1qDM4azUy2Dl2rvsjO/Y20k8jdjh6MnfeoQU2U/uVyl+qHB5aTsypCgae+/UGAid8rA@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1wXBNqo7C4ktUBMOoq1bkbAi7vlGZlmfNhyYgxxmFJbYr2Hrf
	oGoh/IFf9+rc7jwU4kQEwlaEdWUvNi+V/Z02+YKVU8+HM67CfKPIu+IP8q6q678hBLQ=
X-Gm-Gg: ASbGncss/hNZku8Y2H0gtZqzgnQQ1YpmYjx86V0ytcJF8/RHR0ka1AouDQIkrfY7y07
	LZyxzEbjnFJrvagbfnZLMyKZBvJYhcaRLIdfefSp/bVbkIrJ0WiSe2y0raq81ck80/XqK8CYj/t
	eMXE6BR9r/cXWGcrdYddp85T3Iyvry/19lETZojDn5YjRWEb4jqSI/Rka/aBKb0eXjUvGcm/Itx
	jse7A/72ZB5cISInKea2cOM0ksMVJC/P/c7G4V/063nrrB83Yo444l3uk1HndvFLHEa8ys19jf0
	5xz1V5X7UuMFSsKygc/joYx+dcllq7dhXB72SRUmBYdUY2JOwIwawNdryedoHgR4Akvat3p7ko/
	keaiNGYaYS334C8LDsF1cwHqK3OLDWq0+zsTQNK9y4ndhc2ezb8aSyo3ru3T0LBmGbx7Lf/Rq
X-Google-Smtp-Source: AGHT+IHyAcRdUWwq2ZXMCIUTY7BFrSnwnVhP7b5hJLtnFqNz72wf1kqZ2SeL40AqhuD5KC1Ww7Nc8A==
X-Received: by 2002:a17:902:f608:b0:24a:9ffc:6c22 with SMTP id d9443c01a7336-24a9ffc6d0bmr130146475ad.7.1756815449297;
        Tue, 02 Sep 2025 05:17:29 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327da8e713dsm14265834a91.17.2025.09.02.05.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 05:17:28 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/3] OpenSBI IPI device rating
Date: Tue,  2 Sep 2025 17:47:18 +0530
Message-ID: <20250902121721.401933-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_051730_853546_7ACEF90A 
X-CRM114-Status: UNSURE (   9.35  )
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

These patches can also found in sbi_ipi_rating_v1 branch at:
https://github.com/avpatel/opensbi.git

Anup Patel (3):
  lib: sbi: Introduce IPI device rating
  include: sbi: Remove platform specific IPI init
  lib: utils/ipi: Convert IPI drivers as early drivers

 include/sbi/sbi_ipi.h                    |  6 ++++-
 include/sbi/sbi_platform.h               | 17 ------------
 include/sbi_utils/ipi/fdt_ipi.h          | 26 -------------------
 lib/sbi/sbi_init.c                       |  2 +-
 lib/sbi/sbi_ipi.c                        | 33 ++++++++++++++----------
 lib/utils/ipi/aclint_mswi.c              |  1 +
 lib/utils/ipi/andes_plicsw.c             |  1 +
 lib/utils/ipi/fdt_ipi.c                  | 22 ----------------
 lib/utils/ipi/fdt_ipi_drivers.carray     |  3 ---
 lib/utils/ipi/fdt_ipi_mswi.c             |  2 +-
 lib/utils/ipi/fdt_ipi_plicsw.c           |  2 +-
 lib/utils/ipi/objects.mk                 |  7 ++---
 lib/utils/irqchip/imsic.c                |  1 +
 platform/fpga/ariane/platform.c          | 15 +++++------
 platform/generic/openhwgroup/openpiton.c | 13 +++-------
 platform/generic/platform.c              |  2 --
 platform/kendryte/k210/platform.c        | 13 +++++-----
 platform/nuclei/ux600/platform.c         | 11 ++++----
 platform/template/platform.c             | 16 +++++-------
 19 files changed, 60 insertions(+), 133 deletions(-)
 delete mode 100644 include/sbi_utils/ipi/fdt_ipi.h
 delete mode 100644 lib/utils/ipi/fdt_ipi.c
 delete mode 100644 lib/utils/ipi/fdt_ipi_drivers.carray

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
