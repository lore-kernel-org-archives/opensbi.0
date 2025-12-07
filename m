Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19493D1CDC6
	for <opensbi@archiver.kernel.org>; Sun,  7 Dec 2025 11:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uqzVFuVaYgFP7eneOAEH85lOvDU5drLdS5ygQVnx7+g=; b=YwRfHHrotdhQz5
	cRjzxWxZdFNGkAcI2rQVZ+tyE/fTN56Utn6u1JdxS8qqR2Sfj11kYTW9icWfTfA+UT0TO0VBbmHwx
	LtADcX4FqtnjlD/WYaYQhazjKHhr/2LwArQQIvrbM3eJRnpV8lIqMx12BwpnI7J7Eqx8FTWESxbot
	a/QFqc/H23tQws7O+2iI7tC552qhxY8g2jFAxGW0FflZl4na7yK4enADTwQ1+RWF1Y/QD2w6bGMj3
	o/UIieEfZezOqPDdbzVAqtLfwiykGLilcvEIGfouO/uHVQxAwYmELNUua5yNyJPU7HvTVQ0gpQmk9
	LXHS6zaVUCH668U8V7IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSCfJ-0000000BhLh-3JuP;
	Sun, 07 Dec 2025 11:10:57 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSCfG-0000000BhKt-3XHI
	for opensbi@lists.infradead.org;
	Sun, 07 Dec 2025 11:10:56 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3438d4ae152so3254750a91.1
        for <opensbi@lists.infradead.org>; Sun, 07 Dec 2025 03:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1765105854; x=1765710654; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OcurjHiY+PECCWBhqVy9+fDPC6IDXjh5LVI2YqLpPtU=;
        b=AZS3j+67LIP0AUP2XDU6mpoco8gMQ/glJZ9rIg+pVyv9YvjNy7B+j/a6sWZ8jMeuXu
         Jy/D9+DDQ1s2UmPBg/+g2zXmLuyfWbI2dIOsoM+QvOtl+K8tjJPw+tIwz2LUtuQZ0ivk
         9tqRIS6U4O0+I+Ph/E/lQD8EjBSNHVLk2DLyRmTSvln+b64emNPMM7sAQtKXSv9Hm7e5
         iN2ee78biYYEg/l5KYyex01Ew1J6KYqge+DeDMuZCDg9qbdvsOddygNjON8bG6nMbMWa
         VGC5bGZkAxc+WtAHDdre4K1upK4H3aEtw3HMcrGm2VqPdsRxJIw2DWlLd9Dz88Iu3KH8
         C7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765105854; x=1765710654;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OcurjHiY+PECCWBhqVy9+fDPC6IDXjh5LVI2YqLpPtU=;
        b=hLXfhs2dq8LY5nd6ZjasCDXBmycuxVbTvHmLS448q+RYl587LGKETtFYnstbd27QRn
         eHJhPXyHZNAPPaGGNRb6MkiP53ExmKjR6/vA5R83SHS8rqN34CA8oox3FJX35e/G/a95
         Kj9nwpvbqomMRimC11rrrcbH5AKQmw7rk9AoVHOkxGE75agX5PWOkTuGXHRyBa6J1QWo
         sORbZ/7xR3Qf97U6i6KSHrxBFBf1pDFPTes9MUm982uDrzPPDUj1I2L0hJVkG4Z1AruA
         KR3iOyVHw7vtyi3y15uL5OTQNBSvcqgZ0SGAiwL+r2C0uJbsM7iiLh8VbXGiqQgb86BO
         Wc4g==
X-Forwarded-Encrypted: i=1; AJvYcCWV83q9O178VHDwQNhB/AQWhGhCJunvEMJIZcknNqG1RtZNBOahJ2pouNOiGMOj7Rklzi+zUCVX@lists.infradead.org
X-Gm-Message-State: AOJu0YxkAPPRiPJ/UNi2Rta8mwe5ySusF2hZyLYSRP4XR2yVUBQ5X51h
	kpLebkE9xeET+/VkyoYE+BVYeVNUAB8MDdL5EyOsl7ipvOo0pTSjBWa6y4iMlsbSn/A=
X-Gm-Gg: ASbGncsg54vp5K9neEc/+appPysghCCoLLQTDsNmdCxBrrASjlyFJausN+ywKN+XiDE
	EsC7iGxg1kspYIQURNmUPxlaF4pxIGi9H9FUEDMekxFfgvW50eH4jEWRYMiamf6KQSSLnAl3HlB
	AZNcGVV0zw40kEiIFKizOlJbbh56a4x5sJMABKAB0/+IlmhJzw4wHRGqKnq9dpCW+x7zxDngXHP
	M4jiwUv2K85XG/HArwJ6yOLit5Ed6VE79e9bae3/C/pmMKyypITrJEUu4v1CY48yOwzOP/H9DAH
	QHzdSjqmdZqfZPjSIqwokDkkz4hsnz3Fs28rrpGblubDJPew4heEFfL67qCLSUjIaS9TKJzbejy
	ZTcQWg9lhQjCpGEgXPpCvaz6NaJemd0E2K+7kvkJmPf8tWN/AJlJCQrPpPB3GLhPi7ij7T1OyHv
	CMfZ5G8ojbqKaOx6m+2QlY4/HUugS84OY=
X-Google-Smtp-Source: AGHT+IFtz0nqyTrXlPCoRGSk2NmiCS6uK/th62SLFysB8zV1CeiOqE/ljnlp0Aptx22pELFhPUWAJQ==
X-Received: by 2002:a17:90b:5627:b0:343:7f04:79c1 with SMTP id 98e67ed59e1d1-349a24f29b9mr3369872a91.9.1765105853948;
        Sun, 07 Dec 2025 03:10:53 -0800 (PST)
Received: from [100.64.0.1] ([165.225.110.109])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3494ea63e87sm9089988a91.12.2025.12.07.03.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Dec 2025 03:10:53 -0800 (PST)
Message-ID: <7f6a63bc-5903-4963-a116-882d68e76936@sifive.com>
Date: Sun, 7 Dec 2025 05:10:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] lib: sbi: Introduce hart protection abstraction
To: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 opensbi@lists.infradead.org
References: <20251126141845.248697-1-apatel@ventanamicro.com>
 <20251126141845.248697-3-apatel@ventanamicro.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20251126141845.248697-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_031054_904512_54E55DA3 
X-CRM114-Status: GOOD (  26.47  )
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

On 2025-11-26 8:18 AM, Anup Patel wrote:
> Currently, PMP and ePMP are the only hart protection mechanisms
> available in OpenSBI but new protection mechanisms (such as Smmpt)
> will be added in the near future.
> 
> To allow multiple hart protection mechanisms, introduce hart
> protection abstraction and related APIs.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_hart_protection.h |  88 ++++++++++++++++++++++++
>  lib/sbi/objects.mk                |   1 +
>  lib/sbi/sbi_hart_protection.c     | 110 ++++++++++++++++++++++++++++++
>  lib/sbi/sbi_init.c                |   5 ++
>  4 files changed, 204 insertions(+)
>  create mode 100644 include/sbi/sbi_hart_protection.h
>  create mode 100644 lib/sbi/sbi_hart_protection.c
> 
> diff --git a/include/sbi/sbi_hart_protection.h b/include/sbi/sbi_hart_protection.h
> new file mode 100644
> index 00000000..c9e452db
> --- /dev/null
> +++ b/include/sbi/sbi_hart_protection.h
> @@ -0,0 +1,88 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2025 Ventana Micro Systems Inc.
> + */
> +
> +#ifndef __SBI_HART_PROTECTION_H__
> +#define __SBI_HART_PROTECTION_H__
> +
> +#include <sbi/sbi_types.h>
> +#include <sbi/sbi_list.h>
> +
> +struct sbi_scratch;
> +
> +/** Representation of hart protection mechanism */
> +struct sbi_hart_protection {
> +	/** List head */
> +	struct sbi_dlist head;
> +
> +	/** Name of the hart protection mechanism */
> +	char name[32];
> +
> +	/** Ratings of the hart protection mechanism (higher is better) */
> +	unsigned long rating;
> +
> +	/** Configure protection for current HART (Mandatory) */
> +	int (*configure)(struct sbi_scratch *scratch);
> +
> +	/** Unconfigure protection for current HART (Mandatory) */
> +	void (*unconfigure)(struct sbi_scratch *scratch);
> +
> +	/** Create temporary mapping to access address range on current HART (Optional) */
> +	int (*map_range)(struct sbi_scratch *scratch,
> +			 unsigned long base, unsigned long size);
> +
> +	/** Destroy temporary mapping on current HART (Optional) */
> +	int (*unmap_range)(struct sbi_scratch *scratch,
> +			   unsigned long base, unsigned long size);
> +};
> +
> +/**
> + * Get the best hart protection mechanism
> + *
> + * @return pointer to best hart protection mechanism
> + */
> +struct sbi_hart_protection *sbi_hart_protection_best(void);
> +
> +/**
> + * Register a hart protection mechanism
> + *
> + * @return 0 on success and negative error code on failure
> + */
> +int sbi_hart_protection_register(struct sbi_hart_protection *hprot);
> +
> +/**
> + * Unregister a hart protection mechanism
> + *
> + * @return 0 on success and negative error code on failure
> + */
> +int sbi_hart_protection_unregister(struct sbi_hart_protection *hprot);
> +
> +/**
> + * Configure protection for current HART
> + *
> + * @return 0 on success and negative error code on failure
> + */
> +int sbi_hart_protection_configure(struct sbi_scratch *scratch);
> +
> +/**
> + * Unconfigure protection for current HART
> + */
> +void sbi_hart_protection_unconfigure(struct sbi_scratch *scratch);
> +
> +/**
> + * Create temporary mapping to access address range on current HART
> + *
> + * @return 0 on success and negative error code on failure
> + */
> +int sbi_hart_protection_map_range(unsigned long base, unsigned long size);
> +
> +/**
> + * Destroy temporary mapping to access address range on current HART
> + *
> + * @return 0 on success and negative error code on failure
> + */
> +int sbi_hart_protection_unmap_range(unsigned long base, unsigned long size);

These functions should document (or take a parameter for) the permissions of the
temporary mapping. "saddr" sort of documents that for the existing functions.

> +
> +#endif /* __SBI_HART_PROTECTION_H__ */
> diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
> index 8abe1e8e..51588cd1 100644
> --- a/lib/sbi/objects.mk
> +++ b/lib/sbi/objects.mk
> @@ -75,6 +75,7 @@ libsbi-objs-y += sbi_emulate_csr.o
>  libsbi-objs-y += sbi_fifo.o
>  libsbi-objs-y += sbi_fwft.o
>  libsbi-objs-y += sbi_hart.o
> +libsbi-objs-y += sbi_hart_protection.o
>  libsbi-objs-y += sbi_heap.o
>  libsbi-objs-y += sbi_math.o
>  libsbi-objs-y += sbi_hfence.o
> diff --git a/lib/sbi/sbi_hart_protection.c b/lib/sbi/sbi_hart_protection.c
> new file mode 100644
> index 00000000..831072ad
> --- /dev/null
> +++ b/lib/sbi/sbi_hart_protection.c
> @@ -0,0 +1,110 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2025 Ventana Micro Systems Inc.
> + */
> +
> +#include <sbi/sbi_error.h>
> +#include <sbi/sbi_hart_protection.h>
> +#include <sbi/sbi_scratch.h>
> +
> +static SBI_LIST_HEAD(hart_protection_list);
> +
> +struct sbi_hart_protection *sbi_hart_protection_best(void)
> +{
> +	if (sbi_list_empty(&hart_protection_list))
> +		return NULL;
> +
> +	return sbi_list_first_entry(&hart_protection_list, struct sbi_hart_protection, head);
> +}
> +
> +int sbi_hart_protection_register(struct sbi_hart_protection *hprot)
> +{
> +	struct sbi_hart_protection *pos = NULL;
> +	bool found_pos = false;
> +
> +	if (!hprot)
> +		return SBI_EINVAL;
> +
> +	sbi_list_for_each_entry(pos, &hart_protection_list, head) {
> +		if (hprot->rating > pos->rating) {
> +			found_pos = true;
> +			break;
> +		}
> +	}
> +
> +	if (found_pos)
> +		sbi_list_add_tail(&hprot->head, &pos->head);
> +	else
> +		sbi_list_add_tail(&hprot->head, &hart_protection_list);
> +
> +	return 0;
> +}
> +
> +int sbi_hart_protection_unregister(struct sbi_hart_protection *hprot)
> +{
> +	struct sbi_hart_protection *pos = NULL;
> +	bool found_pos = false;
> +
> +	if (!hprot)
> +		return SBI_EINVAL;
> +
> +	sbi_list_for_each_entry(pos, &hart_protection_list, head) {
> +		if (hprot == pos) {
> +			found_pos = true;
> +			break;
> +		}
> +	}
> +
> +	if (!found_pos)
> +		return SBI_ENOENT;
> +
> +	sbi_list_del(&hprot->head);
> +	return 0;

I don't think this function is needed. ISA extensions aren't going to disappear
at runtime. Also, what would you expect to happen if the active hart protection
mechanism is unregistered?

> +}
> +
> +int sbi_hart_protection_configure(struct sbi_scratch *scratch)
> +{
> +	struct sbi_hart_protection *hprot = sbi_hart_protection_best();
> +
> +	if (!hprot)
> +		return SBI_EINVAL;
> +	if (!hprot->configure)
> +		return SBI_ENOSYS;
> +
> +	return hprot->configure(scratch);
> +}

If you only ever use the "best" backend, there is no need to maintain a list,
just a single pointer.

But then that seems too simplistic. We'll probably want to use (e)PMP and Smmpt
together, to avoid splitting huge MPT pages to make M-mode carveouts. So we
would want to loop through all registered protection schemes.

I'm guessing you plan to use an entirely separate set of APIs for system-level
protection schemes like WorldGuard and IOPMP?

Regards,
Samuel

> +
> +void sbi_hart_protection_unconfigure(struct sbi_scratch *scratch)
> +{
> +	struct sbi_hart_protection *hprot = sbi_hart_protection_best();
> +
> +	if (!hprot || !hprot->unconfigure)
> +		return;
> +
> +	hprot->unconfigure(scratch);
> +}
> +
> +int sbi_hart_protection_map_range(unsigned long base, unsigned long size)
> +{
> +	struct sbi_hart_protection *hprot = sbi_hart_protection_best();
> +
> +	if (!hprot)
> +		return SBI_EINVAL;
> +	if (!hprot->map_range)
> +		return 0;
> +
> +	return hprot->map_range(sbi_scratch_thishart_ptr(), base, size);
> +}
> +
> +int sbi_hart_protection_unmap_range(unsigned long base, unsigned long size)
> +{
> +	struct sbi_hart_protection *hprot = sbi_hart_protection_best();
> +
> +	if (!hprot)
> +		return SBI_EINVAL;
> +	if (!hprot->unmap_range)
> +		return 0;
> +
> +	return hprot->unmap_range(sbi_scratch_thishart_ptr(), base, size);
> +}
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index 663b486b..b161d1c1 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -18,6 +18,7 @@
>  #include <sbi/sbi_fwft.h>
>  #include <sbi/sbi_hart.h>
>  #include <sbi/sbi_hartmask.h>
> +#include <sbi/sbi_hart_protection.h>
>  #include <sbi/sbi_heap.h>
>  #include <sbi/sbi_hsm.h>
>  #include <sbi/sbi_ipi.h>
> @@ -74,6 +75,7 @@ static void sbi_boot_print_general(struct sbi_scratch *scratch)
>  	const struct sbi_hsm_device *hdev;
>  	const struct sbi_ipi_device *idev;
>  	const struct sbi_timer_device *tdev;
> +	const struct sbi_hart_protection *hprot;
>  	const struct sbi_console_device *cdev;
>  	const struct sbi_system_reset_device *srdev;
>  	const struct sbi_system_suspend_device *susp_dev;
> @@ -90,6 +92,9 @@ static void sbi_boot_print_general(struct sbi_scratch *scratch)
>  	sbi_printf("Platform Features           : %s\n", str);
>  	sbi_printf("Platform HART Count         : %u\n",
>  		   sbi_platform_hart_count(plat));
> +	hprot = sbi_hart_protection_best();
> +	sbi_printf("Platform HART Protection    : %s\n",
> +		   (hprot) ? hprot->name : "---");
>  	idev = sbi_ipi_get_device();
>  	sbi_printf("Platform IPI Device         : %s\n",
>  		   (idev) ? idev->name : "---");


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
