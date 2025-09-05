Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD394CA1017
	for <opensbi@archiver.kernel.org>; Fri,  5 Sep 2025 02:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:Message-Id:Date:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qzZj0tuHuKgmDdMEBkQ4KKin97r6nSBGL4dO00VCwSU=; b=BCxOJ7v6Zb4nDz
	1EbqpFFHrgYOgVZykboi7oALoJONhlq3RMuUepkVP/EvbxF1NHQRIs/Hf+vgb3itiVmhp02RctF5y
	pBpMEFXGmdHI1JAXYUHX7Xyi2RdTGTEeDx/jpe6Gg3dlGais9XpF7Ud0vaTT4gmWW6RsfpBDKvs8p
	fGI6NQnQgYvkz0mfcKq3AnA/AXSFw6DlWD9ZXn6B9ruVmCblQlyXYt3Pwyy3MrLCXyGxkwuoWAqKt
	eiYnGL6qnVTS2QNXAt0NbMHq3fEGBXrFYVg4OFLJ598Nxe6EMxmXO5Mxe1lnGpzvXUHJgqbVd2x0D
	2MVQtozjceyRfhn00LoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM7f-0000000G7fH-3zJs;
	Fri, 05 Sep 2025 02:24:19 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM08-0000000FxbF-028A
	for opensbi@lists.infradead.org;
	Fri, 05 Sep 2025 02:16:33 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b52047b3f19so470221a12.2
        for <opensbi@lists.infradead.org>; Thu, 04 Sep 2025 19:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1757038591; x=1757643391; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1chWC94EUwctqt6xB9XDZfVNUdmKa8Y6tA8RuUq6LHE=;
        b=HK4wv38V1s74I6wlgtF1UN841Kdh59sj9ATi9o5xbs6Ml4SJq1DkRJKH0FFRE6SLVq
         m7Bg6Q8glR2jWuBjbIhcXdfSQpq4XEhC6i7Ax4lOJPV9k9fItVqtHo0w2NyccDj5rYf8
         WQrEgBVFCVihcUQpC0pnaoR49F08ly7W24lBQAEuVwHFqiUMTReXDLKpBXOEBy4EfSzx
         4C1Hpalyggs1U9imp1KOy/S0pEUdKN8w6106IGasYogX6PrD6pucdisIgVoIjmlQ6km1
         8cgeds/VLzylEz6xqipeNPIqDp0lr7h07RES8ZB/BgFYgjkhsx/8Yc9qXVr5LgvJBHQ3
         4xjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757038591; x=1757643391;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1chWC94EUwctqt6xB9XDZfVNUdmKa8Y6tA8RuUq6LHE=;
        b=g+0boizRrchrOfX1bFzp+4ssMIrEEXT5gTo3oKykCLZEsCd5pauVmY3j03EKshLoHU
         j84ub5mApBq94LEMfQ7RFVEvI7Er7meOreS/oondIfh61I0T6Pv59AUOFCfJvQEJ2/VU
         /jxTKFg/bf/LpoH9HsmGA0ZJAHaVpFcRDV2CkWK7ti9eWA+HJpaqa9ewY4k0HxF048GZ
         9Nw7MIM3ad2wQQQdGoEI6BPtPLSrDFdkQta0MG86r11HRPkBgnWKnQYZl3y+KSIZL5Ly
         YQ2oRbZf0Lxrn5PEJLDOIqH+AgHwLjJlaUipMU2iVO8E5u7hSJfL/61ky5OU3W/aIr5U
         6rQw==
X-Gm-Message-State: AOJu0YzAuwukdi6X5g4BCju30Pa56AifM+OD2nEPVJ3I4wijlnftGFjb
	Cj9N+tAI43mcbZg3yjFqiH+7ScNakuO5WODZm51T3QR56PTt3LAWcOPc7GURHNdfjgI=
X-Gm-Gg: ASbGnculxALQRMi+4033y1Xc+sw8ok//Ynya04RkNklKWwaCZm0H5HcuCt7PPGt7Lw4
	KKRG2cAA8ylMC1JJrZWqMEmA5BHd1SPFVsnuHR8e/AADwTCWRS+sZNUWEL2EtDjCe3HUf0DT9lt
	+oOmz/UM46LMfqWxMsXj/AmefHJsa9yVCKPx6zu3B49koq+mSSsm7RUMXdzdJCSMpkHDWluGl/C
	HJ38/tuexrqhyRDqqnfXUMCrfA4HAGH5hRpXJA3/nLn7qSyUNUtS0L8IOCLg8D5WIUYfdnczT4H
	eTYUazHG0VT2EkUvjqmLFUgSB+CzKAzEwxfjfw+OCZ2F/HYZfZW7UDQtUlQuUoOZo7qQHhZPjU5
	F0gGLgWvsuS1r/+1RmZELjozXXNkZ8zg=
X-Google-Smtp-Source: AGHT+IFJlPa1fYKQF1h8wWChzFyMSXVE+5v9pQR6G/aA1DgohXAat8p+FqAGVH1Nx5Wot5LKM/t28A==
X-Received: by 2002:a17:90b:4b12:b0:32b:9d3c:13b3 with SMTP id 98e67ed59e1d1-32b9d3c1627mr4619418a91.18.1757038590736;
        Thu, 04 Sep 2025 19:16:30 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329cb6a2ec2sm11048953a91.21.2025.09.04.19.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 19:16:30 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Subject: [PATCH v6 00/11] Add SiFive TMC0 and SMC0 driver
Date: Fri, 05 Sep 2025 10:24:33 +0800
Message-Id: <20250905-cache-upstream-v6-0-6a6da629c961@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOJJumgC/12Py2rDMBBFf8VoXRk9rIdNKfmPksVEHtWi8aOSb
 FpC/r2y00Xobi7MPZx7IwljwES66kYibiGFeSpBv1TEDTB9IA19yUQwoZgVLXXgBqTrknJEGGk
 rjWRWWuCgSSktEX34PoDv55J9nEeah/L7jGFMynLUqmkop1Nwn/WwnlLwYcPazeNOGkLKc/w5z
 Da18x7tlon/EpuijILXDJg2vjHwjDrfH1oRv9YyLz/cyIgpwTGvq17/wA1TouG7lrbcFjNYIOP
 1tOGUYYIxuDjvzLfd7wIJaQljyF3Fvb/0TEvX9CCU8Kp1ThmGShqQzlrBsdetNsXm/gtlhnadd
 AEAAA==
X-Change-ID: 20250829-cache-upstream-93730838a1a6
To: opensbi@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_191632_069656_6C621B26 
X-CRM114-Status: GOOD (  15.33  )
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
Changes in v6:
- Rename the aplic_restore() to aplic_reinit_all()
- Remove fdt_hsm_sifive_tmc0_cold_init() from TMC0 header file
- Remove the sifive_dev_platform.c
- Add a dummy inline flavor of fdt_cmo_init() for the case where CONFIG_FDT_CACHE is disabled
- Link to v5: https://lore.kernel.org/r/20250902-cache-upstream-v5-0-af60a067f47a@sifive.com

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
 include/sbi_utils/cache/fdt_cmo_helper.h           |  40 ++
 include/sbi_utils/hsm/fdt_hsm_sifive_inst.h        |  20 +
 include/sbi_utils/hsm/fdt_hsm_sifive_tmc0.h        |  14 +
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
 platform/generic/configs/defconfig                 |   4 +
 platform/generic/platform.c                        |   3 +-
 30 files changed, 1540 insertions(+), 75 deletions(-)
---
base-commit: 1ffbd063c4da252f59cc570e537a3c8821ed6967
change-id: 20250829-cache-upstream-93730838a1a6
prerequisite-message-id: <20250904052410.546818-1-apatel@ventanamicro.com>
prerequisite-patch-id: 32105a5311c0318d3142ef94171e3eebc97e46bf
prerequisite-patch-id: 977e729132da2347796423fbb01ffe8ac016c192
prerequisite-patch-id: aad5e5f724eb0873af11780a85607285adec7eb9

Best regards,
-- 
Nick Hu <nick.hu@sifive.com>


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
