Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2093FF8867
	for <opensbi@archiver.kernel.org>; Wed, 29 Apr 2026 08:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hSFtRpgEZDWIlfRxPZd5D/sFJNRg0wpLwDQtyTtqOZ4=; b=kQjEvYq45R+pqf
	d8EsBQ6ow2naNo6hf73rtoQDu8xDtECM2DNWlQXQCWzTCQJCMInmmr7HD7dBIswiQ1GNPsIkgLvJb
	erWCAiqqoWXpqZPI1kRdG4ez/t3Om0paRDgA//pT4T10EOM67mRsC6qigMzMLkS2eSTfYDb6uBljU
	XkZdOMcmRNm3lEsWSqb7wxg2aL3i6MDPxzBhZAmkmP9Ze6OxNDipIofvdpDAe9q6tAS+PR4DOHpv6
	BsF4xLsUvsu82WAM14909dQxVC/wNXPqBq9eh3N/NZAAGQ+x2aUuXjxNSfeh63IPnKi39G+9+7OZX
	slCpZV/9QIqQUdBiRQRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI07j-00000003EoV-1cU9;
	Wed, 29 Apr 2026 08:18:23 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI07g-00000003EoA-2Hlr
	for opensbi@lists.infradead.org;
	Wed, 29 Apr 2026 08:18:21 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ab46931cf1so4154895ad.0
        for <opensbi@lists.infradead.org>; Wed, 29 Apr 2026 01:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777450699; x=1778055499; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yvGWMptGg5AgjX1dWETWJmYOwWChjwelvi1N+EGrhVs=;
        b=el/ohSjxI87S+l5Nkd/VC3AnB5GCMa09+f+sqESkehVkBoVN37ZJ7qJljS6J7nfb+M
         GQeTM8MmdcH+iVq2Rj0uOL6k85L6PJSobn8Ilvdee/inhnhKxipUnJM1aGORw9a0l0C2
         EkAmyyyxmdtULabFo9wtSkXy3kTBpRO4lDpOm+l6Pg5cuTI8qSxsrIGMpFOOGtns7T0s
         lOXOmNQZtwt2wOycaWCSK2xD+gIfzgZTW1VRKdDh1oYEsX1xz0nEL0vBvWue8x/Ptf1s
         KdinvzHkqiViLbaj4EVSMAS4RzQvOdMJVxvnSSGvR2ji3/eBhxBmBot6KQqO4LCxrIY7
         a2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777450699; x=1778055499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yvGWMptGg5AgjX1dWETWJmYOwWChjwelvi1N+EGrhVs=;
        b=so2OPrICq7niZY1FFwM2PZG8XoMZPJSpnj5rfEzwFgrzOuuMfggruHIdSewu31ZQcx
         5mR22ZBLM8UjDHQGgw1EzNkMdx3kPsRyBvxfG0rxximIoY4XN5UL+0yPTTMuVFeOgtL8
         CwWTTUVxS471WeAx0YBeLt+hiSc5ocxOageUCEzvUpYxJF75/Gk99gB0y71pPTeWEdyI
         RVyhiaouXjp2+aFG+lCjEFFY3FcL89LO10AVdvz0cKdSCruuaQwMKkosQj/ZE7fJV4Gb
         irUj0+MHJRCBva5Fh3/+BKQjTZTXaIz4xSR9OZ4LLtpIxk+V6JjOgjiVqSuZ8y/1hNiM
         rCMg==
X-Forwarded-Encrypted: i=1; AFNElJ+J+bUan4uAARZrrm/WdWRybG1FrNydreInDUuzkI9LdHISwgMJHO5pPc9y5RofH85u6Tbq3k/I@lists.infradead.org
X-Gm-Message-State: AOJu0YyfHP+MeJDDwfx1ALeLtOUFAwWFFawtSKIBqNaelv6gCoXSaodx
	Xfd+bybXVLLmN/mJ1yDZEXrVMY+84bToDxYN3J/gxg509Y/ztEGE7eqv
X-Gm-Gg: AeBDievOZuIgX1YHaRA3G4jODB9ezoHaAjwn8joy/yL0iqjHh1pRmIaIKyD37kJIsv5
	mc3yYp7mBQfWbTpkEklb6/nYB538hb4VmBOCdgkkOcpekAE6TjsQIFE9sIl9YoBTpcQLxSmtQDk
	tWpHax/ih+1E5gxdOgb0kwl4NzDWffJVoEmDGNUau7ptzvq65K7CvQZh1SAvOlKbmM3w6noRjld
	z/SiaSXAT2KibA8NAmRaXCCCtQwgA7F9woVUbvNPUOqWJ8pFB6JvXQA3c6o1X/dLW6PZ7UQkM02
	Y0lx+eNQHYFRRUoXI9ZnebMj936hcU5Vx8YMN/AGf+FsyHbbnzifd5aY8p39T+7lJR+upQNm/zy
	Nqe6dZOyAevNopTtSStxYpBlN/Tz6IbME4qX3BEDjCOA5u8R7ykGtmcFR2v6Xu24FbDg0f4ekx+
	kGcXJcBIaEK8sUlVp5qKbgD3l7Nv74yxT7u7tT0iHmPAQ=
X-Received: by 2002:a17:902:ef06:b0:2b9:6cde:c345 with SMTP id d9443c01a7336-2b98823923cmr19966665ad.18.1777450698999;
        Wed, 29 Apr 2026 01:18:18 -0700 (PDT)
Received: from localhost ([124.158.97.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988940d08sm13540185ad.43.2026.04.29.01.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 01:18:17 -0700 (PDT)
Date: Wed, 29 Apr 2026 18:18:14 +1000
From: Nicholas Piggin <npiggin@gmail.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
Subject: Re: [PATCH v2 3/4] lib: sbi_timer: Add support for timer events
Message-ID: <afG9rFla4IhYHgoD@lima-default>
References: <20260425104048.2335262-1-anup.patel@oss.qualcomm.com>
 <20260425104048.2335262-4-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260425104048.2335262-4-anup.patel@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_011820_586221_55946414 
X-CRM114-Status: UNSURE (   7.76  )
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

On Sat, Apr 25, 2026 at 04:10:47PM +0530, Anup Patel wrote:
> Currently, the sbi_timer only supports timer events configured via
> SBI calls. Introduce struct sbi_timer_event and related functions
> to allow configuring timer events from any part of OpenSBI.
> 
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
