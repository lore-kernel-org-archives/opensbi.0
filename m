Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935BCC369D7
	for <opensbi@archiver.kernel.org>; Wed, 23 Apr 2025 13:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YpMIQapzjgaJmRrlz2c66255M5vy1dMtd9/Zh/aq5Os=; b=k/8Y+an8PjluBF
	d8WM6Wma/b2PZgS5isH8etWsRTiAFPXy4RkVl3TrKiNSWKCpBrZEfmLaS9zemRLKGJ7S/tmG3JA/R
	jsQaLJw+eZGf+GjvTmwN9x2ggsHmle9imz1cOhPk8th6GQ65UtF4CFMfVGWM8DAtIRGT0OhtFHPN8
	aWvytbh8ojSIzrhnnSCdJ83wgu/TKj8FnaPy4vR6RDwobuADDGlEDIVsWuZfB+7xCcr2iWi/Mi6dO
	gwN3e3jGcMfhI19sIZofSHGyEJ6HpC0XMU83R6tyiuGuqiTeYwDt2tTTmOOtPa1MUKs4Jx/l2YJF1
	xZHbE3+vPYkvAjUJaTSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ZnO-0000000AXZ6-06Ux;
	Wed, 23 Apr 2025 13:05:46 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7YL0-0000000AMKo-06kC
	for opensbi@lists.infradead.org;
	Wed, 23 Apr 2025 11:32:23 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id AD5B925C00;
	Wed, 23 Apr 2025 13:32:15 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yLKS3-xXqYwW; Wed, 23 Apr 2025 13:32:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1745407900; bh=lH4pJf+cG+FG3NYojlCw4dEE4xHmKnichqCvEncWz24=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=MRcBwQTnGs8631JUoCWhK36CF+2k0Ygls7PS0bq7Dzr8/3N9H3FRl5bun6JdRburT
	 wxas0gEycTETcTu7HJ40VZIFx9myZeKsQsYsDt+aXrJFPiROhbPi8bqzNyPZ66uOSs
	 YHnStA5kvM1zlmTxVtuF4mXmODUh2D6WNtwCXNLmeXPG/ZdYPnAIvhLKmYTuyBIut2
	 FquI7FuX8DxjsId+At7BJKBzy+hWAp+Qj8YEIt7gktTWPdmxBMHOJ1neoYl4XFFa53
	 /6fgMuMEVvKvx7F2Se/XANF0rP18AY6EJjOiXBDk2QJMBOZpPPbuqzSc0d96IVozgS
	 1e0q450Y9vnQA==
Date: Wed, 23 Apr 2025 11:31:22 +0000
From: Yao Zi <ziyao@disroot.org>
To: Inochi Amaoto <inochiama@gmail.com>, opensbi@lists.infradead.org
Subject: Re: [PATCH] lib: utils/irqchip: always parse msi information for
 each aplic device
Message-ID: <aAjPioFhjmdnPp5C@pie.lan>
References: <20250423080915.1101707-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250423080915.1101707-1-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_043222_485401_5092C04D 
X-CRM114-Status: GOOD (  14.81  )
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

On Wed, Apr 23, 2025 at 04:09:14PM +0800, Inochi Amaoto wrote:
> For a root domain, it may keep direct delivery mode as its subdomains
> use msi to delivery interrupt. The currect parsing logic may lost this

Grammar: may lost -> may lose

> information and break the system if the domain is not set as MSI mode
> or the MSI domain is not a direct children of the root domain.
> 
> For a non-root domain, it is safe to parse the MSI information of all
> its domain and write the msiaddrcfg register. The bus should ignore the

Should "all its domain" be "all its subdomains"? This sentence is a
little confusing.

> write on this readonly address.
> 
> Parse the aplic MSI information recursively for all aplic device.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  lib/utils/fdt/fdt_helper.c | 138 ++++++++++++++++++-------------------
>  1 file changed, 69 insertions(+), 69 deletions(-)
> 
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index 8939d90..0150725 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -6,6 +6,8 @@
>   * Copyright (C) 2020 Bin Meng <bmeng.cn@gmail.com>
>   */
>  
> +#include "sbi/sbi_error.h"
> +#include "sbi/sbi_types.h"

I'd like to keep the including style consistent and sorted.

>  #include <libfdt.h>
>  #include <sbi/riscv_asm.h>
>  #include <sbi/sbi_console.h>

...

Cheers,
Yao Zi

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
