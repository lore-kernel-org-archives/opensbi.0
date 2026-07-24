Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862C1C531F9
	for <opensbi@archiver.kernel.org>; Fri, 24 Jul 2026 09:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oCUdCPQDBz12vuMu+GFm5LwlVbRuz6d5dFektA7RfAM=; b=LTzR+9Opt0kt05
	m0WAdMELpM/dS0uKWDY3qkutIVFkVB/nBzZdTGc7t+fdgdJAcCVYGeFjlAG/FbV0YMoCzBi08XQP1
	MPi8VfTQfyasW+mWzEUghYGlOB1SfjLJ+bI3gj6ch+0nH9lkqc/UcHkg+te4Fw3EWEUo/AgX10zBV
	EjME4bnfMHX2UvMgEbQ/be19NfBlXpM+dMvkFEJhSvSV9XyorQpiU55w59rpLnv20RMgMlltdG7ww
	AX3rmJYSnwrJ/sovBtHrBIi2LShAuRySLGDlkASA3V4m2OhxfvPDTQl5fclyP9o6+kjbDEZlmImgl
	L/Gem18hu1XSU4fDAQyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCE3-0000000Fxyc-1FV9;
	Fri, 24 Jul 2026 09:29:51 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCDz-0000000Fxwb-3sJK
	for opensbi@lists.infradead.org;
	Fri, 24 Jul 2026 09:29:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1784885237;
	bh=VVlXsKlksZLj0ZuZaM7liGr0OT9POJ9nDmVMuP3HVjs=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=jd6vfDFZeavVCBGgdaQfoipU2mNd34HCAD6jEHrJejNeRKOP6r07NJSTMIuHSlHSd
	 9PiMg/F/3yw56BCKiCB5QmF084KEVjJCMsYl3Nx5QJPzSEvVb7VlPsA1GRAs4RIwXa
	 UHXL1CZ+pGZPAg0tG+y8p8Q0bHrzeOeol+gbULr0=
X-QQ-mid: zesmtpgz5t1784885232t6076b724
X-QQ-Originating-IP: EeoFgn+UcUqYLs3XPW712VAZ78JkSPLyuI2ybPHisOg=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 24 Jul 2026 17:27:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12153472707841760234
EX-QQ-RecipientCnt: 4
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH 0/3] platform: generic: spacemit: add K3 platform support
Date: Fri, 24 Jul 2026 02:27:00 -0700
Message-Id: <20260724-spacemit-k3-v1-0-f0e49329feb8@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyNj3eKCxOTU3MwS3WxjXQsTcyODRPOkVFPjFCWgjoKi1LTMCrBp0bE
 QfnFpUlZqcgnICKXaWgBZKzBPbwAAAA==
X-Change-ID: 20260723-spacemit-k3-84720a7be53d
To: opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2387;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=8C7CPB4xphyds7+EAVZOMLozFb1laAJ6f52qsIZnsW4=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnJ+i+3BD16vK5x6vveNVOXyLziUzphm7zSxUfskrXGA
 iZZPe++jlIWBjEuBlkxRZbuBzzbCnyibAsECn1h5rAygQxh4OIUgIm8K2RkWMTn9v/W5OV7TKdr
 Wv0PTiifp7Hc5nx1y9aE2wn6K5/1nGdk+PEo4v9J58M1TlxSYgUVtSYWekZWnMZzW2t2TJzSPLO
 FBQA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NIzMBgenmFvtsFsVu1VTSg43UIOB6Lfw0l+h6sYLx/joNI/oKd46xF0Y
	PUmFl+QnpfryMA3y6YTqm78iE0MCZl6zltswST9Yc3cbXYlxtl/CiUFmIA/cW/UC6T+6rZo
	PVZ574JBmTKffVwuLASo/elKNeZeTFj7N6Yl5omhEH3kUUko65iFlvqZw9exa/uUPjCusTr
	dC40jQnbUDkAQ1IJTBonEbqDxy4GtbJzUBnkgZPjj1hTJqh8GaazgUCePTVeu+v2JJiPp2g
	LGu2Ln8apm9A/jHUETeha0Z7I1a6BXa8Gh/A/EJZDb1Hr+Rt3SspwjYgUplydkHtBWTZ9ZT
	GssUuGUi9nzFdf6uXKZ+AWwtS4zCVske3biytrzpUMnsFkkyIlOOMKFsvJ4xv9X8WeehTHC
	KlFb7uLWEk7qtAH3XnC31WrDNWxR+iqOSxW7p8g7T9IsQgCSanWJVOFxuolWB3bULzrysTv
	EjyX03jMZZEkR/loOcLceqH8FjAPZdgeVvMx0cm15jCIRS48EFoltBlb+TAMuN5i1B+14L0
	tHKcbvzCrSABE9V+RsqfTPNQdoU3xwRCyHD1Rim0p7mvpBIoWVl4L24XX6UVmNWW2wooPb8
	fiNStRVsmO9zWEMuEV9/AMicpadxMZpKaAmidrLHfSo7xDHBxN9eqnlKMycOEqIE/RUlKGu
	ejxAxMefyDomvppTG/c7agJ99Jz4NrxpwA4QfePMxgUj8mt90UVpy1vhz/jQmfPb9M6alWM
	3VeAWtMp4j97MulxQnzFTnpz1g6VNKa4v5gyCf8h1zedW8ewaDwrbql7BBsVzW/RuMJ5vPI
	2j5kuB3b3EngLyrZuqVJaRy+Pr2Zil7MqzIZtpZcYW548J7BRpM8rRyBf4cvX8pTXeierzy
	fnGDKZ2eU3vi5WWQ8TxWRLu7JsgKVxGOuM+rXM8lnwJBlPEJLUryz2J6QlUuiDYVQCcEaHe
	Auyr2gXPtr/L6iB1bhe+PjsRqGf+wofT1kr8Icnp7vex5sxUBgzIj4I8aU8Z96MV7H11+Xo
	/6mzljzefxt4Ougeus3llQTI5TQ1RnEZi/eShYU/s6CeF5ZmauU3FrdBsOQzkwrdoPc48QD
	pw4oYoru6a8
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_022948_833466_FD6C0FBB 
X-CRM114-Status: UNSURE (   9.39  )
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

Add initial OpenSBI platform support for the SpacemiT K3 SoC. K3 has
16 harts split across four clusters: eight X100 harts in C0/C1 and
eight A100 harts in C2/C3.

The first patch corrects a misleading K1 cache-operation name without
changing its encoded value or behavior.

The second patch refactors the existing K1 support by moving the
definitions and CCI-550 programming helper needed by both SoCs into
common SpacemiT files. The K1 CCI topology, boot flow, and HSM
implementation remain K1-specific.

The third patch adds the K3 platform implementation. During cold boot,
the boot hart configures the cluster warm-boot vectors, enables CCI
snoop and DVM requests, disables core and cluster power-down on WFI,
and wakes the secondary harts. Per-hart initialization configures PMA
attributes, caches, L1 D-cache snooping, prefetch, and the H extension
on X100 harts.

The series has been build-tested with:
 - the generic default configuration
 - a K1-only configuration with the SpacemiT HSM driver
 - a K3-only configuration without the K1 HSM driver

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Xianbin Zhu (3):
      platform: generic: spacemit: k1: rename cache flush operation
      platform: generic: spacemit: k1: refactor platform support
      platform: generic: spacemit: k3: add platform support

 lib/utils/hsm/fdt_hsm_spacemit.c             |   7 +-
 platform/generic/Kconfig                     |   9 +
 platform/generic/configs/defconfig           |   1 +
 platform/generic/include/spacemit/common.h   |  88 +++++++++
 platform/generic/include/spacemit/k1.h       |  96 ++--------
 platform/generic/include/spacemit/k3.h       | 144 +++++++++++++++
 platform/generic/include/spacemit/k3_asm.h   |  16 ++
 platform/generic/include/spacemit/spacemit.h |  14 ++
 platform/generic/spacemit/k1.c               |  33 +---
 platform/generic/spacemit/k3.c               | 264 +++++++++++++++++++++++++++
 platform/generic/spacemit/k3_asm.S           |  33 ++++
 platform/generic/spacemit/objects.mk         |   3 +
 platform/generic/spacemit/spacemit.c         |  36 ++++
 13 files changed, 636 insertions(+), 108 deletions(-)
---
base-commit: c0f87f10d1bfb9e72a84ddfafb5604ee1bfe9d04
change-id: 20260723-spacemit-k3-84720a7be53d

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
