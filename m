Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD558C3DA6D
	for <opensbi@archiver.kernel.org>; Thu, 15 May 2025 13:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qt/POicfCLPKfjiusSef3OERy/rluVt6gkL7u2lYh+U=; b=PqixdF5QW+N8WA
	25FQU3kjHWMORil5af5pRTBvOrpqweWoflKQ31BWKFJMDRCAYgZE1DhP2RhOA2Vco+V2dqvoWmpN4
	kIVwfLv6SAX6ZwfR9R9gG7MZm+AH/8XNfm3B/X6QDOf4ex1XpV9oXS3ysoVcelxF/nznjztGIPaHw
	qzYZdnmD05n/74b+PLGJHBztOIjpB/aqpz6BG1nJHenR5HJDiQ+NBwuPYe2UoJGLbzK50SiwuC/JD
	ZxmCL7eA23+5IWdtjbrgoEiw0r+1caRyHsDbRKuXTS7IKRfael2Rr5YpOx1QT9Yw9n4QvOwp63o8j
	l5XBTnRM9WmDzHyp873Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYfT-00000000jeh-3LCK;
	Thu, 15 May 2025 13:30:35 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYcO-00000000iww-2MHn
	for opensbi@lists.infradead.org;
	Thu, 15 May 2025 13:27:25 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-85e73562577so92672339f.0
        for <opensbi@lists.infradead.org>; Thu, 15 May 2025 06:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1747315643; x=1747920443; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kk7ZSy2Kc5gPI7AAYFSF7deCg59f+Zs0CP119VVKvk=;
        b=vmAWGV0dxbhbIse4KvZ8cbP16WkXZc4gK3SNuZs+bk+NgrJ2GiJeBFgr0ND8wtLIej
         x7dkqDB+/nbgj4loK7/Q/zF278SdHiBxvznhKrQjSqHF1e/IG+mH4MKsriL9dUpBw66U
         GixFqmpY8Gi6hHQJhJHYsiOlpZLYtCIMyJdTPlmtwRafoc446wYiN1IGbJV6utcqlHvW
         jPlCXVSGpYxTl79zwU21OvCbOR0ZKJpGz0FTNaGQ7a+HonLF/72u39tAzP2HpJIRazUp
         uzrKJiChI4UnLgynajD4rDamRdLnXyYsEDMFit9C6jpvttxdlcaJO2PLw9kJRHP5lPAo
         dP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747315643; x=1747920443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/kk7ZSy2Kc5gPI7AAYFSF7deCg59f+Zs0CP119VVKvk=;
        b=R3qK8nzpoTgMzie6n9TaG7PBgb1b5paDAR03XtBKE5/sIRMc0H0kTTQeSzu+L32/Gu
         qIT/laTtt/XQxF9R2kKePbOqfnnEWDDelEdOaUoBNc0sJtUTJIutUfN1b7Ar+N748G1o
         KaV+k6jH6o4A32EGAV3/XRpPfGr6ymI/lXh3n3kGWTtZs4NX0KGDrctEk4VgCgdNYD7R
         UHPHFMRSjMwPqQPQucJY92f7JZVGcI3OklMtIaSCETQW+WkT+QjFlcNEJ/peC1cm0esW
         caN32eGWyBAroWNZgH23+XeodNH9hpo8lt9uQ9K9fwkay7TuWFeyjYaLu6ITXce8l2eb
         jiug==
X-Gm-Message-State: AOJu0YwXyTzOHkTvcFJSCawTNNyy+sJJ1LGhmDuUIA93p9ngCsMLMxwm
	4qb65cHu/Y1wFN2n1VgkqRh4oLxbKdKnD9s15PFTp3ODRnr6sm1aIetafEOuRulChj1dwBDNaw1
	PGFdLB2u9jaZLpidqdp6vA7MiUQdaD4t3XW1JIg8kzNcgd1LK
X-Gm-Gg: ASbGnctzRWAGrMDdBSX+R/wbXsR6ot7M58nlRo1O5BKhk27dog1L6UOfOLF9hS3EDw5
	FmZ5SNf09IH8YK/xP9lo28Dw5iDmOf48iWTnNdwRyq6ihnBBMvXBpa5Yrj1OMTvVZ5O0viQ2iSa
	5Qi8v+dwixwNwfiC0ZlhgYbFIPdxmInxGeMg==
X-Google-Smtp-Source: AGHT+IFmCtrxABql27cXhiG0AvXzOoX63hANZl6bjQHsL+55nFO8IdzYLtCSWPeMttfdjaaYMtesLUlONwug3IZb6SM=
X-Received: by 2002:a05:6e02:2586:b0:3d4:70ab:f96f with SMTP id
 e9e14a558f8ab-3db6f7a26demr81120135ab.8.1747315643169; Thu, 15 May 2025
 06:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250421124729.36364-1-anatoly.parshintsev@syntacore.com>
In-Reply-To: <20250421124729.36364-1-anatoly.parshintsev@syntacore.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 15 May 2025 18:57:11 +0530
X-Gm-Features: AX0GCFt66f6SSa_H8qnBisuddZqbDY-Px2_qYZBR-MFN_ltWMfFqhdgv17A6Lwc
Message-ID: <CAAhSdy3XTK+7vrGPtfNFiQE5+cDg-GKkqf6iKeFbneOhDgrUTA@mail.gmail.com>
Subject: Re: [PATCH] fix missing .debug_frame DWARF section if gcc-based
 toolchain is used
To: Parshintsev Anatoly <anatoly.parshintsev@syntacore.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_062724_603877_75486198 
X-CRM114-Status: GOOD (  23.80  )
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

T24gTW9uLCBBcHIgMjEsIDIwMjUgYXQgNjoxN+KAr1BNIFBhcnNoaW50c2V2IEFuYXRvbHkKPGFu
YXRvbHkucGFyc2hpbnRzZXZAc3ludGFjb3JlLmNvbT4gd3JvdGU6Cj4KPiBXaGVuIE9wZW5TQkkg
aXMgYnVpbHQgd2l0aCBhIHJlbGF0aXZlbHkgbmV3IGNvbXBpbGVyIChnY2MtMTMgYW5kIGdyZWF0
ZXIpCj4gSSBvYnNlcnZlZCB0aGF0IEdEQiBpcyB1bmFibGUgdG8gcHJvZHVjZSBwcm9wZXIgYmFj
a3RyYWNlcyBhbmQgc29tZQo+IHZhcmlhYmxlIHZhbHVlcyBhcHBlYXIgY29ycnVwdGVkIChldmVu
IGlmIHRoZSBhc3NvY2lhdGVkIERXQVJGCj4gbG9jYXRpb24gZGVzY3JpcHRvciBpcyBjb3JyZWN0
KS4KPgo+IFR1cm5zIG91dCB0aGF0IHRvIHByb3Blcmx5IHdvcmsgd2l0aCBkZWJ1ZyBpbmZvcm1h
dGlvbiwgZGVidWdnZXJzIG9mdGVuCj4gbmVlZCB0byB1bndpbmQgdGhlIHN0YWNrLiBUaGV5IGdl
bmVyYWxseSByZWx5IG9uIENhbGwgRnJhbWUgSW5mb3JtYXRpb24KPiAoQ0ZJKSByZWNvcmRzIHBy
b3ZpZGVkIGJ5IHRoZSBjb21waWxlciB0byBmYWNpbGl0YXRlIHRoaXMgdGFzay4KPiBDdXJyZW50
bHksIHRoZSBHQ0MgY29tcGlsZXIgb2ZmZXJzIHR3byBtZWNoYW5pc21zOgo+Cj4gLSBgLmRlYnVn
X2ZyYW1lYCBzZWN0aW9uIChhcyBkZXNjcmliZWQgaW4gdGhlIERXQVJGIHNwZWNpZmljYXRpb24p
Lgo+IC0gYC5laF9mcmFtZWAgc2VjdGlvbnMgKGFzIGRlc2NyaWJlZCBpbiBMU0IgZG9jdW1lbnRz
KS4KPgo+IFRoZSBsYXR0ZXIgKGAuZWhfZnJhbWVgKSBzdXBwb3J0cyBzdGFjayB1bndpbmRpbmcg
YXQgcnVudGltZSwgcHJvdmlkaW5nCj4gYSBmcmFtZXdvcmsgZm9yIEMrKyBleGNlcHRpb25zIG9y
IGVuYWJsaW5nIGJhY2t0cmFjZSBnZW5lcmF0aW9uIHVzaW5nCj4gbGlicmFyaWVzIGxpa2UgbGli
dW53aW5kLiBIb3dldmVyLCB0aGUgZG93bnNpZGUgb2YgdGhpcyBhcHByb2FjaCBpcyB0aGF0Cj4g
dGhlc2Ugc2VjdGlvbnMgc2hvdWxkIGJlIHBhcnQgb2YgbG9hZGFibGUgc2VnbWVudHMuCj4KPiBU
aGUgZm9ybWVyIChgLmRlYnVnX2ZyYW1lYCkgaXMgc2ltcGx5IGFuIG9yZGluYXJ5IGRlYnVnIHNl
Y3Rpb24uCj4KPiBTdGFydGluZyBmcm9tIEdDQyAxMywgTGludXggdGFyZ2V0cyBlbmFibGUgdGhl
IGAtZmFzeW5jaHJvbm91cy11bndpbmQtdGFibGVzYAo+IGFuZCBgLWZ1bndpbmQtdGFibGVzYCBm
bGFncyBieSBkZWZhdWx0LiBSZWxldmFudCBjb21taXQ6Cj4gaHR0cHM6Ly9naXRodWIuY29tL2dj
Yy1taXJyb3IvZ2NjL2NvbW1pdC8zY2QwOGY3MTY4Cj4KPiBXaGVuIHRoZXNlIGZsYWdzIGFyZSBh
Y3RpdmUsIHRoZSBjb21waWxlciBnZW5lcmF0ZXMgYC5laF9mcmFtZWAgc2VjdGlvbnMKPiBpbnN0
ZWFkIG9mIGAuZGVidWdfZnJhbWVgLiBTaW5jZSBPcGVuU0JJIGlzIGJ1aWx0IHVzaW5nIHRoZSAq
KkxpbnV4Cj4gdG9vbGNoYWluKiosIHRoaXMgYmVoYXZpb3IgYXBwbGllcyB0byBPcGVuU0JJIGFz
IHdlbGwuCj4KPiBUaGUgcHJvYmxlbSBhcmlzZXMgYmVjYXVzZSB0aGUgU0JJIGJ1aWxkIHN5c3Rl
bSB1c2VzIGAtV2wsLS1nYy1zZWN0aW9uc2AsIHdoaWNoCj4gZGlzY2FyZHMgdGhlIGAuZWhfZnJh
bWVgIHNlY3Rpb24uCj4KPiBQb3NzaWJsZSBGaXhlczoKPgo+IDEuIEVuZm9yY2UgYC5kZWJ1Z19m
cmFtZWAgZ2VuZXJhdGlvbiDigJMgTW9kaWZ5IGNvbXBpbGVyIGZsYWdzIHRvIGdlbmVyYXRlCj4g
YC5kZWJ1Z19mcmFtZWAgaW5zdGVhZCBvZiBgLmVoX2ZyYW1lYC4KPiAyLiBQcmVzZXJ2ZSBgLmVo
X2ZyYW1lYCBpbiB0aGUgbGlua2VyIHNjcmlwdCDigJMgQWRkIGBLRUVQKCooLmVoX2ZyYW1lKSlg
IHRvCj4gZW5zdXJlIHRoZSBzZWN0aW9uIGlzIG5vdCBkaXNjYXJkZWQuCj4KPiBJIGNob3NlIE9w
dGlvbiAxIGJlY2F1c2UgaXQgYXZvaWRzIGFueSBydW50aW1lIG92ZXJoZWFkLgo+Cj4gU2lnbmVk
LW9mZi1ieTogUGFyc2hpbnRzZXYgQW5hdG9seSA8YW5hdG9seS5wYXJzaGludHNldkBzeW50YWNv
cmUuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQu
b3JnPgoKSSBoYXZlIHNpbXBsaWZpZWQgdGhlIFBBVENIIHN1YmplY3QgYXQgdGhlIHRpbWUgb2Yg
bWVyZ2luZy4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoK
VGhhbmtzLApBbnVwCgo+IC0tLQo+ICBNYWtlZmlsZSB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCj4gaW5k
ZXggZTkwODM2Yy4uODU3NDhiYyAxMDA2NDQKPiAtLS0gYS9NYWtlZmlsZQo+ICsrKyBiL01ha2Vm
aWxlCj4gQEAgLTM2Miw2ICszNjIsNyBAQCBHRU5GTEFHUyAgICArPSAgICAgICQoZmlybXdhcmUt
Z2VuZmxhZ3MteSkKPgo+ICBDRkxBR1MgICAgICAgICA9ICAgICAgIC1nIC1XYWxsIC1XZXJyb3Ig
LWZmcmVlc3RhbmRpbmcgLW5vc3RkbGliIC1mbm8tc3RhY2stcHJvdGVjdG9yIC1mbm8tc3RyaWN0
LWFsaWFzaW5nIC1mZnVuY3Rpb24tc2VjdGlvbnMgLWZkYXRhLXNlY3Rpb25zCj4gIENGTEFHUyAg
ICAgICAgICs9ICAgICAgLWZuby1vbWl0LWZyYW1lLXBvaW50ZXIgLWZuby1vcHRpbWl6ZS1zaWJs
aW5nLWNhbGxzCj4gK0NGTEFHUyAgICAgICAgICs9ICAgICAgLWZuby1hc3luY2hyb25vdXMtdW53
aW5kLXRhYmxlcyAtZm5vLXVud2luZC10YWJsZXMKPiAgIyBPcHRpb25hbGx5IHN1cHBvcnRlZCBm
bGFncwo+ICBpZmVxICgkKENDX1NVUFBPUlRfVkVDVE9SKSx5KQo+ICBDRkxBR1MgICAgICAgICAr
PSAgICAgIC1ET1BFTlNCSV9DQ19TVVBQT1JUX1ZFQ1RPUgo+IC0tCj4gMi40My4wCj4KPgo+Cj4g
LS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0g
Cm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
