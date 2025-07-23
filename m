Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA18C83F1A
	for <opensbi@archiver.kernel.org>; Wed, 23 Jul 2025 00:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TpbQT1nCINhby1WIUQ+oS8dwOiHnyfIHc5FE0y3UYWw=; b=usN8m3w8R1Qezp
	XPXHlngRKYmti2MX1vyhLiJ0NFB3Ae/YjSMRMM2HXbdO3qjaVIeC6BZbeDkr1mFM/CDq6Q/7dVBk/
	5rnfxW85LM4wqd8rit5qpYgw4DOWWN9pZ1uOl0aYgB9LpLfq8tTHvv9txGa6+xy4nfQcfpbCos4oP
	cn+WbQBen8lcvL3fgYcgmx7gYfEdfhyjQCg1oietkxDpUXaPwFh0w6+Ivk5wgftoxgCppc4wKt7UG
	eU4Ssbfn6EPl4ATEJWpcKwXxG+RBkt7V2dJlA5uv+KC6GOPQjkbtIaVRB2pMlq/ncvBc5cnYJ3wLG
	v2vDzugk0AnLC/XfYYDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueNBk-00000003ikh-2W0C;
	Wed, 23 Jul 2025 00:18:28 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueNBi-00000003ikF-1Uij
	for opensbi@lists.infradead.org;
	Wed, 23 Jul 2025 00:18:27 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-73e88bc38bbso2693065a34.3
        for <opensbi@lists.infradead.org>; Tue, 22 Jul 2025 17:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1753229905; x=1753834705; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZnL/x4R5U3zInV0lH+LDTox5Wr7piPwX+WWIfS1Wdfg=;
        b=YQ/ZumeR0EnVLe8YQ9Hexdqu6DYk2UxIlQs7WJyTNFM2Hq/BGcOj/DllAwh2r7EtUy
         PCbi0MzgVt9Ur6DQEthumS4ywuEx1Savwl1iwfn6EkfhGoFMEDuTij9+jHi7mYQCpQpe
         jQsZNnSNwx0FUwqPca9Wz8AZlOVdVk8ofuvlhmmcKJTcMiFoa65Pm5TWFYSSf8Jd2BP/
         aufaqOhnJ/wm9eFxXZUF6IaTFEYl+7vKumUGDOGM+S65uHO71+3fGjqFN1OJPgrcveNc
         CeGFwOCwNf7luYZnAOji6nC8lm5EQJGHRWV62NoCKfgb2nthonLt8ur2UoosmpHW9pnB
         u2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753229905; x=1753834705;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnL/x4R5U3zInV0lH+LDTox5Wr7piPwX+WWIfS1Wdfg=;
        b=f6i6pHe0S3larxKBVSWR6KKSU/sSx1JzplHpPpWNUn4q4HWjF1A+WyIb9t3WK1CKDM
         VwbHWiLQ3i1Ja8C2aTtt/d8D/mi/D8Mqc2sahqb8NShPCvq5aC9kiuEsI54bCA0VJf6E
         47ZOude8gJT1jn+ar/2pL0kMY+6fb1e44iyk/A/wbUa4AY2JXtFaCGndBgFqCEmK7Q4K
         k6msxQ9S5uHHuck1IzD6W5zSk+5ety1OGpAGgcfr1Mk9FBWv/7u3VXGxST7rt8Tt8lN0
         nRmGAxxp9lo7s0LjvzDDoLbH62qep5wndaQ8nUY++oZOyoOCYVb3YAt01Bw91J/LRFpr
         NNqA==
X-Forwarded-Encrypted: i=1; AJvYcCWU/Y8pnl+1dpuoW2wfIrxo6fZe3yoRx6iWnhLtx8C2x1WJ8g+dE0x6RJhDDu6ckHZFawyOexmb@lists.infradead.org
X-Gm-Message-State: AOJu0YxpH71eVSXBRX7OMHcnmLRs0oXWSaJWAlzvRLJ3Qz2jBL9VDsBE
	dg0gI/RFmyETFoihcC+FjaVZQW3LjcWArrAiQtc4oltW21VatO7aLWfIt17E5STdsj0=
X-Gm-Gg: ASbGnctUbxyREgvdT8GcoGDYJjIwZuUMRr4WjIgtXIPvudkNBG1cPeR5q7UrSWUPeJX
	JkvnAus4Ve8RYJWqTXaMDE52QgCktEn7KzqEs6Ja5coxEZ6ONHhrXk6IovXBwwMYWuc83+VDLEL
	ihasfl2sKQu2+LiezIHLt4eTdTXami4PVXgdtNXEkTPhWdLAOjnjz6+PXKREiQmaSo1AxIKT2M/
	V6NSkl/bh+Ed791bVgMZjrexM8JzHD60PKZhkf2f4F9rrkwnEneZ/EUuKAjbqsUURcrIfK7PLDs
	uQNGXFMh8wn0jVyk0sGCdhQ01zxyg5URhvL5lxn5LneZxyBcZAuNtiAFy5+8h5sHsdfUxQo4MaP
	xsgPOMc005FRyOdw5niLO/loktaiKcv4sN1ZtwQ==
X-Google-Smtp-Source: AGHT+IHHfN+cuORHpef8IRuxirKcEzrQEfpIIZ33An1lZb2ANtSQI1iIhKsFfspW0Zm8e+c2gcuFqg==
X-Received: by 2002:a05:6830:3e8a:b0:73e:9ebd:9f1e with SMTP id 46e09a7af769-7408051b84cmr597464a34.10.1753229905174;
        Tue, 22 Jul 2025 17:18:25 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.11.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e83560306sm3835499a34.13.2025.07.22.17.18.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 17:18:24 -0700 (PDT)
Message-ID: <7b16297c-3b48-425e-a7bb-176440d21f29@sifive.com>
Date: Tue, 22 Jul 2025 19:18:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] generic: mips: support harts to boot from
 mips_warm_boot
To: Chao-ying Fu <icebergfu@gmail.com>, opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
References: <20250722230414.6815-1-cfu@mips.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20250722230414.6815-1-cfu@mips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_171826_416541_851FF080 
X-CRM114-Status: GOOD (  14.37  )
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

Hi Chao-ying,

On 2025-07-22 6:04 PM, Chao-ying Fu wrote:
> We program reset base for harts (other than hart 0) to boot at
> mips_warm_boot that jumps to _start_warm. This helps to skip some code
> sequence to speed up.
> 
> Signed-off-by: Chao-ying Fu <cfu@mips.com>
> ---
>  platform/generic/mips/p8700.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
> index 888a45c..8c93ebf 100644
> --- a/platform/generic/mips/p8700.c
> +++ b/platform/generic/mips/p8700.c
> @@ -140,6 +140,20 @@ static void power_up_other_cluster(u32 hartid)
>  }
>  #endif
>  
> +static void __attribute__((naked,no_instrument_function,aligned(4096)))

Please follow Jess's suggestion and use an assembly file like we already do for
platform/generic/andes/sleep.S. This will be more reliable than forever fighting
the compiler to keep it from inserting any instructions on its own. (Are you
_sure_ that this list of attributes covers every toolchain and configuration?)

Regards,
Samuel

> +mips_warm_boot(void)
> +{
> +  __asm__ __volatile__(
> +	"	j	_start_warm\n"
> +	"	.align	2\n"
> +	"	j	_start_warm\n"
> +	"	.align	2\n"
> +	"	j	_start_warm\n"
> +	"	.align	2\n"
> +	"	j	_start_warm\n"
> +	);
> +}
> +
>  static int mips_hart_start(u32 hartid, ulong saddr)
>  {
>  	unsigned int stat;
> @@ -150,6 +164,9 @@ static int mips_hart_start(u32 hartid, ulong saddr)
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
