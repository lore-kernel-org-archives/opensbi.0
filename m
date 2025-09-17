Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3FACAC598
	for <opensbi@archiver.kernel.org>; Wed, 17 Sep 2025 09:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wM+Je24DviYFGjsyZOngxoJFDlCkk1bhWhBrYGtTFvw=; b=pRWvJ+M8490gVp
	/cB2tgwrDjXejGRVvroLAnwYEgsMZ1FUwgFE/FwagsH0FTLpUjV9JQqpLVlVGJlz3PaBxvziXDgi7
	SZCbjv5U2nOcPhHsfluhiOxYS5WknZb8DCe6iEGzY/dz5ISNITWsE7Ud2ZCHRJjrVOL2NRSLtN/qH
	cpKtwSFWslgr1apCBeqFPLrZCyiIuXFOPyOVAwdH3UQkM9Hh1WNnoB5aDr0CDe5M//6rAKySAWSDi
	/h/eCr3gbf78TeZ+L58SoqCMCEnHy8p4rbB7to7OdNyY/w8sMyaAqt3dALBoFWoIo5Ibdzua/WHrV
	9HrDP3h46jmG/sg/W6dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyoNa-0000000Am8B-0j22;
	Wed, 17 Sep 2025 09:23:10 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyoNX-0000000Am7J-0HMa
	for opensbi@lists.infradead.org;
	Wed, 17 Sep 2025 09:23:08 +0000
Received: from [192.168.2.54] (unknown [216.234.200.145])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 9AFD7B220341
	for <opensbi@lists.infradead.org>; Wed, 17 Sep 2025 11:23:01 +0200 (CEST)
Message-ID: <10b584c6-9fd8-4b4f-a114-2b96a9073d20@freeshell.de>
Date: Wed, 17 Sep 2025 02:22:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: opensbi@lists.infradead.org
From: E Shattow <e@freeshell.de>
Subject: Invalid build with change in PLATFORM and no clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_022307_262923_D561E821 
X-CRM114-Status: UNSURE (   4.42  )
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

Hello,

I have narrowed down a strange behavior from U-Boot which may be worth
sharing, related to OpenSBI.

Steps to reproduce:

1. (OpenSBI) checkout opensbi v1.7

2. (OpenSBI) make

3. (OpenSBI) make PLATFORM=generic

when U-Boot v2025.10-rc4 links to opensbi:
4. (U-Boot) make starfive_visionfive2_defconfig:
5. (U-Boot) make OPENSBI=/path/to/fw_payload.bin

the result of U-Boot `reset` command is:

StarFive # reset

resetting ...

System reset not supported on this platform

### ERROR ### Please RESET the board ###

6. (OpenSBI) make PLATFORM=generic clean ; make PLATFORM=generic

7. (U-Boot) make OPENSBI=/path/to/fw_payload.bin

result of U-Boot `reset` command is normal, system resets and does not
complain.

Can this be improved in the OpenSBI build system?  It is difficult to
figure out that OpenSBI needs a make clean from the symptom;  I thought
that it might be some devicetree property or unknown in U-Boot, but
after hours trying to git bisect U-Boot that was not it at all, it's the
dependency tracking in OpenSBI build system not catching the change in
PLATFORM.

Best regards,

-E Shattow (not on the list please CC/reply-all thank you!)

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
