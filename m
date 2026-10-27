Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFB9606A31B
	for <opensbi@archiver.kernel.org>; Tue, 27 Oct 2026 08:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xKi1mQB3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=SVP3azso
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=HVMH+Kk48fmmxKrtn2FlNZSj59CHzOIVceKOBUudMq8=; b=xKi1mQB3HnOwl6WVwoveM1LBzY
	kHR3SDF7NLQzPMJiSwIpnRGfw0wkAFzpsDNcdEtoZ+8Q1/tScpidcsac0q4huH/7zHvNwnSmpazrY
	VvocgzAOVnFvXbVP1qJuv9fvwzg5Iz8pLJyNa16y+IE3XHRp6MV7jds+s578GwKz6UHfnRARWh6Tq
	S4mqaLoGpGFUxGoI1N+eKNq7HLTZ0vGmx8iX4KyKabwqOn0UgzdTgZpqziV5wKW+FhxkTGuxT5fo2
	sZP1fy2v8q7znhtHU6EPkB9ULDY2W2SSryNmRbbgVP2+y29gPdOPYJmoGXNfudHa0wkqo3mxz1W66
	Ta+xZYnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcer-000000042QO-024d;
	Tue, 27 Oct 2026 08:35:49 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcen-000000042PY-27FP
	for opensbi@lists.infradead.org;
	Tue, 27 Oct 2026 08:35:47 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ea7190aea1so17784695ad.1
        for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 01:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793090144; x=1793694944; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JVFUvup1SWtKuSgzjDdR9h6rKGpZ99OEvpxzyzq7/+w=;
        b=SVP3azsoykFEyGKLkIPE3FPOuRpwUDR3+71hCrYwi127FQdiVU164GZxENb1ubQq8a
         aWeVXveInZWlJ1rTacQ3mCaHmgp4943RA+MTRflDp0wUhK2TGqUrV9QacqISU+vTwk1t
         /6FVNouiGQGEtB2ciR3eH49MbKQtH5C73QJF4qtbhXVKaKKPnuO4yJKHaQ/GmcwImXsW
         0BGKmIiBCOR3yJw5THqKvJwNRJvD/coE9cfuRxHfXV8kQckeyQzVClDFUjeWPkpe9zHR
         iJ2GyCnUX+UiPL//6/s3bTxuYLISt73YVNL4wg1QM9bL6OqgSnFyrT74pK3apZ4T7D/h
         oDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090144; x=1793694944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JVFUvup1SWtKuSgzjDdR9h6rKGpZ99OEvpxzyzq7/+w=;
        b=vM47ISk5I4l511eAVQ3xgT1rBf5Lw02o13RhmVEblA74cEIxOlejyZcBptLnr9EOfx
         yVHHuePkQohNpk7qA0HbBRnrHOuvJkcjN9OwrEFtWyOYMWgRjsuLELRx3s1qgE/+I4jB
         E6jkCJKbCH9HdZ8mwV013t1H1cUQNcNf33bFvhb2DNqZtfpybVCSPIUAP05hBIIisAyz
         XMwC8OK4qcyNNrLSzZCB26XUbwVNfbs1YmWFudgkkwZoqft1ZSWwomLPJLzvko5bQxuY
         C8fHaSC0krx/HA1N9bk2n5YK4vol/JAzC+EaqU0frLFjFR3KOPMQeEojy9vy4roremZP
         D6vg==
X-Gm-Message-State: AFq9FYLiHrp9ysvdJxRXWhNBB+s01IftGIqONPaxDysK/k9gaGZVXwrf
	BJZALMup8tmCFX/nNfq22W2i8GeCjST12k59smOaUlKwhJS0hE7XNExSLkN+6rY4IS4tCr3oYqT
	SlGKZyH2P+zqTlsDAJYKngZjtP0REkeK0Ac/me6BO1O9XijsV4cNFL3l9+D8jkwClX+U/ia5Cxn
	EQ0Wu5gu7rHX+84V8tO5qg2rr7YRLM8s5ZIcalw8/X/vHHxJL5G7o=
X-Gm-Gg: AYBFou3Nj70IfcWU8J1RfVvDK7pUx4AcfhTu06+7zSsFmkJO90OHlkH1XHr6AVuY0mv
	M27a1JPJ7/6iTlW4HDOYM0TxEfyBao+1dalcMT+XDsVOkKEfZqdaB3JjeMBhBPN5VUqZCuetaUL
	uAo1qeqwkwurp5uAobMe6/aSTF9pdB6Zb2Q+1Vj5eN3AUlunUa3XJUHeaOIdlxXcqO6XYjCHGri
	2CLqgd1pMYGaeVEhPTk0Hk/mo/5zc9vJ1/8Ol7Bi9epLFxPdSdux9AjnDJoG0TvO+mNI0hh0WTs
	dK2t4PDtjP7MUWvIq5gT7EOJRLHX3qNXqpu0dvDLUefj6U35JudplGOV6WKCRFd2VH4pHaCCXgx
	o/qNgraVcklXCtvMOhgb55IgPMX0nFVBM20Jno+41bUFZ/u3REhGGD0wVGfS1hwFuV8PRBAaI8S
	Y45fKwNa6sN3FebW7I921HFwZbhEm/vmrBeshskEgD1SOqzRh00oprKL5HitCm26kMe42opMhOj
	wJZw9j1Uvj31JyJnRSnUoMR5E9LOGMMF3kWgfbmMaJm57UnhnJk/A==
X-Received: by 2002:a17:902:fd88:b0:2e9:5c55:c472 with SMTP id d9443c01a7336-2ea9c87df08mr68509685ad.42.1793090143665;
        Tue, 27 Oct 2026 01:35:43 -0700 (PDT)
Received: from localhost ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6cdf649sm5569615ad.72.2026.10.27.01.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:35:42 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com,
	rkrcmar@qti.qualcomm.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v3 0/9] Add RISC-V Worlds ISA support to OpenSBI
Date: Tue, 27 Oct 2026 16:35:00 +0800
Message-Id: <20261027083509.1076577-1-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_013545_574750_42A3D997 
X-CRM114-Status: GOOD (  13.34  )
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
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patch series adds support for the RISC-V Worlds ISA extensions in
OpenSBI, introducing a WID-based hart protection backend to enforce
hardware isolation boundaries across domains.

Trust Model and Boot-time Roles
-------------------------------

The implementation adheres to the two-phase M-mode trust model:

- RoT M-mode phase: An earlier boot stage (e.g., ROM or SPL) may program
  mwid and mlwidlist, locking mwid prior to handing off execution to
  OpenSBI.

- Regular M-mode phase (OpenSBI): OpenSBI treats the non-ISA platform
  constraints (pmwid, pmwidlist, pmlwidlist) and CSR states (mwid,
  mlwidlist) as immutable input policies from the hardware/RoT. It locks
  mwid if still unlocked, preventing subsequent M-mode software from
  altering its own WID, and programs per-domain mlwid and mwiddeleg based
  on device tree configuration.

Device Tree Bindings
--------------------

Per-hart properties defined in Linux kernel DT bindings v3 [1]:
- riscv,pmwid: M-mode World ID
- riscv,pmwidlist: M-mode permitted WID bitmap
- riscv,pmlwidlist: S/U-mode permitted WID bitmap

Per-domain properties (see docs/domain_support.md):
- wid: World ID assigned to this domain for S/U-mode
- widdeleg: WID delegation bitmap for this domain

Changes since v2
----------------
- Make 'wid' property mandatory for all domains (including root) when
  Smlwid is implemented; reject misconfigured domains at boot.
- Remove M-mode WID fallback logic (mwid/pmwid) for S-mode domain WID.
- Validate domain wid and widdeleg against pmlwidlist and mlwidlist masks.
- Introduce a new patch to propagate error from sbi_hart_protection_reconfigure()
  in sbi_domain_context.
- Adapt to upstream domain state framework API rename (sbi_domain_data ->
  sbi_domain_state).
- Update documentation and boot log output accordingly.

[1] https://patchwork.kernel.org/project/linux-riscv/cover/20260812122131.1534906-1-peter.lin@sifive.com/

Yu-Chien Peter Lin (9):
  lib: sbi_hart: detect RISC-V Worlds ISA extensions
  lib: utils: fdt_helper: parse RISC-V Worlds per-hart WID properties
  lib: fdt_domain: parse domain WID properties
  lib: sbi_hart: lock mwid CSR for RoT immutability
  lib: sbi_domain_context: propagate error from
    sbi_hart_protection_reconfigure
  lib: sbi_hart_worlds: Implement WID hart protection backend
  include: sbi_types: add PRIx64 format macro
  lib: sbi: display World ID configuration at boot
  docs: document WID DT properties

 docs/domain_support.md             |  36 +++++
 include/sbi/riscv_encoding.h       |  12 ++
 include/sbi/sbi_domain.h           |   6 +
 include/sbi/sbi_hart.h             |  15 +++
 include/sbi/sbi_hart_worlds.h      |  24 ++++
 include/sbi/sbi_types.h            |   2 +
 include/sbi_utils/fdt/fdt_helper.h |   2 +
 lib/sbi/objects.mk                 |   1 +
 lib/sbi/sbi_domain.c               |  20 +++
 lib/sbi/sbi_domain_context.c       |   5 +-
 lib/sbi/sbi_hart.c                 |  38 ++++++
 lib/sbi/sbi_hart_worlds.c          | 210 +++++++++++++++++++++++++++++
 lib/sbi/sbi_init.c                 |  13 ++
 lib/utils/fdt/fdt_domain.c         |  84 ++++++++++++
 lib/utils/fdt/fdt_helper.c         |  90 +++++++++++++
 platform/generic/platform.c        |  13 +-
 16 files changed, 569 insertions(+), 2 deletions(-)
 create mode 100644 include/sbi/sbi_hart_worlds.h
 create mode 100644 lib/sbi/sbi_hart_worlds.c

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
