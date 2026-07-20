Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD4EC44515
	for <opensbi@archiver.kernel.org>; Mon, 20 Jul 2026 10:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Scqaq9fFSdMIJEoh5aon4Lwv+jY0bpGeugi/pqnXQ0o=; b=UHY9Tk4djxxGJv
	8GOT+6UPfXaTD8R9OmvUDgQWWpdHRdpRwO0qqZxKhMLOadF3tskJEFPo0Oetrn+yJk/eonxjGZt0q
	hMcvkZB655CpD6+V2RVwP3ovLdNaXdc/Icv1jD/usOQ2xBqTcnL5GQUg4Me6Ze4s4b8QVRzwak/Uc
	2MLkjs9rdVxDYagK3AyAn/qjI8sjY54ISB7+WAl6hJygJAoV7P2veSLjw+mcp6JoD5vYIvIkDsdUr
	Oquzf8BYXIbNFSNCLsbmpdpuMLg8FMWDn0RRCyNwEP3rwn9S2iq0WyZzYZFbJjdZiDYAcdiX1eWc+
	z0bt5Tt6iDIF+Mva6x5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllP8-00000006VTo-2JDF;
	Mon, 20 Jul 2026 10:39:22 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllP5-00000006VSv-26gN
	for opensbi@lists.infradead.org;
	Mon, 20 Jul 2026 10:39:21 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47f707e5d75so746146f8f.1
        for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 03:39:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784543957; cv=none;
        d=google.com; s=arc-20260327;
        b=smmSeGKaKF1oR+HHO6D4JybI2yHRRhYFdrGbKZLh9GphTLNubYK/30E/aHdb+6YQiY
         QZ9S42Pco5nAQuU3oMy9IkL19s9B3A3cZc2oGjf7wU3RU73Zs2kOSBIb9UtFda+PDkbI
         pI8TpaXHG8QXsNoepSbxxhIp46hyLODcFUHTCrd51Xk5zdLHCB0Ql8Lb1bx561EzOPpV
         qjkf3vSJvlNsvJROtI9tW8S7Y/0vWKgF1QqWrVW0sL9+kSOz12xEG9Lq7M+FtwDZLMTj
         FIoiKhVmCqKsj+elUaPr0M7STMQHN/yqS5o1udgMNz9NBBpDejIENYEJ4P1kr3lDQgcM
         +Tgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ENzYiiIBO0fx0/dOyDAgIKySPy7sln03TIqGPGUkF+I=;
        fh=BSdTwr88wbsbZyeQe5NBHUtSL2tc1qDVQN9nFPEg87Y=;
        b=OaTKi5G9ntZgrIuzCPZlpBrEN3ZKbE4Pn5lX5eQhve7d58LPkMtmnW4YeRbkwTmIcI
         nn+wNJZB+OomyP1stMQbYaL3e1Rsu9HavF34QFVB7rQL9K68lfqNsyGA0Scm1vTaznv4
         5ip6EKtbsW1fyyn6EFe1nj9OiMKWKsONV4Vvss/9qKgbB1K53YRJW9aaxzGdrfRCy24U
         G2enkSK4fxwPm3tYr6gkDZv7SsfH2Fwkjotd1D6SkLhiH4CC+lijZfniqh3BvdMBlQQa
         WjH0DJ/65JTWyi23vCV+1s9xay6HYUmwKxlz/6LlG6v3NrwsiEafw9ZNai09mZODIcvL
         SORw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1784543957; x=1785148757; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ENzYiiIBO0fx0/dOyDAgIKySPy7sln03TIqGPGUkF+I=;
        b=WP8dBCKWiQ6CAMoTXvYrSjleL7He6KsPejrFZB975XX5JjwH0n0M4+26fX8UIRYqSy
         WXnWMe5pH7er9b1sNqxno87XvO2w7RoQT/bcN9qjNwadcCluCZ/znE0z6yF3snKJTDTQ
         jzlF+pqLhtA+zgFZ2d4nAj1iJDu2JD8SiAaWF45CKjke7kyW1qcxOVfXWQG5iru5r6z1
         uSW5g3nrXJ5wRf55AA3N9Ltbp55+1PEnVbA6SdOY8G58U3122hOSzBGizEY40g8ZoH8s
         JhV3qHQY7UoZfQaTYQEEjrrq/Q2GpSJf61UFkA3ypQp24i13gbguC7df5AQS/xkr48bJ
         kUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784543957; x=1785148757;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ENzYiiIBO0fx0/dOyDAgIKySPy7sln03TIqGPGUkF+I=;
        b=dxnsjs0ukA6ody/ERGtQlaZEH7ExI4y8GBh82Stsr2SF+UbY3xUVMBwqQC6n8PUFzq
         d26jIlRPun7FGSW/6sLn4SPUkiX7ixNsWLTOoYWPjk6e0IwMGZ+BqbBStY7DLZseUM2J
         QTgZ0zg9s5G8V3t+0QqyXvPHM5j8eAtcXT37/hYl92/s7o3nu+QSD0dC0z/VJR7TVKqr
         q3Adno+Ss0voAcONvXIauLGvy0MModUD3ZcNXm9xynADikSDegjwCOZfKCXomnS9ZpwB
         U1IG06FifY/jDNFMQWk1rKj+wgBMafUkiVzIv4Ez2P1sEqrLzKR+u2tgu1VAYXHmh/k5
         KuKA==
X-Forwarded-Encrypted: i=1; AHgh+RrBysjAIgEEbtOrSeOTjTUbh+zGjs38uu7ypzFwp5rRi5SH7GZmHHcnN4RY/VDNZ0BxGEvTc4yD@lists.infradead.org
X-Gm-Message-State: AOJu0YwNCybzolYaqlc3kP9uLeEBV2yxYutb7/rnyE2lJIcJNdooF7ig
	oZsQ0a1umhsnOYKFYBUF29SLJTRhGXoj3Y2/3dHJpj9JVGJyOgmrJxgSQh7YWEq1vK306Q+mSKF
	zpEWYb/lKqRZT7iA8JIO91+Rc3Mtk4wzSyUWT7SkanQ==
X-Gm-Gg: AR+sD11Kzfij84JeYe4vXeXYkwYVh3LN/GdEdtmmHNUjSa4nM5r/SHWTx5Xy3NFt8Al
	7J/6/oDP8/B+p0f+Ai9Ozpwby4SXVeSxhpx5bTjF7t6ql1lpI1q94+sHg60/Rp4Yu4pWLhZ0Wfd
	4fsjptCVMhmH1AnUr6pdY/g2hAOyM5jaV17N0k4JKT8Hl6sZyadcY98KEH3fpjvyHUJCpsGMC/z
	1wfjAkMX+tOAqMh4xI5rhHJbw6ka79LuTotRcLgNmwLQvEM4KuZYzu17pcAZ7pZd6rkSJA6FDOh
	cmkbAtgYGoHO7wZLDzPJZBYLgwyncgxZZtmPAZ+X3nc3T3UR14lbBocHSq2/f/UoVhlo06+ZBlL
	nz6SRwQ==
X-Received: by 2002:a5d:5e07:0:b0:46f:a93b:f404 with SMTP id
 ffacd0b85a97d-47f6230c7d7mr16500148f8f.19.1784543957517; Mon, 20 Jul 2026
 03:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260626101433.3133466-1-peter.lin@sifive.com>
 <20260626101433.3133466-10-peter.lin@sifive.com> <CAAVgOk+==we31kXGJxG0XQeRY4B0e9rR3e_4PLT22WwVy-e-dQ@mail.gmail.com>
 <al3iXVFNChVjXsHa@plin-1878>
In-Reply-To: <al3iXVFNChVjXsHa@plin-1878>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 20 Jul 2026 16:09:06 +0530
X-Gm-Features: AUfX_my2rgyuzc7d_WmJ92sigAggRaJ51FZ7EsQjMGn6j6JoKJnsMH8uWIF_JnI
Message-ID: <CAAhSdy2D_6CFkMztW96UxitGNy07zyw812kDa8js2VmvSKgF6w@mail.gmail.com>
Subject: Re: [RFC PATCH 09/12] platform: generic: parse root domain WID config
 from DT
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>, opensbi@lists.infradead.org, 
	zong.li@sifive.com, greentime.hu@sifive.com, scott@riscstar.com, 
	conor@kernel.org, dave.patel@riscstar.com, raymond.mao@riscstar.com, 
	robin.randhawa@sifive.com, samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_033919_666912_A4080437 
X-CRM114-Status: GOOD (  21.31  )
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

T24gTW9uLCBKdWwgMjAsIDIwMjYgYXQgMjoyNOKAr1BNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdWwgMDgsIDIwMjYgYXQgMDU6
Mzk6MzRQTSAtMDcwMCwgUGF3YW5kZWVwIE96YSB3cm90ZToKPiA+IE9uIEZyaSwgSnVuIDI2LCAy
MDI2IGF0IDM6MTfigK9BTSBZdS1DaGllbiBQZXRlciBMaW4gPHBldGVyLmxpbkBzaWZpdmUuY29t
PiB3cm90ZToKPiA+ID4KPiA+ID4gUGFyc2Ugcm9vdC1kb21haW4tbmV4dC13aWQgKDMyLWJpdCkg
YW5kIHJvb3QtZG9tYWluLW5leHQtd2lkbGlzdAo+ID4gPiAoNjQtYml0KSBwcm9wZXJ0aWVzIGZy
b20gL2Nob3Nlbi9vcGVuc2JpLGNvbmZpZyBub2RlIGR1cmluZwo+ID4gPiBnZW5lcmljX2RvbWFp
bnNfaW5pdCgpLiBTZXRzIHJvb3QubmV4dF93aWQvaGFzX25leHRfd2lkIGFuZAo+ID4gPiByb290
Lm5leHRfd2lkbGlzdC4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogWXUtQ2hpZW4gUGV0ZXIg
TGluIDxwZXRlci5saW5Ac2lmaXZlLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBwbGF0Zm9ybS9nZW5l
cmljL3BsYXRmb3JtLmMgfCAyMCArKysrKysrKysrKysrKysrKysrLQo+ID4gPiAgMSBmaWxlIGNo
YW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4KPiA+ID4gZGlmZiAt
LWdpdCBhL3BsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYyBiL3BsYXRmb3JtL2dlbmVyaWMvcGxh
dGZvcm0uYwo+ID4gPiBpbmRleCA1MWU5ZjM0Mi4uZGUxMmRlYjUgMTAwNjQ0Cj4gPiA+IC0tLSBh
L3BsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYwo+ID4gPiArKysgYi9wbGF0Zm9ybS9nZW5lcmlj
L3BsYXRmb3JtLmMKPiA+ID4gQEAgLTExLDYgKzExLDcgQEAKPiA+ID4gICNpbmNsdWRlIDxwbGF0
Zm9ybV9vdmVycmlkZS5oPgo+ID4gPiAgI2luY2x1ZGUgPHNiaS9yaXNjdl9hc20uaD4KPiA+ID4g
ICNpbmNsdWRlIDxzYmkvc2JpX2JpdG9wcy5oPgo+ID4gPiArI2luY2x1ZGUgPHNiaS9zYmlfZG9t
YWluLmg+Cj4gPiA+ICAjaW5jbHVkZSA8c2JpL3NiaV9oYXJ0bWFzay5oPgo+ID4gPiAgI2luY2x1
ZGUgPHNiaS9zYmlfaGVhcC5oPgo+ID4gPiAgI2luY2x1ZGUgPHNiaS9zYmlfcGxhdGZvcm0uaD4K
PiA+ID4gQEAgLTI3Niw3ICsyNzcsOSBAQCBpbnQgZ2VuZXJpY19leHRlbnNpb25zX2luaXQoYm9v
bCBjb2xkX2Jvb3QpCj4gPiA+ICBpbnQgZ2VuZXJpY19kb21haW5zX2luaXQodm9pZCkKPiA+ID4g
IHsKPiA+ID4gICAgICAgICBjb25zdCB2b2lkICpmZHQgPSBmZHRfZ2V0X2FkZHJlc3MoKTsKPiA+
ID4gLSAgICAgICBpbnQgb2Zmc2V0LCByZXQ7Cj4gPiA+ICsgICAgICAgY29uc3QgZmR0MzJfdCAq
dmFsOwo+ID4gPiArICAgICAgIGludCBsZW4sIG9mZnNldCwgcmV0Owo+ID4gPiArICAgICAgIHU2
NCB2YWw2NDsKPiA+ID4KPiA+ID4gICAgICAgICByZXQgPSBmZHRfZG9tYWluc19wb3B1bGF0ZShm
ZHQpOwo+ID4gPiAgICAgICAgIGlmIChyZXQgPCAwKQo+ID4gPiBAQCAtMjkwLDYgKzI5MywyMSBA
QCBpbnQgZ2VuZXJpY19kb21haW5zX2luaXQodm9pZCkKPiA+ID4gICAgICAgICAgICAgICAgIGlm
IChvZmZzZXQgPj0gMCAmJgo+ID4gPiAgICAgICAgICAgICAgICAgICAgIGZkdF9nZXRfcHJvcGVy
dHkoZmR0LCBvZmZzZXQsICJzeXN0ZW0tc3VzcGVuZC10ZXN0IiwgTlVMTCkpCj4gPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgIHNiaV9zeXN0ZW1fc3VzcGVuZF90ZXN0X2VuYWJsZSgpOwo+ID4g
PiArCj4gPiA+ICsgICAgICAgICAgICAgICBpZiAob2Zmc2V0ID49IDApIHsKPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgdmFsID0gZmR0X2dldHByb3AoZmR0LCBvZmZzZXQsICJyb290LWRv
bWFpbi1uZXh0LXdpZCIsICZsZW4pOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAo
dmFsICYmIGxlbiA9PSBzaXplb2YoZmR0MzJfdCkpIHsKPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICByb290Lm5leHRfd2lkID0gZmR0MzJfdG9fY3B1KHZhbFswXSk7Cj4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcm9vdC5oYXNfbmV4dF93aWQgPSB0cnVl
Owo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICB9Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgdmFsID0gZmR0X2dldHByb3AoZmR0LCBvZmZzZXQsICJyb290LWRvbWFp
bi1uZXh0LXdpZGxpc3QiLCAmbGVuKTsKPiA+IE96YTogUm9vdCBkb21haW4gV0lEIGNvbmZpZyBp
cyBzZW1hbnRpY2FsbHkgaWRlbnRpY2FsIHRvIHBlci1kb21haW4KPiA+IFdJRCBjb25maWcgYnV0
IGxpdmVzIGluIGEgY29tcGxldGVseSBkaWZmZXJlbnQgRFQgbG9jYXRpb24KPiA+IHJvb3QgY2Fu
IGJlIGFub3RoZXIgZGVmYXVsdCBkb21haW4gdW5kZXIgY2hvc2VuIHsgb3BlbnNiaS1kb21haW5z
IHsKPgo+IFN1cmUsIGl0IHdvdWxkIGJlIGJldHRlciB0byBoYXZlIHJvb3QgZG9tYWluIHdpZCBj
b25maWd1cmF0aW9uCj4gc3BlY2lmaWVkIHVuZGVyIHRoZSBvcGVuc2JpLWRvbWFpbiBwYXJlbnQg
bm9kZSBhbG9uZ3NpZGUgb3RoZXIKPiBkb21haW5zLiBJIGFsc28gYW0gcGxhbm5pbmcgdG8gaW50
cm9kdWNlICJvcGVuc2JpLGRvbWFpbixpbnN0YW5jZSxyb290Igo+IGNvbXBhdGlibGUgc3RyaW5n
LgoKQW5vdGhlciBhcHByb2FjaCBpcyB0byB0cmVhdCBEVCBub2RlIG5hbWVkICJyb290IiB1bmRl
ciBwYXRoCiIvY2hvc2VuL29wZW5zYmktZG9tYWlucyIgZm9yIFJJU0MtViB3b3JsZHMgcmVsYXRl
ZCBEVCBwcm9wZXJ0eS4KSW4gdGhlIGZ1dHVyZSwgc2FtZSAicm9vdCIgRFQgbm9kZSBjYW4gYmUg
dXNlZCBvdGhlciByb290IGRvbWFpbgpEVCBwcm9wZXJ0aWVzLgoKUmVnYXJkcywKQW51cAoKPgo+
IFRoYW5rcywKPiBQZXRlciBMaW4KPgo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAo
dmFsICYmIChsZW4gPT0gKDIgKiBzaXplb2YoZmR0MzJfdCkpKSkgewo+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHZhbDY0ID0gZmR0MzJfdG9fY3B1KHZhbFswXSk7Cj4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdmFsNjQgPSAodmFsNjQgPDwgMzIpIHwg
ZmR0MzJfdG9fY3B1KHZhbFsxXSk7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcm9vdC5uZXh0X3dpZGxpc3QgPSB2YWw2NDsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgfQo+ID4gPiArICAgICAgICAgICAgICAgfQo+ID4gPiAgICAgICAgIH0KPiA+ID4KPiA+ID4g
ICAgICAgICByZXR1cm4gMDsKPiA+ID4gLS0KPiA+ID4gMi40My43Cj4gPiA+Cj4gPiA+Cj4gPiA+
IC0tCj4gPiA+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gPiA+IG9wZW5zYmlAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+ID4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2Jp
Cg==
