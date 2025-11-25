Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03ACD0EE1C
	for <opensbi@archiver.kernel.org>; Tue, 25 Nov 2025 19:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vJDh5XZwJw1R7MnQKHjhCnm9V4WdiKZD6uwkkf1QdCQ=; b=UDYnRbRZacpp1K
	LAprNWuwNzRaT/rDq8FnKxNNAkWxMFQkAt/4XZc74dfxY6NjjazJZdL1c3U1qtu8Mx+Xhc2/EyPHW
	S3jtslGKl6cMzsQsuyNGV6s4QQCjeV/HgcBAiNqO8hR9HKNIpdVXHbohaCu5sXuppJcfeYc0pKUC8
	DjTey96ISNl9t/g8Mcuem/Q3PZzAYzyrmC2FCWFbh/xgNmbh3c3/gEMaZw9wA4iX/vmGdUZnvWiJO
	Kclpvs3jABX7XCv/O+mJfLGmKY/Bkd3NFh+g9fApNKzIacYrj0RBHUmDuu1zuoPW+yufBYFnhpL8t
	RkVRzdxUxPJhveESrnDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNz2I-0000000DrIT-2dQy;
	Tue, 25 Nov 2025 19:49:14 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNz2G-0000000DrHe-1sE1
	for opensbi@lists.infradead.org;
	Tue, 25 Nov 2025 19:49:13 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4779e28ebefso5076645e9.2
        for <opensbi@lists.infradead.org>; Tue, 25 Nov 2025 11:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1764100150; x=1764704950; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZnCdg7OGFK85Zco5NFA88xhI6GGFMgkzeU1Q9ityZI=;
        b=UIxYm+WrHR+rprQ2NHvJ/ru4lsvC2vaFTx/oJjpItK18UidUnjzbxpsgcsBF0G5is+
         1or2vesNr0uHI32ja1McgnqBD+9QIMCYrc33x0/TDB4XzcGQz9aA4rO6yz7uPLtKAdm4
         SCyhQU1ooJrizOH6/usCPuPDwNX2nHzVVZ0gsLSIjLup3NW3r5GRhZDGE7ABY5dN/7Yn
         APnJ2/v/W4cADl15yvr16MuLm/pPCiYjSRoWzmuo1puQLaxS6dPlhYXlCu3K0js7lzWs
         TW9c43k7DUl0O/3ZFdD0NyjFHMn83f6mTvzFMK3dZQIIcl6eXTZCUkAJ4dtZBQDShQ3B
         NC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764100150; x=1764704950;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZZnCdg7OGFK85Zco5NFA88xhI6GGFMgkzeU1Q9ityZI=;
        b=eBuBJuOa79E+kPAdoRndmeD0FxdxbtzXbgYmYl6o+O7HEqU8H868gDr2z4I3F6x+0C
         oBH809ufTNyDYrzigDRjXkpldQGmQ4X9Bx/Ne07kkTKQiDTHfr0phM/rBLjcfj8f7j+d
         qitfnddbKMa7k9zVoyK1AyV6bD5jp21n9WkIvX0vj6e0v9IjQBJzk/LRU21RDeMJY4g/
         kj+oqSHPf4Oyp9jl+anqrs6SXEQFLG+jhL1tud0mkQ4DtRfQ722Q0Xd2voI6qUuzmITg
         kL0HLHPR0RxwCqIzotbEpf8fF4njGoIRg8ijAlUWOL6irV3c25nI03Vb05W5kLlcd7rg
         0v3A==
X-Gm-Message-State: AOJu0YxpmCkYPhTmxzs2BL9KlXR0OgaSnTnVTjKiR79OVzRqtwWi5f2U
	y7BGLHPCr1G9IV8iRO9ND2pWQRMG1YBY0L9tLHC+V7qyZ0dIjHO6U4ZH4X3vsRG1PBc=
X-Gm-Gg: ASbGncu6zev48djcdNkW1J8ScqqyDCeq9Wkm5nhusD8IZ0MVbf1/NEz5YHpOYPd3Fv/
	5K0ilQ2GHqKF/jRW67IU7cvyb7aHYRdR7ZQHq414IFKORbJq8pij644qO92hARsFSHTzSCwGMYX
	d+40yQEkfzR5bNnvEPcWC64MXwBqcknVBMeSjYdW/N3p822ZdxMKBB9XvQe76o4Otl7Nmrdf1H+
	CIGgPJrx8nEWk2cv/TMOIvYgo2wyQf13xok6SLBJ36IcaVx1KV16A/GSmznjjb8DZAHPdBsOBKG
	WSaUh74/PwfSqytR0pyj9Bzd7xGud7Nj0JR4DHTFMW3Vlc+F8ISe9OALlUC32eAz/bgPCjs2t5O
	dpbpxZRWhoMXVVFEy5ytZjzwY1DYEuW6cgxulVhLfCKUTEJb/D71XIbSVtsM76XPvAxirupCLaQ
	w=
X-Google-Smtp-Source: AGHT+IF/BZhtNeDPxE79ow0uOQjr/1imprxNfhxLd7c3+Qes4+CrIUaXJ7AmtRgCQhjfV7sLPNN+lQ==
X-Received: by 2002:a05:600c:470b:b0:471:ab1:18f5 with SMTP id 5b1f17b1804b1-477c31562ecmr95961005e9.7.1764100150546;
        Tue, 25 Nov 2025 11:49:10 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::3052])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47906cb1f60sm21186195e9.1.2025.11.25.11.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 11:49:10 -0800 (PST)
Mime-Version: 1.0
Date: Tue, 25 Nov 2025 20:48:35 +0100
Message-Id: <DEI1ATBUEOYS.25ZYOU3OFGQLE@ventanamicro.com>
Subject: Re: [PATCH] lib: sbi: expected trap must always clear MPRV
Cc: <opensbi@lists.infradead.org>, "opensbi"
 <opensbi-bounces@lists.infradead.org>
To: "Deepak Gupta" <debug@rivosinc.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20251124220339.3695940-1-debug@rivosinc.com>
 <DEHQBF6B4C9L.125VJJV9WIVFK@ventanamicro.com>
 <aSXvYP2OvUzePP8F@debug.ba.rivosinc.com>
 <DEI035QOBYW1.3MQ044IEZOUH9@ventanamicro.com>
 <aSYAyc347ybLinMS@debug.ba.rivosinc.com>
In-Reply-To: <aSYAyc347ybLinMS@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_114912_526569_EC3C3B17 
X-CRM114-Status: GOOD (  16.65  )
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

MjAyNS0xMS0yNVQxMToxNzoyOS0wODowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5j
b20+Ogo+IE9uIFR1ZSwgTm92IDI1LCAyMDI1IGF0IDA3OjUxOjM0UE0gKzAxMDAsIFJhZGltIEty
xI1tw6HFmSB3cm90ZToKPj4yMDI1LTExLTI1VDEwOjAzOjEyLTA4OjAwLCBEZWVwYWsgR3VwdGEg
PGRlYnVnQHJpdm9zaW5jLmNvbT46Cj4+PiBPbiBUdWUsIE5vdiAyNSwgMjAyNSBhdCAxMjoxMjox
MVBNICswMTAwLCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+Pj4yMDI1LTExLTI0VDE0OjAzOjM5
LTA4OjAwLCBEZWVwYWsgR3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT46Cj4+Pj4+IEV4cGVjdGVk
IHRyYXAgbXVzdCBhbHdheXMgY2xlYXIgTVBSVi4gQ3VycmVudGx5IGl0IGRvZXNuJ3QuIFRoZXJl
IGlzIGEKPj4+Pj4gc2VjdXJpdHkgaXNzdWUgaGVyZSB3aGVyZSBpZiBmaXJtd2FyZSB3YXMgZG9p
bmcgbGQvc3Qgd2l0aCBNUFJWPTEgYW5kCj4+Pj4+IHNpbmNlIHRoZXJlIHdvdWxkIGJlIGEgZXhw
ZWN0ZWQgdHJhcCwgb3BlbnNiaSB3aWxsIGNvbnRpbnVlIHRvIHJ1biBhcwo+Pj4+PiBNUFJWPTEu
IFNlY3VyaXR5IGltcGFjdCBpcyBEb1Mgd2hlcmUgb3BlbnNiaSB3aWxsIGp1c3Qga2VlcCB0cmFw
cGluZy4KPj4+Pgo+Pj4+RG9lcyB0aGUgRG9TIGhhcHBlbiBvbiBzb21lIGltcGxlbWVudGF0aW9u
Pwo+Pj4KPj4+IEkgcmFuIGludG8gaXQgd2hpbGUgZG9pbmcgc29tZXRoaW5nIGVsc2UuIFNvIGl0
IHdhcyByZXN1bHQgb2YgYmFzaWNhbGx5Cj4+PiBleWViYWxsaW5nLiBEaWRuJ3Qgb2JzZXJ2ZSBv
biByZWFsIHN5c3RlbS4KPj4+Cj4+Pj4KPj4+PlRoZSBleHBlY3RlZCB0cmFwIGNhbWUgZnJvbSBN
LW1vZGUsIHRoZXJlZm9yZSB3aWxsIGhhdmUgbXN0YXR1cy5NUFA9MywKPj4+PnNvIE1QUlY9MSBz
aG91bGQgYmVoYXZlIHRoZSBzYW1lIGFzIE1QUlY9MC4KPj4+Cj4+PiBZZWFoIEkgbWlzc2VkIHRo
YXQgcGFydC4gWW91IGhhdmUgYSBwb2ludCBoZXJlLgo+Pj4KPj4+IEhvd2V2ZXIgaWYgd2UgcmVh
ZCBwcml2IHNwZWMKPj4+ICIyMS40LjEuIE1hY2hpbmUgU3RhdHVzIChtc3RhdHVzIGFuZCBtc3Rh
dHVzaCkgUmVnaXN0ZXJzIgo+Pj4KPj4+IC4uLgo+Pj4gVGhlIE1QViBiaXQgKE1hY2hpbmUgUHJl
dmlvdXMgVmlydHVhbGl6YXRpb24gTW9kZSkgaXMgd3JpdHRlbiBieSB0aGUKPj4+IGltcGxlbWVu
dGF0aW9uIHdoZW5ldmVyIGEgdHJhcCBpcyB0YWtlbiBpbnRvIE0tbW9kZS4gSnVzdCBhcyB0aGUg
TVBQCj4+PiBmaWVsZCBpcyBzZXQgdG8gdGhlIChub21pbmFsKSBwcml2aWxlZ2UgbW9kZSBhdCB0
aGUgdGltZSBvZiB0aGUgdHJhcCwKPj4+IC4uLgo+Pj4KPj4+IEFib3ZlIHRleHQgc2VlbXMgdG8g
c3VnZ2VzdCB0aGF0IG5vbWluYWwgcHJpdmlsZWdlIGF0IHRpbWUgb2YgdHJhcCBpcwo+Pj4gc2V0
IGluIE1QUC4KPj4+Cj4+PiBBbmQgdGhlbiBqdXN0IGEgZmV3IHBhcmFncmFwaCBiZWxvdyBpZiB3
ZSByZWFkLAo+Pj4KPj4+IC4uLgo+Pj4gV2hlbiBNUFJWPTEsIGV4cGxpY2l0IG1lbW9yeSBhY2Nl
c3NlcyBhcmUgdHJhbnNsYXRlZCBhbmQgcHJvdGVjdGVkLAo+Pj4gYW5kIGVuZGlhbm5lc3MgaXMg
YXBwbGllZCwgYXMgdGhvdWdoIHRoZSBjdXJyZW50IHZpcnR1YWxpemF0aW9uIG1vZGUKPj4+IHdl
cmUgc2V0IHRvIE1QViBhbmQgdGhlIGN1cnJlbnQgbm9taW5hbCBwcml2aWxlZ2UgbW9kZSB3ZXJl
IHNldCB0byBNUFAKPj4+IC4uLgo+Pgo+PkkgdGhpbmsgdGhhdCBNUFJWIGRvZXNuJ3QgY2hhbmdl
IHRoZSBub21pbmFsIHByaXZpbGVnZSBtb2RlLgo+Pk1QUlYganVzdCBtb2RpZmllcyBleHBsaWNp
dCBtZW1vcnkgYWNjZXNzZXMgdG8gYmVoYXZlICJhcyB0aHJvdWdoIiB0aGUKPj5ub21pbmFsIHBy
aXZpbGVnZSBtb2RlIHdhcyBNUFAuCj4+Cj4+ZS5nLiBsb2FkIGluc3RydWN0aW9uIGZldGNoZWQg
d2l0aCBNLW1vZGUgaW1wbGljaXQgYWNjZXNzIChub21pbmFsCj4+cHJpdmlsZWdlKSBwZXJmb3Jt
cyBub24tTS1tb2RlIGV4cGxpY2l0IGxvYWQgKGVmZmVjdGl2ZSBwcml2aWxlZ2UpLgo+Pgo+PihU
aGUgYXJjaGl0ZWN0dXJlIHdvdWxkIGJlIGJyb2tlbiBvdGhlcndpc2UuKQo+Cj4gWWVhaCBJIHVu
ZGVyc3RhbmQgdGhhdCdzIHRoZSBkZXNpcmVkIGJlaGF2aW9yLgo+IEFsdGhvdWdoIGN1cnJlbnQg
cGF0Y2ggaXMgYWRkaXRpb25hbCBzYWZldHkgYW5kIHRoYXQgdG9vIGluIG5vdCB2ZXJ5IHBlcmYK
PiBjcml0aWNhbCBwYXRoLgo+Cj4gRG8geW91IHNlZSBhbnkgaXNzdWUgd2l0aCBhZGRpdGlvbmFs
IHNhZmV0eSBwYXJ0IGluIHRoZSBwYXRjaD8KCkFsbCBjb2RlIGlzIGFuIGlzc3VlLCBhbmQgSSBk
b24ndCBzZWUgYSByZWFsIGJlbmVmaXQgdG8gYmFsYW5jZSBpdCBvdXQsCmJ1dCBJIHRoaW5rIGl0
J3MgYWNjZXB0YWJsZSBpZiBvcGVuc2JpIG1haW50YWluZXJzIGxpa2UgdGhlIGlkZWEuCgo+IEkg
Y2FuIG1vZGlmeSB0aGUgY29tbWl0IG1lc3NhZ2UgdG8gcmVtb3ZlIHNlY3VyaXR5IGltcGFjdCAo
dGhhdCBpdCBzZWVtcyBsaWtlCj4gaG93IGltcGxlbWVudGF0aW9ucyBhcmUgaW1wbGVtZW50aW5n
IGl0KSBhbmQgcmUtc2VuZCBpdC4KClRoYXQgd291bGQgaGVscC4gIFRoZSBwYXRjaCBhbHNvIHVz
ZXMgYSB3cm9uZyBiaXRtYXNrIGZvciBjc3JjOgpNUFJWIGlzIGJpdCAxNywgYnV0IHlvdSdyZSBj
bGVhcmluZyBiaXQgNSwgU1BJRS4KKElzbid0IGl0IHBvc3NpYmxlIHRvIHVzZSBNU1RBVFVTX01Q
UlYgdGhlcmU/KQoKVGhhbmtzLgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5zYmkK
