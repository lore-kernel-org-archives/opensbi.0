Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254C7CA0EE4
	for <opensbi@archiver.kernel.org>; Wed, 20 Aug 2025 03:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=avWTmTfOcGCBp0Fma6dwcyQoxT8cXyVz88NmYUkTgH4=; b=jRV
	DN4FUxKUu6W4RCJyAaDcNpy/1goKFrFTH7XOp4y4rQ7WiCmvjC/MbCQgJoRpCLxYrmTqeg4F9Hafg
	JH2q6ZdRn/i/tj4eOXcVbpe0lZrC/laWQZBJB3c5QjuEVpa5Hy69z/ExvteDLJwB/ipq4/wBiUBvn
	VQapsYG+2+wFobtFZ8VDFS7n9k4Ou6dYgQmCvf3+F9+9kZHfGtpBMBJOjpHbVWmT8KTs8ZmrXN8Uq
	8/I/JEOGfTMNP4UXb/7vZ3bwZT6xAnawWO5t2qpTqi6MCV51I6D0kQv2GPcgSVzlFHjf3f54URvw7
	UYA4QnTL92m46I77K7hviO3G9NIrVLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZbG-0000000CHO7-3hqC;
	Wed, 20 Aug 2025 03:34:58 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZZQ-0000000CHAd-18Pg
	for opensbi@lists.infradead.org;
	Wed, 20 Aug 2025 03:33:06 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-32326e7baa1so4826114a91.3
        for <opensbi@lists.infradead.org>; Tue, 19 Aug 2025 20:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755660783; x=1756265583; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znheqRhYklXINond/dO4U4a7VJq6PrAtUmU4niHII80=;
        b=AJEb0D7jvdLQD4jYh/fJq6DMmv6ofdvC9aIQ4GLkhedwpwNLdVyeQdE8NsG4vRDd9T
         0S1m1GLDCP9RvbafE9bIqM4jI/Oe0Va32nAWg/BrZYqiPqr9Ps8f8JJbWwV6FGnXTLCn
         /YQHJKpLMXl91Q5YhynM0EVGbGacuKX/kzkr/+SmTOdRhJAlaYe/z9/Uyj/Kck6f2+Y0
         aaD0y3pxGv7kCe/Pryb5mNl36MpNlsYwjsXcBxpMzmPYoZA4D+LWtHQKh92MrLzcYR5u
         Mt1QlbPIOnz5/o31xXFeveOM0i3rULn/3F91JKa1qvP+QUa45vYcSe4PIaCx9LsxXZ04
         gWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755660783; x=1756265583;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=znheqRhYklXINond/dO4U4a7VJq6PrAtUmU4niHII80=;
        b=ZbtxfkrtJJeQ/dHjFRBjVEawz7T82Tzauhamwj2hZKuqv+OFkWPZBRTYUedwAZwLTl
         gGJDkLJXE4osoFWfRbnz64oOXxbf/rCKhpWIQJM97ZQSnRY8GfxfyxLPHclqOpxk05nF
         LLzy8n1URe32QiLoOZpZB9h5InfdvNDIQL8ST1zcgX6MtAAdS64sxSEvbWvRgv8H9ixm
         Lmmo/CgsXS/42h5T60wICRQ1G4CHwpH5bCSE94D39Qa8bE8gZzUYW2pWjDAPTBWt5Dtf
         N0p2ibmrajPSBSUBUzc/FCi4UCSRCocW6H0G7uW0x3cHE+CttBFRswrZVaB9JOyKpjyZ
         wPMQ==
X-Gm-Message-State: AOJu0YzSg6irHMb0eW2SJogUOxBde17WZr3kwv6opm2DBly1+JCZhpBa
	rW/X4E0K12GU1FZ4zWApCbyI0e9M3yEswkz6zKFFhbSglf1XbUXGcUZ7VOeMZ9dYzD6px6FtczR
	SFTsWqKP+4BE3GQedJWUDLB5GEjaLCqS484/AW6xnGNx97h2XCqksN6P7leYorRUKAmczZoS3B5
	WcauJTnHt+0fZ+QGLXvVLF3FQdU9XgUZD/u1mp8kg1jorb8Q==
X-Gm-Gg: ASbGncvRjuQVJgpL0EMGn+2UWrBmWHnlP0S6m/3Pu66pHM0Wb9gA1ZwCGm0dNEbrMOr
	W2fL9JSzLQX4H3NCuBgQcxd+gn/7R7ecApftYupBwg94tdUgh7cEdTkbxOqE2xpkzTyfkXES60x
	nkZD9SY5cOUV5M41Vyg7JIySag9r3F56OMX5XtARkj9J3DrnfVRGinDxhMcd5DxOgKw0tDFo+96
	AaVtsVjyF1e2cUHjN7Dn8diNJS02tAo5EWEyj3Sn/N0W3k5eIycuZ4MKImRXxkoWAjpXzFhOomT
	ajQY8aRNYoXl3DaPW6X8wW/nEY3FsVu8AjfBNZtG5F1BCV+9hkAvBm7ygHGk71L+45AtWzFySRi
	2siIhUj0N+B6SEBu+c7rvkJcR969LvIIk6g1uhLk8d5wL
X-Google-Smtp-Source: AGHT+IG76BzBc7pO38ZVN5457deleiZu7v4Y4adbRLDMhJndXShiWJ1YbvJ80nezSfyjCud7BHFyog==
X-Received: by 2002:a17:90b:54c5:b0:31e:c62b:477b with SMTP id 98e67ed59e1d1-324e12d6ae6mr1691468a91.11.1755660782698;
        Tue, 19 Aug 2025 20:33:02 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e252ea41sm738430a91.9.2025.08.19.20.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 20:33:02 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH v4 00/11] Add SiFive TMC0 and SMC0 driver
Date: Wed, 20 Aug 2025 11:32:39 +0800
Message-Id: <20250820033250.544-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_203304_326152_4DD5EBB1 
X-CRM114-Status: GOOD (  11.93  )
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

SiFive TMC0 and SMC0 are the power controllers that controls the Tile and
CoreComplex power domain. Add the drivers to support the power
management features such as HSM STOP and System Suspend.

Features such as power management may require flushing the entire
cache before entering a non-retention power state. To support this, a
simple cache flush framework is introduced to allow the external CMO
to perform a full cache flush.

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
