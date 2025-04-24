Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034C9C369D3
	for <opensbi@archiver.kernel.org>; Thu, 24 Apr 2025 01:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Us7Y8Xkghr2FXksVEVFFjA3vudZcd76UlqCOffiFJlk=; b=Celudg+SXEz1uu
	AYzUoKzcBfgqTQdfwoQkP5oeYjtXOE4SI+SEN0DQLlVcQKCYGUD0nSs5c613X6K6KP2+3SKKkZThj
	8e/NzinI51yaVCBHHeXx+T0s18bfj2+3TS0pN/ZYxdu/4bkEJdXDOG825FGskrqpJEN5TM2tRyMIl
	Heg9vACw2/OB3Dw6jffir27bhZiCl0Bgw9DhLdRnEr9VIyRw3hRzao48IQhYepUamLDnGzceBk5xC
	k+eE0iKBKsP0b+/DdEFyOQlrGU+0XCZleEpUK0xE2q9kGOE/GvqvINCrCKSypGee/jLNVygYKHNri
	pEFNDbbxFpTX7SQd25aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7lDe-0000000CV8S-3bzD;
	Thu, 24 Apr 2025 01:17:38 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7lDc-0000000CV7j-1cfi
	for opensbi@lists.infradead.org;
	Thu, 24 Apr 2025 01:17:37 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-85b41281b50so19486839f.3
        for <opensbi@lists.infradead.org>; Wed, 23 Apr 2025 18:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745457455; x=1746062255; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k9XNB0dYrJsmjtdQH9PKGsrWGHPjyYdxLn52Ih3ks6U=;
        b=nZekIt+IBSWEuc40ywxjG4w2/vM3srav3EYiSmDJATbxkkFksy+ekuN+mPOXPJ48Xr
         IFijDLWCu/HyH6cuzUC5gjfYcqex3WhyHGqqD6WdIXwo3VBmov7lCcenHeB+tgkLZ3Yd
         oet/J4QzYzGtxHtzwf5hvnv3vueo1gN1yu6Lm+lnn6rThkqFs5b/QTH6HpAVKXQALxdd
         cme/s9YXxFnxikeIVRZ6jVOxahha+AOy8lxng03pjaT76Q12GPQwFNsro7JmWomhUc6e
         ZEhZWTf12j4W3HeP6l4pX50CsfrsuAcy53++mbZZQjHxYU+OncLkf67gRK1LoBrmUhA7
         IbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745457455; x=1746062255;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k9XNB0dYrJsmjtdQH9PKGsrWGHPjyYdxLn52Ih3ks6U=;
        b=QTbW7rNTF4ngJDE1TaNA/73ZR3Gr8+LzXOriAX2uVp2npZODugyJ1Y3XQ0bnWHrAAp
         gMW70H8hfKXtqwmEGDdY83LHpFKlqTGMSaxbewcZ8GmupQwE8oFj408ll8pqQbgGc9dd
         TANBMmGiHb6HQ9NfMaJswLqBg2MGa4mb6oNhSQ1iLZZ1c2ZOIIMpX9U8B09qXdra9PGH
         zYARALIsa5/rKszDpU7aJV2q1OOtW1lBn+cBSj+IhYoHKCvyK663jP09wBGFyEUXfTpO
         MEk5agRcCpWJXWHcNX5mLjZcZXZkbBygAwTfFnpvt/0ote3jPuEJ1kUPQEW5wmkxms4W
         fRCw==
X-Forwarded-Encrypted: i=1; AJvYcCUtr+0ywlaxWEI1lVzuQRUg5YUE69F6BlYyCQE+6dN+Om2RuOL/ek70vH7AGbELszqfnz6gdAJC@lists.infradead.org
X-Gm-Message-State: AOJu0YwrGaFiP5Z9HbTQDj4PfvJbBoM6tqHzhj6nxH16M61FCE2jJwGf
	d5Wa48YdX8duLMe8l+uJJ4BUtxwEJoK89IHD8Lx3EM/B3ciUuuUXRKIZTD29B2g=
X-Gm-Gg: ASbGnctoFHiJzaoaxa/vFCHSITwjtPw95mOWIVIucnToOhvQikoD+8jaGM19nX5dReM
	sR88hX/PuAC8wXS/GBOx4SYLXJ5aaBo3VJsUjv03V65CzbWPuGAXfKMIVyCRFwnBQiSMKxsB4Q7
	G9p7TF7ATNoHt7/nOjhDtmbHTeDuMt1bZ1O34xHRXylREkkfGhr2Bx4rS0hLBXlNPuW5rTzR70a
	mS/2q0oovmNbOJwz5GUM8EwxHe7xzQ83g89l0mdhx7BSXZT4ioEol8+PiYoz1n6tpzfx2DBs9lJ
	CMEqD3iz8zX0W1jxNbtP49EcwzWYNcUYa4pjzR49TVE9TPZpFkkxsPnLmL5joSQ2zV82ag==
X-Google-Smtp-Source: AGHT+IGHZ22nREe1vVnihLiIgLdBsUZLPBywYj/XnWOhM7HO58QOzWjXqvX1j6jV2uTV67pSgCTkKA==
X-Received: by 2002:a05:6602:13c7:b0:85b:4ad1:70e with SMTP id ca18e2360f4ac-8644f9b4f03mr132489839f.6.1745457454834;
        Wed, 23 Apr 2025 18:17:34 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.12.183])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f824ba34c1sm51855173.126.2025.04.23.18.17.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 18:17:34 -0700 (PDT)
Message-ID: <13e2ca07-cc22-4d6e-9b93-088cec1078a4@sifive.com>
Date: Wed, 23 Apr 2025 20:17:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] lib: sbi: Set the scratch allocation to alignment to
 cacheline size.
To: Raj Vishwanathan <raj.vishwanathan@gmail.com>, opensbi@lists.infradead.org
Cc: rvishwanathan@mips.com
References: <20250318185111.452620-1-Raj.Vishwanathan@gmail.com>
 <20250423225045.267983-1-Raj.Vishwanathan@gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20250423225045.267983-1-Raj.Vishwanathan@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_181736_446282_84EF6DC3 
X-CRM114-Status: GOOD (  28.37  )
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

Hi Raj,

On 2025-04-23 5:50 PM, Raj Vishwanathan wrote:
> We set the scratch allocation alignment to cacheline size,specified by
> riscv,cbom-block-size in the dts file to avoid two atomic variables from
> the same cache line causing livelock on some platforms. If the cacheline
> is not specified, we set it a default value.
> 
> Signed-off-by: Raj Vishwanathan <Raj.Vishwanathan@gmail.com>
> --
> Changes in V6:
> 	Add assert for assert_member_offset for cbom_block_size
> 	Update the subject line
> Changes in V5:
> 	Formatting issues
> Changes in V4:
> 	Pickup the cacheline size from the dts file
> Changes in V3:
>     Remove platform specific references to 64 Bytes.
> Changes in V2:
>     Added a new configuration to get the alignment size.
> Change in V1:
>     Original Patch
> ---
>  include/sbi/sbi_platform.h         |  5 +++++
>  include/sbi_utils/fdt/fdt_helper.h |  2 ++
>  lib/sbi/sbi_scratch.c              | 26 ++++++++++++++++++++++++--
>  lib/utils/fdt/fdt_helper.c         | 24 ++++++++++++++++++++++++
>  platform/generic/platform.c        |  9 +++++++++
>  5 files changed, 64 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
> index 82840ae..08ece32 100644
> --- a/include/sbi/sbi_platform.h
> +++ b/include/sbi/sbi_platform.h
> @@ -39,6 +39,8 @@
>  #define SBI_PLATFORM_FIRMWARE_CONTEXT_OFFSET (0x60 + __SIZEOF_POINTER__)
>  /** Offset of hart_index2id in struct sbi_platform */
>  #define SBI_PLATFORM_HART_INDEX2ID_OFFSET (0x60 + (__SIZEOF_POINTER__ * 2))
> +/** Offset of cbom_block_size in struct sbi_platform */
> +#define SBI_PLATFORM_CBOM_BLOCK_SIZE_OFFSET (0x60 + (__SIZEOF_POINTER__ * 3))
>  
>  #define SBI_PLATFORM_TLB_RANGE_FLUSH_LIMIT_DEFAULT		(1UL << 12)
>  
> @@ -190,6 +192,8 @@ struct sbi_platform {
>  	 *     hart_index2id[<abc>] = <abc>
>  	 */
>  	const u32 *hart_index2id;
> +	/** Allocation alignment for Scratch */
> +	unsigned long cbom_block_size;
>  };
>  
>  /**
> @@ -207,6 +211,7 @@ assert_member_offset(struct sbi_platform, reserved, SBI_PLATFORM_RESERVED_OFFSET
>  assert_member_offset(struct sbi_platform, platform_ops_addr, SBI_PLATFORM_OPS_OFFSET);
>  assert_member_offset(struct sbi_platform, firmware_context, SBI_PLATFORM_FIRMWARE_CONTEXT_OFFSET);
>  assert_member_offset(struct sbi_platform, hart_index2id, SBI_PLATFORM_HART_INDEX2ID_OFFSET);
> +assert_member_offset(struct sbi_platform, cbom_block_size, SBI_PLATFORM_CBOM_BLOCK_SIZE_OFFSET);
>  
>  /** Get pointer to sbi_platform for sbi_scratch pointer */
>  #define sbi_platform_ptr(__s) \
> diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
> index 5875880..04c850c 100644
> --- a/include/sbi_utils/fdt/fdt_helper.h
> +++ b/include/sbi_utils/fdt/fdt_helper.h
> @@ -50,6 +50,8 @@ int fdt_parse_hart_id(const void *fdt, int cpu_offset, u32 *hartid);
>  
>  int fdt_parse_max_enabled_hart_id(const void *fdt, u32 *max_hartid);
>  
> +int fdt_parse_cbom_block_size(const void *fdt, int cpu_offset, unsigned long  *cbom_block_size);
> +
>  int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq);
>  
>  int fdt_parse_isa_extensions(const void *fdt, unsigned int hartid,
> diff --git a/lib/sbi/sbi_scratch.c b/lib/sbi/sbi_scratch.c
> index 8c7eeaf..916f283 100644
> --- a/lib/sbi/sbi_scratch.c
> +++ b/lib/sbi/sbi_scratch.c
> @@ -14,6 +14,8 @@
>  #include <sbi/sbi_scratch.h>
>  #include <sbi/sbi_string.h>
>  
> +#define DEFAULT_SCRATCH_ALLOC_ALIGN __SIZEOF_POINTER__
> +
>  u32 sbi_scratch_hart_count;
>  u32 hartindex_to_hartid_table[SBI_HARTMASK_MAX_BITS] = { [0 ... SBI_HARTMASK_MAX_BITS-1] = -1U };
>  struct sbi_scratch *hartindex_to_scratch_table[SBI_HARTMASK_MAX_BITS];
> @@ -21,6 +23,19 @@ struct sbi_scratch *hartindex_to_scratch_table[SBI_HARTMASK_MAX_BITS];
>  static spinlock_t extra_lock = SPIN_LOCK_INITIALIZER;
>  static unsigned long extra_offset = SBI_SCRATCH_EXTRA_SPACE_OFFSET;
>  
> +static unsigned long sbi_get_scratch_alloc_align(void)
> +{
> +	const struct sbi_platform *plat;
> +	/*
> +	 * Get the alignment size. We will return DEFAULT_SCRATCH_ALLOC_ALIGNMENT
> +	 * or riscv,cbom_block_size
> +	 */
> +	plat = sbi_platform_thishart_ptr();
> +	if (!plat || !plat->cbom_block_size)
> +		return DEFAULT_SCRATCH_ALLOC_ALIGN;
> +	return plat->cbom_block_size;
> +}
> +
>  u32 sbi_hartid_to_hartindex(u32 hartid)
>  {
>  	sbi_for_each_hartindex(i)
> @@ -57,6 +72,7 @@ unsigned long sbi_scratch_alloc_offset(unsigned long size)
>  	void *ptr;
>  	unsigned long ret = 0;
>  	struct sbi_scratch *rscratch;
> +	unsigned long scratch_alloc_align = 0;

This variable is unconditionally assigned below, so it doesn't need to be
initialized here.

>  
>  	/*
>  	 * We have a simple brain-dead allocator which never expects
> @@ -70,8 +86,14 @@ unsigned long sbi_scratch_alloc_offset(unsigned long size)
>  	if (!size)
>  		return 0;
>  
> -	size += __SIZEOF_POINTER__ - 1;
> -	size &= ~((unsigned long)__SIZEOF_POINTER__ - 1);
> +	scratch_alloc_align = sbi_get_scratch_alloc_align();
> +
> +	/*
> +	 * We let the allocation align to cacheline bytes to avoid livelock on
> +	 * certain platforms due to atomic variables from the same cache line.
> +	 */
> +	size += scratch_alloc_align - 1;
> +	size &= ~(scratch_alloc_align - 1);
>  
>  	spin_lock(&extra_lock);
>  
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index 79e59dd..b2d91fd 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -246,6 +246,30 @@ int fdt_parse_hart_id(const void *fdt, int cpu_offset, u32 *hartid)
>  	return 0;
>  }
>  
> +int fdt_parse_cbom_block_size(const void *fdt, int cpu_offset, unsigned long *cbom_block_size)
> +{
> +	int len;
> +	const void *prop;
> +	const fdt32_t *val;
> +
> +	if (!fdt || cpu_offset < 0)
> +		return SBI_EINVAL;
> +
> +	prop = fdt_getprop(fdt, cpu_offset, "device_type", &len);
> +	if (!prop || !len)
> +		return SBI_EINVAL;
> +	if (strncmp (prop, "cpu", strlen ("cpu")))
> +		return SBI_EINVAL;
> +
> +	val = fdt_getprop(fdt, cpu_offset, "riscv,cbom-block-size", &len);
> +	if (!val || len < sizeof(fdt32_t))
> +		return SBI_EINVAL;
> +
> +	if (cbom_block_size)
> +		*cbom_block_size = fdt32_to_cpu(*val);
> +	return 0;
> +}
> +
>  int fdt_parse_max_enabled_hart_id(const void *fdt, u32 *max_hartid)
>  {
>  	u32 hartid;
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index f3072be..2b1b949 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -147,6 +147,9 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
>  	const void *fdt = (void *)arg1;
>  	u32 hartid, hart_count = 0;
>  	int rc, root_offset, cpus_offset, cpu_offset, len;
> +	unsigned long cbom_block_size = 0;
> +	unsigned long tmp = 0;
> +
>  

Extra blank line here. These are trivial issues, so:

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

>  	root_offset = fdt_path_offset(fdt, "/");
>  	if (root_offset < 0)
> @@ -174,11 +177,17 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
>  			continue;
>  
>  		generic_hart_index2id[hart_count++] = hartid;
> +
> +		rc = fdt_parse_cbom_block_size(fdt, cpu_offset, &tmp);
> +		if (rc)
> +			continue;
> +		cbom_block_size = MAX(tmp, cbom_block_size);
>  	}
>  
>  	platform.hart_count = hart_count;
>  	platform.heap_size = fw_platform_get_heap_size(fdt, hart_count);
>  	platform_has_mlevel_imsic = fdt_check_imsic_mlevel(fdt);
> +	platform.cbom_block_size = cbom_block_size;
>  
>  	fw_platform_coldboot_harts_init(fdt);
>  


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
