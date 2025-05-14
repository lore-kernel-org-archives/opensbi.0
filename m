Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26A8C3ABC3
	for <opensbi@archiver.kernel.org>; Wed, 14 May 2025 00:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J51dozl7TSoP4F4e0zWKVAP99n/ZOOiHZsocuVnbX6Y=; b=Q8ESw6TP7Gcc+V
	dX2TKaNeeQMq7L8t080ihCTXiRK/XV9+vGV8eoq3QM9ggVGWLaRgJH6kalf2p4L/AjaPKp2HLoM2Z
	4za4+04oMZlci0/gFbnCLQiE1tB81ZWf0PKrWYpt53Pm/7A4lvglVIK5WLarIjJVYqAF+b9RvASqZ
	WW+Q92mIm84sLdn1fkH4yrXpFdnvMg7sI0QdE/HN1NhxzbpQFOdMOChS3BM0KLgpZ3viLylmw6fvE
	eEc+62aZjYzW13fXC34BmS01gy8goLSv1GsDJLLbmtXOIu9I6fJO0oVKGEFoce1C61WHoaw5R6hYs
	cvnL4sXUlMhVN+9/9aXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF0Qm-0000000Dojc-1E0C;
	Wed, 14 May 2025 00:57:08 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF0Qj-0000000DojF-1nBN
	for opensbi@lists.infradead.org;
	Wed, 14 May 2025 00:57:06 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so63255185e9.1
        for <opensbi@lists.infradead.org>; Tue, 13 May 2025 17:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1747184224; x=1747789024; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKNa7/fPYo7eZWQVtaqfGuJSneULpKSOF28JQwl9Is4=;
        b=fUbyb51kgQLdG0PVYfeIxhQj7iiPCO5alboLdmE0uWez7bqfhdta4tRus5dTQdkI3L
         Cv2Z/I1xjkpYtnrUed3zaHImc4k/44/KIgFo8xE7MVXmi4Zss+FaOYgqMsy9wRhugsoM
         t4zpLOydqLUHM5t3rB8pGAb2usj2V1c3XEvsUphD+DmKjp6XwDLEfWZiboC7r2pqlcTs
         qtgPBHPKjme/WlB/FFq1gc3OSjeB7ICwgfO7S/qmVKPsYtCpDJgOgCy8c559nJWwZloZ
         vqzv7/RujW8FyiJg4O0QXPgIwk/VrIT//mjYk3xAtP92AP3GKXLdI/kX/8PIZYbCgR8F
         On4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747184224; x=1747789024;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hKNa7/fPYo7eZWQVtaqfGuJSneULpKSOF28JQwl9Is4=;
        b=FE17voOYSQTudzrQtcc9Wljw9lgC/us10bLxjUCfYb02UdHNTHyah2QxyNoscfkiPa
         Y+KEg6uZlt7vLIZTVVBjB84MjD/8AVCKMfyEU4Vkw/hPAZmpwKjJYH/pbwH995XlNJcS
         MbgCtPjyfXbHN9dw7YHQiY3KRzR+MAAx740GCIV7tZuetDEa2zMcBcQu1MaKPAYtdbNP
         nC5wchmguW+NdontokxAE1HbQpF1hu8rRaZVIBffaP5fVhtWHStBEiZbnzoA/3C4qXzK
         c8iwgZ1Ecv4jESiMlUSADPneRzAQ+254NGwkB/kcGUtpTpnQbcjp3UvHIO34g3gIfx6q
         EVPQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3NCeZ9itrm7/qg15f7k7J+mEIKa9C1AYXx0Hahozr4tudUcfYcKY+5URDy91YrFMlBwJI/BwB@lists.infradead.org
X-Gm-Message-State: AOJu0YxDjcAh53d+5f1bFLvtDhdHxnrL5rLl3b5j7OLVsiq+YlLyuMbN
	/w/zel2n4rLAlMsIYb8WiOLloEezmW/jbtv+LRFCWsJSnksV2eLvLuMU5CzV29Q=
X-Gm-Gg: ASbGncuP+VZZ4AnOmgvCL+pu0GoJdHVtAi1SIRi0wgvQRsKtx1vjSO2ScS8dpibl/ci
	e8Q8g4XqVTkIBXLNm6b0bKan5SgQHO34MzxG7R3xWh2Q9J/9Q0+/rCMPxt1YekLHAVYMk/wuFWy
	2IIeki79nO1DZ2QJOP62Cd3d5duf2xnaAVsN4CtSsPTbibuJlI4u3R+UZRy9bnttFdvAxO/GwZc
	zaLJJJcHiftZePbxwtAKVqu2HLGKaEQuxgebLr3jpCFuw6hfvRiV4ccQ7VqIbCrLeexhqNJW4HV
	bTcWZc/yt3zZwAet/ozIjqKuHkrjiynSKlcNN2UZp+L96Pj0JZpESV4oVa/wsW4UpD/9VQ==
X-Google-Smtp-Source: AGHT+IG0QLyyRijh4OQrQWAsUh8Kppm3lQiV0XLVE4ZxpaAGK6KoRRrFemzxjkZH9HEYR+rexzVNuQ==
X-Received: by 2002:a05:600c:5128:b0:441:a715:664a with SMTP id 5b1f17b1804b1-442f2168961mr8168685e9.20.1747184223593;
        Tue, 13 May 2025 17:57:03 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f33690e5sm7278645e9.6.2025.05.13.17.57.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 May 2025 17:57:02 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH] lib: sbi: Only enable TM bit in scounteren
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <893b8c86-ee0d-47ed-b596-dc4278cba2b9@sifive.com>
Date: Wed, 14 May 2025 01:56:50 +0100
Cc: Atish Patra <atishp@rivosinc.com>,
 anup@brainfault.org,
 opensbi@lists.infradead.org
Message-Id: <FAFCB5D5-FA14-4B73-AB37-522C5A12E06F@jrtc27.com>
References: <20250513-fix_scounteren-v1-1-01018e0c0b0a@rivosinc.com>
 <B1E3B737-3E3D-4FCD-ADA1-136F69433F39@jrtc27.com>
 <893b8c86-ee0d-47ed-b596-dc4278cba2b9@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_175705_467553_6433ECCA 
X-CRM114-Status: GOOD (  24.63  )
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

T24gMTQgTWF5IDIwMjUsIGF0IDAxOjQ5LCBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRA
c2lmaXZlLmNvbT4gd3JvdGU6Cj4gCj4gSGkgSmVzcywKPiAKPiBPbiAyMDI1LTA1LTEzIDc6MzUg
UE0sIEplc3NpY2EgQ2xhcmtlIHdyb3RlOgo+PiBPbiAxNCBNYXkgMjAyNSwgYXQgMDE6MjUsIEF0
aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPiB3cm90ZToKPj4gCj4+PiBUaGUgUy1tb2Rl
IHNob3VsZCBkaXNhYmxlIEN5Y2xlIGFuZCBpbnN0cnVjdGlvbiBjb3VudGVyIGZvciB1c2VyIHNw
YWNlCj4+PiB0byBhdm9pZCBzaWRlIGNoYW5uZWwgYXR0YWNrcy4gVGhlIExpbnV4IGtlcm5lbCBh
bHJlYWR5IGRvZXMgdGhpcyBzbyB0aGF0Cj4+PiBhbnkgcmFuZG9tIHVzZXIgc3BhY2UgY29kZSBz
aG91bGRuJ3QgYmUgYWJsZSB0byBtb25pdG9yIGN5Y2xlL2luc3RydWN0aW9uCj4+PiB3aXRob3V0
IGhpZ2hlciBwcml2aWxlZ2UgbW9kZSBpbnZvbHZlbWVudC4KPj4+IAo+Pj4gUmVtb3ZlIHRoZSBD
WS9JUiBiaXRzIGluIHNjb3VudGVybiBpbiBPcGVuU0JJLgo+PiAKPj4gSXNu4oCZdCB0aGlzIGEg
YnJlYWtpbmcgY2hhbmdlPyBTLW1vZGUgT1NlcyB0aGF0IGFyZSBoYXBweSB0byBhbGxvdwo+PiBV
LW1vZGUgdG8gcmVhZCB0aGUgY291bnRlcnMgYXJlIG5vdyBicm9rZW4sIHN1Y2ggYXMgRnJlZUJT
RC4gQkJMIGFsd2F5cwo+PiBzZXQgc2NvdW50ZXJlbiB0byBhbGwgb25lcyAod2l0aCBiaXRzIGFi
b3ZlIDIgYmVpbmcgcG9pbnRsZXNzIHdpdGhvdXQKPj4gcHJvZ3JhbW1pbmcgbWhwbWV2ZW50WCks
IGFuZCBPcGVuU0JJIGRpZCB0aGF0IHVudGlsIGl0IHN3aXRjaGVkIHRvIHRoaXMKPj4gYmVoYXZp
b3VyIG9mIENZfFRNfElSLiBTbyB3aGV0aGVyIG9yIG5vdCBpdCB3YXMgZXhwbGljaXQgaW4gdGhl
Cj4+IHNwZWNpZmljYXRpb24gd2hhdCB0aGVzZSB3ZXJlIGluaXRpYWxpc2VkIHRvLCBTLW1vZGUg
T1NlcyBleGlzdCB0aGF0Cj4+IGFzc3VtZWQgQ1ksIFRNIGFuZCBJUiBhdCBsZWFzdCB3ZXJlIGF2
YWlsYWJsZS4gUGxlYXNlIGRvIG5vdCBicmVhawo+PiB0aGluZ3M7IHRyZWF0IHRoZSBmaXJtd2Fy
ZTwtPlMtbW9kZSBpbnRlcmZhY2UgaW4gdGhlIHNhbWUgd2F5IGFzCj4+IGtlcm5lbDwtPnVzZXJz
cGFjZSwgaS5lLiBkb27igJl0IGJyZWFrIHVzZXJzcGFjZS9TLW1vZGUuCj4+IAo+PiBPU2VzIHRo
YXQgd2FudCB0byBvcHQgb3V0IGNhbi4gQW5kIGlmIHlvdSByZWFsbHkgd2FudCB0byBwdXNoIGZv
ciB0aGlzLAo+PiB5b3UgbmVlZCB0byB3YWl0IGZvciBPU2VzIHRvIGJlIGNoYW5nZWQgdG8gZXhw
bGljaXRseSBpbml0aWFsaXNlCj4+IHNjb3VudGVyZW4gYW5kIG9ubHkgZG8gaXQgb25jZSBvbGQg
dmVyc2lvbnMgYXJlIHN1ZmZpY2llbnRseSByYXJlLiBCdXQKPj4geW91IGNhbuKAmXQganVzdCBn
byBkb2luZyB0aGlzIHdpdGggbm8gd2FybmluZyAvIGRlcHJlY2F0aW9uIHBlcmlvZC4KPiAKPiBU
aGlzIHNob3VsZG4ndCBiZSBhIGJyZWFraW5nIGNoYW5nZSBmb3IgYW55IE9TIHRoYXQgc3VwcG9y
dHMgU01QLiBXaGlsZSB0aGUKPiBhcmNoaXRlY3R1cmFsIHN0YXRlIG9mIHRoZSBib290IGhhcnQg
dXBvbiBTLW1vZGUgZW50cnkgaXMgbm90IHdlbGwgZGVmaW5lZCwgdGhlCj4gU0JJIEhTTSBzcGVj
aWZpY2F0aW9uIGV4cGxpY2l0bHkgc3RhdGVzIHRoYXQgIkFsbCBvdGhlciByZWdpc3RlcnMgcmVt
YWluIGluIGFuCj4gdW5kZWZpbmVkIHN0YXRlLiIgKFRoaXMgd29yZGluZyBuZWVkcyB0byBiZSBt
b2RpZmllZCBpbiBTQkkgMy4wIHRvIGFjY291bnQgZm9yCj4gRldGVCBkZWZpbmluZyB0aGUgcmVz
ZXQgdmFsdWUgb2YgbW9zdCBmZWF0dXJlcywgYnV0IHRoZSBwb2ludCBzdGFuZHMuKSBTbyBpdAo+
IHdvdWxkIGJlIGluYXBwcm9wcmlhdGUgZm9yIGFuIE9TIHRvIHJlbHkgb24gdGhlIHByZWV4aXN0
aW5nIHNjb3VudGVyZW4gQ1NSIHZhbHVlCj4gb24gYW55IHNlY29uZGFyeSBoYXJ0LiBUaHVzLCBh
bnkgU01QIE9TIG11c3QgaGF2ZSBjb2RlIHRvIGluaXRpYWxpemUgc2NvdW50ZXJlbgo+IGFueXdh
eS4KClNob3VsZC4gQnV0IGluIHByYWN0aWNlIHRoZXNlIHRoaW5ncyBnZXQgbWlzc2VkLCBhbmQg
RnJlZUJTRCBkb2VzIG5vdApoYXZlIGNvZGUgdG8gZG8gdGhhdCB0b2RheS4gSXMgdGhhdCBhIGJ1
Zz8gU3VyZS4gQnV0IHRyeSBhcmd1aW5nIHRoYXQKZm9yIGEgTGludXgga2VybmVsIGNoYW5nZSB0
aGF0IGJyZWFrcyB1c2Vyc3BhY2U7IGl04oCZcyB0aGUgc2FtZSBhcmd1bWVudApoZXJlLiBJIGNh
biBhZGQgaXQsIGJ1dCB0aGF0IHdvbuKAmXQgaGVscCBleGlzdGluZyByZWxlYXNlcywgYW5kIEni
gJlkIGxpa2UKdG8gbm90IGhhdmUgdXNlcnPigJkgc3lzdGVtcyBicmVhayB3aGVuIHRoZXkgdXBk
YXRlIHRoZWlyIGZpcm13YXJlLgoKSmVzcwoKPiBSZWdhcmRzLAo+IFNhbXVlbAo+IAo+PiBOQUsu
Cj4+IAo+PiBKZXNzCj4+IAo+Pj4gU2lnbmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEBy
aXZvc2luYy5jb20+Cj4+PiAtLS0KPj4+IFRvOiBhbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQu
b3JnPgo+Pj4gQ2M6IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+Pj4gLS0tCj4+PiBsaWIv
c2JpL3NiaV9oYXJ0LmMgfCA0ICsrLS0KPj4+IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4+PiAKPj4+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9oYXJ0
LmMgYi9saWIvc2JpL3NiaV9oYXJ0LmMKPj4+IGluZGV4IGZjNDkyNWI1NzYyNS4uMTc3ZjM1NmI3
Yjc3IDEwMDY0NAo+Pj4gLS0tIGEvbGliL3NiaS9zYmlfaGFydC5jCj4+PiArKysgYi9saWIvc2Jp
L3NiaV9oYXJ0LmMKPj4+IEBAIC00OSwxMCArNDksMTAgQEAgc3RhdGljIHZvaWQgbXN0YXR1c19p
bml0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkKPj4+IAo+Pj4gY3NyX3dyaXRlKENTUl9N
U1RBVFVTLCBtc3RhdHVzX3ZhbCk7Cj4+PiAKPj4+IC0gLyogRGlzYWJsZSB1c2VyIG1vZGUgdXNh
Z2Ugb2YgYWxsIHBlcmYgY291bnRlcnMgZXhjZXB0IGRlZmF1bHQgb25lcyAoQ1ksIFRNLCBJUikg
Ki8KPj4+ICsgLyogRGlzYWJsZSB1c2VyIG1vZGUgdXNhZ2Ugb2YgYWxsIHBlcmYgY291bnRlcnMg
ZXhjZXB0IFRNICovCj4+PiBpZiAobWlzYV9leHRlbnNpb24oJ1MnKSAmJgo+Pj4gICBzYmlfaGFy
dF9wcml2X3ZlcnNpb24oc2NyYXRjaCkgPj0gU0JJX0hBUlRfUFJJVl9WRVJfMV8xMCkKPj4+IC0g
Y3NyX3dyaXRlKENTUl9TQ09VTlRFUkVOLCA3KTsKPj4+ICsgY3NyX3dyaXRlKENTUl9TQ09VTlRF
UkVOLCAweDAyKTsKPj4+IAo+Pj4gLyoqCj4+PiAqIE9wZW5TQkkgZG9lc24ndCB1c2UgYW55IFBN
VSBjb3VudGVycyBpbiBNLW1vZGUuCj4+PiAKPj4+IC0tLQo+Pj4gYmFzZS1jb21taXQ6IDMxNmRh
YWYxYzI5OWMyOWFjNDZlNTIxNDVmNjU1MjFmNDhlYzYzYjUKPj4+IGNoYW5nZS1pZDogMjAyNTA1
MTItZml4X3Njb3VudGVyZW4tOGI3YjY4MmJiODY0Cj4+PiAtLQo+Pj4gUmVnYXJkcywKPj4+IEF0
aXNoIHBhdHJhCj4+PiAKPj4+IAo+Pj4gLS0gCj4+PiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+Pj4g
b3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9w
ZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL29wZW5zYmkK
