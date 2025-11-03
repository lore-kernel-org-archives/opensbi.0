Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED6BCCFA03
	for <opensbi@archiver.kernel.org>; Mon,  3 Nov 2025 08:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uAI/flb9y/67nPSfGYI+lCDGc+AxHD/uVTHtoyqxSfc=; b=vjq3ckn7DvX7Eh
	Nlp/BzvMeVxJkuKT40v/mWFuYWXhLtN7/svhMjHBCkL1OWZBmABozgtHRXzhHB4lFk5fZ2V3xORAL
	w+b0g01vDNzIpICy4B1rCrYqBlxCB2GmHV6s3isMG3HWlK5ATrCdA246UmpNDNCPLjFNrdsN74ncC
	anVDilpHq5XzoX4zmutsykRk5KqZ+FaJmoYFwU1sBQtQ/QWd5eC7dDx9yk3YDFqxAB4ZNOnaHwtU4
	e1Mgi9Y/skgcC/ksFdqnmS4JdTOoYg9tnKJ6CDzoHi4f7krVKTmB+yftngheb0UJmfMPFf8CMYiSb
	7pf8aexubQDtrnAcvKcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFpjW-00000009Q2O-0RlH;
	Mon, 03 Nov 2025 08:16:10 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFpjT-00000009Q1x-2Z38
	for opensbi@lists.infradead.org;
	Mon, 03 Nov 2025 08:16:08 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-59052926cf9so4608984e87.1
        for <opensbi@lists.infradead.org>; Mon, 03 Nov 2025 00:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1762157765; x=1762762565; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9skcfSa0LgIeBe/nGetnvhBkzUI06WZbITWWydaS1EY=;
        b=ewr8cbTVaB5mDGlHXjrfxfOLxvrOGRh8pY6bLntNXSZqPDJXAlLfxrzi76txGiGN3y
         f8CjiG91ZeiC22oaCZWWfTvd1CA/EWT3ueoyu4d2lGKBABxOj+ffdB1TYGAhgu57O9js
         U9RBcwLeXlgmve5ngjRB6Zb4YwN+ofCozl0eCC5D5QjgYMVFb3PTSPiTTk6uSzlqNTmJ
         r2S5LcejJBy4rEycDLp+fpYPXzJtONFoJd48HxI33AVSJ9/qeQjPBCrEN4ihNtR4AjpV
         qiM4NfYC1Ee+n8pYt73LWMFncwHbql4UGrTQbsvZ9gBsyHtycwyQoI9OMa5J1sxi3ihJ
         TeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762157765; x=1762762565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9skcfSa0LgIeBe/nGetnvhBkzUI06WZbITWWydaS1EY=;
        b=iYataUkoit5E/551uv5jDE0yvgr/ZJF26UPOLTok75zWE4nJiinzdv+VunIVg7/ybt
         4Eh8h94KhW1t/X0k3HDscYcf1UhSMZ+Y2tEWrgFqkJjIco9TSI7EYlSoGxKQX/J0L29W
         u9k7GGZT/VHmK/m8PfhLUje3fiPoX1MpTnrPHM83vjVfcP5X9l1Hp0Kg4PzjeoFxXTKZ
         9QNle0+TaU9lW3c9YiQH6S8m0HGY9gxqLNuEjIGOaWftdtzrJ6Oc7VfftXQQbecsTUbL
         18ZFsWLD8ClZ3ZViXriFuxXpAqttSDVTCRwmPmqr9H3vbgbBY1XtL6UjDNfc0KSgZ2oP
         dcrA==
X-Gm-Message-State: AOJu0YyDwhOcm4Z8dKgp+IsHDoSx13WYTMYg/Kjf4Pupq9KSGkvsJXi4
	C1T49W6EImRPlb98p5gfeDNMH4wkkCD6TuWPNT0DKN1JmtgeqbPMfjaThR1dp2fcHNg0V2+ArKe
	HZxmQ28sBxe1fhQHCDF3wdME1mOp+OiRZNIa5bAwOpXUglMQg0qe7rdfJSxsu
X-Gm-Gg: ASbGnctEf7sEidAoEVUSVsfTa9a8bPN5NeUPk7K+vvDA5C2B8QcqGUiTGzr386z0V2T
	nuzpaDkuCnDHmetsGooXvsVCACrEQVU0pI8mAhgAE9EkLviZlZik48uddnJI8NGqIlo7PPK1D4o
	BeUBAVpXvdoJvvQkK9M6N1lIJA3UZ6ok30bs9QQiv75gFvqs12i7OTc1xWObKbpx/8HFUC09nrR
	KS4jnW5Prp3WeusvH1BZm51/iFW0l77S2H/2Z1UJkaaKT7k+ow/c5vlB9JVJDe+1nHIl3k7OXCz
	JE2FO4kFHHMuZ+rkvPE=
X-Google-Smtp-Source: AGHT+IFLhUiw8rJVn4ZCGYnwuTfPQljIKcnXjMXVtxX0cy/Ufa0A1wtWv6IvGeqS3fesQmy1Athyi6pk5Jg5yDmwn54=
X-Received: by 2002:a05:6512:ac6:b0:594:2d32:6f1e with SMTP id
 2adb3069b0e04-5942d32729emr708572e87.10.1762157765292; Mon, 03 Nov 2025
 00:16:05 -0800 (PST)
MIME-Version: 1.0
References: <20251014055330.59506-1-weidong.wd@bytedance.com>
 <CAHLiX_G1m-9R--j3T0V5zdTmEkCUjaxRCn-cEk-2_ZSeLHA0ZQ@mail.gmail.com>
 <CAHLiX_GptyEw9BX8cCC9q-S6jy12gYFWYz8WdN1=w8yf-0BLZQ@mail.gmail.com> <a4030e75-a8d8-447d-a743-e66e5ad9242f@linux.dev>
In-Reply-To: <a4030e75-a8d8-447d-a743-e66e5ad9242f@linux.dev>
From: dong wei <weidong.wd@bytedance.com>
Date: Mon, 3 Nov 2025 16:15:54 +0800
X-Gm-Features: AWmQ_bmTRQVKwdADL3aaOH8SyVLKMX6J6xPt6g9U0jxES90weckyBYYUckpwEwE
Message-ID: <CAHLiX_E1i3QiZz0cFxVsU6n0qKuF=yfNay5H8mkSMPoT1Cva7g@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] lib: sbi: sse: add local unknown nmi event
To: Atish Patra <atish.patra@linux.dev>
Cc: opensbi@lists.infradead.org, cuiyunhui@bytedance.com, 
	heshuan@bytedance.com, wangziang.ok@bytedance.com, anup@brainfault.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_001607_671795_ADADAC97 
X-CRM114-Status: GOOD (  22.46  )
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

VGhlIHJlbGV2YW50IGtlcm5lbCBwYXRjaCBpcwpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
MjAyNTEwMjcxMzM0MzEuMTUzMjEtMS1jdWl5dW5odWlAYnl0ZWRhbmNlLmNvbS8KLCBib3RoIHVz
ZSBTQklfU1NFX0VWRU5UX0xPQ0FMX1VOS05PV05fTk1JKDB4ZmZmZjAwMDEpLiBBbmQgd2UgaGF2
ZQpjb21wbGV0ZWQgdGhlIFBPQyB2ZXJpZmljYXRpb24gb2YgdW5rbm93biBubWkuCgoKT24gVGh1
LCBPY3QgMzAsIDIwMjUgYXQgNDo1MeKAr1BNIEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUBsaW51
eC5kZXY+IHdyb3RlOgo+Cj4gT24gMTAvMzAvMjUgMToyMCBBTSwgZG9uZyB3ZWkgd3JvdGU6Cj4g
PiBNYXkgSSBhc2sgaWYgdGhlcmUgYXJlIGFueSB1cGRhdGVzIHRvIHRoZSBjb21tZW50cyBvbiB0
aGlzIHBhdGNoPyBUaGUKPiA+IHVua25vd24gbm1pIGV2ZW50IGhhcyBwcmFjdGljYWwgYXBwbGlj
YXRpb24gc2NlbmFyaW9zIGZvciBSSVNDLVYKPiA+IHNlcnZlcnMuCj4gPgo+Cj4gVGhlIGNvcnJl
c3BvbmRpbmcgTGludXgga2VybmVsIHBhdGNoZXMgZG9lc24ndCBtYXRjaCB0aGlzLiBXZSBuZWVk
IHRvCj4gaGFzaCBvdXQgdGhlIGV2ZW50IElEcyBhbmQgdGhlbiBkZWNpZGUgdGhlIHByb2Nlc3Mg
dG8gbWVyZ2UgdGhpcyB0byBTQkkKPiBzcGVjLgo+Cj4gSXQgc2hvdWxkIGJlIG9rYXkgdG8gbWVy
Z2UgdGhpcyBpbiBPcGVuU0JJIGFzIGFuIGV4cGVyaW1lbnRhbCBmZWF0dXJlCj4gYWZ0ZXIgdGhh
dC4KPgo+Cj4gRG8geW91IGhhdmUgYSBQb0Mgb24gaG93IHRoaXMgaXMgaG9va2VkIHVwIHRvIGEg
cGxhdGZvcm0gTk1JIGV2ZW50ID8KPgo+ID4gT24gV2VkLCBPY3QgMTUsIDIwMjUgYXQgMTA6MTji
gK9QTSBkb25nIHdlaSA8d2VpZG9uZy53ZEBieXRlZGFuY2UuY29tPiB3cm90ZToKPiA+Pgo+ID4+
IEFkZCBtb3JlIHJldmlld2Vycy4KPiA+Pgo+ID4+IE9uIFR1ZSwgT2N0IDE0LCAyMDI1IGF0IDE6
NTTigK9QTSB3ZWlkb25nd2QgPHdlaWRvbmcud2RAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPj4+
Cj4gPj4+IEFkZCB0aGUgaWQgb2YgbG9jYWwgdW5rbm93biBubWkgZXZlbnQgYW5kIGFkZCB0aGlz
IGV2ZW50IHRvIHRoZQo+ID4+PiBsaXN0IG9mIHN1cHBvcnRlZCBldmVudHMuCj4gPj4+Cj4gPj4+
IFNpZ25lZC1vZmYtYnk6IHdlaWRvbmd3ZCA8d2VpZG9uZy53ZEBieXRlZGFuY2UuY29tPgo+ID4+
PiAtLS0KPiA+Pj4gICBpbmNsdWRlL3NiaS9zYmlfZWNhbGxfaW50ZXJmYWNlLmggfCAzICsrLQo+
ID4+PiAgIGxpYi9zYmkvc2JpX3NzZS5jICAgICAgICAgICAgICAgICB8IDggKysrKysrKy0KPiA+
Pj4gICAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+
Pj4KPiA+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9lY2FsbF9pbnRlcmZhY2UuaCBi
L2luY2x1ZGUvc2JpL3NiaV9lY2FsbF9pbnRlcmZhY2UuaAo+ID4+PiBpbmRleCBhZjdhMDVhLi44
YmIwZDM5IDEwMDY0NAo+ID4+PiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfZWNhbGxfaW50ZXJmYWNl
LmgKPiA+Pj4gKysrIGIvaW5jbHVkZS9zYmkvc2JpX2VjYWxsX2ludGVyZmFjZS5oCj4gPj4+IEBA
IC00MzYsNyArNDM2LDggQEAgZW51bSBzYmlfc3NlX3N0YXRlIHsKPiA+Pj4KPiA+Pj4gICAvKiBS
YW5nZSAweGZmZmYwMDAwIC0gMHhmZmZmZmZmZiAqLwo+ID4+PiAgICNkZWZpbmUgU0JJX1NTRV9F
VkVOVF9MT0NBTF9TT0ZUV0FSRSAgICAgICAgICAgMHhmZmZmMDAwMAo+ID4+PiAtI2RlZmluZSBT
QklfU1NFX0VWRU5UX0xPQ0FMX1JFU0VSVkVEXzNfU1RBUlQgICAweGZmZmYwMDAxCj4gPj4+ICsj
ZGVmaW5lIFNCSV9TU0VfRVZFTlRfTE9DQUxfVU5LTk9XTl9OTUkgICAgICAgICAgICAgICAgMHhm
ZmZmMDAwMQo+ID4+PiArI2RlZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX1JFU0VSVkVEXzNfU1RB
UlQgICAweGZmZmYwMDAyCj4gPj4+ICAgI2RlZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX1JFU0VS
VkVEXzNfRU5EICAgICAweGZmZmYzZmZmCj4gPj4+ICAgI2RlZmluZSBTQklfU1NFX0VWRU5UX0xP
Q0FMX1BMQVRfM19TVEFSVCAgICAgICAweGZmZmY0MDAwCj4gPj4+ICAgI2RlZmluZSBTQklfU1NF
X0VWRU5UX0xPQ0FMX1BMQVRfM19FTkQgICAgICAgICAweGZmZmY3ZmZmCj4gPj4+IGRpZmYgLS1n
aXQgYS9saWIvc2JpL3NiaV9zc2UuYyBiL2xpYi9zYmkvc2JpX3NzZS5jCj4gPj4+IGluZGV4IDk4
NmI3NzAuLmU3NzFlZmUgMTAwNjQ0Cj4gPj4+IC0tLSBhL2xpYi9zYmkvc2JpX3NzZS5jCj4gPj4+
ICsrKyBiL2xpYi9zYmkvc2JpX3NzZS5jCj4gPj4+IEBAIC0xODIsOSArMTgyLDE0IEBAIHN0cnVj
dCBzc2VfZXZlbnRfaW5mbyBnbG9iYWxfc29mdHdhcmVfZXZlbnQgPSB7Cj4gPj4+ICAgICAgICAg
IFNCSV9TTElTVF9OT0RFX0lOSVQoTlVMTCksCj4gPj4+ICAgfTsKPiA+Pj4KPiA+Pj4gK3N0cnVj
dCBzc2VfZXZlbnRfaW5mbyBsb2NhbF91bmtub3duX25taV9ldmVudCA9IHsKPiA+Pj4gKyAgICAg
ICAuZXZlbnRfaWQgPSBTQklfU1NFX0VWRU5UX0xPQ0FMX1VOS05PV05fTk1JLAo+ID4+PiArICAg
ICAgIFNCSV9TTElTVF9OT0RFX0lOSVQoJmdsb2JhbF9zb2Z0d2FyZV9ldmVudCksCj4gPj4+ICt9
Owo+ID4+PiArCj4gPj4+ICAgc3RydWN0IHNzZV9ldmVudF9pbmZvIGxvY2FsX3NvZnR3YXJlX2V2
ZW50ID0gewo+ID4+PiAgICAgICAgICAuZXZlbnRfaWQgPSBTQklfU1NFX0VWRU5UX0xPQ0FMX1NP
RlRXQVJFLAo+ID4+PiAtICAgICAgIFNCSV9TTElTVF9OT0RFX0lOSVQoJmdsb2JhbF9zb2Z0d2Fy
ZV9ldmVudCksCj4gPj4+ICsgICAgICAgU0JJX1NMSVNUX05PREVfSU5JVCgmbG9jYWxfdW5rbm93
bl9ubWlfZXZlbnQpLAo+ID4+PiAgIH07Cj4gPj4+Cj4gPj4+ICAgc3RhdGljIFNCSV9TTElTVF9I
RUFEKHN1cHBvcnRlZF9ldmVudHMsIHNzZV9ldmVudF9pbmZvKSA9Cj4gPj4+IEBAIC0yMDIsNiAr
MjA3LDcgQEAgc3RhdGljIGNvbnN0IHVpbnQzMl90IHN0YW5kYXJkX2V2ZW50c1tdID0gewo+ID4+
PiAgICAgICAgICBTQklfU1NFX0VWRU5UX0xPQ0FMX0xPV19QUklPX1JBUywKPiA+Pj4gICAgICAg
ICAgU0JJX1NTRV9FVkVOVF9HTE9CQUxfTE9XX1BSSU9fUkFTLAo+ID4+PiAgICAgICAgICBTQklf
U1NFX0VWRU5UX0xPQ0FMX1NPRlRXQVJFLAo+ID4+PiArICAgICAgIFNCSV9TU0VfRVZFTlRfTE9D
QUxfVU5LTk9XTl9OTUksCj4gPj4+ICAgICAgICAgIFNCSV9TU0VfRVZFTlRfR0xPQkFMX1NPRlRX
QVJFLAo+ID4+PiAgIH07Cj4gPj4+Cj4gPj4+IC0tCj4gPj4+IDIuMjAuMQo+ID4+Pgo+ID4KPgoK
LS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
