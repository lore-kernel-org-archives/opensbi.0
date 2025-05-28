Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9527C5AD49
	for <opensbi@archiver.kernel.org>; Wed, 28 May 2025 19:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ui/geZN/kQyT+O7J6viFWyP31nd3nBpD8ObVxdaeMFg=; b=ICUcdPuA6VMmeu
	N/c7Isn59s/yMSfTrGdmIWVdCcYWX5Qjcp0RvIr/zCW65yVtWk8EUwsZzE+vuN78f8nJyfI7+4mfn
	c9swo9TqSYR5HqvvX5ch5a7ni9togrBiTDIma88e+ymfEdGw2TR2aHFSCGYRhhk46b8A6eSCSKUaz
	lYbr0Ui7ygqDG1MMreul6npl23uFcTn1Zf6KubZ1NeF682iaEj13n+2p9W8JAc7NNh/gifW+copew
	xvdum0BXkWnhTkocYvr5cS2dDh07gdqxREbB3R1DjScPqrBJKArdYI94eAdCCL9FGrzvf7iftcvpd
	2Yqu7nZq1YMdtYCFLVlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKMqh-0000000E1i5-0X7A;
	Wed, 28 May 2025 19:54:03 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKMqe-0000000E1hh-39TR
	for opensbi@lists.infradead.org;
	Wed, 28 May 2025 19:54:02 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso106485b3a.0
        for <opensbi@lists.infradead.org>; Wed, 28 May 2025 12:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748462040; x=1749066840; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yt2Qwa5c5QQzqiLrTWQJDKY/hJAiwqAh8us9AxnJFhc=;
        b=NozcIAdN0jHNQ35q6452BUyeY8gIf362X7Hk2IkQUVvLnBzd+3x0pJh+lEt0VIOWOv
         q+IFh6I8Goyt6T0XnnX02kHW4+SFngW2GpMCNMHOrZqK1WKpGiDi45egJp2pX3TiGsuB
         MFSYQzKFe0JrYrWUxVdglf4weBBL5YEkUMX18FHhWJ9GTeyaARTVJiJRzVJH4s7kke4i
         X4fQruHBa5OrmewtYGZa7hTUUd9SvsEZNUPs6yeGI8/1092oa/vmTxROpii1RKexCtKY
         xX91ylIXS3poUj4EXWlIZphTlVFBPWCGBjWiyTrWNlOObM+dr1S2jhm+mbfFYiDohlnU
         zTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462040; x=1749066840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yt2Qwa5c5QQzqiLrTWQJDKY/hJAiwqAh8us9AxnJFhc=;
        b=eLQUujDPMlXFd7O0gzs4IAe4kly/AVRygHn+6S0/DEpRCgvDyLOjBzNkgV6ex2hPiS
         /MDIEcvmUc1L98b58ixUe9GgkQBNcNlPdoWTy+HQWVcPlaZMtg9jWFo91fXI0zz/lic0
         qNils1m8YPGUsdQQA2OYsJ1990yaPU3JZQG9xPCHhhF0+fTXM9udDfRaM7AY4oVZM2zm
         4L0QZ5MOXkFwMSvpWDcaa3WJv7lsSurt+kPmRm7tCZxX4lq29By5/vWqgd3zsnht/bAI
         5dF8EcQ8bCTHBgyIS+ZBXAGu7wVjooE/ofpxg80rIjC7yDYkvSdNanh3je5sW5Rh1n0o
         wiyQ==
X-Gm-Message-State: AOJu0YwaZSLdPueo6AhyM7ScDrCKv0eJ4XJBTI+GfymF4lw1EiE1/5P2
	nyzwp7b5dTzA1HU/0TaBmlVge0+Josa76XjKYbtsOSpunVsqsueMI1bowspDOSlFOaNYmljbzeb
	77cjVRw8=
X-Gm-Gg: ASbGnctFMm/awuWtf/MRpFCC/BnwPpScYvCOOluUjN3HxK5Yud6l7cdrn+Du1F4bciK
	Ce8poYB2oeUczDzptHGJWydzXdNh+Q1CMkBfxwds3oKViLfg1TIvdop262Lf/3Z68/OkJ2QMBiT
	pj9LOyIIHJb1GvgtyLYFhjXvr3NoNH7FLDLgnL/ptqhLViWcqYBmSH8k9f7Z1iqs5j6hPvpLyA3
	E9kIAtXmpLyr80Spz/8+HK7Lacrd3Mt+qr36tZ0LR7QzvZAevXNGnUi5Pj/Wdkxh6vPWHSurROa
	j1OP6anZhBf/OzjmUMgeP3OPGGBvPdVoDvmGmLQtFQ==
X-Google-Smtp-Source: AGHT+IFerDvgVars5ASr0fIicg4C8iLzlJ7hPQ2tiu8odbq/ZYvkZjEksBIW+NfXXuGZPHQlCSvjdQ==
X-Received: by 2002:a05:6a20:9189:b0:1fd:f4df:96ed with SMTP id adf61e73a8af0-2188c374042mr27869353637.26.1748462039788;
        Wed, 28 May 2025 12:53:59 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746e3439acdsm1601285b3a.129.2025.05.28.12.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:53:59 -0700 (PDT)
Date: Wed, 28 May 2025 12:53:57 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: opensbi@lists.infradead.org,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH] lib: sbi: dbtr: Fix update_triggers to match SBI
Message-ID: <aDdp1UeUh7GugeHp@ghost>
References: <20250528154604.571815-1-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250528154604.571815-1-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_125400_995899_4C49CA88 
X-CRM114-Status: GOOD (  17.59  )
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

On Wed, May 28, 2025 at 08:46:04AM -0700, Jesse Taube wrote:
> OpenSBI implements sbi_dbtr_update_trig as
> `sbi_dbtr_update_trig(unsigned long trig_idx_base,
>                       unsigned long trig_idx_mask)`
> yet SBI v3.0-rc7 Chapter 19. Debug Triggers Extension [0] declares it as
> `sbi_debug_update_triggers(unsigned long trig_count)`
> 
> Change update_triggers to match SBI.
> 
> [0] https://github.com/riscv-non-isa/riscv-sbi-doc/tree/v3.0-rc7/src/ext-debug-triggers.adoc
> 
> Fixes: 97f234f15c96 ("lib: sbi: Introduce the SBI debug triggers extension support")
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>

Tested-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

> ---
>  include/sbi/sbi_dbtr.h   |  3 +--
>  lib/sbi/sbi_dbtr.c       | 33 ++++++++++++++++++++-------------
>  lib/sbi/sbi_ecall_dbtr.c |  2 +-
>  3 files changed, 22 insertions(+), 16 deletions(-)
> 
> diff --git a/include/sbi/sbi_dbtr.h b/include/sbi/sbi_dbtr.h
> index 8cb776c..b1cfb5b 100644
> --- a/include/sbi/sbi_dbtr.h
> +++ b/include/sbi/sbi_dbtr.h
> @@ -117,8 +117,7 @@ int sbi_dbtr_uninstall_trig(unsigned long trig_idx_base,
>  int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
>  			 unsigned long trig_idx_mask);
>  int sbi_dbtr_update_trig(unsigned long smode,
> -			 unsigned long trig_idx_base,
> -			 unsigned long trig_idx_mask);
> +			 unsigned long trig_count);
>  int sbi_dbtr_disable_trig(unsigned long trig_idx_base,
>  			  unsigned long trig_idx_mask);
>  
> diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
> index f0e9128..1248634 100644
> --- a/lib/sbi/sbi_dbtr.c
> +++ b/lib/sbi/sbi_dbtr.c
> @@ -651,13 +651,9 @@ int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
>  }
>  
>  int sbi_dbtr_update_trig(unsigned long smode,
> -			 unsigned long trig_idx_base,
> -			 unsigned long trig_idx_mask)
> +			 unsigned long trig_count)
>  {
> -	unsigned long trig_mask = trig_idx_mask << trig_idx_base;
> -	unsigned long idx = trig_idx_base;
> -	struct sbi_dbtr_data_msg *recv;
> -	unsigned long uidx = 0;
> +	unsigned long trig_idx;
>  	struct sbi_dbtr_trigger *trig;
>  	struct sbi_dbtr_shmem_entry *entry;
>  	void *shmem_base = NULL;
> @@ -672,18 +668,29 @@ int sbi_dbtr_update_trig(unsigned long smode,
>  
>  	shmem_base = hart_shmem_base(hs);
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
>  			return SBI_ERR_INVALID_PARAM;
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
>  		dbtr_trigger_enable(trig);
> -		uidx++;
>  	}
>  
>  	return SBI_SUCCESS;
> diff --git a/lib/sbi/sbi_ecall_dbtr.c b/lib/sbi/sbi_ecall_dbtr.c
> index 9c496c4..40a437e 100644
> --- a/lib/sbi/sbi_ecall_dbtr.c
> +++ b/lib/sbi/sbi_ecall_dbtr.c
> @@ -43,7 +43,7 @@ static int sbi_ecall_dbtr_handler(unsigned long extid, unsigned long funcid,
>  		ret = sbi_dbtr_enable_trig(regs->a0, regs->a1);
>  		break;
>  	case SBI_EXT_DBTR_TRIGGER_UPDATE:
> -		ret = sbi_dbtr_update_trig(smode, regs->a0, regs->a1);
> +		ret = sbi_dbtr_update_trig(smode, regs->a0);
>  		break;
>  	case SBI_EXT_DBTR_TRIGGER_DISABLE:
>  		ret = sbi_dbtr_disable_trig(regs->a0, regs->a1);
> -- 
> 2.43.0
> 

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
