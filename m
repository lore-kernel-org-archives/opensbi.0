Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B9EC87FCF
	for <opensbi@archiver.kernel.org>; Mon, 11 Aug 2025 02:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vzQo2ksrH5LRfdMs3ExYQuGpwmL6yfXJI0cNRczlyn0=; b=39BAD/hbSOppak
	xBoBCdmST5Mgn0OHBPH32v2l88LxBDcv1XZaIFVB3IeLAlURzc1IQ4R7URs05pXDqGvND9p0555pX
	zO/hX5Hy9jtayWlgywGNK3KsqHo4clXmrHQ1Nzur8jKZn8/evEmnsWqapoxkFAwbucH+1pd1u0+Uf
	zNktMeDRwL9G2PIEJ0ZILi+P6vWvInPB4PJrDbOYkiVl1xOgIi5CefndgwxZbIcjVzgPS05NtWJQM
	8VsRI7oib4nD+JPlG0hYvrWG9TbWI/1b/rtYOM0LMq1euNrWUwHsU84NYot7b4Vx14fT4H5SCr+wo
	AXhXsCvXLbwhQI+uZ8OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulI7X-00000006KGf-1345;
	Mon, 11 Aug 2025 02:18:43 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulI5M-00000006K9S-3CE9
	for opensbi@lists.infradead.org;
	Mon, 11 Aug 2025 02:16:29 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e8fe3aeffb6so3233619276.3
        for <opensbi@lists.infradead.org>; Sun, 10 Aug 2025 19:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1754878587; x=1755483387; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEhPqjRPnbS1hyfoww9L6aRgZjsd1HgC1pY21MtumLc=;
        b=hh9RyEKpvkliR6dwwlBZ7Rs247+VhOQzhnMsg8Bbzb+wVKaLkAEQYS9/uY8o3Z7+q9
         DhBt4tTGuE/zJLsCWxlN8nw+09+YXD0/rdECMMNpKWKDqCrJoTV+NSLZxWpsk55Z7JwG
         ymvWzeVhfg0gX7am1ilAgEjG3hsgefM4Rd6yMiCO1ziZKSBXiiDOjIhSTeqSzgUzwsR8
         S0MgMCg+u+f4SQhve0qlX9s4Yeu1E/dXeKelH/t0RBdZdjlkvmOeDqRl/QIRkiFf9iln
         RqYK9f95D2x6lzXmzQAXIfPn+OOjS9cUrJMgWjvgFQHc3rWM+wU7pqXjLyoFCGP5a335
         gCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754878587; x=1755483387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UEhPqjRPnbS1hyfoww9L6aRgZjsd1HgC1pY21MtumLc=;
        b=QMzBGV2Esm5t5UCI5L21IyufI33RMHA28RlyF7DBEoAMSrNL5ix6h80cIWXO1aJK6V
         63vyHD19pvk1guBGQWrI0IYlruGxalMEWyrLYWNmbNniIqMXZXH9gCG3KuU1Yc/QzS1a
         I4G2OV32GTq3l0z8uhaYPa9YWxae5RM2NKOoqDwREsC1NUD6Hmfj7+qygr5e0p0Id6+1
         sRQjewRV+n1HdOINGGWiVkLzofesVK0zrEzgWxzl7wZhgZput+e/9N2YXmIS4kF4PGgU
         +0weRqUAnyKU6Jsl4qXCGabb+Zqq8Wc+iH/Rnfi7WbP0zBR5L5RNi5CVR8RRF+LGCv40
         dFbA==
X-Gm-Message-State: AOJu0YwQrnoYv5bCic2NBpS93RWz3QZasGBwLYd11KqPPWs2eVn4vMPM
	jS6HSAjDAiICfEust3dZ8rah0eryvG323xQxLIM1V98i46SNcAUsrhtXEWNzvTHRuz2gAoDWXuw
	7BjE7r0YZ0fnbcVFX6pEKUl6yu0lCWX+QuDcRX00Ddg==
X-Gm-Gg: ASbGncudigDgewWW594HxDId/zLKqk5g+MYIXtdzzEj7hOCItsEtp0XDkWuFKI2OphH
	zDguXNJydkbmno5waQKSpYpL6App5P7zlFCyI08cMkOza7fWE3m1CHewJQ84wbRR3bKOnXrfnIF
	lY3muSeOHAr82ZQ/N26Cz6anx1RXZeCpCUhVsu/5mjVzppv91SSLArMohjCEf3to6SCNMgoEWi1
	fw6UfGIDQ==
X-Google-Smtp-Source: AGHT+IG/A4Zc0gGiOBDhNgFkH0s8l5LJSkXkoXAbd61rHsnMSfvWA3uzCY/EB9ZpTTyo+p1PLI2D7haAP5J1vueEG+A=
X-Received: by 2002:a05:6902:2a42:b0:e90:5a65:24c1 with SMTP id
 3f1490d57ef6-e905a65270emr7261582276.25.1754878587315; Sun, 10 Aug 2025
 19:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250708074940.10904-1-nick.hu@sifive.com> <20250708074940.10904-6-nick.hu@sifive.com>
 <CAAhSdy2+zx8NWFQ8O7-qPNpkb7Xu_8VrNha7+JaBskU1L-woDw@mail.gmail.com>
In-Reply-To: <CAAhSdy2+zx8NWFQ8O7-qPNpkb7Xu_8VrNha7+JaBskU1L-woDw@mail.gmail.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Mon, 11 Aug 2025 10:16:16 +0800
X-Gm-Features: Ac12FXzb3dNQkXj2Fp0VN-SpiU8aUjyw-u5g4RMfTJIzMcH-WlHJ5ow_JLqKBVA
Message-ID: <CAKddAkCYGg=kPFajBvckC4PTYeJQxHzbK7herqxynqGjyj2QHA@mail.gmail.com>
Subject: Re: [PATCH v3 05/12] platform: generic: Add SiFive development platform
To: Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_191628_814753_3F6798D8 
X-CRM114-Status: GOOD (  23.84  )
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
Cc: vincent.chen@sifive.com, opensbi@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBBdWcgNCwgMjAyNSBhdCA0OjM34oCvUE0gQW51cCBQYXRlbCA8YW51cEBicmFpbmZh
dWx0Lm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1bCA4LCAyMDI1IGF0IDE6MjDigK9QTSBOaWNr
IEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+IHdyb3RlOgo+ID4KPiA+IEZyb206IFZpbmNlbnQgQ2hl
biA8dmluY2VudC5jaGVuQHNpZml2ZS5jb20+Cj4gPgo+ID4gVGhlIHNpZml2ZV9kZXZfcGxhdGZv
cm0gaXMgYSBuZXcgcGxhdGZvcm0gd2hpY2ggaXMgY29tcGF0aWJsZSB0byB0aGUKPiA+IGdlbmVy
aWMgcGxhdGZvcm0gdG8gcGxhY2Ugc29tZSBmZWF0dXJlcyB3aGljaCBhcmUgb25seSBmb3IgdGhl
IFNpRml2ZQo+ID4gZGV2ZWxvcG1lbnQgbWFjaGluZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBW
aW5jZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgo+ID4gQ28tZGV2ZWxvcGVkLWJ5
OiBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBOaWNrIEh1
IDxuaWNrLmh1QHNpZml2ZS5jb20+Cj4gPiAtLS0KPiA+ICBwbGF0Zm9ybS9nZW5lcmljL0tjb25m
aWcgICAgICAgICAgICAgICAgICAgICAgfCAgNSArKysKPiA+ICBwbGF0Zm9ybS9nZW5lcmljL2Nv
bmZpZ3MvZGVmY29uZmlnICAgICAgICAgICAgfCAgMSArCj4gPiAgcGxhdGZvcm0vZ2VuZXJpYy9z
aWZpdmUvb2JqZWN0cy5tayAgICAgICAgICAgIHwgIDMgKysKPiA+ICBwbGF0Zm9ybS9nZW5lcmlj
L3NpZml2ZS9zaWZpdmVfZGV2X3BsYXRmb3JtLmMgfCA0MSArKysrKysrKysrKysrKysrKysrCj4g
PiAgNCBmaWxlcyBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IHBsYXRmb3JtL2dlbmVyaWMvc2lmaXZlL3NpZml2ZV9kZXZfcGxhdGZvcm0uYwo+ID4KPiA+
IGRpZmYgLS1naXQgYS9wbGF0Zm9ybS9nZW5lcmljL0tjb25maWcgYi9wbGF0Zm9ybS9nZW5lcmlj
L0tjb25maWcKPiA+IGluZGV4IGEyNGQ2YWIyLi4yMGMyNWE4MyAxMDA2NDQKPiA+IC0tLSBhL3Bs
YXRmb3JtL2dlbmVyaWMvS2NvbmZpZwo+ID4gKysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9LY29uZmln
Cj4gPiBAQCAtNDMsNiArNDMsMTEgQEAgY29uZmlnIFBMQVRGT1JNX1JFTkVTQVNfUlpGSVZFCj4g
PiAgICAgICAgIHNlbGVjdCBBTkRFU19QTVUKPiA+ICAgICAgICAgZGVmYXVsdCBuCj4gPgo+ID4g
K2NvbmZpZyBQTEFURk9STV9TSUZJVkVfREVWCj4gPiArICAgICAgIGJvb2wgIlNpRml2ZSBkZXZl
bG9wbWVudCBwbGF0Zm9ybSBzdXBwb3J0Igo+ID4gKyAgICAgICBkZXBlbmRzIG9uIEZEVF9DQUNI
RQo+ID4gKyAgICAgICBkZWZhdWx0IG4KPiA+ICsKPiA+ICBjb25maWcgUExBVEZPUk1fU0lGSVZF
X0ZVNTQwCj4gPiAgICAgICAgIGJvb2wgIlNpRml2ZSBGVTU0MCBzdXBwb3J0Igo+ID4gICAgICAg
ICBkZWZhdWx0IG4KPiA+IGRpZmYgLS1naXQgYS9wbGF0Zm9ybS9nZW5lcmljL2NvbmZpZ3MvZGVm
Y29uZmlnIGIvcGxhdGZvcm0vZ2VuZXJpYy9jb25maWdzL2RlZmNvbmZpZwo+ID4gaW5kZXggNmIy
MTljZmIuLjQyZTdlZjc1IDEwMDY0NAo+ID4gLS0tIGEvcGxhdGZvcm0vZ2VuZXJpYy9jb25maWdz
L2RlZmNvbmZpZwo+ID4gKysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9jb25maWdzL2RlZmNvbmZpZwo+
ID4gQEAgLTEsNiArMSw3IEBACj4gPiAgQ09ORklHX1BMQVRGT1JNX0FMTFdJTk5FUl9EMT15Cj4g
PiAgQ09ORklHX1BMQVRGT1JNX0FOREVTX0FFMzUwPXkKPiA+ICBDT05GSUdfUExBVEZPUk1fUkVO
RVNBU19SWkZJVkU9eQo+ID4gK0NPTkZJR19QTEFURk9STV9TSUZJVkVfREVWPXkKPiA+ICBDT05G
SUdfUExBVEZPUk1fU0lGSVZFX0ZVNTQwPXkKPiA+ICBDT05GSUdfUExBVEZPUk1fU0lGSVZFX0ZV
NzQwPXkKPiA+ICBDT05GSUdfUExBVEZPUk1fU09QSEdPX1NHMjA0Mj15Cj4gPiBkaWZmIC0tZ2l0
IGEvcGxhdGZvcm0vZ2VuZXJpYy9zaWZpdmUvb2JqZWN0cy5tayBiL3BsYXRmb3JtL2dlbmVyaWMv
c2lmaXZlL29iamVjdHMubWsKPiA+IGluZGV4IGQ3NWU0NDRhLi5kMzJlMTI3MyAxMDA2NDQKPiA+
IC0tLSBhL3BsYXRmb3JtL2dlbmVyaWMvc2lmaXZlL29iamVjdHMubWsKPiA+ICsrKyBiL3BsYXRm
b3JtL2dlbmVyaWMvc2lmaXZlL29iamVjdHMubWsKPiA+IEBAIC0yLDYgKzIsOSBAQAo+ID4gICMg
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEJTRC0yLUNsYXVzZQo+ID4gICMKPiA+Cj4gPiArY2Fy
cmF5LXBsYXRmb3JtX292ZXJyaWRlX21vZHVsZXMtJChDT05GSUdfUExBVEZPUk1fU0lGSVZFX0RF
VikgKz0gc2lmaXZlX2Rldl9wbGF0Zm9ybQo+ID4gK3BsYXRmb3JtLW9ianMtJChDT05GSUdfUExB
VEZPUk1fU0lGSVZFX0RFVikgKz0gc2lmaXZlL3NpZml2ZV9kZXZfcGxhdGZvcm0ubwo+ID4gKwo+
ID4gIGNhcnJheS1wbGF0Zm9ybV9vdmVycmlkZV9tb2R1bGVzLSQoQ09ORklHX1BMQVRGT1JNX1NJ
RklWRV9GVTU0MCkgKz0gc2lmaXZlX2Z1NTQwCj4gPiAgcGxhdGZvcm0tb2Jqcy0kKENPTkZJR19Q
TEFURk9STV9TSUZJVkVfRlU1NDApICs9IHNpZml2ZS9mdTU0MC5vCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL3BsYXRmb3JtL2dlbmVyaWMvc2lmaXZlL3NpZml2ZV9kZXZfcGxhdGZvcm0uYyBiL3BsYXRm
b3JtL2dlbmVyaWMvc2lmaXZlL3NpZml2ZV9kZXZfcGxhdGZvcm0uYwo+ID4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwLi5hYzY1OTg2OAo+ID4gLS0tIC9kZXYvbnVsbAo+
ID4gKysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9zaWZpdmUvc2lmaXZlX2Rldl9wbGF0Zm9ybS5jCj4g
PiBAQCAtMCwwICsxLDQxIEBACj4gPiArLyoKPiA+ICsgKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogQlNELTItQ2xhdXNlCj4gPiArICoKPiA+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjUgU2lGaXZl
IEluYy4KPiA+ICsgKi8KPiA+ICsKPiA+ICsjaW5jbHVkZSA8cGxhdGZvcm1fb3ZlcnJpZGUuaD4K
PiA+ICsjaW5jbHVkZSA8c2JpX3V0aWxzL2NhY2hlL2ZkdF9jbW9faGVscGVyLmg+Cj4gPiArCj4g
PiArc3RhdGljIGludCBzaWZpdmVfZWFybHlfaW5pdChib29sIGNvbGRfYm9vdCkKPiA+ICt7Cj4g
PiArICAgICAgIGludCByYzsKPiA+ICsKPiA+ICsgICAgICAgcmMgPSBnZW5lcmljX2Vhcmx5X2lu
aXQoY29sZF9ib290KTsKPiA+ICsgICAgICAgaWYgKHJjKQo+ID4gKyAgICAgICAgICAgICAgIHJl
dHVybiByYzsKPiA+ICsKPiA+ICsgICAgICAgcmMgPSBmZHRfY21vX2luaXQoY29sZF9ib290KTsK
PiA+ICsgICAgICAgaWYgKHJjKQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiByYzsKPgo+IFdo
eSBub3QgY2FsbCBmZHRfY21vX2luaXQoKSBkaXJlY3RseSBhcyBwYXJ0IG9mIGdlbmVyaWNfZWFy
bHlfaW5pdCgpID8KPgpHb29kIHBvaW50ISBJJ2xsIG1vdmUgaXQgdG8gdGhlIGdlbmVyaWNfZWFy
bHlfaW5pdCgpLgoKPiA+ICsKPiA+ICsgICAgICAgcmV0dXJuIDA7Cj4gPiArfQo+ID4gKwo+ID4g
K3N0YXRpYyBpbnQgc2lmaXZlX3BsYXRmb3JtX2luaXQoY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9k
ZW9mZiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGZk
dF9tYXRjaCAqbWF0Y2gpCj4gPiArewo+ID4gKyAgICAgICBnZW5lcmljX3BsYXRmb3JtX29wcy5l
YXJseV9pbml0ID0gc2lmaXZlX2Vhcmx5X2luaXQ7Cj4gPiArCj4gPiArICAgICAgIHJldHVybiAw
Owo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGZkdF9tYXRjaCBzaWZpdmVf
ZGV2X3BsYXRmb3JtX21hdGNoW10gPSB7Cj4gPiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAic2lm
aXZlLWRldiIgfSwKPiA+ICsgICAgICAgeyB9LAo+ID4gK307Cj4gPiArCj4gPiArY29uc3Qgc3Ry
dWN0IGZkdF9kcml2ZXIgc2lmaXZlX2Rldl9wbGF0Zm9ybSA9IHsKPiA+ICsgICAgICAgLm1hdGNo
X3RhYmxlID0gc2lmaXZlX2Rldl9wbGF0Zm9ybV9tYXRjaCwKPiA+ICsgICAgICAgLmluaXQgPSBz
aWZpdmVfcGxhdGZvcm1faW5pdCwKPiA+ICt9Owo+ID4gLS0KPiA+IDIuMTcuMQo+ID4KPgo+IFJl
Z2FyZHMsCj4gQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29w
ZW5zYmkK
