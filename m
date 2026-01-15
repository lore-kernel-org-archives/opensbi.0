Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9A3D41149
	for <opensbi@archiver.kernel.org>; Thu, 15 Jan 2026 09:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tcrak6g0Qn5MaFSV2PLs+x9Tu3g+OmnKTqFTpGkRfI8=; b=qcjeKlIcWC4tUK
	ieoSYBm5+a7hdTJyFe7E8l3ym7GIOPNl755+VQsUk3IlPSM6kwGlu2oipXTXYTVePH0xP+qRHmXIf
	tjbHQibXLuIVa2dl48T4hdwulsyag0fL6dKV174Zi28sDd91fbu9JUNo2IE58zMgS9LiVC9rUr001
	lSzsd4IAIWuKWQ4NHzD0ZwvKNzAV3XUv1O06mogNZ8Q2HJEFXImOMM2WsS7rBsbnmn9GqE9Q5IKml
	jhyrEbHAsXl1kOT6z0y1Ij6eQT/CtqZ16RLTtH+jXKOCMrcj+T/eCVe6/UaJ44Wptj9MWxrtfdO7j
	88uTGpUsIqI/beyrT5uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJTd-0000000C35K-3ZuQ;
	Thu, 15 Jan 2026 09:17:13 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJTb-0000000C34v-2El6
	for opensbi@lists.infradead.org;
	Thu, 15 Jan 2026 09:17:13 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a12ebe4b74so7210745ad.0
        for <opensbi@lists.infradead.org>; Thu, 15 Jan 2026 01:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768468628; x=1769073428; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JQlshDTPUnBhIYRMFRviu/UNInTulaW8invwq2MqN1A=;
        b=Q3x8JDDJbuCaFsGWIVheSOayFkWRt43R9FFs4cEfblNertn013bXrFLl8rA1soyuo+
         dYBzqZkqaOtMTK1+z7e2pjUfkYvbfl6SxBw0pXioe+/ns+OVaM0+K5COJA2GnIhhVO14
         +6mt4gBMFTJB/GObhQheuG54N6XNuYjxdJy4Vo1Ti0Lq6aYzeeVya9b/XPu2pnfUxpE2
         UKr54R2r/8o9+4/iraMZN8Gj0gP+PVhGlpOKwfCxfj0RZKFny4zkkpzuhHp5Jl0Tyb3H
         F51PsaDhbpn6i3LFQLdJ8nvcMd0+/871C6YfL6tP3Pcids5XS+r7dhBIQBPkMBYKnwbr
         L09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768468628; x=1769073428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JQlshDTPUnBhIYRMFRviu/UNInTulaW8invwq2MqN1A=;
        b=Z+hMPqpuiuK6FVxDHaDaxbeZrTis/JZ6gWCaN85FhJMMcxWIX5MbfHOXWBbHjFsB9Q
         ozxoKHBoYJlytkGtvg6zqPFOXmxrvyYBsMohSiUQVZWAthRtHj1vuLKqITOr+y8O1Byb
         hn8nBi/L624BDH6q/3c3589RnhT5eh+PBSBFdoDtYn2wMzRJLqMscaludjPfkzKL354B
         2nBUXyK50pqUPKeVBWkTtuvTkFsYp/ixbz+r7KryFdoV9Y0zQioykflTo3+GjlHA688i
         JvrrBepH/VCj6ylKBfcyt/K/s7r18QiuXk/LmeYgRcg1wMVDiG3nJgW6Ual4l+DdQ3J4
         9yWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl1cRLyyTXbpEbmqzYoJvv55lzdEK/Uyf/liS8nQU4fZIND87rtcLWNY3nwpmrqMgQ1PIBmjcm@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1FHUAmh6LukwfxisfUo9WAfm6fGV15hexoneVyjxmknh0P/Fm
	h6iLixBIKOd+SZwRQig/2avHTK8sbK8VBwyDJR85psyhDYvbd6KXl0Ma2bxwVA==
X-Gm-Gg: AY/fxX46cbQ9Li1fNZIdVF8PjLKmTchPfxIZFqhXb72rScnlEir3qMDk68qJzuE92Js
	pSsUgVe31JuAUIzV0wVPuOBTklyrBaN++IUXLaHBeF+z00GQ1fN3TAkikRocU6OlvIWIIe64zCT
	rCEqcpxpQbN3+6YsdPKu+g05WoPkBOAOU8uw/7CwXhFEfLzz+LXj+yLAmj3ieY31qt9e51r39bG
	fuYu5Ypm34RpnHYKKsnmbG722YYiDr73e9gHh8eR70X+xAOYoFAhDLQOB9gHbmOHMA4UzviSuZl
	4VGpK6zIi8SsoKM1ABZgfRllbaDQx2AG8hSrczPiFpLpgHP6p7jaZvZDVMqQHhJavRgbS2PQWQc
	/lHJGqmhePuAM51OCqWb5L4weBlFCr84fv+uGsHP9RQ3XLx6Af0VZESz04w+pnUVu8acFvYjpgI
	1zTGNIFtaK8kbe
X-Received: by 2002:a17:903:244d:b0:2a0:c1ed:d0d9 with SMTP id d9443c01a7336-2a599e5989dmr60371875ad.46.1768468628458;
        Thu, 15 Jan 2026 01:17:08 -0800 (PST)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2f8asm250094415ad.57.2026.01.15.01.17.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 01:17:07 -0800 (PST)
Message-ID: <7cff5c09-4f76-4079-9c1f-e80116e54ab3@gmail.com>
Date: Thu, 15 Jan 2026 01:14:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/22] platform: generic: mips p8700: restrict memory
 region to physical memory as in DTS
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 anup@brainfault.org
Cc: cfu@mips.com, opensbi@lists.infradead.org, benoit.monin@bootlin.com
References: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
 <20260114092118.1315581-12-vladimir.kondratiev@mobileye.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260114092118.1315581-12-vladimir.kondratiev@mobileye.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_011711_777340_CFDF344E 
X-CRM114-Status: GOOD (  26.67  )
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

Hi Vladimir,

On 1/14/26 01:21, Vladimir Kondratiev wrote:
> SBI domain initialization add "all memory" region with unrestricted
> access. This can cause a problem: CPU can issue
> speculative prefetches to non-existent addresses. If this access
> goes to the system NOC, it is mis-interpreted as an access violation
> and error is reported, forcing system reset.
> 
> To prevent such a speculative transaction to leave a CPU cluster,
> block it using PMP, by restricting memory region to physically present
> memory.
> 
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> ---
>   platform/generic/mips/p8700.c | 33 +++++++++++++++++++++++++++------
>   1 file changed, 27 insertions(+), 6 deletions(-)
> 
> diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
> index 25e6075581e8..a3d05602a6d1 100644
> --- a/platform/generic/mips/p8700.c
> +++ b/platform/generic/mips/p8700.c
> @@ -14,6 +14,7 @@
>   #include <sbi/sbi_timer.h>
>   #include <sbi/sbi_hart_pmp.h>
>   #include <sbi/riscv_io.h>
> +#include <libfdt.h>
>   #include <sbi_utils/fdt/fdt_helper.h>
>   #include <mips/p8700.h>
>   #include <mips/mips-cm.h>
> @@ -148,14 +149,36 @@ static struct sbi_domain_memregion *find_last_memregion(const struct sbi_domain
>   	return --reg;
>   }
>   
> +static int fixup_dram_region(const struct sbi_domain *dom,
> +			     struct sbi_domain_memregion *reg)
> +{
> +	const void *fdt = fdt_get_address();
> +	int node;
> +	int ret;
> +	uint64_t mem_addr, mem_size;
> +	static const char mem_str[] = "memory";
> +
> +	if (!reg || !fdt)
> +		return SBI_EINVAL;
> +
> +	/* Find the memory range */
> +	node = fdt_node_offset_by_prop_value(fdt, -1, "device_type",
> +					     mem_str, sizeof(mem_str));
> +	ret = fdt_get_node_addr_size(fdt, node, 0, &mem_addr, &mem_size);
> +	if (ret)
> +		return ret;
> +	sbi_domain_memregion_init(mem_addr, mem_size, reg->flags, reg);> +	return 0;
> +}
> +
>   static int mips_p8700_final_init(bool cold_boot)
>   {
>   	struct sbi_scratch *scratch;
>   	const struct sbi_domain *dom;
>   	struct sbi_domain_memregion *reg;
> -	const unsigned long end_of_dram = 0x1000000000LU;
>   	unsigned long pmp_gran;
>   	int pmp_count;
> +	int ret;
>   
>   	if (!cold_boot)
>   		return 0;
> @@ -172,11 +195,9 @@ static int mips_p8700_final_init(bool cold_boot)
>   	 */
>   	dom = sbi_domain_thishart_ptr();
>   	reg = find_last_memregion(dom);
> -	sbi_printf("Fix region[%ld]: base 0x%lx order %ld flags 0x%lx\n",
> -		   reg - dom->regions, reg->base, reg->order, reg->flags);
> -	reg->order = sbi_fls(end_of_dram);

I have some doubts on this. On the code level, `reg` comes from
find_last_memregion, which exposes internal memory region data structure
from `domain`. If modifying the base/order/flags directly, that bypasses
the sanitation logic in root_add_memregion, which could invalidate the
assumption in lib/ code. In your subsequent patch, there's also direct
access to dom->regions (again internal structures). IMO, we shouldn't do
that in platform code. Perhaps Anup has better thoughts.

> -	sbi_printf("Modified order: %ld to match end of DRAM 0x%lx\n",
> -		   reg->order, end_of_dram);
> +	ret = fixup_dram_region(dom, reg);

Based on your description above, you are trying to block speculative
access above the physical memory region. I encountered similar problem
when coding up the EIC7700 platform. I also need to block access to some
regions to avoid speculative access triggering bus errors. However I
realized that just doing what you did here is not enough. For M mode, if
there's no matching PMP (traditional) entries, then by default the access
is granted. Hence, I don't see how you prevent speculation from M mode to
system NOC.

> +	if (ret)
> +		return ret;
>   	/*
>   	 * clear the rest of regions that may be set by the boot code
>   	 * SBI code don't let to disable PMP region, so configure it to

Bo

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
