Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EE6C369CB
	for <opensbi@archiver.kernel.org>; Wed, 23 Apr 2025 03:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dzpZLR9AR68UyN8L1nJlWPsNViRU4u1GUUq7wsv/mF8=; b=DO761pyGXDZi/S
	hyDFK3bRHIyIYg5RJDKep9O6UrwZflcFBwRF8pL8Nu6OacZfqJfBkxQrsvsx1O1OLwJwmLllGdwal
	1y81s/I5bR5PGle4XErvvwb0P7NOpvlP5etxqFahUwbAlk5c2vIw2m267GXCweEj0TZxpCCtK+RU+
	kcfPHetJGILGqgFGKuUOrJ0E7ht62+x7CCKWAd1mlvK8637ii4LCMSSYGwn2Au608/TPtvgM93Tfu
	GajCHYxAWrLcLcqzFr8Lfa2OTKNci1d4HTmTUsiP+OMc7JXK7q/Nr5jwW6zTbAYUGNMdPjkE9i4lr
	4NRq++s+suliSTpBvBCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7RDs-000000099P6-1Uwg;
	Wed, 23 Apr 2025 03:56:32 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7RDp-000000099Oe-48zi
	for opensbi@lists.infradead.org;
	Wed, 23 Apr 2025 03:56:31 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3d81768268dso46761845ab.3
        for <opensbi@lists.infradead.org>; Tue, 22 Apr 2025 20:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745380588; x=1745985388; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPcQ+6zmDBBraqbzAwH6GxDyvC7duGPgF5nTUVuzln4=;
        b=iuqerlMcP02vvQv8XV7JN4aahDfDPUzJYP/10CxoV2hsHdtVJhNX3RDVNU5c9WeLRk
         qSZTouDXf6kR08oW1dZUU/MljFZ6x7o7s9T4e1tYbarrHObo1zZOrlsqdqCuFt42XqFA
         XJFcoDF4AfSdDm8ffQJ9YgCkoSzgLx+b5JUUVKJPYj68JdE7DUQXVq27oXl8DDCN11bY
         /q/rionek2E7lVX01HTse3QoTm8QlkSOwbltvUbBRhEgI7OFsubIg7nwR7AZINGUU0KA
         19gK4bhNNHhu0rWNPCKr0p2preRRJXpk5/cJMWfh+qVyBH/vlIL3NogKprJSimICD1Gi
         yu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745380588; x=1745985388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPcQ+6zmDBBraqbzAwH6GxDyvC7duGPgF5nTUVuzln4=;
        b=GNK5Yks2Xe2FIzdH6bn/t1pPVQsRpOvLJIT1vStI4i8L+QemZfMb15bR91chzKRSc+
         Hkd1c4yR06KPrSvnppwtKV1+KUSJB+/TXSXwzGZ8bhK8eJ9qwktHHWw/7Qt5d5IzA7Ub
         lY9Rn0ZX+4kFd7GDdcKblRm8aEK+nEUg3S7aWawI/COfUlb9DlOM4KXzfSyAQlYJtNOf
         GoYQTwxPtnWBBPgRAtJsgAo1iQgdS/fZTDLNaRkjFQViCpGoVHA5KQrmcmf4OFgomkd3
         ceigeI15sWtYl2nxysQh7WmPLax3SIOUrNDL6qXbMrdm2RT5YxcJyIMhmrB68o+IowtF
         lKLA==
X-Gm-Message-State: AOJu0YyCPvOa9mGYv6YYoFZMfbknzPFR/xHnYPjkzMsapKWf/iUX5Z6m
	5AB5zEKmqGPP+c2yaqvn9T9wi2ofRfh67hG0b2EuZFtmzXD5PmFUoki9yCKj+qkgWqe45X16SEB
	kR2p1OERsk8DOY2K+7JuSlB8M/ttW8CS4sT/N5Fmhd0uAg31z
X-Gm-Gg: ASbGncs5WPwXGu4fj2/tkFmzNli5yerzriey8JIvpAfRl4D6WHKgKZJeQS3ODCKIM52
	vg46m1lw4Ocr8mll1ANXazPtvHSlFwF813SB0x8jRUfcRlmVF8roLGxYaq0fIjdUHmyiaJlcgt5
	5hFcheIaJGSNS/VLelO4rqG1E=
X-Google-Smtp-Source: AGHT+IEARGL36UtvZl/C0Ek5vs2fPR61VcHs6lFejV77rA5BjycWexkyUPncRofXgYRPyEWCPXUxD3Z7qv99MZtBSWc=
X-Received: by 2002:a05:6e02:2588:b0:3d5:df21:8481 with SMTP id
 e9e14a558f8ab-3d88904747fmr173351825ab.0.1745380588195; Tue, 22 Apr 2025
 20:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250325234342.711447-1-samuel.holland@sifive.com> <20250325234342.711447-9-samuel.holland@sifive.com>
In-Reply-To: <20250325234342.711447-9-samuel.holland@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 23 Apr 2025 09:26:17 +0530
X-Gm-Features: ATxdqUEUDGwXwzV2slj_ZLuI084xvNRjmrmXy8bQ9i1uMkPnGGud9AU83Qqm_uA
Message-ID: <CAAhSdy1UEQtOFririrEpoZOt72NiygJr5X7Ufs2snRtoxLt6OA@mail.gmail.com>
Subject: Re: [PATCH 08/10] platform: generic: Initialize overrides with fdt_driver
To: Samuel Holland <samuel.holland@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_205630_307963_B3B72D13 
X-CRM114-Status: GOOD (  16.44  )
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
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEluIGFkZGl0aW9uIHRvIGRlZHVwbGljYXRp
bmcgdGhlIGNvZGUsIHRoaXMgYWxzbyBpbXByb3ZlcyB0aGUgbWF0Y2gKPiBzZWxlY3Rpb24gbG9n
aWMgdG8gcmVzcGVjdCB0aGUgcHJpb3JpdHkgb3JkZXIgb2YgdGhlIGNvbXBhdGlibGUgc3RyaW5n
cywKPiBhcyBpbXBsZW1lbnRlZCBpbiBjb21taXQgMGZmZTI2NWZkOTY5ICgibGliOiB1dGlscy9m
ZHQ6IFJlc3BlY3QKPiBjb21wYXRpYmxlIHN0cmluZyBmYWxsYmFjayBwcmlvcml0eSIpLgo+Cj4g
U2lnbmVkLW9mZi1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+
CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpS
ZWdhcmRzLApBbnVwCgo+IC0tLQo+Cj4gIHBsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYyB8IDI3
ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDI2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2dlbmVyaWMv
cGxhdGZvcm0uYyBiL3BsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYwo+IGluZGV4IDE5NTY2ZTY5
Li4wNDQ0OGQ3MSAxMDA2NDQKPiAtLS0gYS9wbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMKPiAr
KysgYi9wbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMKPiBAQCAtMzMsMzEgKzMzLDYgQEAKPiAg
LyogTGlzdCBvZiBwbGF0Zm9ybSBvdmVycmlkZSBtb2R1bGVzIGdlbmVyYXRlZCBhdCBjb21waWxl
IHRpbWUgKi8KPiAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBmZHRfZHJpdmVyICpjb25zdCBwbGF0Zm9y
bV9vdmVycmlkZV9tb2R1bGVzW107Cj4KPiAtc3RhdGljIHZvaWQgZndfcGxhdGZvcm1fbG9va3Vw
X3NwZWNpYWwoY29uc3Qgdm9pZCAqZmR0LCBpbnQgcm9vdF9vZmZzZXQpCj4gLXsKPiAtICAgICAg
IGNvbnN0IHN0cnVjdCBmZHRfZHJpdmVyICpwbGF0Owo+IC0gICAgICAgY29uc3Qgc3RydWN0IGZk
dF9tYXRjaCAqbWF0Y2g7Cj4gLSAgICAgICBpbnQgcG9zLCByYzsKPiAtCj4gLSAgICAgICBmb3Ig
KHBvcyA9IDA7IHBsYXRmb3JtX292ZXJyaWRlX21vZHVsZXNbcG9zXTsgcG9zKyspIHsKPiAtICAg
ICAgICAgICAgICAgcGxhdCA9IHBsYXRmb3JtX292ZXJyaWRlX21vZHVsZXNbcG9zXTsKPiAtICAg
ICAgICAgICAgICAgaWYgKCFwbGF0LT5tYXRjaF90YWJsZSkKPiAtICAgICAgICAgICAgICAgICAg
ICAgICBjb250aW51ZTsKPiAtCj4gLSAgICAgICAgICAgICAgIG1hdGNoID0gZmR0X21hdGNoX25v
ZGUoZmR0LCByb290X29mZnNldCwgcGxhdC0+bWF0Y2hfdGFibGUpOwo+IC0gICAgICAgICAgICAg
ICBpZiAoIW1hdGNoKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+IC0KPiAt
ICAgICAgICAgICAgICAgaWYgKHBsYXQtPmluaXQpIHsKPiAtICAgICAgICAgICAgICAgICAgICAg
ICByYyA9IHBsYXQtPmluaXQoZmR0LCByb290X29mZnNldCwgbWF0Y2gpOwo+IC0gICAgICAgICAg
ICAgICAgICAgICAgIGlmIChyYykKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnRpbnVlOwo+IC0gICAgICAgICAgICAgICB9Cj4gLQo+IC0gICAgICAgICAgICAgICBicmVhazsK
PiAtICAgICAgIH0KPiAtfQo+IC0KPiAgc3RhdGljIHUzMiBmd19wbGF0Zm9ybV9jYWxjdWxhdGVf
aGVhcF9zaXplKHUzMiBoYXJ0X2NvdW50KQo+ICB7Cj4gICAgICAgICB1MzIgaGVhcF9zaXplOwo+
IEBAIC0xNzcsNyArMTUyLDcgQEAgdW5zaWduZWQgbG9uZyBmd19wbGF0Zm9ybV9pbml0KHVuc2ln
bmVkIGxvbmcgYXJnMCwgdW5zaWduZWQgbG9uZyBhcmcxLAo+ICAgICAgICAgaWYgKHJvb3Rfb2Zm
c2V0IDwgMCkKPiAgICAgICAgICAgICAgICAgZ290byBmYWlsOwo+Cj4gLSAgICAgICBmd19wbGF0
Zm9ybV9sb29rdXBfc3BlY2lhbChmZHQsIHJvb3Rfb2Zmc2V0KTsKPiArICAgICAgIGZkdF9kcml2
ZXJfaW5pdF9ieV9vZmZzZXQoZmR0LCByb290X29mZnNldCwgcGxhdGZvcm1fb3ZlcnJpZGVfbW9k
dWxlcyk7Cj4KPiAgICAgICAgIG1vZGVsID0gZmR0X2dldHByb3AoZmR0LCByb290X29mZnNldCwg
Im1vZGVsIiwgJmxlbik7Cj4gICAgICAgICBpZiAobW9kZWwpCj4gLS0KPiAyLjQ3LjIKPgo+Cj4g
LS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0g
Cm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
