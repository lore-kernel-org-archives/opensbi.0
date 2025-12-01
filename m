Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC18D111A8
	for <opensbi@archiver.kernel.org>; Mon,  1 Dec 2025 05:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JH1fOpFYOAgYUMbma/2zWyOWFRewg4Zw8y+O4h7vOb4=; b=v9B/0A/oENEzhV
	bTWXft59QYsEDTCs+fpT/XQw5z7nkGqcoWun/cVqATU4t1+5cuC6B9MHBI27Tw9PvBcJTKZeQxzDS
	ZeH37UG1eLUU87rKa4ExYrKV+4F+5tdc120tHu0dr4DNViOiVymvVqAgChZ/spQX1ALkLwZCPl2T+
	g6lNt+wZxdigjccuAF5pnnmCvpk7UmqF7DzSzbv83i+HAjXjPOjFn0iEqkjmZi9Vi9IsOn0r7az36
	E5Tzlshs94kcbzs965s3POxIw9tG47jxFLHFSHlKoY8NIsAOvERZYTGX/XXrjw32KwlONEQVlTxLz
	Fi9wD7RIl83JD5uCNtDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPw95-00000002v3C-1FEd;
	Mon, 01 Dec 2025 05:08:19 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPw91-00000002v2n-3gdv
	for opensbi@lists.infradead.org;
	Mon, 01 Dec 2025 05:08:17 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-43376624a8fso20242065ab.0
        for <opensbi@lists.infradead.org>; Sun, 30 Nov 2025 21:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1764565694; x=1765170494; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q80RS/GO0Vu3q/XGQmjqvfPNTIsSsd5TIPzyQPAS3vE=;
        b=ltQBvQD7xDv6o5x00l9HqrvavawWVGJCjuWgQxHdWe7pQs/QULtR+hk6IbNy3gjJOg
         ffGiJJX+u/MTskx/OTGRSpp6uHDEknQOc8USUmitMoVEp7/gQ8cDKN+XIoBDUsHMW/cM
         0fM2dt5dOiJOys1VlmbMPJgxkVdbXCAphCipGf7IenaavnTKnmeCWC8HEsfHlN4I7zNr
         XQ5UN1S5xsY0XFo4Id7LwDiuOz5slZb2Vk+1ilviB5BeSf4Y7b251AQLF2QdPm9FsxbL
         pEKofRyQOdYy3NkUvbYRQ8CzAYwV5+XlWLPfMpcUzK/0Vxu8q1NLFHn4t0JmQFRkikD4
         UHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764565694; x=1765170494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q80RS/GO0Vu3q/XGQmjqvfPNTIsSsd5TIPzyQPAS3vE=;
        b=oStxVbbTzGoZcOT97v7g7XOlufS9JiRjapCkwvYJ5rwUKywqfz91qZ4vjq+XPDqGaP
         9f1ILsafbTHQVXMSPDo5pJ6ZHn5NWhzp+M6QK/0CowF7McezgAuVcmrjY4HXfFDfnF0K
         1x/1SSzARBuHhTFQrFcYAf7mZLRZBnu0g75JWXlKEnVSlMGOT2xSHCQq08F0rIchuO52
         xoXH2Rt5Ph5sxahAAZW6mgBVcwfdXI16hvas/w6x5cWreS7M+AhKYJz7lZi3bIsatiKx
         5sj9I/yEFSH/bwrI3JgOZMIN1YwUC4ZQ/EXCs9W/Bov6WRuIsdvoMcm9gokHzm5k2hdO
         UIkg==
X-Gm-Message-State: AOJu0YwJwdlX5amZxe4bCl+1DUzU124ozPr/6VQg/u3e19xVWgUc+/SV
	s/0TIxvpqU/iNGixyRsESaOqREHpjrS2SHpZCfilJGw6kXIJaZIgtP4mX406njb5VOnpLo+a9Su
	mP2ndB8Es/qL9isdAt4/PNYVJj6qSdAMukNjpYJ8pcg==
X-Gm-Gg: ASbGnct+SsrG6tXYdFyXjMnMH2fqoDiC832VGjHYptOFz3Fjv6LiqwcomH+zcmI9PP5
	zV9umdqtLwnvOsZANkJBbswJ5bT63B8ERnWJbBsaMkNztE0wcJj3daYP5taCPzHHhKRW6xEjl4o
	YwshpvRxSQXznZO4b4aCJTdaKGf+tRzVzqBtPpQjM2FbNlHPv1ne/Z/4FHjOo8q5oJYJW2l9yap
	z9OT87PnxICqGM4mBMiXNhQfOKjrSeg44MU3zDq7syU78rxuSREX3QAAnu3IXLsI9gLbA==
X-Google-Smtp-Source: AGHT+IEXpUg+f/X/5Y0Xj1dlrCAXRoQeNF3Vnxwo5QJkcqWThO5rVv3Ecqjon1i0H8gll3QAicqnrDxZ6j9/SbTySVU=
X-Received: by 2002:a05:6e02:3e06:b0:434:96ea:ff6c with SMTP id
 e9e14a558f8ab-435dd12d9e9mr190315595ab.37.1764565693921; Sun, 30 Nov 2025
 21:08:13 -0800 (PST)
MIME-Version: 1.0
References: <20251107075412.1350-1-manuel.hernandez@openchip.com>
In-Reply-To: <20251107075412.1350-1-manuel.hernandez@openchip.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 1 Dec 2025 10:38:02 +0530
X-Gm-Features: AWmQ_blDUNc18boWY7iw1i84gTG6NnlEjvBLPzkXYCKrb_7xLrIhzA5GlAmDHI0
Message-ID: <CAAhSdy1quYDyTCf-uH+Xx=GnsNk_x88VNsAPFvpkv+zeF-GY3A@mail.gmail.com>
Subject: Re: [PATCH] platform: ariane: parse dtb for getting some initial parameters
To: =?UTF-8?Q?Manuel_Hern=C3=A1ndez_=7C_OPENCHIP?= <manuel.hernandez@openchip.com>
Cc: "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_210816_032129_D5F19B35 
X-CRM114-Status: GOOD (  17.10  )
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

T24gRnJpLCBOb3YgNywgMjAyNSBhdCAxOjI04oCvUE0gTWFudWVsIEhlcm7DoW5kZXogfCBPUEVO
Q0hJUAo8bWFudWVsLmhlcm5hbmRlekBvcGVuY2hpcC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogTWFu
dWVsIEhlcm7DoW5kZXogTcOpbmRleiA8bWFudWVsLmhlcm5hbmRlekBvcGVuY2hpcC5jb20+Cj4K
PiBBZGQgY29kZSBmb3IgZ2V0dGluZyBzb21lIHVhcnQsIGNsaW50IGFuZCBwbGljIHBhcmFtZXRl
cnMgZnJvbQo+IGRldmljZSB0cmVlLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWFudWVsIEhlcm7DoW5k
ZXogTcOpbmRleiA8bWFudWVsLmhlcm5hbmRlekBvcGVuY2hpcC5jb20+CgpMR1RNLgoKUmV2aWV3
ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMgcGF0
Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKPiAtLS0KPiAgcGxh
dGZvcm0vZ2VuZXJpYy9vcGVuaHdncm91cC9hcmlhbmUuYyB8IDM5ICsrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9vcGVuaHdncm91cC9hcmlh
bmUuYyBiL3BsYXRmb3JtL2dlbmVyaWMvb3Blbmh3Z3JvdXAvYXJpYW5lLmMKPiBpbmRleCA2OTMx
ZTNmMC4uNzBhOTdmMzggMTAwNjQ0Cj4gLS0tIGEvcGxhdGZvcm0vZ2VuZXJpYy9vcGVuaHdncm91
cC9hcmlhbmUuYwo+ICsrKyBiL3BsYXRmb3JtL2dlbmVyaWMvb3Blbmh3Z3JvdXAvYXJpYW5lLmMK
PiBAQCAtOSwxNiArOSw4IEBACj4gICNpbmNsdWRlIDxzYmlfdXRpbHMvZmR0L2ZkdF9maXh1cC5o
Pgo+ICAjaW5jbHVkZSA8c2JpX3V0aWxzL2lwaS9hY2xpbnRfbXN3aS5oPgo+ICAjaW5jbHVkZSA8
c2JpX3V0aWxzL2lycWNoaXAvcGxpYy5oPgo+IC0jaW5jbHVkZSA8c2JpX3V0aWxzL3NlcmlhbC91
YXJ0ODI1MC5oPgo+ICAjaW5jbHVkZSA8c2JpX3V0aWxzL3RpbWVyL2FjbGludF9tdGltZXIuaD4K
Pgo+IC0jZGVmaW5lIEFSSUFORV9VQVJUX0FERFIgICAgICAgICAgICAgICAgICAgICAgIDB4MTAw
MDAwMDAKPiAtI2RlZmluZSBBUklBTkVfVUFSVF9GUkVRICAgICAgICAgICAgICAgICAgICAgICA1
MDAwMDAwMAo+IC0jZGVmaW5lIEFSSUFORV9VQVJUX0JBVURSQVRFICAgICAgICAgICAgICAgICAg
IDExNTIwMAo+IC0jZGVmaW5lIEFSSUFORV9VQVJUX1JFR19TSElGVCAgICAgICAgICAgICAgICAg
IDIKPiAtI2RlZmluZSBBUklBTkVfVUFSVF9SRUdfV0lEVEggICAgICAgICAgICAgICAgICA0Cj4g
LSNkZWZpbmUgQVJJQU5FX1VBUlRfUkVHX09GRlNFVCAgICAgICAgICAgICAgICAgMAo+IC0jZGVm
aW5lIEFSSUFORV9VQVJUX0NBUFMgICAgICAgICAgICAgICAgICAgICAgIDAKPiAgI2RlZmluZSBB
UklBTkVfUExJQ19BRERSICAgICAgICAgICAgICAgICAgICAgICAweGMwMDAwMDAKPiAgI2RlZmlu
ZSBBUklBTkVfUExJQ19TSVpFICAgICAgICAgICAgICAgICAgICAgICAoMHgyMDAwMDAgKyBcCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChBUklBTkVf
SEFSVF9DT1VOVCAqIDB4MTAwMCkpCj4gQEAgLTY2LDIxICs1OCwzOCBAQCBzdGF0aWMgc3RydWN0
IGFjbGludF9tdGltZXJfZGF0YSBtdGltZXIgPSB7Cj4gICAqLwo+ICBzdGF0aWMgaW50IGFyaWFu
ZV9lYXJseV9pbml0KGJvb2wgY29sZF9ib290KQo+ICB7Cj4gKyAgICAgICBjb25zdCB2b2lkICpm
ZHQ7Cj4gKyAgICAgICBzdHJ1Y3QgcGxpY19kYXRhIHBsaWNfZGF0YSA9IHBsaWM7Cj4gKyAgICAg
ICB1bnNpZ25lZCBsb25nIGFjbGludF9mcmVxOwo+ICsgICAgICAgdWludDY0X3QgY2xpbnRfYWRk
cjsKPiAgICAgICAgIGludCByYzsKPgo+ICAgICAgICAgaWYgKCFjb2xkX2Jvb3QpCj4gICAgICAg
ICAgICAgICAgIHJldHVybiAwOwo+Cj4gLSAgICAgICByYyA9IHVhcnQ4MjUwX2luaXQoQVJJQU5F
X1VBUlRfQUREUiwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICBBUklBTkVfVUFSVF9GUkVR
LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgIEFSSUFORV9VQVJUX0JBVURSQVRFLAo+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgIEFSSUFORV9VQVJUX1JFR19TSElGVCwKPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICBBUklBTkVfVUFSVF9SRUdfV0lEVEgsCj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgQVJJQU5FX1VBUlRfUkVHX09GRlNFVCwKPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICBBUklBTkVfVUFSVF9DQVBTKTsKPiArICAgICAgIHJjID0gZ2VuZXJpY19lYXJs
eV9pbml0KGNvbGRfYm9vdCk7Cj4gICAgICAgICBpZiAocmMpCj4gICAgICAgICAgICAgICAgIHJl
dHVybiByYzsKPgo+ICsgICAgICAgZmR0ID0gZmR0X2dldF9hZGRyZXNzKCk7Cj4gKwo+ICsgICAg
ICAgcmMgPSBmZHRfcGFyc2VfdGltZWJhc2VfZnJlcXVlbmN5KGZkdCwgJmFjbGludF9mcmVxKTsK
PiArICAgICAgIGlmICghcmMpCj4gKyAgICAgICAgICAgICAgIG10aW1lci5tdGltZV9mcmVxID0g
YWNsaW50X2ZyZXE7Cj4gKwo+ICsgICAgICAgcmMgPSBmZHRfcGFyc2VfY29tcGF0X2FkZHIoZmR0
LCAmY2xpbnRfYWRkciwgInJpc2N2LGNsaW50MCIpOwo+ICsgICAgICAgaWYgKCFyYykgewo+ICsg
ICAgICAgICAgICAgICBtc3dpLmFkZHIgPSBjbGludF9hZGRyOwo+ICsgICAgICAgICAgICAgICBt
dGltZXIubXRpbWVfYWRkciA9IGNsaW50X2FkZHIgKyBDTElOVF9NVElNRVJfT0ZGU0VUICsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBQ0xJTlRfREVGQVVMVF9NVElNRV9P
RkZTRVQ7Cj4gKyAgICAgICAgICAgICAgIG10aW1lci5tdGltZWNtcF9hZGRyID0gY2xpbnRfYWRk
ciArIENMSU5UX01USU1FUl9PRkZTRVQgKwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIEFDTElOVF9ERUZBVUxUX01USU1FQ01QX09GRlNFVDsKPiArICAgICAgIH0KPiAr
Cj4gKyAgICAgICByYyA9IGZkdF9wYXJzZV9wbGljKGZkdCwgJnBsaWNfZGF0YSwgInJpc2N2LHBs
aWMwIik7Cj4gKyAgICAgICBpZiAoIXJjKQo+ICsgICAgICAgICAgICAgICBwbGljID0gcGxpY19k
YXRhOwo+ICsKPiAgICAgICAgIHJldHVybiBhY2xpbnRfbXN3aV9jb2xkX2luaXQoJm1zd2kpOwo+
ICB9Cj4KPiAtLQo+IDIuMzQuMQo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5z
YmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5zYmkK
