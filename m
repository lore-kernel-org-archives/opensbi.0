Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CABCD4855
	for <opensbi@archiver.kernel.org>; Tue, 12 May 2026 07:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jMI9LXUN47N0YByNRhWBCYrlg0Lf7+Jd/OSjchsLQ6w=; b=HG9WEiSNNr6qjh
	d55QAO0jDfRHysRGFSGDHpuCuzpkTPo15wDwBsYY6FnLZ283for3dDWWn7zLMMGRugNAr46/nkGpb
	EdzaUKizRDv3gmMP1Km7KxzbBXJED2CvSWovvAINoobGis9a9iqUJOvJJqSgXjK0QKwcJ05RFVTI6
	AuiAejg8vbWA+VhvcNup0SZWyUQ9/l4c0yuu6LSLkIVpF8X4q3Ep3usf7NlSB+DsxkpnqpjNag/b3
	FntAQorcNdp/bNy9mEIXJckHanPbyiFONs4zJymZKNjSx6ryTplcM4fiNdZgsoCc9vrLZZYwJ8t2j
	2ix25M92Kt83ZuCt0z8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMi1N-0000000G0aX-2DJQ;
	Tue, 12 May 2026 07:59:17 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMi1K-0000000G0ZF-2SVn
	for opensbi@lists.infradead.org;
	Tue, 12 May 2026 07:59:15 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-696ad0c2c2dso2718253eaf.0
        for <opensbi@lists.infradead.org>; Tue, 12 May 2026 00:59:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778572753; cv=none;
        d=google.com; s=arc-20240605;
        b=OotrEYXi4uz5eTqnhKJALtjLc7VlWg9CM2RCnN9mCnByCcSAWCqESsK9DtnrznQE7d
         4dkfhKO0IS5//pqjw/fNjOqxF7Fb4i+d1wc/jE48nzV1FEx4ZHDc84a6gw0TytyPlnLu
         3NJWPNFb6edagayJ+9pNPcmdsXsF46zMSdP+XYzuajKnCzrn6670kgCm9I41ilI8hwCI
         lTawP8AVvbJRtG7vre9WdVsEDJJeAjZ1j+CUGXwfwwRYryxSm+GhmUTo6XtzcjZgisuv
         oRy+fEQpVAB1eJm7UC2E0Y8kW48v2t6eeeN/mbrtkm/k628pVBFqeUFRmrICnKoPVR8x
         snpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5XnNkiCXH++69vGy4zbjdyysoCl+eJ2GHZsWJ3ViHMw=;
        fh=y3RuX1tgpuBJsfbq6flEnCh4JgG/T6bYWEQajeXMnHo=;
        b=WyspLtd4WcGIrkbMGxho5ILDPO7dux/OLxRN98U9q2PYPB0Bffh0ki/DkPPIr7PZ69
         l+eJhe0zJ/2Vj5MGE9p6zieycVsRy3W9R9/i+8L2Jdz6Utg+s4eK3f7VKHDRqhGOjntJ
         30IkMEQOGhOXV285Wccs3r44UFxDVmboitFbwR9VqSJ3WziV37CtHzHXIh4yHviz26D1
         ydFS9oD75NmpCvJ1nrFDLRGA0Xmz5/HjOU3HPyBv/Wefw17iAFw4kvfchN0WIcQKzv1l
         PAqOy7kam2veY5Zd4hWCdJBYm93jbrYzb2LedIrXgXbu3lr60YbsA0vKijQTLuLAEDpJ
         a0ug==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778572753; x=1779177553; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5XnNkiCXH++69vGy4zbjdyysoCl+eJ2GHZsWJ3ViHMw=;
        b=cFE5YrH6EHanMDOtW0Ki9Mw1NtZx8Ps+guW4F3oAHhMm2ZX1isDjLLxPi4qfKasLb9
         TuiZNE6eOQVwLIfc6I0ABv1A5pvDjK69JWCfbmx2os0DJJhKRO5Rcea4x8BcR7y+iqmx
         lfB/49cOom9ljGJOFK2rz9WVFhiGOEtGPTWcNKwG/mBukVd6eAZMBPZn4mCUAH9R+v7O
         BBRv7c5Xzh2pcJc8nv+Axl7e0aseGtIUEf+nR1hR8XPazRdi+InNThbFSWwbaRQQQfL2
         iDRH2VMFapJRfGuaKKAHbFB2n0AlX3z9Bjy2q9XUtMoxootK6vQkV7XNFWRxOFU9Qyto
         7T0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778572753; x=1779177553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5XnNkiCXH++69vGy4zbjdyysoCl+eJ2GHZsWJ3ViHMw=;
        b=W7Ib07AjrKjlyEd4agsTWsepWUZpWV5QnPEW94TqdLDZ+aWj80XJ8745K232EyfFnz
         5udNsNTBwFJ2VSTE+9T8Ge3HTWB3a3nZ9TnJmNk9zEtrEqhv9yWZk6nrXEkf2nhEkq4y
         fMAIN9XpCWZVHAL2w7CLv5D+qzX2mcvF43d6Cysp2DxWtheiVccSUNQPHbbFuJBl6Zcq
         0uxlDyi3a8bqM6ntso+fxb+jYJLMlaJ2o2yZcU7vUHsTV/vd6mxffA4kTyQEtYPckccw
         RrYTMuq7GXyHcxE+WLs62cMF+5aL/j06X1/2ks8Qiw47fE/UouQ14w8hz+DtGEnvptYy
         dpNw==
X-Forwarded-Encrypted: i=1; AFNElJ9n4lXt7FOJ0jVkO1PfO76rxeNWQZHBpdgVFKhrQeZ7FWcBJb/3REn7zPeXGKIX6M2GVG4KPXex@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+xxvMxmkzNQOlIBfb+Npgh9IU3I02dr1wb1nEpTm1rMWmztQw
	AsQdwAJL9wO9gCUpAJn+DK7DEw3NGb+NsGsplSaVEUaDXbpyNDR8Z+wWQK1hn8eU7BtfLrOjJ2v
	jw5fLVcnxaUyzRsqb1P81rzepGktNRLOnnj7c/a8WwSsqNdraUaX8
X-Gm-Gg: Acq92OHFxHiQQFBPUzZEKoiKGwaIjDRQvTIdmH6mO+w3CMcHwkHS2JTvcPFwrDtCn2v
	FGJO1bchUp9RCioNCrBvzEdohBbrPHFQq96Q5FcnXIGfxCyaAcl5fLoc4W8xDsb5LhIJaWokItL
	O5MM0wGmhSchQXuNzz16oPwB8uuwNdWwVrmPeY7ALDy5IqRYm/Ex0tGWqsjWGagpV8Ljrz9rBMA
	8v4aLhE3cbISwJmi08I58+l5gton+B71xksD5NreZE7rs93mluPD16SBVKin1Bvhxqu3w++PUrK
	X8UpBPKdXEqqROQ+KODEwXedvmkzbwlo5KePLl5JSbrMT600rlTO4C/PSukIwu9zCW0n0jHrTNz
	sykJFyakBkxu0L8SGFa0NSUREFAT8q2N0wJnh
X-Received: by 2002:a05:6820:812:b0:696:2cf3:3bc5 with SMTP id
 006d021491bc7-69998cfe1d8mr15076921eaf.31.1778572753031; Tue, 12 May 2026
 00:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778176768.git.evvoevod@tenstorrent.com>
 <88b1470e1e3348d454b4b995a11a85c01914f7af.1778176768.git.evvoevod@tenstorrent.com>
 <CAAhSdy3Pm5ESW17pz5wZxrbB5hoTHVBz_rQWo9voa6s+gxi7Pw@mail.gmail.com> <CAHh=Yk9PUdCc3kbBWxmaEOOG1WauvYXctFdrQhvM-=NbWr_DCg@mail.gmail.com>
In-Reply-To: <CAHh=Yk9PUdCc3kbBWxmaEOOG1WauvYXctFdrQhvM-=NbWr_DCg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 12 May 2026 13:28:59 +0530
X-Gm-Features: AVHnY4KtlWyMTzWeuC5CueV4VimqFALigp5qQPQ7i9f9iSW0Y0NfjNkSGVa7SHk
Message-ID: <CAAhSdy0TLbpLmfO_LPLn0cPqs-gD0EzvbYEaUvHpZuv_NYQXRQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] lib: sbi: hart: Detect and enable Smrnmi before
 trap-based feature detection
To: Nylon Chen <nylon.chen@sifive.com>
Cc: Evgeny Voevodin <evvoevod@tenstorrent.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_005914_735299_EB96E35D 
X-CRM114-Status: GOOD (  37.39  )
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

T24gVHVlLCBNYXkgMTIsIDIwMjYgYXQgMTI6MTTigK9QTSBOeWxvbiBDaGVuIDxueWxvbi5jaGVu
QHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4g
5pa8IDIwMjblubQ15pyIOeaXpemAseWFrSDkuIvljYgyOjUx5a+r6YGT77yaCj4KPiA+Cj4gPiBP
biBUaHUsIE1heSA3LCAyMDI2IGF0IDExOjM44oCvUE0gRXZnZW55IFZvZXZvZGluCj4gPiA8ZXZ2
b2V2b2RAdGVuc3RvcnJlbnQuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gVGhlIGxvY2F0aW9uIG9m
IHRoZSBSTk1JL0UgdHJhcCB2ZWN0b3JzIGluIHRoZSBTbXJubWkgZXh0ZW5zaW9uIGlzCj4gPiA+
IGltcGxlbWVudGF0aW9uLWRlZmluZWQsIHNvIHBsYXRmb3JtcyB3aXRoIHZlbmRvci1zcGVjaWZp
YyBOTUkgdmVjdG9yCj4gPiA+IG1lY2hhbmlzbXMgbXVzdCBpbnN0YWxsIHRoZSBmaXJtd2FyZSdz
IE5NSSBlbnRyeSBwb2ludHMgdGhlbXNlbHZlcy4KPiA+ID4KPiA+ID4gQWRkIGFuIHNtcm5taV9o
YW5kbGVyc19pbml0KCkgY2FsbGJhY2sgdG8gc2JpX3BsYXRmb3JtX29wZXJhdGlvbnMgdGhhdAo+
ID4gPiByZWNlaXZlcyB0aGUgZmlybXdhcmUgZW50cnkgcG9pbnRzIGFuZCBsZXRzIHBsYXRmb3Jt
IGNvZGUgaW5zdGFsbCB0aGVtCj4gPiA+IGF0IHRoZSBoYXJkd2FyZS1zcGVjaWZpYyB2ZWN0b3Ig
bG9jYXRpb25zLiBUd28gcG9pbnRlcnMgYXJlIHBhc3NlZDoKPiA+ID4KPiA+ID4gICAtIF90cmFw
X3JubWlfaGFuZGxlcjogdGhlIGRlZGljYXRlZCBSTk1JIGVudHJ5IHBvaW50IHRoYXQgc2F2ZXMK
PiA+ID4gICAgIGNvbnRleHQgdXNpbmcgdGhlIFNtcm5taSBNTiogQ1NScyBhbmQgcmV0dXJucyB2
aWEgbW5yZXQuCj4gPiA+ICAgLSBfdHJhcF9oYW5kbGVyOiB0aGUgcmVndWxhciBNLW1vZGUgdHJh
cCBlbnRyeSBzaW5jZSBSTk1FIGlzIHRha2VuCj4gPiA+ICAgICBhcyBhIHJlZ3VsYXIgTS1tb2Rl
IHRyYXAgd2l0aCBOTUlFPTAuCj4gPiA+Cj4gPiA+IFdoZW4gU21ybm1pIGlzIHByZXNlbnQsIGlu
c3RhbGwgdGhlIHBsYXRmb3JtJ3MgTk1JIHZlY3RvcnMgdmlhIHRoZSBuZXcKPiA+ID4gY2FsbGJh
Y2ssIGluaXRpYWxpemUgTU5TQ1JBVENIIHdpdGggdGhlIHBlci1oYXJ0IHNjcmF0Y2ggcG9pbnRl
ciwgYW5kCj4gPiA+IHNldCBNTlNUQVRVUy5OTUlFLgo+ID4gPgo+ID4gPiBTbXJubWktZW5hYmxl
ZCBwbGF0Zm9ybXMgbXVzdCByZWdpc3RlciBzbXJubWlfaGFuZGxlcnNfaW5pdDsgaWYgdGhlCj4g
PiA+IGV4dGVuc2lvbiBpcyBkZXRlY3RlZCBidXQgbm8gY2FsbGJhY2sgaXMgcmVnaXN0ZXJlZCwg
c2JpX3BhbmljKCkgaXMKPiA+ID4gY2FsbGVkIHNpbmNlIGVuYWJsaW5nIE5NSXMgd2l0aG91dCBo
YW5kbGVycyBpbiBwbGFjZSB3b3VsZCByb3V0ZQo+ID4gPiBzdWJzZXF1ZW50IHRyYXBzIGludG8g
bm93aGVyZS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogRXZnZW55IFZvZXZvZGluIDxldnZv
ZXZvZEB0ZW5zdG9ycmVudC5jb20+Cj4gPgo+ID4gTEdUTS4KPiA+Cj4gPiBSZXZpZXdlZC1ieTog
QW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KPiA+Cj4gPiBSZWdhcmRzLAo+ID4gQW51
cAo+ID4KPiA+ID4gLS0tCj4gPiA+ICBpbmNsdWRlL3NiaS9zYmlfcGxhdGZvcm0uaCB8ICA0ICsr
KysKPiA+ID4gIGxpYi9zYmkvc2JpX2hhcnQuYyAgICAgICAgIHwgMjAgKysrKysrKysrKysrKysr
KysrKysKPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4g
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2JpX3BsYXRmb3JtLmggYi9pbmNsdWRlL3NiaS9z
YmlfcGxhdGZvcm0uaAo+ID4gPiBpbmRleCA3MTVkZjQ5OS4uZmUzODJiNTYgMTAwNjQ0Cj4gPiA+
IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV9wbGF0Zm9ybS5oCj4gPiA+ICsrKyBiL2luY2x1ZGUvc2Jp
L3NiaV9wbGF0Zm9ybS5oCj4gPiA+IEBAIC0xNTAsNiArMTUwLDEwIEBAIHN0cnVjdCBzYmlfcGxh
dGZvcm1fb3BlcmF0aW9ucyB7Cj4gPiA+ICAgICAgICAgLyoqIHBsYXRmb3JtIHNwZWNpZmljIHBt
cCBkaXNhYmxlIG9uIGN1cnJlbnQgSEFSVCAqLwo+ID4gPiAgICAgICAgIHZvaWQgKCpwbXBfZGlz
YWJsZSkodW5zaWduZWQgaW50IG4pOwo+ID4gPgo+ID4gPiArICAgICAgIC8qKiBwbGF0Zm9ybSBz
cGVjaWZpYyBTbXJubWkgaGFuZGxlcnMgaW5pdCBvbiBjdXJyZW50IEhBUlQgKi8KPiA+ID4gKyAg
ICAgICB2b2lkICgqc21ybm1pX2hhbmRsZXJzX2luaXQpKHZvaWQgKCpybm1pX2hhbmRsZXIpKHZv
aWQpLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICB2b2lkICgqcm5tZV9oYW5kbGVyKSh2
b2lkKSk7Cj4gPiA+ICsKPiA+ID4gICAgICAgICAvKiogcGxhdGZvcm0gc3BlY2lmaWMgU21ybm1p
IE5NSSBoYW5kbGVyLgo+ID4gPiAgICAgICAgICAqICBSZXR1cm5zIFNCSV9TVUNDRVNTIG9uIHN1
Y2Nlc3MsIGVycm9yIGNvZGUgaWYgTk1JIGNhbm5vdCBiZSBoYW5kbGVkLiAqLwo+ID4gPiAgICAg
ICAgIGludCAoKnJubWlfaGFuZGxlcikoc3RydWN0IHNiaV90cmFwX2NvbnRleHQgKnRjbnR4KTsK
PiA+ID4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2hhcnQuYyBiL2xpYi9zYmkvc2JpX2hhcnQu
Ywo+ID4gPiBpbmRleCA3ODExNjFlNS4uOTJjNjAyYWEgMTAwNjQ0Cj4gPiA+IC0tLSBhL2xpYi9z
Ymkvc2JpX2hhcnQuYwo+ID4gPiArKysgYi9saWIvc2JpL3NiaV9oYXJ0LmMKPiA+ID4gQEAgLTUz
Miw2ICs1MzIsMjYgQEAgc3RhdGljIGludCBoYXJ0X2RldGVjdF9mZWF0dXJlcyhzdHJ1Y3Qgc2Jp
X3NjcmF0Y2ggKnNjcmF0Y2gpCj4gPiA+ICAgICAgICAgaWYgKHJjKQo+ID4gPiAgICAgICAgICAg
ICAgICAgcmV0dXJuIHJjOwo+ID4gPgo+ID4gPiArICAgICAgIGlmIChzYmlfaGFydF9oYXNfZXh0
ZW5zaW9uKHNjcmF0Y2gsIFNCSV9IQVJUX0VYVF9TTVJOTUkpKSB7Cj4gPiA+ICsgICAgICAgICAg
ICAgICBjb25zdCBzdHJ1Y3Qgc2JpX3BsYXRmb3JtICpwbGF0ID0gc2JpX3BsYXRmb3JtX3RoaXNo
YXJ0X3B0cigpOwo+ID4gPiArICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IHNiaV9wbGF0Zm9y
bV9vcGVyYXRpb25zICpvcHMgPSBzYmlfcGxhdGZvcm1fb3BzKHBsYXQpOwo+ID4gPiArICAgICAg
ICAgICAgICAgZXh0ZXJuIHZvaWQgX3RyYXBfcm5taV9oYW5kbGVyKHZvaWQpOwo+ID4gPiArICAg
ICAgICAgICAgICAgZXh0ZXJuIHZvaWQgX3RyYXBfaGFuZGxlcih2b2lkKTsKPiA+ID4gKwo+ID4g
PiArICAgICAgICAgICAgICAgaWYgKCFvcHMgfHwgIW9wcy0+c21ybm1pX2hhbmRsZXJzX2luaXQp
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHNiaV9wYW5pYygiU21ybm1pIGRldGVjdGVk
LCBidXQgcGxhdGZvcm0gbGFja3Mgc21ybm1pX2hhbmRsZXJzX2luaXQgY2FsbGJhY2tcbiIpOwo+
ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAgICAvKiBSZXVzZSBfdHJhcF9oYW5kbGVyIGZvciB0
aGUgUk5NRSBzbG90IHNpbmNlIFJOTUUgaXMgdGFrZW4KPiA+ID4gKyAgICAgICAgICAgICAgICAq
IGFzIGEgcmVndWxhciBNLW1vZGUgdHJhcCB3aXRoIE5NSUU9MC4gKi8KPiA+ID4gKyAgICAgICAg
ICAgICAgIG9wcy0+c21ybm1pX2hhbmRsZXJzX2luaXQoX3RyYXBfcm5taV9oYW5kbGVyLCBfdHJh
cF9oYW5kbGVyKTsKPiA+ID4gKwo+ID4gPiArICAgICAgICAgICAgICAgLyogSW5pdGlhbGl6ZSBN
TlNDUkFUQ0ggZm9yIHRoZSBSTk1JIGhhbmRsZXIgKi8KPiA+ID4gKyAgICAgICAgICAgICAgIGNz
cl93cml0ZShDU1JfTU5TQ1JBVENILCBzY3JhdGNoKTsKPiA+ID4gKwo+ID4gPiArICAgICAgICAg
ICAgICAgLyogRW5hYmxlIE5NSXMgKi8KPiA+ID4gKyAgICAgICAgICAgICAgIGNzcl9zZXQoQ1NS
X01OU1RBVFVTLCBNTlNUQVRVU19OTUlFKTsKPiBUd28gY29uY2VybnMgYWJvdXQgdGhpcyBibG9j
awo+Cj4gRmlyc3QsIHNiaV9wYW5pYygpIHdoZW4gc21ybm1pX2hhbmRsZXJzX2luaXQgaXMgTlVM
TCBpcyB0b28gc3RyaWN0Lgo+IE5vdCBhbGwgcGxhdGZvcm1zIHdpdGggU21ybm1pIG5lZWQgdG8g
cHJvZ3JhbSBhIHZlbmRvci1zcGVjaWZpYyBOTUkKPiB2ZWN0b3IgcmVnaXN0ZXIuCj4gU29tZSBp
bXBsZW1lbnRhdGlvbnMgaGF2ZSBhIGZpeGVkIE5NSSB2ZWN0b3IgYWRkcmVzcyBvciByb3V0ZSBO
TUlzCj4gdGhyb3VnaCBtdHZlYyBieSBkZWZhdWx0OyBmb3IgdGhlc2UsIHNldHRpbmcgTU5TQ1JB
VENIIGFuZCBOTUlFIGlzCj4gc3VmZmljaWVudCBhbmQgbm8gcGxhdGZvcm0gY2FsbGJhY2sgaXMg
bmVlZGVkLgo+Cj4gVGhpcyBjYW4gYmUgcmVwcm9kdWNlZCB3aXRoIFFFTVUgdmlydDoKPgo+IHFl
bXUtc3lzdGVtLXJpc2N2NjQgLU0gdmlydCAtY3B1IHJ2NjQsc21ybm1pPW9uIC1tIDI1Nm0gXAo+
ICAgICAgIC1iaW9zIGZ3X2p1bXAuYmluIC1ub2dyYXBoaWMgLW5vLXJlYm9vdAo+Cj4gVGhlIGZp
cm13YXJlIGhhbmdzIHdpdGggemVybyBvdXRwdXQuIFRoZSBwYW5pYyBmaXJlcyBiZWZvcmUKPiBz
YmlfcGxhdGZvcm1fZWFybHlfaW5pdCgpIHNvIHRoZSBjb25zb2xlIGlzIG5vdCB5ZXQgaW5pdGlh
bGl6ZWQgYW5kCj4gdGhlIG1lc3NhZ2UgaXMgc2lsZW50bHkgZHJvcHBlZC4KPgo+IEFkZGluZyBh
IG5vLW9wIHN0dWIgdG8gdGhlIGdlbmVyaWMgcGxhdGZvcm0gY29uZmlybXMgdGhlIHBhbmljIGlz
ICB0aGUKPiBzb2xlIGNhdXNlIC0tIGJvb3QgcHJvY2VlZHMgbm9ybWFsbHkgd2l0aCB0aGUgc3R1
YiBpbiBwbGFjZS4KPgo+IFNlY29uZCwgdGhlIGNhbGxiYWNrIHJldHVybnMgdm9pZCwgc28gdGhl
cmUgaXMgbm8gd2F5IHRvIGRldGVjdAo+IHdoZXRoZXIgdGhlIHBsYXRmb3JtIHN1Y2NlZWRlZCBp
biBwcm9ncmFtbWluZyB0aGUgTk1JIHZlY3Rvci4KPiBjc3Jfc2V0KE1OU1RBVFVTLCBOTUlFKSB0
aGVuIHJ1bnMgdW5jb25kaXRpb25hbGx5Lgo+IElmIHRoZSBjYWxsYmFjayBmYWlscyBzaWxlbnRs
eSwgTk1JcyBhcmUgZW5hYmxlZCBidXQgdGhlIGhhcmR3YXJlCj4gdmVjdG9yIHJlZ2lzdGVyIGlz
IGxlZnQgYXQgaXRzIHJlc2V0IHZhbHVlLiBUaGUgZmlyc3QgTk1JIHdvdWxkIGp1bXAKPiB0byBh
biB1bmRlZmluZWQgYWRkcmVzcy4KPgo+IFN1Z2dlc3RlZCBmaXg6Cj4KPiAvKiBhbGxvdyBOVUxM
OiBwbGF0Zm9ybXMgd2l0aCBmaXhlZCBvciBtdHZlYy1iYXNlZCBOTUkgdmVjdG9ycwo+ICogZG8g
bm90IG5lZWQgdG8gcHJvZ3JhbSBhbnkgdmVuZG9yIHJlZ2lzdGVyICovCj4gaWYgKG9wcyAmJiBv
cHMtPnNtcm5taV9oYW5kbGVyc19pbml0KSB7Cj4gICAgICAgICBpbnQgcmV0ID0gb3BzLT5zbXJu
bWlfaGFuZGxlcnNfaW5pdChfdHJhcF9ybm1pX2hhbmRsZXIsCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBfdHJhcF9oYW5kbGVyKTsKPiAgICAgICAgIGlmIChy
ZXQpCj4gICAgICAgICAgICAgcmV0dXJuIHJldDsKPiB9Cj4KPiBjc3Jfd3JpdGUoQ1NSX01OU0NS
QVRDSCwgc2NyYXRjaCk7Cj4gY3NyX3NldChDU1JfTU5TVEFUVVMsIE1OU1RBVFVTX05NSUUpOwo+
Cj4gVGhpcyByZXF1aXJlcyBjaGFuZ2luZyB0aGUgY2FsbGJhY2sgc2lnbmF0dXJlIGZyb20gdm9p
ZCB0byBpbnQuCj4KPiBQbGF0Zm9ybXMgdGhhdCBoYXZlIG5vdGhpbmcgdG8gcHJvZ3JhbSByZXR1
cm4gMCwgcGxhdGZvcm1zIHRoYXQgZmFpbAo+IHJldHVybiBhbiBlcnJvciwgYW5kIHBsYXRmb3Jt
cyB3aXRoIG5vIGNhbGxiYWNrIGF0IGFsbCBhcmUgaGFuZGxlZAo+IGdyYWNlZnVsbHkgd2l0aG91
dCBhIHBhbmljLgo+CgpQbGVhc2Ugc2VuZCBhIHBhdGNoIHdpdGggYXBwcm9wcmlhdGUgRml4ZXMg
dGFnLgoKUmVnYXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5zYmkK
