Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B425ED1CDC6
	for <opensbi@archiver.kernel.org>; Sun,  7 Dec 2025 11:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zrKiHtHQsGusbo0c4ZUBEPdqRyRs9fQBcRK+8YAPrf8=; b=LW5A0IbZvG7j1y
	tXzju0bmGE4AoVFjfn7sgjdnLTyWf4JVWZjRybtYWa4fUNQoBd9fs1PSvxLtVFVOm20Q4JC2nb5iK
	6piRHVKHJfJCND9dVqynCiCklA9ynDlneyAURJHDAp+53VSq7koocVdDfUyZ0iRci2gIIyPF0Zht8
	J8rM4SPKyfbNXaqFIq1OUhZ/KExbQVDD+8HvBno/J78UPX5CUpgeJmxmjsBsoMKpAkQzHBWgUlEoT
	c1gXbdbIHkB50fps52m0xT5n4Vh8q2w1hKnqJXnyjVJM6UdDQtaP51+GfcyZeC4CFu8mwFnzh/m+Z
	XCDNIOVXZ4Uk2K0VQYAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSCgk-0000000BhXR-25F8;
	Sun, 07 Dec 2025 11:12:26 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSCgi-0000000BhX5-3RFX
	for opensbi@lists.infradead.org;
	Sun, 07 Dec 2025 11:12:26 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-29844c68068so46409345ad.2
        for <opensbi@lists.infradead.org>; Sun, 07 Dec 2025 03:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1765105944; x=1765710744; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IUfqRnyg0MqGTQ5KxDDzIKOa11+5fvYmZAArZP7JLiM=;
        b=b3aUkYm21ZyHDcMvRnR6MAS793j4XRkYrp30KdzYv271rTKJZHnqP00LorJgfoFScU
         kr9Tlm8rJBybGwbPg7I1juMl2G4a2ZlgGLEnvrFUWKt3tUQ1xJ0oqj+4+s+j5iOmQ80u
         O99BFa7cScBbDfqteILfKLiAy4eTcij6hBL6BkW+RomCucKqAPgvkTs9P3pqQObP/E5s
         /MFG7DT6WlDPPZvxJIbzFRvdJgOJj5rIJc4W8C/GKJHgCRb92vH8H77MuQThIS0+FSnO
         iAXL+lg1uTEiT6pXzMt/palfwuCJeBw4cb1HfISm9Ofhd/O1uXAOAFDSPTuNJV12ivC6
         VVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765105944; x=1765710744;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IUfqRnyg0MqGTQ5KxDDzIKOa11+5fvYmZAArZP7JLiM=;
        b=D2grBSk39yLnNlho2S/MX4Vz61SGWWjt9JlugzyhiEkm48L9tJljE6WT7hNlEeTXNS
         VUbdEJU1Wcz2/5pf6/QlfkHi72ofrMHuY+JIsbQD9votqjP7yVkcGlZj49N1FAC/nI54
         2gyghMPF0Y1TkQW01/TpFF3DpS/w00qHA38Wg39Q2VH25b4pLBxTnl34a8W0pB2CtjIF
         zPO/0HkuLBWOK9yTiOC/6jv2gA0vUkZQoFyNQptDE0oM+K3CcHa7+BI+/CYRTfysWHAO
         QR1ECqqdvk2H7L2eeSCC5bhBKeqOeurJMPUdqANjTpvqzusFUDXJYjDxowUTHvRe4szn
         9VFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAc34f/ePXGGRfPWofPAskN01q76GC4dRGtWB/JjLJumQ1lUtDwOz+Jvqlc/6GuQJ9NLqhTI1L@lists.infradead.org
X-Gm-Message-State: AOJu0YwLra0O/bToMAWfubceaK1Pz9oANzfy5zMBj10G2gSM4okuaVJr
	djQrsDj3VPq4O35jAxCbYqNibN2cFoRk5245AxOfooMRGqCoRdXOfhBVngTOcLakXsM=
X-Gm-Gg: ASbGncvll4w3NcLLDVxpdoQBj811pQQOQSURnAmLCLuzrJOs/0fpogb+Q6+rgTXCc+T
	RA+DqwHqHWGUJXm7PjtCZnVunxf7ItQOtmgIJ3TVolhIq+bEAk2XgjM4unU6qTGUXoCXghzxzAO
	M5/rENiJEWpw27Vwmqk43DlhyH6m6NYASPXjS1qnRSHuB0O1q8evLyNuNSNF0kzozou7fhasbqb
	unZ8g0NYQNF8xosRJLpjfS08lHtVlnxLvs+hpfYcKzzjOXn2/d5cCwE+PdpE8ILcrDUukoKD4uf
	UgKVREMm4rcdKUyRxo5bazjJWJH6DqHE8YzaMkuEBcdBc9SAFrQrdtVq56CL8p8tXXH33eME+3m
	nQJHTCWDSWIf0ZFTl7Pt92zfgMdiTIPTK0XEh6rVB50icVIpZifTrvPF93gvasnsnj0L3E4nFTn
	LmWssBxcHQJ3dSAJs=
X-Google-Smtp-Source: AGHT+IEJ8PW/1vSimHG6IIssveRTl43ksLuWt0+L4QM0OOxtTfefJvlIrz92fQGnDvKTgmg+E2UbxQ==
X-Received: by 2002:a17:903:18d:b0:295:8a2a:9595 with SMTP id d9443c01a7336-29df5e1b85dmr47952985ad.39.1765105943937;
        Sun, 07 Dec 2025 03:12:23 -0800 (PST)
Received: from [100.64.0.1] ([165.225.110.109])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeaabba6sm95280315ad.73.2025.12.07.03.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Dec 2025 03:12:23 -0800 (PST)
Message-ID: <74d83521-1832-4ff8-9016-f073e9dbf614@sifive.com>
Date: Sun, 7 Dec 2025 05:12:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] lib: sbi: Implement hart protection for PMP and ePMP
To: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 opensbi@lists.infradead.org
References: <20251126141845.248697-1-apatel@ventanamicro.com>
 <20251126141845.248697-4-apatel@ventanamicro.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20251126141845.248697-4-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_031224_875063_223F9DC5 
X-CRM114-Status: GOOD (  28.25  )
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
> Implement PMP and ePMP based hart protection abstraction so
> that usage of sbi_hart_pmp_xyz() functions can be replaced
> with sbi_hart_protection_xyz() functions.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  lib/sbi/sbi_hart.c | 209 ++++++++++++++++++++++++++++-----------------
>  1 file changed, 133 insertions(+), 76 deletions(-)
> 
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index c5a8d248..8869839d 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -17,6 +17,7 @@
>  #include <sbi/sbi_csr_detect.h>
>  #include <sbi/sbi_error.h>
>  #include <sbi/sbi_hart.h>
> +#include <sbi/sbi_hart_protection.h>
>  #include <sbi/sbi_math.h>
>  #include <sbi/sbi_platform.h>
>  #include <sbi/sbi_pmu.h>
> @@ -311,6 +312,30 @@ bool sbi_hart_smepmp_is_fw_region(unsigned int pmp_idx)
>  	return bitmap_test(fw_smepmp_ids, pmp_idx) ? true : false;
>  }
>  
> +static void sbi_hart_pmp_fence(void)
> +{
> +	/*
> +	 * As per section 3.7.2 of privileged specification v1.12,
> +	 * virtual address translations can be speculatively performed
> +	 * (even before actual access). These, along with PMP traslations,
> +	 * can be cached. This can pose a problem with CPU hotplug
> +	 * and non-retentive suspend scenario because PMP states are
> +	 * not preserved.
> +	 * It is advisable to flush the caching structures under such
> +	 * conditions.
> +	 */
> +	if (misa_extension('S')) {
> +		__asm__ __volatile__("sfence.vma");
> +
> +		/*
> +		 * If hypervisor mode is supported, flush caching
> +		 * structures in guest mode too.
> +		 */
> +		if (misa_extension('H'))
> +			__sbi_hfence_gvma_all();
> +	}
> +}
> +
>  static void sbi_hart_smepmp_set(struct sbi_scratch *scratch,
>  				struct sbi_domain *dom,
>  				struct sbi_domain_memregion *reg,
> @@ -343,14 +368,19 @@ static bool is_valid_pmp_idx(unsigned int pmp_count, unsigned int pmp_idx)
>  	return false;
>  }
>  
> -static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
> -				     unsigned int pmp_count,
> -				     unsigned int pmp_log2gran,
> -				     unsigned long pmp_addr_max)
> +static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch)
>  {
>  	struct sbi_domain_memregion *reg;
>  	struct sbi_domain *dom = sbi_domain_thishart_ptr();
> -	unsigned int pmp_idx, pmp_flags;
> +	unsigned int pmp_log2gran, pmp_bits;
> +	unsigned int pmp_idx, pmp_count;
> +	unsigned long pmp_addr_max;
> +	unsigned int pmp_flags;
> +
> +	pmp_count = sbi_hart_pmp_count(scratch);
> +	pmp_log2gran = sbi_hart_pmp_log2gran(scratch);
> +	pmp_bits = sbi_hart_pmp_addrbits(scratch) - 1;
> +	pmp_addr_max = (1UL << pmp_bits) | ((1UL << pmp_bits) - 1);
>  
>  	/*
>  	 * Set the RLB so that, we can write to PMP entries without
> @@ -430,20 +460,64 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
>  	 * Keep the RLB bit so that dynamic mappings can be done.
>  	 */
>  
> +	sbi_hart_pmp_fence();
>  	return 0;
>  }
>  
> -static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
> -				     unsigned int pmp_count,
> -				     unsigned int pmp_log2gran,
> -				     unsigned long pmp_addr_max)
> +static int sbi_hart_smepmp_map_range(struct sbi_scratch *scratch,
> +				     unsigned long addr, unsigned long size)
> +{
> +	/* shared R/W access for M and S/U mode */
> +	unsigned int pmp_flags = (PMP_W | PMP_X);
> +	unsigned long order, base = 0;
> +
> +	if (is_pmp_entry_mapped(SBI_SMEPMP_RESV_ENTRY))
> +		return SBI_ENOSPC;
> +
> +	for (order = MAX(sbi_hart_pmp_log2gran(scratch), log2roundup(size));
> +	     order <= __riscv_xlen; order++) {
> +		if (order < __riscv_xlen) {
> +			base = addr & ~((1UL << order) - 1UL);
> +			if ((base <= addr) &&
> +			    (addr < (base + (1UL << order))) &&
> +			    (base <= (addr + size - 1UL)) &&
> +			    ((addr + size - 1UL) < (base + (1UL << order))))
> +				break;
> +		} else {
> +			return SBI_EFAIL;
> +		}
> +	}
> +
> +	sbi_platform_pmp_set(sbi_platform_ptr(scratch), SBI_SMEPMP_RESV_ENTRY,
> +			     SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW,
> +			     pmp_flags, base, order);
> +	pmp_set(SBI_SMEPMP_RESV_ENTRY, pmp_flags, base, order);
> +
> +	return SBI_OK;
> +}
> +
> +static int sbi_hart_smepmp_unmap_range(struct sbi_scratch *scratch,
> +				       unsigned long addr, unsigned long size)
> +{
> +	sbi_platform_pmp_disable(sbi_platform_ptr(scratch), SBI_SMEPMP_RESV_ENTRY);
> +	return pmp_disable(SBI_SMEPMP_RESV_ENTRY);
> +}
> +
> +static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch)
>  {
>  	struct sbi_domain_memregion *reg;
>  	struct sbi_domain *dom = sbi_domain_thishart_ptr();
> -	unsigned int pmp_idx = 0;
> +	unsigned long pmp_addr, pmp_addr_max;
> +	unsigned int pmp_log2gran, pmp_bits;
> +	unsigned int pmp_idx, pmp_count;
>  	unsigned int pmp_flags;
> -	unsigned long pmp_addr;
>  
> +	pmp_count = sbi_hart_pmp_count(scratch);
> +	pmp_log2gran = sbi_hart_pmp_log2gran(scratch);
> +	pmp_bits = sbi_hart_pmp_addrbits(scratch) - 1;
> +	pmp_addr_max = (1UL << pmp_bits) | ((1UL << pmp_bits) - 1);
> +
> +	pmp_idx = 0;
>  	sbi_domain_for_each_memregion(dom, reg) {
>  		if (!is_valid_pmp_idx(pmp_count, pmp_idx))
>  			return SBI_EFAIL;
> @@ -478,43 +552,19 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
>  		}
>  	}
>  
> +	sbi_hart_pmp_fence();
>  	return 0;
>  }
>  
>  int sbi_hart_map_saddr(unsigned long addr, unsigned long size)
>  {
> -	/* shared R/W access for M and S/U mode */
> -	unsigned int pmp_flags = (PMP_W | PMP_X);
> -	unsigned long order, base = 0;
>  	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
>  
>  	/* If Smepmp is not supported no special mapping is required */
>  	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP))
>  		return SBI_OK;
>  
> -	if (is_pmp_entry_mapped(SBI_SMEPMP_RESV_ENTRY))
> -		return SBI_ENOSPC;
> -
> -	for (order = MAX(sbi_hart_pmp_log2gran(scratch), log2roundup(size));
> -	     order <= __riscv_xlen; order++) {
> -		if (order < __riscv_xlen) {
> -			base = addr & ~((1UL << order) - 1UL);
> -			if ((base <= addr) &&
> -			    (addr < (base + (1UL << order))) &&
> -			    (base <= (addr + size - 1UL)) &&
> -			    ((addr + size - 1UL) < (base + (1UL << order))))
> -				break;
> -		} else {
> -			return SBI_EFAIL;
> -		}
> -	}
> -
> -	sbi_platform_pmp_set(sbi_platform_ptr(scratch), SBI_SMEPMP_RESV_ENTRY,
> -			     SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW,
> -			     pmp_flags, base, order);
> -	pmp_set(SBI_SMEPMP_RESV_ENTRY, pmp_flags, base, order);
> -
> -	return SBI_OK;
> +	return sbi_hart_smepmp_map_range(scratch, addr, size);
>  }
>  
>  int sbi_hart_unmap_saddr(void)
> @@ -524,53 +574,18 @@ int sbi_hart_unmap_saddr(void)
>  	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP))
>  		return SBI_OK;
>  
> -	sbi_platform_pmp_disable(sbi_platform_ptr(scratch), SBI_SMEPMP_RESV_ENTRY);
> -	return pmp_disable(SBI_SMEPMP_RESV_ENTRY);
> +	return sbi_hart_smepmp_unmap_range(scratch, 0, 0);
>  }
>  
>  int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
>  {
> -	int rc;
> -	unsigned int pmp_bits, pmp_log2gran;
> -	unsigned int pmp_count = sbi_hart_pmp_count(scratch);
> -	unsigned long pmp_addr_max;
> -
> -	if (!pmp_count)
> +	if (!sbi_hart_pmp_count(scratch))
>  		return 0;
>  
> -	pmp_log2gran = sbi_hart_pmp_log2gran(scratch);
> -	pmp_bits = sbi_hart_pmp_addrbits(scratch) - 1;
> -	pmp_addr_max = (1UL << pmp_bits) | ((1UL << pmp_bits) - 1);
> -
>  	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP))
> -		rc = sbi_hart_smepmp_configure(scratch, pmp_count,
> -						pmp_log2gran, pmp_addr_max);
> +		return sbi_hart_smepmp_configure(scratch);
>  	else
> -		rc = sbi_hart_oldpmp_configure(scratch, pmp_count,
> -						pmp_log2gran, pmp_addr_max);
> -
> -	/*
> -	 * As per section 3.7.2 of privileged specification v1.12,
> -	 * virtual address translations can be speculatively performed
> -	 * (even before actual access). These, along with PMP traslations,
> -	 * can be cached. This can pose a problem with CPU hotplug
> -	 * and non-retentive suspend scenario because PMP states are
> -	 * not preserved.
> -	 * It is advisable to flush the caching structures under such
> -	 * conditions.
> -	 */
> -	if (misa_extension('S')) {
> -		__asm__ __volatile__("sfence.vma");
> -
> -		/*
> -		 * If hypervisor mode is supported, flush caching
> -		 * structures in guest mode too.
> -		 */
> -		if (misa_extension('H'))
> -			__sbi_hfence_gvma_all();
> -	}
> -
> -	return rc;
> +		return sbi_hart_oldpmp_configure(scratch);
>  }
>  
>  void sbi_hart_pmp_unconfigure(struct sbi_scratch *scratch)
> @@ -587,6 +602,42 @@ void sbi_hart_pmp_unconfigure(struct sbi_scratch *scratch)
>  	}
>  }
>  
> +static struct sbi_hart_protection pmp_protection = {
> +	.name = "pmp",
> +	.rating = 100,
> +	.configure = sbi_hart_oldpmp_configure,
> +	.unconfigure = sbi_hart_pmp_unconfigure,
> +};
> +
> +static struct sbi_hart_protection epmp_protection = {
> +	.name = "epmp",
> +	.rating = 200,
> +	.configure = sbi_hart_smepmp_configure,
> +	.unconfigure = sbi_hart_pmp_unconfigure,
> +	.map_range = sbi_hart_smepmp_map_range,
> +	.unmap_range = sbi_hart_smepmp_unmap_range,
> +};
> +
> +static int sbi_hart_pmp_init(struct sbi_scratch *scratch)
> +{
> +	int rc;
> +
> +	if (!sbi_hart_pmp_count(scratch))
> +		return 0;
> +
> +	rc = sbi_hart_protection_register(&pmp_protection);
> +	if (rc)
> +		return rc;
> +
> +	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP)) {
> +		rc = sbi_hart_protection_register(&epmp_protection);
> +		if (rc)
> +			return rc;
> +	}

The only reason I can see for registering both PMP and ePMP is to fall back to
PMP if ePMP configuration fails (as ePMP requires more slots). But you don't do
that. We shouldn't register PMP if we know it will not be used.

Regards,
Samuel

> +
> +	return 0;
> +}
> +
>  int sbi_hart_priv_version(struct sbi_scratch *scratch)
>  {
>  	struct sbi_hart_features *hfeatures =
> @@ -1051,6 +1102,12 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
>  	if (rc)
>  		return rc;
>  
> +	if (cold_boot) {
> +		rc = sbi_hart_pmp_init(scratch);
> +		if (rc)
> +			return rc;
> +	}
> +
>  	rc = delegate_traps(scratch);
>  	if (rc)
>  		return rc;


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
