Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4F0CCFA0D
	for <opensbi@archiver.kernel.org>; Wed,  5 Nov 2025 16:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2kOmbaE8lEyYaXvFkrDey4GONIccuxMBKhGr6cxeFfU=; b=NJXLCvpmRtq+eP
	+GGZE4soIXhkRNsuzoflggvwaU19iHtcfPI3UBXAk3zmiV2qTrZZ7k27ynEWzj2NhdYBCADPyiNz0
	hgvOFP5QpBOKytA2joyDDtVu5E8bhk5Y49Mih9SVVcw+/GaintRtOz5D5j10ufqp8mIbBn/h0D8cI
	9YqT6u7ZplEvBi2WRYpPYeROurOFLYMGc8LzvyuGPworRVmpmk3RKAqOA6ZQ0Bg2X02/KZRR4E88z
	0847W+XsFdYrgBfKVTXLfRUvpxbFB3XFh3kBni2lQAXNnx38/LyJbCyoXsAH2x3clSBjtFSejfmUW
	XYWuqk67BcSLZ0taMlVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGg9t-0000000E2Xs-3kzc;
	Wed, 05 Nov 2025 16:14:53 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGg9r-0000000E2Us-1p1e
	for opensbi@lists.infradead.org;
	Wed, 05 Nov 2025 16:14:52 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-94849c6e0bbso137441939f.1
        for <opensbi@lists.infradead.org>; Wed, 05 Nov 2025 08:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1762359290; x=1762964090; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nwlh+qG0I0PxmLpynFtVkKhYGg5l3ue9uswZ+WW/yAE=;
        b=R53cSLsCzTcHYpv11QMVNmUQ0EUPGvCewXSdmEp/IMcHTc8p//aJAWJl4AGKpfaTjP
         VtcvFc/Ac/e4+WEizvocY5LH+dlgWey1/XYKT5iLQmb1W/ph5ND8SvOfodF3HVhn/Geq
         6eErCqkWJqX2R64qHsG3jFt2/FYuSLFOBH3T7S2bM8G6OH3rVAkhuieREf7yB1laebdP
         zrrDbppf6wuZe3+LtDp/hq+wrMwodO3QOgQXtwDHRec7uP4dvlX9t2O1E3mm70dtODbB
         kjCg7i0ocFMVTN2n6+9d4BZmXzWPCO+58kcO7A81II/aKv+TWtam6lZtIgMztE3gHLkv
         NKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762359290; x=1762964090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nwlh+qG0I0PxmLpynFtVkKhYGg5l3ue9uswZ+WW/yAE=;
        b=ggKxA9sjJnclUZPoukidnQdgZErqLB6HqJtB4Md4fvS+BgyfXNr9U72ALzPSkE0kfv
         WFXKTrw7XkUmknQUJj1gZj/g2VAuQq0awZX1BN3ro0gkklH/ebkitieBzDfWH6ul6+/o
         zLb9YIIQbAdnOKelkoxMMr1WV4hZMwvmvdtWOKmyS2/EAIe0hM4hcyLL3C+OKQ8t87cZ
         pll0pnJM5F6aSSqr8UZBWggeKnJefKiaBMQ7UhL7TKH02k0ViioGy/xBj77JWJ8nsgC2
         7h5s8UDrAzgxzdVwKE/2fqNW3qNVzQwsOE800XZp0JtDK0UnXkXvOieShUghGGdB9xTI
         2A9g==
X-Forwarded-Encrypted: i=1; AJvYcCXUOjierfXdF8CQB8kINeGEGUQZuBxSAaAZDKey2NhQdztuwZW3eiZvcZc6gFRhbox8PHiNQKSy@lists.infradead.org
X-Gm-Message-State: AOJu0YxT3XJ24ZXrtDHfeLGIrF75HV2zZun4nF8qsfNFeyRe4G+Y3zpz
	Jx23lAiYqFXN66KRJ2w58Ugen6aMvIe7UZX7gnf77iBr7tY0ZIKrGG1gPUR0G2MaZCTPezbkgfx
	ZwIknnyjmZA==
X-Gm-Gg: ASbGncsTCTaNwwqM8HfIc4YNvDIiW68ARQhyWXXj7sYGgwUJAyWvJ3ycmZqZe6WCRtv
	/ZMUftecq3u5sMNGiFfKR7sx/Da1XLjsH75yxuPdmb7WXVOB48WG/hHeYv7FT1P3SpJR2PKGvN9
	XgUkig4XU5dAQSeQXRGgXBI9OtuKgqt81lDyyxL3HMVFJzxXKvS0BD+NuF8nAnvyotEbsA6PqBd
	TcF/Py7s1XWDxMdmunUqDUouAIG6buYoWETfTIUosN72NmsdCxdmGmzuBEGkibztGweKYncdP1A
	/wOIxaXRck7gqUFb/HGGO8cTHP2/4+0IsrZtuWqPb733ZGQkGeyCSRn/orZqUPWiHXpfPF3R0Ha
	rCeXsA8RyfL2DIKDbDopOtqs7wdhSUCeEnmEU/4cNP+Kj3crYLbhy28sMNYJ2fEKnaVnHoe6fN2
	zAXq1pKggwE4Zr
X-Google-Smtp-Source: AGHT+IHNKC5lcGqyX4VnjHHPA1EI55wUHeW6ilaaxm6yojDuSZd1Q4vZpJ7e3unsTYl0zire39g2XA==
X-Received: by 2002:a05:6602:388f:b0:948:6c18:1f7c with SMTP id ca18e2360f4ac-9486c18268dmr377870539f.11.1762359290028;
        Wed, 05 Nov 2025 08:14:50 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5b7225ae785sm2592614173.26.2025.11.05.08.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:14:49 -0800 (PST)
Date: Wed, 5 Nov 2025 10:14:49 -0600
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
	opensbi@lists.infradead.org
Subject: Re: [PATCH] platform: generic: Keep some empty space in FDT passed
 to next stage
Message-ID: <20251105-c4154b1f28934a0798a712a0@orel>
References: <20251105160146.271156-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251105160146.271156-1-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_081451_499755_B8E4C892 
X-CRM114-Status: GOOD (  18.57  )
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

On Wed, Nov 05, 2025 at 09:31:45PM +0530, Anup Patel wrote:
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
>  platform/generic/platform.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index e66f99fa..ea44676b 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -245,7 +245,9 @@ int generic_final_init(bool cold_boot)
>  	fdt_fixups(fdt);
>  	fdt_domain_fixup(fdt);
>  
> +	/* Minimize the empty space in FDT to 4KB */
>  	fdt_pack(fdt);
> +	fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + 4096);
>  
>  	return 0;
>  }
> -- 
> 2.43.0
>

I agree opensbi needs to workaround uboot issues in order to ensure it
doesn't break current configurations, but maybe we should make the
extra space added be a Kconfig managed define, rather than a hard 4096.
The main reason would be to enable setting it to zero so issues with
second stage loaders like this one can be flushed out and fixed.

Thanks,
drew

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
