Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07401CA1009
	for <opensbi@archiver.kernel.org>; Wed,  3 Sep 2025 19:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HdOcPNA4g9lXGXpsMWYrIyDQxxPqpIqUaAeb9mrWgpQ=; b=0K6Icq70p/ga7N
	LTv2XON2o0i7BjCQ9RVtGT92RZNXCWBvvnEFa2Jl8QCWNMW3UR1mRBW0aAurHEsTYdn++yZ6Ef3mT
	ryv4AcWshAf4KZgkqgAn2q8ag+N/eBXio2iBC4lk4wAP9tyiG791ua1zLnm9c8qFVHL2m5Rpz9zNv
	8qtAX7G+/RIDHh9wuYoqB0/pg800k9Z3rm/XmanUn1YFMiHjrAh31HkqtpWL7CWDXXpFLNLWX9ryj
	Tt82P34nkChSEkUOPr2XL985APBKNUbjfzuCe49MoTN9LeiF3awy5wPZUvbn89N+Y3ugjOdpSOwGY
	75YbMUAmhYBADbcvYa0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uttZ7-00000007Ue1-2CEo;
	Wed, 03 Sep 2025 19:54:45 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utouG-00000006oMV-2ZQk
	for opensbi@lists.infradead.org;
	Wed, 03 Sep 2025 14:56:17 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-88432cbdb8bso71214839f.0
        for <opensbi@lists.infradead.org>; Wed, 03 Sep 2025 07:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1756911375; x=1757516175; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NH+oqANO6mNbjuIGUvzHpMxELYLproktU+aNd15O5jo=;
        b=Z3T6VvHUU1KOfEU4Hjji66iF1qE0MER6wTV1altrEvgOGJFU4OGzF4YQw0krbWc0C8
         VkETlPmS/vQQ5X53TbSoRn7W7QA1Uloj3bVDO3h9zok+hgJhxeQhM9YTNd0BwkfxXFTe
         a7Ndnq0PIE5q5DU/ldfdmgcLjiEZVTsjEm89vixSCwrG41DgV1mDsfY4VgRLSRCEM672
         OfGejQ1pOL+HBQ6WQZmbwdeLBDSLnXVITox9W1bxt5fnW4n9DKnKiyPzILVbJpxjztFg
         4knYkTQVOVJtzslncarf7l9ZeAIXVwvrezSzBb6Sg1r83hHzUEAuG1MtVoGIgb+MR/zp
         vASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756911375; x=1757516175;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NH+oqANO6mNbjuIGUvzHpMxELYLproktU+aNd15O5jo=;
        b=RkvUT5UD0BdKdqo4WzLSMg2aTmCiVoZ+BPuKG1im0cWJy6/TgWzfLzMV/R2LxQoFj0
         dT2O5Qv2kwq2Ql81Vrqn2GlqctGFYcBC5MPbGw2c39Wubc2eaL52AlO3Utzh/u4NeAb7
         /eQFuTMixOSMJNjeLNeA/COxA80WHQOxgyTW8dxnlADkcv6epxWmrUoN2MONeZCfByrK
         uuq/njzUF3fdBOkP+9vVPJWOzBO/pkaB/swkf20lR2IZZczi332QVY82T6l2YRPoVCgz
         zb8WboCb4LCDl5NMDLwow9wDlpZ5amq23RjqgYvU48f7al+5ozdukPhOfOzUB5XT322n
         A92A==
X-Forwarded-Encrypted: i=1; AJvYcCUqDJfDASHz9uDL3tzq63cOrME87+reqQJp9n/mv4+Au/SCZmrJTqWOIQnCot80Yr91y8Oh0+w2@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5iq4kFVHoxnAVHd2qwpkLsLP3kGHJa3qzxojcKKVGb8ue3i6B
	v6BQvamWRpAStHu4mJ5QcLNLnt37xoM40mZhg8sKdqemnGCeKXSCrhk5ncv+i8JxD7E=
X-Gm-Gg: ASbGncvFDxRCbpRDFjbVaG1RiUwJ0DFtIS1bZ1CTjGiOhQG+dJOLZYZ0uO/Ii0bCdAc
	r7UMwVZmnY2NHEvC6J0HO90G5HWJHn21kNbn41x23534T7eI5hoqHwBymFdRSI61u14mMXRXT7X
	rlIgMiYlsZcjlI9jy0INPrzeIzktTOfBbmH3kYs7NbslH21teY1mHb2D6j8XSL3u37PhP2hQuXv
	0qV+djRoha1bvFaXgCUBY5lmWdmR1vdJcBCQ8TROvRexgfD2GTpU6PATZ104GT/mCOGQaO9jYip
	wuXjZR33WBJA/CHEji75mdlYSLbnFAxgOgXSBJ5qjcJsdn+8sXwinJmGBl/UT/rwZCJgTuMvpfe
	v7NK8e1gEJ9MzRCY3Z3NAYc+xRuEGDZFzuN5T2eg=
X-Google-Smtp-Source: AGHT+IEHl6Gtlx1KLmd6/9pM9RdWPSAdaUU/a73ysQqxcegRoNs3Et0387TCraAW5aDox5P1ZCZoFQ==
X-Received: by 2002:a05:6e02:3a06:b0:3f0:b1ba:f72e with SMTP id e9e14a558f8ab-3f4021c42d0mr283372885ab.25.1756911371361;
        Wed, 03 Sep 2025 07:56:11 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.207])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50d8f0a47fasm4126726173.17.2025.09.03.07.56.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 07:56:11 -0700 (PDT)
Message-ID: <ed3fa059-1085-47c0-a441-7515a8bb069f@sifive.com>
Date: Wed, 3 Sep 2025 09:56:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] lib: sbi: Introduce IPI device rating
To: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 opensbi@lists.infradead.org
References: <20250903065220.456955-1-apatel@ventanamicro.com>
 <20250903065220.456955-2-apatel@ventanamicro.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20250903065220.456955-2-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_075616_678450_640F5CA8 
X-CRM114-Status: GOOD (  26.32  )
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

On 2025-09-03 1:52 AM, Anup Patel wrote:
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
>  include/sbi/sbi_ipi.h        |  5 ++++-
>  lib/sbi/sbi_init.c           |  2 +-
>  lib/sbi/sbi_ipi.c            | 41 ++++++++++++++++++++++++++++++------
>  lib/utils/ipi/aclint_mswi.c  |  1 +
>  lib/utils/ipi/andes_plicsw.c |  1 +
>  lib/utils/irqchip/imsic.c    |  1 +
>  6 files changed, 42 insertions(+), 9 deletions(-)
> 
> diff --git a/include/sbi/sbi_ipi.h b/include/sbi/sbi_ipi.h
> index 62d61304..620a95cf 100644
> --- a/include/sbi/sbi_ipi.h
> +++ b/include/sbi/sbi_ipi.h
> @@ -23,6 +23,9 @@ struct sbi_ipi_device {
>  	/** Name of the IPI device */
>  	char name[32];
>  
> +	/** Ratings of the IPI device (higher is better) */
> +	unsigned long rating;
> +
>  	/** Send IPI to a target HART index */
>  	void (*ipi_send)(u32 hart_index);
>  
> @@ -87,7 +90,7 @@ void sbi_ipi_process(void);
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
> index 2de459b0..d7ba1902 100644
> --- a/lib/sbi/sbi_ipi.c
> +++ b/lib/sbi/sbi_ipi.c
> @@ -15,9 +15,11 @@
>  #include <sbi/sbi_domain.h>
>  #include <sbi/sbi_error.h>
>  #include <sbi/sbi_hart.h>
> +#include <sbi/sbi_heap.h>
>  #include <sbi/sbi_hsm.h>
>  #include <sbi/sbi_init.h>
>  #include <sbi/sbi_ipi.h>
> +#include <sbi/sbi_list.h>
>  #include <sbi/sbi_platform.h>
>  #include <sbi/sbi_pmu.h>
>  #include <sbi/sbi_string.h>
> @@ -32,8 +34,14 @@ _Static_assert(
>  	"type of sbi_ipi_data.ipi_type has changed, please redefine SBI_IPI_EVENT_MAX"
>  	);
>  
> +struct sbi_ipi_device_node {
> +	struct sbi_dlist head;
> +	const struct sbi_ipi_device *dev;
> +};
> +
>  static unsigned long ipi_data_off;
>  static const struct sbi_ipi_device *ipi_dev = NULL;
> +static SBI_LIST_HEAD(ipi_dev_node_list);
>  static const struct sbi_ipi_event_ops *ipi_ops_array[SBI_IPI_EVENT_MAX];
>  
>  static int sbi_ipi_send(struct sbi_scratch *scratch, u32 remote_hartindex,
> @@ -248,7 +256,7 @@ void sbi_ipi_process(void)
>  			sbi_scratch_offset_ptr(scratch, ipi_data_off);
>  
>  	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_IPI_RECVD);
> -	sbi_ipi_raw_clear();
> +	sbi_ipi_raw_clear(false);
>  
>  	ipi_type = atomic_raw_xchg_ulong(&ipi_data->ipi_type, 0);
>  	ipi_event = 0;
> @@ -283,10 +291,19 @@ int sbi_ipi_raw_send(u32 hartindex)
>  	return 0;
>  }
>  
> -void sbi_ipi_raw_clear(void)
> +void sbi_ipi_raw_clear(bool all_devices)
>  {
> -	if (ipi_dev && ipi_dev->ipi_clear)
> -		ipi_dev->ipi_clear();
> +	struct sbi_ipi_device_node *entry;
> +
> +	if (all_devices) {
> +		sbi_list_for_each_entry(entry, &ipi_dev_node_list, head) {
> +			if (entry->dev->ipi_clear)
> +				entry->dev->ipi_clear();
> +		}
> +	} else {
> +		if (ipi_dev && ipi_dev->ipi_clear)
> +			ipi_dev->ipi_clear();
> +	}
>  
>  	/*
>  	 * Ensure that memory or MMIO writes after this
> @@ -307,10 +324,20 @@ const struct sbi_ipi_device *sbi_ipi_get_device(void)
>  
>  void sbi_ipi_set_device(const struct sbi_ipi_device *dev)

Maybe this should be renamed to sbi_ipi_add_device(), since we can now track
more than one device.

>  {
> -	if (!dev || ipi_dev)
> +	struct sbi_ipi_device_node *entry;
> +
> +	if (!dev)
> +		return;
> +
> +	entry = sbi_zalloc(sizeof(*entry));
> +	if (!entry)
>  		return;
> +	SBI_INIT_LIST_HEAD(&entry->head);
> +	entry->dev = dev;
> +	sbi_list_add_tail(&entry->head, &ipi_dev_node_list);

Why not put the list node directly in `struct sbi_ipi_device`, instead of using
a separate allocation? Or is there a reason why that would not work?

Regards,
Samuel

>  
> -	ipi_dev = dev;
> +	if (!ipi_dev || ipi_dev->rating < dev->rating)
> +		ipi_dev = dev;
>  }
>  
>  int sbi_ipi_init(struct sbi_scratch *scratch, bool cold_boot)
> @@ -347,7 +374,7 @@ int sbi_ipi_init(struct sbi_scratch *scratch, bool cold_boot)
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
