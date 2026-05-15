Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7751CD4851
	for <opensbi@archiver.kernel.org>; Fri, 15 May 2026 07:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nS6tAcGPCK1yod02vRD/NOfcdDaS9moDay6vrz2oCEk=; b=AsuBj1QBa7ZdAm
	NrX1qb9N/i7dwbNmnWAa5L9qplm7Xp3FN/kWb8HAyb6PLUcxpQZ0x2olhzdfG/yq6I9PgF9cSlLwA
	SXVNN3lFaR9yiq4WEksp1aQwPx1W4f965hV5we3rw0hPl1L9AT23J0N9wN9vAPfvBB9oSW9kdp//F
	6RNiyjBiQjLtAmE9dZ+8Jp183z9XugkwBeLsNe2LpCo1uUvstRy3atKNZq1nlgIYTqc53F3vyFxYS
	ru96o8T+X0bWYgkweSsBz3XeJ1PHJJOodNSkd2G7A9cJu6hs/puoGg712oU/cJtKBl8nWBEip611J
	twoxmG3PIqlk481sR+XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNnQF-00000007fvJ-2Qmz;
	Fri, 15 May 2026 07:57:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNnQE-00000007fv7-28Ro
	for opensbi@bombadil.infradead.org;
	Fri, 15 May 2026 07:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RVhojxApaxz4l3sv2xu04iMf8ZN5wCS5DAmDc4lnTns=; b=SRSGIRLis3bo0pBwLGBIXMn5TG
	/w/S0Y1TFNe/1e0iQfpxZO+C2sDMN6bFSma8am4uuUyxbh1ojAibSiUlV9cDkrTq9JiOIutdxTPEM
	EYf5dqchytykJgEApzJUm1DtwnMuceuH/VkBGKNaLaIemSuxidXkNd6eLoo6D7wV6xWvcEWkmQwKi
	ypOHZJ774zMMEAugxg3AeVPG/+oepmDhWm/IUwJCCV6v64mF8IonKEph9cuWLHaysguMk7IrvWYDr
	fu45fQyEIcKIVWSMErEMdIcZQ0gW3zJZEJ7AYJBy+wBvQmlnl7PlKS+y9OI2/9qQ1bPTJbl5eqJKc
	QuGBKA4Q==;
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNnQ7-00000004YoS-260X
	for opensbi@lists.infradead.org;
	Fri, 15 May 2026 07:57:25 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7dbe437b072so5260782a34.2
        for <opensbi@lists.infradead.org>; Fri, 15 May 2026 00:57:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778831837; cv=none;
        d=google.com; s=arc-20240605;
        b=g79qmDqU7tV7ugDJIRzevTTBs5MS9DLiwnzsA/Dj05XccGuvgGwV+aXV6v62AN7RDy
         IJeAQc9JQzbcr2mUx8o6MIC1TG6y2Wn5TAEbvRWK8e3sB/jqBVGGQ4jr5kyYWTezWANx
         S5wEwNbraGvzleM9PuWND3Dm6WksMRoNtzEVYe2Qfy1zKKLL3c91ChD20W5uEIzx+9Q0
         JOxgkRjur2yRWQ1MwxHgUczsjlMiNtYIv3iDLQbu4xMdN2jZSViLkT730KmlGTe5NoA9
         6nxPh/jfYQRQUcSFgJCdATgU2k3rnILlZ0BenHOfW6UBcl/8LTGBe7bRKlDKZvEuoPmL
         5o7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RVhojxApaxz4l3sv2xu04iMf8ZN5wCS5DAmDc4lnTns=;
        fh=2UT0Xw5hZrX/E9k4S4NJ2WCXgJ/dX56r2D7JCM1pbbk=;
        b=UUQwFbbkdZ5RCIMdLQ3wfZUnZmBK4iNy2xa+9nb/40Y42u4Ir6km2ya3q7PyeerWwX
         SM+M9IBCrKGGaro24TJRvLVwXu6L7kCLJnRD8ppkVqPHHak98qx0lc4IvaEQjQd9Nm7e
         u5xzLchXfx6OVAZHzEUtZbj6EXmaKjY81iXw5LgK7GlPtndt13F3axrvuG0NzxSEb0Wo
         3nqmSTwFWwrb/mZK4CWLPngOIjWUM/GWzoBn/z3dsRAlp6lXhMTzaOboJ8CNNZ6FB3Ya
         gJwm/Q90v86Wb0MHLeA+w3dabO6v4ggpa7poURaaMEDSf6X8J6SMb+a5szv3LWsZ/95D
         2Wxg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778831837; x=1779436637; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVhojxApaxz4l3sv2xu04iMf8ZN5wCS5DAmDc4lnTns=;
        b=dR7qBuZnEx+X0uWGt5NLcVp3r/9izuDyDOAw71qD/beGuc1+c0K0XaSWoK3gUrYe2Y
         F55sFT1UoKaV/O4iDNyez9IBZRmEYQuZDosC1ACgPpcdqoRip476LibWIQWA3n8ttrE0
         9bMkm559zeSZ4r1RAO352hvNHCsMXYyGJF5hCtpSgIxmV8Q+zmSmDGwh3wic3ZQYi3A7
         p3RpQuAKG574eSYJ1qkWH6QIB6nAs1OR1bt+krs3A2rTHBtmMPOsBq/zsMll/7pObcmK
         b3A65V4WSXv7eORQJaxIv7Jy25CLDfoxFTXN50B7JAFVWPIAN95Y4QT7LVK/x4uGziaT
         9MyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778831837; x=1779436637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RVhojxApaxz4l3sv2xu04iMf8ZN5wCS5DAmDc4lnTns=;
        b=IPq0qDGEdGPTeOdTxvenPhaY/yZpP30lM7DIY2ENfbMtcgIHWRGtpwVeNEMrTfgoGQ
         5c9eZZyIxHZbALBaMl5jtIYGVIaLMOuNImtyKj7tSMVY3D5Lgz0kPH3lSKX4qgGD+9Sw
         6CR+c+RxCsjtTmNHa1CNVcU5SL3paN8rVHKiUdbNQU2CGeSPD8S7yrKAFXH7WVfxK2LZ
         Lp57JMLcBrQCSZC6z0erfFhWD23rvfvfDNT//J658dWfYHZ5uiKkrnYR3nOeL6MiDPQw
         friEdaUeI6qtbu+hppH6OrVrynP/l2tBB5I6ERLLoQ0zBVUw5zLtjeDh6whwirhVYatz
         yYxA==
X-Forwarded-Encrypted: i=1; AFNElJ8oRTmeFq8qHm0Pbbv9ZRBOFOmjp+oUT8ju3veNxG5mCc+hZmv99pXm0/QWarb79UbzVYq9pthb@lists.infradead.org
X-Gm-Message-State: AOJu0YxjF5qmeNlJ1i8luH0GfsWCMNEJm/SkYxqfIQFCwtv8ir+jKJoW
	7EgGRMyV95AasSx/0KuEgEeLmjmoR3Zavu4PgHSRtKJFEUIfRxmPdM1qcAD8otUHK0sgGngKAw8
	WuXgMS/aCqwbMB86sHcr++gduQhTNiEwWUNueiRJypA==
X-Gm-Gg: Acq92OGeVG1pvrIa3hCrTAD/vzdzM58EjNM6ghgpIa7N0b04cAaStJMXhRZIpOW1/5M
	C2LDC4zPRFp5I5Z32+CNLLqUj70w2bHXK1Hx2hUiqYtbAm+ZEP5hkuF3bTCIcZAg3lJsOyI0Ex4
	+ffG0eVmg0Vjnsjxl0elRYnawfdL6J1R97tb7Kn0lSe1RlMtLiQ4TmbR3+d4HUzAUX6v+WDBx0T
	HeeNLG0mDTRZuOQzB0f0z4ei9udxzam1I27DAKkk23CDebFJ/oxErdda0QJ43KaiRcoGhhyqMKr
	knditky3JGfDZofAzUrwVZcJnEBWMyRpfELvobJ+urXEEY3xO+qJtWdLpqYl0zTDBpsC0APMV+h
	MlSrFMXaVaZB7/mwASsXYCRfQ6k1GiHUUfHgTFQ==
X-Received: by 2002:a05:6820:4c18:b0:694:852a:28aa with SMTP id
 006d021491bc7-69c9bfee50dmr1655352eaf.60.1778831837199; Fri, 15 May 2026
 00:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260515054208.151045-1-dave.patel@riscstar.com>
In-Reply-To: <20260515054208.151045-1-dave.patel@riscstar.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 15 May 2026 13:27:06 +0530
X-Gm-Features: AVHnY4Ka09db_DCv1a2JG6Jah6zKPf_u0GnDr4pH0vCEqpnobGqMD2TpXe_88l0
Message-ID: <CAAhSdy1xoLkPS+gLxds2ZA1_Yq-rx++Zas39nQ=tR7-HafQHHA@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Add eager FP and RISC-V vector context switching support
To: dave.patel@riscstar.com
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Anup Patel <anuppate@qti.qualcomm.com>, 
	Scott Bambrough <scott@riscstar.com>, Robin Randhawa <robin.randhawa@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Ray Mao <raymond.mao@riscstar.com>, 
	Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_085723_463076_E2BCB247 
X-CRM114-Status: GOOD (  14.20  )
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

T24gRnJpLCBNYXkgMTUsIDIwMjYgYXQgMTE6MTLigK9BTSA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5j
b20+IHdyb3RlOgo+Cj4gSGkgQW51cCwKPiAgICAgICAgIFRoYW5rIHlvdSBmb3IgdGFraW5nIG91
dCB0aW1lIGFuZCByZXZpZXdpbmcgdGhlIHBhdGNoZXMuCj4gSSBoYXZlIGFkZGVkIG5ldyBwYXRj
aCB0byBhZGQgRXh0ZW5zaW9uIFYsIEYgYW5kIEQgYW5kIHRoZWlyIGNoZWNrcyBiZWZvcmUKPiBj
b250ZXh0IHN3dGljaAo+Cj4gVGhlIGNoYW5nZXMgaW5jbHVkZToKPiAgICAgICAgIC0gQWx0ZXIg
c2JpX3ZlY3Rvci5jIHRvIHVzZSBjc3JfcmVhZCBhbmQgY3NyX3dyaXRlCj4gICAgICAgICAtIEFk
ZGVkIGFub3RoZXIgcGF0Y2ggZm9yIEV4dGVuc2lvbiBjaGVjay4KPgo+IEkgaGF2ZSBjb3ZlcmVk
IGFsbCB5b3VyIGNvbW1lbnRzLCBwbGVhc2UgY2FuIHlvdSBoYXZlIGEgbG9vayBhbmQgbGV0IG1l
IGtub3cuCj4KPiBUaGFua3MgYW5kIFJlZ2FyZHMsCj4gRGF2ZQo+Cj4gU2lnbmVkLW9mZi1ieTog
RGF2ZSBQYXRlbCA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20+Cj4KPiAtLQo+IG9wZW5zYmkgbWFp
bGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgpZb3UgY292ZXItbGV0dGVyIGlz
IHByZWZpeGVkICJbUEFUQ0ggdjUgMC8zXSIgYnV0IHlvdSBoYXZlCjQgcGF0Y2hlcyBpbiB5b3Vy
IHNlcmllcy4KClBsZWFzZSB1c2UgImdpdCBmb3JtYXQtcGF0Y2giIHRvIGdlbmVyYWwgY292ZXIt
bGV0dGVyIGFsb25nCndpdGggdGhlIHBhdGNoZXMgbGlrZSBiZWxvdzoKZ2l0IGZvcm1hdC1wYXRj
aCAtTSAtQyAtLWNvdmVyLWxldHRlciAtLXN1YmplY3QtcHJlZml4PSJQQVRDSCB2NSIgLi4uCgpS
ZWdhcmRzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3Bl
bnNiaQo=
