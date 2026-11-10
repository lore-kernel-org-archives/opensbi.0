Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715B7606BF19
	for <opensbi@archiver.kernel.org>; Tue, 10 Nov 2026 09:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Jbq1BeoO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=mX/muA3R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Ay9jTk4/O/WWXiFp2zJ0EfjlFPVQZ9Mnf9k/X9sgom8=; b=Jbq1BeoOptVlG9tRu1AhewNSZi
	hGhchuEGr1t7K+hQ/BDLX2K0s567Njj2AX3sgEWJsNzndMYVrYxqOlWHK0OZ7WvyZaLECp4VjrCS/
	iK5Qrw0VuOU1Jo5T6QnkisJGwSWxgXI6N+DNN4M4WAp2iVoj4NnYTENlPCN/Z/iS4XJVGbM6tYkKG
	5yoGKafuZpcOE5Hek8XpB8hC0qoikpGE3Qv4I6i8zEk1rkoufku72m25lpBp0zv/wCQfIKsK1iLyx
	g/Ar6GkDVol5L8a4bHajptQq4UCnBDbBpyPvBk/gLvmg+cXchGJ46eds/NstF2p4ixwgMrjatiIKd
	9VJMU4Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiUw-00000003LL5-3ZCu;
	Tue, 10 Nov 2026 09:50:38 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiUu-00000003LKZ-0UEJ
	for opensbi@lists.infradead.org;
	Tue, 10 Nov 2026 09:50:37 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8a058315c79so912037b3a.3
        for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 01:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794304235; x=1794909035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UrJ7JuB4aPO22UGFVkpGDh60mLXKf2FYnHjSSVb18p4=;
        b=mX/muA3Ra9/O83GwdOU4KuB8/2sa6mY2P6DIOvFHKhpZeRv634cpauknfYhRKPPP/o
         KcGrvaqlO2PZpwhy6NYjM78OIwAWcNX6wDLjbL3lPdB1Q4UPd9oTW86YYQUo8XSa4n91
         xd3wCAeXrsHOsHHAMyyKIPAJgh6X47SlFQo7A6yDN3eujMHLSpJohyMm53/gbImeXfzS
         l263flfLSHO8d8QSxXtvjwt21A4D3lok/gU9nKBF0kKWC8dCu0mkocGxjXv+2QYZl0CD
         3ewcgtZ1qDl/ht8j5XPkY7IhfmYvLZYJ5MOD6O5dp5JenHUQpf/f1jjif9T3eWZQI34l
         rT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304235; x=1794909035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UrJ7JuB4aPO22UGFVkpGDh60mLXKf2FYnHjSSVb18p4=;
        b=DFOuWHgCT6kUQHduUv2R3eWkCNmG9gjz1P7AjC1gnE3cQciWhUxQFLs1S6wdmaNkrc
         Orhj8bozGQ7cpgDSd1E5g1KsWvVj3yjVbQe8m++ab7NVj778DYZVFNE47Kism3OeC71N
         OZFM5eqgVAhbaIKeNJBKoUQo8kTn2MXlraCyWfUvDD8S02FodtlHVk2ERZOCzOe8hZFM
         HWksiupxw1V1IjJ/wTJHgVYdHZlcA3EjAwe/LHTEpIUotT9sJMIqrb9tO7fHipn/7QRy
         PsN2ps8k8Y0UdsPUtMLV94iG46yRPT+thvx0PChJPHIXn2KZvvJMc0Qba4gxqcfLCIVs
         4ZDw==
X-Gm-Message-State: APuU4Z+KUIerKUN0t+kpppfXFO0HR04iu0TnPAdvOp1AIbjjFhSxpWgs
	piBtFdClh/YV8JqS7Cb/RisobSYzVgOx44nXgybEXgGXB003poIpXE+KzKRNR8XzFI42w1lknZ1
	nVyJ2S0h9QuCiFtJGK24n8Cevcmrcq45OXSUn+ObN9JOjm7YXfJ3HKOpU/Bwc59M1EJUA6iVwUO
	bDUA1TJqobFRMHqZmz10+VIFGALgHMg07SQFL9zPT88Is8g5lDvAs=
X-Gm-Gg: AYBFou1A6tuwV4/A9W+5I7VOibEgdL9KRDfEde7Iqrz/s51YLkDoTKjYTyygIwWRyfO
	zn7aP1nbw5r+OMAqzwxoJWRewyNGhszpqlTK/XH4G2ipND+ZzNO+5LyjFHo7y9nrrP3uy3vS2MK
	gvUgkgfwy5w6TJ7paNpDH0vulMfEuvWBUIo4aLcAb3Eqxnd3WR/waxaJLlbxgmT84A4mWyZV+DM
	JLEkJMj0j6lyGNsmZplG67S9SSBxaqnG/aeirE9EMSzh1MwMQBih9EIgtw2czBRSCC9VdE0lcRE
	JDIYFXD2x0ekN1xiaqI3aSEjnt5Lq1kLJmikBDybh15DW9/rzqXNUwl/ykipBeVe6toBNoGsxRn
	arBaPnWxYu/Sgm5iBbf3MWuN+nDjUkGxq1tOtRXhUl0l+P0smbr/3gl5yWzt2FEUeZEGSYL3TK9
	Z8LvKHsXswTG7jbcaTTeOgDE9lsG6onYlszgPJ5iUxxPLFKDSD75TrSYS1MffZIV8ujzNGsh0UK
	g0LaTcCh7c+vRqBg8Lw/oeys1GvTCbbloN8jmk3WK9fctxA7yubNJ2qtPVFT/zRRSRKlE71jeQT
	XkQllGWjhKMTaQ4Js5JYFy0JYtO1olbzSTy8Wx6rshayaNO3
X-Received: by 2002:a05:6a00:3a06:b0:892:a4c0:4eb1 with SMTP id d2e1a72fcca58-8ba852358e6mr2097284b3a.18.1794304235034;
        Tue, 10 Nov 2026 01:50:35 -0800 (PST)
Received: from localhost ([136.226.240.177])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab4fc2b5sm641977b3a.50.2026.11.10.01.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:50:34 -0800 (PST)
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
Subject: [PATCH v5 0/9] Add RISC-V Worlds ISA support to OpenSBI
Date: Tue, 10 Nov 2026 17:50:20 +0800
Message-Id: <20261110095029.117504-1-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_015036_170244_E03597C7 
X-CRM114-Status: GOOD (  12.14  )
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

Base commit: 33279821

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
 lib/sbi/sbi_hart.c            |  22 +++++
 lib/sbi/sbi_hart_worlds.c     | 174 ++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_init.c            |  13 +++
 lib/utils/fdt/fdt_domain.c    | 102 ++++++++++++++++++++
 lib/utils/fdt/fdt_helper.c    |  69 ++++++++++++--
 14 files changed, 495 insertions(+), 8 deletions(-)
 create mode 100644 include/sbi/sbi_hart_worlds.h
 create mode 100644 lib/sbi/sbi_hart_worlds.c

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
