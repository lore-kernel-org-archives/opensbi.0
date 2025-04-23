Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8032BC369CB
	for <opensbi@archiver.kernel.org>; Wed, 23 Apr 2025 04:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y8S52PJe/1l4grHeQqj6zlOxiPdTCLHdrmJHi2J0ELI=; b=vaymt+McigXjs0
	4VJoon5OcNesykwLt4g8yq1DrhRUfvcDeUGhQjST6UDIu90v+B7rSFce0+cwtFjRAYBYtd1YAnPxH
	ajB8q64o+Hoj9Jqgq3lHsXuPcw/YQZLVJNCYL7mswmSBYxkY3fkMI7jpFe8Ir1LuLfgliqwA3x4sX
	A/l9lAPqKyqb/O6lUWfBoB4YgOcSPiEygXPHCGHyKJNB6k1O0Zsf7CSdTCLbRFlsUAHvvuj+9dGKP
	AX7lBhrhKDEna+1K1fEULalDdAqwbDFpvXgMXh5Rco2IKWE5tBIrgd+Pj4JrKFMHWbpL41aAi3sBV
	RyKhKlpnOPNn90ffs9FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7RLP-000000099wD-1Cdw;
	Wed, 23 Apr 2025 04:04:19 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7RJS-000000099k3-23eq
	for opensbi@lists.infradead.org;
	Wed, 23 Apr 2025 04:02:19 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-855bd88ee2cso166130739f.0
        for <opensbi@lists.infradead.org>; Tue, 22 Apr 2025 21:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745380937; x=1745985737; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vX1MkaJPOGMOzMkqwIscoNocmHWg1r2TRwpQBCo7HU4=;
        b=QoXvySrHd1N8R6ITbVHYm1DSOdj+0VUPKZENkDyP1PYvZ0KoA9uX/JlpwFg9bekMWv
         GGjJsnhCVvM+LJokxUqcb5FxTiwwCeMWBPsXkTf0dmUsljx19SpMAUVxZhMG47aR8D6H
         nH9FRKB2jG0m5jvfrs0kqQpcPlIR9TVHffpEt8tndf7myucHfGTZt5nt42Zfs8frMQbt
         nfWy5oHEXkM/oGpxg9sfchtYeGsfssTUY9tzYU+HfL4RgU/TYhQ/FOt4Uc5nRud+bMzJ
         l8bXkvnq3z7uqDjrxJyCRAyMrICsT+74UoD/L55jKhVdY6FoZvspU15X/Qhe1mOTFQtg
         uCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745380937; x=1745985737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vX1MkaJPOGMOzMkqwIscoNocmHWg1r2TRwpQBCo7HU4=;
        b=nJWah1YKjrdUxIzZnPTQUmzbNuo5hevfaRy6AGIZwC9Da3p3uDTEw2icKCKe78uWR6
         3Ho5wlqhNmKPXKh6bfDxxwgMm/aNy6AIeImYgek1nryecC/JQP9gb5GLqRwakHp8e5x/
         R9AScV43/HwzT6ufWx9tZrByspJgjsEVYjMnGGJ1+eAfdOFdqiwh76ixuiT4AF2faP6p
         OjfBtwrAxQBktXqzL2TvXsoS04MtglYrFvNnS7bhZzOPJXjk4/dcDM8uSCc33GuhhM3K
         KmNGr/bSRI5T3RxJt233cQJmOp4ibHpwqvjdTjxBZAHokomaIQbn9M0KaY8Q4f1P4uEr
         Oipg==
X-Gm-Message-State: AOJu0Yw2PrLEV/zxs+Y9p2U4CVe5fdVSgWnSHZ35gNuaXYLwSrJT4sin
	/PAWEOSEXgAB4WhJyTqWZr7D1XArfywDKNlL7OP+Ws4QKLHVN9hBjUa+o8Dq9J4lgrnkaVXculD
	9rPlTHeTJYFGd9JJN/PwHElqaMYxB4o74y5P864GEq7F5cwSM
X-Gm-Gg: ASbGncskcQkJkfZ5eP5KSia+4xibKGI4s/YVWijaExrEHyrjxw6VgRW5mG9FMSy6ruR
	p91kvPD/gzbctXUMiOEDzS/fHVe8x2SML3c+ctYqaVKySxPXLwnjej8iKCo86cDDuv/sNqK1BZy
	rbTrwUYokkQvnSOHwTy9PLgUk8OKjXRAK1zQ==
X-Google-Smtp-Source: AGHT+IFNh8ZT4liy8tz/i6X8uRY2HWQheuTfTDQjlcuyTad6k+CSsnT8EKn/tG3ifFGClC+l6eNdWg4dbcgHzGQnbR4=
X-Received: by 2002:a05:6e02:b25:b0:3d3:fbae:3978 with SMTP id
 e9e14a558f8ab-3d88eda88b8mr142640335ab.9.1745380937104; Tue, 22 Apr 2025
 21:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250325234342.711447-1-samuel.holland@sifive.com> <20250325234342.711447-10-samuel.holland@sifive.com>
In-Reply-To: <20250325234342.711447-10-samuel.holland@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 23 Apr 2025 09:32:06 +0530
X-Gm-Features: ATxdqUEwZx8dnCmQXM8W7l42QOtlUAK9Kuaf1m2S0x89I0-pQOrQ_Aiq1Byw8Cw
Message-ID: <CAAhSdy34OpiBrV0OQbtVwSryVMCyMkzz7d6+WTDbfJ0i9rZN+w@mail.gmail.com>
Subject: Re: [PATCH 09/10] lib: utils/fdt: Remove fdt_match_node()
To: Samuel Holland <samuel.holland@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_210218_530304_EF3528FB 
X-CRM114-Status: GOOD (  14.22  )
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
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IFRoaXMgZnVuY3Rpb24gaGFzIGJlZW4gb2Jz
b2xldGVkIGJ5IHRoZSBmZHRfZHJpdmVyIGxpYnJhcnkgYW5kIGlzIG5vCj4gbG9uZ2VyIHVzZWQu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZl
LmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz4KClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4KPiAgaW5jbHVkZS9zYmlfdXRpbHMvZmR0L2ZkdF9o
ZWxwZXIuaCB8ICAzIC0tLQo+ICBsaWIvdXRpbHMvZmR0L2ZkdF9oZWxwZXIuYyAgICAgICAgIHwg
MTkgLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIyIGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpX3V0aWxzL2ZkdC9mZHRfaGVscGVyLmggYi9p
bmNsdWRlL3NiaV91dGlscy9mZHQvZmR0X2hlbHBlci5oCj4gaW5kZXggZmY4MzAwMjUuLjU4NzU4
ODA4IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvc2JpX3V0aWxzL2ZkdC9mZHRfaGVscGVyLmgKPiAr
KysgYi9pbmNsdWRlL3NiaV91dGlscy9mZHQvZmR0X2hlbHBlci5oCj4gQEAgLTM0LDkgKzM0LDYg
QEAgc3RydWN0IHBsYXRmb3JtX3VhcnRfZGF0YSB7Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIHJl
Z19vZmZzZXQ7Cj4gIH07Cj4KPiAtY29uc3Qgc3RydWN0IGZkdF9tYXRjaCAqZmR0X21hdGNoX25v
ZGUoY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZW9mZiwKPiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgZmR0X21hdGNoICptYXRjaF90YWJsZSk7Cj4g
LQo+ICBpbnQgZmR0X3BhcnNlX3BoYW5kbGVfd2l0aF9hcmdzKGNvbnN0IHZvaWQgKmZkdCwgaW50
IG5vZGVvZmYsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpw
cm9wLCBjb25zdCBjaGFyICpjZWxsc19wcm9wLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgaW50IGluZGV4LCBzdHJ1Y3QgZmR0X3BoYW5kbGVfYXJncyAqb3V0X2FyZ3MpOwo+IGRp
ZmYgLS1naXQgYS9saWIvdXRpbHMvZmR0L2ZkdF9oZWxwZXIuYyBiL2xpYi91dGlscy9mZHQvZmR0
X2hlbHBlci5jCj4gaW5kZXggYmMzNTdiMmYuLjYyNTY0ZDI4IDEwMDY0NAo+IC0tLSBhL2xpYi91
dGlscy9mZHQvZmR0X2hlbHBlci5jCj4gKysrIGIvbGliL3V0aWxzL2ZkdC9mZHRfaGVscGVyLmMK
PiBAQCAtMzMsMjUgKzMzLDYgQEAKPiAgI2RlZmluZSBERUZBVUxUX1NIQUtUSV9VQVJUX0ZSRVEg
ICAgICAgICAgICAgICA1MDAwMDAwMAo+ICAjZGVmaW5lIERFRkFVTFRfU0hBS1RJX1VBUlRfQkFV
RCAgICAgICAgICAgICAgIDExNTIwMAo+Cj4gLWNvbnN0IHN0cnVjdCBmZHRfbWF0Y2ggKmZkdF9t
YXRjaF9ub2RlKGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGVvZmYsCj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGZkdF9tYXRjaCAqbWF0Y2hfdGFi
bGUpCj4gLXsKPiAtICAgICAgIGludCByZXQ7Cj4gLQo+IC0gICAgICAgaWYgKCFmZHQgfHwgbm9k
ZW9mZiA8IDAgfHwgIW1hdGNoX3RhYmxlKQo+IC0gICAgICAgICAgICAgICByZXR1cm4gTlVMTDsK
PiAtCj4gLSAgICAgICB3aGlsZSAobWF0Y2hfdGFibGUtPmNvbXBhdGlibGUpIHsKPiAtICAgICAg
ICAgICAgICAgcmV0ID0gZmR0X25vZGVfY2hlY2tfY29tcGF0aWJsZShmZHQsIG5vZGVvZmYsCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWF0Y2hfdGFi
bGUtPmNvbXBhdGlibGUpOwo+IC0gICAgICAgICAgICAgICBpZiAoIXJldCkKPiAtICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gbWF0Y2hfdGFibGU7Cj4gLSAgICAgICAgICAgICAgIG1hdGNo
X3RhYmxlKys7Cj4gLSAgICAgICB9Cj4gLQo+IC0gICAgICAgcmV0dXJuIE5VTEw7Cj4gLX0KPiAt
Cj4gIGludCBmZHRfcGFyc2VfcGhhbmRsZV93aXRoX2FyZ3MoY29uc3Qgdm9pZCAqZmR0LCBpbnQg
bm9kZW9mZiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKnBy
b3AsIGNvbnN0IGNoYXIgKmNlbGxzX3Byb3AsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBpbnQgaW5kZXgsIHN0cnVjdCBmZHRfcGhhbmRsZV9hcmdzICpvdXRfYXJncykKPiAtLQo+
IDIuNDcuMgo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5p
bmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNi
aQo=
