Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F4EC369C2
	for <opensbi@archiver.kernel.org>; Tue, 22 Apr 2025 04:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i/IUVdEhT+XulxAO5dCEFWeu7O7GsA65m5RvbQ8RpgY=; b=kVArK8uRaKHXlh
	Eg7QlgO2eDa7M5en/xyXnwaEPfZ6Y+ptFOA83e2GmzTS+Wq40Gs+7vyqp1OToS+EDNiHIcTKsd9my
	WW3wwui/vbMnTKVw1VsOdng6JfTcbEOa8GNkgtl3am+DKQ29/ysXPBDHEeZ/mFbm9YYckjQ62ZYos
	vP6ONkzHNn97xMNwl8+LjE2ci/I/g8cC7Im6uetqZsYIcaPe4GG//SSdoQlx8I5tivqghs8eVj/AL
	jVrAZf5jPbYyr+W7jBKrc1OGWWUs3T6M4cXtNpz65h6R146ttYbyGz9VXi1QFENB3hhjLk/XzHZ4t
	PSRFAMMN3W+IeIt6rfMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u75Tp-00000005oCh-2tq4;
	Tue, 22 Apr 2025 04:43:33 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u75Tm-00000005oCE-2oHT
	for opensbi@lists.infradead.org;
	Tue, 22 Apr 2025 04:43:32 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-85e15dc801aso403214039f.2
        for <opensbi@lists.infradead.org>; Mon, 21 Apr 2025 21:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745297009; x=1745901809; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajHXEGNXdaH74lbHqsMy+KCPzYnmgzYXcyzcVxF+yFg=;
        b=LAKoJIqlOPfj1nla/YPD7fOGI+9exsTtE/le25n03zI0zVnVSbdiaecSJWnbWDjNaq
         61IYHa5s/50h4DFKTt5IrssUuYg6mOY2F/Y3cUmKh58MIKjXm2LAbSmxIeYMJ7aQoJ7z
         f0gtchWqL3G2BzWoeblpA0dOU/NLzj7fe2ZIo+QODXUOfkjOYZy4Ccl/ECfdQQS29PHo
         H1x4vGQUWn1DGDZ3C/ftZ/VQI8GMyVCWq4LDHLC9djlAzNTa0ZWvJApYCp4ECnNnlxh8
         Z81ltg0bZh5N8F+jlqZnKGWS5HOYTRt/BFapkA897mIX6TG8QJtOVOzu697H2Utn9cvj
         2sGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745297009; x=1745901809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ajHXEGNXdaH74lbHqsMy+KCPzYnmgzYXcyzcVxF+yFg=;
        b=FhsyP8SPqswbqhycaHWnAArv2U1XmOqE1+4qtSnx5pIAYdoAj2NwHT9ziHezjfvDWn
         cObgngLRsZ4puGmz/2Ce39gnQVL0McgbBAZQYSsV94vwMvubPulcWB0B1sQL4UxLkdx3
         ILQTUgsmjv8J29QXSRQfMplpEgZB838v9IYKw4XEFJTyTzq57tlFRI36UF6QnufNdo7P
         lILgm5CI98HeImUi/8WnKRuWOnMXw0E5BaYh2rKWx5P0gl06QdCe9mX+JI7KtdiV16Vw
         936uFsmuZup1/NC3YBJe+oTGP0Si+zLOtvVq08dc4G+bHitHVqsCAPOcpGrCd4riwSDt
         ZX5A==
X-Gm-Message-State: AOJu0Yx7gDBpvEWg6SHi49PVUQpWLOVSAgk2t7VEaFMDrwCZ/KW8Z96C
	LCMZ2IFhl3mqV2WLfemcpTQsEN/ryYHSkc4JcDKNtiE63gFLG0aC1CcmULtJJ7cybydOQPffbRC
	JDAPwCjC5p0PY0TgvHJnqhCeTfxV0KHxN4JRGYj2bAcfAhphl
X-Gm-Gg: ASbGnctczmyP6U6CRDgb/uCCp58dFAaa0A6VTkvxO7pZn9ivhNrydqSFpFxds6b50IT
	pVS9uq2p6ZVAskcaYXE75EJEQVXMUV+1TUhiYjEfxUOCUbHkO0vye167YZbm4/lCbJO1PGwv9cj
	mfre/drzsneh2U5xouztYI32E=
X-Google-Smtp-Source: AGHT+IFuwOeyvRkojBi3gxAylLXVTRKZXXCJki6yS9BfyscVKYMWwr/9ywfBcdqWcy5jqdxRP34vuf1D3+Fr695W2WY=
X-Received: by 2002:a05:6e02:1987:b0:3d4:3db1:77ae with SMTP id
 e9e14a558f8ab-3d89418e3admr155820145ab.18.1745297009659; Mon, 21 Apr 2025
 21:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250325234342.711447-1-samuel.holland@sifive.com> <20250325234342.711447-2-samuel.holland@sifive.com>
In-Reply-To: <20250325234342.711447-2-samuel.holland@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 22 Apr 2025 10:13:17 +0530
X-Gm-Features: ATxdqUExuD7XZuV98m2lL9kSAwvu4K3CPMDeulh-9B4UwHmXaeHZPfKWVE40njY
Message-ID: <CAAhSdy0Jhi5nhibLLpeC3O6t0ksek6zrL-REjoVtBX8+Ngw5wg@mail.gmail.com>
Subject: Re: [PATCH 01/10] platform: generic: andes: Remove inline definitions
To: Samuel Holland <samuel.holland@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_214330_705891_F9D126E2 
X-CRM114-Status: GOOD (  14.43  )
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

T24gV2VkLCBNYXIgMjYsIDIwMjUgYXQgNToxM+KAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IFRoZSBhZGRyZXNzZXMgb2YgdGhlc2UgZnVu
Y3Rpb25zIGFyZSB1c2VkIHRvIHNldCBmdW5jdGlvbiBwb2ludGVycyBpbgo+IHN0cnVjdCBwbGF0
Zm9ybV9vdmVycmlkZSwgc28gaXQgaXMgbm90IHZhbGlkIGZvciB0aGVtIHRvIGJlIGlubGluZS4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUu
Y29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3Jn
PgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPgo+ICBwbGF0Zm9ybS9nZW5lcmljL2luY2x1ZGUvYW5k
ZXMvYW5kZXNfcG11LmggfCAxNiAtLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
NiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9wbGF0Zm9ybS9nZW5lcmljL2luY2x1ZGUv
YW5kZXMvYW5kZXNfcG11LmggYi9wbGF0Zm9ybS9nZW5lcmljL2luY2x1ZGUvYW5kZXMvYW5kZXNf
cG11LmgKPiBpbmRleCBmMzU1MzI0Ni4uYzYwMGQzNWYgMTAwNjQ0Cj4gLS0tIGEvcGxhdGZvcm0v
Z2VuZXJpYy9pbmNsdWRlL2FuZGVzL2FuZGVzX3BtdS5oCj4gKysrIGIvcGxhdGZvcm0vZ2VuZXJp
Yy9pbmNsdWRlL2FuZGVzL2FuZGVzX3BtdS5oCj4gQEAgLTExLDI0ICsxMSw4IEBACj4gICNpbmNs
dWRlIDxzYmlfdXRpbHMvZmR0L2ZkdF9oZWxwZXIuaD4KPiAgI2luY2x1ZGUgPHNiaV91dGlscy9m
ZHQvZmR0X3BtdS5oPgo+Cj4gLSNpZmRlZiBDT05GSUdfQU5ERVNfUE1VCj4gLQo+ICBpbnQgYW5k
ZXNfcG11X2luaXQoY29uc3Qgc3RydWN0IGZkdF9tYXRjaCAqbWF0Y2gpOwo+ICBpbnQgYW5kZXNf
cG11X2V4dGVuc2lvbnNfaW5pdChjb25zdCBzdHJ1Y3QgZmR0X21hdGNoICptYXRjaCwKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc2JpX2hhcnRfZmVhdHVyZXMgKmhmZWF0
dXJlcyk7Cj4KPiAtI2Vsc2UKPiAtCj4gLXN0YXRpYyBpbmxpbmUgaW50IGFuZGVzX3BtdV9pbml0
KGNvbnN0IHN0cnVjdCBmZHRfbWF0Y2ggKm1hdGNoKQo+IC17Cj4gLSAgICAgICByZXR1cm4gMDsK
PiAtfQo+IC1zdGF0aWMgaW5saW5lIGludCBhbmRlc19wbXVfZXh0ZW5zaW9uc19pbml0KGNvbnN0
IHN0cnVjdCBmZHRfbWF0Y2ggKm1hdGNoLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBzYmlfaGFydF9mZWF0dXJlcyAqaGZlYXR1cmVzKQo+IC17Cj4gLSAgICAgICByZXR1
cm4gMDsKPiAtfQo+IC0KPiAtI2VuZGlmIC8qIENPTkZJR19BTkRFU19QTVUgKi8KPiAtCj4gICNl
bmRpZiAvKiBfUklTQ1ZfQU5ERVNfUE1VX0ggKi8KPiAtLQo+IDIuNDcuMgo+Cj4KPiAtLQo+IG9w
ZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNi
aSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
