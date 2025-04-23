Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BA9C369D7
	for <opensbi@archiver.kernel.org>; Wed, 23 Apr 2025 07:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3cspf3hjiNr5HqqVF+d+JFpnO18DBUqUJjMRAZ0+Uxk=; b=Pa8Yvv1uO9vs6d
	n8KDzA35wwbt6njmqQI1iKdYn1aXYEJUiao6wOjHVWTolwhXx6ALGjyhUdr6e8gFSCoySZ+ARQLlP
	A+zMXJnla4IItym2fVS1Y056qAbBXN6TafYC41LTvWKVF8uhRMUY/7vTRUKyulQYw8FM7Nm9++lxH
	SFrSqgbafnzkSU9Y5FB39mpR4OL0nUuWcQCqotV1GJGKPVI6Vj2yG0Aup+1P5xqSoHe5faVWxoq3P
	liv9QggEn5JKdL2WpU6gjETJl9MImEzbz1DuT9J7hpeFrn0AgvUj+bDKIKWnunN4gfh4iW+A2k//Q
	w1xH5dZeaoJlcoYfKQhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UIZ-00000009T1b-3sdk;
	Wed, 23 Apr 2025 07:13:35 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UEO-00000009ST7-190c
	for opensbi@lists.infradead.org;
	Wed, 23 Apr 2025 07:09:17 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-85b4170f1f5so206293839f.3
        for <opensbi@lists.infradead.org>; Wed, 23 Apr 2025 00:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745392155; x=1745996955; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ji4TW/xO8uiMN0yPVgKKcxN3YPk5hnMLQbE8b2J3FrU=;
        b=w9/B+BYzMKjPr7akM3TVtT30WhV8WCs1eDHDJrjsFkdboDCRsn6uwKggPCkIYo92ON
         VXYJk2EpGNsnH3tnHEgTLZ8sLCWzw9RY5npgJA4J2D8vYdItaZcOyOnqSQfR9BWo5xM+
         wZHWJSTfSVDFu3+eS6rEbjRdXTrxVK2MTr41dN4wShWrus5xq/8UjWse5S8SpjXjCXa0
         Yb2IFnhZUHVXImsJFlTmY7rpL+xCttpSavmwvNf7tQoq2fpB3QkNrYlujfY29y+bnOCS
         ui8L3QtTkJU93EHYVyuNSWzb1BjLJ+m4Hyivr+qq/KRf7x8St1EcTCYRdY3MDt9zN2YM
         qfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392155; x=1745996955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ji4TW/xO8uiMN0yPVgKKcxN3YPk5hnMLQbE8b2J3FrU=;
        b=AFg0RpmCWrSp5QBrHvd1ja0ZMzS/Kr7GST9lGjPgyzgD0cVSxqW5wzlWTd4GiuvrDS
         BB9+oQKctZ/zcZlC4giG0foY3o2vF8tnxVvkG1AQX/1+e4imiM5D3RLQxCBRmTz8B6il
         uynw4yj760yrUG2vwUlZ/XwPUQZtU4G4AWdBerG1vsVEXBSpKsZQZ/TD5xM/qCt5ndm2
         kuBTr+fpAsgUvsi++hW+dTiGXY0uxobz+QfHFBQLnKTzHcgpB+AV+Oz6VhkFzXJHtaZE
         /Xy1MzMmyNCcqwlHJ4+M6az+0A22RPq+gKwuXcLmIeH3V+IpTTBnLfHQ88BYBVV+Hjno
         V2qw==
X-Gm-Message-State: AOJu0YzFdTToIQ6JjJLxrl+cfD1WhIAOjp+vM6aZ+aVtmJUFzf9JsxFl
	XDOKLhzzBMX6yH3C9lzPaM385Y4ObEK2Ls3spcKGvN2rYBbOmMJj+hhYKjH+6Cjy1QRFeq6xg+f
	jf7IXqhV51sIsBodoNOcyNhLZUs1MYLDLXPqEJpbYADTpnnSi
X-Gm-Gg: ASbGncvbHDqa94lrSVVUKuA1wK1D6XS1D4BiS38FfH/0FDDVQzFj5WuAfvxeR8WeN/H
	3a6JHl68JWkXXGl2ZVwkiGKkkAX/BaIEiuxEJvga80P/7KbTVF1lyC6slhsIH/kcuxhKedwOPA9
	jRxd4oBazw9jv8mmtvCur/h10=
X-Google-Smtp-Source: AGHT+IElzn9/YGZksTsuQkKA+wxWCxgjMSBjItVLpXssD8igMh22nvlSDcF9JhTYattZWja6uEo9rRkUJIJutWp+E+g=
X-Received: by 2002:a05:6e02:b25:b0:3d3:fbae:3978 with SMTP id
 e9e14a558f8ab-3d88eda88b8mr145597865ab.9.1745392154665; Wed, 23 Apr 2025
 00:09:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250325234342.711447-1-samuel.holland@sifive.com>
In-Reply-To: <20250325234342.711447-1-samuel.holland@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 23 Apr 2025 12:39:03 +0530
X-Gm-Features: ATxdqUFOqKdRPKCJG52VQKKwbll-Ro37DhCJt8bkPPPUECQyDVvAeaePhcZRlDM
Message-ID: <CAAhSdy3jPYqkm2BiKH+ocDiTtmoj9LBd=dZAHvxA3aN0RTPjmQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] Refactor generic platform overrides from middleware
 to helpers
To: Samuel Holland <samuel.holland@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_000916_511074_B06D8FC3 
X-CRM114-Status: GOOD (  15.01  )
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

T24gV2VkLCBNYXIgMjYsIDIwMjUgYXQgNToxM+KAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIHJlZmFjdG9ycyBob3cg
b3ZlcnJpZGVzIHdvcmsgaW4gdGhlIGdlbmVyaWMgcGxhdGZvcm0uIFRoZQo+IHVsdGltYXRlIGdv
YWwgaXMgdG8gbWFrZSBwbGF0Zm9ybSBvdmVycmlkZSBtYXRjaGluZyByZXNwZWN0IHRoZSBwcmlv
cml0eQo+IG9yZGVyIG9mIHRoZSByb290IG5vZGUgY29tcGF0aWJsZSBzdHJpbmdzLCBhcyBpbXBs
ZW1lbnRlZCBmb3IgZmR0X2RyaXZlcgo+IGluIGNvbW1pdCAwZmZlMjY1ZmQ5NjkgKCJsaWI6IHV0
aWxzL2ZkdDogUmVzcGVjdCBjb21wYXRpYmxlIHN0cmluZwo+IGZhbGxiYWNrIHByaW9yaXR5Iiku
IEJ1dCB0aGlzIHNlcmllcyBhbHNvIG1ha2VzIHRoZSBnZW5lcmljIHBsYXRmb3JtCj4gY29kZSBh
IGJpdCBtb3JlIGVmZmljaWVudCwgYW5kIHNocmlua3MgdGhlIGZpcm13YXJlIGJ5IGFib3V0IGEg
a2lsb2J5dGUuCj4gVGhlIGZpcnN0IHRocmVlIGNvbW1pdHMgZml4IG1pbm9yIGlzc3VlcyB3aXRo
IHRoZSBleGlzdGluZyBvdmVycmlkZXMuCj4KPgo+IFNhbXVlbCBIb2xsYW5kICgxMCk6Cj4gICBw
bGF0Zm9ybTogZ2VuZXJpYzogYW5kZXM6IFJlbW92ZSBpbmxpbmUgZGVmaW5pdGlvbnMKPiAgIHBs
YXRmb3JtOiByemZpdmU6IENhbGwgYW5kZXNfcG1hX3NldHVwX3JlZ2lvbnMoKSBvbmx5IGR1cmlu
ZyBjb2xkIGJvb3QKPiAgIHBsYXRmb3JtOiBnZW5lcmljOiB0aGVhZDogQXZvaWQgY2FzdGluZyBh
d2F5IGNvbnN0Cj4gICBwbGF0Zm9ybTogZ2VuZXJpYzogQWRkIGFuIGluaXQgaG9vayBtYXRjaGlu
ZyBmZHRfZHJpdmVyCj4gICBwbGF0Zm9ybTogZ2VuZXJpYzogQWxsb3cgcmVwbGFjaW5nIHBsYXRm
b3JtIG9wZXJhdGlvbnMKPiAgIHBsYXRmb3JtOiBnZW5lcmljOiBNb2RpZnkgcGxhdGZvcm0gb3Bz
IGluc3RlYWQgb2YgdXNpbmcgaG9va3MKPiAgIHBsYXRmb3JtOiBnZW5lcmljOiBSZW1vdmUgcGxh
dGZvcm0gb3ZlcnJpZGUgaG9va3MKPiAgIHBsYXRmb3JtOiBnZW5lcmljOiBJbml0aWFsaXplIG92
ZXJyaWRlcyB3aXRoIGZkdF9kcml2ZXIKPiAgIGxpYjogdXRpbHMvZmR0OiBSZW1vdmUgZmR0X21h
dGNoX25vZGUoKQo+ICAgbGliOiBzYmlfcGxhdGZvcm06IFJlbW92ZSB0aGUgdmVuZG9yX2V4dF9j
aGVjayBob29rCgpBcHBsaWVkIHRoaXMgc2VyaWVzIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8u
CgpUaGFua3MsCkFudXAKCj4KPiAgaW5jbHVkZS9zYmkvc2JpX3BsYXRmb3JtLmggICAgICAgICAg
ICAgICAgICAgIHwgICA3ICstCj4gIGluY2x1ZGUvc2JpX3V0aWxzL2ZkdC9mZHRfaGVscGVyLmgg
ICAgICAgICAgICB8ICAgMyAtCj4gIGxpYi91dGlscy9mZHQvZmR0X2hlbHBlci5jICAgICAgICAg
ICAgICAgICAgICB8ICAxOSAtLS0KPiAgcGxhdGZvcm0vZ2VuZXJpYy9hbGx3aW5uZXIvc3VuMjBp
LWQxLmMgICAgICAgIHwgIDUzICsrKystLS0KPiAgcGxhdGZvcm0vZ2VuZXJpYy9hbmRlcy9hZTM1
MC5jICAgICAgICAgICAgICAgIHwgIDI1ICsrKy0KPiAgcGxhdGZvcm0vZ2VuZXJpYy9hbmRlcy9h
bmRlc19wbXUuYyAgICAgICAgICAgIHwgIDEzICstCj4gIHBsYXRmb3JtL2dlbmVyaWMvYW5kZXMv
YW5kZXNfc2JpLmMgICAgICAgICAgICB8ICAgMyArLQo+ICBwbGF0Zm9ybS9nZW5lcmljL2luY2x1
ZGUvYW5kZXMvYW5kZXNfcG11LmggICAgfCAgMjMgKy0tCj4gIHBsYXRmb3JtL2dlbmVyaWMvaW5j
bHVkZS9hbmRlcy9hbmRlc19zYmkuaCAgICB8ICAgNCArLQo+ICBwbGF0Zm9ybS9nZW5lcmljL2lu
Y2x1ZGUvcGxhdGZvcm1fb3ZlcnJpZGUuaCAgfCAgMzcgKystLS0KPiAgcGxhdGZvcm0vZ2VuZXJp
Yy9wbGF0Zm9ybS5jICAgICAgICAgICAgICAgICAgIHwgMTM4ICsrKy0tLS0tLS0tLS0tLS0tLQo+
ICAuLi4vZ2VuZXJpYy9wbGF0Zm9ybV9vdmVycmlkZV9tb2R1bGVzLmNhcnJheSAgfCAgIDIgKy0K
PiAgcGxhdGZvcm0vZ2VuZXJpYy9yZW5lc2FzL3J6Zml2ZS9yemZpdmUuYyAgICAgIHwgIDQ2ICsr
KystLQo+ICBwbGF0Zm9ybS9nZW5lcmljL3NpZml2ZS9mdTU0MC5jICAgICAgICAgICAgICAgfCAg
MTMgKy0KPiAgcGxhdGZvcm0vZ2VuZXJpYy9zaWZpdmUvZnU3NDAuYyAgICAgICAgICAgICAgIHwg
IDIwICsrLQo+ICBwbGF0Zm9ybS9nZW5lcmljL3NvcGhnby9zZzIwNDIuYyAgICAgICAgICAgICAg
fCAgMzEgKysrLQo+ICBwbGF0Zm9ybS9nZW5lcmljL3N0YXJmaXZlL2poNzExMC5jICAgICAgICAg
ICAgfCAgMjYgKystLQo+ICBwbGF0Zm9ybS9nZW5lcmljL3RoZWFkL3RoZWFkLWdlbmVyaWMuYyAg
ICAgICAgfCAgMzggKysrLS0KPiAgMTggZmlsZXMgY2hhbmdlZCwgMjIwIGluc2VydGlvbnMoKyks
IDI4MSBkZWxldGlvbnMoLSkKPgo+IC0tCj4gMi40Ny4yCj4KPgo+IC0tCj4gb3BlbnNiaSBtYWls
aW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcg
bGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
