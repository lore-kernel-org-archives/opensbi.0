Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE27C369D9
	for <opensbi@archiver.kernel.org>; Sat,  3 May 2025 10:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k/u5ZPfcUtFJ0VhxonraEhh2+cnT8ANR/efGpfWlqCo=; b=ZmvbIh70MGwH8o
	Y7mPUYB+nupy6tpUOU37IPJHTelPL0JitffsEPcMY2guNdstsU2puL/ox4QtsYwh5x6NUdomRSEWy
	UeI7d/Xe8yPQNAF30Hn+NP+GM3l7xsC8Ql2jmsL0Zdv4AHpMAW5nIb9wc8B7yUiiIRtQDBk38sctY
	7MOe2eshkKdoNxy7LzoKMUMJIfloZ2zy9ptEO39ujX0FArnryyIkUOHGBZA3igxkZMKYR3oRAtjtr
	ssIhPuVzqe/h1K5QnmpjojdzZaMupwLsUUWVkQnMu5tJKLKMC0MjrlsvqjFYNI6dNyzMvQOmymx0s
	vai7PAfG7LmNsMOc2wPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBAZW-00000003mJu-1El0;
	Sat, 03 May 2025 10:58:18 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBAZT-00000003mIa-2ZCK
	for opensbi@lists.infradead.org;
	Sat, 03 May 2025 10:58:17 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9BF6725D3B;
	Sat,  3 May 2025 12:58:06 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WY4yq7RwqLzu; Sat,  3 May 2025 12:58:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746269885; bh=6fjF17eHFL7YjzObicZprnbEOaqfsV27sRtctsQMQl8=;
	h=From:To:Cc:Subject:Date;
	b=Q3NBEq9Nw3K+z5uMZdLFneGj/xlbIa3POTyXPbNYc4OP7Jtesv6goTggWdT3T/XuJ
	 LejOdjBQbKbHTu5skhzxX1p5g1hRoQ34/lgGIA+80R5ib33p8EGwsdleQrIyeIG1JM
	 +ixT2vpp0W+BB6olv0NN8Ne035wRp2+/rOZaWoZGUwHPzVUqFTUZI3MDwa4Khiw9U/
	 kdpw0ehbPZryZALfubjVnetE4aYeTJ3xVGIv341jxaDb/fAvcOUSxRbc1AUXzYcgM5
	 wMNUlOImoBy64YeoLD5t81G3dtMEjKxLydYWisW/t7JVzpIw45XDJtbYMVCYkBtNdL
	 f4vs1kRgCPaHA==
From: Yao Zi <ziyao@disroot.org>
To: opensbi@lists.infradead.org
Cc: Yao Zi <ziyao@disroot.org>
Subject: [PATCH v3 0/2] Register Zicntr in FDT when emulating is possible
Date: Sat,  3 May 2025 10:57:14 +0000
Message-ID: <20250503105715.16990-2-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_035816_061163_A9024C7F 
X-CRM114-Status: UNSURE (   5.86  )
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
 lib/utils/fdt/fdt_fixup.c | 33 ++++++++++++++++++++++++++++++++-
 3 files changed, 70 insertions(+), 8 deletions(-)

-- 
2.49.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
