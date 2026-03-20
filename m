Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121281093172
	for <opensbi@archiver.kernel.org>; Fri, 20 Mar 2026 04:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YxGb8QsP3qjJlNyzajoSAxCMn82q/tBAOYnng79IHkM=; b=J/plirrwYIFFc3
	ggjYTPVb7UyucuFF0QNTCwI3nfy8IIY3WwxkyZCPLJjn36kVeo9Ix5Fz1ydXk7i9sP/ADgXOqQdzK
	j6VeoXuxqcuQQXyMuG6W/+Dor5nPPNcUUUXpFG97czJURqU2ZBKJfDatsK3jKQJqzTiUumVgmyn4r
	IFbxIp/XoycItlEMuBmldVZBiF5J4EJLbY3Jou18yUk+1iofafH79CLjA77p3QcJZw9iYZEgDIdvW
	usb3WfToEaJLDucAamQqg4kqAxD2LQVE3MLRPAsSxIVFsUZB/JTyiF4L8GOx1lVT3779or+vzBEhU
	eBZjDjNxc2BKXbosbYQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3RkU-0000000C4jT-0IKm;
	Fri, 20 Mar 2026 04:46:14 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3RkP-0000000C4j8-2Vix
	for opensbi@lists.infradead.org;
	Fri, 20 Mar 2026 04:46:11 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-679b072ed3aso127038eaf.1
        for <opensbi@lists.infradead.org>; Thu, 19 Mar 2026 21:46:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773981968; cv=none;
        d=google.com; s=arc-20240605;
        b=NGVJM5l0QKxrtAZEOsLKxBogMP5/rLaIEGn2IShE4Y90G80/59d6P7a6bJJrjAitBF
         gvm0soK6636JZ4mMraiOLuY5J2R4EaFl0Z9XMbEgLvFvx41a0GGRd9WUneg+2btLnyn+
         YsR8v1MF3RmpMvwhXDNB7zl4bVN6D7Nic2ngUVuLpbw2/CF3dzEJBZkiFGq2xWLkRffI
         yg2R2JiOolcHHvDcZKtnDTfMKzOzaibYwIiscvOikY4HEmndmLvbQAZc0T3syo1s0kk2
         chGpJdtivXhDXO3YoYah2yrHw02Rfn5U9M7sHJT5YnlkXui8wJrLHYc+6PMTOCaOk8sR
         DGPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DN2hNkP9pAN5TMbscyDByOMrSM3DbEBZh8ypQwx0g28=;
        fh=ZvUNVdBUaw9ITe6WhmV5AcAsi7vmvtm+VWe7OnyYmG8=;
        b=FfPXc13hBoMoSco7uvSk1FGFm3bAZm9okUaY9qznwZpis5tmoagbeWXo/IPYtQLjWW
         AYFhj0nhGwZhYrJ50hEb37sLhpoZGMzsAWhCYpjAMCBkWH1gZj7lveJwR9wKZJsCc6Te
         /0/GFaXyKKkfFTqQlLuoAyniZd4tRBtGVqTqWuwNG2yWBrs3+SZOvRxakLnoOe1EancS
         XCy028C7kvAvk5lLwn9tZqs/d0JI6/4/VvZS8O509fMNqzGScP0bx5FYKbw3Zuw3lQel
         ckeq0J2h8cY23gNTHhjtS8fDlosSMqi8iildbFv9M0JTaeRyaSRRvOMvW5kHGELgijRr
         K33A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1773981968; x=1774586768; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DN2hNkP9pAN5TMbscyDByOMrSM3DbEBZh8ypQwx0g28=;
        b=EJYsKl7yYOiiL1CbbUCbOgB3vhqj07wvZnN0LfA4eu3JncLj7vWVGyH/UTBIYg0P10
         Lvl+mgA3H368EBmo5BUNLXyN/M2QvMjuaCO+zEBuhgHQRuClAfE/LPQSaafORxsEzQ+A
         GhABT2l3wPaHPS0jR+fqccJ7YO0xc1dphBkDp+bgvWTIHHxwHlA/sXaAvLIm3XpwwfOu
         HWIUINCstRcOFKy0kFqoiqqrskjBzDSZrGzLNjCNfu80r7v+GraOad6cVfO2XWWfMfaI
         eAoIblxzkREP4sTmIKWG9bX4G8wYoJmKILM/Q+otdCCwF0M2RtRJSecSwjuYP+wmo2rB
         MyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773981968; x=1774586768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DN2hNkP9pAN5TMbscyDByOMrSM3DbEBZh8ypQwx0g28=;
        b=n6rOTC/s6DEgh5o5zoOqrSpLaBuCiSGt2lLxTo3jN++F9b0fyR4KiKLb42iBlrw4K1
         gV6zxTJzEcmeIdW+pdGY3/W6znKZGPtEpH4GcCsqz1iRTHtLISz+hkZ/PUYIorEZomPG
         kycs6Tfu3xm+8lynxi29J8JJsvdV6ddrj8oU9o2Tq3TfbXvQljR0SO8ONk3lSIt/xeVv
         oI2S39bjPebAeFLcf9mBw6kp4pIehFK2HQTqYfz5SnP0WgYj7JZo4Ez18cO4cjklaSPw
         qNV/pkZhAOAXO12WWb2zqEJ1j+hko1to91VpU2krxqUT1rTL+kN/UUDzKBR1yHrj2l5B
         htsQ==
X-Gm-Message-State: AOJu0Yz78MaABI/hJQ92HmWjGnfc9yrVn9auJrKLDzChlcfgy4FPM/uc
	9qxbmZrDMJfRl2ISAb+qGBuw9tqYBKz65mYj/8yM5mBaCFW1vR2Qz1SBKlKSuDbgUuZITvG6VHD
	Jg6CPtflJdnC3DZjt0eOYq/JLe/9/ybAaIcWph57uOg==
X-Gm-Gg: ATEYQzxye72JroQyoN7KwxTawLECv7dXQXiTXhYOfxniHOEk5yKUUuCEMAuVhOuovOJ
	sHFRllUw96R3Bq6DrzVLboBD4hEXAKfGS/SoXp6XE1MsM4HfUJ0RzWJVtrQUTQ/zpkv6fdJfwNg
	GYtLMbIH9MxWH4zkxFnOie9lyq76pEzepASFU2v28JNBzJ0fI49QsQULsVfitFbl+haJ9xbkP2h
	iKieZoFE1Z7ngX+Ar0ysvK+m6iQgolNCNOAiTeF9QIEoUUvhX6V19UFVa2aKLqXlPUtWOqdlAwB
	NMLCG5GZn+zmTe0MDzqMUgQRWEGsiw1q9qp9XNoJuINH9sf5Adjh94fxak7qY5lypYuxbawelbg
	6Mwt7DPzr+YqStPcFEmakTEPBqC2ScIbDn2xt
X-Received: by 2002:a05:6820:1b0b:b0:677:48f4:3c66 with SMTP id
 006d021491bc7-67c22ff695fmr1415166eaf.67.1773981968206; Thu, 19 Mar 2026
 21:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260210094044.72591-1-ganboing@gmail.com> <20260210094044.72591-5-ganboing@gmail.com>
In-Reply-To: <20260210094044.72591-5-ganboing@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 20 Mar 2026 10:15:57 +0530
X-Gm-Features: AaiRm51dNvT9bv9MeIvsf9H_nEmHr7A2c3qUornf3LzQ522V8mGSMDTyxxfuAjk
Message-ID: <CAAhSdy2sDQFnJJefAoWJL1G4H7SHS3oGtYFGo6XvEzsfcX667Q@mail.gmail.com>
Subject: Re: [PATCH 4/7] include: sbi: set FS dirty in vsstatus when V=1
To: Bo Gan <ganboing@gmail.com>
Cc: opensbi@lists.infradead.org, dramforever@live.com, 
	anup.patel@oss.qualcomm.com, cleger@rivosinc.com, samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_214610_257556_9E205952 
X-CRM114-Status: GOOD (  12.93  )
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

T24gVHVlLCBGZWIgMTAsIDIwMjYgYXQgMzoxMuKAr1BNIEJvIEdhbiA8Z2FuYm9pbmdAZ21haWwu
Y29tPiB3cm90ZToKPgo+IEFjY29yZGluZyB0byBQcml2aWxlZ2VkIElTQSAxOS4yLjExOgo+Cj4g
TW9kaWZ5aW5nIHRoZSBmbG9hdGluZy1wb2ludCBzdGF0ZSB3aGVuIFY9MSBjYXVzZXMgYm90aCBm
aWVsZHMKPiAodnNzdGF0dXMuRlMgYW5kIHRoZSBIUy1sZXZlbCBzc3RhdHVzLkZTKSB0byBiZSBz
ZXQgdG8gMyAoRGlydHkpCj4KPiBGaXhlczogMTMwZTY1ZGQ5ZDQ0ICgibGliOiBzYmk6IEltcGxl
bWVudCBTRVRfRlNfRElSVFkoKSB0byBtYWtlIHN1cmUgdGhlIG1zdGF0dXMgRlMgZGlydHkgaXMg
c2V0IikKPiBTaWduZWQtb2ZmLWJ5OiBCbyBHYW4gPGdhbmJvaW5nQGdtYWlsLmNvbT4KCkxHVE0u
CgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMs
CkFudXAKCj4gLS0tCj4gIGluY2x1ZGUvc2JpL3Jpc2N2X2ZwLmggfCA2ICsrKysrLQo+ICAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9zYmkvcmlzY3ZfZnAuaCBiL2luY2x1ZGUvc2JpL3Jpc2N2X2ZwLmgKPiBpbmRl
eCAwMzAxMWFmOS4uZmYxZGJjODcgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmkvcmlzY3ZfZnAu
aAo+ICsrKyBiL2luY2x1ZGUvc2JpL3Jpc2N2X2ZwLmgKPiBAQCAtODMsNyArODMsMTEgQEAKPiAg
I2RlZmluZSBHRVRfRkZMQUdTKCkgY3NyX3JlYWQoQ1NSX0ZGTEFHUykKPiAgI2RlZmluZSBTRVRf
RkZMQUdTKHZhbHVlKSBjc3Jfd3JpdGUoQ1NSX0ZGTEFHUywgKHZhbHVlKSkKPgo+IC0jZGVmaW5l
IFNFVF9GU19ESVJUWShyZWdzKSAocmVncy0+bXN0YXR1cyB8PSBNU1RBVFVTX0ZTKQo+ICsjZGVm
aW5lIFNFVF9GU19ESVJUWShyZWdzKSBkbyB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCj4gKyAgICAgICBpZiAoc2JpX3JlZ3NfZnJvbV92aXJ0KHJlZ3MpKSAgICAgICAgICAgICAg
ICAgICBcCj4gKyAgICAgICAgICAgICAgIGNzcl9zZXQoQ1NSX1ZTU1RBVFVTLCBNU1RBVFVTX0ZT
KTsgICAgICBcCj4gKyAgICAgICByZWdzLT5tc3RhdHVzIHw9IE1TVEFUVVNfRlM7ICAgICAgICAg
ICAgICAgICAgICBcCj4gK30gd2hpbGUoMCkKPgo+ICAjZGVmaW5lIEdFVF9GMzJfUlMxKGluc24s
IHJlZ3MpIChHRVRfRjMyX1JFRyhpbnNuLCAxNSwgcmVncykpCj4gICNkZWZpbmUgR0VUX0YzMl9S
UzIoaW5zbiwgcmVncykgKEdFVF9GMzJfUkVHKGluc24sIDIwLCByZWdzKSkKPiAtLQo+IDIuMzQu
MQo+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
