Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21B2C4452D
	for <opensbi@archiver.kernel.org>; Wed, 22 Jul 2026 03:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=77Wz4m4gPi0vjJBh6DtjCUaQ3xj8k/AyMxTcqLnAmf4=; b=Hju0q8Rtq93Ccpc+uuAqeYuo5V
	vWAXsxQVBXeWN2CUpMLYyDTHEbW6IHiqxxj5c0N+rVcfgFWuKLdauhk4hs1aBEwyEEsBIFj6v1S45
	oYL+mJ6i3BRu8tABQxEthqYnDXRdUOHipnjIDijHTtTBG08t9qBNTk9CIuSnShTNvxh9//5PXk6xm
	/rFdSIXN4blZ68EfCfU6B7omniWwUqKc4bXaQX5ArtJuHJewW5N4ifF8FtfV7bsTTJg8vd5mwLz0g
	bLtqelGgepFyOuEe2aiGa6u3EDYi8ZlKDK9pxeEKjEQLqEzq3M5LswmF91AU72Soug4pmdLiFB/u7
	z/ifxHEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmO4E-0000000Aqox-0piQ;
	Wed, 22 Jul 2026 03:56:22 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmO4A-0000000AqoH-1r63
	for opensbi@lists.infradead.org;
	Wed, 22 Jul 2026 03:56:21 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-69e5f8a193bso7067242a12.2
        for <opensbi@lists.infradead.org>; Tue, 21 Jul 2026 20:56:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784692576; cv=none;
        d=google.com; s=arc-20260327;
        b=EPS33NaUc8FkrVGW6yWnTsy0BR9NxI3F97HpmMoO0tQ/CnW/kjejrVGhPs07+ZVbYs
         wGHfD5insLm5zQX+rV8bEKFiC8tGgbrRENdK+ne5lsPyxmGD4u4IvYV9B3xZfr6a+sn+
         tcTEtaVjVHOtBKVzwvOVIIPetJu8DNM+5TQar6r4paiK9WjI/mUVKKQe9YpcWVpal88j
         f96ZxdXoXOaHitnO5b0OK2kTaxgHVBjXgLQPupIIvuDcyvua5XS3v2FzhJ6i+XZTEp7Y
         IeRDwKBf4rKFVkHnbWcdv0F7LzHg4K6hnX6gnF5P7JpsiV8D1PurVtYd5ZPuuyLuwzKf
         CQPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mzjsXJ/D5DXypQYGdSrLO841va5oZNejgShJV7UviFQ=;
        fh=UjC8LElMMdEgNND7me3NQ/AI1G08RBdmcgKVMtPDPkg=;
        b=LXSlFa+Us57uuJogCSZiWDtZ9jtdRd3lLdvJ1QtQI1yEpwcMqQJ5HDIhnpMKCJpZhM
         eLTjIUtJACPqQxOCS08Jo5yG+PgINiA+p0uzBrkWa2bX8uCqRAxoSTwHDuGiudDXoCKv
         A/z1cgKdSQnKx7Hd4+gO/MP1XX7ZP0B8zCj2sihLOZzj0lIwZ7vsNZp7Cp08pRNUbu0W
         pI3O5LmBR9rDcSVEfBKb5SpMJ6h/I93Ne1cMjRt+04tJPMuQdAUshDyy5VYIMevpbhgi
         jQO/U/8hdZheOomtR8C8Gi3qvQ2TUs2y2LyMvgp4GFZPIDfqZB2m1TMdb/pmetlEGcbZ
         eLdA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1784692576; x=1785297376; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mzjsXJ/D5DXypQYGdSrLO841va5oZNejgShJV7UviFQ=;
        b=BcGcKP8ZDrSLHF2CAnidqwn2lp/N9GW6HAWoKpzbrxxLc8E/udagNqL84x4HStDdik
         8CrKGQmU2YohjXoLqw7R/qjLix/+Ie5q9rm24wmVp7w4U+6kG75r8DkZeARsNQ0oFnFX
         vQC78Op4lCLArGxhJn1CX0L4zV0VDoLrpg6n73QqTUI/gRbvGe8Jpe61tjmIOh8x7xeB
         kL3WIos9tqPQmdwPNvKBLuodBMqKIDa30slgQHNb7x/qNnSDxIpi/sBSWyPOjC8ELCPE
         zvo8uLFecFJHneihG9rMc6YwuPWAEf3/1VHNglmWEsCMSBbdMuERyPRx9jsaTLfZZnyY
         xNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784692576; x=1785297376;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mzjsXJ/D5DXypQYGdSrLO841va5oZNejgShJV7UviFQ=;
        b=hVpWaIdvU+4XRaoTRN/bSrWfQru0T38ot5w5eqlDJ0bt4R2FP81obxkMcRb3qLPV+s
         /LIQ6TpdhizvEHhegw/6v3ZndcaiNiYHx3aIvZP+G0aZqkcnPgmoC3kH35v8jD0tsqkb
         KudT5aN4oa7xPXgMjEdj8PKBFqVQFGKInORv+g3s5o/BD/EdHAmWYk2G5NML4wOCU7D7
         SKw5MmfaP5fRB8xzL/pwYxYm4bf484CE7t5EIzL2fpgTEKjcub79p7U5pg+4vqi7kqvt
         YlWMfzR/HllBGKqRqMRTCPJnzmH2962g6GwQa80QuipuE9/AySQCzwETP+fGRskLvOvd
         xCTg==
X-Gm-Message-State: AOJu0Yw/4x8+zCPVy6Pw5tjvlKOTHfTxS0TGdj+liDmGeWXOZbejgEbe
	WEVAaGKhedbS7H2wai+2eSqLleOzc++S1J98b2HdMfcq+LV/WEofTp3D3iUukhuBggYpxn0P7jR
	Dr+Eqqyzmh9ZiInOnzMs3LZ/4F6lVoQTZroFQgWby+SQ+lZQcRsLMuJVb3A==
X-Gm-Gg: AR+sD11xLBO6TWSFbTcU/I/ZN0+sf4wOUekwXDTDxNEdNywQenSIxr+ILxZGHnVa6JN
	l9i0RRSeQB5PEHw+iV03aD+0mFc1JxyoSJEpfxZ4s5vSr8ScmCiEpRIA49zZ5OOGePnGXMNcmPR
	d//a+c5JX26hfdcPSM6D3l4SnCrqPE/0XA/gJCdQEK3ijuC/AZMwAIV5ZjfMiGw9B/UA1FgwKO6
	A5Cjk3xH7tk6gmY+4zkXRvpaiUQIw+5dTKT99BKDWeHB/lP4HjMsZbpv0v2TaRN
X-Received: by 2002:a17:907:60d2:b0:c1a:5d49:f99d with SMTP id
 a640c23a62f3a-c1a5d4a0136mr300224666b.7.1784692575737; Tue, 21 Jul 2026
 20:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260707033954.2054859-1-zong.li@sifive.com>
In-Reply-To: <20260707033954.2054859-1-zong.li@sifive.com>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 22 Jul 2026 11:56:05 +0800
X-Gm-Features: AUfX_my0zJ83Hw6ouJNFMLOuUEqd3Ow1KO3OhYAo799lse1q5weZ0DqPNXBjkXU
Message-ID: <CANXhq0qx=gryXgWKnrc7XuaJnPwhw0wqNB=NWYzgjv3h2hk4jA@mail.gmail.com>
Subject: Re: [PATCH 0/7] firmware: add FW_DYNAMIC_APPEND firmware type
To: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_205618_786360_0D0AB942 
X-CRM114-Status: GOOD (  26.62  )
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

T24gVHVlLCBKdWwgNywgMjAyNiBhdCAxMTozOeKAr0FNIFpvbmcgTGkgPHpvbmcubGlAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHNlcmllcyBhZGRzIGEgZm91cnRoIE9wZW5TQkkgZmlybXdh
cmUgdHlwZSwgRldfRFlOQU1JQ19BUFBFTkQsIG5leHQgdG8KPiB0aGUgZXhpc3RpbmcgRldfRFlO
QU1JQywgRldfSlVNUCBhbmQgRldfUEFZTE9BRC4KPgo+IE1vdGl2YXRpb24KPiA9PT09PT09PT09
Cj4KPiBGV19EWU5BTUlDIHJlcXVpcmVzIHRoZSBwcmV2aW91cyBib290aW5nIHN0YWdlIHRvIGJ1
aWxkIGEgc3RydWN0Cj4gZndfZHluYW1pY19pbmZvIGluIG1lbW9yeSBhbmQgcGFzcyBpdHMgYWRk
cmVzcyBpbiBhMi4gU29tZSBib290aW5nIHN0YWdlcwo+IGNhbm5vdCBlYXNpbHkgYWxsb2NhdGUg
YW5kIHBhc3Mgc3VjaCBhIHN0cnVjdHVyZSwgYnV0IHRoZXkgY2FuIGxvYWQgdGhlCj4gT3BlblNC
SSBpbWFnZSBhbmQgcGF0Y2ggYSBmZXcgd29yZHMgYXQgYSBrbm93biBsb2NhdGlvbiBiZWZvcmUg
anVtcGluZyB0bwo+IGl0LiBGV19EWU5BTUlDX0FQUEVORCB0YXJnZXRzIGV4YWN0bHkgdGhhdCBj
YXNlOiB0aGUgc3RydWN0IGZ3X2R5bmFtaWNfaW5mbwo+IGlzIGFwcGVuZGVkIGludG8gdGhlIE9w
ZW5TQkkgYmluYXJ5IGFuZCBwYXRjaGVkIGluIHBsYWNlIGJ5IHRoZSBwcmV2aW91cwo+IHN0YWdl
LiBGb3IgZXhhbXBsZSwgdGhlIHByZXZpb3VzIGJvb3Qgc3RhZ2UgcnVucyBvbiBhIGRlZGljYXRl
ZCBoYXJ0Lgo+IFRoZXJlZm9yZSwgaXQgY2Fubm90IHNldCB1cCBDU1JzIG9mIGFub3RoZXIgaGFy
dCB0aGF0IHJ1bnMgT3BlblNCSS4KPiBUaGlzIHNjZW5hcmlvIHdpbGwgb2NjdXJzIGluIHNlcnZl
ciBzeXN0ZW1zIHdpdGggc2VjdXJlIGJvb3QuCj4KPiBLZXkgZGVzaWduIHBvaW50cwo+ID09PT09
PT09PT09PT09PT09Cj4KPiAgIC0gVGhlIGFwcGVuZGVkIHN0cnVjdCBmd19keW5hbWljX2luZm8g
aXMgcGxhY2VkIGltbWVkaWF0ZWx5IGJlZm9yZSAuYnNzLgo+ICAgICAuYnNzIGlzIE5PQklUUyBh
bmQgaXMgZHJvcHBlZCBieSAnb2JqY29weSAtTyBiaW5hcnknLCBzbyBhIHN0cnVjdHVyZQo+ICAg
ICBhZnRlciBpdCB3b3VsZCBub3QgYmUgcGFydCBvZiB0aGUgZmxhdCAuYmluLiBQbGFjaW5nIGl0
IGJlZm9yZSAuYnNzCj4gICAgIG1ha2VzIGl0IHRoZSBsYXN0IFBST0dCSVRTIGNvbnRlbnQsIGku
ZS4gaXQgc2l0cyBhdCB0aGUgdGFpbCBvZiB0aGUKPiAgICAgLmJpbiBhbmQgY2FuIGJlIGxvY2F0
ZWQgZnJvbSB0aGUgaW1hZ2Ugc2l6ZS4gVGhlIHByZXZpb3VzIGJvb3RpbmcKPiAgICAgdGFnZSBj
YW4gdGhlcmVmb3JlIGZpbmQgdGhlIHN0cnVjdHVyZSBhdDoKPgo+ICAgICAgICAgbG9hZF9hZGRy
ZXNzICsgYmluYXJ5X2ZpbGVfc2l6ZSAtIHNpemVvZihzdHJ1Y3QgZndfZHluYW1pY19pbmZvKQo+
Cj4gICAtIHN0cnVjdCBmd19keW5hbWljX2luZm8gZ2FpbnMgYSBuZXcgJ2Jvb3RfZHRiJyBmaWVs
ZCAoaW5mbyB2ZXJzaW9uIDMpCj4gICAgIHRvIGNhcnJ5IHRoZSBEVEIgYWRkcmVzcy4gRXhpc3Rp
bmcgb2Zmc2V0cyBhcmUgdW5jaGFuZ2VkLgo+Cj4gICAtIFRoZSBwcmV2aW91cyBib290aW5nIHN0
YWdlIHBhdGNoZXMgZXZlcnkgZmllbGQgYXQgcnVudGltZS4gVGhlCj4gICAgIHJlc2VydmF0aW9u
IGlzIGEgS0VFUCgpIFBST0dCSVRTIHNlY3Rpb24sIHNvIHRoZSB6ZXJvLWluaXRpYWxpc2VkCj4g
ICAgIGJ5dGVzIHN0aWxsIGxhbmQgYXQgdGhlIHRhaWwgb2YgdGhlIC5iaW4uCj4KPiAgIC0gT24g
dGhlIGNvbGQtYm9vdCBwYXRoIChndWFyZGVkIGJ5IEZXX0RZTkFNSUNfQVBQRU5EKSwgZndfYmFz
ZS5TIGNhbGxzCj4gICAgIGZ3X2R5bmFtaWNfYXBwZW5kX2Jvb3RfYXJncygpIGluIGZ3X2R5bmFt
aWNfYXBwZW5kLlMuIFRoZSBoZWxwZXIgc2V0cwo+ICAgICBhMCA9IG1oYXJ0aWQsIGEyID0gJmFw
cGVuZGVkIHN0cnVjdCwgYW5kIGExID0gYm9vdF9kdGIsIGFuZCBjbGVhcnMgdGhlCj4gICAgIHJl
c2VydmVkIGEzL2E0IHRoYXQgZndfcGxhdGZvcm1faW5pdCBjb25zdW1lcy4gT25seSBhMC1hNCBh
cmUgaGFuZGxlZAo+ICAgICBoZXJlLCB0aGUgcmVtYWluaW5nIEdQUnMgYXJlIGFscmVhZHkgY2xl
YXJlZCBieSB0aGUgZXhpc3RpbmcgX3Jlc2V0X3JlZ3MKPiAgICAgbGF0ZXIgb24gdGhlIGNvbGQg
cGF0aC4gVGhlIGJvb3RfZHRiIGxvYWQgaXMgZ2F0ZWQgb24gaW5mbyB2ZXJzaW9uIDMsIHNvCj4g
ICAgIGFuIG9sZGVyIGxheW91dCBsZWF2ZXMgYTEgPSAwIGluc3RlYWQgb2YgcmVhZGluZyBwYXN0
IHRoZSBzdHJ1Y3QuCj4KPiBCYWNrd2FyZCBjb21wYXRpYmlsaXR5Cj4gPT09PT09PT09PT09PT09
PT09PT09PQo+Cj4gQWxsIGNoYW5nZXMgZm9yIHRoZSBleGlzdGluZyB0aHJlZSBmaXJtd2FyZSB0
eXBlcyBhcmUgY29tcGlsZWQgb3V0OiB0aGUKPiBmd19iYXNlLlMgZml4dXAgYW5kIHRoZSAuZndf
ZHluYW1pY19pbmZvIG91dHB1dCBzZWN0aW9uIGFyZSB1bmRlcgo+ICNpZmRlZiBGV19EWU5BTUlD
X0FQUEVORCwgd2hpY2ggaXMgZGVmaW5lZCBvbmx5IGJ5IGZ3X2R5bmFtaWNfYXBwZW5kLlMgYW5k
Cj4gZndfZHluYW1pY19hcHBlbmQuZWxmLmxkUy4gRldfRFlOQU1JQywgRldfSlVNUCBhbmQgRldf
UEFZTE9BRCBiaW5hcmllcyBhcmUKPiBieXRlLWZvci1ieXRlIHVuY2hhbmdlZC4KPgo+IEJ1aWxk
Cj4gPT09PT0KPgo+ICAgbWFrZSBQTEFURk9STT08cGxhdGZvcm1fc3ViZGlyPiBGV19EWU5BTUlD
X0FQUEVORD15Cj4KPiBPbiB0aGUgZ2VuZXJpYyBwbGF0Zm9ybSBGV19EWU5BTUlDX0FQUEVORD15
IGlzIHNldCBpbgo+IHBsYXRmb3JtL2dlbmVyaWMvb2JqZWN0cy5taywgc28gaXQgaXMgYnVpbHQg
YnkgZGVmYXVsdC4KPgo+IFpvbmcgTGkgKDcpOgo+ICAgZmlybXdhcmU6IGZ3X2R5bmFtaWM6IGFk
ZCBib290X2R0YiBmaWVsZCB0byBzdHJ1Y3QgZndfZHluYW1pY19pbmZvCj4gICBmaXJtd2FyZTog
ZndfYmFzZS5sZFM6IGFkZCAuZndfZHluYW1pY19pbmZvIG91dHB1dCBzZWN0aW9uIGJlZm9yZSAu
YnNzCj4gICBmaXJtd2FyZTogYWRkIGZ3X2R5bmFtaWNfYXBwZW5kIGZpcm13YXJlIHR5cGUKPiAg
IGZpcm13YXJlOiBmd19iYXNlLlM6IGNhbGwgZndfZHluYW1pY19hcHBlbmRfYm9vdF9hcmdzIG9u
IGNvbGQgYm9vdAo+ICAgZmlybXdhcmU6IGJ1aWxkIGFuZCBlbmFibGUgdGhlIEZXX0RZTkFNSUNf
QVBQRU5EIGZpcm13YXJlIHR5cGUKPiAgIGRvY3M6IGZpcm13YXJlOiBkb2N1bWVudCB0aGUgRldf
RFlOQU1JQ19BUFBFTkQgZmlybXdhcmUgdHlwZQo+ICAgZG9jczogZmlybXdhcmU6IGxpc3QgRldf
RFlOQU1JQ19BUFBFTkQgaW4gZncubWQKPgo+ICBkb2NzL2Zpcm13YXJlL2Z3Lm1kICAgICAgICAg
ICAgICAgIHwgIDE5ICsrKystCj4gIGRvY3MvZmlybXdhcmUvZndfZHluYW1pY19hcHBlbmQubWQg
fCAxMTAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgZmlybXdhcmUvZXh0ZXJuYWxf
ZGVwcy5tayAgICAgICAgICB8ICAgMSArCj4gIGZpcm13YXJlL2Z3X2Jhc2UuUyAgICAgICAgICAg
ICAgICAgfCAgMTEgKysrCj4gIGZpcm13YXJlL2Z3X2Jhc2UubGRTICAgICAgICAgICAgICAgfCAg
MjQgKysrKysrKwo+ICBmaXJtd2FyZS9md19keW5hbWljX2FwcGVuZC5TICAgICAgIHwgMTA2ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBmaXJtd2FyZS9md19keW5hbWljX2FwcGVuZC5l
bGYubGRTIHwgIDI0ICsrKysrKysKPiAgZmlybXdhcmUvb2JqZWN0cy5tayAgICAgICAgICAgICAg
ICB8ICAgMiArCj4gIGluY2x1ZGUvc2JpL2Z3X2R5bmFtaWMuaCAgICAgICAgICAgfCAgMTcgKysr
Ky0KPiAgcGxhdGZvcm0vZ2VuZXJpYy9vYmplY3RzLm1rICAgICAgICB8ICAgMSArCj4gIHBsYXRm
b3JtL3RlbXBsYXRlL29iamVjdHMubWsgICAgICAgfCAgIDkgKysrCj4gIDExIGZpbGVzIGNoYW5n
ZWQsIDMyMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgZG9jcy9maXJtd2FyZS9md19keW5hbWljX2FwcGVuZC5tZAo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgZmlybXdhcmUvZndfZHluYW1pY19hcHBlbmQuUwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZmly
bXdhcmUvZndfZHluYW1pY19hcHBlbmQuZWxmLmxkUwo+Cj4gLS0KPiAyLjQzLjcKPgoKSGkgQW51
cCwKQ291bGQgSSBrbm93IHlvdXIgcGVyc3BlY3RpdmUgb24gdGhpcyBzZXJpZXMuIEkgd291bGQg
YXBwcmVjaWF0ZSBpdCBpZgp5b3UgY291bGQgbGV0IG1lIGtub3cgaWYgaXQgaXMgcmVhZHkgdG8g
bW92ZSBmb3J3YXJkLiBUaGFua3MKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9vcGVuc2JpCg==
