Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003C8D5B846
	for <opensbi@archiver.kernel.org>; Mon, 15 Dec 2025 15:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3tT9bghBMR+Iw+EiZPfUSOGwKTn/RKiwWB9JwUx0NTI=; b=hHfDQT7agiC1or
	RoegZWuPyNeSWtGStIavuOlvlMuh91qGe82w6OTaQKJuU6kBv82sWXXv8NsBciPMnUI6rozKXTn+d
	hV4paV0YSyKuKNRRdGWmmKdJO/lNemV7j7+DivLsaQkyOL/rIf/L/FwDVNntU2XGo0VAfQQOfGJPv
	c0UsDxxkzyNzblI5gcL9ufPeo/KzSgiPctTnHZQogEv8UTBLwCEpdAT3SNtoG47KQe28xf3SdtZYy
	PLmH1w7AurWzJ2hcOHfczQM4zHa1xToFhfUt+SgW5yzP3DuuOGYUEcQCywtQMciP7LcLu4PhBF6gm
	C2z9IrCt4A8LjnBbCOQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAwa-00000003wZt-2hiF;
	Mon, 15 Dec 2025 15:57:04 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAwX-00000003wZA-0P3n
	for opensbi@lists.infradead.org;
	Mon, 15 Dec 2025 15:57:02 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-65b3843853bso2304153eaf.2
        for <opensbi@lists.infradead.org>; Mon, 15 Dec 2025 07:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1765814220; x=1766419020; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cis72XFUxz31DAXLDLSjnENsh4nwTiGb+wx0oWA6lag=;
        b=KCEw3Y0trC1b9NuUIKCncOxF6fbvyX39jkeeUgoDoAN+hqfbcf+l4QSa6PKTSJB6Oa
         L6gevt6D+HdUCzeXaHegmi9Z7+k9HZ9z4epGFP+A3TOz/7od+E2D31hbQ4WPHb0oLfce
         BPOTXBQxASF+9ev94JnmNW3zfis5KRb7G2K9qnBX33rljUuqMKpKwdd7q/qc9Ruzhvzq
         H0TD7xUqZS83lRCYmwdXtLB78Xxud4YMhMP+OQgYoHe+H2f4zGx01XSrwUzdDXH7ll5N
         /ASKEcptukAimghVa625SBnchRDyURlrc/c9xas5FERbkyzTywmSc7/+1okFuw9jlMoc
         nMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765814220; x=1766419020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cis72XFUxz31DAXLDLSjnENsh4nwTiGb+wx0oWA6lag=;
        b=iWq21RXHMC7Co/AAPbuB3jCN2v4PKwn97kdMXGX6lymOI+4SddMXsFaHub8FdA73wE
         gXxsGRnRflZjPWA3BPXrgouQ4zd+I7FalXH4+ecXR0vWmu5kB82AxkXF3Zp4XO0Rl4r5
         zo4PBfEDHu89RHWfhch0jj9egbT1p5Fn6mGL5ssyQXSq1nUmMozIX1GC/45PYp4hqkHn
         RW3AMgcLqbiF2fPNlgwfHASlSGzmQxzTLIgCWVi7XzhNd+aSxVybb13Zqs8uibqZKDKn
         dUHUczNvndhOoK+bPlQa9RBAGq5pCz/H1cE0b/g6b8NeTmwdLutlW9C0nZimCto62mm6
         6VNQ==
X-Gm-Message-State: AOJu0YzXAq9IkrszQgDePu13jVVrGmgp8+AWQpUwLHMk4zwn/kiY6GXz
	dNEjjUeaqgpBmc/eelYiaZtOrFvuXJJVuAcUb7qK7uz+UF0MQB5otB7Gu9jGVDTkLVx5hrVpZRG
	xnpyfR7tP1OvJC9bcVOGJSUjLV7mvKDdlhuU0zNts3A==
X-Gm-Gg: AY/fxX5YFDOXtjs+Lk2a7OO3hO3nLO9x8Plfx5oD2w70nSebKV53xBPmKG1MiH6SYwM
	Gv1w1k593KahYg0UBgaJAPFYrhMjCVoUezvdr2vopKFD1TCwKUJK1wNUELNDX4fP1uWcUHIiImb
	O1bu8qTy/M8zz9SxNH2cVeT5DWLer2v57sSTXfm92yKnuX/wGfzXXAHPXS/++9ahVeC+YykZEAi
	UYU48+TmMO5/rw5c498x5CpYBf8j3iFZTe3CCAJtjGjBx8XzkuBuTpbEI6Ut2nmG+kED+otQtve
	ynK1CQ==
X-Google-Smtp-Source: AGHT+IFYbmWGH1Z2x9GpCM7e9w2eyCnRHj+NOxqIsQuktko8NGIwBhAzb62o9oyd4WCADFB5lbLON00dJ2YAZ953fYs=
X-Received: by 2002:a4a:edc7:0:b0:659:9a49:9087 with SMTP id
 006d021491bc7-65b452c4a22mr4361229eaf.82.1765814219850; Mon, 15 Dec 2025
 07:56:59 -0800 (PST)
MIME-Version: 1.0
References: <20251114203842.13396-1-b.freisen@gmx.net> <20251114203842.13396-6-b.freisen@gmx.net>
In-Reply-To: <20251114203842.13396-6-b.freisen@gmx.net>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 15 Dec 2025 21:26:48 +0530
X-Gm-Features: AQt7F2oCxWdPaxDARd4-R_K5_qOCdhBW39uuHG2HXh9lsXZdgjcG_IZvXOORxLY
Message-ID: <CAAhSdy11VdyeKEtTTH0XmR0_BFZTEqGeP9a0CYxAecG5cA1www@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] lib: sbi: Workaround for FENCE(.I) errata on C906, C910.
To: Benedikt Freisen <b.freisen@gmx.net>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_075701_145985_F8B4203A 
X-CRM114-Status: GOOD (  16.53  )
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

T24gU2F0LCBOb3YgMTUsIDIwMjUgYXQgMjowOeKAr0FNIEJlbmVkaWt0IEZyZWlzZW4gPGIuZnJl
aXNlbkBnbXgubmV0PiB3cm90ZToKPgo+IEFjY29yZGluZyB0byB0aGUgUklTQ1Z1enogcGFwZXIg
YnkgVGhvbWFzIGV0IGFsLiwgdGhlIFQtSGVhZC9YdWFuVGllIEM5MDYKPiBhbmQgQzkxMCBjb3Jl
cyBmYWlsIHRvIGlnbm9yZSByZXNlcnZlZCBmaWVsZHMgaW4gdGhlICJmZW5jZSIgYW5kICJmZW5j
ZS5pIgo+IGVuY29kaW5ncyBhbmQgdHJpZ2dlciBpbGxlZ2FsIGluc3RydWN0aW9uIHRyYXBzIGlm
IHRoZXNlIGZpZWxkcyBhcmUgbm9uLXplcm8sCj4gc28gYWRkcmVzcyB0aGF0IGluIHRoZSBpbGxl
Z2FsIGluc3RydWN0aW9uIHRyYXAgaGFuZGxlci4KPgo+IFNpZ25lZC1vZmYtYnk6IEJlbmVkaWt0
IEZyZWlzZW4gPGIuZnJlaXNlbkBnbXgubmV0Pgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9yaXNjdl9l
bmNvZGluZy5oIHwgIDQgKysrKwo+ICBsaWIvc2JpL3NiaV9pbGxlZ2FsX2luc24uYyAgIHwgMTcg
KysrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspCj4K
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvcmlzY3ZfZW5jb2RpbmcuaCBiL2luY2x1ZGUvc2Jp
L3Jpc2N2X2VuY29kaW5nLmgKPiBpbmRleCAyOTcwYmEwLi5kOTU2ZWJiIDEwMDY0NAo+IC0tLSBh
L2luY2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmgKPiArKysgYi9pbmNsdWRlL3NiaS9yaXNjdl9l
bmNvZGluZy5oCj4gQEAgLTk0NCw4ICs5NDQsMTIgQEAKPiAgI2RlZmluZSBJTlNOX01BU0tfV0ZJ
ICAgICAgICAgICAgICAgICAgMHhmZmZmZmYwMAo+ICAjZGVmaW5lIElOU05fTUFUQ0hfV0ZJICAg
ICAgICAgICAgICAgICAweDEwNTAwMDAwCj4KPiArI2RlZmluZSBJTlNOX01BU0tfRkVOQ0UgICAg
ICAgICAgICAgICAgICAgICAgICAweDAwMDA3MDdmCj4gKyNkZWZpbmUgSU5TTl9NQVRDSF9GRU5D
RSAgICAgICAgICAgICAgIDB4MDAwMDAwMGYKPiAgI2RlZmluZSBJTlNOX01BU0tfRkVOQ0VfVFNP
ICAgICAgICAgICAgMHhmZmYwNzA3Zgo+ICAjZGVmaW5lIElOU05fTUFUQ0hfRkVOQ0VfVFNPICAg
ICAgICAgICAweDgzMzAwMDBmCj4gKyNkZWZpbmUgSU5TTl9NQVNLX0ZFTkNFX0kgICAgICAgICAg
ICAgIDB4MDAwMDcwN2YKPiArI2RlZmluZSBJTlNOX01BVENIX0ZFTkNFX0kgICAgICAgICAgICAg
MHgwMDAwMTAwZgo+Cj4gICNkZWZpbmUgSU5TTl9NQVNLX1ZFQ1RPUl9VTklUX1NUUklERSAgICAg
ICAgICAgMHhmZGYwNzA3Zgo+ICAjZGVmaW5lIElOU05fTUFTS19WRUNUT1JfRkFVTFRfT05MWV9G
SVJTVCAgICAgIDB4ZmRmMDcwN2YKPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaWxsZWdhbF9p
bnNuLmMgYi9saWIvc2JpL3NiaV9pbGxlZ2FsX2luc24uYwo+IGluZGV4IGZhODIyNjQuLmVkNTFm
NGQgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfaWxsZWdhbF9pbnNuLmMKPiArKysgYi9saWIv
c2JpL3NiaV9pbGxlZ2FsX2luc24uYwo+IEBAIC00Miw2ICs0MiwyMyBAQCBzdGF0aWMgaW50IG1p
c2NfbWVtX29wY29kZV9pbnNuKHVsb25nIGluc24sIHN0cnVjdCBzYmlfdHJhcF9yZWdzICpyZWdz
KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiAgICAgICAgIH0KPgo+ICsjaWZkZWYgQ09O
RklHX1RIRUFEX0M5WFhfRVJSQVRBCj4gKyAgICAgICAvKiBFcnJhdGEgd29ya2Fyb3VuZDogQzkw
NiwgQzkxMCBmYWlsIHRvIGlnbm9yZSByZXNlcnZlZCBmaWVsZHMKPiArICAgICAgICAqIGluIHRo
ZSBgZmVuY2VgIGFuZCBgZmVuY2UuaWAgZW5jb2RpbmdzLiBbVGhvbWFzMjAyNFJJU0NWdXp6XSAq
Lwo+ICsgICAgICAgaWYgKChpbnNuICYgSU5TTl9NQVNLX0ZFTkNFKSA9PSBJTlNOX01BVENIX0ZF
TkNFKSB7Cj4gKyAgICAgICAgICAgICAgIC8qIE5PVEU6IEVtdWxhdGlvbiBzaG91bGQgaWRlYWxs
eSBwcmVzZXJ2ZSB0aGUgYHByZWRgIGFuZAo+ICsgICAgICAgICAgICAgICAgKiBgc3VjY2AgZmll
bGRzLCBidXQgdGhhdCBpcyBub3QgZWFzaWx5IHBvc3NpYmxlIGhlcmUuICovCj4gKyAgICAgICAg
ICAgICAgIG1iKCk7Cj4gKyAgICAgICAgICAgICAgIHJlZ3MtPm1lcGMgKz0gNDsKPiArICAgICAg
ICAgICAgICAgcmV0dXJuIDA7Cj4gKyAgICAgICB9Cj4gKyAgICAgICBpZiAoKGluc24gJiBJTlNO
X01BU0tfRkVOQ0VfSSkgPT0gSU5TTl9NQVRDSF9GRU5DRV9JKSB7Cj4gKyAgICAgICAgICAgICAg
IFJJU0NWX0ZFTkNFX0k7Cj4gKyAgICAgICAgICAgICAgIHJlZ3MtPm1lcGMgKz0gNDsKPiArICAg
ICAgICAgICAgICAgcmV0dXJuIDA7Cj4gKyAgICAgICB9Cj4gKyNlbmRpZgo+ICsKCkdlbmVyaWMg
cGxhdGZvcm0gYWxsb3dzIHJ1bm5pbmcgdGhlIHNhbWUgZmlybXdhcmUgb24gbXVsdGlwbGUKcGxh
dGZvcm1zIHNvIENPTkZJR19USEVBRF9DOVhYX0VSUkFUQSB3aWxsIGJlIGVuYWJsZWQKYWxvbmcg
d2l0aCBrY29uZmlnIG9wdGlvbnMgb2Ygb3RoZXIgcGxhdGZvcm1zIHNvIEkgdGhpbmsgdGhlcmUg
aXMKbm8gcG9pbnQgb2YgaGF2aW5nICIjaWZkZWYgQ09ORklHX1RIRUFEX0M5WFhfRVJSQVRBIgpj
aGVjay4KClJlZ2FyZHMsCkFudXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9vcGVuc2JpCg==
