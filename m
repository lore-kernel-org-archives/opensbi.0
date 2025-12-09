Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AE3D1CDC6
	for <opensbi@archiver.kernel.org>; Tue,  9 Dec 2025 05:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k2G/vLAgtbdcOeNH1VfDg5wkv5RbC9WqZptIyFvS4O8=; b=syXq68WtZ4WwxX
	A9OMcycYBD+iI1q/DjbW7ygSJik2HCTUfuMQr89QDxSKKoIv50tXtMKCDK7th9ALNTaX/01/Wabi3
	WliIIesQAVvFSfXHd+LUS9xec3ecJ5KpcJG73qYKQryJ/Bq8ei7G1TnZ+IBNBjwPh9Op+RkGMh1IP
	s8ELk9L5f9Mg6pI4TPgE8rSUaMHO9EWxZeEBrJ6O07Qvo/SMEawBN9SVu8S/QurL5G+5yDlU7PnFw
	xc5dytOgvRdoPj7ZUClREAvAVzQ363+Wk5VxWtwRrBSVImtUpJvtrRV62Af7b8GnZESBliP+5D/HU
	+OJnpbXP6P01qG3SNewQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSqNo-0000000DqjG-3DMC;
	Tue, 09 Dec 2025 05:35:32 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSqNl-0000000Dqiv-2Afd
	for opensbi@lists.infradead.org;
	Tue, 09 Dec 2025 05:35:31 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so4890779b3a.3
        for <opensbi@lists.infradead.org>; Mon, 08 Dec 2025 21:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1765258529; x=1765863329; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yFNspHIkNMlUwDEo8tSM12DtiY4/hOwSaEqAPCS4xz4=;
        b=BdT1w8Qbg3DFjSpYO+NLbF2Z3JRnA3HVrFet+eRIPv36c4CLJaBNun4+Q3R5WcqOo8
         Mmdg3rS5XLuV/no13+W1LUJv4TI1hHURXQkheU5/PZMZYrNHs+O+6f9OgSPudXJ6UvBP
         J7VnkOSBQgWS2SKcg21/ILjG3F9gPbI+iAlq6y1kOJfocjBjxZyETnTSgh9Evs/ukTOv
         jOQ3v5YGAriurCC1vipfZE0l6I1Vmu1xQ9aJtEDanMn4IElKiTIbbx/MS1QY84svO679
         wvih08nMVkOcTUeAtE2Dgdsp8ympeYEEiJAWdZkk7rA8rXsZ3+TY6+CkCHXD0uet87cm
         75BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765258529; x=1765863329;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yFNspHIkNMlUwDEo8tSM12DtiY4/hOwSaEqAPCS4xz4=;
        b=RGP32rWejk1BIe1smDPvBItCdYOYQxa22t7YpBOvrIygdSOoGvpHPcV08ZIKhsd7X9
         5I1uyI7VLzKkuklmyKWcD1A0jqL0+rl7neFkodCp5RSWXrGYDULnrjTtryfhaUYd+x3T
         v8DaLkyZF7ntedRZVf8xqxM4tnDjlL8Jl8AWF7KauZzxdl8iifYlxzPKdSe8FA+QPA5M
         UTZNMh05sZvmM0ppwgunRAwj79znfBTMl35zJUawUhM0msVzr6rnYWjRqLHKTsr6CWhj
         duNys5pmr4+kvDOmP3NeiZ8ptCEDKWqPF9llMj82Weta/zC2AVS6ue7sswi1GpJt7Ex2
         ZfOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxBKsMaAL+zJN48kOumQYCcP1s9UVisV7dMTR7B4aOvsVOlimPI6pc75lKmPyia92exNq+09mb@lists.infradead.org
X-Gm-Message-State: AOJu0YydbSge8eE1dZyn9daEP6fesZChdCMBKB6C9e9qGK/9F980Qwid
	ahTJggc8WwYJJMdCjJLRYbz/Fg0eKes3r5BM8owqzi3SApMVYFl+0xgLYWGsIDXBcGk=
X-Gm-Gg: ASbGncvtsYkKXYlaAx3c+eZQaUINmw/jaiZeVD1o7lfHGzDYtqoaZzbmCdrPk7BD/Hf
	+a1GVRb/XOGohZZfhP+5qXGIjT/E9Yws0hjWYTCvtOBwTUE3q3iZOdHxX3dv3dvmMfJFJ3bLfJZ
	pTeCvcA5c1uQqV6ByxEhvs3QsVo9PNeU0I6WVuBBx+W+6BlHze9YLjMd/YVDq4WQ68kEGIyeVYt
	Jy7B5Dk+8GmJYuauUs0oy6ZOuSdDD897NwVaizqQVqfU5NkF1kw4a8draEAqS5jpzmX6eQIqyEq
	j7QWatbzCMMovddFDuqXZ5XUjwmoJLI/dAjIxnvwp3zPxWKrbMgusNehCIxh6ej8pV+qCxZ2eo9
	qxez45SnyhLc5CJUr394yOwN/QhFiMuRPoRbWndQkM61qZcahYbpiloYyiSWgHwpj6pOtf7MJk5
	nNVDO3riNRpaG/19xbf+r7At/d77vrOTlnnEAsZhxSaA==
X-Google-Smtp-Source: AGHT+IGxImul6pdE7WUmuoPa8MIm/W4zdbqO25fTZcQhtQAdAVGDHsFx5ah5bkzYgWxm8gMYSPEpoQ==
X-Received: by 2002:a05:6a00:3cd6:b0:7e8:4587:e8d3 with SMTP id d2e1a72fcca58-7e8c5fd08f7mr9564504b3a.70.1765258528717;
        Mon, 08 Dec 2025 21:35:28 -0800 (PST)
Received: from [100.64.0.1] ([165.225.110.109])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2afa31c47sm15056414b3a.66.2025.12.08.21.35.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 21:35:28 -0800 (PST)
Message-ID: <2dcdcf80-c5e4-4006-bfed-caa066cdb990@sifive.com>
Date: Tue, 9 Dec 2025 14:35:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: platform: generic: add CVA6 platform and support for PMU
To: LE RHUN Jimmy <jimmy.lerhun@thalesgroup.com>,
 "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>
References: <46f88d260ac64ca7af4e5f5cbefabeb7@thalesgroup.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <46f88d260ac64ca7af4e5f5cbefabeb7@thalesgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_213530_122562_3AECEBE0 
X-CRM114-Status: GOOD (  17.75  )
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

On 2025-12-05 12:57 AM, LE RHUN Jimmy wrote:
> Classified as: {OPEN}
> 
> Add a new generic platform called CVA6 (https://github.com/openhwgroup/cva6).
> Add support for Performance Monitoring Unit for this platform.
> 
> I hope it is in the right place this time.
> 
> Signed-off-by: Jimmy Le Rhun <jimmy.lerhun@thalesgroup.com> 
> 
> ---
> platform/generic/Kconfig                |   4 +
>  platform/generic/configs/defconfig      |   1 +
>  platform/generic/openhwgroup/cva6.c     | 185 ++++++++++++++++++++++++++++++++
>  platform/generic/openhwgroup/objects.mk |   3 +
>  4 files changed, 193 insertions(+)
> 
> diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig index 4b9bcfc..b8adb16 100644
> --- a/platform/generic/Kconfig
> +++ b/platform/generic/Kconfig
> @@ -43,6 +43,10 @@ config PLATFORM_ANDES_QILAI
>  	select ANDES_SBI
>  	default n
>  
> +config PLATFORM_OPENHWGROUP_CVA6
> +	bool "OpenHWGroup CVA6 support"
> +	default n
> +
>  config PLATFORM_OPENHWGROUP_OPENPITON
>  	bool "OpenHWGroup Openpiton support"
>  	default n
> diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
> index fb90bb3..f705934 100644
> --- a/platform/generic/configs/defconfig
> +++ b/platform/generic/configs/defconfig
> @@ -9,6 +9,7 @@ CONFIG_PLATFORM_STARFIVE_JH7110=y  CONFIG_PLATFORM_THEAD=y  CONFIG_PLATFORM_MIPS_P8700=y  CONFIG_PLATFORM_OPENHWGROUP_OPENPITON=y
> +CONFIG_PLATFORM_OPENHWGROUP_CVA6=y
>  CONFIG_FDT_CPPC=y
>  CONFIG_FDT_CPPC_RPMI=y
>  CONFIG_FDT_GPIO=y
> diff --git a/platform/generic/openhwgroup/cva6.c b/platform/generic/openhwgroup/cva6.c
> new file mode 100644
> index 0000000..bf44a50
> --- /dev/null
> +++ b/platform/generic/openhwgroup/cva6.c
> @@ -0,0 +1,185 @@
> +/* SPDX-License-Identifier: BSD-2-Clause */
> +/*
> + * Copyright (C) 2019 FORTH-ICS/CARV
> + *				Panagiotis Peristerakis <perister@ics.forth.gr>
> + * Copyright (C) 2025 Thales Research & Technology
> + *				Jimmy Le Rhun <jimmy.lerhun@thalesgroup.com>
> + */
> +
> +#include <platform_override.h>
> +#include <sbi/sbi_console.h>
> +#include <sbi/sbi_pmu.h>
> +#include <sbi_utils/fdt/fdt_helper.h>
> +#include <sbi_utils/fdt/fdt_fixup.h>
> +#include <sbi_utils/ipi/aclint_mswi.h>
> +#include <sbi_utils/irqchip/plic.h>
> +#include <sbi_utils/serial/uart8250.h>
> +#include <sbi_utils/timer/aclint_mtimer.h>
> +
> +#define CVA6_UART_ADDR			0x10000000ULL
> +#define CVA6_UART_FREQ			50000000
> +#define CVA6_UART_BAUDRATE		115200
> +#define CVA6_UART_REG_SHIFT		2
> +#define CVA6_UART_REG_WIDTH		4
> +#define CVA6_UART_REG_OFFSET		0
> +#define CVA6_UART_CAPS			0
> +#define CVA6_PLIC_ADDR			0xc000000ULL
> +#define CVA6_PLIC_SIZE			(0x200000 + \
> +						 (CVA6_HART_COUNT * 0x1000))
> +#define CVA6_PLIC_NUM_SOURCES		3
> +#define CVA6_HART_COUNT			1
> +#define CVA6_CLINT_ADDR			0x2000000ULL
> +#define CVA6_ACLINT_MTIMER_FREQ		1000000
> +#define CVA6_ACLINT_MSWI_ADDR			(CVA6_CLINT_ADDR + \
> +						 CLINT_MSWI_OFFSET)
> +#define CVA6_ACLINT_MTIMER_ADDR		(CVA6_CLINT_ADDR + \
> +						 CLINT_MTIMER_OFFSET)
> +
> +#define CVA6_PERFCOUNTER_MASK		0x000001F8	//six configurable counters
> +#define CVA6_PERFEVENTS			22		//number of available events
> +#define CVA6_PERFEVENTS_RANGE		0x0000001F	//five bits to encode 22 events
> +
> +static struct plic_data plic = {
> +	.addr = (unsigned long)CVA6_PLIC_ADDR,
> +	.size = CVA6_PLIC_SIZE,
> +	.num_src = CVA6_PLIC_NUM_SOURCES,
> +	.flags = PLIC_FLAG_ARIANE_BUG,
> +	.context_map = {
> +		[0] = { 0, 1 },
> +	},
> +};
> +
> +static struct aclint_mswi_data mswi = {
> +	.addr = (unsigned long)CVA6_ACLINT_MSWI_ADDR,
> +	.size = ACLINT_MSWI_SIZE,
> +	.first_hartid = 0,
> +	.hart_count = CVA6_HART_COUNT,
> +};
> +
> +static struct aclint_mtimer_data mtimer = {
> +	.mtime_freq = CVA6_ACLINT_MTIMER_FREQ,
> +	.mtime_addr = (unsigned long)CVA6_ACLINT_MTIMER_ADDR +
> +		      ACLINT_DEFAULT_MTIME_OFFSET,
> +	.mtime_size = ACLINT_DEFAULT_MTIME_SIZE,
> +	.mtimecmp_addr = (unsigned long)CVA6_ACLINT_MTIMER_ADDR +
> +			 ACLINT_DEFAULT_MTIMECMP_OFFSET,
> +	.mtimecmp_size = ACLINT_DEFAULT_MTIMECMP_SIZE,
> +	.first_hartid = 0,
> +	.hart_count = CVA6_HART_COUNT,
> +	.has_64bit_mmio = true,
> +};

Please don't add new platforms with hardcoded device addresses/configurations.
As Anup points out, all of this information should come from the devicetree. If
you don't want OpenSBI to depend on an external FDT blob, you can embed the FDT
by setting FW_FDT_PATH.

Regards,
Samuel


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
