Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAACCD98F2
	for <opensbi@archiver.kernel.org>; Thu, 18 Jun 2026 19:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yh8FTMhxohuGIWZD6xP8HTdNsWjeDI5EWpN9li2AhVY=; b=VuzeQyWLJ9ppnM
	LWhS/1rhH3FcggvM1X5J8evOivXku0U0Bs2Lq1WxUAgH6kyd0Le5fAmEo6mlBLI1xKcYel108z7gq
	kyeEuYzRz4RzZZNxPT4rvUS3N+sX3MpM128d+w+sC4PcV8D2y8pNVKHk1Wa90Ocu4b6K0FHedNVHf
	hoRvIUClbk+5xxNqzzg8Of1wh70mU4RVSBWcMEnkBaNRxl3cGQ9rrbwhTGWEWbS7obm2/zPsThCCA
	FwvpnzdS5Mg0P2mbkhBefCtuXgB7Id7WLKl8y6t4vMliNmwURmrRqr/Z8sZXCjWLr0wVndEyh5gsO
	YTlmNfsTs6O6TtQi4+vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waIbK-00000001kOM-3EZ8;
	Thu, 18 Jun 2026 19:40:34 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waIbH-00000001kNx-27Bb
	for opensbi@lists.infradead.org;
	Thu, 18 Jun 2026 19:40:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Content-Transfer-Encoding:Cc:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=mgqlwhftvzsv/DeUrQm0m31WGI+pIbqOhbU2onFwdhU=; b=gBE4eX8JCyILG/dYyW7Z6MsZ3x
	W9kPurnXd5iveUdxky5aOO0wGx8ceG99c1R2kdU+3Akp515ytDdR63Dw569tbcgSeXjrdWLjd+Eyv
	uie0YNHD8rRxEr0zXWGf00p3rN2PcowBKJl8T+Y4fX89a0Wz+DSJGKJUPxVsUGVzbw8tjBTo5nMMY
	7oJQyKJAGJ/28dJv5/PxJZighEm64ZSuitw3/BnSp1boOuGnpHTLHibFp8YhzmI4U4RNzqAaAaAJq
	kQ2dwK6cXhmlyaa8++AmtIX1BlFfHe0UxSEtf6qT/ZWB2nAhVQqJwBTvZ0+WvQxLj8IJmE66V8oDc
	6FQGDO/Q==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1waIb9-0000000Fq9z-2JG2
	for opensbi@lists.infradead.org;
	Thu, 18 Jun 2026 21:40:23 +0200
Date: Thu, 18 Jun 2026 21:40:22 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: OpenSBI <opensbi@lists.infradead.org>
Subject: Re: Upcoming OpenSBI v1.9 release
Message-ID: <ajRJppbxOgCXQpT7@aurel32.net>
References: <CAAhSdy3gbrLYmRPhD-ABXZUW0SjXk5xpQbZ_vrb1hsaJ0N3qTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy3gbrLYmRPhD-ABXZUW0SjXk5xpQbZ_vrb1hsaJ0N3qTQ@mail.gmail.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_124031_548025_5AF59A42 
X-CRM114-Status: UNSURE (   8.54  )
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

Hi Anup,

On 2026-06-17 22:18, Anup Patel wrote:
> Hi All,
> 
> We are close to the OpenSBI v1.9 release. I plan to complete this
> release by the end of June (29th or 30th June 2026).
> 
> This week and next week, I will be mostly merging fixes and
> few of the in-flight patches.
> 
> I request everyone to test the latest OpenSBI on their RISC-V platforms.

I have successfully tested commit a8be5e94 on a SpacemiT K1 Banana-Pi 
F3. I confirm this version fixes the crash with kernel 7.1, even without 
increasing the default stack size.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
