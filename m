Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F242E9E31B
	for <opensbi@archiver.kernel.org>; Wed, 11 Feb 2026 15:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kr0RYS7FJEjqFCzjxQRJUxYRrLKje08uD1rHOTaP69k=; b=t+HbwNhmNyTLlV
	FvCS+/j91gZH8IvIaW8qUTRxX23XoVba/S6dVr4RNYdfEvVSso1umND7pEjdz+6ZlJ95nGrumqr+o
	8Y8Jbc3oSfYjeFQG/xEUuZpzuc4Umq/QW5rkGHwoh5mM7sKeF1R+iww0XbjzBuJv/fb2VYU96rG60
	JOtDqqzHOLbYeRpfz6/H65g0Zw/aSc1aWSt8fK0ZTexuNLfefb7zi0FTJuPnqQJD/qv17LJos0Vwo
	KKklDyvvWIKc24BHaoG+ZAV75pB16INl1xbtxs6wo3Mr6HdekTSp/cfAbwz7D/Xbda0YilEJWJ6tW
	8iJu4Z98urd0LUGBW45Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqCNR-00000000nt0-491V;
	Wed, 11 Feb 2026 15:43:41 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqCNO-00000000nse-1llq
	for opensbi@lists.infradead.org;
	Wed, 11 Feb 2026 15:43:41 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-66f747175d8so1143588eaf.0
        for <opensbi@lists.infradead.org>; Wed, 11 Feb 2026 07:43:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770824617; cv=none;
        d=google.com; s=arc-20240605;
        b=jxx1MH5CoskKenceGXtHLYn5qdU1a1TueVAt2JRT55amOTmV2eRNdFJjGEZMxE5xa7
         ataUynSEcznu4vVbwTR4R3lKd3YUb0vH2eYZ0DO4utPn0pzozwCV9dlpL5KM8d1ExuPU
         ozgQoZu6wpd9XFyNLIh9pWrR5W7eRzwdbkbsYx1m8PyeO0/z8RsyAXHUg4bHcE92IN3u
         TuDGj2R68uw8NxYYI4NavKV/5cmM8qyd3RbmBLa7adfT6EMgn5esOpY1oUNY3U/D7QgE
         te4Kw46rKz8C2/iq8f7Rx3U1k+W+DvlYQ0i8G9ADFpeQ4Hz14X5iW8+/u+kb4vuh92nq
         RxIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Om9bgqWDhH/FZuJOJLB7jdLcjCdSZPGFS24ucCYgqbA=;
        fh=Klr2Q63rPZX7rQhQp+/Zl9LnNutlzHMoFWEn2Zeobt8=;
        b=g5yvgS0S8e6oosDMq3olXeO896p8bnK3r4k5Tn2BBX3FnmhkM3UqyLp6YobKAT6Ehh
         wM/2jX6CQQpAMxMK9CCO3S/GRTetuTLiatr85L0iZj5cMTjWGY2aWjKyJnsjJRpH3vIo
         U5zCdT+kji4FIpfLRVcXsVLWoDh2U+/mNZ7wvfa3p4UUNgvQAI0KS/MUGu7e+8iXLIlX
         0awCIQSbmVBWqTsTLjSC0nGCrQzKforg7X2R8voGaxA+IkB7UBnFKNyXhlVvl2BoIMor
         Dn2t9Nm0mbho1i2QlBCbWbjJZ/CguqOVwWtZ+L1DMquPkoNDsp4EseF3DbyNGYXxFL0N
         ZJ8g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1770824617; x=1771429417; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Om9bgqWDhH/FZuJOJLB7jdLcjCdSZPGFS24ucCYgqbA=;
        b=fvP8k8/Rquh2yBHBfkRXIuaBxBI3Mg/DMmQEWTucTK21n+lB5tn79IGYlKqm0b7Mq+
         2Nh5ySL8hbJgnHz6KsnOyjECqYvkZFnxjhSHgRZs/kOPYQi/LE9fQS0WLKapqTgiZoQy
         ii8FW7x8MHEc5RYD8H6MiTX4Hi1STH8EMG7LnpBFXJSNRzpeUANVrW6LJ54EpcOyspj0
         900decl00DjCzfkiTmurggqIkROcTYMbdvLc2fmFXCpbvuh2b32FRKGHWe/HQlmp5WNg
         21X9k049/xDSXRid+I79OKk94dtjTxa3cuumqb+gKEIrf1Fb4d9tXZQ6vy5CSY2nPQ8R
         tfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770824617; x=1771429417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Om9bgqWDhH/FZuJOJLB7jdLcjCdSZPGFS24ucCYgqbA=;
        b=SONKIRIVEEnrW6cP5GudRUaSM8zJVvEH0Pbv0Gy3zlbfo4zgRMZlgfxz0u+z88hzat
         L5BzW6eNsiHkoFJX4L0j9o25BilmYtcrU0QYDnyRcPq+RIZ/WXat9AMpj5sYlej3eSfg
         uJJdQz16hKp2TO5LqcE0iHpE9bGuaOYhUFy4hz9CZqraRAzoe1q59gtMPkUqJZ2T8OMk
         OumcuxcXadgknFvBhqxMeDnWQt6SDKCcMulgzezP6QM9PAwi6d5wKj6/fZy4PlK2R1EV
         eFo+ZOrwGklsr3CsiFVU5eJ7CxvZC5YMuKr3V6r1GyGZGQcQIOMp7iJcKX0zZ5eeAtWL
         iWAg==
X-Forwarded-Encrypted: i=1; AJvYcCVBJnSkCUdXey2lqhszxpsThbo2tkyPMVhsz4HqOUc1F1yBQpJqgd1shKyi5/arzNHR7MwLim8s@lists.infradead.org
X-Gm-Message-State: AOJu0YxWcZv+EF0QuOG4mdGKpAyyLN/jzZGQI2Kw12IrcWYZX7xjbQ0C
	qCbbX/Rta5L0IQ4kfMHBy1pScoRkRc7OtJt/o26mwpCOcfBiD96JFyXZbwiczhnRKJbhARcEm2M
	XbqKdbd9eym1j5eGHio493zx5she4gP0PDbEcbU75Lw==
X-Gm-Gg: AZuq6aLXPn50mUuvPAn1Y8+0yju9pxoMXYmh9//hUpliYtAissme3lTz+oIaaL5hmlJ
	VEyJCdwhxWErXyQ2NtyrHDDz9V7gG93le6OEmilg62oV3+lGnnVQbZa+X4QCUNWs55WE449AwHK
	ptuLmj31ZI2pio56EQ0/fRmpPpTPFjW5GKLrKmQXQAPDeWpfWGCiEDTCdkyK3FdUdpAl6rnddOo
	0GO7gCr6RwPMq6HKPQjeHgREZl5+CGxU9eEgGu3VSiBTum4XPS69/0FGVgEMDG+mBTSGPwBP8j3
	ObFU2cTtpV7Eht0rZ83KfOkxgkDfGmKD9wfWsmoYZYIQv/r8Fvby0z+4BMojwbcMr/DB9g==
X-Received: by 2002:a05:6820:1610:b0:66b:ea2:afa with SMTP id
 006d021491bc7-66d09f9c4bbmr7421169eaf.20.1770824617180; Wed, 11 Feb 2026
 07:43:37 -0800 (PST)
MIME-Version: 1.0
References: <20260207102602.2917520-1-anup.patel@oss.qualcomm.com>
 <20260207102602.2917520-6-anup.patel@oss.qualcomm.com> <0f55c5db-929f-4192-994a-8432c5bda1b4@gmail.com>
 <CAAhSdy26XNCbfDhe8EpK-AWMneyS=Hpwo8mb7vC1zrcVhBMKPQ@mail.gmail.com> <CAMDkj5yiHTa3uwZ8NHXTj-6LGOKPdyH36AoY1L0cVzXmvyb6PQ@mail.gmail.com>
In-Reply-To: <CAMDkj5yiHTa3uwZ8NHXTj-6LGOKPdyH36AoY1L0cVzXmvyb6PQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 11 Feb 2026 21:13:25 +0530
X-Gm-Features: AZwV_QilQ_rHQiHqbgf5PjK8fRZp4hZHRdqIUv692-VEd0Uu0IYQu7BiYBQ-N8Q
Message-ID: <CAAhSdy1GRzGC4nV1F-gEPTjOgegHYWd6312mf7gvhXqT+L9+1g@mail.gmail.com>
Subject: Re: [PATCH 5/8] lib: sbi_irqchip: Support irqchip device targetting
 subset of harts
To: Raymond Mao <raymondmaoca@gmail.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Atish Patra <atish.patra@linux.dev>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Dave Patel <dave.patel@riscstar.com>, 
	Samuel Holland <samuel.holland@sifive.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_074340_233230_5B754199 
X-CRM114-Status: GOOD (  32.26  )
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

T24gV2VkLCBGZWIgMTEsIDIwMjYgYXQgODozMuKAr1BNIFJheW1vbmQgTWFvIDxyYXltb25kbWFv
Y2FAZ21haWwuY29tPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBPbiBUdWUsIEZlYiAxMCwgMjAy
NiBhdCAxMTowOeKAr0FNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+IHdyb3RlOgo+
ID4KPiA+IE9uIFR1ZSwgRmViIDEwLCAyMDI2IGF0IDE6NTXigK9BTSBSYXltb25kIE1hbyA8cmF5
bW9uZG1hb2NhQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEhpIEFudXAsCj4gPiA+Cj4g
PiA+IE9uIDIwMjYtMDItMDcgNToyNSBhLm0uLCBhbnVwLnBhdGVsIGF0IG9zcy5xdWFsY29tbS5j
b20gKEFudXAgUGF0ZWwpIHdyb3RlOgo+ID4gPiA+IEl0IGlzIHBvc3NpYmxlIHRvIGhhdmUgcGxh
dGZvcm0gd2hlcmUgYW4gaXJxY2hpcCBkZXZpY2UgdGFyZ2V0cwo+ID4gPiA+IGEgc3Vic2V0IG9m
IGhhcnRzIGFuZCB0aGVyZSBhcmUgbXVsdGlwbGUgaXJxY2hpcCBkZXZpY2VzIHRvIGNvdmVyCj4g
PiA+ID4gYWxsIGhhcnRzLgo+ID4gPiA+Cj4gPiA+ID4gVG8gc3VwcG9ydCB0aGlzIHNjZW5hcmlv
Ogo+ID4gPiA+IDEpIEFkZCB0YXJnZXRfaGFydHMgaGFydG1hc2sgdG8gc3RydWN0IHNiaV9pcnFj
aGlwX2RldmljZSB3aGljaAo+ID4gPiA+ICAgICByZXByZXNlbnRzIHRoZSBzZXQgb2YgaGFydHMg
dGFyZ2V0dGVkIGJ5IHRoZSBpcnFjaGlwIGRldmljZQo+ID4gPiA+IDIpIENhbGwgd2FybV9pbml0
KCkgYW5kIGlycV9oYW5kbGUoKSBjYWxsYmFja3Mgb2YgYW4gaXJxY2hpcCBkZXZpY2UKPiA+ID4g
PiAgICAgb24gYSBoYXJ0IG9ubHkgaWYgaXJxY2hpcCBkZXZpY2UgdGFyZ2V0cyB0aGF0IHBhcnRp
Y3VsYXIgaGFydAo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YW51
cC5wYXRlbCBhdCBvc3MucXVhbGNvbW0uY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICAgaW5jbHVk
ZS9zYmkvc2JpX2lycWNoaXAuaCB8ICA4ICsrKysrLS0KPiA+ID4gPiAgIGxpYi9zYmkvc2JpX2ly
cWNoaXAuYyAgICAgfCA0OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0K
PiA+ID4gPiAgIGxpYi91dGlscy9pcnFjaGlwL2FwbGljLmMgfCAxMiArKysrKysrKystCj4gPiA+
ID4gICBsaWIvdXRpbHMvaXJxY2hpcC9pbXNpYy5jIHwgIDcgKysrKy0tCj4gPiA+ID4gICBsaWIv
dXRpbHMvaXJxY2hpcC9wbGljLmMgIHwgIDUgKystLQo+ID4gPiA+ICAgNSBmaWxlcyBjaGFuZ2Vk
LCA1OSBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKPiA+ID4gPgo+ID4gPiA+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL3NiaS9zYmlfaXJxY2hpcC5oIGIvaW5jbHVkZS9zYmkvc2JpX2lycWNo
aXAuaAo+ID4gPiA+IGluZGV4IGNkYTFlNTBmLi5jM2RlZDI3MSAxMDA2NDQKPiA+ID4gPiAtLS0g
YS9pbmNsdWRlL3NiaS9zYmlfaXJxY2hpcC5oCj4gPiA+ID4gKysrIGIvaW5jbHVkZS9zYmkvc2Jp
X2lycWNoaXAuaAo+ID4gPiA+IEBAIC0xMCw2ICsxMCw3IEBACj4gPiA+ID4gICAjaWZuZGVmIF9f
U0JJX0lSUUNISVBfSF9fCj4gPiA+ID4gICAjZGVmaW5lIF9fU0JJX0lSUUNISVBfSF9fCj4gPiA+
ID4KPiA+ID4gPiArI2luY2x1ZGUgPHNiaS9zYmlfaGFydG1hc2suaD4KPiA+ID4gPiAgICNpbmNs
dWRlIDxzYmkvc2JpX2xpc3QuaD4KPiA+ID4gPiAgICNpbmNsdWRlIDxzYmkvc2JpX3R5cGVzLmg+
Cj4gPiA+ID4KPiA+ID4gPiBAQCAtMjAsMTEgKzIxLDE0IEBAIHN0cnVjdCBzYmlfaXJxY2hpcF9k
ZXZpY2Ugewo+ID4gPiA+ICAgICAgIC8qKiBOb2RlIGluIHRoZSBsaXN0IG9mIGlycWNoaXAgZGV2
aWNlcyAqLwo+ID4gPiA+ICAgICAgIHN0cnVjdCBzYmlfZGxpc3Qgbm9kZTsKPiA+ID4gPgo+ID4g
PiA+ICsgICAgIC8qKiBTZXQgb2YgaGFydHMgdGFyZ2V0dGVkIGJ5IHRoaXMgaXJxY2hpcCAqLwo+
ID4gPiA+ICsgICAgIHN0cnVjdCBzYmlfaGFydG1hc2sgdGFyZ2V0X2hhcnRzOwo+ID4gPiA+ICsK
PiA+ID4gPiAgICAgICAvKiogSW5pdGlhbGl6ZSBwZXItaGFydCBzdGF0ZSBmb3IgdGhlIGN1cnJl
bnQgaGFydCAqLwo+ID4gPiA+ICAgICAgIGludCAoKndhcm1faW5pdCkoc3RydWN0IHNiaV9pcnFj
aGlwX2RldmljZSAqY2hpcCk7Cj4gPiA+ID4KPiA+ID4gPiAgICAgICAvKiogUHJvY2VzcyBoYXJk
d2FyZSBpbnRlcnJ1cHRzIGZyb20gdGhpcyBpcnFjaGlwICovCj4gPiA+ID4gLSAgICAgaW50ICgq
cHJvY2Vzc19od2lycXMpKHZvaWQpOwo+ID4gPiA+ICsgICAgIGludCAoKnByb2Nlc3NfaHdpcnFz
KShzdHJ1Y3Qgc2JpX2lycWNoaXBfZGV2aWNlICpjaGlwKTsKPiA+ID4gPiAgIH07Cj4gPiA+ID4K
PiA+ID4gPiAgIC8qKgo+ID4gPiA+IEBAIC0zOCw3ICs0Miw3IEBAIHN0cnVjdCBzYmlfaXJxY2hp
cF9kZXZpY2Ugewo+ID4gPiA+ICAgaW50IHNiaV9pcnFjaGlwX3Byb2Nlc3Modm9pZCk7Cj4gPiA+
ID4KPiA+ID4gPiAgIC8qKiBSZWdpc3RlciBhbiBpcnFjaGlwIGRldmljZSB0byByZWNlaXZlIGNh
bGxiYWNrcyAqLwo+ID4gPiA+IC12b2lkIHNiaV9pcnFjaGlwX2FkZF9kZXZpY2Uoc3RydWN0IHNi
aV9pcnFjaGlwX2RldmljZSAqY2hpcCk7Cj4gPiA+ID4gK2ludCBzYmlfaXJxY2hpcF9hZGRfZGV2
aWNlKHN0cnVjdCBzYmlfaXJxY2hpcF9kZXZpY2UgKmNoaXApOwo+ID4gPiA+Cj4gPiA+ID4gICAv
KiogSW5pdGlhbGl6ZSBpbnRlcnJ1cHQgY29udHJvbGxlcnMgKi8KPiA+ID4gPiAgIGludCBzYmlf
aXJxY2hpcF9pbml0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCwgYm9vbCBjb2xkX2Jvb3Qp
Owo+ID4gPiA+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9pcnFjaGlwLmMgYi9saWIvc2JpL3Ni
aV9pcnFjaGlwLmMKPiA+ID4gPiBpbmRleCAzYjk3MDUyNy4uNzdlYzA1YWYgMTAwNjQ0Cj4gPiA+
ID4gLS0tIGEvbGliL3NiaS9zYmlfaXJxY2hpcC5jCj4gPiA+ID4gKysrIGIvbGliL3NiaS9zYmlf
aXJxY2hpcC5jCj4gPiA+ID4gQEAgLTEzLDI0ICsxMyw0NCBAQAo+ID4gPiA+Cj4gPiA+ID4gICBz
dGF0aWMgU0JJX0xJU1RfSEVBRChpcnFjaGlwX2xpc3QpOwo+ID4gPiA+Cj4gPiA+ID4gLXN0YXRp
YyBpbnQgZGVmYXVsdF9pcnFmbih2b2lkKQo+ID4gPiA+ICtpbnQgc2JpX2lycWNoaXBfcHJvY2Vz
cyh2b2lkKQo+ID4gPiA+ICAgewo+ID4gPiA+IC0gICAgIHJldHVybiBTQklfRU5PREVWOwo+ID4g
PiA+IC19Cj4gPiA+ID4gKyAgICAgc3RydWN0IHNiaV9pcnFjaGlwX2RldmljZSAqY2hpcDsKPiA+
ID4gPiArICAgICBpbnQgcmMgPSBTQklfRU5PREVWOwo+ID4gPiA+Cj4gPiA+ID4gLXN0YXRpYyBp
bnQgKCpleHRfaXJxZm4pKHZvaWQpID0gZGVmYXVsdF9pcnFmbjsKPiA+ID4gPiArICAgICBzYmlf
bGlzdF9mb3JfZWFjaF9lbnRyeShjaGlwLCAmaXJxY2hpcF9saXN0LCBub2RlKSB7Cj4gPiA+ID4g
KyAgICAgICAgICAgICBpZiAoIWNoaXAtPnByb2Nlc3NfaHdpcnFzKQo+ID4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICBjb250aW51ZTsKPiA+ID4gPiArICAgICAgICAgICAgIGlmICghc2JpX2hh
cnRtYXNrX3Rlc3RfaGFydGluZGV4KGN1cnJlbnRfaGFydGluZGV4KCksICZjaGlwLT50YXJnZXRf
aGFydHMpKQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+ID4gPiAr
ICAgICAgICAgICAgIHJjID0gY2hpcC0+cHJvY2Vzc19od2lycXMoY2hpcCk7Cj4gPiA+ID4gKyAg
ICAgICAgICAgICBpZiAocmMpCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+
ID4gPiA+ICsgICAgIH0KPiA+ID4gPgo+ID4gPiA+IC1pbnQgc2JpX2lycWNoaXBfcHJvY2Vzcyh2
b2lkKQo+ID4gPiA+IC17Cj4gPiA+ID4gLSAgICAgcmV0dXJuIGV4dF9pcnFmbigpOwo+ID4gPiA+
ICsgICAgIHJldHVybiByYzsKPiA+ID4gPiAgIH0KPiA+ID4gPgo+ID4gPiA+IC12b2lkIHNiaV9p
cnFjaGlwX2FkZF9kZXZpY2Uoc3RydWN0IHNiaV9pcnFjaGlwX2RldmljZSAqY2hpcCkKPiA+ID4g
PiAraW50IHNiaV9pcnFjaGlwX2FkZF9kZXZpY2Uoc3RydWN0IHNiaV9pcnFjaGlwX2RldmljZSAq
Y2hpcCkKPiA+ID4gPiAgIHsKPiA+ID4gPiAtICAgICBzYmlfbGlzdF9hZGRfdGFpbCgmY2hpcC0+
bm9kZSwgJmlycWNoaXBfbGlzdCk7Cj4gPiA+ID4gKyAgICAgc3RydWN0IHNiaV9pcnFjaGlwX2Rl
dmljZSAqYzsKPiA+ID4gPiArICAgICBzdHJ1Y3Qgc2JpX2hhcnRtYXNrIGhtOwo+ID4gPiA+ICsK
PiA+ID4gPiArICAgICBpZiAoIWNoaXAgfHwgIXNiaV9oYXJ0bWFza193ZWlnaHQoJmNoaXAtPnRh
cmdldF9oYXJ0cykpCj4gPiA+ID4gKyAgICAgICAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPiA+
ID4gPiArCj4gPiA+ID4gKyAgICAgaWYgKGNoaXAtPnByb2Nlc3NfaHdpcnFzKSB7Cj4gPiA+ID4g
KyAgICAgICAgICAgICBzYmlfbGlzdF9mb3JfZWFjaF9lbnRyeShjLCAmaXJxY2hpcF9saXN0LCBu
b2RlKSB7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGlmICghYy0+cHJvY2Vzc19od2ly
cXMpCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgIHNiaV9oYXJ0bWFza19hbmQoJmhtLCAmYy0+dGFyZ2V0
X2hhcnRzLCAmY2hpcC0+dGFyZ2V0X2hhcnRzKTsKPiA+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgaWYgKHNiaV9oYXJ0bWFza193ZWlnaHQoJmhtKSkKPiA+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPiA+ID4KPiA+ID4gSSB0ZXN0ZWQgdGhp
cyBieSByZWdpc3RlcmluZyBhICdwcm9jZXNzX2h3aXJxcycgaG9vaywgYnV0Cj4gPiA+ICdzYmlf
aGFydG1hc2tfd2VpZ2h0JyByZXR1cm5zIGVycm9ycy4KPiA+Cj4gPiBUaGlzIGxvb3AgZW5zdXJl
cyB0aGF0IGlycWNoaXBzIHdoaWNoIGRpcmVjdGx5IGNvbm5lY3QKPiA+IHRvIGV4dGVybmFsIGlu
dGVycnVwdCBsaW5lIG9mIGhhcnRzIChha2EgaXJxY2hpcHMgd2hpY2gKPiA+IGltcGxlbWVudCBw
cm9jZXNzX2h3aXJxcykgZG9uJ3QgaGF2ZSBvdmVybGFwcGluZwo+ID4gdGFyZ2V0X2hhcnRzLgo+
ID4KPgo+IElmIG15IHVuZGVyc3RhbmRpbmcgaXMgY29ycmVjdCwgdGhpcyBtZWFucyBvbmx5IHNp
bmdsZSBwcm9jZXNzX2h3aXJxcwo+IGNhbiBiZSByZWdpc3RlcmVkIGZvciBhIHRhcmdldCBoYXJ0
IC0gaWYgSU1TSUMgcmVnaXN0ZXJlZCBpdCB0aGVuIGl0Cj4gcmVqZWN0cyB3aGVuIEFQTElDIHRy
aWVzIHRvIHJlZ2lzdGVyIGl0cyBvd24gcHJvY2Vzc19od2lycXMuCgpUaGF0J3MgcmlnaHQuCgpB
UExJQyBtdXN0IHJlZ2lzdGVyIGl0cyBvd24gcHJvY2Vzc19od2lycXMoKSBvbmx5IHdoZW4gaXQg
aXMKaW4gRElSRUNUIG1vZGUuCgpPbiBwbGF0Zm9ybXMgd2l0aCBJTVNJQytBUExJQywgdGhlIEFQ
TElDIHdpbGwgYmUgaW4gTVNJIG1vZGUKc28gaW4gdGhpcyBjYXNlIEFQTElDIG11c3Qgbm90IHJl
Z2lzdGVyIHByb2Nlc3NfaHdpcnFzKCkuCgo+IEJ1dCBhY2NvcmRpbmcgdG8gb3VyIHVzZSBjYXNl
LCBlYWNoIGlycWNoaXAgc2hvdWxkIGJlIGFsbG93ZWQgdG8KPiByZWdpc3RlciBpdHMgb3duIG9w
ZXJhdGlvbiBob29rcywgaW5jbHVkaW5nIHByb2Nlc3NfaHdpcnFzLgo+IFRoZW4gdGhlIElNU0lD
J3MgcHJvY2Vzc19od2lycXMgaGFuZGxlcyBNU0ksIHdoaWxlIHRoZSBBUExJQydzCj4gcHJvY2Vz
c19od2lycXMgaGFuZGxlcyB3aXJlZCBleHQgaW50ZXJydXB0LCB0aGV5IGRvbid0IG92ZXJsYXAg
ZWFjaAo+IG90aGVyLgo+IEkgd291bGQgc3VnZ2VzdCBhbGxvd2luZyBtdWx0aXBsZSBwcm9jZXNz
X2h3aXJxcyBob29rcyBmb3Igb25lIHRhcmdldCBoYXJ0LgoKWW91ciB1bmRlcnN0YW5kaW5nIGlz
IG5vdCBjb3JyZWN0LiBQbGVhc2Ugc2VlIHRoZSBhYm92ZSBjb21tZW50LgoKSW4geW91ciB1c2Ut
Y2FzZSwgeW91IGhhdmUgQVBMSUMgaW4gRElSRUNUIG1vZGUgd2l0aG91dCBhbnkKSU1TSUMuCgpS
ZWdhcmRzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3Bl
bnNiaQo=
