Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC480CA5FFF
	for <opensbi@archiver.kernel.org>; Wed,  7 Oct 2026 21:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/SiLOu7yLuk6YjYlg+c7t9PfNXWzGy321HElRAHp5do=; b=Nfe1BtsA+BaFj1
	XvpGIATTgYs+D+6KihrdlBxeTPHyRTxqS79h6dDaND9+0vYMRkRifxhWmMFNhUjHsg6HJIUMR3sY/
	nx/oRimbCy5VhL9l+6vexaST+FAmmk77O7FMFuz6MnUdpJLzrZgGwY6zNBHbXnMfD/U3fb24rleLh
	TGrj2Vk6qhg0u96VsM7xJqgaNOZUqLKJe2nJJuVp3qKMqTz/NOd/4kdiIadY3NkpX51t6qMHJi1bj
	Mpkc+WYFJsVxjPWsSjJrIgBYXQbiTusXViuAEws5/2+MbTIIIJ95AoOsKmebR3aBqls7vXm5puUk/
	uCcTeUXMoT8csfa1RgxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEZ4K-00000003BXZ-0MVR;
	Wed, 07 Oct 2026 21:20:56 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEZ4H-00000003BXC-0BqT
	for opensbi@lists.infradead.org;
	Wed, 07 Oct 2026 21:20:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1791408039;
	bh=J4m7+C8BunLeMJAxpGIlYrtgy3hbwZqoX8snoQKpKTk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LfLhv0WZ9Thx82MkaMnH5RXTd8KAdAmF97ENuhGv6dYVhGSjMa08PrQe+NcwdscyV
	 CpYmy1iOX5ScjXkmOk/1RI8f99gVGIYInlXZmrNdW9CVOU37iCDTdGAHWV5VdZlG0j
	 wPja6iGHzkWU+u2MLrW5GU7/tZ5uKgNBDI7CiAQPS7fwm14IRTMOQky89mNotftUPs
	 d5gDPZx3kwzmtmzIOYoJhClU2LASsNunQx6bcVxh5xBZYHPjiarwqSE4pndFMMNdfe
	 ZnBxhvGl7YVXpdhHxWoFwdi6573Ljktw3uhoC4iDMU0iXitM/xHLZor6Jl5CQN3dNS
	 AjoBduNNVS7VQ==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 19859B220381;
	Wed,  7 Oct 2026 23:20:37 +0200 (CEST)
Message-ID: <1cc1b11e-7e2b-4129-879e-b7213b02c224@freeshell.de>
Date: Wed, 7 Oct 2026 14:20:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] platform: generic: spacemit: k1: rename cache
 flush operation
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>,
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>
References: <20260910-spacemit-k3-v4-0-0793b62329f6@linux.spacemit.com>
 <20260910-spacemit-k3-v4-2-0793b62329f6@linux.spacemit.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20260910-spacemit-k3-v4-2-0793b62329f6@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_142053_247405_C831CB12 
X-CRM114-Status: GOOD (  14.19  )
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
> From: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
> 
> MRAOP_ICACHE_INVALID is used to flush the local D-cache before a hart
> stops, so the name incorrectly describes I-cache invalidation. Rename
> it to MRAOP_CACHE_FLUSH without changing its encoded value.
> 
> Signed-off-by: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
> Co-developed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  lib/utils/hsm/fdt_hsm_spacemit.c       | 2 +-
>  platform/generic/include/spacemit/k1.h | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/utils/hsm/fdt_hsm_spacemit.c b/lib/utils/hsm/fdt_hsm_spacemit.c
> index 868e49bf..99c52335 100644
> --- a/lib/utils/hsm/fdt_hsm_spacemit.c
> +++ b/lib/utils/hsm/fdt_hsm_spacemit.c
> @@ -92,7 +92,7 @@ static int spacemit_hart_stop(void)
>  	asm volatile ("fence iorw, iorw");
>  
>  	/* flush local dcache */
> -	csr_write(CSR_MRAOP, MRAOP_ICACHE_INVALID);
> +	csr_write(CSR_MRAOP, MRAOP_CACHE_FLUSH);
>  	asm volatile ("fence iorw, iorw");
>  
>  	/* disable dcache */
> diff --git a/platform/generic/include/spacemit/k1.h b/platform/generic/include/spacemit/k1.h
> index 7095bc08..ac727b04 100644
> --- a/platform/generic/include/spacemit/k1.h
> +++ b/platform/generic/include/spacemit/k1.h
> @@ -20,8 +20,8 @@
>  /* ECC enable */
>  #define MSETUP_ECCE				BIT(16)
>  
> -/* icache invalidation */
> -#define MRAOP_ICACHE_INVALID			GENMASK(1, 0)
> +/* cache flush */

There is no mystery about the symbol name this comment describes, to
need a comment. If you want to explicitly write the comment as "D-cache
flush" that adds to the readability. Otherwise it appears to be a
redundant comment. Expand the description in comment so it adds value or
drop the comment, please.

> +#define MRAOP_CACHE_FLUSH			GENMASK(1, 0)
>  
>  #define PMU_AP_BASE				0xd4282800
>  
> 

With that,

Reviewed-by: E Shattow <e@freeshell.de>

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
