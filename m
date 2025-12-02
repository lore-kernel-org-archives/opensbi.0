Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21039CFD376
	for <opensbi@archiver.kernel.org>; Tue,  2 Dec 2025 05:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G9Vt5pU/AB731u0PTfxq8vd/QYxuDYTP63CVFNI4aBQ=; b=ACMKg6QXsIht6q
	oGrDyqD7owjbTmJu2m9i5two7gpj9QDDvibfFefwVvngUw7O62AJrGKDRO2NfjQXgFM1oGP2yQl2c
	slzSFR36nAj0MV1P/+kjzNIy2beN2dVW8PtWtGx3JdwsvlWry7jIGBSXv8Dur2CA4BU4++eejxLH3
	D2/9PaYYGr3Bpd+vQVFhyYVlGz6A1Iw3B6kXjcUKQ85oUk3fnA9zLq1XpAthmqUDpBjzWvNfYQsHc
	HxsAvzVMob/aAvX/oxvyqr2gjvL2CrRUeD5OKEVWCsnmNITv1puPxeVoXlJUUyHxzdw9yHvdA4+Jt
	zmtdzLfQRnev+VM/ohQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQIon-00000004pRm-2ijq;
	Tue, 02 Dec 2025 05:20:53 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQIok-00000004pRS-3swA
	for opensbi@lists.infradead.org;
	Tue, 02 Dec 2025 05:20:52 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-45358f9df20so388570b6e.3
        for <opensbi@lists.infradead.org>; Mon, 01 Dec 2025 21:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1764652849; x=1765257649; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhe2Eb96YnMl7Y6H2LNBf8mkJaFHqRpI34KKgc6Rv+4=;
        b=LNa1poRkVrqWmeHh3T5LHpza9AnovnonyBiY3msIzxv8+mIFVTpqXLLxO3m8zRR1HS
         J8kEZHtUhNjs0xtmBCAaAK4ozPcxwt+4VSxZELXgAk++9cV7SgGaQ8tue149LUm8LYdk
         UyGEtNwzy22ffX5OKaUYPgJyX/9VJco3Ba4Yg57wTKvrNouhzXYDyYim627BGIBAYN4o
         AI/hU4JfMtben/iS1J8+elWl6QQzu5N/XMnu8hzuXpn2N4p5a9n6VMF4OABXCDm8rvzt
         Ie5TePPi8RQmpwEtJ7GCSLkzsQi8DeF9lcC2utForcnWzVwGTkqnNXgerpgM7+a1U+pw
         LHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764652849; x=1765257649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rhe2Eb96YnMl7Y6H2LNBf8mkJaFHqRpI34KKgc6Rv+4=;
        b=dvr/Bm7Z0Li1Iz5lZOvNPVbIQD+MMvuPCYJXLLWKn2WDpKZHv25/T8aLHNPYHQHJXU
         F5I0m93yNjWavPlnrHolWNLujLQ30XWWOByb6dCsUsaHf7oVj59rX6fKDH9cNUt16FxE
         i2g10iyXgknL9CHTcwQfY08LwpLF+WV9fiZIIOrpt+/ZRb1OLLHj7B1nH6ZE3UWALKON
         eNm8WI+F52bWrqkRvuyPEkxhv2uLm0mjIu8Hwpboj9CPxY+cCzwyi3HvmJGtQ15bEelN
         HjCmA592mftjX1qKSYYoGibLlYWJyYk4sVLHG+OPoOSxfUoZBOm6Gl1WITlXE1hjISU8
         IA0w==
X-Forwarded-Encrypted: i=1; AJvYcCVlVP4H2B/EGBHqBUS5MPZhv+BaiE9zuS7uW3qr0k1XiUrxdSClA+6AhKHylWQglnWtvepqrAJ4@lists.infradead.org
X-Gm-Message-State: AOJu0YwE+p7pAuo/K2g4P4KSnDgzsffaiHjMSFe3xriJbJVRqriKPR2Q
	yFrDouubmqQYor8q7wxWMFpcKHjkBIVZjiCSTKKTtznLcE8Zbhfuggk1daJjkdfjHkndLZeuMwW
	d3ZtO6VKYNJNVV00n+k49qK7sn0uf4roUZ7nbaiuknw==
X-Gm-Gg: ASbGncvJfxOGmG2O2+q+iqFyY3L83YsW3y6uYe7MGNyJi4FBfebVBszxLYe1ByLcMfN
	wrbKysQt+4+bVr7woOv/W11VfJWeQcgNt3NPQjPwmnbSXm5fZUsVPH/E8ylvJ2c/nWZxPP5/RgS
	O4fvYxm1YWsv8WEVOj0R+AO57J3BGmd7m+g/s29i64Grqrz61zVOcst21L2DEQIuCykWJa4WJo2
	WM6nQNOG6EXAcnDPCfTD6xDPAUCgxHbjez9qyuvabiX9J1xk+FqC+ap0/IIrd9K7cjMjGEq
X-Google-Smtp-Source: AGHT+IEC8LAsYVH3nfBta7I1gQOe7+j/h3a3gWGYGFm5S+PXMeHr3WkGycdS2vhJNBtNJ6C3LmcG9IklsHEfQGHqJ7o=
X-Received: by 2002:a05:6808:2e46:b0:44d:a4d3:b6a6 with SMTP id
 5614622812f47-45112bba21amr18122101b6e.35.1764652849257; Mon, 01 Dec 2025
 21:20:49 -0800 (PST)
MIME-Version: 1.0
References: <20251111092224.825282-1-vladimir.kondratiev@mobileye.com>
 <20251111104327.1170919-1-vladimir.kondratiev@mobileye.com> <20251111104327.1170919-2-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20251111104327.1170919-2-vladimir.kondratiev@mobileye.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 2 Dec 2025 10:50:38 +0530
X-Gm-Features: AWmQ_bkGkeDc9nDtWtJMYhfuQ2AxyqYrYX39Wum_GtZcmUEslHqlLWcmdXdITlg
Message-ID: <CAAhSdy2ayr1yGEULg059upOGdyQZ5NacVS6uLRtzw1TrvspvYw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] lib/sbi: fix covered regions handling in sanitize_domain()
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: inochiama@outlook.com, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_212051_279735_4829AEDD 
X-CRM114-Status: GOOD (  20.86  )
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

T24gVHVlLCBOb3YgMTEsIDIwMjUgYXQgNDoxM+KAr1BNIFZsYWRpbWlyIEtvbmRyYXRpZXYKPHZs
YWRpbWlyLmtvbmRyYXRpZXZAbW9iaWxleWUuY29tPiB3cm90ZToKPgo+IEluIHRoZSBzYW5pdGl6
ZV9kb21haW4sIGNvZGUgdGhhdCBjaGVja3MgZm9yIHRoZSBjYXNlIHdoZW4gb25lCj4gbWVtb3J5
IHJlZ2lvbiBjb3ZlcmVkIGJ5IHRoZSBvdGhlciwgd2FzIG5ldmVyIGV4ZWN1dGVkLiBRdW90ZToK
Pgo+ICAgICAgICAgLyogU29ydCB0aGUgbWVtb3J5IHJlZ2lvbnMgKi8KPiAgICAgICAgIGZvciAo
aSA9IDA7IGkgPCAoY291bnQgLSAxKTsgaSsrKSB7Cj4gPHNraXA+Cj4gICAgICAgICB9Cj4KPiAg
ICAgICAgLyogUmVtb3ZlIGNvdmVyZWQgcmVnaW9ucyAqLwo+ICAgICAgICB3aGlsZShpIDwgKGNv
dW50IC0gMSkpIHsKPgo+IEhlcmUgIndoaWxlIiBsb29wIG5ldmVyIGV4ZWN1dGVkIGJlY2F1c2Ug
Y29uZGl0aW9uICJpIDwgKGNvdW50IC0gMSkiCj4gaXMgYWx3YXlzIGZhbHNlIGFmdGVyIHRoZSAi
Zm9yIiBsb29wIGp1c3QgYWJvdmUuCj4KPiBJbiBhZGRpdGlvbiwgd2hlbiBjbGVhcmluZyByZWdp
b24sICJyb290X21lbXJlZ3NfY291bnQiCj4gc2hvdWxkIGJlIGFkanVzdGVkIGFzIHdlbGwsIG90
aGVyd2lzZSBjb2RlIHRoYXQgYWRkcyBtZW1vcnkgcmVnaW9uCj4gaW4gdGhlICJyb290X2FkZF9t
ZW1yZWdpb24iIHdpbGwgdXNlIHdyb25nIHBvc2l0aW9uOgo+Cj4gICAgICAgICAvKiBBcHBlbmQg
dGhlIG1lbXJlZ2lvbiB0byByb290IG1lbXJlZ2lvbnMgKi8KPiAgICAgICAgIG5yZWcgPSAmcm9v
dC5yZWdpb25zW3Jvb3RfbWVtcmVnc19jb3VudF07Cj4KPiBlbXB0eSBlbnRyeSB3aWxsIGJlIGNy
ZWF0ZWQgaW4gdGhlIG1pZGRsZSBvZiByZWdpb25zIGFycmF5LCBuZXcKPiByZWdpb25zIHdpbGwg
YmUgYWRkZWQgYWZ0ZXIgdGhpcyBlbXB0eSBlbnRyeSB3aGlsZSBzYW5pdGl6aW5nIGNvZGUKPiB3
aWxsIHN0b3Agd2hlbiByZWFjaGluZyBlbXB0eSBlbnRyeS4KPgo+IEZpeGVzOiAzYjAzY2RkNjBj
ZTUgKCJsaWI6IHNiaTogQWRkIHJlZ2lvbnMgbWVyZ2luZyB3aGVuIHNhbml0aXppbmcgZG9tYWlu
IHJlZ2lvbiIpCj4gU2lnbmVkLW9mZi1ieTogVmxhZGltaXIgS29uZHJhdGlldiA8dmxhZGltaXIu
a29uZHJhdGlldkBtb2JpbGV5ZS5jb20+CgpHb29kIGNhdGNoISBBIG1pbm9yIGNvbW1lbnQgYmVs
b3cuCgo+IC0tLQo+ICBsaWIvc2JpL3NiaV9kb21haW4uYyB8IDMgKystCj4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9saWIv
c2JpL3NiaV9kb21haW4uYyBiL2xpYi9zYmkvc2JpX2RvbWFpbi5jCj4gaW5kZXggOGNmNWZjZmU0
OTI2Li4wMzlkYTM5ZWNkNmMgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfZG9tYWluLmMKPiAr
KysgYi9saWIvc2JpL3NiaV9kb21haW4uYwo+IEBAIC0zNDQsNyArMzQ0LDcgQEAgc3RhdGljIGlu
dCBzYW5pdGl6ZV9kb21haW4oc3RydWN0IHNiaV9kb21haW4gKmRvbSkKPiAgICAgICAgIH0KPgo+
ICAgICAgICAgLyogUmVtb3ZlIGNvdmVyZWQgcmVnaW9ucyAqLwo+IC0gICAgICAgd2hpbGUoaSA8
IChjb3VudCAtIDEpKSB7Cj4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwgKGNvdW50IC0gMSk7KSB7
Cj4gICAgICAgICAgICAgICAgIGlzX2NvdmVyZWQgPSBmYWxzZTsKPiAgICAgICAgICAgICAgICAg
cmVnID0gJmRvbS0+cmVnaW9uc1tpXTsKPgo+IEBAIC0zNjQsNiArMzY0LDcgQEAgc3RhdGljIGlu
dCBzYW5pdGl6ZV9kb21haW4oc3RydWN0IHNiaV9kb21haW4gKmRvbSkKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZkb20tPnJlZ2lvbnNbaiArIDFdKTsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICBjbGVhcl9yZWdpb24oJmRvbS0+cmVnaW9uc1tjb3VudCAt
IDFdKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBjb3VudC0tOwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHJvb3RfbWVtcmVnc19jb3VudC0tOwoKWW91ciBQQVRDSDIgYW55d2F5cyByZW1v
dmVzIHRoaXMgY2hhbmdlIHNvIG5vIHBvaW50IGluIGhhdmluZyBpdCBoZXJlLgpJIHdpbGwgdGFr
ZSBjYXJlIG9mIGl0IGF0IHRoZSB0aW1lIG9mIG1lcmdpbmcgdGhpcyBwYXRjaC4KCj4gICAgICAg
ICAgICAgICAgIH0gZWxzZQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGkrKzsKPiAgICAgICAg
IH0KPiAtLQo+IDIuNDMuMAo+CgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZh
dWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoK
VGhhbmtzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3Bl
bnNiaQo=
