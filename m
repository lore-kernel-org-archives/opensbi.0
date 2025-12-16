Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865BAD609D7
	for <opensbi@archiver.kernel.org>; Tue, 16 Dec 2025 18:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6A+IQZCWlPG19GAPiqamX286bg9vLC7rpndswRDXLkY=; b=xojAQrZoZ16STm
	Xr9ry7LI8DOqVGq85J47apmtcjoVRv8jY8SreWQmDixs+TjlS8RMzWM0JiktovFrGnNjWYuUq0gLA
	9C6zh/swt4AON6Tptt7Wag8Z4G22HdBU//fa0Ct+IoWz8owUFYUfJD+nqq4Ue2ULitaY0W3KQRFW9
	BLpdg82zT9Jlu9XNAoujz+lJZ0QQPR6ER3chuZfkc60/pP+VrHlpuLpYVNkT98p40Txw+cEg+L/j6
	h8s5d3XvP6bga7Tr7aYn/e7PIyIp+bzirWKU5/YWkMxP/sO0Z4QUH1L78X16mWiI2onUJaqNOzPcj
	+hPdK09nNNsgCsJrqrpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZSB-00000005hGP-2QiL;
	Tue, 16 Dec 2025 18:07:19 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZS8-00000005hFH-3hKT
	for opensbi@lists.infradead.org;
	Tue, 16 Dec 2025 18:07:18 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-3f4f9ea26aaso3673730fac.0
        for <opensbi@lists.infradead.org>; Tue, 16 Dec 2025 10:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1765908435; x=1766513235; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzOEVQWRTulsGqRCzj0S7VD2RL18A70waokpP5jXLVY=;
        b=rS6UOyDmNASAzptdaVfGytHTFCAxr5++Bqck5IYSrq61Xw6mhL5ST/TirkDzj+9SAC
         48JoKGVW6VG44WFpNO8GLwK/FXruLrKEuaR/Sao/DM59Ah/sClILued0qluL/NL1djEm
         bsSyURfjFuWnny6LdaP6I6s49fTv8f4mHnbR+ZOyhEEiqEZYPK3UA2sgWolfDpvCAu/u
         f0SY1xq7N+EGtYtBU6aF+gadK8rLsZnE8h0W8ZLD0ZAGSOJeOIQ/I7ztG2FooPUV5yuK
         h6/pID0YSHdZSs3cW779tAy1rAqu7Qxf55ka4rmkhnZmLSf/TJ6qMaN1NOlvpLDfYxeT
         qjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765908435; x=1766513235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pzOEVQWRTulsGqRCzj0S7VD2RL18A70waokpP5jXLVY=;
        b=nzyrQc+fF6qc6mL3XMFpJk+dKVC3rvhR25rBruFwKBN/2u0em9rfA4KHXpTtzWlcJx
         grILQvFo4kQKeyBK+rItWiumdhvqgkFr7bOUwkrFmDjvX5C9ZLvmXkLnAQkoYoDCjFYC
         ffHUdz+s7PO8oT7RWZOjEnewMvt65+rs00BVcSwIsb/kkiEs5JZKpZCLHY5HjaAyh2VB
         dtBq42/ayQHrRmlgbi71Zw/MzY2yAGEjM+Ne/fF+lvE5RdXhg2d8NUnRQwGHX6IPUprb
         FzipkLzYq5JKbn/TpMXcy1wZfPwa4kWRg9P34ClgX7HxDgBkhrQ41lyOlMiwLBF+cmba
         nvHw==
X-Forwarded-Encrypted: i=1; AJvYcCVd/fRkFS1HyRbk8nH/CEI1q5MBChtwFBELb9guxID1UMrHLjKe9FKvISfLyLvxVbb9pvuZpM+y@lists.infradead.org
X-Gm-Message-State: AOJu0YxuqOcMsBkFzBbCSYwlIjdytCrkfgWnWjmBy6bIwCDT8dQuwZI1
	cZtSOrrDloLj+ExzHoXF4lsuifvc+hX1DQvPDc7Mg/1YaxZiIJIHwfiI/wS2Oyyw3D/3liektOR
	SoXiyNmRzgxlLTohVCPx9GSJyS9fRYKtJtnvPuhD3zA==
X-Gm-Gg: AY/fxX68HZ3pSszhPj80hLNyLoUNvbynbkLsHhZCwEYULdeks/NC0QlNRaw58CEZGYM
	MfaldcCI7NmFGpzROeBNgXPfjM8TlKjcka5lF+MOS01NQv3OaCoC8Fs/Z9h97AXR3FXHniqx1E1
	BcSKcdZH/aT3CpA6+RKy2qRigKkwJ8VQ7znLdmsuehQCeDeLjl7jgfk6eiChBDi2165EsWPOw/E
	1ldtyH47k7eyOqHolTqmI0XxsH8cRmS3U/Cij1ZDbbKUBtceQDBguBWTuvnSLt5sYlw3gEf
X-Google-Smtp-Source: AGHT+IFl7p8S1FeXQP9dltat/hzokWI6XmsmOakNgchfFKC2fbbDn/yJPAFir65eEE+BFK+kka5ZVeCpzFTNDwSr3pE=
X-Received: by 2002:a05:6820:1888:b0:659:9a49:8fe5 with SMTP id
 006d021491bc7-65b4518bf6amr6807587eaf.18.1765908434985; Tue, 16 Dec 2025
 10:07:14 -0800 (PST)
MIME-Version: 1.0
References: <20251209053130.407935-1-apatel@ventanamicro.com>
 <CAAhSdy3wZ=ih970E1ZT9tW+=gz1gYbjMWELriHX1ya-pr40iUw@mail.gmail.com>
 <bdfa024a-ad3d-47af-b629-ede7d4ecd607@sifive.com> <CAK9=C2URiHPjLaYuF_rZbjsUCT+s+=o24_M8NM_W=kBQDVqdUA@mail.gmail.com>
 <fa570c2d-43b0-480b-833e-62f99dac7da7@sifive.com>
In-Reply-To: <fa570c2d-43b0-480b-833e-62f99dac7da7@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 16 Dec 2025 23:37:03 +0530
X-Gm-Features: AQt7F2rnc7tqUnbcZSNvVqSggH4v9xlpmdwmOnJfElDfewpi9UFzDF73DlsaaxQ
Message-ID: <CAAhSdy0f_CMkFbqXcs4OmHjh7f4N+vS1FAGKAkYWM2zxGAcSGQ@mail.gmail.com>
Subject: Re: [PATCH v3] platform: generic: Keep some empty space in FDT passed
 to next stage
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_100717_054892_6ECA80F7 
X-CRM114-Status: GOOD (  21.75  )
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

T24gVHVlLCBEZWMgMTYsIDIwMjUgYXQgMTE6MDHigK9QTSBTYW11ZWwgSG9sbGFuZAo8c2FtdWVs
LmhvbGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBPbiAyMDI1LTEyLTE2IDExOjA5IEFNLCBB
bnVwIFBhdGVsIHdyb3RlOgo+ID4gT24gVHVlLCBEZWMgMTYsIDIwMjUgYXQgOToyNeKAr1BNIFNh
bXVlbCBIb2xsYW5kCj4gPiA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gPj4K
PiA+PiBBbnVwLAo+ID4+Cj4gPj4gT24gMjAyNS0xMi0xNiA4OjQ1IEFNLCBBbnVwIFBhdGVsIHdy
b3RlOgo+ID4+PiBPbiBUdWUsIERlYyA5LCAyMDI1IGF0IDExOjAx4oCvQU0gQW51cCBQYXRlbCA8
YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4+Pj4KPiA+Pj4+IExlYXZpbmcgbm8g
ZW1wdHkgc3BhY2UgaW4gdGhlIEZEVCBwYXNzZWQgdG8gdGhlIG5leHQgYm9vdGluZyBzdGFnZQo+
ID4+Pj4gY2F1c2VzIHRoZSBmb2xsb3dpbmcgVS1Cb290IGNyYXNoIG9uIFZlbnRhbmEgaW50ZXJu
YWwgcGxhdGZvcm1zOgo+ID4+Pj4KPiA+Pj4+IFVuaGFuZGxlZCBleGNlcHRpb246IExvYWQgYWNj
ZXNzIGZhdWx0Cj4gPj4+PiBFUEM6IDAwMDAwMDAwZmZmYTYzNzIgUkE6IDAwMDAwMDAwZmZmYTc0
MTggVFZBTDogMDAwMTc0NjE3NDczMDA2OAo+ID4+Pj4gRVBDOiAwMDAwMDAwMDgwMjQ1MzcyIFJB
OiAwMDAwMDAwMDgwMjQ2NDE4IHJlbG9jIGFkanVzdGVkCj4gPj4+Pgo+ID4+Pj4gU1A6ICAwMDAw
MDAwMGZlZjM4NDQwIEdQOiAgMDAwMDAwMDBmZWY0MGU2MCBUUDogIDAwMDAwMDAwMDAwMDAwMDAK
PiA+Pj4+IFQwOiAgMDAwMDAwMDBmZWY0MGE3MCBUMTogIDAwMDAwMDAwMDAwMGZmMDAgVDI6ICAw
MDAwMDAwMDAwMDAwMDAwCj4gPj4+PiBTMDogIDAwMDAwMDAwZmZmYzE3YTggUzE6ICAwMDAwMDAw
MGZlZjM4ZDQwIEEwOiAgNzM3NTc0NjE3NDczMDA2OAo+ID4+Pj4gQTE6ICAwMDAwMDAwMGZmZmMx
N2E4IEEyOiAgMDAwMDAwMDAwMDAwMDAxMCBBMzogIDAwMDAwMDAwMDAwMDAwMTAKPiA+Pj4+IEE0
OiAgMDAwMDAwMDAwMDAwMDAwMCBBNTogIDAwMDAwMDAwZmZmYzE3YjggQTY6ICAwMDAwMDAwMDAw
ZmYwMDAwCj4gPj4+PiBBNzogIDAwMDAwMDAwMDAwMGIxMDAgUzI6ICAwMDAwMDAwMDAwMDAwMDAw
IFMzOiAgMDAwMDAwMDAwMDAwMDAwMQo+ID4+Pj4gUzQ6ICAwMDAwMDAwMGZlZjM4ZDQwIFM1OiAg
NzM3NTc0NjE3NDczMDA2OCBTNjogIDAwMDAwMDAwMDAwMDAwMDAKPiA+Pj4+IFM3OiAgMDAwMDAw
MDBmZWY0ZWVmMCBTODogIDAwMDAwMDAwZmVmNGVmOTAgUzk6ICAwMDAwMDAwMDAwMDAwMDAwCj4g
Pj4+PiBTMTA6IDAwMDAwMDAwMDAwMDAwMDAgUzExOiAwMDAwMDAwMGZlZjRlZmMwIFQzOiAgMDAw
MDAwMDBmZWY0MGVhOAo+ID4+Pj4gVDQ6ICAwMDAwMDAwMDAwZmYwMDAwIFQ1OiAgMDAwMDAwMDBm
ZWY0MGE2MCBUNjogIDAwMDAwMDAwZmVmNDBhNmMKPiA+Pj4+Cj4gPj4+PiBUbyBhZGRyZXNzIHRo
ZSBhYm92ZSBpc3N1ZSwga2VlcCBzb21lIG1pbmltYWwgZW1wdHkgc3BhY2UgaW4gdGhlCj4gPj4+
PiBGRFQgaW5zdGVhZCBvZiBubyBlbXB0eSBzcGFjZS4KPiA+Pj4+Cj4gPj4+PiBGaXhlczogYmJl
OWEyMzA2MGU5ICgicGxhdGZvcm06IGdlbmVyaWM6IFBhY2sgdGhlIEZEVCBhZnRlciBhcHBseWlu
ZyBmaXh1cHMiKQo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRh
bmFtaWNyby5jb20+Cj4gPj4+Cj4gPj4+IEFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yv
b3BlbnNiaSByZXBvLgo+ID4+Cj4gPj4gQWdhaW4sIHRoaXMgcGF0Y2ggcmVpbnRyb2R1Y2VzIHRo
ZSBidWcgdGhhdCB3YXMgZml4ZWQgYnkgdGhlICJGaXhlczoiIGNvbW1pdC4KPiA+PiBZb3UgY2Fu
J3QganVzdCBzYXkgInNvbWVib2R5IHdpbGwgYWRkIHRoZSBtZW1zZXQoKSBzb21ld2hlcmUgbGF0
ZXIiIGFuZCBpZ25vcmUKPiA+PiB0aGUgYnVnIHlvdSBhcmUgaW50cm9kdWNpbmcuIFlvdSBuZWVk
IHRvIGFkZCB0aGUgbWVtc2V0KCkgKm5vdyogYWxvbmcgd2l0aCB0aGUKPiA+PiBmZHRfb3Blbl9p
bnRvKCkgY2FsbC4KPiA+Cj4gPiBZZXMsIGJ1dCB0aGF0IGZpeCBicm9rZSBVLWJvb3QgYm9vdGlu
Zy4KPgo+IEFuZCBpdCBpcyBlbnRpcmVseSBwb3NzaWJsZSB0byBmaXggVS1ib290IGJvb3Rpbmcg
d2l0aG91dCBicmVha2luZyBvdGhlciB1c2Vycwo+IChjdncsIGV0Yy4pIGluIHRoZSBwcm9jZXNz
LiBZZXMsIHRoZSBvcmlnaW5hbCBjb21taXQgZXhwb3NlZCBhIGJ1ZyBpbiBVLUJvb3QuCj4gQnVn
cyBoYXBwZW47IHdlIGNhbiBmaXggdGhlbSBvciB3b3JrIGFyb3VuZCB0aGVtLiBCdXQgbmVlZGlu
ZyB0byBmaXggb25lIGJ1ZyBpcwo+IG5vdCBsaWNlbnNlIHRvIGludGVudGlvbmFsbHkgaW50cm9k
dWNlIG1vcmUgYnVncy4KCllvdSBmYWlsZWQgdG8gdW5kZXJzdGFuZCBteSBwb2ludC4gWW91IG9y
aWdpbmFsIGZpeCB3YXMgYWxyZWFkeQppbmNvbXBsZXRlIHNpbmNlIGluc3RlYWQgb2YgcGFja2lu
ZyB0aGUgRkRUIGl0IHNob3VsZCBoYXZlIGRvbmUKbWVtc2V0KCkgb2YgdW5pbml0aWFsaXplZCBz
cGFjZSBpbiBGRFQuCgo+Cj4gPiBUaGUgb3JpZ2luYWwgZml4IGl0c2VsZiB3YXMgaW5jb21wbGV0
ZS4gQWRkaW5nIG1lbXNldCgpIHRvCj4gPiBmZHRfb3Blbl9pbnRvKCkgaXMgYSBzZXBhcmF0ZSBj
aGFuZ2UuIEZlZWwgZnJlZSB0byBzZW5kCj4gPiBwYXRjaCBmb3IgaXQuCj4KPiBJZiB5b3Ugd2Fu
dCBhZGRpbmcgbWVtc2V0KCkgdG8gZmR0X29wZW5faW50bygpIHRvIGJlIGEgc2VwYXJhdGUgY2hh
bmdlLCB0aGVuCj4gdGhhdCBjaGFuZ2UgbXVzdCBiZSBtZXJnZWQgKmZpcnN0KiwgYmVmb3JlIHRo
aXMgcGF0Y2gsIHNvIGl0IGlzIHRoZW4gc2FmZSB0byBhZGQKPiB0aGUgY2FsbCB0byBmZHRfb3Bl
bl9pbnRvKCkuIEJlY2F1c2Ugbm93IHlvdSBoYXZlIGJyb2tlbiBiaXNlY3RhYmlsaXR5IGZvciB0
aGUKPiBhZmZlY3RlZCBwbGF0Zm9ybXMuIFRoZSB1bmluaXRpYWxpemVkIG1lbW9yeSBpc3N1ZSB3
YXMgY29tcGxldGVseSBmaXhlZCBieSB0aGUKPiBvcmlnaW5hbCBwYXRjaCwgYW5kIE9wZW5TQkkg
Y291bGQgYm9vdCBvbiBjdncgYXMgb2YgdGhhdCBjb21taXQ7IG5vdyBpdCBpcwo+IGJyb2tlbiBh
Z2FpbiwgYW5kIHRoYXQgaXMgYSByZWdyZXNzaW9uLgoKVGhlIG9yaWdpbmFsIGZpeCBmb3IgcGFj
a2luZyBGRFQgd2FzIGFscmVhZHkgYnJva2VuIHNvIGRvbid0CmJsYW1lIG1lIGZvciBwYXJ0aWFs
bHkgcmV2ZXJ0aW5nLgoKUmVnYXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9w
ZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL29wZW5zYmkK
