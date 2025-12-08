Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CBDD3B7DE
	for <opensbi@archiver.kernel.org>; Mon,  8 Dec 2025 11:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2Xx/tVPGaomZ0viJCz8jUEhxlKMw/MQs/56Vc7ijzA=; b=1OYYYnRfGj/FwW
	9S8aZ+fa1vduOIWL1orocANXeB7bTqith2Cqbc9xrlw0Pl+Oh7XBY9dAYJIdVB0KbNQxESjXeGwuq
	+VMGWOgFGO+30Yk8IATMajN5M0ewGMmyDidwaaqQlzm6XzvpPUwAyTMLLBflzH6zsR3ARdkxZGNGE
	jSJqQjUEMTep1YP/Y/ijs+fOSRZniM3IAyFtoU/TCKOjDnY5Wb2ij2/SwqjPdJZDRcB5wz/GzxYeq
	SIDFql+b65c2HJj7YDvSYcn8zrcIJYA82OwV/V6Z9ag2D8MoB0Ak3Y9LhrPV69QB85owFCYQ5SAqx
	kkwST8ldAOXKKG2WGaNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSZU4-0000000D0vj-3CwY;
	Mon, 08 Dec 2025 11:32:52 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSZU1-0000000D0vM-2Y2a
	for opensbi@lists.infradead.org;
	Mon, 08 Dec 2025 11:32:50 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-6571763793bso2311235eaf.1
        for <opensbi@lists.infradead.org>; Mon, 08 Dec 2025 03:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1765193568; x=1765798368; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8AO1KMkVo4EfSO9S6VMa4nyEudm64Gq2qTs78lizV8=;
        b=evWp3/uSySNzN+VPO/CZC13HrXJ1SzblcpvQDWccMZ2y3NQwUGwiaXXASJZfn0DBJS
         VD2jPXG3rZSFnPmRfr04U18wLIgaKBWte/7AUI0r+V57brK7F/2C/0OYXMtx1P/8t+wH
         JyRrD3DaBjNzZ5eVltGOrq8qJDuOvjZIlxUfZdgMFcHeJCee4H2gmPrIUFj1yGdYjuXt
         ClrCiHHIsc8O1oSIuqkcLrhMPlPMlpuALG0pwck1XkPY9eNjfwiiqkROjNrUNODQ2lhA
         mWyvoXFqW73+PXb7PjbV+gE8EyURUO9818eUPrAkNlRVJeYhp6xJ5V0rHoldvysIujjm
         sPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765193568; x=1765798368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X8AO1KMkVo4EfSO9S6VMa4nyEudm64Gq2qTs78lizV8=;
        b=JH9jNJJ+AO4LoeRwvefpsM5clwmMDLlg6tlM6udFzMJZAApQguQRaZSiBy2sGKV5k7
         ja63jW30ZRDLzf0qehgY+sjuEKGhP1uKmwFxswe5L5HmZrE/dQqCYL74vrl5Q9a1G9ez
         S80PRMqoay+sKDD6GU6Hes+WTc+xxbmVR7Wvno7HSSLsoHobT2gc+HuoEQblG8YiOw3d
         6/Ew/CoHxCpUHlgsisAhy/crd6RAWKIOjl9EbZqXiYbhWGBUPgToqQOzvOP7bPk8qsmH
         SrOXyMLHEk5ourbuaKRhHzZkat774k9euw3v5n3xsHmMmya9/fNsVWJTO7m14bTrYImY
         H5mQ==
X-Gm-Message-State: AOJu0Yw9mVQ5O+pBG0rAXjvOVqqpqa4R0o34N4CK4WfP7K+0yTfMc9+n
	KZtfpY6KiG1RlzdPcfdJbW3IGgB1oUbiL5QCEopPGZNrif66z9MsWKpeMoBVPOIuFGVYibsscrw
	UMP0p84PhF5yVpeUkeaTC/vIk7XeegUBHKF+oBkqaCNtN6oNO3xob
X-Gm-Gg: ASbGncszLc690DmTomnrchDNlhj/CF8VF5qWhbHlToAiaasqDwgaxL84HYw7jDBtINb
	tEKprf2/HShzl59C7rFSzuhlDROhD9lheWi9aMxIxYhpRYSmADDz6PwHKU41SS2u/S/md9J71y4
	uQG1wrzmqg50b5hc/PuTrcn3lzRnneDwv2e/LzCckngxWYsE1s0yV0Z/ebJCY+PwSkwdDH6PIt/
	8wqlgX2fdwSLl7GN29IuZCwES6arRGYU/xi3rHSto//00dG2WQQzapPbKNWfP9R/kIT8S6oVJI6
	Z6M3EBc5NWulsQnEhP3nQxlUYtg2MQ==
X-Google-Smtp-Source: AGHT+IG/7Fc23zi/KlRghC6l0KKnfgPRjBZr0Li97IRLRmkWFa/5jh+5ys4PpIUGAXluW67PNsPbXgW4zWzCNSQjhkI=
X-Received: by 2002:a05:6820:1886:b0:659:9a49:8efe with SMTP id
 006d021491bc7-6599a89f197mr3000074eaf.15.1765193568444; Mon, 08 Dec 2025
 03:32:48 -0800 (PST)
MIME-Version: 1.0
References: <20251121193808.1528050-1-samuel.holland@sifive.com> <20251121193808.1528050-2-samuel.holland@sifive.com>
In-Reply-To: <20251121193808.1528050-2-samuel.holland@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 8 Dec 2025 17:02:37 +0530
X-Gm-Features: AQt7F2prWX6LtEKyLlWjEuaBN1DljUfuK863bhOvHGsXcPnaxrYOzFJVznbVg_c
Message-ID: <CAAhSdy1mm_fVi0TeOxnBWFNfQjSS2HWf032UV1WjH0WTW-nXOQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] lib: sbi_domain: Allow MMIO access to non-MMIO ranges
To: Samuel Holland <samuel.holland@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_033249_797376_009FE6D8 
X-CRM114-Status: GOOD (  23.21  )
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

T24gU2F0LCBOb3YgMjIsIDIwMjUgYXQgMTowOOKAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEN1cnJlbnRseSwgcGxhdGZvcm1zIGRvIG5v
dCBwcm92aWRlIGNvbXBsZXRlIG1lbW9yeSByZWdpb24gaW5mb3JtYXRpb24KPiB0byBPcGVuU0JJ
LiBHZW5lcmFsbHksIG1lbW9yeSByZWdpb25zIGFyZSBvbmx5IGNyZWF0ZWQgZm9yIHRoZSBmZXcg
TU1JTwo+IGRldmljZXMgdGhhdCBoYXZlIE0tbW9kZSBkcml2ZXJzLiBBcyBhIHJlc3VsdCwgbW9z
dCBNTUlPIGRldmljZXMgZmFsbAo+IGluc2lkZSB0aGUgZGVmYXVsdCBTLW1vZGUgUldYIG1lbW9y
eSByZWdpb24sIHdoaWNoIGRvZXMgX25vdF8gaGF2ZSB0aGUKPiBNTUlPIGZsYWcgc2V0Lgo+Cj4g
SW4gZmFjdCwgT3BlblNCSSByZWxpZXMgb24gY2VydGFpbiBTLW1vZGUgTU1JTyBkZXZpY2VzIGJl
aW5nIGluc2lkZQo+IG5vbi1NTUlPIG1lbW9yeSByZWdpb25zLiBCb3RoIGZkdF9kb21haW5fYmFz
ZWRfZml4dXBfb25lKCkgYW5kCj4gbXB4eV9ycG1pX3N5c21pc194ZmVyKCkgY2FsbCBzYmlfZG9t
YWluX2NoZWNrX2FkZHIoKSB3aXRoIHRoZSBNTUlPIGZsYWcKPiBjbGVhcmVkLCBhbmQgdGhhdCBm
dW5jdGlvbiBjdXJyZW50bHkgcmVxdWlyZXMgYW4gZXhhY3QgZmxhZyBtYXRjaC4gVGhvc2UKPiBh
Y2Nlc3MgY2hlY2tzIHdpbGwgdGh1cyBlcnJvbmVvdXNseSBmYWlsIGlmIHRoZSBwbGF0Zm9ybSBj
cmVhdGVzIG1lbW9yeQo+IHJlZ2lvbnMgd2l0aCB0aGUgY29ycmVjdCBmbGFncyBmb3IgdGhlc2Ug
ZGV2aWNlcyAob3IgZm9yIGEgbGFyZ2VyIE1NSU8KPiByZWdpb24gY29udGFpbmluZyB0aGVzZSBk
ZXZpY2VzKS4KPgo+IFdlIHNob3VsZCBub3QgaWdub3JlIHRoZSBNTUlPIGZsYWcgZW50aXJlbHks
IGJlY2F1c2UKPiBzYmlfZG9tYWluX2NoZWNrX2FkZHIoKSBpcyBhbHNvIHVzZWQgdG8gY2hlY2sg
dGhlIHBlcm1pc3Npb25zIG9mIFMtbW9kZQo+IHNoYXJlZCBtZW1vcnkgYnVmZmVycywgYW5kIFMt
bW9kZSBzaG91bGQgbm90IGJlIHVzaW5nIE1NSU8gZGV2aWNlCj4gYWRkcmVzc2VzIGFzIG1lbW9y
eSBidWZmZXJzLiBCdXQgd2hlbiBjaGVja2luZyBpZiBTLW1vZGUgaXMgYWxsb3dlZCB0bwo+IGRv
IE1NSU8gYWNjZXNzZXMsIHdlIG5lZWQgdG8gcmVjb2duaXplIHRoYXQgTU1JTyBkZXZpY2VzIGFw
cGVhciBpbgo+IG1lbW9yeSByZWdpb25zIGJvdGggd2l0aCBhbmQgd2l0aG91dCB0aGUgTU1JTyBm
bGFnIHNldC4KPgo+IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFu
ZEBzaWZpdmUuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWlu
ZmF1bHQub3JnPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8u
CgpUaGFua3MsCkFudXAKCj4gLS0tCj4KPiAgbGliL3NiaS9zYmlfZG9tYWluLmMgfCA2ICsrKysr
LQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfZG9tYWluLmMgYi9saWIvc2JpL3NiaV9kb21haW4uYwo+
IGluZGV4IGRhMGYwNTU3Li4wZGE0M2Q3NiAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9kb21h
aW4uYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2RvbWFpbi5jCj4gQEAgLTIzNiw3ICsyMzYsMTEgQEAg
Ym9vbCBzYmlfZG9tYWluX2NoZWNrX2FkZHIoY29uc3Qgc3RydWN0IHNiaV9kb21haW4gKmRvbSwK
PiAgICAgICAgICAgICAgICAgICAgICAgICByc3RhcnQgKyAoKDFVTCA8PCByZWctPm9yZGVyKSAt
IDEpIDogLTFVTDsKPiAgICAgICAgICAgICAgICAgaWYgKHJzdGFydCA8PSBhZGRyICYmIGFkZHIg
PD0gcmVuZCkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJtbWlvID0gKHJmbGFncyAmIFNC
SV9ET01BSU5fTUVNUkVHSU9OX01NSU8pID8gdHJ1ZSA6IGZhbHNlOwo+IC0gICAgICAgICAgICAg
ICAgICAgICAgIGlmIChtbWlvICE9IHJtbWlvKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIC8q
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICogTU1JTyBkZXZpY2VzIG1heSBhcHBlYXIgaW4g
cmVnaW9ucyB3aXRob3V0IHRoZSBmbGFnIHNldCAoc3VjaCBhcyB0aGUKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgKiBkZWZhdWx0IHJlZ2lvbiksIGJ1dCBNTUlPIGRldmljZSByZWdpb25zIHNo
b3VsZCBub3QgYmUgdXNlZCBhcyBtZW1vcnkuCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICov
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFtbWlvICYmIHJtbWlvKQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIHJldHVybiAoKHJyd3ggJiByd3gpID09IHJ3eCkgPyB0cnVlIDogZmFsc2U7Cj4gICAg
ICAgICAgICAgICAgIH0KPiAtLQo+IDIuNDcuMgo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBs
aXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QK
b3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
