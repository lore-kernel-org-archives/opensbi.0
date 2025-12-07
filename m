Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B736D2CE17
	for <opensbi@archiver.kernel.org>; Sun,  7 Dec 2025 10:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HUNIOQXew+wztDyqdctxbbdBXbuJCw4IlgPKCI54Li8=; b=z37Y8Ty2vpVzQy
	TU6USAld103Nyk1q3wzfexnHOY99ghtrYMmHKOJQKBhujzusZ4OobzsdH+lr09OFJmvwswF7aiNT5
	lI0x/Q9TdsUmiVnIX2+NmTxu+HfWJ3sQJ2ecPmEABCbOCcVIpQ5OOpD0deJjr9Ma0FFLNllAQqOli
	zzzMegCLFQrI4kMzGKt2f8G2RtpyUPa7USvFWhvkdPfVPX3JjY5WxLnSYJOK/C+k4WTqBcS3D8/Bn
	yT6ltIPdFv1NtIkk7b3nhw4UJ2Egf97UpfwYVgoiEyoUkDnEDe6tiOoSkdNirTnpbqmA9Y93ftNCD
	C4Z3SrVbBcMgBMBEMBRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSCTN-0000000BgTd-1l9b;
	Sun, 07 Dec 2025 10:58:37 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSCTL-0000000BgTG-1DOl
	for opensbi@lists.infradead.org;
	Sun, 07 Dec 2025 10:58:36 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-340bb1cb9ddso2903273a91.2
        for <opensbi@lists.infradead.org>; Sun, 07 Dec 2025 02:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1765105114; x=1765709914; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q/gKtniuCBqv6s3G5+bGOqjfQon7KayCF7feBx23eYw=;
        b=WgniJRDv5CAHKhgW01G37/jt60F7OzoIduRCxTMGwoDHW7giHcHkd3qJhE8uWD8CDn
         uz6QYAJnXjhdrvchrw38vIDsi0kvTGJZZj40SQyoIGtsoSuTQzVEEakpMgCiARV7NdCW
         uR1P/szi94MMI/+3+HDXKTSpJVYmdIUJDkMkLrcURSY6sr8+fmRJ31JhE5+0RFdZZsqP
         OFC/uhmQk0mIV6D74d+B0tP+eSq7mLLU6f6DXGijIAzeE/P05T+fe0cah/cDLAZ3izz0
         V+P/MxTwki7F0JBVaa44Pd2UibKioqPIOIqNdZgWpLhpUpjvqq7DiWfu+QKrB3PC0Sdb
         CgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765105114; x=1765709914;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/gKtniuCBqv6s3G5+bGOqjfQon7KayCF7feBx23eYw=;
        b=u2m2HL0g3amHQj4sRVt2OomMdc8EoiaUB3CXIMqL1t1FzRSc0VDRCgifjl7/WLENk2
         2m4o1BMhBYbeFJLholvAZuNbAx6k4ju7I8ht9ZC0cstrlVFS0hLyzE93aMaHrTrObHcd
         yLE6Sm4RHfWCqnMrAzWmnzQKK0JEUXyQOWQZfq4VY1yk9lby6udgB0Q6WdEfW1jvksEz
         xs4I09+bOuhLcJxc9S6F0XQS9J35tGlbzC/dgMSWcodBHYhm1yaI10jg4UQUr6zS4RR3
         0SAjXIZkq8kZXK3NVMKWFxzW0GOxiUdjiu0W2j1dM+QFg0ocVlDQ0X0jAprafxnP4sX1
         Djzw==
X-Forwarded-Encrypted: i=1; AJvYcCVjA25uTWwEaF7oAiuzMaqIv1CQVn0UJbf+f0A/SRYc/sbOs55G3lqkZni50wHmDaw0izc/H2Ef@lists.infradead.org
X-Gm-Message-State: AOJu0YxuUX1tabBButhlxHtC+P2wsPbmq77kfeGgTQv74l4hFmvjDoN7
	IehcH7GlDQ0Em4Zmaa9/VD84FZS1v6mBQCUr4nEyZ7C85BgzyL2b5irM5+QneFllcOE=
X-Gm-Gg: ASbGncuqJ/d4n9n9LhvelsIythXYBkOgRu1VMIuFD/MAUux++Id6p0r1OxFYm+7BJ34
	c3ITTf2WpidILJlhvJNuG2l+U3hZi+AJWp1MTurf/DHuLdFwZGh/yBfQ3ER2iuxv4UX/xCuA78K
	9R5sCv4jLcI52Z7qw67ie2e0a/Bm8UFoT1fenStRn3AkItiL9cu6VK18bcpLPtQDzSMwTDp6eve
	CGEgOIhhrfNpaep+jyp9Apmy3K21tDc+7VEueuv36RwfzDJd8hOCAmWMJqKEJBpD/F3G3wikKz0
	0kcq7pmk/I9+NSJorGPkc+IScp1u6pzI+DSI7NhcYWXah3oiIYIsF9ymQ8PThDMzjkEjHCgnMp9
	xLDDpD6jQIFLGWZi91jOdwIE1NsRefC2a5leoZWU7O5z5Og9h1mdrQbKGWPNPmDn7o+cRI0peXT
	f8JbY4ikqSCLw6odeu7u5Qd3ZFl0Uuxpw=
X-Google-Smtp-Source: AGHT+IFZWUb2ikdthIarRo1dFWgQ8rXX7olhBaYrqp8dInag6UpEMhvMyjIIcF3lMoeykKvaVZLvZw==
X-Received: by 2002:a17:90b:1a8b:b0:343:f509:aa4a with SMTP id 98e67ed59e1d1-349a260a9d0mr3717162a91.36.1765105113858;
        Sun, 07 Dec 2025 02:58:33 -0800 (PST)
Received: from [100.64.0.1] ([165.225.110.109])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34912b5cd2asm7679085a91.1.2025.12.07.02.58.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Dec 2025 02:58:33 -0800 (PST)
Message-ID: <21b9d402-7a40-49f1-a477-25e4e8bf493a@sifive.com>
Date: Sun, 7 Dec 2025 04:58:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] lib: sbi: restore platform CSR when suspend
To: Xiang W <wxjstz@126.com>, opensbi@lists.infradead.org
Cc: peter.lin@sifive.com, Xiang W <wangxiang@iscas.ac.cn>
References: <20251204145901.411369-1-wxjstz@126.com>
 <20251204145901.411369-2-wxjstz@126.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20251204145901.411369-2-wxjstz@126.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_025835_377195_3A894383 
X-CRM114-Status: GOOD (  23.33  )
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

Hi Xiang,

On 2025-12-04 8:58 AM, Xiang W wrote:
> When HART enters suspend mode, some platforms require specific CSRs
> to be saved for recovery. This patch add interface for this.
> 
> Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
> ---
>  include/sbi/sbi_platform.h | 60 ++++++++++++++++++++++++++++++++++++++
>  lib/sbi/sbi_hsm.c          | 12 +++++++-
>  2 files changed, 71 insertions(+), 1 deletion(-)
> 
> diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
> index d75c12de..175ec1e2 100644
> --- a/include/sbi/sbi_platform.h
> +++ b/include/sbi/sbi_platform.h
> @@ -41,6 +41,9 @@
>  #define SBI_PLATFORM_HART_INDEX2ID_OFFSET (0x60 + (__SIZEOF_POINTER__ * 2))
>  /** Offset of cbom_block_size in struct sbi_platform */
>  #define SBI_PLATFORM_CBOM_BLOCK_SIZE_OFFSET (0x60 + (__SIZEOF_POINTER__ * 3))
> +/** Offset of suspend_backup_csr_count in struct sbi_platform */
> +#define SBI_PLATFORM_SUSPEND_BACKUP_CSR_COUNT_OFFSET \
> +					    (0x60 + (__SIZEOF_POINTER__ * 4))
>  
>  #define SBI_PLATFORM_TLB_RANGE_FLUSH_LIMIT_DEFAULT		(1UL << 12)
>  
> @@ -146,6 +149,12 @@ struct sbi_platform_operations {
>  			unsigned long log2len);
>  	/** platform specific pmp disable on current HART */
>  	void (*pmp_disable)(unsigned int n);
> +
> +	/** Save platform specific CSR before suspend */
> +	void (*suspend_non_ret_save)(unsigned long *data);
> +
> +	/** Restore platform specific CSR after suspend */
> +	void (*suspend_non_ret_restore)(unsigned long *data);
>  };
>  
>  /** Platform default per-HART stack size for exception/interrupt handling */
> @@ -198,6 +207,13 @@ struct sbi_platform {
>  	const u32 *hart_index2id;
>  	/** Allocation alignment for Scratch */
>  	unsigned long cbom_block_size;
> +
> +	/**
> +	 * When HART enters suspend mode, some platforms require specific CSRs
> +	 * to be saved for recovery. This variable tracks how many CSRs need to
> +	 *  be backed up for this platform.

There's an extra space before "be".

> +	 */
> +	unsigned long suspend_backup_csr_count;
>  };
>  
>  /**
> @@ -216,6 +232,8 @@ assert_member_offset(struct sbi_platform, platform_ops_addr, SBI_PLATFORM_OPS_OF
>  assert_member_offset(struct sbi_platform, firmware_context, SBI_PLATFORM_FIRMWARE_CONTEXT_OFFSET);
>  assert_member_offset(struct sbi_platform, hart_index2id, SBI_PLATFORM_HART_INDEX2ID_OFFSET);
>  assert_member_offset(struct sbi_platform, cbom_block_size, SBI_PLATFORM_CBOM_BLOCK_SIZE_OFFSET);
> +assert_member_offset(struct sbi_platform, suspend_backup_csr_count, SBI_PLATFORM_SUSPEND_BACKUP_CSR_COUNT_OFFSET);
> +
>  
>  /** Get pointer to sbi_platform for sbi_scratch pointer */
>  #define sbi_platform_ptr(__s) \
> @@ -666,6 +684,48 @@ static inline void sbi_platform_pmp_disable(const struct sbi_platform *plat,
>  		sbi_platform_ops(plat)->pmp_disable(n);
>  }
>  
> +/**
> + * Platform specific CSR count to backup during suspend.
> + *
> + * @param plat pointer to struct sbi_platform
> + *
> + * @return csr count need backup
> + */
> +static inline unsigned long sbi_platform_suspend_backup_csr_count(
> +					    const struct sbi_platform *plat)
> +{
> +	if (plat)
> +		return plat->suspend_backup_csr_count;
> +	return 0;
> +}
> +
> +/**
> + * Save platform specific CSR before suspend
> + *
> + * @param plat pointer to struct sbi_platform
> + * @param data buffer used to save CSR
> + */
> +static inline void sbi_platform_suspend_non_ret_save(
> +					    const struct sbi_platform *plat,
> +					    unsigned long *data)
> +{
> +	if (plat && sbi_platform_ops(plat)->suspend_non_ret_save)
> +		sbi_platform_ops(plat)->suspend_non_ret_save(data);
> +}
> +
> +/**
> + * Restore platform specific CSR after suspend
> + * @param plat pointer to struct sbi_platform
> + * @param data buffer used to restore CSR
> + */
> +static inline void sbi_platform_suspend_non_ret_restore(
> +					    const struct sbi_platform *plat,
> +					    unsigned long *data)
> +{
> +	if (plat && sbi_platform_ops(plat)->suspend_non_ret_restore)
> +		sbi_platform_ops(plat)->suspend_non_ret_restore(data);
> +}
> +
>  #endif
>  
>  #endif
> diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
> index 0a355f9c..949f7aaf 100644
> --- a/lib/sbi/sbi_hsm.c
> +++ b/lib/sbi/sbi_hsm.c
> @@ -21,6 +21,7 @@
>  #include <sbi/sbi_hsm.h>
>  #include <sbi/sbi_init.h>
>  #include <sbi/sbi_ipi.h>
> +#include <sbi/sbi_platform.h>
>  #include <sbi/sbi_scratch.h>
>  #include <sbi/sbi_system.h>
>  #include <sbi/sbi_timer.h>
> @@ -50,6 +51,7 @@ struct sbi_hsm_data {
>  	unsigned long saved_mideleg;
>  	u64 saved_menvcfg;
>  	atomic_t start_ticket;
> +	unsigned long platform_saved[0];

Please use the standard flexible array member syntax (no zero) instead of the
GNU extension.

>  };
>  
>  bool sbi_hsm_hart_change_state(struct sbi_scratch *scratch, long oldstate,
> @@ -249,9 +251,13 @@ int sbi_hsm_init(struct sbi_scratch *scratch, bool cold_boot)
>  {
>  	struct sbi_scratch *rscratch;
>  	struct sbi_hsm_data *hdata;
> +	unsigned long n;
>  
>  	if (cold_boot) {
> -		hart_data_offset = sbi_scratch_alloc_offset(sizeof(*hdata));
> +		n = sbi_platform_suspend_backup_csr_count(
> +			sbi_platform_ptr(scratch));
> +		hart_data_offset = sbi_scratch_alloc_offset(sizeof(*hdata) +
> +							    n * sizeof(long));
>  		if (!hart_data_offset)
>  			return SBI_ENOMEM;
>  
> @@ -430,6 +436,8 @@ void __sbi_hsm_suspend_non_ret_save(struct sbi_scratch *scratch)
>  	hdata->saved_mideleg = csr_read(CSR_MIDELEG);
>  	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12)
>  		hdata->saved_menvcfg = csr_read64(CSR_MENVCFG);
> +
> +	sbi_platform_suspend_non_ret_save(sbi_platform_ptr(scratch), hdata->platform_saved);
>  }
>  
>  static void __sbi_hsm_suspend_non_ret_restore(struct sbi_scratch *scratch)
> @@ -443,6 +451,8 @@ static void __sbi_hsm_suspend_non_ret_restore(struct sbi_scratch *scratch)
>  	csr_write(CSR_MEDELEG, hdata->saved_medeleg);
>  	csr_write(CSR_MIE, hdata->saved_mie);
>  	csr_set(CSR_MIP, (hdata->saved_mip & (MIP_SSIP | MIP_STIP)));
> +
> +	sbi_platform_suspend_non_ret_restore(sbi_platform_ptr(scratch), hdata->platform_saved);

The suspend/restore functions operate in reverse/LIFO order. I would suggest to
maintain this property.

Regards,
Samuel

>  }
>  
>  void sbi_hsm_hart_resume_start(struct sbi_scratch *scratch)


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
