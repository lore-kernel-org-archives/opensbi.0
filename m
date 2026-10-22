Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3BD606A319
	for <opensbi@archiver.kernel.org>; Thu, 22 Oct 2026 02:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O2hREH0K;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=lZOz1+zU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ObrcLO1DLk0wH0yAJNzTA3ocS2YeTvWoO212ExGT86k=; b=O2hREH0KdiYcKC
	zpqFLzPVi9PbnH8NLIDu1HbxJ3Y5Xi8/+EfaldmcexGTpP/tOaLvYxQL3Y/pBpOEk2XrWGjcrfVng
	BuEZy+sQlfzOOXTZzqCdep2OroFxwzt2irzqOLnwd8sF772joLSwANrZF6P+n7xfnnvUWUS3r/1kA
	iRdtwocfxD70TKbaPZcnmsO9QwE81LsrAy0WWF60y3W3tgNQv6C2BwKjazOSZOBImGpepUa5Ejv8X
	4hG8x5npkQTrW3U9bApedDjO6Tp5p+Ui0z2HwwQ0WXMCp2O7/ERg30Qfl0E0tOxQq+RG3W4r3WZ44
	qyY6DThbmL0VwyPF8j4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJiVV-0000000DCIS-1iOv;
	Thu, 22 Oct 2026 02:26:17 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJiVT-0000000DCHX-0q1R
	for opensbi@lists.infradead.org;
	Thu, 22 Oct 2026 02:26:16 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-33fb4680717so3398212eec.1
        for <opensbi@lists.infradead.org>; Wed, 21 Oct 2026 19:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1792635974; x=1793240774; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mrUeo8RXNixJZ8ortz5RUGH7TR0eDXJvf2kSQRwn+Zw=;
        b=lZOz1+zUgV3aJUfwbiDJ4K0RAgJNJ9S5SqZMlsKHm1o5CiQF6XepLBsIgzkodaJ46L
         jnzmBaeGFWIpzI0n2gdnK4d41+nTYRl0QBtZ5mvswpcVJDjndqa/LPL7AfD8WND89XeS
         l/0n6LxPyyfcqAsx1qPTZjQX3wPuNCpgoLH/irZKS0ZvbyKJzj6uOgTv1QnlaGcwgvfP
         b5/zlRAGqABvPwJX9/ra7LsGuxzUpmfu9M8XRa6ZoNPVjXNLK/Q+caE+AOn+jP1pGRkH
         nHrr1HNu/1KOAQU7ZPedznWWIFfhAt75ddWkwycK2B69rBkbH4kubywrMHoz6otbIZhr
         kgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792635974; x=1793240774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mrUeo8RXNixJZ8ortz5RUGH7TR0eDXJvf2kSQRwn+Zw=;
        b=GjThkTuHWAkxHIppuMQjCy5EQVZ3QD7ZHkURT5hdXKVmLq2XL6ysnd87kUlfBIbbOK
         angAYqef3Lt64d3bGXgM5/coqZV+cR67ZE9MIvqA0/u7KqmzSuou298gL4aJlZ3eK8xv
         lquIbr/URoGZKxCqh14phdCfRtxd4dO/Ta6JafS2Iw6V1CqsE9A5sKSZ5dnSgDqo4rjy
         IYIVDJnfNhondT95RSXNorbyumUgRvh8nozQCJVL2P7PTtJy97zymzIm/K8ivrW8tl6j
         2rpkoSq/j9Y3zT3UQPJKs094GX1cITdiKRO0vq0TV6Zh9LQ3TqNHYipOrifSxnsa3afI
         34pA==
X-Gm-Message-State: AFq9FYLiWKhQuXltcfJqpifekxK8I6vR8GNHO521COqTSYLkt1xfqb6F
	4SRPqiKeIPFiCUAoAIlbdeH/YJ5Ej5IKSeNZH5229bmb9AUJWkZg+2aMboqLFAtzmsUuoEpvQCb
	vGwWFa1e74Wi5OouqR3AUw2l+gPguumg1/zC5Z/ci64PGPH0xEMW2DAKxePOyrNL1hFWDTO0e7T
	lJgIVqcpZwUKgZJna8Cq1egIn4nc3o/9v4UK3cruEhDB3bym4c
X-Gm-Gg: AYBFou19xalp2wvLmsj4nppEPW6MnIxKbO+iItKrfEbngdXbp5fnsTP2K+jFc/1+GvW
	aIss80SAfiU1Mxqr0bfoui8n54xLqC0hfJ/K6PLyk45ZJJsCryKypHz/oH2dy8BvWd6S5awiozZ
	/KTXkVvzWlXDA6D+JjbREVkoi6XCC1+KmfRItoHHcYTZR1tdz3kFBDTiTpnktxZvCvn5SU2ZSfj
	q/5UOq0MkkAaG0uv/oeh9hFwkWTv0JCYaGW3zOQFfP9/DAm++bMiewVzAXrAh5lqlitpl0LRT0w
	M83K2QrmqBS4HgA0o1kHqHd6EapqmgEpK4AHNJ4yC8JHkOniItxw5DTVfTaXa4FJzbuUTNqV2UG
	Se4EjGdG8UvCjEYGEhOpKgCx3+NPv9BJDlpKsA55f5LJVhBey7/bD19MINWgm0ONBxJ4ADbYoIL
	L3Hh2Tz7Y2/BQmhU1G6l1om9xMzQ91D0xJLNgTtmg6+fgiGRlH7uwEBFlZtipsU2ghqk0Bgaufe
	bMqy7NXXSw9fKBpLsjmmwzL/xeX1YCJCL9W4VrJ4aZ9s9r5TKmDg9PCwqdYwQqmgdk4Rt0=
X-Received: by 2002:a05:693c:810e:b0:367:941:c253 with SMTP id 5a478bee46e88-3674c93b096mr5663800eec.11.1792635973465;
        Wed, 21 Oct 2026 19:26:13 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1cdsm13047659eec.25.2026.10.21.19.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:26:12 -0700 (PDT)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	nick.hu@sifive.com,
	samuel.holland@sifive.com,
	ganboing@gmail.com,
	anup.patel@oss.qualcomm.com,
	Leo Yu-Chi Liang <leo.liang@sifive.com>
Subject: [PATCH v2 0/5] Per-hart feature-configuration CSR support
Date: Wed, 21 Oct 2026 19:26:04 -0700
Message-ID: <20261022022609.1974514-1-leo.liang@sifive.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_192615_246590_2B18CACF 
X-CRM114-Status: GOOD (  13.31  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

Changes since v1:
 - Removed eswin Kconfig options that are not used after this patch
 - Added Max's Signed-off-by tag

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
 platform/generic/eswin/Kconfig                |  29 ---
 platform/generic/eswin/eic770x.c              |  36 ++--
 platform/generic/include/eswin/eic770x.h      |   7 -
 platform/generic/include/platform_override.h  |   1 +
 platform/generic/platform.c                   |   7 +
 20 files changed, 547 insertions(+), 50 deletions(-)
 create mode 100644 include/sbi/sbi_hart_feature_config.h
 create mode 100644 include/sbi_utils/feature/feature_config.h
 create mode 100644 include/sbi_utils/feature/sifive_feature_config.h
 create mode 100644 lib/sbi/sbi_hart_feature_config.c
 create mode 100644 lib/utils/feature/Kconfig
 create mode 100644 lib/utils/feature/feature_config.c
 create mode 100644 lib/utils/feature/feature_config_drivers.carray
 create mode 100644 lib/utils/feature/objects.mk
 create mode 100644 lib/utils/feature/sifive_feature_config.c
 delete mode 100644 platform/generic/eswin/Kconfig

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
