Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BC0CCA470
	for <opensbi@archiver.kernel.org>; Tue, 30 Sep 2025 11:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Orc8pfUWHa7wHY3GuRhr9fEfMDIZcySaOE4cp+5O2B4=; b=FH1kgrrCWunRYb
	8n1yjvu5TZ09l8wJlSjPhIQyBPQkM9wkyXoRi9FrHt9c0Rg8rIRsOD6nBwiDhZPhUypjwb/193ZHJ
	KZZL2m9sV5laJopOyNwn/8G1jZvC9wNMPpPba/9tbGvdbSBOIskzTg6tR3prIWKphJSqOLa9FMvoL
	x3h4UFbEWENlouYTkb07GJlG1SqW9vQLnwnLcg0oY9JZ4NlsSWMvvi2v/eyRxWJaM2CVqzZqb5TAk
	Md7VSSL1/lAeQA4DTuqH3BA6QZG+DXwvAjlw1bM/MJ+Z1vuUuGR/1punFjBw1OCF2wR/CztN8tMVn
	w6grFVGKdUs9FdzckQ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Yby-000000059F8-2gs7;
	Tue, 30 Sep 2025 11:33:38 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Ybv-000000059EK-0eQP
	for opensbi@lists.infradead.org;
	Tue, 30 Sep 2025 11:33:36 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-4258bd8c19bso50578585ab.2
        for <opensbi@lists.infradead.org>; Tue, 30 Sep 2025 04:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1759232013; x=1759836813; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7P9RB8BsUNHzysgPlKxlL86qQBj5WrJa9L+Ul7w0cJ8=;
        b=NwSkCTUpdla8xxitlnUpFCL0SJmgetoXaF76ToPfGvBp9BYh6uDY4S9OEqg3LcHX0+
         krbbwiZCbvXV+iUZ1ciL+Tp+1w6Fj8rUETQztC6MlCcKkgsqiVApLcJAjiNapnttTCq6
         TW5sZ5EGHAzoHrYWh6/5DJUpS910nxDAjFu6pnLUHy78MdLLO8P308FN162/X20EkYmH
         f9uw9BGB3NEc2TabbAXJ/S85NyVhhtrTxtcx4i00e8hoIho49qbXcr62vYbKM3g9xH1b
         3+cUvN3CeKxY5bLQO4E+M9nkC280lwYpDQTU9bjgGpO4E5XU0Ag7OD2RAiHNL3EsBoHP
         utMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759232013; x=1759836813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7P9RB8BsUNHzysgPlKxlL86qQBj5WrJa9L+Ul7w0cJ8=;
        b=vs+uDT805lrYp/l90vkBBPca3wsRUtjc6l0u6iLtiwWb9jCY/K6bcM9lHOFN2NE8KQ
         CM8YC2crB4VDdTltUPThiFU0DELl+iaoG18SwhLdeSgDlK+Lq//g6/axFeIdBWcvslox
         npPqYGf9217ZFrJhcs1lvL7W5TD7bX48S5kPE4rAXz2KFYDgFvbTM+JuNssYR2sqe65D
         QmFAjy4DFEYxY5uPEcRAOCgvxSwZt47xY+hwxIZjTnf6EunELYu+Up3C/2CPTOdhrN2x
         xivRqJhGMtuXG8hRCHW/twOoDNmFGKVZfJNh8w4G4pMMNSBwhrkMUF0OzY002gZTEdyO
         tDMw==
X-Gm-Message-State: AOJu0Yy8Vf32QkjxlS/+OmmPWsCV4nGxkNUj06tl0B7qZIx0MrJY2gQ9
	aYMGEJWk/Ypp81FjNdv1MklnnRlqDh8P+vWE31th+S1iThPWHWkjHZMJVL0lFHDa/Y4aVUEFIc1
	z8FdoBdE+cbosapCGEa0wYpFHK2By46YrmjEbQPsz+y8NcGuViOFEWZc=
X-Gm-Gg: ASbGncvAZ+Cu3aR8PN8YKV5U5sGmo8HCrRn7KBJWr9SaxTFoWHnU9A73f4EgFmQzo7f
	v3KHbWEqOEyo9ycImFNYGZcxi0VZNCsZXo3HqXyGO1k2VqL+KrwUHgu0OOsezaAFP4LOpua5y3J
	slpWmdhRrKl+NLMl79pENvm7OWTWr5xMlNzyB6zdvLBuycc1UAeYhhVPzgWNWh60HO7WkCaB9t4
	6BASciIXbL2oDyBJzWfkyQLD8SsejTg2luyUKkY7AP+A7ugrWsMM2Pwls1dnJ96
X-Google-Smtp-Source: AGHT+IEBLwswrihc17+mn8QNlwrwdPO6IHiNN6GHrM9EvXRplQ3GXK1/balmpR9UL3NqSsFUEdRPoTuRbGu9hZ1h5Y8=
X-Received: by 2002:a05:6e02:188f:b0:428:18f4:351 with SMTP id
 e9e14a558f8ab-42818f403c6mr191886315ab.2.1759232013323; Tue, 30 Sep 2025
 04:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250806084123476SCLxg-qQRa8CRuhuY-dwE@zte.com.cn> <202508060106.57616SIn072462@mse-db.zte.com.cn>
In-Reply-To: <202508060106.57616SIn072462@mse-db.zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 30 Sep 2025 17:03:20 +0530
X-Gm-Features: AS18NWCZXNe-HN9qwaA-ubz10RQJezB2WXyjRCrHkw7wldOwLvmvj2SMxeJZQJo
Message-ID: <CAAhSdy2XQkkfwt=YyvyqSLCBAUmSJWdNi2P66EzpdZZwEv4ZNw@mail.gmail.com>
Subject: Re: [PATCH 1/3] lib: sbi: Print error message during warm boot
To: wu.fei9@sanechips.com.cn
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_043335_445324_85A5FFC7 
X-CRM114-Status: GOOD (  18.43  )
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

T24gV2VkLCBBdWcgNiwgMjAyNSBhdCA2OjM54oCvQU0gPHd1LmZlaTlAc2FuZWNoaXBzLmNvbS5j
bj4gd3JvdGU6Cj4KPiBJdCdzIGhlbHBmdWwgdG8gcHJpbnQgZXJyb3IgbWVzc2FnZXMgZm9yIGRl
YnVnZ2luZywgaGVyZSBhZGQgdGhlbSBpbgo+IHdhcm0gYm9vdCBwYXRoIGp1c3QgYXMgdGhvc2Ug
aW4gdGhlIGNvbGQgYm9vdCBwYXRoLgo+Cj4gU2lnbmVkLW9mZi1ieTogV3UgRmVpIDx3dS5mZWk5
QHNhbmVjaGlwcy5jb20uY24+Cj4gLS0tCj4gIGxpYi9zYmkvc2JpX2luaXQuYyB8IDY1ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDUyIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2xp
Yi9zYmkvc2JpX2luaXQuYyBiL2xpYi9zYmkvc2JpX2luaXQuYwo+IGluZGV4IDg0YTYzNzQuLjJl
MWNhNjYgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfaW5pdC5jCj4gKysrIGIvbGliL3NiaS9z
YmlfaW5pdC5jCj4gQEAgLTQxNSw2MCArNDE1LDk5IEBAIHN0YXRpYyB2b2lkIF9fbm9yZXR1cm4g
aW5pdF93YXJtX3N0YXJ0dXAoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoLAo+Cj4gICAgICAg
ICAvKiBOb3RlOiBUaGlzIGhhcyB0byBiZSBmaXJzdCB0aGluZyBpbiB3YXJtYm9vdCBpbml0IHNl
cXVlbmNlICovCj4gICAgICAgICByYyA9IHNiaV9oc21faW5pdChzY3JhdGNoLCBmYWxzZSk7Cj4g
LSAgICAgICBpZiAocmMpCj4gKyAgICAgICBpZiAocmMpIHsKPiArICAgICAgICAgICAgICAgc2Jp
X3ByaW50ZigiJXM6IGhhcnQgJWQgaHNtIGluaXQgZmFpbGVkIChlcnJvciAlZClcbiIsCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgX19mdW5jX18sIGhhcnRpZCwgcmMpOwo+ICAgICAgICAg
ICAgICAgICBzYmlfaGFydF9oYW5nKCk7Cj4gKyAgICAgICB9CgpMb29rcyBsaWtlIHRoaXMgcGF0
Y2ggd2FzIG5vdCBnZW5lcmF0ZWQgdXNpbmcgZ2l0IGZvcm1hdC1wYXRjaCBvcgpub3Qgc2VuZCB1
c2luZyBnaXQgc2VuZC1lbWFpbC4KCkkgYW0gdW5hYmxlIHRvIGFwcGx5IHRoaXMgcGF0Y2guCgpS
ZWdhcmRzLApBbnVwCgo+Cj4gICAgICAgICByYyA9IHNiaV9wbGF0Zm9ybV9lYXJseV9pbml0KHBs
YXQsIGZhbHNlKTsKPiAtICAgICAgIGlmIChyYykKPiArICAgICAgIGlmIChyYykgewo+ICsgICAg
ICAgICAgICAgICBzYmlfcHJpbnRmKCIlczogaGFydCAlZCBwbGF0Zm9ybSBlYXJseSBpbml0IGZh
aWxlZCAoZXJyb3IgJWQpXG4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIF9fZnVuY19f
LCBoYXJ0aWQsIHJjKTsKPiAgICAgICAgICAgICAgICAgc2JpX2hhcnRfaGFuZygpOwo+ICsgICAg
ICAgfQo+Cj4gICAgICAgICByYyA9IHNiaV9oYXJ0X2luaXQoc2NyYXRjaCwgZmFsc2UpOwo+IC0g
ICAgICAgaWYgKHJjKQo+ICsgICAgICAgaWYgKHJjKSB7Cj4gKyAgICAgICAgICAgICAgIHNiaV9w
cmludGYoIiVzOiBoYXJ0ICVkIGhhcnQgaW5pdCBmYWlsZWQgKGVycm9yICVkKVxuIiwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXywgaGFydGlkLCByYyk7Cj4gICAgICAgICAg
ICAgICAgIHNiaV9oYXJ0X2hhbmcoKTsKPiArICAgICAgIH0KPgo+ICAgICAgICAgcmMgPSBzYmlf
cG11X2luaXQoc2NyYXRjaCwgZmFsc2UpOwo+IC0gICAgICAgaWYgKHJjKQo+ICsgICAgICAgaWYg
KHJjKSB7Cj4gKyAgICAgICAgICAgICAgIHNiaV9wcmludGYoIiVzOiBoYXJ0ICVkIHBtdSBpbml0
IGZhaWxlZCAoZXJyb3IgJWQpXG4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIF9fZnVu
Y19fLCBoYXJ0aWQsIHJjKTsKPiAgICAgICAgICAgICAgICAgc2JpX2hhcnRfaGFuZygpOwo+ICsg
ICAgICAgfQo+Cj4gICAgICAgICByYyA9IHNiaV9kYnRyX2luaXQoc2NyYXRjaCwgZmFsc2UpOwo+
IC0gICAgICAgaWYgKHJjKQo+ICsgICAgICAgaWYgKHJjKSB7Cj4gKyAgICAgICAgICAgICAgIHNi
aV9wcmludGYoIiVzOiBoYXJ0ICVkIGRidHIgaW5pdCBmYWlsZWQgKGVycm9yICVkKVxuIiwKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXywgaGFydGlkLCByYyk7Cj4gICAgICAg
ICAgICAgICAgIHNiaV9oYXJ0X2hhbmcoKTsKPiArICAgICAgIH0KPgo+ICAgICAgICAgcmMgPSBz
YmlfaXJxY2hpcF9pbml0KHNjcmF0Y2gsIGZhbHNlKTsKPiAtICAgICAgIGlmIChyYykKPiArICAg
ICAgIGlmIChyYykgewo+ICsgICAgICAgICAgICAgICBzYmlfcHJpbnRmKCIlczogaGFydCAlZCBp
cnFjaGlwIGluaXQgZmFpbGVkIChlcnJvciAlZClcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgX19mdW5jX18sIGhhcnRpZCwgcmMpOwo+ICAgICAgICAgICAgICAgICBzYmlfaGFydF9o
YW5nKCk7Cj4gKyAgICAgICB9Cj4KPiAgICAgICAgIHJjID0gc2JpX2lwaV9pbml0KHNjcmF0Y2gs
IGZhbHNlKTsKPiAtICAgICAgIGlmIChyYykKPiArICAgICAgIGlmIChyYykgewo+ICsgICAgICAg
ICAgICAgICBzYmlfcHJpbnRmKCIlczogaGFydCAlZCBpcGkgaW5pdCBmYWlsZWQgKGVycm9yICVk
KVxuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXywgaGFydGlkLCByYyk7
Cj4gICAgICAgICAgICAgICAgIHNiaV9oYXJ0X2hhbmcoKTsKPiArICAgICAgIH0KPgo+ICAgICAg
ICAgcmMgPSBzYmlfdGxiX2luaXQoc2NyYXRjaCwgZmFsc2UpOwo+IC0gICAgICAgaWYgKHJjKQo+
ICsgICAgICAgaWYgKHJjKSB7Cj4gKyAgICAgICAgICAgICAgIHNiaV9wcmludGYoIiVzOiBoYXJ0
ICVkIHRsYiBpbml0IGZhaWxlZCAoZXJyb3IgJWQpXG4iLAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgIF9fZnVuY19fLCBoYXJ0aWQsIHJjKTsKPiAgICAgICAgICAgICAgICAgc2JpX2hhcnRf
aGFuZygpOwo+ICsgICAgICAgfQo+Cj4gICAgICAgICByYyA9IHNiaV90aW1lcl9pbml0KHNjcmF0
Y2gsIGZhbHNlKTsKPiAtICAgICAgIGlmIChyYykKPiArICAgICAgIGlmIChyYykgewo+ICsgICAg
ICAgICAgICAgICBzYmlfcHJpbnRmKCIlczogaGFydCAlZCB0aW1lciBpbml0IGZhaWxlZCAoZXJy
b3IgJWQpXG4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIF9fZnVuY19fLCBoYXJ0aWQs
IHJjKTsKPiAgICAgICAgICAgICAgICAgc2JpX2hhcnRfaGFuZygpOwo+ICsgICAgICAgfQo+Cj4g
ICAgICAgICByYyA9IHNiaV9md2Z0X2luaXQoc2NyYXRjaCwgZmFsc2UpOwo+IC0gICAgICAgaWYg
KHJjKQo+ICsgICAgICAgaWYgKHJjKSB7Cj4gKyAgICAgICAgICAgICAgIHNiaV9wcmludGYoIiVz
OiBoYXJ0ICVkIGZ3ZnQgaW5pdCBmYWlsZWQgKGVycm9yICVkKVxuIiwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICBfX2Z1bmNfXywgaGFydGlkLCByYyk7Cj4gICAgICAgICAgICAgICAgIHNi
aV9oYXJ0X2hhbmcoKTsKPiArICAgICAgIH0KPgo+ICAgICAgICAgcmMgPSBzYmlfcGxhdGZvcm1f
ZmluYWxfaW5pdChwbGF0LCBmYWxzZSk7Cj4gLSAgICAgICBpZiAocmMpCj4gKyAgICAgICBpZiAo
cmMpIHsKPiArICAgICAgICAgICAgICAgc2JpX3ByaW50ZigiJXM6IGhhcnQgJWQgcGxhdGZvcm0g
ZmluYWwgaW5pdCBmYWlsZWQgKGVycm9yICVkKVxuIiwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICBfX2Z1bmNfXywgaGFydGlkLCByYyk7Cj4gICAgICAgICAgICAgICAgIHNiaV9oYXJ0X2hh
bmcoKTsKPiArICAgICAgIH0KPgo+ICAgICAgICAgcmMgPSBzYmlfc3NlX2luaXQoc2NyYXRjaCwg
ZmFsc2UpOwo+IC0gICAgICAgaWYgKHJjKQo+ICsgICAgICAgaWYgKHJjKSB7Cj4gKyAgICAgICAg
ICAgICAgIHNiaV9wcmludGYoIiVzOiBoYXJ0ICVkIHNzZSBpbml0IGZhaWxlZCAoZXJyb3IgJWQp
XG4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIF9fZnVuY19fLCBoYXJ0aWQsIHJjKTsK
PiAgICAgICAgICAgICAgICAgc2JpX2hhcnRfaGFuZygpOwo+ICsgICAgICAgfQo+Cj4gICAgICAg
ICAvKgo+ICAgICAgICAgICogQ29uZmlndXJlIFBNUCBhdCBsYXN0IGJlY2F1c2UgaWYgU01FUE1Q
IGlzIGRldGVjdGVkLAo+ICAgICAgICAgICogTS1tb2RlIGFjY2VzcyB0byB0aGUgUy9VIHNwYWNl
IHdpbGwgYmUgcmVzY2luZGVkLgo+ICAgICAgICAgICovCj4gICAgICAgICByYyA9IHNiaV9oYXJ0
X3BtcF9jb25maWd1cmUoc2NyYXRjaCk7Cj4gLSAgICAgICBpZiAocmMpCj4gKyAgICAgICBpZiAo
cmMpIHsKPiArICAgICAgICAgICAgICAgc2JpX3ByaW50ZigiJXM6IGhhcnQgJWQgUE1QIGNvbmZp
Z3VyZSBmYWlsZWQgKGVycm9yICVkKVxuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICBf
X2Z1bmNfXywgaGFydGlkLCByYyk7Cj4gICAgICAgICAgICAgICAgIHNiaV9oYXJ0X2hhbmcoKTsK
PiArICAgICAgIH0KPgo+ICAgICAgICAgY291bnQgPSBzYmlfc2NyYXRjaF9vZmZzZXRfcHRyKHNj
cmF0Y2gsIGluaXRfY291bnRfb2Zmc2V0KTsKPiAgICAgICAgICgqY291bnQpKys7Cj4gLS0KPiAy
LjQzLjAKPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJh
ZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29w
ZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
