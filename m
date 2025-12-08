Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD115D3B7DE
	for <opensbi@archiver.kernel.org>; Mon,  8 Dec 2025 11:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ToTpCr7a45MtfzYblExFGdBsyTE12sPXyLPjOgmBMxQ=; b=3LbPM88sD8MZqj
	gfsWeevDykbxIRCi5ZX44GxCjD50YuxISy04cE4v2BomaPqLfxdJtJQxddZl8phxinhzyJ35Qpy/Z
	NzvB81r7cdWYKDI/rUBIv5xXjdiv6rHWZ7NkzsHVNqj7ZiGcaJtD9zR+/bHKHnD4GpHJrCYYjJlFf
	X/rMlaVGT89ehn9p3g8GYaMAjsEdKxJYVeXBjX5Dwe7kbTnbil5PVCvS9KtRHwV17gTj/zaziWjrp
	xjTWUYZDSETNarmZQqKa45O3WJmRnbTozMaxM8CeUKAol/41gWW6fiVyePdA6BaDqEBvpIMjZ158F
	HtbO1ftjDlrzB7MGxj/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSZ0s-0000000CyzH-3TtS;
	Mon, 08 Dec 2025 11:02:42 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSZ0q-0000000Cyyt-2FDm
	for opensbi@lists.infradead.org;
	Mon, 08 Dec 2025 11:02:41 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-65791c35134so2273166eaf.1
        for <opensbi@lists.infradead.org>; Mon, 08 Dec 2025 03:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1765191759; x=1765796559; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMnsziePPtbLw0iRceEuONbN55yxkcfWMKJ5zksOdXg=;
        b=Pe7e4VIVWTt+rC75BW428BnV+oL4t13nmBpFftOGuXCiTGzfATwr+OhgrwBxUZgKFJ
         qSr1ACqEFsAzaCsZoqTnOfFxAC7MzilQHfzgm1HEYC4IYP3Z5AhAMiJ5gbKFYQfnCeti
         /cuCVpgMGClAU3ryfUiZJhzGGPO2jHcni+YAFByLnEH8A16gx7CCDp5ZGb7G7f8MkkYh
         AnFAe9FW1mdkfzi6+w6jcQHpNOqecBKeLOKWG6o4VKTmnbdrEoBsh00BDMDc+b5r/4gI
         KLC/xFfTtWkeA8kiuDHDN2ARq+e7A4Rivs7YT9ZhIRvoy1k7JdlP+fkwHy2OlCoJlYAI
         afww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765191759; x=1765796559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fMnsziePPtbLw0iRceEuONbN55yxkcfWMKJ5zksOdXg=;
        b=I2UM3/6VMJg5YhFW540O17lOw5P5M9AjSSqZNBbkIlXR+s9fY4xMnmtvAuaeTST1Sq
         PHQXpfuEUBYu8qCb3zbcY+08gk+AZC3rvwEwjjLXEQ3mMSejPggrCie015drwkMbWCZZ
         2bbcYMEoD1bWsvwzZum/Kq19QKcsoH1xXckfP7CL0OfjEwLzyVUROpNsFewaacr7h+sO
         2yhUDzm/Ow5C7yuEFhtfIHw+YE2q4mUm8QehO1rxoPxf8zwvYq4Knb08N11R4E+fYKl4
         SRq+pN1LT7Yl6WLHSnlyke3qfOvaG56k/W/iObj4Za6LQt+bfQZX+vKQyQbjRd+632Ux
         nX9A==
X-Gm-Message-State: AOJu0YwNOHXuXTM2+TjlYgbfhzh4YHD9VAmi+7ANMqNNb6hKJz7tRV7S
	1d6PitM/l0w8iRl1iRSYfOWaRKhpKtV+1cROam8uvgaa/i3gdsbIbJaULzo1Gv372HJYKIBN4i8
	Cf+GsSJwFabcOp9rvsPmqOuuMn5VsFAxZHipoqDFYtQ==
X-Gm-Gg: ASbGncvYmXjY1dmWf7RiAoFVepEDjH+MZJ7f4iNW0xRhbssgISJJRjJgmpiSYkb1vhs
	VKPOLZzlW/wuLpV3Rj1Bw8vMx7LFckmwfrizbc+RqigjOSXXz64YqmwUfma0BwmCVr8qIhlLIX0
	iA14i5VGSEMhr2dlhrE+HIL8YG3sV5fVvCYZXoL9c319DyOVmo0/D4uYxvYicSIdf2GolqUIzMU
	8eAzI95iUNmmIDPFz1U2hgpym0qnR2JFdc+YReCrdg0SbY+PLALjrqiq+tXoJ1R1s2jwEtI
X-Google-Smtp-Source: AGHT+IGFuE3+lrbiQ7JM0SFSz+Mebcfgyfi2SJgQE821SH+9hHDYIojBcAvPJP01vF7bVPEa1LFy/0pa3aXeTRjqLbE=
X-Received: by 2002:a05:6820:1ca4:b0:659:9a49:8e98 with SMTP id
 006d021491bc7-6599a8c42b9mr3381907eaf.28.1765191759015; Mon, 08 Dec 2025
 03:02:39 -0800 (PST)
MIME-Version: 1.0
References: <20251114-sifive-cache-drivers-v1-0-8423a721924c@sifive.com> <20251114-sifive-cache-drivers-v1-1-8423a721924c@sifive.com>
In-Reply-To: <20251114-sifive-cache-drivers-v1-1-8423a721924c@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 8 Dec 2025 16:32:28 +0530
X-Gm-Features: AQt7F2roi5oj_b1wLeCYdeJQ4gkVZp57-6pce8ql9hwYs-8c2wepF7vN1d_B-us
Message-ID: <CAAhSdy2LZmyehLHNfS8W5_8+fA6iOFBTOFeUzEiX7SNTO8LFqg@mail.gmail.com>
Subject: Re: [PATCH 1/3] lib: utils/cache: Handle last-level cache correctly
 in fdt_cache_add()
To: Nick Hu <nick.hu@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_030240_705212_45D85B6E 
X-CRM114-Status: GOOD (  17.13  )
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

T24gRnJpLCBOb3YgMTQsIDIwMjUgYXQgODo0NuKAr0FNIE5pY2sgSHUgPG5pY2suaHVAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBUaGUgZmR0X2NhY2hlX2FkZCgpIGhlbHBlciBhdHRlbXB0cyB0byBy
ZXRyaWV2ZSB0aGUgbmV4dC1sZXZlbCBjYWNoZSBhbmQKPiByZXR1cm5zIFNCSV9FTk9FTlQgd2hl
biB0aGVyZSBpcyBub25lLiBTaW5jZSB0aGlzIGNvbmRpdGlvbiBvbmx5IGluZGljYXRlcwo+IHRo
YXQgdGhlIGN1cnJlbnQgY2FjaGUgaXMgdGhlIGxhc3QtbGV2ZWwgY2FjaGUsIHRoZSBoZWxwZXIg
c2hvdWxkIG5vdAo+IHRyZWF0IGl0IGFzIGFuIGVycm9yLgo+Cj4gU2lnbmVkLW9mZi1ieTogTmlj
ayBIdSA8bmljay5odUBzaWZpdmUuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVs
IDxhbnVwQGJyYWluZmF1bHQub3JnPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9v
cGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCgo+IC0tLQo+ICBsaWIvdXRpbHMvY2FjaGUvZmR0
X2NhY2hlLmMgfCA0ICsrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi91dGlscy9jYWNoZS9mZHRfY2FjaGUuYyBi
L2xpYi91dGlscy9jYWNoZS9mZHRfY2FjaGUuYwo+IGluZGV4IGFlYWE2MTM4MzA5NjBiNjdiZjVm
NTEyYTEwMWYwMjQyZDg2OTI4NzIuLjJhOWU4YTZkZDUzYzAwOGVlYzhmMzE5ZDBlMTljNTZlYTFk
MTFhMWEgMTAwNjQ0Cj4gLS0tIGEvbGliL3V0aWxzL2NhY2hlL2ZkdF9jYWNoZS5jCj4gKysrIGIv
bGliL3V0aWxzL2NhY2hlL2ZkdF9jYWNoZS5jCj4gQEAgLTIzLDcgKzIzLDkgQEAgaW50IGZkdF9j
YWNoZV9hZGQoY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9mZiwgc3RydWN0IGNhY2hlX2RldmljZSAq
ZGV2KQo+ICAgICAgICAgc2JpX2RwcmludGYoIiVzOiAlc1xuIiwgX19mdW5jX18sIGRldi0+bmFt
ZSk7Cj4KPiAgICAgICAgIHJjID0gZmR0X25leHRfY2FjaGVfZ2V0KGZkdCwgbm9mZiwgJmRldi0+
bmV4dCk7Cj4gLSAgICAgICBpZiAocmMpCj4gKyAgICAgICBpZiAocmMgPT0gU0JJX0VOT0VOVCkK
PiArICAgICAgICAgICAgICAgZGV2LT5uZXh0ID0gTlVMTDsKPiArICAgICAgIGVsc2UgaWYgKHJj
KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4KPiAgICAgICAgIHJldHVybiBjYWNoZV9h
ZGQoZGV2KTsKPgo+IC0tCj4gMi4zNC4xCj4KPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QK
PiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVu
c2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9vcGVuc2JpCg==
