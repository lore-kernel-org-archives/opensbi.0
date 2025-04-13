Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDD6C3601E
	for <opensbi@archiver.kernel.org>; Sun, 13 Apr 2025 16:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YpeY6u7gcgjqUhnGZtgHxCoxVeornqZssvO05PCGSmw=; b=tShQZIhzFA/8GS
	6+4j0Dz/QxbvIeWGHuolcwUkbqOkbIoIskI29q5s1ie+HCgSLKXOfux/g/ZmDx6EUoo5fw/2amhbO
	gF8U4nyx0tiQqZJYc4flKwWQXkh7tW1MgTiM9mxOC3Ovbtfgtkw784Akf8x5huTUQ/EFZypGmqTEU
	clxKuoz3PWL2Ic/uqQpb1y1pFoicFqJEqgmUYg/bXUBuMbYVVeIU2UKwN8+T7PLZm9RHyyorTm3wU
	7/wFWJdYl86B3P8yQd4K5d71X5uKEZzPg9LzO2vm8ud92X9qQyEOy2IpDhdtNF4iYMM8MowJOLE95
	QQUvDP9ogP4SZFJ6fDIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u40Dq-0000000HNIH-01Rs;
	Sun, 13 Apr 2025 16:30:18 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u40Dn-0000000HNHv-2UJI
	for opensbi@lists.infradead.org;
	Sun, 13 Apr 2025 16:30:16 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3d439f01698so13883115ab.1
        for <opensbi@lists.infradead.org>; Sun, 13 Apr 2025 09:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744561814; x=1745166614; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PPrD5b6HPSEyKhz1mFEGvGtAGp6vse5ivQdpHQD24nI=;
        b=kE7XO1HHISXZpXlzUaK9KZMxGIogmv9v4HUb9xj623r3Ti2UIae+wHCE8frnTDgXHX
         2GxzEBpWms/eSvFwWFuRZmQ6zL5CHpxBR8oEO/LHFAFwOr6NGl/SEETcW2Zv9GDFCYRn
         F1d60/VAdMx9qyvV9lPnyf1YClBPJmAo1I7OYxFdym7XoPtmmGl0iO3NQ3cAZIcP9hsw
         f+6rzEGXuUPbyjy1CMbxv9d0pOacv+L97iQlznlnWz77k7vaXv3UZfKKr66kPP9hbhCx
         4GPu/7psKnC+l1E+7/VYMM4kvKlBfY6uEN8u4UU+71npVR4sqHo0ER2Yzk7KfJ7G60Jk
         hdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744561814; x=1745166614;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PPrD5b6HPSEyKhz1mFEGvGtAGp6vse5ivQdpHQD24nI=;
        b=LFtPvlSzxfx+RsKPKf5BBNM1hwEYD87dK1IGzePTwTcSpvsnt/ZBsosSVKY8DZe4uL
         q0P2/4yVn0LQVV6dTFM44iOJXLLC/ZFw4J/YcM8Wcyq25+Cw4OVQ4mtwgVRRfg9nYWTQ
         pEN8ktggomfIlL7hK1yuThKg+TcEcB4xedv8RE/9n6fOxSwKNXPy62yUmB48rTlxXQQ0
         QIEtaFrbqR/pM4Fmcmmz3eyaMg4B6SXXxFYTrSs2THOMDc8pGqagPydCsB5VopzrdTBD
         aWJAfeH4nQB8L4TFRJYctpz97/aMBD0mEswJ/5t2gn6AUljKOdaXGUEJRS3NAP2QwlQ4
         rjpA==
X-Forwarded-Encrypted: i=1; AJvYcCV+8Nxy+uwOheGMMflxjjionvq7kzMTNbJ1Bf+yN/zHt3sxlCUJ/XQJY/QvJLofE/QeGwHILf2q@lists.infradead.org
X-Gm-Message-State: AOJu0YxJT0gOVLyFhJa0138DzzBVaN+pqpCRXrx/7VjRRLSwGFkYi7Wx
	JfLBRkjMrnn2tr/thjaOmMKXYPNmzwgXfFew/aciWs07fDX8Z6NGDj57PrrQNBA=
X-Gm-Gg: ASbGncuRfNAhMzAHNL3so5Z2Ma5rFWURJMN6TpLgVZnPqnV8ybhwwLB8NlWWnEn6TAO
	WTTbqaSuTXxE/Do24jOcRIV8lNuNJpyx3pOSzaQc1QclT1FIHeir6PnLjUSdI0gyuyA0B2nAvW/
	jPIi0M+A3TBRMDWSG3ogOGLsKKVVspJZ2k4VZJh4dfjF5yPGlX1P3fNNE5HCS+2zjUIUZyYKX4c
	B/pv4KZfNRM7oxOfSOCq7TgdyYTRsh0Ybey7q0Pd7IPYKImm9bEaOIv1q94Ksx3hEJQerbsqXlD
	o/PuTkI2a2Vf5/OnHLsk2Xzd4TvXfQAHaWT32tyIBnVwsjLWburYgV7rtw==
X-Google-Smtp-Source: AGHT+IEskXcR7BGzfL15ET8AK9VXD0rnQqXOrzo4FMJlAapTTyVE134ODxqxsUB4qr6d7/Jq/pRckw==
X-Received: by 2002:a05:6e02:1c2c:b0:3d6:cb49:1e5f with SMTP id e9e14a558f8ab-3d7e4c3abc6mr129956445ab.2.1744561814025;
        Sun, 13 Apr 2025 09:30:14 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.166])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505d3b9fbsm2188126173.73.2025.04.13.09.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 09:30:13 -0700 (PDT)
Message-ID: <ebd20f94-7bb8-4755-93ea-92643f8f6be6@sifive.com>
Date: Sun, 13 Apr 2025 11:30:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] lib: sbi: Enable Control Transfer Records (CTR) Ext
 using xstateen.
To: Atish Patra <atishp@rivosinc.com>
Cc: Rajnesh Kanwal <rkanwal@rivosinc.com>, opensbi@lists.infradead.org,
 alistair.francis@wdc.com, apatel@ventanamicro.com, beeman@rivosinc.com,
 Anup Patel <anup@brainfault.org>
References: <20250307124451.122828-1-rkanwal@rivosinc.com>
 <bb9d0867-0aea-46b7-9f8c-3a700081c086@sifive.com>
 <5fa2aa42-9438-47f5-93c5-406cd9996765@rivosinc.com>
 <CAAhSdy39X-sYfakakWnpfB2YYG2X0CWgthHD6uYTEo6RGanH1Q@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <CAAhSdy39X-sYfakakWnpfB2YYG2X0CWgthHD6uYTEo6RGanH1Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_093015_663906_554D8F89 
X-CRM114-Status: GOOD (  25.24  )
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

SGkgQXRpc2gsCgpPbiAyMDI1LTA0LTEzIDg6NDEgQU0sIEFudXAgUGF0ZWwgd3JvdGU6Cj4gT24g
RnJpLCBBcHIgMTEsIDIwMjUgYXQgMTI6MznigK9BTSBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9z
aW5jLmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIDMvMzEvMjUgNTo0NiBQTSwgU2FtdWVsIEhvbGxhbmQg
d3JvdGU6Cj4+PiBIaSBSYWpuZXNoLAo+Pj4KPj4+IE9uIDIwMjUtMDMtMDcgNjo0NCBBTSwgUmFq
bmVzaCBLYW53YWwgd3JvdGU6Cj4+Pj4gVGhlIENvbnRyb2wgVHJhbnNmZXIgUmVjb3JkcyAoQ1RS
KSBleHRlbnNpb24gcHJvdmlkZXMgYSBtZXRob2QgdG8KPj4+PiByZWNvcmQgYSBsaW1pdGVkIGJy
YW5jaCBoaXN0b3J5IGluIHJlZ2lzdGVyLWFjY2Vzc2libGUgaW50ZXJuYWwgY2hpcAo+Pj4+IHN0
b3JhZ2UuCj4+Pj4KPj4+PiBUaGlzIGV4dGVuc2lvbiBpcyBzaW1pbGFyIHRvIEFyY2ggTEJSIGlu
IHg4NiBhbmQgQlJCRSBpbiBBUk0uCj4+Pj4gVGhlIEV4dGVuc2lvbiBoYXMgYmVlbiBzdGFibGUg
YW5kIHRoZSBsYXRlc3QgcmVsZWFzZSBjYW4gYmUgZm91bmQgaGVyZQo+Pj4+IGh0dHBzOi8vZ2l0
aHViLmNvbS9yaXNjdi9yaXNjdi1jb250cm9sLXRyYW5zZmVyLXJlY29yZHMvcmVsZWFzZQo+Pj4+
Cj4+Pj4gU2lnbmVkLW9mZi1ieTogUmFqbmVzaCBLYW53YWwgPHJrYW53YWxAcml2b3NpbmMuY29t
Pgo+Pj4+Cj4+Pj4gLS0tCj4+Pj4gQ2hhbmdlcyBpbiBWMzoKPj4+PiAgICAgICAgICBSZW1vdmVk
IEZXRlQgYml0LiBJdCB3YXMgZGlzY3Vzc2VkIGluIHRlY2gtcHJzIGdyb3VwIHRvCj4+Pj4gICAg
ICAgICAgdXNlIHRyYXAgYW5kIGVuYWJsZSBhcHByb2FjaCByYXRoZXIgdGhhbiBGV0ZUIGJpdC4g
VHJhcAo+Pj4+ICAgICAgICAgIGFuZCBlbmFibGUgYXBwcm9hY2ggbGVhZHMgdG8gbGV0dGVyIG51
bWJlciBvZiB0cmFwcyB0aGFuCj4+Pj4gICAgICAgICAgZW5hYmxpbmcgYW5kIGRpc2FibGluZyBG
V0ZUIGJpdCBvbiBlYWNoIENUUiB1c2FnZS4KPj4+PiAgICAgICAgICBodHRwczovL2xpc3RzLnJp
c2N2Lm9yZy9nL3RlY2gtcHJzL21lc3NhZ2UvMTMzOQo+Pj4KPj4+IElmIHlvdSB3YW50IHRvIHVz
ZSB0aGUgdHJhcCBhbmQgZW5hYmxlIGFwcHJvYWNoLCB0aGVuIHlvdSBjYW5ub3QgZW5hYmxlIHRo
ZQo+Pj4gbXN0YXRlZW4wIGJpdCBieSBkZWZhdWx0LCBvciB5b3Ugd2lsbCBuZXZlciB0cmFwLiBU
aGlzIGlzIGFsc28gbWlzc2luZyB0aGUgY29kZQo+Pj4gZm9yIHRoZSB0cmFwIGhhbmRsZXIuCj4+
Pgo+Pgo+PiBJIHRoaW5rIHlvdSBtZWFuIHlvdSBjYW4ndCB0cmFwIGluIE0tbW9kZS4gSG93ZXZl
ciwgdGhlcmUgaXMgbm8gdXNlIGNhc2UKPj4gZm9yIE0tbW9kZSBwcm9maWxpbmcuCj4+Cj4+IFRo
ZSBQUlMgZGlzY3Vzc2lvbiB3YXMgYXJvdW5kIGhvdyB3ZSBoYW5kbGUgQ1RSIHN0YXRlIGZvciBn
dWVzdHMgd2hlcmUKPj4gdGhlIGVhcmxpZXIgYXBwcm9hY2ggdXNlZCBGV0ZUIGluc3RlYWQgb2Yg
dGhlIHRyYXAvZW5hYmxlLgoKRm9yIGNsYXJpdHk6IHllcywgSSBkbyBtZWFuIHRyYXBwaW5nIGlu
IE0tbW9kZS4gVGhpcyBpcyBub3QgZm9yIE0tbW9kZQpwcm9maWxpbmcsIGJ1dCB0byBoYW5kbGUg
Q1RSIHN0YXRlIGZvciAoSClTLW1vZGUgZG9tYWlucywganVzdCBsaWtlIEhTLW1vZGUKbmVlZHMg
dHJhcHBpbmcgdG8gaGFuZGxlIHN0YXRlIGZvciBWUy1tb2RlIGd1ZXN0cy4gVGhlIHNhbWUgcmF0
aW9uYWxlIGZvcgp0cmFwcGluZyBhcHBsaWVzIGF0IGJvdGggcHJpdmlsZWdlIG1vZGVzLgoKPj4+
Pgo+Pj4+IENoYW5nZXMgaW4gVjI6Cj4+Pj4gICAgICAgICAgQWRkZWQgRldGVCBiaXQgZm9yIENU
Ui4KPj4+PiAtLS0KPj4+PiAgIGluY2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmggfCAxMyArKysr
KysrKysrKysrCj4+Pj4gICBpbmNsdWRlL3NiaS9zYmlfaGFydC5oICAgICAgIHwgIDQgKysrKwo+
Pj4+ICAgbGliL3NiaS9zYmlfaGFydC5jICAgICAgICAgICB8ICA3ICsrKysrKysKPj4+PiAgIDMg
ZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmggYi9pbmNsdWRlL3NiaS9yaXNjdl9lbmNvZGluZy5o
Cj4+Pj4gaW5kZXggMDNjNjhhNTcuLmYzZTJhZmQ1IDEwMDY0NAo+Pj4+IC0tLSBhL2luY2x1ZGUv
c2JpL3Jpc2N2X2VuY29kaW5nLmgKPj4+PiArKysgYi9pbmNsdWRlL3NiaS9yaXNjdl9lbmNvZGlu
Zy5oCj4+Pj4gQEAgLTM3NSw2ICszNzUsMTcgQEAKPj4+PiAgICNkZWZpbmUgQ1NSX1NTVEFURUVO
MiAgICAgICAgICAgICAgICAgICAgICAweDEwRQo+Pj4+ICAgI2RlZmluZSBDU1JfU1NUQVRFRU4z
ICAgICAgICAgICAgICAgICAgICAgIDB4MTBGCj4+Pj4KPj4+PiArLyogTWFjaGluZS1MZXZlbCBD
b250cm9sIHRyYW5zZmVyIHJlY29yZHMgQ1NScyAqLwo+Pj4+ICsjZGVmaW5lIENTUl9NQ1RSQ1RM
ICAgICAgICAgICAgICAgICAgICAgMHgzNGUKPj4+PiArCj4+Pj4gKy8qIFN1cGVydmlzb3ItTGV2
ZWwgQ29udHJvbCB0cmFuc2ZlciByZWNvcmRzIENTUnMgKi8KPj4+PiArI2RlZmluZSBDU1JfU0NU
UkNUTCAgICAgICAgICAgICAgICAgICAgIDB4MTRlCj4+Pj4gKyNkZWZpbmUgQ1NSX1NDVFJTVEFU
VVMgICAgICAgICAgICAgICAgICAweDE0Zgo+Pj4+ICsjZGVmaW5lIENTUl9TQ1RSREVQVEggICAg
ICAgICAgICAgICAgICAgMHgxNWYKPj4+PiArCj4+Pj4gKy8qIFZTLUxldmVsIENvbnRyb2wgdHJh
bnNmZXIgcmVjb3JkcyBDU1JzICovCj4+Pj4gKyNkZWZpbmUgQ1NSX1ZTQ1RSQ1RMICAgICAgICAg
ICAgICAgICAgICAweDI0ZQo+Pj4+ICsKPj4+PiAgIC8qID09PT09IEh5cGVydmlzb3ItbGV2ZWwg
Q1NScyA9PT09PSAqLwo+Pj4+Cj4+Pj4gICAvKiBIeXBlcnZpc29yIFRyYXAgU2V0dXAgKEgtZXh0
ZW5zaW9uKSAqLwo+Pj4+IEBAIC03OTksNiArODEwLDggQEAKPj4+PiAgICNkZWZpbmUgU01TVEFU
RUVOMF9DUyAgICAgICAgICAgICAgICAgICAgICAoX1VMTCgxKSA8PCBTTVNUQVRFRU4wX0NTX1NI
SUZUKQo+Pj4+ICAgI2RlZmluZSBTTVNUQVRFRU4wX0ZDU1JfU0hJRlQgICAgICAgICAgICAgIDEK
Pj4+PiAgICNkZWZpbmUgU01TVEFURUVOMF9GQ1NSICAgICAgICAgICAgICAgICAgICAoX1VMTCgx
KSA8PCBTTVNUQVRFRU4wX0ZDU1JfU0hJRlQpCj4+Pj4gKyNkZWZpbmUgU01TVEFURUVOMF9DVFJf
U0hJRlQgICAgICAgICAgICAgICAgNTQKPj4+PiArI2RlZmluZSBTTVNUQVRFRU4wX0NUUiAgICAg
ICAgICAgICAgICAgICAgICAoX1VMTCgxKSA8PCBTTVNUQVRFRU4wX0NUUl9TSElGVCkKPj4+PiAg
ICNkZWZpbmUgU01TVEFURUVOMF9DT05URVhUX1NISUZUICAgNTcKPj4+PiAgICNkZWZpbmUgU01T
VEFURUVOMF9DT05URVhUICAgICAgICAgKF9VTEwoMSkgPDwgU01TVEFURUVOMF9DT05URVhUX1NI
SUZUKQo+Pj4+ICAgI2RlZmluZSBTTVNUQVRFRU4wX0lNU0lDX1NISUZUICAgICAgICAgICAgIDU4
Cj4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmggYi9pbmNsdWRlL3NiaS9z
YmlfaGFydC5oCj4+Pj4gaW5kZXggNGMzNmM3NzguLmMzYTdmZWI3IDEwMDY0NAo+Pj4+IC0tLSBh
L2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmgKPj4+PiArKysgYi9pbmNsdWRlL3NiaS9zYmlfaGFydC5o
Cj4+Pj4gQEAgLTc1LDYgKzc1LDEwIEBAIGVudW0gc2JpX2hhcnRfZXh0ZW5zaW9ucyB7Cj4+Pj4g
ICAgICBTQklfSEFSVF9FWFRfWklDRklTUywKPj4+PiAgICAgIC8qKiBIYXJ0IGhhcyBTc2RibHRy
cCBleHRlbnNpb24gKi8KPj4+PiAgICAgIFNCSV9IQVJUX0VYVF9TU0RCTFRSUCwKPj4+PiArICAg
IC8qKiBIQVJUIGhhcyBDVFIgTS1tb2RlIENTUnMgKi8KPj4+PiArICAgIFNCSV9IQVJUX0VYVF9T
TUNUUiwKPj4+PiArICAgIC8qKiBIQVJUIGhhcyBDVFIgUy1tb2RlIENTUnMgKi8KPj4+PiArICAg
IFNCSV9IQVJUX0VYVF9TU0NUUiwKPj4+Pgo+Pj4+ICAgICAgLyoqIE1heGltdW0gaW5kZXggb2Yg
SGFydCBleHRlbnNpb24gKi8KPj4+PiAgICAgIFNCSV9IQVJUX0VYVF9NQVgsCj4+Pj4gZGlmZiAt
LWdpdCBhL2xpYi9zYmkvc2JpX2hhcnQuYyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+Pj4+IGluZGV4
IDhlMjk3OWI1Li5jMzQzODA1YyAxMDA2NDQKPj4+PiAtLS0gYS9saWIvc2JpL3NiaV9oYXJ0LmMK
Pj4+PiArKysgYi9saWIvc2JpL3NiaV9oYXJ0LmMKPj4+PiBAQCAtMTA1LDYgKzEwNSwxMSBAQCBz
dGF0aWMgdm9pZCBtc3RhdHVzX2luaXQoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoKQo+Pj4+
ICAgICAgICAgICAgICBlbHNlCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgbXN0YXRlZW5fdmFs
ICY9IH4oU01TVEFURUVOMF9TVlNMQ1QpOwo+Pj4+Cj4+Pj4gKyAgICAgICAgICAgIGlmIChzYmlf
aGFydF9oYXNfZXh0ZW5zaW9uKHNjcmF0Y2gsIFNCSV9IQVJUX0VYVF9TU0NUUikpCj4+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgbXN0YXRlZW5fdmFsIHw9IFNNU1RBVEVFTjBfQ1RSOwo+Pj4+ICsg
ICAgICAgICAgICBlbHNlCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgbXN0YXRlZW5fdmFsICY9
IH5TTVNUQVRFRU4wX0NUUjsKPj4+Cj4+PiBUaGUgcHVycG9zZSBvZiB0aGUgU21zdGF0ZWVuIGV4
dGVuc2lvbiBpcyB0byBwcmV2ZW50IHNpZGUgY2hhbm5lbHMgYmV0d2Vlbgo+Pj4gY29udGV4dHMs
IGJ5IGJsb2NraW5nIGFjY2VzcyB0byByZWdpc3RlcnMgdGhhdCBhcmUgbm90IGNvbnRleHQgc3dp
dGNoZWQuIFRoYXQKPj4+IG1lYW5zIGFueSBjb2RlIHRoYXQgc2V0cyBhIG5ldyBtc3RhdGVlbjAg
Yml0IG5lZWRzIHRvIGFsc28gaW5jbHVkZSBjb2RlIHRvCj4+PiBwZXJmb3JtIHRoZSBjb250ZXh0
IHN3aXRjaCwgb3IgeW91IGFyZSBjcmVhdGluZyB0aGUgc2lkZSBjaGFubmVsIGFueXdheS4KPj4+
Cj4+Cj4+IHllcy4gV2UgbmVlZCB0byBzYXZlL3Jlc3RvcmUgdGhlIENUUiBzdGF0ZSBkdXJpbmcg
ZG9tYWluIGNvbnRleHQgc3dpdGNoLgo+PiBJIGFtIG5vdCBhd2FyZSBvZiBhbnkgdXNlIGNhc2Vz
IHdoZXJlIHdlIGFyZSBhY3R1YWxseSBydW5uaW5nIHR3bwo+PiBkaWZmZXJlbnQgd29ybGRzIHdp
dGggb3BlbnNiaSBkb21haW5zIHRoYXQgcmVxdWlyZSB0aGlzIGF0IHRoaXMgcG9pbnQuCgpVcHN0
cmVhbSBPcGVuU0JJIGRvZXMgbm90IGhhdmUgYW55IGJ1aWx0LWluIHdheSB0byB0cmlnZ2VyIGEg
ZG9tYWluIGNvbnRleHQKc3dpdGNoIGF0IHRoZSBtb21lbnQsIGJ1dCB0aGVyZSBhcmUgc2V2ZXJh
bCBkb3duc3RyZWFtIGZvcmtzL3VzZXJzIHRoYXQgZG8sIGZvcgpleGFtcGxlIHRoZSBPUC1URUUg
YW5kIFN0YW5kYWxvbmVNTSBQb0NzLiBUaGVzZSBtYXkgaGF2ZSBwcm9kdWN0aW9uIHVzZXJzLCBp
Zgpub3QgYWxyZWFkeSwgdGhlbiBzb29uLgoKPj4gT25jZSB3ZSBoYXZlIGZ1bGwgc3VwZXJ2aXNv
ciBkb21haW4gZXh0ZW5zaW9uIHN1cHBvcnQsIHRoZXNlIG11c3QgYmUKPj4gdGFrZW4gY2FyZSBv
Zi4gQ2FuIHdlIG1lcmdlIHRoaXMgd2l0aCBhIFRPRE8gaXRlbSBhYm91dCBkb21haW4gY29udGV4
dAo+PiBzd2l0Y2ggaXNzdWUgPwo+IAo+IElkZWFsbHksIHdlIHNob3VsZCBub3QgbGVhdmUgdGhl
IENUUiBzdGF0ZSBlbmFibGVkIGJ5IGRlZmF1bHQgZXZlbgo+IGluIGFic2VuY2Ugb2YgZG9tYWlu
IGNvbnRleHQgc3dpdGNoLiBDdXJyZW50bHksIHdlIGFscmVhZHkgaGF2ZQo+IEFJQSBhbmQgYSBm
ZXcgb3RoZXIgYml0cyB3aGljaCBhcmUgZW5hYmxlZCBieSBkZWZhdWx0IGluIG1zdGF0ZWVuMAo+
IGF0IGJvb3QtdGltZSBidXQgdGhvc2Ugc2hvdWxkIGFsc28gYmUgZW5hYmxlZCBsYXppbHkgdXBv
biBmaXJzdCBhY2Nlc3MKPiBmYXVsdCB0byBhbGlnbiB3aXRoIHRoZSBwdXJwb3NlIG9mIFNtc3Rh
dGVlbiBleHRlbnNpb24uCj4gCj4gRm9yIG5vdywgbGV0J3MgZ28gYWhlYWQgd2l0aCB0aGlzIHBh
dGNoIGJ1dCBzZXBhcmF0ZWx5IHdlIG5lZWQgdG8KPiBhZGQgaW5mcmFzdHJ1Y3R1cmUgaW4gT3Bl
blNCSSB0byBsYXppbHkgZW5hYmxlIGJpdHMgaW4gU21zdGF0ZWVuCj4gdXBvbiBmaXJzdC1hY2Nl
c3MtdHJhcC4KClJpZ2h0LCB0aGlzIGlzIG5vdCB0aGUgZmlyc3QgZXh0ZW5zaW9uIG1pc3Npbmcg
Y29udGV4dCBzd2l0Y2ggc3VwcG9ydC4gVGhpcwpwYXRjaCBpcyBhZGRpbmcgbW9yZSB0ZWNobmlj
YWwgZGVidCwgYnV0IGl0IGlzIG5vdCByZWFsbHkgYSBuZXcgcHJvYmxlbSwgc28gSQpjYW4gYWNj
ZXB0IHB1c2hpbmcgb2ZmIHRoZSBmaXggZm9yIG5vdy4KClJlZ2FyZHMsClNhbXVlbAoKCi0tIApv
cGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
