Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9F5C5AD49
	for <opensbi@archiver.kernel.org>; Wed, 28 May 2025 10:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X2PyfcCqCzvNGgnJjD4GbdH97lMKap3bnR48cTdP9cE=; b=W3Ri19F4aZC4Dd
	E6OXwiL8dC3YphczFm0fUCGx16AfXdDzVhKOkWyK0yg2GlBe2nvD/Ralt9LfPWUnzMrwy3ErGVyyC
	cRzeVf4zB9QU/XFYb9U+1GOqm/HJKypiaTA21WHdYK7dM2i29WDtEdlNEdh6um6u6J/I+RcMNIu5e
	Lu0GzDj5V37dShSAWIBF0SPUWaNsZjEKhNXLx/tffbQioZ03ICH9crN0GE0HyK0n7lAfOpWMqVrCG
	6n9PQnlVKWQXS+EaOBKvh1+ounCCPVLjg7wcNhuxSX8vBFjlMtgBCxoE9+D5EzBydCrhvuRQCtFE+
	8KSMSsWBZtt/nvn8pTYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKDzK-0000000CqM6-404l;
	Wed, 28 May 2025 10:26:22 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKDzI-0000000CqLV-2jIa
	for opensbi@lists.infradead.org;
	Wed, 28 May 2025 10:26:22 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e7dc4e44b47so1524549276.3
        for <opensbi@lists.infradead.org>; Wed, 28 May 2025 03:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1748427979; x=1749032779; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AbFJuKsG1LwxHcyKGaQkx0b3rd8VnHBG/cGAcW3YX0=;
        b=nLqtfuTV5oeDCRa1zSw8XjAHjFmhAYaEiksmi9vNbVywMzl/YrcpV97FlgQ/lozRdZ
         DS2IA13x7jPvBkecLL/buBwfT3nQPV2QvtG/noh6svg8FzXfGyvipYwJslQAaOKTiEPJ
         MKzSfKgHIxnkWt//rRP1GBc64n/2+te9yWNb3+d8W/T7OXHpcuJFYS0m48GKrS9Ce4yN
         Yw9N2FNiJvbF7bozmGIN9Ujm65AdT6Rnmkb+kLGdZKfMmdTJaA1trne4uqwPlCBPjE3F
         u3jX3ZSPUwjl95mE1iy3KuZij79D4nDzcEbjZe3a5xNBhtCnUAaeLtrtEgDNNjqkyfyU
         7vFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748427979; x=1749032779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5AbFJuKsG1LwxHcyKGaQkx0b3rd8VnHBG/cGAcW3YX0=;
        b=xU55BcvedvRMTx0uS75bS2CTyMR98UXU+/ivKM4GEFyStTjWiK3hP1WVFYBtpo6dHn
         yXcj0SY8rTP5dK1NaC5uWUoWnMr2Z/LXrkdFnCmiH4Rd1eHZCbi9Zx0g9w7uqbbAtQeC
         heBzZOqgwrtTZMO+PYo+yg4Io0vihnirDJF3hhTGaO07b+W0y6Od84m8Eow4PDCBJQTM
         fQtY+01a4lWpsUJvj3CGi38XAsEp18EaUaf2xQIJVCQZNv906fxXHJpG8J81SL5zCoaj
         2dusc93w71o4EwpS7VSe5KJ0xkag/jOLR6nuHiYL090SRJ8E1MB3gVdMURnrilrTCEAe
         PSCw==
X-Forwarded-Encrypted: i=1; AJvYcCUQNNS4GKgvBoCJnZDSnAICoDE2awFoTSoX9WWzx1PECCwhfzJj6vZX4OKq3eVkP5ukIMt/4CBf@lists.infradead.org
X-Gm-Message-State: AOJu0YzCt7TJEQID2otm4bzFX3Wk5f6XyctIQ/AxSkFpVcM2ojK36NrQ
	Bq1qif4u1/alXIZm62Um2bkd1MZ697BbQKEeaDSeBVJW/3nEQpTiHrPYF7AEKcYAVNMfFPvxglw
	Hvlh9Ji5K6ga6BeyNBT2tNngBt9qblidfgNoqmWYyUA==
X-Gm-Gg: ASbGncuMIFBWPiTkI9zwRP6gDAkIQ58g2ROXNUQgTv/P5knBtki10KAgKPMW8Dursd1
	r7GzMCu4B+bofSWCkCVFntcq7Znw5LsYS93+0cC4KgaDkNuDOnAEZzRgnk2sdUsXsb94a64gyp3
	52a2q65bP895bODhys29eLkn8LXVMmPgBq0z8=
X-Google-Smtp-Source: AGHT+IGwQte2Y+s++S6RGL/DvYLHe8R/cQ1amMKWydrJrQavEDTW7VMGuTsirjptLNmgQJxBLd7lUotIbWkCvMf33nY=
X-Received: by 2002:a05:6902:10c2:b0:e7d:cc29:2c59 with SMTP id
 3f1490d57ef6-e7dcc292dbfmr6292116276.25.1748427979290; Wed, 28 May 2025
 03:26:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250527124821.2113467-1-apatel@ventanamicro.com>
In-Reply-To: <20250527124821.2113467-1-apatel@ventanamicro.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Wed, 28 May 2025 18:26:07 +0800
X-Gm-Features: AX0GCFtDls-Kx3pb0sO7mstJBictGr1GysGP8iwjw-coM_v_dmlShJaM9sv3W6Y
Message-ID: <CAKddAkBK1UhLerRx0X+jD0RK2g4BXMSfyuHXczwRD=MBSFiAuA@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: Revert entry_count before doing hsm stop in hsm
 wait loop
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_032620_709591_87EF85FC 
X-CRM114-Status: GOOD (  28.17  )
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

T24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgODo0OOKAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFVzaW5nIGhzbSBzdG9wIGluIGhzbSB3YWl0IGxvb3Ag
Y2F1c2VzIHNlY29uZGFyeSBoYXJ0cyB0byBiZSBzdHVjawo+IGZvcmV2ZXIgaW4gT3BlblNCSSBv
biBSSVNDLVYgcGxhdGZvcm1zIHdoZXJlIEhTTSBoYXJ0IGhvdHBsdWcgaXMKPiBhdmFpbGFibGUg
YW5kIGFsbCBoYXJ0cyBjb21lLXVwIGF0IHRoZSBzYW1lIHRpbWUgZHVyaW5nIHN5c3RlbQo+IHBv
d2VyLW9uLgo+Cj4gRm9yIGV4YW1wbGUsIGxldHMgc2F5IHdlIGhhdmUgdHdvIGhhcnRzIEEgYW5k
IEIgb24gYSBSSVNDLVYgcGxhdGZvcm0KPiB3aXRoIEhTTSBoYXJ0IGhvdHBsdWcgd2hpY2ggY29t
ZS11cCBhdCB0aGUgc2FtZSB0aW1lIGR1cmluZyBzeXN0ZW0KPiBwb3dlci1vbi4gVGhlIGhhcnQg
QSBlbnRlcnMgT3BlblNCSSBiZWZvcmUgaGFydCBCIGhlbmNlIGl0IGJlY29tZXMKPiB0aGUgcHJp
bWFyeSAob3IgY29sZC1ib290KSBoYXJ0IHdoZXJlYXMgaGFydCBCIGJlY29tZXMgdGhlIHNlY29u
ZGFyeQo+IChvciB3YXJtLWJvb3QpIGhhcnQuIFRoZSBoYXJ0IEEgZm9sbG93cyB0aGUgT3BlblNC
SSBjb2xkLWJvb3QgcGF0aAo+IGFuZCByZWdpc3RlcnMgaHNtIGRldmljZSBiZWZvcmUgaGFydCBC
IGVudGVycyBPcGVuU0JJLiBUaGUgaGFydCBCCj4gZXZlbnR1YWxseSBlbnRlcnMgT3BlblNCSSBh
bmQgZm9sbG93cyB0aGUgT3BlblNCSSB3YXJtLWJvb3QgcGF0aAo+IHNvIGl0IHdpbGwgaW5jcmVt
ZW50IGl0J3Mgb3duIGVudHJ5X2NvdW50IGJlZm9yZSBlbnRlcmluZyBoc20gd2FpdAo+IGxvb3Ag
d2hlcmUgaXQgc2VlcyBoc20gZGV2aWNlIGFuZCBzdG9wcyBpdHNlbGYuIExhdGVyIGFzIHBhcnQg
b2YKPiB0aGUgTGludXggYm9vdC11cCBzZXF1ZW5jZSwgaGFydCBBIGlzc3VlcyBTQkkgSFNNIHN0
YXJ0IGNhbGwgdG8KPiBicmluZy11cCBoYXJ0IEIgYnV0IE9wZW5TQkkgc2VlcyBlbnRyeV9jb3Vu
dCAhPSBpbml0X2NvdW50IGZvcgo+IGhhcnQgQiBpbiBzYmlfaHNtX2hhcnRfc3RhcnQoKSBoZW5j
ZSBoc21fZGV2aWNlX2hhcnRfc3RhcnQoKSBpcwo+IG5vdCBjYWxsZWQgZm9yIGhhcnQgQiByZXN1
bHRpbmcgaW4gaGFydCBCIHN0dWNrIGZvcmV2ZXIgaW4gT3BlblNCSS4KPgo+IFRvIGZpeCB0aGUg
YWJvdmUgaXNzdWUsIHJldmVydCBlbnRyeV9jb3VudCBiZWZvcmUgZG9pbmcgaHNtIHN0b3AKPiBp
biBoc20gd2FpdCBsb29wLgo+Cj4gRml4ZXM6IGQ4NDRkZWFkZWM5NCAoImxpYjogc2JpOiBVc2Ug
aHNtIHN0b3AgZm9yIGhzbSB3YWl0IikKPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0
ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiAtLS0KPiAgaW5jbHVkZS9zYmkvc2JpX2luaXQuaCB8ICAy
ICsrCj4gIGxpYi9zYmkvc2JpX2hzbS5jICAgICAgfCAgNCArKystCj4gIGxpYi9zYmkvc2JpX2lu
aXQuYyAgICAgfCAxMyArKysrKysrKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9p
bml0LmggYi9pbmNsdWRlL3NiaS9zYmlfaW5pdC5oCj4gaW5kZXggYzkwMTNlYTQuLmFkMDY4Njc0
IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV9pbml0LmgKPiArKysgYi9pbmNsdWRlL3Ni
aS9zYmlfaW5pdC5oCj4gQEAgLTE2LDYgKzE2LDggQEAgc3RydWN0IHNiaV9zY3JhdGNoOwo+Cj4g
IHZvaWQgX19ub3JldHVybiBzYmlfaW5pdChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gpOwo+
Cj4gK3ZvaWQgc2JpX3JldmVydF9lbnRyeV9jb3VudChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0
Y2gpOwo+ICsKPiAgdW5zaWduZWQgbG9uZyBzYmlfZW50cnlfY291bnQodTMyIGhhcnRpbmRleCk7
Cj4KPiAgdW5zaWduZWQgbG9uZyBzYmlfaW5pdF9jb3VudCh1MzIgaGFydGluZGV4KTsKPiBkaWZm
IC0tZ2l0IGEvbGliL3NiaS9zYmlfaHNtLmMgYi9saWIvc2JpL3NiaV9oc20uYwo+IGluZGV4IGU4
MTI4YTM5Li41NTdhYjEzMSAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9oc20uYwo+ICsrKyBi
L2xpYi9zYmkvc2JpX2hzbS5jCj4gQEAgLTE3Niw4ICsxNzYsMTAgQEAgc3RhdGljIHZvaWQgc2Jp
X2hzbV9oYXJ0X3dhaXQoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoKQo+ICAgICAgICAgICAg
ICAgICAgKiBJZiB0aGUgaHNtX2RldiBpcyByZWFkeSBhbmQgaXQgc3VwcG9ydCB0aGUgaG90cGx1
Zywgd2UgY2FuCj4gICAgICAgICAgICAgICAgICAqIHVzZSB0aGUgaHNtIHN0b3AgZm9yIG1vcmUg
cG93ZXIgc2F2aW5nCj4gICAgICAgICAgICAgICAgICAqLwo+IC0gICAgICAgICAgICAgICBpZiAo
aHNtX2RldmljZV9oYXNfaGFydF9ob3RwbHVnKCkpCj4gKyAgICAgICAgICAgICAgIGlmIChoc21f
ZGV2aWNlX2hhc19oYXJ0X2hvdHBsdWcoKSkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIHNi
aV9yZXZlcnRfZW50cnlfY291bnQoc2NyYXRjaCk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
aHNtX2RldmljZV9oYXJ0X3N0b3AoKTsKCkhpIEFudXAsClRoYW5rcyBmb3IgYWRkcmVzc2luZyB0
aGUgYnVnID0pCgpIb3dldmVyLCB0aGVyZSBtYXkgc3RpbGwgYmUgYW4gaXNzdWUgaW4gdGhlIGZv
bGxvd2luZyBzY2VuYXJpbzoKSWYgdGhlIEhTTSBzdGF0ZSBvZiBjb3JlIEIgaXMgU0JJX0hTTV9T
VEFURV9TVEFSVF9QRU5ESU5HIGF0IHRoaXMKcG9pbnQsIGl0IHdvbid0IGVudGVyIHRoZSB3YXJt
IGJvb3QgcGF0aC4gQXMgYSByZXN1bHQsIHRoZQpgaW5pdF9jb3VudGAgd2lsbCBlbmQgdXAgYmVp
bmcgYGVudHJ5X2NvdW50YCArIDEgYWZ0ZXIgdGhlIHdhcm0gaW5pdApwYXRoLgoKV291bGQgaXQg
bWFrZSBzZW5zZSB0byBpbmNyZW1lbnQgYGVudHJ5X2NvdW50YCBhZnRlciB0aGUKYHNiaV9oc21f
aW5pdCgpYCBjYWxsIGluc3RlYWQ/Cgo+ICsgICAgICAgICAgICAgICB9Cj4KPiAgICAgICAgICAg
ICAgICAgd2ZpKCk7Cj4gICAgICAgICB9Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2luaXQu
YyBiL2xpYi9zYmkvc2JpX2luaXQuYwo+IGluZGV4IDYyYzMyNjgyLi44NGE2Mzc0OCAxMDA2NDQK
PiAtLS0gYS9saWIvc2JpL3NiaV9pbml0LmMKPiArKysgYi9saWIvc2JpL3NiaV9pbml0LmMKPiBA
QCAtNTc5LDYgKzU3OSwxOSBAQCB2b2lkIF9fbm9yZXR1cm4gc2JpX2luaXQoc3RydWN0IHNiaV9z
Y3JhdGNoICpzY3JhdGNoKQo+ICAgICAgICAgICAgICAgICBpbml0X3dhcm1ib290KHNjcmF0Y2gs
IGhhcnRpZCk7Cj4gIH0KPgo+ICt2b2lkIHNiaV9yZXZlcnRfZW50cnlfY291bnQoc3RydWN0IHNi
aV9zY3JhdGNoICpzY3JhdGNoKQo+ICt7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nICplbnRyeV9j
b3VudCwgKmluaXRfY291bnQ7Cj4gKwo+ICsgICAgICAgaWYgKCFlbnRyeV9jb3VudF9vZmZzZXQg
fHwgIWluaXRfY291bnRfb2Zmc2V0KQo+ICsgICAgICAgICAgICAgICBzYmlfaGFydF9oYW5nKCk7
Cj4gKwo+ICsgICAgICAgZW50cnlfY291bnQgPSBzYmlfc2NyYXRjaF9vZmZzZXRfcHRyKHNjcmF0
Y2gsIGVudHJ5X2NvdW50X29mZnNldCk7Cj4gKyAgICAgICBpbml0X2NvdW50ID0gc2JpX3NjcmF0
Y2hfb2Zmc2V0X3B0cihzY3JhdGNoLCBpbml0X2NvdW50X29mZnNldCk7Cj4gKwo+ICsgICAgICAg
KmVudHJ5X2NvdW50ID0gKmluaXRfY291bnQ7Cj4gK30KPiArCj4gIHVuc2lnbmVkIGxvbmcgc2Jp
X2VudHJ5X2NvdW50KHUzMiBoYXJ0aW5kZXgpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBzYmlfc2Ny
YXRjaCAqc2NyYXRjaDsKPiAtLQo+IDIuNDMuMAo+CgpCZXN0IFJlZ2FyZHMsCk5pY2sKCi0tIApv
cGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
