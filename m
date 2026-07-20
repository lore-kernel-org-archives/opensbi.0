Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C013AC44515
	for <opensbi@archiver.kernel.org>; Mon, 20 Jul 2026 08:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jz2NclluPAoiMXTSY6juaTkqgHHwo9sK70aIou76GkM=; b=uw69DXU4wjwRmN
	E7kUstQmF0B2suNhu3Mr1U/njpRu5t4KAGfGaKW7ZIRHXFTTS8hEo4T1QoWSme53/vIqYGGV/5X6A
	1bGxFzYb63GAedtJAAZrawEhR1RTjQfTslB94IHsdb5ic+Q+e3Ty8Q6j5Zjw/V0WGACjCgJL/u9c8
	geuu8TY7Zb4fm8ibWXUcX9aBtZCvy64c5P3OELkxCFAIWsioOV76Po3eXqwhoBoWOFUpJ9y1MI2sf
	ir7ZnIPx6UqN4SlqVNCx4bGnMoZoVtAbh7bw+uZFShgGD8wj4LIsuRq2VafeT5UTVYP0SK+S5YkjJ
	JkDJITWp1fHqgMMDYPmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljm9-00000006FYd-3Dz4;
	Mon, 20 Jul 2026 08:55:01 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljm7-00000006FXH-2IVN
	for opensbi@lists.infradead.org;
	Mon, 20 Jul 2026 08:55:00 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2ceae1ed204so75901215ad.0
        for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 01:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1784537699; x=1785142499; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lWk+3JUF440aPxO5fxU5ALhAnRx6CRMFdcKrFmi02yw=;
        b=lEVuNUNKKF7wCVrwSlsaG1zlscwjEirVZfjlBkGI6ErJxSX7dOoisPtOiQRSMSxiS9
         9Ace99e6UXZ0bjATKeqV7pOt15ooEc64/563EaLAa4xHjExBcWcl6KmbSmAjr08Y8QBz
         gxq3cfOzjXKHeoyaIsLLqRpIEcN0WyLhzs7/sa4Ho5fed5sK+YtvVPwXBBhm0ykIPPd6
         wGYE6k3waTi3ysd93HGxGJBIeWRie9oI4vLc3xCMHmSU/BwrtCVE5OsIh+p80oudSRbN
         xtJJYamAzT3/otf8yptSCSQNIRQ8MftbfAzU8WI4HGVLd0HcOni3HgsGZeyCh+k4FTa/
         Gyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537699; x=1785142499;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lWk+3JUF440aPxO5fxU5ALhAnRx6CRMFdcKrFmi02yw=;
        b=YvHecHIwdt3ZZZtoyb2uv8EV6Lw7JGH64Vk0ko8ZxHzdq5DNvEO2qfvrjYur1mCb9d
         Rx/jFjV8G/g4N94WUC7M/MU60rZnzM55G6hWaeTT/C6focDOiXKqLf3FCfpGhRtBtiHd
         6JYEQvbrdkBUDAt1ATAzU2dv/SRXJp2pdsT3U+HhlMnTsOCTfMdihv5tfbc57Roo3+nA
         xoYDYmAcqcBH1gh3NZ5E45TBoeJ3pp3QGk5h4CTfAAF0QpSfA/PqNhY868BkmsfZcEiP
         gljoJ2pGQdM7081Lmv+16OryqV70OJp//J8zXTcEKblxvdXE3OvwMIc886Rm7wCAe44i
         5g8A==
X-Gm-Message-State: AOJu0YyJa5vFf/SKPQtsKqenVZeKfiDlCyWj43FoBsiU2E9Qcz5ZnJV7
	e4rEafGpgCFyp/vsDGchZqRqmiKda5ZZKeIjY9IcRPJUAhn0uK2hOhn+rWpN2+ks2xU=
X-Gm-Gg: AfdE7cmCXgrRZawd4xDNzKFD8SAIrllIiaZY40AvefOfsoqynM0nNxjYIMGXKKA7PT1
	C5l8LC3UCFoFeSNLTOoxgAElucveDE1k20N8zlSXc+o7826miLdFimAIUqQKAkVrg2+MzRqqmCm
	BQsNO0eErmeZ+rCzhp6D9aq3SFcIdQMn0IN8p2+Y4LO8WRs+P9iP1TunZXIUKma29C3LnVwo4Zv
	wyx73xTm0mm0uz+UDA4OPnXYBvL56bY9DzlViKlPUKvhiHxNqApHpM1lO7+0JWiPPLNeLdYyfzi
	fmiKHO8GTJ7GoDwUCgs6fSaYDBU8uWZ4/kOMWq7eUQyD1BMtbGGdOOdXuFKjrkfzQoUCdWq3dIP
	wMFQqDiLQNfPatrIv6tXygC4EGrzOOJsPUxm+tw0DNZjapglTWlBC2UmRhRfTuX+bZ5jl6X69B/
	nb
X-Received: by 2002:a17:902:ce89:b0:2c9:c083:cd50 with SMTP id d9443c01a7336-2cf3489232amr141924135ad.17.1784537698592;
        Mon, 20 Jul 2026 01:54:58 -0700 (PDT)
Received: from plin-1878 ([136.226.240.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346db041sm52768475ad.51.2026.07.20.01.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:54:58 -0700 (PDT)
Date: Mon, 20 Jul 2026 16:54:53 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com,
	greentime.hu@sifive.com, anup@brainfault.org, scott@riscstar.com,
	conor@kernel.org, dave.patel@riscstar.com, raymond.mao@riscstar.com,
	robin.randhawa@sifive.com, samuel.holland@sifive.com
Subject: Re: [RFC PATCH 09/12] platform: generic: parse root domain WID
 config from DT
Message-ID: <al3iXVFNChVjXsHa@plin-1878>
References: <20260626101433.3133466-1-peter.lin@sifive.com>
 <20260626101433.3133466-10-peter.lin@sifive.com>
 <CAAVgOk+==we31kXGJxG0XQeRY4B0e9rR3e_4PLT22WwVy-e-dQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAVgOk+==we31kXGJxG0XQeRY4B0e9rR3e_4PLT22WwVy-e-dQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_015459_602863_26564743 
X-CRM114-Status: GOOD (  19.83  )
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

T24gV2VkLCBKdWwgMDgsIDIwMjYgYXQgMDU6Mzk6MzRQTSAtMDcwMCwgUGF3YW5kZWVwIE96YSB3
cm90ZToKPiBPbiBGcmksIEp1biAyNiwgMjAyNiBhdCAzOjE34oCvQU0gWXUtQ2hpZW4gUGV0ZXIg
TGluIDxwZXRlci5saW5Ac2lmaXZlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gUGFyc2Ugcm9vdC1kb21h
aW4tbmV4dC13aWQgKDMyLWJpdCkgYW5kIHJvb3QtZG9tYWluLW5leHQtd2lkbGlzdAo+ID4gKDY0
LWJpdCkgcHJvcGVydGllcyBmcm9tIC9jaG9zZW4vb3BlbnNiaSxjb25maWcgbm9kZSBkdXJpbmcK
PiA+IGdlbmVyaWNfZG9tYWluc19pbml0KCkuIFNldHMgcm9vdC5uZXh0X3dpZC9oYXNfbmV4dF93
aWQgYW5kCj4gPiByb290Lm5leHRfd2lkbGlzdC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZdS1D
aGllbiBQZXRlciBMaW4gPHBldGVyLmxpbkBzaWZpdmUuY29tPgo+ID4gLS0tCj4gPiAgcGxhdGZv
cm0vZ2VuZXJpYy9wbGF0Zm9ybS5jIHwgMjAgKysrKysrKysrKysrKysrKysrKy0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYg
LS1naXQgYS9wbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMgYi9wbGF0Zm9ybS9nZW5lcmljL3Bs
YXRmb3JtLmMKPiA+IGluZGV4IDUxZTlmMzQyLi5kZTEyZGViNSAxMDA2NDQKPiA+IC0tLSBhL3Bs
YXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYwo+ID4gKysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9wbGF0
Zm9ybS5jCj4gPiBAQCAtMTEsNiArMTEsNyBAQAo+ID4gICNpbmNsdWRlIDxwbGF0Zm9ybV9vdmVy
cmlkZS5oPgo+ID4gICNpbmNsdWRlIDxzYmkvcmlzY3ZfYXNtLmg+Cj4gPiAgI2luY2x1ZGUgPHNi
aS9zYmlfYml0b3BzLmg+Cj4gPiArI2luY2x1ZGUgPHNiaS9zYmlfZG9tYWluLmg+Cj4gPiAgI2lu
Y2x1ZGUgPHNiaS9zYmlfaGFydG1hc2suaD4KPiA+ICAjaW5jbHVkZSA8c2JpL3NiaV9oZWFwLmg+
Cj4gPiAgI2luY2x1ZGUgPHNiaS9zYmlfcGxhdGZvcm0uaD4KPiA+IEBAIC0yNzYsNyArMjc3LDkg
QEAgaW50IGdlbmVyaWNfZXh0ZW5zaW9uc19pbml0KGJvb2wgY29sZF9ib290KQo+ID4gIGludCBn
ZW5lcmljX2RvbWFpbnNfaW5pdCh2b2lkKQo+ID4gIHsKPiA+ICAgICAgICAgY29uc3Qgdm9pZCAq
ZmR0ID0gZmR0X2dldF9hZGRyZXNzKCk7Cj4gPiAtICAgICAgIGludCBvZmZzZXQsIHJldDsKPiA+
ICsgICAgICAgY29uc3QgZmR0MzJfdCAqdmFsOwo+ID4gKyAgICAgICBpbnQgbGVuLCBvZmZzZXQs
IHJldDsKPiA+ICsgICAgICAgdTY0IHZhbDY0Owo+ID4KPiA+ICAgICAgICAgcmV0ID0gZmR0X2Rv
bWFpbnNfcG9wdWxhdGUoZmR0KTsKPiA+ICAgICAgICAgaWYgKHJldCA8IDApCj4gPiBAQCAtMjkw
LDYgKzI5MywyMSBAQCBpbnQgZ2VuZXJpY19kb21haW5zX2luaXQodm9pZCkKPiA+ICAgICAgICAg
ICAgICAgICBpZiAob2Zmc2V0ID49IDAgJiYKPiA+ICAgICAgICAgICAgICAgICAgICAgZmR0X2dl
dF9wcm9wZXJ0eShmZHQsIG9mZnNldCwgInN5c3RlbS1zdXNwZW5kLXRlc3QiLCBOVUxMKSkKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgIHNiaV9zeXN0ZW1fc3VzcGVuZF90ZXN0X2VuYWJsZSgp
Owo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgIGlmIChvZmZzZXQgPj0gMCkgewo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgdmFsID0gZmR0X2dldHByb3AoZmR0LCBvZmZzZXQsICJyb290LWRv
bWFpbi1uZXh0LXdpZCIsICZsZW4pOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKHZh
bCAmJiBsZW4gPT0gc2l6ZW9mKGZkdDMyX3QpKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHJvb3QubmV4dF93aWQgPSBmZHQzMl90b19jcHUodmFsWzBdKTsKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcm9vdC5oYXNfbmV4dF93aWQgPSB0cnVlOwo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgdmFsID0gZmR0X2dldHByb3AoZmR0LCBvZmZzZXQsICJyb290LWRvbWFpbi1uZXh0LXdpZGxp
c3QiLCAmbGVuKTsKPiBPemE6IFJvb3QgZG9tYWluIFdJRCBjb25maWcgaXMgc2VtYW50aWNhbGx5
IGlkZW50aWNhbCB0byBwZXItZG9tYWluCj4gV0lEIGNvbmZpZyBidXQgbGl2ZXMgaW4gYSBjb21w
bGV0ZWx5IGRpZmZlcmVudCBEVCBsb2NhdGlvbgo+IHJvb3QgY2FuIGJlIGFub3RoZXIgZGVmYXVs
dCBkb21haW4gdW5kZXIgY2hvc2VuIHsgb3BlbnNiaS1kb21haW5zIHsKClN1cmUsIGl0IHdvdWxk
IGJlIGJldHRlciB0byBoYXZlIHJvb3QgZG9tYWluIHdpZCBjb25maWd1cmF0aW9uCnNwZWNpZmll
ZCB1bmRlciB0aGUgb3BlbnNiaS1kb21haW4gcGFyZW50IG5vZGUgYWxvbmdzaWRlIG90aGVyCmRv
bWFpbnMuIEkgYWxzbyBhbSBwbGFubmluZyB0byBpbnRyb2R1Y2UgIm9wZW5zYmksZG9tYWluLGlu
c3RhbmNlLHJvb3QiCmNvbXBhdGlibGUgc3RyaW5nLgoKVGhhbmtzLApQZXRlciBMaW4KCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBpZiAodmFsICYmIChsZW4gPT0gKDIgKiBzaXplb2YoZmR0
MzJfdCkpKSkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2YWw2NCA9IGZk
dDMyX3RvX2NwdSh2YWxbMF0pOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2
YWw2NCA9ICh2YWw2NCA8PCAzMikgfCBmZHQzMl90b19jcHUodmFsWzFdKTsKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcm9vdC5uZXh0X3dpZGxpc3QgPSB2YWw2NDsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIH0KPiA+ICsgICAgICAgICAgICAgICB9Cj4gPiAgICAgICAg
IH0KPiA+Cj4gPiAgICAgICAgIHJldHVybiAwOwo+ID4gLS0KPiA+IDIuNDMuNwo+ID4KPiA+Cj4g
PiAtLQo+ID4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiA+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVu
c2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
