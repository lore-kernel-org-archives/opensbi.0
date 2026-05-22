Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36779CD4F5B
	for <opensbi@archiver.kernel.org>; Fri, 22 May 2026 05:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=leX7xqSzurrgzxh8CCjieaH4dgCBhYxIT8RUFqiaN9I=; b=V5gAO2gdnjbvtU
	4lIOfIcAhtf1Nqjhv1QftW3ncWA9XBQvt0qP2gNMZ5Di/cV0gYbIUHgrwibnKODxJe3I6T/W9lCMT
	/6xszR2GHTbqFLYiRkWO8mzEBcoYsyHN77wu5lwSPkxW9VSBnBBHiCMWFHovk9irlwCxE5wfC/n7x
	/qfCvKds+Ka7czVKbX1ipB3w3hxle94S9xmFiJ5glMU03QdIsldokFGUAcKIThbY95AX6fmrCgJGY
	cbPrjgzBt6yBHcFjMW4GCdomsI4dHBYF/qcJ5vUa4CGSZRYi7wI1XTZoq3v3oOIl+AVA94Y5EtyA1
	bHe7H9n4wbbGmnOSv7Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQHzc-00000009o64-1RSP;
	Fri, 22 May 2026 05:00:16 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQHza-00000009o5X-0aih
	for opensbi@lists.infradead.org;
	Fri, 22 May 2026 05:00:15 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-395317d8852so60289871fa.2
        for <opensbi@lists.infradead.org>; Thu, 21 May 2026 22:00:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779426011; cv=none;
        d=google.com; s=arc-20240605;
        b=L/cPHBmSKonWlAB8mD+2diVZaa65qLefZHF1aBLnikv8xDeeHS305i6yRRe8VQtOyG
         m+nLeBlIYsWlYn+xRg04umawoY8WeabhB8UZ+3IAZT2XtZdmBm8Q66ApWxsf91wAT1NI
         j7qG9+pwTCRwYfNmfjWO2mN3L7a3JY/UnDMTSWiPmZUJ68FllloWqwLJs/2FppOgBSHP
         hdGS2aQ8r8KlhjZOeAvDgy7/PSAr9RZIrVokSHNDSXZPXml3Dh8u/QRhd/pJsx9GFhAv
         xaxp42D9JgeJCMi1bN9EPCVEurMkYV3WD9HGdkHpxhlg5kVeBvn+vp//va63ZDhYk7bT
         3yUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wvnJQjrtfeFdQppMqAp9PPDQItUEllIcU2rUP1ffoYg=;
        fh=4xqYwAYwrKd10EBWbR5Irc/FjLW7+VnD52vHGQd/ZcE=;
        b=gLZhyRxMpxk+/s300cnBacNZhVM2Vb17ZfH/fwneSJyJyqSkB4ON0CejbG0PDiQceZ
         RH3wmtodvUai1ZSY83aP/VJb13tyZs0XZE/FDbsEgZKl27a9jOeiH2OVMHKQeeIIoN5J
         079s0EV8yzxWAe8o0x0+6OvTQVeXGlqcnGe3OPC8Enlc77vwdbCXvzpB8eBnbXf/0Vvf
         emVoOvBL8nztjHt3/IYfszdghIVWg1iwRUvUHRICM45/trQ/4Pogts+NGKLXHSXKxrQf
         rSxiTInzQWQ4rt8nxLtQNptERbo22qiGT6N96pvNWQJv7Mc5EITSCtSFvKU6p5wWRY1q
         PCJw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1779426011; x=1780030811; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wvnJQjrtfeFdQppMqAp9PPDQItUEllIcU2rUP1ffoYg=;
        b=eJEsvV+mVQPM/ub04jfXqzCexHKlN+kKC+EhZqQY26fpYhNfS3k6AMYLTwhnjy8Xgf
         3ohe1UbemoBy+nCpdk5Gkmc72Hdq8SgR0hA4QXz3SIjwo2Fn+S/0ce6LjtTFn9q6XD0s
         KfNYJRloNkp2dNP2ylkEqMYzanhrMvfcwScUh/nPXTJJvY28HJmkaRqLs4bo+RukVquu
         /i8uL0ZElL8Ilep7pIAfHigDYvCgGC/t6q/nXm9I4fVWutopzWEveHWbrvpbRc38PS3c
         yrxMpker2MSvL5PEemLeRKabnEZD8Js9rcFFF9yqDNg4xVimGjx5Dwez728nYanEZ5eL
         LgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779426011; x=1780030811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wvnJQjrtfeFdQppMqAp9PPDQItUEllIcU2rUP1ffoYg=;
        b=DS0aMs1S2mvQE7MJTLIwW2RmuLQyssOuPMJcUDdenw5FeMyl9OzcpisFKKvOQFRc96
         o32JD5lW/HYhMGoiYu0wGWHq9l7Lzpe+WZb2JIp47IvpmLCc0PO8lYP+yVs8aHnexV8W
         9UZ5sEAahaC/6BjnSt1ijt7brzQlNDzo6Z3+EZ2ext/pfLvew3CNneYTLLcSetVXHg/S
         7PYP1+QqEZPRW/IIRnD06iz0hjQsEwqjlIHpYdULI+NfIhfs9kbquPGQ1jF2keWHgOWj
         /rMfqJP8/Se/RwkkukHdscr//hqkUZP9H4/ERiOoOMuuUfH0+NTqBNejbP6VKnBjoTaN
         aoLg==
X-Gm-Message-State: AOJu0Ywrgvk7sijtxAX5FLRu4xVGCLr6aZqql4reWkgl907h1VhM3Uvx
	EjEshIBLQo4mlK5hUvlAtS3W8XU9geet3jFRVmHLh+DBEMYnEG0LnrwytqU9IBB4GKS4uqu6ouh
	2iOgy014HUR+4yfWiT8AYVHCyX+kbwFm3A65a5YgiJ5495ZGlopD2kNY=
X-Gm-Gg: Acq92OGMdyjsDwzdaI1byfaZqM3qifqnN/Yszq5Ven9qaI9y/pLegBMCPnv18fSzKog
	HrS0wl2ipijxiqDpa32ORWOwn846YPZpJlENs9D8X2NIp7y4M0zf+7PmaTt6H2+Bl3YxHUgBC1C
	l/3r8MBZuEOHP7YFYfgC46Pym3eAt9bKdDJ051BcsTXkDxyDJdlaOajUoQ0wmuN9SbxPT1cV1qb
	XRXk4iD3pw3e3qUV90gNBB76Y0h30FvcRjEI8vrPBaV+/9DksJHe1j4TJ85hvVQIqPbdHF6eBO8
	a9N15AS3VUdmrIRW8wBlwOMdUMOk9ydg2RRdwW8vpwGrBM9qcx5j
X-Received: by 2002:a19:f507:0:b0:5a8:6c7b:f9d7 with SMTP id
 2adb3069b0e04-5aa323d4e71mr347095e87.41.1779426010986; Thu, 21 May 2026
 22:00:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260521052838.2174588-1-himanshu.chauhan@oss.qualcomm.com>
In-Reply-To: <20260521052838.2174588-1-himanshu.chauhan@oss.qualcomm.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 22 May 2026 10:29:59 +0530
X-Gm-Features: AVHnY4IxvEaLa_Ildko-ItC_5T2JErOnhA_-9MkfsA9Ftp1o9kIy6OIkH60_Cvc
Message-ID: <CAK9=C2U0RUqjSN4qJpEvUQ5A4nTDRkDeu_4Ta6_mCj31Uq-rHQ@mail.gmail.com>
Subject: Re: [PATCH] sbi: mpxy: define INVALID_ADDR using unsigned long width
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_220014_207047_0B4C685B 
X-CRM114-Status: GOOD (  16.12  )
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

T24gVGh1LCBNYXkgMjEsIDIwMjYgYXQgMTA6NTnigK9BTSBIaW1hbnNodSBDaGF1aGFuCjxoaW1h
bnNodS5jaGF1aGFuQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gSU5WQUxJRF9BRERSIGlz
IHVzZWQgYXMgYW4gYWxsLW9uZXMgcGh5c2ljYWwgYWRkcmVzcyBzZW50aW5lbC4KPiBVc2luZyAt
MVUgb25seSBndWFyYW50ZWVzIDMyLWJpdCB3aWR0aCwgc28gb24gcGxhdGZvcm1zIHdoZXJlCj4g
dW5zaWduZWQgbG9uZyBpcyB3aWRlciBpdCBtYXkgbm90IGV4cGFuZCB0byBhbGwgb25lcyBhZnRl
ciBhc3NpZ25tZW50Lgo+Cj4gVXNlIC0xVUxMIHNvIHRoZSBjb252ZXJzaW9uIHRvIHVuc2lnbmVk
IGxvbmcgcHJlc2VydmVzIGFuIGFsbC1vbmVzCj4gYml0IHBhdHRlcm4gYWNyb3NzIHN1cHBvcnRl
ZCB3aWR0aHMuCj4KPiBGaXhlczogNzkzOWJmMTMyOWViICgibGliOiBzYmk6IEFkZCBTQkkgTWVz
c2FnZSBQcm94eSAoTVBYWSkgZnJhbWV3b3JrIikKPiBTaWduZWQtb2ZmLWJ5OiBIaW1hbnNodSBD
aGF1aGFuIDxoaW1hbnNodS5jaGF1aGFuQG9zcy5xdWFsY29tbS5jb20+CgpUaGlzIGlzIGNyaXRp
Y2FsIGZpeCBoZW5jZSBtZXJnaW5nIGl0IHF1aWNrbHkuCgpSZXZpZXdlZC1ieTogQW51cCBQYXRl
bCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yv
b3BlbnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBsaWIvc2JpL3NiaV9tcHh5LmMg
fCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX21weHkuYyBiL2xpYi9zYmkvc2JpX21weHkuYwo+
IGluZGV4IGE4M2NmMTZjLi43OTg1MTA5NyAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9tcHh5
LmMKPiArKysgYi9saWIvc2JpL3NiaV9tcHh5LmMKPiBAQCAtMjgsNyArMjgsNyBAQCBzdGF0aWMg
dW5zaWduZWQgbG9uZyBtcHh5X3NobWVtX3NpemUgPSBQQUdFX1NJWkU7Cj4gIHN0YXRpYyBTQklf
TElTVF9IRUFEKG1weHlfY2hhbm5lbF9saXN0KTsKPgo+ICAvKiogSW52YWxpZCBQaHlzaWNhbCBB
ZGRyZXNzKGFsbCBiaXRzIDEpICovCj4gLSNkZWZpbmUgSU5WQUxJRF9BRERSICAgICAgICAgICAo
LTFVKQo+ICsjZGVmaW5lIElOVkFMSURfQUREUiAgICAgICAgICAgKC0xVUxMKQo+Cj4gIC8qKiBN
UFhZIEF0dHJpYnV0ZSBzaXplIGluIGJ5dGVzICovCj4gICNkZWZpbmUgQVRUUl9TSVpFICAgICAg
ICAgICAgICAoNCkKPiAtLQo+IDIuNDMuMAo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0
Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3Bl
bnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbnNiaQo=
