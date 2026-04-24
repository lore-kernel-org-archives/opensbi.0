Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6C3F589DF
	for <opensbi@archiver.kernel.org>; Fri, 24 Apr 2026 03:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJyvrSLr7RP/I49wkTd/r89JbBe+rfWW9kK6Id1BS0A=; b=sBvYswGsRhS3G6
	NB5sBde4cTQ7776kmse3Xa/JFn/ektW59meawzB3TmwJ/f44pZx3e73zKfvagqZ76ShQUXAeHEWOc
	HGpbA8HV8zEorgI/KdZ5bPVU4c6W5J7c+BsX4uTme1qtaBYHAD7Byq8+6OmTWXho6z1+kl7ZX/ds0
	YMHZr1TYm6mhiiXqxs2+2B6lgCSBYdznfOCwqWH+Z5HxzssQKgEgIfWAwOgAO84ZnXljmHPfnHSvp
	tZCIvgcdAqEYiHkO5Qh6gx5777m6OLSMgZ8Ndkzhqm8rq9v8w7y+3/gXqauYf9rnIisdx0j+gYNvB
	hlSkN8FewCaL5dFhw99Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG7ej-0000000Cbbu-0ll0;
	Fri, 24 Apr 2026 03:56:41 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG7eg-0000000CbbW-3XCr
	for opensbi@lists.infradead.org;
	Fri, 24 Apr 2026 03:56:40 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2b2589c26e3so68523135ad.1
        for <opensbi@lists.infradead.org>; Thu, 23 Apr 2026 20:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777002998; x=1777607798; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bQg8uf6JbQavdcY1GKRAuWHuTzrxbgaBdFIzGEcbvXM=;
        b=Uave3vv9LBCvdqYddksMhxxeTlVZ7/CSUPlxVhYDe2DIwDtolo6ntk8JBriRLGgGP8
         DBjcTubGNUOpTMepy4f4TiVde4noKwPXMu0PVEC+bvUOLBlPeneAEitlnu44uKCQKAZi
         fkeZCBaV6j1oDir/J1y326DMbZ7EL7Q79FRESr8OHilTBr16SbEnYTc9VxgS5nuQQS6c
         6pa9FZb5X3BjqjuwO+dSbK2sDz0KJQQ6QsyV7BFw5fsrenXIYYbsTQX/cC/067SHi2U9
         wBGY/nXfBad1gCVqN+G+7dlbPkf5QK2DeEVgdO3pQmwPGK3yZWaYxgFwlirX8At5Y19v
         uHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777002998; x=1777607798;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bQg8uf6JbQavdcY1GKRAuWHuTzrxbgaBdFIzGEcbvXM=;
        b=g1L3DGjnr8Xqsc1N9rgiPS9LjDwV/tcErlA2oqYiWfIUClARlg7X89Tjt0QOyCBME1
         7i6ep9acM6upsY0jVUF1/UdavvR6hSi8heLBmN2IMNProVAZY3LOibhd78v0tduVtfK6
         W3NWP93NQCvnPhcVfEaRrqB8z2aV2AzDHrVeoN5J35SV7JSYyjE/TZ8z2pXsPKM51KBg
         d52IXrpqeexJROajesXU8nFKvge4o0a3fRvjY75jnK0HqLSzGqtJxOZZkcFWNfdXq0we
         3z8uXKOXNktoL/fSN5KPuA1JsxZh+UWHeXQusBmfcN7zLa6LekaOVooGmkOBLHr5/HQf
         NWxg==
X-Forwarded-Encrypted: i=1; AFNElJ/vIwlqhoJEA7R4CfGYfwE6qJEnx/rSa3ySn/8IsRqt2y4diyjSoXPG5qeDyU4NAo8M68PkXvwV@lists.infradead.org
X-Gm-Message-State: AOJu0YzcmNzW0RSAkx3DF2zdTDmNXzXmgMGNfR/pT+E1rd0fXoITQtMh
	FOQiKdeyZpPKwgkSIyYsmM7JGIhHdMoUpfeadKjw7IopVVhZP7k9th25
X-Gm-Gg: AeBDieu4FrrbHNFsG4w1S+4hGcm2acSJUzBdUIxjwkQzLVMRtnDBpoKVJ3trlpmog2H
	XSzGCIWRq54zsChiUYXYWswwdfnb2kdMIsSL5W+G4+DhXe9HFYTKM5c48ZkwU2iRZKkSMiD82zP
	03XyALU1wIRFvnUnhaYkoZeTtc8D3TeWibK/lImVnBPaAkhCP6VPgrpdIFCg5Oiz+mZ/xnXbIoS
	lb7MOpe/PY6teyRjnU+NsYlJ+cr3q8BI0YE6/AN49dmVoWTwFn58S/gghFu5uQPaatxOOqtnDSd
	MxmFAI6nHH8RUO0E38dWCq6LuIt+OHa4KJZ7SiJLaUJTVjFyhKuF6Iu2lhVrKIUwpwjzn9EiMAr
	5/m3oXvpydYVGbxxmzVLRXq8MOTdVu1y/XhnS5tl6TUfQsGArAelThwPfrxB3FzS/Zji9zU+xZN
	nX093blAEMhT9PMq2mikvjwnhTZfyhBRVVHu4Pgr2/zlVJk1oGwfBZcCduGl97YvUYufGRt4GHS
	8UkQIh4
X-Received: by 2002:a17:903:987:b0:2b2:3dd9:c5f5 with SMTP id d9443c01a7336-2b5fa0044d9mr343205915ad.36.1777002997582;
        Thu, 23 Apr 2026 20:56:37 -0700 (PDT)
Received: from localhost (193-119-51-209.tpgi.com.au. [193.119.51.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9fedf0sm252795965ad.6.2026.04.23.20.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 20:56:36 -0700 (PDT)
Date: Fri, 24 Apr 2026 13:56:33 +1000
From: Nicholas Piggin <npiggin@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Samuel Holland <samuel.holland@sifive.com>, opensbi@lists.infradead.org
Subject: Re: [PATCH 0/3] Timer events for OpenSBI
Message-ID: <aerny2qj9H9dJJ47@lima-default>
References: <20260415110002.2610929-1-anup.patel@oss.qualcomm.com>
 <aenCd32nbvLsxaQc@lima-default>
 <CAAhSdy0n6mstxpuLaRM7hBo7JhhOSMdMR=wJsQW6+H8YR4PYww@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy0n6mstxpuLaRM7hBo7JhhOSMdMR=wJsQW6+H8YR4PYww@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_205638_888650_0F01BAC4 
X-CRM114-Status: GOOD (  15.55  )
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

T24gVGh1LCBBcHIgMjMsIDIwMjYgYXQgMDE6Mzg6NTVQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBUaHUsIEFwciAyMywgMjAyNiBhdCAxMjoyN+KAr1BNIE5pY2hvbGFzIFBpZ2dpbiA8
bnBpZ2dpbkBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgQXByIDE1LCAyMDI2IGF0
IDA0OjI5OjU5UE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiA+IFRoaXMgc2VyaWVzIGV4
dGVuZHMgdGhlIHNiaV90aW1lciBmcmFtZXdvcmsgdG8gc3VwcG9ydAo+ID4gPiB0aW1lciBldmVu
dHMgdXNhYmxlIGZyb20gYW55IHBhcnQgb2YgT3BlblNCSS4gVGhlIHBsYXRmb3JtCj4gPiA+IGRy
aXZlcnMgaW4gT3BlblNCSSBjYW4gdXNlIHRpbWVyIGV2ZW50cyBmb3IgdGltZW91dHMgb3IKPiA+
ID4gcGVyaW9kaWMgY2hlY2tzLgo+ID4gPgo+ID4gPiBUaGVzZSBwYXRjaGVzIGNhbiBhbHNvIGJl
IGZvdW5kIGluIHNiaV90aW1lcl9pbXBfdjEgYnJhbmNoCj4gPiA+IGF0OiBodHRwczovL2dpdGh1
Yi5jb20vYXZwYXRlbC9vcGVuc2JpLmdpdAo+ID4KPiA+IFdoYXQgaXMgeW91ciBtIG1vZGUgdXNl
IGNhc2UgZm9yIHRoZXNlLCBJIHdvdWxkIGJlIGludGVyZXN0ZWQKPiA+IGluIHRoZSBjb250ZXh0
IG9mIHJldmlld2luZyBpdC4gR2VuZXJhbGx5IEkgdGhvdWdodCBpdCBsb29rcwo+ID4gZ29vZC4K
PiA+Cj4gCj4gV2UgaGF2ZSBhIFJQTUkgd2F0Y2hkb2cgcHJvcG9zYWwgdW5kZXIgZGV2ZWxvcG1l
bnQuIFRoaXMKPiBzZXJpZXMgd2lsbCBwcm92aWRlIGZvdW5kYXRpb24gZm9yIHRoZSBQb0Mgd29y
ayBvZiB0aGUgUlBNSQo+IHdhdGNoZG9nIHByb3Bvc2FsLiBCYXNpY2FsbHksIHRoZSBPcGVuU0JJ
IGZpcm13YXJlIGNhbiBlbXVsYXRlCj4gUlBNSSB3YXRjaGRvZyBvdmVyIFNCSSBNUFhZIGNoYW5u
ZWwgZm9yIHRoZSBzdXBlcnZpc29yIHNvZnR3YXJlLgo+IFRoaXMgT3BlblNCSSBjYW4gcHJvdmlk
ZSBhIHNlcGFyYXRlIHdhdGNoZG9nIGZvciBlYWNoIHN1cGVydmlzb3IKPiBkb21haW4uIEluIGFi
c2VuY2Ugb2YgSFcgd2F0Y2hkb2cgZm9yIE0tbW9kZSBmaXJtd2FyZSwgdGhlIFB1Qwo+IGZpcm13
YXJlIGNhbiBhbHNvIGltcGxlbWVudCBSUE1JIHdhdGNoZG9nIG92ZXIgUlBNSSBzaGFyZWQKPiBt
ZW1vcnkgdHJhbnNwb3J0LgoKT2ggbmljZSwgdGhhdCdzIGFuIGltcG9ydGFudCBmZWF0dXJlIGZv
ciBIQS4gR29vZCB1c2Ugb2YgbSBtb2RlCnRpbWVycy4KClRoYW5rcywKTmljawoKLS0gCm9wZW5z
YmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
