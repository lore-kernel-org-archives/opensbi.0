Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6698DE9E311
	for <opensbi@archiver.kernel.org>; Wed, 11 Feb 2026 15:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L5S9fLDFJCiflrsBUGzY34yHMiAdXa2Xxiw37nEOWrs=; b=35oVQUdsity6I4
	Q2qLATCpv1eKoqNVwcxc5urtY+HT+7tcl/tuM/w9FWf3Rja8awLlaFgWGXOp9fDSWn+xbhcuV60rK
	raDGQ1U6lgcYR0ZEzeiSKfXLl6x1/L1ybk1MHZUTxvlJK0oeg41xOAGQckMkgCJ5Rs1IstS2z3rtZ
	vATSHcqb6BO5OXbO9/FwCBCDLnha8Wfv7WCDjGEcC75pAEn/h7NfzHyWkGkbsjJREzErCGvA1ZJQF
	uNQJ0F8Cgm9PZBbFgGqEVYs4LSAC9PJ1D3h9lSmEIUOKLCJgmnv2Hc1/00SQJxBn9fVRgOJQQTArE
	qDDO6hxRZKdnoHB/EaEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqBjn-00000000kpG-2X5B;
	Wed, 11 Feb 2026 15:02:43 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqBjj-00000000koQ-17Rd
	for opensbi@lists.infradead.org;
	Wed, 11 Feb 2026 15:02:40 +0000
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-948a2d37896so2820591241.0
        for <opensbi@lists.infradead.org>; Wed, 11 Feb 2026 07:02:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770822157; cv=none;
        d=google.com; s=arc-20240605;
        b=lEbFy64l+BecNGLAqdTeasvudYh993T58Avx/gp+vGfqGVKSrD+Ulf/66XzBFTInRR
         A+7sQhzInFXGoIRUiYf3kLh3XZP2LgZ14isgMJbAFma7Hgjk9kyMsYK/k3Z4dgeLeViz
         iyLeieklqUf0OWEPSi6wxzqDZNfjIfiLiBCthR6R5Ip6rxebasPKI2mvQAWUzeGLh8yB
         Y/JJrR315/UI5qWXz3ArPub6N3IAqfLHoi7pdQSK5wBDH5t9xqUwFjJ7w6XLSK7JczCj
         ydz+zTcgJRyuwZFelBe/6ohqgfNA/6FYVJR8nobwX7JQza6GQCcK4LAjW2dwWCxKQklc
         A7kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jj5HxelBsXgvrjGpjdKAB7s/WTVFRnpy3t3Enj6/KXY=;
        fh=NNnvj+Wjdcns0j3jKD8ZysyuCtgnZY+voZALdmSnUzo=;
        b=EGx+b2jne3n+t3/ilh6KRbx/k6fg0+yfJB/+z9Ua0p5x6yDrXbYGTj6t6Gl0vWjYps
         3t72zggVhqOsJ2DhTV3OzwePLjbw3LALGzdWtZ20DGSEf4Ys31PNeIlU0knOWE4tRN3X
         8Rt7b5TeAzgYpb4Yv4Id9gIVPZCsBp38wtGYZ4tsoaNfMaiTYGupAVONU74sacU76z7W
         t36xvsySmxM/nMvl5T5bAJBxZ8qD8zvJEIUtXsnW1Isoi9F8b+Fg0gpGHI3pcbcNmFeS
         4NNfloCqWxYB7d4DP4fGzAW+jApfLjhppyHMY42hKXrtPapLjJwVCA3yaELYken0R0s8
         p/6Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770822157; x=1771426957; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jj5HxelBsXgvrjGpjdKAB7s/WTVFRnpy3t3Enj6/KXY=;
        b=ml8YhK+AcZ4Lr9xbEJCF1hlWISzm+T422hE4zY6HuxgHZoWvQJSr+a0C64JNvHEL/n
         CCxjjWxFe4cVX0tOvArvXNBOo7f++YR67dwRAlQO4YYAuOJGVAxdmRM8YR+YIQG1a3eT
         aBPgRpU6JXJaZ4fMCY4lO1/hxqrXrfdy7gjH2/Sy5kJKxu5xbp/vsiMpzEk2yymB0z4g
         kCITvjL+4kJV46/WRKc8m/j3MvWeUq5uZy36KvAHwP6kh2FlQ/NojtAg97snW7vcKqJd
         aab/kMPbnsbKzdUupV7ABvxWyT9/rCgPoecNudWCs8+nX5fVxopSXWunZ2SUEc1pGwN8
         Jucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770822157; x=1771426957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jj5HxelBsXgvrjGpjdKAB7s/WTVFRnpy3t3Enj6/KXY=;
        b=O0NY1B03EUoT0Mq1o3PG3pLIwfFeDKLzLdXvCD6BaSuSMVZ2pMoELuO87luaQVl0DX
         QuwCsTiIw0quiP4pzrGlH8ouwdINLlb9DNv5Cko/U1LcHblcaNKe8OEVoqkjOKIP33kI
         3DvPOG7K3+lPl8HVWEf+clJXWNogSL3WA03r0gNhDW6QefLIYBVXALa29FsMlWGlHyeY
         TsmppszcCokKTqx8jbdYDqoBMcoUY+qan3Bop0LDJU5S4yj3APB56njyvnPBKs9qTsYe
         ffcUDP2t1LEHSt1+lH/rWysRLlGFtRuWNAuRoCIloSpRuUJdmb8Jod4CNxyqSBVcYf7J
         njtA==
X-Forwarded-Encrypted: i=1; AJvYcCXUg1WhAueho54a+e+tv1dzsQbUqbJ1pOtu1sKWTIIy9UbPDLqOh+j94+N5TwL8uPpftft9JmTT@lists.infradead.org
X-Gm-Message-State: AOJu0YxE+F/oJ6gKpqHqVddoDzURfbHJ5of7l651xqV0PyEW6QXF4x5E
	ipSSxNX+i6o2oWuLjGxO5gjpFBbfrZpUp6kpeS94DpIV3upjbHwas6jXsQXrP8H8F28NWB8HTz4
	9ywDJoQ02NhGupkt/ZtSL3KaledCBa/Q=
X-Gm-Gg: AZuq6aIanbpT6oBYJX35+wPoSU8lVgvyg0VaA196RbHg7JVmKNdBfl26St6pfX01LGc
	6cYETMrdR65C+2zhdtrYoqEgdhC0D/7FRqt9GVTdV7GZJVMoSuK072n99/6AJ+E3U8Puk2nykbO
	3SYIiAm+OmXoSWDNKaJ08upHA6Tt68SdxZOhpXRzQhWUIAuILjV4nUeuULiZeF2o2l6nAoSS30x
	KRug0Jn8p/Pme4WfeDPZLUE2P5BBDbKTVP3RQ55hP8H5XkDyzziGDSKDco+U89uw3JgY9zSQo/h
	OfPGMS32
X-Received: by 2002:a05:6102:dcd:b0:520:dbc0:6ac4 with SMTP id
 ada2fe7eead31-5fde4125e29mr1108737137.2.1770822156652; Wed, 11 Feb 2026
 07:02:36 -0800 (PST)
MIME-Version: 1.0
References: <20260207102602.2917520-1-anup.patel@oss.qualcomm.com>
 <20260207102602.2917520-6-anup.patel@oss.qualcomm.com> <0f55c5db-929f-4192-994a-8432c5bda1b4@gmail.com>
 <CAAhSdy26XNCbfDhe8EpK-AWMneyS=Hpwo8mb7vC1zrcVhBMKPQ@mail.gmail.com>
In-Reply-To: <CAAhSdy26XNCbfDhe8EpK-AWMneyS=Hpwo8mb7vC1zrcVhBMKPQ@mail.gmail.com>
From: Raymond Mao <raymondmaoca@gmail.com>
Date: Wed, 11 Feb 2026 10:02:23 -0500
X-Gm-Features: AZwV_QhiR5DZUua11x18GuSn1PtDav27wIq546bVNRaxpmnaGEjxvGjEjpLLvJo
Message-ID: <CAMDkj5yiHTa3uwZ8NHXTj-6LGOKPdyH36AoY1L0cVzXmvyb6PQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] lib: sbi_irqchip: Support irqchip device targetting
 subset of harts
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Atish Patra <atish.patra@linux.dev>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Dave Patel <dave.patel@riscstar.com>, 
	Samuel Holland <samuel.holland@sifive.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_070239_325473_9CCF42FE 
X-CRM114-Status: GOOD (  27.70  )
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

SGkgQW51cCwKCk9uIFR1ZSwgRmViIDEwLCAyMDI2IGF0IDExOjA54oCvQU0gQW51cCBQYXRlbCA8
YW51cEBicmFpbmZhdWx0Lm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIEZlYiAxMCwgMjAyNiBhdCAx
OjU14oCvQU0gUmF5bW9uZCBNYW8gPHJheW1vbmRtYW9jYUBnbWFpbC5jb20+IHdyb3RlOgo+ID4K
PiA+IEhpIEFudXAsCj4gPgo+ID4gT24gMjAyNi0wMi0wNyA1OjI1IGEubS4sIGFudXAucGF0ZWwg
YXQgb3NzLnF1YWxjb21tLmNvbSAoQW51cCBQYXRlbCkgd3JvdGU6Cj4gPiA+IEl0IGlzIHBvc3Np
YmxlIHRvIGhhdmUgcGxhdGZvcm0gd2hlcmUgYW4gaXJxY2hpcCBkZXZpY2UgdGFyZ2V0cwo+ID4g
PiBhIHN1YnNldCBvZiBoYXJ0cyBhbmQgdGhlcmUgYXJlIG11bHRpcGxlIGlycWNoaXAgZGV2aWNl
cyB0byBjb3Zlcgo+ID4gPiBhbGwgaGFydHMuCj4gPiA+Cj4gPiA+IFRvIHN1cHBvcnQgdGhpcyBz
Y2VuYXJpbzoKPiA+ID4gMSkgQWRkIHRhcmdldF9oYXJ0cyBoYXJ0bWFzayB0byBzdHJ1Y3Qgc2Jp
X2lycWNoaXBfZGV2aWNlIHdoaWNoCj4gPiA+ICAgICByZXByZXNlbnRzIHRoZSBzZXQgb2YgaGFy
dHMgdGFyZ2V0dGVkIGJ5IHRoZSBpcnFjaGlwIGRldmljZQo+ID4gPiAyKSBDYWxsIHdhcm1faW5p
dCgpIGFuZCBpcnFfaGFuZGxlKCkgY2FsbGJhY2tzIG9mIGFuIGlycWNoaXAgZGV2aWNlCj4gPiA+
ICAgICBvbiBhIGhhcnQgb25seSBpZiBpcnFjaGlwIGRldmljZSB0YXJnZXRzIHRoYXQgcGFydGlj
dWxhciBoYXJ0Cj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFudXAucGF0
ZWwgYXQgb3NzLnF1YWxjb21tLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICAgaW5jbHVkZS9zYmkvc2Jp
X2lycWNoaXAuaCB8ICA4ICsrKysrLS0KPiA+ID4gICBsaWIvc2JpL3NiaV9pcnFjaGlwLmMgICAg
IHwgNDggKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tCj4gPiA+ICAgbGli
L3V0aWxzL2lycWNoaXAvYXBsaWMuYyB8IDEyICsrKysrKysrKy0KPiA+ID4gICBsaWIvdXRpbHMv
aXJxY2hpcC9pbXNpYy5jIHwgIDcgKysrKy0tCj4gPiA+ICAgbGliL3V0aWxzL2lycWNoaXAvcGxp
Yy5jICB8ICA1ICsrLS0KPiA+ID4gICA1IGZpbGVzIGNoYW5nZWQsIDU5IGluc2VydGlvbnMoKyks
IDIxIGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2Jp
X2lycWNoaXAuaCBiL2luY2x1ZGUvc2JpL3NiaV9pcnFjaGlwLmgKPiA+ID4gaW5kZXggY2RhMWU1
MGYuLmMzZGVkMjcxIDEwMDY0NAo+ID4gPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfaXJxY2hpcC5o
Cj4gPiA+ICsrKyBiL2luY2x1ZGUvc2JpL3NiaV9pcnFjaGlwLmgKPiA+ID4gQEAgLTEwLDYgKzEw
LDcgQEAKPiA+ID4gICAjaWZuZGVmIF9fU0JJX0lSUUNISVBfSF9fCj4gPiA+ICAgI2RlZmluZSBf
X1NCSV9JUlFDSElQX0hfXwo+ID4gPgo+ID4gPiArI2luY2x1ZGUgPHNiaS9zYmlfaGFydG1hc2su
aD4KPiA+ID4gICAjaW5jbHVkZSA8c2JpL3NiaV9saXN0Lmg+Cj4gPiA+ICAgI2luY2x1ZGUgPHNi
aS9zYmlfdHlwZXMuaD4KPiA+ID4KPiA+ID4gQEAgLTIwLDExICsyMSwxNCBAQCBzdHJ1Y3Qgc2Jp
X2lycWNoaXBfZGV2aWNlIHsKPiA+ID4gICAgICAgLyoqIE5vZGUgaW4gdGhlIGxpc3Qgb2YgaXJx
Y2hpcCBkZXZpY2VzICovCj4gPiA+ICAgICAgIHN0cnVjdCBzYmlfZGxpc3Qgbm9kZTsKPiA+ID4K
PiA+ID4gKyAgICAgLyoqIFNldCBvZiBoYXJ0cyB0YXJnZXR0ZWQgYnkgdGhpcyBpcnFjaGlwICov
Cj4gPiA+ICsgICAgIHN0cnVjdCBzYmlfaGFydG1hc2sgdGFyZ2V0X2hhcnRzOwo+ID4gPiArCj4g
PiA+ICAgICAgIC8qKiBJbml0aWFsaXplIHBlci1oYXJ0IHN0YXRlIGZvciB0aGUgY3VycmVudCBo
YXJ0ICovCj4gPiA+ICAgICAgIGludCAoKndhcm1faW5pdCkoc3RydWN0IHNiaV9pcnFjaGlwX2Rl
dmljZSAqY2hpcCk7Cj4gPiA+Cj4gPiA+ICAgICAgIC8qKiBQcm9jZXNzIGhhcmR3YXJlIGludGVy
cnVwdHMgZnJvbSB0aGlzIGlycWNoaXAgKi8KPiA+ID4gLSAgICAgaW50ICgqcHJvY2Vzc19od2ly
cXMpKHZvaWQpOwo+ID4gPiArICAgICBpbnQgKCpwcm9jZXNzX2h3aXJxcykoc3RydWN0IHNiaV9p
cnFjaGlwX2RldmljZSAqY2hpcCk7Cj4gPiA+ICAgfTsKPiA+ID4KPiA+ID4gICAvKioKPiA+ID4g
QEAgLTM4LDcgKzQyLDcgQEAgc3RydWN0IHNiaV9pcnFjaGlwX2RldmljZSB7Cj4gPiA+ICAgaW50
IHNiaV9pcnFjaGlwX3Byb2Nlc3Modm9pZCk7Cj4gPiA+Cj4gPiA+ICAgLyoqIFJlZ2lzdGVyIGFu
IGlycWNoaXAgZGV2aWNlIHRvIHJlY2VpdmUgY2FsbGJhY2tzICovCj4gPiA+IC12b2lkIHNiaV9p
cnFjaGlwX2FkZF9kZXZpY2Uoc3RydWN0IHNiaV9pcnFjaGlwX2RldmljZSAqY2hpcCk7Cj4gPiA+
ICtpbnQgc2JpX2lycWNoaXBfYWRkX2RldmljZShzdHJ1Y3Qgc2JpX2lycWNoaXBfZGV2aWNlICpj
aGlwKTsKPiA+ID4KPiA+ID4gICAvKiogSW5pdGlhbGl6ZSBpbnRlcnJ1cHQgY29udHJvbGxlcnMg
Ki8KPiA+ID4gICBpbnQgc2JpX2lycWNoaXBfaW5pdChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0
Y2gsIGJvb2wgY29sZF9ib290KTsKPiA+ID4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2lycWNo
aXAuYyBiL2xpYi9zYmkvc2JpX2lycWNoaXAuYwo+ID4gPiBpbmRleCAzYjk3MDUyNy4uNzdlYzA1
YWYgMTAwNjQ0Cj4gPiA+IC0tLSBhL2xpYi9zYmkvc2JpX2lycWNoaXAuYwo+ID4gPiArKysgYi9s
aWIvc2JpL3NiaV9pcnFjaGlwLmMKPiA+ID4gQEAgLTEzLDI0ICsxMyw0NCBAQAo+ID4gPgo+ID4g
PiAgIHN0YXRpYyBTQklfTElTVF9IRUFEKGlycWNoaXBfbGlzdCk7Cj4gPiA+Cj4gPiA+IC1zdGF0
aWMgaW50IGRlZmF1bHRfaXJxZm4odm9pZCkKPiA+ID4gK2ludCBzYmlfaXJxY2hpcF9wcm9jZXNz
KHZvaWQpCj4gPiA+ICAgewo+ID4gPiAtICAgICByZXR1cm4gU0JJX0VOT0RFVjsKPiA+ID4gLX0K
PiA+ID4gKyAgICAgc3RydWN0IHNiaV9pcnFjaGlwX2RldmljZSAqY2hpcDsKPiA+ID4gKyAgICAg
aW50IHJjID0gU0JJX0VOT0RFVjsKPiA+ID4KPiA+ID4gLXN0YXRpYyBpbnQgKCpleHRfaXJxZm4p
KHZvaWQpID0gZGVmYXVsdF9pcnFmbjsKPiA+ID4gKyAgICAgc2JpX2xpc3RfZm9yX2VhY2hfZW50
cnkoY2hpcCwgJmlycWNoaXBfbGlzdCwgbm9kZSkgewo+ID4gPiArICAgICAgICAgICAgIGlmICgh
Y2hpcC0+cHJvY2Vzc19od2lycXMpCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBjb250aW51
ZTsKPiA+ID4gKyAgICAgICAgICAgICBpZiAoIXNiaV9oYXJ0bWFza190ZXN0X2hhcnRpbmRleChj
dXJyZW50X2hhcnRpbmRleCgpLCAmY2hpcC0+dGFyZ2V0X2hhcnRzKSkKPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4gPiArICAgICAgICAgICAgIHJjID0gY2hpcC0+cHJv
Y2Vzc19od2lycXMoY2hpcCk7Cj4gPiA+ICsgICAgICAgICAgICAgaWYgKHJjKQo+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiA+ICsgICAgIH0KPiA+ID4KPiA+ID4gLWludCBz
YmlfaXJxY2hpcF9wcm9jZXNzKHZvaWQpCj4gPiA+IC17Cj4gPiA+IC0gICAgIHJldHVybiBleHRf
aXJxZm4oKTsKPiA+ID4gKyAgICAgcmV0dXJuIHJjOwo+ID4gPiAgIH0KPiA+ID4KPiA+ID4gLXZv
aWQgc2JpX2lycWNoaXBfYWRkX2RldmljZShzdHJ1Y3Qgc2JpX2lycWNoaXBfZGV2aWNlICpjaGlw
KQo+ID4gPiAraW50IHNiaV9pcnFjaGlwX2FkZF9kZXZpY2Uoc3RydWN0IHNiaV9pcnFjaGlwX2Rl
dmljZSAqY2hpcCkKPiA+ID4gICB7Cj4gPiA+IC0gICAgIHNiaV9saXN0X2FkZF90YWlsKCZjaGlw
LT5ub2RlLCAmaXJxY2hpcF9saXN0KTsKPiA+ID4gKyAgICAgc3RydWN0IHNiaV9pcnFjaGlwX2Rl
dmljZSAqYzsKPiA+ID4gKyAgICAgc3RydWN0IHNiaV9oYXJ0bWFzayBobTsKPiA+ID4gKwo+ID4g
PiArICAgICBpZiAoIWNoaXAgfHwgIXNiaV9oYXJ0bWFza193ZWlnaHQoJmNoaXAtPnRhcmdldF9o
YXJ0cykpCj4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuIFNCSV9FSU5WQUw7Cj4gPiA+ICsKPiA+
ID4gKyAgICAgaWYgKGNoaXAtPnByb2Nlc3NfaHdpcnFzKSB7Cj4gPiA+ICsgICAgICAgICAgICAg
c2JpX2xpc3RfZm9yX2VhY2hfZW50cnkoYywgJmlycWNoaXBfbGlzdCwgbm9kZSkgewo+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgaWYgKCFjLT5wcm9jZXNzX2h3aXJxcykKPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICBzYmlfaGFydG1hc2tfYW5kKCZobSwgJmMtPnRhcmdldF9oYXJ0cywgJmNoaXAtPnRhcmdl
dF9oYXJ0cyk7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBpZiAoc2JpX2hhcnRtYXNrX3dl
aWdodCgmaG0pKQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gU0JJ
X0VJTlZBTDsKPiA+Cj4gPiBJIHRlc3RlZCB0aGlzIGJ5IHJlZ2lzdGVyaW5nIGEgJ3Byb2Nlc3Nf
aHdpcnFzJyBob29rLCBidXQKPiA+ICdzYmlfaGFydG1hc2tfd2VpZ2h0JyByZXR1cm5zIGVycm9y
cy4KPgo+IFRoaXMgbG9vcCBlbnN1cmVzIHRoYXQgaXJxY2hpcHMgd2hpY2ggZGlyZWN0bHkgY29u
bmVjdAo+IHRvIGV4dGVybmFsIGludGVycnVwdCBsaW5lIG9mIGhhcnRzIChha2EgaXJxY2hpcHMg
d2hpY2gKPiBpbXBsZW1lbnQgcHJvY2Vzc19od2lycXMpIGRvbid0IGhhdmUgb3ZlcmxhcHBpbmcK
PiB0YXJnZXRfaGFydHMuCj4KCklmIG15IHVuZGVyc3RhbmRpbmcgaXMgY29ycmVjdCwgdGhpcyBt
ZWFucyBvbmx5IHNpbmdsZSBwcm9jZXNzX2h3aXJxcwpjYW4gYmUgcmVnaXN0ZXJlZCBmb3IgYSB0
YXJnZXQgaGFydCAtIGlmIElNU0lDIHJlZ2lzdGVyZWQgaXQgdGhlbiBpdApyZWplY3RzIHdoZW4g
QVBMSUMgdHJpZXMgdG8gcmVnaXN0ZXIgaXRzIG93biBwcm9jZXNzX2h3aXJxcy4KQnV0IGFjY29y
ZGluZyB0byBvdXIgdXNlIGNhc2UsIGVhY2ggaXJxY2hpcCBzaG91bGQgYmUgYWxsb3dlZCB0bwpy
ZWdpc3RlciBpdHMgb3duIG9wZXJhdGlvbiBob29rcywgaW5jbHVkaW5nIHByb2Nlc3NfaHdpcnFz
LgpUaGVuIHRoZSBJTVNJQydzIHByb2Nlc3NfaHdpcnFzIGhhbmRsZXMgTVNJLCB3aGlsZSB0aGUg
QVBMSUMncwpwcm9jZXNzX2h3aXJxcyBoYW5kbGVzIHdpcmVkIGV4dCBpbnRlcnJ1cHQsIHRoZXkg
ZG9uJ3Qgb3ZlcmxhcCBlYWNoCm90aGVyLgpJIHdvdWxkIHN1Z2dlc3QgYWxsb3dpbmcgbXVsdGlw
bGUgcHJvY2Vzc19od2lycXMgaG9va3MgZm9yIG9uZSB0YXJnZXQgaGFydC4KClJlZ2FyZHMsClJh
eW1vbmQKCgo+IFJlZ2FyZHMsCj4gQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5z
YmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL29wZW5zYmkK
