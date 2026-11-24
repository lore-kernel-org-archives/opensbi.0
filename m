Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B5D606A31E
	for <opensbi@archiver.kernel.org>; Tue, 24 Nov 2026 04:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Eauvs+yP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=eHc5grlr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=84/lV/ozf2b1JLRBQMeII07ddPVbItDDqRcPCXd+oH4=; b=Eauvs+yP802az3UTHhiEB+c6yT
	TwkFmf/yNHwzTAGuN8WnvfO0e3MDf7tk0PnaYoYYox8CUC9D1KuikdeKhXzr5uyNX4Db3X9/OGXQe
	Fo8YMp/3ijVnxmtbv4zH+M+W1h51qWRDdFFoahWJeGcgm7Vx1liKQqoaYGpyJiNhkdQSBdnsrGA1q
	o6XMuPKjUmO1+SU7xXpKfbD7CYjC+4FB7LRoy5j/ZozrEpuhkY4+hLFcdqMLVxspUCe1rQp/gpgbe
	Ovb/i07fMpF7L6gopP77ErRLSEpeQbk+v3jWZ+bSOMt42N5PaI6+dvYd5Syx+k5Ngs48IuB1CyGiz
	JbEpuJfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhxT-00000005VUE-0aoe;
	Tue, 24 Nov 2026 04:16:43 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhxQ-00000005VTc-0N60
	for opensbi@lists.infradead.org;
	Tue, 24 Nov 2026 04:16:41 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2f0464dd6b6so23044825ad.1
        for <opensbi@lists.infradead.org>; Mon, 23 Nov 2026 20:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795493799; x=1796098599; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rlkz7g2qJZdDvh8IP4YALe7L3luveHWXQEzf0hNm/wE=;
        b=eHc5grlrRzXspGKEg7WEiyspOad0pn3L6vjW4p6tEoise6A8o9Gg5uCdxQzJSIs3L4
         ZFJ/2cEDwn4EMrCIAyJRqA48E90CDhfLMZ2HtiLvMknGvhw22ihExzJAeM/HN9gnCU1G
         wmipiHOTwnaPv1osVvTiYnm2Rx7MBlXg5SIhD5Oy9sIriApeTvn9ULBJUdvDjZgZm+XB
         4rEPKFX+D5B29rDAxJKjx6xjPZZdbQMt6TtC77//t0fCesmwy3RiR/m6xYaDuNl+Vw0J
         zUR4m6rWYnNTS8Z0Wkl050uSogS4I81hbkl9bST+EgWTldeu9rxWqkyEd1GtEGAtuSaf
         E0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795493799; x=1796098599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rlkz7g2qJZdDvh8IP4YALe7L3luveHWXQEzf0hNm/wE=;
        b=kjuRKRxgOm6BpTS3F6vKhdgR5s8L9PRLdrWfARX7bTv0iScYykjzpFOtXWRZf+d+wA
         0p4GwDyzOPxZOc7n3P1Hb8z0QghQ0RxLvdNPcH01/3d88HYamoMwnaRTzjK9o+Vdhjlg
         PFved8h5bM2S0A4AG/jlA6Xdh6gDlgA+UJ0kyOpML7kDr8JpsxvDF/I8HVXpQIUtAavT
         VIfnCDL9UNyqj4J8gTgRMagGG3FrQCfmLCx5GDqdVfyIyHfg3RDDMfznOcxTMhxUeuik
         VKDlWM3cNxfxELOMgpf2FRj//NvcSXVX+egzJ5VD/VBE5plTpybJ+Q3B0yk4ry3wOFL+
         2MHg==
X-Gm-Message-State: APuU4Z/abMLOXi8FpQKasrZPgWGJU2vNztVeY70m6ydJ+HKdWU632Ims
	MYQO6KtQ6A2T87Xmk9Gis4JBz+/ZXRS8RJmjuVBJj4XJOe4XPafrnflHuV5PZlZi8s81+WHQfLv
	vtTKcZlb/VJaW8Jw1BEvSayLX0fNPmVDgu7nro/p2tAuG72T23OYtNM+yMdbj9lTDqQPOwlqK+r
	cFNj4M9b/nakmWo2d8BjEdCgqjHeknhnByNWg5D90Pv9aiGysX
X-Gm-Gg: AZFdTZcAIVolpSCc3eWuA2oFMwhyADpemY7iTjq8Oz3H/ffXR9gIZbHu66Gb0Ep8WrW
	sA0QwcWL/cELetpsEdz3aJilIab+C09kIsLpA4ZfWh1rbS1i1qzeu65UPT0pJXp16YOymocpYzf
	d55ZHlDAq4ZEsvmSL08zetohvZTXJhTo7o4Qsssx96sZHj67d0zQMhQZi+0gC0tFTxbiUmHiIR5
	sOc9nwpuAXz4Iynk61GNB1nAGUOPrEvpXEoYFVaGfH+BpbwV8cAjJBdhua/LFm6PfzJ26YCsiNX
	vS96hI2bx3OUxQenSibAMAaBZaiIcIhThvMqjNlux9yBFYQGkyoYILvr4yFKPJA4NMdoT3MgRJG
	eAu+ibzMjrPBCLOwsKJM+Qr8id4uxlLydZ5aCoBeCFafmUmjXN0E+EF2lQFTUym3kqQ14pprETL
	apmiAKRwfIae7IN8ZPSnHlUq5vEqFvA4CtxMAs5//fZnN/ZMSjom3JBFe8onO9jw1127iIkAsXM
	pGbs3Glho+PYzVzjVuYUQe7H+HXJRZJYkelucDXC0/exDxO8nv3qFIYocR8qN2drpMo54syNxSa
	h+Za5rLr4gNIOR4QILpirR31tED5
X-Received: by 2002:a17:902:f642:b0:2ed:fdb:b37a with SMTP id d9443c01a7336-2f03ef84acbmr132617285ad.4.1795493798668;
        Mon, 23 Nov 2026 20:16:38 -0800 (PST)
Received: from localhost ([136.226.240.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f10e67csm62450405ad.53.2026.11.23.20.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 20:16:38 -0800 (PST)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org,
	anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com,
	rkrcmar@qti.qualcomm.com
Cc: raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v6 0/9] Add RISC-V Worlds ISA support to OpenSBI
Date: Tue, 24 Nov 2026 12:16:22 +0800
Message-Id: <20261124041631.1049169-1-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_201640_147027_C600DC6F 
X-CRM114-Status: GOOD (  11.88  )
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
- riscv,pmlwidlist: S-mode permitted WID bitmap

Per-domain properties (see docs/domain_support.md):
- wid: World ID assigned to this domain for S-mode
- widdeleg: WID delegation bitmap for this domain

[1] https://lore.kernel.org/all/20260812122131.1534906-1-peter.lin@sifive.com/

Base commit: 61f1973bd50338b36c52dc34006f76d464ca4f34

Yu-Chien Peter Lin (9):
  lib: sbi_hart: add RISC-V Worlds ISA extensions
  lib: utils: fdt_helper: parse RISC-V Worlds per-hart WID properties
  lib: fdt_domain: parse domain WID properties
  lib: sbi_hart: lock mwid CSR for RoT immutability
  lib: sbi_domain_context: propagate error from
    sbi_hart_protection_reconfigure
  lib: sbi_hart_worlds: Implement WID hart protection backend
  include: sbi_types: add PRIx64 format macro
  lib: sbi: display World ID configuration at boot
  docs: document WID DT properties

 docs/domain_support.md        |  38 ++++++++
 include/sbi/riscv_encoding.h  |  12 +++
 include/sbi/sbi_domain.h      |   6 ++
 include/sbi/sbi_hart.h        |  15 +++
 include/sbi/sbi_hart_worlds.h |  24 +++++
 include/sbi/sbi_types.h       |   2 +
 lib/sbi/objects.mk            |   1 +
 lib/sbi/sbi_domain.c          |  20 ++++
 lib/sbi/sbi_domain_context.c  |   5 +-
 lib/sbi/sbi_hart.c            |  37 ++++++++
 lib/sbi/sbi_hart_worlds.c     | 174 ++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_init.c            |  13 +++
 lib/utils/fdt/fdt_domain.c    | 102 ++++++++++++++++++++
 lib/utils/fdt/fdt_helper.c    |  69 ++++++++++++--
 14 files changed, 510 insertions(+), 8 deletions(-)
 create mode 100644 include/sbi/sbi_hart_worlds.h
 create mode 100644 lib/sbi/sbi_hart_worlds.c

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
