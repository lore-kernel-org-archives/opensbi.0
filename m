Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F0DCA600A
	for <opensbi@archiver.kernel.org>; Wed,  7 Oct 2026 20:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FaB4EqJDls562Lf/+tZNs87M+nOXG4+4uuaYEhXJh8Q=; b=hvconNn9xyIwk3
	6nDznSxQlwvhSlcTz6nO7X2GF9qCXVhlFlmVSMgt6lWXF6eQyt7QQTfSI4+ZPBW3L5r0bpYblP6QA
	X6mz7OQ0lIH0E8cZv3nh6nzTlL1YsqR+fir7rqfRUbh17OJGP/dd+Jed40UHXIXuZPPCePKSUqPvz
	NrblL03PiDWvEf23cBSn13biCr6p17EfTUIWMVTKzR5TykXdM8dfSb/bm+jFhkRn+0TGd+S7IVezw
	SXXnt9vCo/H+ik64FGOOlEKkrwGdtLGb7rQeuoVjMessF3TgtWckaDdepWsTMwgqMcLjj4VNMrWTp
	5b3zYDnjxI0S6LBisSEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEYjZ-00000003AJa-3Srg;
	Wed, 07 Oct 2026 20:59:29 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEYjW-00000003AJ2-2f2j
	for opensbi@lists.infradead.org;
	Wed, 07 Oct 2026 20:59:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1791406751;
	bh=v4I3ZfuVS3Hbxbu059wTxn4Dnnx/cOKIbdaYqIuNrCg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Pt7k/aEzrwLBUDx3sYKecqHwWSR6KKeRJzvlfV7bmgt3+ZJeP8Y0PM17LHMCZtpJ2
	 eBocCH7ltEu5glAm++MRUKyNbg+IFIqbq+9sDFxTQPhvS6c+BhmdXk3+5SHLsiQa6F
	 EREVLRmumj0AAgKjCTe6q5RU5RtDlfoGmJ4Pi1yUoml/ii3BB1buLnmFMf1FOjdG3Y
	 dinAeFqQjRJfiv44ulsxAFHoqU7XeJLMZEB2PkMKzT5rGP4KdekHZ/rF37Tn2JF8Pk
	 crqS1sZB2QMaHzqibFzM59wdY6IdYlusRX57wv4Zx1CLUEykyp1QPXc14JKxLwotH1
	 3hDnHxZBfztQw==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 46785B221E82;
	Wed,  7 Oct 2026 22:59:09 +0200 (CEST)
Message-ID: <210d8f61-6efd-413d-a7d4-87a214f50c01@freeshell.de>
Date: Wed, 7 Oct 2026 13:58:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] platform: generic: spacemit: k3: override
 cold_boot_allowed for hart 0 only
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>,
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Valentin Haudiquet <valentin.haudiquet@canonical.com>
References: <20260910-spacemit-k3-v4-0-0793b62329f6@linux.spacemit.com>
 <20260910-spacemit-k3-v4-6-0793b62329f6@linux.spacemit.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20260910-spacemit-k3-v4-6-0793b62329f6@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_135927_157341_4CD68742 
X-CRM114-Status: GOOD (  12.65  )
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

On 9/10/26 07:00, Troy Mitchell wrote:
> From: Valentin Haudiquet <valentin.haudiquet@canonical.com>
> 
> Only hart 0 is powered at reset on K3; secondary harts are started later
> through HSM. Restrict cold-boot eligibility to hart 0 instead of using
> the generic DT-configured hart mask, matching K1.
> 
> Signed-off-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  platform/generic/spacemit/k3.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/platform/generic/spacemit/k3.c b/platform/generic/spacemit/k3.c
> index 967d09bf..7922ab11 100644
> --- a/platform/generic/spacemit/k3.c
> +++ b/platform/generic/spacemit/k3.c
> @@ -102,11 +102,17 @@ static int spacemit_k3_early_init(bool cold_boot)
>  	return generic_early_init(cold_boot);
>  }
>  
> +static bool spacemit_k3_cold_boot_allowed(u32 hartid)
> +{
> +	return !hartid;
> +}
> +
>  static int spacemit_k3_platform_init(const void *fdt, int nodeoff,
>  				     const struct fdt_match *match)
>  {
>  	spacemit_k3_hart_init(current_hartid());
>  	generic_platform_ops.early_init = spacemit_k3_early_init;
> +	generic_platform_ops.cold_boot_allowed = spacemit_k3_cold_boot_allowed;
>  
>  	return 0;
>  }
> 

Reviewed-by: E Shattow <e@freeshell.de>

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
