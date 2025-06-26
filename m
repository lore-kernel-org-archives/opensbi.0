Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44F5C7EE39
	for <opensbi@archiver.kernel.org>; Thu, 26 Jun 2025 09:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4T2lmZx+uaf/Ven1ZW5v8qVyij8/66JDbjZKe8r/nvI=; b=AIuk1Buxz3nOVa
	J6mtDHMm9gUT45M/n4BHzZC9Yk0KyAbigRJwb8m8bn7ZLM4rabpneU8YKQAxJHc+s0VXpjWPazdnO
	bg4mxUYYFXYz1f3xqY6tvkXpyO3s7sVHKSbQCDMtL3b/e7Xfjj5ymRAr0++YtN3Ebmzf6e0z31Ash
	SejWYQKJxGD9PiUaR3vDhzTVIVE6ICdFAT+94dCg66kd8XvCQMk/FnSPL5B36al86vp04fb7zbYQO
	sY3SoUgy+uHkcIlck/XeIMLnVJ2CqKRY4s5+OVq1sl4UMCjyU6Pk0liE8snrL9g8ZS6K+zQx5VC9c
	Si8i0DdgfkwG8B320Zyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjF7-0000000BC4O-0ZeC;
	Thu, 26 Jun 2025 09:50:05 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUiaT-0000000B682-0NRV
	for opensbi@lists.infradead.org;
	Thu, 26 Jun 2025 09:08:06 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-e82314f9a51so541098276.0
        for <opensbi@lists.infradead.org>; Thu, 26 Jun 2025 02:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1750928883; x=1751533683; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvn8QAYFw7CCxZaOwQua+a0NR9xfnWXG4diILWiFGHI=;
        b=QtVulKKNJxDAp3q4+u0onBrrt9+xjlja9uKqNBacrW+AlrrTdty7yIrIhbWeCNF+Ia
         VJOPPrK5S8dc8xKfQT7WqmCNMhLcA95f6xuKuIrbvg8tS3W4yXYjTQNQO+6VmZyleJ5h
         N3MX8QSuzqFJhYwhS7gwAcb0SX1thhw45pxiqTDFt+RjLFsLRUIPKutcjk2JE7GtMrMq
         MNV1OmoRucgKp+ZNhfUd+o6gIc//TQ/d9HxRLTLTuEO5R6MgJ+10nSozrv8F70N2Igre
         CgDOFT4x/A6NcT5oGUOWWwEvgQomw/8DDibNXaHS7QZr2vcbfsoRO+R+G7bE71fNFL/Z
         W++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750928883; x=1751533683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvn8QAYFw7CCxZaOwQua+a0NR9xfnWXG4diILWiFGHI=;
        b=av+49YbQAgahiAzy7lsmcXklhSaM2L3hFSx2Pe9ddKFCDR8O8iX6trjMXi56IL+Dtd
         sWYJH9dg3x9v/oelIyXp4+ZEciRfc/6pWRX4mf7p1feLXh8M01cnwsTW02SM+4Evnh0E
         xyL0PLHZff0EbS6AgPrLaNWkqONMACImcFymkwKn5FHbPRCzCkjZ8l6gsgLabkW2PhYL
         w1u+zIqKibFkA1P8H7k+LAoMEsD8/jraZ+NjGLky+dcLu0s7CQ2v6WK4ppWfzv9l93Aj
         +vBXyrNnT2wAcRJ0KtdqsoEDbrGraZMvX6BvV6M23D/+Ad7T4d2ADXO/qkuWTduQLKb2
         aRXw==
X-Forwarded-Encrypted: i=1; AJvYcCV7yjT73L8s/L11q6Xm+iXBomq3U1prYMjPkWhJ47i4gdhIZQ64EZpNe4SDNach6E7qXLgzmlB9@lists.infradead.org
X-Gm-Message-State: AOJu0YwgGC8U7VRwmALCJ4G3zOo8HmdCYcO9aXxzy50jZaenKhwvel8D
	4WerL3ZcjjnR5KH54I4EojBQEKSHt6bjiQOJMPa2wriM0MYhy+yv+W9DA8zJM/nrt4ii/IPcycB
	/pnp8thCHdP/F7A+TLvelJGkDFXm6Szkk2hpypbOpUw==
X-Gm-Gg: ASbGncs5GXgrzCnbL+d/kmK5Oxl0i4D41n3HTguQvNe5DKaYoKKuqQyApcE4ezgBvBb
	EWJn3xHZRYXYsKwiQ+I6o8UHlWKlOmGROjnK8sJjHQYEhD+bzPCkf7I6sSposP9eNqxDgEcHaw9
	9mgLQlT4qQlFXGoNEKJME8tkbBLMLlvAbBI3LWK7EDSK+cyA==
X-Google-Smtp-Source: AGHT+IGVKrcb0y5EpDq8lWR3P4ovKzLi1JlpnmH09TH1JLSbvwxuT5ydmBi7znQBUchQ7itJSVJFGSPwoGXBdgyyLOE=
X-Received: by 2002:a05:6902:91c:b0:e81:7963:a292 with SMTP id
 3f1490d57ef6-e860179370cmr7321237276.45.1750928883452; Thu, 26 Jun 2025
 02:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250625031613.1375191-1-alvinga@andestech.com>
 <20250625031613.1375191-3-alvinga@andestech.com> <da9ed4eb25f8ac587c5d366178ef7377b352fa4f.camel@126.com>
In-Reply-To: <da9ed4eb25f8ac587c5d366178ef7377b352fa4f.camel@126.com>
From: Peter Lin <peter.lin@sifive.com>
Date: Thu, 26 Jun 2025 17:08:00 +0800
X-Gm-Features: Ac12FXwq1Nfe7ZI85pDM5vakwOdg1S8MmpQFjjvcioSiJm8mNgKPp8Unex7EPec
Message-ID: <CAHZsQ-OcoMw6_9MUCvG1OEcew5qNOU2zcKVZ6UZrrw70a0Vf7g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] firmware: Initial compiler built-in stack
 protector support
To: Xiang W <wxjstz@126.com>
Cc: Alvin Chang <alvinga@andestech.com>, opensbi@lists.infradead.org, anup@brainfault.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_020805_149436_9073DA77 
X-CRM114-Status: GOOD (  27.69  )
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

SGkgQWx2aW4sIFhpYW5nLAoKT24gV2VkLCBKdW4gMjUsIDIwMjUgYXQgMTozMuKAr1BNIFhpYW5n
IFcgPHd4anN0ekAxMjYuY29tPiB3cm90ZToKPgo+IOWcqCAyMDI1LTA2LTI15LiJ55qEIDExOjE2
ICswODAw77yMQWx2aW4gQ2hhbmflhpnpgZPvvJoKPiA+IEFkZCBfX3N0YWNrX2Noa19mYWlsKCkg
YW5kIF9fc3RhY2tfY2hrX2d1YXJkIHZhcmlhYmxlIHdoaWNoIGFyZSB1c2VkIGJ5Cj4gPiBjb21w
aWxlciBidWlsdC1pbiBzdGFjayBwcm90ZWN0b3IuCj4gPgo+ID4gVGhpcyBwYXRjaCBqdXN0IHRy
eSB0byBzdXBwb3J0IHN0YWNrLXByb3RlY3RvciBzbyB0aGUgdmFsdWUgb2YgdGhlIHN0YWNrCj4g
PiBndWFyZCB2YXJpYWJsZSBpcyBzaW1wbHkgZml4ZWQgZm9yIG5vdy4gSXQgY291bGQgYmUgaW1w
cm92ZWQgYnkKPiA+IGRlcml2aW5nIGZyb20gYSByYW5kb20gbnVtYmVyIGdlbmVyYXRvciwgc3Vj
aCBhcyBaa3IgZXh0ZW5zaW9uIG9yIGFueQo+ID4gcGxhdGZvcm0tc3BlY2lmaWMgcmFuZG9tIG51
bWJlciBzb3VyY2VzLgo+ID4KPiA+IEludHJvZHVjZSB0aHJlZSBjb25maWd1cmF0aW9ucyBmb3Ig
dGhlIHN0YWNrIHByb3RlY3RvcjoKPiA+IDEuIENPTkZJR19TVEFDS19QUk9URUNUT1IgdG8gZW5h
YmxlIHRoZSBzdGFjayBwcm90ZWN0b3IgZmVhdHVyZSBieQo+ID4gICAgcHJvdmlkaW5nICItZnN0
YWNrLXByb3RlY3RvciIgY29tcGlsZXIgZmxhZwo+ID4gMi4gQ09ORklHX1NUQUNLX1BST1RFQ1RP
Ul9TVFJPTkcgdG8gcHJvdmlkZSAiLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nIgo+ID4gMy4gQ09O
RklHX1NUQUNLX1BST1RFQ1RPUl9BTEwgdG8gcHJvdmlkZSAiLWZzdGFjay1wcm90ZWN0b3ItYWxs
Igo+ID4KPiA+IEluc3RlYWQgb2YgZml4aW5nIHRoZSBjb21waWxlciBmbGFnIG9mIHN0YWNrLXBy
b3RlY3RvciBmZWF0dXJlIGFzCj4gPiAiLWZzdGFjay1wcm90ZWN0b3IiLCB3ZSBkZXJpdmUgaXQg
ZnJvbSB0aGUgaW50cm9kdWNlZCBLY29uZmlnCj4gPiBjb25maWd1cmF0aW9ucy4gVGhlIGNvbXBp
bGVyIGZsYWcgInN0YWNrLXByb3RlY3Rvci1jZmxhZ3MteSIgaXMgZGVmaW5lZAo+ID4gYXMgTWFr
ZWZpbGUgImltbWVkaWF0ZWx5IGV4cGFuZGVkIHZhcmlhYmxlcyIgd2l0aCAiOj0iLiBUaHVzLCB0
aGUKPiA+IHN0cm9uZ2VyIGNvbmZpZ3VyYXRpb24gb2YgdGhlIHN0YWNrIHByb3RlY3RvciBjYW4g
b3ZlcndyaXRlIHRoZQo+ID4gcHJlY2VkaW5nIG9uZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBB
bHZpbiBDaGFuZyA8YWx2aW5nYUBhbmRlc3RlY2guY29tPgo+ID4gLS0tCj4gPiAgZmlybXdhcmUv
S2NvbmZpZyAgICAgICAgICAgICAgfCAyNyArKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+
ICBmaXJtd2FyZS9md19iYXNlLlMgICAgICAgICAgICB8IDE3ICsrKysrKysrKysrKysrKysrCj4g
PiAgZmlybXdhcmUvb2JqZWN0cy5tayAgICAgICAgICAgfCAgOSArKysrKysrKysKPiA+ICBmaXJt
d2FyZS9wYXlsb2Fkcy90ZXN0X2hlYWQuUyB8IDE3ICsrKysrKysrKysrKysrKysrCj4gPiAgNCBm
aWxlcyBjaGFuZ2VkLCA3MCBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2Zpcm13
YXJlL0tjb25maWcgYi9maXJtd2FyZS9LY29uZmlnCj4gPiBpbmRleCBkNmUwNTA2Li5jMWZlZTE5
IDEwMDY0NAo+ID4gLS0tIGEvZmlybXdhcmUvS2NvbmZpZwo+ID4gKysrIGIvZmlybXdhcmUvS2Nv
bmZpZwo+ID4gQEAgLTEgKzEsMjggQEAKPiA+ICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBC
U0QtMi1DbGF1c2UKPiA+ICsKPiA+ICttZW51ICJTdGFjayBQcm90ZWN0b3IgU3VwcG9ydCIKPiA+
ICsKPiA+ICtjb25maWcgU1RBQ0tfUFJPVEVDVE9SCj4gPiArICAgICBib29sICJTdGFjayBQcm90
ZWN0b3IgYnVmZmVyIG92ZXJmbG93IGRldGVjdGlvbiIKPiA+ICsgICAgIGRlZmF1bHQgbgo+ID4g
KyAgICAgaGVscAo+ID4gKyAgICAgICBUaGlzIG9wdGlvbiB0dXJucyBvbiB0aGUgInN0YWNrLXBy
b3RlY3RvciIgY29tcGlsZXIgZmVhdHVyZS4KPiA+ICsKPiA+ICtjb25maWcgU1RBQ0tfUFJPVEVD
VE9SX1NUUk9ORwo+ID4gKyAgICAgYm9vbCAiU3Ryb25nIFN0YWNrIFByb3RlY3RvciIKPiA+ICsg
ICAgIGRlcGVuZHMgb24gU1RBQ0tfUFJPVEVDVE9SCj4gPiArICAgICBkZWZhdWx0IG4KPiA+ICsg
ICAgIGhlbHAKPiA+ICsgICAgICAgVHVybiBvbiB0aGUgInN0YWNrLXByb3RlY3RvciIgd2l0aCAi
LWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nIiBvcHRpb24uCj4gPiArICAgICAgIExpa2UgLWZzdGFj
ay1wcm90ZWN0b3IgYnV0IGluY2x1ZGVzIGFkZGl0aW9uYWwgZnVuY3Rpb25zIHRvIGJlCj4gPiAr
ICAgICAgIHByb3RlY3RlZC4KPiA+ICsKPiA+ICtjb25maWcgU1RBQ0tfUFJPVEVDVE9SX0FMTAo+
ID4gKyAgICAgYm9vbCAiQWxtaWdodHkgU3RhY2sgUHJvdGVjdG9yIgo+ID4gKyAgICAgZGVwZW5k
cyBvbiBTVEFDS19QUk9URUNUT1IKPiA+ICsgICAgIGRlZmF1bHQgbgo+ID4gKyAgICAgaGVscAo+
ID4gKyAgICAgICBUdXJuIG9uIHRoZSAic3RhY2stcHJvdGVjdG9yIiB3aXRoICItZnN0YWNrLXBy
b3RlY3Rvci1hbGwiIG9wdGlvbi4KPiA+ICsgICAgICAgTGlrZSAtZnN0YWNrLXByb3RlY3RvciBl
eGNlcHQgdGhhdCBhbGwgZnVuY3Rpb25zIGFyZSBwcm90ZWN0ZWQuCj4gPiArCj4gPiArZW5kbWVu
dQo+ID4gZGlmZiAtLWdpdCBhL2Zpcm13YXJlL2Z3X2Jhc2UuUyBiL2Zpcm13YXJlL2Z3X2Jhc2Uu
Uwo+ID4gaW5kZXggMjQ5ODc5Ny4uOWRjNzNkMCAxMDA2NDQKPiA+IC0tLSBhL2Zpcm13YXJlL2Z3
X2Jhc2UuUwo+ID4gKysrIGIvZmlybXdhcmUvZndfYmFzZS5TCj4gPiBAQCAtNzM2LDYgKzczNiwy
MyBAQCBfcmVzZXRfcmVnczoKPiA+Cj4gPiAgICAgICByZXQKPiA+Cj4gPiArICAgICAvKiBUaGlz
IHdpbGwgYmUgY2FsbGVkIHdoZW4gdGhlIHN0YWNrIGNvcnJ1cHRpb24gaXMgZGV0ZWN0ZWQgKi8K
PiA+ICsgICAgIC5zZWN0aW9uIC50ZXh0Cj4gPiArICAgICAuYWxpZ24gMwo+ID4gKyAgICAgLmds
b2JsIF9fc3RhY2tfY2hrX2ZhaWwKPiA+ICsgICAgIC50eXBlIF9fc3RhY2tfY2hrX2ZhaWwsICVm
dW5jdGlvbgo+Cj4gVGhlIGZ1bmN0aW9uIGNhbiBiZSByZW1vdmVkIHRvIGNyZWF0ZSBhbiBhbGlh
cywgYXMgc2hvd24gYmVsb3c6Cj4KPiA+ICtfX3N0YWNrX2Noa19mYWlsOgo+ID4gKyAgICAgd2Zp
Cj4gPiArICAgICBqICAgICAgIF9fc3RhY2tfY2hrX2ZhaWwKPgo+ICAgICAgICAgLmVxdSAgX19z
dGFja19jaGtfZmFpbCwgX3N0YXJ0X2hhbmcKCkhvdyBhYm91dCBhZGRpbmcgYW4gZXJyb3IgbWVz
c2FnZSBhcyBQQVRDSHYxLgoKKyAgICAgICAuc2VjdGlvbiAucm9kYXRhCisuTHN0YWNrX2NvcnJ1
cHRfbXNnOgorICAgICAgIC5zdHJpbmcgInN0YWNrIHNtYXNoaW5nIGRldGVjdGVkXG4iCisKICAg
ICAgICAvKiBUaGlzIHdpbGwgYmUgY2FsbGVkIHdoZW4gdGhlIHN0YWNrIGNvcnJ1cHRpb24gaXMg
ZGV0ZWN0ZWQgKi8KICAgICAgICAuc2VjdGlvbiAudGV4dAogICAgICAgIC5hbGlnbiAzCiAgICAg
ICAgLmdsb2JsIF9fc3RhY2tfY2hrX2ZhaWwKICAgICAgICAudHlwZSBfX3N0YWNrX2Noa19mYWls
LCAlZnVuY3Rpb24KIF9fc3RhY2tfY2hrX2ZhaWw6Ci0gICAgICAgd2ZpCi0gICAgICAgaiAgICAg
ICBfX3N0YWNrX2Noa19mYWlsCisgICAgICAgbGEgICAgYTAsIC5Mc3RhY2tfY29ycnVwdF9tc2cK
KyAgICAgICBjYWxsICBzYmlfcGFuaWMKCk90aGVyd2lzZSBpdCBsb29rcyBubyBkaWZmZXJlbnQg
d2hlbiB0aGUgc3RhY2sgcHJvdGVjdG9yIGlzIGRpc2FibGVkLgoKUmVnYXJkcywKUGV0ZXIgTGlu
Cgo+IFJlZ2FyZHMsCj4gWGlhbmcgVwo+ID4gKwo+ID4gKyAgICAgLyogSW5pdGlhbCB2YWx1ZSBv
ZiB0aGUgc3RhY2sgZ3VhcmQgdmFyaWFibGUgKi8KPiA+ICsgICAgIC5zZWN0aW9uIC5kYXRhCj4g
PiArICAgICAuYWxpZ24gMwo+ID4gKyAgICAgLmdsb2JsIF9fc3RhY2tfY2hrX2d1YXJkCj4gPiAr
ICAgICAudHlwZSBfX3N0YWNrX2Noa19ndWFyZCwgJW9iamVjdAo+ID4gK19fc3RhY2tfY2hrX2d1
YXJkOgo+ID4gKyAgICAgUklTQ1ZfUFRSICAgICAgIDB4OTVCNUZGNUEKPiA+ICsKPiA+ICAjaWZk
ZWYgRldfRkRUX1BBVEgKPiA+ICAgICAgIC5zZWN0aW9uIC5yb2RhdGEKPiA+ICAgICAgIC5hbGln
biA0Cj4gPiBkaWZmIC0tZ2l0IGEvZmlybXdhcmUvb2JqZWN0cy5tayBiL2Zpcm13YXJlL29iamVj
dHMubWsKPiA+IGluZGV4IGE5MDQ4NWQuLmJmZWM0NjcgMTAwNjQ0Cj4gPiAtLS0gYS9maXJtd2Fy
ZS9vYmplY3RzLm1rCj4gPiArKysgYi9maXJtd2FyZS9vYmplY3RzLm1rCj4gPiBAQCAtNjYsMyAr
NjYsMTIgQEAgZW5kaWYKPiA+ICBpZmRlZiBGV19PUFRJT05TCj4gPiAgZmlybXdhcmUtZ2VuZmxh
Z3MteSArPSAtREZXX09QVElPTlM9JChGV19PUFRJT05TKQo+ID4gIGVuZGlmCj4gPiArCj4gPiAr
aWZlcSAoJChDT05GSUdfU1RBQ0tfUFJPVEVDVE9SKSx5KQo+ID4gK3N0YWNrLXByb3RlY3Rvci1j
ZmxhZ3MtJChDT05GSUdfU1RBQ0tfUFJPVEVDVE9SKSA6PSAtZnN0YWNrLXByb3RlY3Rvcgo+ID4g
K3N0YWNrLXByb3RlY3Rvci1jZmxhZ3MtJChDT05GSUdfU1RBQ0tfUFJPVEVDVE9SX1NUUk9ORykg
Oj0gLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nCj4gPiArc3RhY2stcHJvdGVjdG9yLWNmbGFncy0k
KENPTkZJR19TVEFDS19QUk9URUNUT1JfQUxMKSA6PSAtZnN0YWNrLXByb3RlY3Rvci1hbGwKPiA+
ICtlbHNlCj4gPiArc3RhY2stcHJvdGVjdG9yLWNmbGFncy15IDo9IC1mbm8tc3RhY2stcHJvdGVj
dG9yCj4gPiArZW5kaWYKPiA+ICtmaXJtd2FyZS1jZmxhZ3MteSArPSAkKHN0YWNrLXByb3RlY3Rv
ci1jZmxhZ3MteSkKPiA+IGRpZmYgLS1naXQgYS9maXJtd2FyZS9wYXlsb2Fkcy90ZXN0X2hlYWQu
UyBiL2Zpcm13YXJlL3BheWxvYWRzL3Rlc3RfaGVhZC5TCj4gPiBpbmRleCA3ZDI1ZTA3Li5iNWZk
NDZiIDEwMDY0NAo+ID4gLS0tIGEvZmlybXdhcmUvcGF5bG9hZHMvdGVzdF9oZWFkLlMKPiA+ICsr
KyBiL2Zpcm13YXJlL3BheWxvYWRzL3Rlc3RfaGVhZC5TCj4gPiBAQCAtOTcsMyArOTcsMjAgQEAg
X2Jvb3RfYTA6Cj4gPiAgICAgICBSSVNDVl9QVFIgICAgICAgMAo+ID4gIF9ib290X2ExOgo+ID4g
ICAgICAgUklTQ1ZfUFRSICAgICAgIDAKPiA+ICsKPiA+ICsgICAgIC8qIFRoaXMgd2lsbCBiZSBj
YWxsZWQgd2hlbiB0aGUgc3RhY2sgY29ycnVwdGlvbiBpcyBkZXRlY3RlZCAqLwo+ID4gKyAgICAg
LnNlY3Rpb24gLnRleHQKPiA+ICsgICAgIC5hbGlnbiAzCj4gPiArICAgICAuZ2xvYmwgX19zdGFj
a19jaGtfZmFpbAo+ID4gKyAgICAgLnR5cGUgX19zdGFja19jaGtfZmFpbCwgJWZ1bmN0aW9uCj4g
PiArX19zdGFja19jaGtfZmFpbDoKPiA+ICsgICAgIHdmaQo+ID4gKyAgICAgaiAgICAgICBfX3N0
YWNrX2Noa19mYWlsCj4gPiArCj4gPiArICAgICAvKiBJbml0aWFsIHZhbHVlIG9mIHRoZSBzdGFj
ayBndWFyZCB2YXJpYWJsZSAqLwo+ID4gKyAgICAgLnNlY3Rpb24gLmRhdGEKPiA+ICsgICAgIC5h
bGlnbiAzCj4gPiArICAgICAuZ2xvYmwgX19zdGFja19jaGtfZ3VhcmQKPiA+ICsgICAgIC50eXBl
IF9fc3RhY2tfY2hrX2d1YXJkLCAlb2JqZWN0Cj4gPiArX19zdGFja19jaGtfZ3VhcmQ6Cj4gPiAr
ICAgICBSSVNDVl9QVFIgICAgICAgMHg5NUI1RkY1QQo+ID4gLS0KPiA+IDIuNDMuMAo+ID4KPgoK
LS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
