Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F193CAC5B0
	for <opensbi@archiver.kernel.org>; Mon, 29 Sep 2025 10:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y9CwD0IWyn5TWB+Pnw3QigIYJWwJhhwcbtaM5o+LwuA=; b=LVnlp9Y11LiU+Z
	1NurlWKnPyFElPyP7DjJ1c/AXhn+x1FolC3KWTRJ/q2BvDgbPp/vph89hj13tY9zJL5Ae7xREDW1R
	mfBdZY+wv2i94pm9mQHquaYnpMGEShg0HkVXEG9P1VBIf5KCxPqg70tnce6Yy7yxvNUoMSPUqD2Oa
	5JP66JhjPQPpo4uUVTlu/12JYk+s4mhaNNQ1Jg98n3dm+1k9FYAR3RGeBQlvc3sJrQnP2+9ow2YHu
	nKPmH5jwWjLzmBst1mc4qugvhy9ikeaYL9Vf68x3KWOtMrSPObeRuc6fhrnPEVsKiLofTCcdVX+A5
	plh/bOsKXksAMvuZGRtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Akw-000000025Kp-2Qfq;
	Mon, 29 Sep 2025 10:05:18 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Aku-000000025JA-0T5i
	for opensbi@lists.infradead.org;
	Mon, 29 Sep 2025 10:05:17 +0000
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C232E3F471
	for <opensbi@lists.infradead.org>; Mon, 29 Sep 2025 10:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1759140309;
	bh=qqLkuWKKWSnZoK7sURXpo6Nqc60jU9XNGffN7Ert3tg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=WILvtB3s46fYZML1/C908K1mHMZRXhyJmIO/Oea+ADs5KhwAwbLoToXn/AoUB+YBM
	 Juk0uzqwFLPAkuEK+2xQWNizKG6aFBiG+4NuM+x408ujkYLaOHGokRYMXg+k07onL+
	 ezxaD7fpzOxDEqY4uilAi1dgh7c9oTNoi2RDaT59CpJzEcFc5+k31LCz2Lmbc+/Yi2
	 pVKeANOuMx5S2DBymmNE1PzRxvK3Qel8vcyH/bkHhdtQ9tUZxlMF+nYayXOiZDahde
	 0jXAFwaiorllD6+2QeaEWLXl21/r/g7uAtICK8gHAtY3LWwwVyPXW+gtV4qCI+jMbG
	 tPnsrajXJfhYw==
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-401dbafbcfaso3075385f8f.1
        for <opensbi@lists.infradead.org>; Mon, 29 Sep 2025 03:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759140309; x=1759745109;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qqLkuWKKWSnZoK7sURXpo6Nqc60jU9XNGffN7Ert3tg=;
        b=ozzChUIqlNT4yCpEnkVT1HmF1LB70D1fd+tnmcl8s2hL6bkMgGoPNMtC3DVrVXib4w
         9EIkTvXzP4hJWplc4w5S9kGb8wwh/tsqNOki9p6NOj6ghuOtB84Ao8RWNj8fXmP5SJFI
         6Mh0JdtI7dFMu3K7D5+9grGEsRsG/Fvk8ObxkLX5UqI/DmEx2oJrKZMltym/ceT63Tvp
         xk2yW1zsQSWdeLoSSliSsJCUNMmC5/IU9sBhZWgP1bdXMKbbqR1nbquDa0TZKLUQ/Q2H
         DA8jXmSSwajaPx8cAtb2UXtosQppze99dOirVPx2DQLRs5KMqvJ6yI+yrWgNejqsQCR/
         X93Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbCuE0SqBVhM+J6OBo03+BhIvGXV2fppatmUzPoQRfiGSL/ZG0/bNV9rKy/SkY79r20OXOPVPY@lists.infradead.org
X-Gm-Message-State: AOJu0YzP9LeqTEX3ekVNGoqDFJqo7tToN6iXhz3i3scPnptxHYj7VRue
	JlkX2X2ZVWEmcWh2AsB1SfMLD0baNSxyOMWbO7FEcaMVEZHixbIfTLCXvZEr0bPgisenfXICbST
	KIqZF52wVg2W+oRppQR1BGlA3UbIF0sAjVlVtzbaO9QGLXX4iAyW0lVodo3ZS45FQl7kHn+PLHt
	g5la6E
X-Gm-Gg: ASbGncv0608OG7vdX4i/TLKG7QHgu+QksN+iHE2iuShiMkjUqRcBsgmWZazHz0Kdxf5
	XqDZy8fpPigQDLasfamujQQPlu4u3juP/yNZfrvgX7fTWXMyps2Dxw+x9ldDum+Ehjakt80ydbD
	eG1U0DhyVI7Z4mrNIaH98nZVZGdpnlm/NIbEEvfmP2LvBCxBvAqksM7ruQsZDbdujnYm3tNM1Q8
	TYxXNj1E5ZCKIYy/ZQphCUQkMOLUrxdHZxEUPwbld7sEFp5+nI9gPxUsCyQJozniaHB3xLXZumB
	nL5nBdG+rvVtmx8N1jfiXrt9g9S2gzOv1UwDwhWQInPe5xYKn5qJ9KfalK6xlPPToP7hqt5INb0
	r07bvZETcOIeXN87fO92tKppafVjVWE7OA0OYUw==
X-Received: by 2002:a05:6000:178b:b0:3f8:3f7a:e7e with SMTP id ffacd0b85a97d-40e4a5247aamr15493108f8f.63.1759140308980;
        Mon, 29 Sep 2025 03:05:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZ1fD9kLE2f/XWhbBUCapPa5H9oHVAdff82bPzj5A+STfKNM1VJ28uPiPIa+zVtzrHoQa+JQ==
X-Received: by 2002:a05:6000:178b:b0:3f8:3f7a:e7e with SMTP id ffacd0b85a97d-40e4a5247aamr15493076f8f.63.1759140308527;
        Mon, 29 Sep 2025 03:05:08 -0700 (PDT)
Received: from [192.168.103.116] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fac4a5e41sm18545018f8f.0.2025.09.29.03.05.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 03:05:07 -0700 (PDT)
Message-ID: <51393413-87f7-4ab0-b369-2c13225a9ede@canonical.com>
Date: Mon, 29 Sep 2025 12:05:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform: starfive: jh7110: Add starfive,jh7110s
 compatible
To: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>
Cc: Hal Feng <hal.feng@starfivetech.com>,
 Minda Chen <minda.chen@starfivetech.com>, opensbi@lists.infradead.org
References: <20250906053638.69671-1-heinrich.schuchardt@canonical.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20250906053638.69671-1-heinrich.schuchardt@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_030516_285048_D8545DCA 
X-CRM114-Status: GOOD (  14.00  )
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

On 9/6/25 07:36, Heinrich Schuchardt wrote:
> From: Hal Feng <hal.feng@starfivetech.com>
> 
> Add support for VisionFive 2 Lite board.
> 
> Link: https://github.com/hal-feng/opensbi/commit/b7e46979a4feb293070094835ba4058b5e55d707
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>   platform/generic/starfive/jh7110.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/platform/generic/starfive/jh7110.c b/platform/generic/starfive/jh7110.c
> index dcd6306b..dc9a2864 100644
> --- a/platform/generic/starfive/jh7110.c
> +++ b/platform/generic/starfive/jh7110.c
> @@ -308,6 +308,7 @@ static void starfive_jh7110_fw_init(void *fdt, const struct fdt_match *match)
>   
>   static const struct fdt_match starfive_jh7110_match[] = {
>   	{ .compatible = "starfive,jh7110" },
> +	{ .compatible = "starfive,jh7110s" },
>   	{ },
>   };
>   

Hello Atish, hello Anup,

Anything stopping this from being merged?

https://lore.kernel.org/opensbi/20250906053638.69671-1-heinrich.schuchardt@canonical.com/

Best regards

Heinrich

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
