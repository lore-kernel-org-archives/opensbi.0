Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47EB606A31B
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 08:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=InMw3oPS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=cdLpbBwW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Nt4MPR05boh2vGA7Ymd06WMjYbGEQlso1q1W6fyQztw=; b=InMw3oPS0V5UOWBow5zv+hfa3z
	yy0wLRRbrDfVjwBEQh2tCXZoy3kZ36WrHjBrUMIq7Gpw+EyUkJ58q/Ru6ssltKQG+wEjQCMtqe1WY
	OLRT4/lUftv7QtLioGLcDdUypFodrUbEF0gcTTWp/tX5qJ99pgfKyWdbAfg7uq4/dAGNF4MCVZTNn
	cgqEXowwjgx1b8+8riMLmLCCqRROkS7pWKP7zRTJhN9M+miNb2EJc/4elvYZQhUZRqiaUaa9Q+BuY
	UbJ/grG9YwcdnQCv8+d91qdSbl4S8wm51nNnnD4kkRFfSNW/H35zoMTPseF73mySFpimPISJ08U1A
	8sWgt4iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAHd-0000000FrtJ-31wU;
	Fri, 23 Oct 2026 08:05:49 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAHa-0000000FrrQ-1jLV
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 08:05:48 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-89f85edd210so215079b3a.2
        for <opensbi@lists.infradead.org>; Fri, 23 Oct 2026 01:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1792742745; x=1793347545; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yJJJ5kFLRxmwet0Q6icQ8xxLxW2HFhzNN+ULS3kynBQ=;
        b=cdLpbBwWqtlP1OCaXcY7Ko3ftGN5EMkWqjmYzPXmByHiErHxgwZ7aswXsQ3hNAI0bu
         WqT2tPtjYhZS5zDYJOZP51Sihb8JkN/30cv1olSR/p1gLac0FmxH6rzC3i84Pa71fw7t
         rAB292B38qSgOOcknpSXJScpLP22h3VTBBbtKd9/p3guW7czce68CFJhBBLay37Rwfk6
         J5c+xLw1OdK9cM9M2NkpKPmjAVvJQ5J9kjCxgEf9NumdHJfSnmcx83UzxbClLHVwSv+S
         CsFDarXSzAe9s3WI7l/dFnOLlGwPNPStjuov7JdXLSnpW5gmH25Izc+wQPakozwLLyzZ
         uLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742745; x=1793347545;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yJJJ5kFLRxmwet0Q6icQ8xxLxW2HFhzNN+ULS3kynBQ=;
        b=IjCrhtFQZ/kyc0ii2TzOtCKOqi+30CqNmFaXTF2jALhYtfCD4UKFDEQfYi8nRQFll5
         rjREcVdZBb4bRtyk7QF+h1b0ipo51QmAo9GnOpZeBHHKdeJ0jN6wmJLOBdG+9/6KPKUD
         DA9+YW1p3n/1NVkldgoI25p5e7ZV65zUTuTePBn8mVTusknrCwHx9VRf4Mry9ZPUjm2C
         H586RoaCfPdJwexIkurG9XT0i0NKssH7gd2tngZo31AQHlNiyHI8YhFc2uwykTHezxHH
         uGJmm34pr3uUY13pDzcGztEr4U9FcaNi/0ytvxJu/tFOo/uYEbJrYFGaiaDC79s/+G6j
         gaxQ==
X-Gm-Message-State: AFq9FYL5W8+0o7Z+UNNx++LVNJTZl3FBgQHxkJk9yyUMgnrvwhAmE+WX
	WCSYquMNGQ54sPHwcb78oRlGQQ3A8+svK3wPd/8PCThIckJPgtAMVK5I8JFFv+1llhA=
X-Gm-Gg: AYBFou1uA683wL8SXIemvpPuqNBoH7CXF/I5FRw20g1oaU/zfC5IuSQU2pi1Ah/8lAo
	ATHf/eD/pp4deR2K9EicOzKFnxGKi47X9bxEd1xgTfp0aI1fdWP1FakwZz8JleTH7qaM58q3U/+
	KSiR8xC80gtP9W3IypMzbEdwwzqoW5n2oinzu4sOktsmrtmAhjPAhGkx8FupprpZ+04Ux7vO+mk
	TI0dy0I/zT1rl7E9vcXK+hAaLFP7ydYnR8kmz/SLY85QIJHM6knPmyRwZTCZWvGSSIH7OFYxGCm
	nacAwPVeFWAkdlKdlGZ7vfmroLcu7XFuNUHJN9B3QnsLxhyT/xoTCSMfU4l3xXtK/50mGUI9zRb
	t5sqIljF/ryg2cSK+0ZvRpR5XSYIdT6EwvhDn0pSNZ8uEBVGy78c7WenOXUHwe3tqYQeXu94wfo
	G3/auU0Y2begRyfY4yHviZrkrmYhYQ0JUjPFDQP0Fk72SCNaXpcYnLraN1GhHWrqA5NWkufDjwy
	PFOvsqfUsa6Z0ShlYf+j7u0hbQhNiL4lT0n1J+SssP4+YGN0npDOA==
X-Received: by 2002:a05:6a21:3d87:b0:3e1:3178:8d63 with SMTP id adf61e73a8af0-3e37665b311mr873209637.44.1792742745041;
        Fri, 23 Oct 2026 01:05:45 -0700 (PDT)
Received: from plin-1878 ([136.226.240.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c6622322sm481784b3a.0.2026.10.23.01.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:05:44 -0700 (PDT)
Date: Fri, 23 Oct 2026 16:05:38 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Radim Krcmar <rkrcmar@qti.qualcomm.com>
Cc: "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>,
	"zong.li@sifive.com" <zong.li@sifive.com>,
	"greentime.hu@sifive.com" <greentime.hu@sifive.com>,
	"anup@brainfault.org" <anup@brainfault.org>,
	"scott@riscstar.com" <scott@riscstar.com>,
	"conor@kernel.org" <conor@kernel.org>,
	"dave.patel@riscstar.com" <dave.patel@riscstar.com>,
	"raymond.mao@riscstar.com" <raymond.mao@riscstar.com>,
	"robin.randhawa@sifive.com" <robin.randhawa@sifive.com>,
	"samuel.holland@sifive.com" <samuel.holland@sifive.com>,
	"pawandeep.oza@oss.qualcomm.com" <pawandeep.oza@oss.qualcomm.com>,
	"krzk@kernel.org" <krzk@kernel.org>,
	opensbi <opensbi-bounces@lists.infradead.org>
Subject: Re: [PATCH v2 5/9] lib: sbi_hart: add WID protection mechanism
Message-ID: <atsVUlAh0LSjUkAW@plin-1878>
References: <20260817090503.2104998-1-peter.lin@sifive.com>
 <20260817090503.2104998-6-peter.lin@sifive.com>
 <DM6FR879EC0N.1XXM04LPUG5F0@qti.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM6FR879EC0N.1XXM04LPUG5F0@qti.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_010546_486184_3CA2FAEC 
X-CRM114-Status: GOOD (  22.97  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgUmFkaW0sCgpPbiBGcmksIE9jdCAxNiwgMjAyNiBhdCAwNToyNDowN1BNICswMDAwLCBSYWRp
bSBLcmNtYXIgd3JvdGU6Cj4gMjAyNi0wOC0xN1QxNzowNDo1OSswODowMCwgWXUtQ2hpZW4gUGV0
ZXIgTGluIDxwZXRlci5saW5Ac2lmaXZlLmNvbT46Cj4gPiBSZWdpc3RlciBhIFdJRC1iYXNlZCBo
YXJ0IHByb3RlY3Rpb24gbWVjaGFuaXNtIHRoYXQKPiA+IGNvbmZpZ3VyZXMgbWx3aWQgYW5kIG13
aWRkZWxlZyBDU1JzIG9uIGRvbWFpbiBlbnRyeS4KPiA+IFRoaXMgZW5hYmxlcyB0aGUgcHJvdGVj
dGlvbiBmcmFtZXdvcmsgcmVjb25maWd1cmUgV0lECj4gPiBpc29sYXRpb24gd2hlbmV2ZXIgZG9t
YWlucyBhcmUgc3dpdGNoZWQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWXUtQ2hpZW4gUGV0ZXIg
TGluIDxwZXRlci5saW5Ac2lmaXZlLmNvbT4KPiA+IC0tLQo+ID4gQ2hhbmdlcyB2MSAtPiB2MjoK
PiA+IC0gVmFsaWRhdGUgV0lEIGFnYWluc3QgcG1sd2lkbGlzdCBiZWZvcmUgd3JpdGluZyBtbHdp
ZCBDU1IgKE96YSkKPiA+IC0tLQo+ID4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2hhcnRfd29y
bGRzLmMgYi9saWIvc2JpL3NiaV9oYXJ0X3dvcmxkcy5jCj4gPiArKysgYi9saWIvc2JpL3NiaV9o
YXJ0X3dvcmxkcy5jCj4gPiBAQCAtMCwwICsxLDcyIEBACj4gPiArLyoKPiA+ICsgKiBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogQlNELTItQ2xhdXNlCj4gPiArICoKPiA+ICsgKiBDb3B5cmlnaHQg
KGMpIDIwMjYgU2lGaXZlIEluYy4KPiA+ICsgKi8KPiA+ICsKPiA+ICsjaW5jbHVkZSA8c2JpL3Jp
c2N2X2VuY29kaW5nLmg+Cj4gPiArI2luY2x1ZGUgPHNiaS9zYmlfY29uc29sZS5oPgo+ID4gKyNp
bmNsdWRlIDxzYmkvc2JpX2RvbWFpbi5oPgo+ID4gKyNpbmNsdWRlIDxzYmkvc2JpX2Vycm9yLmg+
Cj4gPiArI2luY2x1ZGUgPHNiaS9zYmlfaGFydC5oPgo+ID4gKyNpbmNsdWRlIDxzYmkvc2JpX2hh
cnRfcHJvdGVjdGlvbi5oPgo+ID4gKyNpbmNsdWRlIDxzYmkvc2JpX2hhcnRfd29ybGRzLmg+Cj4g
PiArI2luY2x1ZGUgPHNiaS9zYmlfc2NyYXRjaC5oPgo+ID4gKwo+ID4gK3N0YXRpYyBpbnQgc2Jp
X2hhcnRfd29ybGRzX2NvbmZpZ3VyZShzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gsCj4gPiAr
CQkJCSAgICAgc3RydWN0IHNiaV9kb21haW4gKmRvbSkKPiA+ICt7Cj4gPiArCXN0cnVjdCBzYmlf
aGFydF9mZWF0dXJlcyAqaGYgPSBzYmlfaGFydF9mZWF0dXJlc19wdHIoc2NyYXRjaCk7Cj4gPiAr
CWJvb2wgd2lkX2ZvdW5kID0gdHJ1ZTsKPiA+ICsJdTMyIHdpZF92YWwgPSAwOwo+ID4gKwo+ID4g
KwlpZiAoIXNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2NyYXRjaCwgU0JJX0hBUlRfRVhUX1NNTFdJ
RCkpCj4gPiArCQlyZXR1cm4gMDsKPiA+ICsJaWYgKGRvbS0+aGFzX3dpZCkgewo+ID4gKwkJd2lk
X3ZhbCA9IGRvbS0+d2lkOwo+IAo+IEkgd291bGQgcHJlZmVyIHRvIGZhaWwgZG9tYWluIGNyZWF0
aW9uIGlmIHdlIGhhdmUgbWx3aWQgYW5kIHRoZSBkb21haW4KPiBkb2Vzbid0IHNwZWNpZnkgaXRz
IHdpZC4KPiAKPiBUaGUgcmVzdCBhcmUgc2VjdXJpdHkgaXNzdWVzIHdhaXRpbmcgdG8gaGFwcGVu
LgoKQWdyZWVkLiBJ4oCZbGwgbWFrZSBXSUQgbWFuZGF0b3J5IHdoZW5ldmVyIE1MV0lEIGlzIHBy
ZXNlbnQsIHJhdGhlciB0aGFuCmZhbGxpbmcgYmFjayB0byBvdGhlciBzb3VyY2VzLgoKPiAKPiA+
ICsJfSBlbHNlIGlmIChzYmlfaGFydF9oYXNfZXh0ZW5zaW9uKHNjcmF0Y2gsIFNCSV9IQVJUX0VY
VF9TTVdJRCkpIHsKPiA+ICsJCXdpZF92YWwgPSBjc3JfcmVhZChDU1JfTVdJRCkgJiB+TVdJRF9M
T0NLOwo+ID4gKwl9IGVsc2UgaWYgKGhmLT5oYXNfcG13aWQpIHsKPiA+ICsJCXdpZF92YWwgPSBo
Zi0+cG13aWQ7Cj4gPiArCX0gZWxzZSB7Cj4gPiArCQkvKgo+ID4gKwkJICogU21sd2lkIHByZXNl
bnQgYnV0IG5vIFdJRCBzb3VyY2UuIFdpdGhvdXQgd3JpdGluZwo+ID4gKwkJICogbWx3aWQsIHRo
ZSBoYXJkd2FyZSByZXNldCB2YWx1ZSBpcyB1c2VkIHdoaWNoIG1heQo+ID4gKwkJICogY2F1c2Ug
YSBzb2Z0d2FyZS1jaGVjayBleGNlcHRpb24gb24gbG93ZXItcHJpdmlsZWdlCj4gPiArCQkgKiBt
b2RlIGVudHJ5Lgo+ID4gKwkJICovCj4gPiArCQl3aWRfZm91bmQgPSBmYWxzZTsKPiA+ICsJfQo+
IAo+IG1sd2lkIENTUiBpcyBhIFdJRCBzb3VyY2UgYnkgaXRzZWxmIC0tIHRoZSBkb21haW4gd2ls
bCB1c2UgdGhlIGN1cnJlbnQKPiB2YWx1ZS4uLiAgRmFpbGluZyBpbml0aWFsaXphdGlvbiBzZWVt
cyBiZXR0ZXIgdGhhbiByZXVzaW5nIHdoYXRldmVyIHRoZQo+IGxhc3QgZG9tYWluIGxlZnQgdGhl
cmUuCgpBZ3JlZWQuCgo+IAo+ID4gKwo+ID4gKwlpZiAod2lkX2ZvdW5kKSB7Cj4gPiArCQlpZiAo
aGYtPmhhc19wbWx3aWRsaXN0ICYmCj4gPiArCQkgICAgIShoZi0+cG1sd2lkbGlzdCAmIEJJVF9V
TEwod2lkX3ZhbCkpKSB7Cj4gPiArCQkJc2JpX3ByaW50ZigiJXM6IGRvbWFpbiB3aWQgJXUgbm90
IGluIHBtbHdpZGxpc3RcbiIsCj4gPiArCQkJCSAgIF9fZnVuY19fLCB3aWRfdmFsKTsKPiA+ICsJ
CQlyZXR1cm4gU0JJX0VJTlZBTDsKPiA+ICsJCX0KPiA+ICsJCWNzcl93cml0ZShDU1JfTUxXSUQs
IHdpZF92YWwpOwo+ID4gKwl9Cj4gPiArCj4gPiArCWlmIChzYmlfaGFydF9oYXNfZXh0ZW5zaW9u
KHNjcmF0Y2gsIFNCSV9IQVJUX0VYVF9TTVdJRERFTEVHKSkKPiA+ICsJCWNzcl93cml0ZShDU1Jf
TVdJRERFTEVHLCBkb20tPndpZGRlbGVnKTsKPiAKPiBJIHdvdWxkIGJlIGEgaGFwcGllciBpZiB3
ZSBhZGRlZCBhIGxpdHRsZSBiaXQgb2Ygd2lkZGVsZWcgdmVyaWZpY2F0aW9uLAo+IHNvIERUIG1p
c3Rha2VzIHdvdWxkbid0IHNob290IHVzIGluIHRoZSBoZWFkLgoKU3VyZS4KClJlZ2FyZHMsClBl
dGVyIExpbgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
