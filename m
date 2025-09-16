Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23998CAC587
	for <opensbi@archiver.kernel.org>; Tue, 16 Sep 2025 04:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mOAwoiBjfXWamOsiCnnDlJjggW9GPdxJ5xqMY8lryNc=; b=YUwaHNVxOMNwrk
	+dRi1qnsZTFIM3rIrhwl2Nz+7g9ETO0WCSk5P/foFd2OVZc9nctg674tudURXeZAocs1BNZShAbz4
	5K11pndF3EZNtauvuFWuPztrUoP8ZIVScsv55WfwI/5LCucEgLoj79elxgPEwurKH7ApAbic7mDDT
	QmCB/5SK+Ei9DLR58W+Spk9mZU58xmSxaNaloF7/CiYLoAGWtBPhlBKZNJbkvkj6Nj0A9gQ/bI5IO
	curZ1+utfHEcRGUzZjYemdoRYrjI4AG4nzAtFmlTVm2TmLJQ1JmMst4pOGLSVyTeyXdzlYyCatGYS
	M+BkEqDLMWVSjCZ6+mtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyNHz-00000006h5V-458w;
	Tue, 16 Sep 2025 04:27:35 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyNHw-00000006h58-3SYP
	for opensbi@lists.infradead.org;
	Tue, 16 Sep 2025 04:27:34 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-40809f7ffc7so23875275ab.3
        for <opensbi@lists.infradead.org>; Mon, 15 Sep 2025 21:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1757996852; x=1758601652; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Mh/zcarEV4OuXjEpcZTiE7lxuOGhYY3PaBVEnzkXzc=;
        b=dmc0GfKThocTiHMLvA5Q9rUBvfmkHl8w3KKPBgcebw7VpMIQM9SLyrnwwWjIpFQ/WL
         rSuRV0m7QJ+qphznQnTHf4sohoBx/KvBifxMbclB4A8QUibcswl2/Y9biPbFAzMhdSiZ
         OD13hN1FajyH0W4qjFsDj/yalKcqQIrHmvZnPbFngRr2SUdm1lASUr23yXk8GQkSSSp/
         Vzmn34d56TukApvqePvWdfYrrd8sB7R0CTWb6lnQq5Joq5Nsea+m4geP2k/bbwEVCXgX
         HLssKfiMb9511I/tCNO+91jwLOHMVmC8Bet3+fPkS2tlzvQOlcQU8VCQUUgufcnyEWx9
         jAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757996852; x=1758601652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Mh/zcarEV4OuXjEpcZTiE7lxuOGhYY3PaBVEnzkXzc=;
        b=p+uWDWpMShodWu7XF8H0d+5exGvE92wShX7otDclTjkh84VXi0WQG+fmjJbGXn6Nhh
         phhV9tbFnaSBRykguFk11LVgCdLgPWwpTs1zHiWQVr5tRk/0IQwmm55cyaFFxkM84Bil
         c+HsqSXjhRI/O+7KGMF2kLK6uVhNG6GgqOBHRJXrqLwvDaPhW2UEcfO9VuggGCgYgJmT
         sBWndc8yy30R8H9D0ylXgRrsJ9MVaTyC52DzVIykuBN5xet+TNmXAoYIEvXmK5FpS72e
         TW2loAZifylVY9Hv49DKxz71fX4zHsAIyQVRo/CBuv1h7pALN2uidH3DsmdEDGtvydY7
         YVCg==
X-Forwarded-Encrypted: i=1; AJvYcCXoZTZBuRXy7C51pPrCXSdS4efqADo/BfskvvjuxsAE5Q25rh3IW6VjS7jkUC9Ys6351H4BOeBI@lists.infradead.org
X-Gm-Message-State: AOJu0YxwnJULsBfkKHIEyeO5K93jk6geV9ErVTyU+nTkPVky+bcQyUCV
	P/McJlmk8TDQ0ruIN848MzMbGELRhAqxIjsu5HpDAs2gQSyUCV7x4AXlZnmLEdsLir2f/mkldNg
	HPe3apSAf9ncg9ScfN9jyMGkMtr9YsDD8zZGmYwjmYA==
X-Gm-Gg: ASbGncv+I/QocOg3kaAZmTy+vRwvQyrGxySITKa6n5mdGacmOOLVIsY+oQRK1fgIvbL
	DhkCiCK5OlnZjzF9HhklXC560wfHpprVM3jYicOJ1rdhtt5wyLpw6+C8hRZ1Qhr2CYcd6sunkWD
	CpjSSe+t1H5DoDOQGZy9Uo6rDar1xiXRmpyVu2YJpuDf2XCU1kULC4OhLONGsbkcFgT88FbZucb
	g0rp+BJj1e7681dPfbNF+TgqXf7LQJlCFYKKDZO
X-Google-Smtp-Source: AGHT+IFDWzj2n8JD37IyogqWuyUVNsuMe/PxZo6oO/4/PR3PmRPmwX3TokbDTWzaMdBR50YnS4M9yBZpeDp7vZBTeYA=
X-Received: by 2002:a05:6e02:1568:b0:418:c5b3:da7d with SMTP id
 e9e14a558f8ab-4209d40ff19mr157986035ab.2.1757996851713; Mon, 15 Sep 2025
 21:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250904052410.546818-1-apatel@ventanamicro.com>
In-Reply-To: <20250904052410.546818-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 16 Sep 2025 09:57:19 +0530
X-Gm-Features: AS18NWBOQ9KmQQIN3VViA0sjlSk3j5sgmeQkHheFqGd5B3_cWsovBv31LyijL7A
Message-ID: <CAAhSdy3qiePDGJ1jcQz8hpYJDenKS+ve4dKesspcqQxARJu6mw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] OpenSBI IPI device rating
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_212732_870092_A9D3295C 
X-CRM114-Status: GOOD (  12.28  )
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

T24gVGh1LCBTZXAgNCwgMjAyNSBhdCAxMDo1NOKAr0FNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IEludHJvZHVjZSBJUEkgZGV2aWNlIHJhdGluZyB3aGlj
aCBmdXJ0aGVyIGFsbG93cyB1cyB0byByZW1vdmUgcGxhdGZvcm0KPiBzcGVjaWZpYyBJUEkgaW5p
dCBhbmQgY29udmVydCBJUEkgZHJpdmVycyBhcyBlYXJseSBkcml2ZXJzLgo+Cj4gVGhlc2UgcGF0
Y2hlcyBjYW4gYWxzbyBmb3VuZCBpbiBzYmlfaXBpX3JhdGluZ192MyBicmFuY2ggYXQ6Cj4gaHR0
cHM6Ly9naXRodWIuY29tL2F2cGF0ZWwvb3BlbnNiaS5naXQKPgo+IENoYW5nZXMgc2luY2UgdjI6
Cj4gIC0gUmVuYW1lIHNiaV9pcGlfc2V0X2RldmljZSgpIHRvIHNiaV9pcGlfYWRkX2RldmljZSgp
Cj4gICAgaW4gUEFUQ0gxCj4KPiBDaGFuZ2VzIHNpbmNlIHYxOgo+ICAtIFVzZSBsaW5rZWQtbGlz
dCBpbiBQQVRDSDEgaW5zdGVhZCBvZiBhcnJheQo+ICAtIEluaXRpYWxpemUgYWNsaW50X21zdyBh
ZnRlciBzZXJpYWwgcG9ydCBpbiBQQVRDSDIKPgo+IEFudXAgUGF0ZWwgKDMpOgo+ICAgbGliOiBz
Ymk6IEludHJvZHVjZSBJUEkgZGV2aWNlIHJhdGluZwo+ICAgaW5jbHVkZTogc2JpOiBSZW1vdmUg
cGxhdGZvcm0gc3BlY2lmaWMgSVBJIGluaXQKPiAgIGxpYjogdXRpbHMvaXBpOiBDb252ZXJ0IElQ
SSBkcml2ZXJzIGFzIGVhcmx5IGRyaXZlcnMKPgo+ICBpbmNsdWRlL3NiaS9zYmlfaXBpLmggICAg
ICAgICAgICAgICAgICAgIHwgIDcgKysrLQo+ICBpbmNsdWRlL3NiaS9zYmlfcGxhdGZvcm0uaCAg
ICAgICAgICAgICAgIHwgMTcgLS0tLS0tLS0tCj4gIGluY2x1ZGUvc2JpX3V0aWxzL2lwaS9mZHRf
aXBpLmggICAgICAgICAgfCAyNiAtLS0tLS0tLS0tLS0tCj4gIGxpYi9zYmkvc2JpX2luaXQuYyAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBsaWIvc2JpL3NiaV9pcGkuYyAgICAgICAg
ICAgICAgICAgICAgICAgIHwgNDggKysrKysrKysrKysrKysrKystLS0tLS0tCj4gIGxpYi91dGls
cy9pcGkvYWNsaW50X21zd2kuYyAgICAgICAgICAgICAgfCAgMyArLQo+ICBsaWIvdXRpbHMvaXBp
L2FuZGVzX3BsaWNzdy5jICAgICAgICAgICAgIHwgIDMgKy0KPiAgbGliL3V0aWxzL2lwaS9mZHRf
aXBpLmMgICAgICAgICAgICAgICAgICB8IDIyIC0tLS0tLS0tLS0tCj4gIGxpYi91dGlscy9pcGkv
ZmR0X2lwaV9kcml2ZXJzLmNhcnJheSAgICAgfCAgMyAtLQo+ICBsaWIvdXRpbHMvaXBpL2ZkdF9p
cGlfbXN3aS5jICAgICAgICAgICAgIHwgIDIgKy0KPiAgbGliL3V0aWxzL2lwaS9mZHRfaXBpX3Bs
aWNzdy5jICAgICAgICAgICB8ICAyICstCj4gIGxpYi91dGlscy9pcGkvb2JqZWN0cy5tayAgICAg
ICAgICAgICAgICAgfCAgNyArLS0tCj4gIGxpYi91dGlscy9pcnFjaGlwL2ltc2ljLmMgICAgICAg
ICAgICAgICAgfCAgMyArLQo+ICBwbGF0Zm9ybS9mcGdhL2FyaWFuZS9wbGF0Zm9ybS5jICAgICAg
ICAgIHwgMjkgKysrKysrKy0tLS0tLS0KPiAgcGxhdGZvcm0vZ2VuZXJpYy9vcGVuaHdncm91cC9v
cGVucGl0b24uYyB8IDIzICsrKysrLS0tLS0tLQo+ICBwbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3Jt
LmMgICAgICAgICAgICAgIHwgIDIgLQo+ICBwbGF0Zm9ybS9rZW5kcnl0ZS9rMjEwL3BsYXRmb3Jt
LmMgICAgICAgIHwgMTcgKysrKy0tLS0tCj4gIHBsYXRmb3JtL251Y2xlaS91eDYwMC9wbGF0Zm9y
bS5jICAgICAgICAgfCAxNSArKysrLS0tLQo+ICBwbGF0Zm9ybS90ZW1wbGF0ZS9wbGF0Zm9ybS5j
ICAgICAgICAgICAgIHwgMjAgKysrKy0tLS0tLQo+ICAxOSBmaWxlcyBjaGFuZ2VkLCA5NiBpbnNl
cnRpb25zKCspLCAxNTUgZGVsZXRpb25zKC0pCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBpbmNsdWRl
L3NiaV91dGlscy9pcGkvZmR0X2lwaS5oCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBsaWIvdXRpbHMv
aXBpL2ZkdF9pcGkuYwo+ICBkZWxldGUgbW9kZSAxMDA2NDQgbGliL3V0aWxzL2lwaS9mZHRfaXBp
X2RyaXZlcnMuY2FycmF5Cj4KCkFwcGxpZWQgdGhpcyBzZXJpZXMgdG8gdGhlIHJpc2N2L29wZW5z
YmkgcmVwby4KClRoYW5rcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL29wZW5zYmkK
