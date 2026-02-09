Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECC4E7E0CD
	for <opensbi@archiver.kernel.org>; Mon,  9 Feb 2026 17:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aSc5rQnbNg41h2vjtl/k6gQzD4v+n1E1Ja2aEplm/d8=; b=m9SB5aITSes5Y6
	LyYmJ4t7eCMmCpMJ77rvBRKYxWPRLOzl8fv+V8poZw6gOxMH6dctT9NOc40xu1DlKpKAvQf/SJwaa
	3zcHeqjVMmPk8ifyV1yhtrltzJcpVEYP3MiEuZZSiOO4pFRjA4wzOkJcmvwDyS7PdhzN1hvFwS274
	QSCSa6pQ+HPJBgt9y0MjrsMx1n8pIllfHzoGVfcGrp46QBOui1sgqE/tcirExKMG6SOtI3dUYdh7l
	Ur8gzG0Lfigj6CkCaZ6h+TxO9iya+Vysj7AwHNktnvg1+Zwh4nd63CfoTJV5WzbyNjE0gzP/tbWCq
	wBfIq3i8Xr+Zurn1Anvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpUfo-0000000FjxI-3FhN;
	Mon, 09 Feb 2026 17:03:44 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpUfl-0000000FjwZ-2Wdl
	for opensbi@lists.infradead.org;
	Mon, 09 Feb 2026 17:03:43 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-7927b1620ddso66611907b3.0
        for <opensbi@lists.infradead.org>; Mon, 09 Feb 2026 09:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1770656619; x=1771261419; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C/OL6/PH1t+KrK7wChW4fu+64krPp6Gg3OsHsAw+VK4=;
        b=cR5fa/RqoikmLxi4oyjgtws0zgmFCzz+3a+ff5lN87Pj/Vs2saQCPLLMiMfGkW/mkd
         oVdAHT4AQ+xfZ5N7ryyo8OgieColEgD+eLbXuB+7NoH1XWUaRCzxdFUrDBfVIpy/gIil
         pkevk49m5Vyc2q4M7OJbLO6CxkddnyMfeVQu8tEKW8nkwCmmfKj/4WWoluXn2ED9h+4c
         Sq6P3ty9tlMYJ/Aj2OQ0l79z+LYc/gdWfkF/qzoKo6GVvMw6APcFNEOSYzgl2D3MsjzY
         Pv13DYSHk3fI54HM/1+GGjqt29WW3fAb0Do1ChlGgyy46CQfJ4wZnC+D4mhfeCLyBEif
         OVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770656619; x=1771261419;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C/OL6/PH1t+KrK7wChW4fu+64krPp6Gg3OsHsAw+VK4=;
        b=nA580s3BoKECaT4pTshy2qTGJXvrgFaGFTTvLJoM/i0TzHPSw8+yz54Man9gsz8TKn
         Ed2rmgln0L2CR3/n5yaEHh6uCv09ia+QDImKXn63ic+Jn+gODTC6SD3srznlspelc9/0
         YWuHZvKBn+jp+PGcn9tBTxGRzyM1nEV6ivwBo3Ttc2b8Ezx6JIC9k96+yDHWnq1hDnxO
         W65WK7dFnXQ9NhlMKd5c1yGWTq7SYEm2KD6aT236wyKvDyAH1hO5yFuML9cPJtyH6Ljo
         pihGBfSDSvC8Zvwd93/qcl3znM6rZ+a5wvBgOXsTMs2lGyptcp0T5DMp+AL1Aux9GzWE
         VjgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpwvxjmIlNQsnpTaiEgK4sAyMJr67gLDypmG/eRCgZs5fEh+k2aPNvFvwRg8eU+EES8E6x6Ez3@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4ILJAQN0LD2t9bv2HwHlQjAyiuFvdVHCOQ3VYatrmKAAzALUq
	u7Ozt3N0QakDdbzSrKODSO2NGiNNrm+ISOsGNZDucemt+5MEasM66/3gAQAczW6VXf4=
X-Gm-Gg: AZuq6aI7pNKa4G/DjQ3zTxRwYL1ktmBnhzGjYn6HhikSl4LmM5Od05F1gU4iNEWTJhT
	jOrDeL7YM9TSMB8g4beGetDN4ZZXdhaJc+6dvi/8H+LDbbVMmxWPHsbOa2779JS6wDP4lWc+Eq5
	hdGl4MTYmyJhN2/FCcrbc9DfEIMwjEv4uTrnLPkmbt2sYo/jzt9l8es3uiT5uWUxHrsZAxLa9yG
	WoV3dS9qD8/Z6j55ajiZxI1noZVYIaY5q3C/DG3pe0mozHtfo3pp8ZLX4MsGiCUhTSA2uGM0chc
	MA5p24ONC2y9R/yjKnR5R21tVBL1i+p4vXJUVKaRGvUyWsBeHDjww1SataQ9ji0dl81SrFQySaY
	ebcaAIXU9Jf/43oBT+HV1lq7jCeOAGcA+P2Qqlt1A4qT6+TPFRphjzq+PenMumU0xmOeMIbBYHS
	QA5TJ5E9CSRRG968WgGEe72EacQ4ho7w==
X-Received: by 2002:a05:690c:fc6:b0:796:32e3:7d1a with SMTP id 00721157ae682-7965c2c0745mr1113047b3.17.1770656618566;
        Mon, 09 Feb 2026 09:03:38 -0800 (PST)
Received: from [100.64.0.1] ([165.225.37.110])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-796285d0c51sm78528967b3.45.2026.02.09.09.03.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 09:03:38 -0800 (PST)
Message-ID: <9f0f5554-fbec-44ca-a3a1-760a6366975e@sifive.com>
Date: Mon, 9 Feb 2026 11:03:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] lib: sbi_irqchip: Support irqchip device targetting
 subset of harts
To: Anup Patel <anup.patel@oss.qualcomm.com>,
 Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Raymond Mao <raymond.mao@riscstar.com>, Dave Patel
 <dave.patel@riscstar.com>, Anup Patel <anup@brainfault.org>,
 opensbi@lists.infradead.org
References: <20260207102602.2917520-1-anup.patel@oss.qualcomm.com>
 <20260207102602.2917520-6-anup.patel@oss.qualcomm.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260207102602.2917520-6-anup.patel@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_090341_689390_132BAE4A 
X-CRM114-Status: GOOD (  28.45  )
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

Hi Anup,

On 2026-02-07 4:25 AM, Anup Patel wrote:
> It is possible to have platform where an irqchip device targets
> a subset of harts and there are multiple irqchip devices to cover
> all harts.
> 
> To support this scenario:
> 1) Add target_harts hartmask to struct sbi_irqchip_device which
>    represents the set of harts targetted by the irqchip device
> 2) Call warm_init() and irq_handle() callbacks of an irqchip device
>    on a hart only if irqchip device targets that particular hart
> 
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> ---
>  include/sbi/sbi_irqchip.h |  8 +++++--
>  lib/sbi/sbi_irqchip.c     | 48 ++++++++++++++++++++++++++++-----------
>  lib/utils/irqchip/aplic.c | 12 +++++++++-
>  lib/utils/irqchip/imsic.c |  7 ++++--
>  lib/utils/irqchip/plic.c  |  5 ++--
>  5 files changed, 59 insertions(+), 21 deletions(-)
> 
> diff --git a/include/sbi/sbi_irqchip.h b/include/sbi/sbi_irqchip.h
> index cda1e50f..c3ded271 100644
> --- a/include/sbi/sbi_irqchip.h
> +++ b/include/sbi/sbi_irqchip.h
> @@ -10,6 +10,7 @@
>  #ifndef __SBI_IRQCHIP_H__
>  #define __SBI_IRQCHIP_H__
>  
> +#include <sbi/sbi_hartmask.h>
>  #include <sbi/sbi_list.h>
>  #include <sbi/sbi_types.h>
>  
> @@ -20,11 +21,14 @@ struct sbi_irqchip_device {
>  	/** Node in the list of irqchip devices */
>  	struct sbi_dlist node;
>  
> +	/** Set of harts targetted by this irqchip */
> +	struct sbi_hartmask target_harts;
> +
>  	/** Initialize per-hart state for the current hart */
>  	int (*warm_init)(struct sbi_irqchip_device *chip);
>  
>  	/** Process hardware interrupts from this irqchip */
> -	int (*process_hwirqs)(void);
> +	int (*process_hwirqs)(struct sbi_irqchip_device *chip);
>  };
>  
>  /**
> @@ -38,7 +42,7 @@ struct sbi_irqchip_device {
>  int sbi_irqchip_process(void);
>  
>  /** Register an irqchip device to receive callbacks */
> -void sbi_irqchip_add_device(struct sbi_irqchip_device *chip);
> +int sbi_irqchip_add_device(struct sbi_irqchip_device *chip);
>  
>  /** Initialize interrupt controllers */
>  int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot);
> diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
> index 3b970527..77ec05af 100644
> --- a/lib/sbi/sbi_irqchip.c
> +++ b/lib/sbi/sbi_irqchip.c
> @@ -13,24 +13,44 @@
>  
>  static SBI_LIST_HEAD(irqchip_list);
>  
> -static int default_irqfn(void)
> +int sbi_irqchip_process(void)
>  {
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

This is a hot path (used for IPIs already), so I would recommend using a
per-hart pointer to the top-level chip that gets set in
sbi_irqchip_add_device(), so there is no lookup needed here.

> +	}
>  
> -int sbi_irqchip_process(void)
> -{
> -	return ext_irqfn();
> +	return rc;
>  }
>  
> -void sbi_irqchip_add_device(struct sbi_irqchip_device *chip)
> +int sbi_irqchip_add_device(struct sbi_irqchip_device *chip)
>  {
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
> +		}
> +	}
>  
> -	if (chip->process_hwirqs)
> -		ext_irqfn = chip->process_hwirqs;
> +	sbi_list_add_tail(&chip->node, &irqchip_list);
> +	return 0;
>  }
>  
>  int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot)
> @@ -48,12 +68,14 @@ int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot)
>  	sbi_list_for_each_entry(chip, &irqchip_list, node) {
>  		if (!chip->warm_init)
>  			continue;
> +		if (!sbi_hartmask_test_hartindex(current_hartindex(), &chip->target_harts))
> +			continue;
>  		rc = chip->warm_init(chip);
>  		if (rc)
>  			return rc;
>  	}
>  
> -	if (ext_irqfn != default_irqfn)
> +	if (!sbi_list_empty(&irqchip_list))
>  		csr_set(CSR_MIE, MIP_MEIP);

This should only enable interrupts if there is an irqchip targeting the current
hart.

Regards,
Samuel

>  
>  	return 0;
> @@ -61,6 +83,6 @@ int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot)
>  
>  void sbi_irqchip_exit(struct sbi_scratch *scratch)
>  {
> -	if (ext_irqfn != default_irqfn)
> +	if (!sbi_list_empty(&irqchip_list))
>  		csr_clear(CSR_MIE, MIP_MEIP);
>  }
> diff --git a/lib/utils/irqchip/aplic.c b/lib/utils/irqchip/aplic.c
> index 8d0db168..ea5cb7c4 100644
> --- a/lib/utils/irqchip/aplic.c
> +++ b/lib/utils/irqchip/aplic.c
> @@ -297,8 +297,18 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
>  			return rc;
>  	}
>  
> +	if (aplic->num_idc) {
> +		for (i = 0; i < aplic->num_idc; i++)
> +			sbi_hartmask_set_hartindex(aplic->idc_map[i],
> +						   &aplic->irqchip.target_harts);
> +	} else {
> +		sbi_hartmask_set_all(&aplic->irqchip.target_harts);
> +	}
> +
>  	/* Register irqchip device */
> -	sbi_irqchip_add_device(&aplic->irqchip);
> +	rc = sbi_irqchip_add_device(&aplic->irqchip);
> +	if (rc)
> +		return rc;
>  
>  	/* Attach to the aplic list */
>  	sbi_list_add_tail(&aplic->node, &aplic_list);
> diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
> index 0e9917da..5ec9dff4 100644
> --- a/lib/utils/irqchip/imsic.c
> +++ b/lib/utils/irqchip/imsic.c
> @@ -147,7 +147,7 @@ int imsic_get_target_file(u32 hartindex)
>  	return imsic_get_hart_file(scratch);
>  }
>  
> -static int imsic_process_hwirqs(void)
> +static int imsic_process_hwirqs(struct sbi_irqchip_device *chip)
>  {
>  	ulong mirq;
>  
> @@ -391,7 +391,10 @@ int imsic_cold_irqchip_init(struct imsic_data *imsic)
>  	}
>  
>  	/* Register irqchip device */
> -	sbi_irqchip_add_device(&imsic_device);
> +	sbi_hartmask_set_all(&imsic_device.target_harts);
> +	rc = sbi_irqchip_add_device(&imsic_device);
> +	if (rc)
> +		return rc;
>  
>  	/* Register IPI device */
>  	sbi_ipi_add_device(&imsic_ipi_device);
> diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
> index 7989a962..25cc2787 100644
> --- a/lib/utils/irqchip/plic.c
> +++ b/lib/utils/irqchip/plic.c
> @@ -276,11 +276,10 @@ int plic_cold_irqchip_init(struct plic_data *plic)
>  			continue;
>  
>  		plic_set_hart_data_ptr(sbi_hartindex_to_scratch(i), plic);
> +		sbi_hartmask_set_hartindex(i, &plic->irqchip.target_harts);
>  	}
>  
>  	/* Register irqchip device */
>  	plic->irqchip.warm_init = plic_warm_irqchip_init;
> -	sbi_irqchip_add_device(&plic->irqchip);
> -
> -	return 0;
> +	return sbi_irqchip_add_device(&plic->irqchip);
>  }


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
