Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E98E7E0BC
	for <opensbi@archiver.kernel.org>; Mon,  9 Feb 2026 17:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/5e6G/A05H+g/oNpfZcuvyv2PK2LSb7SCc+Zjsjr/zI=; b=V7QGvc+W/tBU9f
	bow+ReGPN5BGHgwFiCUKL8q+AcDMlbeurSEKK8X2aXf/pcm89ZTnBRJcGZ/TMhrH9A8lD3EebE8HW
	mbue3qgqKM4v6I9NINaJqXFGhXDZotdbcfyg5BdD41fKFXh9u1M/coooGJxWis9oileVP4wHQOpve
	uIemD43nPcYVT2OgbCmeBYwmY9w5o9efXwaK2hZacLyvOpwaN/KDk2qYWeKeGcpDRpLF5L/y7fdCC
	fnsAVrnnJeKuy0TSzxbYhPraX8a+JHtsy5cot2hFoTFCH2LvK0tSSQtP6kDk9VwdPHQvnR5vnlFPG
	IWutpxpnXWFqiA5HEQxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpUvD-0000000FlNh-3Qoj;
	Mon, 09 Feb 2026 17:19:39 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpUvB-0000000FlMh-2CYv
	for opensbi@lists.infradead.org;
	Mon, 09 Feb 2026 17:19:38 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-7948e902fadso41254297b3.1
        for <opensbi@lists.infradead.org>; Mon, 09 Feb 2026 09:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1770657576; x=1771262376; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zU9wxhpUdF3E4u/8+4Dxgqt1zzLZLecNFb9orJwfvN4=;
        b=ccKdhTN+OYIN+0JHzAPKzjf1zKcbWxcux1JQsPGbFs7DyuMqapAGhoiRDkL5+FlvD7
         yBuX9GjQzPk6CXu6lmuntjaPc8iCvDc6GVMFVNwJm7ktRYkpX3YAh2A7x+FIm7xT/cf1
         KO5U3bKI7RiVHs+bhSLarPPkchAcfm3hewHSta/wIq8iKTv+JUj8/luCTrij+M1+sNUr
         qtxweolPh6o9NoxDkAccR6raQ4He+DdA0ySmTEYeihgLe7xp4CxNMUpK38gHVNSOqr89
         2u3ZwFEBkhGMw4FZb86wWnrKaqxx1HL3WAmbn5/X75bAW3TGFncpq1o3pRaNwe/K9Fne
         JNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770657576; x=1771262376;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zU9wxhpUdF3E4u/8+4Dxgqt1zzLZLecNFb9orJwfvN4=;
        b=GQcfowVs0sNGGGNZLPVFBRHIEUxqSiRNr8+LwHHux7utPy+yxIcoIi5d/o2QAwpmzU
         v6wlwIBH2ruvUPXzc/eC6ynXei8Bd6FzFRooc5Huo0wyuZV0E2tYP2bqSCwO1GVq0lAp
         4mfh4BQh5FO4D0/DQKZQFux6U8l/BnuU6B3xbtVF6NWcsJxQGBDHVg0Pbhtgdlx85bHg
         dbWRnrNHnIjvrkDhmuvzH5kHCOOjSq+8lmQexjboATfgP2Wu+d3vm9PsQL+Cx8jlQBuO
         R2cgpkfpVfx3me8apjcYvnSmsjnbkU+31mCurL2n+r9438PI65PVLzpTmdUCu5HCt8eH
         CJSg==
X-Forwarded-Encrypted: i=1; AJvYcCU7lENGN3Naz2ry0uqUOdqegKDNmFJg7KXtUHt9+jpofGQ+UmsAZyeEbnkjkOzSPa/TR/YXL+t+@lists.infradead.org
X-Gm-Message-State: AOJu0YwV5Y/iFvAm1iB1hUTTKmqzjonTfCEqatfoIWs0GGBQCtcpBhbj
	Mutx8Ig+4J3J7O8EOAlSfptCYcKUAo3eTfqVshkcB8o40tjf5kQa/ECNXb0SrXkUoV8=
X-Gm-Gg: AZuq6aLOh5VCL4JnbvELGWDVYEEA1EbnfIxHL0W04ekRYx036wncxadAXpelCCJkJm+
	i6q6zCLzq51SbiIBi6DBhLgV8hrCJC/y1CzIlQBlHtsfNm4m5BKqtTDQ9S2Bv+JKpLngyGPfFiO
	t87SZN+CijgUrVijivj5amKR5xMYQCbmr04UgX5JqFOVD/QZY0InQm+GrFHQWhSfNizjhIQKyX0
	ZKn49f2nFUi8SdbZ/lRf9Z01qlRtiZ4Y8NL4kneBnJRLIlV8EgK4Y+RfkZFCDF3/9XmkvasUsZA
	zfFqzrE7ufzxicoGJXpvc1Esblm9nR+b9sAXwo0zzs94mU6Jr/83Rpv8AiBDb1OWuLAWmo/NXC2
	FETmTqD1K9XLnxJh2OmOiKXInKhobe0OTZqA0+CdhL2dHxBm5t4dwpoNV8B+c+W+sVtRNc+x5mz
	V4LaZFxNmBFXB04RgICBlRUae88blI7DxEe1nFG3kq
X-Received: by 2002:a05:690c:399:b0:794:2fc8:8358 with SMTP id 00721157ae682-7952aa75c07mr104228677b3.6.1770657576221;
        Mon, 09 Feb 2026 09:19:36 -0800 (PST)
Received: from [100.64.0.1] ([165.225.37.110])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7964239b728sm37136087b3.40.2026.02.09.09.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 09:19:35 -0800 (PST)
Message-ID: <b6128819-822f-4c5f-8a10-9384cc355b35@sifive.com>
Date: Mon, 9 Feb 2026 11:19:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] lib: sbi_irqchip: Allow registering interrupt
 handlers
To: Anup Patel <anup.patel@oss.qualcomm.com>,
 Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Raymond Mao <raymond.mao@riscstar.com>, Dave Patel
 <dave.patel@riscstar.com>, Anup Patel <anup@brainfault.org>,
 opensbi@lists.infradead.org
References: <20260207102602.2917520-1-anup.patel@oss.qualcomm.com>
 <20260207102602.2917520-9-anup.patel@oss.qualcomm.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260207102602.2917520-9-anup.patel@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_091937_660381_2EA515B2 
X-CRM114-Status: GOOD (  27.09  )
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

On 2026-02-07 4:26 AM, Anup Patel wrote:
> To handle external interrupts in M-mode, the sbi_irqchip framework
> must allow registering interrupt handlers from device drivers.
> 
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> ---
>  include/sbi/sbi_irqchip.h |  56 ++++++++++-
>  lib/sbi/sbi_irqchip.c     | 202 +++++++++++++++++++++++++++++++++++++-
>  lib/utils/irqchip/aplic.c |   1 +
>  lib/utils/irqchip/imsic.c |   9 ++
>  lib/utils/irqchip/plic.c  |   1 +
>  5 files changed, 267 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sbi/sbi_irqchip.h b/include/sbi/sbi_irqchip.h
> index d2c47ae8..77b54110 100644
> --- a/include/sbi/sbi_irqchip.h
> +++ b/include/sbi/sbi_irqchip.h
> @@ -18,12 +18,21 @@ struct sbi_scratch;
>  
>  /** irqchip hardware device */
>  struct sbi_irqchip_device {
> -	/** Node in the list of irqchip devices */
> +	/** Node in the list of irqchip devices (private) */
>  	struct sbi_dlist node;
>  
> +	/** Internal data of all hardware interrupts of this irqchip (private) */
> +	struct sbi_irqchip_hwirq_data *hwirqs;
> +
> +	/** List of interrupt handlers */
> +	struct sbi_dlist handler_list;
> +
>  	/** Unique ID of this irqchip */
>  	u32 id;
>  
> +	/** Number of hardware IRQs of this irqchip */
> +	u32 num_hwirq;
> +
>  	/** Set of harts targetted by this irqchip */
>  	struct sbi_hartmask target_harts;
>  
> @@ -32,6 +41,21 @@ struct sbi_irqchip_device {
>  
>  	/** Process hardware interrupts from this irqchip */
>  	int (*process_hwirqs)(struct sbi_irqchip_device *chip);
> +
> +	/** Setup a hardware interrupt of this irqchip */
> +	int (*hwirq_setup)(struct sbi_irqchip_device *chip, u32 hwirq);
> +
> +	/** Cleanup a hardware interrupt of this irqchip */
> +	void (*hwirq_cleanup)(struct sbi_irqchip_device *chip, u32 hwirq);
> +
> +	/** End of hardware interrupt of this irqchip */
> +	void (*hwirq_eoi)(struct sbi_irqchip_device *chip, u32 hwirq);
> +
> +	/** Mask a hardware interrupt of this irqchip */
> +	void (*hwirq_mask)(struct sbi_irqchip_device *chip, u32 hwirq);
> +
> +	/** Unmask a hardware interrupt of this irqchip */
> +	void (*hwirq_unmask)(struct sbi_irqchip_device *chip, u32 hwirq);
>  };
>  
>  /**
> @@ -44,6 +68,36 @@ struct sbi_irqchip_device {
>   */
>  int sbi_irqchip_process(void);
>  
> +/**
> + * Process a hwirq of an irqchip device
> + *
> + * This function is called by irqchip drivers to handle hardware
> + * interrupts of the irqchip.
> + */
> +int sbi_irqchip_process_hwirq(struct sbi_irqchip_device *chip, u32 hwirq);
> +
> +/** Unmask a hardware interrupt */
> +int sbi_irqchip_unmask_hwirq(struct sbi_irqchip_device *chip, u32 hwirq);
> +
> +/** Mask a hardware interrupt */
> +int sbi_irqchip_mask_hwirq(struct sbi_irqchip_device *chip, u32 hwirq);
> +
> +/** Default raw hardware interrupt handler */
> +int sbi_irqchip_raw_handler_default(struct sbi_irqchip_device *chip, u32 hwirq);
> +
> +/** Set raw hardware interrupt handler */
> +int sbi_irqchip_set_raw_handler(struct sbi_irqchip_device *chip, u32 hwirq,
> +				int (*raw_hndl)(struct sbi_irqchip_device *, u32));
> +
> +/** Register a hardware interrupt handler */
> +int sbi_irqchip_register_handler(struct sbi_irqchip_device *chip,
> +				 u32 first_hwirq, u32 num_hwirq,
> +				 int (*callback)(u32 hwirq, void *opaque), void *opaque);
> +
> +/** Unregister a hardware interrupt handler */
> +int sbi_irqchip_unregister_handler(struct sbi_irqchip_device *chip,
> +				   u32 first_hwirq, u32 num_hwirq);
> +
>  /** Find an irqchip device based on unique ID */
>  struct sbi_irqchip_device *sbi_irqchip_find_device(u32 id);
>  
> diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
> index fb3357f3..736dde6c 100644
> --- a/lib/sbi/sbi_irqchip.c
> +++ b/lib/sbi/sbi_irqchip.c
> @@ -7,10 +7,35 @@
>   *   Anup Patel <apatel@ventanamicro.com>
>   */
>  
> +#include <sbi/sbi_heap.h>
>  #include <sbi/sbi_irqchip.h>
>  #include <sbi/sbi_list.h>
>  #include <sbi/sbi_platform.h>
>  
> +/** Internal irqchip hardware interrupt data */
> +struct sbi_irqchip_hwirq_data {
> +	/** raw hardware interrupt handler */
> +	int (*raw_handler)(struct sbi_irqchip_device *chip, u32 hwirq);
> +};
> +
> +/** Internal irqchip interrupt handler */
> +struct sbi_irqchip_handler {
> +	/** Node in the list of irqchip handlers (private) */
> +	struct sbi_dlist node;
> +
> +	/** First hardware IRQ handled by this handler */
> +	u32 first_hwirq;
> +
> +	/** Number of consecutive hardware IRQs handled by this handler */
> +	u32 num_hwirq;
> +
> +	/** Callback function of this handler */
> +	int (*callback)(u32 hwirq, void *priv);
> +
> +	/** Callback private data */
> +	void *priv;
> +};
> +
>  static SBI_LIST_HEAD(irqchip_list);
>  
>  int sbi_irqchip_process(void)
> @@ -31,6 +56,172 @@ int sbi_irqchip_process(void)
>  	return rc;
>  }
>  
> +int sbi_irqchip_process_hwirq(struct sbi_irqchip_device *chip, u32 hwirq)
> +{
> +	struct sbi_irqchip_hwirq_data *data;
> +
> +	if (!chip || chip->num_hwirq <= hwirq)
> +		return SBI_EINVAL;
> +
> +	data = &chip->hwirqs[hwirq];
> +	if (!data->raw_handler)
> +		return SBI_ENOENT;
> +
> +	return data->raw_handler(chip, hwirq);
> +}
> +
> +int sbi_irqchip_unmask_hwirq(struct sbi_irqchip_device *chip, u32 hwirq)
> +{
> +	if (!chip || chip->num_hwirq <= hwirq)
> +		return SBI_EINVAL;
> +
> +	if (chip->hwirq_unmask)
> +		chip->hwirq_unmask(chip, hwirq);
> +	return 0;
> +}
> +
> +int sbi_irqchip_mask_hwirq(struct sbi_irqchip_device *chip, u32 hwirq)
> +{
> +	if (!chip || chip->num_hwirq <= hwirq)
> +		return SBI_EINVAL;
> +
> +	if (chip->hwirq_mask)
> +		chip->hwirq_mask(chip, hwirq);
> +	return 0;
> +}
> +
> +static struct sbi_irqchip_handler *sbi_irqchip_find_handler(struct sbi_irqchip_device *chip,
> +							    u32 hwirq)
> +{
> +	struct sbi_irqchip_handler *h;
> +
> +	if (!chip || chip->num_hwirq <= hwirq)
> +		return NULL;
> +
> +	sbi_list_for_each_entry(h, &chip->handler_list, node) {
> +		if (h->first_hwirq <= hwirq && hwirq < (h->first_hwirq + h->num_hwirq))
> +			return h;
> +	}
> +
> +	return NULL;
> +}
> +
> +int sbi_irqchip_raw_handler_default(struct sbi_irqchip_device *chip, u32 hwirq)
> +{
> +	struct sbi_irqchip_handler *h;
> +	int rc;
> +
> +	if (!chip || chip->num_hwirq <= hwirq)
> +		return SBI_EINVAL;
> +
> +	h = sbi_irqchip_find_handler(chip, hwirq);
> +	rc = h->callback(hwirq, h->priv);
> +
> +	if (chip->hwirq_eoi)
> +		chip->hwirq_eoi(chip, hwirq);
> +
> +	return rc;
> +}
> +
> +int sbi_irqchip_set_raw_handler(struct sbi_irqchip_device *chip, u32 hwirq,
> +				int (*raw_hndl)(struct sbi_irqchip_device *, u32))
> +{
> +	struct sbi_irqchip_hwirq_data *data;
> +
> +	if (!chip || chip->num_hwirq <= hwirq)
> +		return SBI_EINVAL;
> +
> +	data = &chip->hwirqs[hwirq];
> +	data->raw_handler = raw_hndl;
> +	return 0;
> +}
> +
> +int sbi_irqchip_register_handler(struct sbi_irqchip_device *chip,
> +				 u32 first_hwirq, u32 num_hwirq,
> +				 int (*callback)(u32 hwirq, void *opaque), void *priv)
> +{
> +	struct sbi_irqchip_handler *h;
> +	u32 i, j;
> +	int rc;
> +
> +	if (!chip || !num_hwirq || !callback)
> +		return SBI_EINVAL;
> +	if (chip->num_hwirq <= first_hwirq ||
> +	    chip->num_hwirq <= (first_hwirq + num_hwirq - 1))
> +		return SBI_EBAD_RANGE;
> +
> +	h = sbi_irqchip_find_handler(chip, first_hwirq);
> +	if (h)
> +		return SBI_EALREADY;
> +	h = sbi_irqchip_find_handler(chip, first_hwirq + num_hwirq - 1);
> +	if (h)
> +		return SBI_EALREADY;
> +
> +	h = sbi_zalloc(sizeof(*h));
> +	if (!h)
> +		return SBI_ENOMEM;
> +	h->first_hwirq = first_hwirq;
> +	h->num_hwirq = num_hwirq;
> +	h->callback = callback;
> +	h->priv = priv;
> +	sbi_list_add_tail(&h->node, &chip->handler_list);
> +
> +	if (chip->hwirq_setup) {
> +		for (i = 0; i < h->num_hwirq; i++) {
> +			rc = chip->hwirq_setup(chip, h->first_hwirq + i);

I would recommend storing the pointer to the sbi_irqchip_handler in each hwirq's
sbi_irqchip_hwirq_data here, so there is no list lookup in the hot path. If you
do that, there doesn't seem to be a need for the second raw_handler level of
function pointer indirection.

Regards,
Samuel

> +			if (rc) {
> +				if (chip->hwirq_cleanup) {
> +					for (j = 0; j < i; j++)
> +						chip->hwirq_cleanup(chip, h->first_hwirq + j);
> +				}
> +				sbi_list_del(&h->node);
> +				sbi_free(h);
> +				return rc;
> +			}
> +		}
> +	}
> +
> +	if (chip->hwirq_unmask) {
> +		for (i = 0; i < h->num_hwirq; i++)
> +			chip->hwirq_unmask(chip, h->first_hwirq + i);
> +	}
> +
> +	return 0;
> +}
> +
> +int sbi_irqchip_unregister_handler(struct sbi_irqchip_device *chip,
> +				   u32 first_hwirq, u32 num_hwirq)
> +{
> +	struct sbi_irqchip_handler *fh, *lh;
> +	u32 i;
> +
> +	if (!chip || !num_hwirq)
> +		return SBI_EINVAL;
> +	if (chip->num_hwirq <= first_hwirq ||
> +	    chip->num_hwirq <= (first_hwirq + num_hwirq - 1))
> +		return SBI_EBAD_RANGE;
> +
> +	fh = sbi_irqchip_find_handler(chip, first_hwirq);
> +	if (!fh || fh->first_hwirq != first_hwirq || fh->num_hwirq != num_hwirq)
> +		return SBI_ENODEV;
> +	lh = sbi_irqchip_find_handler(chip, first_hwirq + num_hwirq - 1);
> +	if (!lh || lh != fh)
> +		return SBI_ENODEV;
> +
> +	if (chip->hwirq_mask) {
> +		for (i = 0; i < fh->num_hwirq; i++)
> +			chip->hwirq_mask(chip, fh->first_hwirq + i);
> +	}
> +
> +	if (chip->hwirq_cleanup) {
> +		for (i = 0; i < fh->num_hwirq; i++)
> +			chip->hwirq_cleanup(chip, fh->first_hwirq + i);
> +	}
> +
> +	sbi_list_del(&fh->node);
> +	return 0;
> +}
> +
>  struct sbi_irqchip_device *sbi_irqchip_find_device(u32 id)
>  {
>  	struct sbi_irqchip_device *chip;
> @@ -47,8 +238,9 @@ int sbi_irqchip_add_device(struct sbi_irqchip_device *chip)
>  {
>  	struct sbi_irqchip_device *c;
>  	struct sbi_hartmask hm;
> +	u32 i;
>  
> -	if (!chip || !sbi_hartmask_weight(&chip->target_harts))
> +	if (!chip || !chip->num_hwirq || !sbi_hartmask_weight(&chip->target_harts))
>  		return SBI_EINVAL;
>  
>  	if (sbi_irqchip_find_device(chip->id))
> @@ -64,6 +256,14 @@ int sbi_irqchip_add_device(struct sbi_irqchip_device *chip)
>  		}
>  	}
>  
> +	chip->hwirqs = sbi_zalloc(sizeof(*chip->hwirqs) * chip->num_hwirq);
> +	if (!chip->hwirqs)
> +		return SBI_ENOMEM;
> +	for (i = 0; i < chip->num_hwirq; i++)
> +		sbi_irqchip_set_raw_handler(chip, i, sbi_irqchip_raw_handler_default);
> +
> +	SBI_INIT_LIST_HEAD(&chip->handler_list);
> +
>  	sbi_list_add_tail(&chip->node, &irqchip_list);
>  	return 0;
>  }
> diff --git a/lib/utils/irqchip/aplic.c b/lib/utils/irqchip/aplic.c
> index d47a810b..ec69c82b 100644
> --- a/lib/utils/irqchip/aplic.c
> +++ b/lib/utils/irqchip/aplic.c
> @@ -307,6 +307,7 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
>  
>  	/* Register irqchip device */
>  	aplic->irqchip.id = aplic->unique_id;
> +	aplic->irqchip.num_hwirq = aplic->num_source + 1;
>  	rc = sbi_irqchip_add_device(&aplic->irqchip);
>  	if (rc)
>  		return rc;
> diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
> index 0f296c89..7559a069 100644
> --- a/lib/utils/irqchip/imsic.c
> +++ b/lib/utils/irqchip/imsic.c
> @@ -346,9 +346,17 @@ int imsic_data_check(struct imsic_data *imsic)
>  	return 0;
>  }
>  
> +static int imsic_hwirq_setup(struct sbi_irqchip_device *chip, u32 hwirq)
> +{
> +	if (!hwirq || hwirq == IMSIC_IPI_ID)
> +		return SBI_ENOTSUPP;
> +	return 0;
> +}
> +
>  static struct sbi_irqchip_device imsic_device = {
>  	.warm_init	= imsic_warm_irqchip_init,
>  	.process_hwirqs	= imsic_process_hwirqs,
> +	.hwirq_setup	= imsic_hwirq_setup,
>  };
>  
>  int imsic_cold_irqchip_init(struct imsic_data *imsic)
> @@ -392,6 +400,7 @@ int imsic_cold_irqchip_init(struct imsic_data *imsic)
>  
>  	/* Register irqchip device */
>  	imsic_device.id = imsic->unique_id;
> +	imsic_device.num_hwirq = imsic->num_ids + 1;
>  	sbi_hartmask_set_all(&imsic_device.target_harts);
>  	rc = sbi_irqchip_add_device(&imsic_device);
>  	if (rc)
> diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
> index 973f7c2a..2d721724 100644
> --- a/lib/utils/irqchip/plic.c
> +++ b/lib/utils/irqchip/plic.c
> @@ -281,6 +281,7 @@ int plic_cold_irqchip_init(struct plic_data *plic)
>  
>  	/* Register irqchip device */
>  	plic->irqchip.id = plic->unique_id;
> +	plic->irqchip.num_hwirq = plic->num_src + 1;
>  	plic->irqchip.warm_init = plic_warm_irqchip_init;
>  	return sbi_irqchip_add_device(&plic->irqchip);
>  }


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
