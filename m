Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6836C3ABB2
	for <opensbi@archiver.kernel.org>; Wed, 28 May 2025 12:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BSy5+BflQFiFt1cqM8UZEGED7jNP3B2LIcB9WJRokkY=; b=Z6m3MF+8ouxaED
	mZSdh+0hXmiLN0y1fZrgDhn//2Rt2dKiZMWMZ8YMHMQUUXkOBw857fPquY3M5/mGvDgueMk4hI++d
	D2jk4RR1nXMjA44+MhHpkbYbLBLPq40R5qnfUURERS58QW3iAyBRv9jSNoc1wS1uO8ADbAWPc8bVz
	TBoLOjQtMLl7fybSCw6puZlDPL/EX6UaINuYrW0yzW6szDFk1vHSDAelSHvBcym9Xizht8k4oFGO8
	CLBcyaQYVoi4GKhrQusjdPZvxFN6EFrBkVSm0RsAktmpywo1rVl2S9Na85GtRkQOFJ+dCXexIsPKB
	HbgJSWnOkKc0cZFYDttg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKFpR-0000000D6XE-2u7J;
	Wed, 28 May 2025 12:24:17 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKFgC-0000000D4hQ-38OL
	for opensbi@lists.infradead.org;
	Wed, 28 May 2025 12:14:45 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-553331c3dc7so446575e87.3
        for <opensbi@lists.infradead.org>; Wed, 28 May 2025 05:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748434483; x=1749039283; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHYENEHcMz77wQIa6zh+D5TSwIklfSip6WV3gSiuM/s=;
        b=GMFcxr35ED2Uz1J0A0SCJgnqGvOLlA/5ckJUfxzi5xnM1P7AUt5TKhKvx1TzZYc4+4
         crss8YAlE7v5ftxNsU4KIcF6uB0GRCoWvQNLyvwarjVO8dQ38dtmfZp9RQ/aLFkoHbxH
         Q+XkBchvlwUStAiHRFVP8U2gMR9h5Sfde69DzcUyoj9P1ko6ru53Hip7UzNIbCVS/KRs
         /kRmi17VBChPk7BlJn+Ay+m+yLWSb+oj/nzlDU5WVoQi26D0CztdKGiYAyXxBpAe/0i7
         rYw7TEqCQwH4JLkWaTkRIqPjdkJMeo5Q1XUV171TIjvVYq20pHGmvHK/neNe9UgBdcrD
         plGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748434483; x=1749039283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nHYENEHcMz77wQIa6zh+D5TSwIklfSip6WV3gSiuM/s=;
        b=KaBZ87LdXaYEvUneiD0/RO2XJkZh6tF/RxG4FGG3Ffd8vLxcheaJL5fs+LMyLbSG/h
         4NUyD+yKHhAiCd/7cOPQ5+eDKGDjxOT6EHsIyh61yS836vV0HDpGFCO1hp9bXRPi2Uzd
         sa65JwDmAJIZg/gIRvWod1puKCeYMHiTqWoQgAsFDU6UMgLSh1yrA9tuhuV5Vzv3wQGV
         VCuhxObm9hyQX6U0WZRsQZ3KUGnCltf1kfWmMmTkZc3I6Y6q++9QyCGenfD3GtbuCy6m
         Z9AbblCHpxJZMcozG9eE3FtuQT7VwP9WiiSnrHRt2OI+XqjGar0v5y8zGFC4KLPATLov
         m+fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWRezw7Bx6lE4S7JZZNXe8ZU/sbeYi+TK3ntSTMnAWNSzuR8aeyOcGb852zg2w2UrU3uD0awt5@lists.infradead.org
X-Gm-Message-State: AOJu0YwJl3pB9NQhcAXrFz7NddWJQ7T6md8JLTxpi56Zpk8xAG4IVDxz
	nnzhl2w9L9su5TLSuMhMkocdlSpIb5E3cEHzA8aENbC+0hwY/zdXHwbF2UG0VpXLDmSw32wNU22
	0CqFS6n4XciGdp2dqRoyhzHzck5xF++EVUxT2fCS5fA==
X-Gm-Gg: ASbGnctDE4pTpQF2I40AT2UbQU+THHn+knEbEscvk4cabc0wXw2WjXEbF4mxEwcxYbP
	eOCoiBneMCwieS+P/dFnTO21sv9hOIU1+WeEqhYDQUYwP112XG7ZUBRygPjSi99bwZXOjcQhJ0j
	ZbkTtS59NgqxtJ5nAcP42HkxfyuBcau1jOow==
X-Google-Smtp-Source: AGHT+IEu+8odH0kZ0vrOc3yp9KGAaPMeNZL4PVNoa3C7F17xoUBBXrJa3ekXfxzFV5bizIuSUNx8/s3V/k1D6gxgM4c=
X-Received: by 2002:a05:6512:3e10:b0:553:350a:32d9 with SMTP id
 2adb3069b0e04-553350a33f8mr65792e87.23.1748434482521; Wed, 28 May 2025
 05:14:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250527124821.2113467-1-apatel@ventanamicro.com> <CAKddAkBK1UhLerRx0X+jD0RK2g4BXMSfyuHXczwRD=MBSFiAuA@mail.gmail.com>
In-Reply-To: <CAKddAkBK1UhLerRx0X+jD0RK2g4BXMSfyuHXczwRD=MBSFiAuA@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 28 May 2025 17:44:28 +0530
X-Gm-Features: AX0GCFtQoDO0bGpHKBWP6uz4vQtwBFnostGhu9ZekUanemu9BsqvuzvYhUzzNK4
Message-ID: <CAK9=C2VXWoSX366O=rhp2TYEOwoqcS0hkLPBZLodAupnR35BSw@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: Revert entry_count before doing hsm stop in hsm
 wait loop
To: Nick Hu <nick.hu@sifive.com>
Cc: Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_051444_790168_6FC936FE 
X-CRM114-Status: GOOD (  35.41  )
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

T24gV2VkLCBNYXkgMjgsIDIwMjUgYXQgMzo1NuKAr1BNIE5pY2sgSHUgPG5pY2suaHVAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1heSAyNywgMjAyNSBhdCA4OjQ44oCvUE0gQW51cCBQ
YXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4KPiA+IFVzaW5nIGhzbSBz
dG9wIGluIGhzbSB3YWl0IGxvb3AgY2F1c2VzIHNlY29uZGFyeSBoYXJ0cyB0byBiZSBzdHVjawo+
ID4gZm9yZXZlciBpbiBPcGVuU0JJIG9uIFJJU0MtViBwbGF0Zm9ybXMgd2hlcmUgSFNNIGhhcnQg
aG90cGx1ZyBpcwo+ID4gYXZhaWxhYmxlIGFuZCBhbGwgaGFydHMgY29tZS11cCBhdCB0aGUgc2Ft
ZSB0aW1lIGR1cmluZyBzeXN0ZW0KPiA+IHBvd2VyLW9uLgo+ID4KPiA+IEZvciBleGFtcGxlLCBs
ZXRzIHNheSB3ZSBoYXZlIHR3byBoYXJ0cyBBIGFuZCBCIG9uIGEgUklTQy1WIHBsYXRmb3JtCj4g
PiB3aXRoIEhTTSBoYXJ0IGhvdHBsdWcgd2hpY2ggY29tZS11cCBhdCB0aGUgc2FtZSB0aW1lIGR1
cmluZyBzeXN0ZW0KPiA+IHBvd2VyLW9uLiBUaGUgaGFydCBBIGVudGVycyBPcGVuU0JJIGJlZm9y
ZSBoYXJ0IEIgaGVuY2UgaXQgYmVjb21lcwo+ID4gdGhlIHByaW1hcnkgKG9yIGNvbGQtYm9vdCkg
aGFydCB3aGVyZWFzIGhhcnQgQiBiZWNvbWVzIHRoZSBzZWNvbmRhcnkKPiA+IChvciB3YXJtLWJv
b3QpIGhhcnQuIFRoZSBoYXJ0IEEgZm9sbG93cyB0aGUgT3BlblNCSSBjb2xkLWJvb3QgcGF0aAo+
ID4gYW5kIHJlZ2lzdGVycyBoc20gZGV2aWNlIGJlZm9yZSBoYXJ0IEIgZW50ZXJzIE9wZW5TQkku
IFRoZSBoYXJ0IEIKPiA+IGV2ZW50dWFsbHkgZW50ZXJzIE9wZW5TQkkgYW5kIGZvbGxvd3MgdGhl
IE9wZW5TQkkgd2FybS1ib290IHBhdGgKPiA+IHNvIGl0IHdpbGwgaW5jcmVtZW50IGl0J3Mgb3du
IGVudHJ5X2NvdW50IGJlZm9yZSBlbnRlcmluZyBoc20gd2FpdAo+ID4gbG9vcCB3aGVyZSBpdCBz
ZWVzIGhzbSBkZXZpY2UgYW5kIHN0b3BzIGl0c2VsZi4gTGF0ZXIgYXMgcGFydCBvZgo+ID4gdGhl
IExpbnV4IGJvb3QtdXAgc2VxdWVuY2UsIGhhcnQgQSBpc3N1ZXMgU0JJIEhTTSBzdGFydCBjYWxs
IHRvCj4gPiBicmluZy11cCBoYXJ0IEIgYnV0IE9wZW5TQkkgc2VlcyBlbnRyeV9jb3VudCAhPSBp
bml0X2NvdW50IGZvcgo+ID4gaGFydCBCIGluIHNiaV9oc21faGFydF9zdGFydCgpIGhlbmNlIGhz
bV9kZXZpY2VfaGFydF9zdGFydCgpIGlzCj4gPiBub3QgY2FsbGVkIGZvciBoYXJ0IEIgcmVzdWx0
aW5nIGluIGhhcnQgQiBzdHVjayBmb3JldmVyIGluIE9wZW5TQkkuCj4gPgo+ID4gVG8gZml4IHRo
ZSBhYm92ZSBpc3N1ZSwgcmV2ZXJ0IGVudHJ5X2NvdW50IGJlZm9yZSBkb2luZyBoc20gc3RvcAo+
ID4gaW4gaHNtIHdhaXQgbG9vcC4KPiA+Cj4gPiBGaXhlczogZDg0NGRlYWRlYzk0ICgibGliOiBz
Ymk6IFVzZSBoc20gc3RvcCBmb3IgaHNtIHdhaXQiKQo+ID4gU2lnbmVkLW9mZi1ieTogQW51cCBQ
YXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gPiAtLS0KPiA+ICBpbmNsdWRlL3NiaS9z
YmlfaW5pdC5oIHwgIDIgKysKPiA+ICBsaWIvc2JpL3NiaV9oc20uYyAgICAgIHwgIDQgKysrLQo+
ID4gIGxpYi9zYmkvc2JpX2luaXQuYyAgICAgfCAxMyArKysrKysrKysrKysrCj4gPiAgMyBmaWxl
cyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9pbml0LmggYi9pbmNsdWRlL3NiaS9zYmlfaW5pdC5oCj4g
PiBpbmRleCBjOTAxM2VhNC4uYWQwNjg2NzQgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL3NiaS9z
YmlfaW5pdC5oCj4gPiArKysgYi9pbmNsdWRlL3NiaS9zYmlfaW5pdC5oCj4gPiBAQCAtMTYsNiAr
MTYsOCBAQCBzdHJ1Y3Qgc2JpX3NjcmF0Y2g7Cj4gPgo+ID4gIHZvaWQgX19ub3JldHVybiBzYmlf
aW5pdChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gpOwo+ID4KPiA+ICt2b2lkIHNiaV9yZXZl
cnRfZW50cnlfY291bnQoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoKTsKPiA+ICsKPiA+ICB1
bnNpZ25lZCBsb25nIHNiaV9lbnRyeV9jb3VudCh1MzIgaGFydGluZGV4KTsKPiA+Cj4gPiAgdW5z
aWduZWQgbG9uZyBzYmlfaW5pdF9jb3VudCh1MzIgaGFydGluZGV4KTsKPiA+IGRpZmYgLS1naXQg
YS9saWIvc2JpL3NiaV9oc20uYyBiL2xpYi9zYmkvc2JpX2hzbS5jCj4gPiBpbmRleCBlODEyOGEz
OS4uNTU3YWIxMzEgMTAwNjQ0Cj4gPiAtLS0gYS9saWIvc2JpL3NiaV9oc20uYwo+ID4gKysrIGIv
bGliL3NiaS9zYmlfaHNtLmMKPiA+IEBAIC0xNzYsOCArMTc2LDEwIEBAIHN0YXRpYyB2b2lkIHNi
aV9oc21faGFydF93YWl0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkKPiA+ICAgICAgICAg
ICAgICAgICAgKiBJZiB0aGUgaHNtX2RldiBpcyByZWFkeSBhbmQgaXQgc3VwcG9ydCB0aGUgaG90
cGx1Zywgd2UgY2FuCj4gPiAgICAgICAgICAgICAgICAgICogdXNlIHRoZSBoc20gc3RvcCBmb3Ig
bW9yZSBwb3dlciBzYXZpbmcKPiA+ICAgICAgICAgICAgICAgICAgKi8KPiA+IC0gICAgICAgICAg
ICAgICBpZiAoaHNtX2RldmljZV9oYXNfaGFydF9ob3RwbHVnKCkpCj4gPiArICAgICAgICAgICAg
ICAgaWYgKGhzbV9kZXZpY2VfaGFzX2hhcnRfaG90cGx1ZygpKSB7Cj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBzYmlfcmV2ZXJ0X2VudHJ5X2NvdW50KHNjcmF0Y2gpOwo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgaHNtX2RldmljZV9oYXJ0X3N0b3AoKTsKPgo+IEhpIEFudXAsCj4gVGhh
bmtzIGZvciBhZGRyZXNzaW5nIHRoZSBidWcgPSkKPgo+IEhvd2V2ZXIsIHRoZXJlIG1heSBzdGls
bCBiZSBhbiBpc3N1ZSBpbiB0aGUgZm9sbG93aW5nIHNjZW5hcmlvOgo+IElmIHRoZSBIU00gc3Rh
dGUgb2YgY29yZSBCIGlzIFNCSV9IU01fU1RBVEVfU1RBUlRfUEVORElORyBhdCB0aGlzCj4gcG9p
bnQsIGl0IHdvbid0IGVudGVyIHRoZSB3YXJtIGJvb3QgcGF0aC4gQXMgYSByZXN1bHQsIHRoZQo+
IGBpbml0X2NvdW50YCB3aWxsIGVuZCB1cCBiZWluZyBgZW50cnlfY291bnRgICsgMSBhZnRlciB0
aGUgd2FybSBpbml0Cj4gcGF0aC4KPgo+IFdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gaW5jcmVtZW50
IGBlbnRyeV9jb3VudGAgYWZ0ZXIgdGhlCj4gYHNiaV9oc21faW5pdCgpYCBjYWxsIGluc3RlYWQ/
CgpUaGlzIGlzIG5vdCBhIGJ1ZyByYXRoZXIgZXhwZWN0ZWQgYmVoYXZpb3VyLgoKV2hlbiB0aGUg
aGFydCBCIGlzIGluIFNCSV9IU01fU1RBVEVfU1RBUlRfUEVORElORyBzdGF0ZQp0aGVuIGl0IG1l
YW5zIHNvbWUgb3RoZXIgaGFydCBBIGhhcyBpc3N1ZWQgSFNNIGhhcnQgc3RhcnQgYW5kCmhhcyBh
bHNvIHByb3ZpZGVkIGVudHJ5IGRldGFpbHMuIFRoZSBoYXJ0IEIgaW5jcmVtZW50cyBlbnRyeV9j
b3VudAp1cG9uIGVudHJ5IGludG8gT3BlblNCSSBhbmQgaW5jcmVtZW50cyBpbml0X2NvdW50IGFm
dGVyIGluaXRpYWxpemF0aW9uCmlzIGRvbmUuCgpSZWdhcmRzLApBbnVwCgo+Cj4gPiArICAgICAg
ICAgICAgICAgfQo+ID4KPiA+ICAgICAgICAgICAgICAgICB3ZmkoKTsKPiA+ICAgICAgICAgfQo+
ID4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2luaXQuYyBiL2xpYi9zYmkvc2JpX2luaXQuYwo+
ID4gaW5kZXggNjJjMzI2ODIuLjg0YTYzNzQ4IDEwMDY0NAo+ID4gLS0tIGEvbGliL3NiaS9zYmlf
aW5pdC5jCj4gPiArKysgYi9saWIvc2JpL3NiaV9pbml0LmMKPiA+IEBAIC01NzksNiArNTc5LDE5
IEBAIHZvaWQgX19ub3JldHVybiBzYmlfaW5pdChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gp
Cj4gPiAgICAgICAgICAgICAgICAgaW5pdF93YXJtYm9vdChzY3JhdGNoLCBoYXJ0aWQpOwo+ID4g
IH0KPiA+Cj4gPiArdm9pZCBzYmlfcmV2ZXJ0X2VudHJ5X2NvdW50KHN0cnVjdCBzYmlfc2NyYXRj
aCAqc2NyYXRjaCkKPiA+ICt7Cj4gPiArICAgICAgIHVuc2lnbmVkIGxvbmcgKmVudHJ5X2NvdW50
LCAqaW5pdF9jb3VudDsKPiA+ICsKPiA+ICsgICAgICAgaWYgKCFlbnRyeV9jb3VudF9vZmZzZXQg
fHwgIWluaXRfY291bnRfb2Zmc2V0KQo+ID4gKyAgICAgICAgICAgICAgIHNiaV9oYXJ0X2hhbmco
KTsKPiA+ICsKPiA+ICsgICAgICAgZW50cnlfY291bnQgPSBzYmlfc2NyYXRjaF9vZmZzZXRfcHRy
KHNjcmF0Y2gsIGVudHJ5X2NvdW50X29mZnNldCk7Cj4gPiArICAgICAgIGluaXRfY291bnQgPSBz
Ymlfc2NyYXRjaF9vZmZzZXRfcHRyKHNjcmF0Y2gsIGluaXRfY291bnRfb2Zmc2V0KTsKPiA+ICsK
PiA+ICsgICAgICAgKmVudHJ5X2NvdW50ID0gKmluaXRfY291bnQ7Cj4gPiArfQo+ID4gKwo+ID4g
IHVuc2lnbmVkIGxvbmcgc2JpX2VudHJ5X2NvdW50KHUzMiBoYXJ0aW5kZXgpCj4gPiAgewo+ID4g
ICAgICAgICBzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2g7Cj4gPiAtLQo+ID4gMi40My4wCj4g
Pgo+Cj4gQmVzdCBSZWdhcmRzLAo+IE5pY2sKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVu
c2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9vcGVuc2JpCg==
