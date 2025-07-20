Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87613C83F22
	for <opensbi@archiver.kernel.org>; Sun, 20 Jul 2025 08:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eAo3lEQ9E0+HwZU8zFfPeQt67wfenFe7EqQzDtM2LpQ=; b=qNW2oBRBHYmFnh
	Oqi0a0dXBHJdY6uD2MN4KsvB+95tR/qCjxWVfr6tzJAJmWgFFajvKxDPZgXXXaSeVlz9cbLc5BOnq
	q36uz7SdmXVidYR726KuQHryV9AROhyVYr8C7fE9ntmWx57R4pidMuM9BS8XUb4W8moiN5nQWQff/
	7QE3uHw06lhtQ55pzN8tHhdOXtGS6ygV13HeLN6Iuto/0+7T3XcJsCznnyp+zW5zbO/I7SS+mG0nT
	dw0eTmshLDb0gG1dB2PgPalPSRSi9bb7QIsqncCHXMZHJ80Zr0FyWzrtQaiMNddEDOeiwt1xnRDN7
	ITTWB32/DFbyIbbBxorA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udPdd-0000000F38c-0dxv;
	Sun, 20 Jul 2025 08:43:17 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udPda-0000000F37p-2HGh
	for opensbi@lists.infradead.org;
	Sun, 20 Jul 2025 08:43:16 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3e28be470f1so15562515ab.0
        for <opensbi@lists.infradead.org>; Sun, 20 Jul 2025 01:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1753000993; x=1753605793; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5rgZRTqWkUHqxTc8WBpse+ODRjEvrMGz8w9bKrKSxQ=;
        b=qXPIKwooI6lZqiShZy+9iN4TebiZVUaq4osQvXkUbCDkXpqIBiLPehUnMw4OprXPWN
         mdKAiobNDREd4mX/qv0hG4vbw454PqyLVQSlxTaFt2l9qPR5MD6v/dpK7wGQxSc1rjNc
         TBPu5YvejJPUspEAogYYK1VyR1Vd8M2F538Mf5iby/RqujctAkgWFvf6w1DsVxNK8awy
         zEqF5Dky9ds5VVxKC+9ihYdLv08kdOlBEtn0xJNSE3UJKzI4+E/w3BZpVP6XeXRDnsAK
         Fk0+psGqGpVVjCECFDCOwj2uHggSh/ZntxR9xRGFh53iHmfyZu1jlEgZ+3an0IyCTool
         XTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753000993; x=1753605793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N5rgZRTqWkUHqxTc8WBpse+ODRjEvrMGz8w9bKrKSxQ=;
        b=bMwxGrD8wzVyyp53K/h7l7MLP/pEz7nvtqSr3VNyoxqrvE74GhL6We17cjKs40ONfS
         XWFowu/1unJjGmsdFwFEbEF9LmL6PrVZ3dRnvMFRykHLCkmSwruOW1cOnng4m4oGqQDd
         GLWYK9t0y5N71uZJ5m9FJAwInsbRqMsqJmn41gcstjipq/MhFBgoDpvUjgBZuVlnnetn
         KPEXHv+A0k3qL82wQNer6RUnQZMKVikfhm/aVPGmLh5+hAzCMlblQpKf6hvLjZe1VHWM
         PUuwA5dXol0Khf631ZCPJl2zGEG6pi1zrsNhiLmi8itTNJbMvGYxjda2Fqt9W49QdNDf
         vlMw==
X-Gm-Message-State: AOJu0YytiU1oXg1l3ig+p919UikqTwUsoROiXnJDXi4eWobIzVwNpScZ
	5OEQ3R/V1CZwzw1LctI7ZoZOkZYcHbE67TqtIYZBkqWHNMTmhmuRpecyKF17YTvhtDJxiDcNRGz
	ApmrELq2txi9ZrTPTA4twfWCTJNlYIloVV7r6SCk62g==
X-Gm-Gg: ASbGncvcFcj6cYS14RGZ370pssx+e1r/nurIzcfJNJZZROkF36IO5bEiOZvIXxNeDKu
	U0HekZ/hMkhzegUTHR5GlTSQfk/1lANR4se2WM9ZohBzXm2cxgUdQ+PMJX/yL25JIB88FYrL7PM
	VSNju86fLf+R3ITDUSsP33fTqW9jvF4u8qbjE1giG3xhDo9YaaImZwlaYjlHHfKw8IjI8qO656w
	vAzPXzC
X-Google-Smtp-Source: AGHT+IHxwydi/GSZFfpLksPL6t5pNL5aEnygubfEjwElK3jPYNjZnIIZPftdu9ufT1ndl0Y0n+W8IMRLsayrk7M4ljU=
X-Received: by 2002:a05:6e02:5e85:b0:3dc:879b:be95 with SMTP id
 e9e14a558f8ab-3e2959af8b6mr77999845ab.5.1753000992822; Sun, 20 Jul 2025
 01:43:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAFPVDjSstmSEeF=YLzVrV2mUSAU1UVO4_zu4RyUzgvE1g_awYQ@mail.gmail.com>
In-Reply-To: <CAFPVDjSstmSEeF=YLzVrV2mUSAU1UVO4_zu4RyUzgvE1g_awYQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 20 Jul 2025 14:13:02 +0530
X-Gm-Features: Ac12FXyGdVDyjoPk8Ow89f_I0hoBsHUsSQhmwH6xBItPnhGn7KSO4XbGWcpSqoc
Message-ID: <CAAhSdy3UJEoBjOtXuRyYaN3_cDqGaLAq_kV2cn3zteH5EL7+sw@mail.gmail.com>
Subject: Re: [PATCH] platform: generic: Add support for UltraRISC DP1000 SoC platform
To: Neo <neopimail@gmail.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_014314_824282_77D40F3B 
X-CRM114-Status: GOOD (  22.97  )
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

T24gTW9uLCBKdW4gMTYsIDIwMjUgYXQgMTE6MjfigK9BTSBOZW8gPG5lb3BpbWFpbEBnbWFpbC5j
b20+IHdyb3RlOgo+Cj4gVGhpcyBwYXRjaCBhZGRzIGluaXRpYWwgcGxhdGZvcm0gc3VwcG9ydCBm
b3IgdGhlIFVsdHJhUklTQyBEUDEwMDAgU29DCj4gdG8gT3BlblNCSS4KPgo+IFRoZSBVbHRyYVJJ
U0MgRFAxMDAwIGlzIGEgbXVsdGktY29yZSBSSVNDLVYgNjQtYml0IFNvQyBkZXZlbG9wZWQgYnkK
PiBVbHRyYVJJU0MgVGVjaG5vbG9neSAoU2hhbmdoYWkpIENvLiwgTHRkLgo+Cj4gV2UgaW50ZW5k
IHRvIHVwc3RyZWFtIERQMTAwMCBzdXBwb3J0IHRvIGFsaWduIHdpdGggT3BlblNCSSdzIG1pc3Np
b24KPiBvZiBzdXBwb3J0aW5nIGRpdmVyc2UgUklTQy1WIHBsYXRmb3JtcyBhbmQgdG8gc2ltcGxp
Znkgc3VwcG9ydCBmb3IKPiBMaW51eCBhbmQgVS1Cb290IG9uIFVsdHJhUklTQyBoYXJkd2FyZS4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFlpIFBlaSA8bmVvcGltYWlsQGdtYWlsLmNvbT4KPiAtLS0KPiBw
bGF0Zm9ybS9nZW5lcmljL0tjb25maWcgfCA0ICsrKysKPiBwbGF0Zm9ybS9nZW5lcmljL2NvbmZp
Z3MvZGVmY29uZmlnIHwgMSArCj4gcGxhdGZvcm0vZ2VuZXJpYy91bHRyYXJpc2MvZHAxMDAwLmMg
fCAxNyArKysrKysrKysrKysrKysrKwo+IHBsYXRmb3JtL2dlbmVyaWMvdWx0cmFyaXNjL29iamVj
dHMubWsgfCA4ICsrKysrKysrCj4gNCBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCj4g
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBsYXRmb3JtL2dlbmVyaWMvdWx0cmFyaXNjL2RwMTAwMC5jCj4g
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBsYXRmb3JtL2dlbmVyaWMvdWx0cmFyaXNjL29iamVjdHMubWsK
PiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9LY29uZmlnIGIvcGxhdGZvcm0vZ2VuZXJp
Yy9LY29uZmlnCj4gaW5kZXggNjg4ZGEzZjQuLjU0ZjE2NzRkIDEwMDY0NAo+IC0tLSBhL3BsYXRm
b3JtL2dlbmVyaWMvS2NvbmZpZwo+ICsrKyBiL3BsYXRmb3JtL2dlbmVyaWMvS2NvbmZpZwo+IEBA
IC02OCw2ICs2OCwxMCBAQCBjb25maWcgUExBVEZPUk1fVEhFQUQKPiBzZWxlY3QgVEhFQURfQzlY
WF9QTVUKPiBkZWZhdWx0IG4KPiArY29uZmlnIFBMQVRGT1JNX1VMVFJBUklTQ19EUDEwMDAKPiAr
IGJvb2wgIlVsdHJhUklTQyBEUDEwMDAgc3VwcG9ydCIKPiArIGRlZmF1bHQgbgo+ICsKPiBzb3Vy
Y2UgIiQoT1BFTlNCSV9TUkNfRElSKS9wbGF0Zm9ybS9nZW5lcmljL2FuZGVzL0tjb25maWciCj4g
c291cmNlICIkKE9QRU5TQklfU1JDX0RJUikvcGxhdGZvcm0vZ2VuZXJpYy90aGVhZC9LY29uZmln
Igo+IGRpZmYgLS1naXQgYS9wbGF0Zm9ybS9nZW5lcmljL2NvbmZpZ3MvZGVmY29uZmlnCj4gYi9w
bGF0Zm9ybS9nZW5lcmljL2NvbmZpZ3MvZGVmY29uZmlnCj4gaW5kZXggYmIyNjA2MjYuLjcxNzkw
NmVmIDEwMDY0NAo+IC0tLSBhL3BsYXRmb3JtL2dlbmVyaWMvY29uZmlncy9kZWZjb25maWcKPiAr
KysgYi9wbGF0Zm9ybS9nZW5lcmljL2NvbmZpZ3MvZGVmY29uZmlnCj4gQEAgLTYsNiArNiw3IEBA
IENPTkZJR19QTEFURk9STV9TSUZJVkVfRlU3NDA9eQo+IENPTkZJR19QTEFURk9STV9TT1BIR09f
U0cyMDQyPXkKPiBDT05GSUdfUExBVEZPUk1fU1RBUkZJVkVfSkg3MTEwPXkKPiBDT05GSUdfUExB
VEZPUk1fVEhFQUQ9eQo+ICtDT05GSUdfUExBVEZPUk1fVUxUUkFSSVNDX0RQMTAwMD15Cj4gQ09O
RklHX0ZEVF9DUFBDPXkKPiBDT05GSUdfRkRUX0NQUENfUlBNST15Cj4gQ09ORklHX0ZEVF9HUElP
PXkKPiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy91bHRyYXJpc2MvZHAxMDAwLmMKPiBi
L3BsYXRmb3JtL2dlbmVyaWMvdWx0cmFyaXNjL2RwMTAwMC5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiBpbmRleCAwMDAwMDAwMC4uZjIxYjI4NzUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGxh
dGZvcm0vZ2VuZXJpYy91bHRyYXJpc2MvZHAxMDAwLmMKPiBAQCAtMCwwICsxLDE3IEBACj4gKy8v
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBCU0QtMi1DbGF1c2UKPiArLyoKPiArICogQ29weXJp
Z2h0IChDKSAyMDI1IFVsdHJhUklTQyxJbmMKPiArICovCj4gKwo+ICsjaW5jbHVkZSA8cGxhdGZv
cm1fb3ZlcnJpZGUuaD4KPiArI2luY2x1ZGUgPHNiaS9zYmlfcGxhdGZvcm0uaD4KPiArI2luY2x1
ZGUgPHNiaV91dGlscy9mZHQvZmR0X2hlbHBlci5oPgo+ICsKPiArc3RhdGljIGNvbnN0IHN0cnVj
dCBmZHRfbWF0Y2ggdWx0cmFyaXNjX2RwMTAwMF9tYXRjaFtdID0gewo+ICsgey5jb21wYXRpYmxl
ID0gInVsdHJhcmlzYyxkcDEwMDAifSwKPiArIHt9LAo+ICt9Owo+ICsKPiArY29uc3Qgc3RydWN0
IHBsYXRmb3JtX292ZXJyaWRlIHVsdHJhcmlzY19kcDEwMDAgPSB7Cj4gKyAubWF0Y2hfdGFibGUg
PSB1bHRyYXJpc2NfZHAxMDAwX21hdGNoLAo+ICt9OwoKQWRkaW5nIHBsYXRmb3JtX292ZXJyaWRl
IHRvIE9wZW5TQkkgZ2VuZXJpYyBwbGF0Zm9ybSBpcwpvbmx5IG5lZWRlZCBpZiB0aGVyZSBpcyBz
b21lIHBsYXRmb3JtIHNwZWNpZmljIGluaXRpYWxpemF0aW9uCnJlcXVpcmVkLiAgSXQgc2VlbXMg
dGhlcmUgaXMgbm8gVWx0cmFSSVNDIERQMTAwMCBzcGVjaWZpYwppbml0aWFsaXphdGlvbiBzbyB0
aGlzIHBhdGNoIGlzIG5vdCBuZWVkZWQuCgpSZWdhcmRzLApBbnVwCgo+IGRpZmYgLS1naXQgYS9w
bGF0Zm9ybS9nZW5lcmljL3VsdHJhcmlzYy9vYmplY3RzLm1rCj4gYi9wbGF0Zm9ybS9nZW5lcmlj
L3VsdHJhcmlzYy9vYmplY3RzLm1rCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAw
MDAwMC4uNzFlNjZmMzUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGxhdGZvcm0vZ2VuZXJpYy91
bHRyYXJpc2Mvb2JqZWN0cy5tawo+IEBAIC0wLDAgKzEsOCBAQAo+ICsjCj4gKyMgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEJTRC0yLUNsYXVzZQo+ICsjCj4gKyMgQ29weXJpZ2h0IChDKSAyMDI1
IFVsdHJhUklTQyxJbmMKPiArIwo+ICsKPiArY2FycmF5LXBsYXRmb3JtX292ZXJyaWRlX21vZHVs
ZXMtJChDT05GSUdfUExBVEZPUk1fVUxUUkFSSVNDX0RQMTAwMCkKPiArPSB1bHRyYXJpc2NfZHAx
MDAwCj4gK3BsYXRmb3JtLW9ianMtJChDT05GSUdfUExBVEZPUk1fVUxUUkFSSVNDX0RQMTAwMCkg
Kz0gdWx0cmFyaXNjL2RwMTAwMC5vCj4gLS0KPiAyLjM0LjEKPgo+IC0tCj4gb3BlbnNiaSBtYWls
aW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcg
bGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
