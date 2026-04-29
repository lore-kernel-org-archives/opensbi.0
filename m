Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75880FF8864
	for <opensbi@archiver.kernel.org>; Wed, 29 Apr 2026 08:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wc7yDwFMURC/IWNQpzygZW/E4nZk7PmmBPLo7ZC7jMQ=; b=rwGaYneXkjUrwA
	RQxPpSoktJW15KRbhjJmC65aQJw9ltnisMtJSRdYitkgfnrwRghHJkxfyIgUsnhW86VuivxLI7gFO
	rUaYZLyRJan3e+gzAjCSGdhUhNGYTGtaWGjDti5ZVcriVAljICP/bDNzjCWyUgL92YZOCJkR5jMiU
	hp5NYPb4IDwLljQ4GYxmlAXlmUqZgNVWBFFoedexDk1hH3XMqla/C5qMkVituIvlCwTEHB40BbhXz
	oDGiI5kqLxAKY0wfIBoXRO+41Gd2epKmY1rqC7oAMH4zIezf9OB88nMQbqzo7gdWS/JJRPUhdQa9w
	v9I+0ADR9UiZB6JVP0Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0AD-00000003ExD-3qyZ;
	Wed, 29 Apr 2026 08:20:57 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0AA-00000003Ewo-3VLQ
	for opensbi@lists.infradead.org;
	Wed, 29 Apr 2026 08:20:55 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-364ad762ef8so55575a91.1
        for <opensbi@lists.infradead.org>; Wed, 29 Apr 2026 01:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777450853; x=1778055653; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DHcKX5zka/gAIEOsjb/eA+LM2CSCQWLD2sHoXdjIUnM=;
        b=dLuE+S4HNhtwyat9ry0PX6MrNBPw9i6WM32eAHBYHjIEkAR+L50Hd+7UAjxv/18AXD
         vKxDDW6PopQJnNbPnRmWp3DysFW1yE8oY1P4iFGrCNcoBNr7LoeuWfmk0NfX93mP/s7Q
         bM9XpkkQOqU1vzqw2NLhdZI/F8/2kt14VV+i8lDrUWRcUe/akXfk6fkz9o3uYxAsiTVw
         1OuzcJCsI7gz9R5AMqIqHwki0pH3LTqlhMif6hhsdrzTXPsFVIVf2PTZo9ae3dQMUU/r
         FvT5M2wnulOkySZFyRVdHj++7veJMBUwrzyE+4aCrnkwU9kDfdCSTai5vBgBqh8OBeUM
         fXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777450853; x=1778055653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHcKX5zka/gAIEOsjb/eA+LM2CSCQWLD2sHoXdjIUnM=;
        b=L0uQnmina9V6vMMHD42uUf0xYBtEuC71gE4u8wlbzLr5JOZJFgTDsjMrT14Lz93GO8
         SFZe2hPhpWadoHHTw5xSDpKbg0JoTGpAUFBUm4rqp6vlaQ499XhBcK6425ow+/xTUJay
         bUvD7R0tBsSvemHQSe79LCi4XsMJX89TZx1T99jytI9cQzsZBvBzaPtlhl1yil9457rA
         tq4De+zTi9oe3NwyKAH28mhf3YNqqZNI9P8opxMNWE+csDCsjs9qjd+vtGZt3qBH1SfA
         oQ8h017NJ+Iv+X2aX14I51JW2A6ne40ZMUftkrlsWT9fKPpiL4tqtv3CCLjY8OUYxE+H
         idAw==
X-Forwarded-Encrypted: i=1; AFNElJ8CwJKXOZGzqK5a6g4J/DO6Mti9JeqyMQvYkq43BA/JS4vkKlSJltcX9z+C+bT9gpBq/8mEz6ce@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1YS+b8QuKnm7XHfyWrpPTuugU8Y4POvekyeFPDWUVOcrVMQMo
	A/BYnkBmSAJnaOJjl6Var+3VWujkZF0Q4CLuhAiK1FX52Yvxm+Bdpqvq
X-Gm-Gg: AeBDieufdWGsbjvtR0mj4z2cQvvCaQA9NKq3ATB5c/XtQ19xBpDxYvO6EHqZ5fx6zoP
	ZewWZjs9fHXcyFcvzx3Ij62n7ThZLFOHt1SRgdvxlqNa7I2TWBpKkYsGITgjRmUdHHp81175f3/
	9JrB9IKYaTtPlBfarfh4GA+icoDMpYRGbz9a4tC1tEFz7Zqk4MZbmv2VjS7J2tYeV6WW63+bIQG
	DsSUrpF5+nIMnDd276rItqftxgnwfJA93mFK6QGngIvI2TKLcSmLBTpfxVlqjIWEcq4fn5C6o7W
	xVCZlxdls0ZnJpsOOG0aHqKq065ouvMKdXK/JlbK+Tq+hm1CSmINOvNdRFfuj6lyNSGBgMFaZL9
	igQFUkSmd74oMvfqfHdwAzcK9JZtC30QwJcDntIAahlHff9wdTv3Ql5WlavJNP/mbG2aHUfU2xe
	7rWQN+DgnMCSkgMRA1VTDCIx1L0GcSeuj71wuYOK+yEDY=
X-Received: by 2002:a17:90b:2801:b0:35d:997c:8ebf with SMTP id 98e67ed59e1d1-3649206fe15mr7228926a91.21.1777450853611;
        Wed, 29 Apr 2026 01:20:53 -0700 (PDT)
Received: from localhost ([124.158.97.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988772bc7sm14775315ad.17.2026.04.29.01.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 01:20:52 -0700 (PDT)
Date: Wed, 29 Apr 2026 18:20:48 +1000
From: Nicholas Piggin <npiggin@gmail.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
Subject: Re: [PATCH v2 4/4] lib: sbi_timer: Introduce
 sbi_timer_compute_delta() and friends
Message-ID: <afG-1_E0ryqY64GQ@lima-default>
References: <20260425104048.2335262-1-anup.patel@oss.qualcomm.com>
 <20260425104048.2335262-5-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260425104048.2335262-5-anup.patel@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_012054_938525_BA229C74 
X-CRM114-Status: UNSURE (   8.18  )
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

On Sat, Apr 25, 2026 at 04:10:48PM +0530, Anup Patel wrote:
> The users of timer event have to compute next_event (aka timer value
> in the future) based on desired units and unit frequency. Introduce
> sbi_timer_compute_delta() and friends to simplify computing next_event
> for timer event users.
> 
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
