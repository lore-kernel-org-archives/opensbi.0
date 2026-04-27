Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030A5FF8860
	for <opensbi@archiver.kernel.org>; Mon, 27 Apr 2026 16:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:Message-Id:
	Date:Mime-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHJd6NVAshXQmxR2blEIahC7VEywsFPXRRSkW/k8BU4=; b=P9Yom+7pLHlTDLwOrhiGTYklNU
	y8tzyENT4LfjuwBw6xY7dUszbHdOkc2b3p8N3U/Zlk1UhwgUL5K3uka1PEku7riFqyTpe/j4LveN4
	45zOxeP2yHurqbY+jBB9X8Px/zQNaNnm4auvZfmab100eEukG9+Ecvzj1lXZE6YWOs01VEq3GCzgU
	QGEQhpafQolpHzlJodyCuFVEc8KnaunIwsLWFUF6EvmDR6Pc+vZDqewWMfyOk/33tzazBDc//xZCZ
	YzNtoxD24EPqEvy5fiSnndtKt4tRRJdIKTKFrtw1Xxd/CMZizL73b8Pfw4qz/ghjFqnkJw9zQ/33a
	4IY3g3RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOfE-0000000HKnn-0IPD;
	Mon, 27 Apr 2026 16:18:28 +0000
Received: from mail.d2evs.net ([96.126.111.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOfB-0000000HKlz-2vtS
	for opensbi@lists.infradead.org;
	Mon, 27 Apr 2026 16:18:26 +0000
Received: by mail.d2evs.net (Postfix) with ESMTPSA id AE9C421226;
	Mon, 27 Apr 2026 16:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d2evs.net; s=202005;
	t=1777306704; bh=5DpE5H8ecXyzvDPa6MyD3f5amIEFe3CEjc5VpNdYvK4=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=s5CVumxvaUYAQbPrSpx9Bm5UMxLQIHXBN+kL45vKBzQqU3b+x8YlAB9XhTAPaf1mj
	 mLZcHRf/T+tVAKsuAEGgxltKPalCH0h6O6wUwMZI0tI6PuypaR69M6evgSz4xKJMKp
	 FuUC7iOjAuE4qYDbjUlkrOrg9ZakNSTOq3uMkX8iJigrvgFhHjOxoFxKnBxCM5gH5b
	 aO4N7C7l6VYRdWUoOyH+7q7mcj1MHjI8b/4w99jFj1HOAmu8jNw9RaT9Bf5+F6m4U5
	 GR69lQh/XINO87r9ygNbYOvvoROmq043IjFYNYS0lAHFxeUCJdVDRGphwy5+apW4Os
	 Vw6M8MtwxS9JQ==
Mime-Version: 1.0
Date: Mon, 27 Apr 2026 16:18:24 +0000
Message-Id: <DI42N8CACLH1.2HK4NQZ5BSF1P@d2evs.net>
Subject: Re: [PATCH v4 3/3] firmware: fw_base.S: Add common NMI trap handler
From: "Ember Sawady" <ecs@d2evs.net>
To: "Nylon Chen" <nylon.chen@sifive.com>, <opensbi@lists.infradead.org>
X-Clacks-Overhead: GNU Terry Pratchett
References: <20260313133941.3012966-1-nylon.chen@sifive.com>
 <20260313133941.3012966-4-nylon.chen@sifive.com>
In-Reply-To: <20260313133941.3012966-4-nylon.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_091825_816979_88F9DF54 
X-CRM114-Status: GOOD (  10.04  )
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
Content-Type: text/plain; charset="us-ascii"; Format="Flowed"
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

On Fri Mar 13, 2026 at 1:39 PM UTC, Nylon Chen wrote:
> diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h
> index 731a0c98..6a56e64e 100644
> --- a/include/sbi/sbi_trap.h
> +++ b/include/sbi/sbi_trap.h
> @@ -289,6 +289,24 @@ static inline void sbi_trap_set_context(struct sbi_scratch *scratch,
-%<-
> +/**
> + * Default RNMI trap handler called from sbi_rnmi_vector.
> + *
> + * This is the default handler for Resumable Non-Maskable Interrupts (RNMI).
> + * It prints diagnostic information and hangs the hart. Platforms that can
> + * handle and resume from an NMI should override this function.
> + */
> +void __attribute__((weak)) sbi_rnmi_trap_handler(struct sbi_trap_regs *regs,
> +						  unsigned long mncause);

Putting __attribute__((weak)) in the header makes it apply to custom 
trap handlers as well, which prevents them from overriding the default 
one. Better to only use __attribute__((weak)) in the implementation.

Other than that, this LGTM. I've been using this patchset on a custom 
platform with rNMI support, and I haven't had any other issues.

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
