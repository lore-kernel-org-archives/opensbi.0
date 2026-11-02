Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91DE60A2602
	for <opensbi@archiver.kernel.org>; Mon,  2 Nov 2026 03:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MxAX4VyO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=inptnJIh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2uvG4v/FiEmJX6zizOrNp1OFgfBlLbmNXwgsuMn2BRo=; b=MxAX4VyOIoMduLIyzMTh9LSw0S
	DVAi2tFkio67qRGfTV8fqFtiobuyuM/NQCW3Ms5gJiYXlnhJLTbpjpS8yie0npCE2P7kLGPWkKIBO
	fyaWnvDC4Tiat18RzXTmwIMH2aB11DAbsrolKPh+dEmRItSvmmy3kHswo8w3D1h7Nyb9GneD6U5Og
	MF2AEBizq2BwKfw8i/N+CGpKGvsKOl+1urnhlZIabTE4hSY9Vvib3iZkzSd1UkimWZQYjcgV77ywl
	IDcKbOWz7BfzdSjEKyWU2v6/C4HZfm0SZOdy1qAR2dlX+WOf9SycSV5UPHyY+XtlomxStPUcXSmOG
	NA9ww2gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNj1I-0000000FTDL-1rqP;
	Mon, 02 Nov 2026 03:47:40 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNj1E-0000000FTBi-3oWm
	for opensbi@lists.infradead.org;
	Mon, 02 Nov 2026 03:47:38 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-36a1947498bso228643eec.1
        for <opensbi@lists.infradead.org>; Sun, 01 Nov 2026 19:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793591255; x=1794196055; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zFsvN8utitM2G//ovv8g7/LqReyz9SErcKayKqKTT7s=;
        b=inptnJIhwTu8SMVbDsCVa1mYlxBgZvFuq27+7VN6fTA+C21cMlj0Y4brsgIIMsPp2u
         QZXNhrMP/DUsQlWP0NuNBGKEMhfqHin2ELZ4er1ToEKfllLrzivXBKcVLdBJyF1Vimwd
         /JpBnnLYNfj7iB+TbqXFJrOvmdpFnwc6w5icPQl160u9o+h85GXJX32ZNmoQfGTU4yd7
         z1ntOV6414pLGAct2cfLD5furn+2uTKSGfc4VwSNuPWdIZOsWoH8bqODwCTgbsYGmyTL
         JWfhXb2tUm6w/c3io+kJlel5A6iT3+ZYiiQik94E/0RJdU6cswrrw+NuIOQC+boj2HV2
         LVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793591255; x=1794196055;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zFsvN8utitM2G//ovv8g7/LqReyz9SErcKayKqKTT7s=;
        b=j6ktDEAFGyAY4VC8o5LTYk7/55Lr9W3ZYRa+Fy6As7C1bkMESJw10fBEVRgSgcNQfm
         Rm3F/GTrPHUuH+O+UdU8ISOI8T/wzuNmYW7OIZO2nnXv/IMQP6JyBsAQ/HCm+QTyQD/l
         2wH33EKQtvZuolXUqoNdI3qQ9XupSReTD0ApwIYwJPLzFca+mlgMw7bWsu7wWfDKV5uN
         lGff8NWXBBJEd3jiCKaYYLNJqkmulhwIcD2z4Kb75At4jFuYOh49M7Ut3QcQ1F4ivzQU
         T1i/iNbK/F+6B5+BucnlH5KMZL5kWltVlo2laGxb6nhdSvf/3vRQD+zFCjP1BagIFhad
         pPrA==
X-Gm-Message-State: APuU4Z8XvNBdwXofJ1LMRkbpNTX6NGYX/XeF4YEP6YUL1ioE/6hpFwJr
	QBnMDBqtMzRLcXFrTyXcSSWnzWxlcDl9tSeax8pRYrZF7BKmpNp9+G7rWD6UczX5w74=
X-Gm-Gg: AYBFou0ISbvvVCoZhcPSE9L+sr4PmY7v26pZiGYk1bvklAgRZHG121CAL8L9V7lofP0
	CF9V9SkMWNcdDvA4Zn+nSFhQkfqFm18nfoPhSTbAFWkV+mT6HxA/JzEEwejMmsEQ59N0NbtreEM
	Tj58BBOPKg0BPnz72t6zhD3f3HbmOV0fAgJ5IKyTVveisJMDYPC8V8RzkpDeT8XCklE2knEnIrc
	sqXQ9kiIKOnQMIMrf9Yrq4ZDmQ7CPaWqKa9WyZZs4MrdIeZHHbihbYdPvfar0c9Ms83XSA1Fosv
	5aI2HX9WyKg3VA7Cz4+mQc7SNFwM44MF2aSbOxiKt6mwchGFfOsbkUIdokcYFOBkp53Asy9+czl
	7vQEzbgzgQR20GYFatswk2V4RqV231zuE3GVBwad+1SlsN0p1iZe1Pr7ZZ7SGRqxfoQ2YcCAqpe
	AJkAC5aXSbbK4mJ46+9ifzt6w6Bz+m2ybhJS0MNmHjovUwlbLSRlVcxi3uflSpHjbOn5tkOk9L/
	brFqdBOnkXVoCwuxZLWDRp8iT4Vlf9omKn6IQ7TbD5xSouIlLyoqr0IIQCllVnG4WedJ4vuDlZq
	DEQd29b8nT75nhgwvE9f7iXdqH7gN2C5lSqtsOrvqH06EOmqQrtOjJ6KolrcvZkppvm8/ajQCAc
	0vZHBo8gKe7DkVQCosKb48LlqW+yN
X-Received: by 2002:a05:7300:f894:b0:36a:1bd4:628a with SMTP id 5a478bee46e88-36a4232bf34mr10573972eec.9.1793591255384;
        Sun, 01 Nov 2026 19:47:35 -0800 (PST)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm30308670eec.12.2026.11.01.19.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:47:34 -0800 (PST)
From: Nick Hu <nick.hu@sifive.com>
Subject: [PATCH 0/5] Add M-mode System MSI interrupt controller
Date: Sun, 01 Nov 2026 19:47:14 -0800
Message-Id: <20261101-dev-nickh-msysmsi-dev-upstream-v1-0-117b2e075be0@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NSQqAMAwAvyI5G7AF16+Ih9JGDdIqjYoi/t3ic
 eYw84BQZBLosgcinSy8hgQqz8DOJkyE7BKDLnSlVKHQ0YmB7TKjl1u88G+OTfZIxmPj2lab2tZ
 UjpAiW6SRr3/QD+/7ARLeCWVwAAAA
X-Change-ID: 20261101-dev-nickh-msysmsi-dev-upstream-8d992a7c7e5f
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org, greentime.hu@sifive.com, 
 Nick Hu <nick.hu@sifive.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_194736_969525_66CCBBA9 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds an irqchip driver for the RPMI System MSI service group.
Platforms can then route system MSIs from the platform microcontroller to
the M-mode IMSIC, where the generic sbi_irqchip framework handles them.

Open Question for Devicetree Binding:
I am unsure if reusing the riscv,rpmi-system-msi compatible string for the
M-mode System MSI interrupt controller is the right approach. The Linux
binding[1] explicitly states it is "intended for use by the supervisor software."
We could either define a new M-mode-specific binding, or reuse the existing one
and update the Linux binding. Feedback on this is welcome.

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/interrupt-controller/riscv%2Crpmi-system-msi.yaml

Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
Nick Hu (5):
      lib: utils/irqchip: Add RPMI system MSI helper library
      lib: utils/mailbox: Unlink mailbox channel before freeing it
      lib: utils/mailbox: Reference count mailbox channels
      lib: utils/irqchip/imsic: Fail MSI programming on compose error
      lib: utils/irqchip: Add RPMI system MSI driver

 include/sbi/sbi_irqchip.h                   |   1 +
 include/sbi_utils/irqchip/rpmi_sysmsi.h     |  25 ++
 include/sbi_utils/mailbox/mailbox.h         |   5 +
 lib/utils/irqchip/Kconfig                   |  11 +
 lib/utils/irqchip/fdt_irqchip_rpmi_sysmsi.c | 119 +++++++++
 lib/utils/irqchip/imsic.c                   |   3 +-
 lib/utils/irqchip/objects.mk                |   4 +
 lib/utils/irqchip/rpmi_sysmsi.c             | 380 ++++++++++++++++++++++++++++
 lib/utils/mailbox/mailbox.c                 |  14 +-
 lib/utils/mpxy/Kconfig                      |   2 +
 lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c       |  61 +----
 platform/generic/configs/defconfig          |   1 +
 12 files changed, 567 insertions(+), 59 deletions(-)
---
base-commit: 6ad246a1494807ee91e36ffcf60e4c30bb309d45
change-id: 20261101-dev-nickh-msysmsi-dev-upstream-8d992a7c7e5f

Best regards,
--  
Nick Hu <nick.hu@sifive.com>


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
