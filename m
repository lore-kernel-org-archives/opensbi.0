Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD42C61DBD
	for <opensbi@archiver.kernel.org>; Fri, 28 Aug 2026 12:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r/XUBjGfl9osY/DwjngXafgTyCodnqsO9Zzuj5v33Mk=; b=qOZ47ZuqT0CeOd
	17l3wb+j72DgifDL1V08z/x5QmMptkT574Eb2eOw2hzMrqC7FUHThrlHf1zQE/Nekfqi9iDc+jmSI
	3e/HlDOfCOSRJfmv66NlS24THYzu8NjAfFHNerrc9pRayFFAt8o1PYFdcsZl6Gvxd9HSQnWpFhIRz
	Sptuz+GojFEJMWas2IdXkGc8mSb0ci+bfi7jvmrxqMljm66XpW/S/AAq5Fx+eJ3bNs/KIFosFRBZz
	07uB2oUcFUp6M/QB5urvlOgDAItpMaI/ceFica6wsF89puz2V6I0YhYqhBij06/zhO3upM7WrKBRE
	esl14phCME9XC5XoE/QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzvxe-00000005kob-2rcT;
	Fri, 28 Aug 2026 12:45:34 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzvxb-00000005koB-1dxj
	for opensbi@lists.infradead.org;
	Fri, 28 Aug 2026 12:45:33 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-382ef647e20so893550a91.1
        for <opensbi@lists.infradead.org>; Fri, 28 Aug 2026 05:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787921130; x=1788525930; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/6wxI6KRLQZOCb87xcCrPbhpLWY2z2IbDGl73D+AE+c=;
        b=FTKXOcmz2wM5spclvk7sxoFPYGf9Vd1o2Wsl4PR4Jday4yz0TL3VsPi5GylOwhFQIj
         /hz8/kn6g3qne2GlrSibWvoY9VBv18YRnSQNj65gVvFc7yVnFuZz8xQcNwP0iWJLyvyS
         B6GjrqCWWWrZZZMPObS9CRHSxa0bTZlDDNC2BAq4OFtT+93YbGDSk1IwKyj9XD72hIRn
         bFoZY4taMnW9WHwu8+8xah7rkh0cv0PjV/JevLUYoVnD5kWi2d5m5TjdczXkQV2LEu7S
         gPyLX7re9seScx8LiDdYT3BTeQcMfpt/PmoriL7OT271azwnT0SFQ/XeCkjxDx4xyjWu
         aq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787921130; x=1788525930;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/6wxI6KRLQZOCb87xcCrPbhpLWY2z2IbDGl73D+AE+c=;
        b=Jb+cqPogq+RzojV6eeF0nyTXABPwZXsXdTaEIAxzU1/yCAz72Hh3g9Fy9C2Bq1E0eQ
         lAqyOvH9JC41hemvWq3UbV6BzO6Wr58HwLLnvWbc5uPmzxXWszik82kK4DCTD3SOK4yY
         3pfJttek+ul6CiGEDf2uSTAQOl4A7U3kwE6iCf2dEhwVmo9oxOtqMl6EOM7FCWNhEemD
         OkxIoSlID6x3o85bkkwhreSbIKo4niupSEp6APIxsXzCCzowNfOiUQ/43FhQa7cpMs+M
         TtHjnSAhFf+gDDpcSbgwU+cmnFTl9v2iLGbpRk8zqI8a9gdE2ZqPXzy8/mi7OV674mtk
         V2FQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr6x1B+F696zlbWSP7LsZd3lh/EcSrFW5ZnsHWf4RvGh54OC1HYvWfNIcQs0a2VcK+L5FrDRLi0@lists.infradead.org
X-Gm-Message-State: AFuF++kp1xA6ytIEzcuoyz9jVJ5ZcxgLXz86y5jzvAViAWGzw6EMpLa3
	ef0zzQ6RfzzTS0nQyCoPdgMIk4wa8xDihVR5hLhqUcXmPgpn1MB4HU6QpTDKgyvUTSI=
X-Gm-Gg: AR+sD11f3cRQFGBfjG6qcPzDCu1VIZ9Un2oT/rIIEhR3dD6qX1yb1oL1nw6o2/CnXGO
	iHrUPfd7Ws3FyEEabDXpAwXTixcfsfbacL8BTpuP6sLXMgoTwz2tZlQog2cT8X6fZj7bzcLMHEc
	kOZFVg94nbW/sptKgMWswAqzJZq/5TK9Cn0C3Gc3iI0uDSqeStkoFRLZHX/nI3urGJVb+qv+F1b
	jLa33cW44TFkqV+p0ZyRbdasLc6d29/sUNxolW9H6xSw4+cwWnCKmzNdAiMTNo6iPu+siysRl+X
	AsD8ftxAzzGZNacoxf6OHFZ2eEPUEH8Ly56uZ/3gT9h9BcT2M2XT0QzibLqPeHBsgh2mvw96iNw
	3efjHZZhbc6EyDw4+F5plZS8AGIalz5dqpH/ccJSz5pRJleWHs99tjah4TiI2jLDZt84hnLkSf+
	HeoTkqA31r+hPBVZnEcsfoZvUt0/rxrXmu89rxXnPHA+/A1n7IXfC1xQE9dg==
X-Received: by 2002:a17:90b:4fca:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-396d0daf8d9mr14079856a91.4.1787921130295;
        Fri, 28 Aug 2026 05:45:30 -0700 (PDT)
Received: from plin-1878 ([136.226.240.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396afff2650sm7155770a91.0.2026.08.28.05.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:45:29 -0700 (PDT)
Date: Fri, 28 Aug 2026 20:45:25 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
Subject: Re: [PATCH v2 2/3] lib: sbi_domain: Re-work boot-time assignment of
 HARTs to non-ROOT domains
Message-ID: <apGC5Wv2oOSRR7GE@plin-1878>
References: <20260817143025.3068512-1-anup.patel@oss.qualcomm.com>
 <20260817143025.3068512-3-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260817143025.3068512-3-anup.patel@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_054531_698114_D1CBD0C7 
X-CRM114-Status: GOOD (  40.05  )
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

On Mon, Aug 17, 2026 at 08:00:24PM +0530, Anup Patel wrote:
> Assign a non-ROOT domain to a HART on first come first serve basis if the
> HART is listed as a possible HART of the non-ROOT domain. If no non-ROOT
> domain list a HART as possible HART then the HART is assigned to the ROOT
> domain.
> 
> This allows us to drop the OpenSBI specific DT property from each CPU DT
> node (aka "opensbi-domain" Dt property).
> 
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> ---
>  docs/domain_support.md             | 20 +++----
>  include/sbi/sbi_domain.h           |  4 +-
>  include/sbi_utils/fdt/fdt_domain.h |  3 +-
>  lib/sbi/sbi_domain.c               | 34 ++++++-----
>  lib/utils/fdt/fdt_domain.c         | 95 +++---------------------------
>  5 files changed, 35 insertions(+), 121 deletions(-)
> 
> diff --git a/docs/domain_support.md b/docs/domain_support.md
> index e267a9f7..82f155e1 100644
> --- a/docs/domain_support.md
> +++ b/docs/domain_support.md
> @@ -207,15 +207,14 @@ The DT properties of a domain instance DT node are as follows:
>  
>  ### Assigning HART To Domain Instance
>  
> -By default, all HARTs are assigned to **the ROOT domain**. The OpenSBI
> -platform support can provide the HART to domain instance assignment using
> -platform specific callback.
> +At boot-time, a HART is assigned to a non-ROOT domain on first come
> +first serve basis if the HART is listed as a possible HART of the
> +non-ROOT domain. If no non-ROOT domain list a HART as possible HART
> +then the HART is assigned to **the ROOT domain**.
>  
> -The HART to domain instance assignment can be parsed from the device tree
> -using optional DT property **opensbi-domain** in each CPU DT node. The
> -value of DT property **opensbi-domain** is the DT phandle of the domain
> -instance DT node. If **opensbi-domain** DT property is not specified then
> -corresponding HART is assigned to **the ROOT domain**.
> +At runtime, the assignment of a HART can change from one domain to
> +another domain as long as the HART is listed in possible HARTs of
> +both domains.
>  
>  ### Domain Configuration Only Accessible to OpenSBI
>  
> @@ -289,7 +288,6 @@ be done:
>              device_type = "cpu";
>              reg = <0x00>;
>              compatible = "riscv";
> -            opensbi-domain = <&tdomain>;
>              ...
>          };
>  
> @@ -297,7 +295,6 @@ be done:
>              device_type = "cpu";
>              reg = <0x01>;
>              compatible = "riscv";
> -            opensbi-domain = <&udomain>;
>              ...
>          };
>  
> @@ -305,7 +302,6 @@ be done:
>              device_type = "cpu";
>              reg = <0x02>;
>              compatible = "riscv";
> -            opensbi-domain = <&udomain>;
>              ...
>          };
>  
> @@ -313,7 +309,6 @@ be done:
>              device_type = "cpu";
>              reg = <0x03>;
>              compatible = "riscv";
> -            opensbi-domain = <&udomain>;
>              ...
>          };
>  
> @@ -321,7 +316,6 @@ be done:
>              device_type = "cpu";
>              reg = <0x04>;
>              compatible = "riscv";
> -            opensbi-domain = <&udomain>;
>              ...
>          };
>      };
> diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
> index 16edd4ce..b6731c04 100644
> --- a/include/sbi/sbi_domain.h
> +++ b/include/sbi/sbi_domain.h
> @@ -328,12 +328,10 @@ void sbi_domain_dump_all(const char *suffix);
>  /**
>   * Register a new domain
>   * @param dom pointer to domain
> - * @param assign_mask pointer to HART mask of HARTs assigned to the domain
>   *
>   * @return 0 on success and negative error code on failure
>   */
> -int sbi_domain_register(struct sbi_domain *dom,
> -			const struct sbi_hartmask *assign_mask);
> +int sbi_domain_register(struct sbi_domain *dom);
>  
>  /**
>   * Add a memory range with its flags to the root domain
> diff --git a/include/sbi_utils/fdt/fdt_domain.h b/include/sbi_utils/fdt/fdt_domain.h
> index 8c2dee09..a366b271 100644
> --- a/include/sbi_utils/fdt/fdt_domain.h
> +++ b/include/sbi_utils/fdt/fdt_domain.h
> @@ -50,8 +50,7 @@ int fdt_iterate_each_memregion(void *fdt, int domain_offset, void *opaque,
>   *
>   * This routine:
>   * 1. Disables MMIO devices not accessible to the coldboot HART domain
> - * 2. Removes "opensbi-domain" DT property from CPU DT nodes
> - * 3. Removes domain configuration DT node under /chosen DT node
> + * 2. Removes domain configuration DT node under /chosen DT node
>   *
>   * It is recommended that platform support call this function in
>   * their final_init() platform operation.
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index fa69170b..af753459 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -625,16 +625,14 @@ void sbi_domain_dump_all(const char *suffix)
>  	}
>  }
>  
> -int sbi_domain_register(struct sbi_domain *dom,
> -			const struct sbi_hartmask *assign_mask)
> +int sbi_domain_register(struct sbi_domain *dom)
>  {
> -	u32 i;
> -	int rc;
> +	u32 i, cold_hartid = current_hartid();
>  	struct sbi_domain *tdom;
> -	u32 cold_hartid = current_hartid();
> +	int rc;
>  
>  	/* Sanity checks */
> -	if (!dom || !assign_mask || domain_finalized)
> +	if (!dom || domain_finalized)
>  		return SBI_EINVAL;
>  
>  	/* Check if domain already discovered */
> @@ -663,15 +661,21 @@ int sbi_domain_register(struct sbi_domain *dom,
>  	/* Clear assigned HARTs of domain */
>  	sbi_hartmask_clear_all(&dom->assigned_harts);
>  
> -	/* Assign domain to HART if HART is a possible HART */
> -	sbi_hartmask_for_each_hartindex(i, assign_mask) {
> -		if (!sbi_hartmask_test_hartindex(i, dom->possible_harts))
> -			continue;
> -
> +	/*
> +	 * Assign a non-ROOT domain to a HART on first come first serve
> +	 * basis if the HART is listed as a possible HART of the non-ROOT
> +	 * domain. If no non-ROOT domain list a HART as possible HART then
> +	 * the HART is assigned to the ROOT domain.
> +	 */
> +	sbi_hartmask_for_each_hartindex(i, dom->possible_harts) {
>  		tdom = sbi_hartindex_to_domain(i);
> -		if (tdom)
> -			sbi_hartmask_clear_hartindex(i,
> -					&tdom->assigned_harts);
> +		if (tdom) {
> +			if (tdom == &root)
> +				sbi_hartmask_clear_hartindex(i, &tdom->assigned_harts);
> +			else
> +				continue;
> +		}
> +
>  		sbi_update_hartindex_to_domain(i, dom);
>  		sbi_hartmask_set_hartindex(i, &dom->assigned_harts);
>  
> @@ -975,7 +979,7 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
>  		sbi_hartmask_set_hartindex(i, root_hmask);
>  
>  	/* Finally register the root domain */
> -	rc = sbi_domain_register(&root, root_hmask);
> +	rc = sbi_domain_register(&root);
>  	if (rc)
>  		goto fail_free_root_hmask;
>  
> diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
> index 61627db3..3857831d 100644
> --- a/lib/utils/fdt/fdt_domain.c
> +++ b/lib/utils/fdt/fdt_domain.c
> @@ -170,26 +170,11 @@ static int __fixup_disable_devices(void *fdt, int doff, int roff,
>  
>  void fdt_domain_fixup(void *fdt)
>  {
> -	u32 i, dcount;
> +	u32 dcount;
>  	int err, poffset, doffset;
>  	struct sbi_domain *dom = sbi_domain_thishart_ptr();
>  	struct __fixup_find_domain_offset_info fdo;
>  
> -	/* Remove the domain assignment DT property from CPU DT nodes */
> -	poffset = fdt_path_offset(fdt, "/cpus");
> -	if (poffset < 0)
> -		return;
> -	fdt_for_each_subnode(doffset, fdt, poffset) {
> -		err = fdt_parse_hart_id(fdt, doffset, &i);
> -		if (err)
> -			continue;
> -
> -		if (!fdt_node_is_enabled(fdt, doffset))
> -			continue;
> -
> -		fdt_nop_property(fdt, doffset, "opensbi-domain");
> -	}
> -
>  	/* Skip device disable for root domain */
>  	if (!dom->index)
>  		goto skip_device_disable;
> @@ -315,12 +300,10 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
>  	const char *inherit;
>  	struct sbi_domain *dom;
>  	struct sbi_hartmask *mask;
> -	struct sbi_hartmask assign_mask;
>  	struct parse_region_data preg;
> -	int *cold_domain_offset = opaque;
>  	struct sbi_domain_memregion *reg;
>  	int inheritance_mode = FDT_ROOT_REGION_INHERIT_M_ONLY;
> -	int i, err = 0, len, cpus_offset, cpu_offset, doffset;
> +	int i, err = 0, len, cpus_offset, cpu_offset;
>  
>  	dom = sbi_zalloc(sizeof(*dom));
>  	if (!dom)
> @@ -440,7 +423,7 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
>  		val64 = fdt32_to_cpu(val[0]);
>  		val64 = (val64 << 32) | fdt32_to_cpu(val[1]);
>  	} else {
> -		val64 = sbi_scratch_thishart_ptr()->next_arg1;
> +		val64 = root.next_arg1;
>  	}
>  	dom->next_arg1 = val64;
>  
> @@ -451,8 +434,7 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
>  		val64 = fdt32_to_cpu(val[0]);
>  		val64 = (val64 << 32) | fdt32_to_cpu(val[1]);
>  	} else {
> -		if (domain_offset == *cold_domain_offset)
> -			val64 = sbi_scratch_thishart_ptr()->next_addr;
> +		val64 = root.next_addr;
>  	}
>  	dom->next_addr = val64;
>  
> @@ -464,8 +446,7 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
>  		if (val32 != 0x0 && val32 != 0x1)
>  			val32 = 0x1;
>  	} else {
> -		if (domain_offset == *cold_domain_offset)
> -			val32 = sbi_scratch_thishart_ptr()->next_mode;
> +		val32 = root.next_mode;
>  	}
>  	dom->next_mode = val32;

We may update domain_support.md accordingly to reflect these changes.
https://github.com/riscv-software-src/opensbi/blob/4e79fd7de59f1b2899092c1a84ce68c8ebc68f93/docs/domain_support.md?plain=1#L186-L202

>  
> @@ -490,37 +471,8 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
>  		goto fail_free_all;
>  	}
>  
> -	/* HART to domain assignment mask based on CPU DT nodes */
> -	sbi_hartmask_clear_all(&assign_mask);
> -	fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {

cpus_offset is unused now in __fdt_parse_domain().

Best regards,
Peter Lin

> -		err = fdt_parse_hart_id(fdt, cpu_offset, &val32);
> -		if (err)
> -			continue;
> -
> -		if (SBI_HARTMASK_MAX_BITS <= sbi_hartid_to_hartindex(val32))
> -			continue;
> -
> -		if (!fdt_node_is_enabled(fdt, cpu_offset))
> -			continue;
> -
> -		/* This is an optional property */
> -		val = fdt_getprop(fdt, cpu_offset, "opensbi-domain", &len);
> -		if (!val || len < 4)
> -			continue;
> -
> -		/* However, it should be valid if specified */
> -		doffset = fdt_node_offset_by_phandle(fdt, fdt32_to_cpu(*val));
> -		if (doffset < 0) {
> -			err = doffset;
> -			goto fail_free_all;
> -		}
> -
> -		if (doffset == domain_offset)
> -			sbi_hartmask_set_hartid(val32, &assign_mask);
> -	}
> -
>  	/* Register the domain */
> -	err = sbi_domain_register(dom, &assign_mask);
> +	err = sbi_domain_register(dom);
>  	if (err)
>  		goto fail_free_all;
>  
> @@ -537,43 +489,10 @@ fail_free_domain:
>  
>  int fdt_domains_populate(const void *fdt)
>  {
> -	const u32 *val;
> -	int cold_domain_offset;
> -	u32 hartid, cold_hartid;
> -	int err, len, cpus_offset, cpu_offset;
> -
>  	/* Sanity checks */
>  	if (!fdt)
>  		return SBI_EINVAL;
>  
> -	/* Find /cpus DT node */
> -	cpus_offset = fdt_path_offset(fdt, "/cpus");
> -	if (cpus_offset < 0)
> -		return cpus_offset;
> -
> -	/* Find coldboot HART domain DT node offset */
> -	cold_domain_offset = -1;
> -	cold_hartid = current_hartid();
> -	fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {
> -		err = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
> -		if (err)
> -			continue;
> -
> -		if (hartid != cold_hartid)
> -			continue;
> -
> -		if (!fdt_node_is_enabled(fdt, cpu_offset))
> -			continue;
> -
> -		val = fdt_getprop(fdt, cpu_offset, "opensbi-domain", &len);
> -		if (val && len >= 4)
> -			cold_domain_offset = fdt_node_offset_by_phandle(fdt,
> -							   fdt32_to_cpu(*val));
> -
> -		break;
> -	}
> -
>  	/* Iterate over each domain in FDT and populate details */
> -	return fdt_iterate_each_domain_ro(fdt, &cold_domain_offset,
> -					  __fdt_parse_domain);
> +	return fdt_iterate_each_domain_ro(fdt, NULL, __fdt_parse_domain);
>  }

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
