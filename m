Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AEDCD3447
	for <opensbi@archiver.kernel.org>; Sat,  9 May 2026 06:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X6Bl2Cmd/3bNqFBuC0BqjYNBF3co1h4Akjam6t+ROeo=; b=rfnutz6Caqipt5
	STeZ66+UnOmxRk8DnETrcRbBXHBBdVqrxcxQV5CvqSi0nhrTBTWPcuFgEscSwGBhyfhSzXiofx/mX
	IU2yt0tL/g9Eadw7lviB1TfjHrDQR7m2ZcjyHOJM3qR+T6hhzN5WNRSYBJaIFJ8jAiHve7gqxczyX
	SG6745Lcn1WLWYDCTTPwSdB8WtIaOPu8N/rkfwd3UpIPpMPx4ufhJsXEYU9QJ2IRCaVg00oKFeaGm
	u6ms4bLo2RrQE+JTs3fvT+9IYkS18G0RywQuwL/kUBwzIdk8xftkvDmpYkhB2mXzr1vvHYb//MPaN
	8DkjqrZmBVohbBm1Hs/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLbWj-00000008QRB-3hns;
	Sat, 09 May 2026 06:51:05 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLbWh-00000008QQS-0IG6
	for opensbi@lists.infradead.org;
	Sat, 09 May 2026 06:51:04 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-6967080e6c0so1629431eaf.2
        for <opensbi@lists.infradead.org>; Fri, 08 May 2026 23:51:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778309461; cv=none;
        d=google.com; s=arc-20240605;
        b=kcfphrvyZN6yeAQgkJdFRLQIsLXGe2YrckEr/dy6SxIocWgz+TStk2KNWU7GTIwnq4
         VqOwhq6JLBrXM8AmzyiSo5aF2coZGM+AIuruiqgfga7Gr+CAoHYtOOQIoS1E+DReLdcU
         JAW7ek9ReDTNhFDALwQgk5n19EZ/zwIdEe9I8yyhQoQdqrBVt+FIsVWWbjAiE8bnbkaQ
         6V2ogdusPDFAO6SKYsnxS+ONXSYx65r3COXuM/RtKfsEkGIWvhRPpvzu/yd7cwoTLaJd
         UcX0zqpW6DcOtId17JXhG63HxZ2rPfl5v4jhqo7Q7u4TDrh/D+uKxYmyEIymV/9+WA0k
         PATw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6v+nRtravXkrwBPS1bpTLXAnPecHi97CyktFnaXMFbo=;
        fh=ZAtPgNT/mWeTZ6vNEkZRyB0hM0YzwkpsSL1tZLHA+mM=;
        b=MRZsQmVPain6w89zJ1feh3us1y0c98ttKqklkhidpo5izoLOGLMZUmQ8GFT49zCCwt
         qoLKmIixaxHzI1OkbwN9T0VFGrnXIgphmQynzckFvLGr3ntO2UTJ7NUWrUJcX6q/OYuG
         ZLe316EGCcF0Z4POGq/haxeVFMtnVzEksHbZ6Wb+NHbD1jQDhVkdzw8pFpKyvFQ8ciGS
         +rW5pqyB2TaJyfb5zpkHVi7/T+n2ip8lTzlloQEv+pQJToHGTiLvEptfq1csEyvdS+7E
         VGzruDVRoA4bwxBj8K03B/w+Uq1NMYbd2Z976LxTehKtuh7BaeEQG0FPPgjniD5SNNSE
         W0RQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778309461; x=1778914261; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6v+nRtravXkrwBPS1bpTLXAnPecHi97CyktFnaXMFbo=;
        b=DE7Lrft19D6yCNkVd1t3Dr2x+NOn+nJHHfgElQguJalCKECBA6pusqSF6JAKMqJE8p
         C5P45FjipR2YaQsD0eGpvrf6ZWl72MveDqd/rrq/DgFBV7yjWN96WeJ11MFpRgEegkvG
         6C78pkVkTy3zvYOt6m4pFNvP1hJ0aE59DhyA+eXiCTg5PwMHOVb8VPMAQsNlWHHtEdpV
         3I13XLfeohqdWeN9k28D/PR5KnFjr0QA+qzOAgRkNXvv29El5tMMw+npcaqWANDwVADE
         41VdKOZHYhY/p7LBn880b1s1bS6Okca+pz5DIO9+7W5R0mg5m+Pn0Tsnij33Riby/RlJ
         FVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778309461; x=1778914261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6v+nRtravXkrwBPS1bpTLXAnPecHi97CyktFnaXMFbo=;
        b=M53wUKN8fZZVJkKEXinYqS9Qu7UWR/XgA3KQ/+LgY73bljHcRHAlcI/Hg1yyCOP2PF
         hyDxwFCSZKUQG3G75rXwznokknNbvps/xQt3/vPjNLCEm3O7JV1j2Bu53qK5mQqd5L2T
         uhLNkrmC7qkatpoF2ZDrWA0Am+fcU8QV5T5y3vtm48NN6jxV8DmrySw6PKoIwcVBjkA4
         6r1Hjwxe6GTkSoTk9CPLJTZZ0uFLVDh6iz95XYTch+zuSPpgP7UaL9fuXcdLuumE8UXg
         csYf+XiXJUUrTWsofgopMOkvBXGpfAO8V9CxO2nzqtiMGbizhxTdu0PtpAxLfPcjnKWD
         iNfg==
X-Gm-Message-State: AOJu0YyALb9kt1awJ76gqJaDLpGGMmtg9bnt14q2/CgIifu/vHO+s42I
	77IpAvYrcw0BZ4a4XBwX5aaYPXraP8h6QtPEjKXgQv7IbIW5vTQUYK0nrEzVY+l+IEvc6P29PPX
	eSHib401HnXxcEycNlZR4E7dV71xwmT3Kz4brSkw7vA==
X-Gm-Gg: AeBDietQBKpY/24D5u+RSeCi5fynGBZH5HGGXQHH0yc47QY3lsW7/3JNkto3/jcmDGC
	c/dTSuCQilZhOzLY6Atb/4UvRDTBQtxMg1e1HkUF7SZYWou/jZrwXu/jxJHQkTXDYM/2dJWgTJW
	pFpejRjz5x9C3ynLAwEhko9vmEbvvVDLlpFm+UmlY+eA0oyGJPvragUuaJsNgeVa0Z6woAON15k
	w6OOZ5X5R0UU0Zhgi1kkd9OdqOI2bBMAybBySuDOM8qqEGIifAYFdtCu/nH43ZzcArBs1mKQc21
	dBnXpwupVVSEj/fmvlht3GXhG4/Fb1SRqHa0gUllbFwyXQ6D79feMkGCeEZBnCzFtpnNlTz+BDY
	Cu46KKJ8w0S+rboNz6gZcau6aWw==
X-Received: by 2002:a05:6820:151a:b0:68c:373f:1835 with SMTP id
 006d021491bc7-69998d0d949mr8371489eaf.36.1778309460668; Fri, 08 May 2026
 23:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778176768.git.evvoevod@tenstorrent.com> <88b1470e1e3348d454b4b995a11a85c01914f7af.1778176768.git.evvoevod@tenstorrent.com>
In-Reply-To: <88b1470e1e3348d454b4b995a11a85c01914f7af.1778176768.git.evvoevod@tenstorrent.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 9 May 2026 12:20:48 +0530
X-Gm-Features: AVHnY4Kl_wS-yAxgKvBeQ4MhcniVr6DB8CWLgCzVlE2UBqSaNjEg-98-QqKsDRM
Message-ID: <CAAhSdy3Pm5ESW17pz5wZxrbB5hoTHVBz_rQWo9voa6s+gxi7Pw@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] lib: sbi: hart: Detect and enable Smrnmi before
 trap-based feature detection
To: Evgeny Voevodin <evvoevod@tenstorrent.com>
Cc: opensbi@lists.infradead.org, Nylon Chen <nylon.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_235103_301885_D6211F89 
X-CRM114-Status: GOOD (  23.31  )
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

T24gVGh1LCBNYXkgNywgMjAyNiBhdCAxMTozOOKAr1BNIEV2Z2VueSBWb2V2b2Rpbgo8ZXZ2b2V2
b2RAdGVuc3RvcnJlbnQuY29tPiB3cm90ZToKPgo+IFRoZSBsb2NhdGlvbiBvZiB0aGUgUk5NSS9F
IHRyYXAgdmVjdG9ycyBpbiB0aGUgU21ybm1pIGV4dGVuc2lvbiBpcwo+IGltcGxlbWVudGF0aW9u
LWRlZmluZWQsIHNvIHBsYXRmb3JtcyB3aXRoIHZlbmRvci1zcGVjaWZpYyBOTUkgdmVjdG9yCj4g
bWVjaGFuaXNtcyBtdXN0IGluc3RhbGwgdGhlIGZpcm13YXJlJ3MgTk1JIGVudHJ5IHBvaW50cyB0
aGVtc2VsdmVzLgo+Cj4gQWRkIGFuIHNtcm5taV9oYW5kbGVyc19pbml0KCkgY2FsbGJhY2sgdG8g
c2JpX3BsYXRmb3JtX29wZXJhdGlvbnMgdGhhdAo+IHJlY2VpdmVzIHRoZSBmaXJtd2FyZSBlbnRy
eSBwb2ludHMgYW5kIGxldHMgcGxhdGZvcm0gY29kZSBpbnN0YWxsIHRoZW0KPiBhdCB0aGUgaGFy
ZHdhcmUtc3BlY2lmaWMgdmVjdG9yIGxvY2F0aW9ucy4gVHdvIHBvaW50ZXJzIGFyZSBwYXNzZWQ6
Cj4KPiAgIC0gX3RyYXBfcm5taV9oYW5kbGVyOiB0aGUgZGVkaWNhdGVkIFJOTUkgZW50cnkgcG9p
bnQgdGhhdCBzYXZlcwo+ICAgICBjb250ZXh0IHVzaW5nIHRoZSBTbXJubWkgTU4qIENTUnMgYW5k
IHJldHVybnMgdmlhIG1ucmV0Lgo+ICAgLSBfdHJhcF9oYW5kbGVyOiB0aGUgcmVndWxhciBNLW1v
ZGUgdHJhcCBlbnRyeSBzaW5jZSBSTk1FIGlzIHRha2VuCj4gICAgIGFzIGEgcmVndWxhciBNLW1v
ZGUgdHJhcCB3aXRoIE5NSUU9MC4KPgo+IFdoZW4gU21ybm1pIGlzIHByZXNlbnQsIGluc3RhbGwg
dGhlIHBsYXRmb3JtJ3MgTk1JIHZlY3RvcnMgdmlhIHRoZSBuZXcKPiBjYWxsYmFjaywgaW5pdGlh
bGl6ZSBNTlNDUkFUQ0ggd2l0aCB0aGUgcGVyLWhhcnQgc2NyYXRjaCBwb2ludGVyLCBhbmQKPiBz
ZXQgTU5TVEFUVVMuTk1JRS4KPgo+IFNtcm5taS1lbmFibGVkIHBsYXRmb3JtcyBtdXN0IHJlZ2lz
dGVyIHNtcm5taV9oYW5kbGVyc19pbml0OyBpZiB0aGUKPiBleHRlbnNpb24gaXMgZGV0ZWN0ZWQg
YnV0IG5vIGNhbGxiYWNrIGlzIHJlZ2lzdGVyZWQsIHNiaV9wYW5pYygpIGlzCj4gY2FsbGVkIHNp
bmNlIGVuYWJsaW5nIE5NSXMgd2l0aG91dCBoYW5kbGVycyBpbiBwbGFjZSB3b3VsZCByb3V0ZQo+
IHN1YnNlcXVlbnQgdHJhcHMgaW50byBub3doZXJlLgo+Cj4gU2lnbmVkLW9mZi1ieTogRXZnZW55
IFZvZXZvZGluIDxldnZvZXZvZEB0ZW5zdG9ycmVudC5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6
IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+
ICBpbmNsdWRlL3NiaS9zYmlfcGxhdGZvcm0uaCB8ICA0ICsrKysKPiAgbGliL3NiaS9zYmlfaGFy
dC5jICAgICAgICAgfCAyMCArKysrKysrKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQs
IDI0IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9zYmlfcGxhdGZv
cm0uaCBiL2luY2x1ZGUvc2JpL3NiaV9wbGF0Zm9ybS5oCj4gaW5kZXggNzE1ZGY0OTkuLmZlMzgy
YjU2IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV9wbGF0Zm9ybS5oCj4gKysrIGIvaW5j
bHVkZS9zYmkvc2JpX3BsYXRmb3JtLmgKPiBAQCAtMTUwLDYgKzE1MCwxMCBAQCBzdHJ1Y3Qgc2Jp
X3BsYXRmb3JtX29wZXJhdGlvbnMgewo+ICAgICAgICAgLyoqIHBsYXRmb3JtIHNwZWNpZmljIHBt
cCBkaXNhYmxlIG9uIGN1cnJlbnQgSEFSVCAqLwo+ICAgICAgICAgdm9pZCAoKnBtcF9kaXNhYmxl
KSh1bnNpZ25lZCBpbnQgbik7Cj4KPiArICAgICAgIC8qKiBwbGF0Zm9ybSBzcGVjaWZpYyBTbXJu
bWkgaGFuZGxlcnMgaW5pdCBvbiBjdXJyZW50IEhBUlQgKi8KPiArICAgICAgIHZvaWQgKCpzbXJu
bWlfaGFuZGxlcnNfaW5pdCkodm9pZCAoKnJubWlfaGFuZGxlcikodm9pZCksCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgdm9pZCAoKnJubWVfaGFuZGxlcikodm9pZCkpOwo+ICsKPiAgICAgICAg
IC8qKiBwbGF0Zm9ybSBzcGVjaWZpYyBTbXJubWkgTk1JIGhhbmRsZXIuCj4gICAgICAgICAgKiAg
UmV0dXJucyBTQklfU1VDQ0VTUyBvbiBzdWNjZXNzLCBlcnJvciBjb2RlIGlmIE5NSSBjYW5ub3Qg
YmUgaGFuZGxlZC4gKi8KPiAgICAgICAgIGludCAoKnJubWlfaGFuZGxlcikoc3RydWN0IHNiaV90
cmFwX2NvbnRleHQgKnRjbnR4KTsKPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaGFydC5jIGIv
bGliL3NiaS9zYmlfaGFydC5jCj4gaW5kZXggNzgxMTYxZTUuLjkyYzYwMmFhIDEwMDY0NAo+IC0t
LSBhL2xpYi9zYmkvc2JpX2hhcnQuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+IEBAIC01
MzIsNiArNTMyLDI2IEBAIHN0YXRpYyBpbnQgaGFydF9kZXRlY3RfZmVhdHVyZXMoc3RydWN0IHNi
aV9zY3JhdGNoICpzY3JhdGNoKQo+ICAgICAgICAgaWYgKHJjKQo+ICAgICAgICAgICAgICAgICBy
ZXR1cm4gcmM7Cj4KPiArICAgICAgIGlmIChzYmlfaGFydF9oYXNfZXh0ZW5zaW9uKHNjcmF0Y2gs
IFNCSV9IQVJUX0VYVF9TTVJOTUkpKSB7Cj4gKyAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBz
YmlfcGxhdGZvcm0gKnBsYXQgPSBzYmlfcGxhdGZvcm1fdGhpc2hhcnRfcHRyKCk7Cj4gKyAgICAg
ICAgICAgICAgIGNvbnN0IHN0cnVjdCBzYmlfcGxhdGZvcm1fb3BlcmF0aW9ucyAqb3BzID0gc2Jp
X3BsYXRmb3JtX29wcyhwbGF0KTsKPiArICAgICAgICAgICAgICAgZXh0ZXJuIHZvaWQgX3RyYXBf
cm5taV9oYW5kbGVyKHZvaWQpOwo+ICsgICAgICAgICAgICAgICBleHRlcm4gdm9pZCBfdHJhcF9o
YW5kbGVyKHZvaWQpOwo+ICsKPiArICAgICAgICAgICAgICAgaWYgKCFvcHMgfHwgIW9wcy0+c21y
bm1pX2hhbmRsZXJzX2luaXQpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgc2JpX3BhbmljKCJT
bXJubWkgZGV0ZWN0ZWQsIGJ1dCBwbGF0Zm9ybSBsYWNrcyBzbXJubWlfaGFuZGxlcnNfaW5pdCBj
YWxsYmFja1xuIik7Cj4gKwo+ICsgICAgICAgICAgICAgICAvKiBSZXVzZSBfdHJhcF9oYW5kbGVy
IGZvciB0aGUgUk5NRSBzbG90IHNpbmNlIFJOTUUgaXMgdGFrZW4KPiArICAgICAgICAgICAgICAg
ICogYXMgYSByZWd1bGFyIE0tbW9kZSB0cmFwIHdpdGggTk1JRT0wLiAqLwo+ICsgICAgICAgICAg
ICAgICBvcHMtPnNtcm5taV9oYW5kbGVyc19pbml0KF90cmFwX3JubWlfaGFuZGxlciwgX3RyYXBf
aGFuZGxlcik7Cj4gKwo+ICsgICAgICAgICAgICAgICAvKiBJbml0aWFsaXplIE1OU0NSQVRDSCBm
b3IgdGhlIFJOTUkgaGFuZGxlciAqLwo+ICsgICAgICAgICAgICAgICBjc3Jfd3JpdGUoQ1NSX01O
U0NSQVRDSCwgc2NyYXRjaCk7Cj4gKwo+ICsgICAgICAgICAgICAgICAvKiBFbmFibGUgTk1JcyAq
Lwo+ICsgICAgICAgICAgICAgICBjc3Jfc2V0KENTUl9NTlNUQVRVUywgTU5TVEFUVVNfTk1JRSk7
Cj4gKyAgICAgICB9Cj4gKwo+ICAjZGVmaW5lIF9fY2hlY2tfaHBtX2NzcihfX2NzciwgX19tYXNr
KSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAgICBv
bGR2YWwgPSBjc3JfcmVhZF9hbGxvd2VkKF9fY3NyLCAmdHJhcCk7ICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gICAgICAgICBpZiAoIXRyYXAuY2F1c2UpIHsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gLS0KPiAyLjQzLjAKPgoKLS0gCm9wZW5z
YmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
