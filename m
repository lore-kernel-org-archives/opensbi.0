Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5027C44515
	for <opensbi@archiver.kernel.org>; Mon, 20 Jul 2026 08:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ewk2KmXWB84xCucjJTh0UCiJFyc/EHSY/OCAIXfL1fw=; b=lnuLukp/LpvEwy
	v/4JsKQgvBuSiKvDT1KfhF4ZXYIap3GdZvMgkStgKpCfcwIHt+Ah1H41ZpIJBw8tWHVrMLJrQ834E
	+QhOxi2Al+OlCDIQKNRK259AjOowjZEtnYxwtsaqEtyikn/MeTmWmm1Ay+piogjzufb6A8u2Cjz7x
	HPuzH3w1r17h/nmpwQCmnAtAf/Jys80IIGa+4g8JATmbUoLoaLKPpCJ+4BYNvQy9H+8N77q253l1T
	OH+bZiAg38MlbO9IMdJzs4HtzuHNkRyeiNrxhNyNu8W+zgYisPyRGGWr7nHiWHRIKT9F3rfuwKba6
	ehXY7OkTotvqUT0oPz3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljIY-00000006Bga-2nis;
	Mon, 20 Jul 2026 08:24:26 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljIW-00000006Bg0-0KxZ
	for opensbi@lists.infradead.org;
	Mon, 20 Jul 2026 08:24:25 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c998fd549a8so6542888a12.2
        for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 01:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1784535863; x=1785140663; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6nItFzv+MlkcDXXGZypaTllGXX//kjBG4KN9p+SXN/w=;
        b=lSUDI/uGC+Q1TSvEZXeE4U6jMcQQMt5L2iJNpSMwSfrTjaRSy7XuLFwdjl78YppkYw
         mXWapZpDC8muNDXd2cHU9doAQIG4PntQCB00Oz0hd/BGiJ0/ts/jTnzJ0kdbk+HU98Iy
         L6Sgn4bRO2I9zBkj7yODIUMrUufk55LDkUd/gJFkhIPlzownlVb29L5pM16FO57SvQeI
         jlkd5CxVccjUYT9fqWfSFvUFckUOw6UWrXHIK1iU7ONYEstLkL2+lXYuQ4A8i4o847ig
         T18gKKvR1MHHydpLJ3gBFcThbNj7l00UENJv1hhn5Lhx9S0JoTNARr37VXNQOljb8qhp
         toGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784535863; x=1785140663;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6nItFzv+MlkcDXXGZypaTllGXX//kjBG4KN9p+SXN/w=;
        b=pXKypPoBB2LynEgHUncimlA77cBs//KAKMkkj+CPu1+D/shIjSF5ZRPyUIERdQa6Ig
         HzKGwlXZG7jeIbu9AofkvOpzwQypFOgGUPNRS7Zt+dl+UpgQpwOmFIZjkP/2FZ++a2HC
         hy1GQ9pbTT6rv1xGUFtvlOeyKfAy87myPhcUyGZ7tq+8SnRFRjP9LVUD/pVD6YS6UMbd
         aEI7tpGYPlymcgK9SrAxSQgd6MxiVp7REyqsdeNURoZuboJAw86nwJgARy1vruDOoYDp
         hsPjltwEqwSrtB6DgtOOJQrDqcAlIRFvDG5U7unzm83uripGRJAXxa/bjLXCFvaExTUS
         quPA==
X-Gm-Message-State: AOJu0YxRSbZLWNUu/3pbgXZZHKSEqb7Yr6Nz0fztBz2OrPVtcDnxS7ju
	oszFYfrKpQpeA4kDoOEGtEi1G8zV3xAd9vIL09Vt3ElKRZuyGs8MFGNPktZlior7pKw=
X-Gm-Gg: AfdE7clhE98DsBo8lcCB5H5lfqnzu85MrIYmiAez5/yubCAY/boDv+MNmo4WHFbi2l2
	yd7yqnMn08DY+wVUvGaco7PGkX0RlkgG197axqaidDqx4w16rnymt0+vRxA8/GTSVZMZ672I4+o
	IlAmGt4sWN3dV1fuaDVK7XJTvHUz3gS10W9a0W5kLLPmjh8wSOn7NB2V8LvPRXp07yDVD68P0XC
	0Ol8etmUzQKakVhGaIHSLTtIVQU0lKpJLDqcmGdT9by8gMU7ircjVd1lCYWzbx9x0d93zvKeLuf
	pUsE31ElYUHt7gKkAT9EQD5GTGKWWn0dNCNS/CBUMktxNckNph7/nYwU3jN34q3jkWMGLNhUX3z
	EciExRXhGzsUCqNI162bvfQUGYBKxqdnMDRnJdYqSV7xMbgcwYLoRfEyCyuO0TPabKrdtwOdw3w
	qb
X-Received: by 2002:a05:6a21:6110:b0:3c3:a140:938a with SMTP id adf61e73a8af0-3c3ad947db0mr14944673637.45.1784535863183;
        Mon, 20 Jul 2026 01:24:23 -0700 (PDT)
Received: from plin-1878 ([136.226.240.191])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb517aad95dsm4118912a12.7.2026.07.20.01.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:24:22 -0700 (PDT)
Date: Mon, 20 Jul 2026 16:24:17 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com,
	greentime.hu@sifive.com, anup@brainfault.org, scott@riscstar.com,
	conor@kernel.org, dave.patel@riscstar.com, raymond.mao@riscstar.com,
	robin.randhawa@sifive.com, samuel.holland@sifive.com
Subject: Re: [RFC PATCH 07/12] lib: sbi_domain: print World ID config at boot
Message-ID: <al3bMbiWRqfg5/dR@plin-1878>
References: <20260626101433.3133466-1-peter.lin@sifive.com>
 <20260626101433.3133466-8-peter.lin@sifive.com>
 <CAAVgOk+HDHENppd2G=_aqAv+kyk+-QAMnsVZ1qMuTKaick0MrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAVgOk+HDHENppd2G=_aqAv+kyk+-QAMnsVZ1qMuTKaick0MrQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_012424_132375_588211F2 
X-CRM114-Status: GOOD (  18.23  )
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

T24gTW9uLCBKdWwgMTMsIDIwMjYgYXQgMDQ6NDg6MDBQTSAtMDcwMCwgUGF3YW5kZWVwIE96YSB3
cm90ZToKPiBPbiBGcmksIEp1biAyNiwgMjAyNiBhdCAzOjE34oCvQU0gWXUtQ2hpZW4gUGV0ZXIg
TGluIDxwZXRlci5saW5Ac2lmaXZlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gRXh0ZW5kcyBzYmlfZG9t
YWluX2R1bXAoKSB0byBkaXNwbGF5IFdvcmxkIElEIGNvbmZpZ3VyYXRpb24KPiA+IChuZXh0X3dp
ZCBhbmQgbmV4dF93aWRsaXN0KSBmb3IgZWFjaCBkb21haW4gYXQgYm9vdC4gUHJvdmlkZXMKPiA+
IGJvb3QtdGltZSBkaWFnbm9zdGljIHZpc2liaWxpdHkgZm9yIGRlYnVnZ2luZyBhbmQgdmVyaWZp
Y2F0aW9uLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIu
bGluQHNpZml2ZS5jb20+Cj4gPiAtLS0KPiA+ICBsaWIvc2JpL3NiaV9kb21haW4uYyB8IDI2ICsr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlv
bnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfZG9tYWluLmMgYi9saWIvc2Jp
L3NiaV9kb21haW4uYwo+ID4gaW5kZXggZmE2OTE3MGIuLjQ0M2FhNjBiIDEwMDY0NAo+ID4gLS0t
IGEvbGliL3NiaS9zYmlfZG9tYWluLmMKPiA+ICsrKyBiL2xpYi9zYmkvc2JpX2RvbWFpbi5jCj4g
PiBAQCAtMTAsNiArMTAsNyBAQAo+ID4gICNpbmNsdWRlIDxzYmkvcmlzY3ZfYXNtLmg+Cj4gPiAg
I2luY2x1ZGUgPHNiaS9zYmlfY29uc29sZS5oPgo+ID4gICNpbmNsdWRlIDxzYmkvc2JpX2RvbWFp
bi5oPgo+ID4gKyNpbmNsdWRlIDxzYmkvc2JpX2hhcnQuaD4KPiA+ICAjaW5jbHVkZSA8c2JpL3Ni
aV9oYXJ0bWFzay5oPgo+ID4gICNpbmNsdWRlIDxzYmkvc2JpX2hlYXAuaD4KPiA+ICAjaW5jbHVk
ZSA8c2JpL3NiaV9oc20uaD4KPiA+IEBAIC02MDgsNiArNjA5LDMxIEBAIHZvaWQgc2JpX2RvbWFp
bl9kdW1wKGNvbnN0IHN0cnVjdCBzYmlfZG9tYWluICpkb20sIGNvbnN0IGNoYXIgKnN1ZmZpeCkK
PiA+ICAgICAgICAgICAgICAgICBicmVhazsKPiA+ICAgICAgICAgfQo+ID4KPiA+ICsgICAgICAg
aWYgKHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2JpX3NjcmF0Y2hfdGhpc2hhcnRfcHRyKCksCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNCSV9IQVJUX0VYVF9TTUxXSUQp
KSB7Cj4gPiArICAgICAgICAgICAgICAgaWYgKGRvbS0+aGFzX25leHRfd2lkKQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgc2JpX3ByaW50ZigiRG9tYWluJWQgTmV4dCBXaWQgICAgJXM6ICV1
XG4iLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkb20tPmluZGV4LCBz
dWZmaXgsIGRvbS0+bmV4dF93aWQpOwo+ID4gKyAgICAgICAgICAgICAgIGVsc2Ugewo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoID0gc2JpX3Nj
cmF0Y2hfdGhpc2hhcnRfcHRyKCk7Cj4gdXNlIGxvY2FsIHZhcmlhYmxlIHRvIHN0b3JlIHNiaV9z
Y3JhdGNoX3RoaXNoYXJ0X3B0cgoKU3VyZSwgd2lsbCB1cGRhdGUuCgo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgY29uc3Qgc3RydWN0IHNiaV9oYXJ0X2ZlYXR1cmVzICpoZiA9IHNiaV9oYXJ0
X2ZlYXR1cmVzX3B0cihzY3JhdGNoKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHNiaV9w
cmludGYoIkRvbWFpbiVkIE5leHQgV2lkICAgICVzOiAldSAocG13aWQpXG4iLAo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkb20tPmluZGV4LCBzdWZmaXgsIGhmLT5wbXdp
ZCk7Cj4gPiArICAgICAgICAgICAgICAgfQo+ID4gKyAgICAgICB9IGVsc2Ugewo+ID4gKyAgICAg
ICAgICAgICAgIHNiaV9wcmludGYoIkRvbWFpbiVkIE5leHQgV2lkICAgICVzOiB1bnN1cHBvcnRl
ZFxuIiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIGRvbS0+aW5kZXgsIHN1ZmZpeCk7
Cj4gPiArICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAgaWYgKHNiaV9oYXJ0X2hhc19leHRlbnNp
b24oc2JpX3NjcmF0Y2hfdGhpc2hhcnRfcHRyKCksCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFNCSV9IQVJUX0VYVF9TTVdJRERFTEVHKSkgewo+ID4gKyAgICAgICAgICAg
ICAgIHNiaV9wcmludGYoIkRvbWFpbiVkIE5leHQgV2lkbGlzdCVzOiAweCUiIFBSSXg2NCAiXG4i
LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgZG9tLT5pbmRleCwgc3VmZml4LCBkb20t
Pm5leHRfd2lkbGlzdCk7Cj4gPiArICAgICAgIH0gZWxzZSB7Cj4gPiArICAgICAgICAgICAgICAg
c2JpX3ByaW50ZigiRG9tYWluJWQgTmV4dCBXaWRsaXN0JXM6IHVuc3VwcG9ydGVkXG4iLAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgZG9tLT5pbmRleCwgc3VmZml4KTsKPiA+ICsgICAg
ICAgfQo+ID4gKwo+ID4gICAgICAgICBzYmlfcHJpbnRmKCJEb21haW4lZCBTeXNSZXNldCAgICAl
czogJXNcbiIsCj4gPiAgICAgICAgICAgICAgICAgICAgZG9tLT5pbmRleCwgc3VmZml4LCAoZG9t
LT5zeXN0ZW1fcmVzZXRfYWxsb3dlZCkgPyAieWVzIiA6ICJubyIpOwo+ID4KPiA+IC0tCj4gPiAy
LjQzLjcKPiA+Cj4gPgo+ID4gLS0KPiA+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gPiBvcGVuc2Jp
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5zYmkK
