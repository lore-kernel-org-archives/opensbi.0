Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6A0CD6E52
	for <opensbi@archiver.kernel.org>; Fri, 29 May 2026 13:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t3K7NRZt59KNeAKjTpoF5HsfK4UBYPcY/w+u/LHo7kw=; b=LELT2OyP+L0FQk
	jGOGeIgDG/skuSb88KDLEWvhu0LqbVb9C9riUfvl7vaS/X6i0nKaqMH+xJHQHpT+astGvPdewSXVd
	6A2e+QuEusHW5Z2pZYHqIAgkWKIfVVSBNZfJSFox/llPB805jf3eYDQBYU2mtU3mlJ3cw62cj4S47
	968C2P+cpnEu6kfvhI3auC2n7PZ7T/cy+NAxyrC2xfH3rxnfEL4pMqhLf6+JiP36V55C5cZQLY1EP
	SXD/kH4E957at7gGnCmIbDyWGsz3bAVD36vauNTWFF19C7XNVOcMCvNwJysgDoszTX7h/RsIwfLnR
	TdezZoF7UueYAKdIle4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSwrR-00000007Px6-3Wdt;
	Fri, 29 May 2026 13:02:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSwrP-00000007PwL-1thD
	for opensbi@lists.infradead.org;
	Fri, 29 May 2026 13:02:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 39BB9400F2;
	Fri, 29 May 2026 13:02:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1361B1F00898;
	Fri, 29 May 2026 13:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780059766;
	bh=NOCCVFMCGjzdQ13wi7pr6VJvQaPl3rfiqFQbqYLWA+c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RRsuHnUprPKMKiXQ6IWOobwXAThEW/T9cfEQiAH3AZ+AiO9xZP6QvwdeRSNgAeX3I
	 +iPHeL2++JS009tV3yD828nOHEskCl7s7F3tIj4f7fNTuAkOfQsVNjl5T3Mam1PbIt
	 NY5uttgCqIlmqZ8X6HrUl6bRRal0JvwNuXs3iRDxF3YJUHUpln22HJZmOzJNeFgC8/
	 LJvniEayXDnf9ay2WQ6EfHiVCyW6h8Ucbg+0BfyMrloWjcOll0SH4Bjy3CjO+lQvpd
	 bw4U9hYUGlhWWcUY4S3mINW+JDhyXbWSsFRcKT9HLMD6vQbwhVtJTPqs2KzJGHUWtY
	 KcbQ2GRDWJvBw==
Message-ID: <bb5ac4be-0d4c-4d3a-a922-f90dd29fa8c6@kernel.org>
Date: Fri, 29 May 2026 23:02:42 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] include: sbi_platform: Increase default stack size
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: opensbi@lists.infradead.org, Bo Gan <ganboing@gmail.com>
References: <edbce78c-71a7-41d7-aa81-3fa57241644a@iscas.ac.cn>
 <CAEev2e-MU3Gz3Ag5RV9YDQo+XqxS6Jrw0X+m83stqCLAqVr99A@mail.gmail.com>
Content-Language: en-US
From: Michael Ellerman <mpe@kernel.org>
In-Reply-To: <CAEev2e-MU3Gz3Ag5RV9YDQo+XqxS6Jrw0X+m83stqCLAqVr99A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_060247_511844_F32850BB 
X-CRM114-Status: GOOD (  15.34  )
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

T24gMjUvNS8yNiAxMToyMyBwbSwgQW5pcnVkaCBTcmluaXZhc2FuIHdyb3RlOgo+IEhpIFZpdmlh
biwKPiAKPiBPbiBTdW4sIE1heSAyNCwgMjAyNiBhdCAxMjo1M+KAr0FNIFZpdmlhbiBXYW5nIDx3
YW5ncnVpa2FuZ0Bpc2Nhcy5hYy5jbj4gd3JvdGU6Cj4+Cj4+IHNiaV9taXNhbGlnbmVkX3ZfbGRf
ZW11bGF0b3IoKSBoYXMgYSBsb2NhbCBidWZmZXIgKG5hbWVseSBtYXNrKSB3aGljaCBpcwo+PiA4
MTkyIGJ5dGVzIGluIHNpemUsIHNvIHRoZSBkZWZhdWx0IHN0YWNrIHNpemUgaXMgbm90IGVub3Vn
aC4gRG91YmxlIGl0Cj4+IHRvIDE2Mzg0Lgo+Pgo+PiBUaGlzIHN0YWNrIG92ZXJmbG93IGNhbiBi
ZSBvYnNlcnZlZCBieSBhbnkgUy1tb2RlIHNvZnR3YXJlIGFuZCBsZWFkcyB0bwo+PiBNLW1vZGUg
Y3Jhc2ggb3IgdW5leHBlY3RlZCBiZWhhdmlvciwgYXMgbG9uZyBhcyB0aGUgUy1tb2RlIHNvZnR3
YXJlIGRvZXMKPj4gbm90IGVuYWJsZSBGV0ZUIG1pc2FsaWduZWQgZGVsZWdhdGlvbiBbMV0uIFRo
aXMgbWF5IGJlIGNvbnNpZGVyZWQgYQo+PiB0ZW1wb3JhcnkgZml4IHVudGlsIGZ1cnRoZXIgZml4
ZXMgYXJlIG1hZGUgdG8gbWlzYWxpZ25lZCBoYW5kbGluZyBbMl0uCj4+Cj4+IExpbms6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L25ydnQ3NHFub2phdWJpd2pvMzd1bXM0bG5j
bHU0NjZob3Z3cmhtdGJhZzZmNXVocnFsQHE2bXNvZTJvdG80YiAjIFsxXQo+PiBMaW5rOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9vcGVuc2JpLzIwMjYwMjEwMDk0MDQ0LjcyNTkxLTEtZ2FuYm9p
bmdAZ21haWwuY29tICMgWzJdCj4+IFNpZ25lZC1vZmYtYnk6IFZpdmlhbiBXYW5nIDx3YW5ncnVp
a2FuZ0Bpc2Nhcy5hYy5jbj4KPiAKPiBUaGVyZSB3YXMgYSBzaW1pbGFyIHBhdGNoIFsxXSBmcm9t
IGZldyBkYXlzIGFnbyB0aGF0IG1ha2VzIHRoaXMgYQo+IEtjb25maWcgb3B0aW9uLiBFaXRoZXIg
b3B0aW9uIHdvdWxkIHdvcmsgdG8gZml4IHRoZSBidWcgSSBlbmNvdW50ZXJlZC4KTWFraW5nIHRo
ZSBzdGFjayBzaXplIGNvbmZpZ3VyYWJsZSBpcyBuaWNlLCBidXQgaXQncyBub3QgcmVhbGx5IGEg
Zml4IApmb3IgdGhpcyBidWcgaWYgdGhlIHVzZXIgaGFzIHRvIGtub3cgdG8gaW5jcmVhc2UgdGhl
IHNpemUuCgpTbyBzb21lIGNvbWJpbmF0aW9uIG9mIHRoZSB0d28gcGF0Y2hlcyB3b3VsZCBiZSBi
ZXN0IElNSE8uCgpXaGF0IEknbSBub3QgY2xlYXIgb24gaXMgd2hldGhlciBqdXN0IGJ1bXBpbmcg
dG8gYSAxNktCIG1pbmltdW0gYWx3YXlzIAppcyBhY2NlcHRhYmxlLiBBcmUgdGhlcmUgZm9sa3Mg
cnVubmluZyBvbiBtZW1vcnkgY29uc3RyYWluZWQgc3lzdGVtcyAKdGhhdCBkb24ndCB3YW50IHN0
YWNrIHRoYXQgYmlnPwoKSWYgeW91J3JlIG5vdCBidWlsZGluZyB0aGUgdmVjdG9yIGVtdWxhdGlv
biBjb2RlIGluIHRoZW4gOEtCIGlzIApwcmVzdW1hYmx5IGZpbmUuCgpjaGVlcnMKCi0tIApvcGVu
c2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
