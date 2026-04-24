Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FC0FDEE58
	for <opensbi@archiver.kernel.org>; Fri, 24 Apr 2026 01:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LuFb9tj8gJROTd6/og3gbdPvybWcxWOmPPrBlxXNcKo=; b=sC8UVEcSlw1fBm
	RmwmgKPwOxvlDuPfSLkV5uO8GL7x/498bm1PeN4Kt8Bx/4DyMpCets97h33xXD/UkheiOE7oDJy0U
	f/dvGjoipcy7BQfjVn0y3p5ff3Sb+EAFDVkFn27SbKV2uYS7J22Lh/0XsIz8oycY9BXrywalk5KMX
	tq9tC9/1uARtYoPeqy8Gb8+CysMcTfRZmhdU8BY8ELAnh5yH8Y57RZi06myP9tPR/wN+ZscjIBGQC
	jRfJTZ7ciHP2/i3xKWmTr3/TMofxyL+7lyBeU//BZ+VysngE8nqUmct6/ovqAjxiFDOljs6j0p0JY
	q0ntQDwLisYStXw2LHkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG52t-0000000CSff-2cOY;
	Fri, 24 Apr 2026 01:09:27 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG52q-0000000CSfG-0AfC
	for opensbi@lists.infradead.org;
	Fri, 24 Apr 2026 01:09:26 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-82f9fdfc965so2866417b3a.1
        for <opensbi@lists.infradead.org>; Thu, 23 Apr 2026 18:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776992962; x=1777597762; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pVVzWDfjfVeFdgoFNZKCB75ulaNAn60WQY4zNB7IxE4=;
        b=F2VH1wQT5F6LvoqG+u3fw8AAJI70WRmSC62RBjDmTmvsPDKwQdiFMvg/WOrVMBwiL5
         u2WcWCH0TPLhjFNsQ4rQANNRVcfCLtVia98tMZizSGli80g+d2JLrXQhNdjIzfazC1DF
         MqESclYVjz8VGBly0klDSTqBM+vp+kQaLGk6wDnkupoqp3bt7eToBXCEUkvdC/rBXeky
         kX5JS958ea7LIFgfeLp7bl723gNWW71D83dowlyENHXIpaMe69OLNUDp/908PRmhfLeA
         z7p+g60s7d/g7URDZ71NFmGpxvMTsBpki2mxLGqab8C//M5ULbYw18FCYazMc6xWvxuM
         f/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776992962; x=1777597762;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pVVzWDfjfVeFdgoFNZKCB75ulaNAn60WQY4zNB7IxE4=;
        b=I4RAVDJSzRIG+lEu1b6agYz9+SoTA2I6y4N34N5+in23Y23OS1GCJK3jX7jcA9a1yb
         k4DeqMLfzbuk9v9pubKaF3T4c3IUuS+yztDnC3SHLpx4WdvKHLuSNda1Vm/Pgv2Xd0As
         qip4D4P8oKHkBTPtirThFyR86rELRu7WVTH7HlNpfVOuVFYBep77P6njC4eNxQDPMJ8j
         095Zrd/ie3+Yyi7mxKCUFUI8rB2s0ttJ5me0hxE8uPiD8NBulZVgCHO94Xr71VPEwtjy
         bmw2EV2JUHkRvPg7RIVJOztkWGBCX9/ESqFz0E42p13g/7/6QGipusaaj2kd2vP3n4q2
         0Gcg==
X-Forwarded-Encrypted: i=1; AFNElJ8w0XAfO7mB1cAR66+6lgzf8SAGkVCaeYsuqnlQId90MCg2pXp41wms11W86nXv7nhzIrI46sXz@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu2sWu4pdSa7+Xmp5wClM3dlXTR1QlQeD15O7Mw7xAUiK2o/nf
	7goSWoRkXJdsW521quyB4k53mtg0lqg7du+6zZ94yudTvPcpnOlWTU49
X-Gm-Gg: AeBDiet1nZYX5y16ZUtzhU6UdEohBFFB5dOnSn3sjq58iQ7UosdhFRlfu8dWzqz9jSU
	WlTdkAjmy86l+RiYXc1flUJjU+keZGkAyxrdDJyL9thmEGnW+obpP50srJetULWR5Dd11mT7pLB
	P6JEbVYOcmYiaZfre1PxKl9uurFZU42+3GjvoZ8UpSxvcIboqHu3yneDsIkm/J9yqOAAM14fN/1
	V1zyzsvoQlYgdaosqmgc30cBnDggZ6Kj7r6tbdkr6RBg/B0JV0L6MKcTpyktrXw5K6YWp5hT2W6
	nwEOtWm2UiXnb9J8pBSepnNYm218zD29o7fS1VOTlXAk9FRniZWfRaNntuhTFBzwtfYiLaTbHHa
	j8buB36CtYX4MY7Uu0hXdRHsWyfuEiAC0DeoZqkk/24KfgOtU0vJyr99aLT7VoKgPtk0X3Xo6sF
	XHEfOHxJvl6vnZllQmyjg/nfZod1ExI1/PK9Mtr9se+xPkJdiBx4fPIH4Sc7TIWtfMOE4rIg==
X-Received: by 2002:a05:6a00:1bc6:b0:82f:1b1b:e166 with SMTP id d2e1a72fcca58-82f8c99159emr31743494b3a.33.1776992962247;
        Thu, 23 Apr 2026 18:09:22 -0700 (PDT)
Received: from localhost (193-119-51-209.tpgi.com.au. [193.119.51.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe6642sm26750430b3a.45.2026.04.23.18.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 18:09:21 -0700 (PDT)
Date: Fri, 24 Apr 2026 11:09:16 +1000
From: Nicholas Piggin <npiggin@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Samuel Holland <samuel.holland@sifive.com>, opensbi@lists.infradead.org
Subject: Re: [PATCH 3/3] lib: sbi_timer: Add support for timer events
Message-ID: <aerAIAyFzMGCKy8H@lima-default>
References: <20260415110002.2610929-1-anup.patel@oss.qualcomm.com>
 <20260415110002.2610929-4-anup.patel@oss.qualcomm.com>
 <aemm95GM7bZOpgxO@lima-default>
 <CAAhSdy1j83c6a6gaWXcBm81a1QrnQLfkUZF5ds05u0_AUn-hOA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy1j83c6a6gaWXcBm81a1QrnQLfkUZF5ds05u0_AUn-hOA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_180924_089458_30FB798E 
X-CRM114-Status: GOOD (  33.44  )
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

T24gVGh1LCBBcHIgMjMsIDIwMjYgYXQgMDE6NTU6NTlQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBUaHUsIEFwciAyMywgMjAyNiBhdCAxMjoyNOKAr1BNIE5pY2hvbGFzIFBpZ2dpbiA8
bnBpZ2dpbkBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgQXByIDE1LCAyMDI2IGF0
IDA0OjMwOjAyUE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cgo+ID4gPiArdm9pZCBzYmlfdGlt
ZXJfZXZlbnRfc3RhcnQoc3RydWN0IHNiaV90aW1lcl9ldmVudCAqZXYsIHU2NCBuZXh0X2V2ZW50
KQo+ID4gPiArewo+ID4gPiArICAgICBzdHJ1Y3Qgc2JpX3RpbWVyX2V2ZW50ICp0ZXYsICpuZXh0
X2V2ID0gTlVMTDsKPiA+ID4gKyAgICAgc3RydWN0IHRpbWVyX3N0YXRlICp0c3RhdGU7Cj4gPiA+
ICsKPiA+ID4gKyAgICAgaWYgKCFldikKPiA+ID4gKyAgICAgICAgICAgICByZXR1cm47Cj4gPiA+
ICsKPiA+ID4gKyAgICAgLyogRW5zdXJlIHRoYXQgZXZlbnQgaXMgbm90IG9uIHRoZSBwZXItSEFS
VCBldmVudCBsaXN0ICovCj4gPiA+ICsgICAgIGlmIChldi0+aGFydF9pbmRleCA+IC0xKSB7Cj4g
Pgo+ID4gSXQgaXMgYSBiaXQgd29ycnlpbmcgdG8gcGVybWl0IHNiaV90aW1lcl9ldmVudF9zdGFy
dCgpIGlmIHRoZSB0aW1lciBpcwo+ID4gYWxyZWFkeSBvbiBhIGxpc3QuIElzIHRoYXQgbmVjZXNz
YXJ5LCBvciBjb3VsZCB5b3UgcmV0dXJuIGFuIGVycm9yIGluCj4gPiB0aGlzIGNhc2U/Cj4gPgo+
ID4gSSdtIHRoaW5raW5nIHByb2JsZW1zIGxpa2UgdGhpcyAtCj4gPgo+ID4gSEFSVDAgICAgICAg
ICAgICAgICAgICAgICAgICAgSEFSVDEKPiA+IHNiaV90aW1lcl9ldmVudF9zdGFydCgpICAgICAg
IHNiaV90aW1lcl9wcm9jZXNzKCkKPiA+Cj4gPiAgIGlmIChoYXJ0X2luZGV4ID4gLTEpIHsKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX19zYmlfdGltZXJfZXZlbnRfc3RvcChl
dikKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKGV2LT5jYWxsYmFjaykg
ewo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrKCk7Cj4g
PiAgICAgc3Bpbl9sb2NrKCk7Cj4gPiAgICAgX19zYmlfdGltZXJfZXZlbnRfc3RvcChldikKPiA+
ICAgICBzcGluX3VubG9jaygpOwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNhbGxiYWNrX2ZuKCkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNi
aV90aW1lcl9ldmVudF9zdGFydCgpOyAvKiByZS1hZGQgcGVyaW9kaWMgdGltZXIgKi8KPiAKPiBJ
dCBpcyBnZW5lcmFsbHkgZ29vZCB0byBoYXZlIGFiaWxpdHkgdG8gc3RvcCBhIHJ1bm5pbmcgdGlt
ZXIKPiBldmVudCBmcm9tIGFueSBDUFUgYnV0IEkgYWdyZWUgdGhlIHByb2JsZW0geW91IGFyZSBo
aWdobGlnaHRpbmcuCj4gSSB0aGluayB0aGUgcmVhbCBwcm9ibGVtIGluIHRoaXMgcGF0Y2ggaXMg
dGhlIHNwaW5fdW5sb2NrKCkvc3Bpbl9sb2NrKCkKPiBkYW5jZSBhcm91bmQgdGhlIGNhbGxiYWNr
IGZ1bmN0aW9uIGNhbGxlZCBieSBzYmlfdGltZXJfcHJvY2VzcygpLgo+IAo+IFRvIGF2b2lkIHRo
ZSBzcGluX3VubG9jaygpL3NwaW5fbG9jaygpIGRhbmNlIGluIHNiaV90aW1lcl9wcm9jZXNzKCks
Cj4gSSB0aGluayBpdCBpcyBiZXR0ZXIgdG8gY2FsbCB0aGUgY2FsbGJhY2sgZnVuY3Rpb24gd2l0
aCBsb2NrIGhlbGQgYW5kIGNhbGxiYWNrCj4gZnVuY3Rpb24gY2FuIG9wdGlvbmFsbHkgcmV0dXJu
IG5leHRfdGltZV9zdGFtcCBpZiBpdCB3YW50cyB0byByZS1hZGQKPiBwZXJpb2RpYyB0aW1lci4g
U3VnZ2VzdGlvbnMgPwoKWWVzLCBpZiB0aGUgdGltZXIgY2FsbGJhY2tzIGFyZSBmaW5lIHdpdGgg
aXQsIHRoZW4gdGhlIHNpbXBsZXIgdGhlIGJldHRlci4KClJldHVybmluZyBuZXh0X3RpbWVfc3Rh
bXAgaWYgYSByZXNjaGVkdWxlIGlzIG5lZWRlZCBzZWVtcyByZWFzb25hYmxlIHRvCm1lLiBzYmlf
dGltZXJfZXZlbnRfc3RhcnRfZnJvbV9jYWxsYmFjaygpIHdvdWxkIGJlIG9rYXkgdG9vLgoKPiA+
ID4gKyAgICAgICAgICAgICB0c3RhdGUgPSBzYmlfc2NyYXRjaF9vZmZzZXRfcHRyKHNiaV9oYXJ0
aW5kZXhfdG9fc2NyYXRjaChldi0+aGFydF9pbmRleCksCj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0aW1lcl9zdGF0ZV9vZmYpOwo+ID4gPiArICAg
ICAgICAgICAgIHNwaW5fbG9jaygmdHN0YXRlLT5ldmVudF9saXN0X2xvY2spOwo+ID4gPiArICAg
ICAgICAgICAgIF9fc2JpX3RpbWVyX2V2ZW50X3N0b3AoZXYpOwo+ID4gPiArICAgICAgICAgICAg
IHNwaW5fdW5sb2NrKCZ0c3RhdGUtPmV2ZW50X2xpc3RfbG9jayk7Cj4gPiA+ICsgICAgIH0KPiA+
ID4gKwo+ID4gPiArICAgICB0c3RhdGUgPSBzYmlfc2NyYXRjaF90aGlzaGFydF9vZmZzZXRfcHRy
KHRpbWVyX3N0YXRlX29mZik7Cj4gPiA+ICsgICAgIHNwaW5fbG9jaygmdHN0YXRlLT5ldmVudF9s
aXN0X2xvY2spOwo+ID4gPiArCj4gPiA+ICsgICAgIC8qIEZpbmQgd2hlcmUgdG8gaW5zZXJ0IHRo
ZSBldmVudCBpbiBwZXItSEFSVCBldmVudCBsaXN0ICovCj4gPiA+ICsgICAgIHNiaV9saXN0X2Zv
cl9lYWNoX2VudHJ5KHRldiwgJnRzdGF0ZS0+ZXZlbnRfbGlzdCwgaGVhZCkgewo+ID4gPiArICAg
ICAgICAgICAgIGlmIChuZXh0X2V2ZW50IDwgdGV2LT50aW1lX3N0YW1wKSB7Cj4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICBuZXh0X2V2ID0gdGV2Owo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgYnJlYWs7Cj4gPiA+ICsgICAgICAgICAgICAgfQo+ID4gPiArICAgICB9Cj4gPiA+ICsKPiA+
ID4gKyAgICAgLyogSW5zZXJ0IHRoZSBldmVudCBpbiBwZXItSEFSVCBldmVudCBsaXN0ICovCj4g
PiA+ICsgICAgIGV2LT5oYXJ0X2luZGV4ID0gY3VycmVudF9oYXJ0aW5kZXgoKTsKPiA+ID4gKyAg
ICAgZXYtPnRpbWVfc3RhbXAgPSBuZXh0X2V2ZW50Owo+ID4gPiArICAgICBpZiAobmV4dF9ldikK
PiA+ID4gKyAgICAgICAgICAgICBzYmlfbGlzdF9hZGQoJmV2LT5oZWFkLCAmbmV4dF9ldi0+aGVh
ZCk7Cj4gPiA+ICsgICAgIGVsc2UKPiA+ID4gKyAgICAgICAgICAgICBzYmlfbGlzdF9hZGRfdGFp
bCgmZXYtPmhlYWQsICZ0c3RhdGUtPmV2ZW50X2xpc3QpOwo+ID4gPiArCj4gPiA+ICsgICAgIF9f
c2JpX3RpbWVyX3VwZGF0ZV9kZXZpY2UodHN0YXRlKTsKPiA+ID4gKwo+ID4gPiArICAgICBzcGlu
X3VubG9jaygmdHN0YXRlLT5ldmVudF9saXN0X2xvY2spOwo+ID4gPiArfQo+ID4gPiArCj4gPiA+
ICt2b2lkIHNiaV90aW1lcl9ldmVudF9zdG9wKHN0cnVjdCBzYmlfdGltZXJfZXZlbnQgKmV2KQo+
ID4gPiArewo+ID4gPiArICAgICBzdHJ1Y3QgdGltZXJfc3RhdGUgKnRzdGF0ZTsKPiA+ID4gKwo+
ID4gPiArICAgICBpZiAoIWV2KQo+ID4gPiArICAgICAgICAgICAgIHJldHVybjsKPiA+ID4gKwo+
ID4gPiArICAgICAvKiBFbnN1cmUgdGhhdCBldmVudCBpcyBub3Qgb24gdGhlIHBlci1IQVJUIGV2
ZW50IGxpc3QgKi8KPiA+ID4gKyAgICAgaWYgKGV2LT5oYXJ0X2luZGV4ID4gLTEpIHsKPiA+ID4g
KyAgICAgICAgICAgICB0c3RhdGUgPSBzYmlfc2NyYXRjaF9vZmZzZXRfcHRyKHNiaV9oYXJ0aW5k
ZXhfdG9fc2NyYXRjaChldi0+aGFydF9pbmRleCksCj4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB0aW1lcl9zdGF0ZV9vZmYpOwo+ID4gPiArICAgICAg
ICAgICAgIHNwaW5fbG9jaygmdHN0YXRlLT5ldmVudF9saXN0X2xvY2spOwo+ID4gPiArICAgICAg
ICAgICAgIF9fc2JpX3RpbWVyX2V2ZW50X3N0b3AoZXYpOwo+ID4gPiArICAgICAgICAgICAgIHNw
aW5fdW5sb2NrKCZ0c3RhdGUtPmV2ZW50X2xpc3RfbG9jayk7Cj4gPgo+ID4gU2ltaWxhciBjb25j
ZXJuIGhlcmUsIHRpbWVyIGNvdWxkIGJlIGluIHRoZSBtaWRkbGUgb2YgcnVubmluZy4gTWF5YmUg
aXQKPiA+IGlzIGJlbmlnbi4gSSB0aGluayBpdCB3b3VsZCBiZSBuaWNlIHRvIG1ha2UgdGhpcyBh
ICJzeW5jIiBzdG9wIHRob3VnaCwKPiA+IHNvIGl0IGNhbiB3YWl0IGZvciBwb3RlbnRpYWwgcnVu
bmluZyB0aW1lcnMuCj4gPgo+ID4gdGltZXIgZXZlbnQgY291bGQgaGF2ZSBhICdydW5uaW5nJyBz
dGF0ZSB3aGljaCBpcyB1cGRhdGVkIGluc2lkZSB0aGUKPiA+IGxvY2ssIHRoZW4gc2JpX3RpbWVy
X2V2ZW50X3N0b3AoKSAoYW5kIHNiaV90aW1lcl9leGl0KCkpIGNvdWxkIHdhaXQgZm9yCj4gPiBp
dCB0byBjbGVhci4KPiAKPiBXZSBtaWdodCBoYXZlIHRvIHdhc3RlIGEgbG90IG9mIENQVSBjeWNs
ZXMgaW4gdGhlIGJ1c3ktbG9vcC4KClRoYXQncyB0cnVlIGJ1dCBJIHdvdWxkIGV4cGVjdCBpdCB0
byBub3QgYmUgY29tbW9uLiBIYXZpbmcgdGhlIHNpbXBsZXIKc3luYyBBUEkgYXMgdGhlIGZpcnN0
IC8gZGVmYXVsdCBvbmUgd291bGQgYmUgZ29vZCwgYWRkIHNvbWV0aGluZyBtb3JlCmNvbXBsZXgg
aWYgeW91IGZpbmQgdGhlIG5lZWQuCgpJbiBhbnkgY2FzZSwgSSB0aGluayBrZWVwaW5nIHRoZSBs
b2NrIGhlbGQgb3ZlciB0aGUgY2FsbGJhY2sgc2hvdWxkCm1ha2UgdGhpcyBhIHN5bmNocm9ub3Vz
IGRlbGV0ZS4KClRoYW5rcywKTmljawoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL29wZW5zYmkK
