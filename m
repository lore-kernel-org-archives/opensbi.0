Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A27CA100E
	for <opensbi@archiver.kernel.org>; Wed,  3 Sep 2025 01:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yo4syD/iuxNxTkz3wm7Ull8nh/4Z3wtkPVC+HarU92g=; b=lxb6J0IaW1Xi0V
	kqBFCJbdgJsJV7euJwunU12BzONk/GaMS2+z+3oo5fT5bErluHrLMmYLe5s3Tq3p39AMqaOCF5nLb
	xFUd/s/XOXH6gdjdGCx7lCtlBZAQ++bnWiQeqKNKqeGujgMbDT3c0GlZxGNFIUS5Hep++4u9yiSSC
	RvcibXfIvQ/JxK2W3CmGgTNCdRJ5HaIdFfj4My+XKMfcUsZuJtiCvHCMbTN+VTqQh6C7PemFr0fQu
	xRxDuIKV71CsrF63v8Gj6NW6wCkZMG5HcWqO985K8I83Td4c+ETkkFPJjtVXQNHrtfB8AeFKX/IAq
	XjJrSfmuBXCKdOgUFSsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utcj2-000000038po-0si3;
	Wed, 03 Sep 2025 01:55:52 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utafk-00000002ePg-2e77
	for opensbi@lists.infradead.org;
	Tue, 02 Sep 2025 23:44:22 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3ea8b3a64c4so23086635ab.2
        for <opensbi@lists.infradead.org>; Tue, 02 Sep 2025 16:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1756856659; x=1757461459; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jUmmcxxYbzRDlLa4ttb33/ZCidVPpUQbF0VvMlJYPQ0=;
        b=FbXxbg8/wiRSfA99SYycs6CQUsi6DPL9Jvvapi7EAEuWPND6zlYbuZqqjJdpu6CcPg
         b2lqB3yBb6Rqcvm3r1pXky7xQHnLIhf9PFfXDLAXnuw8hekwsoqLSV7JNB2QhywjO6ef
         Gpq3XlnrynniJFGVNxBUXP0x1Tf5HZek46M5ZSAitP1W1ePopSwN+6zYiLnM+Grm4fG2
         l0FYtQZ6VLtG5LRfZOS/6fujSdWWRlqvwAd0XPZcAruJeJFJk2iaFhwkMVl5nDTfXCo+
         FymTAGJgfznb8iyZHc68xf2bmPkkKvUDzDB6AP/0MghbtDIk+viR3anXiCefLW961mwY
         wcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756856659; x=1757461459;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jUmmcxxYbzRDlLa4ttb33/ZCidVPpUQbF0VvMlJYPQ0=;
        b=YktlCtsOHxiPVg74PbLRj/0u9AseTpTV3iABjlvaDOh1WDFgPDWkQ0AoA7ilHfI6sp
         sCAza2+dsoaGtFjVTYAnjTSa+2Hdmv+OQCXVo4+nLxLYHHjhBl/yyr5MPdmKmFGcf7o6
         tU0qegjlZFpcsXG+OvRJNtFmyeyHlJX2dvKSPbyo1hztQkzVSyKqdUWG5NJyE6x34ay2
         VTuJKtU5j98nf56ftOJMFQktU/YiLCLc0CL75zagEXNnl68ZgAHXnUGdl3WWsqyx4zkR
         9lpLRK9UGo6eCYjyQFVM6Du/3GOLPKjIhDFBvLti8WhV6ydvpVL+h7FXPtC0OilGaoaf
         oLug==
X-Forwarded-Encrypted: i=1; AJvYcCWRWC8FF1QygZzwWq8dj1R4ynLdGS7p02y9cREGAqjUT3kGsQZTVCzxjnL86BymfIqHyV2ZhXZR@lists.infradead.org
X-Gm-Message-State: AOJu0YwccMgi3s5Dpob9Z+ira/mBo3LSS/S/3hqnUTgbqVty7n/xe5wQ
	SGn6uvBeEKvYqCBRtLnogHbckTeQCNPWsqmjj8WpEp8buJmrHuNp9jOF3cGPRlmSdAY=
X-Gm-Gg: ASbGnct/lNcM1Py7wNbhN9o20RcHi910fyVCOM0mGikBs0Kjv4KiOtA96hIpj7IFzo9
	qAIE3nEV5Dj8nbHpeD8+uslpAUMJHX2LeaB+mvdj3hgO/cdlMcHgzpMf7aLgOlLxd+IuiDHE9AF
	B48VAmd8L3sTkRRQZBPQMHsnsSum3W5oGylEeMWPxg8Dk92B5DibjNzHwtYpSUXlr3L5ZxrKr0H
	2aLibAov84sYIFM8LUW7CyuWIg/48Z/TM8nVjFAqVe1Yh8RwiyOTc9YHZF3IGhAnXt1A2a8DJhU
	fDZ9WYzCtf9JfkFQ2e3fgce4RktAYyTP7kbFwI9X6EJFyzO1HaYc+xAT8Htzn/MEjsXunZJxvje
	6TN3Fi9yrMT4nYZye
X-Google-Smtp-Source: AGHT+IFZRPDnTrQN8b9JDjtUts+WLfGqflBR3IhSUJss1yse0I69gFscDtsiw0uxJmksuU2UEJrv/Q==
X-Received: by 2002:a05:6e02:1a0b:b0:3ec:8541:a5b6 with SMTP id e9e14a558f8ab-3f4021c3ab8mr248448045ab.25.1756856659572;
        Tue, 02 Sep 2025 16:44:19 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.207])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50d8f31d0absm3542021173.41.2025.09.02.16.44.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 16:44:19 -0700 (PDT)
Message-ID: <9f1737ef-53a9-4a11-93ca-52c7253f17b8@sifive.com>
Date: Tue, 2 Sep 2025 18:44:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] include: sbi: Remove platform specific IPI init
To: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 opensbi@lists.infradead.org
References: <20250902121721.401933-1-apatel@ventanamicro.com>
 <20250902121721.401933-3-apatel@ventanamicro.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20250902121721.401933-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_164420_687735_CFF33FF8 
X-CRM114-Status: GOOD (  23.33  )
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

On 2025-09-02 7:17 AM, Anup Patel wrote:
> The platform specfic IPI init is not need anymore because using
> IPI device rating multiple IPI devices can be registered in any
> order as part of the platform specific early init.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_platform.h               | 17 -----------------
>  lib/sbi/sbi_ipi.c                        |  5 -----
>  platform/fpga/ariane/platform.c          | 15 ++++++---------
>  platform/generic/openhwgroup/openpiton.c | 13 ++++---------
>  platform/generic/platform.c              |  5 ++++-
>  platform/kendryte/k210/platform.c        | 13 ++++++-------
>  platform/nuclei/ux600/platform.c         | 11 +++++------
>  platform/template/platform.c             | 16 ++++++----------
>  8 files changed, 31 insertions(+), 64 deletions(-)
> 
> diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
> index c6d30080..d75c12de 100644
> --- a/include/sbi/sbi_platform.h
> +++ b/include/sbi/sbi_platform.h
> @@ -116,9 +116,6 @@ struct sbi_platform_operations {
>  	/** Initialize the platform interrupt controller during cold boot */
>  	int (*irqchip_init)(void);
>  
> -	/** Initialize IPI during cold boot */
> -	int (*ipi_init)(void);
> -
>  	/** Get tlb flush limit value **/
>  	u64 (*get_tlbr_flush_limit)(void);
>  
> @@ -528,20 +525,6 @@ static inline int sbi_platform_irqchip_init(const struct sbi_platform *plat)
>  	return 0;
>  }
>  
> -/**
> - * Initialize the platform IPI support during cold boot
> - *
> - * @param plat pointer to struct sbi_platform
> - *
> - * @return 0 on success and negative error code on failure
> - */
> -static inline int sbi_platform_ipi_init(const struct sbi_platform *plat)
> -{
> -	if (plat && sbi_platform_ops(plat)->ipi_init)
> -		return sbi_platform_ops(plat)->ipi_init();
> -	return 0;
> -}
> -
>  /**
>   * Initialize the platform timer during cold boot
>   *
> diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
> index b57ec652..c9f5d1d1 100644
> --- a/lib/sbi/sbi_ipi.c
> +++ b/lib/sbi/sbi_ipi.c
> @@ -342,11 +342,6 @@ int sbi_ipi_init(struct sbi_scratch *scratch, bool cold_boot)
>  		if (ret < 0)
>  			return ret;
>  		ipi_halt_event = ret;
> -
> -		/* Initialize platform IPI support */
> -		ret = sbi_platform_ipi_init(sbi_platform_ptr(scratch));
> -		if (ret)
> -			return ret;
>  	} else {
>  		if (!ipi_data_off)
>  			return SBI_ENOMEM;
> diff --git a/platform/fpga/ariane/platform.c b/platform/fpga/ariane/platform.c
> index 4bc1c5be..4ca9ca94 100644
> --- a/platform/fpga/ariane/platform.c
> +++ b/platform/fpga/ariane/platform.c
> @@ -71,9 +71,15 @@ static struct aclint_mtimer_data mtimer = {
>   */
>  static int ariane_early_init(bool cold_boot)
>  {
> +	int rc;
> +
>  	if (!cold_boot)
>  		return 0;
>  
> +	rc = aclint_mswi_cold_init(&mswi);
> +	if (rc)
> +		return rc;
> +
>  	return uart8250_init(ARIANE_UART_ADDR,
>  			     ARIANE_UART_FREQ,
>  			     ARIANE_UART_BAUDRATE,

I would recommend to keep the serial device initialization first in these
functions to help with any future debugging.

Regards,
Samuel

> @@ -107,14 +113,6 @@ static int ariane_irqchip_init(void)
>  	return plic_cold_irqchip_init(&plic);
>  }
>  
> -/*
> - * Initialize IPI during cold boot.
> - */
> -static int ariane_ipi_init(void)
> -{
> -	return aclint_mswi_cold_init(&mswi);
> -}
> -
>  /*
>   * Initialize ariane timer during cold boot.
>   */
> @@ -130,7 +128,6 @@ const struct sbi_platform_operations platform_ops = {
>  	.early_init = ariane_early_init,
>  	.final_init = ariane_final_init,
>  	.irqchip_init = ariane_irqchip_init,
> -	.ipi_init = ariane_ipi_init,
>  	.timer_init = ariane_timer_init,
>  };
>  
> diff --git a/platform/generic/openhwgroup/openpiton.c b/platform/generic/openhwgroup/openpiton.c
> index 9be7f9a4..e4d7a8b0 100644
> --- a/platform/generic/openhwgroup/openpiton.c
> +++ b/platform/generic/openhwgroup/openpiton.c
> @@ -104,6 +104,10 @@ static int openpiton_early_init(bool cold_boot)
>  				    ACLINT_DEFAULT_MTIMECMP_OFFSET;
>  	}
>  
> +	rc = aclint_mswi_cold_init(&mswi);
> +	if (rc)
> +		return rc;
> +
>  	return uart8250_init(uart.addr, uart.freq, uart.baud,
>  			     OPENPITON_DEFAULT_UART_REG_SHIFT,
>  			     OPENPITON_DEFAULT_UART_REG_WIDTH,
> @@ -135,14 +139,6 @@ static int openpiton_irqchip_init(void)
>  	return plic_cold_irqchip_init(&plic);
>  }
>  
> -/*
> - * Initialize IPI during cold boot.
> - */
> -static int openpiton_ipi_init(void)
> -{
> -	return aclint_mswi_cold_init(&mswi);
> -}
> -
>  /*
>   * Initialize openpiton timer during cold boot.
>   */
> @@ -155,7 +151,6 @@ static int openhwgroup_openpiton_platform_init(const void *fdt, int nodeoff, con
>  {
>  	generic_platform_ops.early_init = openpiton_early_init;
>  	generic_platform_ops.timer_init = openpiton_timer_init;
> -	generic_platform_ops.ipi_init = openpiton_ipi_init;
>  	generic_platform_ops.irqchip_init = openpiton_irqchip_init;
>  	generic_platform_ops.final_init = openpiton_final_init;
>  
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index 889d6905..8ba6bc11 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -229,6 +229,10 @@ int generic_early_init(bool cold_boot)
>  			return rc;
>  
>  		fdt_driver_init_all(fdt, fdt_early_drivers);
> +
> +		rc = fdt_ipi_init();
> +		if (rc)
> +			return rc;
>  	}
>  
>  	return 0;
> @@ -337,7 +341,6 @@ struct sbi_platform_operations generic_platform_ops = {
>  	.extensions_init	= generic_extensions_init,
>  	.domains_init		= generic_domains_init,
>  	.irqchip_init		= fdt_irqchip_init,
> -	.ipi_init		= fdt_ipi_init,
>  	.pmu_init		= generic_pmu_init,
>  	.pmu_xlate_to_mhpmevent = generic_pmu_xlate_to_mhpmevent,
>  	.get_tlbr_flush_limit	= generic_tlbr_flush_limit,
> diff --git a/platform/kendryte/k210/platform.c b/platform/kendryte/k210/platform.c
> index aff133c6..cd71c795 100644
> --- a/platform/kendryte/k210/platform.c
> +++ b/platform/kendryte/k210/platform.c
> @@ -112,9 +112,15 @@ static struct sbi_system_reset_device k210_reset = {
>  
>  static int k210_early_init(bool cold_boot)
>  {
> +	int rc;
> +
>  	if (!cold_boot)
>  		return 0;
>  
> +	rc = aclint_mswi_cold_init(&mswi);
> +	if (rc)
> +		return rc;
> +
>  	sbi_system_reset_add_device(&k210_reset);
>  
>  	return sifive_uart_init(K210_UART_BASE_ADDR, k210_get_clk_freq(),
> @@ -141,11 +147,6 @@ static int k210_irqchip_init(void)
>  	return plic_cold_irqchip_init(&plic);
>  }
>  
> -static int k210_ipi_init(void)
> -{
> -	return aclint_mswi_cold_init(&mswi);
> -}
> -
>  static int k210_timer_init(void)
>  {
>  	return aclint_mtimer_cold_init(&mtimer, NULL);
> @@ -158,8 +159,6 @@ const struct sbi_platform_operations platform_ops = {
>  
>  	.irqchip_init = k210_irqchip_init,
>  
> -	.ipi_init  = k210_ipi_init,
> -
>  	.timer_init	   = k210_timer_init,
>  };
>  
> diff --git a/platform/nuclei/ux600/platform.c b/platform/nuclei/ux600/platform.c
> index 1b67b644..ccaf87a4 100644
> --- a/platform/nuclei/ux600/platform.c
> +++ b/platform/nuclei/ux600/platform.c
> @@ -151,10 +151,15 @@ static struct sbi_system_reset_device ux600_reset = {
>  static int ux600_early_init(bool cold_boot)
>  {
>  	u32 regval;
> +	int rc;
>  
>  	if (!cold_boot)
>  		return 0;
>  
> +	rc = aclint_mswi_cold_init(&mswi);
> +	if (rc)
> +		return rc;
> +
>  	sbi_system_reset_add_device(&ux600_reset);
>  
>  	/* Measure CPU Frequency using Timer */
> @@ -195,11 +200,6 @@ static int ux600_irqchip_init(void)
>  	return plic_cold_irqchip_init(&plic);
>  }
>  
> -static int ux600_ipi_init(void)
> -{
> -	return aclint_mswi_cold_init(&mswi);
> -}
> -
>  static int ux600_timer_init(void)
>  {
>  	return aclint_mtimer_cold_init(&mtimer, NULL);
> @@ -209,7 +209,6 @@ const struct sbi_platform_operations platform_ops = {
>  	.early_init		= ux600_early_init,
>  	.final_init		= ux600_final_init,
>  	.irqchip_init		= ux600_irqchip_init,
> -	.ipi_init		= ux600_ipi_init,
>  	.timer_init		= ux600_timer_init,
>  };
>  
> diff --git a/platform/template/platform.c b/platform/template/platform.c
> index 292889d2..4ba3e59a 100644
> --- a/platform/template/platform.c
> +++ b/platform/template/platform.c
> @@ -70,9 +70,15 @@ static struct aclint_mtimer_data mtimer = {
>   */
>  static int platform_early_init(bool cold_boot)
>  {
> +	int rc;
> +
>  	if (!cold_boot)
>  		return 0;
>  
> +	rc = aclint_mswi_cold_init(&mswi);
> +	if (rc)
> +		return rc;
> +
>  	/* Example if the generic UART8250 driver is used */
>  	return uart8250_init(PLATFORM_UART_ADDR, PLATFORM_UART_INPUT_FREQ,
>  			     PLATFORM_UART_BAUDRATE, 0, 1, 0, 0);
> @@ -95,15 +101,6 @@ static int platform_irqchip_init(void)
>  	return plic_cold_irqchip_init(&plic);
>  }
>  
> -/*
> - * Initialize IPI during cold boot.
> - */
> -static int platform_ipi_init(void)
> -{
> -	/* Example if the generic ACLINT driver is used */
> -	return aclint_mswi_cold_init(&mswi);
> -}
> -
>  /*
>   * Initialize platform timer during cold boot.
>   */
> @@ -120,7 +117,6 @@ const struct sbi_platform_operations platform_ops = {
>  	.early_init		= platform_early_init,
>  	.final_init		= platform_final_init,
>  	.irqchip_init		= platform_irqchip_init,
> -	.ipi_init		= platform_ipi_init,
>  	.timer_init		= platform_timer_init
>  };
>  const struct sbi_platform platform = {


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
