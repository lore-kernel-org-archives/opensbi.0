Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFC3CA0FF9
	for <opensbi@archiver.kernel.org>; Thu, 28 Aug 2025 23:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9+qmnkZgOSjco4acCLLctwwQe+otrVM7Ib0uUYbxLMQ=; b=aAfWci4nd8/G+J
	H9jJgXWo/77IzFtNJfHh9GRvhjKMnOsVjXzncucXet2O4WrPbYJa/OFIjDDWltf2aKzGIAmsaN1/6
	Fie5XlPfQWkWdM6tFXHJjLEeY0XUU/uEkrGZatijO3jmU6tgQLDm8WTzoObjPSu513IAnsV+c0h9Y
	3hZgqZfNKUuDIBGAV0F7U3CkTKfbCr6f0gz5vBEidz53Iyi9lFrH8DutB0JgsrSuXD/OwIYHXZz0v
	rGi7imQzcyYYQyO+Y+E1fM4TWhHa2F8D1z6cMqfPMrPDcIWghmvBleXNVbQXl/KnRwA1z8LDpcxWN
	yw4/9A4MYCIjJJUoMWQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urm1Z-00000003gQ3-1pe3;
	Thu, 28 Aug 2025 23:27:21 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urla1-00000003Y8n-2llf
	for opensbi@lists.infradead.org;
	Thu, 28 Aug 2025 22:58:54 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-336a766a721so8996011fa.0
        for <opensbi@lists.infradead.org>; Thu, 28 Aug 2025 15:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756421931; x=1757026731; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLsEvnC+nKuCG6y2IzFad8iIi9CZXuwmyBzmTTBiEGU=;
        b=gTjAIsw2M3j6I2sCd8/AbYl6yi8sLYJuHTf4ZWOl+X8sJS+doQ7RcutvVJXzxpzuNX
         A2rPPr85jvyIALgr/Dlf3xpo9hOZR9MR6iI4nwmIjeYuR+Y8vL6tBnQWOg0E5gf5CvyR
         sFf1ciyH4Ybe5Hh6BTOGBOQe9YI1jF+9WWuUN+F2MJ7t0goHkvdmspvvOLbq6Foq6zNH
         9/uH6OE+zquYq0ap9Et8wgik4tzk7hrm1ILGfz268TaT6aLnihD+/nw6uE91GsG4Vayg
         LL38OHeohHWP8INp82HlAwXWOoqCmqOV8PuMHXs3Dn+P0IAH80Q0gFYz2DyILOKKVLPI
         GnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756421931; x=1757026731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLsEvnC+nKuCG6y2IzFad8iIi9CZXuwmyBzmTTBiEGU=;
        b=MopV1Kp69goJVInjjrcoqGKpTYVNDkKKa3WoA3szR7mdmx/mOse1xUCr1ZLC5PoBbJ
         Gtci9rdoI8ZSInJJMIq/VVaa60bkkdVKhmw/wD2bUpsjp30XOT/49S6CyMPUkW9nb1p3
         iQ9zHMLJ3i2McC02xt3MiroeyVkVnj0L03eWUE3mUK8MbTO/RjmUM2KQ12DkvVJO7PbF
         OGLYRMryq9zfg2B0G/l08rvS8xJuHX3zWWrjam+ovXOvVWUS7ax2JKIKcm6v8sQkkTwX
         rRJ7jqjT896hDijCou6ZGGgqP3pjbDmL2QhFO115/GANt6/hjw+09g6Kx6XkIG/OxUL3
         GuHA==
X-Forwarded-Encrypted: i=1; AJvYcCVAlk4y0xoePyMK83h2/25J+j1LCkFbWNDRgzfwvKxphv1k0BtR/rasU/Z7yhxaExt8JfqtViaj@lists.infradead.org
X-Gm-Message-State: AOJu0YwNL7vtSCIHZovVC5uVnrGCpmuCU8LMPkw7np8f/EKWOBkowp5H
	C5jOaMNvcbsu/v3rGGxWdh1QOeMXUUwLoMXan4O8PPA7kHWBFEIe+fVi/rbQaRDyAXSBnHuKqez
	BP0XYOu5BWVUMQEEqkbOU4avf3soN1UA=
X-Gm-Gg: ASbGncu4W5Po7KgA6DA7UCngdarb8WPFUJAO8GMTum46IA0jzXqnEugtWvEgnnsONdF
	rn2lVicafmU6l6nSmTfno03Nu0/akwGmlem17A7nWrCQY5I33aA5YtIpYCC8JiHIw14IpdF6dH0
	dIaPHuFF9/5HCYmfWi/QxoflyQcypKQNYKx8CELzar2zGFtj2SlW2U5D2F3+uXG7rh3q3cjzbJA
	Sgynsbd99KNA/05RVopOISV0rN9k4WsF3PivMhM2gyCEnrKLeYWdHgK30w9oJSFH/VST0Fns0wk
	W1gbX/h51PWuzH47EQ==
X-Google-Smtp-Source: AGHT+IE8jp3cCuaK+Nj5ZmNbBUhVk4izZVCEYnBTg0TUVbah6Kg6bNW3TP8N2TkyW0f7mf8omtrLIAZMvpbvdv6UHAs=
X-Received: by 2002:a2e:bc1e:0:b0:336:94b4:2b60 with SMTP id
 38308e7fff4ca-33694b4364emr21448611fa.44.1756421931022; Thu, 28 Aug 2025
 15:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250723204010.9927-1-cfu@mips.com> <CAAhSdy2VRE_bfqhae+ZCxwH-rZnmm+uL+nfYAzTXEn=C84L80Q@mail.gmail.com>
 <98E5DC08-1B1A-4F27-A520-4281A4C6B436@jrtc27.com> <1A02827E-2E3E-4064-985C-4FBCD1F69019@jrtc27.com>
 <CAK9=C2VsMKawQHHKFznyqDrb3TBHr-KuFrv6WdAru0ZQZ_Rwog@mail.gmail.com>
In-Reply-To: <CAK9=C2VsMKawQHHKFznyqDrb3TBHr-KuFrv6WdAru0ZQZ_Rwog@mail.gmail.com>
From: Chao-ying Fu <icebergfu@gmail.com>
Date: Mon, 25 Aug 2025 17:06:09 -0700
X-Gm-Features: Ac12FXyw6Khw0jOXDq2QTB3C4NehH9tMFZQSWjCqsknkllwEdBGTKSzCeIxHGqo
Message-ID: <CAM1rFzGfKs=7SckwafFvZM=-bc7DYGcjiGn9Z6SEiKyEEwyi-A@mail.gmail.com>
Subject: Re: [PATCH v3] generic: mips: support harts to boot from mips_warm_boot
To: Anup Patel <apatel@ventanamicro.com>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org, 
	Chao-ying Fu <cfu@mips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_155853_701378_BED85C0E 
X-CRM114-Status: GOOD (  38.38  )
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

T24gVGh1LCBBdWcgMjgsIDIwMjUgYXQgODowNeKAr0FNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIFRodSwgQXVnIDI4LCAyMDI1IGF0IDEyOjE34oCv
UE0gSmVzc2ljYSBDbGFya2UgPGpydGMyN0BqcnRjMjcuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiAy
OCBBdWcgMjAyNSwgYXQgMDc6MjAsIEplc3NpY2EgQ2xhcmtlIDxqcnRjMjdAanJ0YzI3LmNvbT4g
d3JvdGU6Cj4gPiA+IE9uIDI4IEF1ZyAyMDI1LCBhdCAwNjozMiwgQW51cCBQYXRlbCA8YW51cEBi
cmFpbmZhdWx0Lm9yZz4gd3JvdGU6Cj4gPiA+PiBPbiBUaHUsIEp1bCAyNCwgMjAyNSBhdCAyOjEw
4oCvQU0gQ2hhby15aW5nIEZ1IDxpY2ViZXJnZnVAZ21haWwuY29tPiB3cm90ZToKPiA+ID4+Pgo+
ID4gPj4+IFdlIHByb2dyYW0gcmVzZXQgYmFzZSBmb3IgaGFydHMgKG90aGVyIHRoYW4gaGFydCAw
KSB0byBib290IGF0Cj4gPiA+Pj4gbWlwc193YXJtX2Jvb3QgdGhhdCBqdW1wcyB0byBfc3RhcnRf
d2FybS4gVGhpcyBoZWxwcyB0byBza2lwIHNvbWUgY29kZQo+ID4gPj4+IHNlcXVlbmNlIHRvIHNw
ZWVkIHVwLgo+ID4gPj4+Cj4gPiA+Pj4gU2lnbmVkLW9mZi1ieTogQ2hhby15aW5nIEZ1IDxjZnVA
bWlwcy5jb20+Cj4gPiA+Pj4gLS0tCj4gPiA+Pj4gcGxhdGZvcm0vZ2VuZXJpYy9taXBzL21pcHNf
d2FybV9ib290LlMgfCAyMCArKysrKysrKysrKysrKysrKysrKwo+ID4gPj4+IHBsYXRmb3JtL2dl
bmVyaWMvbWlwcy9vYmplY3RzLm1rICAgICAgIHwgIDIgKy0KPiA+ID4+PiBwbGF0Zm9ybS9nZW5l
cmljL21pcHMvcDg3MDAuYyAgICAgICAgICB8ICA1ICsrKysrCj4gPiA+Pj4gMyBmaWxlcyBjaGFu
Z2VkLCAyNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+Pj4gY3JlYXRlIG1vZGUg
MTAwNjQ0IHBsYXRmb3JtL2dlbmVyaWMvbWlwcy9taXBzX3dhcm1fYm9vdC5TCj4gPiA+Pj4KPiA+
ID4+PiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9taXBzL21pcHNfd2FybV9ib290LlMg
Yi9wbGF0Zm9ybS9nZW5lcmljL21pcHMvbWlwc193YXJtX2Jvb3QuUwo+ID4gPj4+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gPiA+Pj4gaW5kZXggMDAwMDAwMC4uMjVjZGI4Mwo+ID4gPj4+IC0tLSAv
ZGV2L251bGwKPiA+ID4+PiArKysgYi9wbGF0Zm9ybS9nZW5lcmljL21pcHMvbWlwc193YXJtX2Jv
b3QuUwo+ID4gPj4+IEBAIC0wLDAgKzEsMjAgQEAKPiA+ID4+PiArLyoKPiA+ID4+PiArICogU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEJTRC0yLUNsYXVzZQo+ID4gPj4+ICsgKgo+ID4gPj4+ICsg
KiBDb3B5cmlnaHQgKGMpIDIwMjUgTUlQUwo+ID4gPj4+ICsgKgo+ID4gPj4+ICsgKi8KPiA+ID4+
PiArICAgICAgIC50ZXh0Cj4gPiA+Pj4gKyAgICAgICAuYWxpZ24gIDEyCj4gPiA+Pj4gKyAgICAg
ICAuZ2xvYmwgIG1pcHNfd2FybV9ib290Cj4gPiA+Pj4gK21pcHNfd2FybV9ib290Ogo+ID4gPj4+
ICsgICAgICAgaiAgICAgICBfc3RhcnRfd2FybQo+ID4gPj4+ICsgICAgICAgLmFsaWduICAyCj4g
PiA+Pj4gK25taV92ZWN0b3I6Cj4gPiA+Pj4gKyAgICAgICBqICAgICAgIF9zdGFydF93YXJtCj4g
PiA+Pj4gKyAgICAgICAuYWxpZ24gIDIKPiA+ID4+PiArY2FjaGVlcnJfdmVjdG9yOgo+ID4gPj4+
ICsgICAgICAgaiAgICAgICBfc3RhcnRfd2FybQo+ID4gPj4+ICsgICAgICAgLmFsaWduICAyCj4g
PiA+Pj4gK2RlYnVnZXhjX3ZlY3RvcjoKPiA+ID4+PiArICAgICAgIGogICAgICAgX3N0YXJ0X3dh
cm0KPiA+ID4+Cj4gPiA+PiBubWlfdmVjdG9yLCBjYWNoZWVycl92ZWN0b3IsIGFuZCBkZWJ1Z2V4
Y192ZWN0b3IgYXJlIG5vdCB1c2VkCj4gPiA+PiBhbnl3aGVyZSBzbyBJIGhhdmUgZHJvcHBlZCB0
aGVzZSBhdCB0aGUgdGltZSBvZiBtZXJnaW5nLiBQbGVhc2UKPiA+ID4+IHNlbmQgc2VwYXJhdGUg
cGF0Y2hlcyB0byBhZGQgdGhlc2Ugd2hlbiB0aGV5IGFyZSBiZWluZyB1c2VkCj4gPiA+PiBzb21l
d2hlcmUuCj4gPiA+Pgo+ID4gPj4gUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+Cj4gPiA+Pgo+ID4gPj4gQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9v
cGVuc2JpIHJlcG8uCj4gPiA+Cj4gPiA+IFVoIEnigJltIHByZXR0eSBzdXJlIHRoaXMgaXMgYSBy
ZXNldCB2ZWN0b3IsIGFuZCBlYWNoIGxhYmVsIGlzIG5hbWluZyB0aGUKPiA+ID4gZGlmZmVyZW50
IGVudHJpZXMgaW4gdGhlIHZlY3RvciwgbXVjaCBsaWtlIGZvciBtdHZlYy5NT0RFPVZlY3RvcmVk
LCBhbmQKPiA+ID4gdGhlcmVmb3JlIHRoZSByZXN1bHQgb2YgZGVsZXRpbmcgdGhvc2UgdmVjdG9y
IGVudHJpZXMgaXMgdGhhdCwgaWYgYW55Cj4gPiA+IG9mIHRob3NlIGNhc2VzIG9jY3VyLCBpdCB3
aWxsIGVuZCB1cCBydW5uaW5nIHdoYXRldmVyIHJhbmRvbSBjb2RlCj4gPiA+IGhhcHBlbnMgdG8g
YmUgYWZ0ZXIgdGhlIGZpcnN0IGVudHJ5Lgo+ID4gPgo+ID4gPiBJ4oCZdmUgbm90aWNlZCB5b3Ug
YXJlIHF1aXRlIGVhZ2VyIHRvIG1vZGlmeSBwZW9wbGXigJlzIHBhdGNoZXMgYmVmb3JlCj4gPiA+
IGFwcGx5aW5nIHRoZW0uIFJlZm9ybWF0dGluZyBpcyBvbmUgdGhpbmcsIGJ1dCBkZWxldGluZyBh
c3NlbWJseSBjb2RlIGlzCj4gPiA+IGFub3RoZXIgdGhhdCBJIHRoaW5rIGdvZXMgdG9vIGZhci4g
UGxlYXNlIGJlIG1vcmUgY29uc2lkZXJhdGUgb2YgdGhlCj4gPiA+IGZhY3QgdGhhdCB5b3UgbWF5
IG5vdCBiZSBjb3JyZWN0IGluIHlvdXIgaW50ZXJwcmV0YXRpb24sIGFuZCBzbyBpdCBpcwo+ID4g
PiBub3QgYXBwcm9wcmlhdGUgdG8gdW5pbGF0ZXJhbGx5IGNvbW1pdCB3aGF0ZXZlciB1bnJldmll
d2VkIGNoYW5nZXMgeW91Cj4gPiA+IHRoaW5rIGFyZSBiZXN0LCBlc3BlY2lhbGx5IHdoZW4gaXQg
Y29tZXMgdG8gdmVuZG9yLXNwZWNpZmljIGNvZGUgZm9yCj4gPiA+IHdoaWNoIHlvdSBoYXZlbuKA
mXQgcmVhZCBhbnkgb2YgdGhlIGNvcnJlc3BvbmRpbmcgbWFudWFscy4KPiA+Cj4gPiBFc3BlY2lh
bGx5IHNpbmNlIHlvdSBrZWVwIHRoZSBhdXRob3IgaW50YWN0LCBkb27igJl0IGFkZCBhbnkga2lu
ZCBvZgo+ID4gQ28tYXV0aG9yZWQtYnkgYW5kIGRvbuKAmXQgZG9jdW1lbnQgYW55IG9mIHRoZSBj
aGFuZ2VzIHlvdSBoYXZlIG1hZGUKPiA+IGJldHdlZW4gdGhlIGF1dGhvcuKAmXMgU2lnbmVkLW9m
LWJ5IGFuZCB5b3Vycy4gVGhpcyBtZWFucyBpdCBsb29rcyBsaWtlCj4gPiBpdOKAmXMgdGhlIHN1
Ym1pdHRlcuKAmXMgZmF1bHQgdGhhdCB0aGVyZeKAmXMgYSBidWcgaW4gdGhlIGNvbW1pdCwgd2hl
biBpbgo+ID4gcmVhbGl0eSB0aGV5IHN1Ym1pdHRlZCBhIGNvcnJlY3QgcGF0Y2ggYW5kIHlvdSBi
cm9rZSBpdC4gVGhhdOKAmXMgbm90IGEKPiA+IHBhcnRpY3VsYXJseSBuaWNlIHRoaW5nIHRvIGhh
dmUgZG9uZSB0byBvbmXigJlzIHdvcmsuCj4gPgo+ID4gTWlnaHQgSSBzdWdnZXN0LCBpZiB0aGUg
Z29hbCBpcyB0byBhdm9pZCB0aGUgYXV0aG9yIG5lZWRpbmcgdG8gc3VibWl0IGEKPiA+IHZOKzEs
IGF0IGxlYXN0IGNvbmZpcm0gd2l0aCB0aGUgYXV0aG9yIHRoYXQgeW91ciBpbnRlbmRlZCBmaXhl
cyBhcmUKPiA+IGNvcnJlY3QgYmVmb3JlIGZvbGRpbmcgdGhlbSBpbnRvIHRoZSBwYXRjaCB5b3Ug
Y29tbWl0PyBBbmQsIGZvciBtb3JlCj4gPiBtaW5vciBjYXNlcywgZG9jdW1lbnQgdGhhdCB5b3Xi
gJl2ZSBtYWRlIGNoYW5nZXMsIHdoZXRoZXIgaW4gdGhlIExpbnV4Cj4gPiBrZXJuZWwgY29tbWl0
dGVyIHN0eWxlIHRoYXQgc3RhdGVzIHdoYXQgeW914oCZdmUgYWN0dWFsbHkgZG9uZSwgb3IgYXQK
PiA+IGxlYXN0IGJ5IGFkZGluZyB5b3VyIG93biBDby1hdXRob3JlZC1ieSB0byBzdGF0ZSB5b3Xi
gJl2ZSBkb25lIHNvbWV0aGluZwo+ID4gdW5zcGVjaWZpZWQuCj4gPgo+Cj4gSSBkb24ndCBtaW5k
IGFkZGluZyBDby1kZXZlbG9wZWQtYnkgYW5kIG1vcmUgY29tbWVudHMgYWJvdXQKPiBteSBjaGFu
Z2VzLgo+Cj4gUmVnYXJkcywKPiBBbnVwCgpIaSBBbGwsCgogIFdlIHdpbGwgc2VlIGlmIHdlIG5l
ZWQgdG8gYWRkIHN1cHBvcnQgZm9yIE5NSSwgY2FjaGUgZXJyb3IsIGFuZApkZWJ1ZyBleGNlcHRp
b25zIGxhdGVyLiBUaGUgcHJldmlvdXMgcGF0Y2gganVzdCB0cmVhdHMgdGhlbSB0aGUgc2FtZQph
cyAicmVzZXQiIGFuZCBsZXRzIHRoZW0ganVtcCB0byB0aGUgc2FtZSBlbnRyeTogX3N0YXJ0X3dh
cm0uCgogIFRoYW5rcyBhIGxvdCBmb3IgcmV2aWV3aW5nIGFuZCBtZXJnaW5nIG91ciBwYXRjaGVz
IQoKUmVnYXJkcywKQ2hhby15aW5nCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vb3BlbnNiaQo=
