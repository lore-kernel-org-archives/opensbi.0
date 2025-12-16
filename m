Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F9CD5E391
	for <opensbi@archiver.kernel.org>; Tue, 16 Dec 2025 14:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PUvgAhZliBE2hKFqCh22LQQu1KeywknChlaofa/WOCc=; b=Li6yCBQGK1APJ3
	NCkWLI5DM0VygsyhO6S736T275WXQZcOLG8xUjPIQ4LcT5gZSzIYiwKvrT821JLXcTAlPiSBRYGYy
	Ud1xjijViJ5C7JnN1/S7QtcSpi3QBmDeoB2nc7d0sgiOLy4GrJXiYvad2IUjwXjHmPMR6RCwxnA3X
	Q7FGIZjx2MqQPomCkroSe2NzmlEcHEM/qsVfq0yYU1HfURZ3U4/mQXavwTB1NfiLBESoqa5OTHPQf
	w0f+JkIuBUkN6q9N9h8i9ZA/Y/cTz0nVASHTz45lX+qdxtodrN4Tyd2AdVJufX1W1O1TJR6k+2sPM
	FxKZkODomFtJNIMcRrEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWIv-00000005Mal-2PgQ;
	Tue, 16 Dec 2025 14:45:33 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWIs-00000005Ma0-20bh
	for opensbi@lists.infradead.org;
	Tue, 16 Dec 2025 14:45:31 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7c75dd36b1bso3800484a34.2
        for <opensbi@lists.infradead.org>; Tue, 16 Dec 2025 06:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1765896329; x=1766501129; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6yZuy+AQy7wRazhvXjr/80D7SvG6rt/r7lAgFNIF1A=;
        b=z1CiKldIZH4nZ/Ptb6W3mBnInkx7NU/syuiv+kC5Wwl5M+x6+NU4MvXi2+u6tSDyvE
         4OwRrJPgDUTq7t0FsZ6xr1i2kZAbm3czLPZMFYQC+Ktqk9fwEPdd267QLRYHp3nVPenv
         4JNVzqEzkTgcKRq26GYvjdI1J2lOpsdOq9qKspWYd+hfF4iJE0C79FL4hxAemn/T5uWy
         67FmUo7vTiCAGHvmcc8SBfvllXWcq1XDu9hIQYY6mvdsogclmgVOWxXgQ02NiFpMxVcU
         kWixgMtm+jtVMH0paMfITHyDGhNoYKdj1+yq2htPXcB6ho7WQmB098l+x50YDzV2g5ZL
         bmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765896329; x=1766501129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V6yZuy+AQy7wRazhvXjr/80D7SvG6rt/r7lAgFNIF1A=;
        b=ol17aIB/OxI2YrsPUnWDOQtdAjiz4jsi/D/16FWvSaqPXVt/eIznNi57UGcCM6VWMD
         KGxbssu8ghUeN4IDEfLnZChkzIcLASD/Af6zTwfjV43MWjKI0XHQkOefCmBbzmwhGi41
         ktOQDEv3NWTokVz3MwqiI1xx1cqTbwX3UXiYWzXXn7Ph+1LzDt6xQWddHynRzYyb3PTr
         lv/Pl9T6dYZnA0HdAu7GHWc3F7A1UXESAM3r54K9/BLpUaPhXh9j9c961CwkF/IJ1/Df
         alXbVYNrk9waWD1j0ZpgHic3kO6b1vBCU+kktsdNPud7A/H3LLV1ouO+c88WUkUBKz8P
         gYUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBn1JwTA4BeAvAHNo+W3uYAsv3gnU+oNJ5o3cvO3MslpS0D1YQEKJmz2SKjWF/VPYnFx4NUE5P@lists.infradead.org
X-Gm-Message-State: AOJu0YzWRa/9HmfSTGL/XUWY1SIgkzTS5qLOEeZDRAsDpG+Hi4X9mwlB
	Edr27b2SJaHsOVnGMYOkWIRKY/wP6DrOu97vHM/wMCZtuVy3yQE9f/bBNGuqYPA4xOFTvepf6JK
	RfWqb0TeJwkq7JzIonWshF+OHr9xpLEhcFgZG4W+sOw==
X-Gm-Gg: AY/fxX5qkTXx3t4MCyLMiDmu6NGuRVgjEyDtfrVLhb17MvdZ8MBUr638V/FP84Isk1o
	xbPrvJQkr9IIDOWJmVocnSCDTJTkLqYNu/moneIwZh7VmbYcJyekLb6EAO69TfkoiBC2xoZHmjM
	AeQlWtO1uHsEybMYU7mAQFBj5takMmx1ggfw9Pqf+/TFq8VwDU/0TbN8BZ0Bv/FBVADl9v+sID2
	3mL26hRTZHRY5svWplc9iImD9qK1/JlcQ0tY2vWy5tg4gXBOfM2qk3UfFf24IxPaYwTmQ4d8aMc
	0Js2sCyb9yY0uTER42UwrFv9g7g=
X-Google-Smtp-Source: AGHT+IEN8xn9iksJXUt/En4JQiqnHmjBt+rmRi02LLzqqh4vPpsQOqOVZ6oolQcDn7n8/G1JaXnrKpChdn7Q0bZCqiQ=
X-Received: by 2002:a05:6820:818a:b0:659:9a49:9070 with SMTP id
 006d021491bc7-65b4526a013mr5943778eaf.59.1765896329259; Tue, 16 Dec 2025
 06:45:29 -0800 (PST)
MIME-Version: 1.0
References: <20251209053130.407935-1-apatel@ventanamicro.com>
In-Reply-To: <20251209053130.407935-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 16 Dec 2025 20:15:19 +0530
X-Gm-Features: AQt7F2p2TtQZ-aBcrT1oxDf7NHO8mZKbq5vp8-xORnOXjRVibMqvV6uYzi_gbgg
Message-ID: <CAAhSdy3wZ=ih970E1ZT9tW+=gz1gYbjMWELriHX1ya-pr40iUw@mail.gmail.com>
Subject: Re: [PATCH v3] platform: generic: Keep some empty space in FDT passed
 to next stage
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_064530_716497_A73EEF76 
X-CRM114-Status: GOOD (  16.51  )
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

T24gVHVlLCBEZWMgOSwgMjAyNSBhdCAxMTowMeKAr0FNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IExlYXZpbmcgbm8gZW1wdHkgc3BhY2UgaW4gdGhlIEZE
VCBwYXNzZWQgdG8gdGhlIG5leHQgYm9vdGluZyBzdGFnZQo+IGNhdXNlcyB0aGUgZm9sbG93aW5n
IFUtQm9vdCBjcmFzaCBvbiBWZW50YW5hIGludGVybmFsIHBsYXRmb3JtczoKPgo+IFVuaGFuZGxl
ZCBleGNlcHRpb246IExvYWQgYWNjZXNzIGZhdWx0Cj4gRVBDOiAwMDAwMDAwMGZmZmE2MzcyIFJB
OiAwMDAwMDAwMGZmZmE3NDE4IFRWQUw6IDAwMDE3NDYxNzQ3MzAwNjgKPiBFUEM6IDAwMDAwMDAw
ODAyNDUzNzIgUkE6IDAwMDAwMDAwODAyNDY0MTggcmVsb2MgYWRqdXN0ZWQKPgo+IFNQOiAgMDAw
MDAwMDBmZWYzODQ0MCBHUDogIDAwMDAwMDAwZmVmNDBlNjAgVFA6ICAwMDAwMDAwMDAwMDAwMDAw
Cj4gVDA6ICAwMDAwMDAwMGZlZjQwYTcwIFQxOiAgMDAwMDAwMDAwMDAwZmYwMCBUMjogIDAwMDAw
MDAwMDAwMDAwMDAKPiBTMDogIDAwMDAwMDAwZmZmYzE3YTggUzE6ICAwMDAwMDAwMGZlZjM4ZDQw
IEEwOiAgNzM3NTc0NjE3NDczMDA2OAo+IEExOiAgMDAwMDAwMDBmZmZjMTdhOCBBMjogIDAwMDAw
MDAwMDAwMDAwMTAgQTM6ICAwMDAwMDAwMDAwMDAwMDEwCj4gQTQ6ICAwMDAwMDAwMDAwMDAwMDAw
IEE1OiAgMDAwMDAwMDBmZmZjMTdiOCBBNjogIDAwMDAwMDAwMDBmZjAwMDAKPiBBNzogIDAwMDAw
MDAwMDAwMGIxMDAgUzI6ICAwMDAwMDAwMDAwMDAwMDAwIFMzOiAgMDAwMDAwMDAwMDAwMDAwMQo+
IFM0OiAgMDAwMDAwMDBmZWYzOGQ0MCBTNTogIDczNzU3NDYxNzQ3MzAwNjggUzY6ICAwMDAwMDAw
MDAwMDAwMDAwCj4gUzc6ICAwMDAwMDAwMGZlZjRlZWYwIFM4OiAgMDAwMDAwMDBmZWY0ZWY5MCBT
OTogIDAwMDAwMDAwMDAwMDAwMDAKPiBTMTA6IDAwMDAwMDAwMDAwMDAwMDAgUzExOiAwMDAwMDAw
MGZlZjRlZmMwIFQzOiAgMDAwMDAwMDBmZWY0MGVhOAo+IFQ0OiAgMDAwMDAwMDAwMGZmMDAwMCBU
NTogIDAwMDAwMDAwZmVmNDBhNjAgVDY6ICAwMDAwMDAwMGZlZjQwYTZjCj4KPiBUbyBhZGRyZXNz
IHRoZSBhYm92ZSBpc3N1ZSwga2VlcCBzb21lIG1pbmltYWwgZW1wdHkgc3BhY2UgaW4gdGhlCj4g
RkRUIGluc3RlYWQgb2Ygbm8gZW1wdHkgc3BhY2UuCj4KPiBGaXhlczogYmJlOWEyMzA2MGU5ICgi
cGxhdGZvcm06IGdlbmVyaWM6IFBhY2sgdGhlIEZEVCBhZnRlciBhcHBseWluZyBmaXh1cHMiKQo+
IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgoKQXBw
bGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpSZWdhcmRzLApBbnVw
Cgo+IC0tLQo+IENoYW5nZXMgc2luY2UgdjI6Cj4gLSBGaXggY29tbWVudHMgaW4gZ2VuZXJpY19m
aW5hbF9pbml0KCkKPiBDaGFuZ2VzIHNpbmNlIHYxOgo+IC0gQWRkIEtjb25maWcgb3B0aW9uIGZv
ciBhbW91bnQgb2YgZW1wdHkgc3BhY2UgaW4gRkRUIHdpdGggZGVmYXVsdAo+ICAgdmFsdWUgYXMg
NEtCCj4gLS0tCj4gIHBsYXRmb3JtL2dlbmVyaWMvS2NvbmZpZyAgICB8IDUgKysrKysKPiAgcGxh
dGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jIHwgMyArKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9wbGF0Zm9ybS9nZW5lcmljL0tjb25maWcgYi9w
bGF0Zm9ybS9nZW5lcmljL0tjb25maWcKPiBpbmRleCAyNWI4ODg2Yi4uYjE4MDgwMTIgMTAwNjQ0
Cj4gLS0tIGEvcGxhdGZvcm0vZ2VuZXJpYy9LY29uZmlnCj4gKysrIGIvcGxhdGZvcm0vZ2VuZXJp
Yy9LY29uZmlnCj4gQEAgLTIzLDYgKzIzLDExIEBAIGNvbmZpZyBQTEFURk9STV9HRU5FUklDX01J
Tk9SX1ZFUgo+ICAgICAgICAgcmFuZ2UgMCA2NTUzNQo+ICAgICAgICAgZGVmYXVsdCAxCj4KPiAr
Y29uZmlnIFBMQVRGT1JNX0dFTkVSSUNfRkRUX0VNUFRZX1NQQUNFCj4gKyAgICAgICBpbnQgIlBs
YXRmb3JtIEZEVCBlbXB0eSBzcGFjZSAoS0IpIgo+ICsgICAgICAgcmFuZ2UgMCAxMDI0Cj4gKyAg
ICAgICBkZWZhdWx0IDQKPiArCj4gIGNvbmZpZyBQTEFURk9STV9BTExXSU5ORVJfRDEKPiAgICAg
ICAgIGJvb2wgIkFsbHdpbm5lciBEMSBzdXBwb3J0Igo+ICAgICAgICAgZGVwZW5kcyBvbiBGRFRf
SVJRQ0hJUF9QTElDCj4gZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYyBi
L3BsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYwo+IGluZGV4IGU2NmY5OWZhLi4wMWZhMDNlMCAx
MDA2NDQKPiAtLS0gYS9wbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMKPiArKysgYi9wbGF0Zm9y
bS9nZW5lcmljL3BsYXRmb3JtLmMKPiBAQCAtMjQ1LDcgKzI0NSwxMCBAQCBpbnQgZ2VuZXJpY19m
aW5hbF9pbml0KGJvb2wgY29sZF9ib290KQo+ICAgICAgICAgZmR0X2ZpeHVwcyhmZHQpOwo+ICAg
ICAgICAgZmR0X2RvbWFpbl9maXh1cChmZHQpOwo+Cj4gKyAgICAgICAvKiBTZXQgdGhlIGVtcHR5
IHNwYWNlIGluIEZEVCBiYXNlZCBvbiBrY29uZmlnIG9wdGlvbiAqLwo+ICAgICAgICAgZmR0X3Bh
Y2soZmR0KTsKPiArICAgICAgIGZkdF9vcGVuX2ludG8oZmR0LCBmZHQsIGZkdF90b3RhbHNpemUo
ZmR0KSArCj4gKyAgICAgICAgICAgICAgICAgICAgIENPTkZJR19QTEFURk9STV9HRU5FUklDX0ZE
VF9FTVBUWV9TUEFDRSAqIDEwMjQpOwo+Cj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+IC0tCj4g
Mi40My4wCj4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2Jp
Cg==
