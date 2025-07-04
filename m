Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1731C83F05
	for <opensbi@archiver.kernel.org>; Fri,  4 Jul 2025 11:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fC+LvZSFMx12osYnm0TrPnoMH9vekLqj9Z+m2ktGF7s=; b=K0R/lsQKOSvNlT
	BA/WQmCF/NfnVfFE+ZaWnYPn22AaHMYFlWSayXIPeO6wwJ0fQYc8UQKYWOsigQKErwQfpnQoaEEjZ
	IeF3uoL88w3gECw2ShE0Xaxm70rtGcp9UvC8HxBSW9bSLYxtXfV9I8l+54IowWqnUs3kFmZveZUEK
	P74gpF7Yhpj6urUPUsDq7is3GSybDnwfZ6XgTGpQdJ/dmroQour8ZEQ0iu0Y33z655nA+CiIOBNI9
	HyADYbRa7Y58ARnKn/xoisYgpkXF1Pdp1RiqggEMM7rwz0qCQakNJCXVF9zRssLtLv2ej4TAco4RP
	wP1K86wso8iR7tYgKBFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeyi-0000000EIXY-17Qj;
	Fri, 04 Jul 2025 11:53:16 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXe7g-0000000E8pe-2xHv
	for opensbi@lists.infradead.org;
	Fri, 04 Jul 2025 10:58:29 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e8276224c65so680172276.0
        for <opensbi@lists.infradead.org>; Fri, 04 Jul 2025 03:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1751626708; x=1752231508; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CsqNuqWkoGoMi62JGiYUEbc1S0vJtcY2l6Y58e0UNI=;
        b=EC2u0Hsim5En9PeOVw49V/eKNH3DPGWg/j2N+z7So8OEXKKE3Xltq3c9Dq0/PE5koN
         KiKsWRXN9P2iCky6RkEAzGoNQV2IIBgcCYLI4eP3ISrcR7izZ/dATK9WLwCYrgVFR6Fe
         qKhsVCpLwGt7DMWFiVk8+TNGbNCbWDeoijDDwvrzx9AKQRr9GEG2o3jaPjcM8FS08ZJq
         rz29cXZN154xuvu0vIdEre2AWdp8bTITrdxGtFOAVy1EUKiTM6VUn9gO7m8kqNMQmesj
         4ujNF5KoqI9oIDwUweVOYFmpyoWM3CCS6hPwgncIzzz5QvLdEmvhe2g4TZHaHjkXWZU1
         0aNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751626708; x=1752231508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CsqNuqWkoGoMi62JGiYUEbc1S0vJtcY2l6Y58e0UNI=;
        b=ZfNe5hD5Da1/qVzEf4acmsKHTBLt16Tr+ZMDs11eOFCKGmcvpmzumipW9zleyrHv0D
         dkaOTcszwMqVSubddyB+1mKtwu3mErJzw6x9X3/xIOm0da1iWEy7lCm/3zKITj9oohNE
         uRbU5SX/W7aCzhxLE4ct1Gq9Fe6y4tGYoHVBq3yDBjMd8lJje18NrO+d7A0FA6gn+Yyl
         1XmieAGxnh3onN4kdHrVLKpDBtWZ8JrKS3RNUXWDmzDapmRHNdUB4mcmDuh5JkF08KuN
         5SwK8raKAIo1nPavcxR/L+eNvxm0ySP4NnKS5dzcbtXQ2VVkGkU0r9Ya+6vjQm9BMACB
         u1FQ==
X-Gm-Message-State: AOJu0Yx6FbR4ZhQnznuI/u4rM4hzLb6nqAYR5uhrsRaAu5AT98vficoQ
	li0t5g/Ev9Kr5bhuFogqImeZYBy00hbQbKwL3zwD/cBG6/Wp5DMaS3P6gzaGPIZk1v4ySwDlNTd
	4IqJus5Gxk4fnNxbllafCU7D+Pv/cHJFn8/wGNog/kkuSjY4gzjsW3rbafg==
X-Gm-Gg: ASbGnctkbM1+l/8jVYlsd+rQQ8Kqmiw/8dHHRXuVeEEVl0xTXNIEfQ70FHIq/G8bUmD
	i4ncv3dzgm3gW8u092OT7uuvE9kv3N0ti0mGvN5yejZEKd4UY5EZVtZUvyB2l41f0Bb31MsQ+xg
	6IJoKnBi2MjPLvvT8uaTI9iw9kZVGuLsQWbh3Oz6LVnUOWmw==
X-Google-Smtp-Source: AGHT+IFU7hrftROywneepQxgnc98AA15D0t80adczfDcjRGQFk+iNcGyKwvGCu8UVtnMnRQFGH/AnokoN9iOzxgrWc0=
X-Received: by 2002:a05:690c:4d09:b0:714:5eb:b589 with SMTP id
 00721157ae682-71668d3363cmr28426187b3.35.1751626707738; Fri, 04 Jul 2025
 03:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250703151957.2545958-1-alvinga@andestech.com> <20250703151957.2545958-3-alvinga@andestech.com>
In-Reply-To: <20250703151957.2545958-3-alvinga@andestech.com>
From: Peter Lin <peter.lin@sifive.com>
Date: Fri, 4 Jul 2025 18:58:17 +0800
X-Gm-Features: Ac12FXwYFGKMY3hUto53gyWvsP9eNw9OI1zkZC6aOEeYFUBBQLC7_artK9_oEzo
Message-ID: <CAHZsQ-PXKJLUv-y40OHa+1iVGJXtodJn-y4d9WcL+pSGLSfy3A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] firmware: Initial compiler built-in stack
 protector support
To: Alvin Chang <alvinga@andestech.com>
Cc: opensbi@lists.infradead.org, anup@brainfault.org, wxjstz@126.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_035828_744169_0D08D0BB 
X-CRM114-Status: GOOD (  23.95  )
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

T24gVGh1LCBKdWwgMywgMjAyNSBhdCAxMToyMOKAr1BNIEFsdmluIENoYW5nIDxhbHZpbmdhQGFu
ZGVzdGVjaC5jb20+IHdyb3RlOgo+Cj4gQWRkIF9fc3RhY2tfY2hrX2ZhaWwoKSBhbmQgX19zdGFj
a19jaGtfZ3VhcmQgdmFyaWFibGUgd2hpY2ggYXJlIHVzZWQgYnkKPiBjb21waWxlciBidWlsdC1p
biBzdGFjayBwcm90ZWN0b3IuCj4KPiBUaGlzIHBhdGNoIGp1c3QgdHJ5IHRvIHN1cHBvcnQgc3Rh
Y2stcHJvdGVjdG9yIHNvIHRoZSB2YWx1ZSBvZiB0aGUgc3RhY2sKPiBndWFyZCB2YXJpYWJsZSBp
cyBzaW1wbHkgZml4ZWQgZm9yIG5vdy4gSXQgY291bGQgYmUgaW1wcm92ZWQgYnkKPiBkZXJpdmlu
ZyBmcm9tIGEgcmFuZG9tIG51bWJlciBnZW5lcmF0b3IsIHN1Y2ggYXMgWmtyIGV4dGVuc2lvbiBv
ciBhbnkKPiBwbGF0Zm9ybS1zcGVjaWZpYyByYW5kb20gbnVtYmVyIHNvdXJjZXMuCj4KPiBJbnRy
b2R1Y2UgdGhyZWUgY29uZmlndXJhdGlvbnMgZm9yIHRoZSBzdGFjayBwcm90ZWN0b3I6Cj4gMS4g
Q09ORklHX1NUQUNLX1BST1RFQ1RPUiB0byBlbmFibGUgdGhlIHN0YWNrIHByb3RlY3RvciBmZWF0
dXJlIGJ5Cj4gICAgcHJvdmlkaW5nICItZnN0YWNrLXByb3RlY3RvciIgY29tcGlsZXIgZmxhZwo+
IDIuIENPTkZJR19TVEFDS19QUk9URUNUT1JfU1RST05HIHRvIHByb3ZpZGUgIi1mc3RhY2stcHJv
dGVjdG9yLXN0cm9uZyIKPiAzLiBDT05GSUdfU1RBQ0tfUFJPVEVDVE9SX0FMTCB0byBwcm92aWRl
ICItZnN0YWNrLXByb3RlY3Rvci1hbGwiCj4KPiBJbnN0ZWFkIG9mIGZpeGluZyB0aGUgY29tcGls
ZXIgZmxhZyBvZiBzdGFjay1wcm90ZWN0b3IgZmVhdHVyZSBhcwo+ICItZnN0YWNrLXByb3RlY3Rv
ciIsIHdlIGRlcml2ZSBpdCBmcm9tIHRoZSBpbnRyb2R1Y2VkIEtjb25maWcKPiBjb25maWd1cmF0
aW9ucy4gVGhlIGNvbXBpbGVyIGZsYWcgInN0YWNrLXByb3RlY3Rvci1jZmxhZ3MteSIgaXMgZGVm
aW5lZAo+IGFzIE1ha2VmaWxlICJpbW1lZGlhdGVseSBleHBhbmRlZCB2YXJpYWJsZXMiIHdpdGgg
Ijo9Ii4gVGh1cywgdGhlCj4gc3Ryb25nZXIgY29uZmlndXJhdGlvbiBvZiB0aGUgc3RhY2sgcHJv
dGVjdG9yIGNhbiBvdmVyd3JpdGUgdGhlCj4gcHJlY2VkaW5nIG9uZS4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEFsdmluIENoYW5nIDxhbHZpbmdhQGFuZGVzdGVjaC5jb20+CgpSZXZpZXdlZC1ieTogWXUt
Q2hpZW4gUGV0ZXIgTGluIDxwZXRlci5saW5Ac2lmaXZlLmNvbT4KCj4gLS0tCj4gIGZpcm13YXJl
L0tjb25maWcgICAgICAgICAgICAgIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4g
IGZpcm13YXJlL2Z3X2Jhc2UuUyAgICAgICAgICAgIHwgMjEgKysrKysrKysrKysrKysrKysrKysr
Cj4gIGZpcm13YXJlL29iamVjdHMubWsgICAgICAgICAgIHwgIDkgKysrKysrKysrCj4gIGZpcm13
YXJlL3BheWxvYWRzL3Rlc3RfaGVhZC5TIHwgMTUgKysrKysrKysrKysrKysrCj4gIDQgZmlsZXMg
Y2hhbmdlZCwgNzIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2Zpcm13YXJlL0tjb25m
aWcgYi9maXJtd2FyZS9LY29uZmlnCj4gaW5kZXggZDZlMDUwNi4uYzFmZWUxOSAxMDA2NDQKPiAt
LS0gYS9maXJtd2FyZS9LY29uZmlnCj4gKysrIGIvZmlybXdhcmUvS2NvbmZpZwo+IEBAIC0xICsx
LDI4IEBACj4gICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEJTRC0yLUNsYXVzZQo+ICsKPiAr
bWVudSAiU3RhY2sgUHJvdGVjdG9yIFN1cHBvcnQiCj4gKwo+ICtjb25maWcgU1RBQ0tfUFJPVEVD
VE9SCj4gKyAgICAgICBib29sICJTdGFjayBQcm90ZWN0b3IgYnVmZmVyIG92ZXJmbG93IGRldGVj
dGlvbiIKPiArICAgICAgIGRlZmF1bHQgbgo+ICsgICAgICAgaGVscAo+ICsgICAgICAgICBUaGlz
IG9wdGlvbiB0dXJucyBvbiB0aGUgInN0YWNrLXByb3RlY3RvciIgY29tcGlsZXIgZmVhdHVyZS4K
PiArCj4gK2NvbmZpZyBTVEFDS19QUk9URUNUT1JfU1RST05HCj4gKyAgICAgICBib29sICJTdHJv
bmcgU3RhY2sgUHJvdGVjdG9yIgo+ICsgICAgICAgZGVwZW5kcyBvbiBTVEFDS19QUk9URUNUT1IK
PiArICAgICAgIGRlZmF1bHQgbgo+ICsgICAgICAgaGVscAo+ICsgICAgICAgICBUdXJuIG9uIHRo
ZSAic3RhY2stcHJvdGVjdG9yIiB3aXRoICItZnN0YWNrLXByb3RlY3Rvci1zdHJvbmciIG9wdGlv
bi4KPiArICAgICAgICAgTGlrZSAtZnN0YWNrLXByb3RlY3RvciBidXQgaW5jbHVkZXMgYWRkaXRp
b25hbCBmdW5jdGlvbnMgdG8gYmUKPiArICAgICAgICAgcHJvdGVjdGVkLgo+ICsKPiArY29uZmln
IFNUQUNLX1BST1RFQ1RPUl9BTEwKPiArICAgICAgIGJvb2wgIkFsbWlnaHR5IFN0YWNrIFByb3Rl
Y3RvciIKPiArICAgICAgIGRlcGVuZHMgb24gU1RBQ0tfUFJPVEVDVE9SCj4gKyAgICAgICBkZWZh
dWx0IG4KPiArICAgICAgIGhlbHAKPiArICAgICAgICAgVHVybiBvbiB0aGUgInN0YWNrLXByb3Rl
Y3RvciIgd2l0aCAiLWZzdGFjay1wcm90ZWN0b3ItYWxsIiBvcHRpb24uCj4gKyAgICAgICAgIExp
a2UgLWZzdGFjay1wcm90ZWN0b3IgZXhjZXB0IHRoYXQgYWxsIGZ1bmN0aW9ucyBhcmUgcHJvdGVj
dGVkLgo+ICsKPiArZW5kbWVudQo+IGRpZmYgLS1naXQgYS9maXJtd2FyZS9md19iYXNlLlMgYi9m
aXJtd2FyZS9md19iYXNlLlMKPiBpbmRleCAyNDk4Nzk3Li5hMDA4ZmE3IDEwMDY0NAo+IC0tLSBh
L2Zpcm13YXJlL2Z3X2Jhc2UuUwo+ICsrKyBiL2Zpcm13YXJlL2Z3X2Jhc2UuUwo+IEBAIC03MzYs
NiArNzM2LDI3IEBAIF9yZXNldF9yZWdzOgo+Cj4gICAgICAgICByZXQKPgo+ICsgICAgICAgLnNl
Y3Rpb24gLnJvZGF0YQo+ICsuTHN0YWNrX2NvcnJ1cHRfbXNnOgo+ICsgICAgICAgLnN0cmluZyAi
c3RhY2sgc21hc2hpbmcgZGV0ZWN0ZWRcbiIKPiArCj4gKyAgICAgICAvKiBUaGlzIHdpbGwgYmUg
Y2FsbGVkIHdoZW4gdGhlIHN0YWNrIGNvcnJ1cHRpb24gaXMgZGV0ZWN0ZWQgKi8KPiArICAgICAg
IC5zZWN0aW9uIC50ZXh0Cj4gKyAgICAgICAuYWxpZ24gMwo+ICsgICAgICAgLmdsb2JsIF9fc3Rh
Y2tfY2hrX2ZhaWwKPiArICAgICAgIC50eXBlIF9fc3RhY2tfY2hrX2ZhaWwsICVmdW5jdGlvbgo+
ICtfX3N0YWNrX2Noa19mYWlsOgo+ICsgICAgICAgbGEgICAgICBhMCwgLkxzdGFja19jb3JydXB0
X21zZwo+ICsgICAgICAgY2FsbCAgICBzYmlfcGFuaWMKPiArCj4gKyAgICAgICAvKiBJbml0aWFs
IHZhbHVlIG9mIHRoZSBzdGFjayBndWFyZCB2YXJpYWJsZSAqLwo+ICsgICAgICAgLnNlY3Rpb24g
LmRhdGEKPiArICAgICAgIC5hbGlnbiAzCj4gKyAgICAgICAuZ2xvYmwgX19zdGFja19jaGtfZ3Vh
cmQKPiArICAgICAgIC50eXBlIF9fc3RhY2tfY2hrX2d1YXJkLCAlb2JqZWN0Cj4gK19fc3RhY2tf
Y2hrX2d1YXJkOgo+ICsgICAgICAgUklTQ1ZfUFRSICAgICAgIDB4OTVCNUZGNUEKPiArCj4gICNp
ZmRlZiBGV19GRFRfUEFUSAo+ICAgICAgICAgLnNlY3Rpb24gLnJvZGF0YQo+ICAgICAgICAgLmFs
aWduIDQKPiBkaWZmIC0tZ2l0IGEvZmlybXdhcmUvb2JqZWN0cy5tayBiL2Zpcm13YXJlL29iamVj
dHMubWsKPiBpbmRleCBhOTA0ODVkLi5iZmVjNDY3IDEwMDY0NAo+IC0tLSBhL2Zpcm13YXJlL29i
amVjdHMubWsKPiArKysgYi9maXJtd2FyZS9vYmplY3RzLm1rCj4gQEAgLTY2LDMgKzY2LDEyIEBA
IGVuZGlmCj4gIGlmZGVmIEZXX09QVElPTlMKPiAgZmlybXdhcmUtZ2VuZmxhZ3MteSArPSAtREZX
X09QVElPTlM9JChGV19PUFRJT05TKQo+ICBlbmRpZgo+ICsKPiAraWZlcSAoJChDT05GSUdfU1RB
Q0tfUFJPVEVDVE9SKSx5KQo+ICtzdGFjay1wcm90ZWN0b3ItY2ZsYWdzLSQoQ09ORklHX1NUQUNL
X1BST1RFQ1RPUikgOj0gLWZzdGFjay1wcm90ZWN0b3IKPiArc3RhY2stcHJvdGVjdG9yLWNmbGFn
cy0kKENPTkZJR19TVEFDS19QUk9URUNUT1JfU1RST05HKSA6PSAtZnN0YWNrLXByb3RlY3Rvci1z
dHJvbmcKPiArc3RhY2stcHJvdGVjdG9yLWNmbGFncy0kKENPTkZJR19TVEFDS19QUk9URUNUT1Jf
QUxMKSA6PSAtZnN0YWNrLXByb3RlY3Rvci1hbGwKPiArZWxzZQo+ICtzdGFjay1wcm90ZWN0b3It
Y2ZsYWdzLXkgOj0gLWZuby1zdGFjay1wcm90ZWN0b3IKPiArZW5kaWYKPiArZmlybXdhcmUtY2Zs
YWdzLXkgKz0gJChzdGFjay1wcm90ZWN0b3ItY2ZsYWdzLXkpCj4gZGlmZiAtLWdpdCBhL2Zpcm13
YXJlL3BheWxvYWRzL3Rlc3RfaGVhZC5TIGIvZmlybXdhcmUvcGF5bG9hZHMvdGVzdF9oZWFkLlMK
PiBpbmRleCA3ZDI1ZTA3Li4wNzBjZThhIDEwMDY0NAo+IC0tLSBhL2Zpcm13YXJlL3BheWxvYWRz
L3Rlc3RfaGVhZC5TCj4gKysrIGIvZmlybXdhcmUvcGF5bG9hZHMvdGVzdF9oZWFkLlMKPiBAQCAt
OTcsMyArOTcsMTggQEAgX2Jvb3RfYTA6Cj4gICAgICAgICBSSVNDVl9QVFIgICAgICAgMAo+ICBf
Ym9vdF9hMToKPiAgICAgICAgIFJJU0NWX1BUUiAgICAgICAwCj4gKwo+ICsgICAgICAgLyogVGhp
cyB3aWxsIGJlIGNhbGxlZCB3aGVuIHRoZSBzdGFjayBjb3JydXB0aW9uIGlzIGRldGVjdGVkICov
Cj4gKyAgICAgICAuc2VjdGlvbiAudGV4dAo+ICsgICAgICAgLmFsaWduIDMKPiArICAgICAgIC5n
bG9ibCBfX3N0YWNrX2Noa19mYWlsCj4gKyAgICAgICAudHlwZSBfX3N0YWNrX2Noa19mYWlsLCAl
ZnVuY3Rpb24KPiArICAgICAgIC5lcXUgIF9fc3RhY2tfY2hrX2ZhaWwsIF9zdGFydF9oYW5nCj4g
Kwo+ICsgICAgICAgLyogSW5pdGlhbCB2YWx1ZSBvZiB0aGUgc3RhY2sgZ3VhcmQgdmFyaWFibGUg
Ki8KPiArICAgICAgIC5zZWN0aW9uIC5kYXRhCj4gKyAgICAgICAuYWxpZ24gMwo+ICsgICAgICAg
Lmdsb2JsIF9fc3RhY2tfY2hrX2d1YXJkCj4gKyAgICAgICAudHlwZSBfX3N0YWNrX2Noa19ndWFy
ZCwgJW9iamVjdAo+ICtfX3N0YWNrX2Noa19ndWFyZDoKPiArICAgICAgIFJJU0NWX1BUUiAgICAg
ICAweDk1QjVGRjVBCj4gLS0KPiAyLjQzLjAKPgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9w
ZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL29wZW5zYmkK
