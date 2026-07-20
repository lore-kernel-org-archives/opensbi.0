Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC17CC44527
	for <opensbi@archiver.kernel.org>; Mon, 20 Jul 2026 10:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cGOczpeGMkzLsD+dPrARi9sQlWCY/BLtNaiIv4bjxTk=; b=gUVFjghrcsPkts
	f62FE33ZIqPmbApIQgTfI/WOGbfndJcCQg19qXKK+pMCD59wadDHtxxZub/l+YnSYwPrzKJupkFZl
	veVsnuxYOkqXGpeND0kUinoBF6wLVm9ZmjzNCak9F4Rlb7TsnbHrkqCMloo+x6L9BqVI7BfVf6XIj
	NGsjyffYsggHpSTNo6KUBsjiqQvas6E17BCTOTQz0cuhjtImg8oK7sIaHFjpOIqOoZsmt4mj0aSrJ
	PHgmRzdpV39GMSWdYKfW//SSALm1lx18O+MK426ItMlJaMv/LwihvpjoGkShJbzstXCKr3GZX/355
	rGbJOsblpmDDwbZ0TOgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkxK-00000006SDC-018M;
	Mon, 20 Jul 2026 10:10:38 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkxH-00000006SCg-3PqV
	for opensbi@lists.infradead.org;
	Mon, 20 Jul 2026 10:10:37 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8423f236418so4974457b3a.1
        for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 03:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1784542235; x=1785147035; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nt+pRmGJTq3skth4jgbmUMouQ7267GgQgQPIpXIge6w=;
        b=YDEzqdlcvxisPAzHAU3LH6ZpITYEOK3XB92KkLMKsH/0BML0IyOpnuzcArPU2WzU55
         q2rlN/3OvokvhyecfNltAEdHz9RdboQXQcZs2rpfVV/N7Y5DWr5rMVpsczP6SBtCyWOX
         Lfw7CQg7/OAVUTyqwVWv60VRle7OB6LlTG6evkFevxUpizwXVCmtZGns3HyujdJkE8cY
         G56RCk+zSSZX5znZmSHHeAY2r0lRpSvKJyGmkp213pISGtB3RFc/b4KK/acTSqhz4dJe
         ZFGYN6OpBLQ8/xQrwBuEn3sjJSrTHQrif7PxSHixc2zcJeWR0fDhorGM3rE82ISzGR0L
         nY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784542235; x=1785147035;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nt+pRmGJTq3skth4jgbmUMouQ7267GgQgQPIpXIge6w=;
        b=Y6CIHUGrRnGZw7/01wLrO9lQGHX9Jz34KDCkT1g1V0DQt3RgqywCmWQI+h4Hl9PoQl
         vNKdBevvGkyvKXO5KLekL2WNQvDP4MmY3Lmja9sTyWZwpqsaWG4j+K4lnPr7sK/ni4+1
         CO3QHiRg5YJVj6SGilJW+OzpNPmrqHoaLR1/vM5U9FJ53rUxJj4pIqINhv+vonGTamGf
         7tJMM+Q6eUqqCm7BmGOiRPN4v8bHJuW7b/0hkPzSpMdIGvBvEcb6rfUN5kISxE8FgLj4
         F0UyaVsVT2mlEZUx1M3DFvS+NOWmMBluBcUQ3UaRiKU5NHuw+DLSM2QVz2uG/n07xas4
         wMDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrb8MLqD+tV63V9ESHTLvnr8lH5slghDYMD79a7JvHLzZTHKHVkmPTFWshAIcAnxj0bHtIb76IY@lists.infradead.org
X-Gm-Message-State: AOJu0YyqSog3a7WQh2qTazZXKb41OUj7wDbomA4AxkhcemEul531b9KA
	uzGrjcPTXlf6qy6qkWDG0Je7jO1AIzOyVc96JY5+6V1iZ70pOTT0lYj/JIFMOUa03pQ=
X-Gm-Gg: AfdE7ck46QI09XAV4oG601oryd96hROEjK9lnQds7V97tTZRJqYqI+MGxCzwu4iqXHO
	jZfXgg2H7D36qVB46PRgULCMufFjtd8MH8yzMqxGmWvaCQqANfN7O/USNbqjFFVNq+jdg0e217v
	9pMKbZoW0ssFLiSyvCtlOCzq411h5vvR862iA2vrFKTDgMvHbOwJa3T1kTKDnH8aJzkha+tSX2V
	KPcm9v0DVxjPRx+ZXMQCIPcKMeENC7XRdXIMAeINej5ZJv1mjHzWCmTDikZw34fREXUKCXrpMm2
	gthOMpqTV2VZdJqYcrWnKUOcnkVf69AgUsz92GBLstfFtEkm0z6RlDBLPBd3JtQ9GEqDsnPU7Xp
	AdHkk1E1nbu8/z9Uy74fsETEAvwsdnZlMfkdVAwU2/avYf6caPmWJtO381/5N5JtIqyThMkY484
	b2
X-Received: by 2002:a05:6a00:887:b0:847:8d2d:713c with SMTP id d2e1a72fcca58-84c295016f5mr12681268b3a.50.1784542234823;
        Mon, 20 Jul 2026 03:10:34 -0700 (PDT)
Received: from plin-1878 ([136.226.240.191])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcaa0bsm5414530b3a.20.2026.07.20.03.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:10:34 -0700 (PDT)
Date: Mon, 20 Jul 2026 18:10:29 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
	raymondmaoca@gmail.com, zong.li@sifive.com, jim.shu@sifive.com,
	pawandeep.oza@oss.qualcomm.com
Subject: Re: [PATCH 4/5] lib: sbi: Extend hart protection abstraction to
 allow ID configuration
Message-ID: <al30Fax18B3Ev/qS@plin-1878>
References: <20260717074413.2536416-1-anup.patel@oss.qualcomm.com>
 <20260717074413.2536416-5-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260717074413.2536416-5-anup.patel@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_031035_879217_4A9A4CED 
X-CRM114-Status: GOOD (  23.76  )
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

Hi Anup and Raymond,

On Fri, Jul 17, 2026 at 01:14:12PM +0530, Anup Patel wrote:
> There are various ID configuration ISA extensions such as RISC-V Worlds,
> Supervisor domain ID, QoS ID, etc which need to be re-configured upon
> domain context switch on a hart. Extend hart protection abstraction to
> support both memory protection and ID configuration ISA extensions.

I will rework my "[RFC,00/12] Add RISC-V Worlds ISA support to OpenSBI"
series based on this series.

Thanks,
Peter Lin

> 
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> ---
>  include/sbi/sbi_hart_protection.h | 16 +++++-
>  lib/sbi/sbi_hart_pmp.c            |  2 +
>  lib/sbi/sbi_hart_protection.c     | 94 ++++++++++++++++++++++++++-----
>  lib/sbi/sbi_init.c                |  2 +-
>  platform/generic/eswin/eic770x.c  |  1 +
>  5 files changed, 98 insertions(+), 17 deletions(-)
> 
> diff --git a/include/sbi/sbi_hart_protection.h b/include/sbi/sbi_hart_protection.h
> index 5e170f05..1358b5be 100644
> --- a/include/sbi/sbi_hart_protection.h
> +++ b/include/sbi/sbi_hart_protection.h
> @@ -13,6 +13,13 @@
>  struct sbi_scratch;
>  struct sbi_domain;
>  
> +/** Different types of hart protection mechanisms */
> +enum sbi_hart_protection_type {
> +	SBI_HART_PROTECTION_TYPE_MEMORY = 0,
> +	SBI_HART_PROTECTION_TYPE_ID,
> +	SBI_HART_PROTECTIOn_TYPE_MAX
> +};
> +
>  /** Representation of hart protection mechanism */
>  struct sbi_hart_protection {
>  	/** List head */
> @@ -21,6 +28,9 @@ struct sbi_hart_protection {
>  	/** Name of the hart protection mechanism */
>  	char name[32];
>  
> +	/** Type of the hart protection mechanism */
> +	enum sbi_hart_protection_type type;
> +
>  	/** Ratings of the hart protection mechanism (higher is better) */
>  	unsigned long rating;
>  
> @@ -40,11 +50,11 @@ struct sbi_hart_protection {
>  };
>  
>  /**
> - * Get the best hart protection mechanism
> + * Get the best hart memory protection mechanism
>   *
> - * @return pointer to best hart protection mechanism
> + * @return pointer to best hart memory protection mechanism
>   */
> -struct sbi_hart_protection *sbi_hart_protection_best(void);
> +struct sbi_hart_protection *sbi_hart_memory_protection_best(void);
>  
>  /**
>   * Register a hart protection mechanism
> diff --git a/lib/sbi/sbi_hart_pmp.c b/lib/sbi/sbi_hart_pmp.c
> index 5ede3cc1..c0a4ce1b 100644
> --- a/lib/sbi/sbi_hart_pmp.c
> +++ b/lib/sbi/sbi_hart_pmp.c
> @@ -425,6 +425,7 @@ static void sbi_hart_pmp_unconfigure(struct sbi_scratch *scratch,
>  static struct sbi_hart_protection pmp_protection = {
>  	.name = "pmp",
>  	.rating = 100,
> +	.type = SBI_HART_PROTECTION_TYPE_MEMORY,
>  	.configure = sbi_hart_oldpmp_configure,
>  	.unconfigure = sbi_hart_pmp_unconfigure,
>  };
> @@ -432,6 +433,7 @@ static struct sbi_hart_protection pmp_protection = {
>  static struct sbi_hart_protection epmp_protection = {
>  	.name = "epmp",
>  	.rating = 200,
> +	.type = SBI_HART_PROTECTION_TYPE_MEMORY,
>  	.configure = sbi_hart_smepmp_configure,
>  	.unconfigure = sbi_hart_pmp_unconfigure,
>  	.map_range = sbi_hart_smepmp_map_range,
> diff --git a/lib/sbi/sbi_hart_protection.c b/lib/sbi/sbi_hart_protection.c
> index fecefde8..d31e9938 100644
> --- a/lib/sbi/sbi_hart_protection.c
> +++ b/lib/sbi/sbi_hart_protection.c
> @@ -10,12 +10,16 @@
>  
>  static SBI_LIST_HEAD(hart_protection_list);
>  
> -struct sbi_hart_protection *sbi_hart_protection_best(void)
> +struct sbi_hart_protection *sbi_hart_memory_protection_best(void)
>  {
> -	if (sbi_list_empty(&hart_protection_list))
> -		return NULL;
> +	struct sbi_hart_protection *pos;
>  
> -	return sbi_list_first_entry(&hart_protection_list, struct sbi_hart_protection, head);
> +	sbi_list_for_each_entry(pos, &hart_protection_list, head) {
> +		if (pos->type == SBI_HART_PROTECTION_TYPE_MEMORY)
> +			return pos;
> +	}
> +
> +	return NULL;
>  }
>  
>  int sbi_hart_protection_register(struct sbi_hart_protection *hprot)
> @@ -74,33 +78,97 @@ static void __hart_protection_unconfigure(struct sbi_scratch *scratch,
>  int sbi_hart_protection_configure(struct sbi_scratch *scratch,
>  				  struct sbi_domain *dom)
>  {
> -	return __hart_protection_configure(scratch, sbi_hart_protection_best(), dom);
> +	bool do_configure, memory_protect_done = false;
> +	struct sbi_hart_protection *hprot;
> +	int ret;
> +
> +	sbi_list_for_each_entry(hprot, &hart_protection_list, head) {
> +		do_configure = false;
> +		switch (hprot->type) {
> +		case SBI_HART_PROTECTION_TYPE_MEMORY:
> +			do_configure = !memory_protect_done;
> +			memory_protect_done = true;
> +			break;
> +		case SBI_HART_PROTECTION_TYPE_ID:
> +			do_configure = true;
> +			break;
> +		default:
> +			break;
> +		}
> +		if (!do_configure)
> +			continue;
> +
> +		ret = __hart_protection_configure(scratch, hprot, dom);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
>  }
>  
>  void sbi_hart_protection_unconfigure(struct sbi_scratch *scratch,
>  				     struct sbi_domain *dom)
>  {
> -	__hart_protection_unconfigure(scratch, sbi_hart_protection_best(), dom);
> +
> +	bool do_unconfigure, memory_protect_done = false;
> +	struct sbi_hart_protection *hprot;
> +
> +	sbi_list_for_each_entry(hprot, &hart_protection_list, head) {
> +		do_unconfigure = false;
> +		switch (hprot->type) {
> +		case SBI_HART_PROTECTION_TYPE_MEMORY:
> +			do_unconfigure = !memory_protect_done;
> +			memory_protect_done = true;
> +			break;
> +		case SBI_HART_PROTECTION_TYPE_ID:
> +			do_unconfigure = true;
> +			break;
> +		default:
> +			break;
> +		}
> +		if (!do_unconfigure)
> +			continue;
> +
> +		__hart_protection_unconfigure(scratch, hprot, dom);
> +	}
>  }
>  
>  int sbi_hart_protection_reconfigure(struct sbi_scratch *scratch,
>  				    struct sbi_domain *current_dom,
>  				    struct sbi_domain *next_dom)
>  {
> -	struct sbi_hart_protection *hprot = sbi_hart_protection_best();
> +	bool do_reconfigure, memory_protect_done = false;
> +	struct sbi_hart_protection *hprot;
>  	int ret;
>  
> -	__hart_protection_unconfigure(scratch, hprot, current_dom);
> -	ret = __hart_protection_configure(scratch, hprot, next_dom);
> -	if (ret)
> -		return ret;
> +	sbi_list_for_each_entry(hprot, &hart_protection_list, head) {
> +		do_reconfigure = false;
> +		switch (hprot->type) {
> +		case SBI_HART_PROTECTION_TYPE_MEMORY:
> +			do_reconfigure = !memory_protect_done;
> +			memory_protect_done = true;
> +			break;
> +		case SBI_HART_PROTECTION_TYPE_ID:
> +			do_reconfigure = true;
> +			break;
> +		default:
> +			break;
> +		}
> +		if (!do_reconfigure)
> +			continue;
> +
> +		__hart_protection_unconfigure(scratch, hprot, current_dom);
> +		ret = __hart_protection_configure(scratch, hprot, next_dom);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	return 0;
>  }
>  
>  int sbi_hart_protection_map_range(unsigned long base, unsigned long size)
>  {
> -	struct sbi_hart_protection *hprot = sbi_hart_protection_best();
> +	struct sbi_hart_protection *hprot = sbi_hart_memory_protection_best();
>  
>  	if (!hprot || !hprot->map_range)
>  		return 0;
> @@ -110,7 +178,7 @@ int sbi_hart_protection_map_range(unsigned long base, unsigned long size)
>  
>  int sbi_hart_protection_unmap_range(unsigned long base, unsigned long size)
>  {
> -	struct sbi_hart_protection *hprot = sbi_hart_protection_best();
> +	struct sbi_hart_protection *hprot = sbi_hart_memory_protection_best();
>  
>  	if (!hprot || !hprot->unmap_range)
>  		return 0;
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index d74dc67c..3f1f136a 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -93,7 +93,7 @@ static void sbi_boot_print_general(struct sbi_scratch *scratch)
>  	sbi_printf("Platform Features           : %s\n", str);
>  	sbi_printf("Platform HART Count         : %u\n",
>  		   sbi_platform_hart_count(plat));
> -	hprot = sbi_hart_protection_best();
> +	hprot = sbi_hart_memory_protection_best();
>  	sbi_printf("Platform HART Protection    : %s\n",
>  		   (hprot) ? hprot->name : "---");
>  	idev = sbi_ipi_get_device();
> diff --git a/platform/generic/eswin/eic770x.c b/platform/generic/eswin/eic770x.c
> index da4d0e34..c71198a8 100644
> --- a/platform/generic/eswin/eic770x.c
> +++ b/platform/generic/eswin/eic770x.c
> @@ -470,6 +470,7 @@ static void eswin_eic7700_pmp_unconfigure(struct sbi_scratch *scratch,
>  static struct sbi_hart_protection eswin_eic7700_pmp_protection = {
>  	.name = "eic7700_pmp",
>  	.rating = -1UL,
> +	.type = SBI_HART_PROTECTION_TYPE_MEMORY,
>  	.configure = eswin_eic7700_pmp_configure,
>  	.unconfigure = eswin_eic7700_pmp_unconfigure,
>  };

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
