Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8C7CA1011
	for <opensbi@archiver.kernel.org>; Wed,  3 Sep 2025 01:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N/0lVtNddrfQSxJbgkGEfNM5cjottUO9DWdav5dTLvQ=; b=1p+Dyt83l473JT
	oUgJ0+NCRdXkEf9RglkluNWrrLPPvkJfNM7i3te7kwA4DMivoJQikGGfEb+78dNt1pp1qe0UQWEOY
	2fXsdVfjJPclr67ontl8ZO8GFCpuRutnrU7sgS5Ml6K49EjddWnOTfEfKabzbmuSNAQSjSTAyjh3Y
	p0OajZ3D78Uvdgz6bqjS723qWnTWuJjlrWum6lQBv2ZXb0HOrNNUVprxgtCSFSHAJuvteathcWDw2
	aQZWUgzoHj/AyOa1FBNo3YOGH0N/pOkFALH7YeuLns45D2J5SHQYueOyxif9G+hLT3ynd6OUFU3Ym
	IoqbG5u9q178uGgW/xbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utcj2-000000038qj-36MO;
	Wed, 03 Sep 2025 01:55:52 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utaoc-00000002gAz-2ke1
	for opensbi@lists.infradead.org;
	Tue, 02 Sep 2025 23:53:31 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-88470af157aso84464639f.3
        for <opensbi@lists.infradead.org>; Tue, 02 Sep 2025 16:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1756857210; x=1757462010; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=spspcifyGaMb1A9wvxbQGEKQD3xFg0hm0cjhl9WfaAI=;
        b=ndh4wf9tPSIQ6ahXFz+vPLaODqNCJCsuxCrJ4Hl6JHmxfPj1zZSVuyCC2McSdCQ61r
         TdscJTp5qU6eV3nY4OpeKRata2dJSWx1vPlqrO2Zh9ajOEHymBgBze2OSP6PHMLzQVFr
         tcJX7wC0MAb73nGfjW5nn3P0WmvJtVcZ8YZYdoj/iIMN023cbNPA49gE3RzGt30KXqVo
         Y7xEHSxi5GzM/xCEOyynkvp6B9XcmyGu7RRw1NxQxrS49Gk8O/zW353Q+bu2oQ29ls91
         L0ZDfe2X8sdPixI9a24CTK+p4c8SkmtvCwHbaNBS+xqG0w/LjX0jja1i1RiTpLDCPK72
         pseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756857210; x=1757462010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=spspcifyGaMb1A9wvxbQGEKQD3xFg0hm0cjhl9WfaAI=;
        b=jVrIKAguk7ZU6J0Uok4+AovwN0GkRpH1vJSFLk50ie2OBWUqa3gek8b736dsAkhJYL
         HkTgT5H4sUCwDayl8XjPStQEZndP//Nr5iesChVZ9F4LbpNaadlyyrNfFk7Z4roogSni
         7TvdGdtnLEbAc4rUKMNR1XdG4KYcoYDfHSL0htQ5uMaRBpKUdl2nBjnLc5JwDukbFOVA
         onrxi1dJbOH04/dFHLAlZO4McRKxIjLArw7bB9EKe+udkJ0xSfKGh1AvTWOfI0BmBOqh
         LLL8oBpAubIPEkup1mArR3Z6bwX8gQjgYGlDnJYDkZDznNYClqZ3w/o3Quw1+bPfMTd0
         hV1A==
X-Forwarded-Encrypted: i=1; AJvYcCUgc5tamLIXMugrGFL7PJn9UuqohZ0oUtbLbx/ITje+e/7D8xiH4TTtHNbtbFya6CLCcRWZOw2p@lists.infradead.org
X-Gm-Message-State: AOJu0YxyC22xAvR0i8TrQv7bo8xzx1tnnObuG+yxwmWwoPbVvhYHmrRa
	drh5hIe18KnXTr4ltqf1dj4e4Qfrl2s3UjCb5n0R/+tfYJ59NZNTB3ByPd0SBI3lXOQ=
X-Gm-Gg: ASbGncts8AdiLchAsENiTFM9U08XA/DPFgnKnDPwE9H9eF6iLE0i64p1me5J3tDu+z6
	vzQ6ZfsplAmEGKMAs9SQd++3H9OxhYwOP9eo+CYEQyf9+jLKoPh8M7KRmEvEIoi1g8hAj873pJ4
	7WvjX9d7VmLt/YG7wH9YCx4KeRiK4EYTsiXLfNZbJ/rnFJw626N7zTyLkXscClXAWTAavFXAzKz
	iyAvjg34KaOhKYoZpgotJ7HjtSHL/lXK6wgHwbzbBh+ZpBzk3QfHRt8/XKMyb9PSAmJ08vc0VYx
	nTll/N/s2k8MzYvGTFO/kfysRbtq7CzPouhZuEJ8WKW6kUdPc+xeS2sBRWB24Fc09oT/vo5nNOV
	QruBl0KOgNip+gLIevcrqSwOAClc=
X-Google-Smtp-Source: AGHT+IEqJWJrZ0VAryML6f4xuuzB0eRQ+qAhnrAcC+VUMhyYq3ryYgJWL3Xn+YLknQaAmhJF5zQICA==
X-Received: by 2002:a92:ca4f:0:b0:3f6:6008:5bb4 with SMTP id e9e14a558f8ab-3f660085fb1mr8767105ab.28.1756857209798;
        Tue, 02 Sep 2025 16:53:29 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.207])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3f3e136b8f0sm45706145ab.47.2025.09.02.16.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 16:53:29 -0700 (PDT)
Message-ID: <57fd6811-971d-4601-b271-3862b6572b1f@sifive.com>
Date: Tue, 2 Sep 2025 18:53:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] lib: utils/ipi: Convert IPI drivers as early drivers
To: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 opensbi@lists.infradead.org
References: <20250902121721.401933-1-apatel@ventanamicro.com>
 <20250902121721.401933-4-apatel@ventanamicro.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20250902121721.401933-4-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_165330_703465_40F25ABB 
X-CRM114-Status: UNSURE (   8.77  )
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

On 2025-09-02 7:17 AM, Anup Patel wrote:
> The fdt_ipi_init() is already called from generic_early_init() so
> let's convert IPI drivers as early drivers.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi_utils/ipi/fdt_ipi.h      | 26 --------------------------
>  lib/utils/ipi/fdt_ipi.c              | 22 ----------------------
>  lib/utils/ipi/fdt_ipi_drivers.carray |  3 ---
>  lib/utils/ipi/fdt_ipi_mswi.c         |  2 +-
>  lib/utils/ipi/fdt_ipi_plicsw.c       |  2 +-
>  lib/utils/ipi/objects.mk             |  7 ++-----
>  platform/generic/platform.c          |  5 -----
>  7 files changed, 4 insertions(+), 63 deletions(-)
>  delete mode 100644 include/sbi_utils/ipi/fdt_ipi.h
>  delete mode 100644 lib/utils/ipi/fdt_ipi.c
>  delete mode 100644 lib/utils/ipi/fdt_ipi_drivers.carray

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
