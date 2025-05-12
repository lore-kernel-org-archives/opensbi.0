Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17815C3ABCB
	for <opensbi@archiver.kernel.org>; Mon, 12 May 2025 18:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M4wSR233aqJSUOaFiXC44vlEF31TzW1PvFTQb380t6s=; b=23ssysXaawCSR6
	zF62glFAy+p4GPxj0Jz/ZUhhKaZPPLvdVY/A18Zn4ozbBb334czmX8URexyM+7NBaSxq5HJZz4wJk
	dcuPfzq13WgoFpA26B6j1pALr1g0O7NZqgkpzUHqJ00eEy8frFacADXj8eI6CABuLTApzUmb8GISo
	qcK+IDaNXdMhI8DvTOtyGsT1XObffKdo3tDct7c9g2yPMH+XcdBcDnmjyfugO3/5D3JCq/uRsdRFp
	xdrDuPewsJhXzEwEGncJk4NWrEGHFa2q+Wv1rsu1JB1M4P5nssp6NMwasMOxZQLJZEZ/R8F9KGG+a
	6MkUbyIRRG0K1Nh6ZE/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXbu-0000000AJAh-2jP0;
	Mon, 12 May 2025 18:10:42 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXIQ-0000000AG9c-1PD0
	for opensbi@lists.infradead.org;
	Mon, 12 May 2025 17:50:35 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7403f3ece96so6683720b3a.0
        for <opensbi@lists.infradead.org>; Mon, 12 May 2025 10:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747072233; x=1747677033; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=faNHtlRJU5m1xW8zqnhGeeqBeTIlb7uaGUKY8mr0/EE=;
        b=pmW7xGdsBjRbmRp27/C1x+y1otdQ+klW6U/zbxz9vP+EmKC2/HGoa506yLrppd24hq
         G2s7MFXTvAeNe2zO7RuO3MPAytgVcHHauhpdwM441dhe0ZE4FuHdVVaa7CdJjd4I56jH
         le3CM+zrHCmEjNK1uZPhGKP2g8Wat5a7zq8tyQZr29lrdbSykYQUGDePdX8pJvtRNCHG
         NnbPulnal0CJjcbCST0iuFnqHlCEj1xVgYHljPUKqdpdrZvN1UFHWRBl/1V9fwlaqkzd
         CngUW9x/6MkZRuA8ee5pEzN4JFjvM5k1YrdlYAOguYQVRF66Ir6M80jrl5/RwSmC97A4
         lXOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747072233; x=1747677033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=faNHtlRJU5m1xW8zqnhGeeqBeTIlb7uaGUKY8mr0/EE=;
        b=HEowbVfz4x16nxlSB9aNYKfhpGP1XP3bHgBdXDIUZ77R59Vq3aCTIc+KTwqn8ZTmh7
         RIF0WX99OsJZwbOxKKbuhonbd7fn46VCSZCA2SH8LgVLhoeit5R0V82KqyPHx/k94KjH
         6whRU2iZSmYbjiwvif/hiFlcwRG04nwalDfFqO3KNBUb4gLKJn9mCebNdPPHc/ltleBh
         H8Pw4e0WsrPvrZGXxz/7vOAiZBU14rvGgHgKoah+ty5P4c5ARNqOLUGcubwDbzGGk6sf
         EZqYFyC7ua16g1yM4PTq1tofS8QYY1Yp/hMU2/0k9C/Jc38YEXrym76aTA0KEHEIZjxr
         JiJg==
X-Forwarded-Encrypted: i=1; AJvYcCUOIAY8yUcuNHs236sx6hyrxossuIJXCNPvgz0j19MeY0OgFk7wTPnKl9S7kBgQgNs+XfDIitOF@lists.infradead.org
X-Gm-Message-State: AOJu0YzMNAFTXsk3T9+pynRF6NOT7bFY8/sxv26ipTyWpEfxsOd62ycC
	zEQva/SffVhXE+HFZZW869K4w3sK3A3Fdtx7Nmkc8Uqv+OAPCLPxTFtEMZ9Lol0=
X-Gm-Gg: ASbGncvv2wmotA6xz8PAAQ2P8bNOx0f8TcjbX47EI9RVFlQIHCCYhclxjLRJ0ooQLsC
	aAuwlUB6G4Wk9PwWK/GnQyBzMYAKACL9vm7xyHxL0SxMvNscP67+kxsyQXMssqhWvnlAEK2QhMH
	9pdPTa1o+LtEq538M4FmkNfnYDzdyndetq4+ZAX59TmNFPCAwXm+3WFxcoZmr3CseA2dbmJDy6P
	Q+ibO2pm4FjxRYVxr0l1Xf+eI9t0CWzcZcYdkdtXPBINdlpcAAlI84tTquLqqD548lTYgTDOcay
	xiWRcsU90fWDBn52WKAB9hzb8w6roCldWH/f7jMpKXhKkYVc7+LA
X-Google-Smtp-Source: AGHT+IEmS2ZMweKR3xzBMTAp2xaMdcEks8SrKc8uJFWOcqWoMceKKMPNUHgI2AJkzAIddZ2HAzgYLQ==
X-Received: by 2002:a05:6a20:a110:b0:1fe:61a4:71d8 with SMTP id adf61e73a8af0-215abb3e026mr21193981637.22.1747072232962;
        Mon, 12 May 2025 10:50:32 -0700 (PDT)
Received: from [192.168.1.23] ([50.34.76.202])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234af2bf21sm5129343a12.42.2025.05.12.10.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 10:50:32 -0700 (PDT)
Message-ID: <2e8ec72d-5233-4fec-823c-67a2be0b0386@rivosinc.com>
Date: Mon, 12 May 2025 10:50:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] lib: sbi: pmu: Return SBI_EINVAL if cidx_mask is 0 in
 ctr_cfg_match
To: James Raphael Tiovalen <jamestiotio@gmail.com>,
 opensbi@lists.infradead.org
Cc: andrew.jones@linux.dev
References: <20250512091829.76556-1-jamestiotio@gmail.com>
Content-Language: en-US
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20250512091829.76556-1-jamestiotio@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_105034_642919_5E94F055 
X-CRM114-Status: GOOD (  22.56  )
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


On 5/12/25 2:18 AM, James Raphael Tiovalen wrote:
> Currently, when configuring a matching programmable HPM counter with
> Sscofpmf being present, cidx_base > 2, and cidx_mask == 0 to monitor
> either the CPU_CYCLES or INSTRUCTIONS hardware event, ctr_cfg_match will
> succeed but it will configure the corresponding fixed counter instead of
> the counter specified by the cidx_base parameter.
>
> During counter configuration, the following issues may arise:
> - If the CLEAR_VALUE flag is set, the corresponding fixed counter will
> be reset, which could be considered unexpected behavior.
>
> - If the AUTO_START flag is set, ctr_start_hw will silently start the
> fixed counter, even though it has already started. From the supervisor's
> perspective, nothing has changed, which could be confusing. The
> supervisor will not see the SBI_ERR_ALREADY_STARTED error code since
> ctr_cfg_match does not return the error code of ctr_start_hw.
>
> The only way to detect these issues is to check the counter_idx return
> value of ctr_cfg_match and compare it with cidx_base.
>
> Fix these issues by returning the SBI_ERR_INVALID_PARAM error code if
> the cidx_mask parameter value being passed in is 0 since an invalid
> parameter should not lead to a successful ctr_cfg_match but with
> unexpected side effects. This also aligns OpenSBI's behavior with KVM's.
>
> Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
> ---
>   lib/sbi/sbi_pmu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index 5983a78..62ce770 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -840,7 +840,7 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
>   	u32 event_code;
>   
>   	/* Do a basic sanity check of counter base & mask */
> -	if ((cidx_base + sbi_fls(cidx_mask)) >= total_ctrs)
> +	if (!cidx_mask || ((cidx_base + sbi_fls(cidx_mask)) >= total_ctrs))
>   		return SBI_EINVAL;
>   
>   	event_type = pmu_event_validate(phs, event_idx, event_data);


Nice catch. Thanks for the fix. I think we need the same fix in 
sbi_pmu_ctr_start/stop.
sbi_fls behavior is undefined when the there are no set bits. So 
checking the mask is a correct thing do anyways.

Regards,
Atish


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
