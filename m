Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33145C5AE59
	for <opensbi@archiver.kernel.org>; Thu,  5 Jun 2025 10:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mbh84epS00DVjR1mIx9jkgDNWM3P6MhNsaUfxxxijlI=; b=geHyMqL/jEEhTL
	+xJqVlyAPBGHFDyhyTR2z9iQXkNqxy0GdhhfINzeBj1wq3sTv1Ws99GyRioCd6ZPQMtjcuJ2oAUlQ
	kw0/Ok2quvN57oc4e4r3IJgzTebYU1L2Faik5MVo8uzE21UpRbVmeEkL6ApMCFgFpim9gJd7uUyRf
	mWBfPw8VZO3XlkLVrig5rfU5f7NuHaj3t7w/YtNxZedbnJbfq6f1mNmVACMdKirQthHElZDiKJCnj
	QYX6lGVkdh42AEEWfOpoVeULumRxxvxFBnDPhxRe0OWAtZzGZZNPBiUChi99qA+0xLxA3MDTD9ACY
	0jDpbw8ryhj7L7/FJXwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN7pp-0000000FFQA-3A0S;
	Thu, 05 Jun 2025 10:28:33 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN7pn-0000000FFPj-0AXG
	for opensbi@lists.infradead.org;
	Thu, 05 Jun 2025 10:28:32 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so713650b3a.1
        for <opensbi@lists.infradead.org>; Thu, 05 Jun 2025 03:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749119310; x=1749724110; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E7og+p7fzRstCUtdWpkV8KTqp6JLAygq55Z1Xjs/x94=;
        b=dKgaWRNAchUSer8jn7BKqJRjDe0knE1Ktqj+b1zTjnAG0hZ6VHKLz9tFoi3n3gUxS1
         3aMsxISzFEUwu5cr8w+mxvAdi9sySnGAK/t9wZj8GrGH9LQiw5gvJFJk5gyuGkWhUoFQ
         INVXBlHbiTJyHQB/lIwxkTI+64gMKZcnrffrge23Se1BEawLFoDG0EAj56WcvytndJ5D
         umClELigqB3ZbMpfDnbcdKgMw4/8r4/WPStdzF7u0SVeYcq0J8bNci5TuMt00oVjxT1F
         eaDrHadcHtckD9GgdpoyS56m48uQcPT8tqZLiCi7rcPOHW2M5mDCalwOA6iyPV6YodkS
         0S3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749119310; x=1749724110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7og+p7fzRstCUtdWpkV8KTqp6JLAygq55Z1Xjs/x94=;
        b=YzBw9H+adxe/DK70qOU1lYH9V883ZqVjAiU6+l7Crfh3myjMXRdvJOCeuFUmy1MTs4
         Q0a6ribbGCj9/drV8eAMhYG+tk3HGyiBavge2YY+TCMoEKEyr8H/Qbuzbb6o0655VTii
         TBhHEjK11Vs15eBi50sxyzYoZ0qW8GLyaE2S3TfvkmQ7iVKCwg95KVEMxV6G4n2S/VtC
         rbWGT15X4ND9DXBi1Iz0V4dHwWdlPJm8za1G3Cu0wN20SljmU+TuT07bcPVh+++jDCKW
         zihPyTYQsSHyuyI+ceADBKggN4NBImnvwSiR1cVbRyA+jLJhYoYyJqvMYnnmJfCQw6dK
         Htqw==
X-Gm-Message-State: AOJu0Yz5LK6hzmefEzhW7ElGsgGb4Auw4f4B6ZdGYmBYKontZYBw1ArP
	QYleJwc78KX5jmwpfSZ42r61yCAjAdI3anHjJ+6CK0Na2nzbZr+GKssDRZSNP4I4qjo=
X-Gm-Gg: ASbGncs8bnrtGHH3nD4JZZQx0DLjqAM/iIVv3wTkhaYHlYuiH3ZpVXmvWb1Pug79l+7
	xNRkY5YI+uOwIK1eTZoV56EN5MVk1kKEOIgTdJUHdBxHfiG/QCbB4o6B8LGGV5DUvk8PMqo7scq
	QD4d0tiVoI0EJApDXMhq7mJkQ22ip1ObZeqqPxPzQMhuMlYtUjIfLHt0G8K+1duVzuhS1vJZ+Vr
	/UzgoH3Jb3GVYLcUYFeNd19Vr4UsUKJPrGCjeVTBIlqxn79MxQijhTjE8oXMNYG2tGGtSer0ggR
	LYPiq/wXTqcOeWfAoFEjoycLh5EyEBUdAaX0j8IqoZT7XevsW27oaA==
X-Google-Smtp-Source: AGHT+IFViBk3XfCmzJ3CtwaECnHG/D0Uk4hSX/MwVkkVxOQTwLGxs8lpehlCE4tri13G/XRA+nYJCQ==
X-Received: by 2002:a05:6a00:2ea5:b0:742:aed4:3e1 with SMTP id d2e1a72fcca58-74818365934mr3841584b3a.2.1749119309678;
        Thu, 05 Jun 2025 03:28:29 -0700 (PDT)
Received: from ventanavm ([49.37.249.95])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeab0c4sm12547007b3a.48.2025.06.05.03.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:28:29 -0700 (PDT)
Date: Thu, 5 Jun 2025 15:58:25 +0530
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v2] lib: sbi: dbtr: Fix shared memory layout
Message-ID: <aEFxSVzg050hNqlk@ventanavm>
References: <20250604135225.842241-1-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250604135225.842241-1-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_032831_088166_1EBF54F1 
X-CRM114-Status: GOOD (  17.13  )
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

On Wed, Jun 04, 2025 at 06:52:25AM -0700, Jesse Taube wrote:
> The existing sbi_dbtr_shmem_entry has a size of 5 * XLEN with the final
> entry being idx. This is in contrast to the SBI v3.0-rc7 Chapter 19.
> Debug Triggers Extension [0] where idx and trig_state share the same
> offset (0) in shared memory, with a total size of 4 * XLEN for all the
> SBI calls.
> 
> Replace struct with union to match memory layout described in SBI.
> 
> [0] https://github.com/riscv-non-isa/riscv-sbi-doc/tree/v3.0-rc7/src/ext-debug-triggers.adoc
> 
> Fixes: 97f234f15c96 ("lib: sbi: Introduce the SBI debug triggers extension support")
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
> V1 -> V2:
>  - Remove anonymous union
>  - Replace struct with union
>  - Update commit description
> ---
>  include/sbi/sbi_dbtr.h | 2 +-
>  lib/sbi/sbi_dbtr.c     | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/sbi/sbi_dbtr.h b/include/sbi/sbi_dbtr.h
> index a8b3a02..9b87968 100644
> --- a/include/sbi/sbi_dbtr.h
> +++ b/include/sbi/sbi_dbtr.h
> @@ -90,7 +90,7 @@ struct sbi_dbtr_hart_triggers_state {
>  	}while (0);
>  
>  /** SBI shared mem messages layout */
> -struct sbi_dbtr_shmem_entry {
> +union sbi_dbtr_shmem_entry {
>  	struct sbi_dbtr_data_msg data;
>  	struct sbi_dbtr_id_msg id;
>  };
> diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
> index f0e9128..cfb6b2a 100644
> --- a/lib/sbi/sbi_dbtr.c
> +++ b/lib/sbi/sbi_dbtr.c
> @@ -506,7 +506,7 @@ int sbi_dbtr_read_trig(unsigned long smode,
>  {
>  	struct sbi_dbtr_data_msg *xmit;
>  	struct sbi_dbtr_trigger *trig;
> -	struct sbi_dbtr_shmem_entry *entry;
> +	union sbi_dbtr_shmem_entry *entry;
>  	void *shmem_base = NULL;
>  	struct sbi_dbtr_hart_triggers_state *hs = NULL;
>  
> @@ -541,7 +541,7 @@ int sbi_dbtr_install_trig(unsigned long smode,
>  			  unsigned long trig_count, unsigned long *out)
>  {
>  	void *shmem_base = NULL;
> -	struct sbi_dbtr_shmem_entry *entry;
> +	union sbi_dbtr_shmem_entry *entry;
>  	struct sbi_dbtr_data_msg *recv;
>  	struct sbi_dbtr_id_msg *xmit;
>  	unsigned long ctrl;
> @@ -659,7 +659,7 @@ int sbi_dbtr_update_trig(unsigned long smode,
>  	struct sbi_dbtr_data_msg *recv;
>  	unsigned long uidx = 0;
>  	struct sbi_dbtr_trigger *trig;
> -	struct sbi_dbtr_shmem_entry *entry;
> +	union sbi_dbtr_shmem_entry *entry;
>  	void *shmem_base = NULL;
>  	struct sbi_dbtr_hart_triggers_state *hs = NULL;
>

Reviewed-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
Tested-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

> -- 
> 2.43.0
> 

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
