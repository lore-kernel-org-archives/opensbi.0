Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51366CFC518
	for <opensbi@archiver.kernel.org>; Sun, 23 Nov 2025 09:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rzEjL4UkDHF812j6aHUElazS1Ai4YwOWksfJpvkfltg=; b=swVRJRpjh+UcUSqP1WkamnVBr6
	XLMLsUEAvfzhVAilvUjaZhjSJLtkTes/ptTM007sz2bTWoPxv0ADHKlKdlA35Z6zwvtqfj9mWTpqt
	Jm79DVflSLD0ywGQk3AgaMk8RlFbq7nVqfgJhaTJ/t1fri6P8y24CZpYT9BK+2+44hqiEvkZc1dlq
	I0JUNT3XcEzMIy3sCC7wOwRLlgifn/FdJ8d2EqmRJMgpt/MujRKVdEIOxvFVi8l9kxDE40JAnnEpE
	yfVVgy+HacWH8c86cX1Pojy3s3HEnA5J6iXQPPgcZHNe4WaclpLJ+btr4dWhfUorkXVKFlzUkYXt5
	D7AcWCZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN5yJ-0000000AHpK-0bio;
	Sun, 23 Nov 2025 09:01:27 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN5yF-0000000AHoo-3pTb
	for opensbi@lists.infradead.org;
	Sun, 23 Nov 2025 09:01:25 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-bbf2c3eccc9so2217445a12.0
        for <opensbi@lists.infradead.org>; Sun, 23 Nov 2025 01:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1763888483; x=1764493283; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VLed1vjmNZZ83Leal/LSW1x59LX7+R/oWzGKkxnungY=;
        b=dK6p3T3Ipb1w3k4iR+UZDY+Ygm80nFURpcePim+jRvwSgJ3hZ7WjpMJrOenHcmEDkl
         WUcYokMeqsYzKHEPttvn/GSV+AHA5FSK5XZ46YARN2Hyq2nEsyOXmLrRlZsMNP+JFAQs
         tPcOy3x5+qH3tUTtm0hU1XVNx7gXD6Cj0OrC8QeMmZJCLIniE65XsFVJvIuPjRqB0Lm3
         auvFeyw6ZvEkYphv2PURGWrbHLsSxkMW/B4fgG1tMTGpXmtLS9z0G5SKMG5pkMCvUVkS
         cNMYROtBSZFR+WFwGzWKI3ui9yVvHvrrzZ6dLl3Hik3cmWlJ9sXmGqCj8Pu2r6U0sM1l
         k6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763888483; x=1764493283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VLed1vjmNZZ83Leal/LSW1x59LX7+R/oWzGKkxnungY=;
        b=hU8Z8VAameRNjqQuviC80LVDUGvT5gzzbELTJnn4l7ovU+GOJogKIlQUpSjb7pTlO3
         ah/zuySkIX2ElKFQP1O2XhLLk+XtSdwgivKIAwP+C65SvrKcw7WURL4CPSsTpN84nsYj
         Hh+hZzphhUW2Ixg3pRxvhHUS8B2kniFHO+6d2upIf2ArZjwqohERGzYlfb8TUlhukTCb
         UldubIGuu6PQH1xn8uO2JRnpAi5s867AFgIGDSyySDv/I9W75k0MAvbEbBCmKYTZJvnf
         U7U0KWayK+I/CNZJRndHNK/3dgn1U6Scnkrhy+wFKs02zp2dhS6W/mFwrtm+GNy8CsFk
         CfHg==
X-Forwarded-Encrypted: i=1; AJvYcCXgOmyGYyr/XhAo/0usW2Wkxz823nlcRh6EhuwC7I2guva/+U75hWTrkCCqz3sGt16fa9Q80sxr@lists.infradead.org
X-Gm-Message-State: AOJu0YwQhqPMieZ1pXki3dBY6c+1v7ScQ3U2COl70fn0V8av+962I6fz
	vW71TCOVCENCDxUPlLRrFSZq1GpOVHu1GXV4crojkdDlDf00EdxHa415KBb/xdp8oPw=
X-Gm-Gg: ASbGnct65prig0649I2ugji08Ntolr1vwcGwDfWJxHbIvp98/Uc8CCcK9DnI99R/l2k
	wiclU3zkbyKV+wDavMRtbkCN8RV/6x6BCmRvpouBuLy4Umc/r3WEhKV+yN/Lw+H8BpE31jeAw5I
	aLc1qoUILUjiDdCTFmZTS3qk3a+dhkooe/7t0zazuyr7zS2SsVZhrMgXqT9gh2HjCgB9mXs8uyZ
	EetlPC9Ro4l1wxPrkVOGsbQMtr+xRTBoivEsKSvsqicsAF9stRc8Xm6L1Rl0ZgTGWjeSTIb7D37
	rz9uQaRLgXPu76zeULjH8ZeO3N/6nOyd30y4+/vas/7T9Q4psL/H8i+PC658iSjKTLqzvIwOORX
	2FxACPW+jTK/3gvrCzEIP69QjIoToOkZRVRdLJwWQJlMwzN9vjdUoR9226Luo21PoRlGVJRufCE
	iMNMmNccuesErSr71Sxj+OtCPHBkfRorqF05JvfiLRJVWQtU0+YA==
X-Google-Smtp-Source: AGHT+IFg1Cahg5GfXwFIVpWcR25GQCZZULdSLrf2sc2+XNd2+4VywlPfMJpYbouA+ufRH4eTSOutYQ==
X-Received: by 2002:a17:902:d485:b0:24b:1585:6350 with SMTP id d9443c01a7336-29b6bf1ae09mr98777575ad.11.1763888482917;
        Sun, 23 Nov 2025 01:01:22 -0800 (PST)
Received: from [172.16.0.158] (1-171-39-212.dynamic-ip.hinet.net. [1.171.39.212])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138628sm103904475ad.31.2025.11.23.01.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Nov 2025 01:01:22 -0800 (PST)
Message-ID: <8e650618-dcfd-43cf-9afc-750d1cac97d8@sifive.com>
Date: Sun, 23 Nov 2025 17:01:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] lib: utils: Use SBI_DOMAIN_MMIO to check MMIO device
 permissions
To: Samuel Holland <samuel.holland@sifive.com>, opensbi@lists.infradead.org
References: <20251121193808.1528050-1-samuel.holland@sifive.com>
 <20251121193808.1528050-3-samuel.holland@sifive.com>
Content-Language: en-US
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
In-Reply-To: <20251121193808.1528050-3-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_010123_986961_F6877F4E 
X-CRM114-Status: GOOD (  14.05  )
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
> Drivers or platforms may create memory regions with the MMIO flag set
> that contain S-mode-accessible MMIO devices. This is strictly correct
> and should be allowed, along with the existing default case of
> S-mode-accessible MMIO devices appearing in non-MMIO memory regions.
> When passed SBI_DOMAIN_MMIO, sbi_domain_check_addr() will perform the
> correct set of permission checks.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
Reviewed-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> ---
>
>   lib/utils/fdt/fdt_fixup.c             | 2 +-
>   lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c | 3 ++-
>   2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
> index f3fe8af9..b0ed20c8 100644
> --- a/lib/utils/fdt/fdt_fixup.c
> +++ b/lib/utils/fdt/fdt_fixup.c
> @@ -185,7 +185,7 @@ static void fdt_domain_based_fixup_one(void *fdt, int nodeoff)
>   		return;
>   
>   	if (!sbi_domain_check_addr(dom, reg_addr, dom->next_mode,
> -				    SBI_DOMAIN_READ | SBI_DOMAIN_WRITE)) {
> +				    SBI_DOMAIN_READ | SBI_DOMAIN_WRITE | SBI_DOMAIN_MMIO)) {
>   		rc = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + 32);
>   		if (rc < 0)
>   			return;
> diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c b/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c
> index 94a5af8c..1dcc049e 100644
> --- a/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c
> +++ b/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c
> @@ -57,7 +57,8 @@ static int mpxy_rpmi_sysmis_xfer(void *context, struct mbox_chan *chan,
>   			sys_msi_address |= ((u64)le32_to_cpu(((u32 *)xfer->tx)[2])) << 32;
>   			if (!sbi_domain_check_addr_range(sbi_domain_thishart_ptr(),
>   							 sys_msi_address, 0x4, PRV_S,
> -							 SBI_DOMAIN_READ | SBI_DOMAIN_WRITE)) {
> +							 SBI_DOMAIN_READ | SBI_DOMAIN_WRITE |
> +							 SBI_DOMAIN_MMIO)) {
>   				((u32 *)xfer->rx)[0] = cpu_to_le32(RPMI_ERR_INVALID_ADDR);
>   				args->rx_data_len = sizeof(u32);
>   				break;

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
