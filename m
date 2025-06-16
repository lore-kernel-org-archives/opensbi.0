Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09CEC71135
	for <opensbi@archiver.kernel.org>; Mon, 16 Jun 2025 05:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6CoJPLoy7gPPBYa61zyU1Ay/0VcCay+V/emntN0XhX0=; b=ViVWJgJw1hpoID
	WnPlwYjZCnP23gW7dJFlhu0Ag0LOEXgtHVaq1ATuBz11QJwkBShS5DWlmVlUD0hmYHCjkoIv6IGAb
	pIvYteIuHso324uvqjmcq6pZZWAyq4KbHQeQaoYcjSaFVnr8+cW0EpKr1DYsERnHwrE/GrfwoGDlG
	M67G2lwzL4AIi2ddHJ5ZTGjx5IUPrp/SArKTC8T4qO6AFJi8OckBfufgqBHTJf4k/Lyr/7oNGjpV5
	oQxNQj0X0l9+WY47l/bkg1jcJeLrAkihkQMf681spzTaihQUHhhTu9fCt11qsM0+zpz/fq9dDmCRC
	agE19AVZSvR3rEQwQWqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR284-00000003Of2-0621;
	Mon, 16 Jun 2025 05:11:32 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR26X-00000003OZZ-3ia5
	for opensbi@lists.infradead.org;
	Mon, 16 Jun 2025 05:09:59 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso3454082b3a.0
        for <opensbi@lists.infradead.org>; Sun, 15 Jun 2025 22:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750050597; x=1750655397; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zG6Cc1Teffe6eNIIDDY8bQF+FmVVU8t9Ut0DXY8AtvA=;
        b=HbHeqJFQQH4ErJrOg3k2v5899Wx3i1wsK8Ffq4cAjcXFh7hu6U9CKmWv2m8rw3GfFr
         RY1f7BTO0UHuIrSn1danZU3eGNCEOtiY0+23V7PmDdLuuyhfDtTA0QJBTGMvEzSUQYq0
         qUqpnM/95+kSISLxRRe8gUcWTpcKScFHMf/piehJYqKVxRt1V52qGD6YVZNiWwVjbvt3
         W9R40b1x9ktOemtrjGe5NX7Eqa7tHUh1xUO2mj+/SCwKkDeHi2JRCumFlxYFvcy3c0+c
         6bwm0JiuYl2SKjJNChjd8R+5ePikFdozEAkYN2UrDFkg3+lecgsPTrZ1APbxqbjzTBYe
         GDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750050597; x=1750655397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zG6Cc1Teffe6eNIIDDY8bQF+FmVVU8t9Ut0DXY8AtvA=;
        b=FkdaGbbRcO0XYmi/194QxjESjcoog8nVuAb8AXGRrpQO2wdGTHQVJTu6IxGOdLFD5S
         2HdwY1WujD7mg2nywOrkhd1OhcBfXY2lVIcG56tOOsWK+Jya/ki/RxLXaeMN+hEJtrrX
         nl2Flh1sw9K32U77hbKFG2vdFU5hwBF4/sdDOq4f9LISGURBWDCjHHxzkFhd9gcOfQWS
         HZOfD4XsoEmIdQQzF7/mw8waRea40YFmyLbrMFQi5TL8h4t41nczm7JjSTqrFu1STacN
         oavSYjmzjfp9WucB4wGWMc8+YAuuMxq3ijMqKgW3afcvmJl6qi8JXMBEuNKtj75hPLD/
         r0YQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBCcXdDvFCwQVtZC9Z2hz+sDHgaISkZUhbAvzHGpR7hqIcMYZJScDptQJlHN2fQP+vHaJrGeJc@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0/askWbW/soTV1+S6H4o9vznjf0wHSUH9WcP8LxYFdtfq6Xdl
	bj31sP9aTfY5DdTDwxUftexytyVoR/eBxT9VU3udpRWyj+/kUflknSZpIByBbAkegoN6t5qKzJN
	iTRpZ
X-Gm-Gg: ASbGncv/q5By8CU9HpP/D61CK4cWkS4f5M2oEfmK3SIcS1LmrvR65pZWPrsb9NdYEWC
	VKIawJlV15jQnFS88ftChaKfDQdVnLX1O551srWkBTeHneBrlAM/oWBAXR7s29XKFDql7AoBSRk
	hCqRzbJu6a7ivHBFCqJrDbxN80Jj/sFG7Pf2Y8aKbCtm0kkv8itlQMaOFPHaIlD5ror/pqZYhow
	krkwaGPzERt3BdmpLqoYLL1El85zgts6UQebPIkPLA+N8jXnYmgHQqIr8rR2DfUk0QfzVjhEsc2
	aBsohTBDmxVbkzbv8hu1jHN8vL4XJt0j40lwqAcvDCQG166690iGY9CikkhcV+Ra3uJHfGB/iI2
	n0u5U
X-Google-Smtp-Source: AGHT+IGmuOLOZskMqeY8wtqqmc/onJxFwpdSdS53tkjcxsu35cyieinGMmYlCVpJwEFNsJck4svjqQ==
X-Received: by 2002:a05:6a00:805:b0:736:ab49:d56 with SMTP id d2e1a72fcca58-7489ce0d877mr10362076b3a.1.1750050596543;
        Sun, 15 Jun 2025 22:09:56 -0700 (PDT)
Received: from [192.168.33.2] ([49.37.251.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900b0683sm6007894b3a.130.2025.06.15.22.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jun 2025 22:09:56 -0700 (PDT)
Message-ID: <c5504151-8106-4990-8aa4-b3ff5045cb28@ventanamicro.com>
Date: Mon, 16 Jun 2025 10:39:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib: sbi: dbtr: Fix update_triggers to match SBI
To: Jesse Taube <jesse@rivosinc.com>, opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>, Charlie Jenkins <charlie@rivosinc.com>
References: <20250528154604.571815-1-jesse@rivosinc.com>
Content-Language: en-US
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
In-Reply-To: <20250528154604.571815-1-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_220957_932891_47FE4E58 
X-CRM114-Status: GOOD (  14.90  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org



On 5/28/25 9:16 PM, Jesse Taube wrote:
> OpenSBI implements sbi_dbtr_update_trig as
> `sbi_dbtr_update_trig(unsigned long trig_idx_base,
>                        unsigned long trig_idx_mask)`
> yet SBI v3.0-rc7 Chapter 19. Debug Triggers Extension [0] declares it as
> `sbi_debug_update_triggers(unsigned long trig_count)`
> 
> Change update_triggers to match SBI.
> 
> [0] https://github.com/riscv-non-isa/riscv-sbi-doc/tree/v3.0-rc7/src/ext-debug-triggers.adoc
> 
> Fixes: 97f234f15c96 ("lib: sbi: Introduce the SBI debug triggers extension support")
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>

Reviewed-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

> ---
>   include/sbi/sbi_dbtr.h   |  3 +--
>   lib/sbi/sbi_dbtr.c       | 33 ++++++++++++++++++++-------------
>   lib/sbi/sbi_ecall_dbtr.c |  2 +-
>   3 files changed, 22 insertions(+), 16 deletions(-)
> 
> diff --git a/include/sbi/sbi_dbtr.h b/include/sbi/sbi_dbtr.h
> index 8cb776c..b1cfb5b 100644
> --- a/include/sbi/sbi_dbtr.h
> +++ b/include/sbi/sbi_dbtr.h
> @@ -117,8 +117,7 @@ int sbi_dbtr_uninstall_trig(unsigned long trig_idx_base,
>   int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
>   			 unsigned long trig_idx_mask);
>   int sbi_dbtr_update_trig(unsigned long smode,
> -			 unsigned long trig_idx_base,
> -			 unsigned long trig_idx_mask);
> +			 unsigned long trig_count);
>   int sbi_dbtr_disable_trig(unsigned long trig_idx_base,
>   			  unsigned long trig_idx_mask);
>   
> diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
> index f0e9128..1248634 100644
> --- a/lib/sbi/sbi_dbtr.c
> +++ b/lib/sbi/sbi_dbtr.c
> @@ -651,13 +651,9 @@ int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
>   }
>   
>   int sbi_dbtr_update_trig(unsigned long smode,
> -			 unsigned long trig_idx_base,
> -			 unsigned long trig_idx_mask)
> +			 unsigned long trig_count)
>   {
> -	unsigned long trig_mask = trig_idx_mask << trig_idx_base;
> -	unsigned long idx = trig_idx_base;
> -	struct sbi_dbtr_data_msg *recv;
> -	unsigned long uidx = 0;
> +	unsigned long trig_idx;
>   	struct sbi_dbtr_trigger *trig;
>   	struct sbi_dbtr_shmem_entry *entry;
>   	void *shmem_base = NULL;
> @@ -672,18 +668,29 @@ int sbi_dbtr_update_trig(unsigned long smode,
>   
>   	shmem_base = hart_shmem_base(hs);
>   
> -	for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
> -		trig = INDEX_TO_TRIGGER(idx);
>   
> -		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)))
> +	if (trig_count >= hs->total_trigs)
> +		return SBI_ERR_BAD_RANGE;
> +
> +	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
> +		sbi_hart_map_saddr((unsigned long)entry, sizeof(*entry));
> +		trig_idx = entry->id.idx;
> +
> +		if (trig_idx >= hs->total_trigs) {
> +			sbi_hart_unmap_saddr();
>   			return SBI_ERR_INVALID_PARAM;
> +		}
>   
> -		entry = (shmem_base + uidx * sizeof(*entry));
> -		recv = &entry->data;
> +		trig = INDEX_TO_TRIGGER(trig_idx);
>   
> -		trig->tdata2 = lle_to_cpu(recv->tdata2);
> +		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED))) {
> +			sbi_hart_unmap_saddr();
> +			return SBI_ERR_FAILED;
> +		}
> +
> +		dbtr_trigger_setup(trig, &entry->data);
> +		sbi_hart_unmap_saddr();
>   		dbtr_trigger_enable(trig);
> -		uidx++;
>   	}
>   
>   	return SBI_SUCCESS;
> diff --git a/lib/sbi/sbi_ecall_dbtr.c b/lib/sbi/sbi_ecall_dbtr.c
> index 9c496c4..40a437e 100644
> --- a/lib/sbi/sbi_ecall_dbtr.c
> +++ b/lib/sbi/sbi_ecall_dbtr.c
> @@ -43,7 +43,7 @@ static int sbi_ecall_dbtr_handler(unsigned long extid, unsigned long funcid,
>   		ret = sbi_dbtr_enable_trig(regs->a0, regs->a1);
>   		break;
>   	case SBI_EXT_DBTR_TRIGGER_UPDATE:
> -		ret = sbi_dbtr_update_trig(smode, regs->a0, regs->a1);
> +		ret = sbi_dbtr_update_trig(smode, regs->a0);
>   		break;
>   	case SBI_EXT_DBTR_TRIGGER_DISABLE:
>   		ret = sbi_dbtr_disable_trig(regs->a0, regs->a1);


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
