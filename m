Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A402F606A31A
	for <opensbi@archiver.kernel.org>; Sun, 25 Oct 2026 14:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AivAc89K;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=VhyCDBT4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZPsAt1r6HZ7IqvFecVUhaIJFOZ2yqnebb+7ZhAchFQQ=; b=AivAc89KEb/RTgAlt/SnpKFzo0
	BBHsd07CxB+1bd2Qgi/DJrgxFwKnweSE6T9HYraHfNZiyHVJysOj8mnWVId2rDOq0XEmPTkzU49CE
	e2AGJqKAdKP61qbeU8p/mMBdTtanRzmo2bOH6GZX6YpP9v/8hNqf+8RhD/6t4Y/ROrHtvV0MK/cfm
	ZRidvkX8S+hUHm9h2is4ZP2RHbc08KFE89Xj+RbFW+hov5Bjp1N1cSvivrRo5QsWuL3rjv5qH456q
	HlJnJt41yT+oHe25nd7bakvLF9kl2TyXgOHb2v/dEtWDc7BLlMC8KNkBK0vbDphN4st1yfZW0tmSI
	yCBqkAkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKzXD-000000018Mf-0CoR;
	Sun, 25 Oct 2026 14:49:19 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKzX8-000000018LG-2Izj
	for opensbi@lists.infradead.org;
	Sun, 25 Oct 2026 14:49:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1792939720;
	bh=JZRWjAhjLmOvbqVvazHEblOgjCHinJiWHzOShsQCwCs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VhyCDBT4gd4uQ3BkJmm3z1P8E1/M0zuruK1V78wtZXtBiyC7XVOpPnKPp5OIFupEr
	 cT/XftSFP7RYdBRh5zRkMULaK2etneYaKiWAsaVoe5v/cg+/SJVtlE6TXK/WEI2h/g
	 wu67NZ3NPurWzNuVhHQvfuJX/7B+oeteVlsf+SXMPvOT+u4gvcOuIfTTMeq2ZdBEEs
	 3zpULrP9OUSMIior326GxUIFYG2uj0ac2TJSeM0veexWBlchaR3EeSiAc6N7BsAoFu
	 bVEp3Axn4xiNT0A7mkK0Q+iwbiwAh77cKD9PS4lgaHR2xxWtxyx4DFfSbpo0jj6Bo9
	 d8t/tVyKErxAQ==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id B07C0B2286E7;
	Sun, 25 Oct 2026 15:48:38 +0100 (CET)
Message-ID: <8d6a4820-683f-4260-ab77-f7bc4094ccb0@freeshell.de>
Date: Sun, 25 Oct 2026 07:48:35 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/6] platform: generic: spacemit: add K3 platform
 support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>,
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Alvin Chang <alvinga@andestech.com>,
 Valentin Haudiquet <valentin.haudiquet@canonical.com>
References: <20261023-spacemit-k3-v5-0-c5ddfc72caa4@linux.spacemit.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20261023-spacemit-k3-v5-0-c5ddfc72caa4@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_074915_067665_4169BAC7 
X-CRM114-Status: GOOD (  25.37  )
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
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Troy,

On 10/22/26 19:42, Troy Mitchell wrote:
>> I did suggest the change to be included by the vendor as a pull request:
>>
>> https://github.com/spacemit-com/uboot-2022.10/pull/5
>>
>> However I do not expect this to be considered, as the vendor uses their
>> own fork of OpenSBI.
> 
> I've already passed your PR to the team responsible for our U-Boot tree
> for review.
> 

Good report, thanks.

>> [...]
>>
>> Although I was unable boot a Linux userland from vendor 'FSBL.bin' plus
>> the mainline in-development 'u-boot.itb' the Linux kernel appears mostly
>> functional and does output some messages up to the point of 'init'.
>> There is no dependency on any SPI NOR flash content at all, it can be
>> fully erased and the 'esos' 'FSBL' 'opensbi' 'uboot' NOR flash regions
>> are not involved in testing when loading in-development for mainline
>> U-Boot (including mainline OpenSBI fw_dynamic.bin) 'u-boot.itb' and
>> whatever SPL (currently the vendor SDK/BSP 'FSBL.bin' SPL) is required
>> by that.
> 
> My COM260 test reached a shell with the SDK U-Boot and a minimal
> initramfs. Could you share the full boot log, U-Boot and kernel
> revisions, and the DT and kernel command line you used?
> 

That software stack you describe works on Pico-ITX equally well for me.

I did not get to Linux userland with mainline OpenSBI (this series)
bundled into mainline U-Boot u-boot.itb FIT image, and the SDK SPL
FSBL.bin as the DRAM init and U-Boot loader.

The commits for mainline U-Boot support of Pico-ITX landed to U-Boot
v2027.01 development cycle and are corresponding to Linux v7.3
devicetree-rebasing. Network support is functional in U-Boot for
Pico-ITX so we have the convenience of "wget" in U-Boot to load data
quickly for testing. There is no driver enabled yet for
USB/MMC/UFS/NVMe. I'll post more about this testing methodology to the
U-Boot mailing list soon.

>> [...]
>>
>> I did read through all the patches in this series for any obvious style
>> problems. For the series with no endorsement of suitability for what the
>> code does or how it does so, okay to apply my R-by tag (and/or
>> Tested-by) and with or without any trivial style corrections as requested.
> 
> I've dropped the redundant cache-flush comment in patch 2 and used BIT()
> in the K1 nascent hook in patch 3.
> 
> Thanks for the review, testing and tags.
> 
> 
On 10/22/26 20:44, Troy Mitchell wrote:
> This series adds basic K3 platform initialization and start-only HSM
> support. Secondary harts are started directly through the SoC PMU. RPMI
> support for the vendor kernel is outside the scope of this series; the
> upstream Linux boot path does not depend on ESOS.
...
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Changes in v5:
> - drop the redundant cache-flush comment in the K1 rename patch
> - use BIT() for the K1 ML2SETUP bit in nascent_init()
> - collect review and test tags from E Shattow
> - Link to v4: https://patch.msgid.link/20260910-spacemit-k3-v4-0-0793b62329f6@linux.spacemit.com

Looks good to me, thanks for implementing the changes. -E


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
