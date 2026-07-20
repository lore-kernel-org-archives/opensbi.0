Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA8BC44515
	for <opensbi@archiver.kernel.org>; Mon, 20 Jul 2026 15:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vostHRMGZghGKRNcMUoJjrn/xR9z+t3lVTJeknX3mvM=; b=ggPI9SbjJnNeAz
	RD0NCxOi81YXUjUCbRVtiaf924+BWqGnRXi+0klrzAXsDLjN1B3SEM5q4mlgv0BiBZEuJ/3mdzjr2
	XorICAoK4xg9MnC7opnXeZk/CpjhXqCUq5t96w8DzDjs8BNr2vbUFO8ijM7OpFrzuGnUVwmz/TLxU
	5dVEgTkuII2sk+vRXmzM3mKOAvHYHqlawL6h8qqpalyjcpn59nz4O8uvdYHJoRr2OcvaBU0b8BhzF
	jD/TaeXnHRoOZYnPwTwXvMatDfQtGR3YQrGavE7yHSSx1f69AVOpPl9N6bTYdrGQs/W6zQJ4ZDxIQ
	YbxEDURYcJnbrCXTY1nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpck-000000077un-2ICl;
	Mon, 20 Jul 2026 15:09:42 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpch-000000077rG-3OmA
	for opensbi@lists.infradead.org;
	Mon, 20 Jul 2026 15:09:41 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-667d8f7dc59so1619835d50.1
        for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 08:09:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784560176; cv=none;
        d=google.com; s=arc-20260327;
        b=rQluD2/dU9kOO6dnAj5XWw8ENVVO0qejfo6qjPFbtch9pbKNwKKWP0eCRQ0fa7N5Gj
         YGZZ6erFWHSSjzRFX42Tx+LBPDaBcKoEs3czTLhsQ5/n2I53WL/LUj5pZ3WDeiybPCGq
         bzqLm0V5jxbZeLIX6wZ4KfYLsBNbpRyGvAVnAx/433VMpUBAnEoBFpDmHEwJg3TFK+p2
         9otaTrIgshI2qqbc1H9lyqf/dYozWHfWEvA23Ohe87/EX2kCyr/39Nblbor2FY9HDlWY
         Ldwi0c4J+grQAK+hQ0qly3cWKF5XKyKIXZUHApkMCjB3bRdo+D6QNxV/CF/945G8dxBB
         QMeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nzejlqLaao7gGUI4fTZmkHzaBu62/2T8d0VG9u0q9nc=;
        fh=CeyCQp+XPGqs+/QFfJPRWct+orJ+/ruIFXLmnlb/73E=;
        b=RlnZJqmFe/SukTTbFRttvtgSaD7bl1MIAtdtgTVBN91zc9juesNIbT9UhWRyW3hYNh
         cHx/4F88HucsjZAprQY5K8SZwb4Gtt7VNl3CgSqWjo3z2QN3QRJbbXp7nIqJs0VGIZ94
         l4WQnTFpjKjodyXwJbVQjKCHnSozqTRk6kBipJ9W63Tvi+XKL2XhTsDXJAIA64U6Zx9k
         GMrA6hSq46glOzTUoLeqqoR9JMtkn41SuOTRFlB0/epuPXkUanRnLO+cNnHjDG9XX7A7
         LCtseT+QIvozOsbAZSFKP+GYf3olz3tUwYR88nl/dA7Pf7HSZAN71bCAO/NtCn4Setvu
         DQzw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784560176; x=1785164976; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nzejlqLaao7gGUI4fTZmkHzaBu62/2T8d0VG9u0q9nc=;
        b=mBzSYkJDunjMP+ujU11jpk4+LirwTVUlQbYPsrAWom+VaUiPyVSkT5Hba/PhQrVujG
         1KQQw5poqrJX2CjPOdF76Fm46bcE2rL6uY2qpK+i2OJtxZUnLD88vam2uKBNUlk2gnb+
         A/GM6XrkzHXzn5CRLGXMCj3hlZcJQV8bm+ABBF6CdczhMmbetItJ+nBRSWj+HnX/+uWp
         JJYxlsn02SzvoeruIdtgdOZBFURBZABSfhNG8Uck2/Cyr2Twm9RNlOsWmV8E15qKMxzu
         Mx1ywS/dWp6g4T0fB/wFWGKflrdS6ba6itoR+bCQqfSsfO4MwImevKKCdDaFxcfbZ+eX
         WdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784560176; x=1785164976;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nzejlqLaao7gGUI4fTZmkHzaBu62/2T8d0VG9u0q9nc=;
        b=UYcYk6rLeeIdsMD2l9/EIzQad3GQBIgIv3bWCufUX/hnLl7wBkJojs7mMmqlaHjoOq
         q6oWKR49boOPx+yP1XDtXbYc7QXTwhKJp0HG/GN4LBYlKkG5iLc5Cb0/i/XGz0f0GVoB
         RqQlHrnLFMwDMSzGEGdtxmhXpK+7wUBU10xVcACrh0pkohsa2wwt4AE0ce7/z/ZPZu4C
         zoLHUzcXJibj9Y2Q9Lbh8eHv6OKHSES4fmOb2unA7ZSFN79kDm4fMyHVhepRIRE40bIq
         uHjWGFkmgvOwTnZHegTieAPSLjFsiQQspNY9Zyfvw/T4SbxND3z0kgl+UlZdmD8yr0W7
         uGPQ==
X-Gm-Message-State: AOJu0YxZOWPz+nWl+u+QNQYz6WZysy0YIOgGiC2y+1rBIxBbgFCGUaYY
	l41Bgb2EvAS9QqYQYjNO0RxbASbYHMVuz6vRXxNSnaZTvEiU8TCfdEpN9sP2x5UxD3+D/98rXgP
	vZp8dysfgXp/JDepi3gVI5KVRXPfwCtVOaZGW
X-Gm-Gg: AR+sD100Rkw23itS3Tv3FIVHcztx0od6OO6N7mIn9jFHvKGxcmKbPFLSUWxX7KoVOlj
	0MDAPRZrqGcj5v/KoAnc4ZbDFqTbm01CMi0fLr3SNzQsqANul2iFj9e7hoXG+9WWBse7H1d2qxQ
	IYg0OzSomh8xdWmajkWA/qMawbekOu5+7llQxcfUfcVsoyMflwhv4AJP+wRpsywYqZNRezJ8TsN
	Wm/6dyIhtELeUD9HpW8w75PFDcOZw/j/gXhLVmmscHt/SuGMEQvOdI6Sccomw==
X-Received: by 2002:a05:690e:480e:b0:668:430b:ab1d with SMTP id
 956f58d0204a3-668430bbbfemr2356120d50.0.1784560175697; Mon, 20 Jul 2026
 08:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260519203331.2773185-1-raymondmaoca@gmail.com> <CAAhSdy1i+1oxkP5XdMJCzjgze3sZ0SSxZ-jzcFJSNPHQfSjm-Q@mail.gmail.com>
In-Reply-To: <CAAhSdy1i+1oxkP5XdMJCzjgze3sZ0SSxZ-jzcFJSNPHQfSjm-Q@mail.gmail.com>
From: Raymond Mao <raymondmaoca@gmail.com>
Date: Mon, 20 Jul 2026 11:09:24 -0400
X-Gm-Features: AUfX_myHeUIl-_iiA0SXie2PITsUAYbx66LvHTw5McDyRSb6uyeUm1rGkC9ncdg
Message-ID: <CAMDkj5ytwo-zQvx_eMMBE6nA4BkN_b2_R3LFykxrb-A78avJfQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] Add WorldGuard hwiso support
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org, scott@riscstar.com, dave.patel@riscstar.com, 
	raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, anup.patel@qti.qualcomm.com, 
	anuppate@qti.qualcomm.com, dhaval@rivosinc.com, peter.lin@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_080939_860557_4750AB76 
X-CRM114-Status: GOOD (  22.16  )
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

SGkgQW51cCwKCk9uIE1vbiwgSnVsIDIwLCAyMDI2IGF0IDQ6NDHigK9BTSBBbnVwIFBhdGVsIDxh
bnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgTWF5IDIwLCAyMDI2IGF0IDI6
MDPigK9BTSBSYXltb25kIE1hbyA8cmF5bW9uZG1hb2NhQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+
ID4gRnJvbTogUmF5bW9uZCBNYW8gPHJheW1vbmQubWFvQHJpc2NzdGFyLmNvbT4KPiA+Cj4gPiBU
aGlzIHNlcmllcyBhZGRzIFdvcmxkR3VhcmQgaW1wbGVtZW50YXRpb24gZm9yIE9wZW5TQkkgb24g
dG9wIG9mIHRoZQo+ID4gZ2VuZXJpYyBoYXJkd2FyZSBpc29sYXRpb24gKEhXSVNPKSBob29rcy4K
PiA+Cj4gPiBUaGUgZ29hbCBpcyB0byBsZXQgT3BlblNCSToKPiA+IC0gcHJvZ3JhbSBwbGF0Zm9y
bSBXb3JsZEd1YXJkIGNoZWNrZXIgc3RhdGUgYXQgYm9vdAo+ID4gLSBwYXJzZSBwZXItZG9tYWlu
IFdvcmxkR3VhcmQgbWV0YWRhdGEgZnJvbSB0aGUgZGV2aWNlIHRyZWUKPiA+IC0gcmVwcm9ncmFt
IGhhcnQgV29ybGRHdWFyZCBydW50aW1lIHN0YXRlIGR1cmluZyBkb21haW4gdHJhbnNpdGlvbnMK
PiA+Cj4gPiBUaGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiB0YXJnZXRzIHRoZSBXb3JsZEd1YXJk
IG1vZGVsIG9mCj4gPiBgc2lmaXZlLHdnY2hlY2tlcjJgIGNoZWNrZXIgcGx1cyBwZXItaGFydCBh
bmQgcGVyLWRvbWFpbiBXb3JsZEd1YXJkCj4gPiBtZXRhZGF0YSBmcm9tIERULgo+ID4KPiA+IFRo
ZSBzZXJpZXMgaXMgb3JnYW5pemVkIGFzIGZvbGxvd3M6Cj4gPiAxLiBhZGQgdGhlIFdvcmxkR3Vh
cmQgQ1NSIGRlZmluaXRpb25zIGFuZCBoYXJ0IGV4dGVuc2lvbiBmbGFncyBuZWVkZWQKPiA+ICAg
IHRvIGRldGVjdCBzdXBwb3J0IGZvciBNTFdJRCwgTVdJRERFTEVHLCBhbmQgU0xXSUQKPiA+IDIu
IGRvY3VtZW50IHRoZSBIV0lTTyAvIFdvcmxkR3VhcmQgZGV2aWNlLXRyZWUgbWV0YWRhdGEgdXNl
ZCBieSB0aGUKPiA+ICAgIGN1cnJlbnQgaW1wbGVtZW50YXRpb24KPiA+IDMuIGFkZCBhIFFFTVUg
dmlydCBEVCBvdmVybGF5IHRoYXQgZGVzY3JpYmVzIGRvbWFpbiBXSUQvV0lEIGxpc3QKPiA+ICAg
IGFzc2lnbm1lbnQgYW5kIGNoZWNrZXIgcGVybWlzc2lvbiBwb2xpY3kgZm9yIHRoZSBjdXJyZW50
IHRlc3QgZmxvdwo+ID4gNC4gYWRkIGdlbmVyaWMtcGxhdGZvcm0gV29ybGRHdWFyZCBydW50aW1l
IHN1cHBvcnQgdG9nZXRoZXIgd2l0aAo+ID4gICAgYHdnY2hlY2tlcjJgIGNoZWNrZXIgcGFyc2lu
ZyBhbmQgYm9vdC10aW1lIE1NSU8gcHJvZ3JhbW1pbmcKPiA+IDUuIGFkZCBnZW5lcmljIEhXSVNP
IFNCSVVOSVQgY292ZXJhZ2UKPiA+IDYuIGFkZCBRRU1VIHZpcnQgV29ybGRHdWFyZCBtZWNoYW5p
c20tc3BlY2lmaWMgU0JJVU5JVCBjaGVja3MgZm9yCj4gPiAgICBib290LXRpbWUgY2hlY2tlciBw
cm9ncmFtbWluZyBhbmQgcnVudGltZSBDU1Igc3RhdGUKPiA+IDcuIGFkZCBhIFFFTVUgdmlydCBm
YWlsdXJlLW1vZGUgU0JJVU5JVCB0ZXN0IHRoYXQgaW50ZW50aW9uYWxseQo+ID4gICAgdHJpZ2dl
cnMgYSBkZW5pZWQgV29ybGRHdWFyZCBhY2Nlc3MgYW5kIHZlcmlmaWVzIHRoZSBleHBlY3RlZCB0
cmFwCj4gPgo+ID4gTm90ZXM6Cj4gPiAtIFRoZSBpbXBsZW1lbnRhdGlvbiBoYXMgYmVlbiB2ZXJp
ZmllZCB3aXRoIFFFTVUgdmlydCB0aGF0IHN1cHBvcnRzCj4gPiAgIGB3Zz1vbmBbMV0uCj4gPiAt
IFRoaXMgc2VyaWVzIGRlcGVuZHMgb24gcHJldmlvdXMgcGF0Y2hlcyAoWzJdIGFuZCBbM10pIGZv
cgo+ID4gICBpbnRyb2R1Y2luZyBIV0lTTyBmcmFtZXdvcmsuCj4gPgo+ID4gWzFdIGh0dHBzOi8v
Z2l0aHViLmNvbS9jd3NodS9xZW11L3RyZWUvcmlzY3Ytd2ctZHRzCj4gPiBbMl0gW1BBVENIIDEv
Ml0gc2JpOiBhZGQgaGFyZHdhcmUgaXNvbGF0aW9uIGFic3RyYWN0aW9uIGZyYW1ld29yawo+ID4g
ICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29wZW5zYmkvMjAyNjA1MDQxNzM5NDguMTY2Mzgy
My0xLXJheW1vbmRtYW9jYUBnbWFpbC5jb20vCj4gPiBbM10gW1BBVENIIDIvMl0gc2JpOiByb3V0
ZSBkb21haW4gbGlmZWN5Y2xlIHRyYW5zaXRpb25zIHRocm91Z2ggaHdpc28gaG9va3MKPiA+ICAg
ICBodHRwczovL2xvcmUua2VybmVsLm9yZy9vcGVuc2JpLzIwMjYwNTA0MTczOTQ4LjE2NjM4MjMt
Mi1yYXltb25kbWFvY2FAZ21haWwuY29tLwo+ID4KPiA+IFJheW1vbmQgTWFvICg3KToKPiA+ICAg
aGFydDogYWRkIFdvcmxkR3VhcmQgQ1NSIElEcyBhbmQgaGFydCBleHRlbnNpb24gZmxhZ3MKPiA+
ICAgZG9jczogZG9jdW1lbnQgaHdpc28gV29ybGRHdWFyZCBEVCBiaW5kaW5ncwo+ID4gICBbTk9U
LUZPUi1VUFNUUkVBTV0gcGxhdGZvcm06IHZpcnQ6IGFkZCBRRU1VIFdvcmxkR3VhcmQgaHdpc28g
b3ZlcmxheQo+ID4gICBwbGF0Zm9ybTogZ2VuZXJpYzogYWRkIFdvcmxkR3VhcmQgaHdpc28gc3Vw
cG9ydCB3aXRoIHdnY2hlY2tlcjIKPiA+ICAgdGVzdDogYWRkIGdlbmVyaWMgaHdpc28gU0JJIHVu
aXQgY292ZXJhZ2UKPiA+ICAgcGxhdGZvcm06IHZpcnQ6IGFkZCBRRU1VIHZpcnQgV29ybGRHdWFy
ZCBod2lzbyB0ZXN0cwo+ID4gICBwbGF0Zm9ybTogdmlydDogYWRkIFdvcmxkR3VhcmQgSFdJU08g
ZmFpbHVyZS1tb2RlIFNCSVVOSVQgdGVzdAo+Cj4gSSB3aWxsIGNvbnNpZGVyIHRoaXMgc2VyaWVz
IHN1cGVyc2VkZWQgYnkgIkFkZCBSSVNDLVYgV29ybGRzIElTQQo+IHN1cHBvcnQgdG8gT3BlblNC
SSIgcG9zdGVkIGJ5IFl1LUNoZWluIFBldGVyIExpbiAoU2lGaXZlKS4KPgoKTm90IHJlYWxseSwg
dGhlIG9uZSBmcm9tIFBldGVyIGlzIHdpdGggdGhlIElTQSBhbmQgRFQtYmluZ3MgYnV0CndpdGhv
dXQgdGhlIFdHIGltcGxlbWVudGF0aW9ucy4KQnV0IEkgd2lsbCByZWJhc2UgbXkgc2VyaWVzIG9u
IHRvcCBvZiBoaXMgb25lIGFuZCBzZW5kIGEgdjIuCgpSZWdhcmRzLApSYXltb25kCgo+IFJlZ2Fy
ZHMsCj4gQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5z
YmkK
