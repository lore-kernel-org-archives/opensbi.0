Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C8FD111A7
	for <opensbi@archiver.kernel.org>; Wed, 26 Nov 2025 22:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QXgdLcyMpojYLLmvzRFkc8shQbQSvMDCc/Hgkd9titI=; b=f++Aj0Ts1P8CUZ
	GzNB1hoBMrOodYuzu2hW/zGo9XAI/XP3AgT302GEmxac5jTdGJAfxTgnPzmYQ+Z7ISa9QI32rRBcP
	T1WE3sHoBwesZuDn9ZnzrSR1jW/3ynzL7KSHB3cNLBjXvBu1tDXuVsyvfGKrWT++6djscksSc5E7X
	CbHI/yl7r9ULAPUfFeZYY2BRCAu1WR1+HrnBoGh7D3qJzuwFc+O+9R1MAxbDZ2ovp2RnrW2rtZdcX
	meQJQoFlbnxD7dpY0Uz6VOUqdOjl+yHjUUrkMAJUmirqFNvi9j2AgjYgroJDibrXPl8rmdP10Dup/
	wXNwid3MCw0LzjdnB22Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOOMm-0000000FjdV-2vWP;
	Wed, 26 Nov 2025 22:52:04 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOOMl-0000000FjdC-0g9L
	for opensbi@lists.infradead.org;
	Wed, 26 Nov 2025 22:52:04 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-297e264528aso2779535ad.2
        for <opensbi@lists.infradead.org>; Wed, 26 Nov 2025 14:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764197522; x=1764802322; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ULGiKB25CKwmwRyObHg+XR12cIQ3dccWdPv8LeJUkg=;
        b=BmL20UB/F1v1/KhOeSr/Vqpf2yWlzT4r9Oa7AjvudiPy/e/KXqi3HedU22zRt/iI5H
         hZi1pBZN/R3p7qTbcQKOpPpX/3ELJ5zlo4ITHcyjOKO1snPsNYrrCzn2oMRMoC4Vv5L2
         ZPrLu/R+uylglr8yQaYV3un7h5sC0QDb3ciZIGtLAL5EJiV7ba/jnB+MQ61clzKX7nHd
         92OlzCCXFytodpuqfo6zh0uGMFWTorhRuJcyjfK+3WdnPN7OChy4+3Lfmjt2Mxf70Rf7
         zHrh+uyBbQPGCJDcGJ8EPEkhv84UMAdEkUrwpfytNo/dbyjGftBCxBq2Dx0Gm7BsDbqK
         m6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764197522; x=1764802322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ULGiKB25CKwmwRyObHg+XR12cIQ3dccWdPv8LeJUkg=;
        b=oJhwJUKUYIsNA531RUl2eF5xV2QE2R4aHDdhlt7HChmk4xKIpZhGMgCbyvoYGjdA+l
         QQa4xEvqkfqQ86sGD7WxKnw4aDpXL2b1jweY6ghR2jLvb7IlLU9nVKrguGZMj37DzUo4
         0Y/88qeRbAnkfW9kgPRBufdxTg9IbEwj5Ndg9f6PMa99yZNQFatzXmIV2zOR+tTwhxr+
         ojnHKupKuZ46P5JxOwbPplRYJxuTBGubcxDQLXPSpAU1t/BXkF3t6RT6+b2C0v9JGoov
         Zk6DgkHhEi+FZhlyodr7bKNYMooY73sIn4cHBhUrU9DL7QwXUAKVvriIUHMx9kYjJXs4
         vTvg==
X-Gm-Message-State: AOJu0YyI8uimPwGd/dfyUhsw3Y9MGw8r4NiajAKFsyK2Vwnf4r1/EWjg
	Ah/NLjXyQScR7IlQD58p+/2H7dQJ9LmY7waHzFeSV4NEvv0qUhGut1nq
X-Gm-Gg: ASbGncuqxcXliAq6+dIZwRkwDs7BHT+VVo5CVgCwE93BPdVVBcaQhSjorl0m72ZXD1k
	/RjoSkl3qGUbceWiyQqJbmOWHrU93pzBj6sAuzk/b8tirRuUDvxPB1ovIx3OQuNDyyHktRjOHkJ
	BOket9BGJnAHiF3IOCIeZxHoP5O0ehb/ivoJZ8fZmoB9BW0wuvexOHrGTFQvixCoilt760Mk6dK
	cy8GhlwmcII4uElqlRU4USJP7BRJ4AEONX/kVkEvsVlWRjPKtL2Hf89DPDNeTUn4MZUj1Uv6gSI
	7hM4opd6LZygdWppnG/nVZSnUyIQlXMj1ngeRSsbB6QSs7XUckcAJxu88j+wk9836QTtVL/Lkkn
	ERI6gkkYXTFYfiGxtcQFVsaxU2IV5Vvb4eFpA5PCHKDdgLB7JhdzyJh5UgPVfgkfxHekGdfNiMZ
	mORl+TSfd7vQHmxD89TlWQTyqLkyyCSBOU7I0geJceobKk9w==
X-Google-Smtp-Source: AGHT+IFWJeliZIM3bRLcbkjjgL6G6Mt0TRrrCoVBDA5h5scocTYzN6Rk5nULvyuDDCAnEJQeMLqvfQ==
X-Received: by 2002:a17:902:e945:b0:298:485d:5571 with SMTP id d9443c01a7336-29bab1d746dmr99361665ad.54.1764197521770;
        Wed, 26 Nov 2025 14:52:01 -0800 (PST)
Received: from [172.16.0.242] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b2bb7c1sm207388425ad.99.2025.11.26.14.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 14:51:59 -0800 (PST)
Message-ID: <018c4467-b637-4de9-9410-27b3de69f455@gmail.com>
Date: Wed, 26 Nov 2025 14:56:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Initial ESWIN/EIC7700 support
To: Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>
Cc: opensbi@lists.infradead.org, linmin@eswincomputing.com,
 pinkesh.vaghela@einfochips.com, gaohan@iscas.ac.cn, samuel@sholland.org,
 wangxiang@iscas.ac.cn
References: <20251120093440.4533-1-ganboing@gmail.com>
 <CAAhSdy1fEUk=2GWAWf12SR2r5vc3R+heg7sZMniTgYTjdu5Rjg@mail.gmail.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <CAAhSdy1fEUk=2GWAWf12SR2r5vc3R+heg7sZMniTgYTjdu5Rjg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_145203_228029_49FF6700 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

SGkgQW51cCwKCk9uIDExLzI2LzI1IDA2OjIzLCBBbnVwIFBhdGVsIHdyb3RlOgo+IE9uIFRodSwg
Tm92IDIwLCAyMDI1IGF0IDM6MDbigK9QTSBCbyBHYW4gPGdhbmJvaW5nQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4+IC4uLgo+IAo+IEluc3RlYWQgb2YgcGxhdGZvcm0gc3BlY2lmaWMgUE1QICh1biljb25m
aWd1cmF0aW9uIG92ZXJyaWRlLCB5b3UKPiBjYW4gcmViYXNlIHRoaXMgc2VyaWVzIHVwb24gIk9w
ZW5TQkkgaGFydCBwcm90ZWN0aW9uIGFic3RyYWN0aW9uIgo+IHNlcmllcyBhbmQgaW1wbGVtZW50
IEVJQzc3MFggc3BlY2lmaWMgaGFydCBwcm90ZWN0aW9uIHVzaW5nIFBNUC4KPiAKClRoYW5rcywg
QW51cC4gV2lsbCByZWJhc2Ugb24gaGFydCBwcm90IGFic3RyYWN0aW9uIGNoYW5nZS4gSSBhbHNv
IGZvdW5kCmFub3RoZXIgaXNzdWUgcmVnYXJkaW5nIHRoZSBtZW1vcnkgcmVnaW9uIGNvdmVyaW5n
IHRoZSB1bmNhY2hlZCByYW5nZSBvZgpmaXJtd2FyZSwgd2hlcmUgaXQgc2hvdWxkIHVzZSB0aGUg
TU1JTyBmbGFnIHRvIG5vdCBleHBvc2UgdGhlIGl0IHRocm91Z2gKRkRUIHRvIFMgbW9kZS4gTU1J
TyBmbGFnIGFsc28gYmV0dGVyIG1hdGNoZXMgdGhlIFN5c3RlbSBQb3J0IFBNQSBpbiBIVy4KTGV0
IG1lIGtub3cgaWYgeW91IGZvdW5kIGFueSBvdGhlciBpc3N1ZXMsIGFuZCBJIGNhbiBmaXggYWx0
b2dldGhlci4KCj4+ICAgIGxpYjogc2JpOiBnaXZlIHBsYXRmb3JtIGNob2ljZSBvZiB1c2luZyBz
aW5nbGUgbWVtcmVnaW9uIHRvIGNvdmVyCj4+ICAgICAgT3BlblNCSQo+PiAgICBpbmNsdWRlOiBz
YmlfZG9tYWluOiBtYWtlIGlzX3JlZ2lvbl9zdWJzZXQgcHVibGljCj4+ICAgIHBsYXRmb3JtOiBn
ZW5lcmljOiBlc3dpbjogYWRkIEVJQzc3MDAKPj4gLi4uCj4gCj4gUmVnYXJkcywKPiBBbnVwCgpC
bwoKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
