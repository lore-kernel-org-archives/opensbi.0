Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EB8EA71A1
	for <opensbi@archiver.kernel.org>; Sun, 19 Apr 2026 15:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FLF8NqkxnqHxEqahqwT59VkEU2OdGe4rQNff/wu3jUk=; b=GX4E66eJegUK9U
	lmN/UhYcr77WqAS48B1yaPEsO3lnjhxfBJUZsHQzG9aZV+JT/17651xo9KPz6QoY+4Xz5+bWjob/E
	2bZedVyChn1JZ8K1Fua0slXOHhNzoeJ44TDiFvVgsAhw+hWnA2VzqoUePSFf6S6pWKNVbodC4/9kr
	9NuXTqCNkp2bmwm5h6WxSHrNHOalv61Kh4v4kyDY8zv8ou6F2cgBTccipBrIfZirSpjW48nZxExoW
	SAqmqjgZd3lh6HFqnI8rEUKiywd/AeBw1rS4vtu/+/eR4abHhBPBssQlrPd4A0Oyi4ghUSG6xLEoo
	q88WHdUj7p1A7+cTAjkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wETlu-00000005sEp-0Ahk;
	Sun, 19 Apr 2026 15:09:18 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wETlq-00000005sDj-3UcX
	for opensbi@lists.infradead.org;
	Sun, 19 Apr 2026 15:09:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=WsnVaOw4yt3gTj4DpLng6Za4hlFhPvbC+CK2QfcpLEE=; b=opnvlkQwcgbhEsOjRhY7lw/4h/
	x52URnyzAgZdR0NdmqjsX7hRX2s49mHTHxyrWs3IrdumTox8uM7ZAPBwvMQbXoOA3M+MNtpPqYQmq
	3SOzyNLnkmbBpJojpVDwrogttpivq7Pv8jXnyGyfHcvWghyi0n3q34SdpY+ALE2qjcnsniu5ZqYHc
	wXLPDBQm4wxYp0aG4VrHGsvC8Nc1XyJQ0BRforntmSP09+2Fj2z2cOeTbUt/8ub8tKiZJsaVCcDnO
	Wi+6OKceA93x6mbtGIGNK1PapAlHXb72GiMQR55B/ELTszxn6fpVVOjBWjTEQyP+GWPl2wXbDYcLh
	JcQawR9A==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wETlh-0000000CKQq-47OK;
	Sun, 19 Apr 2026 17:09:05 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: opensbi@lists.infradead.org
Cc: Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH 0/2] Add reboot support for SpacemiT K1 platforms
Date: Sun, 19 Apr 2026 16:49:18 +0200
Message-ID: <20260419150857.2705843-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_080914_914655_E5ACF9A1 
X-CRM114-Status: GOOD (  12.38  )
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

This add reboot support for SpacemiT K1 platforms that uses the SpacemiT
P1 PMIC, which is TTBOMK all of them. Note that the Linux kernel also
has a driver for that [1], but not yet enabled [2]. However it has been
suggested that it's better to implement reboot support at the OpenSBI
level [3].

The first patch add I2C support for the SpacemiT P1 SoC, and the second
one reboot support for the SpacemiT P1 PMIC. This chip is also used on
some SpacemiT K3 platforms, that's why I decided to add it at the PMIC
level (lib/utils/reset/fdt_reset_spacemit_p1.c) instead of at the
platform level (platform/generic/spacemit/k1.c).

This patchset has been tested on a Banana Pi BPI-F3 board and on a
Milk-V Jupiter board.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/power/reset/spacemit-p1-reboot.c
[2] https://lore.kernel.org/all/20260401165437.1048786-3-aurelien@aurel32.net/
[3] https://lore.kernel.org/all/c1f466f8-4e76-43a2-a7a2-126415fd1f56@sifive.com/

Aurelien Jarno (2):
  lib: utils/i2c: add minimal SpacemiT I2C driver
  lib: utils/reset: add SpacemiT P1 PMIC support

 lib/utils/i2c/Kconfig                   |   4 +
 lib/utils/i2c/fdt_i2c_spacemit.c        | 220 ++++++++++++++++++++++++
 lib/utils/i2c/objects.mk                |   3 +
 lib/utils/reset/Kconfig                 |   4 +
 lib/utils/reset/fdt_reset_spacemit_p1.c | 112 ++++++++++++
 lib/utils/reset/objects.mk              |   3 +
 platform/generic/configs/defconfig      |   2 +
 7 files changed, 348 insertions(+)
 create mode 100644 lib/utils/i2c/fdt_i2c_spacemit.c
 create mode 100644 lib/utils/reset/fdt_reset_spacemit_p1.c

-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
