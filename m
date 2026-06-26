Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FE1CD4F26
	for <opensbi@archiver.kernel.org>; Fri, 26 Jun 2026 11:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wGfa3LYCkBGBol2TtiG20k1V9nTJmDrJfs8vuukh7qI=; b=Cz2nVUFxF0+cv6
	xAvKGfkNaL6xfa2R7M8PQsJ6qnZlTBTgNGSek217vV19VMe7GdLTciowgbKT1jQSwaaBtkENZ59C4
	xXnhDqAAbNMSfnysrdBylxEpEntIoPzpTof0WnrRe624h5r/KyMhSX1QlmTd2aG7wCjaDAPfXT9cR
	oKLfxU7+EgL9pSju62nFA0ii1p+93cdZFf9AMgtHaMLNG/uiRL7ZCSLM1An9epXXV/wRWrsuAaNmD
	SNWiZUDabUA2UMYhvTEr6rWa1c9jPnzwZd1lkr9gcZNydKf+ZQJStYHc6JiP7rYeOxefcqlrQmrqJ
	3jH6GKlXNCwNmddr4+Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd4TU-0000000BBXH-2MJK;
	Fri, 26 Jun 2026 11:11:56 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd4TS-0000000BBWa-2AE5
	for opensbi@lists.infradead.org;
	Fri, 26 Jun 2026 11:11:55 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4922244f7c7so8031645e9.0
        for <opensbi@lists.infradead.org>; Fri, 26 Jun 2026 04:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782472312; x=1783077112; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MWHbU49HY3UROsQMM3KH76n4TBHTzQfPtJBJ60Zw1OI=;
        b=TQmZwoFKNXEXA4GFc713JsHEr44d/yWhFU77WaxG4SkAHDcp1wzERn/k7AUeSCrRjy
         7PllOCwV4UFibN9y/E+g2FJRQ7DSd/pTdogyKDwSOm0rU3z0vZCqrMlvtki8zOzkAEEO
         7Gv/VqaTh4ebvLcIUJWx8xpHhf7otZp8TZcOgpzvIipo+LFjYltdp7pK3MLombS0qlgI
         s6T2utkFne6yyZegcrWON2ZK74X3O6Em0882Sbo5An0R/f/02LuoBLXRCMuJeLXvlBof
         awlARDUA3VHspIk8kRO8iX2R6vRO/4WujJprXBS2CAmfwQRIUaOR1+ta543q2xEwkJVL
         Dn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782472313; x=1783077113;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MWHbU49HY3UROsQMM3KH76n4TBHTzQfPtJBJ60Zw1OI=;
        b=rtDy8gGcnZUbWuC0Zg0eU9ZfulQppq01SVo5GZsM1A1rRrZBy6kFs3dnCKr6AAqNm4
         jNgENclkPJjQBM6KffseQ+bSHoCTAQ1SRwu4EuewPNZfdTzgeXfEC7YwaitXMJvKQhcT
         ansNtapMDPO86emS0NZemF4SKDA2HL5KMPsPgNZ7YojRQwkEIuWuiLygw1sm47UZf2Ig
         oOZWTO/DUD+416uIa/9usnd8FcYnT4H7Jg7+dociAc9limp1fIOwzzymMODxOmZIWBfu
         uaQ6M/YNkLKgjGXPvOKMxvlk4gOfhq0G+Bg6nUd+9ZPlJ131HdGTzSjsxlcNsURWQiJX
         PUAA==
X-Forwarded-Encrypted: i=1; AFNElJ9B/CBkAIeCsRMhImhlfblMInFOd6ua8WiMOPF9iIZwiI+PpfRThWaiR3uKo8qPiqncewV+6lfv@lists.infradead.org
X-Gm-Message-State: AOJu0YzK8tkn0JBVpsEkPU7QBsWxGnkGdZhoUnBl7KHs/QbOlj5gqcPZ
	icLYHdlryrikC4GkOZIO09NTjnElHHGHJMx/I869wOT3HOVKnvY2+qkfM9zOkZ1D
X-Gm-Gg: AfdE7ckmi1A5qPSSDVNgzCemB3gL+oz1IURLWJBxl4xQcOOFqADs1iCTv+trba20anq
	woygPg25+1Q7j1gQxESYB7hP4S8TDr3TOINzp3BLAu5hxYI/20vgxDQQChNqzUuzyd7m/E5C4yO
	AUhpgE+kIo4F6VxQGYBeh78LGnn8i5EuqJMK27o2GuEgK57y3gy7lL0ujA47/cbCtQNgforaZrd
	/q4+PbjvuMaYjWVpF0X6cSSqathG78k03X9zZuApmO5DpZfEPon42KqkhiLrTdpzPJy7grAsXuO
	FWiwFqzo1gSHHbhAbf15+aFPCiUJyRrSWha3FK3taCQTEdjFckfMMbR0TM5HYBVnxJaWMm7TvEd
	GT7td5yQKNzRS/fUn7+yxft1HHSlPEOFlkZSLaJ5VHwypB7Vfy9IkFzJxnyDwI9JWdA0o7YfDfv
	Ul7R2TnHZVT3IHsjGMrCwZENuxMsdHQE2UvCX0O+cCxm11MEJLB5DtWog=
X-Received: by 2002:a05:600d:8445:10b0:492:649d:9b96 with SMTP id 5b1f17b1804b1-4926683fb58mr74692455e9.9.1782472312542;
        Fri, 26 Jun 2026 04:11:52 -0700 (PDT)
Received: from [192.168.0.40] (a89-182-137-217.net-htp.de. [89.182.137.217])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49269009163sm78914615e9.11.2026.06.26.04.11.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 04:11:52 -0700 (PDT)
Message-ID: <ba4686c2-02a4-494a-8d5d-09dc113e5b77@gmail.com>
Date: Fri, 26 Jun 2026 13:11:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Upcoming OpenSBI v1.9 release
To: Anup Patel <anup@brainfault.org>, OpenSBI <opensbi@lists.infradead.org>
Cc: Atish Patra <atish.patra@linux.dev>
References: <CAAhSdy3gbrLYmRPhD-ABXZUW0SjXk5xpQbZ_vrb1hsaJ0N3qTQ@mail.gmail.com>
From: Andre Heider <a.heider@gmail.com>
Content-Language: de-DE, en-US
In-Reply-To: <CAAhSdy3gbrLYmRPhD-ABXZUW0SjXk5xpQbZ_vrb1hsaJ0N3qTQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_041154_569294_147C93E9 
X-CRM114-Status: UNSURE (   7.84  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

On 17.06.26 6:48 PM, Anup Patel wrote:
> Hi All,
> 
> We are close to the OpenSBI v1.9 release. I plan to complete this
> release by the end of June (29th or 30th June 2026).
> 
> This week and next week, I will be mostly merging fixes and
> few of the in-flight patches.
> 
> I request everyone to test the latest OpenSBI on their RISC-V platforms.

Tested on a SpacemiT K1 MusePi Pro board.
No issues so far, but my daily driver is linux 6.18+backports, so I can't confirm the 7.1 kernel fix.

Thanks,
Andre

> 
> Best Regards,
> Anup
> 


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
