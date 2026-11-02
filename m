Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2848606A324
	for <opensbi@archiver.kernel.org>; Mon,  2 Nov 2026 08:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bMQADgyR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=qdd4CazE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IKaOI4hjoCXgIix+gAFChfJUN6BxecxU0Tzr6tybYkY=; b=bMQADgyRL58mSLT2fiadvJ+1Ea
	IREWgyUs9fzct73dP9wXW3RUPpJUJ8HNPFv1LPrAHJeoV3pb2fomNJQbwCyiQBIdV6Q+w45yTomxN
	n7TKNL7YVtfBds8dcS0jjOVFDAUDbDuyKDlSrwjieUW244y+338W0vUEpPJlxtZVNmW7DwEDZWzbG
	uapeXH8R+shDofKEQcxGGjICyTeNwAtKJoVY1mZfJZ5BxLxP4S+sjTFqKTVlLCyEAz8/rnHpd3klx
	LGlFa9mFscYvkb0RSr2ycJRp6Ev+NuQXJuscQf9RaBTQsJWCTOJ3Gye1xk3N2Et1FcFaY8+5AA2M8
	xzEJh8+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmyj-0000000Foiq-39wu;
	Mon, 02 Nov 2026 08:01:17 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmyg-0000000FohU-0QsO
	for opensbi@lists.infradead.org;
	Mon, 02 Nov 2026 08:01:15 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso2385699f8f.2
        for <opensbi@lists.infradead.org>; Mon, 02 Nov 2026 00:01:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793606472; cv=none;
        d=google.com; s=arc-20260327;
        b=boOkkOqXQLv0ksXKGy1872xhTF8IIjZdKnJ5npa2yA6ccwnHd335hAIxkaIPvezZjD
         DM3QaEqsFv3J7CHaD8Y8ehr+MEcZVaxsOg72cTwZvWg+BELcxlwm6GblkJkieIq1hngI
         yBpBcm+ZNn5oFEMkONAlWGd6Qq2ZgHEnFHLmWvf7fmZ3k3VsE7oGKChvnWDNGPVDrMPK
         ymAe3KuW+cncHRXWVTiH4vtRjUdbGoJE7zlxBbS2BB8eCqOQfNA2faltpV01bmLfMPJV
         /hOe4v+dD3QqxbzNmp7mGrZVPMXcItwcjcJIbp/kxNczmLkAgnDUA+sKeJhqHsqJzDDo
         TVhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9DyccUop2UmLfC3NtTL8V8+kdt4/CEYw7RGtAg2YYpI=;
        fh=MNK+UZv/N1tvpVbGEdYFdJsuFfj0zKFU57cji/TIYNc=;
        b=SRKSHWAQnSGIc4lOGPR0H43Icn6nXZ3cREt3e7Z5mf9MVB7kdW+7qu0JvOHw6ysdfW
         XpuSSz24A6ht3bqT0vu/n+ZaYK/LFfIieKqVJn9cJ1oixHPuydJjUrGVmFpLlfRB7nh/
         qlo1nIcQjmltDtZ4o8DENxiwlt1xSUNwHwAJK3WxOR1lkCadZbwT/P9c0+2a80Ycyapx
         01GTul1VJV63cI7QZ42Tq9N8uQ6WO/Rzo0ZqhwnA35DDxOfuaMTpChnAuRtYuStm8YtP
         k+X+uFu0GvBj6yNKCtHCOYODOGhWobLTxpcQssWVYklTl5Lt9WHCRbZ043EuRCfVbVXt
         g/vg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793606472; x=1794211272; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9DyccUop2UmLfC3NtTL8V8+kdt4/CEYw7RGtAg2YYpI=;
        b=qdd4CazEMH015qdrQt5Y91XBIjjz3XmnIaJl76DOYmyGmJBcdfBc0L0/yDaW6Gs/vS
         T0nLuRvdnVR7d6vpIt5LrWObv6291zZbI3754Vu6Zf7c6iMo+IeAzU8qUas2IGi/NcTX
         HXOT/Ay8rQnMKE/d8mTAVUCyaQ2Ys0Fsl99ngG6lAfNKfslFHhWT4TE9HY3DMz8wiAmN
         VhOfJK462clB0fdMUepNIq6X5EkpP5ViPvQ2MMVqnkHDZNkpQL3GJ+57PYDy6wX2PZL6
         uFBiJRVnJ5F4MZQjQjCC44Ff6HrbsFE+ZNnFpmAOOJj5D1Cv809p288UD6rkHQhlITKj
         1Jrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793606472; x=1794211272;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9DyccUop2UmLfC3NtTL8V8+kdt4/CEYw7RGtAg2YYpI=;
        b=NBfITvjz/HhSuCxhpWU3TewT527J1jRpbHnpCYU+LYv3ebfQZLlqncZtud4xIniqdb
         vy+kUgoagNUy3t5REbvc24tz/eT2EHYvLvYSlqvmA9/WiHsh1pGjrt5eq3EaF4RbP+6n
         D1vlod3hE2Is8vTuDTbwf9RQYo5PCk1+OxY3Z2KtauvJdoxtO03q95RNTZeLSkNK4X96
         JZhuJLLCDOp49bb7fAGtW81q6m/+1oVo1FgNegpXaCUUvu44MfCW6BZVidhLIdE86OnH
         YbCIEjTOWTgEPpCUX2UawipBmw9mFvIRT9P6ZMBuvXCKTMmkuLDsCjqz9NSdFSmn7mbz
         ukkw==
X-Gm-Message-State: APuU4Z+igq6quRQaag+xeDcyIBKGSWqLjpNKwrWByg3L6gv5PAHQhLyP
	ApF/4S4KrCTs4v+qyzs5gy4crto4X3CVe0qYCJUj0Z0wOHfjPFcjusiIBCi9lAQX7Dct9BZIVsz
	bsbn48bhTp0+w9BTo1iLvo+FGn6DRBN+E4NWuqD9TMw==
X-Gm-Gg: AYBFou35Ea53QRvgP6gEciqF5qJ0z54iqZHyRZKQC2XIGT/DGKj+OIGHXpiLGiCf48P
	8yK3vvEa1IFr10WaYyqt2AGV9fvf9zLC3T1UTwce1QcW1jA6pUwgYmoo66uAA1A5kWvTH0L16hW
	qeNBVlJbUA73EFeWKdb2FtbmXRaTD6UT7JXBiex6Z45i02ciYlxtFX7uY47hGXTsezhNCNez9OJ
	34vnwtm4sx7BjhiyAYrY2K7MsiJ9LrtQMxrLZ7joPR84qkQu13wcCSrBf5LgNQZ+jswdC5tqxCy
	mueQ/v3eaI2wqsA1FabMb4b50ltDBHLTRL674qRZwdqK9/FlZJkXZxEePJ+VwwLolgCqRdaoRRh
	ANyVeq+ZJ6Dwsvu6KkTrRE6kiimNYKNRsjnAgxFeUzSmVVd6ZEoAEegLcluEpMQatXSvmQDlYGh
	b0M92mZeOOM6JVP8VzTDSIplGwEKwQBLMTtlZtND/wCEMvQ8GCBokE2N4B
X-Received: by 2002:a05:6000:29cf:b0:48c:4a62:9af7 with SMTP id
 ffacd0b85a97d-48e6e50090bmr12495238f8f.28.1793606469399; Mon, 02 Nov 2026
 00:01:09 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260928111442.289267-1-michaelestner@web.de>
In-Reply-To: <20260928111442.289267-1-michaelestner@web.de>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 2 Nov 2026 13:30:56 +0530
X-Gm-Features: AclHuK_iM75000JMrZUjClRJGbYloT2VhG-AviHsxTQq1WLHUKpMvoUxS9Qe_vI
Message-ID: <CAAhSdy1r1iLhx3i_E9cDytUKbbF13mro7Ci-GbyVaAf20z=RmA@mail.gmail.com>
Subject: Re: [PATCH] lib: tests: add bitmap set and clear tests
To: Michael Estner <michaelestner@web.de>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_000114_172239_CD795349 
X-CRM114-Status: GOOD (  18.79  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBTZXAgMjgsIDIwMjYgYXQgNDo0NeKAr1BNIE1pY2hhZWwgRXN0bmVyIDxtaWNoYWVs
ZXN0bmVyQHdlYi5kZT4gd3JvdGU6Cj4KPiBBZGQgU0JJVW5pdCB3b3JkLWJvdW5kYXJ5IGNvdmVy
YWdlIGZvciBiaXRtYXBfc2V0KCkgYW5kIGJpdG1hcF9jbGVhcigpLgo+Cj4gRGVyaXZlIHRoZSBi
YXNlIGJpdCBpbmRleCBmcm9tIEJJVFNfUEVSX0xPTkcgc28gdGhhdCB0aGUgdGVzdGVkIHJhbmdl
Cj4gY3Jvc3NlcyB0aGUgMzEvMzIgYm91bmRhcnkgb24gUlYzMiBhbmQgdGhlIDYzLzY0IGJvdW5k
YXJ5IG9uIFJWNjQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEVzdG5lciA8bWljaGFlbGVz
dG5lckB3ZWIuZGU+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4K
ClRoYW5rcywKQW51cAoKCj4gLS0tCj4gIGxpYi9zYmkvdGVzdHMvc2JpX2JpdG1hcF90ZXN0LmMg
fCAzNCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQs
IDM0IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3Rlc3RzL3NiaV9iaXRt
YXBfdGVzdC5jIGIvbGliL3NiaS90ZXN0cy9zYmlfYml0bWFwX3Rlc3QuYwo+IGluZGV4IGI2NTg2
ZmUxLi45NjE2NWI3ZSAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3Rlc3RzL3NiaV9iaXRtYXBfdGVz
dC5jCj4gKysrIGIvbGliL3NiaS90ZXN0cy9zYmlfYml0bWFwX3Rlc3QuYwo+IEBAIC0xMjAsMTEg
KzEyMCw0NSBAQCBzdGF0aWMgdm9pZCBiaXRtYXBfZW1wdHlfdGVzdChzdHJ1Y3Qgc2JpdW5pdF90
ZXN0X2Nhc2UgKnRlc3QpCj4gICAgICAgICBTQklVTklUX0VYUEVDVF9FUSh0ZXN0LCBiaXRtYXBf
ZW1wdHkoZGF0YV9hLCAwKSwgdHJ1ZSk7Cj4gIH0KPgo+ICtzdGF0aWMgdm9pZCBiaXRtYXBfc2V0
X2NsZWFyX3Rlc3Qoc3RydWN0IHNiaXVuaXRfdGVzdF9jYXNlICp0ZXN0KQo+ICt7Cj4gKyAgICAg
ICB1bnNpZ25lZCBsb25nIHJlc1tEQVRBX1NJWkVdOwo+ICsgICAgICAgaW50IHN0YXJ0ID0gQklU
U19QRVJfTE9ORyAtIDI7Cj4gKwo+ICsgICAgICAgLyogU2V0IGFjcm9zcyBhIHdvcmQgYm91bmRh
cnkgKi8KPiArICAgICAgIGJpdG1hcF96ZXJvKHJlcywgREFUQV9CSVRfU0laRSk7Cj4gKyAgICAg
ICBiaXRtYXBfc2V0KHJlcywgc3RhcnQsIDQpOwo+ICsKPiArICAgICAgIFNCSVVOSVRfRVhQRUNU
X0VRKHRlc3QsIGJpdG1hcF90ZXN0KHJlcywgc3RhcnQpLCB0cnVlKTsKPiArICAgICAgIFNCSVVO
SVRfRVhQRUNUX0VRKHRlc3QsIGJpdG1hcF90ZXN0KHJlcywgc3RhcnQgKyAxKSwgdHJ1ZSk7Cj4g
KyAgICAgICBTQklVTklUX0VYUEVDVF9FUSh0ZXN0LCBiaXRtYXBfdGVzdChyZXMsIHN0YXJ0ICsg
MiksIHRydWUpOwo+ICsgICAgICAgU0JJVU5JVF9FWFBFQ1RfRVEodGVzdCwgYml0bWFwX3Rlc3Qo
cmVzLCBzdGFydCArIDMpLCB0cnVlKTsKPiArCj4gKyAgICAgICAvKiBBZGphY2VudCBiaXRzIHVu
dG91Y2hlZCAqLwo+ICsgICAgICAgU0JJVU5JVF9FWFBFQ1RfRVEodGVzdCwgYml0bWFwX3Rlc3Qo
cmVzLCBzdGFydCAtIDEpLCBmYWxzZSk7Cj4gKyAgICAgICBTQklVTklUX0VYUEVDVF9FUSh0ZXN0
LCBiaXRtYXBfdGVzdChyZXMsIHN0YXJ0ICsgNCksIGZhbHNlKTsKPiArCj4gKyAgICAgICAvKiBD
bGVhciBhY3Jvc3MgdGhlIHNhbWUgYm91bmRhcnkgKi8KPiArICAgICAgIGJpdG1hcF9jbGVhcihy
ZXMsIHN0YXJ0ICsgMSwgMik7Cj4gKwo+ICsgICAgICAgU0JJVU5JVF9FWFBFQ1RfRVEodGVzdCwg
Yml0bWFwX3Rlc3QocmVzLCBzdGFydCksIHRydWUpOwo+ICsgICAgICAgU0JJVU5JVF9FWFBFQ1Rf
RVEodGVzdCwgYml0bWFwX3Rlc3QocmVzLCBzdGFydCArIDEpLCBmYWxzZSk7Cj4gKyAgICAgICBT
QklVTklUX0VYUEVDVF9FUSh0ZXN0LCBiaXRtYXBfdGVzdChyZXMsIHN0YXJ0ICsgMiksIGZhbHNl
KTsKPiArICAgICAgIFNCSVVOSVRfRVhQRUNUX0VRKHRlc3QsIGJpdG1hcF90ZXN0KHJlcywgc3Rh
cnQgKyAzKSwgdHJ1ZSk7Cj4gKwo+ICsgICAgICAgLyogQ2xlYXJpbmcgMCBiaXRzIGlzIGEgbm8t
b3AgKi8KPiArICAgICAgIGJpdG1hcF9jbGVhcihyZXMsIHN0YXJ0LCAwKTsKPiArCj4gKyAgICAg
ICBTQklVTklUX0VYUEVDVF9FUSh0ZXN0LCBiaXRtYXBfdGVzdChyZXMsIHN0YXJ0KSwgdHJ1ZSk7
Cj4gKyAgICAgICBTQklVTklUX0VYUEVDVF9FUSh0ZXN0LCBiaXRtYXBfdGVzdChyZXMsIHN0YXJ0
ICsgMyksIHRydWUpOwo+ICt9Cj4gKwo+ICBzdGF0aWMgc3RydWN0IHNiaXVuaXRfdGVzdF9jYXNl
IGJpdG1hcF90ZXN0X2Nhc2VzW10gPSB7Cj4gICAgICAgICBTQklVTklUX1RFU1RfQ0FTRShiaXRt
YXBfYW5kX3Rlc3QpLAo+ICAgICAgICAgU0JJVU5JVF9URVNUX0NBU0UoYml0bWFwX29yX3Rlc3Qp
LAo+ICAgICAgICAgU0JJVU5JVF9URVNUX0NBU0UoYml0bWFwX3hvcl90ZXN0KSwKPiAgICAgICAg
IFNCSVVOSVRfVEVTVF9DQVNFKGJpdG1hcF9lbXB0eV90ZXN0KSwKPiArICAgICAgIFNCSVVOSVRf
VEVTVF9DQVNFKGJpdG1hcF9zZXRfY2xlYXJfdGVzdCksCj4gICAgICAgICBTQklVTklUX0VORF9D
QVNFLAo+ICB9Owo+Cj4gLS0KPiAyLjM0LjEKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlz
dAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9w
ZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL29wZW5zYmkK
