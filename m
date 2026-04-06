Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55DFE9D837
	for <opensbi@archiver.kernel.org>; Mon,  6 Apr 2026 05:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AeQOry3482i5lNeeocOdzMrIkA/XM4HnNCTPuZ+uius=; b=ju0ceGmLXaEF9o
	bd9uMPypGmTbHihbq8bLDP54Xz/FItNbiFUBdOBS9QYIuw79m68Ik/vmmUm18EzGrHs+VxZ7ugdIe
	E84eC95KetxdhR3YjoIDIeu4BtxTxLTAbiGDXuYnzsgiVLfjpYt4r9Pz2+24sOqj9/lh1E7TOzwbL
	5YnyRjJgYEGfzOzvVpk07P91KFg+xHv5fIZlgiLBSbH/mmkjqQPu+MJunILBRO3FBU/47PvQMRJaF
	fm14vJBuxwkcdAPb/w6n24GrXoLliiIasOnQGP+gGK5R9CGW4/ljatV059AYwfGc3cPrrgSCqU8/D
	vAjlIvChZr8mSdZ7Ebaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9chc-00000004of8-1gob;
	Mon, 06 Apr 2026 05:40:48 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9chY-00000004oel-3H62
	for opensbi@lists.infradead.org;
	Mon, 06 Apr 2026 05:40:46 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-47018d3416aso1053395b6e.3
        for <opensbi@lists.infradead.org>; Sun, 05 Apr 2026 22:40:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775454043; cv=none;
        d=google.com; s=arc-20240605;
        b=ZFWKV8RYQqIIts6ErNVLRUASN0bVfBztQnIxYe5FMFXy+/7+vOB/pKaytepuCdY/4R
         PAjvTYF+qlEMlkucWZ1tGNBVlZHr5OcfJ4sEQfR6du5qKr+/jo1GHoqLbbU8OSKT+48a
         +kbs4kFrluMDswifHuEokZXdK1Uz6Kjzio/r60LICZZKxSauMCNXAgu7tlTu++9IK/Zc
         aV+/S7lBX+yTYRZsoJWnNa6CVWxsv1TN284XWkWJVJ5rNp2U3p5YF/JSUiC8ddrmlro0
         B4yB39UlRAWbJ1BC/PhCG2jfvptwO1as/R4Mjgha2iifYwVFLd2aza+ZDL9KvUR4+4XK
         IKng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6vwlrwwqU7dUML46GtyQyYlLcQzV2Z8qJOVg4j+RoYY=;
        fh=1CCt9UJmt40SlRo459PKEWIuUxZQ2Zn4py42z4BZDhE=;
        b=jebI12fESuJjUt/JQl168vVeDOciBIaF9UQQRBpYznzk5ZV29OIwgX88byCWYSsh3h
         TziIdP5xF8jEBejb+bqDbBVjcHEpm9DUz3lI44DVRTo7bFG0g61CsYLgMKzwn2TzEbU+
         iGdiBjg5BNS3cMJOYglt0SkwH+2XBFHICOvUG9+lwueAm49PtzY/08dqPWQc1regsVmb
         c/tF+oMHXKW8Kxq80PjNfCTGIm8uvEPBf7QXEz4Na5TViVwEl7s3neovrf5b4O6PEGei
         cLbXMDsS3g1NOyx0xF78rkhILReC/q5E9xTfmWZtw5CibNhpnE6hf1FZo8ybKaD9Xh5r
         zyyQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775454043; x=1776058843; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vwlrwwqU7dUML46GtyQyYlLcQzV2Z8qJOVg4j+RoYY=;
        b=acnMCosPRBgGK3MBAzJ6A78WY19ds6nz7FgFyK5oMs4aTMGtNyHPGhxAa2AcMHWo/5
         4ZLI0AqZ1RVL74WDgNuIeDZyZtHt2X+d41DniQs6Z9vrZNprL5XX3jYoW9n4I1Tok0Y/
         vWMnZVpCNtOqrHJ1uqVrVptZXYRWLASJFK/sl9P1wYBKv5rmW3j8/bF1t0LzVmTnRKWr
         g+r3+kRPqs+t/Fspr2rCHJq7SxtZ3cjGzsmfy/LXJxxwyhxV7lpvnxZfU0wTdau+UKLh
         /XEVv2e3qaGddoSqGsY/iZ+JrA0bFmy5k1fMknpC8kIgINF/4NJ6WwnAig44uQn4V2Vy
         zOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775454043; x=1776058843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6vwlrwwqU7dUML46GtyQyYlLcQzV2Z8qJOVg4j+RoYY=;
        b=YrwmBIhnQeeQcaPh9n1iRAP04QDGhq127KWgL/yJ6Mrcdd99tAu3ZS02vzgy1zsvwj
         eaYk+D1CprKb/8k7EVchL5uIIu//lUmBnJJ1V9gU2A3lFQoZK8FyKf4RWjDfsrnvw+s2
         IQACR+843ifGh3ReYVDFqrCO39eWx3s5FR/oX6I9lpgQ6AAt3H4sf++SlCxM3rUd3FUJ
         kwTf5TcAKXs4/fkeaxNKfgV8mTt/foWXsQTg57phjCR7n2VsLWJutqeArlKZm0EtYFfp
         CpKQ6WSK5mJs5QxmwriEe/eBoj/pktjgUQF/ggjsX+yPhRUfkPydIMCU+Ftgedtd0Dmh
         bzug==
X-Gm-Message-State: AOJu0YwYhsGF4VWyODK5NxwBgVi54iFLR7uVeAY/5zFFDfJ4tLjul0z0
	XeVs0zo61EmBDKTfS9XavN5QKizM7SAcgMEbBRbcijhH39hRPU6QzweyG6JUC4ZjVhAAxZnhzRB
	SySP8O1578qiw8zNRtXdcRXXNNXlY9GtHtXxZWbP2Ig==
X-Gm-Gg: AeBDievVuf2u3MkZJQbfdfIUeWZJr6yxRhAUjnFhILqt8D5XSGyUc8sbbVL0NaZGH8C
	EAJc/x2OoYXkY0+IVP5e2pHMHeaqvmSbtA7wadqGXVW1+fmP/HBh5Umhtcw4Cweks29a4KJfcl/
	lWjB5fj+iWutV4wdpZhg0HtzO5ttgdavB15YVNGyu40ROcVTXmqR8ffdKTVT3UM8BY2t0OoMWuH
	TMpU2cZ0B1nj8DiVod30E7xVOot9hsAViF9LHoUmBI4SeN00Sf1HPnu2NpSWMsK7+gDOKPUdZ9b
	rRHRbL6vScrOotbupOgw8UDRI/dZBTFU0jHlGvzXckOsBzH8+X502za0ZrfmVjYqaqvCmnEUHek
	2KeH9ilAyvaURSqNiEDInNBqusJ4CC4qrniIc
X-Received: by 2002:a05:6820:81c4:b0:67d:e7c3:3c65 with SMTP id
 006d021491bc7-68220352450mr6036908eaf.56.1775454043389; Sun, 05 Apr 2026
 22:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260224031733.3817148-1-peter.lin@sifive.com>
In-Reply-To: <20260224031733.3817148-1-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 6 Apr 2026 11:10:32 +0530
X-Gm-Features: AQROBzB6J-3hwpJUDVCUT29rHzaY2yDaGBiZBtATUQiIdXKAebUl8j47IPckQ0o
Message-ID: <CAAhSdy3u0L=jkoPC7O9MK-koJM2hgEnWgJqC_c_pxxvMwPdeYg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] platform: sifive: Add initial support for SiFive
 development platform
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_224045_086846_360BE398 
X-CRM114-Status: GOOD (  20.18  )
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

T24gVHVlLCBGZWIgMjQsIDIwMjYgYXQgODo0N+KAr0FNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gQWRkIGluaXRpYWwgcGxhdGZvcm0gc3VwcG9y
dCBmb3IgU2lGaXZlIGRldmVsb3BtZW50IHBsYXRmb3Jtcwo+IHdpdGggdGhlICJzaWZpdmUtZGV2
IiBjb21wYXRpYmxlIHN0cmluZy4KPgo+IFJldmlld2VkLWJ5OiBHcmVlbnRpbWUgSHUgPGdyZWVu
dGltZS5odUBzaWZpdmUuY29tPgo+IFJldmlld2VkLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2
ZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogWXUtQ2hpZW4gUGV0ZXIgTGluIDxwZXRlci5saW5Ac2lm
aXZlLmNvbT4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoK
VGhhbmtzLApBbnVwCgoKPiAtLS0KPiAgcGxhdGZvcm0vZ2VuZXJpYy9LY29uZmlnICAgICAgICAg
ICAgICAgICAgICAgIHwgIDQgKysrKwo+ICBwbGF0Zm9ybS9nZW5lcmljL2NvbmZpZ3MvZGVmY29u
ZmlnICAgICAgICAgICAgfCAgMSArCj4gIHBsYXRmb3JtL2dlbmVyaWMvc2lmaXZlL29iamVjdHMu
bWsgICAgICAgICAgICB8ICAzICsrKwo+ICBwbGF0Zm9ybS9nZW5lcmljL3NpZml2ZS9zaWZpdmVf
ZGV2X3BsYXRmb3JtLmMgfCAyMyArKysrKysrKysrKysrKysrKysrCj4gIDQgZmlsZXMgY2hhbmdl
ZCwgMzEgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGxhdGZvcm0vZ2VuZXJp
Yy9zaWZpdmUvc2lmaXZlX2Rldl9wbGF0Zm9ybS5jCj4KPiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0v
Z2VuZXJpYy9LY29uZmlnIGIvcGxhdGZvcm0vZ2VuZXJpYy9LY29uZmlnCj4gaW5kZXggMGMxMWZi
ZDJjLi5lYWE5NzJiNzMgMTAwNjQ0Cj4gLS0tIGEvcGxhdGZvcm0vZ2VuZXJpYy9LY29uZmlnCj4g
KysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9LY29uZmlnCj4gQEAgLTY2LDYgKzY2LDEwIEBAIGNvbmZp
ZyBQTEFURk9STV9SRU5FU0FTX1JaRklWRQo+ICAgICAgICAgc2VsZWN0IEFOREVTX1BNVQo+ICAg
ICAgICAgZGVmYXVsdCBuCj4KPiArY29uZmlnIFBMQVRGT1JNX1NJRklWRV9ERVYKPiArICAgICAg
IGJvb2wgIlNpRml2ZSBkZXZlbG9wbWVudCBwbGF0Zm9ybSBzdXBwb3J0Igo+ICsgICAgICAgZGVm
YXVsdCBuCj4gKwo+ICBjb25maWcgUExBVEZPUk1fU0lGSVZFX0ZVNTQwCj4gICAgICAgICBib29s
ICJTaUZpdmUgRlU1NDAgc3VwcG9ydCIKPiAgICAgICAgIGRlZmF1bHQgbgo+IGRpZmYgLS1naXQg
YS9wbGF0Zm9ybS9nZW5lcmljL2NvbmZpZ3MvZGVmY29uZmlnIGIvcGxhdGZvcm0vZ2VuZXJpYy9j
b25maWdzL2RlZmNvbmZpZwo+IGluZGV4IDE5YTczYTI0Ny4uMzQ3Y2E1NmQ5IDEwMDY0NAo+IC0t
LSBhL3BsYXRmb3JtL2dlbmVyaWMvY29uZmlncy9kZWZjb25maWcKPiArKysgYi9wbGF0Zm9ybS9n
ZW5lcmljL2NvbmZpZ3MvZGVmY29uZmlnCj4gQEAgLTUsNiArNSw3IEBAIENPTkZJR19QTEFURk9S
TV9FU1dJTl9FSUM3NzBYPXkKPiAgQ09ORklHX1BMQVRGT1JNX09QRU5IV0dST1VQX0FSSUFORT15
Cj4gIENPTkZJR19QTEFURk9STV9PUEVOSFdHUk9VUF9PUEVOUElUT049eQo+ICBDT05GSUdfUExB
VEZPUk1fUkVORVNBU19SWkZJVkU9eQo+ICtDT05GSUdfUExBVEZPUk1fU0lGSVZFX0RFVj15Cj4g
IENPTkZJR19QTEFURk9STV9TSUZJVkVfRlU1NDA9eQo+ICBDT05GSUdfUExBVEZPUk1fU0lGSVZF
X0ZVNzQwPXkKPiAgQ09ORklHX1BMQVRGT1JNX1NPUEhHT19TRzIwNDI9eQo+IGRpZmYgLS1naXQg
YS9wbGF0Zm9ybS9nZW5lcmljL3NpZml2ZS9vYmplY3RzLm1rIGIvcGxhdGZvcm0vZ2VuZXJpYy9z
aWZpdmUvb2JqZWN0cy5tawo+IGluZGV4IGQ3NWU0NDRhYi4uZDMyZTEyNzNkIDEwMDY0NAo+IC0t
LSBhL3BsYXRmb3JtL2dlbmVyaWMvc2lmaXZlL29iamVjdHMubWsKPiArKysgYi9wbGF0Zm9ybS9n
ZW5lcmljL3NpZml2ZS9vYmplY3RzLm1rCj4gQEAgLTIsNiArMiw5IEBACj4gICMgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEJTRC0yLUNsYXVzZQo+ICAjCj4KPiArY2FycmF5LXBsYXRmb3JtX292
ZXJyaWRlX21vZHVsZXMtJChDT05GSUdfUExBVEZPUk1fU0lGSVZFX0RFVikgKz0gc2lmaXZlX2Rl
dl9wbGF0Zm9ybQo+ICtwbGF0Zm9ybS1vYmpzLSQoQ09ORklHX1BMQVRGT1JNX1NJRklWRV9ERVYp
ICs9IHNpZml2ZS9zaWZpdmVfZGV2X3BsYXRmb3JtLm8KPiArCj4gIGNhcnJheS1wbGF0Zm9ybV9v
dmVycmlkZV9tb2R1bGVzLSQoQ09ORklHX1BMQVRGT1JNX1NJRklWRV9GVTU0MCkgKz0gc2lmaXZl
X2Z1NTQwCj4gIHBsYXRmb3JtLW9ianMtJChDT05GSUdfUExBVEZPUk1fU0lGSVZFX0ZVNTQwKSAr
PSBzaWZpdmUvZnU1NDAubwo+Cj4gZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2dlbmVyaWMvc2lmaXZl
L3NpZml2ZV9kZXZfcGxhdGZvcm0uYyBiL3BsYXRmb3JtL2dlbmVyaWMvc2lmaXZlL3NpZml2ZV9k
ZXZfcGxhdGZvcm0uYwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwLi5m
YWNjMDQ0ZjEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9zaWZpdmUv
c2lmaXZlX2Rldl9wbGF0Zm9ybS5jCj4gQEAgLTAsMCArMSwyMyBAQAo+ICsvKgo+ICsgKiBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogQlNELTItQ2xhdXNlCj4gKyAqCj4gKyAqIENvcHlyaWdodCAo
YykgMjAyNiBTaUZpdmUgSW5jLgo+ICsgKi8KPiArCj4gKyNpbmNsdWRlIDxwbGF0Zm9ybV9vdmVy
cmlkZS5oPgo+ICsKPiArc3RhdGljIGludCBzaWZpdmVfcGxhdGZvcm1faW5pdChjb25zdCB2b2lk
ICpmZHQsIGludCBub2Rlb2ZmLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
c3Qgc3RydWN0IGZkdF9tYXRjaCAqbWF0Y2gpCj4gK3sKPiArICAgICAgIHJldHVybiAwOwo+ICt9
Cj4gKwo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGZkdF9tYXRjaCBzaWZpdmVfZGV2X3BsYXRmb3Jt
X21hdGNoW10gPSB7Cj4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gInNpZml2ZS1kZXYiIH0sCj4g
KyAgICAgICB7IH0sCj4gK307Cj4gKwo+ICtjb25zdCBzdHJ1Y3QgZmR0X2RyaXZlciBzaWZpdmVf
ZGV2X3BsYXRmb3JtID0gewo+ICsgICAgICAgLm1hdGNoX3RhYmxlID0gc2lmaXZlX2Rldl9wbGF0
Zm9ybV9tYXRjaCwKPiArICAgICAgIC5pbml0ID0gc2lmaXZlX3BsYXRmb3JtX2luaXQsCj4gK307
Cj4gLS0KPiAyLjQzLjcKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlA
bGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L29wZW5zYmkK
