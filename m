Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E1BC5DF81
	for <opensbi@archiver.kernel.org>; Thu, 20 Aug 2026 15:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VOfy/t5v+5E2JAUrWOxsvjojT6Hyg/Pg1ENQYb76E3g=; b=TVq+MOsd9nGQwb
	UkNlHIwoRTp17iZVIAnf7XtJ+XfPf7Jo5NA+c/6ByDoFs8WuuMfgPl64eNhTNW/L9wo6DM6pWXMBt
	doFCgavEMr7Z/Sx4St8zd5ltpiCiTqZIO00JGILy+j1MZWtKlGI+hLjy6o7/cffp6ZpzRjGfXCiXD
	SXkfxyO+St0nXXAXfk7TpnNuAMGzRDp/fRDXLLhXkS+Ke4YHj4rYFgBfeL2kSxlde2iQb6BWYYKMr
	uwLIFKO14JRI3K7wtPObzp9t5LtAIcr+yMmstyUh/Q9cDFnRJO8996jN3jbqSHUAfZ6d3IyvVQuDU
	EEGsb+9eT2h9/X5m82xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4Y1-0000000BnH5-03ru;
	Thu, 20 Aug 2026 15:19:17 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4Xy-0000000BnGf-1sn4
	for opensbi@lists.infradead.org;
	Thu, 20 Aug 2026 15:19:15 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so25932965e9.2
        for <opensbi@lists.infradead.org>; Thu, 20 Aug 2026 08:19:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787239152; cv=none;
        d=google.com; s=arc-20260327;
        b=m7JPey35bcMROyvT/5ncj4B0qBtO/plh/pxGLIC1ul9tsZP3XZPekyib1f0pPwe8sQ
         BNpxJ4fjOAM4vRjmVC83abDMOwVznQl2CqGaXwilT6uGBtiEUf4ZMqBnIphZ2VrRJZ08
         niRK1vCH/dFJLyd2KNIQVHxUK8tVgMAy4mq//eCphEfGr/SnnGsEdmhUr07qxd8d58cC
         nKtHtsLEb9TQjfAj1DD77tGXk6cgtEFwrlvsfSBFyZWCa4/ktuxBP36lBur2C25626RX
         8gtXz04UqgIu8769nk24LhnoBgCrS4cW58O/2qE8zC6UjekWzEipaGysh4Ip6bI/1XKL
         fx+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Itv19WlE0ztd+lcFN/TdtijIIW8g0+86dAzs/2cZccA=;
        fh=GKC1pjzziqrfudY33OHE3D1VzgC99rtmGo/6E6h+35o=;
        b=c1+S3T+xye9BqJbe//1Fa1pjR3s0nF6yM6/jQxX9VAxPNIpO2+yEKTxjGxYcfvSdTZ
         /LTteLRiTwc6uGK7RLVifMKWhSJvAjlF6ho4AGVZE6cQQ+VUn1Zhd5FdWjzzeGVEPfZU
         NyMG+7Qs6UVOKLDqQFT78sbw8+qc/xqZZbyQikkY/mPbYGvie5MjKPhCsBaOue0ZRcKo
         57tlZ7o9S6YvNGfU0L0g1ewg6sPpEHMJdclZvJyX0s8/lGCV/UiJe9wzpnKiHcFfVxJK
         9+7NcUsO4/2ORCTYK4KHA/3NfVbQsUgHVIhmFtlBLhE3vctLF3iMiEzHz172B3hjdYfK
         uXGQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1787239152; x=1787843952; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Itv19WlE0ztd+lcFN/TdtijIIW8g0+86dAzs/2cZccA=;
        b=M4ADDSw5M1HiIY5F4wgX/KVkSDmjPYMCgjfkRZY05sAk0ydtI61cVx4yvLTvcy2huv
         CPfxfCbFLV4ZjhYyjOLfjWg07LBocY6NeoJyMCKtQjj1GH11m6xHV3r6dSmj7ouiyHaj
         izJcxWJ9aqMmhIlc+vkRiy0skEta2k6ZvMuMdX9caTDsWLPbqpBumHHRGl+HciYUqPss
         68u1b8Hoy7c3jvyLwXKwUgcvI/F+cT+rwvuTurC8AoVmv+bytSdciz1kEyHTJ8b+s4Ab
         ygQNXr2eUIRm5AapozBjvSszxqk1ggpG7T4PgpicBEbVxgsEBtve9B8TxAQzkKOErgzs
         X97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787239152; x=1787843952;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Itv19WlE0ztd+lcFN/TdtijIIW8g0+86dAzs/2cZccA=;
        b=WAKp+iRyzIgVr4DJW8Uwy8vWB3W7fC4StXnoAV8PV8zzQkcjqCNbfLwgYcXE/ALpJP
         mLCzwL33C+P9xruJGnBLOtli7q0449bxOydSNDcvYNzjYaJnp2M3HGsSrWgX3poxiaNp
         g/WlP2ptuCe5BzxpL7X6pX6T+lqWWe5aA4OXprqhM+CQe6uiRBFCOcXbwiiFbZJ1/lFF
         fhok3Kbk8LXEVR7F0O3DEgMrGtpjSbjIpO0s0GAhT4VvyMAOcjKxxkk0ot89DICW6+ih
         ecsX6gnq4CuwBmp9Jh6WswWGOEB4gHtAZTTqeyuK923U+b9Zw8+w51u1CFCAVu2m8v8d
         13yQ==
X-Gm-Message-State: AOJu0Yy6MjSmUSRELvNPODzmbc6ImgTxWSecfbVe/O75XelpUHoep6li
	tYNjrsOZ6enY94Q6wuY2K+YfcKsvCp5s5nc04tvkS5+6R6L7XGtxoYC3lgCNe3AvRMKuG5ntLHL
	SQvq2Cp1NYpxds24ny8d9TNc48scACCK3TjQ87tQ8dQ==
X-Gm-Gg: AR+sD10tbSY6jmvMEnKC5+frhAtNTUnpTnNrKQ1V6NFon6B57lhVs43hpqbnXImai+D
	VenFjdzb302loZaiY4BQWiehjQyWCW47EpOnM/nBQF0WvFgJ6cEPXx1qO4ZvPQB3rtiYPK6G3Hd
	xbAWuw1rkcxGY8/0wKaFTLvlszRXc/wsGWpCATPSdqw+XGdWHKjnUvUv/JeA2nBCiXRcOqROtBv
	bbIAUSPzERoMx31KGY/zCXJX161ljvL0V4E19RB/t8J6qQ9F9Esz1/Dy/IhxEyrZtFK/6nmj8V5
	uU/LTTu10mc3Bjfvpb/oJgXz6q3b5HOy1sxbDDYHdiVoXUZc0vMGcUMbrxpNV4BkGmTnIx30tOY
	3iqwYEFUMfhdlciiUnHfmf5qpj7LAn1PCd8B0zbgfonFhpHy5xxMmlMH2+zv+aNqtUs1c
X-Received: by 2002:a05:600c:4fcd:b0:499:8b13:3a98 with SMTP id
 5b1f17b1804b1-499aa15c58dmr201195975e9.4.1787239152418; Thu, 20 Aug 2026
 08:19:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260721150844.741606-1-wangxiang@iscas.ac.cn>
In-Reply-To: <20260721150844.741606-1-wangxiang@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 20 Aug 2026 20:49:01 +0530
X-Gm-Features: AcwNN1Wj0UFwUOYfq5uKMAuA_eqcjcJEWqD-SGSh0fQiA-pIWb_MCECfszETxSQ
Message-ID: <CAAhSdy3GLjEAj92pX4NHpAcQV6EGbVSMHyXoaEEWPwc365jFcw@mail.gmail.com>
Subject: Re: [PATCH] platform: generic: sophgo: Move SG2042 timer memregion workaround
To: Xiang W <wangxiang@iscas.ac.cn>
Cc: opensbi@lists.infradead.org, Han Gao <gaohan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_081914_517265_367BCA3B 
X-CRM114-Status: GOOD (  18.92  )
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

T24gVHVlLCBKdWwgMjEsIDIwMjYgYXQgODozOeKAr1BNIFhpYW5nIFcgPHdhbmd4aWFuZ0Bpc2Nh
cy5hYy5jbj4gd3JvdGU6Cj4KPiBDb21taXQgNDgxM2EyMDQyMDk2ICgibGliOiBzYmlfaW5pdDog
Q2FsbCBoYXJ0IGluaXQgYW5kIHRpbWVyIGluaXQKPiBiZWZvcmUgcGxhdGZvcm0gZWFybHkgaW5p
dCIpIHJlb3JkZXJlZCB0aGUgY29sZC93YXJtIGJvb3Qgc2VxdWVuY2Ugc28KPiB0aGF0IHNiaV90
aW1lcl9pbml0KCkgcnVucyBiZWZvcmUgc2JpX3BsYXRmb3JtX2Vhcmx5X2luaXQoKS4KPgo+IFRo
ZSBTRzIwNDIgcGxhdGZvcm0gd29ya2Fyb3VuZCB0aGF0IG1lcmdlcyB0aGUgMTYgc2VwYXJhdGUg
dGltZXIKPiByZWdpb25zIGludG8gYSBzaW5nbGUgZG9tYWluIG1lbXJlZ2lvbiB3YXMgcHJldmlv
dXNseSBwZXJmb3JtZWQgaW4KPiBlYXJseV9pbml0KCkuICBBZnRlciB0aGUgcmVvcmRlcmluZyB0
aGUgTVRJTUVSIGRyaXZlciB0aGVyZWZvcmUgYWRkcwo+IHRoZSBpbmRpdmlkdWFsIHJlZ2lvbnMg
Zmlyc3QsIGRlZmVhdGluZyB0aGUgcHVycG9zZSBvZiB0aGUgY29tYmluZWQKPiByZWdpb24gKGFu
ZCB3YXN0aW5nIFBNUCBlbnRyaWVzKS4KPgo+IE1vdmUgdGhlIGFkZGl0aW9uIG9mIHRoZSBjb21i
aW5lZCBtZW1yZWdpb24gaW50byBleHRlbnNpb25zX2luaXQoKSwKPiB3aGljaCBpcyBpbnZva2Vk
IGZyb20gc2JpX2hhcnRfaW5pdCgpIGFuZCBjb25zZXF1ZW50bHkgc3RpbGwgZXhlY3V0ZXMKPiBi
ZWZvcmUgc2JpX3RpbWVyX2luaXQoKS4KPgo+IFNpZ25lZC1vZmYtYnk6IEhhbiBHYW8gPGdhb2hh
bkBpc2Nhcy5hYy5jbj4KPiBTaWduZWQtb2ZmLWJ5OiBYaWFuZyBXIDx3YW5neGlhbmdAaXNjYXMu
YWMuY24+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5v
cmc+CgpBcHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5r
cywKQW51cAoKPiAtLS0KPiAgcGxhdGZvcm0vZ2VuZXJpYy9zb3BoZ28vc2cyMDQyLmMgfCAzMiAr
KysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5z
ZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2Vu
ZXJpYy9zb3BoZ28vc2cyMDQyLmMgYi9wbGF0Zm9ybS9nZW5lcmljL3NvcGhnby9zZzIwNDIuYwo+
IGluZGV4IGFjODg0MGU4Li44MWIyODM3NiAxMDA2NDQKPiAtLS0gYS9wbGF0Zm9ybS9nZW5lcmlj
L3NvcGhnby9zZzIwNDIuYwo+ICsrKyBiL3BsYXRmb3JtL2dlbmVyaWMvc29waGdvL3NnMjA0Mi5j
Cj4gQEAgLTMxLDIxICszMSw2IEBAIHN0YXRpYyBpbnQgc29waGdvX3NnMjA0Ml9lYXJseV9pbml0
KGJvb2wgY29sZF9ib290KQo+Cj4gICAgICAgICB0aGVhZF9yZWdpc3Rlcl90bGJfZmx1c2hfdHJh
cF9oYW5kbGVyKCk7Cj4KPiAtICAgICAgIC8qCj4gLSAgICAgICAgKiBTb3BoZ28gc2cyMDQyIHNv
YyB1c2Ugc2VwYXJhdGUgMTYgdGltZXJzIHdoaWxlIGluaXRpYXRpbmcsCj4gLSAgICAgICAgKiBt
ZXJnZSB0aGVtIGFzIGEgc2luZ2xlIGRvbWFpbiB0byBhdm9pZCB3YXN0aW5nLgo+IC0gICAgICAg
ICovCj4gLSAgICAgICBpZiAoY29sZF9ib290KQo+IC0gICAgICAgICAgICAgICByZXR1cm4gc2Jp
X2RvbWFpbl9yb290X2FkZF9tZW1yYW5nZSgKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgKHVsb25nKVNPUEhHT19TRzIwNDJfVElNRVJfQkFTRSwKPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU09QSEdPX1NHMjA0Ml9USU1FUl9TSVpFICoK
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU09QSEdPX1NHMjA0Ml9U
SU1FUl9OVU0sCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1USU1F
Ul9SRUdJT05fQUxJR04sCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IChTQklfRE9NQUlOX01FTVJFR0lPTl9NTUlPIHwKPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFNCSV9ET01BSU5fTUVNUkVHSU9OX01fUkVBREFCTEUgfAo+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0JJX0RPTUFJTl9NRU1SRUdJT05f
TV9XUklUQUJMRSkpOwo+IC0KPiAtCj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+Cj4gQEAgLTU3
LDYgKzQyLDIzIEBAIHN0YXRpYyBpbnQgc29waGdvX3NnMjA0Ml9leHRlbnNpb25zX2luaXQoYm9v
bCBjb2xkX2Jvb3QpCj4gICAgICAgICBpZiAocmMpCj4gICAgICAgICAgICAgICAgIHJldHVybiBy
YzsKPgo+ICsgICAgICAgLyoKPiArICAgICAgICAqIFNHMjA0MiBoYXMgMTYgc2VwYXJhdGUgdGlt
ZXJzLiBBZGQgb25lIGNvbWJpbmVkIHJlZ2lvbiBiZWZvcmUgdGhlCj4gKyAgICAgICAgKiBNVElN
RVIgZHJpdmVyIGFkZHMgdGhlIGluZGl2aWR1YWwgcmVnaW9ucy4KPiArICAgICAgICAqLwo+ICsg
ICAgICAgaWYgKGNvbGRfYm9vdCkgewo+ICsgICAgICAgICAgICAgICByYyA9IHNiaV9kb21haW5f
cm9vdF9hZGRfbWVtcmFuZ2UoCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodWxv
bmcpU09QSEdPX1NHMjA0Ml9USU1FUl9CQVNFLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgU09QSEdPX1NHMjA0Ml9USU1FUl9TSVpFICoKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFNPUEhHT19TRzIwNDJfVElNRVJfTlVNLAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgTVRJTUVSX1JFR0lPTl9BTElHTiwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIChTQklfRE9NQUlOX01FTVJFR0lPTl9NTUlPIHwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBTQklfRE9NQUlOX01FTVJFR0lPTl9NX1JFQURBQkxFIHwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTQklfRE9NQUlOX01FTVJFR0lPTl9NX1dSSVRB
QkxFKSk7Cj4gKyAgICAgICAgICAgICAgIGlmIChyYykKPiArICAgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gcmM7Cj4gKyAgICAgICB9Cj4gKwo+ICAgICAgICAgdGhlYWRfYzl4eF9yZWdpc3Rl
cl9wbXVfZGV2aWNlKCk7Cj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+IC0tCj4gMi40Ny4zCj4K
Ci0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
