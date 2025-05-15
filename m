Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C68C3ABD8
	for <opensbi@archiver.kernel.org>; Thu, 15 May 2025 02:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EZAly9d5DkIZO46Mvl5yPj6rxWvXPzL3SjUbkJkM1BI=; b=lOCKjeZsjThr8U
	XqASesIRfzRoK1Gb87mkYfiehMZNT9A6R/tDhhOit1+GbZot0jG0MM2FJ/45RceddkaR+1ak1nhsx
	4SdVmj/vGdBjvpdls2ZnRoMGM468vdA/3pwfhlklAlC4TyFPIEFP9nKLgOfOQfXdzastR3WZQd1A7
	lIueY/l13ClGY97990suyOrpay7FKeFLBCfCNMds+xSRcKq+1RrcAta0RDnMZOKCjJ4QCrnmfGoPn
	Dax62vsE2byR9C1YVFJMG4G4KwnxxpLaFW28YtLg56ZEZf2JNvIMjqhkqLOksQZ5bbb7i61Wz9mM6
	IriNVfN5BNWHORMUNeXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFOnb-0000000Grwj-3L7Y;
	Thu, 15 May 2025 02:58:19 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFOnZ-0000000GrwI-1JI8
	for opensbi@lists.infradead.org;
	Thu, 15 May 2025 02:58:18 +0000
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-879ed601971so116343241.1
        for <opensbi@lists.infradead.org>; Wed, 14 May 2025 19:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747277895; x=1747882695; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVqolPNeVENK0rkcVcKs63jDeH7CYHTlt6EIRU7KoNU=;
        b=aCLpaiUe3DOoOrwXphABbclH+N+8noENX7UICCqYwDhyk9U4HM89G39HK5mcahoIJD
         /nn4nKi7M+gFbARdsqhaa5KhdfLK3eYIQ4EbKFyLpqfJTosJqtNVRmPE0auzdjFV7ytB
         1cq5pxNmINNrtdVcUTbSq7z+FZ3+f5MWPBitVq+wj+z8kwNvd+tJuTIrqPjwkVeM83SU
         0SUL1BYzoufiwpBKUfr9vmdy2e/mVCUOmNX7EhbvvtyajukEzCbx/8HJcmNeOX4eKHOg
         lDvPznoZ5t+YqCk9QE81edWZDaTZEJ78nQbT9W5GhW/x2ruTKt0kNB4U2tD2D/IkdnmE
         DTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747277895; x=1747882695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IVqolPNeVENK0rkcVcKs63jDeH7CYHTlt6EIRU7KoNU=;
        b=WXA45uZ2yL7sNf07jw8CDE6Cp2gJsEv6bt/tpq8VXO9J+vXJBSDoEgXJSoFt5flKfa
         dfHSbQCy1rx1kTV3G7/Q33ZN7Cj/bgNdPI5aggk62nEeFcweQeM2aQ0XtQ2qxqfI5fnD
         NrcxlKiIgeo9OOS1B5DfWcmvmVEaRlgPBCwOauevg2b2dx4J4VwTLa3MN+vMAMHFbVdr
         oTN7gO9TQKmao1WM+LQy/+GOaCN43ZFzyjQUT8rXtiDDtYeujFQh84qFkppXjIQ4bz2Y
         pDl9bcuCe3c39JMm9sFM+J/sAFJOCIOUZDO/RI4rnmQpZqYw0M/6tNJ7aSksfDVcbaZt
         m63w==
X-Gm-Message-State: AOJu0YzXLOLuc2niwmBBD2m6XdGuac7ZoSP96eLGP0JpmX0ThFavUcTk
	zMFie468sYc3e2CVX6rnJshLuFrknZ5/QMsAaT9HaM19Wqscycfue7CkgDPYUaJbi9tUi2L3ZRm
	Tkpxdk5EEUvdokmKK5qESenc5KSWBfnjej23eSXeXZ4TndY7IMQyJaF9C
X-Gm-Gg: ASbGnctcbCZIko1ycEOqjVEK5v5IrSVdDcmg3b1CpdoWOGUO/0/2rW2xSir0ZV/seq9
	ys9TNtSJwSYOdEg8KkgmFdU8kh11+T7c+8hXTyXzfvwTeWNGTbgdpAyEoTw4HvFZZToOqeLh+95
	FWIo+gnOSE55YZrDeE0jOGh19TfUhYMqB5+8tVetokGUG1hw==
X-Google-Smtp-Source: AGHT+IEUzF7NLHYapbAXkaAO/nWtCDYQrmBy1aQ1juC6m3N7JyVzPZEQ2UIMhOHSFr0cVun1crTV+W33zfxo8WsJ/50=
X-Received: by 2002:a67:e710:0:b0:4c3:6ba1:4129 with SMTP id
 ada2fe7eead31-4df956742b7mr677332137.20.1747277895368; Wed, 14 May 2025
 19:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250428093646.2352928-1-nylon.chen@sifive.com>
In-Reply-To: <20250428093646.2352928-1-nylon.chen@sifive.com>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Thu, 15 May 2025 10:58:04 +0800
X-Gm-Features: AX0GCFsTOT25FaBaX04yTObFHI9MXyGoHyXUel09S4fiE6M8_r22IIbcfdo-gIk
Message-ID: <CAHh=Yk_AmJiC17uwVNeRHrrzOK+Ykhg+Nf2RPebeo5G6eTOGBg@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: Add Smrnmi extension detection
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com, yongxuan.wang@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_195817_364697_4A9E78DD 
X-CRM114-Status: GOOD (  19.51  )
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

SGkgYWxsLCBqdXN0IGEgZ2VudGxlIHBpbmcgb24gdGhpcyBQUiB0aGF0IHdhcyBzdWJtaXR0ZWQg
YWdvLiBJJ20Kd29uZGVyaW5nIGlmIHRoZXJlJ3MgYW55IGZlZWRiYWNrPyBUaGFua3MhCgpOeWxv
biBDaGVuIDxueWxvbi5jaGVuQHNpZml2ZS5jb20+IOaWvCAyMDI15bm0NOaciDI45pelIOmAseS4
gCDkuIvljYg1OjI15a+r6YGT77yaCj4KPiBUaGUgY29tbWl0IGFkZHMgZGV0ZWN0aW9uIGFuZCBp
bml0aWFsaXphdGlvbiBvZiB0aGUgU21ybm1pCj4gZXh0ZW5zaW9uIGluIHRoZSBTQkkgaGFydCBp
bml0aWFsaXphdGlvbiBjb2RlLgo+Cj4gSWYgdGhlIGV4dGVuc2lvbiBpcyBkZXRlY3RlZCwKPiBp
dCBzZXRzIHRoZSBOTUlFIGJpdCBpbiB0aGUgbW5zdGF0dXMgQ1NSIHRvIGVuYWJsZSBSTk1JcyBv
dXQgb2YgcmVzZXQuCj4KPiBDby1kZXZlbG9wZWQtYnk6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZl
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogTnlsb24gQ2hlbiA8bnlsb24uY2hlbkBzaWZpdmUuY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IFlvbmctWHVhbiBXYW5nIDx5b25neHVhbi53YW5nQHNpZml2ZS5jb20+Cj4gLS0tCj4g
IGluY2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmggfCAxMCArKysrKysrKysrCj4gIGluY2x1ZGUv
c2JpL3NiaV9oYXJ0LmggICAgICAgfCAgMiArKwo+ICBsaWIvc2JpL3NiaV9oYXJ0LmMgICAgICAg
ICAgIHwgIDYgKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQo+Cj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmggYi9pbmNsdWRlL3NiaS9y
aXNjdl9lbmNvZGluZy5oCj4gaW5kZXggMjA4Mjc4My4uOTMyMjhjZSAxMDA2NDQKPiAtLS0gYS9p
bmNsdWRlL3NiaS9yaXNjdl9lbmNvZGluZy5oCj4gKysrIGIvaW5jbHVkZS9zYmkvcmlzY3ZfZW5j
b2RpbmcuaAo+IEBAIC0yMTUsNiArMjE1LDEwIEBACj4KPiAgI2VuZGlmCj4KPiArI2RlZmluZSBN
TlNUQVRVU19OTUlFICAgICAgICAgICAgICAgICAgKF9VTCgweDgpKQo+ICsjZGVmaW5lIE1OU1RB
VFVTX01OUFYgICAgICAgICAgICAgICAgICAoX1VMKDB4ODApKQo+ICsjZGVmaW5lIE1OU1RBVFVT
X01OUFAgICAgICAgICAgICAgICAgICAoX1VMKDB4MTgwMCkpCj4gKwo+ICAjZGVmaW5lIE1IUE1F
VkVOVF9TU0NPRl9NQVNLICAgICAgICAgICBfVUxMKDB4RkYwMDAwMDAwMDAwMDAwMCkKPgo+ICAj
ZGVmaW5lIEVOVkNGR19TVENFICAgICAgICAgICAgICAgICAgICAoX1VMTCgxKSA8PCA2MykKPiBA
QCAtNzcwLDYgKzc3NCwxMiBAQAo+ICAjZGVmaW5lIENTUl9NU1RBVEVFTjMgICAgICAgICAgICAg
ICAgICAweDMwRgo+ICAjZGVmaW5lIENTUl9NU1RBVEVFTjNIICAgICAgICAgICAgICAgICAweDMx
Rgo+Cj4gKy8qIFNtcm5taSBleHRlbnNpb24gcmVnaXN0ZXJzICovCj4gKyNkZWZpbmUgQ1NSX01O
U0NSQVRDSCAgICAgICAgICAgICAgICAgIDB4NzQwCj4gKyNkZWZpbmUgQ1NSX01ORVBDICAgICAg
ICAgICAgICAgICAgICAgIDB4NzQxCj4gKyNkZWZpbmUgQ1NSX01OQ0FVU0UgICAgICAgICAgICAg
ICAgICAgIDB4NzQyCj4gKyNkZWZpbmUgQ1NSX01OU1RBVFVTICAgICAgICAgICAgICAgICAgIDB4
NzQ0Cj4gKwo+ICAvKiBNYWNoaW5lLUxldmVsIEhpZ2gtSGFsZiBDU1JzIChBSUEpICovCj4gICNk
ZWZpbmUgQ1NSX01JREVMRUdIICAgICAgICAgICAgICAgICAgIDB4MzEzCj4gICNkZWZpbmUgQ1NS
X01JRUggICAgICAgICAgICAgICAgICAgICAgIDB4MzE0Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
c2JpL3NiaV9oYXJ0LmggYi9pbmNsdWRlL3NiaS9zYmlfaGFydC5oCj4gaW5kZXggYzNhN2ZlYi4u
MDdjYmVhZCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfaGFydC5oCj4gKysrIGIvaW5j
bHVkZS9zYmkvc2JpX2hhcnQuaAo+IEBAIC03OSw2ICs3OSw4IEBAIGVudW0gc2JpX2hhcnRfZXh0
ZW5zaW9ucyB7Cj4gICAgICAgICBTQklfSEFSVF9FWFRfU01DVFIsCj4gICAgICAgICAvKiogSEFS
VCBoYXMgQ1RSIFMtbW9kZSBDU1JzICovCj4gICAgICAgICBTQklfSEFSVF9FWFRfU1NDVFIsCj4g
KyAgICAgICAvKiogSEFSVCBoYXMgU21ybm1pIGV4dGVuc2lvbiAqLwo+ICsgICAgICAgU0JJX0hB
UlRfRVhUX1NNUk5NSSwKPgo+ICAgICAgICAgLyoqIE1heGltdW0gaW5kZXggb2YgSGFydCBleHRl
bnNpb24gKi8KPiAgICAgICAgIFNCSV9IQVJUX0VYVF9NQVgsCj4gZGlmZiAtLWdpdCBhL2xpYi9z
Ymkvc2JpX2hhcnQuYyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+IGluZGV4IGVlZmIwM2YuLjY2ZDVk
MDIgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfaGFydC5jCj4gKysrIGIvbGliL3NiaS9zYmlf
aGFydC5jCj4gQEAgLTY1LDYgKzY1LDExIEBAIHN0YXRpYyB2b2lkIG1zdGF0dXNfaW5pdChzdHJ1
Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gpCj4gICAgICAgICAvKiBBbGwgcHJvZ3JhbW1hYmxlIGNv
dW50ZXJzIHdpbGwgc3RhcnQgcnVubmluZyBhdCBydW50aW1lIGFmdGVyIFMtbW9kZSByZXF1ZXN0
ICovCj4gICAgICAgICBpZiAoc2JpX2hhcnRfcHJpdl92ZXJzaW9uKHNjcmF0Y2gpID49IFNCSV9I
QVJUX1BSSVZfVkVSXzFfMTEpCj4gICAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfTUNPVU5U
SU5ISUJJVCwgMHhGRkZGRkZGOCk7Cj4gKyAgICAgICAvKiBEZXRlY3QgUmVzdW1hYmxlIE5vbi1N
YXNrYWJsZSBJbnRlcnJ1cHRzCj4gKyAgICAgICAgKiBJZiBpdCBleGlzdHMgd2UgbXVzdCBlbmFi
bGUgaXQgYmVmb3JlIGFsbCB0cmFwcy4KPiArICAgICAgICAqLwo+ICsgICAgICAgaWYgKHNiaV9o
YXJ0X2hhc19leHRlbnNpb24oc2NyYXRjaCwgU0JJX0hBUlRfRVhUX1NNUk5NSSkpCj4gKyAgICAg
ICAgICAgICAgIGNzcl9zZXQoQ1NSX01OU1RBVFVTLCBNTlNUQVRVU19OTUlFKTsKPgo+ICAgICAg
ICAgLyoqCj4gICAgICAgICAgKiBUaGUgbWhwbWV2ZW50bltoXSBDU1Igc2hvdWxkIGJlIGluaXRp
YWxpemVkIHdpdGggaW50ZXJydXB0IGRpc2FibGVkCj4gQEAgLTY5NSw2ICs3MDAsNyBAQCBjb25z
dCBzdHJ1Y3Qgc2JpX2hhcnRfZXh0X2RhdGEgc2JpX2hhcnRfZXh0W10gPSB7Cj4gICAgICAgICBf
X1NCSV9IQVJUX0VYVF9EQVRBKHNzZGJsdHJwLCBTQklfSEFSVF9FWFRfU1NEQkxUUlApLAo+ICAg
ICAgICAgX19TQklfSEFSVF9FWFRfREFUQShzbWN0ciwgU0JJX0hBUlRfRVhUX1NNQ1RSKSwKPiAg
ICAgICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEoc3NjdHIsIFNCSV9IQVJUX0VYVF9TU0NUUiksCj4g
KyAgICAgICBfX1NCSV9IQVJUX0VYVF9EQVRBKHNtcm5taSwgU0JJX0hBUlRfRVhUX1NNUk5NSSks
Cj4gIH07Cj4KPiAgX1N0YXRpY19hc3NlcnQoU0JJX0hBUlRfRVhUX01BWCA9PSBhcnJheV9zaXpl
KHNiaV9oYXJ0X2V4dCksCj4gLS0KPiAyLjM5LjMKPgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0
Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
