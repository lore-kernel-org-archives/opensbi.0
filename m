Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48717CCD1A2
	for <opensbi@archiver.kernel.org>; Mon, 20 Oct 2025 06:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9LX/MIlzaJooygdL7Y8h12mvxcE1HmnaqrHzL2MWPLA=; b=bW1Ty+Vx6Jgwv4
	Cz1s6oH6b9elF1xB0v13hU1pGp88TCzZrbCnjfoPcsDN4a+Nh1r5OCasgo5vIyYwBPnGzFaJUIbm0
	54Tq3bEb3SuH6LSowS5OaXQeSw2WOd94ZOa62dbLczSaVvKVkGlgwaCmgMi3YAKXWaO080iJTZ3fF
	RUYa8VIb0hOAYTcjGk1pl8+JAQ1OXOW8qBSZcD0ni74O0kF1NnMRVXG94SttC/T2bzcYqyD8ksByP
	H69zjG+wY98EMnW6viWBu7y4+aDqwVJEVdwcELQ6bAfv7EnlXrbnVNSyu+8KTnuZn4+Trly8TT252
	paUMUS8KHST16liHYO/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjM4-0000000C1sK-3B2c;
	Mon, 20 Oct 2025 06:26:52 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjM2-0000000C1rK-07pc
	for opensbi@lists.infradead.org;
	Mon, 20 Oct 2025 06:26:51 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-78f3bfe3f69so3458162b3a.2
        for <opensbi@lists.infradead.org>; Sun, 19 Oct 2025 23:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760941609; x=1761546409; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YGhDt7UbM5TqXpxW2KcPnlhsIPA1CCIjfAjawpID7gE=;
        b=cqikWLjQphnafG/N5sHzASdap8gfc03KOCVCXDKlNPOiFt/ImU/vYREyEM+LLBDi8y
         7ZEmUKT6SzJUQOXIM+eGRBUUEJnP9sWaahwLhCRPp0gpvGUcvPMyWaukIF/wpPHDTo1V
         4YhbxkcNKfTaGtq1hYdpO+7O4R/HRHmocYTrUssbLjybvx4Al3zMHtjD6wYL+b1NCDpT
         oUBDtsh4VcPHPFbKydSwdOZrGSzV4ruyXvP62aaGhafSI4XCVuS6WIe9AkyOnY/aku04
         grTjasfyKXhXKhR77ng31PoO7JfEkE6fZbXZg1bbVxKCFGPOnmtTA3tHIwf3L+7jWg6n
         t4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760941609; x=1761546409;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGhDt7UbM5TqXpxW2KcPnlhsIPA1CCIjfAjawpID7gE=;
        b=O01A39FiuEYt+oNot8vgVlGdb6xtJDMJYd/C3Kra4DNFAIfNbCQaBGQ5oOh+OoACRo
         xuf31yxYcRTxkxHGka/QpO5UiY+Agjono3GtaJ8GuKmKhNNCofcys7KJDLzjOIm33H8N
         tVVi0P9OxJBGIRU9AYGfafb4qBldQupkPaRx22J2J/BD1jc+LqDzuRLzPfZF6PMDSF7a
         ADPKlbaeNQ8crS6sIyQeJKxeG9oW3SQ6MKnjSJEj6qspPQVKxn4wqMUCckRT4hEhPBJ0
         +ruhGT/KO6jpycXeIvOL3fDCmQ8BkNrze+W9HUCOiK6yU9nE3c+H0W2rmWPUAUQDQks/
         YW6Q==
X-Gm-Message-State: AOJu0YwmIb20oT5tN88bEMPiEAbyk39cAJIRKkUwKNVrd6Wr+4nYAcb9
	/3VYwirzTYu5QUa9/cKw1omQiLQsW4oiaCd2nglpnYyBshR8GEYTWSy0uYA9tq6Myjzsk3uyw1r
	925A4
X-Gm-Gg: ASbGncu3HzUzNXMRKwQMYf8fFsVxcdrFhqwWFT1VZVhZGVCNwbudsiGVcO7LinCGKsO
	nep4oPGXg8I16sbS4lamkmYRneTjaYGffBeoMNabHnJMgXzd5XprDxKVKSJP94e/Qe2vGjI47sB
	6So7t6nEpib1Chh3axcMb/jJ15W2iC5pRWKbISiLT08QU4lmY4khSCrry2XjnlqAxUBEdR9n/nX
	Dk1lcNTgmGvYF/FUQm2Pkl9rqPASBOZYr/3Zy1gNNwERl3yMQhai9QDinloewe//CIZNba1zTSB
	uSC6cAJRF2kj4u1kZAvNtDgF3EaPQwdCN4UYPZ0h2rkf1WuVaQ2drij2btaeA9mOyoWzwSchIYA
	QS8QxkA9Tk0if4GTsGk5Xo7MhVNp062tBBSHyMkkXKCYiiRnwlaU6KnssEtTn9t3U6VrSqbl+Y+
	OouHg70w/6
X-Google-Smtp-Source: AGHT+IEroPtcLMyrt5ui2n+ISftXLkT0Lzvhb/xKsqlzrI3Vh8gyN8ydkLPToDsFfqxLsHke3gJhuA==
X-Received: by 2002:a05:6a20:9392:b0:32b:5ec7:1408 with SMTP id adf61e73a8af0-334a8614204mr14678838637.48.1760941608790;
        Sun, 19 Oct 2025 23:26:48 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff349bcsm7301244b3a.17.2025.10.19.23.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:26:48 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Subject: [PATCH v7 00/12] Add SiFive TMC0 and SMC0 driver
Date: Mon, 20 Oct 2025 14:34:02 +0800
Message-Id: <20251020-cache-upstream-v7-0-69a132447d8a@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANrX9WgC/2WQwW6EIBCGX8VwLgZBBtlT36PpYcShkkbdBTRtN
 vvuxfVi29v8Gb4v/3BniWKgxC7VnUXaQgrLXIJ5qZgbcf4gHoaSmRRSi05a7tCNxNdrypFw4lY
 ZJTrVYYPACnSN5MPXU/j2XrKPy8TzWN6eNUIoVYZaty1v+BzcZz2uryn4sFHtlmk3jSHlJX4/m
 2169x20FfJviU1zwdGDQAHGtwbPqr3FBmde/+Oh8IAwIEjrLDS/+MdxVqTbWr4nH7exHhPxsp9
 CvlSkqNcWlQV0WlujSQ3Uk/NO96Zpm456kLLtiuzxAx8LcBhzAQAA
X-Change-ID: 20250829-cache-upstream-93730838a1a6
To: opensbi@lists.infradead.org
Cc: Nick Hu <nick.hu@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Vincent Chen <vincent.chen@sifive.com>, 
 Andy Chiu <andy.chiu@sifive.com>, Cyan Yang <cyan.yang@sifive.com>, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_232650_118679_39E111FF 
X-CRM114-Status: GOOD (  18.04  )
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

SiFive TMC0 and SMC0 are the power controllers that controls the Tile and
CoreComplex power domain. Add the drivers to support the power
management features such as HSM STOP and System Suspend.

Features such as power management may require flushing the entire
cache before entering a non-retention power state. To support this, a
simple cache flush framework is introduced to allow the external CMO
to perform a full cache flush.

---
Changes in v7:
- Update the change log of PATCH 9 and PATCH 12 because the TMC0 and SMC0 are moved to the
  lib/utils/hsm and lib/utils/suspend.
- Add new commit to Extend the sbi_ipi_raw_send() to use all available IPI device in
  PATCH 8 and use it in PATCH 9
- Add `system_resume` callback for system suspend
- Since the SMC0 driver need the `aplic_reinit_all()`, update the
  SMC0 Kconfig option to depend upon the APLIC Kconfig option
- Link to v6: https://lore.kernel.org/r/20250905-cache-upstream-v6-0-6a6da629c961@sifive.com

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
  lib: sbi: Extends sbi_ipi_raw_send() to use all available IPI devices
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
Nick Hu (11):
      lib: utils: Add cache flush library
      lib: utils: Add FDT cache library
      lib: utils/cache: Add fdt cmo helpers
      lib: sbi: Add SiFive proprietary xsfcflushdlone
      lib: sbi: Add SiFive proprietary xsfcease
      lib: utils/irqchip: Add APLIC restore function
      lib: sbi: Extends sbi_ipi_raw_send() to use all available IPI devices
      lib: utils/hsm: Add SiFive TMC0 driver
      lib: utils/timer: Expose timer update function
      lib: sbi: Add system_resume callback for restoring the system
      lib: utils/suspend: Add SiFive SMC0 driver

Vincent Chen (1):
      utils: cache: Add SiFive ccache controller

 include/sbi/sbi_hart.h                      |   4 +
 include/sbi/sbi_ipi.h                       |   2 +-
 include/sbi/sbi_system.h                    |   7 +
 include/sbi_utils/cache/cache.h             |  69 ++++++
 include/sbi_utils/cache/fdt_cache.h         |  34 +++
 include/sbi_utils/cache/fdt_cmo_helper.h    |  40 +++
 include/sbi_utils/hsm/fdt_hsm_sifive_inst.h |  20 ++
 include/sbi_utils/hsm/fdt_hsm_sifive_tmc0.h |  14 ++
 include/sbi_utils/irqchip/aplic.h           |   3 +
 include/sbi_utils/timer/aclint_mtimer.h     |   5 +
 lib/sbi/sbi_hart.c                          |   2 +
 lib/sbi/sbi_hsm.c                           |   7 +-
 lib/sbi/sbi_ipi.c                           |  16 +-
 lib/sbi/sbi_system.c                        |  17 ++
 lib/utils/Kconfig                           |   2 +
 lib/utils/cache/Kconfig                     |  23 ++
 lib/utils/cache/cache.c                     |  46 ++++
 lib/utils/cache/fdt_cache.c                 |  87 +++++++
 lib/utils/cache/fdt_cache_drivers.carray    |   3 +
 lib/utils/cache/fdt_cmo_helper.c            | 112 +++++++++
 lib/utils/cache/fdt_sifive_ccache.c         | 175 +++++++++++++
 lib/utils/cache/objects.mk                  |  14 ++
 lib/utils/hsm/Kconfig                       |   5 +
 lib/utils/hsm/fdt_hsm_sifive_tmc0.c         | 367 ++++++++++++++++++++++++++++
 lib/utils/hsm/objects.mk                    |   3 +
 lib/utils/irqchip/aplic.c                   | 164 +++++++------
 lib/utils/suspend/Kconfig                   |   4 +
 lib/utils/suspend/fdt_suspend_sifive_smc0.c | 318 ++++++++++++++++++++++++
 lib/utils/suspend/objects.mk                |   3 +
 lib/utils/timer/aclint_mtimer.c             |  28 ++-
 platform/generic/andes/ae350.c              |   2 +-
 platform/generic/configs/defconfig          |   4 +
 platform/generic/platform.c                 |   3 +-
 33 files changed, 1520 insertions(+), 83 deletions(-)
---
base-commit: e3eb59a396ac55975e3debecfc5b71418eb62248
change-id: 20250829-cache-upstream-93730838a1a6

Best regards,
-- 
Nick Hu <nick.hu@sifive.com>


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
