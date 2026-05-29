Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43032CD6E45
	for <opensbi@archiver.kernel.org>; Fri, 29 May 2026 08:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8EyMIsIxL9NbaTkyGEvLNICoa58dqbluXXG2og5GG8E=; b=4qd5X1O2j68y/7
	LV3P2MQwe/afXhAFTdv0LCAfuAV/WqdBN5iQNyFqaBZMMRrSVB61FxBYGKiBobO6U3Ylcj/EtiQbs
	4nnxD5VhQq1uFz19MIBuMV998R3gHIdGcJAxZyg09agu4VkPfSY3WQwNT1qbxon1OnPM2gkPtUR7J
	4e6/8oyHlsYNKpj/3tOcdjrbhQl11JDdL1RosxyFyNNhvXC5phsCqbyYPbHkEEpTwtW6DVyFG0yTw
	/o7I8Ty33EANGtAVNitM/Y9vS607H4ZfnNasOv5e0YZ3nqlOedj532g+2Qqloyh2LrWXScE0VHJ5V
	ddHv6uDU1tSO+X51sVHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSt1W-000000071GW-24Vz;
	Fri, 29 May 2026 08:56:58 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSt1T-000000071Fz-3Y7J
	for opensbi@lists.infradead.org;
	Fri, 29 May 2026 08:56:57 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8353fd1cb5fso6935815b3a.0
        for <opensbi@lists.infradead.org>; Fri, 29 May 2026 01:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780045015; x=1780649815; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a0Vfzxk0bjggD0cTbbrhMv86CW/AqpaYNz0jpYW6DEY=;
        b=lZWJJqj0dufA95ce8e7jJEQEIBQQc3kRcqI1UgvsiUgIK3MegCaqtywPWG8MconfVQ
         5+8v2ZsmXCuuUzbEp/tOT1hBLyV0hjxNA+WNM0z+JtrArjaI2P1cq3rGQ+6630zhod7j
         P7fEh6CZzr15TG9Nsm8Hk2GhuWeOd+TJmeWEN39byIoyqA9GJ79X17XNUJQqfLv6Tl16
         EKIH70ErgbwijBb8RqIz6W+6DZPka73ptJzMVdlbr6BbhcIsVj4scCPg84yQmDA2haND
         HZfRPq0DLa9Rnx9xnkb67TOsKbXH9YZjFmgOdksRBamGTyOjRdlo9rC4RFGvBjUPlvWP
         QGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780045015; x=1780649815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0Vfzxk0bjggD0cTbbrhMv86CW/AqpaYNz0jpYW6DEY=;
        b=rgSsxbUmJcaTFqpfKS2M+HxZYuw6fyykFaLZWyIL40fgg37j2dcgHRDmZSSDb+yrbn
         yozI9kHQrrwFp5MZp6ha8Vo2zVvdpVu//jgpm9HQ/tspo2QRX1e88WkxTcfmH5xXz8Yt
         75+VIuEXJg8ynJ2in8NJuJbY+pM2gFhPCBpJYLiGO99gOldslDrreAQ5xRlVRNTE2cXY
         nsNCFF3jP3qLLwvdJ0vcQXIDaY5srs+hUvjFwyv5YsPVehGH5LnekI1ArJg1oQWIhbvE
         zQeuW0kMd2BI6S89p/+ds1cQHfvWkAmRAMUhhXCiNFONxpMusDEyLvD+dZphWj/4zd78
         hBCA==
X-Forwarded-Encrypted: i=1; AFNElJ8fhdsT3NbAqYqJ4FZDckteyCqiEunHxFr1N9B3nB3s6I+rO1vgXeJsmAwC+aNRnmZSAcXZ2hF2@lists.infradead.org
X-Gm-Message-State: AOJu0YzALVxjRUotYe06jhI5BjYtirY0dNWWF7aYtrVu++Ul1gl3ombw
	vrm5LcnCsZtDoGeLIw/Cu9n+nBNBHW7uEN5qdMjj2PGInXkqRkqgh8/I
X-Gm-Gg: Acq92OFRKDwQ8ef1xO/htfBSc/IjosCoSm/qsSJkMUZex/LgxWUXugEiQRyPocN8ffq
	DouFZC7bTbIUYJirVEkhoamDQbW0rhRFIqLYLKoI8B43qRK945qAyTChAhREcNeGkqy9JKoZXdD
	jrhvFHNnNEVW1BXZ0T/eewQ+O1wYgTdJDWnJjKdENfZh5idUzNW0IrlRumrTKqr6asn9dF5aHEg
	0flEgPowGAI7SG3WpXkYCgkr8h2gsr3emdjgvHd7CCHfbJIXl5Fwx0TRgJ7gAFXfryReSDpfM98
	0xuYtoFxNsIDNQsKAPHic8bgfs+AqzAQWyC+XBbOTZJxqzLD4uaaiUZHgamb9gKF9baNbfxI9d0
	No/ho+9MPTknJFwj9JS8gFWpsk8h/pPRR9OZPkbBli7LOfPaotb0naeoliZO+Dac4re/888MXal
	+NicF+DtGHr1Ix0gmhbHH8NNjVLtLWSC7hGQ==
X-Received: by 2002:a05:6a00:4147:b0:829:6f7d:3086 with SMTP id d2e1a72fcca58-842115a3c72mr1735998b3a.11.1780045014659;
        Fri, 29 May 2026 01:56:54 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214b01327sm1175043b3a.4.2026.05.29.01.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 01:56:54 -0700 (PDT)
Date: Fri, 29 May 2026 16:56:42 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Xiang W <wangxiang@iscas.ac.cn>, opensbi@lists.infradead.org
Cc: anup@brainfault.org, Han Gao <gaohan@iscas.ac.cn>
Subject: Re: [PATCH] platform: Allow platforms to customize TLB operations
Message-ID: <ahlUBjN3BF6YqIs-@inochi.infowork>
References: <20260529073510.97299-1-wangxiang@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260529073510.97299-1-wangxiang@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_015655_902830_1D148BA0 
X-CRM114-Status: GOOD (  28.62  )
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

On Fri, May 29, 2026 at 03:35:10PM +0800, Xiang W wrote:
> Some T-Head based processors, for example the Sophgo SG2044, have a
> JTLB errata that requires special handling of certain TLB maintenance
> instructions (sfence.vma).
> 
> Enable the JTLB workaround for affected boards.
> 
> Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  include/sbi/sbi_platform.h                   | 162 +++++++++++++++++++
>  lib/sbi/sbi_tlb.c                            |  28 ++++
>  platform/generic/include/thead/c9xx_errata.h |   1 +
>  platform/generic/thead/thead-generic.c       |  26 ++-
>  4 files changed, 216 insertions(+), 1 deletion(-)
> 
> diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
> index fe382b56..911b37bf 100644
> --- a/include/sbi/sbi_platform.h
> +++ b/include/sbi/sbi_platform.h
> @@ -56,6 +56,7 @@ struct sbi_domain_memregion;
>  struct sbi_ecall_return;
>  struct sbi_trap_regs;
>  struct sbi_hart_features;
> +struct sbi_tlb_info;
>  union sbi_ldst_data;
>  
>  /** Possible feature flags of a platform */
> @@ -125,6 +126,27 @@ struct sbi_platform_operations {
>  	/** Get tlb fifo num entries*/
>  	u32 (*get_tlb_num_entries)(void);
>  
> +	/** Platform hook for custom fence.i */
> +	void (*local_fence_i)(struct sbi_tlb_info *tinfo);
> +
> +	/** Platform hook for custom supervisor-mode TLB flush */
> +	void (*local_sfence_vma)(struct sbi_tlb_info *tinfo);
> +
> +	/** Platform hook for custom supervisor-mode TLB flush with ASID */
> +	void (*local_sfence_vma_asid)(struct sbi_tlb_info *tinfo);
> +
> +	/** Platform hook for custom G-stage TLB flush for a specific VMID */
> +	void (*local_hfence_gvma_vmid)(struct sbi_tlb_info *tinfo);
> +
> +	/** Platform hook for custom G-stage TLB flush */
> +	void (*local_hfence_gvma)(struct sbi_tlb_info *tinfo);
> +
> +	/** Platform hook for custom VS-stage TLB flush with ASID */
> +	void (*local_hfence_vvma_asid)(struct sbi_tlb_info *tinfo);
> +
> +	/** Platform hook for custom VS-stage TLB flush */
> +	void (*local_hfence_vvma)(struct sbi_tlb_info *tinfo);
> +
>  	/** Initialize platform timer during cold boot */
>  	int (*timer_init)(void);
>  
> @@ -313,6 +335,146 @@ static inline u32 sbi_platform_tlb_fifo_num_entries(const struct sbi_platform *p
>  	return sbi_hart_count();
>  }
>  
> +/**
> + * Platform hook for custom fence.i
> + *
> + * @param plat pointer to struct sbi_platform
> + * @paeam tinfo pointer to struct sbi_tlb_info
> + *
> + * @return 0 indicates that the platform supports the operation and the
> + * operation was successful; otherwise, a normal operation needs to be performed.
> + */
> +static inline u32 sbi_platform_local_fence_i(
> +					const struct sbi_platform *plat,
> +					struct sbi_tlb_info *tinfo)
> +{
> +	if (plat && sbi_platform_ops(plat)->local_fence_i) {
> +		sbi_platform_ops(plat)->local_fence_i(tinfo);
> +		return 0;
> +	}
> +	return SBI_ENOTSUPP;
> +}
> +
> +/**
> + * Platform hook for custom supervisor-mode TLB flush
> + *
> + * @param plat pointer to struct sbi_platform
> + * @paeam tinfo pointer to struct sbi_tlb_info
> + *
> + * @return 0 indicates that the platform supports the operation and the
> + * operation was successful; otherwise, a normal operation needs to be performed.
> + */
> +static inline u32 sbi_platform_local_sfence_vma(
> +					const struct sbi_platform *plat,
> +					struct sbi_tlb_info *tinfo)
> +{
> +	if (plat && sbi_platform_ops(plat)->local_sfence_vma) {
> +		sbi_platform_ops(plat)->local_sfence_vma(tinfo);
> +		return 0;
> +	}
> +	return SBI_ENOTSUPP;
> +}
> +
> +/**
> + * Platform hook for custom supervisor-mode TLB flush with ASID
> + *
> + * @param plat pointer to struct sbi_platform
> + * @paeam tinfo pointer to struct sbi_tlb_info
> + *
> + * @return 0 indicates that the platform supports the operation and the
> + * operation was successful; otherwise, a normal operation needs to be performed.
> + */
> +static inline u32 sbi_platform_local_sfence_vma_asid(
> +					const struct sbi_platform *plat,
> +					struct sbi_tlb_info *tinfo)
> +{
> +	if (plat && sbi_platform_ops(plat)->local_sfence_vma_asid) {
> +		sbi_platform_ops(plat)->local_sfence_vma_asid(tinfo);
> +		return 0;
> +	}
> +	return SBI_ENOTSUPP;
> +}
> +
> +/**
> + * Platform hook for custom G-stage TLB flush for a specific VMID
> + *
> + * @param plat pointer to struct sbi_platform
> + * @paeam tinfo pointer to struct sbi_tlb_info
> + *
> + * @return 0 indicates that the platform supports the operation and the
> + * operation was successful; otherwise, a normal operation needs to be performed.
> + */
> +static inline u32 sbi_platform_local_hfence_gvma_vmid(
> +					const struct sbi_platform *plat,
> +					struct sbi_tlb_info *tinfo)
> +{
> +	if (plat && sbi_platform_ops(plat)->local_hfence_gvma_vmid) {
> +		sbi_platform_ops(plat)->local_hfence_gvma_vmid(tinfo);
> +		return 0;
> +	}
> +	return SBI_ENOTSUPP;
> +}
> +
> +/**
> + * Platform hook for custom G-stage TLB flush
> + *
> + * @param plat pointer to struct sbi_platform
> + * @paeam tinfo pointer to struct sbi_tlb_info
> + *
> + * @return 0 indicates that the platform supports the operation and the
> + * operation was successful; otherwise, a normal operation needs to be performed.
> + */
> +static inline u32 sbi_platform_local_hfence_gvma(
> +					const struct sbi_platform *plat,
> +					struct sbi_tlb_info *tinfo)
> +{
> +	if (plat && sbi_platform_ops(plat)->local_hfence_gvma) {
> +		sbi_platform_ops(plat)->local_hfence_gvma(tinfo);
> +		return 0;
> +	}
> +	return SBI_ENOTSUPP;
> +}
> +
> +/**
> + * Platform hook for custom VS-stage TLB flush with ASID
> + *
> + * @param plat pointer to struct sbi_platform
> + * @paeam tinfo pointer to struct sbi_tlb_info
> + *
> + * @return 0 indicates that the platform supports the operation and the
> + * operation was successful; otherwise, a normal operation needs to be performed.
> + */
> +static inline u32 sbi_platform_local_hfence_vvma_asid(
> +					const struct sbi_platform *plat,
> +					struct sbi_tlb_info *tinfo)
> +{
> +	if (plat && sbi_platform_ops(plat)->local_hfence_vvma_asid) {
> +		sbi_platform_ops(plat)->local_hfence_vvma_asid(tinfo);
> +		return 0;
> +	}
> +	return SBI_ENOTSUPP;
> +}
> +
> +/**
> + * Platform hook for custom VS-stage TLB flush
> + *
> + * @param plat pointer to struct sbi_platform
> + * @paeam tinfo pointer to struct sbi_tlb_info
> + *
> + * @return 0 indicates that the platform supports the operation and the
> + * operation was successful; otherwise, a normal operation needs to be performed.
> + */
> +static inline u32 sbi_platform_local_hfence_vvma(
> +					const struct sbi_platform *plat,
> +					struct sbi_tlb_info *tinfo)
> +{
> +	if (plat && sbi_platform_ops(plat)->local_hfence_vvma) {
> +		sbi_platform_ops(plat)->local_hfence_vvma(tinfo);
> +		return 0;
> +	}
> +	return SBI_ENOTSUPP;
> +}
> +
>  /**
>   * Get total number of HARTs supported by the platform
>   *
> diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
> index ada60c32..69b8fb48 100644
> --- a/lib/sbi/sbi_tlb.c
> +++ b/lib/sbi/sbi_tlb.c
> @@ -46,6 +46,10 @@ static void sbi_tlb_local_hfence_vvma(struct sbi_tlb_info *tinfo)
>  	hgatp = csr_swap(CSR_HGATP,
>  			 (vmid << HGATP_VMID_SHIFT) & HGATP_VMID_MASK);
>  
> +	if (sbi_platform_local_hfence_gvma(
> +			sbi_platform_thishart_ptr(), tinfo) == SBI_OK)
> +		gito done;
> +
>  	if ((start == 0 && size == 0) || (size == SBI_TLB_FLUSH_ALL)) {
>  		__sbi_hfence_vvma_all();
>  		goto done;
> @@ -67,6 +71,10 @@ static void sbi_tlb_local_hfence_gvma(struct sbi_tlb_info *tinfo)
>  
>  	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_HFENCE_GVMA_RCVD);
>  
> +	if (sbi_platform_local_hfence_gvma(
> +			sbi_platform_thishart_ptr(), tinfo) == SBI_OK)
> +		return;
> +
>  	if ((start == 0 && size == 0) || (size == SBI_TLB_FLUSH_ALL)) {
>  		__sbi_hfence_gvma_all();
>  		return;
> @@ -85,6 +93,10 @@ static void sbi_tlb_local_sfence_vma(struct sbi_tlb_info *tinfo)
>  
>  	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_SFENCE_VMA_RCVD);
>  
> +	if (sbi_platform_local_sfence_vma(
> +			sbi_platform_thishart_ptr(), tinfo) == SBI_OK)
> +		return;
> +
>  	if ((start == 0 && size == 0) || (size == SBI_TLB_FLUSH_ALL)) {
>  		__sbi_sfence_vma_all();
>  		return;
> @@ -111,6 +123,10 @@ static void sbi_tlb_local_hfence_vvma_asid(struct sbi_tlb_info *tinfo)
>  	hgatp = csr_swap(CSR_HGATP,
>  			 (vmid << HGATP_VMID_SHIFT) & HGATP_VMID_MASK);
>  
> +	if (sbi_platform_local_hfence_vvma_asid(
> +			sbi_platform_thishart_ptr(), tinfo) == SBI_OK)
> +		goto done;
> +
>  	if ((start == 0 && size == 0) || (size == SBI_TLB_FLUSH_ALL)) {
>  		__sbi_hfence_vvma_asid(asid);
>  		goto done;
> @@ -133,6 +149,10 @@ static void sbi_tlb_local_hfence_gvma_vmid(struct sbi_tlb_info *tinfo)
>  
>  	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_HFENCE_GVMA_VMID_RCVD);
>  
> +	if (sbi_platform_local_hfence_gvma_vmid(
> +			sbi_platform_thishart_ptr(), tinfo) == SBI_OK)
> +		return;
> +
>  	if ((start == 0 && size == 0) || (size == SBI_TLB_FLUSH_ALL)) {
>  		__sbi_hfence_gvma_vmid(vmid);
>  		return;
> @@ -152,6 +172,10 @@ static void sbi_tlb_local_sfence_vma_asid(struct sbi_tlb_info *tinfo)
>  
>  	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_SFENCE_VMA_ASID_RCVD);
>  
> +	if (sbi_platform_local_sfence_vma_asid(
> +			sbi_platform_thishart_ptr(), tinfo) == SBI_OK)
> +		return;
> +
>  	/* Flush entire MM context for a given ASID */
>  	if ((start == 0 && size == 0) || (size == SBI_TLB_FLUSH_ALL)) {
>  		__asm__ __volatile__("sfence.vma x0, %0"
> @@ -173,6 +197,10 @@ static void sbi_tlb_local_fence_i(struct sbi_tlb_info *tinfo)
>  {
>  	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_FENCE_I_RECVD);
>  
> +	if (sbi_platform_local_fence_i(
> +			sbi_platform_thishart_ptr(), tinfo) == SBI_OK)
> +		return;
> +
>  	__asm__ __volatile("fence.i");
>  }
>  

I suggest split the following as a separate patch.

> diff --git a/platform/generic/include/thead/c9xx_errata.h b/platform/generic/include/thead/c9xx_errata.h
> index 40c1587b..7a419e41 100644
> --- a/platform/generic/include/thead/c9xx_errata.h
> +++ b/platform/generic/include/thead/c9xx_errata.h
> @@ -8,6 +8,7 @@
>   */
>  #define THEAD_QUIRK_ERRATA_TLB_FLUSH		BIT(0)
>  #define THEAD_QUIRK_ERRATA_THEAD_PMU		BIT(1)
> +#define THEAD_QUIRK_ERRATA_JTLB			BIT(2)
>  
>  void thead_register_tlb_flush_trap_handler(void);
>  
> diff --git a/platform/generic/thead/thead-generic.c b/platform/generic/thead/thead-generic.c
> index ddb4f0bf..86793ab1 100644
> --- a/platform/generic/thead/thead-generic.c
> +++ b/platform/generic/thead/thead-generic.c
> @@ -13,6 +13,7 @@
>  #include <sbi/sbi_platform.h>
>  #include <sbi/sbi_scratch.h>
>  #include <sbi/sbi_string.h>
> +#include <sbi/sbi_tlb.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
>  
>  struct thead_generic_quirks {
> @@ -39,6 +40,20 @@ static int thead_pmu_extensions_init(struct sbi_hart_features *hfeatures)
>  	return 0;
>  }
>  
> +static void thead_jtlb_local_sfence_vma(struct sbi_tlb_info *tinfo)
> +{
> +	__asm__ __volatile__("sfence.vma");
> +}
> +
> +static void thead_jtlb_local_sfence_vvma_asid(struct sbi_tlb_info *tinfo)
> +{
> +	/* Flush entire MM context for a given ASID */
> +	__asm__ __volatile__("sfence.vma x0, %0"
> +			     :
> +			     : "r"(tinfo->asid)
> +			     : "memory");
> +}
> +
>  static int thead_generic_platform_init(const void *fdt, int nodeoff,
>  				       const struct fdt_match *match)
>  {
> @@ -49,6 +64,11 @@ static int thead_generic_platform_init(const void *fdt, int nodeoff,
>  	if (quirks->errata & THEAD_QUIRK_ERRATA_THEAD_PMU)
>  		generic_platform_ops.extensions_init = thead_pmu_extensions_init;
>  
> +	if (quirks->errata &THEAD_QUIRK_ERRATA_JTLB) {
> +		generic_platform_ops.local_sfence_vma = thead_jtlb_local_sfence_vma;
> +		generic_platform_ops.local_sfence_vma_asid = thead_jtlb_local_sfence_vvma_asid;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -60,13 +80,17 @@ static const struct thead_generic_quirks thead_pmu_quirks = {
>  	.errata = THEAD_QUIRK_ERRATA_THEAD_PMU,
>  };
>  
> +static const struct thead_generic_quirks thead_pmu_jtlb_quirks = {
> +	.errata = THEAD_QUIRK_ERRATA_THEAD_PMU | THEAD_QUIRK_ERRATA_JTLB,
> +};
> +

IIRC, it is better to not setting THEAD_QUIRK_ERRATA_THEAD_PMU anymore
for sg2044. The T-HEAD specific PMU feature is bad for the cpu version of
the sg2044.

>  static const struct fdt_match thead_generic_match[] = {
>  	{ .compatible = "canaan,kendryte-k230", .data = &thead_pmu_quirks },
>  	{ .compatible = "sophgo,cv1800b", .data = &thead_pmu_quirks },
>  	{ .compatible = "sophgo,cv1812h", .data = &thead_pmu_quirks },
>  	{ .compatible = "sophgo,sg2000", .data = &thead_pmu_quirks },
>  	{ .compatible = "sophgo,sg2002", .data = &thead_pmu_quirks },
> -	{ .compatible = "sophgo,sg2044", .data = &thead_pmu_quirks },
> +	{ .compatible = "sophgo,sg2044", .data = &thead_pmu_jtlb_quirks },
>  	{ .compatible = "thead,th1520", .data = &thead_th1520_quirks },
>  	{ },
>  };
> -- 
> 2.47.3
> 
> 
> -- 
> opensbi mailing list
> opensbi@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
