Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEF8C5AD49
	for <opensbi@archiver.kernel.org>; Wed, 28 May 2025 14:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c2conN8bPjT25bPutw58R91XAL8oNygX4RYFbkHkjuE=; b=fUU7Wg22nccHZc
	k3U3QoHEFSYrGlf/x46NVaetiibP3wNqHsoDci0IuW5If9/Wzlwy+u+AxreimQnNxumsYrbvc90nY
	FYU4ikEFCjhl0HeY+R3CX3rVtkCmM1sNaB6KP0y9RsKnMwUmJ4GNrAZAU8X7v9sYY4rKuvVDj5Zfh
	wVUa5o+JpxZrR5Kuj3Rzcq/CghTDbCuAACyVmCZeAAkOH7cfIfi4EJOLBmPsMDxO8qEnuKLzqySPc
	KbGydKZn8vard73hH0Ccr/RteB8wciMOrOPEmk913i2Udfv4eOJ5u8YpSoR2PcqzQF768HUMbao7D
	rs3OFIrZLM9TRNh8lAoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHwd-0000000DRTm-1WyI;
	Wed, 28 May 2025 14:39:51 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHrY-0000000DPrZ-1TMT
	for opensbi@lists.infradead.org;
	Wed, 28 May 2025 14:34:37 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e7c5d470a8bso3750069276.0
        for <opensbi@lists.infradead.org>; Wed, 28 May 2025 07:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1748442875; x=1749047675; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQdJcYH6herndrbzX3pVC3u+c+HBJkT3YpyuoslCfjo=;
        b=aFNL8pPjjODF7gk8Fzk5D4FAb7mDiNjaSZ3vmf0L6RVf1h7nm75vFoNAyu/lBfOFhq
         YYFOVcy3raS5eqlh8dGY1TwNCuAwUwi+G3raefcz321sg7j7YypfXElVSE68ZhYu+2xJ
         yvl7dCVrVtmFZk8/iOHwdwm1j8K4co00ySDocEec04qyg9PRIk/knIad/EjidlzyGsy9
         gqqCPKZiIigP7/hemUuZ+5d8J3+9TIloFjxkK3FMu2tuQl9bD25GmqPKdwQsuooWQn+w
         05AUXSRFulWzuEhRNCjvgRrnfgt8Z0wPAoVK4uBdntPbCOfBI2V6MVpYhyrI2mFDURaC
         1wFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748442875; x=1749047675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQdJcYH6herndrbzX3pVC3u+c+HBJkT3YpyuoslCfjo=;
        b=CR4PpHaEbQmZMkkyErupdGY2Hh6H0a4x2V+eBQPSfjygkCmFbrTqlvZFk1X+pbUjRY
         HnrHsHwRGutei3WA6FRft6QWmBCdcFXVpt2J820HBdHFEYoWR7w/KFWAmAXnNr9FSH3b
         yZQREUYHWTg4pEnHRmm/ELEnvLDNzeMDXCswu6M9UCGRxnSHG+qoD/GYNzx/ZVMG/svs
         RtGX2YCdRjhMmcYAueUD+6sujp5CCXOIN1SWF2HtiPtSMkujyNUfhK0ZhToBrIt0aFCv
         2NFSKGCP2dpRIYM51ZbOV8bgV2eyy8HNm1SpR+zHEsHW2Wpj6FQX17opyb7nr0WwsMGi
         v8kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUXsRh5fqJKL3b/xCsrk0tDYe1Dw/d1aMtVeaFKFqpNs/whZP840cSv4qZCG/KY5mLibwROq+b@lists.infradead.org
X-Gm-Message-State: AOJu0YydXvfEbMT9QHB3fsQ7LQOJE7ZeJEDQuqlh1hKEOjIQHd90c1ho
	FmgSeykH6Kw8VM55L8Jy4uRLXu2XWJEV9Qe178cMUmEHO5h0Jm0Ucxwnc6ahjZYRFhBLcjbAwgv
	UgRlIL5Ltm/jUSvrrcINkRihBCy/XknotuZukcawOBw==
X-Gm-Gg: ASbGncv8JkbPgjnBzGZ8R6sKrfAX+9uza3g4e4+3VJ806n28bwmwBzl2GOitdt2zO4/
	rlZ8vd/N+xlc/PcSFYu6xmSvay39ygYeBu2rpq9SQcS0e6p6NdYWOx8G1M6QFkCeFdrQOKdaVqL
	fqhG1BN6tEGvn7IG96QlfudN1c+PqMQmKbV4kJEwha/UsDtg==
X-Google-Smtp-Source: AGHT+IF3BLGTi2AdTLDddrCowkBhkfEXLdEp6R6I+UzjT74uZaE3Frh/HoB53PivB8PB+BlObDzmVQWxDT8gYjdeHKw=
X-Received: by 2002:a05:6902:f83:b0:e7a:b120:4ace with SMTP id
 3f1490d57ef6-e7d91b37eaemr19782266276.41.1748442875151; Wed, 28 May 2025
 07:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250527124821.2113467-1-apatel@ventanamicro.com>
 <CAKddAkBK1UhLerRx0X+jD0RK2g4BXMSfyuHXczwRD=MBSFiAuA@mail.gmail.com> <CAK9=C2VXWoSX366O=rhp2TYEOwoqcS0hkLPBZLodAupnR35BSw@mail.gmail.com>
In-Reply-To: <CAK9=C2VXWoSX366O=rhp2TYEOwoqcS0hkLPBZLodAupnR35BSw@mail.gmail.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Wed, 28 May 2025 22:34:23 +0800
X-Gm-Features: AX0GCFsme9Sv56t9fQjVZNMyrYL3QVUzw_D1G-Haa1FZkM09LIwayRMlh7HGACY
Message-ID: <CAKddAkBEKJLmDQzgAO+dgZemB7m5Mreu-7pZay6dL1b9uZYmNQ@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: Revert entry_count before doing hsm stop in hsm
 wait loop
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_073436_405665_E5069CB7 
X-CRM114-Status: GOOD (  40.41  )
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

T24gV2VkLCBNYXkgMjgsIDIwMjUgYXQgODoxNOKAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgTWF5IDI4LCAyMDI1IGF0IDM6NTbigK9Q
TSBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgTWF5
IDI3LCAyMDI1IGF0IDg6NDjigK9QTSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNv
bT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IFVzaW5nIGhzbSBzdG9wIGluIGhzbSB3YWl0IGxvb3AgY2F1
c2VzIHNlY29uZGFyeSBoYXJ0cyB0byBiZSBzdHVjawo+ID4gPiBmb3JldmVyIGluIE9wZW5TQkkg
b24gUklTQy1WIHBsYXRmb3JtcyB3aGVyZSBIU00gaGFydCBob3RwbHVnIGlzCj4gPiA+IGF2YWls
YWJsZSBhbmQgYWxsIGhhcnRzIGNvbWUtdXAgYXQgdGhlIHNhbWUgdGltZSBkdXJpbmcgc3lzdGVt
Cj4gPiA+IHBvd2VyLW9uLgo+ID4gPgo+ID4gPiBGb3IgZXhhbXBsZSwgbGV0cyBzYXkgd2UgaGF2
ZSB0d28gaGFydHMgQSBhbmQgQiBvbiBhIFJJU0MtViBwbGF0Zm9ybQo+ID4gPiB3aXRoIEhTTSBo
YXJ0IGhvdHBsdWcgd2hpY2ggY29tZS11cCBhdCB0aGUgc2FtZSB0aW1lIGR1cmluZyBzeXN0ZW0K
PiA+ID4gcG93ZXItb24uIFRoZSBoYXJ0IEEgZW50ZXJzIE9wZW5TQkkgYmVmb3JlIGhhcnQgQiBo
ZW5jZSBpdCBiZWNvbWVzCj4gPiA+IHRoZSBwcmltYXJ5IChvciBjb2xkLWJvb3QpIGhhcnQgd2hl
cmVhcyBoYXJ0IEIgYmVjb21lcyB0aGUgc2Vjb25kYXJ5Cj4gPiA+IChvciB3YXJtLWJvb3QpIGhh
cnQuIFRoZSBoYXJ0IEEgZm9sbG93cyB0aGUgT3BlblNCSSBjb2xkLWJvb3QgcGF0aAo+ID4gPiBh
bmQgcmVnaXN0ZXJzIGhzbSBkZXZpY2UgYmVmb3JlIGhhcnQgQiBlbnRlcnMgT3BlblNCSS4gVGhl
IGhhcnQgQgo+ID4gPiBldmVudHVhbGx5IGVudGVycyBPcGVuU0JJIGFuZCBmb2xsb3dzIHRoZSBP
cGVuU0JJIHdhcm0tYm9vdCBwYXRoCj4gPiA+IHNvIGl0IHdpbGwgaW5jcmVtZW50IGl0J3Mgb3du
IGVudHJ5X2NvdW50IGJlZm9yZSBlbnRlcmluZyBoc20gd2FpdAo+ID4gPiBsb29wIHdoZXJlIGl0
IHNlZXMgaHNtIGRldmljZSBhbmQgc3RvcHMgaXRzZWxmLiBMYXRlciBhcyBwYXJ0IG9mCj4gPiA+
IHRoZSBMaW51eCBib290LXVwIHNlcXVlbmNlLCBoYXJ0IEEgaXNzdWVzIFNCSSBIU00gc3RhcnQg
Y2FsbCB0bwo+ID4gPiBicmluZy11cCBoYXJ0IEIgYnV0IE9wZW5TQkkgc2VlcyBlbnRyeV9jb3Vu
dCAhPSBpbml0X2NvdW50IGZvcgo+ID4gPiBoYXJ0IEIgaW4gc2JpX2hzbV9oYXJ0X3N0YXJ0KCkg
aGVuY2UgaHNtX2RldmljZV9oYXJ0X3N0YXJ0KCkgaXMKPiA+ID4gbm90IGNhbGxlZCBmb3IgaGFy
dCBCIHJlc3VsdGluZyBpbiBoYXJ0IEIgc3R1Y2sgZm9yZXZlciBpbiBPcGVuU0JJLgo+ID4gPgo+
ID4gPiBUbyBmaXggdGhlIGFib3ZlIGlzc3VlLCByZXZlcnQgZW50cnlfY291bnQgYmVmb3JlIGRv
aW5nIGhzbSBzdG9wCj4gPiA+IGluIGhzbSB3YWl0IGxvb3AuCj4gPiA+Cj4gPiA+IEZpeGVzOiBk
ODQ0ZGVhZGVjOTQgKCJsaWI6IHNiaTogVXNlIGhzbSBzdG9wIGZvciBoc20gd2FpdCIpCj4gPiA+
IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4g
PiAtLS0KPiA+ID4gIGluY2x1ZGUvc2JpL3NiaV9pbml0LmggfCAgMiArKwo+ID4gPiAgbGliL3Ni
aS9zYmlfaHNtLmMgICAgICB8ICA0ICsrKy0KPiA+ID4gIGxpYi9zYmkvc2JpX2luaXQuYyAgICAg
fCAxMyArKysrKysrKysrKysrCj4gPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3Ni
aV9pbml0LmggYi9pbmNsdWRlL3NiaS9zYmlfaW5pdC5oCj4gPiA+IGluZGV4IGM5MDEzZWE0Li5h
ZDA2ODY3NCAxMDA2NDQKPiA+ID4gLS0tIGEvaW5jbHVkZS9zYmkvc2JpX2luaXQuaAo+ID4gPiAr
KysgYi9pbmNsdWRlL3NiaS9zYmlfaW5pdC5oCj4gPiA+IEBAIC0xNiw2ICsxNiw4IEBAIHN0cnVj
dCBzYmlfc2NyYXRjaDsKPiA+ID4KPiA+ID4gIHZvaWQgX19ub3JldHVybiBzYmlfaW5pdChzdHJ1
Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gpOwo+ID4gPgo+ID4gPiArdm9pZCBzYmlfcmV2ZXJ0X2Vu
dHJ5X2NvdW50KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCk7Cj4gPiA+ICsKPiA+ID4gIHVu
c2lnbmVkIGxvbmcgc2JpX2VudHJ5X2NvdW50KHUzMiBoYXJ0aW5kZXgpOwo+ID4gPgo+ID4gPiAg
dW5zaWduZWQgbG9uZyBzYmlfaW5pdF9jb3VudCh1MzIgaGFydGluZGV4KTsKPiA+ID4gZGlmZiAt
LWdpdCBhL2xpYi9zYmkvc2JpX2hzbS5jIGIvbGliL3NiaS9zYmlfaHNtLmMKPiA+ID4gaW5kZXgg
ZTgxMjhhMzkuLjU1N2FiMTMxIDEwMDY0NAo+ID4gPiAtLS0gYS9saWIvc2JpL3NiaV9oc20uYwo+
ID4gPiArKysgYi9saWIvc2JpL3NiaV9oc20uYwo+ID4gPiBAQCAtMTc2LDggKzE3NiwxMCBAQCBz
dGF0aWMgdm9pZCBzYmlfaHNtX2hhcnRfd2FpdChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gp
Cj4gPiA+ICAgICAgICAgICAgICAgICAgKiBJZiB0aGUgaHNtX2RldiBpcyByZWFkeSBhbmQgaXQg
c3VwcG9ydCB0aGUgaG90cGx1Zywgd2UgY2FuCj4gPiA+ICAgICAgICAgICAgICAgICAgKiB1c2Ug
dGhlIGhzbSBzdG9wIGZvciBtb3JlIHBvd2VyIHNhdmluZwo+ID4gPiAgICAgICAgICAgICAgICAg
ICovCj4gPiA+IC0gICAgICAgICAgICAgICBpZiAoaHNtX2RldmljZV9oYXNfaGFydF9ob3RwbHVn
KCkpCj4gPiA+ICsgICAgICAgICAgICAgICBpZiAoaHNtX2RldmljZV9oYXNfaGFydF9ob3RwbHVn
KCkpIHsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgc2JpX3JldmVydF9lbnRyeV9jb3Vu
dChzY3JhdGNoKTsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgaHNtX2RldmljZV9oYXJ0
X3N0b3AoKTsKPiA+Cj4gPiBIaSBBbnVwLAo+ID4gVGhhbmtzIGZvciBhZGRyZXNzaW5nIHRoZSBi
dWcgPSkKPiA+Cj4gPiBIb3dldmVyLCB0aGVyZSBtYXkgc3RpbGwgYmUgYW4gaXNzdWUgaW4gdGhl
IGZvbGxvd2luZyBzY2VuYXJpbzoKPiA+IElmIHRoZSBIU00gc3RhdGUgb2YgY29yZSBCIGlzIFNC
SV9IU01fU1RBVEVfU1RBUlRfUEVORElORyBhdCB0aGlzCj4gPiBwb2ludCwgaXQgd29uJ3QgZW50
ZXIgdGhlIHdhcm0gYm9vdCBwYXRoLiBBcyBhIHJlc3VsdCwgdGhlCj4gPiBgaW5pdF9jb3VudGAg
d2lsbCBlbmQgdXAgYmVpbmcgYGVudHJ5X2NvdW50YCArIDEgYWZ0ZXIgdGhlIHdhcm0gaW5pdAo+
ID4gcGF0aC4KPiA+Cj4gPiBXb3VsZCBpdCBtYWtlIHNlbnNlIHRvIGluY3JlbWVudCBgZW50cnlf
Y291bnRgIGFmdGVyIHRoZQo+ID4gYHNiaV9oc21faW5pdCgpYCBjYWxsIGluc3RlYWQ/Cj4KPiBU
aGlzIGlzIG5vdCBhIGJ1ZyByYXRoZXIgZXhwZWN0ZWQgYmVoYXZpb3VyLgo+Cj4gV2hlbiB0aGUg
aGFydCBCIGlzIGluIFNCSV9IU01fU1RBVEVfU1RBUlRfUEVORElORyBzdGF0ZQo+IHRoZW4gaXQg
bWVhbnMgc29tZSBvdGhlciBoYXJ0IEEgaGFzIGlzc3VlZCBIU00gaGFydCBzdGFydCBhbmQKPiBo
YXMgYWxzbyBwcm92aWRlZCBlbnRyeSBkZXRhaWxzLiBUaGUgaGFydCBCIGluY3JlbWVudHMgZW50
cnlfY291bnQKPiB1cG9uIGVudHJ5IGludG8gT3BlblNCSSBhbmQgaW5jcmVtZW50cyBpbml0X2Nv
dW50IGFmdGVyIGluaXRpYWxpemF0aW9uCj4gaXMgZG9uZS4KPgpJJ20gbm90IHN1cmUgaWYgSSB1
bmRlcnN0YW5kIGl0IGNvcnJlY3RseS4KSW4gdGhlIGFib3ZlIGNhc2UsIHRoZSBgaW5pdF9jb3Vu
dGAgIT0gYGVudHJ5X2NvdW50YCBmb3IgaGFydCBCIGFmdGVyCnRoZSBpbml0aWFsaXphdGlvbiBp
cyBkb25lLgpJZiB0aGUgaGFydCBCIGVudGVycyB0aGUgYGhzbV9kZXYtPmhhcnRfc3RvcCgpYCB2
aWEgdGhlClNCSV9FWFRfSFNNX0hBUlRfU1RPUCBwYXRoLCBEb2Vzbid0IHRoYXQgbWVhbiB0aGUg
aGFydCBBIHdvbuKAmXQgYmUgYWJsZQp0byBjYWxsIGBoc21fZGV2LT5oYXJ0X3N0YXJ0KClgIGZv
ciB0aGUgaGFydCBCPwpUaGUgYGhzbV9kZXYtPmhhcnRfc3RvcCgpYCBmdW5jdGlvbiBtYXkgdHJh
bnNpdGlvbiB0aGUgaGFydCBpbnRvIGEKcGxhdGZvcm0tc3BlY2lmaWMgbG93LXBvd2VyIHN0YXRl
IHRoYXQgcmVxdWlyZXMKYGhzbV9kZXYtPmhhcnRfc3RhcnQoKWAgdG8gd2FrZSBpdCB1cC4KCkJl
c3QgUmVnYXJkcywKTmljawoKPiBSZWdhcmRzLAo+IEFudXAKPgo+ID4KPiA+ID4gKyAgICAgICAg
ICAgICAgIH0KPiA+ID4KPiA+ID4gICAgICAgICAgICAgICAgIHdmaSgpOwo+ID4gPiAgICAgICAg
IH0KPiA+ID4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2luaXQuYyBiL2xpYi9zYmkvc2JpX2lu
aXQuYwo+ID4gPiBpbmRleCA2MmMzMjY4Mi4uODRhNjM3NDggMTAwNjQ0Cj4gPiA+IC0tLSBhL2xp
Yi9zYmkvc2JpX2luaXQuYwo+ID4gPiArKysgYi9saWIvc2JpL3NiaV9pbml0LmMKPiA+ID4gQEAg
LTU3OSw2ICs1NzksMTkgQEAgdm9pZCBfX25vcmV0dXJuIHNiaV9pbml0KHN0cnVjdCBzYmlfc2Ny
YXRjaCAqc2NyYXRjaCkKPiA+ID4gICAgICAgICAgICAgICAgIGluaXRfd2FybWJvb3Qoc2NyYXRj
aCwgaGFydGlkKTsKPiA+ID4gIH0KPiA+ID4KPiA+ID4gK3ZvaWQgc2JpX3JldmVydF9lbnRyeV9j
b3VudChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gpCj4gPiA+ICt7Cj4gPiA+ICsgICAgICAg
dW5zaWduZWQgbG9uZyAqZW50cnlfY291bnQsICppbml0X2NvdW50Owo+ID4gPiArCj4gPiA+ICsg
ICAgICAgaWYgKCFlbnRyeV9jb3VudF9vZmZzZXQgfHwgIWluaXRfY291bnRfb2Zmc2V0KQo+ID4g
PiArICAgICAgICAgICAgICAgc2JpX2hhcnRfaGFuZygpOwo+ID4gPiArCj4gPiA+ICsgICAgICAg
ZW50cnlfY291bnQgPSBzYmlfc2NyYXRjaF9vZmZzZXRfcHRyKHNjcmF0Y2gsIGVudHJ5X2NvdW50
X29mZnNldCk7Cj4gPiA+ICsgICAgICAgaW5pdF9jb3VudCA9IHNiaV9zY3JhdGNoX29mZnNldF9w
dHIoc2NyYXRjaCwgaW5pdF9jb3VudF9vZmZzZXQpOwo+ID4gPiArCj4gPiA+ICsgICAgICAgKmVu
dHJ5X2NvdW50ID0gKmluaXRfY291bnQ7Cj4gPiA+ICt9Cj4gPiA+ICsKPiA+ID4gIHVuc2lnbmVk
IGxvbmcgc2JpX2VudHJ5X2NvdW50KHUzMiBoYXJ0aW5kZXgpCj4gPiA+ICB7Cj4gPiA+ICAgICAg
ICAgc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoOwo+ID4gPiAtLQo+ID4gPiAyLjQzLjAKPiA+
ID4KPiA+Cj4gPiBCZXN0IFJlZ2FyZHMsCj4gPiBOaWNrCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxp
c3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
