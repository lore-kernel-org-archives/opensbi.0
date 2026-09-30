Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1314CA5FB5
	for <opensbi@archiver.kernel.org>; Wed, 30 Sep 2026 05:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QC2H+IQpm3JdACqrfJpv0mWTk3dth56ILkPBm60BcaA=; b=A+j+UAu7VKMZfI
	XUSaoDDRRneqWOseUpVoWMv7fCszVcYe7YmdZPWx0FsuHErpjU6QQVYt1wTSfFR2xWS5SSUe5HOdD
	aEDb1fRluV9WyCxvail2zqm5dFatfUTGY1LagzunuRuxrLInDfIZMKzC4QM13hX6WiNQBWGWL7f1L
	Hen+AqcqgQAiI8fhgl5iBu+0K01hyD64Wh2CGnkAkjoWELWp8csyWSrM/x3rNDQN+brOYliNMFkI6
	cYndJ/8JzeKhMG4TR8E1ZQoAge+n+nz/qRr/bODZRPOpWFlusDFv2ZawHguDV44RtMUkdKejjCtu7
	vpyN6MZiQJ/JjEMnCEQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBn5J-000000054FG-1l0k;
	Wed, 30 Sep 2026 05:42:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBn5G-000000054EE-00aT
	for opensbi@bombadil.infradead.org;
	Wed, 30 Sep 2026 05:42:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Ih+6qzEiTYqLI3zdg/aB1AO2iD7IEaqvQVUAk5HvK/Q=; b=J/+pBygu/UIPxaIAxaMTbAMbqW
	PEvBmlJLCXkwrrjgccKbD5yGD8XrQa3+O/om5TcFxFUd47fcDlx+uEqQt7z9z6QNZOomuOvfR81cT
	aLA+l2X6yjsJJKXjJo2qyr4WrJVteHcNZyRqwutJQ/LXpkpquiVVKihZkJgLqnHp+avoynXevkG/F
	0TEvD5qcij21LTugVO7JoBGwJrNeNuiYLiaZvE2XuMfWumiCy1VgSaMfDzJXXS62iNCWxtioqJudf
	baQ3v/TtuKO0bdwuBTth7jBa+RsVM5eNyZKTG/BOmTIUFGgZBsXwiCnHqTg0UavU8idO+wcnSlUY3
	Xevly7qw==;
Received: from mail-dy2-x10.google.com ([2607:f8b0:4864:36::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBn5D-00000003Ntx-03hq
	for opensbi@lists.infradead.org;
	Wed, 30 Sep 2026 05:42:24 +0000
Received: by mail-dy2-x10.google.com with SMTP id 5a478bee46e88-33be7dfcfc1so6405857eec.1
        for <opensbi@lists.infradead.org>; Tue, 29 Sep 2026 22:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1790746940; x=1791351740; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ih+6qzEiTYqLI3zdg/aB1AO2iD7IEaqvQVUAk5HvK/Q=;
        b=IgqlPT/NiJg0cmcmcdWq3DI+1dNlSV/ArTiDtHU29dqTn3bI/0Zg1mQwzE2CSUHx4D
         mbXjXqTolLkKFK9VAP9LC3ZoPFlb6/lH1jsRCupp8eLZ81LzH1uLm2yfk0fJJ9pdAHSL
         cxRu23yE9vjwC1ILLkWwXvvywIGSuiDFSSVXw55YodkbL2L5TOrQ8cu/2hnP3fEgHH28
         T9zvWsVcfW0+wSGlixcSNpqdRE5RBi3U0w6aF1IwiQdrCAkH6cEkdKjzsPz1GY3ENhh6
         Pc/sFygCKJH/DR/Tpmd9iCPYFt3g+hR7iUGtFI3qIyRKz9/YLnA97ki1mjYdyvUY0fcs
         7ZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790746940; x=1791351740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ih+6qzEiTYqLI3zdg/aB1AO2iD7IEaqvQVUAk5HvK/Q=;
        b=I7z8OED44YkJX4rD3Xy0nOsBHJjHz8g5NNAzb0xEEWZqiNBVzE4ZgFLi9yR/8gAMen
         w+b+GeWcCF0pnZEKvpiPBdw2oLAs3r2ONqMo/zJWWM+ZCMy3aOOYJrTDs8Zw1uSfggiE
         qj9tqLn1vDTACcJcrpMqGI+Abh3+550bpM/7YIt+fX6jvnC4zSyXNhyUAS5n+8TX8WX+
         ws8I3izTxDLDkLTexxj3O4d0nfLZc9NQYU2KTdbWOWVj9GYMmMs9EKLFytiTCL+3W8eY
         EYRoXcw6iSDxdqbTGSiLxTPVx2p3xJSbwYPAJ2sZT0FBCeFwWaCpDDil+z+bJ06SMT6D
         Rnlw==
X-Gm-Message-State: AFq9FYKets3vI+W1HbCLJyzbwmzh28eg4t6xtY+jNSKnKlpaNyZQz74l
	cHG7hVVrd8dsXVhjGgmMIlB3vCZ0aoOiN4fWyCAJxfxvN7//CoYI8I5C3r4kJxO/GJrosY3kV3n
	6xGAnSPMAMLIiIEhKpgOpf4v7imZto+bzqYRLy/1fm+lXNd/O/04nIV1TNtxH+ZP7eEg9MS4gJR
	e8WS9mbKoXTRdJlW5gzo6fzlxddEzb/Y69+jyz/i/dm/6ryIryPgE=
X-Gm-Gg: AYBFou3w6882BQaf9ATqIRecOvaSwX56V9ZHS7ffja5pWiHvhpZGAGIuPBgwvaH84cY
	BBcPWP0aau8rk4o1nMlw707Amgy/Y5wCidxREyhTLXewIFWBf+CGEm58+4c4Kc3fPtkICWbwGGC
	5SfsM1JLakt20MJTxO1mXhcAU4kkcK/Qx6rBR3/KwcekgTaPa7pffAYsQuXlz2uA2m0siydi/3g
	Qb1LV2tXpHOqCBDu8VbFS02hxm+Y6KCpLONT0OfrTEtofi6vFyQcvV1WSLWvXkLT8JHHbUCx/BA
	e3e4O6k6V3REMCkMeeObW3cPiwRzpAI+Y5lT6biD0ck461c8HNI/K0sQFe15263JYoQa/KFmj9+
	s+f8u0a5pO4KxdyZG+rIJwV3ZvWFWIde/yF0tfPuSJejUoyc6DY+xgCeAfLAuWsss0Lk/5VAadK
	vgqmC5tcaLGlvZDtksMMgHH8qWCepZnrIfOyjAQZ/fJxA3W+UHt1rW3FeL8mFCiomfcYN95l72H
	fsM4s/8DY23GWw=
X-Received: by 2002:a05:7301:6196:20b0:34b:7e89:9a7 with SMTP id 5a478bee46e88-34ce0156f04mr573603eec.20.1790746939946;
        Tue, 29 Sep 2026 22:42:19 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf4a60283sm910797eec.6.2026.09.29.22.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 22:42:19 -0700 (PDT)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	nick.hu@sifive.com,
	samuel.holland@sifive.com,
	leo.liang@sifive.com
Subject: [PATCH 0/5] Per-hart feature-configuration CSR support
Date: Tue, 29 Sep 2026 22:42:05 -0700
Message-ID: <20260930054210.3498806-1-leo.liang@sifive.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_064223_231025_4BF0D897 
X-CRM114-Status: GOOD (  14.99  )
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

Some RISC-V implementations expose per-hart machine-mode CSRs that
select microarchitectural behaviour, such as branch prediction policy
or hardware prefetcher configuration. These CSRs must be set on every
hart, and on hart resume too, since a non-retentive suspend can reset
them to their power-on values.

This series adds a generic feature-configuration framework:

- Patch 1 adds a per-hart cache of pending CSR writes and the
  feature_config_init platform operation. A platform's hook caches
  writes instead of issuing them immediately, so a later override
  can replace an earlier value before anything is actually written.
  sbi_hart_feature_config_init() calls the hook once per hart on
  cold/warm boot, then (re)writes every cached CSR; on hart resume
  it skips the hook and just rewrites the already-cached values
  directly. A failure anywhere in this path is treated as fatal and
  hangs the hart, since an unconfigured hart may run with unsafe
  microarchitectural defaults.

- Patch 2 adds the vendor feature-configuration driver interface,
  which matches a hart's mvendorid against a registered driver and
  hands off to its init() callback. All vendor-specific policy lives
  in the driver, keeping libsbi.a self-contained.

- Patch 3 adds the SiFive vendor driver, which further matches a
  hart's marchid/mimpid against a per-core table of CSR values.
  Harts whose identity isn't in the table are left untouched.

- Patch 4 wires the generic feature-configuration probe up as
  the platform's default feature_config_init operation, gated by
  Kconfig, so any platform enabling the SiFive driver gets it for
  free.

- Patch 5 shows a platform override: the Eswin EIC7700 needs a
  different L1 hardware-prefetcher value than the vendor default, so
  it delegates to the generic probe first, then overrides the cached
  CSR with its own value before anything is written.

Leo Yu-Chi Liang (5):
  lib: sbi: Add per-hart feature-configuration platform operation
  lib: utils: Add vendor feature-configuration driver support
  lib: utils: Add SiFive feature-configuration driver
  platform: generic: Enable feature-configuration support
  platform: generic: eswin: Add feature_config_init op for L1_HWPF
    override

 include/sbi/sbi_hart_feature_config.h         |  16 ++
 include/sbi/sbi_platform.h                    |   7 +
 include/sbi_utils/feature/feature_config.h    |  71 ++++++++
 .../sbi_utils/feature/sifive_feature_config.h |  32 ++++
 lib/sbi/Kconfig                               |  23 +++
 lib/sbi/objects.mk                            |   1 +
 lib/sbi/sbi_hart_feature_config.c             | 169 ++++++++++++++++++
 lib/sbi/sbi_init.c                            |  21 +++
 lib/utils/Kconfig                             |   2 +
 lib/utils/feature/Kconfig                     |  22 +++
 lib/utils/feature/feature_config.c            |  36 ++++
 .../feature/feature_config_drivers.carray     |   3 +
 lib/utils/feature/objects.mk                  |  11 ++
 lib/utils/feature/sifive_feature_config.c     | 101 +++++++++++
 platform/generic/configs/defconfig            |   2 +
 platform/generic/eswin/eic770x.c              |  36 ++--
 platform/generic/include/eswin/eic770x.h      |   7 -
 platform/generic/include/platform_override.h  |   1 +
 platform/generic/platform.c                   |   7 +
 19 files changed, 547 insertions(+), 21 deletions(-)
 create mode 100644 include/sbi/sbi_hart_feature_config.h
 create mode 100644 include/sbi_utils/feature/feature_config.h
 create mode 100644 include/sbi_utils/feature/sifive_feature_config.h
 create mode 100644 lib/sbi/sbi_hart_feature_config.c
 create mode 100644 lib/utils/feature/Kconfig
 create mode 100644 lib/utils/feature/feature_config.c
 create mode 100644 lib/utils/feature/feature_config_drivers.carray
 create mode 100644 lib/utils/feature/objects.mk
 create mode 100644 lib/utils/feature/sifive_feature_config.c

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
