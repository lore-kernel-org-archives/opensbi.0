Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A84D111A8
	for <opensbi@archiver.kernel.org>; Mon,  1 Dec 2025 05:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZK4/qFPx23qoR4bhBL5Yq6ifvpFUJGeRjAsF7ujaHU=; b=SbXrCWg3/C4aIC
	oXkRO9OxC6dY7CqDnYdYpzmg2f4CgZocWj5kf41dwaXxerSGWhcaHS9sqUoKKG+/uID5RJb+y0MEG
	MGrku/YgYcStEXMzukOa2GWucGfX/o1R2mgN+AR1T47uIJq2nmrw89D+fIFDvynbbC3axbnYCwUNv
	W2/6/RLzGoa2Ar9qIOoDiRN555NncTyvGQ4nY8vPUc3KqGoya5zZhAINqUSP/iyfmnnf7HD4Ekiyr
	gyPG7YW4Np3eXccnj3URj7V6qwWeu6K8izVotAhvtAZ7cFxz/XhgFIrhm0yoCsNQnCIKGE3bT4R/3
	0SJbiVQmUFm872ICAoGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPwFE-00000002vIh-0JpB;
	Mon, 01 Dec 2025 05:14:40 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPwFB-00000002vII-3RDn
	for opensbi@lists.infradead.org;
	Mon, 01 Dec 2025 05:14:39 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-9491ba846b2so148383039f.2
        for <opensbi@lists.infradead.org>; Sun, 30 Nov 2025 21:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1764566077; x=1765170877; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unlvK2dAxLevP4wvuWxaB8QOH5I/eYtwLMc/FfIlut0=;
        b=fXRcgAQJmcAWY8+7bQnG/JsjgLxoMOKO7ggdiA3zXVcEpYqspH7fyh0ebJabnUyErN
         Ovf9AQAiroHatKOIWv42Qg1qDbCefMw8YiaQgrTNRQ8DwA6GFvcYTkFZDOAUNNJ2KVtl
         Ojpq2HVlpFols7lKlnWpvvK08Kw1vqm1jKp0q8oDClt3cn54itszYEkFUjiN68GWQhUv
         bnWwi7oFHCa0yug+7aMPnH2Pwt76Ah7YPkKpxdGwqByfCI8g+SiUJvd8W2+a1jQawgIs
         Ti0+sADaabWHinKlTaGZpYHybT/BMh1QKhWYhB99Xn8/ciUWW5kbOCdiYBRs1DazzAc5
         y5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764566077; x=1765170877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=unlvK2dAxLevP4wvuWxaB8QOH5I/eYtwLMc/FfIlut0=;
        b=Q6GZqiK7s0DI/m8oXzTghYB3yirRWNslA5P9fNOtpyqf/pOmO92ufkyADnxrF/1Fhy
         qrvoPnNw33+OKLXFZrbd+xkKnpFfvFU/3CS1k/hUG+aclTid/YIo48ks2OQFKX9Hresl
         fmTG+ztPkBv8M+71OJWLwT4foKY53BwaqI3p7E9Sg8Lj9HyTLEMusgJeQyQTgbyOOyDe
         1wBzOB2+9yEf2x1URRFPsQDno1HrZWmPcYC3jHErpXtQfZbxNr8Fvc3inwy99wEMOxSc
         /LSFMp3xsBeBCYM5ecDLo2xFChhq7z00hS4ISF8HuGD/iRt8qUXbYLEKiwZkKSjIgTNj
         fxfQ==
X-Gm-Message-State: AOJu0YxxUDGlLuI4dViselsWHXj1ezAe221Nav1ZWtIhkWE4QvR+6J1r
	CGud/3+wwE+Sal/X7sEgo0PItetgIULvAVm1BGXk9O8VMEj+5t+TXdUgCinq7MrrADeAVdWHb24
	D7BYP55XVS94fs/8urxYoL9nzwzRPyJhu1OMSfXfOYqyEa81NNzlr
X-Gm-Gg: ASbGncsH3/pi95N60vD/iN9b1kxemBwrLiOX98g895Fy8Ww72vfqNrhGxiscuolCboZ
	koYL9ZgmqQXVF+yiP27arIk2jSirpYRNj0jJkSp19oQNPKmGhxT0Ai1ywVpVToL9XewlDve7DCz
	2pzD+2h9mJIvUwPYKnmYQySyUpgLmho+qtgLCij+UsY24NmRCwery2vXbzNMrdp5tnjn87XalKu
	rvgXIgE3vkSS/CpYBdAApcqR44I8fBWtEL6g8WSLU+VNTZv/hMuaiJgWvk0dAoypNzTaQ==
X-Google-Smtp-Source: AGHT+IH+dv/C+gXPlrFVQpnNM+hkS+1renb+ud+XuHwSVamiCeDiWfdNkkZH5aIU7LUntEx4ghH09kKttbDHZFCfk0g=
X-Received: by 2002:a05:6e02:12ce:b0:433:31ff:f885 with SMTP id
 e9e14a558f8ab-435b9842daemr342605025ab.9.1764566076685; Sun, 30 Nov 2025
 21:14:36 -0800 (PST)
MIME-Version: 1.0
References: <20251107075429.1382-1-manuel.hernandez@openchip.com>
In-Reply-To: <20251107075429.1382-1-manuel.hernandez@openchip.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 1 Dec 2025 10:44:26 +0530
X-Gm-Features: AWmQ_blfGZU69wzxAxVgzC2i8ZiHKrRdX07JyEo3-boNNIQqDqHQWpe7aRbSXNk
Message-ID: <CAAhSdy0upc-W6GwFrLpWayQasG5pRu1kPHwa7NkMee9rbf9Bpw@mail.gmail.com>
Subject: Re: [PATCH] platform: openpiton: use generic early init
To: =?UTF-8?Q?Manuel_Hern=C3=A1ndez_=7C_OPENCHIP?= <manuel.hernandez@openchip.com>
Cc: "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_211437_886409_F3581179 
X-CRM114-Status: GOOD (  18.11  )
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

T24gRnJpLCBOb3YgNywgMjAyNSBhdCAxOjI04oCvUE0gTWFudWVsIEhlcm7DoW5kZXogfCBPUEVO
Q0hJUAo8bWFudWVsLmhlcm5hbmRlekBvcGVuY2hpcC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogTWFu
dWVsIEhlcm7DoW5kZXogTcOpbmRleiA8bWFudWVsLmhlcm5hbmRlekBvcGVuY2hpcC5jb20+Cj4K
PiBBZGQgY29kZSBmb3IgdXNpbmcgZ2VuZXJpY19lYXJseV9pbml0LAo+IHNvIHRoZSB1YXJ0IHBh
cmFtZXRlcnMgYXJlIHBhcnNlZCBmcm9tIGR0Yi4KPgo+IFNpZ25lZC1vZmYtYnk6IE1hbnVlbCBI
ZXJuw6FuZGV6IE3DqW5kZXogPG1hbnVlbC5oZXJuYW5kZXpAb3BlbmNoaXAuY29tPgoKTEdUTS4K
ClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKQXBwbGllZCB0
aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCj4gLS0t
Cj4gIHBsYXRmb3JtL2dlbmVyaWMvb3Blbmh3Z3JvdXAvb3BlbnBpdG9uLmMgfCAyNSArKystLS0t
LS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMjIg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9vcGVuaHdncm91
cC9vcGVucGl0b24uYyBiL3BsYXRmb3JtL2dlbmVyaWMvb3Blbmh3Z3JvdXAvb3BlbnBpdG9uLmMK
PiBpbmRleCAzYmU2NmRlNi4uNjBkNzE5ZTEgMTAwNjQ0Cj4gLS0tIGEvcGxhdGZvcm0vZ2VuZXJp
Yy9vcGVuaHdncm91cC9vcGVucGl0b24uYwo+ICsrKyBiL3BsYXRmb3JtL2dlbmVyaWMvb3Blbmh3
Z3JvdXAvb3BlbnBpdG9uLmMKPiBAQCAtOCwxNiArOCw4IEBACj4gICNpbmNsdWRlIDxzYmlfdXRp
bHMvZmR0L2ZkdF9maXh1cC5oPgo+ICAjaW5jbHVkZSA8c2JpX3V0aWxzL2lwaS9hY2xpbnRfbXN3
aS5oPgo+ICAjaW5jbHVkZSA8c2JpX3V0aWxzL2lycWNoaXAvcGxpYy5oPgo+IC0jaW5jbHVkZSA8
c2JpX3V0aWxzL3NlcmlhbC91YXJ0ODI1MC5oPgo+ICAjaW5jbHVkZSA8c2JpX3V0aWxzL3RpbWVy
L2FjbGludF9tdGltZXIuaD4KPgo+IC0jZGVmaW5lIE9QRU5QSVRPTl9ERUZBVUxUX1VBUlRfQURE
UiAgICAgICAgICAgIDB4ZmZmMGMyYzAwMFVMTAo+IC0jZGVmaW5lIE9QRU5QSVRPTl9ERUZBVUxU
X1VBUlRfRlJFUSAgICAgICAgICAgIDYwMDAwMDAwCj4gLSNkZWZpbmUgT1BFTlBJVE9OX0RFRkFV
TFRfVUFSVF9CQVVEUkFURSAgICAgICAgICAgICAgICAxMTUyMDAKPiAtI2RlZmluZSBPUEVOUElU
T05fREVGQVVMVF9VQVJUX1JFR19TSElGVCAgICAgICAwCj4gLSNkZWZpbmUgT1BFTlBJVE9OX0RF
RkFVTFRfVUFSVF9SRUdfV0lEVEggICAgICAgMQo+IC0jZGVmaW5lIE9QRU5QSVRPTl9ERUZBVUxU
X1VBUlRfUkVHX09GRlNFVCAgICAgIDAKPiAtI2RlZmluZSBPUEVOUElUT05fREVGQVVMVF9VQVJU
X0NBUFMgICAgICAgICAgICAwCj4gICNkZWZpbmUgT1BFTlBJVE9OX0RFRkFVTFRfUExJQ19BRERS
ICAgICAgICAgICAgMHhmZmYxMTAwMDAwVUxMCj4gICNkZWZpbmUgT1BFTlBJVE9OX0RFRkFVTFRf
UExJQ19TSVpFICAgICAgICAgICAgKDB4MjAwMDAwICsgXAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgKE9QRU5QSVRPTl9ERUZBVUxUX0hBUlRfQ09VTlQgKiAweDEwMDApKQo+IEBA
IC0zMCwxMSArMjIsNiBAQAo+ICAjZGVmaW5lIE9QRU5QSVRPTl9ERUZBVUxUX0FDTElOVF9NVElN
RVJfQUREUiAgIFwKPiAgICAgICAgICAgICAgICAgKE9QRU5QSVRPTl9ERUZBVUxUX0NMSU5UX0FE
RFIgKyBDTElOVF9NVElNRVJfT0ZGU0VUKQo+Cj4gLXN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fdWFy
dF9kYXRhIHVhcnQgPSB7Cj4gLSAgICAgICAodW5zaWduZWQgbG9uZylPUEVOUElUT05fREVGQVVM
VF9VQVJUX0FERFIsCj4gLSAgICAgICBPUEVOUElUT05fREVGQVVMVF9VQVJUX0ZSRVEsCj4gLSAg
ICAgICBPUEVOUElUT05fREVGQVVMVF9VQVJUX0JBVURSQVRFLAo+IC19Owo+ICBzdGF0aWMgc3Ry
dWN0IHBsaWNfZGF0YSBwbGljID0gewo+ICAgICAgICAgLmFkZHIgPSAodW5zaWduZWQgbG9uZylP
UEVOUElUT05fREVGQVVMVF9QTElDX0FERFIsCj4gICAgICAgICAuc2l6ZSA9IE9QRU5QSVRPTl9E
RUZBVUxUX1BMSUNfU0laRSwKPiBAQCAtNzMsNyArNjAsNiBAQCBzdGF0aWMgc3RydWN0IGFjbGlu
dF9tdGltZXJfZGF0YSBtdGltZXIgPSB7Cj4gIHN0YXRpYyBpbnQgb3BlbnBpdG9uX2Vhcmx5X2lu
aXQoYm9vbCBjb2xkX2Jvb3QpCj4gIHsKPiAgICAgICAgIGNvbnN0IHZvaWQgKmZkdDsKPiAtICAg
ICAgIHN0cnVjdCBwbGF0Zm9ybV91YXJ0X2RhdGEgdWFydF9kYXRhID0geyAwIH07Cj4gICAgICAg
ICBzdHJ1Y3QgcGxpY19kYXRhIHBsaWNfZGF0YSA9IHBsaWM7Cj4gICAgICAgICB1bnNpZ25lZCBs
b25nIGFjbGludF9mcmVxOwo+ICAgICAgICAgdWludDY0X3QgY2xpbnRfYWRkcjsKPiBAQCAtODMs
OSArNjksOSBAQCBzdGF0aWMgaW50IG9wZW5waXRvbl9lYXJseV9pbml0KGJvb2wgY29sZF9ib290
KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiAgICAgICAgIGZkdCA9IGZkdF9nZXRfYWRk
cmVzcygpOwo+Cj4gLSAgICAgICByYyA9IGZkdF9wYXJzZV91YXJ0ODI1MChmZHQsICZ1YXJ0X2Rh
dGEsICJuczE2NTUwIik7Cj4gLSAgICAgICBpZiAoIXJjKQo+IC0gICAgICAgICAgICAgICB1YXJ0
ID0gdWFydF9kYXRhOwo+ICsgICAgICAgcmMgPSBnZW5lcmljX2Vhcmx5X2luaXQoY29sZF9ib290
KTsKPiArICAgICAgIGlmIChyYykKPiArICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+Cj4gICAg
ICAgICByYyA9IGZkdF9wYXJzZV9wbGljKGZkdCwgJnBsaWNfZGF0YSwgInJpc2N2LHBsaWMwIik7
Cj4gICAgICAgICBpZiAoIXJjKQo+IEBAIC0xMDQsMTEgKzkwLDYgQEAgc3RhdGljIGludCBvcGVu
cGl0b25fZWFybHlfaW5pdChib29sIGNvbGRfYm9vdCkKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBBQ0xJTlRfREVGQVVMVF9NVElNRUNNUF9PRkZTRVQ7Cj4gICAgICAgICB9
Cj4KPiAtICAgICAgIHJjID0gdWFydDgyNTBfaW5pdCh1YXJ0LmFkZHIsIHVhcnQuZnJlcSwgdWFy
dC5iYXVkLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgIE9QRU5QSVRPTl9ERUZBVUxUX1VB
UlRfUkVHX1NISUZULAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgIE9QRU5QSVRPTl9ERUZB
VUxUX1VBUlRfUkVHX1dJRFRILAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgIE9QRU5QSVRP
Tl9ERUZBVUxUX1VBUlRfUkVHX09GRlNFVCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICBP
UEVOUElUT05fREVGQVVMVF9VQVJUX0NBUFMpOwo+ICAgICAgICAgaWYgKHJjKQo+ICAgICAgICAg
ICAgICAgICByZXR1cm4gcmM7Cj4KPiAtLQo+IDIuMzQuMQo+Cj4gLS0KPiBvcGVuc2JpIG1haWxp
bmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBs
aXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
