Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FB1C43458
	for <opensbi@archiver.kernel.org>; Mon,  6 Jul 2026 14:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0HsifB5hDoiz72M0CsOqoEnW6vMgn2ooJ4bUWjrAJNg=; b=cWMkG90vmik/O9
	OljACX2M7rZ23LJ7qtuZcuiZ9/BR1z3oaJ3TNZg2k19L6/9C7u3Xh3JicT9JRumpU8k6/CpuSghbN
	b/dCJ12E29tRCUB5UHoiBt2fOfcxFVq7/BhjUsSgl/CreTDt/lx0qxO5eSm3Uh8EqYLLpZOgaREHG
	oumOlDbee2GWihoLUPLZ7238fvE/nBHpvWU7WDV6wo9XXvzYm8DIoXVLECW8XjqalOFK3TGQHbsmG
	8hris+1ZRJjCw0tnmHhBa9G9MAP4GIFCx05OD8AzTg3Ca9ZFfc10nIGy335JcDmiwWgLwYSjr+Y3j
	1OXxhvG6EPtCy0d/Zh6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkaP-0000000CnHy-1Qeb;
	Mon, 06 Jul 2026 14:46:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkaO-0000000CnHa-1Wqa;
	Mon, 06 Jul 2026 14:46:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E23DE402E8;
	Mon,  6 Jul 2026 14:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A08B81F000E9;
	Mon,  6 Jul 2026 14:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783349175;
	bh=brx/0pjLPbIrtsCLKJMRSdKrfuPAmeeDj45TYZzCsts=;
	h=Date:From:To:Cc:Subject;
	b=GRPq8zRwdkOW2eJBU6A7QeKlcffOXU1DX1xaza+0LosuToaFcnIkkMEGkqSdvoM7+
	 Y+Z5hDHWTp2y6DKnOJs2FeQboaNF59wGIXyQaCrlmFl76eZVomgy1x0pJYD2rBlzHj
	 o+0vX2o8oJ9958leBdXSC+27RoclU6HxXWqyPH5h+86FS5oVj87SsoApDM8dgZR00T
	 QijldAFHZzb7d7e0/j5zi3nIT9DI7ub/hLqoI4+rqGjwQ5AP0RbnHpqbZBRJpkjPQt
	 OweeEOYVV4p8VZYcW3jhDYbzvjkXoHpMw4MYKwYedf6fezxNrMlwz/6cbrSWUopqjN
	 SWyRyV7+EUiXQ==
Date: Mon, 6 Jul 2026 07:46:13 -0700
From: Drew Fustini <fustini@kernel.org>
To: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	opensbi@lists.infradead.org, u-boot@lists.denx.de,
	qemu-riscv@nongnu.org
Cc: Paul Walmsley <pjw@kernel.org>, Atish Patra <atish.patra@linux.dev>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>,
	Conor Dooley <conor@kernel.org>
Subject: CFP for Plumbers RISC-V MC          
Message-ID: <aku/tckAJ71i952o@x1>
MIME-Version: 1.0
Content-Disposition: inline
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

Hi all,
 
The RISC-V microconferecnce has been accepted for Linux Plumbers 2026 in Prague
this October 5-7:
https://lpc.events/event/20/contributions/2333/

The Call For Papers is currently open. The microconference is composed of
sessions between 15 to 30 minutes for a total of 3.5 hours of technical  
discussion:
https://lpc.events/event/20/abstracts/

Please remember to choose "RISC-V MC" as the track. It is ideal to submit your
proposal before Friday, July 10.

Thanks,     
Drew
~
~


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
