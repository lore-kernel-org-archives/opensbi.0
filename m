Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3335FD1CDC6
	for <opensbi@archiver.kernel.org>; Sun,  7 Dec 2025 10:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hep/E63YcP42LHXXg5xFmeLeB5XqLXTI6eRhVzbZJH0=; b=05K/T6oQ3vtkjW
	/I4n43O2OImt/LfHMe8oQVYCfNjGob6udwd6R8jICr3DZDkBsJbRzQtCW0WwWIFknwNHMkPEWofUI
	onmgjXAL+/0uEjV395Ngi5as9OKgjO/iLw6Fb5Jbue52DXz9Obp4wvxLR4aY/18DCvb6BNhDDXCnL
	53qdycBfqVlEQcNFQJRDXx3WqqbOd7IgUg3Omq+sW5K9X32bA7mgN9lqE6M4MaCm09OdTdDAjIknb
	IID63PRpKkCWU+lbaGiafKdTw/huKfumByrAqws7YCu6OhRMEgFiqm5ZywBwRJ1mfOAMXtaLV4IFQ
	NBG0U5NLzOvpcySGAPmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSCUE-0000000BgcY-0Vzt;
	Sun, 07 Dec 2025 10:59:30 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSCUB-0000000BgbB-0nsf
	for opensbi@lists.infradead.org;
	Sun, 07 Dec 2025 10:59:28 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2984dfae0acso67236235ad.0
        for <opensbi@lists.infradead.org>; Sun, 07 Dec 2025 02:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1765105166; x=1765709966; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PXRjpV+4G86SSs4bXSoMxHaIh4HCiA9THbzh8k0djKo=;
        b=S5yWLDkiQR5/qlQOTkYp7WURiMsReGCQbjP7pHxIbhFytMfYYRdCJrCwGrRf51lOKt
         H96T7NjmcP5uwuLSyxuQ7R1wapZaeNZWqN2cHPxK2JVNI8ZgeRxpO99xnLLLf2kl6vY/
         UFUF4koLgRJRQVU+bbvTKqcw6LAntQD13/5vZ/CyQJXDJnHWIiDoYyAswBkXsJbBXP5x
         46h7O02MsFIKhtudMJkDW+Cqmv0ZZ6NLpbV8be3vN4c0vC+ahbmROE96RzVVwVP19W6S
         moTTf0PQZf8rFAntaTyR8CApYQ4zn7ALuRnQLEOq6fzicPGh4lZVlF9O4oeTiWSz5nGi
         Rt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765105166; x=1765709966;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXRjpV+4G86SSs4bXSoMxHaIh4HCiA9THbzh8k0djKo=;
        b=fuuNJDVqJKwqFT4M1I4giD+/Ix6uFR7wuWIxx/EDwXYo2M5Znp/5V8Zglmt99PFJJR
         bx8OO+jAJ75aHXK+xkbjQ6GLh8r/cYQ4FM5GYkFuTN3VmOIHjBr9ug4l7RM3/4BeWYyk
         21XRgzr6YkrAiAPZmC6a88XloI9sJCKlDJqQ+rBQkALDKouuYx0r15EpkWLicUZ2mjxZ
         2RCi8zoNZTxAHwucTEdpLI12o4PnephibukAuSwFp4ECWn7PEO3BMkOonmKJ2vVW1Exm
         7U46fLoYyk8aPve/TmNAQsX8MESgXcDqtxVxNxGSeE6DnnvycFKt5ye3gjHuf5isijL+
         teRw==
X-Forwarded-Encrypted: i=1; AJvYcCWuM+vpdA9tbLvY+vH98YRiMSPudXTxnEAr7S5Ff1LbV7QzcwwKZsmeh8dJ63OayX+na+lIdyVp@lists.infradead.org
X-Gm-Message-State: AOJu0YzHLpj9q1DG3HmTPlmGfsu9DmG14CvXDM15wH2YFfB3vowboLoR
	W0w1aJCvp1LRSAgeiHFXdUeL+W4D7fWBO+xBhMopix5744u3cIr4CJ3c7q8d0NAUF9zpSU350EE
	DVhKkbSc=
X-Gm-Gg: ASbGncuk1LIW07PJXyenLQ1H/ofJJytMo0bF7dJBNt0y5jH/LtK0A0P4D3u+YurwFYc
	4czJPR0LsJAB1EYIWnOUjzw1vOvo7KRs+JIIuR//i4ObH4P8X1R1BFmPc0/1O/GlM7RQyqYk1O1
	7i5VTFMZ6253olFGlYt4rtMrQuZDTnV5GxncqLKBy8XCtiKX+SrpMyjsLF4odGo5qsEeXyaI0Rs
	Avki7q8EujVtSzugEGPlf8Vcy47mMus2OY0GAZz6L9SJUUX8iod1dGQt02iOw/Ip0eFSCZvu14W
	LNMUSRwvGmTMYpgilC0+XarZ3LzRnmcZ1GfCUL2urTedgmcvRDvSNYZ3FJBaaVXSJh/VdN8tlCj
	0AirzgNx9zxg2xzwrBXMzjbQydwunvPy9jUI/P97SM5Xa6+5v1CJj962kTvmpNRlMCMZG0D53ye
	zwrJTRqlwF+shD1wI=
X-Google-Smtp-Source: AGHT+IEZ7ZOPEwIZYiMrIgAmtJlp3zkxy+s3Cb/B/GzKL0YfCjRK0HFHEU4MNYIXi8QcX2Ljhb1cWA==
X-Received: by 2002:a17:902:f546:b0:295:34ba:7afa with SMTP id d9443c01a7336-29df5deb3ecmr39498725ad.43.1765105166361;
        Sun, 07 Dec 2025 02:59:26 -0800 (PST)
Received: from [100.64.0.1] ([165.225.110.109])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99eab5sm97204985ad.51.2025.12.07.02.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Dec 2025 02:59:25 -0800 (PST)
Message-ID: <3e201cb2-6955-42c4-a566-ba85a32760fb@sifive.com>
Date: Sun, 7 Dec 2025 04:59:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform: thead: restore platform CSR when suspend
To: Xiang W <wxjstz@126.com>, opensbi@lists.infradead.org
Cc: peter.lin@sifive.com, David Li <davidli.li@linux.alibaba.com>,
 Xiang W <wangxiang@iscas.ac.cn>
References: <20251204145901.411369-1-wxjstz@126.com>
 <20251204145901.411369-3-wxjstz@126.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20251204145901.411369-3-wxjstz@126.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_025927_238094_3AFE0145 
X-CRM114-Status: GOOD (  20.19  )
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

Hi Xiang,

On 2025-12-04 8:58 AM, Xiang W wrote:
> Some CSRs in Thead need to be backed up and restored during HART
> suspend.
> 
> Signed-off-by: David Li <davidli.li@linux.alibaba.com>
> Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
> ---
>  .../generic/include/thead/c9xx_encoding.h     |  1 +
>  platform/generic/thead/thead-generic.c        | 53 +++++++++++++++++++
>  2 files changed, 54 insertions(+)
> 
> diff --git a/platform/generic/include/thead/c9xx_encoding.h b/platform/generic/include/thead/c9xx_encoding.h
> index a45b171e..bcbd9e24 100644
> --- a/platform/generic/include/thead/c9xx_encoding.h
> +++ b/platform/generic/include/thead/c9xx_encoding.h
> @@ -16,6 +16,7 @@
>  #define THEAD_C9XX_CSR_MCOUNTEROF	0x7cb
>  #define THEAD_C9XX_CSR_MHINT2		0x7cc
>  #define THEAD_C9XX_CSR_MHINT3		0x7cd
> +#define THEAD_C9XX_CSR_MHINT4		0x7ce
>  #define THEAD_C9XX_CSR_MRADDR		0x7e0
>  #define THEAD_C9XX_CSR_MEXSTATUS	0x7e1
>  #define THEAD_C9XX_CSR_MNMICAUSE	0x7e2
> diff --git a/platform/generic/thead/thead-generic.c b/platform/generic/thead/thead-generic.c
> index ddb4f0bf..63e33849 100644
> --- a/platform/generic/thead/thead-generic.c
> +++ b/platform/generic/thead/thead-generic.c
> @@ -7,6 +7,7 @@
>   */
>  
>  #include <platform_override.h>
> +#include <thead/c9xx_encoding.h>
>  #include <thead/c9xx_errata.h>
>  #include <thead/c9xx_pmu.h>
>  #include <sbi/sbi_const.h>
> @@ -15,10 +16,61 @@
>  #include <sbi/sbi_string.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
>  
> +/* redefine CSR register */
> +#define CSR_MXSTATUS	THEAD_C9XX_CSR_MXSTATUS
> +#define CSR_MHCR	THEAD_C9XX_CSR_MHCR
> +#define CSR_MCCR2	THEAD_C9XX_CSR_MCCR2
> +#define CSR_MHINT	THEAD_C9XX_CSR_MHINT
> +#define CSR_MHINT2_E	THEAD_C9XX_CSR_MHINT2
> +#define CSR_MHINT4	THEAD_C9XX_CSR_MHINT4
> +#define CSR_MSMPR	THEAD_C9XX_CSR_MSMPR
> +#define CSR_SMPEN	CSR_MSMPR
> +
>  struct thead_generic_quirks {
>  	u64	errata;
>  };
>  
> +extern struct sbi_platform platform;
> +
> +static inline bool thead_has_hotplug(void)
> +{
> +	return platform.hart_count > 1;
> +}

Why is non-retentive suspend not applicable when there is only one hart?

> +
> +static void thead_suspend_non_ret_save(unsigned long *data)
> +{
> +	data[0] = csr_read(CSR_SMPEN);
> +	data[1] = csr_read(CSR_MCCR2);
> +	data[2] = csr_read(CSR_MXSTATUS);
> +	data[3] = csr_read(CSR_MHINT);
> +	data[4] = csr_read(CSR_MHCR);
> +	data[5] = csr_read(CSR_MHINT2_E);
> +	data[6] = csr_read(CSR_MHINT4);
> +}

This logic is used by both C908 and C910. Do they both have all of these CSRs?

Also, it looks like similar logic is needed for C906 in
platform/generic/allwinner/sun20i-d1.c.

> +
> +static void thead_suspend_non_ret_restore(unsigned long *data)
> +{
> +	csr_write(CSR_SMPEN, data[0]);
> +	csr_write(CSR_MCCR2, data[1]);
> +	csr_write(CSR_MXSTATUS, data[2]);
> +	csr_write(CSR_MHINT, data[3]);
> +	csr_write(CSR_MHCR, data[4]);
> +	csr_write(CSR_MHINT2_E, data[5]);
> +	csr_write(CSR_MHINT4, data[6]);
> +}
> +
> +static int thead_nascent_init(void)
> +{
> +
> +	if (thead_has_hotplug()) {
> +		platform.suspend_backup_csr_count = 7;
> +		generic_platform_ops.suspend_non_ret_save = thead_suspend_non_ret_save;
> +		generic_platform_ops.suspend_non_ret_restore = thead_suspend_non_ret_restore;

Please modify generic_platform_ops only from inside thead_generic_platform_init.
The nascent_init hook is called on every hart on every entry (including warm
resume), so this is inefficient, and it would crash if we implement a
ro_after_init feature.

Since you need to access platform.hart_count, you can move the
fdt_driver_init_by_offset() call later in fw_platform_init(). This should be
safe for all existing platform overrides.

Regards,
Samuel

> +	}
> +
> +	return generic_nascent_init();
> +}
> +
>  static int thead_tlb_flush_early_init(bool cold_boot)
>  {
>  	thead_register_tlb_flush_trap_handler();
> @@ -44,6 +96,7 @@ static int thead_generic_platform_init(const void *fdt, int nodeoff,
>  {
>  	const struct thead_generic_quirks *quirks = match->data;
>  
> +	generic_platform_ops.nascent_init = thead_nascent_init;
>  	if (quirks->errata & THEAD_QUIRK_ERRATA_TLB_FLUSH)
>  		generic_platform_ops.early_init = thead_tlb_flush_early_init;
>  	if (quirks->errata & THEAD_QUIRK_ERRATA_THEAD_PMU)


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
