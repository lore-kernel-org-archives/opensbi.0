Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53342C83F17
	for <opensbi@archiver.kernel.org>; Wed, 23 Jul 2025 06:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x/HlSfkKW+EZ1XKwfRSo6ltYin6mqnQy8racSTlWbws=; b=WjOPOMDcod+UO7
	LT1ItmaHllIgCyiEEa9wn7OZovuRn0i32uvqMP9ttFm187lYPtkvpGWhEVboa9C1IYEEr3EKUmQ1B
	k/Bor0Wj/9yrKwCUT2fe16q6056Nc8yu2tmywlmTBqrjaQPyP0w8Q7vMKVZDzbWP9hlXP7YYEYDj6
	wG1USXzDMuzPqMlfvB2SWP4lGRRXRthgZc5/nngK9USVnU14cIAYx88yyUAYPhc6zYGcNN3HN4/9u
	YKJNCPEbVcgJ7wxmdKRhdYhR33Xytegg5UvFgCWm5BeKwiVeTH3ktp3XUyRB0f07dGnahhYMugUzx
	pC0t7lojrSoX9Qff7n0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueTPT-00000004Apa-3ZdK;
	Wed, 23 Jul 2025 06:57:03 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueTPR-00000004AoX-1v3W
	for opensbi@lists.infradead.org;
	Wed, 23 Jul 2025 06:57:02 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-879c214fe6dso170896139f.1
        for <opensbi@lists.infradead.org>; Tue, 22 Jul 2025 23:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1753253820; x=1753858620; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUBoRlHiTqqAhs4JzOIhgLiWpkv1BXVyXFtJswb3hAI=;
        b=xWdO2vIRU7nQpcGBuSF5sAoUiGt3uCcnmsV9jB4LU3gp2DMblfOWs4uvkF/l8MGnDJ
         z4QjFjLiPoMFrRZiddkGxsVcURCuPFp24S4IMk9T47HTypTsqQSOxpK+0mYSUzNyT0FD
         wB95LTmcK4YSrpvCQ5DheDz/JdRGmmNWOw9yo1scmP64WnOvSx0k/Ne5dYtL92PYCTZ5
         90b3pfG7plijcPYtShMzVgRCmCd3rp/mkUokVFM3MQQnayVsQbAovjMVbb714ZnMAmlR
         yCLdOc6/Dr8p2mSEBgR9GptxzaEly/4iI6ReGQAlm50smByD78HTJvmIkLYpgbbGX9db
         BUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753253820; x=1753858620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xUBoRlHiTqqAhs4JzOIhgLiWpkv1BXVyXFtJswb3hAI=;
        b=nWyHyc6ioyRSXmh8/na0LthnbU7Epk8g6j4G1BQ/j5+/KNJ/DQDEiJ5uxHuT/1qW0i
         gi5CQ3aLsIwZ5Z62if0aBWsRIgjocRKlX7yzbEv83B7fmLS5DQfwm1M4P8Gx7oGWn05H
         rpyKsZwUIGBORY+M0W4yY9nNf4yaysFofQGrWUD8z/9mKGb5q3Bdhh6bUVZN+q5Veq3/
         QsBTdO39SwiiWG3oo1di8RJqVpI3ey91iBZssjZqNgQJPlCoKFtjHy4XcI9dKlUu2wUc
         nLkz/vECrBPnbLjryFkhTPGSZRRIzLsesSK6SbIp5uj9+vX/IiUg/+Aj4O8wNcYV9FfX
         vPaQ==
X-Gm-Message-State: AOJu0YwEF9sMo8flT0f2a700FlG9rtmtbqaoFxG3yIBW+e/K+xW6TVJn
	pEsQolQ7oBEoW5EX7MMXGGZ+jUWSm9DeijRxYehnNe18cvp7aDqN4PyswzAXd9HpkXqJpCK0U3i
	TIzY7SLuF7i+wIx0XD/ssDI8i4Qxf0a0b4D3DjAJYgg==
X-Gm-Gg: ASbGncs4PaQrBT9ho9NCDXLSIxE6LKhk1zYrfflEJo66HyK46Sxo5inDriLjU/Unr6t
	m6tL2o+ci0ROZmpWW6NXbxr0qIYHdFao23QjQ5XvD+qU8HdZl/5uwwAjvsm3WLYqWSn7yas06f5
	5KIv/aE9Q4IVVrrgkmsAiPtKI8aYM+Pza19G4uef+KNiGeP37l9w4cVSKlSq9lPk7lOm8ONsyRB
	pRWDg==
X-Google-Smtp-Source: AGHT+IEXiXWDs7CYf21RoO0iQN3QBPLKqKZcfjWk1mZUMH/G8dEbN8hCLX2ZAjDVCunddhftcBpsZ++GjGpMwuMqbTc=
X-Received: by 2002:a05:6e02:2302:b0:3e2:9ffc:bcde with SMTP id
 e9e14a558f8ab-3e32fc8e2d9mr31141265ab.6.1753253820222; Tue, 22 Jul 2025
 23:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250722233923.1356605-1-samuel.holland@sifive.com>
In-Reply-To: <20250722233923.1356605-1-samuel.holland@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 23 Jul 2025 12:26:49 +0530
X-Gm-Features: Ac12FXzqzbz3cC5aEteONemPSmKDt0kTLLTcF78tLQ04_o8Fis4XYR0p28xHdao
Message-ID: <CAAhSdy1DQdriFvvMu=J0AaiS2hezYwZpnEVuQkjwxu-bNDmz8g@mail.gmail.com>
Subject: Re: [PATCH] platform: generic: Pack the FDT after applying fixups
To: Samuel Holland <samuel.holland@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_235701_603183_5E1F4A28 
X-CRM114-Status: GOOD (  14.46  )
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

T24gV2VkLCBKdWwgMjMsIDIwMjUgYXQgNTowOeKAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IFRoaXMgbWluaW1pemVzIHRoZSBzaXplIHRo
YXQgd2lsbCBiZSByZXNlcnZlZCBieSB0aGUgT1MgZm9yIHRoZSBGRFQsIGFuZAo+IGl0IHByZXZl
bnRzIHRoZSBGRFQgYnVmZmVyIGZyb20gY29udGFpbmluZyB1bmluaXRpYWxpemVkIG1lbW9yeSwg
d2hpY2gKPiBjYW4gYmUgaW1wb3J0YW50IGZvciBzb21lIHNpbXVsYXRpb24gcGxhdGZvcm1zIGFu
ZCBmb3IgYXR0ZXN0YXRpb24uCj4KPiBDbG9zZXM6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1z
b2Z0d2FyZS1zcmMvb3BlbnNiaS9pc3N1ZXMvMzg4Cj4gU2lnbmVkLW9mZi1ieTogU2FtdWVsIEhv
bGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFu
dXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+Cj4g
IHBsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0u
YyBiL3BsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYwo+IGluZGV4IDQ3ZTc3MWFkLi44ODlkNjkw
NSAxMDA2NDQKPiAtLS0gYS9wbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMKPiArKysgYi9wbGF0
Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMKPiBAQCAtMjQ1LDYgKzI0NSw4IEBAIGludCBnZW5lcmlj
X2ZpbmFsX2luaXQoYm9vbCBjb2xkX2Jvb3QpCj4gICAgICAgICBmZHRfZml4dXBzKGZkdCk7Cj4g
ICAgICAgICBmZHRfZG9tYWluX2ZpeHVwKGZkdCk7Cj4KPiArICAgICAgIGZkdF9wYWNrKGZkdCk7
Cj4gKwo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+IC0tCj4gMi40Ny4yCj4KPiBiYXNlLWNv
bW1pdDogY2M1NDZlMWEwNjkzMGM1ZWJhZjZlOTBhOWEyOGRjYTQyMThmMTk1NAo+IGJyYW5jaDog
dXAvZmR0LXBhY2sKPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVu
c2JpCg==
