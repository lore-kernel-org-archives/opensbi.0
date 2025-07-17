Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9297FC83F1B
	for <opensbi@archiver.kernel.org>; Thu, 17 Jul 2025 00:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s0tiVYBCYZKV7ET7ObYQa67OjrC6u8TeC6yJa0yuJaE=; b=D9606gnEP4dih0
	VJxy4YvH1eb/8VM6m5iotLs/8ZaA8GCxv/gbFr4BMj+/thwXy/TPVENZzKboglgV5wXg/IX19eDEn
	BKHc5CULet+6LyFXgOasBqnt8W3y77uqZ6aYj6rIeRS0HnE4D6sqDAZjrBxnEndE34ZCtXG0rvqiR
	C66aMIsny+dvCACWO2bOUlX0dKvbbc1psgDo74GfB/CmLRYuvLCJVsLE316Ey2X+cDVJDlAQ1yoi3
	owKxdJ1BhiR8PW0tahHRp7H1JzXncJjsK9KRVFB5yL45BjxQ5lS+aJzvjNGv7P18Jk2x4Q8ii5lGb
	iLRyXJiRy8BaT/BWsDuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucC6r-00000008tJp-1jBm;
	Thu, 17 Jul 2025 00:04:25 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucC6o-00000008tJL-3QtM
	for opensbi@lists.infradead.org;
	Thu, 17 Jul 2025 00:04:23 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3e13a58191eso3322595ab.2
        for <opensbi@lists.infradead.org>; Wed, 16 Jul 2025 17:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1752710661; x=1753315461; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n8N5QJSh+WYZSggFWeEVPWpzP3bsOy0t/IPhFaopqoU=;
        b=NRFhggvpnpWCyCn6tOmE4s8K5zlV+WbUl80fZ7WYtFRrg8fbKXKSi032hU5hjA0Okp
         WII9R55jyenogXyGp5Emlk+laRy6nFzq7J8M26Q0V9M4gDmIMKn/J/ROGbHrgdaJMN8F
         tvbyzAxyuvY3Uu7s5YjVVi9ECI2UI3V45cxQ5kPcr33o6fSZE6x9Z2xnOqDRFHH419z6
         fUN1GeXRxjqTXnW0mQQ1hwEuwgdZs8bTBTJz6T6B27lgyPy017fjtL0rtb15eKB9WHp1
         n3DOeLbAlcFFpDybE2Ydh0Ev7s25psow6m9PjToq7FubH7MoJOkgSznpTuctonBT7FGF
         ZVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752710661; x=1753315461;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n8N5QJSh+WYZSggFWeEVPWpzP3bsOy0t/IPhFaopqoU=;
        b=ajEIRZRHqSZeQBTOjORpgsHlJka06R/Sl5p+SLs3q9uNLwM9MjSqUkRarHZC/RO6W+
         wVoiuI4ltG0nqSNYiOuH0WYcjehXDl0VNz1ML9rf0atUfuPuMAc6eFjWxZlLGRJFahRd
         3wzxCsU1E77BuMkf5GGXtSJgYBRgNoYZ5OF5aIMtKf8RUx51Ol4I0iwHP0fF0iiXVRZV
         KgJyu/QfxTM6quczJRAhJ23brdzufYR40nTxqUE7dze9oNSM4gvQFR4bNZT9vyGUDL5l
         v2eszbxL8d0kxrsoJ7XhSEi98WHsFEN3eHPhU6SnD6JQgKaTjJp9sFexRSwWxuvvBWFT
         nBtg==
X-Forwarded-Encrypted: i=1; AJvYcCU044wF+eFFeVqxBmtjiT/WQVjTuZMhNrMfQIy6xEFRlD56xq+26m93P9xeQyThEJ+9bC00dBuu@lists.infradead.org
X-Gm-Message-State: AOJu0YwCxgIWcnkM9ncHN7Lex24O16eb8M7K0W0DlKI8iwAsHs6xj1zC
	e6e/d206MTE6g43F2w9sxlihVSc7kmfrOgZvKxWriF5jxgOTB5nOPopVBPvST6hNKBo=
X-Gm-Gg: ASbGnctJeTWxWUeVwaCmXPsfnd/MjnPyXKu27oX4SSq8d4nwMG/+abxJB/Uh47rbEvU
	eVppL248MciSqwBCpARv4fXoAABtSL6zijKV4qJaePIhv2VQ7QtaVzKfPC28vmrlBS00+gW/BO/
	TuQ9kLazK9gDCoIy/g+gLpWTqUKKGTMMkl/GvUQoKK/MCW96fTVGGn2Onq/bNWHoa3JgyTZhqkO
	U+vgW8anKsFA9a0FtDkAllJpdJ5HaUUg2hmhFCpVMS5eMZhf+VW5N8JQuDBl6+emkF8b69pi/Go
	1dTa5YxZZufFJ4NANgrE6swC6KgVz3l3IabLagKx4sYB7kmpG9RuiJkK+xtpMQgKPADCeJMeUiO
	DJAipf5OkTWaod+JAaXyOev5ga607+eUfioezNA==
X-Google-Smtp-Source: AGHT+IHfaDhKviCCQkOEir3N+j3+Pc3VyXx2a1Xd3pjaWxErRy9JomLqQi2Wfbj2PcATyT4WiL8vtQ==
X-Received: by 2002:a92:d289:0:b0:3df:49fa:7af5 with SMTP id e9e14a558f8ab-3e282523738mr49736985ab.21.1752710661207;
        Wed, 16 Jul 2025 17:04:21 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.11.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-505569cc6c1sm3156999173.104.2025.07.16.17.04.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 17:04:20 -0700 (PDT)
Message-ID: <65346468-9810-4f4a-9360-c588f758184f@sifive.com>
Date: Wed, 16 Jul 2025 19:04:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] generic: mips: support harts to boot from
 mips_warm_boot
To: Chao-ying Fu <icebergfu@gmail.com>, opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
References: <20250710231708.4553-1-cfu@mips.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20250710231708.4553-1-cfu@mips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_170422_883995_18D6DDB8 
X-CRM114-Status: GOOD (  14.64  )
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

On 2025-07-10 6:17 PM, Chao-ying Fu wrote:
> We program reset base for harts (other than hart 0) to boot at
> mips_warm_boot that jumps to _start_warm. This helps to skip some code
> sequence to speed up.
> 
> Signed-off-by: Chao-ying Fu <cfu@mips.com>
> ---
>  platform/generic/mips/p8700.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
> index 888a45c..687912a 100644
> --- a/platform/generic/mips/p8700.c
> +++ b/platform/generic/mips/p8700.c
> @@ -140,6 +140,22 @@ static void power_up_other_cluster(u32 hartid)
>  }
>  #endif
>  
> +static void __attribute__((naked,no_instrument_function,aligned(4096)))
> +mips_warm_boot(void)
> +{
> +  __asm__ __volatile__(
> +	"	j	1f\n"
> +	"	.align	2\n"
> +	"	j	1f\n"
> +	"	.align	2\n"
> +	"	j	1f\n"
> +	"	.align	2\n"
> +	"	j	1f\n"
> +	"1:	lla	t0, _start_warm\n"
> +	"	jr	t0\n"

The double/indirect jump is not necessary. jal (j) range is +/- 1 MiB, which is
much larger than the OpenSBI firmware size. So each entry point can jump to
_start_warm directly.

Regards,
Samuel

> +	);
> +}
> +
>  static int mips_hart_start(u32 hartid, ulong saddr)
>  {
>  	unsigned int stat;
> @@ -150,6 +166,9 @@ static int mips_hart_start(u32 hartid, ulong saddr)
>  	if (hartid == 0)
>  		return SBI_ENOTSUPP;
>  
> +	/* Change reset base to mips_warm_boot */
> +	write_gcr_co_reset_base(hartid, (unsigned long)mips_warm_boot, local_p);
> +
>  	if (cpu_hart(hartid) == 0) {
>  		/* Ensure its coherency is disabled */
>  		write_gcr_co_coherence(hartid, 0, local_p);


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
