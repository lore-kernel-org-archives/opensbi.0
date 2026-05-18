Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CEDCD4F3C
	for <opensbi@archiver.kernel.org>; Mon, 18 May 2026 01:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BMFyfMoCHdKOffkK42wwjbAdAfetb9KwwrR7iFCM3Oc=; b=Xu9QtpgbctcinG
	uGdBBIcguEXcYdyIRbMk3p/ktgEBAk+omS0UBLenmgXn7hx85EEoTy5aVVr1JeVBlKrsHzSWHoNJC
	y5urhlyxl64GraTKc/LMSRal6EvUPjdxiiKtaIXJCoya1PiowKgX/em88EdsOSh4QIi3PRA4D6XqQ
	M6GwMQO50r5SKHGpkYm/ltWjarzmgKY0ECo5tb9fvHuZ97xcLvlzN4+iXFS5xZ3XsW+Y3GbGjXjI6
	Zei0QCNscAOBjgoGrCm+WyZwGZunu2663tTgNX6OgBXpTnS6QyBmB1CAS1qahvEhYxO9C8YvNg7DQ
	BXXqh8KyJP/ryqM8IljQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOmYI-0000000DoFI-479E;
	Mon, 18 May 2026 01:13:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOmYH-0000000DoEY-1K00
	for opensbi@lists.infradead.org;
	Mon, 18 May 2026 01:13:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F8A1439DE;
	Mon, 18 May 2026 01:13:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFB4CC2BCB3;
	Mon, 18 May 2026 01:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779066827;
	bh=kVDdqoD2sj0KpHLmcHn2b2eM00xeZd55O/H9ZmbQIrk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WE/POa4Neb3vaqI+0lyZM0ZGMiesz79ogV2SZSBY+74dArCYStTwnQdThtQKE7FUQ
	 B37lVbMuzPepf7LErOk6zndWkQc3VpDTBT961mCb9A99oJyqGbVXDkX1eFeGJ/MPmb
	 zFHhkTkvFuHanpp1LUqOmRfxF+x3nrl9EyR4ptFz8j4Tp6Vrw9/R6dPXo+KrVP9ZOt
	 4BXzCwGcjt1K2Qy/b1uhlDyqcjfn0vFsC/+wwhFJtH1cvML3rnDCSOFS/iPn3jGdjN
	 J6cmfjL7z4YLo5jRFbEh+QwppnF47W3Qr6uy25HsvGOnBUaSwsG1P2gdvA1YtIppou
	 UqmjXhxfIRZAQ==
Message-ID: <bc946e89-a33f-4f29-8d4d-119f1a76d26e@kernel.org>
Date: Mon, 18 May 2026 11:13:44 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/sbi_pmu: Don't fallback to fixed counters when
 sscofpmf && !smcntrpmf
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org
References: <20260324-mcycle-fix-v1-1-1444e9fe5c32@kernel.org>
 <CAAhSdy1FUMVpOAmTgdgyPwKRQ0Vepjoqh4NOq32kVUsYyT1jvw@mail.gmail.com>
Content-Language: en-US
From: Michael Ellerman <mpe@kernel.org>
In-Reply-To: <CAAhSdy1FUMVpOAmTgdgyPwKRQ0Vepjoqh4NOq32kVUsYyT1jvw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_181349_376325_21D360CF 
X-CRM114-Status: UNSURE (   8.68  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

T24gMTEvNS8yMDI2IDE3OjUyLCBBbnVwIFBhdGVsIHdyb3RlOgo+IE9uIFR1ZSwgTWFyIDI0LCAy
MDI2IGF0IDU6NTnigK9QTSBNaWNoYWVsIEVsbGVybWFuIDxtcGVAa2VybmVsLm9yZz4gd3JvdGU6
Cj4+Cj4+IEN1cnJlbnRseSB3aGVuIHNlYXJjaGluZyBmb3IgYSBoYXJkd2FyZSBjb3VudGVyIGZv
ciBhbiBldmVudCwgaWYgbm8KPj4gcHJvZ3JhbW1hYmxlIGNvdW50ZXIgaXMgYXZhaWxhYmxlLCB0
aGUgY29kZSBmYWxscyBiYWNrIHRvIHVzaW5nIGEgZml4ZWQKPj4gY291bnRlciAobWN5Y2xlL21p
bnN0cmV0KSBpZiBvbmUgbWF0Y2hlcyB0aGUgZXZlbnQuCj4+Cj4+IEhvd2V2ZXIgdGhlIGZhbGxi
YWNrIGlzIGluY29ycmVjdCB3aGVuIHNzY29mcG1mIGlzIHByZXNlbnQgYnV0Cj4+IHNtY250cnBt
ZiBpcyBub3QuIFRoYXQncyBiZWNhdXNlIHdpdGggc3Njb2ZwbWYsIHByb2dyYW1tYWJsZSBjb3Vu
dGVycwo+PiBzdXBwb3J0IG1vZGUgZmlsdGVyaW5nLCBidXQgdGhlIGZpeGVkIGNvdW50ZXJzIGRv
IG5vdCAod2l0aG91dAo+PiBzbWNudHJwbWYpLiBFdmVuIGlmIHRoZSBjYWxsZXIgZGlkbid0IGNv
bmZpZ3VyZSBtb2RlIGZpbHRlcmluZywgYnkKPj4gZGVmYXVsdCBwcm9ncmFtbWFibGUgY291bnRl
cnMgZG9uJ3QgY291bnQgTSBtb2RlIHdoZW4gc3Njb2ZwbWYgaXMKPj4gcHJlc2VudCwgd2hlcmVh
cyBtY3ljbGUvbWluc3RyZXQgZG8uCj4+Cj4+IEZpeCB0aGUgbG9naWMgdG8gbm90IGZhbGxiYWNr
IHRvIGEgZml4ZWQgY291bnRlciBpZiBzc2NvZnBtZiBpcyBwcmVzZW50Cj4+IGJ1dCBzbWNudHJw
bWYgaXMgbm90Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAa2Vy
bmVsLm9yZz4KPiAKPiBGaXhlcyB0YWcgaXMgbWlzc2luZyBidXQgSSB3aWxsIGFkZCB0aGlzIGF0
IHRoZSB0aW1lIG9mIG1lcmdpbmcuCgpUaGFua3MuCgpjaGVlcnMKCi0tIApvcGVuc2JpIG1haWxp
bmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
