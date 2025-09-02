Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982D0CA1009
	for <opensbi@archiver.kernel.org>; Wed,  3 Sep 2025 01:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aOpUATUK2+k9r72RlL9aobqC0lSCtmbqhK51rW0vvDo=; b=cBKANK65guwcj9
	eVrlzx5WS851uzNCWTRd3zR42EUtYxmE6X77UUpeD+L7G7CuLILuSLvi4eTRsk9FVeiz/0D/QK+p9
	YQclM7PuFOK0ASLdSLELkrB9GGkekPljpwYF5XjHxHwyQV0qhjFeMZvT/TzXMVtLxuaLGJd5zQ8bc
	bHzAqNpFvY77CYHYTGcPR3kEJda+96y9BD3KUBv6kzzuVldaI0BObrM8RJXFHikTwg2fqi8A2y1v2
	+Vat2/O9DQMSChz40EpAcGigwnJWu1uwZQOr3FwBvgBpau5xOxUThGalQvk9TDXdn4jhavmGzR665
	rh9c90yD59mtL2aUdGAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utcj1-000000038ol-15Qu;
	Wed, 03 Sep 2025 01:55:51 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utadN-00000002e5g-2m9l
	for opensbi@lists.infradead.org;
	Tue, 02 Sep 2025 23:41:54 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-887490f0654so82388539f.0
        for <opensbi@lists.infradead.org>; Tue, 02 Sep 2025 16:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1756856512; x=1757461312; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4vgvIdA0/PY8sANkC4yBbNjoBo+uKymCFigkQleiZwk=;
        b=kcwol4Pqx5UFscGTRy8PpSC4p5Gy/6NsZviHPS3eITLlnM8YofFD4gmRGTDHEejAXk
         hnmTiU7jFAhQyf8oCFMfl3wB2hvE/DtjYnodBs5c2dcrfuJA5ZYYAACAPvfZKoxhmWHh
         ffHtZE38gXZ3vfIwrs7N1OSqYtSZgCi7xPGC/c8PFxAKLhlFEYgtZwCaEtTtBJhUnVNx
         wJXWlYkFECExuMiHbb/S1Re/cSzBUWI4sgbGe0S2k9eUdh5yEn82mcbaUNmyNTwkdspe
         V9I5tt/iWlYlHRn+rJLiUruTmc+qOGb2zR5D+G2Jp3nlr6vedHcbmMc9/DaxgzzfjbdR
         aA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756856512; x=1757461312;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4vgvIdA0/PY8sANkC4yBbNjoBo+uKymCFigkQleiZwk=;
        b=PnjXlag+lBWYbp6yjQ2GaTNaFtStFR9otA6k+tv8727Dg/087JM5Xer3q5/BiORPzX
         456qiwzuZ7f1Xg34lWiKiYdDxnUmbHg7bxkDqrg7v1bEKT+v4/KbB6l9E1lof1PjRefu
         /RfxSGfvF75t6sNCzsGNyrZOrIlILIme3FsHgBxrkPWnws8ZIb2371jE5Vkp6JRqlLmr
         +TkUp3Qr978THTM6ul8QRm4N/KYv20LFlBa2/GJwlEFWtv+822Jbncpti5VG0VaWL7D/
         DkOGgBMzRJc9SqpKwGWs9/bHRqIXrV64IWcnBnLaLXp+RC0kmkX0rtDhHkxu37f+GgtX
         G5pQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8PtEAVhII2GC9eqgarpiy+j9xs2z7FMojD7Xc8trw90ka5zujkWuCDu4DX+lK1XoYdT6fjCGS@lists.infradead.org
X-Gm-Message-State: AOJu0YzJHAUeG7WBbAxgsHYumy2BQ6zwkz07QtfPBx/WWVUyMrWlkMI1
	+RY/Py5B/VpItIg4JWfYZVw8+FjG0f+l8QXzWf+p4ITzxCn1Bx/O6i/Lwp5N5zX4/V8=
X-Gm-Gg: ASbGncup3Rq1a7LZSJmyQ4sxMxuLcUskhjRlhSRtzGK/F0o9borclEpm/Lc7fkPplpv
	jHjKpwjEFEpBKta3qrl1HvLIgpQtMJpAABzENuJHE7bhFMCWzKq5fxz1JJ9jGvExY+i5kgsziNR
	mcbqf1XhHXjKYFlpw/rYtoYlJbpvrfGpFbCK+DKSJfszE9asoUwiROsjRxF7qBFasHWLuvuX2L5
	s0pJELWu8Om3VMCPiHqeK1IofpBilBoWSKHxHuw7LzcRdKbZAlg5bxn+BuGaS9hkd9fAN4uYBde
	uFE1jAigSXuB8Iq9Xtq3nsCTJSxUN4Jb9pKRxHTv67LM794LzLs5H5ExQCfHaUn94bBZuXkn0od
	vHC1cWpNHB3CKfZKJiKOSI2q7IvEv3XC9vNFrEGBHx+B0mJBgOw==
X-Google-Smtp-Source: AGHT+IH0EA0ISWmqXldTt+kU64fBco6eOvES0CbBUef+sodkgsPY57A/0osA+7lt4rMJ2KBqyqa6pg==
X-Received: by 2002:a05:6602:6d1b:b0:887:53c6:cb29 with SMTP id ca18e2360f4ac-88753c6cbcdmr29821339f.13.1756856512209;
        Tue, 02 Sep 2025 16:41:52 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.207])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8874c339307sm51125539f.14.2025.09.02.16.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 16:41:51 -0700 (PDT)
Message-ID: <4d4d4645-4391-4fdb-a17c-76851958e642@sifive.com>
Date: Tue, 2 Sep 2025 18:41:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] lib: sbi: Introduce IPI device rating
To: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 opensbi@lists.infradead.org
References: <20250902121721.401933-1-apatel@ventanamicro.com>
 <20250902121721.401933-2-apatel@ventanamicro.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20250902121721.401933-2-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_164153_736741_44B1EA19 
X-CRM114-Status: GOOD (  28.35  )
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

Hi Anup,

On 2025-09-02 7:17 AM, Anup Patel wrote:
> A platform can have multiple IPI devices (such as ACLINT MSWI,
> AIA IMSIC, etc). Currently, OpenSBI rely on platform calling
> the sbi_ipi_set_device() function in correct order and prefer
> the first avaiable IPI device which is fragile.
> 
> Instead of the above, introdcue IPI device rating and prefer
> the highest rated IPI device. This further allows extending
> the sbi_ipi_raw_clear() to clear all available IPI devices.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_ipi.h        |  6 +++++-
>  lib/sbi/sbi_init.c           |  2 +-
>  lib/sbi/sbi_ipi.c            | 28 ++++++++++++++++++++--------
>  lib/utils/ipi/aclint_mswi.c  |  1 +
>  lib/utils/ipi/andes_plicsw.c |  1 +
>  lib/utils/irqchip/imsic.c    |  1 +
>  6 files changed, 29 insertions(+), 10 deletions(-)
> 
> diff --git a/include/sbi/sbi_ipi.h b/include/sbi/sbi_ipi.h
> index 62d61304..0a9ae03d 100644
> --- a/include/sbi/sbi_ipi.h
> +++ b/include/sbi/sbi_ipi.h
> @@ -14,6 +14,7 @@
>  
>  /* clang-format off */
>  
> +#define SBI_IPI_DEVICE_MAX			(4)
>  #define SBI_IPI_EVENT_MAX			(8 * __SIZEOF_LONG__)
>  
>  /* clang-format on */
> @@ -23,6 +24,9 @@ struct sbi_ipi_device {
>  	/** Name of the IPI device */
>  	char name[32];
>  
> +	/** Ratings of the IPI device (higher is better) */
> +	unsigned long rating;
> +
>  	/** Send IPI to a target HART index */
>  	void (*ipi_send)(u32 hart_index);
>  
> @@ -87,7 +91,7 @@ void sbi_ipi_process(void);
>  
>  int sbi_ipi_raw_send(u32 hartindex);
>  
> -void sbi_ipi_raw_clear(void);
> +void sbi_ipi_raw_clear(bool all_devices);
>  
>  const struct sbi_ipi_device *sbi_ipi_get_device(void);
>  
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index 84a63748..663b486b 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -507,7 +507,7 @@ static void __noreturn init_warmboot(struct sbi_scratch *scratch, u32 hartid)
>  	if (hstate == SBI_HSM_STATE_SUSPENDED) {
>  		init_warm_resume(scratch, hartid);
>  	} else {
> -		sbi_ipi_raw_clear();
> +		sbi_ipi_raw_clear(true);
>  		init_warm_startup(scratch, hartid);
>  	}
>  }
> diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
> index 2de459b0..b57ec652 100644
> --- a/lib/sbi/sbi_ipi.c
> +++ b/lib/sbi/sbi_ipi.c
> @@ -32,8 +32,9 @@ _Static_assert(
>  	"type of sbi_ipi_data.ipi_type has changed, please redefine SBI_IPI_EVENT_MAX"
>  	);
>  
> -static unsigned long ipi_data_off;
> +static unsigned long ipi_data_off, ipi_dev_count;
>  static const struct sbi_ipi_device *ipi_dev = NULL;
> +static const struct sbi_ipi_device *ipi_dev_array[SBI_IPI_DEVICE_MAX];

Since the only things we do with the array are append to it and iterate over it,
can we use a linked list here so there is no arbitrary limit?

Regards,
Samuel

>  static const struct sbi_ipi_event_ops *ipi_ops_array[SBI_IPI_EVENT_MAX];
>  
>  static int sbi_ipi_send(struct sbi_scratch *scratch, u32 remote_hartindex,
> @@ -248,7 +249,7 @@ void sbi_ipi_process(void)
>  			sbi_scratch_offset_ptr(scratch, ipi_data_off);
>  
>  	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_IPI_RECVD);
> -	sbi_ipi_raw_clear();
> +	sbi_ipi_raw_clear(false);
>  
>  	ipi_type = atomic_raw_xchg_ulong(&ipi_data->ipi_type, 0);
>  	ipi_event = 0;
> @@ -283,10 +284,19 @@ int sbi_ipi_raw_send(u32 hartindex)
>  	return 0;
>  }
>  
> -void sbi_ipi_raw_clear(void)
> +void sbi_ipi_raw_clear(bool all_devices)
>  {
> -	if (ipi_dev && ipi_dev->ipi_clear)
> -		ipi_dev->ipi_clear();
> +	int i;
> +
> +	if (all_devices) {
> +		for (i = 0; i < ipi_dev_count; i++) {
> +			if (ipi_dev_array[i]->ipi_clear)
> +				ipi_dev_array[i]->ipi_clear();
> +		}
> +	} else {
> +		if (ipi_dev && ipi_dev->ipi_clear)
> +			ipi_dev->ipi_clear();
> +	}
>  
>  	/*
>  	 * Ensure that memory or MMIO writes after this
> @@ -307,10 +317,12 @@ const struct sbi_ipi_device *sbi_ipi_get_device(void)
>  
>  void sbi_ipi_set_device(const struct sbi_ipi_device *dev)
>  {
> -	if (!dev || ipi_dev)
> +	if (!dev || ipi_dev_count >= SBI_IPI_DEVICE_MAX)
>  		return;
> +	ipi_dev_array[ipi_dev_count++] = dev;
>  
> -	ipi_dev = dev;
> +	if (!ipi_dev || ipi_dev->rating < dev->rating)
> +		ipi_dev = dev;
>  }
>  
>  int sbi_ipi_init(struct sbi_scratch *scratch, bool cold_boot)
> @@ -347,7 +359,7 @@ int sbi_ipi_init(struct sbi_scratch *scratch, bool cold_boot)
>  	ipi_data->ipi_type = 0x00;
>  
>  	/* Clear any pending IPIs for the current hart */
> -	sbi_ipi_raw_clear();
> +	sbi_ipi_raw_clear(true);
>  
>  	/* Enable software interrupts */
>  	csr_set(CSR_MIE, MIP_MSIP);
> diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
> index 9e55078a..23510551 100644
> --- a/lib/utils/ipi/aclint_mswi.c
> +++ b/lib/utils/ipi/aclint_mswi.c
> @@ -62,6 +62,7 @@ static void mswi_ipi_clear(void)
>  
>  static struct sbi_ipi_device aclint_mswi = {
>  	.name = "aclint-mswi",
> +	.rating = 100,
>  	.ipi_send = mswi_ipi_send,
>  	.ipi_clear = mswi_ipi_clear
>  };
> diff --git a/lib/utils/ipi/andes_plicsw.c b/lib/utils/ipi/andes_plicsw.c
> index 5d085d85..000fe9fd 100644
> --- a/lib/utils/ipi/andes_plicsw.c
> +++ b/lib/utils/ipi/andes_plicsw.c
> @@ -61,6 +61,7 @@ static void plicsw_ipi_clear(void)
>  
>  static struct sbi_ipi_device plicsw_ipi = {
>  	.name      = "andes_plicsw",
> +	.rating    = 200,
>  	.ipi_send  = plicsw_ipi_send,
>  	.ipi_clear = plicsw_ipi_clear
>  };
> diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
> index 057b9fa7..3c150c37 100644
> --- a/lib/utils/irqchip/imsic.c
> +++ b/lib/utils/irqchip/imsic.c
> @@ -199,6 +199,7 @@ static void imsic_ipi_send(u32 hart_index)
>  
>  static struct sbi_ipi_device imsic_ipi_device = {
>  	.name		= "aia-imsic",
> +	.rating		= 300,
>  	.ipi_send	= imsic_ipi_send
>  };
>  


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
