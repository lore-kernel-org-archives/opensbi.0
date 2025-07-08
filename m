Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD99DC83F10
	for <opensbi@archiver.kernel.org>; Tue,  8 Jul 2025 07:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ioFkHVfFI+DOtuxEi+l3s7/wzZvJI7Hxxdda8KPIylA=; b=d9w
	PCBQJmvWFF5kzpqhn0AAWLNeSHrxkbedqt8wY+NbXbCe+LNkJWcgQt4v6pcpN5zw/aDg7NFse/Rta
	0A236XZ2MmxUa8i+DSt5ihl5L04fvihX7oE9Kd1JuK31uHWPspB5VAFlZj+GtrkJN3GmU9CxFW4MC
	fj01aBkvGI8a+06WWdS8xJmdGTLfIgXTyh4QXk/U4ny22ymUvZjP5rdmU8k8pHwm4F81XvC5t4+JU
	jxSzILUt3c7eCV2RFgFOmhSy2jbtMI5OYOa50xVlBoJVOchmaWtMuPDD7qbXtXzOulG4snM6mdIbc
	/TImBABsv8PsCyTyiTpGtbTx8HspvPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3CF-00000004eoy-0ojV;
	Tue, 08 Jul 2025 07:56:59 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ35P-00000004dHG-2nb2
	for opensbi@lists.infradead.org;
	Tue, 08 Jul 2025 07:49:57 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6facacf521eso43508666d6.3
        for <opensbi@lists.infradead.org>; Tue, 08 Jul 2025 00:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1751960994; x=1752565794; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BAF2eNStoSVJNPocnNYOfz3u0kI+EQ9EUeZaskiNp5w=;
        b=SNzJzFFckwnmm+atpvZHb1V+GAE65E71qbDm2uPNwlaVUQp7B9RohvUc3dW7smbpTD
         mHU58qg85O5lDlrwW4HO6786JZnSuiCeLV81VUKCGgQ12JL3WYwpbRsaLKQigJQ+Nu3g
         uORWIjHUBScmXxiTRULMjm81fhKmiFNQiALC6tfJqYNuAuEtVOsRZ8W6UhP7N0ghtje0
         slRUBDZyn9mXeCW5zK+8lmY1M7LKgEIG2bx7IosL1tpzJSWqmrFrLvURJe9EsaBor0eV
         bknI2lu8VOfLtgXS3qWESkmespiuUOXIAl91PPLW1RbQbCCrZdthwoyo7AIfLX3ToUFt
         cHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751960994; x=1752565794;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAF2eNStoSVJNPocnNYOfz3u0kI+EQ9EUeZaskiNp5w=;
        b=X++eNZ6jOCx3IHx790S2NKFCNUnbIZMq2VixJkuEDv93m20k0jtw3Ylq31eKyHBsyt
         WccnnHFXLXAI9CccvvapUEEgvvSE+0NqIp0CTYi8ixj3gVcOTBDdA/RSK5kXaIg9htsf
         sfejHGAqJOKAIZbvPB1XFXiBlUxIhE1FhzHEzSswED/ilgRP4rIqHAL4Kj3t4JHb4oDR
         u5UMuGmM1NV4CoCpKCodSZvBqtHjV0SAKZtaNSoJlZwLkY9P2C10J13XyBRCbQ+zPmN5
         SeoQSkCLCBByEL2o6rXKOd0KtRku/robegnFExR00bPbk8ulvjcMx4dYT/hLZS2a+3ic
         CabQ==
X-Gm-Message-State: AOJu0YxoOzhAvvDh1MW5OUMvm6nvGgmn4Tqge+UNNbBq6cBJA/x74npl
	WNf8yot2e3H40mt2KRYW6eDStHb6lfutScKzQKUw38sYhLV4mUGQJgspBo5m7PjpjokXc/D6go1
	7X0zCzan4W5822uK6sbI4Lqcv4r+d+lWP4DoSoTuMB90dWWLayAvJlruKg9kBAuHHVm6p7Aas8i
	pWicFxmebJlddZEw6cGzDrEVApHpz51rRcHySQjN1bIQKYFg==
X-Gm-Gg: ASbGncsWcDqvcEOU/kFHfcZ/dffFRu7CpRgjMKDBcnZmBP2K95j7Y8gJ7eor7WjOm0A
	GHIE3yQF4B0c6btV3rb2ldqHtJCVqxehRwogEP7WWltM+ajkwVVFv/g7hlSnXm/CoN8kf2gJ1AP
	vpi/Q7yRWPk2RSyZnByLk8wTeyjoSZ658YqnIIyGXU6IJVDJ1KcrE5GfPOiTpwSa53fjghxk404
	75PvlGwaqT3mw5O9JdhEdNyCGXluUgTC/uR3oc4Kt8Sw64eTY9mVMbeYGE8dUI50U6mLprOZKn+
	flXWgeWYob0FiWt0vcv1hHG+YrCbxEZCyL3keTIsbs9McffzBaYrVYmgJQ/jEmT2RDxeriufGHg
	VJMQPv5lj
X-Google-Smtp-Source: AGHT+IGx7Ho7LDM8Isl27HLuE81/hxcqev/shZkATEIzsKpFyStkEpt7GsDwdQZiAZgQLNxKrDTnQg==
X-Received: by 2002:ad4:5ce8:0:b0:701:775:70c9 with SMTP id 6a1803df08f44-7047db20954mr25974416d6.41.1751960993741;
        Tue, 08 Jul 2025 00:49:53 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a94dsm72382876d6.82.2025.07.08.00.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 00:49:53 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH v3 00/12] Add SiFive TMC0 and SMC0 driver
Date: Tue,  8 Jul 2025 15:49:28 +0800
Message-Id: <20250708074940.10904-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_004955_747321_8F3F3995 
X-CRM114-Status: GOOD (  12.83  )
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

The previous version can be found in [1].

SiFive TMC0 and SMC0 are the power controllers that controls the Tile and
CoreComplex power domain. Add the drivers to support the power
management features such as HSM STOP and System Suspend.

Some features, such as power management, may require flushing the entire
cache before entering a non-retention power state. To support this, a
simple cache framework is introduced to allow the external CMO to
perform a full cache flush.

Changes in v3:
- Add the SiFive TMC and SMC driver

Changes in v2:
- Since the platform override hooks was deprecated, use the fdt_driver
for initializing the sifive_dev_platform.

Links:
- [1] https://lore.kernel.org/opensbi/20250424034003.28522-1-nick.hu@sifive.com/

Nick Hu (10):
  lib: utils: Add cache flush library
  lib: utils: Add FDT cache library
  lib: utils/cache: Add fdt cmo helpers
  lib: sbi: Add SiFive proprietary xsfcflushdlone
  lib: sbi: Add SiFive proprietary xsfcease
  lib: utils/ipi: Exposing the ACLINT IPI device
  lib: utils/irqchip: Add APLIC restore function
  platform: sifive: Add SiFive TMC0 driver
  lib: utils/timer: Expose timer update function
  platform: sifive: Add SiFive SMC0 driver

Vincent Chen (2):
  utils: cache: Add SiFive ccache controller
  platform: generic: Add SiFive development platform

 include/sbi/sbi_hart.h                        |   4 +
 include/sbi_utils/cache/cache.h               |  69 +++
 include/sbi_utils/cache/fdt_cache.h           |  34 ++
 include/sbi_utils/cache/fdt_cmo_helper.h      |  34 ++
 include/sbi_utils/ipi/aclint_mswi.h           |   1 +
 include/sbi_utils/irqchip/aplic.h             |   3 +
 include/sbi_utils/timer/aclint_mtimer.h       |   5 +
 lib/sbi/sbi_hart.c                            |   2 +
 lib/utils/Kconfig                             |   2 +
 lib/utils/cache/Kconfig                       |  23 +
 lib/utils/cache/cache.c                       |  46 ++
 lib/utils/cache/fdt_cache.c                   |  87 ++++
 lib/utils/cache/fdt_cache_drivers.carray      |   3 +
 lib/utils/cache/fdt_cmo_helper.c              | 112 +++++
 lib/utils/cache/fdt_sifive_ccache.c           | 175 +++++++
 lib/utils/cache/objects.mk                    |  14 +
 lib/utils/ipi/aclint_mswi.c                   |   5 +
 lib/utils/irqchip/aplic.c                     | 160 +++---
 lib/utils/timer/aclint_mtimer.c               |  28 +-
 platform/generic/Kconfig                      |   8 +
 platform/generic/configs/defconfig            |   3 +
 platform/generic/include/sifive/sifive_inst.h |  20 +
 platform/generic/include/sifive/sifive_smc0.h |  13 +
 platform/generic/include/sifive/sifive_tmc0.h |  15 +
 platform/generic/sifive/Kconfig               |  10 +
 platform/generic/sifive/objects.mk            |   7 +
 .../pmdomain/fdt_pmdomain_sifive_smc0.c       | 322 ++++++++++++
 .../pmdomain/fdt_pmdomain_sifive_tmc0.c       | 459 ++++++++++++++++++
 platform/generic/sifive/sifive_dev_platform.c |  62 +++
 29 files changed, 1652 insertions(+), 74 deletions(-)
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
 create mode 100644 platform/generic/include/sifive/sifive_inst.h
 create mode 100644 platform/generic/include/sifive/sifive_smc0.h
 create mode 100644 platform/generic/include/sifive/sifive_tmc0.h
 create mode 100644 platform/generic/sifive/Kconfig
 create mode 100644 platform/generic/sifive/pmdomain/fdt_pmdomain_sifive_smc0.c
 create mode 100644 platform/generic/sifive/pmdomain/fdt_pmdomain_sifive_tmc0.c
 create mode 100644 platform/generic/sifive/sifive_dev_platform.c

-- 
2.17.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
