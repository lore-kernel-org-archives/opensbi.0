Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225CCC369D8
	for <opensbi@archiver.kernel.org>; Thu, 24 Apr 2025 03:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=rblGW072bFBD0Qa0liDRMhBVX7XBz1Kt2+tmRBMD0Fc=; b=jEr
	GQAWM+2G6Q8IjOjGNOEth7Zbf1KLHZH+cAhU8ez0GT6M5bamAYI6eHlGj1zEylQS0O+eOSb7N9Vn7
	6uRXgRwxevVdQ9iFLsB2ckpBSHm9/FTJXNtmzqCsapIjM93M7GvPObbFWgPYydGWwXqQtJluLR0RG
	g2qltRsYNvirAT1Dn9yfJadDpA1a8xHdMSJiu5v8oEnkaphVNB6tkucFsKi5MYhCZ/+24VVJJGMOf
	Gk/vFYAMupCCpbRyCBAhW80ifxdZDebkyiuK4JEyF0LNU7vrMbq8ByWVMo6tb5Nkd4d2W2gmnC8P/
	xjrsgWUdMkqXJHIBVEivrt93BA3Jb/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7nRk-0000000Ckc2-0Cfz;
	Thu, 24 Apr 2025 03:40:20 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7nRf-0000000Ckbh-45Og
	for opensbi@lists.infradead.org;
	Thu, 24 Apr 2025 03:40:17 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-224171d6826so7771675ad.3
        for <opensbi@lists.infradead.org>; Wed, 23 Apr 2025 20:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745466014; x=1746070814; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cOBW20xSZYy6mWMgfgJh+hzTIlMAol/h152ru7CWB4=;
        b=AJ4ViUARlIinMnxVUcE3/QEV8s84Z/vx5o9heeXfCbAOeRTHJ2xRIxbQ5q4YE6NzBW
         RfH1ANAt6RbBxogqQuzPhz54nwEZLc6QSM9iBaTW/+BC6w/0P+ltqM3urDV3tar7NYpp
         LJkMi+P4Qz0rkNHIS4yuRg+oXg+f8VHB0Qca4mZXlfsce6w9Ki1NALS5hJZ6Uk0bbt0E
         GAqldiuMhU/HQ2CdPycxED8DM5qyjjjdFOlr8Ua3bBipsYp9Nhnskp35DmV5jnDrjYGG
         nx7nvPk9+bFOLHV/6okJmbeGv09nXRH6TH0kn4xOmrsuNIeQn15Nf+6tXyi454qWJXf8
         HpDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745466014; x=1746070814;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cOBW20xSZYy6mWMgfgJh+hzTIlMAol/h152ru7CWB4=;
        b=tA+jisqRyMHpXmhUyD1Nl7Jzvuae0DtAkT1OMup59BnG9uxizQezNEigQ9JksVZqNW
         LoNx4+fRsX/NDHd5hv750PndPDEIN/9TCjbUlq1MGK0lnpGgCHqBT+iNGwxXotooQ/Mf
         JJ5wa7JTCgoHwuOhX9n0pUfuBqomCaU0VNdvO5zAmbJcaDkKKN7TUECspV8FLJcmll6A
         jpg1JA6X1t+VN/ZOWep8KAVZrv/srrMV+f5SwckA0o4knQ2xhi0GMcyzCgDuKGjMO7WC
         i7iX/nfalGrDxdcuvpgGVyhSFFgcALsWMblKjLUwlGmEPuwDf010RPZVX2Gp0k99CALS
         nl5g==
X-Gm-Message-State: AOJu0YxpFMape483ucgr1kDmU+gYiRtix496IQkp0DKlMHJ+YlafpcH9
	vWFBIMizRTbYqNDiWKAtEgaLbnqxCSI7MsfVwi/SucgQOB3ZMufTPLpzlAlWVDHyDijrhmRUSnN
	gOvZuZZELzoUGL1FqmoL5XMH4fAjNNndR1dYv2m2m4Jj6aMGUn6TjYk588cjIaSN5L1dRrDXOL+
	Wm77nfdl13tMKAlMatwV/c+ZGn/0RSeB295UWHe8G9OA==
X-Gm-Gg: ASbGnctF1oum/hv6pj/p9iJ0yqgDHg9tcg1VITIToQZs7e8orYAjkVfnOAUbnliRror
	hYWrxtIuPH3/DHbsv/jKI4HtD91oPfBTUzFIu/muYiBIbPmlwBQ75b+vFXwfUMUKMqUU3ei1W2h
	75OUXnjHYIGjMd9Ec4QHtKi3F+Z/DsglZGO02k+vUvg7oivQxLT74fxVZvbNwZIqX+WFQ8k8k8N
	CFMojqQSVzFilaghvdhUhEhvusbL+RnVWq7UCqzn6tfKDpxfiMPz0wOZ1JHa0oJvqUc+rcdUXCj
	lDMU4hGs1w6I2eAc0ohcqpCGrnSbM5D146/ZrTYRbt9R6VCRX+Noz3enRhqbeYOTK47CTWivpw=
	=
X-Google-Smtp-Source: AGHT+IHnQi5LLGYEAwXEfiKL92Zj4EmPFrr37qCZEK0vCzTyTshUVgMNP0rWvpoN0b5xcHpUyS33Mw==
X-Received: by 2002:a17:902:da8a:b0:224:191d:8a79 with SMTP id d9443c01a7336-22db3c0bf2amr13509375ad.27.1745466014085;
        Wed, 23 Apr 2025 20:40:14 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd5f2sm2632025ad.66.2025.04.23.20.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 20:40:13 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH v2 0/5] Support external CMO to flush entire cache
Date: Thu, 24 Apr 2025 11:39:58 +0800
Message-Id: <20250424034003.28522-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_204016_040316_1A463346 
X-CRM114-Status: UNSURE (   8.35  )
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
Cc: vincent.chen@sifive.com, anup@brainfault.org, Nick Hu <nick.hu@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Some features, such as power management, may require flushing the entire
cache before entering a non-retention power state. To support this, a
simple cache framework is introduced to allow the external CMO to
perform a full cache flush.

Changes in v2:
- Since the platform override hooks was deprecated, use the fdt_driver
for initializing the sifive_dev_platform.

Nick Hu (3):
  lib: utils: Add cache flush library
  lib: utils: Add FDT cache library
  lib: utils/cache: Add fdt cmo helpers

Vincent Chen (2):
  utils: cache: Add SiFive ccache controller
  platform: generic: Add SiFive development platform

 include/sbi_utils/cache/cache.h               |  69 +++++++
 include/sbi_utils/cache/fdt_cache.h           |  34 ++++
 include/sbi_utils/cache/fdt_cmo_helper.h      |  34 ++++
 lib/utils/Kconfig                             |   2 +
 lib/utils/cache/Kconfig                       |  23 +++
 lib/utils/cache/cache.c                       |  46 +++++
 lib/utils/cache/fdt_cache.c                   |  87 +++++++++
 lib/utils/cache/fdt_cache_drivers.carray      |   3 +
 lib/utils/cache/fdt_cmo_helper.c              | 112 +++++++++++
 lib/utils/cache/fdt_sifive_ccache.c           | 175 ++++++++++++++++++
 lib/utils/cache/objects.mk                    |  14 ++
 platform/generic/Kconfig                      |   5 +
 platform/generic/configs/defconfig            |   3 +
 platform/generic/sifive/objects.mk            |   3 +
 platform/generic/sifive/sifive_dev_platform.c |  42 +++++
 15 files changed, 652 insertions(+)
 create mode 100644 include/sbi_utils/cache/cache.h
 create mode 100644 include/sbi_utils/cache/fdt_cache.h
 create mode 100644 include/sbi_utils/cache/fdt_cmo_helper.h
 create mode 100644 lib/utils/cache/Kconfig
 create mode 100644 lib/utils/cache/cache.c
 create mode 100644 lib/utils/cache/fdt_cache.c
 create mode 100644 lib/utils/cache/fdt_cache_drivers.carray
 create mode 100644 lib/utils/cache/fdt_cmo_helper.c
 create mode 100644 lib/utils/cache/fdt_sifive_ccache.c
 create mode 100644 lib/utils/cache/objects.mk
 create mode 100644 platform/generic/sifive/sifive_dev_platform.c

-- 
2.17.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
