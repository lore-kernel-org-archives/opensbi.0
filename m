Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345B810A62F3
	for <opensbi@archiver.kernel.org>; Thu, 26 Mar 2026 14:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YgV0VCfef5dfyYtrxQGuZGz098wEmedqDIVqcB2FCM0=; b=qOCWOgRPM3rCvf
	csPz1DHg9VHjKZe91oNje7t81YLkfi7OS++fmY4RWCZEl0mwiLC2+5jRzpWmRsu1pY9Ee92S+42gq
	paprnIeu4hGAAUGItUoHG1lF0p2FeSs3DOdt7Zuc2T8FXSHQfKG1MfKtIXZmo7jonSyDc/JuoOqSE
	va9dCE+vp7XRVxRvDOZ1M1eFEfZDuR68BtbLuMJobk8UT5JVpr4abxJcTIyD2CFSbn0m60O9q2o9T
	eUYgh6ZHXW7TzMySlhFO0PsxJqahEccEtCQ0ftLUvmkDUR7rmkzX5Zf3l16an4Z1U81+uN90VbPfu
	deJ4SScWUnVwgb+0Xiuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lte-00000005fw6-1Gu7;
	Thu, 26 Mar 2026 14:41:18 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ltb-00000005fvT-1TBb
	for opensbi@lists.infradead.org;
	Thu, 26 Mar 2026 14:41:16 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-794719afcd4so11922947b3.1
        for <opensbi@lists.infradead.org>; Thu, 26 Mar 2026 07:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1774536074; x=1775140874; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yTuE3+PUNeVelYpexXeDH8VG1p3UogROT/RMXrcsN3g=;
        b=eONM8Sz6ycOf3i6RGrMH27//n3GI17SnGVaq8i5sEBmWzaQROl0/5Y3aBEI6xLmILF
         1Ez/nzjFz3ySzpJM8ZjJQM9q9groLrwMwLQzgTNT+8Z5Rc0cms3Cm5czN6WYYiABlOoD
         De0NTwxEVt1fr0pk8r+OZ+9PvuCNjgJc0m86w9RwEevUCnOo+jcDRNiTkLvpEH7bkMCn
         sMl2C90CZI7BUfMrGJHsMRxd1eZgOBjjr4ohzaBoosVgeQ3TwUc0mVuACJ8A1qDkr5sl
         M4qX9NNgxFIueFcPOLVuGMNBFtiKHR7IE3TyUW89LrttClknhBFyk04F1BdxFOnJInmr
         hEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774536074; x=1775140874;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yTuE3+PUNeVelYpexXeDH8VG1p3UogROT/RMXrcsN3g=;
        b=FvvM1m3S+QnFPzq4RWwwyR/vf0RPwhrKrOCgGXCloTbDXLXbzjenLSb00r4DBoELfs
         sq7R4znqxnSjUhZfUbmk/100bfOOhhRmL5B20xYyCuRmiE8OR2gsRm0B3xxCDM1V2vBU
         KbJFK7otB9urz1J98v62FqP4i170fKuu78kHLF4EnIgHf+hlMXICS7abkm91/aDpBRMa
         38ZDV4bYp5rPPJPoHQ8b6tzuaMe8gbfTq7QiB/GI8FLMVMpzuWspFWR+QYfycWBkZkw3
         O8i/E1TUcWXVtBTAxzZZF/bXnoUN8q0HnXSLfBEwMDTeaHmYeF/RsKiOy4TbvwEnkdZw
         Fo/A==
X-Forwarded-Encrypted: i=1; AJvYcCUQXQwbA9gJgFV1pHGLZIkuN8j4c0CnSQjKIxZcsmyu2Qlf8uhDRsIR6i2ugepAlqnUpCvsnQPz@lists.infradead.org
X-Gm-Message-State: AOJu0YwMVaI/AaPj8+h4HcPNQH/QoQGAglo801K+bWnEbZn8l8bIz8Jb
	M8L3I+xP3LJpMTc+JMe7ZpWQhotPd0vcfcjLObDciHy0HzIU/eDmiH+E1LZumSZEgwA=
X-Gm-Gg: ATEYQzwNXap5yuljgdDHvC4rSaHZqYWznTZpUlrDkt5HAeod/kwD3eHmTJK6CTEBJhw
	3KLW9sTSGhoueMi5ncx8cKo2kZvIHkgCdBSVdprRS02HP/lBnHB6ggDta4OLa3qT7FIrFPtXzni
	EytAcMpLgircLLEXlh+WFrqafGmOui67p+vB6k0BhZIAzMh4Mbf4zqGS/VxesAeRF/mtv8Judhu
	11ZT2HppobxsxEIr+Ua3FEKK34zOXlfvtGJy4B6pNdjyh5cngx58qxf3tvpSQ+55An6ek65hXF7
	stTcGy+AR07qv94QPlpU8PzXt0QGE9lRN7jkaqKRiU1T+ayVG81qG8IzKtZInLBdlp66LaJXc8w
	h7Ng9Coz2A2etzKMAwmnWzu1iujzkK3Hq8D1pS6ZR2V7M5Y1RRjw819xe42yElEysCg58Oa+L4b
	TXMHRGL9NDvofkFKelOXHNMX3d6ljIBnmYcpA4x1Lmr+gU/lHVkAY=
X-Received: by 2002:a05:690e:440e:b0:64e:7a12:18e5 with SMTP id 956f58d0204a3-64ee613cc5dmr5767550d50.58.1774536073902;
        Thu, 26 Mar 2026 07:41:13 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.103.33])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64ef6c36b73sm1535890d50.19.2026.03.26.07.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 07:41:13 -0700 (PDT)
Message-ID: <1877a9c0-1b99-4e7c-8bc6-947580fc6c7f@sifive.com>
Date: Thu, 26 Mar 2026 09:41:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] lib: sbi: domain FP/Vector context support for
 context switch
To: dave.patel@riscstar.com
Cc: Scott Bambrough <scott@riscstar.com>,
 Robin Randhawa <robin.randhawa@sifive.com>,
 Anup Patel <anup.patel@qti.qualcomm.com>, Ray Mao
 <raymond.mao@riscstar.com>, Anup Patel <anuppate@qti.qualcomm.com>,
 Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>,
 opensbi@lists.infradead.org
References: <20260326115517.2156-1-dave.patel@riscstar.com>
 <20260326115517.2156-4-dave.patel@riscstar.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260326115517.2156-4-dave.patel@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_074115_427311_3B6D457E 
X-CRM114-Status: GOOD (  29.34  )
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

On 2026-03-26 6:55 AM, dave.patel@riscstar.com wrote:
> From: Dave Patel <dave.patel@riscstar.com>
> 
> This patch adds proper support for per-domain floating-point (FP) and
> vector (V) contexts in the domain context switch logic. Each domain
> now maintains its own FP and vector state, which is saved and restored
> during domain switches.
> 
> Changes include:
> 
> - Added `fp_ctx` and `vec_ctx` members to `struct sbi_domain`.
> - Introduced `sbi_fp_domain_init/exit()` and `sbi_vector_domain_init/exit()`
>   to allocate and free per-domain FP and vector context.
> - Modified `sbi_domain_register()` to initialize FP/Vector context per domain.
> - Updated `switch_to_next_domain_context()` to save/restore FP and vector
>   contexts safely:
>     - Ensures FS/VS fields in `mstatus` are enabled (set to Initial) only if Off.
>     - Restores original FS/VS bits after context switch.
>     - Adds NULL checks to handle domains without FP or Vector extensions.
> - Updated domain context deinit to free FP and vector contexts per domain.
> - Added runtime checks for FP and vector extensions where needed.
> - Corrected handling of MSTATUS FS/VS bits to avoid unsafe full-bit writes.
> 
> This improves support for multi-domain systems with FP and Vector
> extensions, and prevents corruption of FP/Vector state during domain
> switches.
> 
> Signed-off-by: Dave Patel <dave.patel@riscstar.com>
> ---
>  include/sbi/sbi_domain.h     |  4 ++++
>  include/sbi/sbi_fp.h         |  7 ++++++
>  include/sbi/sbi_vector.h     |  5 +++++
>  lib/sbi/sbi_domain.c         | 22 +++++++++++++++++++
>  lib/sbi/sbi_domain_context.c | 42 ++++++++++++++++++++++++++++++++++++
>  lib/sbi/sbi_fp.c             | 31 ++++++++++++++++++++++++++
>  lib/sbi/sbi_vector.c         | 30 ++++++++++++++++++++++++++
>  7 files changed, 141 insertions(+)
> 
> diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
> index 882b62c2..e68ec46d 100644
> --- a/include/sbi/sbi_domain.h
> +++ b/include/sbi/sbi_domain.h
> @@ -217,6 +217,10 @@ struct sbi_domain {
>  	bool fw_region_inited;
>  	/** per-domain wired-IRQ courier state */
>  	void *virq_priv;

Patch submissions should be based on top of the upstream master branch, unless
noted in the cover letter. Please rebase.

> +    /** per-domain float context state */
> +    void *fp_ctx;
> +    /** per-domain vector context state */
> +    void *vec_ctx;

There is no need for indirection through a pointer and the overhead of a
separate allocation. Please embed the fp/vector context inside this struct. Then
you do not need separate init/exit functions.

>  };
> 
>  /** The root domain instance */
> diff --git a/include/sbi/sbi_fp.h b/include/sbi/sbi_fp.h
> index 5794b66f..2de9bf04 100644
> --- a/include/sbi/sbi_fp.h
> +++ b/include/sbi/sbi_fp.h
> @@ -9,6 +9,9 @@
>  #define __SBI_FP_H__
> 
>  #include <sbi/riscv_encoding.h>
> +#include <sbi/sbi_domain.h>
> +#include <sbi/sbi_error.h>
> +#include <sbi/sbi_console.h>

This looks like leftover debugging code.

> 
>  #if defined(__riscv_f) || defined(__riscv_d)
> 
> @@ -25,6 +28,8 @@ struct sbi_fp_context {
> 
>  void sbi_fp_save(struct sbi_fp_context *dst);
>  void sbi_fp_restore(const struct sbi_fp_context *src);
> +int  sbi_fp_domain_init(struct sbi_domain *dom);
> +void sbi_fp_domain_exit(struct sbi_domain *dom);
> 
>  #else /* No FP (e.g., Zve32x) */
> 
> @@ -32,6 +37,8 @@ struct sbi_fp_context { };
> 
>  static inline void sbi_fp_save(struct sbi_fp_context *dst) { }
>  static inline void sbi_fp_restore(const struct sbi_fp_context *src) { }
> +static inline int  sbi_fp_domain_init(struct sbi_domain *dom) { return SBI_OK;}
> +static inline void sbi_fp_domain_exit(struct sbi_domain *dom) {}
> 
>  #endif //defined(__riscv_f) || defined(__riscv_d)
>  #endif //__SBI_VECTOR_H__
> diff --git a/include/sbi/sbi_vector.h b/include/sbi/sbi_vector.h
> index ae151406..c8295f05 100644
> --- a/include/sbi/sbi_vector.h
> +++ b/include/sbi/sbi_vector.h
> @@ -10,6 +10,9 @@
>  #define __SBI_VECTOR_H__
> 
>  #include <sbi/sbi_types.h>
> +#include <sbi/sbi_domain.h>
> +#include <sbi/sbi_error.h>
> +#include <sbi/sbi_console.h>

ditto

> 
>  #ifdef CONFIG_SBI_MAX_VLENB
>  #define SBI_MAX_VLENB CONFIG_SBI_MAX_VLENB
> @@ -30,6 +33,8 @@ struct sbi_vector_context {
>  struct sbi_vector_context *sbi_current_vector_context(void);
>  void sbi_vector_save(struct sbi_vector_context *dst);
>  void sbi_vector_restore(const struct sbi_vector_context *src);
> +int  sbi_vector_domain_init(struct sbi_domain *dom);
> +void sbi_vector_domain_exit(struct sbi_domain *dom);
> 
>  #endif //__SBI_VECTOR_H__
> 
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index 498a1d56..cdc416b4 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -19,6 +19,8 @@
>  #include <sbi/sbi_scratch.h>
>  #include <sbi/sbi_string.h>
>  #include <sbi/sbi_virq.h>
> +#include <sbi/sbi_vector.h>
> +#include <sbi/sbi_fp.h>
> 
>  SBI_LIST_HEAD(domain_list);
> 
> @@ -703,6 +705,26 @@ int sbi_domain_register(struct sbi_domain *dom,
>  		return rc;
>  	}
> 
> +    /* Init per-domain floating context */
> +    rc = sbi_fp_domain_init(dom);
> +    if (rc) {
> +        sbi_printf("%s: fp init failed for %s (error %d)\n",
> +                __func__, dom->name, rc);
> +        sbi_list_del(&dom->node);
> +        return rc;
> +    }
> +
> +#ifdef __riscv_v
> +    /* Init per-domain vector context */
> +    rc = sbi_vector_domain_init(dom);
> +    if (rc) {
> +        sbi_printf("%s: vec init failed for %s (error %d)\n",
> +                __func__, dom->name, rc);
> +        sbi_list_del(&dom->node);
> +        return rc;
> +    }
> +#endif
> +
>      return 0;
>  }
> 
> diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
> index 158f4990..fb843a91 100644
> --- a/lib/sbi/sbi_domain_context.c
> +++ b/lib/sbi/sbi_domain_context.c
> @@ -18,6 +18,9 @@
>  #include <sbi/sbi_domain_context.h>
>  #include <sbi/sbi_platform.h>
>  #include <sbi/sbi_trap.h>
> +#include <sbi/sbi_vector.h>
> +#include <sbi/sbi_fp.h>
> +
> 
>  /** Context representation for a hart within a domain */
>  struct hart_context {
> @@ -143,6 +146,37 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
>  	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSQOSID))
>  		ctx->srmcfg	= csr_swap(CSR_SRMCFG, dom_ctx->srmcfg);
> 
> +    /* Read current mstatus */
> +    unsigned long mstatus = csr_read(CSR_MSTATUS);
> +    unsigned long new_mstatus = mstatus;
> +
> +    /* Ensure FS is enabled (not Off) */
> +    if ((mstatus & MSTATUS_FS) == 0)
> +        new_mstatus |= MSTATUS_FS;
> +
> +#ifdef __riscv_v
> +    /* Ensure VS is enabled (not Off) */
> +    if ((mstatus & MSTATUS_VS) == 0)
> +        new_mstatus |= MSTATUS_VS;
> +#endif
> +
> +    /* Update mstatus only if needed */
> +    if (new_mstatus != mstatus)
> +    csr_write(CSR_MSTATUS, new_mstatus);

FS and VS are WARL. This above block can be just:

	csr_set(CSR_MSTATUS, MSTATUS_FS | MSTATUS_VS);

You don't need to restore mstatus because it will be loaded from the new
domain's trap_ctx anyway (and the old domain's mstatus was already saved).

Regards,
Samuel

> +
> +    /* Save current domain context and restore target domain's F and V context */
> +    sbi_fp_save(current_dom->fp_ctx);
> +    sbi_fp_restore(target_dom->fp_ctx);
> +#ifdef __riscv_v
> +    sbi_vector_save(current_dom->vec_ctx);
> +    sbi_vector_restore(target_dom->vec_ctx);
> +#endif
> +
> +    /* Restore original mstatus if we modified it */
> +    if (new_mstatus != mstatus) {
> +        csr_write(CSR_MSTATUS, mstatus);
> +    }
> +
>  	/* Save current trap state and restore target domain's trap state */
>  	trap_ctx = sbi_trap_get_context(scratch);
>  	sbi_memcpy(&ctx->trap_ctx, trap_ctx, sizeof(*trap_ctx));
> @@ -286,5 +320,13 @@ int sbi_domain_context_init(void)
> 
>  void sbi_domain_context_deinit(void)
>  {
> +    struct sbi_domain *dom;
> +    sbi_domain_for_each(dom) {
> +#ifdef __riscv_v
> +        sbi_vector_domain_exit(dom);
> +#endif
> +        sbi_fp_domain_exit(dom);
> +    }
> +
>  	sbi_domain_unregister_data(&dcpriv);
>  }
> diff --git a/lib/sbi/sbi_fp.c b/lib/sbi/sbi_fp.c
> index b6651577..ee0782d1 100644
> --- a/lib/sbi/sbi_fp.c
> +++ b/lib/sbi/sbi_fp.c
> @@ -7,6 +7,7 @@
>   */
> 
>  #include <sbi/riscv_asm.h>
> +#include <sbi/sbi_heap.h>
>  #include <sbi/riscv_encoding.h>
>  #include <sbi/sbi_fp.h>
> 
> @@ -185,4 +186,34 @@ void sbi_fp_restore(const struct sbi_fp_context *src)
> 
>  	csr_write(CSR_FCSR, src->fcsr);
>  }
> +
> +int sbi_fp_domain_init(struct sbi_domain *dom)
> +{
> +    if (!dom)
> +        return SBI_EINVAL;
> +
> +    if (dom->fp_ctx)
> +        return SBI_OK;
> +
> +   sbi_printf("[FPU] Init FP Context \n");
> +
> +   struct sbi_fp_context *fp;
> +   fp = sbi_zalloc(sizeof(*fp));
> +   if (!fp)
> +       return SBI_ENOMEM;
> +
> +   dom->fp_ctx = fp;
> +
> +   return SBI_OK;
> +}
> +
> +void sbi_fp_domain_exit(struct sbi_domain *dom)
> +{
> +   if (!dom || !dom->fp_ctx)
> +        return;
> +
> +   sbi_free(dom->fp_ctx);
> +   dom->fp_ctx = NULL;
> +}
> +
>  #endif // FP present
> diff --git a/lib/sbi/sbi_vector.c b/lib/sbi/sbi_vector.c
> index e14b658c..2dfb9fbf 100644
> --- a/lib/sbi/sbi_vector.c
> +++ b/lib/sbi/sbi_vector.c
> @@ -10,6 +10,7 @@
>  #include <sbi/riscv_encoding.h>
>  #include <sbi/riscv_asm.h>
>  #include <sbi/sbi_vector.h>
> +#include <sbi/sbi_heap.h>
> 
>  static inline unsigned long vector_vlenb(void)
>  {
> @@ -144,3 +145,32 @@ void sbi_vector_restore(const struct sbi_vector_context *src)
> 
>  #undef RESTORE_VREG
>  }
> +
> +int sbi_vector_domain_init(struct sbi_domain *dom)
> +{
> +    if (!dom)
> +        return SBI_EINVAL;
> +
> +    if (dom->vec_ctx)
> +        return SBI_OK;
> +
> +   sbi_printf("[Vector] Init Vector Context \n");
> +
> +   struct sbi_vector_context *v;
> +   v = sbi_zalloc(sizeof(*v));
> +   if (!v)
> +       return SBI_ENOMEM;
> +
> +   dom->vec_ctx = v;
> +
> +   return SBI_OK;
> +}
> +
> +void sbi_vector_domain_exit(struct sbi_domain *dom)
> +{
> +   if (!dom || !dom->vec_ctx)
> +        return;
> +
> +   sbi_free(dom->vec_ctx);
> +   dom->vec_ctx = NULL;
> +}
> --
> 2.43.0
> 


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
