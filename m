Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2488BC88E5C
	for <opensbi@archiver.kernel.org>; Wed, 16 Sep 2026 05:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mjuLGJGU/Sf7E9mEppvSwULh88YWLvLV7yzLet5ISwk=; b=WiYPUb+BIml53T
	RUx1aXQnClwUJiNevZE9rp5LAZK/xCqgArczeTn+GMqhUBxw/UR1o9wS1D4QIMCX0j5tqTXlrKf7A
	6yvqcHwt3ZgcqDndUtEvEOaQ2yO24OiXU1Q2USA17Hcj2SZfHcNV7RIvFAdJlw8nvRsJteJR58UC+
	3chaKlZfAiSXWH+Mxe/bEGTX6fxLaxDy2E7uTyPSlQDuKTasHM8EFdYc0ruoA80hIpFCrg/JpaLuV
	35MsozuR7VhagMLeYmwFbbIfNZDHM21xkUmhYT/Q2E7LKnhlmPcIcla9ZiPGZKIHHM7VPbftGucyu
	33r+8pu6GEpQnFtHEdng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6huP-00000008Mmf-02Dc;
	Wed, 16 Sep 2026 05:10:13 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6huN-00000008MmE-0aFJ
	for opensbi@lists.infradead.org;
	Wed, 16 Sep 2026 05:10:12 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6350f91so215533f8f.1
        for <opensbi@lists.infradead.org>; Tue, 15 Sep 2026 22:10:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789535409; cv=none;
        d=google.com; s=arc-20260327;
        b=As4yHi610FS4p7dS26gu4kZQJR0N7tbZf2UQmQ7IVueRpbYdI7Byin1HFZjg547st/
         NGMvRBE79H8YKjMBRgiI/urvAalaag4TQq70bcDJOBY9/5rQM4SlPVvTfc+9yYRFN2he
         aMWZg/Ei3ihlhlQ1lsmM+3L0dnBxLl1z+NNP99URb9UZry46MYIHa9uVtcytD2LxB/NC
         ugte39mgupnjqotoe4nxDLPvcEExuDeE7w+Atb717pNwVP4LFslC4sY2POIuuZTKHZ/N
         m0viRCkdXr4DOTjZk7HFCukI3wMMcgbWNPV+DPW3p9ri55fyyIZVMSOHlIoEUo01q+nU
         3hQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Tq4HJ5EFsFLoI9vETV8/X2MeuUAjuH38UCmWtlYeVh8=;
        fh=eQRLnJNeHQBGvSQQ3K81dsZjCFpV01l3b0rpGkosk9o=;
        b=L7h7J1cXs51fuj4EafhT2Uc7RyxCvIZqVg0v3ADC6cHJuWTGgJomGM6iwmtHMd7f/0
         TWNeJSHPKyf/Apa4nuGjwJXsD1Fc/ukHK2MA2vVxr9zXpVSJveG1KwQssQmgybpefgpQ
         wkZpUotvPgrUr9AmzSh92C91SU86wVehx1yLCtDnL1wBcvexY88k7mEv4YZ16q7el+v/
         opsBGPP+Fs+fDYlMn0T5cwGq+/uvji4mTxCrxEtngPyX9HD4R1eRkfqocp5bV9Tu86oc
         PzFwDIMetroibnR1SB3GSwC7IhylA4z9ZsD7V3h7Ufj3EZoTDnn5itUY0sbV9uzhlVho
         s0mw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789535409; x=1790140209; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tq4HJ5EFsFLoI9vETV8/X2MeuUAjuH38UCmWtlYeVh8=;
        b=JmTSYmIw1ZJv5gxdw+1B0B20bFbQhACHMpaifmEv8t9ezWdFcmdjwoKWWUbTVkiayK
         G/99yRWD07TUmmR+3tt/yeElNDUXL1Spu3kPYqWPaMNauvFN7L3EF8NEB564XET8Lujj
         g9nkrRiF156tQ4Jnsn9NNrhIAMv/z1LRJ9e6Vjm3H3rFKGcDjU0oqKckgml9VVPGq7JR
         85ocyV4IoICJhMDalolj+7lgkqF+Tn8FGo0fBwqPnP+MQBH2v3v6pfGpxiOAVhrTI3J+
         RfKKai+8x+IKaJy8HVTHAFt0gGqc+6RdW5FCAleLm9f8F/eHY/hgkuxhR93ow37rwH98
         utNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789535409; x=1790140209;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tq4HJ5EFsFLoI9vETV8/X2MeuUAjuH38UCmWtlYeVh8=;
        b=eTfUnHOIFz45oQq4oob9+rG66FwuWG17ARHjhTqEfcwDpp5ldnRLLAotrcG5di5Wco
         aq3WaAu5gvr2Jx8v9Z55l/QWAvtAFA4aYtRc2Dp81WFhfojYFD9pa7nBswvuJPYPsZNC
         Tlv7FTfGghAtkFOfoluii/qvn2bJkU9Iz0yAIKFwoUw0iNDjgwo+beWfCtlKCI0gSQiK
         5364q2HV/Nabc5sa257OChRyeI5uGeCdvz8zAalD4ZRwXCPPdWvfzjQbUNpy9FdRITFR
         B/8rNw58DHpsOQE+lQVKS6/xtwcNiCTHpKC9uMzY7ERJ6kwL5Lur03V7GjpAZFD9TEkH
         jT+A==
X-Gm-Message-State: AFuF++l+ewaA8YefgXqTZPQa/NypFXBZ7ytMCidJ/zTxPczJsTnD+6ER
	oYfpO6f2QWbH5lz4cXAWz9xMsMEsWNfJDKbFy5Ff4txDFXn4HLJcYrmTm07OyziktKhoyP7bW9C
	Dy6VF7AU68mVZQvaeHg++qyDRR7CVvL1zjk+gpsF8Xg==
X-Gm-Gg: AYBFou21aI2o8TyDMXzsRp0bK1K7BwELO4GAmF/QDKl3IOPtzcnHV5d+DsY9F5P1LJF
	hFAZRSHfFP/UoEbV7ipFnaXvcFeR0e+PgeL4VvmjtkRM6MZY/deyrxlQ+AHGejld9doZMc/ukDh
	t4BRL7P5t9gByds/Io31hSv0HQcYdFTStt67ZvmkJsvcrgH8cXYFBDJ9ntKvhLp4zXBMTX0wlJC
	2nKLV9A0g3TSFQm7vVIsBelOio1v4k19a5cbNcv6Di60Qp02lfxT6tn58+RhAIEoV4gKo4PHvk/
	jBziR/KOkotlJNaf3Hl8rBabuqh0HusvDT6HXNG9RU2iIg1yQ3s4VYKhO1XDy4P5R44aCbWkMYI
	hOlem7HPvOdKxb26WYhr4H20CXVBAm38vSzJ3WAWmiB9w2qd6eqYcapy3Z9K9eqFkPfp8aKtIpA
	==
X-Received: by 2002:a05:600c:4708:b0:49d:93c:d903 with SMTP id
 5b1f17b1804b1-49eb7322de3mr9455735e9.20.1789535409331; Tue, 15 Sep 2026
 22:10:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260901022211.2619560-1-zong.li@sifive.com> <CANXhq0pLe2F+TWCQEe_hDqKgQ7ZH+N_9LbL+S1WDmi4UTYVghw@mail.gmail.com>
In-Reply-To: <CANXhq0pLe2F+TWCQEe_hDqKgQ7ZH+N_9LbL+S1WDmi4UTYVghw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 16 Sep 2026 10:39:58 +0530
X-Gm-Features: AcwNN1UeM5TVPBKIQU5bdbrnqlv0wgjxHlgG3JZtvxRctL3C4RNxhkfJsOvuY8o
Message-ID: <CAAhSdy1zG9_axxmzLWKKZnyufkGPHyiN==O5Q9O4OgOSbcGUgA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Support OpenSBI firmware header
To: Zong Li <zong.li@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_221011_220377_6510D627 
X-CRM114-Status: GOOD (  22.12  )
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

T24gVHVlLCBTZXAgMTUsIDIwMjYgYXQgMToxN+KAr1BNIFpvbmcgTGkgPHpvbmcubGlAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIFNlcCAxLCAyMDI2IGF0IDEwOjIy4oCvQU0gWm9uZyBM
aSA8em9uZy5saUBzaWZpdmUuY29tPiB3cm90ZToKPiA+Cj4gPiBUaGlzIHNlcmllcyBhZGRzIE9w
ZW5TQkkgZmlybXdhcmUgaGVhZGVyLiBUaGUgbW90aXZhdGlvbiBpcyB3aGVuIGEKPiA+IHN5c3Rl
bSB3aGVyZSB0aGUgcHJldmlvdXMgYm9vdGluZyBzdGFnZSBydW5zIG9uIGEgZGVkaWNhdGVkIGJv
b3QKPiA+IHByb2Nlc3NvciwgaXQgY2FuIGxvYWQgYW5kIHBhdGNoIHRoZSBPcGVuU0JJIGltYWdl
IGluIERSQU0gYW5kIHRoZW4KPiA+IHJlbGVhc2UgdGhlIGFwcGxpY2F0aW9uIGhhcnQgdGhhdCBy
dW5zIE9wZW5TQkksIGJ1dCBpdCBjYW4gbmV2ZXIgZXhlY3V0ZQo+ID4gb24gdGhhdCBoYXJ0IGFu
ZCB0aGVyZWZvcmUgY2Fubm90IHBsYWNlIGFueXRoaW5nIGluIGl0cyByZWdpc3RlcnMsIHN1Y2gK
PiA+IGFzICRhMCwgJGExIGFuZCAkYTIKPiA+Cj4gPiBFdmVyeSBPcGVuU0JJIGZpcm13YXJlIGlt
YWdlLCByZWdhcmRsZXNzIG9mIGl0cyB0eXBlIChGV19EWU5BTUlDLAo+ID4gRldfSlVNUCBvciBG
V19QQVlMT0FEKSwgc3RhcnRzIHdpdGggYSBmaXhlZCAxMjgtYnl0ZSBoZWFkZXIuIFRoZSBoZWFk
ZXIKPiA+IHNlcnZlcyB0d28gcHVycG9zZXM6Cj4gPgo+ID4gMS4gaXQgbGV0cyB0aGUgcHJldmlv
dXMgYm9vdGluZyBzdGFnZSByZWNvZ25pemUgYW4gT3BlblNCSSBmaXJtd2FyZQo+ID4gICAgaW1h
Z2UgYW5kIGZpbmQgb3V0IHdoYXQgaXQgd2FzIGJ1aWx0IGZvciwgYW5kCj4gPiAyLiBpdCBnaXZl
cyB0aGUgcHJldmlvdXMgYm9vdGluZyBzdGFnZSBhIHdlbGwta25vd24gcGxhY2UgaW5zaWRlIHRo
ZQo+ID4gICAgaW1hZ2UgdG8gaGFuZCBvdmVyIHRoZSBib290IGFyZ3VtZW50cyBieSBwYXRjaGlu
ZyBhIGZldyB3b3JkcywKPiA+ICAgIGluc3RlYWQgb2Ygc2V0dGluZyB1cCB0aGUgKmEwKiwgKmEx
KiBhbmQgKmEyKiByZWdpc3RlcnMuCj4gPgo+ID4gVGhpcyBzZXJpZXMgYWxzbyBwcm92aWRlcyBh
IGRvY3VtZW50ICdkb2NzL2Zpcm13YXJlL2Z3X2hlYWRlci5tZCcgdG8KPiA+IGRlc2NyaWJlIHRo
ZSBsYXlvdXQgb2YgdGhlIDEyOC1ieXRlIE9wZW5TQkkgZmlybXdhcmUgaGVhZGVyLCB0aGUKPiA+
IGEwL2ExL2EyIG92ZXJyaWRlIGZsYWdzLCB3aGF0IGEgcHJldmlvdXMgYm9vdGluZyBzdGFnZSBp
cyBleHBlY3RlZCB0byBwdXQKPiA+IGluIGVhY2ggcmVnaXN0ZXIsIGFuZCBhbiBleGFtcGxlIG9m
IGhvdyB0byBwYXRjaCB0aGUgaGVhZGVyLgo+ID4KPiA+IFRoYW5rcyBBbnVwIGZvciBkaXNjdXNz
aW5nIGl0IGFuZCBwcm92aWRpbmcgdGhlIGlkZWFzCj4gPgo+Cj4gSGkgQW51cCwKPiBDb3VsZCBJ
IGtub3cgaWYgdGhpcyBwYXRjaCBzZXQgbG9va3MgZ29vZCB0byB5b3U/IFRoYW5rcwoKT3ZlcmFs
bCwgdGhlIHNlcmllcyBpcyBpbiB2ZXJ5IGdvb2Qgc2hhcGUuIE9uY2UgdGhlIGNvbW1lbnQgYWJv
dXQKRldfSEVBREVSX0ZMQUdTX09WRVJSSURFX0EwIGlzIGFkZHJlc3NlZCwgSSB3aWxsIG1lcmdl
LgoKVGhhbmtzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
b3BlbnNiaQo=
