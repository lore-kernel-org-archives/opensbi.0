Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD052C83F03
	for <opensbi@archiver.kernel.org>; Wed,  9 Jul 2025 10:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1gyB8qfpzwY4P+eMjBzG6dewfRheKJm+qWEdnqKNf+U=; b=mIefq2ws6pOknK
	2CrQQnLOZsn/GjHCdg6QeUhNWCTnjZbvEvzXJNbyG0dfqme9VzS8X3RqHAIa8DrGU4Uh5ZCBKEpcb
	gQ81hElc3n1IdVNLOjZ0sb8XHdbQwCDpJYYrtPPuZbJTN2kp1fifu5uXCmI6/MLdofUbPCfKW+8bG
	tF0TDtZBvQv4TqVoileIUS/gD0+6GeWV76UHJz35X5SpkkkFcTppDmwjQRBu280VWjHy+jtzweHdu
	wSwhw2/rwe3677eufK9c6VFzsDqDM2kVbsL731DyvwMOOChzeZMBN5C4j8eZyEj54X0VL2hzOIeyr
	SfQujyOAH1m5NzyDZwVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZS2W-00000008J3G-3V4q;
	Wed, 09 Jul 2025 10:28:36 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQG0-00000007z14-22hL
	for opensbi@lists.infradead.org;
	Wed, 09 Jul 2025 08:34:25 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4a9df9ef114so775821cf.3
        for <opensbi@lists.infradead.org>; Wed, 09 Jul 2025 01:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752050063; x=1752654863; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjJEqjf6zsCazltdXk1gztQI2qqsZZQNx2xw6CiLmAc=;
        b=UDjnHc63WiSc0i8SELBUp06jcVDoEir4brcQ+NSXAPZAyzRH4HtZmVljmLaS6HGV3F
         i9fc4BxzwGIKLTAuTx8DKt5Sxy92hfEWO0APlrNTpMsratWD0lLcGZ1UKv4OTyYAquPB
         ZWf9IH3D0n/mjToMVfq3vdRqxsAHFJVmWCDpzPXwcifvGHPOeEKJKRKZf7IVSDDj6tuO
         b7HIOxsD5kYlPK3J940X/ry+NTf9vaZaQU63XDQFTzIDe42iGbkf7RaE6e/i4cOAJuDk
         FzGeHuj41P2OSrmRgxSynrVSs6sTwHwYkVbGoKajGrZqq6sMN2zuxOUu3cvxIgFF1nh2
         5S8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752050063; x=1752654863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjJEqjf6zsCazltdXk1gztQI2qqsZZQNx2xw6CiLmAc=;
        b=FQcNdDUWjJXtkMUYI3VcW7E2gNJkToBYH8xNw+6zUJsiJB06BCx+rDr0wsSPXGa+d6
         RzskoPAYw4RUqsAxqI0J8Ht9djMfUN2yOaDXbfOaLCQIoTuJF9jWkN6LX80PAVdWT0hm
         uEDFj+R4zaRtr0iBg5CNlEeBV8BdYE5yWhk0kJBPSjln1eB1r/zehBFWGYPXhiEC5h6C
         zjl+eNt04XEw+zMDtG7x6CQ7wg/tXpPJLHzROLU+GMF7ddARxx1tK3JJ+mXkuycawyC/
         3UZwUJlnnPiWA/YkxftdbLpBxHK18O1D58kJsNaGHY8rPaa0GzWwRaAwG4HlF6tWd39T
         RM/w==
X-Gm-Message-State: AOJu0YxFSOmrkshCH3Jv2kasKfDTehSXtSYxgEc9HtGYd5/xk09dhxPH
	RQKcVK/xUB1rwq3ZI6oxH1eTmeWd/PrymwqJkgbYNOX4qjKQWynNEL1GkQ8RTN84RXCORTB+mJG
	xHUTxWyN/hr4XHv4G8u5s1mpeuwJCQNCgDmzxu43GPw==
X-Gm-Gg: ASbGncuNUO2fcYHx6us4F0Uhd53KFT4EZitzn3CaOa/rRY25l4Px8ijwOYoT2WRL+FY
	CXSZS7FsM7gKurs/8F0W91tGii0MSYQT/FPOKhOJCgWwLi3dCtCiTNVPLB8ogVxZiUU0pTFibPr
	fqVO4/a9fSBkrXc4T2nkNZ2GpODTPmUYXNZigmqltzEjU=
X-Google-Smtp-Source: AGHT+IE9EokD25/pos/DEPoImDx8peNc0zRyAs0uPk3LzSBQ/E+lmky+Q1dHffFfX2Y8qluP1h3J3+q34fzeFlq0Tb8=
X-Received: by 2002:ad4:5f0a:0:b0:701:893:be11 with SMTP id
 6a1803df08f44-7048b81e404mr9280896d6.1.1752050063169; Wed, 09 Jul 2025
 01:34:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250708180914.1131-1-maherme.dev@gmail.com> <bf236a28adababc9cf5b34265ad8a6e6ad6c3c9f.camel@126.com>
In-Reply-To: <bf236a28adababc9cf5b34265ad8a6e6ad6c3c9f.camel@126.com>
From: =?UTF-8?Q?Manuel_Hern=C3=A1ndez_M=C3=A9ndez?= <maherme.dev@gmail.com>
Date: Wed, 9 Jul 2025 10:33:58 +0200
X-Gm-Features: Ac12FXwzdHClo43Vd-hKIVEcZfjfbfGY21CvGsSGHJ8VrMvvW7-2RJMeXagLnMs
Message-ID: <CACwcpNua92O91DRsYmuOgs8ZetOG4FzvXJ82=+Qp+cf4GU2vUw@mail.gmail.com>
Subject: Re: [PATCH] platform: openpiton: fix uninitialized plic_data struct
To: Xiang W <wxjstz@126.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_013424_527504_E95EA98A 
X-CRM114-Status: GOOD (  19.38  )
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

V2l0aCB0aGlzIGFwcHJvYWNoLCB0aGUgc3RydWN0IHdpbGwgYmUgc2V0IGVpdGhlciB0byBhbGwg
dGhlIHBhcnNlZCB2YWx1ZXMKZnJvbSB0aGUgRkRUIG9yIHRvIHRoZSBkZWZhdWx0IG9uZXMsIGJ1
dCBub3QgdG8gYW4gaW50ZXJtZWRpYXRlIHN0YXRlLgpJZiB3ZSBkaXJlY3RseSBwYXNzIHVhcnQv
cGxpYyB0byBmZHRfcGFyc2VfdWFydDgyNTAvZmR0X3BhcnNlX3BsaWMgYW5kCnNvbWUgZmFpbHVy
ZSBoYXBwZW5zIGR1cmluZyB0aGUgcGFyc2luZyBwcm9jZXNzLCB3ZSBlbmQgdXAgd2l0aCBhbgpp
bnRlcm1lZGlhdGUgc3RhdGUgKHNvbWUgdmFsdWVzIGluIHRoZSBzdHJ1Y3Qgd2lsbCBiZSBzZXQg
ZnJvbSB0aGUgRkRULAp3aGlsZSBvdGhlcnMgd2lsbCByZW1haW4gYXQgdGhlaXIgZGVmYXVsdCB2
YWx1ZXMpLgpBZnRlciBhbGwsIGRvbid0IHdlIHByZWZlciB0byBsZWF2ZSB0aGUgc3RydWN0dXJl
cyBpbiBhIHdlbGwtZGVmaW5lZApzdGF0ZSByYXRoZXIgdGhhbiBpbiBhbiBpbnRlcm1lZGlhdGUg
b25lPwoKCk9uIFdlZCwgSnVsIDksIDIwMjUgYXQgODowNOKAr0FNIFhpYW5nIFcgPHd4anN0ekAx
MjYuY29tPiB3cm90ZToKPgo+IOWcqCAyMDI1LTA3LTA45LqM55qEIDIwOjA5ICswMjAw77yMTWFu
dWVsIEhlcm7DoW5kZXogTcOpbmRleuWGmemBk++8mgo+ID4gVGhlIHBsaWNfZGF0YSBzdHJ1Y3Qg
d2FzIHVuaW5pdGlhbGl6ZWQuIFRoaXMgbGVkIHRvIG1pc2Z1bmN0aW9uIGJlaGF2aW9yCj4gPiBz
aW5jZSBpdCB3YXMgc3Vic2VxdWVudGx5IGFzc2lnbmVkIHRvIHRoZSBnbG9iYWwgcGxpYyBzdHJ1
Y3QsIGFuZCBzb21lCj4gPiBzdHJ1Y3QgZmllbGRzLCBzdWNoIGFzIGZsYWdzIGFuZCBpcnFjaGlw
LCBjb250YWluZWQgcmFuZG9tIHZhbHVlcy4KPiA+IFRoZSBmaXggcHJvcG9zZXMgdG8gaW5pdGlh
bGl6ZSB0aGUgcGxpY19kYXRhIHRvIHRoZSBnbG9iYWwgcGxpYyBzdHJ1Y3QsCj4gPiBzbywgYWZ0
ZXIgcGFyc2luZyB0aGUgZmR0LCB0aGUgZmllbGRzIG9mIHRoZSBzdHJ1Y3Qgd2lsbCBiZSBzZXQg
dG8gdGhlCj4gPiBkZWZhdWx0IHZhbHVlcyBzZXQgaW4gZ2xvYmFsIHBsaWMgc3RydWN0IGRlZmlu
aXRpb24sIG9yIHRoZSBwYXJzZWQgdmFsdWVzCj4gPiBpbiB0aGUgZmR0LCBvciB6ZXJvLgo+ID4K
PiA+IEZpeGVzOiA0YzM3NDUxICgicGxhdGZvcm06IG9wZW5waXRvbjogUmVhZCB0aGUgZGV2aWNl
IGNvbmZpZ3VyYXRpb25zIGZyb20KPiA+IGRldmljZSB0cmVlIikKPiA+IFNpZ25lZC1vZmYtYnk6
IE1hbnVlbCBIZXJuw6FuZGV6IE3DqW5kZXogPG1haGVybWUuZGV2QGdtYWlsLmNvbT4KPgo+IEdv
b2QgY2F0Y2guIE1heWJlIHdlIGNhbiBkaXJlY3R5IHBhc3MgdWFydC9wbGljIHRvCj4gZmR0X3Bh
cnNlX3VhcnQ4MjUwL2ZkdF9wYXJzZV9wbGljCj4KPiBSZWdhcmRzLAo+IFhpYW5nIFcKPiA+IC0t
LQo+ID4gIHBsYXRmb3JtL2ZwZ2Evb3BlbnBpdG9uL3BsYXRmb3JtLmMgfCAyICstCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL3BsYXRmb3JtL2ZwZ2Evb3BlbnBpdG9uL3BsYXRmb3JtLmMgYi9wbGF0Zm9ybS9mcGdh
L29wZW5waXRvbi9wbGF0Zm9ybS5jCj4gPiBpbmRleCBkMmNmM2UzMi4uZmFhMjk5Y2UgMTAwNjQ0
Cj4gPiAtLS0gYS9wbGF0Zm9ybS9mcGdhL29wZW5waXRvbi9wbGF0Zm9ybS5jCj4gPiArKysgYi9w
bGF0Zm9ybS9mcGdhL29wZW5waXRvbi9wbGF0Zm9ybS5jCj4gPiBAQCAtNzksNyArNzksNyBAQCBz
dGF0aWMgaW50IG9wZW5waXRvbl9lYXJseV9pbml0KGJvb2wgY29sZF9ib290KQo+ID4gIHsKPiA+
ICAgICAgIGNvbnN0IHZvaWQgKmZkdDsKPiA+ICAgICAgIHN0cnVjdCBwbGF0Zm9ybV91YXJ0X2Rh
dGEgdWFydF9kYXRhID0geyAwIH07Cj4gPiAtICAgICBzdHJ1Y3QgcGxpY19kYXRhIHBsaWNfZGF0
YTsKPiA+ICsgICAgIHN0cnVjdCBwbGljX2RhdGEgcGxpY19kYXRhID0gcGxpYzsKPiA+ICAgICAg
IHVuc2lnbmVkIGxvbmcgYWNsaW50X2ZyZXE7Cj4gPiAgICAgICB1aW50NjRfdCBjbGludF9hZGRy
Owo+ID4gICAgICAgaW50IHJjOwo+ID4gLS0KPiA+IDIuMzQuMQo+ID4KPgoKLS0gCm9wZW5zYmkg
bWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
