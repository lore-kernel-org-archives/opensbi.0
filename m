Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96AAD609C2
	for <opensbi@archiver.kernel.org>; Tue, 16 Dec 2025 17:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6x6LCyzEk71X65dNcuXfw1fXjW5+yTm8vhq7rnPB3RI=; b=FAfx00JttO17NI
	Ht2gnKDxLyXAVSJLEpjQLPVDUfT+3EV+XfI2/GpxQYJ0kA9FKs0BvblNZRrCvSjskv8J6fP2O2gNh
	R82fIkIxg7hi78uHsBvPy7E5XkUihKifOXUEFW/2LVY3sXKgJQ8001ha9dVx/Hb2pAlg6hHo4ISlB
	dbbQkCsUV8QsKYipUb7WmTo7OudUJvKoTcjYpI3PE68Hccr1uhotr7fY3+yN+xQy49xCtJ61aWcsZ
	JXyyEJlNQAhxUGbfVLp+wVoO9MQdTGWte8XJ3OeJN6l8FXkzlOgdGaXiMk9LqX+PLe7OxeJ5+X3wJ
	2eQEZNPDK7Nf7SbFhESg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYYk-00000005agU-1OKF;
	Tue, 16 Dec 2025 17:10:02 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYYg-00000005aff-2Ees
	for opensbi@lists.infradead.org;
	Tue, 16 Dec 2025 17:09:59 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-59911cb8c3cso672020e87.2
        for <opensbi@lists.infradead.org>; Tue, 16 Dec 2025 09:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1765904996; x=1766509796; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4cQxp+8tFQhMueAMlGtqPm7GIEW1WpIBOF7KPCZGyk=;
        b=T4rtG1gYqeGs128ctmWXc/7K3u3tz0oM1Ogt4nXmRfQywhmg3Ecaobfr6OvTnMJj/p
         bihiJB+pU5abILVlYhNH/e+hIQVMkVnJNzniAJ1Z1FjxN2wUE+BVTaCg25AWeXmbPNPl
         LZnv2ocX1tg/ZGw4y4NwUKBOpwlUl+q8CrFEtREQIMM+WLmGS+CV5XgSlT/o+3W1w/cd
         naF4NbPbzOu5RZTEDvK/wcz5MWpp65s6QlchmDa17f/DQZ3Qpao5qosXNu6eaZLJWE1D
         vzUM34jqrmg3POJjd4UVNCX8JQz/x9lNmDsRU1iNXBbPz0CHy16pviGVpwhzaFJbNPMi
         bCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904996; x=1766509796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+4cQxp+8tFQhMueAMlGtqPm7GIEW1WpIBOF7KPCZGyk=;
        b=KkzWZkSQa3MGHZ8tOvBg/3+EIqc18X+gVF/2zRju9+A3FbBt9KEbh2ESgcD8fRG2sO
         lF7U4FlV+mowghDsAtg0oCddxnjKem6ZsLWCn5iDw/+OzGm3SdWo6oxHDIjGe7azO4Du
         quTWKDs9w6SS27eZ5hTmUPYVoR3ecRAY9FBof+1dD5BpCO1GQUYQzX2RxgOeFHwp1RvA
         jimuQpWc+n6rKqxsEmXf4a2y21tLgGyaLqI9z5VpPu54+7Bzx+x5IaAmBgboPRv6Ouxj
         wTWVtneDZ71QC8uLX1GXiCxoZYkiy0PMhIT3wAaDsCdXJBkTm3LIctEPBN8OJlyVbzVU
         Xdgw==
X-Forwarded-Encrypted: i=1; AJvYcCVFyzRLmJTy7/j64v2BQKXiuEJjsyzh9i3ZO5e3GV953HeVkeSK4gM2sRVW1ZrXd6MIBMbBz5Fw@lists.infradead.org
X-Gm-Message-State: AOJu0YySiXFtuh0XCGfxOy0oS6TWSNwkNQ71Z6f7SrRzAXl/g93J77nU
	5aR3dfZFsKZgMu1SNv45t97ym+u9DmfbiLRzAax09p11VQ0S9Fjtx/CaOt67eaArzb8Txpkpy9y
	fKk3QDE40HOWvCoVSmBsDgfR80QNlLqqCe/fpbPziqg==
X-Gm-Gg: AY/fxX7VUvPU8ELNKih2pSX8XGF/8iDZ/XmBO+VuSuA4D92FFsTAsOQvHsG4RD79VDF
	ZjWTJ7/7KqfnlGHxi4W9X26gGIOgyQhehuSrgYp8Y1t08t9gdavzRCFRGZY54oy1+gP8dm0u/t2
	Tkh3kE/tMOTHwEr56iwT0Ew8SBpKzOWxXSVwJE8xSwIVDoxfj2QFAXlfKkiz1Tm0knrHU8hnxFS
	Ps4V6jPkCYUvDx4gSr51e+0fK1iEaPhf5vVedeEnyOeCYfF2VMqZjzUEpzqkgYebfaBOYTH
X-Google-Smtp-Source: AGHT+IGtsnCfx32aD5Fhvha3pulNJfq6XF+4z0oRtQwnOLtJNlR2jLnui0oJXxQjurzkTkLIhXIUz5EdK5uZFyLTTbo=
X-Received: by 2002:a05:6512:398b:b0:598:853e:4867 with SMTP id
 2adb3069b0e04-598faa9dc25mr5302173e87.52.1765904995800; Tue, 16 Dec 2025
 09:09:55 -0800 (PST)
MIME-Version: 1.0
References: <20251209053130.407935-1-apatel@ventanamicro.com>
 <CAAhSdy3wZ=ih970E1ZT9tW+=gz1gYbjMWELriHX1ya-pr40iUw@mail.gmail.com> <bdfa024a-ad3d-47af-b629-ede7d4ecd607@sifive.com>
In-Reply-To: <bdfa024a-ad3d-47af-b629-ede7d4ecd607@sifive.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 16 Dec 2025 22:39:44 +0530
X-Gm-Features: AQt7F2pTTizr-8ubKd0q7Fq9vE2zmH9UjApUHRxLh6h6R9yALj6ZO-khpuOl1wo
Message-ID: <CAK9=C2URiHPjLaYuF_rZbjsUCT+s+=o24_M8NM_W=kBQDVqdUA@mail.gmail.com>
Subject: Re: [PATCH v3] platform: generic: Keep some empty space in FDT passed
 to next stage
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_090958_617229_1776C791 
X-CRM114-Status: GOOD (  20.64  )
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

T24gVHVlLCBEZWMgMTYsIDIwMjUgYXQgOToyNeKAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEFudXAsCj4KPiBPbiAyMDI1LTEyLTE2IDg6
NDUgQU0sIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBPbiBUdWUsIERlYyA5LCAyMDI1IGF0IDExOjAx
4oCvQU0gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4+Cj4g
Pj4gTGVhdmluZyBubyBlbXB0eSBzcGFjZSBpbiB0aGUgRkRUIHBhc3NlZCB0byB0aGUgbmV4dCBi
b290aW5nIHN0YWdlCj4gPj4gY2F1c2VzIHRoZSBmb2xsb3dpbmcgVS1Cb290IGNyYXNoIG9uIFZl
bnRhbmEgaW50ZXJuYWwgcGxhdGZvcm1zOgo+ID4+Cj4gPj4gVW5oYW5kbGVkIGV4Y2VwdGlvbjog
TG9hZCBhY2Nlc3MgZmF1bHQKPiA+PiBFUEM6IDAwMDAwMDAwZmZmYTYzNzIgUkE6IDAwMDAwMDAw
ZmZmYTc0MTggVFZBTDogMDAwMTc0NjE3NDczMDA2OAo+ID4+IEVQQzogMDAwMDAwMDA4MDI0NTM3
MiBSQTogMDAwMDAwMDA4MDI0NjQxOCByZWxvYyBhZGp1c3RlZAo+ID4+Cj4gPj4gU1A6ICAwMDAw
MDAwMGZlZjM4NDQwIEdQOiAgMDAwMDAwMDBmZWY0MGU2MCBUUDogIDAwMDAwMDAwMDAwMDAwMDAK
PiA+PiBUMDogIDAwMDAwMDAwZmVmNDBhNzAgVDE6ICAwMDAwMDAwMDAwMDBmZjAwIFQyOiAgMDAw
MDAwMDAwMDAwMDAwMAo+ID4+IFMwOiAgMDAwMDAwMDBmZmZjMTdhOCBTMTogIDAwMDAwMDAwZmVm
MzhkNDAgQTA6ICA3Mzc1NzQ2MTc0NzMwMDY4Cj4gPj4gQTE6ICAwMDAwMDAwMGZmZmMxN2E4IEEy
OiAgMDAwMDAwMDAwMDAwMDAxMCBBMzogIDAwMDAwMDAwMDAwMDAwMTAKPiA+PiBBNDogIDAwMDAw
MDAwMDAwMDAwMDAgQTU6ICAwMDAwMDAwMGZmZmMxN2I4IEE2OiAgMDAwMDAwMDAwMGZmMDAwMAo+
ID4+IEE3OiAgMDAwMDAwMDAwMDAwYjEwMCBTMjogIDAwMDAwMDAwMDAwMDAwMDAgUzM6ICAwMDAw
MDAwMDAwMDAwMDAxCj4gPj4gUzQ6ICAwMDAwMDAwMGZlZjM4ZDQwIFM1OiAgNzM3NTc0NjE3NDcz
MDA2OCBTNjogIDAwMDAwMDAwMDAwMDAwMDAKPiA+PiBTNzogIDAwMDAwMDAwZmVmNGVlZjAgUzg6
ICAwMDAwMDAwMGZlZjRlZjkwIFM5OiAgMDAwMDAwMDAwMDAwMDAwMAo+ID4+IFMxMDogMDAwMDAw
MDAwMDAwMDAwMCBTMTE6IDAwMDAwMDAwZmVmNGVmYzAgVDM6ICAwMDAwMDAwMGZlZjQwZWE4Cj4g
Pj4gVDQ6ICAwMDAwMDAwMDAwZmYwMDAwIFQ1OiAgMDAwMDAwMDBmZWY0MGE2MCBUNjogIDAwMDAw
MDAwZmVmNDBhNmMKPiA+Pgo+ID4+IFRvIGFkZHJlc3MgdGhlIGFib3ZlIGlzc3VlLCBrZWVwIHNv
bWUgbWluaW1hbCBlbXB0eSBzcGFjZSBpbiB0aGUKPiA+PiBGRFQgaW5zdGVhZCBvZiBubyBlbXB0
eSBzcGFjZS4KPiA+Pgo+ID4+IEZpeGVzOiBiYmU5YTIzMDYwZTkgKCJwbGF0Zm9ybTogZ2VuZXJp
YzogUGFjayB0aGUgRkRUIGFmdGVyIGFwcGx5aW5nIGZpeHVwcyIpCj4gPj4gU2lnbmVkLW9mZi1i
eTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gPgo+ID4gQXBwbGllZCB0
aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCj4KPiBBZ2FpbiwgdGhpcyBwYXRj
aCByZWludHJvZHVjZXMgdGhlIGJ1ZyB0aGF0IHdhcyBmaXhlZCBieSB0aGUgIkZpeGVzOiIgY29t
bWl0Lgo+IFlvdSBjYW4ndCBqdXN0IHNheSAic29tZWJvZHkgd2lsbCBhZGQgdGhlIG1lbXNldCgp
IHNvbWV3aGVyZSBsYXRlciIgYW5kIGlnbm9yZQo+IHRoZSBidWcgeW91IGFyZSBpbnRyb2R1Y2lu
Zy4gWW91IG5lZWQgdG8gYWRkIHRoZSBtZW1zZXQoKSAqbm93KiBhbG9uZyB3aXRoIHRoZQo+IGZk
dF9vcGVuX2ludG8oKSBjYWxsLgoKWWVzLCBidXQgdGhhdCBmaXggYnJva2UgVS1ib290IGJvb3Rp
bmcuClRoZSBvcmlnaW5hbCBmaXggaXRzZWxmIHdhcyBpbmNvbXBsZXRlLiBBZGRpbmcgbWVtc2V0
KCkgdG8KZmR0X29wZW5faW50bygpIGlzIGEgc2VwYXJhdGUgY2hhbmdlLiBGZWVsIGZyZWUgdG8g
c2VuZApwYXRjaCBmb3IgaXQuCgpSZWdhcmRzLApBbnVwCgo+Cj4gUmVnYXJkcywKPiBTYW11ZWwK
Pgo+ID4+IC0tLQo+ID4+IENoYW5nZXMgc2luY2UgdjI6Cj4gPj4gLSBGaXggY29tbWVudHMgaW4g
Z2VuZXJpY19maW5hbF9pbml0KCkKPiA+PiBDaGFuZ2VzIHNpbmNlIHYxOgo+ID4+IC0gQWRkIEtj
b25maWcgb3B0aW9uIGZvciBhbW91bnQgb2YgZW1wdHkgc3BhY2UgaW4gRkRUIHdpdGggZGVmYXVs
dAo+ID4+ICAgdmFsdWUgYXMgNEtCCj4gPj4gLS0tCj4gPj4gIHBsYXRmb3JtL2dlbmVyaWMvS2Nv
bmZpZyAgICB8IDUgKysrKysKPiA+PiAgcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jIHwgMyAr
KysKPiA+PiAgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiA+Pgo+ID4+IGRpZmYg
LS1naXQgYS9wbGF0Zm9ybS9nZW5lcmljL0tjb25maWcgYi9wbGF0Zm9ybS9nZW5lcmljL0tjb25m
aWcKPiA+PiBpbmRleCAyNWI4ODg2Yi4uYjE4MDgwMTIgMTAwNjQ0Cj4gPj4gLS0tIGEvcGxhdGZv
cm0vZ2VuZXJpYy9LY29uZmlnCj4gPj4gKysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9LY29uZmlnCj4g
Pj4gQEAgLTIzLDYgKzIzLDExIEBAIGNvbmZpZyBQTEFURk9STV9HRU5FUklDX01JTk9SX1ZFUgo+
ID4+ICAgICAgICAgcmFuZ2UgMCA2NTUzNQo+ID4+ICAgICAgICAgZGVmYXVsdCAxCj4gPj4KPiA+
PiArY29uZmlnIFBMQVRGT1JNX0dFTkVSSUNfRkRUX0VNUFRZX1NQQUNFCj4gPj4gKyAgICAgICBp
bnQgIlBsYXRmb3JtIEZEVCBlbXB0eSBzcGFjZSAoS0IpIgo+ID4+ICsgICAgICAgcmFuZ2UgMCAx
MDI0Cj4gPj4gKyAgICAgICBkZWZhdWx0IDQKPiA+PiArCj4gPj4gIGNvbmZpZyBQTEFURk9STV9B
TExXSU5ORVJfRDEKPiA+PiAgICAgICAgIGJvb2wgIkFsbHdpbm5lciBEMSBzdXBwb3J0Igo+ID4+
ICAgICAgICAgZGVwZW5kcyBvbiBGRFRfSVJRQ0hJUF9QTElDCj4gPj4gZGlmZiAtLWdpdCBhL3Bs
YXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYyBiL3BsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYwo+
ID4+IGluZGV4IGU2NmY5OWZhLi4wMWZhMDNlMCAxMDA2NDQKPiA+PiAtLS0gYS9wbGF0Zm9ybS9n
ZW5lcmljL3BsYXRmb3JtLmMKPiA+PiArKysgYi9wbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMK
PiA+PiBAQCAtMjQ1LDcgKzI0NSwxMCBAQCBpbnQgZ2VuZXJpY19maW5hbF9pbml0KGJvb2wgY29s
ZF9ib290KQo+ID4+ICAgICAgICAgZmR0X2ZpeHVwcyhmZHQpOwo+ID4+ICAgICAgICAgZmR0X2Rv
bWFpbl9maXh1cChmZHQpOwo+ID4+Cj4gPj4gKyAgICAgICAvKiBTZXQgdGhlIGVtcHR5IHNwYWNl
IGluIEZEVCBiYXNlZCBvbiBrY29uZmlnIG9wdGlvbiAqLwo+ID4+ICAgICAgICAgZmR0X3BhY2so
ZmR0KTsKPiA+PiArICAgICAgIGZkdF9vcGVuX2ludG8oZmR0LCBmZHQsIGZkdF90b3RhbHNpemUo
ZmR0KSArCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgIENPTkZJR19QTEFURk9STV9HRU5FUklD
X0ZEVF9FTVBUWV9TUEFDRSAqIDEwMjQpOwo+ID4+Cj4gPj4gICAgICAgICByZXR1cm4gMDsKPiA+
PiAgfQo+ID4+IC0tCj4gPj4gMi40My4wCj4gPj4KPiA+Cj4KCi0tIApvcGVuc2JpIG1haWxpbmcg
bGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
