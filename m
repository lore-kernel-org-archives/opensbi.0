Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1330FCC6B2A
	for <opensbi@archiver.kernel.org>; Wed, 14 Oct 2026 11:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YZeBYfbeDA7/hGqLMpzlJUScUpjy7VFUEhqXoQBHg1I=; b=LkOBAGDYJQDCCb
	w4rnVWmIKgZclGgILDzjDS+Z2nP+1PDzVI5l62FsJJ0osrqtTulcipYhlpNvWXc7IEtUN8zxPGRdh
	T08aLvH10E/E5ak9s2r9lggR9hTaRI9VTaOi6O9tQ9K1/xp6A78PJ2ocyFGunSOZ+Im9zbDfsFJkL
	uXk9gO7Cwsj3xtMwyUo9QG1GV2Avuq2ub3ysLj2A++wPMIyVfj9cTL7L5Cw2Vdp3PcxTknqhYP8of
	9aBa3mFHcKJfRDoT6DjHlhYA1rOf0PWuQCjhrywKWPHpoNRzol6JfVmJ4I62ok2VrGj5GHAlyJXor
	p2OD5PXcxVgVzd7ZD36w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxCN-0000000FLN9-3BcU;
	Wed, 14 Oct 2026 11:31:07 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxCK-0000000FLL8-3eoL
	for opensbi@lists.infradead.org;
	Wed, 14 Oct 2026 11:31:06 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-156cbe59524so115477c88.1
        for <opensbi@lists.infradead.org>; Wed, 14 Oct 2026 04:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791977464; x=1792582264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XvgdDZms2GzC12lqvIdKTf7ybvD3bcY99TvlBGKo10c=;
        b=WLvlxIXDz3vfQFu/kWN/6HCPVWG1ACUpkQTnhLxIdQ1yS9YHu3+dHi8ftyyb+Hhz8x
         Fk3/gcAOLK1HJ/5Hh0YTQowT1BsqJnx0sPc6wVrS58jXnKApVpnf6jasQxIJTAHplhiB
         rrFXeE4ofup4p1EEfd9Zhn7Wu+G6HwtfzX191sq+3Yv9stFOytaX9DkqpgMIdJPDULxH
         Kc2Ol+zaW2dKiGXWVaiLFQdr0W1ZuciE9VQjv8gIv33C/JcXqVeaftbZADI8BydDw66B
         ee8BsXi6twkB3O363kmCeKs8bIuVThKRStNrhvzPYVR/779UsYJomg1RX+7rIWyvO88h
         4lxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977464; x=1792582264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XvgdDZms2GzC12lqvIdKTf7ybvD3bcY99TvlBGKo10c=;
        b=vjII9y7QCmdR1H67QKNBn19wxO/lEjctfggPzvp23wPes5NTybbPVr+cclXmpYe716
         +zLIKHTE/OCej6MM1H5GUEr1+KAae3vw2jYWCJq/amMzwlFne2i3xjTTSUKNL5f7sKsk
         x+QiW8Ln6OzBuojkRXDjvHtKqlja+9LGOYb6zFUrmKVEK3/A81oGv2J4EoCFweaXNQDK
         mMrmbygCn8nDiDG5snedHjS/8kA8+nUbdnij533+Qkz9rs3Nep2NudWC3r4MIMOcGISt
         /OCASDF5n9S+R0NWw0tmM2VWXjtbYl1OG5w4adhS9lqOSDg3f+QCns62Y7/U23Mit72n
         +bQQ==
X-Gm-Message-State: AFq9FYKgkcQ7BNeWCVZZL7S0nAQYleRD4dOtoANRduqvdnu6kp4i/5wr
	JYt2z4kZ4h1jK6tUXYTb+CVPaaHRVlUo9YUx8kMSzX6a8v8rp29se7nc/YJoAS+jFun0zNFfreJ
	II0Q1vkbbGVq34eVr6Jzpy4U1Yoq60GUsmNwiCF/8AgcfOA9XhN35NM/99gtrK5j417tXrCe3/q
	BcQ0h7iJg7LNDfTqvWxWJTEytDDhWlUxIrq3j8lS7geHEbop3/A+thNCU=
X-Gm-Gg: AYBFou2SNPjB5pmRD14E9yWbvy+t1u1uyiR+QXRBtTCwWPPZ8NZgJ3zrFXhuLtB+akv
	xAkPhymOIrvjBfi2mtaR8NARBN7E2ACYI0IGiQXpiPLz+1Bs3NjJ9M4XlUg+gk3KbcRJkf8Xbl7
	BboMleknrkuC2Kem/+bwEyIy3HxBjzwrzwnexVoFz3lerelAyWptAUzQ3gJwJkV2F1vuih/Ldsa
	olCQ0U4Llau6fuFyZZIJlrLwhO7JKxAgnumWO630R/OGa/XGtZV+jNatPwt4vUfses0eEqtQlBR
	+gGNwm95uSAlKdXkOVA2Zn/zvrtFpeqeZ7R39zeloVXjiXB3bL4fcYYHmHDRZUGPfi8o0+RwgeU
	V0WRJL1KfpRgKGMEsOUHLtx91hPj++x/6xcOPyKRmonFm/15KnlVzBaJyh1UCHynScxvaPJt88D
	WmN1jSLW94A3NvUbDf7JAJpqSxFieoC/juoh8UGuWLOwvV0fWcJYmuPFvOoXr6CJcAiqpsJXI9f
	ll2KTdEB/kONtKa9nOV
X-Received: by 2002:a05:701b:2810:b0:143:2701:9198 with SMTP id a92af1059eb24-16a610c9c0fmr20465876c88.36.1791977462547;
        Wed, 14 Oct 2026 04:31:02 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm71207996c88.18.2026.10.14.04.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:31:01 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: opensbi@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 0/7] Cache CPU information from the DT
Date: Wed, 14 Oct 2026 04:30:17 -0700
Message-ID: <20261014113100.2192229-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_043104_924138_4B1576FE 
X-CRM114-Status: GOOD (  14.67  )
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

It turns out that OpenSBI spends a lot of time repeatedly parsing the
FDT to get information about the CPUs and local interrupt controllers.
Caching this information can significantly speed up cold boot. For
example, on the HiFive Premier P550 board (4 cores, PLIC, CLINT),
applying this series decreased boot time by a third, from 6.35 ms to
4.23 ms (with SBI_SCRATCH_NO_BOOT_PRINTS set). The impact would be even
larger on systems with more cores.

The cache cannot be used everywhere:
 - fw_platform_init() or other functions called before fdt_cpu_init()
 - fixup functions or other functions called after fdt_get_address_rw()
but it covers all drivers that previously called fdt_parse_hart_id().

Changes in v3:
 - Uninline fdt_get_address() so sbi_domain.h is not included everywhere
 - Add a helper to indicate when cached FDT blob offsets are invalidated
 - Check fdt_cached_offsets_valid() before returning cached FDT offsets
 - Document that fdt_cpu_hartindex_to_offset() cannot be used in fixups
 - Move fdt_cpu_init() call to generic_extensions_init()
 - Do not use cached offsets in fdt_domain_fixup()
 - Also use the cache in CMO library and TMC0 driver
 - Also use the cache in irqchip_aplic_update_idc_map()
 - Also update platform/generic/openhwgroup/ariane.c

Changes in v2:
 - Rename for_each_hartindex() to sbi_for_each_hartindex()
 - Add missing include of fdt_cpu.h in fdt_helper.c

Samuel Holland (7):
  lib utils/fdt: Drop fdt_parse_max_enabled_hart_id()
  lib: utils: Include more headers directly
  lib: utils/fdt: Indicate when cached FDT blob offsets are valid
  lib: utils/fdt: Cache CPU information from the DT
  lib: utils/fdt: Used cached CPU DT information
  lib: utils: Use fdt_cpu_intc_phandle_to_hartindex()
  lib: utils: Use fdt_cpu_get_timebase_frequency()

 include/sbi_utils/fdt/fdt_cpu.h               |  60 +++++++
 include/sbi_utils/fdt/fdt_helper.h            |  35 ++--
 include/sbi_utils/irqchip/imsic.h             |   2 +-
 include/sbi_utils/serial/uart8250.h           |   1 +
 lib/utils/cache/fdt_cmo_helper.c              |  22 +--
 lib/utils/cache/fdt_sifive_ec.c               |   1 +
 lib/utils/cache/fdt_sifive_pl2.c              |   1 +
 lib/utils/cppc/fdt_cppc_rpmi.c                |   1 +
 lib/utils/fdt/fdt_cpu.c                       | 118 ++++++++++++++
 lib/utils/fdt/fdt_domain.c                    |  41 ++---
 lib/utils/fdt/fdt_helper.c                    | 151 +++++-------------
 lib/utils/fdt/objects.mk                      |   1 +
 lib/utils/hsm/fdt_hsm_andes_atcsmu.c          |   1 +
 lib/utils/hsm/fdt_hsm_sifive_tmc0.c           |  24 +--
 lib/utils/i2c/fdt_i2c_spacemit.c              |   1 +
 lib/utils/irqchip/fdt_irqchip_aplic.c         |  21 +--
 lib/utils/irqchip/fdt_irqchip_imsic.c         |  19 +--
 lib/utils/irqchip/fdt_irqchip_plic.c          |  21 +--
 lib/utils/irqchip/imsic.c                     |   6 +-
 lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c    |   1 +
 lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c           |   1 +
 lib/utils/mpxy/fdt_mpxy_rpmi_mm.c             |   1 +
 lib/utils/regmap/fdt_regmap_syscon.c          |   1 +
 lib/utils/reset/fdt_reset_atcwdt200.c         |   1 +
 lib/utils/timer/fdt_timer_mtimer.c            |   7 +-
 lib/utils/timer/fdt_timer_plmt.c              |   8 +-
 platform/generic/eswin/eic770x.c              |   9 +-
 platform/generic/openhwgroup/ariane.c         |   7 +-
 platform/generic/openhwgroup/openpiton.c      |   7 +-
 platform/generic/platform.c                   |  10 +-
 platform/generic/sifive/sifive_dev_platform.c |   1 +
 31 files changed, 327 insertions(+), 254 deletions(-)
 create mode 100644 include/sbi_utils/fdt/fdt_cpu.h
 create mode 100644 lib/utils/fdt/fdt_cpu.c

-- 
2.52.0

base-commit: 6ad246a1494807ee91e36ffcf60e4c30bb309d45
branch: up/fdt-cpu

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
