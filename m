Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31984606A31B
	for <opensbi@archiver.kernel.org>; Thu,  5 Nov 2026 15:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HM8dapfR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=lcvXUwKT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YWNGvSm/VPz9A3R0F0C45y72iSf2J+tBiGy1/Mu8R9c=; b=HM8dapfR6POdmvegDiuv9VLRuE
	yAmHYZr/sYAhRNCc2dQ1bji1AQFSlLFtVgBrRHnZRbPzuRP59kZz5H6/rSMLg3Jyc+EvJ2s1a7ZVV
	Arq2O/Ukh7vcpTnchUIxIGtQgYbbJEygIiN39aOSIOfk1AiEgmSZYR1Vytw7CklrM0NVwMJtQCacO
	3GORYWVoxPRzbYSdiE+1NobULhSihGWlG+C6DZzjFZt7Zp7vp9Dym8Zt44Vwfgx4ccqERXr0ioz7x
	etX1mv6ObWUIOXYZLLThYOcdaZWIJ/eMCwWT88DRThw7QDrNF9wOcsgOOWlWjIpUxhb7Esmy0PoEv
	hAvgffMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOz0t-00000009MHl-3nwu;
	Thu, 05 Nov 2026 15:04:27 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOz0r-00000009MGj-0LwJ
	for opensbi@lists.infradead.org;
	Thu, 05 Nov 2026 15:04:26 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-823b938464fso1379758a34.2
        for <opensbi@lists.infradead.org>; Thu, 05 Nov 2026 07:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793891064; x=1794495864; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JGToSn38P7KJGZqpDZEUyTPfE1rLNFQs62CpfGjQG7k=;
        b=lcvXUwKTYj+gL4l44AfhemRnxMXHWmwMI1iFIAhTWauURIEVz8N5zbDQ8Pb0jJUHji
         kDOP095jeqNqbcHPj2GFgtM+F9VMsojxmb+lHk2J6B0vQ2G4XRb43zn03B4T6liO63KL
         XuG3YJh3lW6YL5UafPGtPyaYK9CK0pNl3u1j5ZIKU1sEwTgvJKKPvvAA1GaAnQurMyVs
         zPZte5qqKoBz9Vxw/v8Dc4Xz7wPpwX4QHrTH5vlUBEYCS2s/Z+GvruQARDAtynN4K6RK
         TT5W/56jY7pJkqPbKYDpUaNo1cP0vPSFTSGUh8e5gmNdebTYhqD6Rim+v2NHR7htBN/W
         72qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891064; x=1794495864;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGToSn38P7KJGZqpDZEUyTPfE1rLNFQs62CpfGjQG7k=;
        b=VzgUVhbcrTamtGh1lTZGYv3ZWpHp9iu2oj3TVV58teAaRey1bFyDhR7t9ybVExfnhQ
         mTE0H+4plsEsNTUHMNYp48IAJJg1nMG59FYDq2QiuXnizp2w6FVLfNzdC6LulyQepS7P
         y/sbWYwkVfK7HZ6Yu2CJyggvGPR9c3Dvu2Fg7iQ1tSpR4q6pkHUPpz3zAMY3w2k06ipa
         TuVvHNOxrK5a8sMHtKvGom/QKNoD7mvvOUEm9Wqu5JaCc7p7tOpsYQiM+C+0rYFAsU9O
         QitUv0aTgbicJjFORa+3+YzgOGmBCjK4AGIe1P2RTG+JAsmUz6EPOzvlbWjSZIrFFcbM
         Mjhw==
X-Forwarded-Encrypted: i=1; AKwUvBz7eubAghxbiVYqWn+StntP/hGZXrmzuqBTVHmFY4yccRaqcDFMxz9adASkA/IBy8ea8cnWbsAH@lists.infradead.org
X-Gm-Message-State: APuU4Z9NhL1L9R9/7Z3INctxHejtLZ0CpI13CE4g5fQukraCl9LZzPaI
	9fWdiJfjh6UfR6YbdAXYa9jCPdOBAFoaUbYFGtRLnG99IepgYpcyNb1NLsw+Ca5vBt8=
X-Gm-Gg: AYBFou2LGQD9CXi9Ig+1DPWN3YqvZEImz1jznIDLGz+DNrIaTfLJGMrOvK55leGEBn0
	fSxKgDXnfUXsZ/nBJZ2esNtSlKXJe3HHMJPb+mKEEZQaeIncEw123axaex1sX9ReB6Z+8MnGYGf
	iaYhCaLRMF+mZiTgZ5LVNXWjoEtRo8WKJ03mM0zgoBQASKaPmCe8hgBYKR6H5OO9KlEb4t8iDDt
	1xG3gJRw5yC9HH62SWyRzDrB3ZQTQqYgr/LM1nwCsbYGl1b8LbmmFTizPKjFP0gCl7q+VGOnd4F
	PUe2nBa9pqkFQEEWms1hmR9UVcuuQQBuV6CKlVWzlPy526XzVqWX8bzoDdzdl96MfvcPRbgecND
	dl4S+WvXJyc8xqKvtVY1IN+Lw1kcmilB5LFZuP0LVCqWXEz09ZgzULhKmOMlZUvDwVLt53WxbQc
	Q6PkrKo8UrxM6CGrw5E0DuG8Gm/el3cin2P/Mr9swJEdL8Yr8Nw62cJQw7EBI20UbJ1uW7MLua0
	9NJYwzl0SejW3F8cXxbY3Ire41S2foFlt9rZ5ph+2hidxoh28VBATkw54U/BQZjliVOsMNkpLNb
	RoOfXYDEi57zFP/tlOkhN52LTu17UTU=
X-Received: by 2002:a05:6830:82f4:b0:81b:ac5b:ea17 with SMTP id 46e09a7af769-85d364871femr15058273a34.16.1793891063810;
        Thu, 05 Nov 2026 07:04:23 -0800 (PST)
Received: from [100.64.0.1] ([136.226.84.194])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3a1ac98sm4664270a34.1.2026.11.05.07.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:04:22 -0800 (PST)
Message-ID: <a161c53f-eb48-465c-bffe-ab260654be4b@sifive.com>
Date: Thu, 5 Nov 2026 09:04:21 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 4/6] lib: sbi: Preserve S/VS indirect CSR selectors
To: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>,
 opensbi@lists.infradead.org
Cc: anup@brainfault.org, rkrcmar@qti.qualcomm.com
References: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
 <20261105044339.435711-1-theodoruswensanfebruanto025@gmail.com>
 <20261105044339.435711-5-theodoruswensanfebruanto025@gmail.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20261105044339.435711-5-theodoruswensanfebruanto025@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_070425_255182_2D741B52 
X-CRM114-Status: GOOD (  16.00  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-04 10:43 PM, Theodorus Wensan Februanto wrote:
> Preserve siselect when either Sscsrind or Smaia is available.
> 
> When H is implemented, also preserve vsiselect.
> 
> This change preserves the selectors only. It does not save
> the indirectly selected backing state or IMSIC files.
> 
> Link: https://github.com/riscv-software-src/opensbi/issues/433
> 
> Signed-off-by: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
> ---
>  lib/sbi/sbi_domain_context.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
> index 89fd1647..fe7d98af 100644
> --- a/lib/sbi/sbi_domain_context.c
> +++ b/lib/sbi/sbi_domain_context.c
> @@ -96,6 +96,10 @@ struct hart_context {
>  	struct hart_context_sstc sstc;
>  	/** Supervisor counter inhibit configuration */
>  	unsigned long scountinhibit;
> +	/** Supervisor indirect CSR selector */
> +	unsigned long siselect;
> +	/** Virtual supervisor indirect CSR selector */
> +	unsigned long vsiselect;

Should this go inside struct hart_context_hext?

Regards,
Samuel

>  
>  	/** Float context state */
>  	struct sbi_fp_context fp_ctx;
> @@ -277,6 +281,13 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
>  	    (csr_read64(CSR_MENVCFG) & ENVCFG_CDE))
>  		ctx->scountinhibit = csr_swap(CSR_SCOUNTINHIBIT,
>  						 dom_ctx->scountinhibit);
> +	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCSRIND) ||
> +	    sbi_hart_has_extension(scratch, SBI_HART_EXT_SMAIA)) {
> +		ctx->siselect = csr_swap(CSR_SISELECT, dom_ctx->siselect);
> +		if (misa_extension('H'))
> +			ctx->vsiselect = csr_swap(CSR_VSISELECT,
> +						 dom_ctx->vsiselect);
> +	}
>  
>  	/* Eager context switch for float */
>  	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_F) ||


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
