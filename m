Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F91CAC59A
	for <opensbi@archiver.kernel.org>; Wed, 17 Sep 2025 16:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4d2SPEU5zZbk7ApQAT/bAT9CyR92XvA3i+U180mHhAs=; b=ACvwvXfViwiylG
	85s0VO0yu0ToqEXJH2KPzUYfJ/pqLGahbOoGImGQj8rB/fG8CyhxvvZvzYU/UVShR4K5P9FK3hYDu
	GDoC4Crm2wrkQqb54HFdmAaXoDUiloL5uPkw4demUnimcuN/qIbjcreCssVruUtycgvpBJxlJjmW0
	aBanxGFXT5In02/jhX4oGeevlwf41bsAvn+s450x/cMfl6cSXv0fAVCgPCFr1azCYBp7epiX/Yey5
	cNh6VhuuiNFtBne4wV6pJRMlOeOE5ZkB0efqC1uMw+JBB4TniTf3wFcMPUtZETwA7IhWyG43GX0iq
	dz5IAtxGIK3fxTJJ+nmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvCe-0000000DG3y-1Zd0;
	Wed, 17 Sep 2025 16:40:20 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvCc-0000000DG2l-2iBm
	for opensbi@lists.infradead.org;
	Wed, 17 Sep 2025 16:40:20 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-8876de33c86so4376839f.3
        for <opensbi@lists.infradead.org>; Wed, 17 Sep 2025 09:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1758127217; x=1758732017; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fGykO4km7qoObr+A0MLquTULb4IZgoLtWWDW0wz8Kmk=;
        b=SY/2+eZgc5tY1Jd8xURFha1SwiVrATf3VGreo7OQt/wvBQY0piXIkxyJ2EybP0WX2x
         LH9mfrIpzHLQKugOPEY9U9VJ0tcL8byQBH7lcd1cbbsZoGoONi9lOnMEYc0gHi9KBtCK
         8QaUPC43u3Owr2aZDCdxfq4e1xhV+Iz/uzayVGOxLd8BNjSwbDeTCKBmJtenVUat+TGK
         yULi+wdL30pFyfOfI4BV2cLOqiAJ2kiEDmzUGSJKdQG+O9vSHL7anECn2e0x+Yq2jqRh
         i+vZM6cujDjfoiYOhwcfMyqbiXSpQAh1shaZnQ8EuUTY11XY9IMs0VTWPGm7Bc9vCEMR
         UlXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758127217; x=1758732017;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fGykO4km7qoObr+A0MLquTULb4IZgoLtWWDW0wz8Kmk=;
        b=ndBcVgYlVE+p2pypUDViUt2yIrZhw9JfbU56Vj2Ql5m9z6Wvu2DdKRhWA9ynvgJGDB
         nkHra16MHPkdrnQkfn9so5YAI8k/XHrj81SyKipnAfVWEnEENNJ1/kSh1T1ax8FFdvcb
         uFOoLKLb801dUf1nsA6XA3GfAvnOlt8KAXGnzyoSa1jgCTn4G2ZddepXpRcVfiHrObNK
         yBHsVb2Onu8QIcm1urMqs21d3cus+8wZzVyqtGNQFUQeUZ7h/L/R9FJRo+FqNJCeXbYG
         OgA/xdzBjObMknCLPrKS+a8s8+csK9PtGB69UbckynhTvpS30fFxq9l5+dkgJTe23rnO
         nIjg==
X-Forwarded-Encrypted: i=1; AJvYcCX8uYFVv1n/EjcZlVzCLvmZAibRVJO+QvNeykImKGiznkScLxalu+Mq8hlNcD2bt3hJ758ELflm@lists.infradead.org
X-Gm-Message-State: AOJu0YxF64KoKn8xm7gD0GzB0/+yFACFjm04ZKTPe9fSTqYBokF0qJUv
	SyfEci9AkZAE93A1RngZf5MXAOjW4RQeKOA5Cxi1hfIPujruvipQKJQ98KQBZIM42hSEG5lflHL
	eGi5Dydg=
X-Gm-Gg: ASbGncvLAdL6wHvgck2tv2RPrNGnJ6YZFUgWroDJJUs3VAk7N0eZjrzkNnepILofzE7
	rDnBWzVKZ4XaCe7N94R6g+WS1ALaWxW2l89nTNhE00SU30XZwZyN3dNq2uFC8gdTWoLkxMns0ub
	2G29QHp3VIiDHVVnv43lmMczG8wbLQCluxe9QWb+837XPnaY4+8GQB7wZsa7B27m5gUM7DUZV4E
	45uFbAY6UtlKk83z/dzEuselregIVR+xSjS7QwYbtb+qj2s4eOm1NaU5jWZKyEa6na0T46Pzg4e
	+LyLm3OPxtqJm3foMsUFeN8d75sB6iwbbkwCrGsvP1ndfAAlQ3ElmJP16ogrqVYkh3tAu/AmweX
	T5vh1r/8Qt2hkd/d21pDmF5RlCthxXjYr+fbnXJE=
X-Google-Smtp-Source: AGHT+IGGBWpFdpn0GtFroewKtudKGc/gU431o0QvOvLq1c0/HPL8MjP/c/msm+enSZj+9ZWLizoaNA==
X-Received: by 2002:a05:6e02:1521:b0:416:75eb:265e with SMTP id e9e14a558f8ab-4241a533155mr35929985ab.23.1758127216004;
        Wed, 17 Sep 2025 09:40:16 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.207])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5121c6b340asm4473284173.2.2025.09.17.09.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 09:40:15 -0700 (PDT)
Message-ID: <0d6bf7c7-7605-4ad6-a35c-54efc5230fb8@sifive.com>
Date: Wed, 17 Sep 2025 11:40:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Invalid build with change in PLATFORM and no clean
To: E Shattow <e@freeshell.de>, opensbi@lists.infradead.org
References: <10b584c6-9fd8-4b4f-a114-2b96a9073d20@freeshell.de>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <10b584c6-9fd8-4b4f-a114-2b96a9073d20@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_094018_701315_5B5FFDF4 
X-CRM114-Status: GOOD (  15.20  )
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

Hi,

On 2025-09-17 4:22 AM, E Shattow wrote:
> Hello,
> 
> I have narrowed down a strange behavior from U-Boot which may be worth
> sharing, related to OpenSBI.
> 
> Steps to reproduce:
> 
> 1. (OpenSBI) checkout opensbi v1.7
> 
> 2. (OpenSBI) make
> 
> 3. (OpenSBI) make PLATFORM=generic
> 
> when U-Boot v2025.10-rc4 links to opensbi:
> 4. (U-Boot) make starfive_visionfive2_defconfig:
> 5. (U-Boot) make OPENSBI=/path/to/fw_payload.bin
> 
> the result of U-Boot `reset` command is:
> 
> StarFive # reset
> 
> resetting ...
> 
> System reset not supported on this platform
> 
> ### ERROR ### Please RESET the board ###
> 
> 6. (OpenSBI) make PLATFORM=generic clean ; make PLATFORM=generic
> 
> 7. (U-Boot) make OPENSBI=/path/to/fw_payload.bin
> 
> result of U-Boot `reset` command is normal, system resets and does not
> complain.
> 
> Can this be improved in the OpenSBI build system?  It is difficult to
> figure out that OpenSBI needs a make clean from the symptom;  I thought
> that it might be some devicetree property or unknown in U-Boot, but
> after hours trying to git bisect U-Boot that was not it at all, it's the
> dependency tracking in OpenSBI build system not catching the change in
> PLATFORM.

I have previously sent a patch that should fix this issue:

https://lore.kernel.org/opensbi/20240903205345.2088737-1-samuel.holland@sifive.com/

But unfortunately it is still waiting to be merged.

Regards,
Samuel


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
