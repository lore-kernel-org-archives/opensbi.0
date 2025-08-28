Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DEBCA0EED
	for <opensbi@archiver.kernel.org>; Thu, 28 Aug 2025 06:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PgVqB+aIsU1fZp2iSz+fPQ3Blo91fk6/YAmvnsn68MM=; b=K/RI7greev7WP+
	ZyIvNRZGNrlfcdhLuVDeA63g5LQLnbxyLl7pPgmJf8GuHaI8b4VUBXllQGaifBfYEDFVdMmiSzegB
	HUcTRXKQfhw3QL31p2BQ0EcK6FvLh+9TneB7BqzlLO2JonvG98l7F4rzX5ZA4ec/6x5XRhKOTUUT1
	5X6G71vRJTe35jgMCePBgjewMZTed9B1gMDmkCIhZLggk1svPpdaYRsmYFhe2subtm0QgVLVst4uA
	3Leat8rCq/39QyjPcrnfMr0NjLVPnS2BsYO1na/kGi48eif24ivipJl9CkrBV8UL/DdN3ttgeaGe1
	EoMtaa+QwuogafkQGR8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urW28-00000000QMB-0vTD;
	Thu, 28 Aug 2025 06:22:52 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urW0B-00000000QFf-1K6n
	for opensbi@lists.infradead.org;
	Thu, 28 Aug 2025 06:20:52 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3ce772ce0dbso48153f8f.0
        for <opensbi@lists.infradead.org>; Wed, 27 Aug 2025 23:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1756362049; x=1756966849; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsx/sG0+mDH9zGODE4oEQLUYDsDBSwl6FnU62htOd9E=;
        b=A1ZuCLF5J+RCD33YCQBY5ifOOEl9F/+sDPp3LHhneTCtThH5HxN7f38JeKXAI4kGj+
         TRWdY6Z4FBMczdcpPjv71vNOOIJXTkkyFLmNFmqxN5cpgCkuHIlapsmezYjBKePUqOxi
         jyh5ABq8PKUIdfDBrAhjdbw/zxJ9d08nEZ4qQMqI9UVW1LnYzdqvyDUL3CM4U03sx07F
         Jq8gWsu335BHId6YsildLKiB4MoRjy+V6KLXggB8E4MbAY+1njvGESvlt4y+01aV0kOA
         7F5UW0vUwgVO1+UgN9I6zuHIK6PixKIIR5xwjAoYVO/v6NDPxiGw3gBeBoVooBlWqG+5
         +FLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756362049; x=1756966849;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsx/sG0+mDH9zGODE4oEQLUYDsDBSwl6FnU62htOd9E=;
        b=eYqSnhvIJrk/3aWvOndCnbQI6IlbRmUMt4QTbc6DPsvGCoEFZpq4LIIfVjHBwgL+YP
         6xFcUf+5RcGq6zU6cJbOw8qO3dzB56ZyLqidYdTwkZYpvWAQOy3UVk6jy9+7sSlUVqSh
         vKgupoRT3r3ADHKWTZ+tmJAdpdTi58GEmqT+fjLJGFubV9epmg3uGuAC7qOhTnukjKzM
         18RE10tXucbIiqm9U25H8eWU7Vcv9kz9zSZbYScecn2Q8RBuWhLol51jEdsWjiR7D4Rh
         0TgqFF7Est8pT771d7wa9aVMwxtkrVDSvmD11Sx9okd1RxRGlfayDH2fXJ91RuyseJFZ
         V4Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUn3UWDMRiBhoCjNShLCO7bNXV25vU0f8Bl5Gm5i4LH47QpQCL7K3+OyGAfwLRHSk2EnZCqnsDw@lists.infradead.org
X-Gm-Message-State: AOJu0YxkB3egnlVJXXLWpyOFiewOiQZg5u4mlB0HgTlve3vZ84szZQUu
	yLuFGBM7RT9L+v9ChjMHfe8LCRLLXWH4pYhrRhvjv9t/87hAulgVt4OtvMNFHqAls/sFyFBdkpN
	oFVyg
X-Gm-Gg: ASbGncvPWBA+LSqMbMW+Fj3if/NSFtpT4+bfCyjmTH8ni0B28uoyFMpWKIjtmT/pHnA
	EDdHDiQxj7Cyu9e0YQBhC38U42cltPtBb6zA05UvTy4/QS/xAXDh4Qp7ARifRY/yBs7cdQoslPM
	IAYwqv8YaLXzFlZ3Hgfbi+HfBa1YkMn5oOhL0JuwOqq8Zm5yFMffKPNp4zhAGYG+nxxtwrFRg6x
	atLee3pZA+RaJsGFXkz6scQSnXO7Uolys83xWl4JA945iZ6D/pFJK3Nk8BJWl8pNS+H44PKQ4ZX
	srf2yqiey+4HiZz5t7U76CibAEUJJGayRz85Vgp8EAOCqF09Fr5iAEVrYt72MdlwGsbrnDImE94
	P462EaZV7zxfV2G6UArYwjXTeXmo6M1eO129DmjxKC2+fSsophoq9qLtt45ev
X-Google-Smtp-Source: AGHT+IFe7X0hbMcIXkKAB0eLxrv9TKOCfkjSD6HDXtxptLAKN9qXaySGuGpK+MsHCJIDdCpLOOGEAw==
X-Received: by 2002:a05:6000:2089:b0:3cb:d8e2:48b2 with SMTP id ffacd0b85a97d-3cbd8e24b73mr5943281f8f.13.1756362049151;
        Wed, 27 Aug 2025 23:20:49 -0700 (PDT)
Received: from smtpclient.apple (nat-184-99.net.cam.ac.uk. [131.111.184.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ce112ca0c6sm1235679f8f.15.2025.08.27.23.20.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Aug 2025 23:20:48 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v3] generic: mips: support harts to boot from
 mips_warm_boot
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <CAAhSdy2VRE_bfqhae+ZCxwH-rZnmm+uL+nfYAzTXEn=C84L80Q@mail.gmail.com>
Date: Thu, 28 Aug 2025 07:20:38 +0100
Cc: Chao-ying Fu <icebergfu@gmail.com>,
 opensbi@lists.infradead.org,
 Chao-ying Fu <cfu@mips.com>
Message-Id: <98E5DC08-1B1A-4F27-A520-4281A4C6B436@jrtc27.com>
References: <20250723204010.9927-1-cfu@mips.com>
 <CAAhSdy2VRE_bfqhae+ZCxwH-rZnmm+uL+nfYAzTXEn=C84L80Q@mail.gmail.com>
To: Anup Patel <anup@brainfault.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_232051_366186_9F27AF10 
X-CRM114-Status: GOOD (  21.50  )
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

T24gMjggQXVnIDIwMjUsIGF0IDA2OjMyLCBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3Jn
PiB3cm90ZToKPiBPbiBUaHUsIEp1bCAyNCwgMjAyNSBhdCAyOjEw4oCvQU0gQ2hhby15aW5nIEZ1
IDxpY2ViZXJnZnVAZ21haWwuY29tPiB3cm90ZToKPj4gCj4+IFdlIHByb2dyYW0gcmVzZXQgYmFz
ZSBmb3IgaGFydHMgKG90aGVyIHRoYW4gaGFydCAwKSB0byBib290IGF0Cj4+IG1pcHNfd2FybV9i
b290IHRoYXQganVtcHMgdG8gX3N0YXJ0X3dhcm0uIFRoaXMgaGVscHMgdG8gc2tpcCBzb21lIGNv
ZGUKPj4gc2VxdWVuY2UgdG8gc3BlZWQgdXAuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvLXlp
bmcgRnUgPGNmdUBtaXBzLmNvbT4KPj4gLS0tCj4+IHBsYXRmb3JtL2dlbmVyaWMvbWlwcy9taXBz
X3dhcm1fYm9vdC5TIHwgMjAgKysrKysrKysrKysrKysrKysrKysKPj4gcGxhdGZvcm0vZ2VuZXJp
Yy9taXBzL29iamVjdHMubWsgICAgICAgfCAgMiArLQo+PiBwbGF0Zm9ybS9nZW5lcmljL21pcHMv
cDg3MDAuYyAgICAgICAgICB8ICA1ICsrKysrCj4+IDMgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+PiBjcmVhdGUgbW9kZSAxMDA2NDQgcGxhdGZvcm0vZ2Vu
ZXJpYy9taXBzL21pcHNfd2FybV9ib290LlMKPj4gCj4+IGRpZmYgLS1naXQgYS9wbGF0Zm9ybS9n
ZW5lcmljL21pcHMvbWlwc193YXJtX2Jvb3QuUyBiL3BsYXRmb3JtL2dlbmVyaWMvbWlwcy9taXBz
X3dhcm1fYm9vdC5TCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAuLjI1
Y2RiODMKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9wbGF0Zm9ybS9nZW5lcmljL21pcHMvbWlw
c193YXJtX2Jvb3QuUwo+PiBAQCAtMCwwICsxLDIwIEBACj4+ICsvKgo+PiArICogU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEJTRC0yLUNsYXVzZQo+PiArICoKPj4gKyAqIENvcHlyaWdodCAoYykg
MjAyNSBNSVBTCj4+ICsgKgo+PiArICovCj4+ICsgICAgICAgLnRleHQKPj4gKyAgICAgICAuYWxp
Z24gIDEyCj4+ICsgICAgICAgLmdsb2JsICBtaXBzX3dhcm1fYm9vdAo+PiArbWlwc193YXJtX2Jv
b3Q6Cj4+ICsgICAgICAgaiAgICAgICBfc3RhcnRfd2FybQo+PiArICAgICAgIC5hbGlnbiAgMgo+
PiArbm1pX3ZlY3RvcjoKPj4gKyAgICAgICBqICAgICAgIF9zdGFydF93YXJtCj4+ICsgICAgICAg
LmFsaWduICAyCj4+ICtjYWNoZWVycl92ZWN0b3I6Cj4+ICsgICAgICAgaiAgICAgICBfc3RhcnRf
d2FybQo+PiArICAgICAgIC5hbGlnbiAgMgo+PiArZGVidWdleGNfdmVjdG9yOgo+PiArICAgICAg
IGogICAgICAgX3N0YXJ0X3dhcm0KPiAKPiBubWlfdmVjdG9yLCBjYWNoZWVycl92ZWN0b3IsIGFu
ZCBkZWJ1Z2V4Y192ZWN0b3IgYXJlIG5vdCB1c2VkCj4gYW55d2hlcmUgc28gSSBoYXZlIGRyb3Bw
ZWQgdGhlc2UgYXQgdGhlIHRpbWUgb2YgbWVyZ2luZy4gUGxlYXNlCj4gc2VuZCBzZXBhcmF0ZSBw
YXRjaGVzIHRvIGFkZCB0aGVzZSB3aGVuIHRoZXkgYXJlIGJlaW5nIHVzZWQKPiBzb21ld2hlcmUu
Cj4gCj4gUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Cj4gCj4g
QXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpVaCBJ4oCZbSBw
cmV0dHkgc3VyZSB0aGlzIGlzIGEgcmVzZXQgdmVjdG9yLCBhbmQgZWFjaCBsYWJlbCBpcyBuYW1p
bmcgdGhlCmRpZmZlcmVudCBlbnRyaWVzIGluIHRoZSB2ZWN0b3IsIG11Y2ggbGlrZSBmb3IgbXR2
ZWMuTU9ERT1WZWN0b3JlZCwgYW5kCnRoZXJlZm9yZSB0aGUgcmVzdWx0IG9mIGRlbGV0aW5nIHRo
b3NlIHZlY3RvciBlbnRyaWVzIGlzIHRoYXQsIGlmIGFueQpvZiB0aG9zZSBjYXNlcyBvY2N1ciwg
aXQgd2lsbCBlbmQgdXAgcnVubmluZyB3aGF0ZXZlciByYW5kb20gY29kZQpoYXBwZW5zIHRvIGJl
IGFmdGVyIHRoZSBmaXJzdCBlbnRyeS4KCknigJl2ZSBub3RpY2VkIHlvdSBhcmUgcXVpdGUgZWFn
ZXIgdG8gbW9kaWZ5IHBlb3BsZeKAmXMgcGF0Y2hlcyBiZWZvcmUKYXBwbHlpbmcgdGhlbS4gUmVm
b3JtYXR0aW5nIGlzIG9uZSB0aGluZywgYnV0IGRlbGV0aW5nIGFzc2VtYmx5IGNvZGUgaXMKYW5v
dGhlciB0aGF0IEkgdGhpbmsgZ29lcyB0b28gZmFyLiBQbGVhc2UgYmUgbW9yZSBjb25zaWRlcmF0
ZSBvZiB0aGUKZmFjdCB0aGF0IHlvdSBtYXkgbm90IGJlIGNvcnJlY3QgaW4geW91ciBpbnRlcnBy
ZXRhdGlvbiwgYW5kIHNvIGl0IGlzCm5vdCBhcHByb3ByaWF0ZSB0byB1bmlsYXRlcmFsbHkgY29t
bWl0IHdoYXRldmVyIHVucmV2aWV3ZWQgY2hhbmdlcyB5b3UKdGhpbmsgYXJlIGJlc3QsIGVzcGVj
aWFsbHkgd2hlbiBpdCBjb21lcyB0byB2ZW5kb3Itc3BlY2lmaWMgY29kZSBmb3IKd2hpY2ggeW91
IGhhdmVu4oCZdCByZWFkIGFueSBvZiB0aGUgY29ycmVzcG9uZGluZyBtYW51YWxzLgoKSmVzc2lj
YQoKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
