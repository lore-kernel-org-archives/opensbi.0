Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA340CD8C89
	for <opensbi@archiver.kernel.org>; Sun,  7 Jun 2026 16:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+slERAACMEfAqaN1GcObOZBB6Mp3aM0ktvvSAcee/Ms=; b=JM0xG/fpcZszMx
	bf9he06ydSQl9oH06N9L/b9v1r6O1IcWzMp0GKvL0WZOW6+cNosZxrVZTp3BaPWuFcQpE5+pQUnR7
	G4MWNqdDPHHZmYdIxbVEDQefhd6FpRppCnR5zYC26AbsJNot1P57jKmD8Z7FL7ArNzGUpBwWJrtZv
	op+1be7JYggocQc7DF330Rw3mvpG2+VlLQ4foKQjMJVZtbO5I/5zGX9d4UuRmT2BBKwlNZQI0lMR2
	bz+vWmRepgg9uoIUbgJeGgsPLYfRxIjCJZD8t3UPy/3W5BUX/ZqFgwqdM8t+bp9Flcbqva9zPQY9A
	k2fvcZ6S0pLjvT6FaGwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWG93-00000002Knw-2miI;
	Sun, 07 Jun 2026 16:14:41 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWG91-00000002KnT-3Wqd
	for opensbi@lists.infradead.org;
	Sun, 07 Jun 2026 16:14:41 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-69e7dfcea4dso647136eaf.1
        for <opensbi@lists.infradead.org>; Sun, 07 Jun 2026 09:14:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780848879; cv=none;
        d=google.com; s=arc-20240605;
        b=SmphxJZjcYACZiIJkE3akKkRuYV5tV4izYbkOcb95WSyGKLh6RR/PuX8n2A6lcPgnI
         jmDedfevSZJCUwwGW3MkN6GeNnbMH4W5cwxhpvVio9PhzROrvMMuVd9SPEQUVyPqaQ10
         2pNsJpYv9Wh3wln2YRLbzBlWDCMNbn+Rx444zQxH+0ItKh0out0aDAXEHKxI5vRKbfDy
         Wxa+VA3DmjG5j2VHAheyvkIR112cVqXX+sP7hDBd+j57ja8rkdfNjj5nw46kYQM9vfex
         VVW4/IXUyWck578lqQtzrylejp1HNRMpUFlTc/o8gZUpPul2HelDMSWPATvK6XOxmE3T
         DWNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LvHBd2leaEpNFYD1gGtrtxl2tz3UhAmtniHMWEUzSTc=;
        fh=KFL2ZnSEuyOnR/Qh1iesqX1KcdxrnTrRWFET+qVGlVQ=;
        b=aF3QAMf7AYGg+1IpnWoT83WB9W1lZyPKLq5+dF9WveGCS1pEm8lJlCR2vVThemjFb4
         wrybeqZ3o0rhhLIhhHV1JhghUuvy654OZgwSIvDMBgmR2qR7QA+3qT3xsKqyQmjvobx3
         nRV5aTmF5xSkWoe2PywPDDPXGjBdkEXqhcsvfyVpAPADCVVwaxYGvIvtNfAVx+JiuH4m
         hNWK+KwFwMOzTwK7+YhnTKIiDcOJL89K9UlpAh9mIcLlz8HhHOLifASiDgbZpNg5Nzom
         BA/6U8K2xKm0bH+N0fqGSlcVjmle7TAnC3+TEDrKhd9Jcoxk2z0YnIZZoqR6gtc06FCy
         DNFg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780848879; x=1781453679; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvHBd2leaEpNFYD1gGtrtxl2tz3UhAmtniHMWEUzSTc=;
        b=kBJlkQXrVQrj8kOO3VjFbE/LaCMfdhe/SdhSd/RQda8OnrCiZZubBji+M8SlMXLUua
         FJfHbPqtDzdGpsVJjQ+08cF8h0kvjDUXBl72bpX8KXQjzLFlXiG7utXhj04T3Kheevoa
         Q6vfUeagzU0JQCys9XBalLpy+1G1rmL1Rn60ZX26lzc9eO6UVBEKLxR2vJcTJ6ZsiolZ
         ePKoh5Y5SqZtA57sEloUeH9mQNmos5pMnJJ33oSFlQWSIHZH130nB7OGmPzxrcbj8GTb
         VdsLcGWmS3ELzoSrF1bBYFRbYc7NA1KsIF1XRXAjxPr9EjHpofpNchvjIB09qiwRlKN9
         QWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780848879; x=1781453679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LvHBd2leaEpNFYD1gGtrtxl2tz3UhAmtniHMWEUzSTc=;
        b=YYRNWT3D1w+DqmxSAOdT3oQtBtqN5YVftkNxcqivbIdzMoSvqkrocIEgCAvzDQczzG
         XXHCIEHZ8Jq9FLMtCJKNJJVEXkCFhnuTCxdQW6y4iYVb6wMXW3My3mm9P+yn66rgzQtK
         dyl6AP0O6dnAWme7UkdFM1wukKmDAgAZds057mhyTZ3CKjE9QshBXw0her6kCsZs0jjk
         HbAhUmi6rnQdjBNvKtydk1q+zmM8Egy+PejbSBmT8LH3Qiz6E3CxU2WMXS5omyLgnqsm
         ZID0iAffiNZCHg+shDLRPGY0KjAvmNCcTmWvDRV7bntzStaNYP7ZMfowDL/dwhpQcWGw
         Hj2g==
X-Gm-Message-State: AOJu0YwqCaHpHQydIYm6QrYg9UCJaLvuLHkgU0iskAVfYIG40N3U13Gb
	VgYmgV8V5IAO17guoca6HafvwcIh6s35K0C2hCWLSvgh6QFN4lFSQh4w+CGCerFcLPoQWGQa7Rh
	8rxtRjgsE/aMe77UXpTXGl0zjR4NoQ58/gvHTbO8bRA==
X-Gm-Gg: Acq92OED88neph8u094lZjLBSrmgB2QbJ5scat9H7j4MSulBuWL3srk5OIHtD/jMElj
	OJedRz1ds7cs6KUSZYZjEUs9kryB6qX3yppmGERnXXwrEzMwCW/cw4o7GsNuQhRDrpz7Y7D5epF
	t294gO1B+aRbQs6anuEuCFPK+r5Vk8Grb4Qb9HOy31ktveJNmqPXevMogspxeezv17LCpWzECId
	hZVVXxfyyIa6oxqwGK1rtwXbkcJUJDOcnINO1W+OV/3jEEvEzd4xfwN8diPOLKHt7sAa7/hAArB
	0H69PHQMibYHpqF5bkIQsQdgk/ZUXeboKuraU8jqdkYXza56yPFuRcwR5+pTw+hfN3aqqbp8vcm
	7AU4ntx159AqjkZZGLalf2tUrVEC1bhKftaIGW6qA49PKZbm1
X-Received: by 2002:a05:6820:174f:b0:69e:98c0:a91 with SMTP id
 006d021491bc7-69e98c026c0mr272910eaf.36.1780848878683; Sun, 07 Jun 2026
 09:14:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260328054347.3706029-1-david.garcia@aheadcomputing.com> <20260328054347.3706029-5-david.garcia@aheadcomputing.com>
In-Reply-To: <20260328054347.3706029-5-david.garcia@aheadcomputing.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 7 Jun 2026 21:44:27 +0530
X-Gm-Features: AVVi8CeSfGQSJZCmLluJkNDpho4s_7lRTeCgGGuozW2Z1vAHQURyYFiMIiLZ0u0
Message-ID: <CAAhSdy0Zk56FKSmEOe=i7gyrCHgmzb0MMzN1OQgGwnKSSCVqiQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] include: mailbox: rpmi_msgprot: Add RPMI performance
 domain flag defines
To: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_091439_894612_D62800E8 
X-CRM114-Status: GOOD (  17.22  )
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

T24gU2F0LCBNYXIgMjgsIDIwMjYgYXQgMTE6MTTigK9BTSBEYXZpZCBFLiBHYXJjaWEgUG9ycmFz
CjxkYXZpZC5nYXJjaWFAYWhlYWRjb21wdXRpbmcuY29tPiB3cm90ZToKPgo+IEFkZCBiaXQtZmll
bGQgZGVmaW5lcyBmb3IgdGhlIFJQTUkgcGVyZm9ybWFuY2UgZG9tYWluIGF0dHJpYnV0ZXMgZmxh
Z3MKPiBhbmQgZmFzdC1jaGFubmVsIGF0dHJpYnV0ZXMgZmxhZ3MgYXMgc3BlY2lmaWVkIGluIHRo
ZSBSUE1JIHNwZWNpZmljYXRpb24uCj4gVGhlc2UgYXJlIG5lZWRlZCBieSBwbGF0Zm9ybSBpbXBs
ZW1lbnRhdGlvbnMgdGhhdCBwcm92aWRlIFJQTUkKPiBwZXJmb3JtYW5jZSBzZXJ2aWNlcyAoZS5n
LiBEVkZTIGNvbnRyb2xsZXJzKS4KPgo+IEFsc28gYWRkIHRoZSBtaXNzaW5nIGRiX3dyaXRlX3Zh
bHVlIGZpZWxkIHRvCj4gcnBtaV9wZXJmX2dldF9mYXN0X2Nobl9hdHRyX3Jlc3AgdG8gbWF0Y2gg
dGhlIFJQTUkgc3BlYyBsYXlvdXQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBFLiBHYXJjaWEg
UG9ycmFzIDxkYXZpZC5nYXJjaWFAYWhlYWRjb21wdXRpbmcuY29tPgo+IC0tLQo+ICBpbmNsdWRl
L3NiaV91dGlscy9tYWlsYm94L3JwbWlfbXNncHJvdC5oIHwgMTggKysrKysrKysrKysrKysrKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9zYmlfdXRpbHMvbWFpbGJveC9ycG1pX21zZ3Byb3QuaCBiL2luY2x1ZGUvc2JpX3V0aWxz
L21haWxib3gvcnBtaV9tc2dwcm90LmgKPiBpbmRleCBmOGIxNjc1My4uN2NlMWNhOWYgMTAwNjQ0
Cj4gLS0tIGEvaW5jbHVkZS9zYmlfdXRpbHMvbWFpbGJveC9ycG1pX21zZ3Byb3QuaAo+ICsrKyBi
L2luY2x1ZGUvc2JpX3V0aWxzL21haWxib3gvcnBtaV9tc2dwcm90LmgKPiBAQCAtODMwLDYgKzgz
MCwyMyBAQCBzdHJ1Y3QgcnBtaV9kcHdyX2dldF9zdGF0ZV9yZXNwIHsKPiAgICAgICAgIHUzMiBz
dGF0ZTsKPiAgfTsKPgo+ICsjZGVmaW5lIFJQTUlfUEVSRl9ET01BSU5fQVRUUlNfRkxBR1NfTUFT
SyAoN1UgPDwgMCkKPiArI2RlZmluZSBSUE1JX1BFUkZfRE9NQUlOX0FUVFJTX0ZMQUdTX0ZBU1RD
SEFOTkVMX1NVUFBfUE9TIDAKPiArI2RlZmluZSBSUE1JX1BFUkZfRE9NQUlOX0FUVFJTX0ZMQUdT
X1BFUkZfTFZMX0NIR19TVVBQX1BPUyAxCj4gKyNkZWZpbmUgUlBNSV9QRVJGX0RPTUFJTl9BVFRS
U19GTEFHU19QRVJGX0xJTUlUX0NIR19TVVBQX1BPUyAyCj4gKyNkZWZpbmUgUlBNSV9QRVJGX0RP
TUFJTl9BVFRSU19GTEFHU19GQVNUQ0hBTk5FTF9TVVBQICgxVSA8PCBSUE1JX1BFUkZfRE9NQUlO
X0FUVFJTX0ZMQUdTX0ZBU1RDSEFOTkVMX1NVUFBfUE9TKQo+ICsjZGVmaW5lIFJQTUlfUEVSRl9E
T01BSU5fQVRUUlNfRkxBR1NfUEVSRl9MVkxfQ0hHX1NVUFAgKDFVIDw8IFJQTUlfUEVSRl9ET01B
SU5fQVRUUlNfRkxBR1NfUEVSRl9MVkxfQ0hHX1NVUFBfUE9TKQo+ICsjZGVmaW5lIFJQTUlfUEVS
Rl9ET01BSU5fQVRUUlNfRkxBR1NfUEVSRl9MSU1JVF9DSEdfU1VQUCAoMVUgPDwgUlBNSV9QRVJG
X0RPTUFJTl9BVFRSU19GTEFHU19QRVJGX0xJTUlUX0NIR19TVVBQX1BPUykKPiArCj4gKyNkZWZp
bmUgUlBNSV9QRVJGX0ZBU1RDSEFOX0FUVFJTX0ZMQUdTX01BU0sgKDdVIDw8IDApCj4gKyNkZWZp
bmUgUlBNSV9QRVJGX0ZBU1RDSEFOX0FUVFJTX0ZMQUdTX0RCX1NVUFBfUE9TIDAKPiArI2RlZmlu
ZSBSUE1JX1BFUkZfRkFTVENIQU5fQVRUUlNfRkxBR1NfREJfV0lEVEhfUE9TIDEKPiArI2RlZmlu
ZSBSUE1JX1BFUkZfRkFTVENIQU5fQVRUUlNfRkxBR1NfREJfU1VQUCAoMVUgPDwgUlBNSV9QRVJG
X0ZBU1RDSEFOX0FUVFJTX0ZMQUdTX0RCX1NVUFBfUE9TKQo+ICsjZGVmaW5lIFJQTUlfUEVSRl9G
QVNUQ0hBTl9BVFRSU19GTEFHU19EQl9XSURUSF9NQVNLICgzVSA8PCBSUE1JX1BFUkZfRkFTVENI
QU5fQVRUUlNfRkxBR1NfREJfV0lEVEhfUE9TKQo+ICsjZGVmaW5lIFJQTUlfUEVSRl9GQVNUQ0hB
Tl9BVFRSU19GTEFHU19EQl9XSURUSF84ICgwVSA8PCBSUE1JX1BFUkZfRkFTVENIQU5fQVRUUlNf
RkxBR1NfREJfV0lEVEhfUE9TKQo+ICsjZGVmaW5lIFJQTUlfUEVSRl9GQVNUQ0hBTl9BVFRSU19G
TEFHU19EQl9XSURUSF8xNiAoMVUgPDwgUlBNSV9QRVJGX0ZBU1RDSEFOX0FUVFJTX0ZMQUdTX0RC
X1dJRFRIX1BPUykKPiArI2RlZmluZSBSUE1JX1BFUkZfRkFTVENIQU5fQVRUUlNfRkxBR1NfREJf
V0lEVEhfMzIgKDJVIDw8IFJQTUlfUEVSRl9GQVNUQ0hBTl9BVFRSU19GTEFHU19EQl9XSURUSF9Q
T1MpCj4gKwo+ICAvKiogUlBNSSBQZXJmb3JtYW5jZSBTZXJ2aWNlR3JvdXAgU2VydmljZSBJRHMg
Ki8KPiAgZW51bSBycG1pX3BlcmZvcm1hbmNlX3NlcnZpY2VfaWQgewo+ICAgICAgICAgUlBNSV9Q
RVJGX1NSVl9FTkFCTEVfTk9USUZJQ0FUSU9OID0gMHgwMSwKPiBAQCAtOTQxLDYgKzk1OCw3IEBA
IHN0cnVjdCBycG1pX3BlcmZfZ2V0X2Zhc3RfY2huX2F0dHJfcmVzcCB7Cj4gICAgICAgICB1MzIg
cmVnaW9uX3NpemU7Cj4gICAgICAgICB1MzIgZGJfYWRkcl9sb3c7Cj4gICAgICAgICB1MzIgZGJf
YWRkcl9oaWdoOwo+ICsgICAgICAgdTMyIGRiX3dyaXRlX3ZhbHVlOwo+ICAgICAgICAgdTMyIGRi
X2lkX2xvdzsKPiAgICAgICAgIHUzMiBkYl9pZF9oaWdoOwo+ICAgICAgICAgdTMyIGRiX3BlcnNl
cnZlZF9sb3c7CgpUaGUgZGJfaWRfbG93LCBkYl9pZF9oaWdoLCBhbmQgZGJfcHJlc2VydmVkX2xv
dyBhcmUgYWxzbwpub3QgYWxpZ25lZCB3aXRoIHRoZSBSUE1JIHNwZWMgaGVuY2Ugc2hvdWxkIGJl
IHJlbW92ZS4KCj4gLS0KPiAyLjQzLjAKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+
IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKT3ZlcmFsbCwgdGhpcyBwYXRjaCBsb29rcyBnb29k
LiBJIGhhdmUgdGFrZW4gY2FyZSBvZiB0aGUKYWJvdmUgY29tbWVudCBhdCB0aGUgdGltZSBvZiBt
ZXJnaW5nLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpB
cHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51
cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
