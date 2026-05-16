Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464C1CD4F21
	for <opensbi@archiver.kernel.org>; Sat, 16 May 2026 16:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EMjNmnanTjRFyBlDEvsiQLotaP2pJVIK8Lofeg9uj04=; b=CoIz41NlSc5SOA
	YC8qBEpRXoJ5gZPp8NdPDL6klJmMNYjJ5hhlpKFF3QfgyYrGY715W1XS/h7ZOg2TnMD/FodvzwgDi
	LMQi0HxZ/t5qljjhAOFpYWtZIl9f6QWcjWzA735VGScfXEilvXEhcQTk4BH2WfU4ZSKI+Oe1yLgQZ
	5F2hw9QnL0PEr/Pk8PiRaRqP0ETRmzLzOgiRs7jALYTFXHnLBjM3koIDeQJqgFSAAZ6e+cOjDRLYP
	OpOMe1ZWzaJLIFqOslhCOQV4Qs68wQK+EpgxNdFeHM+yjFouOQHsZtgVLXrJkCYBWfd9rhrqiEAm0
	50PIvF3JK29R3G7NTrOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOHRC-0000000AyvT-2Gfw;
	Sat, 16 May 2026 16:00:26 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOHR9-0000000Ayuy-28mU
	for opensbi@lists.infradead.org;
	Sat, 16 May 2026 16:00:25 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7de4e6c5a30so1263130a34.0
        for <opensbi@lists.infradead.org>; Sat, 16 May 2026 09:00:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778947221; cv=none;
        d=google.com; s=arc-20240605;
        b=Os5WoVps2eodbgI8ZykbWRuM3EudV1Gq3kHoIMpzmgOtENnkpPXZLJEGSXKgrPdxjp
         5nFA+5CtImw40/d6JeCdBjZOMyw1+Px7e9+v9UWw/klJ327eKr5XzhBazJCRD57WjzUl
         lTey+XbGbx331OndoHuDckt0GevV4zuyrpDyLTKdCRbiHkcsxILkWkphuEmiCEd3RpIg
         NVDXtiuPyc5OphlZPrAot5iyyiw+Xx1nEtVZOqaMPL52zkKwoAzB4ZNmplYZNKIziCgB
         5EFmFoJK0X+wzk6NFOZVKsMH+O3laYZvNxB8rqlBR5kWS0lP2J6BTdrWK/X2JMo91Djy
         4OEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2QnLXmfwa+JkjbIw5zBCb9yUOC3TGFotD3jw2eDhi8s=;
        fh=3i9k96BkzJZerniR5er0zvF0ts3U/Ud1M9f1swtLXIU=;
        b=X7ClC5QgJE59oMOxm/Bhbx6F/8EuL9KZjLVX6hAE3m7oGUlide+wyVCW6dclR3Axl6
         kvRbN1vz5p7H/2Wk0K2st/OgqDMlLzym2VWzjkWMxNP2J0DWbH+iMtFw01S4eG4R5q2G
         sBcakZgpHduOW42WL4M7iLg6n9RK7xxHx03ZYGwlmzvw8uayiqKfCaBbdYaamUu4qwWA
         ZuOVj4n/eEhy0O2/CKaKY+nS5JEc5P3h+lzfNMLqqlSOoGpqW5C+LLtQHa8ONRqt95xO
         ztJmwS4x/k4OHvtS7w14YsyiR1O3KmhoyNxtY3APPqs72CNyEk24QlSAd8fgfnF5HSnW
         cYWA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778947221; x=1779552021; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2QnLXmfwa+JkjbIw5zBCb9yUOC3TGFotD3jw2eDhi8s=;
        b=MvjH6DRo0Qfwe7Kx8yM1ppaZyAHEotvY3xEpvC3wDcPo2verWON/uqRbgR3rRP1uAo
         ALS3t4PkZ9hHoT7EV03vKfLGrX7ATip0Rxg8EuMmWJ49+FXnUAJo0vpBLRN/DOEQUML0
         nlA/CiSme5JZjtfqoVwNfGA0vE49DsrIDXPXoN0JTNcAe8xNByuvYnloLBw1kForo7eb
         /TuIGMz7fDWdc86+NoNFMk25bpq8gm1A2toXSd/F2m0zh6VjEOz83SjeA4q9Q7Esx19E
         xtdvOEFzx8O3Hd5f2Y86MR9/hPe2siEt+SVLM2RFHEBix3AgAFv5AcxbCcyULmCZHJcP
         ojHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778947221; x=1779552021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2QnLXmfwa+JkjbIw5zBCb9yUOC3TGFotD3jw2eDhi8s=;
        b=M3IrLETeS3q7gPCJx4jbrr5rRSUo5+TFeevRm11oXFhYsLCDzgk+z6Epz1KmCfcN8R
         ZWzNEYw8d5UeuQB8lSPY6//JqTFpkRWOyHIs8YI8WlEkBp9MlFLDLkBdhypC4m0rsgMX
         U/W6Hz4gC2IryITvwfy8faaU7bljtB4NgGYZ/kxSMtYs/vuPA1Fwz2skImlpTZWwfDu7
         L9NzJTOyBfyJ0E/1lasR6xU6fx+e7YA+rjh7VQYjrnpT5FeYao/7TraUy9ZUDJ8qE+sz
         HtsxviyKfraTBpUr/PGFFw1uBQ5c3KKG56r8Wpw+B61J0Y+Isgf6+MCRRnnB6aArCQYN
         TmnA==
X-Forwarded-Encrypted: i=1; AFNElJ+i1oPzbrY70nSwbPrFUQ5bemRydBes0a/FRHmxjhnjq5Mr6Qk5Z/gQydEKKkkAtZiAWH0joUgK@lists.infradead.org
X-Gm-Message-State: AOJu0YzgCI8ckPBxRwcLQZeFXnueej3duZKCvUOUbQJhcuLt0mrMUkeR
	KQGYb+1tN/i7ZXgpKR0CPl/BSdV5i/h23qxQSFmE+PEWgkkG4D4bqoec8MRaubu0WuTDX+LVJP/
	Xrk+JCEhbybWgGwyzlC69I8v9lBoHucgbb7gEB8Z2Cg==
X-Gm-Gg: Acq92OHXWpZZTYRH61nPaugU24K/lhzpTTwyD5lI3roVQKYuYhJ/OSwXGLDGhjDjsvB
	luGElNv852Je7EVcKRpDDL1ZOtQCNFO0Z1WucInJSsOAkXbLmTFdWHG3hkKDww0FngJRA+R1Cb8
	UXGDCu8orI50Jts/KofmSpeCfXnJxN5ng6oAX3Ba/OyoNYCB9eEWqNSgyfzo/9xkuSC17lpIFXZ
	3OhNQgV66mJ3BRTryOeiUzcA/S3PBboXpLiplXSMMQUwogTTw5bHAqQ8Rr9UoBBIeW9c4LctrNE
	PxCaNC9uUuNFftPTaW728nbG+X0nSnpT7FBbw2zTK8IUv06gXkGkQ4ianBMqyfWdE2hYFKf53UH
	4jMLBkvFBCbIf/ugDA2FDCPr4hQ==
X-Received: by 2002:a05:6820:1625:b0:694:9d3d:e040 with SMTP id
 006d021491bc7-69c94367940mr5202926eaf.31.1778947221430; Sat, 16 May 2026
 09:00:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260515054208.151045-1-dave.patel@riscstar.com>
 <20260515054208.151045-2-dave.patel@riscstar.com> <CAAhSdy3vOWOYd=nim8kzc6mZFBVBJmu-52Gw-mg8rKsfPF3Z7A@mail.gmail.com>
 <7c06e1b8-8c42-4dcc-ac68-066a5bc6d567@riscstar.com>
In-Reply-To: <7c06e1b8-8c42-4dcc-ac68-066a5bc6d567@riscstar.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 16 May 2026 21:30:10 +0530
X-Gm-Features: AVHnY4Ltpsx1qYEBzyIAo8FijJ4aJ2jjjLYixfSIlVz6qKw14PqHw3CzpTIGBVw
Message-ID: <CAAhSdy2wJTHCP+gUKHjfS4Xn=m7TYyy6rpO5Xq9nvbiyoPJSwA@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] lib: sbi: Add RISC-V vector context save/restore support
To: Dave Patel <dave.patel@riscstar.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Anup Patel <anuppate@qti.qualcomm.com>, 
	Scott Bambrough <scott@riscstar.com>, Robin Randhawa <robin.randhawa@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Ray Mao <raymond.mao@riscstar.com>, 
	Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_090023_730224_D24744CD 
X-CRM114-Status: GOOD (  30.51  )
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

T24gU2F0LCBNYXkgMTYsIDIwMjYgYXQgMzo1M+KAr1BNIERhdmUgUGF0ZWwgPGRhdmUucGF0ZWxA
cmlzY3N0YXIuY29tPiB3cm90ZToKPgo+IE9uIDUvMTUvMjYgMDg6NDEsIEFudXAgUGF0ZWwgd3Jv
dGU6Cj4gPiBPbiBGcmksIE1heSAxNSwgMjAyNiBhdCAxMToxMuKAr0FNIDxkYXZlLnBhdGVsQHJp
c2NzdGFyLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiBGcm9tOiBEYXZlIFBhdGVsIDxkYXZlLnBhdGVs
QHJpc2NzdGFyLmNvbT4KPiA+Pgo+ID4+IEVhZ2VyIGNvbnRleHQgc3dpdGNoOiBBZGQgc3VwcG9y
dCBmb3Igc2F2aW5nIGFuZCByZXN0b3JpbmcgUklTQy1WIHZlY3Rvcgo+ID4+IGV4dGVuc2lvbiBz
dGF0ZSBpbiBPcGVuU0JJLiBUaGlzIGludHJvZHVjZXMgYSBwZXItaGFydCB2ZWN0b3IgY29udGV4
dAo+ID4+IHN0cnVjdHVyZSBhbmQgaGVscGVyIHJvdXRpbmVzIHRvIHBlcmZvcm0gZnVsbCBjb250
ZXh0IHNhdmUgYW5kIHJlc3RvcmUuCj4gPj4KPiA+PiBUaGUgdmVjdG9yIGNvbnRleHQgaW5jbHVk
ZXMgdmNzciBDU1JzIGFsb25nIHdpdGggc3RvcmFnZSBmb3IgYWxsIDMyIHZlY3Rvcgo+ID4+IHJl
Z2lzdGVycy4gVGhlIHJlZ2lzdGVyIHN0YXRlIGlzIHNhdmVkIGFuZCByZXN0b3JlZCB1c2luZyBi
eXRlLXdpc2UgdmVjdG9yCj4gPj4gbG9hZC9zdG9yZSBpbnN0cnVjdGlvbnMgKHZzOHIvdmw4ciku
Cj4gPj4KPiA+PiBUaGUgaW1wbGVtZW50YXRpb24gZm9sbG93cyBhbiBlYWdlciBjb250ZXh0IHN3
aXRjaGluZyBtb2RlbCB3aGVyZSB0aGUgZW50aXJlCj4gPj4gdmVjdG9yIHN0YXRlIGlzIHNhdmVk
IGFuZCByZXN0b3JlZCBvbiBldmVyeSBjb250ZXh0IHN3aXRjaC4gVGhpcyBwcm92aWRlcyBhCj4g
Pj4gc2ltcGxlIGFuZCBkZXRlcm1pbmlzdGljIG1lY2hhbmlzbSB3aXRob3V0IHJlcXVpcmluZyBs
YXp5IHRyYXAtYmFzZWQKPiA+PiBtYW5hZ2VtZW50Lgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTog
RGF2ZSBQYXRlbCA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20+Cj4gPj4gLS0tCj4gPj4gIGluY2x1
ZGUvc2JpL3NiaV92ZWN0b3IuaCB8ICAyOCArKysrKysrKysrCj4gPj4gIGxpYi9zYmkvb2JqZWN0
cy5tayAgICAgICB8ICAgMSArCj4gPj4gIGxpYi9zYmkvc2JpX3ZlY3Rvci5jICAgICB8IDEwOSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+PiAgMyBmaWxlcyBjaGFu
Z2VkLCAxMzggaW5zZXJ0aW9ucygrKQo+ID4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9z
Ymkvc2JpX3ZlY3Rvci5oCj4gPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIvc2JpL3NiaV92ZWN0
b3IuYwo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV92ZWN0b3IuaCBiL2lu
Y2x1ZGUvc2JpL3NiaV92ZWN0b3IuaAo+ID4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPj4gaW5k
ZXggMDAwMDAwMDAuLmJiZDg1N2MzCj4gPj4gLS0tIC9kZXYvbnVsbAo+ID4+ICsrKyBiL2luY2x1
ZGUvc2JpL3NiaV92ZWN0b3IuaAo+ID4+IEBAIC0wLDAgKzEsMjggQEAKPiA+PiArLyoKPiA+PiAr
ICogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEJTRC0yLUNsYXVzZQo+ID4+ICsgKgo+ID4+ICsg
KiBDb3B5cmlnaHQgKGMpIDIwMjYgUklTQ3N0YXIgU29sdXRpb25zLgo+ID4+ICsgKgo+ID4+ICsg
KiBBdXRob3JzOgo+ID4+ICsgKiAgIERhdmUgUGF0ZWwgPGRhdmUucGF0ZWxAcmlzY3N0YXIuY29t
Pgo+ID4+ICsgKi8KPiA+PiArCj4gPj4gKyNpZm5kZWYgX19TQklfVkVDVE9SX0hfXwo+ID4+ICsj
ZGVmaW5lIF9fU0JJX1ZFQ1RPUl9IX18KPiA+PiArCj4gPj4gKyNpbmNsdWRlIDxzYmkvc2JpX3R5
cGVzLmg+Cj4gPj4gKwo+ID4+ICtzdHJ1Y3Qgc2JpX3ZlY3Rvcl9jb250ZXh0IHsKPiA+PiArICAg
ICAgIHVuc2lnbmVkIGxvbmcgdmNzcjsKPiA+PiArICAgICAgIHVuc2lnbmVkIGxvbmcgdnN0YXJ0
Owo+ID4+ICsKPiA+PiArICAgICAgIC8qIHNpemUgZGVwZW5kcyBvbiBWTEVOICovCj4gPj4gKyAg
ICAgICB1aW50OF90IHZyZWdzW107Cj4gPj4gK307Cj4gPj4gKwo+ID4+ICt2b2lkIHNiaV92ZWN0
b3Jfc2F2ZShzdHJ1Y3Qgc2JpX3ZlY3Rvcl9jb250ZXh0ICpkc3QpOwo+ID4+ICt2b2lkIHNiaV92
ZWN0b3JfcmVzdG9yZShjb25zdCBzdHJ1Y3Qgc2JpX3ZlY3Rvcl9jb250ZXh0ICpzcmMpOwo+ID4+
ICt1bnNpZ25lZCBsb25nIHZlY3Rvcl92bGVuYih2b2lkKTsKPiA+PiArCj4gPj4gKyNlbmRpZiAv
L19fU0JJX1ZFQ1RPUl9IX18KPiA+PiArCj4gPj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvb2JqZWN0
cy5tayBiL2xpYi9zYmkvb2JqZWN0cy5tawo+ID4+IGluZGV4IDk3Y2M0NTIxLi5kZGIyZTdhYyAx
MDA2NDQKPiA+PiAtLS0gYS9saWIvc2JpL29iamVjdHMubWsKPiA+PiArKysgYi9saWIvc2JpL29i
amVjdHMubWsKPiA+PiBAQCAtMTA5LDMgKzEwOSw0IEBAIGxpYnNiaS1vYmpzLXkgKz0gc2JpX3Ry
YXBfdl9sZHN0Lm8KPiA+PiAgbGlic2JpLW9ianMteSArPSBzYmlfdW5wcml2Lm8KPiA+PiAgbGli
c2JpLW9ianMteSArPSBzYmlfZXhwZWN0ZWRfdHJhcC5vCj4gPj4gIGxpYnNiaS1vYmpzLXkgKz0g
c2JpX2NwcGMubwo+ID4+ICtsaWJzYmktb2Jqcy15ICs9IHNiaV92ZWN0b3Iubwo+ID4+IGRpZmYg
LS1naXQgYS9saWIvc2JpL3NiaV92ZWN0b3IuYyBiL2xpYi9zYmkvc2JpX3ZlY3Rvci5jCj4gPj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+PiBpbmRleCAwMDAwMDAwMC4uMWQyYWM5NDQKPiA+PiAt
LS0gL2Rldi9udWxsCj4gPj4gKysrIGIvbGliL3NiaS9zYmlfdmVjdG9yLmMKPiA+PiBAQCAtMCww
ICsxLDEwOSBAQAo+ID4+ICsvKgo+ID4+ICsgKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogQlNE
LTItQ2xhdXNlCj4gPj4gKyAqCj4gPj4gKyAqIENvcHlyaWdodCAoYykgMjAyNiBSSVNDc3RhciBT
b2x1dGlvbnMuCj4gPj4gKyAqCj4gPj4gKyAqIEF1dGhvcnM6Cj4gPj4gKyAqICAgICAgRGF2ZSBQ
YXRlbCA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20+Cj4gPj4gKyAqLwo+ID4+ICsKPiA+PiArI2lu
Y2x1ZGUgPHNiaS9zYmlfZG9tYWluLmg+Cj4gPj4gKyNpbmNsdWRlIDxzYmkvcmlzY3ZfZW5jb2Rp
bmcuaD4KPiA+PiArI2luY2x1ZGUgPHNiaS9yaXNjdl9hc20uaD4KPiA+PiArI2luY2x1ZGUgPHNi
aS9zYmlfdmVjdG9yLmg+Cj4gPj4gKyNpbmNsdWRlIDxzYmkvc2JpX3R5cGVzLmg+Cj4gPj4gKyNp
bmNsdWRlIDxzYmkvc2JpX2hhcnQuaD4KPiA+PiArI2luY2x1ZGUgPHNiaS9zYmlfZXJyb3IuaD4K
PiA+PiArI2luY2x1ZGUgPHNiaS9zYmlfY29uc29sZS5oPgo+ID4+ICsKPiA+PiArI2lmZGVmIE9Q
RU5TQklfQ0NfU1VQUE9SVF9WRUNUT1IKPiA+PiArCj4gPj4gK3Vuc2lnbmVkIGxvbmcgdmVjdG9y
X3ZsZW5iKHZvaWQpCj4gPj4gK3sKPiA+PiArICAgICAgIHVuc2lnbmVkIGxvbmcgdmxlbmIgPSAw
Owo+ID4+ICsKPiA+PiArICAgICAgIGFzbSB2b2xhdGlsZSAoCj4gPj4gKyAgICAgICAgICAgICAg
ICIub3B0aW9uIHB1c2hcblx0Igo+ID4+ICsgICAgICAgICAgICAgICAiLm9wdGlvbiBhcmNoLCAr
dlxuXHQiCj4gPj4gKyAgICAgICAgICAgICAgICJjc3JyICUwLCB2bGVuYlxuXHQiCj4gPj4gKyAg
ICAgICAgICAgICAgICIub3B0aW9uIHBvcFxuXHQiCj4gPj4gKyAgICAgICAgICAgICAgIDogIj1y
Iih2bGVuYikKPiA+PiArICAgICAgICAgICAgICAgOgo+ID4+ICsgICAgICAgICAgICAgICA6ICJt
ZW1vcnkiKTsKPiA+PiArCj4gPj4gKyAgICAgICByZXR1cm4gdmxlbmI7Cj4gPj4gK30KPiA+PiAr
Cj4gPj4gK3ZvaWQgc2JpX3ZlY3Rvcl9zYXZlKHN0cnVjdCBzYmlfdmVjdG9yX2NvbnRleHQgKmRz
dCkKPiA+PiArewo+ID4+ICsgICAgICAgaWYgKCFkc3QpCj4gPj4gKyAgICAgICAgICAgICAgIHJl
dHVybjsKPiA+PiArCj4gPj4gKyAgICAgICAvKiBTdGVwIDE6IFNhdmUgQ1NScyAqLwo+ID4+ICsg
ICAgICAgZHN0LT52Y3NyID0gY3NyX3JlYWQodmNzcik7Cj4gPj4gKyAgICAgICBkc3QtPnZzdGFy
dCA9IGNzcl9yZWFkKHZzdGFydCk7Cj4gPj4gKwo+ID4+ICsgICAgICAgdWxvbmcgdmxlbmIgPSB2
ZWN0b3JfdmxlbmIoKTsKPiA+PiArICAgICAgIHVpbnQ4X3QgKmJhc2UgPSBkc3QtPnZyZWdzOwo+
ID4+ICsKPiA+PiArICAgICAgIC8qIFN0ZXAgMzogU2F2ZSB2ZWN0b3IgcmVnaXN0ZXJzICovCj4g
Pj4gKyNkZWZpbmUgU0FWRV9WUkVHKGkpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiA+PiArICAgICAgICh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4+ICsgICAgICAgYXNtIHZvbGF0aWxlKCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPj4gKyAgICAgICAgICAg
ICAgICIgICAgICAgLm9wdGlvbiBwdXNoXG5cdCIgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+
PiArICAgICAgICAgICAgICAgIiAgICAgICAub3B0aW9uIGFyY2gsICt2XG5cdCIgICAgICAgICAg
ICAgICAgICAgXAo+ID4+ICsgICAgICAgICAgICAgICAiICAgICAgIHZzOHIudiB2IiAjaSAiLCAo
JTApXG5cdCIgICAgICAgICAgICAgICBcCj4gPj4gKyAgICAgICAgICAgICAgICIgICAgICAgLm9w
dGlvbiBwb3Bcblx0IiAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+PiArICAgICAgICAgICAg
ICAgOjogICAgICAiciIoYmFzZSArIChpKSAqIHZsZW5iKSA6ICJtZW1vcnkiKTsgICAgXAo+ID4+
ICsgICAgICAgfSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gPj4gKwo+ID4+ICsgICAgICAgU0FWRV9WUkVHKDApOwo+ID4+ICsgICAgICAg
U0FWRV9WUkVHKDgpOwo+ID4+ICsgICAgICAgU0FWRV9WUkVHKDE2KTsKPiA+PiArICAgICAgIFNB
VkVfVlJFRygyNCk7Cj4gPgo+ID4gU2FtZSBpc3N1ZSBhcyBGUCBzYXZlL3Jlc3RvcmUsIHRoaXMg
d2lsbCB0cmFwIGFuZCBjcmFzaAo+ID4gaWYgVmVjdG9yIGlzIGRpc2FibGVkIGluIG1zdGF0dXMu
VlMuCj4gPgo+ID4gRm9yIGNvcnJlY3QgaW1wbGVtZW50YXRpb24sIHJlZmVyIF9fcmlzY3Zfdl92
c3RhdGVfc2F2ZSgpL3Jlc3RvcmUoKQo+ID4gZnJvbSA8bGludXhfc291cmNlPi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCj4gPgo+ID4+ICsKPiA+PiArI3VuZGVmIFNBVkVfVlJFRwo+
ID4+ICt9Cj4gPj4gKwo+ID4+ICt2b2lkIHNiaV92ZWN0b3JfcmVzdG9yZShjb25zdCBzdHJ1Y3Qg
c2JpX3ZlY3Rvcl9jb250ZXh0ICpzcmMpCj4gPj4gK3sKPiA+PiArICAgICAgIGlmICghc3JjKQo+
ID4+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4gPj4gKwo+ID4+ICsgICAgICAgY29uc3QgdWlu
dDhfdCAqYmFzZSA9IHNyYy0+dnJlZ3M7Cj4gPj4gKyAgICAgICB1bG9uZyB2bGVuYiA9IHZlY3Rv
cl92bGVuYigpOwo+ID4+ICsKPiA+PiArICAgICAgIC8qIFN0ZXAgMjogUmVzdG9yZSB2ZWN0b3Ig
cmVnaXN0ZXJzICovCj4gPj4gKyNkZWZpbmUgUkVTVE9SRV9WUkVHKGkpICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+PiArICAgICAgICh7ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4+ICsgICAgICAgYXNt
IHZvbGF0aWxlKCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4g
Pj4gKyAgICAgICAgICAgICAgICIgICAgICAgLm9wdGlvbiBwdXNoXG5cdCIgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiA+PiArICAgICAgICAgICAgICAgIiAgICAgICAub3B0aW9uIGFyY2gsICt2
XG5cdCIgICAgICAgICAgICAgICAgICAgXAo+ID4+ICsgICAgICAgICAgICAgICAiICAgICAgIHZs
OHIudiB2IiAjaSAiLCAoJTApXG5cdCIgICAgICAgICAgICAgICBcCj4gPj4gKyAgICAgICAgICAg
ICAgICIgICAgICAgLm9wdGlvbiBwb3Bcblx0IiAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+
PiArICAgICAgICAgICAgICAgOjogICAgICAiciIoYmFzZSArIChpKSAqIHZsZW5iKSA6ICJtZW1v
cnkiKTsgICAgXAo+ID4+ICsgICAgICAgIH0pICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCj4gPj4gKwo+ID4+ICsgICAgICAgUkVTVE9SRV9WUkVH
KDApOwo+ID4+ICsgICAgICAgUkVTVE9SRV9WUkVHKDgpOwo+ID4+ICsgICAgICAgUkVTVE9SRV9W
UkVHKDE2KTsKPiA+PiArICAgICAgIFJFU1RPUkVfVlJFRygyNCk7Cj4gPj4gKyN1bmRlZiBSRVNU
T1JFX1ZSRUcKPiA+PiArCj4gPj4gKyAgICAgICAvKiBTdGVwIDM6IFJlc3RvcmUgQ1NSJ3MgbGFz
dCAqLwo+ID4+ICsgICAgICAgLyogUmVzdG9yZSBDU1JzIGZpcnN0ICovCj4gPj4gKyAgICAgICBj
c3Jfd3JpdGUodmNzciwgICBzcmMtPnZjc3IpOwo+ID4+ICsgICAgICAgY3NyX3dyaXRlKHZzdGFy
dCwgc3JjLT52c3RhcnQpOwo+ID4+ICt9Cj4gPj4gKwo+ID4+ICsjZWxzZQo+ID4+ICsKPiA+PiAr
dm9pZCBzYmlfdmVjdG9yX3NhdmUoc3RydWN0IHNiaV92ZWN0b3JfY29udGV4dCAqZHN0KQo+ID4+
ICt7Cj4gPj4gK30KPiA+PiArCj4gPj4gK3ZvaWQgc2JpX3ZlY3Rvcl9yZXN0b3JlKGNvbnN0IHN0
cnVjdCBzYmlfdmVjdG9yX2NvbnRleHQgKnNyYykKPiA+PiArewo+ID4+ICt9Cj4gPj4gKwo+ID4+
ICsjZW5kaWYgLyogT1BFTlNCSV9DQ19TVVBQT1JUX1ZFQ1RPUiAqLwo+ID4+IC0tCj4gPj4gMi40
My4wCj4gPj4KPiA+Pgo+ID4+IC0tCj4gPj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiA+PiBvcGVu
c2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKPiA+Cj4gPiBSZWdhcmRzLAo+ID4gQW51cAo+Cj4gSGkg
QW51cCwKPiAgICAgICAgIEZpcnN0bHkgdGhhbmtzIGZvciBhbGwgeW91ciByZXZpZXcgY29tbWVu
dHMsIEkgaGF2ZSBlbmRlYXZvciB0bwo+IGNvdmVyIGFsbCBvZiB0aGVtLCBzbyBwbGVhc2UgY29u
ZmlybS4KPgo+IFJnYXJkaW5nIHRoaXMgY29tbWVudCBvZiBtc3RhdHVzLlZTIGFuZCBGUyAoSSB0
aGluayB3aGljaCBpbmNsdWRlcyAzCj4gY29tbWVudHMpCj4KPiBJIGhhdmUgYWxyZWFkeSBoYXZl
IGNvZGUgaW5wbGFjZSBpbiBwYXRjaCAzLCBwbGVhc2Ugc2VlIGJlbG93IGxpbmUgZnJvbQo+IHBh
dGNoIDMKPgo+ICsgICAgICAgLyogTWFrZSBzdXJlIEZTIGFuZCBWUyBpcyBvbiBiZWZvcmUgY29u
dGV4dCBzd2l0Y2ggKi8KPgo+ICsgICAgICAgY3NyX3NldChDU1JfTVNUQVRVUywgTVNUQVRVU19G
UyB8IE1TVEFUVVNfVlMpOwoKU2V0dGluZyBtc3RhdHVzLkZTIGFuZCBtc3RhdHVzLlZTIGluIHN3
aXRjaF90b19uZXh0X2RvbWFpbl9jb250ZXh0KCkKbWVhbnMgeW91IGZsb2F0aW5nIGFuZCB2ZWN0
b3JlIHNhdmUvcmVzdG9yZSBpcyBub3Qgc2VsZiBjb250YWluZWQgYW5kCmV4cGVjdGluZyB0aGUg
Y2FsbGluZyBmdW5jdGlvbiB0byBzZXR1cCBtc3RhdHVzLkZTIGFuZCBtc3RhdHVzLlZTLgoKCj4K
PiBTaW5jZSB0aGUgY29udGV4dCBvZiBGbG9hdGluZyBhbmQgVmVjdG9yIGlzIG1vcmUgZ3JhbnVs
YXIgaW4gT3BlbnNiaSBJCj4gdGhvdWdodCBvZiBoYW5kbGUgaW4gY29udGV4dCBzd2l0Y2guCj4K
PiBTbyB0aGVyZSBpcyBubyBpc3N1ZSBvZiB0cmFwIGFuZCBjcmFzaCwgaG93ZXZlciB0aGVyZSBp
cyBzdGlsbCBhCj4gcXVlc3Rpb24gcmVnYXJkaW5nIGlmIHlvdSBhcmUgZmluZSB3aXRoIHRoaXMg
b3IgeW91IHdhbnQgaXQgbW9yZSBmaW5lCj4gZ3JhaW5lZCBpbnNpZGUgaXRzIGluZGl2aWR1YWwg
ZnVuY3Rpb25zPwo+CgpJIHdvdWxkIGluc2lzdCB0byBrZWVwIHRoZSBmbG9hdCBhbmQgdmVjdG9y
IHNhdmUvcmVzdG9yZSBjb2RlCmFsaWduZWQgd2l0aCBMaW51eCBzb3VyY2VzLgoKUmVnYXJkcywK
QW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
