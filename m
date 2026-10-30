Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F388860A2615
	for <opensbi@archiver.kernel.org>; Fri, 30 Oct 2026 10:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cNVNLfId;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=hKX1SzBJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rJKoqlWbOSM2vIjtI57hhmjjiHfLOSgKsLQuozMXqro=; b=cNVNLfIdz3lZY1FuOABCPa429v
	96B4Y6WSKOMP+oFNO4nEsmmUDKBQP4E9G8DRG0cUDNu87PTFOEit6YTJ4qYggPyPW5vcB/D52gUkb
	e6ImaD/K+MsPpM28bEq9Ao90w5F3pVzxL/vnggry4MpoCuCm4rlKI/c9IbQXmv4yfFQ93kpIGGiPM
	P4vKVWPel6rD2VBNNRaViyklB+C1TGev1eEGwRtSzWzawB05HNJ/lxv1X0ruPsWBcG9KNOzA6lR1M
	3WKuql8huOQlx6Zo8T4eGx9yqA+teY+tZagwu7AODI3OvJTmsURajFadbdBxSW02ffNTQCTj51Yt5
	Cwh6ARUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMk6y-0000000BQZz-1YqH;
	Fri, 30 Oct 2026 10:45:28 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMk6v-0000000BQZA-0sFK
	for opensbi@lists.infradead.org;
	Fri, 30 Oct 2026 10:45:26 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so377097b3a.0
        for <opensbi@lists.infradead.org>; Fri, 30 Oct 2026 03:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793357123; x=1793961923; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZymYE/91hr2fYoFxoQmG3lipdzK2cC7KxVS2H+xlwDg=;
        b=hKX1SzBJ2mRn98m8+2IYZ2lAfz3QWFMDxdzk6q+qXs9/w775HoBkHmZlL/Kn1PJtgt
         yufxgMpAEhBFH322syZq34U2SnVq0DA0kyE4kRh1lkvkKg0C51tecrQCI+hOYXYgAy2c
         Q8Q4RAW10LK1lK7ngJWCVWCngE0FEFCn4S9MgGQGXdsJXPhbYT48nq6VDTJlBbTpCSZn
         OZjzXrfMFDzQtED3xkUzxL5yTZ59sbBTXzHo6wB/zP5UOC4esO92eSgpnYg9mymo9jXZ
         EE+Ik8R0j3wtP27tic0A5XVMFqaPUDV+e7N5Tmpfb8LMVGl/+1qXpUzCYm1jPR2jf30/
         Rosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357123; x=1793961923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZymYE/91hr2fYoFxoQmG3lipdzK2cC7KxVS2H+xlwDg=;
        b=LKRf4jfD2PCHJ7vwKUSj5RxGaHAHrAfoBl3Jvq8mCm83hhN9gfHbXUNfyD7d0qzZfg
         uSafDoo3/OzgyKYgx6bt6D65Gl3czWNW6JeSvYIgFeZV8j2K1WvTYmIomfLHlSgsAgvU
         VYOzufRfz5zHKSOX7byZD7/552KaTZ7Bb15D5hUtmIVO2OQnKm053D1c3vnmjhswSAXf
         KVbPwUDwRrPicH6vqESnEDu2maapFpBppfGD3UK7wpeRcVzW4LJOygHwsMD5CzGazFS9
         qIeuyXmrvrEVY26IvwuwhzVOcIMXA1WQWl2b7xCfPR0yT59SwDc4WobZvok2eszSaco5
         4YbA==
X-Gm-Message-State: AFq9FYKphmjahQbVCElkSiXqfC9hFw2Hhvmxc6jD2aq12zyY+KAkRC/W
	Ko7B1FKFC9iL3iahDDjgc+evQIWUe/UNpfyQEK9Jow0jcj8SgzAFMbuxWCY1ZAzCx09xmYARapn
	k/tWVVsDcSPFDpewPHkI2gfuiBmrSf8P2sF46b+hxXTUsOS6BNZprDwWGKlnw66ZQe8v/W8Ilmv
	CsAKzTF8K6VLQjROXAooHi32vLZESiz+kIBeP4Xzg599ojv+2bU1A=
X-Gm-Gg: AYBFou1Ebp2EhIdkYQRqGHqTxiYtEcGCYiYQZF/nTEsQkVp0AkJgBG9oU+vjrnRTFgk
	Gwrs9Kx43QlgQM7v2AOQR1e8qi8TMV1mtbYnqj8KDKk42+enXip1rVR73MbNM89P9BTqzlJwOpE
	OO3XLKRML/MFiGZCgtuqTrDhMrhpPKnqlY+mc5qTyFj1YkiRydrxrRwQAv/Cyq6ptFYcT61Omuz
	XOuMKdIXPgGdILyIxA5o54BmZu37fVbF5GwryZIGtwuxlRF+Iycwso3v+pkPT39X4X2mGJROUhF
	TL/Ab7Bh7UJw52Z8l66SG+Fjp7Tbd7gcL4XxzXZ3xfsXXhv98eOW0kO5g/gU4eODlw2A4drIuod
	v40vwBy+0xRPUUywlxVYgIYWQ/n34t0x0xaEHtD99lNibCd4tVPlUn5Gd7Q3ZZSeCs3BPvn4HIf
	tVSrv1F8XyTP+9i0NV3B57qNwz55MdleIezjvPvCTgvB60OU5UoyhD8dXtVBIh2F4AUpF6aye3Y
	hbjWSpNqZgL0pQkn8QB8+7R4QoaAC4DjpopSY35BXuZ3tthN+WCFK7HVixNtI5b/Foz+Jd+Vu83
	yi4u+acJD7pzCpTFGMXbWOYruGlcfsWfD+giHOSRHybWjZfG
X-Received: by 2002:a05:6a20:6a05:b0:3e0:e60f:2e5b with SMTP id adf61e73a8af0-3e9289577c9mr1991929637.30.1793357122764;
        Fri, 30 Oct 2026 03:45:22 -0700 (PDT)
Received: from localhost ([136.226.240.163])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09706f01sm548269a12.20.2026.10.30.03.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:45:21 -0700 (PDT)
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
Subject: [PATCH v4 0/9] Add RISC-V Worlds ISA support to OpenSBI
Date: Fri, 30 Oct 2026 18:45:09 +0800
Message-Id: <20261030104518.3297875-1-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_034525_267629_0E515247 
X-CRM114-Status: GOOD (  11.62  )
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
- riscv,pmlwidlist: S/U-mode permitted WID bitmap

Per-domain properties (see docs/domain_support.md):
- wid: World ID assigned to this domain for S/U-mode
- widdeleg: WID delegation bitmap for this domain

[1] https://patchwork.kernel.org/project/linux-riscv/cover/20260812122131.1534906-1-peter.lin@sifive.com/

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

 docs/domain_support.md        |  38 ++++++
 include/sbi/riscv_encoding.h  |  12 ++
 include/sbi/sbi_domain.h      |   6 +
 include/sbi/sbi_hart.h        |  15 +++
 include/sbi/sbi_hart_worlds.h |  24 ++++
 include/sbi/sbi_types.h       |   2 +
 lib/sbi/objects.mk            |   1 +
 lib/sbi/sbi_domain.c          |  20 ++++
 lib/sbi/sbi_domain_context.c  |   5 +-
 lib/sbi/sbi_hart.c            |  17 +++
 lib/sbi/sbi_hart_worlds.c     | 210 ++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_init.c            |  13 +++
 lib/utils/fdt/fdt_domain.c    |  87 ++++++++++++++
 lib/utils/fdt/fdt_helper.c    |  69 +++++++++--
 14 files changed, 511 insertions(+), 8 deletions(-)
 create mode 100644 include/sbi/sbi_hart_worlds.h
 create mode 100644 lib/sbi/sbi_hart_worlds.c

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
