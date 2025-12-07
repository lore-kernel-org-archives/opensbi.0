Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD8DD2CE17
	for <opensbi@archiver.kernel.org>; Sun,  7 Dec 2025 10:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1cHhV+/amY7we5k/iBgpYcaBnAt2QzKmWW3zPEE8YcQ=; b=dqth4wtfxiejRm
	n/dJ9t4B0S0Vh9ls1hqs1od1MetPKK6n8WEww63pKYuEC8CB80g8ct9bczGOz6v6JV+umScIlbRN9
	0kQqawA6nh/HhpyF+ruLhGds8NL0Iy0HWTXIlK8IMWG6LCALsuqpkbMLs5/Ocw+49D6X//Y7yHH52
	28KlXm13wgdV9LWsdibfYVPV8SoA3hZNJ3nMH6a31PIuNC8VnKqfMrgQuStRcYss/sci3Dw2lYwou
	MP7qEU4RMFGw7Vadvm6ua2sVgnW5VmXNm0Fom87qxRXb/G79sy+Mckgri2mgiefd1XDrrtzfRTlDq
	OjUVqWohHFZsvm0o+W/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSCUT-0000000Bgh8-1pM6;
	Sun, 07 Dec 2025 10:59:45 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSCUR-0000000BggH-2hUX
	for opensbi@lists.infradead.org;
	Sun, 07 Dec 2025 10:59:44 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2953e415b27so41765065ad.2
        for <opensbi@lists.infradead.org>; Sun, 07 Dec 2025 02:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1765105183; x=1765709983; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nCJ9E5aTYEFiQr1VCLa4GyX/VLjnt8ll+hJsMNdrKSE=;
        b=DqMuh7CkmZ0XiPEAPZwS/v6NdJC6gaEsUHanA6PpmdPUGrAODJWO94iWDgN3r44Af0
         6R6q1ZNq66HyENuzztXQARn49TLJKgLrbPmhpDpHgU0VuT31aC1Ftv8sBp4AURHlYDeS
         Y18JND6h6BlqT7gVa5p5jyTX752e0l6ZdJDNp/BX+2LOCbzOmsMzbveGYCCOmCig3sfv
         tP8H8lHaWosF7o9CkY+xfOA5TtCHHSOa0ekZJgZ1SrqrvJkeu+8HfXCoHUeHh1f/XF1D
         5Ny4PeE7DzEqj4JyysHeOL2KmqETuXgx0TB0iRO/AZpit93+LkqF6EprvHhnWRAWoH1a
         K2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765105183; x=1765709983;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nCJ9E5aTYEFiQr1VCLa4GyX/VLjnt8ll+hJsMNdrKSE=;
        b=ImvhJahovyr54FANljYzTfIe3/OvlqPj4AgHxc87Jh/KqeXMirAbgar6/C5NDCSCWw
         A2A42EBpBZMZrajIXOO0DwM02vn+2j10TiGRWgfB0yfwptZZwyStsQ0/NhSHBgNRcF21
         keV8n/avJmMMgBY0OM3h3VOjc7W/cukysHTGdJ+n7+oPJrLxl7Oa+Y/07LIEZHaphiU8
         quiU/QDvz6W+lZAKeiItvAV71xm7EdnkFqPW1ddpe9MXNHLFEcYReBoaQAPsAxEtcmtC
         3RUAIoeMToQXuMh824h2LxpPEAFah9wV3TiWSxRzmvUt0Sk8LdDaMHGIXv0aRvpkQQO1
         r6rg==
X-Forwarded-Encrypted: i=1; AJvYcCWe4tBmgNCZ2QoPXd+xNeIj3trwnS8wLvDqdtIpVwuv3RstAiqBKG38vUIe28GDswW0sUXATh7h@lists.infradead.org
X-Gm-Message-State: AOJu0YxN9uez2pYfeAb+cNrBfL9YEbcC0BfklkJ7b4y4v3dofXhPxdf3
	mvcyDxROlSjXg3gtsFiP/FtB1x4ADKeDQmE5a8Uw4wDyde1SGkm8CXt1+BkW+APuUww=
X-Gm-Gg: ASbGncswfPZKE+I9SkDCfVz4ihv3a2hMIIew/UDlU8v2lyiUkGLwwn53xnDcY+EL5/R
	MWbP6uF1fAaSPJhB55RLhlK9U1YeWPONKavwOLRunhl3uwo1lPZeBVpGdEoNMUnunYARfEiWzNO
	y63aJ9r3pvkB6sFPX6jyB8+IoL+dj44NfHEdiQ1R2bMjo3NUaB3A+ik9pF4SNbh3swNQvDggch0
	1BGSgzxlvyI3CNV3QkwSMXX7vNfdyOte1+ZEN3s88KMAO2JYVXDDMpzacZCoI2WTPfxx1XYdKv2
	NQNFiOuLxGhPTd4FKJv28gZLOCXM0PdfssTlvYZRXPZeCi/QXOHLuLRZzYxZEhemoVtvEwSnCNB
	tcLKqodj2aTzK20n7wR3YoXrAFuJk99vl/WFERAAWJK8E52OwkvVi3o7g1qU4VcM78fIhV8f4ga
	QsN+2EVujAe9LqoD8=
X-Google-Smtp-Source: AGHT+IFiQFyjMH/gPKjWrmGPW61DRaRa8cXsxwU+6Yx1HW8ssngpAfgX9YeOE5mkKCZ5hA6H9Wtadw==
X-Received: by 2002:a17:902:e549:b0:295:565b:c691 with SMTP id d9443c01a7336-29df568881bmr57626335ad.17.1765105182844;
        Sun, 07 Dec 2025 02:59:42 -0800 (PST)
Received: from [100.64.0.1] ([165.225.110.109])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeaabbb1sm94613675ad.82.2025.12.07.02.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Dec 2025 02:59:42 -0800 (PST)
Message-ID: <4d25665d-d152-47ab-8da6-c7297dd117b3@sifive.com>
Date: Sun, 7 Dec 2025 04:59:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform: generic: Keep some empty space in FDT passed
 to next stage
To: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 opensbi@lists.infradead.org
References: <20251201050014.8788-1-apatel@ventanamicro.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20251201050014.8788-1-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_025943_731290_56393588 
X-CRM114-Status: GOOD (  18.84  )
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

On 2025-11-30 11:00 PM, Anup Patel wrote:
> Leaving no empty space in the FDT passed to the next booting stage
> causes the following U-Boot crash on Ventana internal platforms:
> 
> Unhandled exception: Load access fault
> EPC: 00000000fffa6372 RA: 00000000fffa7418 TVAL: 0001746174730068
> EPC: 0000000080245372 RA: 0000000080246418 reloc adjusted
> 
> SP:  00000000fef38440 GP:  00000000fef40e60 TP:  0000000000000000
> T0:  00000000fef40a70 T1:  000000000000ff00 T2:  0000000000000000
> S0:  00000000fffc17a8 S1:  00000000fef38d40 A0:  7375746174730068
> A1:  00000000fffc17a8 A2:  0000000000000010 A3:  0000000000000010
> A4:  0000000000000000 A5:  00000000fffc17b8 A6:  0000000000ff0000
> A7:  000000000000b100 S2:  0000000000000000 S3:  0000000000000001
> S4:  00000000fef38d40 S5:  7375746174730068 S6:  0000000000000000
> S7:  00000000fef4eef0 S8:  00000000fef4ef90 S9:  0000000000000000
> S10: 0000000000000000 S11: 00000000fef4efc0 T3:  00000000fef40ea8
> T4:  0000000000ff0000 T5:  00000000fef40a60 T6:  00000000fef40a6c
> 
> To address the above issue, keep some minimal empty space in the
> FDT instead of no empty space.
> 
> Fixes: bbe9a23060e9 ("platform: generic: Pack the FDT after applying fixups")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
> Changes since v1:
> - Add Kconfig option for amount of empty space in FDT with default
>   value as 4KB
> ---
>  platform/generic/Kconfig    | 5 +++++
>  platform/generic/platform.c | 3 +++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
> index 25b8886b..b1808012 100644
> --- a/platform/generic/Kconfig
> +++ b/platform/generic/Kconfig
> @@ -23,6 +23,11 @@ config PLATFORM_GENERIC_MINOR_VER
>  	range 0 65535
>  	default 1
>  
> +config PLATFORM_GENERIC_FDT_EMPTY_SPACE
> +	int "Platform FDT empty space (KB)"
> +	range 0 1024
> +	default 4

Since this is a workaround for a specific platform, and the workaround should
eventually be obsoleted by a U-Boot fix, please default this to zero.

> +
>  config PLATFORM_ALLWINNER_D1
>  	bool "Allwinner D1 support"
>  	depends on FDT_IRQCHIP_PLIC
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index e66f99fa..ddfc9e80 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -245,7 +245,10 @@ int generic_final_init(bool cold_boot)
>  	fdt_fixups(fdt);
>  	fdt_domain_fixup(fdt);
>  
> +	/* Minimize the empty space in FDT to 4KB */

This comment is no longer accurate, since the padding is not a fixed size.

>  	fdt_pack(fdt);
> +	fdt_open_into(fdt, fdt, fdt_totalsize(fdt) +
> +		      CONFIG_PLATFORM_GENERIC_FDT_EMPTY_SPACE * 1024);

This change reintroduces the problem that motivated adding fdt_pack().
fdt_open_into() does not initialize the unused space, so once again the range
[fdt, fdt + fdt_totalsize(fdt)) contains unitialized data.

If having unitialized data in the FDT blob is not a problem on the platform
requiring this workaround, then I suppose the code is fine. Otherwise, this
would need a memset().

Regards,
Samuel

>  
>  	return 0;
>  }


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
