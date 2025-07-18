Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF90DC83F17
	for <opensbi@archiver.kernel.org>; Fri, 18 Jul 2025 07:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vwWebpQliJhxTcZm6/mGW99c/6yrLBqozu3F5FddpJA=; b=NbhlZZTDqxHb2N
	dopKVsuu4WLADlK7Am50KRFIbEPVVm114jeAhdFZBzo3urafm2srDp2PeOKXfGpvV9/gQvUeb+c5B
	1Ii6eDQv1YqCqryZD8IHlOK8HhiZE5lIPfuqmv7rlR+Qgne4xqXVpClAApQq1J/15qWmkMQi3CuNX
	kkt7ve8RZq/4h9HkfrztcK3WkbMypFXOsZnLZ0hr1+UK6pEnKNnVShrZ69DsPjcnZB/JxAnb5K+AN
	jOf839+NvsR6OZ1Bv1MqT+xF5B50RHKwY/CbCkatGBCWdfoBrd6A0qzOgRuYE1s6VjcCVHzvtGpyD
	L4iaAlJRaxGWKVz2mHGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucfwI-0000000BwQN-03hs;
	Fri, 18 Jul 2025 07:55:30 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucfwG-0000000BwPn-0m5v
	for opensbi@lists.infradead.org;
	Fri, 18 Jul 2025 07:55:29 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-87c09672708so42378139f.3
        for <opensbi@lists.infradead.org>; Fri, 18 Jul 2025 00:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1752825327; x=1753430127; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pczYFSULnHTOOo1LCKsQdOPEc90NfjosEtGicFZJRU4=;
        b=VWqtCyz4WBPS+1RKDflw2Bn70yTuHC1n3tXsOs7ZYX+7jpr39vypt+C/qEGA618LMl
         NZOvlx0c67jTITpSDH4mMljbYs7f/Nr6uBTC45HHIU25JtBDst32zAvndw1b5qHbCkgk
         5edTTfbYT08fGnd0OMs2QYSMaMpabJY2bBwJ5v1FQxb+YHMRd7B8oxUthbFcLg5WriXb
         sazv34Hs5eoPStbpNamnMUsrainHtWY7HQM4RkCjotAzs1Wg/aHBxG3S7uetRvKcAonT
         ne1bJNloPnVsg2lOFaf0kZyT+A9HA2Zimik2mTBAMuMNfOU91Rf1BN0/bB65OnzIn8k2
         2R6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752825327; x=1753430127;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pczYFSULnHTOOo1LCKsQdOPEc90NfjosEtGicFZJRU4=;
        b=jp9wJ3mLLIC/ure48NtCtpIqIMWhaCQWPXM9hg7pjyre5P592f3SyV8yNw28Gfkgsa
         vixlwQXXtf1mOpiaaZXhTECxhQ+2TtpHD3sLhzJsDnXJHw10mjVlf6q2Sot/pb0/wqlG
         28NWC47QGhaijvZdljSeio/D4MIgzUIx5QaHL3+9QQxf+uBLUG0oy4n+/7vSrvcWl5zM
         DI6R6sYt8FLrK8bvKBpR8vz3sgTEjR5kVHxY/WNGkF+Bh0V0iwLgAel5+N0hKTEO/97F
         3F7sXJLcM5mpHxhVp0IWjmU0C7gc2Kr769Avuj7M2VC0E+cY/CJ1n/Y63aiqibpraRFX
         xNGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtMEQiFMa6RvHH1vXMHDxIoPbtG5w5oqwRBRbtKOn/aJk+PrD5GCYoAfVmpewrhS2DN9DKGEr7@lists.infradead.org
X-Gm-Message-State: AOJu0YyzbTmGPhJK0/VhDLsX8iQxKY+m8m9bQmyt/jPilRFvEamIqLVB
	JxkbZ9DgYDTAuTHYpBxVvdgjiS09J0LX2+aqiJRkRUCg1v8KpWFaOysrFKYb+Rq8xxVBjG2P2ol
	swJAM
X-Gm-Gg: ASbGncvXcawNWeAoDTUl2njklXcw0sR/bQzCTXjKqgpDvs3b8QFxqFhFKm70UkyJyRj
	jCDKi8nWAkWhKWlOu/iIBcqpcvZoCY5q6Cv+G6r/CuCSSc8nYiyCginMGr04o8C+VtZ1w0IhWB9
	f8EaPNYnGu9meVzozi8/eTXen4TI/Hxwhg7gXzLkSV1Y3xAaWu6oXiANVwKMHP1CvsdQg6KNXum
	M9moNH0JXbvs7IleRWJmZUPQejcoBfHLr8+cF1DLTfV071UaDv3aWSsk3Qy1hp3kHtuVVhKKXgn
	eyAhhcx3AwSVBhFnDFQ4TLGjkRbr4O6dZyigfLdfQD8v/9j434NYtz5wj0zRQc/D429Ucc4zkpV
	ByiNvrwhFT20c2Bo1NWf5OatNtjRgjXW/jYcuPg==
X-Google-Smtp-Source: AGHT+IHIbRq3ABgnMCXwp0jCrJ6X6IWpeKGule727RV5/oc6FXAPhwXZAHWoMRdSOHLEHBIOoSdzzA==
X-Received: by 2002:a05:6602:4144:b0:879:49e9:5156 with SMTP id ca18e2360f4ac-879c293fbf9mr1186157139f.9.1752825326927;
        Fri, 18 Jul 2025 00:55:26 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.11.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5084c7c446fsm198747173.49.2025.07.18.00.55.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 00:55:26 -0700 (PDT)
Message-ID: <79305dcb-fce6-4b6c-86b5-34824029e274@sifive.com>
Date: Fri, 18 Jul 2025 02:55:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] include: sbi: Don't use #pragma when preprocessing device
 tree sources
To: Jessica Clarke <jrtc27@jrtc27.com>, opensbi@lists.infradead.org
References: <20250709232840.37551-1-jrtc27@jrtc27.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20250709232840.37551-1-jrtc27@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_005528_235207_6ECD5EC1 
X-CRM114-Status: GOOD (  15.53  )
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

On 2025-07-09 6:28 PM, Jessica Clarke wrote:
> Since this persists in the preprocessed output (so that it can affect
> the subsequent compilation), it ends up in the input to dtc and is a
> syntax error, breaking the k210 build. Ideally we wouldn't add the
> -include flag to DTSCPPFLAGS in the first place as this header is wholly
> pointless there, but that's a more invasive build system change compared
> to just making this header safe to include there.
> 
> Fixes: 86c01a73ff9d ("lib: sbi: Avoid GOT indirection for global symbol references")
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
> ---
>  include/sbi/sbi_visibility.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/sbi/sbi_visibility.h b/include/sbi/sbi_visibility.h
> index e9c401c..f900c44 100644
> --- a/include/sbi/sbi_visibility.h
> +++ b/include/sbi/sbi_visibility.h
> @@ -7,10 +7,12 @@
>  #ifndef __SBI_VISIBILITY_H__
>  #define __SBI_VISIBILITY_H__
>  
> +#ifndef __DTS__
>  /*
>   * Declare all global objects with hidden visibility so access is PC-relative
>   * instead of going through the GOT.
>   */
>  #pragma GCC visibility push(hidden)
> +#endif
>  
>  #endif

Thanks for the fix!

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
