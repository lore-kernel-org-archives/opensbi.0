Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E63D711C4
	for <opensbi@archiver.kernel.org>; Thu, 18 Dec 2025 21:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CSAdOQM0XssoZKzNPHMdjUvoG0WT6Q2ctA1gaf2SM2A=; b=ygemBGcfurznvT
	6QTeLQdPe2qQrTd/05BAdKiIxRgeZy1+ilVShPZ3RxRlJAdjva+wMWnEFG9MAZV9hP0QVFH41FrnC
	8EG9i2UhmK4bP2p0VohGowgCiqe5ePN7CVBN7NCGntJNhrgEWzW+3QDn2+VFFakGxOSeCtUiYZ7U6
	ZcaM3H8oEpLJHnqBSSPVxCY7b6k9K8HXpAvoJUtXe8Af5QfziYOeW7gPi55rVlLiB9897IZvd4ZtW
	Kzk6CWiwpI/4p8vlbnDK1t9AHUwQWKU/CZlPX9SIAussyEodLTh1ZGfhXKnAvMr4mr0zKMDctUfGx
	te+OPTJ4qY/i4uqRqGdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWLOm-00000009Cfm-1jD6;
	Thu, 18 Dec 2025 21:19:00 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWLOj-00000009CfP-1pm4
	for opensbi@lists.infradead.org;
	Thu, 18 Dec 2025 21:18:58 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-34c213f7690so907686a91.2
        for <opensbi@lists.infradead.org>; Thu, 18 Dec 2025 13:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766092736; x=1766697536; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b4+i7PJencsgpj0AE9bv13bvSFIsTTTLQH1HjaLL200=;
        b=liN1IeERJMGnM+rqLcY0wd+DRKfpHkTUCHMuw5201nFEy1bw7SA883TjquC7kLL1Y6
         /osrAsdIk5YOjconrqM34l7U4ljQKizALbIvBYaCj+jASIxgey5nrofYyPobmNoG0EN6
         kwis3tZ/vSdWiGw5G4rFX6YndG43z7kqjckO/chtTMqIYBNbha/rLT/jLJNUA+6O91j5
         VFRLrGo5wODYs0rHNh2Yy240uStZfeudt/5HKY/wvaaF1XHTKqWtgFNZuce6494eEFQy
         Vz6DsdDWw1QTFCfmZu6JOXxTxaCX2zJ6d9lL6RNyFPT2QwVXr7NzE6+I++Ys1PbTDYP/
         EJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766092736; x=1766697536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4+i7PJencsgpj0AE9bv13bvSFIsTTTLQH1HjaLL200=;
        b=JwFvYLf6nXCzDdObQH8m1ef+1tJMlzi2FW7e8phNXiFS0rJqMqI32D01aC7AR5I/kN
         2vKy76OCcEj/2z5W+kzWI0xfPbD6Fjuna8kYAQNLgqaW5zO7HE6bPnanYrBLoP6U0Se4
         PPtjJYwMkWxhluHzHR6Uzxgdj+1Pc/y2q6bl32jbXBavZZOAPtdAEIr/9vFZR/cq0OwP
         UhkVrlvXVa36VAw4gb+VQPaoARP7w2FETt34TaatDDjMRgujQq4JxFfFa2a8vyytE7E6
         9KSG89I2aLg3cC/ZHHAbzsaUK2/8MbxWtdNSSrT4Btxxr7/MkkI0tw0f/id97itLx/MI
         VRTQ==
X-Gm-Message-State: AOJu0YwdGZP0TcZA2oJba2X0JDEsInAzxexGv9u+TYPB9com9Si+90qN
	m8fxjkFTSmCVWhSweKVcle1V4dqtPvesYlZILNmV+RJ0F56JyuxqPZxejiGehw==
X-Gm-Gg: AY/fxX75Fs3DT4uUSVzZEcVoL3Bl1NAmplUOxBzKrTllpLtFMUDmt31c/nNge6bnKRu
	SWnYpZJWQUF325KWWJBI7LPTRJCdNMxK40jgogIPRJuORLefohq0G1cF4lwNCes82Nr7oVBOE6m
	SAeYG61+wSmX5+mC1YZuqdCD+bh98z4z6xviKp0GpUEA50MLpZSKg+P906q/x0y+whrKyDfP4h5
	4gHLNsp+M0waoFNEXxowX78jN3bGC4KFVlID1nTyEUjLdAAqEEP334m/dYATnx73gFJtHweF3ad
	v/KI9RR3TlY0/o5FxnxFrq7oDMov/atBFj9SnOH98hJBE50R4dl1imo539sVQ+fGSl8EepGer6u
	ZRazgmM2sV0sX8Ua18UdLRGTFU+6c+mnckfOcNPCVahbrh5CH7VLChDV9RFAeHykigDQjNF+uLy
	tEtg8gioDNzZqK
X-Google-Smtp-Source: AGHT+IExrnNf4msieG2cUoCzQl7U/pRaag1PFtdUKYScclu7zsH5EZFNsELswxdTOi0FEPUJrcA/SA==
X-Received: by 2002:a17:90b:4c07:b0:34c:2db6:57f1 with SMTP id 98e67ed59e1d1-34e921e62b6mr514925a91.30.1766092736199;
        Thu, 18 Dec 2025 13:18:56 -0800 (PST)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d676b8sm3310867a91.8.2025.12.18.13.18.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 13:18:55 -0800 (PST)
Message-ID: <e1906c35-c28a-429b-896b-fe80920ec5f4@gmail.com>
Date: Thu, 18 Dec 2025 13:17:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] p8700: don't use AMO instructions
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 anup@brainfault.org
Cc: opensbi@lists.infradead.org
References: <20251218114705.1650842-1-vladimir.kondratiev@mobileye.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20251218114705.1650842-1-vladimir.kondratiev@mobileye.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_131857_511117_0C9B1C0B 
X-CRM114-Status: GOOD (  11.41  )
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

Why not override PLATFORM_RISCV_ISA at build time? I think this change is
going to affect the entire generic/ platform. Specifically jh7110 won't
even boot with lrsc. The Hart 0 (S7 core) only support AMO, not LR/SC,
the opposite of your p8700.

Bo

On 12/18/25 03:47, Vladimir Kondratiev wrote:
> P8700 supports LR/SC but not AMO instructions.
> Tell this to the compiler, it will in turn
> define __riscv_zalrsc and undefine __riscv_atomic
> that used in the code to generate appropriate instructions
> 
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> ---
>   platform/generic/mips/objects.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/platform/generic/mips/objects.mk b/platform/generic/mips/objects.mk
> index a08c4c632997..84e21b7995bc 100644
> --- a/platform/generic/mips/objects.mk
> +++ b/platform/generic/mips/objects.mk
> @@ -5,4 +5,5 @@
>   ifeq ($(PLATFORM_RISCV_XLEN), 64)
>   carray-platform_override_modules-$(CONFIG_PLATFORM_MIPS_P8700) += mips_p8700
>   platform-objs-$(CONFIG_PLATFORM_MIPS_P8700) += mips/p8700.o mips/mips_warm_boot.o
> +PLATFORM_RISCV_ISA = rv64imfdc_zalrsc_zicsr_zifencei
>   endif
> 
> base-commit: 111738090c6cdf2d852717b3ad15b65e2085d237


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
