Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9098FF60C2
	for <opensbi@archiver.kernel.org>; Tue, 31 Mar 2026 05:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7QWQLxH8Cevnq9XaiVlhddwWOFAz1QPE6BxYKKswzrY=; b=tiJ9frfWeDI/i6
	VeXFltmRyi4o2q1Nt55aVZfE1AjVUd5/RZWjULY//6xriNmRY8foqFnRl2IjTcgz+tSefONpaZGtp
	pPgohwm7wkwhINhKfwKh3TORXzHyqy9gWmGA4JvaNeENtflpZBBNYplJhmy/WdQ3LvE04dPgKjiEh
	7dy4rrc3H4F+hkvysLxhGhvnh1r/CNATp2mX05DCw7mbZV7WBUjc/I9CFvIZFGKhzR5bjW0PX9zsV
	mXGa8lCBtffJVMubxjmC9WWf2Z3jP96Qx9PXeRyq4tUChg3g+WH8teABwcg2yhzk3GYs3AyO446R3
	ajbt10zBsJgn1HhuNIKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7RyR-0000000CK9K-040P;
	Tue, 31 Mar 2026 05:49:11 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7RyO-0000000CK8R-0AK9
	for opensbi@lists.infradead.org;
	Tue, 31 Mar 2026 05:49:09 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so41427725e9.0
        for <opensbi@lists.infradead.org>; Mon, 30 Mar 2026 22:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1774936145; x=1775540945; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IEEjwg5i/tfTQmB2eEj7n3EeGIK+i+HjPsXCpT+nfQc=;
        b=NIzlVU19mw7tr3x7H2/oYHaLfP3PFAalkJQLyHQNvpzkqJWaqg0RTMQpg4skIpHOdC
         0ne4jkGLVo4dKrv4pxtDn+Snu+KLIf+x+mKkUypaFjIJAEZKnBqrHlqJbQupBawrB30+
         B7DTor/KcV1MOQRqiR7zCscMqyHGmNCzPBFUz8ha7KBa4Nw15Y7c+CMnSt2v1oalzsJ+
         5NiSJ36ZlURYHXMDIVzn4eFUFX+xEGgtXpXiw5DXaUH47GgucfFzGL17ht4al8W2OEUc
         YBfAlFn0/8QLTr725WtNSisQxHkvbDqWuouyzpaKAhPGiO7Wk1oSj63Cb2m9PL/fiv4/
         X03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774936145; x=1775540945;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IEEjwg5i/tfTQmB2eEj7n3EeGIK+i+HjPsXCpT+nfQc=;
        b=YprhB5roqlb2SIApizcT5dav000kyVgtDi7BYSMTjgtugMcRrD1LXIHrl5LRMnY0Zx
         qknlEh/PhFnXn7nflztd2B6kcdFn9MOHWFlVOfjDPYC9OP7lSJBjJ3tlCX9lnZgh8DpQ
         JnhhIVUfrC6CUmFUtZzonFmcLMOuZNA4TBWMfsTzuTkLgmb00OQP2szNo9Oc/ouPFwQk
         vds6fu2lCB+RTgSwMxCrPqbN+6o1sZjGH0H1MtNYzuSjzPxy9WjJVPrS5aokxdz4pJfW
         kHNFiwIFKmZJo2JOz+fIFo2/GH5UXbx/DBUsKGB32F1WJHjgHHMdnj55FcfbIFX7I3cB
         uRDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqrZloxFXkCjAJzX7Zw/6aZ/zvQLkxE+m3KTa3YjBZj7pXfcxNcoYL/Mrr5vTQ7YSYVuUJ3YUI@lists.infradead.org
X-Gm-Message-State: AOJu0Yzvr6omUWO+lsQ2GUsDBzpySJca0pSS1PZr09SfXe5W4wuVrPkY
	OqQ0MZzuvYMQLkrMvvilV+dwKVPSjzexL90SsVpIxi7XD4NyiY/2GIkoteQoO1RyMVDnCdhZEaH
	x1zpjAzg=
X-Gm-Gg: ATEYQzyateCHe3LuzhwAeyRoSRPTxgKpf0vR7H9V6Vn1kU2lw9IyqCEfb0fxBVpd3Gj
	/vD81IvWR9t4r6Pwx+5KZP1db59HnusrpPySNhZ0/lws7djLFBQSd4kcnMVmAnXewq96jHz6JCa
	RMMxBqB+plpLIHQrvTm0I89h4Ucv6d+lSK4n/U4d01Npxh0iw256kDTa6JMm+AUErl36xDBrDyE
	CHmQmu5afPinuItlVJ4iWiTnmDcAUAYkmfD3ZyVZJ2FN1MDI0GxEoMPZp6wOq8oRqwc1+1TxPZ8
	qMy0ejmf6c1/CLAuuSv42r0wL6gZMGHQXlPTzHq0hO8VHI9DJqnBXTfWj071uwZoj5KMYJk1UnL
	iREo8z6tjk5MUlU8um9ZgngglWym0Km7GGbNSxQDxTgxxWOekswCDV7AoFZeoES9o3XH+JEH1v5
	Vfd0e6MUhhwzpwsTaBluga7yMsnSZRGwf78VWXvKgCGQmS5WcYQPLzKSdHtWVF1w==
X-Received: by 2002:a05:600d:d:b0:485:40a4:364 with SMTP id 5b1f17b1804b1-48727ecf3edmr214491005e9.26.1774936145417;
        Mon, 30 Mar 2026 22:49:05 -0700 (PDT)
Received: from [172.27.130.2] (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c8ee2d3sm7754935e9.32.2026.03.30.22.49.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 22:49:04 -0700 (PDT)
Message-ID: <417c3ba6-3867-495a-abac-67277e958596@riscstar.com>
Date: Tue, 31 Mar 2026 06:49:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] lib: sbi: domain FP/Vector context support for
 context switch
To: Radim Krcmar <rkrcmar@qti.qualcomm.com>,
 Samuel Holland <samuel.holland@sifive.com>
Cc: Scott Bambrough <scott@riscstar.com>,
 Robin Randhawa <robin.randhawa@sifive.com>,
 Anup Patel <anuppate@qti.qualcomm.com>, Ray Mao <raymond.mao@riscstar.com>,
 Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>,
 "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>,
 opensbi <opensbi-bounces@lists.infradead.org>
References: <20260327171601.169103-1-dave.patel@riscstar.com>
 <20260327171601.169103-4-dave.patel@riscstar.com>
 <DHG4R2Y751XL.23KZT9EJ35ROS@qti.qualcomm.com>
Content-Language: en-US
From: Dave Patel <dave.patel@riscstar.com>
In-Reply-To: <DHG4R2Y751XL.23KZT9EJ35ROS@qti.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_224908_401162_8257C7FB 
X-CRM114-Status: GOOD (  18.36  )
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

On 3/30/26 13:53, Radim Krcmar wrote:
> 2026-03-27T17:16:01+00:00, <dave.patel@riscstar.com>:
>> From: Dave Patel <dave.patel@riscstar.com>
>>
>> This patch adds proper support for per-domain floating-point (FP) and
>> vector (V) contexts in the domain context switch logic. Each domain
>> now maintains its own FP and vector state, which is saved and restored
>> during domain switches.
>>
>> Changes include:
>>
>> - Added `fp_ctx` and `vec_ctx` members to `struct sbi_domain`.
>> - Introduced `sbi_fp_domain_init/exit()` and `sbi_vector_domain_init/exit()`
>>   to allocate and free per-domain FP and vector context.
>> - Modified `sbi_domain_register()` to initialize FP/Vector context per domain.
>> - Updated `switch_to_next_domain_context()` to save/restore FP and vector
>>   contexts safely:
>>     - Ensures FS/VS fields in `mstatus` are enabled (set to Initial) only if Off.
>>     - Restores original FS/VS bits after context switch.
>>     - Adds NULL checks to handle domains without FP or Vector extensions.
>> - Updated domain context deinit to free FP and vector contexts per domain.
>> - Added runtime checks for FP and vector extensions where needed.
>> - Corrected handling of MSTATUS FS/VS bits to avoid unsafe full-bit writes.
>>
>> This improves support for multi-domain systems with FP and Vector
>> extensions, and prevents corruption of FP/Vector state during domain
>> switches.
>>
>> Signed-off-by: Dave Patel <dave.patel@riscstar.com>
>> ---
>> diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
>> @@ -217,6 +217,10 @@ struct sbi_domain {
>>  	bool fw_region_inited;
>>  	/** per-domain wired-IRQ courier state */
>>  	void *virq_priv;
>> +    /** per-domain float context state */
>> +	void *fp_ctx;
>> +    /** per-domain vector context state */
>> +    	void *vec_ctx;
> 
> Since the domain creation fails when F/V state cannot be allocated, why
> put the structures in sbi_domain directly?
> 
>> diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
>> @@ -143,6 +146,37 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
>> +    /* Read current mstatus */
>> +    unsigned long mstatus = csr_read(CSR_MSTATUS);
>> +    unsigned long new_mstatus = mstatus;
>> +
>> +    /* Ensure FS is enabled (not Off) */
>> +    if ((mstatus & MSTATUS_FS) == 0)
>> +        new_mstatus |= MSTATUS_FS;
>> +
>> +#ifdef __riscv_v
>> +    /* Ensure VS is enabled (not Off) */
>> +    if ((mstatus & MSTATUS_VS) == 0)
>> +        new_mstatus |= MSTATUS_VS;
>> +#endif
>> +
>> +    /* Update mstatus only if needed */
>> +    if (new_mstatus != mstatus)
>> +    csr_write(CSR_MSTATUS, new_mstatus);
>> +
>> +    /* Save current domain context and restore target domain's F and V context */
>> +    sbi_fp_save(current_dom->fp_ctx);
>> +    sbi_fp_restore(target_dom->fp_ctx);
>> +#ifdef __riscv_v
>> +    sbi_vector_save(current_dom->vec_ctx);
>> +    sbi_vector_restore(target_dom->vec_ctx);
>> +#endif
>> +
>> +    /* Restore original mstatus if we modified it */
>> +    if (new_mstatus != mstatus) {
>> +        csr_write(CSR_MSTATUS, mstatus);
>> +    }
> 
> I would slightly prefer if M-mode entry always set mstatus.FS and VS to
> Off, so M-mode couldn't touch the state by mistake.
> 
> Here we'd temporarily allow M-mode to manipulate the F/V state.
> 
> Before mreting, we would restore the mstatus.FS/VS.
> 
> Thanks.

Hi Radim,
         I have accidentally sent v1 patch, Samuel H. have had similar
observation and is already taken into consideration.
I will be sending correct patch.

Thanks
Dave

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
