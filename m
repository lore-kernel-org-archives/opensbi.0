Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA06CFA46B
	for <opensbi@archiver.kernel.org>; Sun, 23 Nov 2025 08:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EHne99f2b8ZDk9bUqrz0RtwSDpWfihr7zRQTzErODjU=; b=vxKbUsNFRoEyjOxhlPM9ofv9NZ
	CgbBXJIk8NAKBGj3y6O9oXz5wNTSKLYKkBDmrJacysKHKXaWCIzBCnxpB1tbKMRSGL2HnFpV9EH9R
	5QmNyA6Cgy1b0Ih2m5YP3uhcfBoH8BOxBw8VzCwqO92bDY7S20AzOrhHSafYMpf4rMm7548zOa9WE
	laLr3MLIjMrlWVCtYvdJUV+Cuf/Z+URMeWVrHOecNj6i5rmpzz1mqQTJ0v1WNmySvvstcp2W9ZtZC
	lp/HWmgiVhIMaM9208DyEZ73bp3KYX/BZrb6ryhJmefn2Lk2Y9z6PTnpQDDPVm9eZ5vxP0MhP2nk7
	A65UrIQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN5ry-0000000AHZv-1S6Y;
	Sun, 23 Nov 2025 08:54:54 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN5rv-0000000AHZU-2LgN
	for opensbi@lists.infradead.org;
	Sun, 23 Nov 2025 08:54:52 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-298144fb9bcso36584015ad.0
        for <opensbi@lists.infradead.org>; Sun, 23 Nov 2025 00:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1763888090; x=1764492890; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8D2lV2N5MEWCeUuzgf97QO5w6QdsR0WtagzX2/Wvdpo=;
        b=EvzMsHC3w/fwrx7TVB6kFijTJXHAs2I1XlrG19MbO51wICdAjnOkrbereNXzpGhaCV
         3U3Pb2cLNvtLLt105Q4ogp8wP/PZvUDlqjY/TXjl2/Ew3BAZgxJTNMs0R9eJOCeMXcGG
         9qHbC0vasClBxWu5pgF/2nE7mxfHfxJl9NQp8pwcJtPq7tW1TltrOCL2JkfB0Crsz5Ak
         /UPa8w73xBzTo5s65NX9o8rLA4EO6fsIOGC6gMTWXBo/ZkTBM9XY5NTO7ErXhDZ1cB0a
         hwYRWF9Y72Ri/eL113gUMWftFZ3FGk3YfNotKdSXE+mesUlhtcVjcuVUCXMiQPyJAYG4
         84mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763888090; x=1764492890;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8D2lV2N5MEWCeUuzgf97QO5w6QdsR0WtagzX2/Wvdpo=;
        b=k1Fi0ZYaghAkxNXNV4sntFd3Xec0pEoszxpVQNv5q9Tv+2TGLcBtqzx/JB4KXUYEiF
         kDQR4tVtdoWO64e3LiTHTBlcT80D5zgw7bwk9nC7M7opxYehMJ7ogG0vnDau/ltkGxQU
         uddqsSBVfix8uW8fEV0Z2f6QVmIYkIaLKfgYA2kymyLlC1CeDEJF5Cfr0cLh/ehN6xOt
         XRDxf45+6kTxIOEpiFB0h1pXBPs035Xtc43A0Gcd2iHrLq7hxJQ47lR0a0qhkpVlNhsg
         7Wdmx6+uLqJHGV57ShP7C6sNdaQ+p26nfk9mHL4JRUYtikwP3bphwgFUQiJ1IRWCNPk2
         yqaQ==
X-Gm-Message-State: AOJu0YywdFDGjx+x6hoXWnvO6YeIwV3e+4ET5i5UjFgiLeBnEGE7r1T9
	SgguizkCxj3Jieuj8m70xdapDm4o0HEwsjJPotvkjTOXyUBuUciTb5tnZ4UFzoH9kbvHRbVQTwF
	Zg+vupK7xRkt2SPqg7eF/h6SEcCwkceHykha7DI8iDx7lqt81uTzPROf2oZ5/zaGQRdt1frcrMj
	+DFOt61jsuifqYaJERBRSw4WNlH5UvDCft0Kap0i989If+YfDe
X-Gm-Gg: ASbGnctg5a+XI6zP4KbZ+yGa1ByR1jqqfGWHGRzMtltP+csZ1iZ9DKB8IhLMoQ1CtX0
	WOzGbHnc73zMC0hsXANBHcbNGc/kBAdKhdrJO6UJr2cg1LckMdnqxZE8HFXYqyXwmvCQIZ+qt/d
	St5WpmqRSP6WJP6NsGmD/le0+wMbQT64aweIyCVwbpnDNMWHFtYVBaTu+gd8qc+dj9y5f264+qW
	d0a6XOECdODcanQ8Egw3TQe3S6XyMg0TnTvrVLF7vAsC57x94p/eyoUXy+881Xl/8HkzJqIWtBD
	QTSf4eoWotYIjIjJH/JbVFhoKYtL+AhTPEuvLUntEDnD8sJgc49uqnNnETEQ63v9n+S9qVwu+R5
	pI4O5kef0bkJyW+lyz20cjam7KWByRXOl/5ono5nf21GnmgU1LXO5xIGGoe2O+tzv3Sf/Sog3nH
	/vM2IaBusgVPvuNMaR8kpZpkr7I2sZ/Gs/eVvlQyi3pkInuPhOlg==
X-Google-Smtp-Source: AGHT+IG2me303gCKaZceHw3+BN6UjVAqiH6jXWzN7okO7cNP5AR+WTiJYcNHNCCtbNyICBFbrm9gqw==
X-Received: by 2002:a17:902:ce05:b0:295:269d:87cf with SMTP id d9443c01a7336-29b6be8c79fmr95941075ad.5.1763888089814;
        Sun, 23 Nov 2025 00:54:49 -0800 (PST)
Received: from [172.16.0.158] (1-171-39-212.dynamic-ip.hinet.net. [1.171.39.212])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b25e321sm104116675ad.50.2025.11.23.00.54.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Nov 2025 00:54:48 -0800 (PST)
Message-ID: <e1982a9f-83b3-4ec1-8627-613771fdb247@sifive.com>
Date: Sun, 23 Nov 2025 16:54:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] lib: sbi_domain: Allow MMIO access to non-MMIO ranges
To: opensbi@lists.infradead.org, samuel.holland@sifive.com
References: <20251121193808.1528050-1-samuel.holland@sifive.com>
 <20251121193808.1528050-2-samuel.holland@sifive.com>
Content-Language: en-US
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
In-Reply-To: <20251121193808.1528050-2-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_005451_613210_F25530C7 
X-CRM114-Status: GOOD (  19.88  )
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


On 11/22/25 3:37 AM, Samuel Holland wrote:
> Currently, platforms do not provide complete memory region information
> to OpenSBI. Generally, memory regions are only created for the few MMIO
> devices that have M-mode drivers. As a result, most MMIO devices fall
> inside the default S-mode RWX memory region, which does _not_ have the
> MMIO flag set.
>
> In fact, OpenSBI relies on certain S-mode MMIO devices being inside
> non-MMIO memory regions. Both fdt_domain_based_fixup_one() and
> mpxy_rpmi_sysmis_xfer() call sbi_domain_check_addr() with the MMIO flag
> cleared, and that function currently requires an exact flag match. Those
> access checks will thus erroneously fail if the platform creates memory
> regions with the correct flags for these devices (or for a larger MMIO
> region containing these devices).
>
> We should not ignore the MMIO flag entirely, because
> sbi_domain_check_addr() is also used to check the permissions of S-mode
> shared memory buffers, and S-mode should not be using MMIO device
> addresses as memory buffers. But when checking if S-mode is allowed to
> do MMIO accesses, we need to recognize that MMIO devices appear in
> memory regions both with and without the MMIO flag set.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>


Reviewed-by: Yu-Chien Peter Lin <peter.lin@sifive.com>


> ---
>
>   lib/sbi/sbi_domain.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index da0f0557..0da43d76 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -236,7 +236,11 @@ bool sbi_domain_check_addr(const struct sbi_domain *dom,
>   			rstart + ((1UL << reg->order) - 1) : -1UL;
>   		if (rstart <= addr && addr <= rend) {
>   			rmmio = (rflags & SBI_DOMAIN_MEMREGION_MMIO) ? true : false;
> -			if (mmio != rmmio)
> +			/*
> +			 * MMIO devices may appear in regions without the flag set (such as the
> +			 * default region), but MMIO device regions should not be used as memory.
> +			 */
> +			if (!mmio && rmmio)
>   				return false;
>   			return ((rrwx & rwx) == rwx) ? true : false;
>   		}

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
