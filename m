Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468B7606A32F
	for <opensbi@archiver.kernel.org>; Wed, 18 Nov 2026 02:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xRG7zh3N;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=aAb680ls
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=slGyYK2ITX9+FrnyO3BBTCr+P8TK7IwrbQlP8DqIhCw=; b=xRG7zh3ND6vjFOg1cKLyVsJfff
	C2jBCinhyriSqfYBtXgodxjF6Tx23ftVRslhe4Q3v6yyGyY1B3pSKaEQB93vfdBfHbH+4OydSr4EN
	ZNa+6I4y2DEmnC6oD/GXSiYylMtfbkx8sUamTnugbw1X6Gvs/I635NZvOg7wYTTBNS5n7BVoLca6W
	kJWilHP6XYIKe3A7uwWhadXvY69bJAoo1wnl9MxSZ/E8bRDxNj+1q028ZVOWgkNj+akRA5L5bOpE6
	nTIPDZ/emGE5NKBu4reDYhVf5pBMm1+0fLBFo/IRr/r0y6uoncjLlRKbZ0N2m3QkDy9PUkUA4pPj0
	VQeUA5Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTUyo-00000007VE7-1cB1;
	Wed, 18 Nov 2026 02:00:58 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTUyk-00000007VDC-0D9o
	for opensbi@lists.infradead.org;
	Wed, 18 Nov 2026 02:00:57 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso266894a12.3
        for <opensbi@lists.infradead.org>; Tue, 17 Nov 2026 18:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794967252; x=1795572052; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zEYCH0vyUNxDCPYRYqLmALy1y/wAY31YU9hNgy3beeY=;
        b=aAb680lsAFceUHIF5udKwRGZJYzKQH+cGaRBhjlHMoHH5tityzJtjk1MFo3qySXHYH
         oHgP8bGXSohFIxVdB4Yoxyvf3qYZZlVzrzxuCcbKX86+gSrd8UH9/QQGJ+AJn5rcEC3R
         xb/Mu3g5g7AkR3hFboe6so7K90TDz1Q41pr8qZtDmJ1oAADcBqn0s06Q8e0TH52pm1iz
         TEluaEv2ViGX/IRwzUeYNaDw+H+qdRyjWLmZ1/BTaDH8nz0WCus866VTN0C4hXpzONqv
         /7nQeZVWcKu5t+tzb3u9BM3Apj/sYRBfSNp7ugoK42kfA7rd9ayHIZEhznzhHI7C5shF
         WtKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794967252; x=1795572052;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zEYCH0vyUNxDCPYRYqLmALy1y/wAY31YU9hNgy3beeY=;
        b=bSoarS+tqkhX/7MNzORpnnAuEJkJwtRTzbhx3062Xkwf2nnfIqFnr4eE02rxscZQW9
         x7MNadXmwRip3V3XBcrNMDyKosJcJslvF5fAr6KnF36Qcs3F2BAD2ON5MVjrbLCb/2F4
         vCD22WhOfdKzB1DsyIO8KEFrNM1qb76O6MtRMaacaTGYaeon535WLusyrNotlPkkXkMB
         1FzqNyTYzj+MV+/ci5qP6hTSlpJGXKKdZ+dgnvH1xqDzvKS3XL0xBHKr35RLDC0tGFuO
         mFVOf7Wxhy/xrTj5d/yxrgZwvKoRnxzbS73L/mow7CYe9+B9Kxei/OD0VknHHSxVR+Op
         wc0g==
X-Gm-Message-State: APuU4Z+HcY6jv9/bqTpMk4GoFUUPkOFbfGrYBhRafBBrKAAwKgxv7z1g
	+Mm13RhSa7NPdjRU/aVmgQlKe5osqvvQS9WX24qEIsnmH/uKm9QHJfw+9acSCmtiG4I=
X-Gm-Gg: AZFdTZetYa6o/kd2sHS9X/WrgRHR2gaTPtll/f2EQkNeul0j/rtfND8vztiKHQShVwW
	Oeq9ZXj5pMHpWMQ/H4IzDIP68lCGNpZSEQGHnNN05W9EsVMWtefOGx5oQJyYMIXQlAoy0BP3EFM
	CIRxCtyOX7+LCSsvhobAPXee8n7aZ1OiK4EEomL+BVoXFYeNYtrgqWvhsFvePfMdJjFzM5mPJZh
	A7tEjpzCxFVhaIq26HJcj4/k5PSgTR1h8zOTOY0wy9p4sYiLH41s+qwOrfKDTc6tqQwdwOUPaX8
	LkHRfmFqeyP2WBMk1xZfYBLvqgusDHXz65FpMUF3Fc9EM4NwGgVyMNCSFElfztO+gHfdNtveCtt
	1lXd3UVwdHiAUgHkmxoyhS4SIGpJsDLo1H9xcYUGLjtAlTlLffu1LifYbOG2LKhm0Kp8ykoHZO0
	CBf885PYAnSHhBeceGeWMhIhBMUzk8DiAIOKQCC8EhSA5w8PL6c6n2AF7mnAz1bgeDzl9Qv//8Q
	j3ma1k4V2USv0cvat3kzaTIEvh1R1oY+RMIRIryPKXiTKKHMDbqaf7J0rlisjVtUHRpbXEMEu8Z
	NOmsg2XAwZ/C9cmpkqSswS/5EwaMEfdkP3X2wJdh5fE6oPBq
X-Received: by 2002:a17:90a:d44e:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3b3d07c9d76mr1168437a91.56.1794967252256;
        Tue, 17 Nov 2026 18:00:52 -0800 (PST)
Received: from plin-1878 ([136.226.240.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d0b6b42dsm1528223a91.0.2026.11.17.18.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:00:51 -0800 (PST)
Date: Wed, 18 Nov 2026 10:00:47 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org, pawandeep.oza@oss.qualcomm.com,
	rkrcmar@qti.qualcomm.com, raymond.mao@riscstar.com,
	robin.randhawa@sifive.com, samuel.holland@sifive.com,
	zong.li@sifive.com, greentime.hu@sifive.com
Subject: Re: [PATCH v5 4/9] lib: sbi_hart: lock mwid CSR for RoT immutability
Message-ID: <av0GzyFfzDvasVEW@plin-1878>
References: <20261110095029.117504-1-peter.lin@sifive.com>
 <20261110095029.117504-5-peter.lin@sifive.com>
 <CAAhSdy2=JhtXg_h==eiet7nJ-VMaq7VCMgmVuha-uwQKkVEmMw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy2=JhtXg_h==eiet7nJ-VMaq7VCMgmVuha-uwQKkVEmMw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_180054_109756_55E295E4 
X-CRM114-Status: GOOD (  26.68  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgQW51cCwKCk9uIE1vbiwgTm92IDE2LCAyMDI2IGF0IDA2OjQ5OjUwUE0gKzA1MzAsIEFudXAg
UGF0ZWwgd3JvdGU6Cj4gT24gVHVlLCBOb3YgMTAsIDIwMjYgYXQgMzoyMOKAr1BNIFl1LUNoaWVu
IFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+ID4KPiA+IExvY2sgdGhl
IE0tbW9kZSBXb3JsZCBJRCAobXdpZCkgQ1NSIGR1cmluZyBoYXJ0IHJlLWluaXRpYWxpemF0aW9u
Cj4gPiB0byBlbmZvcmNlIGltbXV0YWJpbGl0eSBvZiB0aGUgV0lEIGVzdGFibGlzaGVkIGJ5IHRo
ZSByb290LW9mLXRydXN0Lgo+ID4KPiA+IE9wZW5TQkkgZG9lcyBub3QgYXNzaWduIHRoZSBXSUQg
dmFsdWUgaXRzZWxmOyBpdCBvbmx5IHNldHMgTVdJRF9MT0NLCj4gPiB0byBmcmVlemUgdGhlIHZh
bHVlIGVzdGFibGlzaGVkIGJ5IHByaW9yIFJvVCBzdGFnZS4gVGhlIE1XSURfTE9DSyBiaXQKPiA+
IGF0IFhMRU4tMSBpcyBzdGlja3kgYW5kIG1ha2VzIHRoZSBDU1IgcmVhZC1vbmx5IHVudGlsIHJl
c2V0LCBlbmZvcmNpbmcKPiA+IGEgdGVtcG9yYWwgc2VjdXJpdHkgYm91bmRhcnkgcGVyIHRoZSBS
SVNDLVYgV29ybGRzIHNwZWNpZmljYXRpb24uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWXUtQ2hp
ZW4gUGV0ZXIgTGluIDxwZXRlci5saW5Ac2lmaXZlLmNvbT4KPiA+IC0tLQo+ID4gQ2hhbmdlcyB2
NC0+djU6Cj4gPiAtIE1vdmUgdGhlIE1XSUQgbG9jayBvdXQgb2Ygc2JpX2hhcnRfcmVpbml0KCkg
aW50byBzbXdpZF9oYXJ0X2luaXQoKQo+ID4gLSBEcm9wIFJCLXRhZ3MgZnJvbSBPemEgYW5kIEFu
dXAKPiA+IC0tLQo+ID4gIGxpYi9zYmkvc2JpX2hhcnQuYyB8IDEyICsrKysrKysrKysrKwo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2xp
Yi9zYmkvc2JpX2hhcnQuYyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+ID4gaW5kZXggZDg2YWJmMDcu
LmE3MjFiZWY0IDEwMDY0NAo+ID4gLS0tIGEvbGliL3NiaS9zYmlfaGFydC5jCj4gPiArKysgYi9s
aWIvc2JpL3NiaV9oYXJ0LmMKPiA+IEBAIC00NjksNiArNDY5LDE2IEBAIHN0YXRpYyBpbnQgaGFy
dF9taHBtX2dldF9hbGxvd2VkX2JpdHModm9pZCkKPiA+ICAgICAgICAgcmV0dXJuIG51bV9iaXRz
Owo+ID4gIH0KPiA+Cj4gPiArc3RhdGljIHZvaWQgc213aWRfaGFydF9pbml0KHN0cnVjdCBzYmlf
c2NyYXRjaCAqc2NyYXRjaCkKPiA+ICt7Cj4gPiArICAgICAgIC8qCj4gPiArICAgICAgICAqIEFz
c3VtZSBNV0lEIGlzIHJlc3RvcmVkIGJ5IHJvb3Qtb2YtdHJ1c3QgTS1tb2RlIGluIHByZXZpb3Vz
Cj4gPiArICAgICAgICAqIHN0YWdlLiBMb2NrIG13aWQgc28gUm9ULWRlZmluZWQgV0lEIHJlbWFp
bnMgaW1tdXRhYmxlLgo+ID4gKyAgICAgICAgKi8KPiA+ICsgICAgICAgaWYgKHNiaV9oYXJ0X2hh
c19leHRlbnNpb24oc2NyYXRjaCwgU0JJX0hBUlRfRVhUX1NNV0lEKSkKPiA+ICsgICAgICAgICAg
ICAgICBjc3Jfc2V0KENTUl9NV0lELCBNV0lEX0xPQ0spOwo+IAo+IElmIHBtd2lkIGlzIGF2YWls
YWJsZSB0aGVuIHdlIHNob3VsZCBzZXQgcG13aWQgaW4gTVdJRCBDU1IKPiBiZWZvcmUgbG9ja2lu
ZyBpdC4gVGhpcyB3aWxsIGhlbHAgcGxhdGZvcm1zIHdoZXJlIE9wZW5TQkkgYm9vdHMKPiBmaXJz
dCB3aXRob3V0IGFueSBwcmlvciBib290aW5nIHN0YWdlLgo+IAo+IFdoYXQgZG8geW91IHRoaW5r
ID8KClRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24uIEknZCBwcmVmZXIgbG9jay1vbmx5LCBiZWNh
dXNlIHdyaXRpbmcgcG13aWQgYmVmb3JlIHRoZQpsb2NrIGlzIGVpdGhlciBhIG5vLW9wIG9yIGNh
biB1bmRvIGFuIGVhcmxpZXIgc3RhZ2UncyBkZWNpc2lvbi4KClRoZSBzcGVjIHNheXMgIk9uLXJl
c2V0LCB0aGUgbXdpZCBDU1IgaXMgZXhwZWN0ZWQgdG8gc2hvdyB0aGUgcGxhdGZvcm0tZGVmaW5l
ZCBwbXdpZAp2YWx1ZSIsIHNvIGlmIE9wZW5TQkkgaXMgdGhlIGZpcnN0IHN0YWdlLCBtd2lkIGFs
cmVhZHkgZXF1YWxzIHBtd2lkIGFuZCB0aGUgd3JpdGUKY2hhbmdlcyBub3RoaW5nLgoKSXQgb25s
eSBjaGFuZ2VzIHNvbWV0aGluZyB3aGVuIG13aWQgIT0gcG13aWQsIHdoaWNoIG1lYW5zIGFuIGVh
cmxpZXIgc3RhZ2UgaGFzIGFscmVhZHkKcHJvZ3JhbW1lZCBtd2lkLiBFeGFtcGxlIHdpdGggbldv
cmxkcz0xNiwgdHJ1c3RlZCBXSUQgPSAxNToKCjEuIE91dCBvZiByZXNldCwgbXdpZCA9IHBtd2lk
ID0gMTUuIFRoZSBSb1QgcnVucyBpbiB0aGUgdHJ1c3RlZCBXSUQuCjIuIFRoZSBSb1QgY29uZmln
dXJlcyB0aGUgd2dDaGVja2VycyBzbyB0aGF0IFdJRCAzIGNhbiBvbmx5IGFjY2VzcyBPcGVuU0JJ
J3MgCiAgIFJBTS9kZXZpY2VzIGFuZCBjYW5ub3QgdG91Y2ggdGhlIHdnQ2hlY2tlciBjb25maWd1
cmF0aW9uIHJlZ2lzdGVycy4KICAgLSBUaGUgUm9UIHdyaXRlcyBtd2lkID0gMyB0byBkZW1vdGUg
cnVudGltZSBNLW1vZGUsIGJ1dCBsZWF2ZXMgdGhlIGxvY2sKICAgICBiaXQgdW5zZXQgYW5kIGhh
bmRzIG92ZXIgdG8gT3BlblNCSS4KNC4gT3BlblNCSSB3cml0ZXMgcG13aWQgKDE1KSB0byBtd2lk
LCB0aGVuIHNldHMgdGhlIGxvY2sgYml0Lgo1LiBPcGVuU0JJIGlzIG5vdyBiYWNrIGluIHRoZSB0
cnVzdGVkIFdJRCwgYW5kIGxvY2tlZCB0aGVyZSB1bnRpbCB0aGUgbmV4dCByZXNldC4KICAgSXQg
Y2FuIHJlY29uZmlndXJlIHRoZSB3Z0NoZWNrZXJzIGFuZCB0aGUgUm9UJ3MgZGVtb3Rpb24gaXMg
dW5kb25lLgoKR2l2ZW4gdGhlIGNhc2UgYWJvdmUsIEkgdGhpbmsgd2Ugc2hvdWxkIGtlZXAgbXdp
ZCB1bnRvdWNoZWQuCgpUaGFua3MsClBldGVyIExpbgoKPiAKPiA+ICt9Cj4gPiArCj4gPiAgc3Rh
dGljIGludCBzbXJubWlfaGFydF9pbml0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkKPiA+
ICB7Cj4gPiAgICAgICAgIGNvbnN0IHN0cnVjdCBzYmlfcGxhdGZvcm0gKnBsYXQ7Cj4gPiBAQCAt
NzIxLDYgKzczMSw4IEBAIGludCBzYmlfaGFydF9yZWluaXQoc3RydWN0IHNiaV9zY3JhdGNoICpz
Y3JhdGNoKQo+ID4gIHsKPiA+ICAgICAgICAgaW50IHJjOwo+ID4KPiA+ICsgICAgICAgc213aWRf
aGFydF9pbml0KHNjcmF0Y2gpOwo+ID4gKwo+ID4gICAgICAgICByYyA9IHNtcm5taV9oYXJ0X2lu
aXQoc2NyYXRjaCk7Cj4gPiAgICAgICAgIGlmIChyYykKPiA+ICAgICAgICAgICAgICAgICByZXR1
cm4gcmM7Cj4gPiAtLQo+ID4gMi40My43Cj4gPgo+IAo+IFJlZ2FyZHMsCj4gQW51cAoKLS0gCm9w
ZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
