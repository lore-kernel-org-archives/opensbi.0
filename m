Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C349CC982DA
	for <opensbi@archiver.kernel.org>; Fri, 18 Sep 2026 11:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ixXMzdKcobpVe2AjOYDTLJJ74uWUKAw94aQof9eQDuw=; b=ZPUsiAmCbbWFqJ
	65WhZTOON+gGzs79Mal2uTlF2eWpyFEYY46jnpv0dv1meiBFNwLMrIJYk7zi8R81b3WSzIb8o0jB8
	z+zk08M5w+sGbZ2nupyZxt3lYjJdEgEtJN47tR+tfqCbTY3oDkGuoEiCXZnvcsYyX2gRxcXdqpWaR
	DA03+vKqQeftERLhh3QCUeObjl/i3dmgyogJ+dGEc81UySm5GZv/y6yxhy2Oe7Hz5EsMe/2fHOA87
	LQGc8VxoDZvI4+pFw1WFe3L42euY5YIB4TI8qRr7QN9bdciR7OcgByHeZXVZKSljwhapk2T/iTjce
	VmbZN5yPY2sOMRCFEAwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WmL-0000000EDlu-0WEV;
	Fri, 18 Sep 2026 11:29:17 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WmI-0000000EDlT-0zYb
	for opensbi@lists.infradead.org;
	Fri, 18 Sep 2026 11:29:15 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6350f88so380789f8f.2
        for <opensbi@lists.infradead.org>; Fri, 18 Sep 2026 04:29:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789730952; cv=none;
        d=google.com; s=arc-20260327;
        b=QHQQHWmCv8cc7LwcU3Awe2J0h+nGKbuGo56xEPs63XCh1/ol7qRilV2unnA8LGHr9J
         NerXLFLxRzgeC42PgZwOWckxzZ+Gswiwl4fau4Q8wGr5L8jBH/rsndVLHKiLJJU7Hrxk
         apGj5seUZuVvONJX3awwvYb1kedDwycKjcJWe6hvErDDfMBqqthiDm071Bu8GytItuWG
         IoazKHmJ5bNAw12MBQpVKu2TYtBGiAxwfMbHMBy1yfAjEpVbKqp0Uw/dlpxnxVDkdaCl
         tRJOOROFgV9VE0Tn9gJhp6kEXPyDSs8BN44quMQ3Dx+Uyv/X9fTTHT/5yYtUdS5Mxvv/
         YxSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/fDZNnT1CeRRPeiwpCnv5ZSNGfr6b/zO7S9qOLK74uY=;
        fh=eQRLnJNeHQBGvSQQ3K81dsZjCFpV01l3b0rpGkosk9o=;
        b=bGBdQiXAsyAR5a6jQowk7Ws1ySrLxU7VywIJ/zXUFbjkSKPniBm/d1BMGXiYiklpeA
         ribu4Mnqipggljmji8mltw1q/BTk3FNp6JUfPFSnfVdTy40zr40Rwh+fhfrV3k4+GOiH
         zGPM414SRLAtDNpVmHQH5d+YvC5y59h8sIIaAMudC34UE6vTEatPJ3Id2t2DJzs4HXN6
         NWrKyR8SduFUULgse7lI5qY4/oR0P0Lejj/28zHvd3tbniNb8vFqb2KuO+kdOS/uMvG9
         OAdCPu8uqa+lNOdCSXDWF/IVXrv90tyshV9X0ngeI+5raiB079AibevM3bQjE2U65d60
         ju6w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789730952; x=1790335752; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/fDZNnT1CeRRPeiwpCnv5ZSNGfr6b/zO7S9qOLK74uY=;
        b=UU+3Z2udnWl/KzLY6UpeF6Ny0Oq/WlCs4HgEAttOa4O283a8zSMsSk4+Ffd5jsv1wL
         no2YvuIxn7qTo4iEw8jdqw2ONY+6s6zfB0muEMaoVCduMimjLPoEybhkJ/uZzRhE3K3X
         u5RJMsJQABows2Ar8Dqx+kPKVQG2fvDiyL9MCD+KLJdN//eGTAJGIlKQ2VeWk+QuzSKl
         2/aFZOhZlEqNml/hltuXZ7ZyOHwZfuW+xYQdRbikaqLOdfHzBI61VGaO8H4QGDbwWlw+
         shx7JqkR03FimJvYGaihxoGDnTjlrDBLJmXuQO7yDUCtct2osvW3npDN7zpcbjqdm9vz
         j/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789730952; x=1790335752;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/fDZNnT1CeRRPeiwpCnv5ZSNGfr6b/zO7S9qOLK74uY=;
        b=OQ/D78YLFFcWkQq3HO1dVCjCvDigYznYlydLDR1mW6IgIOWAJoOy9HhmHgFiLBTUIY
         Zn4dRu/F9INiTWnViTKuV0k02rklCsDWrH+a7J5zC8mR/ayAJ4TKpXU7A+AZS/HpRImQ
         ElBTKPNw3Q3a/sWUkRbDCUFBAoY1xBaI37iFxA6Y7wPJoWmlXWL66u37TSesakAAE3pP
         yxigaj+DvOy6H9NwRt4SaMnkPieW7asvco4QFjRtOt+wkacyRGobzgarRqT+iQ7iLIB0
         kkuJSUbM5Ji9JlZTKHRdBTce6NqA51VWAxR+vG6f9VQkg84DHeHG2N3sXO2gOtPEq3pY
         QBxQ==
X-Gm-Message-State: AFuF++lIF/7mmETcHtq7dthT6Nyu0Nwyc1/yNOfoscO3nCmnB0gJa0dg
	BxH8BO+H8irlJsDRxNHBjfCrzM4bUbKId5YrilnB6yyZS3jQEDjaDq/uBhBoGmct6CNwcqj0s99
	VFxWGk191jQxQ7CjE8NvCR16diQBTvtnbVRCWrQK0aw==
X-Gm-Gg: AYBFou3J7ZtKbmqpRiddGIdwNOC+GQr2/Ajr4GcxByiG1IoxcfOmW16nrK2sXrsJtcp
	xmNVY/5/6PTi6HFKxB91oj7I660grjebvEfoMXMMpoB4wcginHIu5N9SuV0Bvy1G1ohfFS8S4qg
	dIJdPG/1b4u6plclhfrnXSoiy2C0/KJ5Z2aJr+6DUgkvcPmZNfDC/6pz1QTdlZNKpdSfSjlEomC
	LEIJrwS4UrFUTJ/FT89wfVXX3lpjb5TAvdyEkPv4g97jVeAE/rssfUf0C/C4ZCdEjFpDV/s+9j2
	4GthEleXkk70kgcz3KNCmGGGoAzo8NaF8XMozlNQPjgzxN6yzKr74gzts+fn5pzPmPnz4yS3vpJ
	+4jukh6aKrnm+PE+wryILukoLluiJeUnvrb1OYEnhE1kUSlwUn0MaW6OesN1qOyP/d8P1UaCZTg
	==
X-Received: by 2002:a05:6000:2409:b0:487:489:7af1 with SMTP id
 ffacd0b85a97d-4871e3645a7mr3171102f8f.48.1789730951269; Fri, 18 Sep 2026
 04:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260918081313.659655-1-zong.li@sifive.com>
In-Reply-To: <20260918081313.659655-1-zong.li@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 18 Sep 2026 16:58:59 +0530
X-Gm-Features: AcwNN1V6RAA-lWXIoxnO3bwu5ho4zTmRjND_x-naLy8x1jYqRHbTst6eE8J8T_w
Message-ID: <CAAhSdy3CYcdGURau_RrDG9Vz_oz1qRtW8Te0y+xN1=Gn3pvqLQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Support OpenSBI firmware header
To: Zong Li <zong.li@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_042914_295632_D3BF9644 
X-CRM114-Status: GOOD (  21.53  )
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

T24gRnJpLCBTZXAgMTgsIDIwMjYgYXQgMTo0M+KAr1BNIFpvbmcgTGkgPHpvbmcubGlAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHNlcmllcyBhZGRzIE9wZW5TQkkgZmlybXdhcmUgaGVhZGVy
LiBUaGUgbW90aXZhdGlvbiBpcyB3aGVuIGEKPiBzeXN0ZW0gd2hlcmUgdGhlIHByZXZpb3VzIGJv
b3Rpbmcgc3RhZ2UgcnVucyBvbiBhIGRlZGljYXRlZCBib290Cj4gcHJvY2Vzc29yLCBpdCBjYW4g
bG9hZCBhbmQgcGF0Y2ggdGhlIE9wZW5TQkkgaW1hZ2UgaW4gRFJBTSBhbmQgdGhlbgo+IHJlbGVh
c2UgdGhlIGFwcGxpY2F0aW9uIGhhcnQgdGhhdCBydW5zIE9wZW5TQkksIGJ1dCBpdCBjYW4gbmV2
ZXIgZXhlY3V0ZQo+IG9uIHRoYXQgaGFydCBhbmQgdGhlcmVmb3JlIGNhbm5vdCBwbGFjZSBhbnl0
aGluZyBpbiBpdHMgcmVnaXN0ZXJzLCBzdWNoCj4gYXMgJGEwLCAkYTEgYW5kICRhMgo+Cj4gRXZl
cnkgT3BlblNCSSBmaXJtd2FyZSBpbWFnZSwgcmVnYXJkbGVzcyBvZiBpdHMgdHlwZSAoRldfRFlO
QU1JQywKPiBGV19KVU1QIG9yIEZXX1BBWUxPQUQpLCBzdGFydHMgd2l0aCBhIGZpeGVkIDEyOC1i
eXRlIGhlYWRlci4gVGhlIGhlYWRlcgo+IHNlcnZlcyB0d28gcHVycG9zZXM6Cj4KPiAxLiBpdCBs
ZXRzIHRoZSBwcmV2aW91cyBib290aW5nIHN0YWdlIHJlY29nbml6ZSBhbiBPcGVuU0JJIGZpcm13
YXJlCj4gICAgaW1hZ2UgYW5kIGZpbmQgb3V0IHdoYXQgaXQgd2FzIGJ1aWx0IGZvciwgYW5kCj4g
Mi4gaXQgZ2l2ZXMgdGhlIHByZXZpb3VzIGJvb3Rpbmcgc3RhZ2UgYSB3ZWxsLWtub3duIHBsYWNl
IGluc2lkZSB0aGUKPiAgICBpbWFnZSB0byBoYW5kIG92ZXIgdGhlIGJvb3QgYXJndW1lbnRzIGJ5
IHBhdGNoaW5nIGEgZmV3IHdvcmRzLAo+ICAgIGluc3RlYWQgb2Ygc2V0dGluZyB1cCB0aGUgKmEw
KiwgKmExKiBhbmQgKmEyKiByZWdpc3RlcnMuCj4KPiBUaGlzIHNlcmllcyBhbHNvIHByb3ZpZGVz
IGEgZG9jdW1lbnQgJ2RvY3MvZmlybXdhcmUvZndfaGVhZGVyLm1kJyB0bwo+IGRlc2NyaWJlIHRo
ZSBsYXlvdXQgb2YgdGhlIDEyOC1ieXRlIE9wZW5TQkkgZmlybXdhcmUgaGVhZGVyLCB0aGUKPiBh
MC9hMS9hMiBvdmVycmlkZSBmbGFncywgd2hhdCBhIHByZXZpb3VzIGJvb3Rpbmcgc3RhZ2UgaXMg
ZXhwZWN0ZWQgdG8gcHV0Cj4gaW4gZWFjaCByZWdpc3RlciwgYW5kIGFuIGV4YW1wbGUgb2YgaG93
IHRvIHBhdGNoIHRoZSBoZWFkZXIuCj4KPiBUaGFua3MgQW51cCBmb3IgZGlzY3Vzc2luZyBpdCBh
bmQgcHJvdmlkaW5nIHRoZSBpZGVhcwo+Cj4gQ2hhbmdlZCBpbiB2MToKPiAtIFJlbW92ZSBfZndf
aGVhZGVyX292ZXJyaWRlX2EwCj4gLSBVc2UgbWhhcnRpZCBmb3IgYTAgd2hlbiBGV19IRUFERVJf
RkxBR1NfT1ZFUlJJREVfQTAgaXMgc2V0Cj4gLSBVcGRhdGUgZncubWQgZm9yIHRoZSBjaGFuZ2Vz
IGFib3ZlCj4KPiBab25nIExpICgzKToKPiAgIGZpcm13YXJlOiBmd19iYXNlLlM6IGFkZCBhIGZv
cm1hdHRlZCBPcGVuU0JJIGZpcm13YXJlIGhlYWRlcgo+ICAgZmlybXdhcmU6IGZ3X2Jhc2UuUzog
b3ZlcnJpZGUgYTAsIGExIGFuZCBhMiBmcm9tIHRoZSBmaXJtd2FyZSBoZWFkZXIKPiAgIGRvY3M6
IGZpcm13YXJlOiBkb2N1bWVudCB0aGUgT3BlblNCSSBmaXJtd2FyZSBoZWFkZXIKPgo+ICBkb2Nz
L2Zpcm13YXJlL2Z3Lm1kICAgICAgICB8ICAgOSArKysKPiAgZG9jcy9maXJtd2FyZS9md19oZWFk
ZXIubWQgfCAxMzcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBmaXJt
d2FyZS9md19iYXNlLlMgICAgICAgICB8ICA5NCArKysrKysrKysrKysrKysrKysrKysrKysrCj4g
IDMgZmlsZXMgY2hhbmdlZCwgMjQwIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRvY3MvZmlybXdhcmUvZndfaGVhZGVyLm1kCj4KPiAtLQo+IDIuNDMuNwo+CgpMR1RNLgoKUmV2
aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMg
c2VyaWVzIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCi0tIApvcGVu
c2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
