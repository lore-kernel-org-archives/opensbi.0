Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F4DC7EE2A
	for <opensbi@archiver.kernel.org>; Mon, 30 Jun 2025 03:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=VRCFG+g0SIq3Av/ppFsAf7VFYnjJb4d+ylUT3/Q2TwU=; b=Du+
	nks6kqaXVmhfoAU/EyphLwRFD36MahkWdK4DCHRbn7JBeqczvNu+JizrUEulah9fLuNbKb06Nn728
	ZT3lnstUdHBqmuTUp0BH5Ro4C931SDPbHokPuf8KDMDBIU3ZKm6Zm/q4N8AU5ucZIKUXVtjVpiSyx
	4HR2fGoMCLIRUnsE0N4TYAkaJElabv3UFoOqqq8AOpAw6b1J/P6YthO7KBRBAe9ohKZWH0re7mJFL
	qtVkDw4StBVozUj+OfuIyen2Bq8c9qbMy/qpQt+Jp/UdoTicsUhVgJ5qvNEU3+1krvnZuzv9VWPU2
	tne2GNu6qa6dUxb6LerCzGdgsMG3tvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW5eu-00000001AEh-1CP5;
	Mon, 30 Jun 2025 03:58:20 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW5eq-00000001AEI-2lHp
	for opensbi@lists.infradead.org;
	Mon, 30 Jun 2025 03:58:18 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3df2d8cb8d2so14995985ab.2
        for <opensbi@lists.infradead.org>; Sun, 29 Jun 2025 20:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1751255895; x=1751860695; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=67UP85BmuS1bLGHMYdW/vGwS8PobsKHvsVZZvzf+h50=;
        b=oQbyWZlPjpnO/2jxEODsbGrfXhqNx1EUsO30Xw0mled4bRSKa+BDaVpis1ToWboy38
         6GBosyKeRA4mKfrnicumCEApwpRy3jwcg0COkANS8erV5h6CUOzyQ0TizrBRroWNxH6O
         SJVW0ZPQWjIEToWCjBBemrGnB/kck8eC8sNX77yWlVc2n0ozqmmh7NIkHLHPFmK1B4vb
         JKWFHhyD4HxbmCBk7Lsoaw9TRt8Mq8E+g0/igBanRS5B8q8qCdZ6mM4FhLtAY5If3pCc
         RhM9YJ9QrJW/VKKDtKBeUG1d7dlonFJ2vCJOjGk/FWhJM1dyPnO8SFxkawqMCwUaN7Kx
         hF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751255895; x=1751860695;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=67UP85BmuS1bLGHMYdW/vGwS8PobsKHvsVZZvzf+h50=;
        b=ThFkyPJm24r1mm6IzJffi5Iw2xM7g2G5njm6XpA83+3LfYEx9KOHw378TEImk0vaSZ
         bFNTiY9dMsB02L1T5tYUckdYf127R4CDkwy/KXJYY+/JnKeHZI5X/w3wis7WkjinDuip
         6QNcz9eXS2tnYtA5rXMqLUfawRUCPbQX41w3c+Nd3mNdbwexLdtO7ku0YuVx0iyKPppe
         h+H6g0MZ6ANbGCMX5ommeuevY0vEpJh6dL4BGGb9kitF1huRPK/NFSp6NSazX0xsbHJI
         Tgb4ljK0jrf++aYwIXfc0bNBgmoWTo9/8+/boKq1LkE0tHQMw1+GA7w3HGeYD+BM26T9
         JcGw==
X-Gm-Message-State: AOJu0YzFP2UpCGuRIHktYAUfVu2PVY94buyJFdxIZr1eKjlemAHCn5Pn
	Z2Ttx09RdjiXLh/rw/C432744Vccy1nX0gUK6ktEVP1Bm3aH0FJOapek/OOs2TfE+daOvtnB05e
	e6F+1P7fwP6JE1aDIisB85iYTWhQJwu6J/QOmgYFbp/Fr+8Do093RoTA=
X-Gm-Gg: ASbGncuFGWla/ZyfDlL4e6UbB8yG5/EnnQAR1XCo1JTld/Cr/DKG9UqYLQ43cq2EQe1
	Oe+Ex6Ba1MKd2qaqzW007DAWNVMYpMo/p3XS1YR+cP0zY+Kr+sSd7oG2TOKdMXVUVyO0Mg61M5S
	tYwmFvFBZ4FL80ZK0dusTDj0qTogcaUv89l9tnayQ1nx8=
X-Google-Smtp-Source: AGHT+IFTUL0LH8WGAa6PXe9TMMELNecam/YoZwYA22KDbTNCMr+KWHjq0cuaxyt4g1IvSdsuyHdjANrUEsvGo7dgEmQ=
X-Received: by 2002:a05:6e02:1a0d:b0:3de:12ff:3617 with SMTP id
 e9e14a558f8ab-3df4aba3729mr133431335ab.15.1751255894883; Sun, 29 Jun 2025
 20:58:14 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Mon, 30 Jun 2025 09:28:03 +0530
X-Gm-Features: Ac12FXyxPs7HSwbyVqQSmupbWU4xK1zvFGNj4ZCvkp9iJtJkyz2Jp3Vz4Pr0Cpw
Message-ID: <CAAhSdy2jTPFqg0oB=woYAmejOW77eQUK1PMt+WYbSNu+n1FMRA@mail.gmail.com>
Subject: OpenSBI v1.7 Released
To: OpenSBI <opensbi@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_205816_939630_23074936 
X-CRM114-Status: UNSURE (   5.27  )
X-CRM114-Notice: Please train this message.
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

Hi All,

The OpenSBI v1.7 is now available on GitHub at:
https://github.com/riscv-software-src/opensbi/releases

This release has:

* New parameter in top-level Makefile for reproducible builds
* Added MIPS P8700 platform support
* Allow arbitrary path in LLVM parameter of top-level Makefile
* Improved SBI v3.0 extensions to match frozen specification
* Emulate AMO instructions when Zaamo is not available
* Stop the harts waiting for HSM start from supervisor software
* Improved generic platform overrides to use common fdt_driver helpers
* Improved SBI MPXY framework to use per-domain data
* Added support for control transfer records (CTR) ISA extension
* Use LR and SC when Zaamo ISA extension is not available
* Added PXA UART support
* Added support for double-trap ISA extensions
* Optimized hartid and scratch lookup
* Added unit tests for bitwise operations
* Added unit tests for SBI ecall functionality
* Constify various FDT driver definitions
* Added MPXY RPMI mailbox driver for System MSI service group
* Improved RPMI drivers to match frozen specifications
* Initialize miscellaneous early drivers in one pass
* Use fdt_driver helpers for irqchip driver framework
* Allow adding SSE events dynamically at boot-time
* Simple singly linked list implementation

Overall, this release adds more ISA extensions and does many
device driver improvements.

Many thanks to everyone who has contributed to this release.

Best Regards,
Anup Patel

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
