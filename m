Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6117ED3B7EA
	for <opensbi@archiver.kernel.org>; Tue,  9 Dec 2025 06:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=epf42jMjTl1zJ62/lHvVLjgZzONmXMkDkfYcPRinkTg=; b=VA625aj15CvkjB
	kGIMj2T30c9WHdLwLtWs3IkADrRwbkpkb5vLv2rzU4OF3wEVxi1EglI3MQGglRiDRDfbS5B9Jb07d
	gR4l0xR4TqMfkV0ttUFBn4T2Y/tuw5yrF5VFGMQgrVcje31lNNZUYvOv+RNjizl5m8Pz1pd8g+ZZJ
	0Suww3pXlYfJBOph89dYnOhPBFFBAJCe+KiaAi010wo9OhrjsuhwsFkTBHRUEwWUxWSbH3qOgp90t
	pqA823OiZN2Q1pbrdcPpGtbWBqh56o+tI2fOMuvM+lIIEMjUaDE87CzuGptEzo376IS77kVHOA0Hy
	KRDmuFbF2BbC2tRTyJ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSrTL-0000000DuLk-13D8;
	Tue, 09 Dec 2025 06:45:19 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSrTJ-0000000DuLH-2X0a
	for opensbi@lists.infradead.org;
	Tue, 09 Dec 2025 06:45:18 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-343774bd9b4so4252665a91.2
        for <opensbi@lists.infradead.org>; Mon, 08 Dec 2025 22:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1765262717; x=1765867517; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8l9GswwPAu9GVzkyC3UplQY8jJLBMsZVg/V+qGj9bMQ=;
        b=IAIufMHmsIBoOcLfVGc7B+f95DVdeCxmF/RaFW5wJkHxyZpAQuqXKc2UtTeLfITh03
         CZ1dtKPwi+xygWuOpllsPrLOuMwCX3CdGU/g5stcA3pI/Aql+Roloc0b1cDClHEXmMph
         kcSMRWQQbbQf4U1bNYmhx54KGBM/VIFzD85haYp5GM6adkGVJVkkd/q+dn/pFZByJ9aQ
         Ne9nadjEGpkyu9Uk7pSr899G4/li+Bamjs3lBWdvezJmBAxFKNqQzL4zgCdVXsnhTsvv
         /hCY04kJy2z+OPTG5zeoIHYVCs/xrDvoA4pxhb5A8yIiVRyPcKddq/jjdFMBYmYK5wzO
         OFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765262717; x=1765867517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8l9GswwPAu9GVzkyC3UplQY8jJLBMsZVg/V+qGj9bMQ=;
        b=KWDXJmT8M7ZJgQxiJH7H/IywGZF8NX/4fhpScZDr1UJ8AM2XoWPjQl57XIhJiuQPwp
         qWdfaopswnQEgrSuiKUzd44bG3/Y3aZulUOukNq2v7Qn7kr6bQMx4pc9mV5atjG0t7Ef
         DXnskpb+f81HuvcuAMtruVSGfhxxfVCmc5G6V2Z9/KOUnGsc5bI0S2NWn2IpmtpqDJGP
         ZkmcyjILwFNrV219LPexoLMcKMFObqy6NW+eR/Ji/YTN2IK3nzVn8ZkgNYq+0SPNoWvu
         FJWm3YXVn1r3XfuZjcthZf3RgaElQv0oovymzcbFFu/3d89g0sKGwT5Kg+GIVmukoxyN
         v8oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXA16AXZLIXb5z3JgMHbvmKGtkGS4zeUy86d7XS7I+9+MCcUOMX3dyA+TS7pfWQZXywbyIyqg4b@lists.infradead.org
X-Gm-Message-State: AOJu0YyBjKy9IYfCth8Tyj7uKpXW9j52AOvI9f8bim4TmfgwT8ZrEsO6
	RS4enjkM+KUbKbkzu6rXej9mCIEqp/E6/8/3lxoP0GCWdBuuFxGAfFlc5HN2XZIDEfc=
X-Gm-Gg: ASbGncur7vIBy+garn5I7mwHoUk4gQ66PR8mH3Q9UjzQDvBOMeb60bFUri8rgfj6l7a
	wxn2hX+O3sLjzQKqHaK2gajtRwI7E+vau4Rb8IfJB9qowx9V4m3vThNmkVoKjbMvYAOIJgNrpAJ
	QYz0pAE6kSBTIo1oVRlwdx4T2YpBnqksBYKAt+keiHNBZoOPSsYaP3WIGG1ZuT8xOZNivoJdZ7T
	s3gWxL0WqLjA8gkKsIceEn4m+/NRoq54Dq1tSEH13ufkAYTKdCOI7UCy6q4mf2Kr5/yWUAXW+50
	TuhZjuwSMrTWj8yUpCSE63O9yjXKXFAEPT7akO3o5JqcHDt3B/zQWxccNtj+GBp7yOcdzk9QI2L
	DkmwNMobZiB6ANDMut11FfqgEpRaztxqKDTQWLdvxjmx34hHQOZnlq/CcD7R/bGBGgG84D30oVP
	7uhW3oGP2kPLJyxr1ASLRYVAIvxUu0p/s=
X-Google-Smtp-Source: AGHT+IE4MTG0dGu4dxvqa2lSfRw2VlUbGVURgckyemIf8P3VM8DG24NIomzJkdSh+1wl/DKPZ6dl7g==
X-Received: by 2002:a17:90b:2750:b0:349:9dc4:fa35 with SMTP id 98e67ed59e1d1-349a2622069mr8161978a91.25.1765262716623;
        Mon, 08 Dec 2025 22:45:16 -0800 (PST)
Received: from [100.64.0.1] ([165.225.110.109])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49a18372sm1257317a91.16.2025.12.08.22.45.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 22:45:16 -0800 (PST)
Message-ID: <dc5705e9-a6c8-4096-bd7d-b03380f4262f@sifive.com>
Date: Tue, 9 Dec 2025 15:45:13 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] lib/sbi: optimize domain memory regions copying
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: anup@brainfault.org, inochiama@outlook.com, opensbi@lists.infradead.org
References: <20251208094504.1254011-1-vladimir.kondratiev@mobileye.com>
 <20251208125617.2557594-1-vladimir.kondratiev@mobileye.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20251208125617.2557594-1-vladimir.kondratiev@mobileye.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_224517_658858_D636BA9F 
X-CRM114-Status: UNSURE (   7.78  )
X-CRM114-Notice: Please train this message.
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

On 2025-12-08 9:56 PM, Vladimir Kondratiev wrote:
> There are 2 locations where memory regions moved in a bulk,
> but this implemented in a region-by region move or even swap.
> 
> Use more effective way. Note, last entry, dom->regions[count], always
> exists and is empty, copying it replaces clear_region()
> 
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> ---
>  lib/sbi/sbi_domain.c | 20 +++++---------------
>  1 file changed, 5 insertions(+), 15 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
