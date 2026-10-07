Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59274CA6004
	for <opensbi@archiver.kernel.org>; Wed,  7 Oct 2026 21:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AFfrgdjiiE+qmRLAqwcvJidZDq8lg+e8Urp8FfASR8o=; b=ZC+14Lsxi0WWyz
	tb1vG7Lmb0aWXgLMGMYI18dqYCiCo4fOQVWHRSvwB2Jf5ZSfVpQAmv3b4Legun22liIbuE6FdIiO2
	DFnHFzzbx/sGQfhEwHrQFriPeRF4HIDfRr2uQhANZgCkzVZxfhis7NF80q5lRpiaMbL2vn+JrmIE7
	3F53G+QYr/LOUi/7N3B1Z/DrP7p+czD/Io1knPzUMHHFMy7EDwxCERZIs2GZMODlj1/gMLTbaCacb
	C0oSVU4Oyp0OqmSvjOe/HeKPsJ38bnNIrBFigPWU5bDh/2mlBNegPdMZ8HQHp787fXaRp1IbdZKo0
	VRoyeLV/sNKUiZzh9FKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEYy3-00000003Ax6-2ADh;
	Wed, 07 Oct 2026 21:14:27 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEYxz-00000003Awl-3JL4
	for opensbi@lists.infradead.org;
	Wed, 07 Oct 2026 21:14:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1791407648;
	bh=y61NpfOBavXrJSoZQuzdMorzKQNHxGrr+bGZPbpB1/w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CUc6k35dRAfTTXsoTvJb1UNe/D9weHeZRtwIDuPLs6MHL6WSyKhbYXcVSTg9K631b
	 +M3ttg9632ZUnxayH1kah0v1wT5fw+CFOtF63rAEDq/xuidsLaIgEy28OYO7IcZ8rT
	 b2mUnQVEYnVf8iOmy0Z89SFQHOWUkQX/J6zb2DGJPxE8Ox6hICFud8EJL787TOI3OK
	 EKXlli9p490t+XB+X6TLrrs3n1K1xQYt6oJLhwDhMKzXWfOcJ0nn5QIlZsVbSt0HCl
	 FnpPcg+/hF4d3PpYCotJU5jfpclzDIvj4xJxADkczyTkqjBaD2xVyrsu0uJTi81sND
	 ym4Tag9yDcLow==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 252FFB22016D;
	Wed,  7 Oct 2026 23:14:06 +0200 (CEST)
Message-ID: <914fcfdb-289f-4aef-a223-2d7303498972@freeshell.de>
Date: Wed, 7 Oct 2026 14:14:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] platform: generic: spacemit: k1: move hart init to
 nascent hook
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>,
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>
References: <20260910-spacemit-k3-v4-0-0793b62329f6@linux.spacemit.com>
 <20260910-spacemit-k3-v4-3-0793b62329f6@linux.spacemit.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20260910-spacemit-k3-v4-3-0793b62329f6@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_141424_277339_694FB768 
X-CRM114-Status: GOOD (  15.81  )
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

Hi Troy,

On 9/10/26 07:00, Troy Mitchell wrote:
> cold_boot_allowed() is a policy query and should not modify per-hart
> state. The K1 callback currently programs ML2SETUP as a side effect.
> 
> Move the ML2SETUP programming to nascent_init(), which runs on every
> hart before common initialization. Chain generic_nascent_init() to keep
> the generic per-hart setup intact.
> 
> Fixes: 1f84ec2ac22e ("platform: generic: spacemit: add K1")
> Reported-by: Bo Gan <ganboing@gmail.com>
> Link: https://lore.kernel.org/r/56220293-88e3-451f-833e-8251656a83d9@gmail.com
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Reviewed-by: Bo Gan <ganboing@gmail.com>
> ---
>  platform/generic/spacemit/k1.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/platform/generic/spacemit/k1.c b/platform/generic/spacemit/k1.c
> index 7ee5f17a..19a9b27c 100644
> --- a/platform/generic/spacemit/k1.c
> +++ b/platform/generic/spacemit/k1.c
> @@ -8,6 +8,7 @@
>   */
>  
>  #include <platform_override.h>
> +#include <sbi/riscv_asm.h>
>  #include <sbi/riscv_io.h>
>  #include <sbi/sbi_hsm.h>
>  #include <spacemit/k1.h>
> @@ -86,16 +87,23 @@ static int spacemit_k1_early_init(bool cold_boot)
>  	return 0;
>  }
>  
> -static bool spacemit_cold_boot_allowed(u32 hartid)
> +static int spacemit_k1_nascent_init(void)
>  {
> -	csr_set(CSR_ML2SETUP, 1 << (hartid % PLATFORM_MAX_CPUS_PER_CLUSTER));
> +	csr_set(CSR_ML2SETUP,
> +		1 << (current_hartid() % PLATFORM_MAX_CPUS_PER_CLUSTER));

I think use BIT macro here for bitwise left-shift unless some reason not to?

> +
> +	return generic_nascent_init();
> +}
>  
> +static bool spacemit_cold_boot_allowed(u32 hartid)
> +{
>  	return !hartid;
>  }
>  
>  static int spacemit_k1_platform_init(const void *fdt, int nodeoff,
>  				     const struct fdt_match *match)
>  {
> +	generic_platform_ops.nascent_init = spacemit_k1_nascent_init;
>  	generic_platform_ops.early_init = spacemit_k1_early_init;
>  	generic_platform_ops.cold_boot_allowed = spacemit_cold_boot_allowed;
>  
> 

-E

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
