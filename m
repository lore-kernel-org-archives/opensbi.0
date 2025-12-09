Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92125D1CDC6
	for <opensbi@archiver.kernel.org>; Tue,  9 Dec 2025 06:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=knoIogZMJvEGKq9GsMaK5AdYeL6mv1eYmEfOF7We5ZA=; b=BePVbyfR4sy0I7
	GHOVvs6Q4UrfR8n3H+h1X7UiXYRPL7VEUmW7cFL62sGkAPEnx4ejkJ9OqavhyfTIoqLNplS//OvXQ
	yzqJwUEWvMZlvp87bJ7XYf6F6pumoIhDg1vF81abxrijE5v7wURknHUqdhgtiY5BigODFUG9C4wOJ
	MSRcQUxKf7EWiGk3my6P/0QXzJD0J741IpiK8V7ukQIRj24I8o5wyk9cmH/zwULzCj7ffEiwui0Mo
	BKPcdtBl/7j6fwTXudmrEieeDF+CbcO2SBDnhfYpVQPnAnS6t3WYGvkdC/vBYRybZJaRSM3oUIgWR
	x2eeHE5xUg5CUfwkDcyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSrTA-0000000DuKD-426W;
	Tue, 09 Dec 2025 06:45:08 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSrT6-0000000DuJr-2lbL
	for opensbi@lists.infradead.org;
	Tue, 09 Dec 2025 06:45:05 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7c75fc222c3so2614515a34.0
        for <opensbi@lists.infradead.org>; Mon, 08 Dec 2025 22:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1765262703; x=1765867503; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZv4nlYVqI6FezoYKL+HvX6a2G8WhFOj9vTCbI+Y+78=;
        b=OVdZjiC3/o98IgRU2Z41AZnSZbYCJ7VHva7jP+Yd20yu8R2xdbK2aW+tb4hKEaRidS
         ASRFYHcyXvWTemUeQdLeFInfsfSHeR6e6eR1AqIZpZ6EkFAYv6doAkMTA4RQrIsGUcrw
         3brt3KzsxCBZknZrnDvLPwZ4+MmgCDECYzdYyA0FzBxO5YUZN+ymtz5NWGUurAdRLv6D
         Am8uj9qPqmFgz9Y1x1YcrtSXiwKC7CPqRgGq3G3H/So103b3dM46NCIsRFRE5ueKPJjD
         CPUPVKUmO9NCkxeyFJfE0uRorhAeKxJtOj30TTQ7oKzla/HDoJNTjaqySLH1/TMoJ3Ve
         V0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765262703; x=1765867503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sZv4nlYVqI6FezoYKL+HvX6a2G8WhFOj9vTCbI+Y+78=;
        b=B9YMvABxodzqpWFlknDFv4o/TYQdKaJqBeczx5cVbkO5Q3mR7BRe1mNztxwZsXUF/s
         5MvT8rAfKVM7reRnReCjb5Jgn9n0Dhx8o7kmyJ2IqmzAS5HkA5GhqkgXFJl4lgkhInDE
         wQ/7M8r2pbX8kATZ3QO0eNBE0rrMtlHiiAtEW6NPQ90E5YWfl59D+FSln8clEML+eUIR
         m3pc5jPkXLvuqsFAS8URg0Oz/YhH29xgY8l4S4N62TZDJvQIWSaMJ5uIgmT+FtTvQ2jc
         WG3Iw/f15vhq49CZaFdXtAXPzyrDvj0SAvbvi5HoP1I5xhN0S6DnEF0BXO2w1gFfEVxL
         rpLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUipF9mGCGNqaqxGNTYjaF2KnPDfwR++v5K7ojWzCzYOgMS5bsyivovIAJoagbuCz9LuD4heYSO@lists.infradead.org
X-Gm-Message-State: AOJu0YzNYqJwv+xsX/zjp4TFfCh4SBneVVC5lGKCvKTYa+UtipfJYepN
	3NlSSLp9ObfAKIi2nMuYOIXJC8N+715/3XIRZoOVQ/BNjOn4NXsykKweKtgSc13UgS8hdVl3zMi
	QdgQauwQ8GDpmM7pjyGR9+JiiJ/gStMmoeytocPl2ow==
X-Gm-Gg: ASbGncvaNI4mZq9T+HzwdWjRyllqFppb6qFTKnTC2mNtbsA7Kcd10tgiVz1lZ6f0+Q/
	LfuoF941tS+38uxV/1mF/yh3sZlTxZ5EZvVxyP/t5CS9D8hZwnvDuYNlAe8zIXwnvSEnluaXVE0
	qGDk+TXjvkW2fXNkJKB4/kAOjK9WpijjXXGRS0ae2+pHsKnuPpKLMwm5nFqwj6POoahqDAjvDjK
	OciLAGOVChAFGRJAQhL08avZPlcG4piHIdIG6QXu3iRTXdl+5QSVkYPv+FB79aXt5bfg3A=
X-Google-Smtp-Source: AGHT+IENE4ZFJt858+vkrORHNz+ll7mEV4g4IB6j1uQZNtqecBsBLXW9JFNRKsKC3DaVRvs767yzrRNPsZcENuWKf24=
X-Received: by 2002:a4a:e842:0:b0:659:9a49:8e72 with SMTP id
 006d021491bc7-6599a970e8fmr3968298eaf.66.1765262703284; Mon, 08 Dec 2025
 22:45:03 -0800 (PST)
MIME-Version: 1.0
References: <20251201050014.8788-1-apatel@ventanamicro.com>
 <4d25665d-d152-47ab-8da6-c7297dd117b3@sifive.com> <CAAhSdy367b6XBKSWp4PoKeDi7uz3L08oncSyb9c8rk+AmLqbHw@mail.gmail.com>
 <49c1fe3b-8d77-4d22-9b08-8698ffd8ccb1@sifive.com>
In-Reply-To: <49c1fe3b-8d77-4d22-9b08-8698ffd8ccb1@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 9 Dec 2025 12:14:53 +0530
X-Gm-Features: AQt7F2o5nRe5olCJ3WMG4npM-poQoffH9QC6hAUVXguIs-fQXm5jTSA9y1TieG4
Message-ID: <CAAhSdy3-8P-KNrveGC+Z=V5qJTykNUnB903BKipF5-PTSMQfGg@mail.gmail.com>
Subject: Re: [PATCH v2] platform: generic: Keep some empty space in FDT passed
 to next stage
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_224504_864167_0F57693A 
X-CRM114-Status: GOOD (  32.98  )
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

T24gVHVlLCBEZWMgOSwgMjAyNSBhdCAxMjowM+KAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBPbiAyMDI1LTEyLTA3
IDExOjUzIFBNLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gT24gU3VuLCBEZWMgNywgMjAyNSBhdCA0
OjI54oCvUE0gU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+IHdyb3Rl
Ogo+ID4+IE9uIDIwMjUtMTEtMzAgMTE6MDAgUE0sIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPj4+IExl
YXZpbmcgbm8gZW1wdHkgc3BhY2UgaW4gdGhlIEZEVCBwYXNzZWQgdG8gdGhlIG5leHQgYm9vdGlu
ZyBzdGFnZQo+ID4+PiBjYXVzZXMgdGhlIGZvbGxvd2luZyBVLUJvb3QgY3Jhc2ggb24gVmVudGFu
YSBpbnRlcm5hbCBwbGF0Zm9ybXM6Cj4gPj4+Cj4gPj4+IFVuaGFuZGxlZCBleGNlcHRpb246IExv
YWQgYWNjZXNzIGZhdWx0Cj4gPj4+IEVQQzogMDAwMDAwMDBmZmZhNjM3MiBSQTogMDAwMDAwMDBm
ZmZhNzQxOCBUVkFMOiAwMDAxNzQ2MTc0NzMwMDY4Cj4gPj4+IEVQQzogMDAwMDAwMDA4MDI0NTM3
MiBSQTogMDAwMDAwMDA4MDI0NjQxOCByZWxvYyBhZGp1c3RlZAo+ID4+Pgo+ID4+PiBTUDogIDAw
MDAwMDAwZmVmMzg0NDAgR1A6ICAwMDAwMDAwMGZlZjQwZTYwIFRQOiAgMDAwMDAwMDAwMDAwMDAw
MAo+ID4+PiBUMDogIDAwMDAwMDAwZmVmNDBhNzAgVDE6ICAwMDAwMDAwMDAwMDBmZjAwIFQyOiAg
MDAwMDAwMDAwMDAwMDAwMAo+ID4+PiBTMDogIDAwMDAwMDAwZmZmYzE3YTggUzE6ICAwMDAwMDAw
MGZlZjM4ZDQwIEEwOiAgNzM3NTc0NjE3NDczMDA2OAo+ID4+PiBBMTogIDAwMDAwMDAwZmZmYzE3
YTggQTI6ICAwMDAwMDAwMDAwMDAwMDEwIEEzOiAgMDAwMDAwMDAwMDAwMDAxMAo+ID4+PiBBNDog
IDAwMDAwMDAwMDAwMDAwMDAgQTU6ICAwMDAwMDAwMGZmZmMxN2I4IEE2OiAgMDAwMDAwMDAwMGZm
MDAwMAo+ID4+PiBBNzogIDAwMDAwMDAwMDAwMGIxMDAgUzI6ICAwMDAwMDAwMDAwMDAwMDAwIFMz
OiAgMDAwMDAwMDAwMDAwMDAwMQo+ID4+PiBTNDogIDAwMDAwMDAwZmVmMzhkNDAgUzU6ICA3Mzc1
NzQ2MTc0NzMwMDY4IFM2OiAgMDAwMDAwMDAwMDAwMDAwMAo+ID4+PiBTNzogIDAwMDAwMDAwZmVm
NGVlZjAgUzg6ICAwMDAwMDAwMGZlZjRlZjkwIFM5OiAgMDAwMDAwMDAwMDAwMDAwMAo+ID4+PiBT
MTA6IDAwMDAwMDAwMDAwMDAwMDAgUzExOiAwMDAwMDAwMGZlZjRlZmMwIFQzOiAgMDAwMDAwMDBm
ZWY0MGVhOAo+ID4+PiBUNDogIDAwMDAwMDAwMDBmZjAwMDAgVDU6ICAwMDAwMDAwMGZlZjQwYTYw
IFQ2OiAgMDAwMDAwMDBmZWY0MGE2Ywo+ID4+Pgo+ID4+PiBUbyBhZGRyZXNzIHRoZSBhYm92ZSBp
c3N1ZSwga2VlcCBzb21lIG1pbmltYWwgZW1wdHkgc3BhY2UgaW4gdGhlCj4gPj4+IEZEVCBpbnN0
ZWFkIG9mIG5vIGVtcHR5IHNwYWNlLgo+ID4+Pgo+ID4+PiBGaXhlczogYmJlOWEyMzA2MGU5ICgi
cGxhdGZvcm06IGdlbmVyaWM6IFBhY2sgdGhlIEZEVCBhZnRlciBhcHBseWluZyBmaXh1cHMiKQo+
ID4+PiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4K
PiA+Pj4gLS0tCj4gPj4+IENoYW5nZXMgc2luY2UgdjE6Cj4gPj4+IC0gQWRkIEtjb25maWcgb3B0
aW9uIGZvciBhbW91bnQgb2YgZW1wdHkgc3BhY2UgaW4gRkRUIHdpdGggZGVmYXVsdAo+ID4+PiAg
IHZhbHVlIGFzIDRLQgo+ID4+PiAtLS0KPiA+Pj4gIHBsYXRmb3JtL2dlbmVyaWMvS2NvbmZpZyAg
ICB8IDUgKysrKysKPiA+Pj4gIHBsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYyB8IDMgKysrCj4g
Pj4+ICAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+ID4+Pgo+ID4+PiBkaWZmIC0t
Z2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9LY29uZmlnIGIvcGxhdGZvcm0vZ2VuZXJpYy9LY29uZmln
Cj4gPj4+IGluZGV4IDI1Yjg4ODZiLi5iMTgwODAxMiAxMDA2NDQKPiA+Pj4gLS0tIGEvcGxhdGZv
cm0vZ2VuZXJpYy9LY29uZmlnCj4gPj4+ICsrKyBiL3BsYXRmb3JtL2dlbmVyaWMvS2NvbmZpZwo+
ID4+PiBAQCAtMjMsNiArMjMsMTEgQEAgY29uZmlnIFBMQVRGT1JNX0dFTkVSSUNfTUlOT1JfVkVS
Cj4gPj4+ICAgICAgIHJhbmdlIDAgNjU1MzUKPiA+Pj4gICAgICAgZGVmYXVsdCAxCj4gPj4+Cj4g
Pj4+ICtjb25maWcgUExBVEZPUk1fR0VORVJJQ19GRFRfRU1QVFlfU1BBQ0UKPiA+Pj4gKyAgICAg
aW50ICJQbGF0Zm9ybSBGRFQgZW1wdHkgc3BhY2UgKEtCKSIKPiA+Pj4gKyAgICAgcmFuZ2UgMCAx
MDI0Cj4gPj4+ICsgICAgIGRlZmF1bHQgNAo+ID4+Cj4gPj4gU2luY2UgdGhpcyBpcyBhIHdvcmth
cm91bmQgZm9yIGEgc3BlY2lmaWMgcGxhdGZvcm0sIGFuZCB0aGUgd29ya2Fyb3VuZCBzaG91bGQK
PiA+PiBldmVudHVhbGx5IGJlIG9ic29sZXRlZCBieSBhIFUtQm9vdCBmaXgsIHBsZWFzZSBkZWZh
dWx0IHRoaXMgdG8gemVyby4KPiA+Cj4gPiBBbHRob3VnaCB0aGUgaXNzdWUgbWFuaWZlc3RzIG9u
IFZlbnRhbmEgaW50ZXJuYWwgcGxhdGZvcm1zLAo+ID4gdGhlIGlzc3VlIGlzIG5vdCBWZW50YW5h
IHNwZWNpZmljIGFuZCBjYW4gaGFwcGVuIG9uIGFueSBwbGF0Zm9ybQo+ID4gd2hlcmUgVS1Cb290
IHRyaWVzIHRvIG1vZGlmeSBGRFQgcGFzc2VkIGJ5IE9wZW5TQkkgd2l0aG91dAo+ID4gYWRkaW5n
IGV4dHJhIHNwYWNlLgo+Cj4gSXQncyBzdGlsbCBhIFUtQm9vdCBidWcsIG5vPyBJcyB5b3VyIHBs
YW4gdG8ga2VlcCB0aGUgd29ya2Fyb3VuZCBpbmRlZmluaXRlbHk/CgpJdCBpcyBjZXJ0YWlubHkg
YSBVLUJvb3QgYnVnLiBXZSB3aWxsIGtlZXAgdGhlIHdvcmthcm91bmQgZm9yIGF0bGVhc3QKNiBt
b250aHMgKG9uZSBPcGVuU0JJIHJlbGVhc2UpIGFmdGVyIFUtQm9vdCBoYXMgZml4ZWQgaXQuCgo+
Cj4gPj4+ICsKPiA+Pj4gIGNvbmZpZyBQTEFURk9STV9BTExXSU5ORVJfRDEKPiA+Pj4gICAgICAg
Ym9vbCAiQWxsd2lubmVyIEQxIHN1cHBvcnQiCj4gPj4+ICAgICAgIGRlcGVuZHMgb24gRkRUX0lS
UUNISVBfUExJQwo+ID4+PiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5j
IGIvcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jCj4gPj4+IGluZGV4IGU2NmY5OWZhLi5kZGZj
OWU4MCAxMDA2NDQKPiA+Pj4gLS0tIGEvcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jCj4gPj4+
ICsrKyBiL3BsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYwo+ID4+PiBAQCAtMjQ1LDcgKzI0NSwx
MCBAQCBpbnQgZ2VuZXJpY19maW5hbF9pbml0KGJvb2wgY29sZF9ib290KQo+ID4+PiAgICAgICBm
ZHRfZml4dXBzKGZkdCk7Cj4gPj4+ICAgICAgIGZkdF9kb21haW5fZml4dXAoZmR0KTsKPiA+Pj4K
PiA+Pj4gKyAgICAgLyogTWluaW1pemUgdGhlIGVtcHR5IHNwYWNlIGluIEZEVCB0byA0S0IgKi8K
PiA+Pgo+ID4+IFRoaXMgY29tbWVudCBpcyBubyBsb25nZXIgYWNjdXJhdGUsIHNpbmNlIHRoZSBw
YWRkaW5nIGlzIG5vdCBhIGZpeGVkIHNpemUuCj4gPgo+ID4gU3VyZSwgSSB3aWxsIHVwZGF0ZS4K
PiA+Cj4gPj4KPiA+Pj4gICAgICAgZmR0X3BhY2soZmR0KTsKPiA+Pj4gKyAgICAgZmR0X29wZW5f
aW50byhmZHQsIGZkdCwgZmR0X3RvdGFsc2l6ZShmZHQpICsKPiA+Pj4gKyAgICAgICAgICAgICAg
ICAgICBDT05GSUdfUExBVEZPUk1fR0VORVJJQ19GRFRfRU1QVFlfU1BBQ0UgKiAxMDI0KTsKPiA+
Pgo+ID4+IFRoaXMgY2hhbmdlIHJlaW50cm9kdWNlcyB0aGUgcHJvYmxlbSB0aGF0IG1vdGl2YXRl
ZCBhZGRpbmcgZmR0X3BhY2soKS4KPiA+PiBmZHRfb3Blbl9pbnRvKCkgZG9lcyBub3QgaW5pdGlh
bGl6ZSB0aGUgdW51c2VkIHNwYWNlLCBzbyBvbmNlIGFnYWluIHRoZSByYW5nZQo+ID4+IFtmZHQs
IGZkdCArIGZkdF90b3RhbHNpemUoZmR0KSkgY29udGFpbnMgdW5pdGlhbGl6ZWQgZGF0YS4KPiA+
Pgo+ID4+IElmIGhhdmluZyB1bml0aWFsaXplZCBkYXRhIGluIHRoZSBGRFQgYmxvYiBpcyBub3Qg
YSBwcm9ibGVtIG9uIHRoZSBwbGF0Zm9ybQo+ID4+IHJlcXVpcmluZyB0aGlzIHdvcmthcm91bmQs
IHRoZW4gSSBzdXBwb3NlIHRoZSBjb2RlIGlzIGZpbmUuIE90aGVyd2lzZSwgdGhpcwo+ID4+IHdv
dWxkIG5lZWQgYSBtZW1zZXQoKS4KPiA+Cj4gPiBJIHRoaW5rIGl0IGlzIGJldHRlciB0byBkbyBt
ZW1zZXQoKSBvbiBhZGRpdGlvbmFsIHNwYWNlIGluIGZkdF9vcGVuX2ludG8oKQo+ID4gaXRzZWxm
IGJ1dCB0aGF0IHdvdWxkIGJlIGEgc2VwYXJhdGUgY2hhbmdlIGluIGxpYmZkdC4KPgo+IEkgZG9u
J3QgaGF2ZSBhbiBvcGluaW9uIG9uIHdoZXRoZXIgaXQgaXMgYmV0dGVyIHRvIGNoYW5nZSBsaWJm
ZHQsIGJ1dCB3ZSBuZWVkIHRvCj4gYWRkIHRoZSBtZW1zZXQoKSBpbiBhdCBsZWFzdCBvbmUgcGxh
Y2UgdG8gYXZvaWQgcmVncmVzc2luZyBoZXJlLgo+CgpVbmRlcnN0b29kLiBNeSBzdWdnZXN0aW9u
IGlzIHRvIGRvIGl0IGFzIGEgc2VwYXJhdGUgcGF0Y2ggaXJyZXNwZWN0aXZlCm9mIHdoZXJlIHdl
IGRvIGl0LgoKUmVnYXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL29wZW5zYmkK
