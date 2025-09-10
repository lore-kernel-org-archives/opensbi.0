Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077E5CA101F
	for <opensbi@archiver.kernel.org>; Wed, 10 Sep 2025 05:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+3t8jNXE8fGykRQ+dKESoTHSJoraTt/6cdvZj/sBo8=; b=BuJcV/IK1W+PJ6
	9HQoi4mSr/3Ndgpup+1xIYwtfcFqe+ZfH5811hoeqmXkMrCdNwy8wyBShbAHNLQVnDMNqklkPyIEM
	7BaL5zvpbGlqw1DsFEf026vkI/f0gbzDgOWExKD6d15fjm/Y2kP18ftIaJzn35UiKjeWgRSZgJ0nA
	6hM4E2H39U1B3vhqFYlhHlWywBRM3xbZHd5v+BuTPzc8op+NLaNNBZhCbC9v6m+ey8qYv/fW9OvIw
	6scncjZ09kKh8QNZwNudPmu8dDvK7uPYMIf8zC2Y+TBuaCsrJDTde8zNig9DhI3UN+80eec4rFZP/
	4EsiauZjIOe4YiJw8weQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwD0L-0000000C2qN-3By7;
	Wed, 10 Sep 2025 05:04:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwD0K-0000000C2p9-1gSD
	for opensbi@bombadil.infradead.org;
	Wed, 10 Sep 2025 05:04:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iC63/RJTeJkQ1+IrU21ucrYjL7BuPOO5Y6F0P+6CLoM=; b=WoLViDKJyu56XxZrroqELrABAO
	3UpCGSkv80BT974368urR/TzfFXqWJJPpTKrjQxFb/X5B5YKZyRKFu/nobHDcYprJfEGqrdk3PMVo
	V+NUyILfYE3EJg390nWrLZPxOwV7c/ThzckhDxC1JkArAi0ww9L8iWYVE98jl/G2jkR6mSmd0MSG4
	JTh7jgkK6vEm9TLrTQi1jpMVObc8tTIXrpf15ruB2yqXwa1v81XT/hCr/KALYb98tVjsnNqxOqHIx
	2Ve6svhytV+vS1swMdPVtSYohLvLq2LlWl7h4TeXL1ejzk3hOco8WU+BgNKnaCzr2XaZ+qDVcoeQP
	APO9q9tA==;
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwD05-00000005ivY-0sj0
	for opensbi@lists.infradead.org;
	Wed, 10 Sep 2025 05:04:22 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-88428b19ea9so4238339f.0
        for <opensbi@lists.infradead.org>; Tue, 09 Sep 2025 22:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1757480645; x=1758085445; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iC63/RJTeJkQ1+IrU21ucrYjL7BuPOO5Y6F0P+6CLoM=;
        b=W6F2AirvNqol2yVNVfqK4sFlAr/CPzZbb6dVqkvROk07YtTjjFHeJcxB2M59+1r/c2
         DdAQPn2lxLn/QkF7LOCuMes4NMDFtT4unShNTq1kJShHZOkzxnxZzt5tzrGRLHMknGvV
         PLDEWkU//0DUWccTBJ68kqVygYsQ/HXOrE6iMj8LKxkHZ7cWOyZ2NtJSCCABP1SQbJbU
         C5M/BO8VcQGPmCxX2UqB2Agn5Mhy3Bf4db/pFc8BBQuUCHszmj5hreZS9/goOjuhBr2n
         slVDBn9rKbuvTBaZCdWvNnFQRiLwsaE7J2LuMlLJgLoqXLnyTofO/Fnoc89hIwOiOgrc
         YvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757480645; x=1758085445;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iC63/RJTeJkQ1+IrU21ucrYjL7BuPOO5Y6F0P+6CLoM=;
        b=WVwOeyjl2jvThSPJEL6mzzghRLPEHVGEZ1ZufXC7bCaHa9Lm6j6ht7aVnYdAQ9eQef
         Wjn46TWrCdYPLaFRBBVuvvuT5CpNvar9YezLDv7xpCXDsB79A9FMsjIKPXdH/k4OhiFE
         HJldNGwDOihtQ35uI0qR7Noo7vXsx3Q13BUGaBSZi7nGdaFvl+RoZCz6nkPfqnCHbK9W
         RdYHF1N9XW4mMFdX09SOD0ksdWyT/ikjl17ntpYaY8lRiAdP+eCD1U1NNW0phLkt/aRa
         2UkKuOMNqn6Md9zn9uFbC0iodzQ5aN/4Vw11pY7oBUYtX2TrPzEyuDlz8x/f/xOZgLZY
         fWIg==
X-Forwarded-Encrypted: i=1; AJvYcCWXAAVT5S7ie6T0QkNqrwqqUd4Qx2/0pRje463tVgMUl/pWgkR/UgrfK8vh9AD5hIORNvNy7v/N@lists.infradead.org
X-Gm-Message-State: AOJu0YxryZRdSulTD6NRYwiDx2BeM1XC/Vd4kfBaOmdClCmj8/oTOJ4k
	z3W1YHVFDMULMOWRfafhq+D7oTRIplmDPX+Y3E1pl/NJoh7xFhs4I3l5ngMvV3eerxk=
X-Gm-Gg: ASbGncvwEaPlh5rFoOolT9tvc8AKbmGwJ4cpzuQf6eSQGKvDPN5mmwJX5OtrwJ0QlpB
	7wnUeyhQlUteEPAPNcFydZRiNa5KDOqgjRB7xEcBTtCzp2p/0Wrb2k4e6AG1XRz3oqy5zoHAYym
	A/DDt8V4Bmzxy9PNrHMuXcN9PelI4OXS1bzJSwzx5GLjegb42rXJG3UQIJ9TC5GS4QDxFaqKG8T
	nLsFymOOqOKLjskARhD6BNB/I0uIZP4kVfCuRHLEx/UzK6Npgwx+EMzZKG4RgYHBFlhSBNa3ORn
	EMHhNwc6BNAro68RSbI9b+TRcN5kykDUg6jXN4PSc2SA4kXZcJAuxC7UBn0Ghcd7+mld8GQ3zI0
	uknpGj1bHjANJ53layWa47yKEnFNNi66C5eT1eg8=
X-Google-Smtp-Source: AGHT+IGLCXk02c6hTi1RtjcUqKJ+ON1vDiqOO+go65aDuMn3oLRAXkMlfY0Dd7VRCPtas/Vtj6hRhA==
X-Received: by 2002:a5e:db46:0:b0:883:ee57:93b7 with SMTP id ca18e2360f4ac-88767d09074mr2580484239f.0.1757480645211;
        Tue, 09 Sep 2025 22:04:05 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.207])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50d8f31ca99sm10591525173.51.2025.09.09.22.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 22:04:04 -0700 (PDT)
Message-ID: <f37ccb84-ef5f-4aed-8149-78c65e229165@sifive.com>
Date: Wed, 10 Sep 2025 00:04:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] lib: utils: fdt_helper: simplify
 fdt_parse_isa_extensions() helper
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: zong.li@sifive.com, greentime.hu@sifive.com, wxjstz@126.com,
 opensbi@lists.infradead.org
References: <20250906072656.5525-1-peter.lin@sifive.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20250906072656.5525-1-peter.lin@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_060419_810532_137EB89C 
X-CRM114-Status: GOOD (  22.39  )
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

Hi Peter,

On 2025-09-06 2:26 AM, Yu-Chien Peter Lin wrote:
> The fdt_isa_bitmap was previously used as a temporary array
> to store ISA extensions when parsing device-tree.
> To reduce scratch space consumption, set the ISA bitmap
> directly in hfeature->extensions, allows us to remove the
> fdt_parse_isa_all_harts() as fdt_parse_isa_extensions() can
> now handle the task directly.

Unfortunately, this change is not valid, because sbi_platform_extensions_init()
is called from the warm boot process, and it is not safe to access the FDT after
the cold boot process completes. The FDT is stored in memory accessible to
S-mode, so it could be clobbered as soon as the first supervisor domain starts.
Any refactoring must satisfy the requirement that the cold boot hart parses the
FDT nodes of all harts.

Regards,
Samuel

> 
> This change makes the helper function more versatile, even
> before scratch space is initialized.
> 
> Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> ---
>  include/sbi_utils/fdt/fdt_helper.h |  3 +-
>  lib/utils/fdt/fdt_helper.c         | 48 ++++--------------------------
>  platform/generic/platform.c        |  2 +-
>  3 files changed, 7 insertions(+), 46 deletions(-)
> 
> diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
> index 04c850cc..24ad1a94 100644
> --- a/include/sbi_utils/fdt/fdt_helper.h
> +++ b/include/sbi_utils/fdt/fdt_helper.h
> @@ -54,8 +54,7 @@ int fdt_parse_cbom_block_size(const void *fdt, int cpu_offset, unsigned long  *c
>  
>  int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq);
>  
> -int fdt_parse_isa_extensions(const void *fdt, unsigned int hartid,
> -			     unsigned long *extensions);
> +int fdt_parse_isa_extensions(const void *fdt, unsigned long *hart_exts);
>  
>  int fdt_parse_gaisler_uart_node(const void *fdt, int nodeoffset,
>  				struct platform_uart_data *uart);
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index 0f4859c1..252dd459 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -324,8 +324,6 @@ int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq)
>  
>  #define RISCV_ISA_EXT_NAME_LEN_MAX	32
>  
> -static unsigned long fdt_isa_bitmap_offset;
> -
>  static int fdt_parse_isa_one_hart(const char *isa, unsigned long *extensions)
>  {
>  	size_t i, j, isa_len;
> @@ -405,15 +403,13 @@ static void fdt_parse_isa_extensions_one_hart(const char *isa,
>  	}
>  }
>  
> -static int fdt_parse_isa_all_harts(const void *fdt)
> +int fdt_parse_isa_extensions(const void *fdt, unsigned long *hart_exts)
>  {
>  	u32 hartid;
>  	const fdt32_t *val;
> -	unsigned long *hart_exts;
> -	struct sbi_scratch *scratch;
>  	int err, cpu_offset, cpus_offset, len;
>  
> -	if (!fdt || !fdt_isa_bitmap_offset)
> +	if (!fdt || !hart_exts)
>  		return SBI_EINVAL;
>  
>  	cpus_offset = fdt_path_offset(fdt, "/cpus");
> @@ -425,15 +421,11 @@ static int fdt_parse_isa_all_harts(const void *fdt)
>  		if (err)
>  			continue;
>  
> -		if (!fdt_node_is_enabled(fdt, cpu_offset))
> +		if (hartid != current_hartid())
>  			continue;
>  
> -		scratch = sbi_hartid_to_scratch(hartid);
> -		if (!scratch)
> -			return SBI_ENOENT;
> -
> -		hart_exts = sbi_scratch_offset_ptr(scratch,
> -						   fdt_isa_bitmap_offset);
> +		if (!fdt_node_is_enabled(fdt, cpu_offset))
> +			continue;
>  
>  		val = fdt_getprop(fdt, cpu_offset, "riscv,isa-extensions", &len);
>  		if (val && len > 0) {
> @@ -454,36 +446,6 @@ static int fdt_parse_isa_all_harts(const void *fdt)
>  	return 0;
>  }
>  
> -int fdt_parse_isa_extensions(const void *fdt, unsigned int hartid,
> -			unsigned long *extensions)
> -{
> -	int rc, i;
> -	unsigned long *hart_exts;
> -	struct sbi_scratch *scratch;
> -
> -	if (!fdt_isa_bitmap_offset) {
> -		fdt_isa_bitmap_offset = sbi_scratch_alloc_offset(
> -					sizeof(*hart_exts) *
> -					BITS_TO_LONGS(SBI_HART_EXT_MAX));
> -		if (!fdt_isa_bitmap_offset)
> -			return SBI_ENOMEM;
> -
> -		rc = fdt_parse_isa_all_harts(fdt);
> -		if (rc)
> -			return rc;
> -	}
> -
> -	scratch = sbi_hartid_to_scratch(hartid);
> -	if (!scratch)
> -		return SBI_ENOENT;
> -
> -	hart_exts = sbi_scratch_offset_ptr(scratch, fdt_isa_bitmap_offset);
> -
> -	for (i = 0; i < BITS_TO_LONGS(SBI_HART_EXT_MAX); i++)
> -		extensions[i] |= hart_exts[i];
> -	return 0;
> -}
> -
>  static int fdt_parse_uart_node_common(const void *fdt, int nodeoffset,
>  				      struct platform_uart_data *uart,
>  				      unsigned long default_freq,
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index 47e771ad..2e8c6051 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -251,7 +251,7 @@ int generic_final_init(bool cold_boot)
>  int generic_extensions_init(struct sbi_hart_features *hfeatures)
>  {
>  	/* Parse the ISA string from FDT and enable the listed extensions */
> -	return fdt_parse_isa_extensions(fdt_get_address(), current_hartid(),
> +	return fdt_parse_isa_extensions(fdt_get_address(),
>  					hfeatures->extensions);
>  }
>  


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
