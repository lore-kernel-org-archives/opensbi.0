Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11520C5B543
	for <opensbi@archiver.kernel.org>; Thu,  5 Jun 2025 18:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uCEKf4mzqpHZF3CWA2aMTvRaX0fACKzpX93O/c3LfwQ=; b=ExVmk8M5NVGsb9
	nIHBEertY9+2ME5Oc9cKr/alzYP2XGXj702Q3e5xxkyhIr31K+GqW8Y+TuBGJzea1B9JtPg6WkyLS
	GFTpjH9MjB4f3Wun6E7BrPBPT5QQOnz5qRZ/WmcrrmN22KfZncP+g90rik6qgXEqdbx72ZGSWloYD
	iiAUUj/XqGZQMIURjzd2KTvTd+5xs3KDFpS42zYvVWHFicXKStAES77+vysBRNupdYSe1GNQ3mz2Z
	bN+YWD27bmKQKN7UuREhlv07gv5eYUzrJswOTpi60VsJhfwf6A8Ue0Og+AgusZ1AxHZDg6Y8rCx0x
	kSBxm9Nj//e3HQjnn1AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNF52-0000000GEAz-2V4R;
	Thu, 05 Jun 2025 18:12:44 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNF50-0000000GEAd-008X
	for opensbi@lists.infradead.org;
	Thu, 05 Jun 2025 18:12:43 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-742c46611b6so1758186b3a.1
        for <opensbi@lists.infradead.org>; Thu, 05 Jun 2025 11:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749147161; x=1749751961; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wfNCboyslKxDVOLhdCoV/Kan4OsGGAF5rSdUh2fpP9o=;
        b=gAi4VYiZZOR4EHNcIFoIo/lBVZR92J+fO/i8Anf5p+AuzAmP/mqVR+dP7uaSkisT46
         sK9WXwQqEADlnwT18pHP8iDv/ZrvNOspFN5dLaPa3wSZzP45/QfPqrBXQ3ULoiAevvd2
         7/UEfGkGrdCfnlpiUUvR1GVbkaI69E0DFU+FDEhGsdREKlPZAkxYz/rR4S0RltgmWgF9
         0mWwvCTQ3MKHGhFyzbPySgjyGyqsebANQfY1ID+x6gUaGB3/Kjcu80JuhM0rOsDPxseF
         ZMqt+xwpmNGpzq2BwPNNpRgDtraUFkjkQUXyESjYc3xUUL1PYaCUehCfD+QEszSuT00U
         vbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749147161; x=1749751961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wfNCboyslKxDVOLhdCoV/Kan4OsGGAF5rSdUh2fpP9o=;
        b=PCduCYaRZlQLCw4W3NWNtnLLFYbiB0vNWf1lWidKkh3WHfD/NbIaThCMrhAJi1Oldv
         04mEbKpSxwMJG/9irGiAQZpE26aE0U9TNzA9P2mDXj4vhjzi0ImfyJyzW4r9VBMMfM/l
         QuqBsH1lutHMtObWtY4/Y51k5Y/3doO2vYdk3//icRGeGUcsYMzIkCpncM6oz9b4pHBv
         60tyHX2rnplo9V59W3iAqC/RkEi2MR3l1V+wAElOgH7sNHCEAOL5qeXwcr6RPuIjDWws
         zXLfu1yXLgCR9grD2ZxGzoeiOmzwwo6PciWNF/JbrwaoJ2PuMHJ7SsEGIOwCjBUEEUoz
         8mcQ==
X-Gm-Message-State: AOJu0YyCeC2iaydYld5jpne0rVWh9r9/YDnSmFemKKbUqA5Oi5Z6pSXl
	6qnpI2odH1Ym2KLQErJtrEHJ+6XPUF5xIsps0mC9rbqj6G99SWos2wnixFSSJPBBoLk=
X-Gm-Gg: ASbGncvUB1iW852ajtIDvh/EOkMD8EAWGB++cDSQsgr/bJV6+4+tWanQcZzcpXgQ8Da
	tBIDIMLu3Bd8QkUIxzua/kKao8Vi5a+ncVrh5RyzREY/WSV3k8ILwyZ/FarB/97TErA/IkGAFTT
	IuOxNB6tAYPM1y/EWZwAyfjCQXVITrB0KZhCjO2yfRfHleKXV8bCNAoJlzwCcrv9i+xvFBiCQKO
	7NADaM1RtMlGii26WbDX/q/iwpa4msW0L+AbMTppFbxR+xNkWYDx5AbSCaf+mbd3AMPf7vjUQMg
	j90CujGu2n+PsPCW+UIZ8Dmyu1z5pbHQaapS6EuPXtgxIiK/P2OTDFVcYA==
X-Google-Smtp-Source: AGHT+IHXPgtC96V8PmWxkWI6eqqB2ItJWDx+/gxqnp5Cfv23mDENeszh3RzDUaeeoFwEGE/Yt3aIJQ==
X-Received: by 2002:a05:6a00:4652:b0:740:9331:78f0 with SMTP id d2e1a72fcca58-74827f3daf9mr835653b3a.22.1749147160777;
        Thu, 05 Jun 2025 11:12:40 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:fb6c:4b69:25ff:1659])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeabb13sm13523913b3a.62.2025.06.05.11.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:12:40 -0700 (PDT)
Date: Thu, 5 Jun 2025 11:12:38 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: opensbi@lists.infradead.org,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v2] lib: sbi: dbtr: Fix shared memory layout
Message-ID: <aEHeFhnJO5Ce2Lzx@ghost>
References: <20250604135225.842241-1-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250604135225.842241-1-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_111242_143289_02D1D8E2 
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
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

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
> -- 
> 2.43.0
> 

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
