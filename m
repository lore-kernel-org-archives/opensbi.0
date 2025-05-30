Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDCCC3ABB2
	for <opensbi@archiver.kernel.org>; Fri, 30 May 2025 07:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4HTPIytM5sa4AsvEIKPXLJPC7dGFDaWsYA3s5J+l0EE=; b=hgqQ4Z9F0nKX79
	TqOO0SGVHQU3r4CpC/fOtBOyUr5hIMhznZ50jHOmGs4qRc1gDII04M0gWo0KLR0RaONepZUcH5PZ0
	2isBZSsZ/pYv61DHLE2q1acRxe4b2CPK2b47Rnipl2WLRCqXsWBuGfDnfgCbIAAK6QKCUuZDka9il
	0ryd4eZ4Ziw1xF3bFHwVqy9Z62KfrBmQQ7WiDfLlMRKCgNx+KDQ5pyAgrZ5aHBJ39D7MfSbYDFi0t
	U5HStB84ToxI4aaVq8vD6CYAyk4cg2X5aSu+qnP0NZbHtzAEM7ZpRGBQN7HC5FoHHNXrmCv+F2B2M
	t0fWbTAvHYlved3EviHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKto6-0000000HP7a-1zF0;
	Fri, 30 May 2025 07:05:34 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKto3-0000000HP7A-39tD
	for opensbi@lists.infradead.org;
	Fri, 30 May 2025 07:05:32 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-e733cd55f9eso1504993276.1
        for <opensbi@lists.infradead.org>; Fri, 30 May 2025 00:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1748588730; x=1749193530; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8bXqFb8mJ8V2BZKiUt+yyWKymww52LnR4B7oTGaDhQ=;
        b=iQbuGj4D+3qp4a0VRfF0lu94W2B71LcKSF41Ntgq571VEuUQAKi3hN5hilMHqPNTCu
         L6mVaVlQExeho4/+thx8h+/y0+ZhhnpeWAjiU3AuacjqDp9M0cjSuZv8CYP8xn4XEa9G
         6+u3eTotz9lPyvkrx6ifJX0tOzzrunonUOm0SwCNA1tq68DOJPE9AJ4vSL7T+TTBvGhv
         3ER/E/XHUiSev+YncKvQufMZyq7aEH9xStJQBeW2uyeszFqswefdOoHfI8Dsm4fzWmoD
         HeIqvlf1xkiTzFWnGTKa5FAwc1dcZz4OQwCbgY1ZEhBe1aKeQ5q7Oq+/GgRDtpZcqA6C
         YF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748588730; x=1749193530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8bXqFb8mJ8V2BZKiUt+yyWKymww52LnR4B7oTGaDhQ=;
        b=naea9wg0DmMESURl86CeGygg0oLn/rXUEWp/0PQ+Be4H+Iz+CHnkqHHcOmSM84pckg
         xICnFxsz0Kw18suHAVM9knPyLWakyuynRvzonJsROHNOUZfHZRhJMkMwNO3Tq5S3vCHM
         E3jJvsQT8Wdl7h8tDNZtMosztNnm5m9mohjAfNecflWzBubMfeiZRVntTULkHc6mREMb
         EZK/1GyJkXxXMCkReVjmgVMLRr2Uy2zSU9gj/GAWqORHmzp25+pqj3SxLLIdYead0T31
         IHBJnO+vj51InuwvTixUNnK0AFkX34VqjWOz2Lx5nVNNLjuYznUQVXGjg5QX/lVNGFOQ
         Easg==
X-Forwarded-Encrypted: i=1; AJvYcCXAc550BQGoqClVIzSc8CvAUhuJQZxCgkXcDA0mj65I7KCrR398/LBahd0qN/VFomFqkOf2EPvh@lists.infradead.org
X-Gm-Message-State: AOJu0YzvGeYXhZfW+DBVlLrH0ohrUnKHuLHc5t+MDsxIPn0RMw32T6RC
	OMH6Di/qFei2l5VtIl1MTGETa2em+cBF15ZDZa+I5E8uH/Jssu1n5+nES+JArdp122zKT8/mn+u
	y8tpgciaLc3r9e0P/stIm3r0X6wYhI1os9+FpEJ1tZg==
X-Gm-Gg: ASbGncshWoifRw7PqOBUutat3CJJyXn25VAouEjxrlDpHWBIKlUm9v97KCdZpIXWRlD
	B8V7vfX1l99y6+eB643TD+YaJzSDrmB7jQaCCKOt9OrS/enQ4Wo3EnzM55wU4Le0ZNTxCcRwcMx
	qXNWzoNElVP0qA08LfEoQ2dc/JlstlH6KTOU7X82CRHf2Cew==
X-Google-Smtp-Source: AGHT+IGQ8yoD4xBRrkS6FLj+O6GOd+cOLMEQVTLMFCuUtUiI1v5OMg0DjVbjdvadadmoB3PmfDOMX2iwoG3AJkQ1srs=
X-Received: by 2002:a05:6902:4a82:b0:e7d:d02e:6ecb with SMTP id
 3f1490d57ef6-e7f81dfb295mr3150556276.18.1748588730087; Fri, 30 May 2025
 00:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250527124821.2113467-1-apatel@ventanamicro.com>
 <CAKddAkBK1UhLerRx0X+jD0RK2g4BXMSfyuHXczwRD=MBSFiAuA@mail.gmail.com>
 <CAK9=C2VXWoSX366O=rhp2TYEOwoqcS0hkLPBZLodAupnR35BSw@mail.gmail.com> <CAKddAkBEKJLmDQzgAO+dgZemB7m5Mreu-7pZay6dL1b9uZYmNQ@mail.gmail.com>
In-Reply-To: <CAKddAkBEKJLmDQzgAO+dgZemB7m5Mreu-7pZay6dL1b9uZYmNQ@mail.gmail.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Fri, 30 May 2025 15:05:18 +0800
X-Gm-Features: AX0GCFtJBJ19AgCiA9ROWjULYodnxnNDn_cC868lp5LdCGxoaSMOkqSWbt99c7A
Message-ID: <CAKddAkAZMX6sppjCet4EqLC9gMgW0TcwTJvcF+0Rfzo0JWLAZw@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: Revert entry_count before doing hsm stop in hsm
 wait loop
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_000531_817965_CA49EE97 
X-CRM114-Status: GOOD (  44.43  )
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

T24gV2VkLCBNYXkgMjgsIDIwMjUgYXQgMTA6MzTigK9QTSBOaWNrIEh1IDxuaWNrLmh1QHNpZml2
ZS5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBNYXkgMjgsIDIwMjUgYXQgODoxNOKAr1BNIEFudXAg
UGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIE1h
eSAyOCwgMjAyNSBhdCAzOjU24oCvUE0gTmljayBIdSA8bmljay5odUBzaWZpdmUuY29tPiB3cm90
ZToKPiA+ID4KPiA+ID4gT24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgODo0OOKAr1BNIEFudXAgUGF0
ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IFVzaW5n
IGhzbSBzdG9wIGluIGhzbSB3YWl0IGxvb3AgY2F1c2VzIHNlY29uZGFyeSBoYXJ0cyB0byBiZSBz
dHVjawo+ID4gPiA+IGZvcmV2ZXIgaW4gT3BlblNCSSBvbiBSSVNDLVYgcGxhdGZvcm1zIHdoZXJl
IEhTTSBoYXJ0IGhvdHBsdWcgaXMKPiA+ID4gPiBhdmFpbGFibGUgYW5kIGFsbCBoYXJ0cyBjb21l
LXVwIGF0IHRoZSBzYW1lIHRpbWUgZHVyaW5nIHN5c3RlbQo+ID4gPiA+IHBvd2VyLW9uLgo+ID4g
PiA+Cj4gPiA+ID4gRm9yIGV4YW1wbGUsIGxldHMgc2F5IHdlIGhhdmUgdHdvIGhhcnRzIEEgYW5k
IEIgb24gYSBSSVNDLVYgcGxhdGZvcm0KPiA+ID4gPiB3aXRoIEhTTSBoYXJ0IGhvdHBsdWcgd2hp
Y2ggY29tZS11cCBhdCB0aGUgc2FtZSB0aW1lIGR1cmluZyBzeXN0ZW0KPiA+ID4gPiBwb3dlci1v
bi4gVGhlIGhhcnQgQSBlbnRlcnMgT3BlblNCSSBiZWZvcmUgaGFydCBCIGhlbmNlIGl0IGJlY29t
ZXMKPiA+ID4gPiB0aGUgcHJpbWFyeSAob3IgY29sZC1ib290KSBoYXJ0IHdoZXJlYXMgaGFydCBC
IGJlY29tZXMgdGhlIHNlY29uZGFyeQo+ID4gPiA+IChvciB3YXJtLWJvb3QpIGhhcnQuIFRoZSBo
YXJ0IEEgZm9sbG93cyB0aGUgT3BlblNCSSBjb2xkLWJvb3QgcGF0aAo+ID4gPiA+IGFuZCByZWdp
c3RlcnMgaHNtIGRldmljZSBiZWZvcmUgaGFydCBCIGVudGVycyBPcGVuU0JJLiBUaGUgaGFydCBC
Cj4gPiA+ID4gZXZlbnR1YWxseSBlbnRlcnMgT3BlblNCSSBhbmQgZm9sbG93cyB0aGUgT3BlblNC
SSB3YXJtLWJvb3QgcGF0aAo+ID4gPiA+IHNvIGl0IHdpbGwgaW5jcmVtZW50IGl0J3Mgb3duIGVu
dHJ5X2NvdW50IGJlZm9yZSBlbnRlcmluZyBoc20gd2FpdAo+ID4gPiA+IGxvb3Agd2hlcmUgaXQg
c2VlcyBoc20gZGV2aWNlIGFuZCBzdG9wcyBpdHNlbGYuIExhdGVyIGFzIHBhcnQgb2YKPiA+ID4g
PiB0aGUgTGludXggYm9vdC11cCBzZXF1ZW5jZSwgaGFydCBBIGlzc3VlcyBTQkkgSFNNIHN0YXJ0
IGNhbGwgdG8KPiA+ID4gPiBicmluZy11cCBoYXJ0IEIgYnV0IE9wZW5TQkkgc2VlcyBlbnRyeV9j
b3VudCAhPSBpbml0X2NvdW50IGZvcgo+ID4gPiA+IGhhcnQgQiBpbiBzYmlfaHNtX2hhcnRfc3Rh
cnQoKSBoZW5jZSBoc21fZGV2aWNlX2hhcnRfc3RhcnQoKSBpcwo+ID4gPiA+IG5vdCBjYWxsZWQg
Zm9yIGhhcnQgQiByZXN1bHRpbmcgaW4gaGFydCBCIHN0dWNrIGZvcmV2ZXIgaW4gT3BlblNCSS4K
PiA+ID4gPgo+ID4gPiA+IFRvIGZpeCB0aGUgYWJvdmUgaXNzdWUsIHJldmVydCBlbnRyeV9jb3Vu
dCBiZWZvcmUgZG9pbmcgaHNtIHN0b3AKPiA+ID4gPiBpbiBoc20gd2FpdCBsb29wLgo+ID4gPiA+
Cj4gPiA+ID4gRml4ZXM6IGQ4NDRkZWFkZWM5NCAoImxpYjogc2JpOiBVc2UgaHNtIHN0b3AgZm9y
IGhzbSB3YWl0IikKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVu
dGFuYW1pY3JvLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgaW5jbHVkZS9zYmkvc2JpX2luaXQu
aCB8ICAyICsrCj4gPiA+ID4gIGxpYi9zYmkvc2JpX2hzbS5jICAgICAgfCAgNCArKystCj4gPiA+
ID4gIGxpYi9zYmkvc2JpX2luaXQuYyAgICAgfCAxMyArKysrKysrKysrKysrCj4gPiA+ID4gIDMg
ZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gPiA+Cj4g
PiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9pbml0LmggYi9pbmNsdWRlL3NiaS9z
YmlfaW5pdC5oCj4gPiA+ID4gaW5kZXggYzkwMTNlYTQuLmFkMDY4Njc0IDEwMDY0NAo+ID4gPiA+
IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV9pbml0LmgKPiA+ID4gPiArKysgYi9pbmNsdWRlL3NiaS9z
YmlfaW5pdC5oCj4gPiA+ID4gQEAgLTE2LDYgKzE2LDggQEAgc3RydWN0IHNiaV9zY3JhdGNoOwo+
ID4gPiA+Cj4gPiA+ID4gIHZvaWQgX19ub3JldHVybiBzYmlfaW5pdChzdHJ1Y3Qgc2JpX3NjcmF0
Y2ggKnNjcmF0Y2gpOwo+ID4gPiA+Cj4gPiA+ID4gK3ZvaWQgc2JpX3JldmVydF9lbnRyeV9jb3Vu
dChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gpOwo+ID4gPiA+ICsKPiA+ID4gPiAgdW5zaWdu
ZWQgbG9uZyBzYmlfZW50cnlfY291bnQodTMyIGhhcnRpbmRleCk7Cj4gPiA+ID4KPiA+ID4gPiAg
dW5zaWduZWQgbG9uZyBzYmlfaW5pdF9jb3VudCh1MzIgaGFydGluZGV4KTsKPiA+ID4gPiBkaWZm
IC0tZ2l0IGEvbGliL3NiaS9zYmlfaHNtLmMgYi9saWIvc2JpL3NiaV9oc20uYwo+ID4gPiA+IGlu
ZGV4IGU4MTI4YTM5Li41NTdhYjEzMSAxMDA2NDQKPiA+ID4gPiAtLS0gYS9saWIvc2JpL3NiaV9o
c20uYwo+ID4gPiA+ICsrKyBiL2xpYi9zYmkvc2JpX2hzbS5jCj4gPiA+ID4gQEAgLTE3Niw4ICsx
NzYsMTAgQEAgc3RhdGljIHZvaWQgc2JpX2hzbV9oYXJ0X3dhaXQoc3RydWN0IHNiaV9zY3JhdGNo
ICpzY3JhdGNoKQo+ID4gPiA+ICAgICAgICAgICAgICAgICAgKiBJZiB0aGUgaHNtX2RldiBpcyBy
ZWFkeSBhbmQgaXQgc3VwcG9ydCB0aGUgaG90cGx1Zywgd2UgY2FuCj4gPiA+ID4gICAgICAgICAg
ICAgICAgICAqIHVzZSB0aGUgaHNtIHN0b3AgZm9yIG1vcmUgcG93ZXIgc2F2aW5nCj4gPiA+ID4g
ICAgICAgICAgICAgICAgICAqLwo+ID4gPiA+IC0gICAgICAgICAgICAgICBpZiAoaHNtX2Rldmlj
ZV9oYXNfaGFydF9ob3RwbHVnKCkpCj4gPiA+ID4gKyAgICAgICAgICAgICAgIGlmIChoc21fZGV2
aWNlX2hhc19oYXJ0X2hvdHBsdWcoKSkgewo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IHNiaV9yZXZlcnRfZW50cnlfY291bnQoc2NyYXRjaCk7Cj4gPiA+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgaHNtX2RldmljZV9oYXJ0X3N0b3AoKTsKPiA+ID4KPiA+ID4gSGkgQW51cCwKPiA+
ID4gVGhhbmtzIGZvciBhZGRyZXNzaW5nIHRoZSBidWcgPSkKPiA+ID4KPiA+ID4gSG93ZXZlciwg
dGhlcmUgbWF5IHN0aWxsIGJlIGFuIGlzc3VlIGluIHRoZSBmb2xsb3dpbmcgc2NlbmFyaW86Cj4g
PiA+IElmIHRoZSBIU00gc3RhdGUgb2YgY29yZSBCIGlzIFNCSV9IU01fU1RBVEVfU1RBUlRfUEVO
RElORyBhdCB0aGlzCj4gPiA+IHBvaW50LCBpdCB3b24ndCBlbnRlciB0aGUgd2FybSBib290IHBh
dGguIEFzIGEgcmVzdWx0LCB0aGUKPiA+ID4gYGluaXRfY291bnRgIHdpbGwgZW5kIHVwIGJlaW5n
IGBlbnRyeV9jb3VudGAgKyAxIGFmdGVyIHRoZSB3YXJtIGluaXQKPiA+ID4gcGF0aC4KPiA+ID4K
PiA+ID4gV291bGQgaXQgbWFrZSBzZW5zZSB0byBpbmNyZW1lbnQgYGVudHJ5X2NvdW50YCBhZnRl
ciB0aGUKPiA+ID4gYHNiaV9oc21faW5pdCgpYCBjYWxsIGluc3RlYWQ/Cj4gPgo+ID4gVGhpcyBp
cyBub3QgYSBidWcgcmF0aGVyIGV4cGVjdGVkIGJlaGF2aW91ci4KPiA+Cj4gPiBXaGVuIHRoZSBo
YXJ0IEIgaXMgaW4gU0JJX0hTTV9TVEFURV9TVEFSVF9QRU5ESU5HIHN0YXRlCj4gPiB0aGVuIGl0
IG1lYW5zIHNvbWUgb3RoZXIgaGFydCBBIGhhcyBpc3N1ZWQgSFNNIGhhcnQgc3RhcnQgYW5kCj4g
PiBoYXMgYWxzbyBwcm92aWRlZCBlbnRyeSBkZXRhaWxzLiBUaGUgaGFydCBCIGluY3JlbWVudHMg
ZW50cnlfY291bnQKPiA+IHVwb24gZW50cnkgaW50byBPcGVuU0JJIGFuZCBpbmNyZW1lbnRzIGlu
aXRfY291bnQgYWZ0ZXIgaW5pdGlhbGl6YXRpb24KPiA+IGlzIGRvbmUuCj4gPgo+IEknbSBub3Qg
c3VyZSBpZiBJIHVuZGVyc3RhbmQgaXQgY29ycmVjdGx5Lgo+IEluIHRoZSBhYm92ZSBjYXNlLCB0
aGUgYGluaXRfY291bnRgICE9IGBlbnRyeV9jb3VudGAgZm9yIGhhcnQgQiBhZnRlcgo+IHRoZSBp
bml0aWFsaXphdGlvbiBpcyBkb25lLgo+IElmIHRoZSBoYXJ0IEIgZW50ZXJzIHRoZSBgaHNtX2Rl
di0+aGFydF9zdG9wKClgIHZpYSB0aGUKPiBTQklfRVhUX0hTTV9IQVJUX1NUT1AgcGF0aCwgRG9l
c24ndCB0aGF0IG1lYW4gdGhlIGhhcnQgQSB3b27igJl0IGJlIGFibGUKPiB0byBjYWxsIGBoc21f
ZGV2LT5oYXJ0X3N0YXJ0KClgIGZvciB0aGUgaGFydCBCPwo+IFRoZSBgaHNtX2Rldi0+aGFydF9z
dG9wKClgIGZ1bmN0aW9uIG1heSB0cmFuc2l0aW9uIHRoZSBoYXJ0IGludG8gYQo+IHBsYXRmb3Jt
LXNwZWNpZmljIGxvdy1wb3dlciBzdGF0ZSB0aGF0IHJlcXVpcmVzCj4gYGhzbV9kZXYtPmhhcnRf
c3RhcnQoKWAgdG8gd2FrZSBpdCB1cC4KPgpPaCwgSSBzZWUuIEkgaGFkIG1pc3Rha2VuIGBoc21f
ZGV2aWNlX2hhcnRfc3RvcCgpYCBmb3IgYHNiaV9oc21faGFydF9zdG9wKClgLgpTaW5jZSBoc21f
ZGV2aWNlX2hhcnRfc3RvcCgpIGRvZXNuJ3QgY2hlY2sgdGhlIEhTTSBzdGF0ZSwgaGFydCBCIHdp
bGwKcHJvY2VlZCB0byBoc21fZGV2LT5oYXJ0X3N0b3AoKSBhbmQsIHVwb24gd2FraW5nIHVwLCB3
aWxsIGVudGVyIHRoZQp3YXJtIGJvb3QgcGF0aC4KQXMgYSByZXN1bHQsIGBpbml0X2NvdW50YCB3
aWxsIG1hdGNoIGBlbnRyeV9jb3VudGAgYWZ0ZXIgaGFydCBCCmNvbXBsZXRlcyBpbml0aWFsaXph
dGlvbi4KCkFwb2xvZ2llcyBmb3IgdGhlIGNvbmZ1c2lvbi4gVGhlIGZpeCBsb29rcyBnb29kIHRv
IG1lLgoKUmV2aWV3ZWQtYnk6IE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNvbT4KCj4gQmVzdCBS
ZWdhcmRzLAo+IE5pY2sKPgo+ID4gUmVnYXJkcywKPiA+IEFudXAKPiA+Cj4gPiA+Cj4gPiA+ID4g
KyAgICAgICAgICAgICAgIH0KPiA+ID4gPgo+ID4gPiA+ICAgICAgICAgICAgICAgICB3ZmkoKTsK
PiA+ID4gPiAgICAgICAgIH0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaW5pdC5j
IGIvbGliL3NiaS9zYmlfaW5pdC5jCj4gPiA+ID4gaW5kZXggNjJjMzI2ODIuLjg0YTYzNzQ4IDEw
MDY0NAo+ID4gPiA+IC0tLSBhL2xpYi9zYmkvc2JpX2luaXQuYwo+ID4gPiA+ICsrKyBiL2xpYi9z
Ymkvc2JpX2luaXQuYwo+ID4gPiA+IEBAIC01NzksNiArNTc5LDE5IEBAIHZvaWQgX19ub3JldHVy
biBzYmlfaW5pdChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gpCj4gPiA+ID4gICAgICAgICAg
ICAgICAgIGluaXRfd2FybWJvb3Qoc2NyYXRjaCwgaGFydGlkKTsKPiA+ID4gPiAgfQo+ID4gPiA+
Cj4gPiA+ID4gK3ZvaWQgc2JpX3JldmVydF9lbnRyeV9jb3VudChzdHJ1Y3Qgc2JpX3NjcmF0Y2gg
KnNjcmF0Y2gpCj4gPiA+ID4gK3sKPiA+ID4gPiArICAgICAgIHVuc2lnbmVkIGxvbmcgKmVudHJ5
X2NvdW50LCAqaW5pdF9jb3VudDsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICBpZiAoIWVudHJ5
X2NvdW50X29mZnNldCB8fCAhaW5pdF9jb3VudF9vZmZzZXQpCj4gPiA+ID4gKyAgICAgICAgICAg
ICAgIHNiaV9oYXJ0X2hhbmcoKTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICBlbnRyeV9jb3Vu
dCA9IHNiaV9zY3JhdGNoX29mZnNldF9wdHIoc2NyYXRjaCwgZW50cnlfY291bnRfb2Zmc2V0KTsK
PiA+ID4gPiArICAgICAgIGluaXRfY291bnQgPSBzYmlfc2NyYXRjaF9vZmZzZXRfcHRyKHNjcmF0
Y2gsIGluaXRfY291bnRfb2Zmc2V0KTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICAqZW50cnlf
Y291bnQgPSAqaW5pdF9jb3VudDsKPiA+ID4gPiArfQo+ID4gPiA+ICsKPiA+ID4gPiAgdW5zaWdu
ZWQgbG9uZyBzYmlfZW50cnlfY291bnQodTMyIGhhcnRpbmRleCkKPiA+ID4gPiAgewo+ID4gPiA+
ICAgICAgICAgc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoOwo+ID4gPiA+IC0tCj4gPiA+ID4g
Mi40My4wCj4gPiA+ID4KPiA+ID4KPiA+ID4gQmVzdCBSZWdhcmRzLAo+ID4gPiBOaWNrCgotLSAK
b3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
