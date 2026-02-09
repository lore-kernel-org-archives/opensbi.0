Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB9BE94602
	for <opensbi@archiver.kernel.org>; Mon,  9 Feb 2026 20:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CmhxokBpaDfj4pKT7hgiffIF8iG7lk0KAqDgKJWaN4o=; b=Oq6ZdB73yy7Jq5
	ZCHmlSplazIYWDxdaR0jOP9/2VZ3/+32IvCPlfmjnqOX2f18jf0pR9om7Gt8z1lzsI+vU4eXJgM/+
	8yh82deSRWoK+7jnTeZQPDpZKYVx8LkNvpY4/dElAUzz/9uOsQK8gaDiN4gOGx6iE8CYG8mZYqrp/
	uGPWjLB52majBbz07+gxyltJtD54pLHqVIXr6Tmr9agVwY99G9kTGygo0oqBcvFl4AhwVE2PRhlLR
	zlMMqOxLiO+h3paG51aRtez544Pq91fuLxeZqfgtOx8w+esh4ezcJ0d3Mcob8rOYVSWbvGjuMZDIv
	9f11MTXXEKqtzsRzRvgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpXpN-0000000FzL2-06hb;
	Mon, 09 Feb 2026 20:25:49 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpXpJ-0000000FzKc-4A5P
	for opensbi@lists.infradead.org;
	Mon, 09 Feb 2026 20:25:47 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-8c6a822068eso446458185a.3
        for <opensbi@lists.infradead.org>; Mon, 09 Feb 2026 12:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770668742; x=1771273542; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/wXjSJjp/LIfLGlQuCReE4ofQKBf/Me5UhSh7tvwGdA=;
        b=Z8nEm9Kxk+njJEh0AFj5ZY/HuPc+6GHwyL8EF5+NFSxvqs13/j1yoxBUSa9wHuUAH4
         v9/hx04hs8NTo1GZrqZfyBslx1LU2faIlKYZ0k9RQg1GjE57OIbQ4vhh+5kquaE4vWpC
         jMfZ25mlriHk8U8I1ylvNPgvXkUrddPPQmMv5T4mPQtQGagWd0RRGVlwR/wTdGwrDfaR
         mMmD1/XJfpzq7tv3crbplnMzKSwPKPzclBA3LSnNT6kBhZo5I30xNuepWyCgQmloatx1
         fzRuvjrzKRl6Y7w9sYbTfbpA5YZ9L028iRL3ho02S+tBAmiZu9lxI6xlMywifrZbPm0/
         FayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770668742; x=1771273542;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/wXjSJjp/LIfLGlQuCReE4ofQKBf/Me5UhSh7tvwGdA=;
        b=OjhszcSNeAclpnDege9q46LHSMEhZz87xsyKOBC7kfkAQSzaLVnJrpSadRrLq5VC4m
         lu2dNrXZ0OLaAeLVRD2oJAo7cM4YjRf1u8xZlLgoYgwY79bzwSOUZzi7kA0iBEgO0C0h
         PjPt9dDoiyJYW+Nuq8ACqeVVyTn04G+Uzjx6DH5L96wNpoVet//GiBeedHCrrgwbwInI
         co1H4YyqVu+/4+hjJZNlCFwUN7VFLfF9ePtHmzNrF8VHPg+rmLxrxUMreo6zqWoTDQjF
         52W7HJjjg+mn0YnVj604nCOIBD4rGTv/l0+S6FpQylnlPSjh0NdfXWLhQLWYmmsxOFNq
         kXPA==
X-Forwarded-Encrypted: i=1; AJvYcCXLniz7pQsT1Ap4Gl5xAKk+EsIeiuxiumup2jijtFlv5x1ovym/zbzGTYNX27bdrMKcNUqAoRXU@lists.infradead.org
X-Gm-Message-State: AOJu0YxmnH0eRrFx/HWVU0XcNhGPhXcLYUFCVGx3EED6WmGbGA5L88nc
	AJ0G1JfCcGDifTe5EB6yNLSpv/Hst7x6ogtcnL6PWvlKg1QGAUya2rXN
X-Gm-Gg: AZuq6aItub4Y3vU01NOLNM+TMcHEId5fff/60rjicVgcfWNypGu/fUuKWQdbAjLM/9v
	qq7YEYpsxAhrgZM5/kht2TCZdlnMROBdADofdC7ZWqR97XBUmTq4dfIm+4xAb/fqQPlCfQ986d6
	ch4akt0fQQE4TVQEYznF+LC4OM5uHLctbjLwTrVGI2OYGac8WqXPYtFTlBsG2ya4yPpdOGWWbdb
	IaIit5r9MFHq7XuZ8Hf2WyZMLAQ4tmgBg6nQknRHRgQ2LU6v2sbX2GbPMXXK7egQcL/10N1tEvx
	dQsfP92lR2mHPIAeZyg8eH3g5py7WCdA4G3CgD92HGIF66S+Mp7ez7p+kYpNZj9OVCu9L9kLYN/
	nOpY5y4KhBjGCRjWPRpJlHPNjbISxhPdbshcJFpfeW8nQC4JNtIaCRxZGmc0FM0q60jbKZ2ed9k
	WPAgGTOy5e07FWHSMkIDCQ9K/dfuxvTyE5ffHne1nt88ywzNZCZe2Vjh9110qTLTH773yZpR/fU
	lkRyQJy8r9QvNoGQ34=
X-Received: by 2002:a05:620a:45a6:b0:8c0:e5ad:adcc with SMTP id af79cd13be357-8caf1db938emr1700950085a.89.1770668742281;
        Mon, 09 Feb 2026 12:25:42 -0800 (PST)
Received: from [192.168.68.102] (174-138-202-16.cpe.distributel.net. [174.138.202.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cafa4b49casm870908785a.49.2026.02.09.12.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 12:25:42 -0800 (PST)
Message-ID: <0f55c5db-929f-4192-994a-8432c5bda1b4@gmail.com>
Date: Mon, 9 Feb 2026 15:25:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] lib: sbi_irqchip: Support irqchip device targetting
 subset of harts
To: Anup Patel <anup.patel@oss.qualcomm.com>
References: <20260207102602.2917520-1-anup.patel@oss.qualcomm.com>
 <20260207102602.2917520-6-anup.patel@oss.qualcomm.com>
Content-Language: en-CA
Cc: Atish Patra <atish.patra@linux.dev>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Dave Patel <dave.patel@riscstar.com>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, opensbi@lists.infradead.org,
 Anup Patel <anup.patel@oss.qualcomm.com>
From: Raymond Mao <raymondmaoca@gmail.com>
In-Reply-To: <20260207102602.2917520-6-anup.patel@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_122546_077168_1F733D1B 
X-CRM114-Status: GOOD (  26.05  )
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

Hi Anup,

On 2026-02-07 5:25 a.m., anup.patel at oss.qualcomm.com (Anup Patel) wrote:
> It is possible to have platform where an irqchip device targets
> a subset of harts and there are multiple irqchip devices to cover
> all harts.
>
> To support this scenario:
> 1) Add target_harts hartmask to struct sbi_irqchip_device which
>     represents the set of harts targetted by the irqchip device
> 2) Call warm_init() and irq_handle() callbacks of an irqchip device
>     on a hart only if irqchip device targets that particular hart
>
> Signed-off-by: Anup Patel <anup.patel at oss.qualcomm.com>
> ---
>   include/sbi/sbi_irqchip.h |  8 +++++--
>   lib/sbi/sbi_irqchip.c     | 48 ++++++++++++++++++++++++++++-----------
>   lib/utils/irqchip/aplic.c | 12 +++++++++-
>   lib/utils/irqchip/imsic.c |  7 ++++--
>   lib/utils/irqchip/plic.c  |  5 ++--
>   5 files changed, 59 insertions(+), 21 deletions(-)
>
> diff --git a/include/sbi/sbi_irqchip.h b/include/sbi/sbi_irqchip.h
> index cda1e50f..c3ded271 100644
> --- a/include/sbi/sbi_irqchip.h
> +++ b/include/sbi/sbi_irqchip.h
> @@ -10,6 +10,7 @@
>   #ifndef __SBI_IRQCHIP_H__
>   #define __SBI_IRQCHIP_H__
>   
> +#include <sbi/sbi_hartmask.h>
>   #include <sbi/sbi_list.h>
>   #include <sbi/sbi_types.h>
>   
> @@ -20,11 +21,14 @@ struct sbi_irqchip_device {
>   	/** Node in the list of irqchip devices */
>   	struct sbi_dlist node;
>   
> +	/** Set of harts targetted by this irqchip */
> +	struct sbi_hartmask target_harts;
> +
>   	/** Initialize per-hart state for the current hart */
>   	int (*warm_init)(struct sbi_irqchip_device *chip);
>   
>   	/** Process hardware interrupts from this irqchip */
> -	int (*process_hwirqs)(void);
> +	int (*process_hwirqs)(struct sbi_irqchip_device *chip);
>   };
>   
>   /**
> @@ -38,7 +42,7 @@ struct sbi_irqchip_device {
>   int sbi_irqchip_process(void);
>   
>   /** Register an irqchip device to receive callbacks */
> -void sbi_irqchip_add_device(struct sbi_irqchip_device *chip);
> +int sbi_irqchip_add_device(struct sbi_irqchip_device *chip);
>   
>   /** Initialize interrupt controllers */
>   int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot);
> diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
> index 3b970527..77ec05af 100644
> --- a/lib/sbi/sbi_irqchip.c
> +++ b/lib/sbi/sbi_irqchip.c
> @@ -13,24 +13,44 @@
>   
>   static SBI_LIST_HEAD(irqchip_list);
>   
> -static int default_irqfn(void)
> +int sbi_irqchip_process(void)
>   {
> -	return SBI_ENODEV;
> -}
> +	struct sbi_irqchip_device *chip;
> +	int rc = SBI_ENODEV;
>   
> -static int (*ext_irqfn)(void) = default_irqfn;
> +	sbi_list_for_each_entry(chip, &irqchip_list, node) {
> +		if (!chip->process_hwirqs)
> +			continue;
> +		if (!sbi_hartmask_test_hartindex(current_hartindex(), &chip->target_harts))
> +			continue;
> +		rc = chip->process_hwirqs(chip);
> +		if (rc)
> +			break;
> +	}
>   
> -int sbi_irqchip_process(void)
> -{
> -	return ext_irqfn();
> +	return rc;
>   }
>   
> -void sbi_irqchip_add_device(struct sbi_irqchip_device *chip)
> +int sbi_irqchip_add_device(struct sbi_irqchip_device *chip)
>   {
> -	sbi_list_add_tail(&chip->node, &irqchip_list);
> +	struct sbi_irqchip_device *c;
> +	struct sbi_hartmask hm;
> +
> +	if (!chip || !sbi_hartmask_weight(&chip->target_harts))
> +		return SBI_EINVAL;
> +
> +	if (chip->process_hwirqs) {
> +		sbi_list_for_each_entry(c, &irqchip_list, node) {
> +			if (!c->process_hwirqs)
> +				continue;
> +			sbi_hartmask_and(&hm, &c->target_harts, &chip->target_harts);
> +			if (sbi_hartmask_weight(&hm))
> +				return SBI_EINVAL;

I tested this by registering a 'process_hwirqs' hook, but 
'sbi_hartmask_weight' returns errors.

Regards,
Raymond

> +		}
> +	}
>   
> -	if (chip->process_hwirqs)
> -		ext_irqfn = chip->process_hwirqs;
> +	sbi_list_add_tail(&chip->node, &irqchip_list);
> +	return 0;
>   }
>   
>   int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot)
> @@ -48,12 +68,14 @@ int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot)
>   	sbi_list_for_each_entry(chip, &irqchip_list, node) {
>   		if (!chip->warm_init)
>   			continue;
> +		if (!sbi_hartmask_test_hartindex(current_hartindex(), &chip->target_harts))
> +			continue;
>   		rc = chip->warm_init(chip);
>   		if (rc)
>   			return rc;
>   	}
>   
> -	if (ext_irqfn != default_irqfn)
> +	if (!sbi_list_empty(&irqchip_list))
>   		csr_set(CSR_MIE, MIP_MEIP);
>   
>   	return 0;
> @@ -61,6 +83,6 @@ int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot)
>   
>   void sbi_irqchip_exit(struct sbi_scratch *scratch)
>   {
> -	if (ext_irqfn != default_irqfn)
> +	if (!sbi_list_empty(&irqchip_list))
>   		csr_clear(CSR_MIE, MIP_MEIP);
>   }
> diff --git a/lib/utils/irqchip/aplic.c b/lib/utils/irqchip/aplic.c
> index 8d0db168..ea5cb7c4 100644
> --- a/lib/utils/irqchip/aplic.c
> +++ b/lib/utils/irqchip/aplic.c
> @@ -297,8 +297,18 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
>   			return rc;
>   	}
>   
> +	if (aplic->num_idc) {
> +		for (i = 0; i < aplic->num_idc; i++)
> +			sbi_hartmask_set_hartindex(aplic->idc_map[i],
> +						   &aplic->irqchip.target_harts);
> +	} else {
> +		sbi_hartmask_set_all(&aplic->irqchip.target_harts);
> +	}
> +
>   	/* Register irqchip device */
> -	sbi_irqchip_add_device(&aplic->irqchip);
> +	rc = sbi_irqchip_add_device(&aplic->irqchip);
> +	if (rc)
> +		return rc;
>   
>   	/* Attach to the aplic list */
>   	sbi_list_add_tail(&aplic->node, &aplic_list);
> diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
> index 0e9917da..5ec9dff4 100644
> --- a/lib/utils/irqchip/imsic.c
> +++ b/lib/utils/irqchip/imsic.c
> @@ -147,7 +147,7 @@ int imsic_get_target_file(u32 hartindex)
>   	return imsic_get_hart_file(scratch);
>   }
>   
> -static int imsic_process_hwirqs(void)
> +static int imsic_process_hwirqs(struct sbi_irqchip_device *chip)
>   {
>   	ulong mirq;
>   
> @@ -391,7 +391,10 @@ int imsic_cold_irqchip_init(struct imsic_data *imsic)
>   	}
>   
>   	/* Register irqchip device */
> -	sbi_irqchip_add_device(&imsic_device);
> +	sbi_hartmask_set_all(&imsic_device.target_harts);
> +	rc = sbi_irqchip_add_device(&imsic_device);
> +	if (rc)
> +		return rc;
>   
>   	/* Register IPI device */
>   	sbi_ipi_add_device(&imsic_ipi_device);
> diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
> index 7989a962..25cc2787 100644
> --- a/lib/utils/irqchip/plic.c
> +++ b/lib/utils/irqchip/plic.c
> @@ -276,11 +276,10 @@ int plic_cold_irqchip_init(struct plic_data *plic)
>   			continue;
>   
>   		plic_set_hart_data_ptr(sbi_hartindex_to_scratch(i), plic);
> +		sbi_hartmask_set_hartindex(i, &plic->irqchip.target_harts);
>   	}
>   
>   	/* Register irqchip device */
>   	plic->irqchip.warm_init = plic_warm_irqchip_init;
> -	sbi_irqchip_add_device(&plic->irqchip);
> -
> -	return 0;
> +	return sbi_irqchip_add_device(&plic->irqchip);
>   }

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
