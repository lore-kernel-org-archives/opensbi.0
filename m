Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB0DCD98CE
	for <opensbi@archiver.kernel.org>; Mon, 15 Jun 2026 05:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bbo7ZzwHr26rNUfEU2iYSiBwEZUh+cnWV8rctzDD1Dw=; b=pxKcSTuv00s34j
	5O6ksgDZFyXITCwSRJTgtJRTnmYjUovv/haN2nn8UWMTlsqpxMn2fAsJLFTlh7bvo8YPJ+eQbaNK7
	6LK0HVHQXP863AfDuxA+pWXp1aiPAcw7xT+KaTF01eC0D18ixxQnnBjXWHiOxdhAZgxcKlxn5oyJv
	RlMn6BlMN8QglsUVtPwGTmRuHjuAiZ/JVA+rgzF0VgEN5w/ebSUuAtdS6rWYRPXAyipU6LXkTFevJ
	5fkw3LT6+uDLu0rKkitQKK7PmIvv8Sx7u8lRITJ64v9oRluP+dDJFUWsi3s6OwKurIjP+YShgXT4R
	g6YrOCNPzh4bdN/FIvdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYzbB-0000000DbRQ-0nOK;
	Mon, 15 Jun 2026 05:11:01 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYzb8-0000000DbR2-1ktB
	for opensbi@lists.infradead.org;
	Mon, 15 Jun 2026 05:10:59 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-396779b9a7fso24735421fa.3
        for <opensbi@lists.infradead.org>; Sun, 14 Jun 2026 22:10:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781500256; cv=none;
        d=google.com; s=arc-20240605;
        b=MexEf9U307lSA5/fQ5rKHNyw3oDFGf8o5T23Qkgn6eGJI4Jt5+rlMgKGIX9W0j+EWD
         ZCfzEBMeb0jCuoykD3m05WAo44oabfKLJeAtV06HhHnWY5p581rL6cdo5NvGKayZEky3
         stmeOyanG8RfBQsQaA5rLzEyvS2xuhiOtDNkURITeZYa5c8T0BCSRJA3+hxwFhnZjUtc
         CGneseX3VkOk/Nsv/kr7FqDY0bF2EVDPqaYQ3/ozbKyLLZbFPxNFUtprOT8FRLZtXeXS
         xwG8sVllVLqWLz/KBOKlp23/W/X2PbIeY51hXma57IMghJPrw7qBMKiK0RD6e2JItgGk
         tX6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bxj8za7Ger+oYVih4GfDS4G1muAoiW6EA91JENu+1ao=;
        fh=ZUCVRyJ2PWR8WNJ1T6MeVivkagh4ZGRDNugnfrF7aTM=;
        b=i10Czp+9aoDE8kRAz4daW7Cq3+oGvvSnJ7ftGKCyzC+4gDxkm/ZBFuaNCBUqYghM0z
         5MJ1VnoLGDL7ArqJijmy4l4LFIAwm+iif0s5r7znJZ93OuXWFaadAzY72hJa5yNW3zJS
         UZQ0/BFv6RVCyi/lyOWdI/7G+mc2UxpK1647c7bQu0yC4ZIUGyPXtdaPJUckkQR5BkRi
         LkWIMs+sfpDLpvqEgAJCN786dQsZ7mTNx7EiEP+16aXr2Ss0wLmLqyjfUFuCb5C9Ca8S
         h92rTcj3bbpgsnYe0z9A4/nGI9/YviSiklNPZ+Na6JMLtfNVVyxHo7tTsELsYd3Iceua
         j6eA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1781500256; x=1782105056; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxj8za7Ger+oYVih4GfDS4G1muAoiW6EA91JENu+1ao=;
        b=dTrQ3ekjUlwfyOXMX99jSw4oP42epWPu92kkZssf9rZvSgu0nPdy+i6rQ7lEgZftZb
         z12gMzPqedSPA7Q1Bae0eKrreK1FtnqbRaoJwwx2ltgcXURfeDa2p2quTRB7kqkER5Lc
         RDNksrBL+Obak2fK7e045uxM0qAf9vUg1FMwDmAz3mdc2MnDYChYiLPYw1vvOrczfqkj
         q/V6DMj0tpFt3Dm6C2bHJI32acFIMUCM3mPD29TC5n5in+0k+nFYICks2fy4rwMCUimM
         M9j6SZrkrzm5UgH96uaqFKdoVbkO/mZpc1xjEB/wI42q8vdaSYRDz3NChw2p+7BeMVeS
         cQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781500256; x=1782105056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bxj8za7Ger+oYVih4GfDS4G1muAoiW6EA91JENu+1ao=;
        b=mTgCxftZ5sEuC6Wz7P2CBAUr0FfRyITTphs81mKEQ5Hax2vivaeTEshMkyk0mPSZNN
         hcgTfsDTS4eUafgunSxyyHUoZnnCk/FUNdyp43SpjwmXHWK5SJIlVhfqGC7TqUT4I1Cu
         RbzwddqlnEAllV05ttivM5deAkhcXSpm79qcYnnANR6i32h/IvixgqxIsRtZFK/06bAp
         gBMTVhVIV31LWDC/1X3naxJ+Sn+WeTH7BMJM30zqv+yflKkzvqpRedKQ2CwKdhJ2n02b
         I44PEFD6Wf8Bks8Uzqz+4QYah/sGljxnPFqUXIyWERx/PNPLXpPJPUPDazatQxBUPaZi
         T3XA==
X-Gm-Message-State: AOJu0YxDXwoJcCBgaTH2Vtk3VfznyDV+5f4Km9P0XfKmJQN+ARa1EWxi
	KRqvrXkar5so0avLtzrzBSrL9weOKo/KB911jf8sU4z2uz/A83vunJX/GJQXxR7pwpllNSL1lAs
	7HYATF35hQkD8dVgYHSdSsyh6b6xHSIeEYZUGPaKxAKONimEZLF7j
X-Gm-Gg: Acq92OG920gSo5zC7OgQHO9YWaLrQqavoVjuCdRK21HuEkwa33MTv5D/rYVU6c6GSJ1
	488ZCEBcmkR4l6hVxeJ7rdgj9XNtozGBytF47u9N82zCrWJo4vbr/JvjHJuUbpWRTAj45PhXB6O
	MnbJwVES2i/Dnk7rdVq+Yc1pLeEHDL5Rd2UH34hhHVpL93oKMNI2+NLRkcr+yJ3C9jXVCjghh5K
	NpwLH7U1j3zX9qFSeNbLwQuWsPy3upx6S3qP0Ih9dKXneKIuoAOPgHPCi+DFlLt7eFI4osB0EVJ
	WEcPJ/qJqiPwZTsUMG5Bg60+KR9WwKdQykF8TirT/Q==
X-Received: by 2002:a2e:bd8a:0:b0:38e:d3ec:4f91 with SMTP id
 38308e7fff4ca-399355994c7mr22424511fa.8.1781500256331; Sun, 14 Jun 2026
 22:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260605075708.96-1-ganboing@gmail.com>
In-Reply-To: <20260605075708.96-1-ganboing@gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 15 Jun 2026 10:40:45 +0530
X-Gm-Features: AVVi8CemBIuaDPMieUYm2Kh5jgATdHvxK-Pz2S5K8sBHopon4ScQine1fyqNWvE
Message-ID: <CAK9=C2WgFWKsLdZUcSmNHcNd=oczDY6GDpiVDO1rk3zeOLCxZQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Fix eic770x warm reset
To: Bo Gan <ganboing@gmail.com>
Cc: opensbi@lists.infradead.org, nick.hu@sifive.com, linmin@eswincomputing.com, 
	gaohan@iscas.ac.cn, me@ziyao.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_221058_562763_05ECB97A 
X-CRM114-Status: GOOD (  12.41  )
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

T24gRnJpLCBKdW4gNSwgMjAyNiBhdCAyOjEw4oCvUE0gQm8gR2FuIDxnYW5ib2luZ0BnbWFpbC5j
b20+IHdyb3RlOgo+Cj4gVXNlIHRoZSBDRUFTRSBpbnN0cnVjdGlvbiBhcyBkb2N1bWVudGVkIGlu
IHRoZSBTb0MgZGF0YXNoZWV0IHRvIGZpeAo+IHRoZSB3YXJtIHJlc2V0IGlzc3VlIG9ic2VydmVk
IG9uIG15IEVJQzc3MDAvSGlmaXZlIFA1NTAuIFJlZmVyIHRvCj4gUEFUQ0ggMi8yIGZvciBhIG1v
cmUgZGV0YWlsZWQgZGVzY3JpcHRpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBCbyBHYW4gPGdhbmJv
aW5nQGdtYWlsLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGluIHYyOgo+ICAtIENsZWFyIHRoZSBkaXNh
YmxlRENhY2hlQ2xvY2tHYXRlIGJpdCBpbiBFSUM3NzBYX0NTUl9GRUFUMAo+ICAgIFNlZSBtb3Jl
IGRldGFpbGVkIGNvbW1lbnRzIGluIGZ1bmN0aW9uIGVpYzc3MHhfaGFydF9zdG9wCj4KPiAtLS0K
PiBCbyBHYW4gKDIpOgo+ICAgaW5jbHVkZTogdXRpbHMvaHNtOiBBZGQgX19ub3JldHVybiBhdHRy
aWJ1dGUgZm9yIHNpZml2ZV9jZWFzZQo+ICAgcGxhdGZvcm06IGdlbmVyaWM6IGVzd2luOiBBZGQg
ZWljNzcweF9oc20gYW5kIGZpeCB3YXJtIHJlc2V0IGlzc3Vlcwo+Cj4gIGluY2x1ZGUvc2JpX3V0
aWxzL2hzbS9mZHRfaHNtX3NpZml2ZV9pbnN0LmggfCAgIDMgKy0KPiAgcGxhdGZvcm0vZ2VuZXJp
Yy9lc3dpbi9laWM3NzB4LmMgICAgICAgICAgICB8IDExOCArKysrKysrKysrKysrKysrKystLQo+
ICBwbGF0Zm9ybS9nZW5lcmljL2Vzd2luL2hmcC5jICAgICAgICAgICAgICAgIHwgICA0ICstCj4g
IHBsYXRmb3JtL2dlbmVyaWMvaW5jbHVkZS9lc3dpbi9laWM3NzB4LmggICAgfCAgMjAgKysrLQo+
ICA0IGZpbGVzIGNoYW5nZWQsIDEyOCBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKPgoK
TEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKQXBw
bGllZCB0aGlzIHNlcmllcyB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtzLApBbnVw
CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
