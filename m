Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4D9CAC592
	for <opensbi@archiver.kernel.org>; Tue, 16 Sep 2025 04:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=12239bk5ThPCe9dWhh3lCmkEoifuyctKDXMT1ur3zkE=; b=oi3G8VWh1viSx7
	w3Hm88oMg0C7tXiggiZImRXOaSKIxqiQGYYd8DWc6MihMo0e5HQ5xRW7gOXUsQ2fLlqKwIiRPCMXj
	bJ/jwySSOt4IBwYW7nyUYo3nVVqQGM2DjLVD6n+5mddEmV0Gcvj+uxhHwWHmGj12gqjq/Zf9RcFLt
	AbbhOIlmcCjTaIG6Ez96cXS8yJaK92+9gEugkUvNPMb++R1cXeFKjP2MGTf6g7bl+/Gt2BtxPmZM3
	nq7XT310Fl52g6b4/IE2UyojwHO5nx82u2+l92oF57RsZYu6STcEwnalZlTjwyi83tWESJnJINvIo
	i4aXn2rh1B9hIxXmagTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyNV1-00000006iAI-0xAA;
	Tue, 16 Sep 2025 04:41:03 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyNUz-00000006i9w-14Jx
	for opensbi@lists.infradead.org;
	Tue, 16 Sep 2025 04:41:02 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-423fbb45255so10941565ab.3
        for <opensbi@lists.infradead.org>; Mon, 15 Sep 2025 21:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1757997660; x=1758602460; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZEzbkGcVZjc6WeW5/6vS2eA50UkDHg50NyTdUW1XFE=;
        b=YKwkpY3/Zwc6op3ozpd42NEY9fpHNcy7Jt915ek5q9k5G0F9fAuAkTQnwCDtUfq0UV
         OOvGenS7joIhb7lCVWXAhuIPznjK4pvCrelW/F5bQ0HCheom24fpp3BTnY/9wACTuWR+
         1PC1WTbcXOOrI9XzVcBwvB9SGYtDl/ZboQoAK6hwWn97hx/7BXM8QNlO6x8voF+jk6eH
         RDXcYq37ECutVM6EPOxuCK68eATNB5Ep/k3Xs2Lyla1R9DPWsFfA3ZmNthAwgKHt+BSZ
         EU0jyJnvvSGHaCxlcpSj8ORCT/LpSS7v1o6WoF7x+XyvSnHCD/dxatk/rDHDTj0cJMcM
         Nmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757997660; x=1758602460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZEzbkGcVZjc6WeW5/6vS2eA50UkDHg50NyTdUW1XFE=;
        b=hYvbCY5OtPFVCzDR+ufICzRjM8xyqaq/TVdt7pLkCHMxCruAlw6cz/wd2kgQndEhru
         lY2O6Qx0S0or8iwa+kD4mFxaWwnJMoYJgk/Af0GGrAChpkhkdbHVD3IoqoTIfBevZpEx
         p8k9E14ExNvfDKugZZqdBXN4VfRuj2yFE/mJrd1dZn1CeSYFt6PwbHALbpa1V2wmSW/Q
         PnNyJqV9blygoU7k/TBDKJjsSY/2V5/PGosX2tWv4UETibrtLg63aifm3G9cjkjqT/7r
         r2tzFn33QsNfNERPDKaXUjKzDHhh+Iu6WLR7Z+YH/nz16e0BgdY+ldBwMVIlg484vSu1
         UJ0Q==
X-Gm-Message-State: AOJu0YyI+HYvG8um+v68grqF9xxO3Qo7n/O7CifoXQ3wsnRvGNiNjC1H
	+o0rK6Etykq2nRnZ7zVochilPv09i+EVigr/VHXF2V20zBvU4n/HhKfHRLohmt8GtL/fPA0IbHW
	n5I+X0DSEbzn3XBg4pIp19uUFzjO0Mqo7vKmGprSgKFwjJyHv0bpi
X-Gm-Gg: ASbGncsvWFzwR+ADVRIPp7+PWN6eNEHXNA2QhTjIocpMwRf9FKqEkeZUX7eMq71tNC5
	lzUi8YX4FmLgpvIRGq17JxAq3Rxt5nZsHlOgI361N06lE6LXE0L3vftGUVvPXDRO8otRVwNnyTD
	JjzqvEo9DJeo+nyjfZFe2wk2YfQ9hfygTuuCoaYmI1SZC10tPRR1qjFn6Fg02e0HvPJmpARDjvM
	PMd9n2rQTGb+DAhJcJHj15FT0Flh2X7Bdt21Q7O
X-Google-Smtp-Source: AGHT+IH5flr9Gkd2XRZD+9kC0mJoDwZxAoUtyTDCNAfDC7nf7MQiVNQ8IkPKnQiOfsufLSA9z3Rtav2qywZRzD3ljNs=
X-Received: by 2002:a92:ca4e:0:b0:423:fc5f:cad3 with SMTP id
 e9e14a558f8ab-423fc5fcdf6mr65530245ab.17.1757997660168; Mon, 15 Sep 2025
 21:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250908055646.2391370-1-samuel.holland@sifive.com>
In-Reply-To: <20250908055646.2391370-1-samuel.holland@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 16 Sep 2025 10:10:46 +0530
X-Gm-Features: AS18NWBRLPwxOybgR13RHXc2GWEa9kKT0NKJjY_4WrKU9Y6bg5UkO15AAcCA_ko
Message-ID: <CAAhSdy2Yz51jxJK8Vkg1_LeuB7PfEm8-y14wrT+i6LHKwkOibg@mail.gmail.com>
Subject: Re: [PATCH 1/3] lib: sbi_hsm: Save mideleg across non-retentive suspend
To: Samuel Holland <samuel.holland@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_214101_301010_D707BCC5 
X-CRM114-Status: GOOD (  15.77  )
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

T24gTW9uLCBTZXAgOCwgMjAyNSBhdCAxMToyNuKAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IE9wZW5TQkkgdXBkYXRlcyBtaWRlbGVnIHdo
ZW4gcmVnaXN0ZXJpbmcgb3IgdW5yZWdpc3RlcmluZyB0aGUgUE1VIFNTRQo+IGV2ZW50LiBUaGUg
dXBkYXRlZCBDU1IgdmFsdWUgbXVzdCBiZSBzYXZlZCBhY3Jvc3Mgbm9uLXJldGVudGl2ZSBzdXNw
ZW5kLAo+IG9yIFBNVSBTU0UgZXZlbnRzIHdpbGwgbm90IGJlIGRlbGl2ZXJlZCBhZnRlciB0aGUg
aGFydCBpcyByZXN1bWVkLgo+Cj4gRml4ZXM6IGIzMWEwYTI0Mjc5ZCAoImxpYjogc2JpOiBwbXU6
IEFkZCBTU0UgcmVnaXN0ZXIvdW5yZWdpc3RlcigpIGNhbGxiYWNrcyIpCj4gU2lnbmVkLW9mZi1i
eTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+CgpMR1RNLgoKUmV2
aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMg
cGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKPiAtLS0KPgo+
ICBsaWIvc2JpL3NiaV9oc20uYyB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKykKPgo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9oc20uYyBiL2xpYi9zYmkvc2JpX2hz
bS5jCj4gaW5kZXggNTU3YWIxMzEuLjhlYzk0ZDJiIDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2Jp
X2hzbS5jCj4gKysrIGIvbGliL3NiaS9zYmlfaHNtLmMKPiBAQCAtNDcsNiArNDcsNyBAQCBzdHJ1
Y3Qgc2JpX2hzbV9kYXRhIHsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgc2F2ZWRfbWllOwo+ICAg
ICAgICAgdW5zaWduZWQgbG9uZyBzYXZlZF9taXA7Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIHNh
dmVkX21lZGVsZWc7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIHNhdmVkX21pZGVsZWc7Cj4gICAg
ICAgICB1bnNpZ25lZCBsb25nIHNhdmVkX21lbnZjZmc7Cj4gICNpZiBfX3Jpc2N2X3hsZW4gPT0g
MzIKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgc2F2ZWRfbWVudmNmZ2g7Cj4gQEAgLTQyOSw2ICs0
MzAsNyBAQCB2b2lkIF9fc2JpX2hzbV9zdXNwZW5kX25vbl9yZXRfc2F2ZShzdHJ1Y3Qgc2JpX3Nj
cmF0Y2ggKnNjcmF0Y2gpCj4gICAgICAgICBoZGF0YS0+c2F2ZWRfbWllID0gY3NyX3JlYWQoQ1NS
X01JRSk7Cj4gICAgICAgICBoZGF0YS0+c2F2ZWRfbWlwID0gY3NyX3JlYWQoQ1NSX01JUCkgJiAo
TUlQX1NTSVAgfCBNSVBfU1RJUCk7Cj4gICAgICAgICBoZGF0YS0+c2F2ZWRfbWVkZWxlZyA9IGNz
cl9yZWFkKENTUl9NRURFTEVHKTsKPiArICAgICAgIGhkYXRhLT5zYXZlZF9taWRlbGVnID0gY3Ny
X3JlYWQoQ1NSX01JREVMRUcpOwo+ICAgICAgICAgaWYgKHNiaV9oYXJ0X3ByaXZfdmVyc2lvbihz
Y3JhdGNoKSA+PSBTQklfSEFSVF9QUklWX1ZFUl8xXzEyKSB7Cj4gICNpZiBfX3Jpc2N2X3hsZW4g
PT0gMzIKPiAgICAgICAgICAgICAgICAgaGRhdGEtPnNhdmVkX21lbnZjZmdoID0gY3NyX3JlYWQo
Q1NSX01FTlZDRkdIKTsKPiBAQCAtNDQ4LDYgKzQ1MCw3IEBAIHN0YXRpYyB2b2lkIF9fc2JpX2hz
bV9zdXNwZW5kX25vbl9yZXRfcmVzdG9yZShzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gpCj4g
ICAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfTUVOVkNGR0gsIGhkYXRhLT5zYXZlZF9tZW52
Y2ZnaCk7Cj4gICNlbmRpZgo+ICAgICAgICAgfQo+ICsgICAgICAgY3NyX3dyaXRlKENTUl9NSURF
TEVHLCBoZGF0YS0+c2F2ZWRfbWlkZWxlZyk7Cj4gICAgICAgICBjc3Jfd3JpdGUoQ1NSX01FREVM
RUcsIGhkYXRhLT5zYXZlZF9tZWRlbGVnKTsKPiAgICAgICAgIGNzcl93cml0ZShDU1JfTUlFLCBo
ZGF0YS0+c2F2ZWRfbWllKTsKPiAgICAgICAgIGNzcl9zZXQoQ1NSX01JUCwgKGhkYXRhLT5zYXZl
ZF9taXAgJiAoTUlQX1NTSVAgfCBNSVBfU1RJUCkpKTsKPiAtLQo+IDIuNDcuMgo+Cj4gYmFzZS1j
b21taXQ6IDE1M2NkZWVhNTM1MDgzN2MxMjA2YTJkMmI2MTg5ZmQwYmEwNmQxZjIKPiBicmFuY2g6
IHVwL21pZGVsZWctZml4Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBs
aXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
b3BlbnNiaQo=
