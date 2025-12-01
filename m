Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F77D111A8
	for <opensbi@archiver.kernel.org>; Mon,  1 Dec 2025 04:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=buDi/nerluZaHbba70POQo3xb6a/7ZwHGSlj5Gd4xwk=; b=jL06OI9EBQLdEi
	p3otyQl0cMuAbhvbxKo1TqY+D4/yAO34BAstteeULi3kDNwJphEBs2XnivqqbT8HKVRGDsljkgMz4
	utZQaAVm+gbz0/GlmY8vhiEz/LaS8IZOvBsG3xbmAbwfohfmSwWYPqxEzCvtREdRIpQSh8B2cK/Z0
	HENm0+1ub4bVaYxd5ZiEXemhrX7CdRxixHrAP3qlVO++7MYNPjZ9nmYYzveG14BJyBGf7/w7CciuR
	L2Ntp4M5mKtFDtsvmczMe2mHctIBypAybZD4svgaUWi20HGw3W2LQ0V+OZHovBUwzTA5O00zr/J+H
	3TpnWFe/uzUv0KwHko2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPw0Q-00000002uff-0SaP;
	Mon, 01 Dec 2025 04:59:22 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPw0O-00000002uf8-0Lb2
	for opensbi@lists.infradead.org;
	Mon, 01 Dec 2025 04:59:21 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-37bac34346dso25701251fa.2
        for <opensbi@lists.infradead.org>; Sun, 30 Nov 2025 20:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1764565157; x=1765169957; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DG3sHr1bVjrYI3UQ9cpR2buSOjiYKRDehWDnXVIqE+M=;
        b=daqUhNdAPNDMxW0IL1OWkEfouzmhMAa4BMXCkVJZgVritjH/S72WLxrFPFaza9Sq8m
         dLLoYRnllKzXfnUEtdDHzUzkkIUezv71JfS7pT5hvJokLYlntUhnG3/p1UJ+B4TQl10N
         vOrp1+qOQHYmzm9KIOwi+2JCdhTx0LjAcjn7kutl0tUMsOaj15+hqiHaFJPpxLHN+o+A
         6sJK5EL16mj3CeWHY3jEAGwpZ2nN/+aKTWxN4ljVtOSLHkSn8C77szIGMIix690ByT+8
         yzAnGVsSmkhsLbv/lJrbBq5G4PDABT3lvjdnNy5Nrx+LdRx5/WVa33QnQnO1Z/bfNp4h
         kpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764565157; x=1765169957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DG3sHr1bVjrYI3UQ9cpR2buSOjiYKRDehWDnXVIqE+M=;
        b=uhcc3jYk1emFawtD5+K202JAHNerVAr1zYJk1ekt48ZGIfY4UVLIxmMIE5s3Eiy6gf
         5KZ0uVDajDcvEkk82FjGpz5ZXJwowiRy+Imc9IKTCTMtx0S99WX//iOP4nOlM0SAdpbn
         tnV9TrfpV0POku+6wu54kf19jY6YLZKgxXiSaywyU6aH8giKvSAdsckqSsdOcrnEfZUr
         xtic3DGKsfgQtR4WO//pWf6WH/6xg4BjIv4oA1TKg0Cw6zl+FxEDCZ9fz8EsjeTk4ELv
         xeRUGJJ+oQiLSCYEbipXqtogismE0VDh8TIfTO7d6CqOACR31cr55xXsqusHBqZ3oQ3J
         pTgg==
X-Forwarded-Encrypted: i=1; AJvYcCX0kudHJofyKD6g6dSOXyR4tjovERpTwSXZg+NWKKzbmv8W+6cPUohzspXXPwloIGcI8b9qYp1m@lists.infradead.org
X-Gm-Message-State: AOJu0YzX6SifUuml4liEjirT1eMzdIZ39bbRlmjRffI1WMZrKGnwx9I1
	sfwXXHi53+Ocm/PaXlRUUCEuSOygjnxg3iopUeWLTQSFBBsmlTtabqvpaATz5qgM2o102W+9CuT
	4uiZq8xC91WYAXfY8qAGxThyU1DqpbptrMwzI4ioZnZpV8E4D94ic
X-Gm-Gg: ASbGncsccMTH+/P5FgMVPOcvrD2sKP4ACS3Lf6dCtMjTwY2PjvmtXjk6B2R8i2LAXzc
	AIbAAoyGln9/2efkJxk3cqVptlRW8VyUKa4/ZUfLx4WBcedbkYVreRYXgewMmFsXxdh+m4By1Dy
	Zud1+jP/JOTXHi72d0Av3nYuE04Z5CTmFN/nw6Ne0dzwjjo8Z6zVA50qsg9AWpY3C0NrBZMnCgO
	c/6ZDXVG2qWwtdih6+ZlJvM8LIX6Xo3/tHfilzWcPBE9cPFH+FEDk6ZVjnXUJYCG801Ng==
X-Google-Smtp-Source: AGHT+IEXq0LdiEzHuXZczFJIad8EuKUau+VLR4uNU1vBTbP7qQzvuRpn4+vLjuJnZ4jAjZ+eghQ2jtSWavW4mhrd0mA=
X-Received: by 2002:a05:6512:3ba3:b0:595:9d86:2cc7 with SMTP id
 2adb3069b0e04-596a3ed966dmr11079757e87.39.1764565157256; Sun, 30 Nov 2025
 20:59:17 -0800 (PST)
MIME-Version: 1.0
References: <20251105160146.271156-1-apatel@ventanamicro.com> <20251105-c4154b1f28934a0798a712a0@orel>
In-Reply-To: <20251105-c4154b1f28934a0798a712a0@orel>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 1 Dec 2025 10:29:06 +0530
X-Gm-Features: AWmQ_bnbCgfTbdXA5_bDmYPfvpUnw7hSATc4sfXWJ2XXqam7_iN3l7PUc_uCsqg
Message-ID: <CAK9=C2WFFxRazzSNX_hejyXRJTpJB-xuEtu_iswkv=QqQM4u4g@mail.gmail.com>
Subject: Re: [PATCH] platform: generic: Keep some empty space in FDT passed to
 next stage
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
	opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_205920_145075_BA6D9E69 
X-CRM114-Status: GOOD (  19.86  )
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

T24gV2VkLCBOb3YgNSwgMjAyNSBhdCA5OjQ04oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIE5vdiAwNSwgMjAyNSBhdCAwOTozMTo0
NVBNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gTGVhdmluZyBubyBlbXB0eSBzcGFjZSBp
biB0aGUgRkRUIHBhc3NlZCB0byB0aGUgbmV4dCBib290aW5nIHN0YWdlCj4gPiBjYXVzZXMgdGhl
IGZvbGxvd2luZyBVLUJvb3QgY3Jhc2ggb24gVmVudGFuYSBpbnRlcm5hbCBwbGF0Zm9ybXM6Cj4g
Pgo+ID4gVW5oYW5kbGVkIGV4Y2VwdGlvbjogTG9hZCBhY2Nlc3MgZmF1bHQKPiA+IEVQQzogMDAw
MDAwMDBmZmZhNjM3MiBSQTogMDAwMDAwMDBmZmZhNzQxOCBUVkFMOiAwMDAxNzQ2MTc0NzMwMDY4
Cj4gPiBFUEM6IDAwMDAwMDAwODAyNDUzNzIgUkE6IDAwMDAwMDAwODAyNDY0MTggcmVsb2MgYWRq
dXN0ZWQKPiA+Cj4gPiBTUDogIDAwMDAwMDAwZmVmMzg0NDAgR1A6ICAwMDAwMDAwMGZlZjQwZTYw
IFRQOiAgMDAwMDAwMDAwMDAwMDAwMAo+ID4gVDA6ICAwMDAwMDAwMGZlZjQwYTcwIFQxOiAgMDAw
MDAwMDAwMDAwZmYwMCBUMjogIDAwMDAwMDAwMDAwMDAwMDAKPiA+IFMwOiAgMDAwMDAwMDBmZmZj
MTdhOCBTMTogIDAwMDAwMDAwZmVmMzhkNDAgQTA6ICA3Mzc1NzQ2MTc0NzMwMDY4Cj4gPiBBMTog
IDAwMDAwMDAwZmZmYzE3YTggQTI6ICAwMDAwMDAwMDAwMDAwMDEwIEEzOiAgMDAwMDAwMDAwMDAw
MDAxMAo+ID4gQTQ6ICAwMDAwMDAwMDAwMDAwMDAwIEE1OiAgMDAwMDAwMDBmZmZjMTdiOCBBNjog
IDAwMDAwMDAwMDBmZjAwMDAKPiA+IEE3OiAgMDAwMDAwMDAwMDAwYjEwMCBTMjogIDAwMDAwMDAw
MDAwMDAwMDAgUzM6ICAwMDAwMDAwMDAwMDAwMDAxCj4gPiBTNDogIDAwMDAwMDAwZmVmMzhkNDAg
UzU6ICA3Mzc1NzQ2MTc0NzMwMDY4IFM2OiAgMDAwMDAwMDAwMDAwMDAwMAo+ID4gUzc6ICAwMDAw
MDAwMGZlZjRlZWYwIFM4OiAgMDAwMDAwMDBmZWY0ZWY5MCBTOTogIDAwMDAwMDAwMDAwMDAwMDAK
PiA+IFMxMDogMDAwMDAwMDAwMDAwMDAwMCBTMTE6IDAwMDAwMDAwZmVmNGVmYzAgVDM6ICAwMDAw
MDAwMGZlZjQwZWE4Cj4gPiBUNDogIDAwMDAwMDAwMDBmZjAwMDAgVDU6ICAwMDAwMDAwMGZlZjQw
YTYwIFQ2OiAgMDAwMDAwMDBmZWY0MGE2Ywo+ID4KPiA+IFRvIGFkZHJlc3MgdGhlIGFib3ZlIGlz
c3VlLCBrZWVwIHNvbWUgbWluaW1hbCBlbXB0eSBzcGFjZSBpbiB0aGUKPiA+IEZEVCBpbnN0ZWFk
IG9mIG5vIGVtcHR5IHNwYWNlLgo+ID4KPiA+IEZpeGVzOiBiYmU5YTIzMDYwZTkgKCJwbGF0Zm9y
bTogZ2VuZXJpYzogUGFjayB0aGUgRkRUIGFmdGVyIGFwcGx5aW5nIGZpeHVwcyIpCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiA+IC0tLQo+
ID4gIHBsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYyB8IDIgKysKPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2dlbmVyaWMv
cGxhdGZvcm0uYyBiL3BsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYwo+ID4gaW5kZXggZTY2Zjk5
ZmEuLmVhNDQ2NzZiIDEwMDY0NAo+ID4gLS0tIGEvcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5j
Cj4gPiArKysgYi9wbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMKPiA+IEBAIC0yNDUsNyArMjQ1
LDkgQEAgaW50IGdlbmVyaWNfZmluYWxfaW5pdChib29sIGNvbGRfYm9vdCkKPiA+ICAgICAgIGZk
dF9maXh1cHMoZmR0KTsKPiA+ICAgICAgIGZkdF9kb21haW5fZml4dXAoZmR0KTsKPiA+Cj4gPiAr
ICAgICAvKiBNaW5pbWl6ZSB0aGUgZW1wdHkgc3BhY2UgaW4gRkRUIHRvIDRLQiAqLwo+ID4gICAg
ICAgZmR0X3BhY2soZmR0KTsKPiA+ICsgICAgIGZkdF9vcGVuX2ludG8oZmR0LCBmZHQsIGZkdF90
b3RhbHNpemUoZmR0KSArIDQwOTYpOwo+ID4KPiA+ICAgICAgIHJldHVybiAwOwo+ID4gIH0KPiA+
IC0tCj4gPiAyLjQzLjAKPiA+Cj4KPiBJIGFncmVlIG9wZW5zYmkgbmVlZHMgdG8gd29ya2Fyb3Vu
ZCB1Ym9vdCBpc3N1ZXMgaW4gb3JkZXIgdG8gZW5zdXJlIGl0Cj4gZG9lc24ndCBicmVhayBjdXJy
ZW50IGNvbmZpZ3VyYXRpb25zLCBidXQgbWF5YmUgd2Ugc2hvdWxkIG1ha2UgdGhlCj4gZXh0cmEg
c3BhY2UgYWRkZWQgYmUgYSBLY29uZmlnIG1hbmFnZWQgZGVmaW5lLCByYXRoZXIgdGhhbiBhIGhh
cmQgNDA5Ni4KPiBUaGUgbWFpbiByZWFzb24gd291bGQgYmUgdG8gZW5hYmxlIHNldHRpbmcgaXQg
dG8gemVybyBzbyBpc3N1ZXMgd2l0aAo+IHNlY29uZCBzdGFnZSBsb2FkZXJzIGxpa2UgdGhpcyBv
bmUgY2FuIGJlIGZsdXNoZWQgb3V0IGFuZCBmaXhlZC4KPgoKQWRkaW5nIGEgS2NvbmZpZyBvcHRp
b24gZm9yIHRoZSBhbW91bnQgb2YgZXh0cmEgc3BhY2Ugc2hvdWxkIGJlIGZpbmUsCkkgd2lsbCB1
cGRhdGUgYW5kIHNlbmQgdjIuCgpUaGFua3MsCkFudXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlz
dApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
