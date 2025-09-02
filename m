Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97313CA100B
	for <opensbi@archiver.kernel.org>; Tue,  2 Sep 2025 03:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:Message-Id:Date:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nDLIkyav6EX0nDitwj69BOV/BQuhtOhv4l3Eqq/JJnM=; b=HoK0xgrrKzy8TI
	NzbzLjdSAKPosbJyu7X7mABsWtIbaRPNrdIpIIZYL9C41AQZaRZH7tryJZbQa6rexib4JCrmj4pWZ
	lJhgV0DCzEyRynRZ70tO668eH4Jm52S8rF/uIOPBtKJtKWmJH+va0epltPemUZAeDkv0pqloJWxSo
	LOmIjfHqoSImriCJDD782XKhh06fFzVuLnDfYtvzpPwM9b9KQqzlhMWyocuiQjnyJx9tpvGSuhA0t
	xQip2q0cIB3sucXg5juy6hoFhO8FzTl3r3XqxVFmsVooXs12XOAlugbbGR5QVp3BG+2xYlkZDlAwr
	d1Xa8+Ql5o4yuAYF0E8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utHeJ-0000000F1Q7-35tr;
	Tue, 02 Sep 2025 03:25:35 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utGbj-0000000EpW4-1Zi1
	for opensbi@lists.infradead.org;
	Tue, 02 Sep 2025 02:18:52 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so4729970b3a.0
        for <opensbi@lists.infradead.org>; Mon, 01 Sep 2025 19:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1756779530; x=1757384330; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pHW0+s3DRXJ3wygNQxI4Vlp+U6rw88DPl5blIKvSO3g=;
        b=UruaQgpRfpULidLEMTRGNLcK0GXfGQ8N5CfrJDnBDLvB+borefvITaU3Q5cYsVlqS5
         EoDBc4jA4XMI57K6NKR80IMvqZiGDgjCpmAK7J1d/3rOpRxO0EN0A5+CwUcMfpfpx71R
         xIbekqGN1D7UsgPHO6mN2krn9tXLVbWk262Gfnu+5XViYsqqqGUR+uvfVwHNyFa/cvTm
         QGCdJxtkJG/FMUjExeqAKQMArUAOyVixRba/7LU/3WAdferBrDBUAFCrXbK5o9qucxtW
         0Wx0BoFYqeCVRR5BnnMUaht2MyB8knq1U9sUev0iRjITkpZsrqUNcR2BuNNl3upyOPJ8
         V/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756779530; x=1757384330;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pHW0+s3DRXJ3wygNQxI4Vlp+U6rw88DPl5blIKvSO3g=;
        b=KcoPlIHiJGRQuN39kcuKtYjsr8uY7h7S1aYmxDe/DFRijrI4WPmT+OpicGQ1gNB/K1
         vJaipSDpfWZdDB4YP0S9vMgtjAUgnIwtEzhelGE0Digqiozd3v9r2c1JJGk6rGA+Et4K
         Ud1Cz37izKeWXAoSbDrFoltriR2h+uL8ewyhbCCSMeZ9H+JKJjXw0hoDYgpbXRgjLd0w
         Kc1Scl5RE1d+oqV+pDtJcw6u5XgzXauSL0vjLSBMkSqRV/PTSS2Gt2jQXZLA/1rlmp0D
         ceR8k/OTSSDSyuU/7F4lvkVpw+hRTwwviHjgtuCtjGbGDl48VxLt8jVCz/Xw+ha1vd85
         nEpQ==
X-Gm-Message-State: AOJu0Yx4fFFCDoi1MweoifLBQ8uaoWmjVQgpmU4pW3YjB/maMDpX3LTG
	J+xGvV1LjOPRw3pLGYrgq/2Ypmxji1+Oicu9HK5MqmIkJuQLspJPpJWEiSSwYwFvYczdHVrZwcM
	veAAT
X-Gm-Gg: ASbGncsqLVo9s5Hp00IL3iqw9U/FgKRF+XWpl9MdNsneR9DyMBoattL6zS7FnPIWxEj
	QGORXrxrkFjPQI50kYxtCmnDwoav2jQM/7doGaBFhxioNy/6WpRdSoQcEn7FF2/Rqn+il0JfwkL
	Btj2p1Zr7mByi4F3xWhDeux94jjKbTkAPSbif28r040o38jWFtxDWKCIOovOutZbDPjagwcv0yk
	mCg98zotUU6UsOxPi1hbU6nwFsCy2FlLeVD2hNEkbOdN2caDnoAbWIB6x59mQftyEzyYQEUzmdQ
	A4RXXQHe3Mad0wRngj9w6pYLlfnUuPyGcnK4ztXp2ck7Zamg9EFfD53Ynl9CV40cdL6inKQs833
	N2AZ392YRyRvwZIXhWaBm
X-Google-Smtp-Source: AGHT+IG/5x0XTkbjEnFxR4rRbMzVdz86/ivtC6te5W2hiRd/xDqzXvkY2rlg/+UC2ageXrMELoZ3Gg==
X-Received: by 2002:a17:902:d54f:b0:248:cd0b:342e with SMTP id d9443c01a7336-249448df05emr135950015ad.7.1756779530502;
        Mon, 01 Sep 2025 19:18:50 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903755851sm116316745ad.56.2025.09.01.19.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 19:18:50 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Subject: [PATCH v5 00/11] Add SiFive TMC0 and SMC0 driver
Date: Tue, 02 Sep 2025 10:24:39 +0800
Message-Id: <20250902-cache-upstream-v5-0-af60a067f47a@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGdVtmgC/02MQQ7CIBBFr9LM2iEUilJX3sO4IDjIxEAbaBuTp
 neXuHL3X/Lf26FSYapw7XYotHHlKTcwpw58dPlFyM/GoKQy0qoRvfORcJ3rUsglHPVFS6ut690
 ZmjQXCvz5Be+PxqFMCZfYvv8ZKbVuQ5hhwB4z+7eI661y4I2EnxIcxxdobKWrmgAAAA==
X-Change-ID: 20250829-cache-upstream-93730838a1a6
To: opensbi@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_191851_438233_CF437314 
X-CRM114-Status: GOOD (  13.80  )
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
Cc: Yong-Xuan Wang <yongxuan.wang@sifive.com>, Nick Hu <nick.hu@sifive.com>, Anup Patel <anup@brainfault.org>, Vincent Chen <vincent.chen@sifive.com>, Andy Chiu <andy.chiu@sifive.com>, Cyan Yang <cyan.yang@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

SiFive TMC0 and SMC0 are the power controllers that controls the Tile and
CoreComplex power domain. Add the drivers to support the power
management features such as HSM STOP and System Suspend.

Features such as power management may require flushing the entire
cache before entering a non-retention power state. To support this, a
simple cache flush framework is introduced to allow the external CMO
to perform a full cache flush.

---
Changes in v5:
- Put the SiFive TMC0 driver to the fdt_early_driver
- Fix the format of the comments in SiFive TMC0 driver

Changes in v4:
- Call fdt_cmo_init() directly as part of generic_early_init()
- Rename SBI_HART_EXT_XSF* to SBI_HART_EXT_XSIFIVE*
- Move the TMC0 driver to the lib/utils/hsm/
- Move the SMC0 driver to the lib/utils/suspend/

Changes in v3:
- Add the SiFive TMC and SMC driver

Changes in v2:
- Since the platform override hooks was deprecated, use the fdt_driver
for initializing the sifive_dev_platform.

---
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

Vincent Chen (1):
  utils: cache: Add SiFive ccache controller

 include/sbi/sbi_hart.h                        |   4 +
 include/sbi_utils/cache/cache.h               |  69 +++
 include/sbi_utils/cache/fdt_cache.h           |  34 ++
 include/sbi_utils/cache/fdt_cmo_helper.h      |  34 ++
 include/sbi_utils/hsm/fdt_hsm_sifive_inst.h   |  20 +
 include/sbi_utils/hsm/fdt_hsm_sifive_tmc0.h   |  19 +
 include/sbi_utils/ipi/aclint_mswi.h           |   1 +
 include/sbi_utils/irqchip/aplic.h             |   3 +
 .../suspend/fdt_suspend_sifive_smc0.h         |  18 +
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
 lib/utils/hsm/Kconfig                         |   5 +
 lib/utils/hsm/fdt_hsm_sifive_tmc0.c           | 468 ++++++++++++++++++
 lib/utils/hsm/objects.mk                      |   2 +
 lib/utils/ipi/aclint_mswi.c                   |   5 +
 lib/utils/irqchip/aplic.c                     | 160 +++---
 lib/utils/suspend/Kconfig                     |   4 +
 lib/utils/suspend/fdt_suspend_sifive_smc0.c   | 323 ++++++++++++
 lib/utils/suspend/objects.mk                  |   3 +
 lib/utils/timer/aclint_mtimer.c               |  28 +-
 platform/generic/Kconfig                      |   5 +
 platform/generic/configs/defconfig            |   5 +
 platform/generic/platform.c                   |   3 +-
 platform/generic/sifive/objects.mk            |   3 +
 platform/generic/sifive/sifive_dev_platform.c |  57 +++
 33 files changed, 1667 insertions(+), 75 deletions(-)
 create mode 100644 include/sbi_utils/cache/cache.h
 create mode 100644 include/sbi_utils/cache/fdt_cache.h
 create mode 100644 include/sbi_utils/cache/fdt_cmo_helper.h
 create mode 100644 include/sbi_utils/hsm/fdt_hsm_sifive_inst.h
 create mode 100644 include/sbi_utils/hsm/fdt_hsm_sifive_tmc0.h
 create mode 100644 include/sbi_utils/suspend/fdt_suspend_sifive_smc0.h
 create mode 100644 lib/utils/cache/Kconfig
 create mode 100644 lib/utils/cache/cache.c
 create mode 100644 lib/utils/cache/fdt_cache.c
 create mode 100644 lib/utils/cache/fdt_cache_drivers.carray
 create mode 100644 lib/utils/cache/fdt_cmo_helper.c
 create mode 100644 lib/utils/cache/fdt_sifive_ccache.c
 create mode 100644 lib/utils/cache/objects.mk
 create mode 100644 lib/utils/hsm/fdt_hsm_sifive_tmc0.c
 create mode 100644 lib/utils/suspend/fdt_suspend_sifive_smc0.c
 create mode 100644 platform/generic/sifive/sifive_dev_platform.c

--
2.17.1

--
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi

To: opensbi@lists.infradead.org

---
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

Vincent Chen (1):
      utils: cache: Add SiFive ccache controller

 include/sbi/sbi_hart.h                             |   4 +
 include/sbi_utils/cache/cache.h                    |  69 ++++
 include/sbi_utils/cache/fdt_cache.h                |  34 ++
 include/sbi_utils/cache/fdt_cmo_helper.h           |  34 ++
 include/sbi_utils/hsm/fdt_hsm_sifive_inst.h        |  20 +
 include/sbi_utils/hsm/fdt_hsm_sifive_tmc0.h        |  19 +
 include/sbi_utils/ipi/aclint_mswi.h                |   1 +
 include/sbi_utils/irqchip/aplic.h                  |   3 +
 .../sbi_utils/suspend/fdt_suspend_sifive_smc0.h    |  18 +
 include/sbi_utils/timer/aclint_mtimer.h            |   5 +
 lib/sbi/sbi_hart.c                                 |   2 +
 lib/utils/Kconfig                                  |   2 +
 lib/utils/cache/Kconfig                            |  23 ++
 lib/utils/cache/cache.c                            |  46 +++
 lib/utils/cache/fdt_cache.c                        |  87 +++++
 lib/utils/cache/fdt_cache_drivers.carray           |   3 +
 lib/utils/cache/fdt_cmo_helper.c                   | 112 ++++++
 lib/utils/cache/fdt_sifive_ccache.c                | 175 +++++++++
 lib/utils/cache/objects.mk                         |  14 +
 lib/utils/hsm/Kconfig                              |   5 +
 lib/utils/hsm/fdt_hsm_sifive_tmc0.c                | 405 +++++++++++++++++++++
 lib/utils/hsm/objects.mk                           |   3 +
 lib/utils/ipi/aclint_mswi.c                        |   5 +
 lib/utils/irqchip/aplic.c                          | 160 ++++----
 lib/utils/suspend/Kconfig                          |   4 +
 lib/utils/suspend/fdt_suspend_sifive_smc0.c        | 323 ++++++++++++++++
 lib/utils/suspend/objects.mk                       |   3 +
 lib/utils/timer/aclint_mtimer.c                    |  28 +-
 platform/generic/Kconfig                           |   5 +
 platform/generic/configs/defconfig                 |   5 +
 platform/generic/platform.c                        |   3 +-
 platform/generic/sifive/objects.mk                 |   3 +
 platform/generic/sifive/sifive_dev_platform.c      |  39 ++
 33 files changed, 1587 insertions(+), 75 deletions(-)
---
base-commit: 1ffbd063c4da252f59cc570e537a3c8821ed6967
change-id: 20250829-cache-upstream-93730838a1a6

Best regards,
-- 
Nick Hu <nick.hu@sifive.com>


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
