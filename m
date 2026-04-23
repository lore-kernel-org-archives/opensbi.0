Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFB0F94CDC
	for <opensbi@archiver.kernel.org>; Thu, 23 Apr 2026 06:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t0Q/8zPJyraGhSPVL96T94V2GXnnTcxM4kk/rtI8Rhw=; b=nirB3lskjnvVDU
	cnaYiu4B7cbvNcTYgdRWVi1OtuI1lkxs+SH6B9sQ/QohYhS3z96abLYyAyaU/FwKs4GEhjhhaWrpL
	MF6sTmFQ822dmk2cj5+2gWb4TjkA5zSkAbRrPlRjZBm9HeZCWCVdpNBxCUR05gMJtzHqVT56+pjh6
	/C13ECibuBTrwtl15ojKGTruzCrKKj3kdqh7+ijJWiWhqxRymb+FM0HgiYVm2ili3BSUpLihmv2I7
	froBDd/6PKabUFpwu7NyCHbxyqYLJfVMMSNzQscYp+i7m9r+HKOdgc9IcbHZWnj8s1iN/JNGDemfa
	fF0EdFQKeQkihnSOBZYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFnzs-0000000B7x9-0D28;
	Thu, 23 Apr 2026 06:57:12 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFnzq-0000000B7wI-13Rc
	for opensbi@lists.infradead.org;
	Thu, 23 Apr 2026 06:57:11 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so4371220a91.0
        for <opensbi@lists.infradead.org>; Wed, 22 Apr 2026 23:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776927429; x=1777532229; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aPrH2wS3g1DXak7r/SN62tJQvqttVQCipNOC9Kihh5s=;
        b=TKoxurTUC7GvJjCl83tCY5AAjiBRZR/nnkiCBJns+Y7A7MYuAoPJIYQ/1cQHPn4unY
         DeNRsP2KqUTrdaaeX7jcZFh9OEuw+RifNR2Q2tSsx5lVAtjjBTS5qRSEUnIk4SbtLieP
         1APdUZfpoESvuQytiITwxUK3qfPtddMLvcsKR8mRa0FV+0UM90IcFEoEEJoy+UbMtYN7
         JqRcTF3CxWUQgmXrb4eBdLXuRoq/fqh8pTbFLKufgV/8jMA1eOaiIL3gMYxyRNkRzP5r
         nBwdtQ/po8luokpp1QSpdjsJM4oLwNsc9puARUtXsM303Ku+ODaErDvFMiKSvj1twgyM
         jC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776927429; x=1777532229;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aPrH2wS3g1DXak7r/SN62tJQvqttVQCipNOC9Kihh5s=;
        b=CJulmgWD9/VB/21YnTzGuMust3FYp8sJ7LcOvwxsORdxWEGhN4zdQO7FOqgxvpVYQ1
         FKQOEfyZTDGbQ5l5kFKTp3+GGnWVNJfK+YCXH4uM7XggjuB/LeTNFVXn3MwkBk3HkQvv
         d2bEkEX8oq2900JxWcIups4ZUsygiAeOQNM8NaKLZmKP2dqb9Y8j7FQew/PCiBLYWHJo
         mP6h+AbCTe0WxIukK1YQeNgTO7IMB0o7gDNxM/wcnAtZLUQZ7dTg1BtzlkqaNlvpGtyc
         GiMkiz9rlBr+im+jkd+kf5XzlqbtLeR3JHI5ozelvnLouPOJhqVJGDnfGzgl1rbAdP6s
         ugZw==
X-Forwarded-Encrypted: i=1; AFNElJ8qSGPGKtM0Da4ERaYAJtOcYmg5wUJnJ+UXTMi6A9ofxJGJ/OCZ/1qO2X6lskhuZd8kzWHLVGEj@lists.infradead.org
X-Gm-Message-State: AOJu0YyT9vYJRSmc876ziFGpMwoJ/jf0Hls+48hrFvS14rBUQunLimRd
	iFKr5b3xMidnHjAdzHqirq7pXYMKBC/Zp7gCXXpwFfdCdWRHbY+5r/2N
X-Gm-Gg: AeBDietQwonpGxDJbenwFea6KdGj3ZHPTLgRDYkUZP6bGDPDN2o4l/auB0uzM0GBqQT
	rPE6xiuHGNz5jums8Ti031/yWoKMUYgh5z3745kaCT21i7J469dVQw5qpgaMHVuTH+zg4sEMzut
	WdnkNNTJZh9PKp/DnVmk5fsuxICZnIQ/gxYG5VdMkKPzmaj76fsydwld5K9qIMmp3NlM8ROeKhT
	nkd0TLQyY5ryTaypEwlwgjwXOAhTzas7PaiwPiXkyM68TU9/RvQ3rxzbUQxU9Mn/bXdTKLqs3vR
	6SMGGpopCeMWnmZ/9vpMzIdDenuCMmnyqnFLzP+N5OuyQyjmNtTuWA62XWyBoYGwTNKvVZRyi9i
	46pqx48pA1SrCUsCSgtcuD0Phm2ijs+LJV0lnZ6vL0lgLURVHxatm4BdXorVxvkBB1m1cfwawEq
	3GwlHb6DKOGflzRCFZu0N2cXnz+382VbmvOHU=
X-Received: by 2002:a17:90b:3dc8:b0:35f:b6a1:8d23 with SMTP id 98e67ed59e1d1-3614040b34bmr29409810a91.11.1776927429636;
        Wed, 22 Apr 2026 23:57:09 -0700 (PDT)
Received: from localhost ([203.38.38.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36140fc575bsm19086873a91.4.2026.04.22.23.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 23:57:08 -0700 (PDT)
Date: Thu, 23 Apr 2026 16:57:05 +1000
From: Nicholas Piggin <npiggin@gmail.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
Subject: Re: [PATCH 0/3] Timer events for OpenSBI
Message-ID: <aenCd32nbvLsxaQc@lima-default>
References: <20260415110002.2610929-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260415110002.2610929-1-anup.patel@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_235710_288060_5AB78721 
X-CRM114-Status: UNSURE (   9.75  )
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

On Wed, Apr 15, 2026 at 04:29:59PM +0530, Anup Patel wrote:
> This series extends the sbi_timer framework to support
> timer events usable from any part of OpenSBI. The platform
> drivers in OpenSBI can use timer events for timeouts or
> periodic checks.
> 
> These patches can also be found in sbi_timer_imp_v1 branch
> at: https://github.com/avpatel/opensbi.git

What is your m mode use case for these, I would be interested
in the context of reviewing it. Generally I thought it looks
good.

Thanks,
Nick

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
