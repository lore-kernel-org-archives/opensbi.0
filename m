Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CD9C43458
	for <opensbi@archiver.kernel.org>; Sat, 27 Jun 2026 21:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0WD32Gzl3BXYMEr66//OKIQ1bmZNVvRQo9velG+ioWs=; b=F/gLGcyXMNCVzK
	3RiQ4OM9HsoZt+PE/4cJN9DIeNJHc4ZnLOLJKMlsL8M4hSIWpPoG8u3YbQmOAjPCopupsgs6sNOZc
	GfVKEB7py30ngANLCDf9aI+rRiZXA4OpHxqmLxjTfNxf8LxNId4R2CJOv5HRQKCW0XAx/HPtXBt2M
	IsHH063sUdc35YlC2IpbgnA0VMWrd+d/CB/EdblP880qImIL4PhDsdiimCb9MZid9pImr+3gj0Og3
	SpPMz1XcOsgZJBK9Tb+9fwcQWOKMJx+sPCiFc/yK8W0K216tL198FSJ9UBP48OK/V5+vfTpK4b7gw
	c51qkyJd7pqy4oKbevKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdaUs-0000000Cluo-1QHk;
	Sat, 27 Jun 2026 21:23:30 +0000
Received: from 93-87-244-166.static.isp.telekom.rs ([93.87.244.166] helo=fx.arvanta.net)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdaUq-0000000CluH-08z4
	for opensbi@lists.infradead.org;
	Sat, 27 Jun 2026 21:23:29 +0000
Received: from air.arvanta.net (air.arvanta.net [10.5.1.4])
	by fx.arvanta.net (Postfix) with ESMTP id 3E14A5DC;
	Sat, 27 Jun 2026 22:19:12 +0200 (CEST)
Date: Sat, 27 Jun 2026 22:19:12 +0200
From: Milan =?utf-8?Q?P=2E_Stani=C4=87?= <mps@arvanta.net>
To: Anup Patel <anup@brainfault.org>
Cc: OpenSBI <opensbi@lists.infradead.org>,
	Atish Patra <atish.patra@linux.dev>
Subject: Re: Upcoming OpenSBI v1.9 release
Message-ID: <20260627201912.GA1629@air.arvanta.net>
References: <CAAhSdy3gbrLYmRPhD-ABXZUW0SjXk5xpQbZ_vrb1hsaJ0N3qTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy3gbrLYmRPhD-ABXZUW0SjXk5xpQbZ_vrb1hsaJ0N3qTQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_142328_242309_42FA8C0B 
X-CRM114-Status: UNSURE (   6.02  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMDI2LTA2LTE3IGF0IDIyOjE4LCBBbnVwIFBhdGVsIHdyb3RlOgo+IEhpIEFsbCwK
PiAKPiBXZSBhcmUgY2xvc2UgdG8gdGhlIE9wZW5TQkkgdjEuOSByZWxlYXNlLiBJIHBsYW4gdG8g
Y29tcGxldGUgdGhpcwo+IHJlbGVhc2UgYnkgdGhlIGVuZCBvZiBKdW5lICgyOXRoIG9yIDMwdGgg
SnVuZSAyMDI2KS4KPiAKPiBUaGlzIHdlZWsgYW5kIG5leHQgd2VlaywgSSB3aWxsIGJlIG1vc3Rs
eSBtZXJnaW5nIGZpeGVzIGFuZAo+IGZldyBvZiB0aGUgaW4tZmxpZ2h0IHBhdGNoZXMuCj4gCj4g
SSByZXF1ZXN0IGV2ZXJ5b25lIHRvIHRlc3QgdGhlIGxhdGVzdCBPcGVuU0JJIG9uIHRoZWlyIFJJ
U0MtViBwbGF0Zm9ybXMuCgpUZXN0ZWQgb24gYmFuYW5hcGkgZjMgYW5kIG11c2Vib29rLCBLMSBT
b0MsIHdvcmtzIGZpbmUKClRlc3RlZC1ieTogTWlsYW4gUC4gU3RhbmnEhyA8bXBzQGFydmFudGEu
bmV0PgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
