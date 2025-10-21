Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB570CCD1A7
	for <opensbi@archiver.kernel.org>; Tue, 21 Oct 2025 14:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3CEJ01D1Aedc+dpNsaxFaVRB5llgdvy1jpPKvIYS7wA=; b=AF6WNmfECY0p7/
	2RJ0/6NMT3dQhKYfQDz0qhRDeOz18ULPioAOvxkC4wF8UTi7EIcTxMyNkrChSsAicFjVYkeuWD4N9
	7pK1hJhQxbuhzpZ+kBSqZeRXQrGH3ULJpZIxqHYGoWw3KDMrKt0jodMlhJkljx2pIs7b6tKsrwYo+
	3GacnmPSoHY7t320/NKihlOqWZER6uwF1293HJ1YfiRcPC0+KrARymwWtdjRY73ob2ZqXfi3A+tFH
	I4MQpDJyz6d+MVAp+YB4S2xZzJJVaWU7Ig+z68b+zdpZw1G9Y8HucBYBQY9gcchKf38z4E8+2Ef8X
	I4S41Afy2Iqw448FC62Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBD61-0000000HH9B-4C4J;
	Tue, 21 Oct 2025 14:12:18 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBD5y-0000000HH7y-37xU
	for opensbi@lists.infradead.org;
	Tue, 21 Oct 2025 14:12:16 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-88703c873d5so219748739f.3
        for <opensbi@lists.infradead.org>; Tue, 21 Oct 2025 07:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1761055933; x=1761660733; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqNTUlkYM+2RoslawQSvvZZIxdXnaCIsRKpW4CjNw0Y=;
        b=xYI9YNYhnHe8tFLnS5LGCglCYG4NhYKvGF0JvTGUdbLjkIJ8M3MpksUPSHCW4fRil4
         5cqlr2iC+A3HCwF4x4IQ2BPCzRvjzlVDFopomS4ZGdZqKiBC8XmB03uYzBFazkgOEkU6
         arsb6CV/iL1IuZyXKsQtEGwW1fhImC7xcc3hN+r7ot2aAj+t8W2gArJ1PLbMweOaqf2t
         7XkZEeqrbKg3W2o5tBipYqWXs9DpgVo8MimvxxfM9h0wb9+cnU/DzdgBs1gqiolTZ6H+
         M2Fr+3vxZIy+jFIzWjxacCNYNtCbGUvHFBsnrLVdDz8SXnbQMuOWi02szyLgJgQcPulK
         xISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761055933; x=1761660733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eqNTUlkYM+2RoslawQSvvZZIxdXnaCIsRKpW4CjNw0Y=;
        b=tji1x1UItmrnNdAz7dVyXOFns6aIlM9z6bLsk04UPlXvO+kReAxsjrqqY0gKvFGPF8
         8lmDjkfwgqBzBKksDpY8bG6ionncw+HNSjMyWs8rmZ/EEycCR4bphAY9TxKZ71aRqIk6
         y2ySAhO/PKJluK0TaMKITSWqFqSye45Ti6fp00maDn7GOF1pFKhFlCf0zdfgRNYKh2dp
         UvZ+yVpAP0CYgYcBCeqoxpVDaXDCulhVT8ubkNAsostyBdBq8OyqVMIrDhBiyjPqRByc
         3PMvdpqOUxadWmxMJNx9w8nNM0irKyRtKf06jPL1NBxGN+YWwLFvbKczoTlIe9g2FG28
         LV9g==
X-Gm-Message-State: AOJu0YylzqA6M+kRF5rFnLSTges+fhfwr3ks9mMSxFqWvM4uOoc6DKaK
	dq5HtH8pasb28VmNtnq6DV6TexcoX4gXkIgf89WjS/w+ONeqnPKLw+OmxUvxyffPnftgXteHMI+
	d8q3MjEVfg/Iok20MN5D35fAaf4hevEB53Vk1ubMjqQ==
X-Gm-Gg: ASbGncum5GhatkNY+WuJJLCO7fist6BLn4Qc3nYxmVS13amrJO091wOKe45GAEeTlRw
	5fFGDg7KAIv9atAD5I1RVUkCYCPJaT6C07QEhER8qaIbPO1ATMq7zjxoh5flGUALA0+cpJgsMOd
	tzNTRlcyYH3gTQP7mtEotIILju8vjDZ4LgPgoBaTExwhsx/LOhp/yAWvkKsjKztuf4TaJwwnM7N
	iQ0714Jo9V8Y47rH8B0qM0vwZiFzf4m0EMlSQyX7WiHIEiErjCdrc5SlDb3lEskp4ZGa8IqNwPw
	WXjF7oOFljnYN7gVaOb6YQEmMLqz9f+3JaztRGwMO99jpPyRKWc=
X-Google-Smtp-Source: AGHT+IEozdiqkwO6BBphGEnFAYFipc7cv4MyIP9wslWQlZ3WLrN5G+Y8cgEx+zSt8a6HMyu7Qj3RJvws2MP2dE5YR6o=
X-Received: by 2002:a05:6e02:1fca:b0:430:ab63:69d6 with SMTP id
 e9e14a558f8ab-430c527dc00mr217890325ab.21.1761055933437; Tue, 21 Oct 2025
 07:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250917105224.78291-1-yongxuan.wang@sifive.com>
In-Reply-To: <20250917105224.78291-1-yongxuan.wang@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 21 Oct 2025 19:42:01 +0530
X-Gm-Features: AS18NWCPPnhRXHKOt0zq4Ipz0AHch5Zt1eQumbD2bJ-GzhPBDrk2NKscgrOXVCo
Message-ID: <CAAhSdy0AZShKajfUP-hL1JnA1LR7nvWeqLrSyO5LWHHi0o3o2g@mail.gmail.com>
Subject: Re: [PATCH 1/1] lib: utils/timer: mtimer: Add SiFive CLINT v2 support
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: opensbi@lists.infradead.org, vincent.chen@sifive.com, nick.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_071215_024650_7F451B5E 
X-CRM114-Status: GOOD (  16.05  )
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

T24gV2VkLCBTZXAgMTcsIDIwMjUgYXQgNDoyMuKAr1BNIFlvbmctWHVhbiBXYW5nIDx5b25neHVh
bi53YW5nQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gVGhlIFNpRml2ZSBDTElOVCB2MiBpcyB0aGUg
SFJUIHRoYXQgc3VwcG9ydHMgdGhlIFppY250ciBleHRlbnNpb24uIEl0Cj4gaXMgaW5jb21wYXRp
YmxlIHdpdGggdGhlIFNpRml2ZSBDTElOVCB2MCBkdWUgdG8gZGlmZmVyZW5jZXMgaW4gdGhlaXIK
PiBjb250cm9sIG1ldGhvZHMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IENoZW4gPHZpbmNl
bnQuY2hlbkBzaWZpdmUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFlvbmctWHVhbiBXYW5nIDx5b25n
eHVhbi53YW5nQHNpZml2ZS5jb20+Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBZb25nLVh1YW4gV2FuZyA8
eW9uZ3h1YW4ud2FuZ0BzaWZpdmUuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVs
IDxhbnVwQGJyYWluZmF1bHQub3JnPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9v
cGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGxpYi91dGlscy90aW1lci9mZHRf
dGltZXJfbXRpbWVyLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4K
PiBkaWZmIC0tZ2l0IGEvbGliL3V0aWxzL3RpbWVyL2ZkdF90aW1lcl9tdGltZXIuYyBiL2xpYi91
dGlscy90aW1lci9mZHRfdGltZXJfbXRpbWVyLmMKPiBpbmRleCAyMjQ1MzRkODljNWQuLmUxZmQw
NTE5NjRiZiAxMDA2NDQKPiAtLS0gYS9saWIvdXRpbHMvdGltZXIvZmR0X3RpbWVyX210aW1lci5j
Cj4gKysrIGIvbGliL3V0aWxzL3RpbWVyL2ZkdF90aW1lcl9tdGltZXIuYwo+IEBAIC0xNTUsNiAr
MTU1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB0aW1lcl9tdGltZXJfcXVpcmtzIHRoZWFkX2Fj
bGludF9xdWlya3MgPSB7Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmR0X21hdGNoIHRpbWVyX210
aW1lcl9tYXRjaFtdID0gewo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJyaXNjdixjbGludDAi
LCAuZGF0YSA9ICZzaWZpdmVfY2xpbnRfcXVpcmtzIH0sCj4gICAgICAgICB7IC5jb21wYXRpYmxl
ID0gInNpZml2ZSxjbGludDAiLCAuZGF0YSA9ICZzaWZpdmVfY2xpbnRfcXVpcmtzIH0sCj4gKyAg
ICAgICB7IC5jb21wYXRpYmxlID0gInNpZml2ZSxjbGludDIiLCAuZGF0YSA9ICZzaWZpdmVfY2xp
bnRfcXVpcmtzIH0sCj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gInRoZWFkLGM5MDAtY2xpbnQi
LCAuZGF0YSA9ICZ0aGVhZF9jbGludF9xdWlya3MgfSwKPiAgICAgICAgIHsgLmNvbXBhdGlibGUg
PSAidGhlYWQsYzkwMC1hY2xpbnQtbXRpbWVyIiwKPiAgICAgICAgICAgLmRhdGEgPSAmdGhlYWRf
YWNsaW50X3F1aXJrcyB9LAo+IC0tCj4gMi40My4wCj4KPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5n
IGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlz
dApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
