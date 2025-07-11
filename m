Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67533C83F21
	for <opensbi@archiver.kernel.org>; Fri, 11 Jul 2025 05:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fs/hRXPjHYqqAfOJOvMWdhge5M4o/vE2x7zNdRJ5gkQ=; b=a4CTMFsw/UkpSc
	bzKUPx5akoI1CembeMm+p3hFsNISptIwnLcefvJPiWYHGzBWDzPRH+M+S0jpJvbHucyI2PML1O9CO
	lVEOgRlIuTlgTS0Q1lZRTrKXzTc0DNgLL7BM/NVLffKzaYrZ6wuKR8poZQAbrppEqLZvx/khyZ4FG
	iC7/SWSjLxGtBO1phw+8Vy2MDjv/xRmDcfDkkt/pMvtCqfcZl5FTTYR3i2DSzTMiYDQklr/LedGbH
	zWRQjvPwUKe4RNWLas5e5m+pTUK5vhKm+IDvfd/MJJzXYE8JDjnNwFM/9h7pir+YJRjPwWYm7GGRV
	vLLaHrT4LBa1/6DUdt6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua62f-0000000Dj91-1HUT;
	Fri, 11 Jul 2025 05:11:25 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5Sa-0000000DfpA-2xNj
	for opensbi@lists.infradead.org;
	Fri, 11 Jul 2025 04:34:09 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so1674883f8f.3
        for <opensbi@lists.infradead.org>; Thu, 10 Jul 2025 21:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1752208447; x=1752813247; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5fQK28OZ5PR9BOXNa+Agu86yP34WsclDCycAEVb7CEE=;
        b=ZL6SKLxza0B5oahC9dykq8F3N9B8vi+/3TREpDMVTRUUBT8bYhxR1kRkK0nxIUDRsW
         hYWUUJ1XHxSZhRDEmaWVbsXku36nrMJPD4/QanuxnxcFHUNbRsJ5QCn0lH0BCXEa6AWM
         KHRbOi1X5X0X8Kh8mMLKEKGoh3+6F4Iqkdfs32JIoW6kwiZjSrKpIlkvcUHmDxw3olKg
         0xNfg3kqPZuOpzZyNiWog7X5eg6TGee4dOQTpfgfbOoynUzOgZPHihFiY800+Jv5h+7J
         hRZDaLZ4fWlAd4AmuGyd9UlUvV4m1dwWsc0pM7nuZhw7HUgzjh+0SAEJuShVZ5LN342e
         Cu8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752208447; x=1752813247;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5fQK28OZ5PR9BOXNa+Agu86yP34WsclDCycAEVb7CEE=;
        b=GwYkMYD0T3GGx0bPciAp3sh3iC+FrQZm6oZeryZMGunZP+Xx4xNujjufWz/2OwC0o+
         3eJP1QTjJOjv6xY0d/EhWCEsPrt6KOJ0IFPmGNf/gV8O7/P7Vb7VQjatYECIPe6wP/Xa
         P2Ra2fq9kWzuhaXJYwV6t8s6GDDGQA1fzq8D6nbDuimXAv/VaE+xgpb7BwjpPP80tLGv
         se6507yLyWZ5ZMBrvltg7mk2+yca1HsUkmZQdx9nw671gtGNVOqaooW5lFK0KWvC2lNr
         BDw74w9HqnDHOSDzOu6GNi8vyr4vX7OmJjLCfngvlJcZqm6Jcf4t6PHpAJwAoWf74MQA
         k4zw==
X-Gm-Message-State: AOJu0YwqtKsE4nsghdMKiy1X9vsal505VA3cEtegnIYV8oniU8YNHxi5
	cpOuXplJrKM44QQnmgdoD7r8MEsbMdZiYjUTsIkS4Y5rgfgDtp5ewXeMzBNU85854gk=
X-Gm-Gg: ASbGncv54dAxYADMyK9XL5rv83n5BY1MJxsCqpeG2f2T9BM5yvQEL3+XuzRh3+dMRXh
	Xqr2gTo4w0oiP/aRiyRi5xSjGrQ37zZR0D/rEyxZFLq2j58V6Yem4ze8DA9Itw/cPr/TIZjzcMq
	4El1uoXS+TjFRBvwbyUJrljXj43jwg1mHvX73N3lD9+jW4BwVaaU5T7hgsGxHt4XXFLZix9lVSV
	crOEq/J1APUsSRYINW3pL/ArhieTSXEEkXY8DKwIbJ/x3x9yha8ab33J8BaGenK6s5xD4+xHANt
	ZHc0GNezqz9I/1Qz5g5MgCpmCyNJ72pvrjCVmaSPUuLCOzCQHByXpy2JuoyniGO9CbFlczelEln
	Nk6jcnEqFiXY9qLhWitDIPoKYgiQ533aQHtY=
X-Google-Smtp-Source: AGHT+IH6PFT0HemETlfpQ9skoKNT35YHFZPZ2t4PvjiFTPTlZ5Fpab7i7eI26VqlUUkOpsBlBnXRaw==
X-Received: by 2002:a5d:5f49:0:b0:3a3:6e85:a529 with SMTP id ffacd0b85a97d-3b5f18f80c5mr1469139f8f.51.1752208446556;
        Thu, 10 Jul 2025 21:34:06 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e269a0sm3375273f8f.86.2025.07.10.21.34.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Jul 2025 21:34:06 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v1] generic: mips: support harts to boot from
 mips_warm_boot
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20250710231708.4553-1-cfu@mips.com>
Date: Fri, 11 Jul 2025 05:33:55 +0100
Cc: opensbi@lists.infradead.org,
 Chao-ying Fu <cfu@mips.com>
Message-Id: <06A6B90B-EB43-4CF9-8840-DE0DDB8210BD@jrtc27.com>
References: <20250710231708.4553-1-cfu@mips.com>
To: Chao-ying Fu <icebergfu@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_213408_758244_82E401AD 
X-CRM114-Status: GOOD (  13.51  )
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

T24gMTEgSnVsIDIwMjUsIGF0IDAwOjE3LCBDaGFvLXlpbmcgRnUgPGljZWJlcmdmdUBnbWFpbC5j
b20+IHdyb3RlOgo+IAo+IFdlIHByb2dyYW0gcmVzZXQgYmFzZSBmb3IgaGFydHMgKG90aGVyIHRo
YW4gaGFydCAwKSB0byBib290IGF0Cj4gbWlwc193YXJtX2Jvb3QgdGhhdCBqdW1wcyB0byBfc3Rh
cnRfd2FybS4gVGhpcyBoZWxwcyB0byBza2lwIHNvbWUgY29kZQo+IHNlcXVlbmNlIHRvIHNwZWVk
IHVwLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENoYW8teWluZyBGdSA8Y2Z1QG1pcHMuY29tPgo+IC0t
LQo+IHBsYXRmb3JtL2dlbmVyaWMvbWlwcy9wODcwMC5jIHwgMTkgKysrKysrKysrKysrKysrKysr
Kwo+IDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3Bs
YXRmb3JtL2dlbmVyaWMvbWlwcy9wODcwMC5jIGIvcGxhdGZvcm0vZ2VuZXJpYy9taXBzL3A4NzAw
LmMKPiBpbmRleCA4ODhhNDVjLi42ODc5MTJhIDEwMDY0NAo+IC0tLSBhL3BsYXRmb3JtL2dlbmVy
aWMvbWlwcy9wODcwMC5jCj4gKysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9taXBzL3A4NzAwLmMKPiBA
QCAtMTQwLDYgKzE0MCwyMiBAQCBzdGF0aWMgdm9pZCBwb3dlcl91cF9vdGhlcl9jbHVzdGVyKHUz
MiBoYXJ0aWQpCj4gfQo+ICNlbmRpZgo+IAo+ICtzdGF0aWMgdm9pZCBfX2F0dHJpYnV0ZV9fKChu
YWtlZCxub19pbnN0cnVtZW50X2Z1bmN0aW9uLGFsaWduZWQoNDA5NikpKQo+ICttaXBzX3dhcm1f
Ym9vdCh2b2lkKQo+ICt7Cj4gKyAgX19hc21fXyBfX3ZvbGF0aWxlX18oCj4gKyAiIGogMWZcbiIK
PiArICIgLmFsaWduIDJcbiIKPiArICIgaiAxZlxuIgo+ICsgIiAuYWxpZ24gMlxuIgo+ICsgIiBq
IDFmXG4iCj4gKyAiIC5hbGlnbiAyXG4iCj4gKyAiIGogMWZcbiIKPiArICIxOiBsbGEgdDAsIF9z
dGFydF93YXJtXG4iCj4gKyAiIGpyIHQwXG4iCj4gKyApOwo+ICt9CgpXaGF0IGlzIHRoZSBwb2lu
dCBvZiB3cml0aW5nIHRoaXMgYXMgYSBDIGZ1bmN0aW9uIGlmIGl04oCZcyBnb2luZyB0byBiZQpl
bnRpcmVseSBhc3NlbWJseT8gSnVzdCB3cml0ZSBhbiBhc3NlbWJseSBmdW5jdGlvbj8KCkplc3MK
CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
