Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53265C3ABDD
	for <opensbi@archiver.kernel.org>; Mon, 19 May 2025 21:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4WZ6gSbM3hVq0CWIrqxCTS2vVV23Rhi4wyubkGxbOCE=; b=TSAf1tAh5pykKl
	FRVA3QkGnPYq0VrVNo5FbIgz8+6HYIeduf5xnFCMZx8mnCJmEk0RTvwPGrRuItMOW90M8fEidaWxC
	UaPLG4Hbptl3/1E1cUqeAfLNFejoPIwhCbC1hOl60RpKBXZcF15BvSfDbYu+AGwoVqmQQkmo2ovVF
	4pHkJ4qDvQKjW0R9SBK23tP32RqLf7kXXyd1llNpGthM2WkuS7iJTOWmG3U37GiKXfGLjNa3K3oP1
	5PNwxEMdAyzcSiT+2/8mLqvALFpdftkrqlhLXqklquJ0yYjuEQNLpXCRZ2RJnrG12jZKWsd/XHncO
	GWHsY+pikQypQQxnOoMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Gx-0000000Aca7-0at0;
	Mon, 19 May 2025 21:43:47 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH89E-0000000Aa7S-182l
	for opensbi@lists.infradead.org;
	Mon, 19 May 2025 21:35:50 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3d80bbf3aefso11020305ab.1
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 14:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747690547; x=1748295347; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jiworcqcLS3minslmcK2azFsw2dGfLqFTRdCD9tAwwQ=;
        b=NAEcVHrAgjI3Xp12DrXQBKoVn3AvcyuRvZQwfKyqQN39FEkAjEpwO2V+FgeBCAtKTq
         ZvjYTAeythBYJO+lj+bhGHnuwne9BZFT3aIOZ8p6xmJif0st0fsZvD4NEpHkNnlkNY+5
         DXPMioO0aBY4I4QfI8AF3LU4UODRSN9/Xb7txDys2snvsfJBRbmvXA0ZH17OnxSkyyN2
         L73kH6oShYTzrhuPQSG8tWWjtgtsvF2uGxdOj2YFIlMA5Ljjad+VU1gLfYLFPjIM7nuo
         q70kiKT9PoWtqCOzFPdE4zOLJunuUsGSjjMW/Fx6ZNbycrIfEG8ysiSgA77x0XtWzktE
         UHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747690547; x=1748295347;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jiworcqcLS3minslmcK2azFsw2dGfLqFTRdCD9tAwwQ=;
        b=UrJuu3+cgPcFR6vPKO0urL3amrBXKUMlm6ZylzTCXhsTMb9YXFTtyk96T/xc0eDU9d
         p+hBuw5pWihb8PuaJlUo83UkV6k9lQWqSlyqDeisPYD71gDdlKQaImpqD50CpruQK0VN
         YWFElUa23mzD2N0i0lm4RtfL2U/WApiWxUr8LBCzpCaTGOfT4ZpEYnkMeU7t16DQu0I7
         tp1zBHc2Xkx7yn+Iu+pjh7fKt438SmWwu7WTH92+gMP8LvHWGifc575DUb2cJgIUvXks
         PydE59Qmsbo7pOHCvHDlrYxB+oL7TQ3C8To2JqE6KP04WQRNYe+3s4Ze/Q997ZRDiIlu
         RXRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH6fRumnoXf0/RMDp3oW3c4U6SQZxe5/eZaH5skSRmadZco8O19WwFcY+WUsV4/5nalSpOchvK@lists.infradead.org
X-Gm-Message-State: AOJu0YwBO45F5h2zUut7hTWy1+x6OIQyozd2yjXY+/sKN6XBxFeqaCuG
	tOZ3NRMrBPA2zv8tbJRRLypy8gELqx1CI1M+2SAMt5euIGTFakCpqLW/o4wCjV+m+2U=
X-Gm-Gg: ASbGncuTO2g6vqnBXmKlR461DkozxalX/i8UDtefUVfqBcA26u9QSZHuXIc4MaklhBO
	RsxAeOcMXx4N63VGCoZf1CtnJ03NFaGWMQ2c8f8RP5oY7Jtmjx8a5/a8KxUggvlrv4zZwi2yGCb
	+7cyXgGynAScE0xk6NbnrVjEBKttrnWQoVANv2tTBZ0O49AKpyRBQC2Cc41oGUYzL2UBFBWL+yF
	ga2zNWZZv7/yLpJjUT7dW9yz7Okr6jhMxBOUofXhWv33DBdIAiVOiq8TdQDbrSGs1Qowpfc91FT
	zccQrUTkeh1dNH78uY3WopatIppSHr+hVHmceUjNCaIw85myaQeqvQQmZem+V3HLOtxSG4YQ
X-Google-Smtp-Source: AGHT+IFHuDzTwJ8Ti8Q+/UVyFm4SnRw1rzsucIzG5xCFzxZPlUUMHba+iawonCTphkkII8u8W65XXw==
X-Received: by 2002:a05:6e02:1745:b0:3d9:65b6:d4db with SMTP id e9e14a558f8ab-3db8430484cmr162573475ab.12.1747690547004;
        Mon, 19 May 2025 14:35:47 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.11.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3db843e06d4sm21730255ab.26.2025.05.19.14.35.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 14:35:46 -0700 (PDT)
Message-ID: <93013dc5-93f1-49c8-bc62-860fb4d452fe@sifive.com>
Date: Mon, 19 May 2025 16:35:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] lib: sbi: pmu: Remove MIP clearing from
 pmu_sse_enable()
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 opensbi@lists.infradead.org
Cc: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
References: <20250519083950.739044-1-cleger@rivosinc.com>
 <20250519083950.739044-3-cleger@rivosinc.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20250519083950.739044-3-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_143548_324363_894C68B9 
X-CRM114-Status: GOOD (  14.18  )
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

T24gMjAyNS0wNS0xOSAzOjM5IEFNLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4gQ2xlYXJpbmcg
TUlQIGF0IHRoYXQgcG9pbnQgbWVhbnMgdGhhdCB3ZSBjYW4gcHJvYmFibHkgbG9zZSBhIHBlbmRp
bmcKPiBpbnRlcnJ1cHQuIFRoaXMgc2hvdWxkIG5vdCBoYXBwZW4sIHJlbW92ZSBNSVAgY2xlYXJp
bmcgZnJvbSB0aGVyZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdl
ckByaXZvc2luYy5jb20+Cj4gLS0tCj4gIGxpYi9zYmkvc2JpX3BtdS5jIHwgMSAtCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX3Bt
dS5jIGIvbGliL3NiaS9zYmlfcG11LmMKPiBpbmRleCBkZWU1MGI5Yi4uNTA0NzZkN2EgMTAwNjQ0
Cj4gLS0tIGEvbGliL3NiaS9zYmlfcG11LmMKPiArKysgYi9saWIvc2JpL3NiaV9wbXUuYwo+IEBA
IC0xMDk5LDcgKzEwOTksNiBAQCBzdGF0aWMgdm9pZCBwbXVfc3NlX2VuYWJsZSh1aW50MzJfdCBl
dmVudF9pZCkKPiAgewo+ICAJdW5zaWduZWQgbG9uZyBpcnFfbWFzayA9IHNiaV9wbXVfaXJxX21h
c2soKTsKPiAgCj4gLQljc3JfY2xlYXIoQ1NSX01JUCwgaXJxX21hc2spOwo+ICAJY3NyX3NldChD
U1JfTUlFLCBpcnFfbWFzayk7Cj4gIH0KPiAgCgpUaGlzIGlzIG5vdyB0aGUgc2FtZSBjb250ZW50
IGFzIHBtdV9zc2VfY29tcGxldGUoKSwgc28gdGhlIHR3byBmdW5jdGlvbnMgY291bGQKYmUgY29t
YmluZWQsIGlmIHRoYXQgZG9lcyBub3QgaHVydCBjbGFyaXR5LgoKUmV2aWV3ZWQtYnk6IFNhbXVl
bCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgoKCi0tIApvcGVuc2JpIG1haWxp
bmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
