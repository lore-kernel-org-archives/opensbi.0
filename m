Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3287ECD37AC
	for <opensbi@archiver.kernel.org>; Sun, 17 May 2026 15:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GtqII5xsgNVnDDvN/2+dNMsIKznrgcvpiwczvOJw0YU=; b=PVglrf1YzrolwR
	nhf43Ogpd2wGhSv02TXxoHCt/5LbcIguDtXw0EWTtnxG1WteNWr35RfCGaEcYFfznSgtKNzAsYy21
	ymkLeJRp41Dzotm72Z7+s7x3SAN0BEpLgQVkwApw7bK+a0o4Kvwa6HWJbU8QM6BWBqqyZ/FW0HMpa
	4IjIJzukjFIqsQEAji/zqgPgm0tu5qS6Obf3Z2OWDDhpUHbtuvwiyIiVnZTLxKWiHyFoZC6e7zjBS
	eWjlL7Ox18Fxy7TXLesuCElXu1y9CCPge5UxpecI+OPvgwyT8cuV7PJ3G5hL9XV8F7t6+4K49iGQ3
	cpnwMDlTUB0K+Ob9v9fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOdZF-0000000Cwn9-0WDK;
	Sun, 17 May 2026 15:38:13 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOdZC-0000000CwmJ-3ddJ
	for opensbi@lists.infradead.org;
	Sun, 17 May 2026 15:38:12 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-69b905c10ddso532893eaf.1
        for <opensbi@lists.infradead.org>; Sun, 17 May 2026 08:38:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779032290; cv=none;
        d=google.com; s=arc-20240605;
        b=DcjVYchhErElPJJBPoiT/GNTNTf4RuX1D6eiDYIiR+WOXZEymgpFsWEGLeJgSEPs1E
         ZSzDhCtxnKtC5VkQxR2BWamZwqFtF2yG/jUIE0ye1+loUHSJun4OnePh0ayEtmIIB2+x
         2SS9ERAWRWdmYomkBlj8U7AFQPqofL4d3aHU/ZRUxreTgWnE1FIWkiolZKTFY0TbxoC1
         ibVteg20tNLRBL2hRFaNhzy0CHhJiFpMgB+B3t3QucA640VJloDdmksT0ya+V0BNNesQ
         2TgJxIzkDs7qzbJ5tetIInfarwfV0ggvAdhPqnHAEu8HVlNOynIawuEdPLj/r90RmJwB
         /IFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BpOrEzlYn2Fa9J2PaYL4NjEmzu1hzzmn54xsO1jYfdo=;
        fh=7hBbRIFNEYucOOyQv3kdYfutQ6CqModA35wu4v02mGo=;
        b=BYAW7ZEDZcchINkz9wP+bzUHDSylzrDPKV2p67DWbgk+rmCMoxAIRt5JFwW7f2cQ2W
         jQwDq8bNOfsEIKGvcyfJC4kA9nUQzDswLoca40oEO7fRfIZRz+TRk6Db8K7oZUPo9VYD
         txpEo61v7MkSyct8gOQ0xvo1qgqkHNa6Ql/brjZDzGDGM6UDazhwAa9un7pLV2jN4+MQ
         8IHrDq/qJqDadBggTub/SDZKkGqoB/t3ZI/bsD2kks+RAITljlFzQKpTOrE0VxHIGuQa
         Hnwdlfes274Ds5h1uzka4J4RSm7JEcnl4D8nsV+w+JpfJNrVB+wjHKG4kyXpR0mvhVek
         UacQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1779032290; x=1779637090; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpOrEzlYn2Fa9J2PaYL4NjEmzu1hzzmn54xsO1jYfdo=;
        b=dwu1yhBJMMG5FmahFWwXfzFSNSo0XCYYk4CHdNl4kynmdyo+fbTEwbGPKddF3YAlMM
         Br6qNRYK7o2Iyum6kjSbvvBStM08P8UhN5fG/7Xs+hWTBKfvKnsSn9BsLQVGZ43pBtWy
         LTOZ+48ZlR2fHKBO5dwohmJzUUNFFMGFJQTiIbZxALNpADNFZS0+eCLe4K8hSgLggb/D
         jxCWyfpZT96IPunR6nGWDjMt4AOo4N6oIF5Ag/KzF+7Tw76YGwebXuuf7/9QqL95Qqym
         qJFcLBN7RgpVEJ7TbHz3pS3cgdo62ntiGjuq8AfATAGjbvXySaBXLdwTE3ijKrVzSZLx
         bXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779032290; x=1779637090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BpOrEzlYn2Fa9J2PaYL4NjEmzu1hzzmn54xsO1jYfdo=;
        b=nFIkI6sQBcbZsTHSXkHGpHvrN4oCXDcYnuQxYSVhwm+NBuNBpuGzs8egsvTiTs7vEn
         ybCXom5yfk5kGJwClMHG3wmSQ9p4//2zVlJDXYGLgZcdGLt2zhOnRHFBBsryusjDWCwl
         0oSqO7rX62EkWdfA4hL1JJcpZbJCQ57gdxRxDVHPcA/jeEo97SGr2L8497v/YGN4MKFk
         WC3lvU1IKNfBzAbjTvqoQTjlM0/5Me0PTvGbBE6a713aTISiCd0LJ0ZFGM5Lg0X5P1fg
         1WjWKDzYi02G93C6BBm0vBHGHRGvPOS+wEPz7pD+k2s7jgKgUq8kCHMv3c2ZEBGjsurK
         y1pw==
X-Forwarded-Encrypted: i=1; AFNElJ9LmT/5SMnGDLImERH0Y94kvTBw9QF0rndwQOHCRDnWuGLv++I2mxez8QF7nRYka8vsv5lWbOp4@lists.infradead.org
X-Gm-Message-State: AOJu0YwhHx++UwD1B6sBqWodOf38vfBqIPhWf+Qff5KYK2yKwmg5mMLq
	0HklIjQ6r6qZMvjf+Wop4Uqp14wBd6259GSX0hasnzW1z4X52jgx/rGlSYYbp4Pzz4bnsRKTsjk
	CWagpjZJ427G00pzEAyY26GASPJTRozlITpH0vByQUQ==
X-Gm-Gg: Acq92OGZWxHLTSBcd/AjeOX9fmA8iCKHR8vOcHrNNTqTgbAe9E/mGgKOONLdMWwcpz4
	jbUngDFMdcAv70GIH0P925Tow3ZpH6rGEeiUvm4ylj549Julp2m/3dGUc+7Ix5hc87C7xO4OmHf
	q85yHemEczbiBuckl7K7uHSJKgpqiKMDtDcf4AYel9wmdaWSOiuCLMnlf6ijITaESH7NkiyA1pp
	HYwf5MLbmTcpjOt/CeRN8qupMvKbQlnpVtVEaVmWBatStnKf4JrqfIxE320dZ19tk9si8f6DP40
	we4eNz3zNCjnlj/dRyq1NGtCgp5oZF1PLPgYNwY3Ig3xqg77dDFZfZ/io3AGNTjHgdBRiamVUmS
	lRi5beaHmXoA5LHYoBRX4fh/3OQ==
X-Received: by 2002:a05:6820:990:b0:694:6d72:9fd0 with SMTP id
 006d021491bc7-69c942d7dcemr7961672eaf.16.1779032289670; Sun, 17 May 2026
 08:38:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260516222143.23619-1-dave.patel@riscstar.com> <20260516222143.23619-4-dave.patel@riscstar.com>
In-Reply-To: <20260516222143.23619-4-dave.patel@riscstar.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 17 May 2026 21:07:57 +0530
X-Gm-Features: AVHnY4LhZIvZXhN_xWbRvQZLze7GkkZ6YqICYQoIMOaPxyK_ihQgcm6qW7yBJ_8
Message-ID: <CAAhSdy17KdFiJKT3d83+HCQodYpxaZnedUW4q=7ExdB+oyVg5Q@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] lib: sbi: domain FP/Vector context support for
 context switch
To: dave.patel@riscstar.com
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Anup Patel <anuppate@qti.qualcomm.com>, 
	Scott Bambrough <scott@riscstar.com>, Robin Randhawa <robin.randhawa@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Ray Mao <raymond.mao@riscstar.com>, 
	Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_083810_923873_3D236235 
X-CRM114-Status: GOOD (  28.84  )
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

T24gU3VuLCBNYXkgMTcsIDIwMjYgYXQgMzo1MeKAr0FNIDxkYXZlLnBhdGVsQHJpc2NzdGFyLmNv
bT4gd3JvdGU6Cj4KPiBGcm9tOiBEYXZlIFBhdGVsIDxkYXZlLnBhdGVsQHJpc2NzdGFyLmNvbT4K
Pgo+IFRoaXMgcGF0Y2ggYWRkcyBwcm9wZXIgc3VwcG9ydCBmb3IgcGVyLWRvbWFpbiBmbG9hdGlu
Zy1wb2ludCAoRlApIGFuZAo+IHZlY3RvciAoVikgY29udGV4dHMgaW4gdGhlIGRvbWFpbiBjb250
ZXh0IHN3aXRjaCBsb2dpYy4gRWFjaCBkb21haW4KPiBub3cgbWFpbnRhaW5zIGl0cyBvd24gRlAg
YW5kIHZlY3RvciBzdGF0ZSwgd2hpY2ggaXMgc2F2ZWQgYW5kIHJlc3RvcmVkCj4gZHVyaW5nIGRv
bWFpbiBzd2l0Y2hlcy4KPgo+IENvbmRpdGlvbmFsaXplIEZQIGFuZCBWZWN0b3Igc2F2ZS9yZXN0
b3JlIGJhc2VkIG9uIGV4dGVuc2lvbnMsIHVuY29uZGl0aW9uYWwKPiBzYXZlIGFuZCByZXN0b3Jl
IG9mIGZsb2F0aW5nLXBvaW50IChGUCkgYW5kIFZlY3RvciByZWdpc3RlcnMgZmFpbHMgb24KPiBn
ZW5lcmljIHBsYXRmb3JtIGZpcm13YXJlLiBUaGlzIGZpcm13YXJlIG11c3QgcnVuIG9uIG11bHRp
cGxlIHBsYXRmb3Jtcwo+IHRoYXQgbWF5IGxhY2sgdGhlc2UgZXh0ZW5zaW9ucy4KPgo+IEFkZHJl
c3MgdGhpcyBieSBjb25kaXRpb25hbGx5IGV4ZWN1dGluZyBGUCBzYXZlL3Jlc3RvcmUgb25seSBp
ZiB0aGUgdW5kZXJseWluZwo+IGhhcnQgc3VwcG9ydHMgdGhlIEYgb3IgRCBleHRlbnNpb25zLiBT
aW1pbGFybHksIHBlcmZvcm0gVmVjdG9yIHNhdmUvcmVzdG9yZQo+IG9ubHkgaWYgdGhlIGhhcnQg
c3VwcG9ydHMgdGhlIFZlY3RvciBleHRlbnNpb24uCj4KPiBDaGFuZ2VzIGluY2x1ZGU6Cj4KPiAt
IEFkZGVkIGBmcF9jdHhgIGFuZCBgdmVjX2N0eGAgbWVtYmVycyB0byBgc3RydWN0IGhhcnRfY29u
dGV4dGAuCj4gLSBJbnRyb2R1Y2VkIGR5bmFtaWMgdmVjdG9yIHN0cnVjdCBhbGxvY2F0aW9uIGZv
ciB2bGVuYiBpbiAnc3RydWN0IGhhcnRfY29udGV4dCcKPiAgIHRvIGFsbG9jYXRlIGFuZCBmcmVl
IHBlci1kb21haW4gRlAgYW5kIHZlY3RvciBjb250ZXh0Lgo+IC0gTW9kaWZpZWQgYHNiaV9kb21h
aW5fcmVnaXN0ZXIoKWAgdG8gaW5pdGlhbGl6ZSBGUC9WZWN0b3IgY29udGV4dCBwZXIgZG9tYWlu
Lgo+IC0gVXBkYXRlZCBgc3dpdGNoX3RvX25leHRfZG9tYWluX2NvbnRleHQoKWAgdG8gc2F2ZS9y
ZXN0b3JlIEZQIGFuZCB2ZWN0b3IKPiAgIGNvbnRleHRzIHNhZmVseToKPiAgICAgLSBFbnN1cmVz
IEZTL1ZTIGZpZWxkcyBpbiBgbXN0YXR1c2AgYXJlIGVuYWJsZWQgKHNldCB0byBJbml0aWFsKSBv
bmx5IGlmIE9mZi4KPiAtIEFkZGVkIHJ1bnRpbWUgY2hlY2tzIGZvciBGUCBhbmQgdmVjdG9yIGV4
dGVuc2lvbnMgd2hlcmUgbmVlZGVkLgo+IC0gQWRkZWQgU0JJX0hBUlRfRVhUX0YsIFNCSV9IQVJU
X0VYVF9ELCBTQklfSEFSVF9FWFRfViB0byBlbnVtCj4gICBzYmlfaGFydF9leHRlbnNpb25zIGFu
ZCB0aGUgc2JpX2hhcnRfZXh0W10gYXJyYXkuIFVzZSBzYmlfaGFydF9oYXNfZXh0ZW5zaW9uKCkK
PiAgIHRvIGNoZWNrIGZvciB0aGVzZSBjYXBhYmlsaXRpZXMgYmVmb3JlIHBlcmZvcm1pbmcgdGhl
IGNvbnRleHQgc3dpdGNoZXMKClRoaXMgY2hhbmdlbG9nIHNob3VsZCBiZSBwYXJ0IG9mIGNvdmVy
LWxldHRlciB3aXRoIGV2ZXJ5IHNlcmllcyByZXZpc2lvbi4KCj4KPiBUaGlzIGltcHJvdmVzIHN1
cHBvcnQgZm9yIG11bHRpLWRvbWFpbiBzeXN0ZW1zIHdpdGggRlAgYW5kIFZlY3Rvcgo+IGV4dGVu
c2lvbnMsIGFuZCBwcmV2ZW50cyBjb3JydXB0aW9uIG9mIEZQL1ZlY3RvciBzdGF0ZSBkdXJpbmcg
ZG9tYWluCj4gc3dpdGNoZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYXZlIFBhdGVsIDxkYXZlLnBh
dGVsQHJpc2NzdGFyLmNvbT4KPiAtLS0KPiAgaW5jbHVkZS9zYmkvc2JpX2hhcnQuaCAgICAgICB8
ICA2ICsrKysrKwo+ICBsaWIvc2JpL3NiaV9kb21haW5fY29udGV4dC5jIHwgMzcgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGxpYi9zYmkvc2JpX2hhcnQuYyAgICAgICAg
ICAgfCAgMyArKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspCj4KPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2JpX2hhcnQuaCBiL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmgK
PiBpbmRleCBhNzg4YjM0Yy4uNjhhMDFiOTcgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmkvc2Jp
X2hhcnQuaAo+ICsrKyBiL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmgKPiBAQCAtODcsNiArODcsMTIg
QEAgZW51bSBzYmlfaGFydF9leHRlbnNpb25zIHsKPiAgICAgICAgIFNCSV9IQVJUX0VYVF9YU0lG
SVZFX0NGTFVTSF9EX0wxLAo+ICAgICAgICAgLyoqIEhhcnQgaGFzIFhzZmNlYXNlIGV4dGVuc2lv
biAqLwo+ICAgICAgICAgU0JJX0hBUlRfRVhUX1hTSUZJVkVfQ0VBU0UsCj4gKyAgICAgICAvKiog
SGFydCBoYXMgViBleHRlbnNpb24gKi8KPiArICAgICAgIFNCSV9IQVJUX0VYVF9WLAo+ICsgICAg
ICAgLyoqIEhhcnQgaGFzIEYgZXh0ZW5zaW9uICovCj4gKyAgICAgICBTQklfSEFSVF9FWFRfRiwK
PiArICAgICAgIC8qKiBIYXJ0IGhhcyBEIGV4dGVuc2lvbiAqLwo+ICsgICAgICAgU0JJX0hBUlRf
RVhUX0QsCj4KPiAgICAgICAgIC8qKiBNYXhpbXVtIGluZGV4IG9mIEhhcnQgZXh0ZW5zaW9uICov
Cj4gICAgICAgICBTQklfSEFSVF9FWFRfTUFYLAo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9k
b21haW5fY29udGV4dC5jIGIvbGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYwo+IGluZGV4IDE1
OGY0OTkwLi5hM2Y2OWU3ZiAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9kb21haW5fY29udGV4
dC5jCj4gKysrIGIvbGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYwo+IEBAIC0xOCw2ICsxOCw4
IEBACj4gICNpbmNsdWRlIDxzYmkvc2JpX2RvbWFpbl9jb250ZXh0Lmg+Cj4gICNpbmNsdWRlIDxz
Ymkvc2JpX3BsYXRmb3JtLmg+Cj4gICNpbmNsdWRlIDxzYmkvc2JpX3RyYXAuaD4KPiArI2luY2x1
ZGUgPHNiaS9zYmlfdmVjdG9yLmg+Cj4gKyNpbmNsdWRlIDxzYmkvc2JpX2ZwLmg+Cj4KPiAgLyoq
IENvbnRleHQgcmVwcmVzZW50YXRpb24gZm9yIGEgaGFydCB3aXRoaW4gYSBkb21haW4gKi8KPiAg
c3RydWN0IGhhcnRfY29udGV4dCB7Cj4gQEAgLTU1LDYgKzU3LDExIEBAIHN0cnVjdCBoYXJ0X2Nv
bnRleHQgewo+ICAgICAgICAgc3RydWN0IGhhcnRfY29udGV4dCAqcHJldl9jdHg7Cj4gICAgICAg
ICAvKiogSXMgY29udGV4dCBpbml0aWFsaXplZCBhbmQgcnVubmFibGUgKi8KPiAgICAgICAgIGJv
b2wgaW5pdGlhbGl6ZWQ7Cj4gKwo+ICsgICAgICAgLyoqIGZsb2F0IGNvbnRleHQgc3RhdGUgKi8K
PiArICAgICAgIHN0cnVjdCBzYmlfZnBfY29udGV4dCBmcF9jdHg7Cj4gKyAgICAgICAvKiogdmVj
dG9yIGNvbnRleHQgc3RhdGUgKi8KPiArICAgICAgIHN0cnVjdCBzYmlfdmVjdG9yX2NvbnRleHQg
KnZlY19jdHg7Cj4gIH07Cj4KPiAgc3RhdGljIHN0cnVjdCBzYmlfZG9tYWluX2RhdGEgZGNwcml2
Owo+IEBAIC0xNDMsNiArMTUwLDIyIEBAIHN0YXRpYyBpbnQgc3dpdGNoX3RvX25leHRfZG9tYWlu
X2NvbnRleHQoc3RydWN0IGhhcnRfY29udGV4dCAqY3R4LAo+ICAgICAgICAgaWYgKHNiaV9oYXJ0
X2hhc19leHRlbnNpb24oc2NyYXRjaCwgU0JJX0hBUlRfRVhUX1NTUU9TSUQpKQo+ICAgICAgICAg
ICAgICAgICBjdHgtPnNybWNmZyAgICAgPSBjc3Jfc3dhcChDU1JfU1JNQ0ZHLCBkb21fY3R4LT5z
cm1jZmcpOwo+Cj4gKyAgICAgICAvKiBFYWdlciBjb250ZXh0IHN3aXRjaCBGICovCj4gKyAgICAg
ICBpZiAoc2JpX2hhcnRfaGFzX2V4dGVuc2lvbihzYmlfc2NyYXRjaF90aGlzaGFydF9wdHIoKSwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNCSV9IQVJUX0VYVF9GKSB8fAo+
ICsgICAgICAgICAgIHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2JpX3NjcmF0Y2hfdGhpc2hhcnRf
cHRyKCksCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTQklfSEFSVF9FWFRf
RCkpIHsKPiArICAgICAgICAgICAgICAgc2JpX2ZwX3NhdmUoJmN0eC0+ZnBfY3R4KTsKPiArICAg
ICAgICAgICAgICAgc2JpX2ZwX3Jlc3RvcmUoJmRvbV9jdHgtPmZwX2N0eCk7Cj4gKyAgICAgICB9
Cj4gKwo+ICsgICAgICAgLyogRWFnZXIgY29udGV4dCBzd2l0Y2ggViAqLwo+ICsgICAgICAgaWYg
KHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2JpX3NjcmF0Y2hfdGhpc2hhcnRfcHRyKCksCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTQklfSEFSVF9FWFRfVikpIHsKPiArICAg
ICAgICAgICAgICAgc2JpX3ZlY3Rvcl9zYXZlKGN0eC0+dmVjX2N0eCk7Cj4gKyAgICAgICAgICAg
ICAgIHNiaV92ZWN0b3JfcmVzdG9yZShkb21fY3R4LT52ZWNfY3R4KTsKPiArICAgICAgIH0KPiAr
Cj4gICAgICAgICAvKiBTYXZlIGN1cnJlbnQgdHJhcCBzdGF0ZSBhbmQgcmVzdG9yZSB0YXJnZXQg
ZG9tYWluJ3MgdHJhcCBzdGF0ZSAqLwo+ICAgICAgICAgdHJhcF9jdHggPSBzYmlfdHJhcF9nZXRf
Y29udGV4dChzY3JhdGNoKTsKPiAgICAgICAgIHNiaV9tZW1jcHkoJmN0eC0+dHJhcF9jdHgsIHRy
YXBfY3R4LCBzaXplb2YoKnRyYXBfY3R4KSk7Cj4gQEAgLTE4MCw2ICsyMDMsMjAgQEAgc3RhdGlj
IGludCBoYXJ0X2NvbnRleHRfaW5pdCh1MzIgaGFydGluZGV4KQo+ICAgICAgICAgICAgICAgICBp
ZiAoIWN0eCkKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VOT01FTTsKPgo+
ICsgICAgICAgICAgICAgICBpZiAoc2JpX2hhcnRfaGFzX2V4dGVuc2lvbihzYmlfc2NyYXRjaF90
aGlzaGFydF9wdHIoKSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgU0JJX0hBUlRfRVhUX1YpKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQg
bG9uZyB2bGVuYiA9IHZlY3Rvcl92bGVuYigpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIC8q
IENhbGN1bGF0ZSBzaXplOiBiYXNlIHN0cnVjdCArIDMyIHJlZ2lzdGVycyBvZiB2bGVuYiBzaXpl
ICovCj4gKyAgICAgICAgICAgICAgICAgICAgICAgc2l6ZV90IHZlY19zaXplID0gc2l6ZW9mKHN0
cnVjdCBzYmlfdmVjdG9yX2NvbnRleHQpICsgKDMyICogdmxlbmIpOwoKVXNlIHNiaV92ZWN0b3Jf
Y29udGV4dF9zaXplKCkgb3ZlciBoZXJlIGFzIHN1Z2dlc3RlZCBpbiBQQVRDSDEKCj4gKwo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIC8qIEFsbG9jYXRlIHRoZSB2ZWN0b3IgY29udGV4dCBwb2lu
dGVyICovCj4gKyAgICAgICAgICAgICAgICAgICAgICAgY3R4LT52ZWNfY3R4ID0gc2JpX3phbGxv
Yyh2ZWNfc2l6ZSk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFjdHgtPnZlY19jdHgp
IHsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNiaV9mcmVlKGN0eCk7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VOT01FTTsKPiArICAgICAg
ICAgICAgICAgICAgICAgICB9Cj4gKyAgICAgICAgICAgICAgIH0KPiArCj4gICAgICAgICAgICAg
ICAgIC8qIEJpbmQgY29udGV4dCBhbmQgZG9tYWluICovCj4gICAgICAgICAgICAgICAgIGN0eC0+
ZG9tID0gZG9tOwo+ICAgICAgICAgICAgICAgICBoYXJ0X2NvbnRleHRfc2V0KGRvbSwgaGFydGlu
ZGV4LCBjdHgpOwo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9oYXJ0LmMgYi9saWIvc2JpL3Ni
aV9oYXJ0LmMKPiBpbmRleCA2MGU5NWJjYS4uYjVlMGVlMTAgMTAwNjQ0Cj4gLS0tIGEvbGliL3Ni
aS9zYmlfaGFydC5jCj4gKysrIGIvbGliL3NiaS9zYmlfaGFydC5jCj4gQEAgLTM5Niw2ICszOTYs
OSBAQCBjb25zdCBzdHJ1Y3Qgc2JpX2hhcnRfZXh0X2RhdGEgc2JpX2hhcnRfZXh0W10gPSB7Cj4g
ICAgICAgICBfX1NCSV9IQVJUX0VYVF9EQVRBKHNzc3RhdGVlbiwgU0JJX0hBUlRfRVhUX1NTU1RB
VEVFTiksCj4gICAgICAgICBfX1NCSV9IQVJUX0VYVF9EQVRBKHhzZmNmbHVzaGRsb25lLCBTQklf
SEFSVF9FWFRfWFNJRklWRV9DRkxVU0hfRF9MMSksCj4gICAgICAgICBfX1NCSV9IQVJUX0VYVF9E
QVRBKHhzZmNlYXNlLCBTQklfSEFSVF9FWFRfWFNJRklWRV9DRUFTRSksCj4gKyAgICAgICBfX1NC
SV9IQVJUX0VYVF9EQVRBKHYsIFNCSV9IQVJUX0VYVF9WKSwKPiArICAgICAgIF9fU0JJX0hBUlRf
RVhUX0RBVEEoZiwgU0JJX0hBUlRfRVhUX0YpLAo+ICsgICAgICAgX19TQklfSEFSVF9FWFRfREFU
QShkLCBTQklfSEFSVF9FWFRfRCksCj4gIH07Cj4KPiAgX1N0YXRpY19hc3NlcnQoU0JJX0hBUlRf
RVhUX01BWCA9PSBhcnJheV9zaXplKHNiaV9oYXJ0X2V4dCksCj4gLS0KPiAyLjQzLjAKPgo+Cj4g
LS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKUmVn
YXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5z
YmkK
