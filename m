Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F86C3ABC9
	for <opensbi@archiver.kernel.org>; Fri, 16 May 2025 13:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LA4ifpVQCp3wmA+52ruoIsKctSQHM2oraqTT3b1vDFo=; b=iQDeBpkSVJApzz
	Tp5hDGHK/UtLabQfxE67OuRPwxTe849pOzSjtsQlPocmkss8oshmwL63+TtnyNr7zlLxT3zjQwbnj
	+G6i824j1YVOMSr0SGOngeSEWgaz4IwBkZeBKUAYsTOklLllMScFKmbQdWUDHlJzRfmvyoioUxMBn
	xkrkf5JwhwaKwThYFBmPKI31lmGjbk+Wu3XdsRv/7Lb0yYSQpqzcL57OtzQVgxJQuTDH4gd37ypz0
	F7saed15tMQN+q27PKWDFJiKr+vuy3lXNSECEmJwCp08NCbUhlgM5FvfpPrbIOGLg0wVHLWVyspT+
	CXHdgFamNUJYqOweqTDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvDx-00000003X0m-41Ue;
	Fri, 16 May 2025 13:35:41 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvCe-00000003WoQ-0Fks
	for opensbi@lists.infradead.org;
	Fri, 16 May 2025 13:34:21 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4D0D125C50;
	Fri, 16 May 2025 15:34:16 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EKmOOPi4XMvJ; Fri, 16 May 2025 15:34:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747402451; bh=XPAqxkkreJOzpNzE5sLoa+FmEIjCaOak/8h87SMu324=;
	h=From:To:Cc:Subject:Date;
	b=iN7R1n62e6kdml93E2s1HuLiiVAtB/xhivrBrLcmfdNkBbnmYg+LeIsKfISUIL/74
	 msKqBFrJcynN9aqBe0I3t1qUcxM4zDIIpBM/qDF0UPZI14oFCax7qSZX/bCt1rgc8y
	 zKcWCKB2BsAuDA8KP6gJ+A8B4SH4t2gAr9Vm1qOhfh0cJZErmdtI5yEWLxwoDmKBCn
	 dQt/rQ7IwXUeozf4Sm8xDpxZezTcMRuAtf2V+1NMSQ8MYrvWcCx14H5sQGvApNHQVw
	 YpSe3+/qfXBgb/kVcEcmcy0qbiU34TNo0GF0nYXPATm7NL8hPjIiHgi7auAb9GOGdd
	 dY3ZG6D0n/sdA==
From: Yao Zi <ziyao@disroot.org>
To: opensbi@lists.infradead.org
Cc: Yao Zi <ziyao@disroot.org>
Subject: [PATCH v4 0/2] Register Zicntr in FDT when emulating is possible
Date: Fri, 16 May 2025 13:33:51 +0000
Message-ID: <20250516133352.36617-2-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_063420_345283_7E33BB74 
X-CRM114-Status: UNSURE (   6.66  )
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

OpenSBI is capable of emulating time CSR on HARTs without a full Zicntr
extension. Previously, we hardcoded Zicntr extension in the devicetree
for these cores, like JH7110 in mainline Linux[1]. This doesn't reflect
the hardware and may confuse pre-SBI bootloaders, like U-Boot running in
M-Mode.

To solve the issue, let's register Zicntr in FDT dynamically for cores
supporting it by SBI emulation, allowing pre-SBI stages to detect Zicntr
availability reliably with riscv,isa-extensions.

[1]: https://elixir.bootlin.com/linux/v6.14-rc3/source/arch/riscv/boot/dts/starfive/jh7110.dtsi#L61

Changed from v3
- Zicntr detection
  - Adjust sbi_timer.c to detect time CSR with SBI_HART_CSR_TIME instead
    of SBI_HART_CSR_ZICNTR. This change was wrongly dropped in v2.
- Link to v3: https://lore.kernel.org/all/20250503105715.16990-2-ziyao@disroot.org

Changed from v2
- Zicntr detection
  - Introduce SBI_HART_CSR_MAX
  - Make sbi_hart_features.csrs an array for flexibillity
- Link to v2: https://lore.kernel.org/all/20250418144758.2633-1-ziyao@disroot.org/

Changed from v1
- Zicntr detection
  - Introduce a bitmap to sbi_hart_features instead of using pseudo-
    extensions to represent availability of CSRs
  - Change possibly misleading abbreviation "RO" to "read-only" in
    commit message
- FDT fixup
  - Don't register zicntr to (legacy) devicetrees where harts don't come
    with a riscv,isa-extensions property
- Link to v1: https://lore.kernel.org/opensbi/20250225154103.5229-1-ziyao@disroot.org/

Yao Zi (2):
  lib: sbi: hart: Detect existence of cycle and instret CSRs for Zicntr
  lib: utils: fdt: Claim Zicntr if time CSR emulation is possible

 include/sbi/sbi_hart.h    | 10 ++++++++++
 lib/sbi/sbi_hart.c        | 35 ++++++++++++++++++++++++++++-------
 lib/sbi/sbi_timer.c       |  2 +-
 lib/utils/fdt/fdt_fixup.c | 33 ++++++++++++++++++++++++++++++++-
 4 files changed, 71 insertions(+), 9 deletions(-)

-- 
2.49.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
