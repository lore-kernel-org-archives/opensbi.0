Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82157C83F17
	for <opensbi@archiver.kernel.org>; Wed, 23 Jul 2025 20:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6yY+yi7c+UMVC+eZYP87VPl+080krWq3I7DWz27oBiQ=; b=wjy5B7M1IwwSYL
	XFrBHd1U8diV4O+kjAabTui7m7g0K6XHC/skRlKtj76OPUuvhzUlW0l535d5ZwHcSeAwdsX6Kzopk
	m9xLE6SlywKPo9J8+zF+t6wZPrC6XOb9v4ncWr4OFQ2auJrKTR2WDMfUZem2IkqRc6HBvjv42RXc/
	9zF498woldZxmYwtvLq4TyD5YXiYM7N4SIg4Tla9iShvImz/nqqtCxxEYXLge5ZI7xo/EAnh4jsaV
	X0qlB0qe1eZDZF0Lfo/AH5KSvBQ7D3UyKLE5utdPtHnwouWoQd/DaX/OnGfokaJLP/O0reoPEHrHA
	tqlpsEAc0sFbRL9FNaRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uegDe-00000005v0k-2Zef;
	Wed, 23 Jul 2025 20:37:42 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uegDc-00000005v0J-3FYl
	for opensbi@lists.infradead.org;
	Wed, 23 Jul 2025 20:37:41 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso275599e87.1
        for <opensbi@lists.infradead.org>; Wed, 23 Jul 2025 13:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753303059; x=1753907859; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdgGnhJvkJHkesTD7wDqhnZoso3WgmSEgu8z8UunXms=;
        b=CactLLHzG2LxgoSAWcpz3/snXpOmFUNK8TbnVsJrFuHiwztKlXMQrAWafi0vVaWCMm
         327RttnKtBznXxVfww5MeXbtzR3KCVDcCsAG/AReuOb6Kht+7kBorcm9cu4zF1XWu0du
         vWmnKZc9h2hnhW9BaheI9LrnH8+PIUhz98QC7IvZDmYMaojkAcm2BgjA7CovNHz4U/KG
         fsfjHuZsd+eLJPVEF5e/pFS8ZgRixBrb+jFcy25xL6y7DOOV91kvUTirK9qv0M0xSLaS
         C9362LOwlJ/yIBCJpxpS3J3zba+eMST3hrVMGafVgylp3HABp2t32ygXCLdmlT3/sJDP
         kLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753303059; x=1753907859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdgGnhJvkJHkesTD7wDqhnZoso3WgmSEgu8z8UunXms=;
        b=IGO6jSw5PTadjM3ZKw6SK14pzPBsdGxK6p7DE5xdQy9Gi2YzrcSEj17TR5KildUeOY
         6wnr6PZnkzAs2cH4VUPi0XX9u27XRuZW9sGBpHlx6cYL0iy4GAyj69ekQFTAo8CIPQXl
         1uon/JrwGCgrCazAxNGGbSDd1Nq6+ANZvM35S3a0gXbzXffZyUVgklryrBxr6HSiGdWR
         CHX8sAZNS48bScD7ue5YqSSphqjvvw4H+JuO20wzj5HoBmo++Q360jMuDd/9vRGsObP5
         oWALbfM0lxepNnVLAJL9dRo63Yf61nAhvLVfql2vrpBn3ACvumN1wThul2O4xHl4wFMf
         2APg==
X-Gm-Message-State: AOJu0Yycz/DjYq449oSniGOuipVmONhAItF5Nm6NgPQ8aZsWKlloCSny
	abSsMtvaQxfbuCuqLDr44zyLmHAt71kWP+RvFjOYytNqS43eM/UCIi99iM2MJpkdFC1M+KusHwM
	5jOgKOf5pwBHpV6ojOglJY06IAyAYaTQ=
X-Gm-Gg: ASbGncvZLYfDpvZMdlebg/wC73vAyrJxL1tZGnX4ObOfWocvVtiR3eZZJuxaoGzt5Do
	WOfVTtG3P9MD1MphNEFYftY1h/z0ifUnAV0KCdp4VJpzny9oZBKbBdPcEcgmv/IuZxKPX3uhVZD
	4cqR7e2Yyjw+1JTjdfoeg0AEVJYoQ186ubyMu0ReV1daRyFCHxlH74R2UiWPmk90pcR4fBWf/vn
	GfNHaOF
X-Google-Smtp-Source: AGHT+IHcf6MrksmKYjQLC0ufDSQpAdPIe7nFZjN1hDSXRaBR8oDT5+6cC8MXM/PGA5xEJXY4kavIO8PFJVdrfvaq6OI=
X-Received: by 2002:a05:6512:2508:b0:553:ad48:3f2b with SMTP id
 2adb3069b0e04-55a5134563cmr1148471e87.2.1753303058668; Wed, 23 Jul 2025
 13:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250722230414.6815-1-cfu@mips.com> <7b16297c-3b48-425e-a7bb-176440d21f29@sifive.com>
In-Reply-To: <7b16297c-3b48-425e-a7bb-176440d21f29@sifive.com>
From: Chao-ying Fu <icebergfu@gmail.com>
Date: Wed, 23 Jul 2025 13:37:26 -0700
X-Gm-Features: Ac12FXzHLN-Mz6okyppKCUFk32OaGmzhjERngkp-hENZ27-dkkCMkKKtLFZw5Kw
Message-ID: <CAM1rFzExBcwtSm+dMCn3byBZ9-Yza+SbPzmMX_Hd3DU7U+gW2A@mail.gmail.com>
Subject: Re: [PATCH v2] generic: mips: support harts to boot from mips_warm_boot
To: Samuel Holland <samuel.holland@sifive.com>
Cc: opensbi@lists.infradead.org, Chao-ying Fu <cfu@mips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_133740_810267_27E24A92 
X-CRM114-Status: GOOD (  15.17  )
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

T24gVHVlLCBKdWwgMjIsIDIwMjUgYXQgNToxOOKAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEhpIENoYW8teWluZywKPgo+IE9uIDIwMjUt
MDctMjIgNjowNCBQTSwgQ2hhby15aW5nIEZ1IHdyb3RlOgo+ID4gV2UgcHJvZ3JhbSByZXNldCBi
YXNlIGZvciBoYXJ0cyAob3RoZXIgdGhhbiBoYXJ0IDApIHRvIGJvb3QgYXQKPiA+IG1pcHNfd2Fy
bV9ib290IHRoYXQganVtcHMgdG8gX3N0YXJ0X3dhcm0uIFRoaXMgaGVscHMgdG8gc2tpcCBzb21l
IGNvZGUKPiA+IHNlcXVlbmNlIHRvIHNwZWVkIHVwLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IENo
YW8teWluZyBGdSA8Y2Z1QG1pcHMuY29tPgo+ID4gLS0tCj4gPiAgcGxhdGZvcm0vZ2VuZXJpYy9t
aXBzL3A4NzAwLmMgfCAxNyArKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
NyBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2dlbmVyaWMvbWlw
cy9wODcwMC5jIGIvcGxhdGZvcm0vZ2VuZXJpYy9taXBzL3A4NzAwLmMKPiA+IGluZGV4IDg4OGE0
NWMuLjhjOTNlYmYgMTAwNjQ0Cj4gPiAtLS0gYS9wbGF0Zm9ybS9nZW5lcmljL21pcHMvcDg3MDAu
Ywo+ID4gKysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9taXBzL3A4NzAwLmMKPiA+IEBAIC0xNDAsNiAr
MTQwLDIwIEBAIHN0YXRpYyB2b2lkIHBvd2VyX3VwX290aGVyX2NsdXN0ZXIodTMyIGhhcnRpZCkK
PiA+ICB9Cj4gPiAgI2VuZGlmCj4gPgo+ID4gK3N0YXRpYyB2b2lkIF9fYXR0cmlidXRlX18oKG5h
a2VkLG5vX2luc3RydW1lbnRfZnVuY3Rpb24sYWxpZ25lZCg0MDk2KSkpCj4KPiBQbGVhc2UgZm9s
bG93IEplc3MncyBzdWdnZXN0aW9uIGFuZCB1c2UgYW4gYXNzZW1ibHkgZmlsZSBsaWtlIHdlIGFs
cmVhZHkgZG8gZm9yCj4gcGxhdGZvcm0vZ2VuZXJpYy9hbmRlcy9zbGVlcC5TLiBUaGlzIHdpbGwg
YmUgbW9yZSByZWxpYWJsZSB0aGFuIGZvcmV2ZXIgZmlnaHRpbmcKPiB0aGUgY29tcGlsZXIgdG8g
a2VlcCBpdCBmcm9tIGluc2VydGluZyBhbnkgaW5zdHJ1Y3Rpb25zIG9uIGl0cyBvd24uIChBcmUg
eW91Cj4gX3N1cmVfIHRoYXQgdGhpcyBsaXN0IG9mIGF0dHJpYnV0ZXMgY292ZXJzIGV2ZXJ5IHRv
b2xjaGFpbiBhbmQgY29uZmlndXJhdGlvbj8pCj4KSGkgU2FtLAoKICBPay4gSSB3aWxsIGNoYW5n
ZSB0byB1c2UgYW4gYXNzZW1ibHkgZmlsZSBhbmQgc2VuZCBvdXQgdjMgc29vbiwKc2ltaWxhciB0
byBzbGVlcC5TLgogIFRoYW5rcyBhIGxvdCEKClJlZ2FyZHMsCkNoYW8teWluZwoKLS0gCm9wZW5z
YmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
