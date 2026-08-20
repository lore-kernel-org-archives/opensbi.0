Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20A2C5DF81
	for <opensbi@archiver.kernel.org>; Thu, 20 Aug 2026 08:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TizKIBZMs5TrPzz4wUTiGpOrHh2CuG74z37mGhZ4VyA=; b=ZtXvugXM1/7ksg
	0hFxrpSFbzH2wvOKvtAYIX0PUYNutDYxU2E4THQOTHGHjDAl+XHNIRjNoOx2RgUIWl4HF5iylUywI
	hZ7hXfDW2ThSJ4/fBWFYFWvNstF/2cnM6Q3c60/tjY1F7S+fZ0WDdfdCK4Ippd1X8/kEhd+x31nw8
	DLXvhvg3HH7AFp3JWPwGQE1V9MVwCE3Hj8PNHtEUP492Pyxwl45DmYMEt4baz+TRBDJ2v1K7kk4ux
	7h4+bNkOEEhfnJyV/A1DyT1l2PDgXy6GDLJkFZuDa+C/SOYQ5tdnUz6u6xxOgiLIt5D2S5tYmPtVq
	DqBMBqaWP8BN9Ja4BPYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyMY-0000000BBlw-35Ud;
	Thu, 20 Aug 2026 08:43:02 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyMW-0000000BBlI-3s6X
	for opensbi@lists.infradead.org;
	Thu, 20 Aug 2026 08:43:02 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso2220560a91.3
        for <opensbi@lists.infradead.org>; Thu, 20 Aug 2026 01:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787215380; x=1787820180; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QvtqpsJIvXeqrS6MkgayRHREQIbPc/OkHNkS7HyXEvo=;
        b=DPXpXwh7u93fiqpgNPZXeJafAncEo257GMOXOHjUrEs7pqPhFA+kut0awo23jYLSLJ
         qTPncBEGX9cCHci+/j8AT1JsnYSotkZIxhGW0T+y4axPXeLM0d/k91cNI1dVnxbeiX4B
         wRdVc8E5jGjp51Y2KSxlcsGiBTi5qp4DrD8MiSnvfbOtSgGl96QHiH43DjVrC/Oy58ge
         J11KLBKS5lbLI59Rq6TaItalUZig4P8fdjnv6zwdhK6VAALPD7pPtg8bgf9MrNI1Kxas
         60am9APvqkTxhkeMLeH6gF2S7QApoMKsuUllvJocwx8RRcz0hKQ6gstzsRTTDxnUAU6o
         GkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787215380; x=1787820180;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QvtqpsJIvXeqrS6MkgayRHREQIbPc/OkHNkS7HyXEvo=;
        b=J/98GRsLMK1I+NzRHsVo2E0oINP+IXJIuPSgrMCQyZ0cNi7BCQbGN+KreYY+WQM6RR
         C6T8TzE6EGsK7L74hRHcLg2l65lLrvRZpFbrkBkLTJ4Oh1h+pQodkjYKU/IAx22i5FWg
         MkXcsPTzrWveMM4EUL8V0+maemVW0hVorsj7clkquzL0GiFR4F8PsQ5OolyAsDmgz2qq
         ythBBmduzI7/mLu+NKDcXcQlPblb6J16laCPVf/WoR2dZbvxRuioiczRwgdDVBuvExNa
         B370+3w9kUV5vPsgho6O7ZhnuQ+kq1ElXcHE/Y8Mr37NyR5q0u2EYMddjPVpLOa3/sr+
         1SpA==
X-Forwarded-Encrypted: i=1; AHgh+RoqkTf/CeOKvs1CCZAlnPuAxH173+PdGFiI3KK8QExaEMiL0MAMpXg1V5TJMZM/qdg9EuFS3o9N@lists.infradead.org
X-Gm-Message-State: AFuF++ktpz2R4xTW4K8NC8RKgypvM+udlbWXi7nTmyOObBMc15lvz0u4
	+n30kzGFZAsOvR8NAi+kQbSqba7AVbNhygUVzpJ3ms+MoJINZjxg/Q21
X-Gm-Gg: AR+sD11Ks7yTG5+0oTb7PNTDml4+jdwLUNAWcf9/kdy+9VNbrIHYxPsaGuKsFfQK7Yw
	hpSWPUXeSD7HPteD0qjeBqdQe0UFnr3UZvCn832ylCxXU2niHUtFAowvq0jjYcLY9P1DyyAcZa8
	3ZaldjDXQptSelxgK5dlAi6BLo1KdOR4DiEkpCch3vrAZRWdxwfoGg020fjlB1+78+vVpyId1Ld
	JtectWcIpBHJm2Ckr+lKIk/CgWVtYhqUskO9eDjX55HEqYQyH+1m7Rj51B3jlO5/C2drGCeAi42
	i20RpMQjDwrgoedXFmwpv6sQgbhtvQAEaOVOvYxdCnlsaStlnaMRNW+XBBxZE93MLNlXqXoQyp1
	zZW7a8EV/FXC5MpSh1eb3TqfuLxDWXEW0izpeKCgaldZaF0hbBg2Ou626aEvZ86Q5rkw6uhhqVp
	0FD4lRfL4qV4+YWIzXHGhloylbe7/IikRUbiphlnEY4FZguJldS2/47+MOXA50kLv42CArqchQ
X-Received: by 2002:a17:90b:4c44:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-395810857dbmr18339720a91.9.1787215379715;
        Thu, 20 Aug 2026 01:42:59 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fbbb8d5sm6347125a91.14.2026.08.20.01.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 01:42:59 -0700 (PDT)
Message-ID: <9c659e54-6a26-45b4-a92f-1915fcf5f6e9@gmail.com>
Date: Thu, 20 Aug 2026 01:42:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] platform: generic: spacemit: k1: move hart init to
 nascent hook
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>,
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>
References: <20260818-spacemit-k3-v2-0-84cb7773a481@linux.spacemit.com>
 <20260818-spacemit-k3-v2-3-84cb7773a481@linux.spacemit.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260818-spacemit-k3-v2-3-84cb7773a481@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_014300_970043_F19238BD 
X-CRM114-Status: GOOD (  16.39  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

On 8/17/26 18:14, Troy Mitchell wrote:
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

Reviewed-by: Bo Gan <ganboing@gmail.com>

Bo

> ---
>   platform/generic/spacemit/k1.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/platform/generic/spacemit/k1.c b/platform/generic/spacemit/k1.c
> index 7ee5f17a..19a9b27c 100644
> --- a/platform/generic/spacemit/k1.c
> +++ b/platform/generic/spacemit/k1.c
> @@ -8,6 +8,7 @@
>    */
>   
>   #include <platform_override.h>
> +#include <sbi/riscv_asm.h>
>   #include <sbi/riscv_io.h>
>   #include <sbi/sbi_hsm.h>
>   #include <spacemit/k1.h>
> @@ -86,16 +87,23 @@ static int spacemit_k1_early_init(bool cold_boot)
>   	return 0;
>   }
>   
> -static bool spacemit_cold_boot_allowed(u32 hartid)
> +static int spacemit_k1_nascent_init(void)
>   {
> -	csr_set(CSR_ML2SETUP, 1 << (hartid % PLATFORM_MAX_CPUS_PER_CLUSTER));
> +	csr_set(CSR_ML2SETUP,
> +		1 << (current_hartid() % PLATFORM_MAX_CPUS_PER_CLUSTER));
> +
> +	return generic_nascent_init();
> +}
>   
> +static bool spacemit_cold_boot_allowed(u32 hartid)
> +{
>   	return !hartid;
>   }
>   
>   static int spacemit_k1_platform_init(const void *fdt, int nodeoff,
>   				     const struct fdt_match *match)
>   {
> +	generic_platform_ops.nascent_init = spacemit_k1_nascent_init;
>   	generic_platform_ops.early_init = spacemit_k1_early_init;
>   	generic_platform_ops.cold_boot_allowed = spacemit_cold_boot_allowed;
>   
> 


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
