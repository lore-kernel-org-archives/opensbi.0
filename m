Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AB1CD8CAD
	for <opensbi@archiver.kernel.org>; Tue,  9 Jun 2026 22:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nSUf7NqC7wkxnQV1LBqDXf07kmfB9bC3zHRLtV31MiI=; b=WA8PYBZlvhyryX
	2aDNT3+2ztO/Cu/wzU55vZsNdRcB0YMke0MBlA3R1tD7PoujTCcQ9u4ONKrKmZt5nP+a8Fna6YeFI
	OQv2muomz3XWIrModUSyZYs0Yhkw8PFnKPBbrSanAhvEt2dMz2B/INgX7x4pLlZ47dE0YXjRN688W
	G44N9ZpfRHi/AuTQzf6utH9FnYOTKRCGuuJf7OrZjo4FjZYWjVR9EdKsNPqaVz+vRtqk6E6lxKxoR
	29HR1yMnlIJlDUSG3VTAN/swhGPDi8JuIAEUSVVwwvZ7rj3SdyrG97j7B1+3kxfc4us3OE9Hc+ekS
	oKb7Jr9XlIEq0GeE0BIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX4Ww-00000006QxX-2XAo;
	Tue, 09 Jun 2026 22:02:42 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX4Wt-00000006Qx1-29I0
	for opensbi@lists.infradead.org;
	Tue, 09 Jun 2026 22:02:41 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-65eb226b1ceso5355734d50.0
        for <opensbi@lists.infradead.org>; Tue, 09 Jun 2026 15:02:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781042558; cv=none;
        d=google.com; s=arc-20240605;
        b=eyzVJGC8SE4Qp3gZf1FEYAfH5eyvPexDqQyM6b2qdcqiZz/FWrzD7OGQJ5KHKqaNmo
         S7n4dkAu0d7oLDFX0gz3uNlQocLOBv+uDB8g0lf97OEyFf8YxV/MCl78vD8HkortjWfw
         U6nMvE4cLNL0T2kAmpffFL1HglU4xpVTtExw+EbVcrLG5Otiq/83kl09zd/0i+HXTPVs
         n0TKIsmX/5xzaQgFe/qCEkuCUmQWr0GCjHYSbEfhCh7q0kB8VJMVbhNwmfwXQALeOAOw
         XSYkSGYILGqTVGl5IzPxKjGMVkq3j+4FFlQn8eSWOpaFd9Qxvord4UsJiNoaqbZRQPJi
         xFMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lIkD6tMmXWjD7yHisCpcqe6Q16ORTWBsrud1xfts6OU=;
        fh=C8bvLRf9noHK1ZSfVJg+6ejxMXwlQNcPS5+4Ha8QIqo=;
        b=ErmvACbkRoy8bDvhJAUwVhQvTP4Wd1yVI7VT1u7d2c27vSUX6Km7seDuM4YWM9/EJz
         AnWw85o5vgh+Ngv+wZ7Ht8cV5M3NfOhxR1FrOu/7LduxtiB5IsHymaIDA6kMe7/pa79T
         uvcmznK/HkCa0/DWwHTY7Z/Wt2CT8PL1iMPUgetkdXK3HU2zURrxyKaD66on5yrRYPx/
         VndNip+Y0EF97TT3ix9MUIUDD9HmIu7ILtkbhSzpIK3GoCeAua7n3lsZBFEatFCPSjDV
         c+o44M6ude9nAWzKdCnS51IsSGTA4u0591G4snijl91YlczvhyqC5ko7wr9B8iAvv52L
         +/2g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1781042558; x=1781647358; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIkD6tMmXWjD7yHisCpcqe6Q16ORTWBsrud1xfts6OU=;
        b=K2FBY2fkZZulr/q54abZv3JDe4+Ki0bLF8AkqIXE2yW/+tTw6Lku02yY16eCI3hrtC
         9hphxXjp295Wd6ltGeyWdOIEzsL6O+1kg5kw4ZCcmychWBdE5VznxhnySjcf1Cv0XxhQ
         B8cgA7Y5JOzakVEBUhTMbCkGaljTuikvVmyzNMV930YWnzRiEee2gR80jftnBf1CXqUA
         H0SJv7AUyRSIJhREV3+lA2ynN7zJhKKa7my7PDNQYKTdSyYjHo3SggZOe5lZ97HWi0MT
         ItjvYQO5xZ/S/Nd2msj+Oiupxz1K+1IvN7o6+41mZPDzEylIEcM66H7ZrpD4G8RYbB9E
         Z7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781042558; x=1781647358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lIkD6tMmXWjD7yHisCpcqe6Q16ORTWBsrud1xfts6OU=;
        b=ZNt0n4akVRklFQamKlX4yTYG0hx+W3E6hHo/65GuAHtSy+UaoJHcsoT8U3vBbokyOE
         MoUhNbGEcFQHgTjkGtOZTDmAfAWoz3xHDr8E5pbvP2z0f3qOu0hV//RfskTiG4SA47xr
         xF9sC96yLfHssRuBpbmLTtObefumSn5cfooO6Q+fcs+llTc58kUTr7qILd7P0dbhEf0K
         q1CCjqHHstb0psJAX+G8nQBogcAINCApFbm3s3ZjKGkA2TArcrYLmi8gIjqcj78xRFp1
         NN8L208PDdbqWYu/zGOf0hF1yitl/OiPmxVJn9sdAoiAQXLwi5+pYsz+rhqAKq0qrs9v
         dlCg==
X-Gm-Message-State: AOJu0Yy1/MlP6XFt35pO4OYux4CQ9zAIe2FIzC5JDb42AXXDpYzewu/2
	cFAHFfFyWmx+bwQ8QMfEpNDBW06YRYrjv0sGmENBG5bwzHBapRfpieR4LAb9U/5Mx5CZ2pn/Zkc
	eAHY/Agcxe6ACL1yiX6KBUh+FDrpAxta2dLp6lfqvyQ==
X-Gm-Gg: Acq92OGP+JsARZJNwrz6PrzvDGRCEgE0LGMyEg3jjuVRMsQrZu7T54C39sQy4LZsmJ0
	U6xqIG7B7ZMaWtdW3DpL9LBNrfvCz9RSb7BjLcwyP+YZanUEj4RzmXTIhMcgBHT/c17Gk7kOeOm
	0li7D9hUKIiVCizrtbrOUQgUIdWn2rrOXAawUMDstpmkV0yzJyVHngODEGWjtby0UDLmZviaSUR
	dE9jjPHuzn336BiiPs0rNlrnJiHklGWeDLGFmOZh+ZJs4Huw15YmTVZJNcd1DUO4x/LZB6e7ZyP
	ssq1rqFafFELflqU+UMGi2y3Hyzwp3PKc8NHLZmn9phMlGkv6Q==
X-Received: by 2002:a53:bd88:0:b0:65e:3c29:cb42 with SMTP id
 956f58d0204a3-66106f40688mr15515503d50.38.1781042557543; Tue, 09 Jun 2026
 15:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260609060024.706-1-ganboing@gmail.com>
In-Reply-To: <20260609060024.706-1-ganboing@gmail.com>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Tue, 9 Jun 2026 17:02:25 -0500
X-Gm-Features: AVVi8CdIDsFAO5_SNA7anDiK59xD3nlAadtihH2RshWnUFl88c0bnOA87a3k5co
Message-ID: <CAEev2e-Gh5mtOPrcny8ZUHrLRg4160B5JPjDaMyrL_HWimEN7w@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Fixes for vector misaligned load/store handlers
To: Bo Gan <ganboing@gmail.com>
Cc: opensbi@lists.infradead.org, wangruikang@iscas.ac.cn, dramforever@live.com, 
	andrew.jones@oss.qualcomm.com, cleger@rivosinc.com, pjw@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_150239_757079_FD4DACAB 
X-CRM114-Status: GOOD (  21.11  )
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

SGkgQm8sCgpPbiBUdWUsIEp1biA5LCAyMDI2IGF0IDE6MDLigK9BTSBCbyBHYW4gPGdhbmJvaW5n
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBSZS12aXNpdCB0aGUgdmVjdG9yIG1pc2FsaWduZWQgbG9h
ZC9zdG9yZSBoYW5kbGVycyBhbmQgZml4Ogo+Cj4gYS4gQXZvaWQgc3RhY2sgb3ZlcmZsb3cgYnkg
dXNpbmcgYSBzbWFsbCBzbGlkaW5nIG1hc2tbXSBidWZmZXIsCj4gICAgdGh1cyBvcHRpbWl6ZXMg
c3RhY2sgdXNhZ2UgKklNUE9SVEFOVCogKGNvcnJlY3RuZXNzKS4gVGhlcmUncyBuby0KPiAgICBs
b25nZXIgYSBuZWVkIHRvIGhhdmUgYSBwcmUtZGVmaW5lZCB2bGVuIG1heGltdW0sIGFuZCB3b3Jy
eSBhYm91dAo+ICAgIHdoZXRoZXIgdGhlIHN0YWNrIGNhbiBob2xkIHRoZSBtYXNrW10gdmFyaWFi
bGUuCj4KPiBiLiBNYWludGFpbiB0aGUgdmFsdWUgb2YgdnN0YXJ0IHdoZW4gcmVkaXJlY3Rpbmcg
dXB0cmFwLiAob3B0bWl6YXRpb24pCj4gICAgQXZvaWRzIGRvaW5nIGR1cGxpY2F0ZSB3b3JrIHdo
ZW4gdGhlIGluc3RydWN0aW9uIGdldHMgcmVzdGFydGVkLgo+Cj4gYy4gRXhwbGljaXRseSBzZXQg
VlMgZGlydHkgaW4gKFYpU1NUQVRVUy4gKGNvcnJlY3RuZXNzKSwgVlMgaW4KPiAgICBWU1NUQVRV
UyBtdXN0IGJlIHNldCBkaXJ0eSBpZiBjb21pbmcgZnJvbSBWPTEuCj4KPiBkLiBaZXJvIG91dCB0
aW5zdCBpbiB1cHRyYXAgaWYgbm90IGd1ZXN0LXBhZ2UgZmF1bHQgKGNvcnJlY3RuZXNzKS4KPgo+
IFRoaXMgaXMgYSBmb2xsb3cgdXAgcGF0Y2ggdG8gWzFdIGFuZCBzaG91bGQgYmUgYXBwbGllZCBv
biB0b3AuCj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29wZW5zYmkvQ0FFZXYyZV9WZzFt
TVA0bU9LYW5GWF9FR2VVenBjelJjV1crK3ZCQnVOMUNmeU0wQkp3QG1haWwuZ21haWwuY29tL1Qv
I3QKPiAtLS0KPiB2MjogRml4IHRoZSB3cm9uZyBQQVRDSCA0LzQgZ2VuZXJhdGVkIGluIHYxLgoK
VGVzdGluZyBvbiBUZW5zdG9ycmVudCBCbGFja2hvbGUgd2l0aCBTaWZpdmUgWDI4MCBjb3Jlcy4K
CkFmdGVyIGFkZGluZyBzb21lIGxvZ2dpbmcgbGlrZSB0aGlzLCBJJ20gc3RpbGwgYWJsZSB0byBi
cmVhayB0aGUgYm9vdAoobGlrZSBJJ2QgcmVwb3J0ZWQgb24geW91ciBwcmV2aW91cyBwYXRjaCku
IEZ1bGwgbG9ncyBoZXJlCmh0dHBzOi8vZ2lzdC5naXRodWIuY29tL2FzcmluaXZhc2FuVFQvMTIw
NjQ2Y2JiNzE5NGU3YjM1MDU0MjhlYmVmYmRiMzAKCmRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV90
cmFwX3ZfbGRzdC5jIGIvbGliL3NiaS9zYmlfdHJhcF92X2xkc3QuYwppbmRleCAwZjI5ZGNmOS4u
MGY3M2MzMzkgMTAwNjQ0Ci0tLSBhL2xpYi9zYmkvc2JpX3RyYXBfdl9sZHN0LmMKKysrIGIvbGli
L3NiaS9zYmlfdHJhcF92X2xkc3QuYwpAQCAtMTcsNiArMTcsNyBAQAogI2luY2x1ZGUgPHNiaS9z
YmlfdHJhcC5oPgogI2luY2x1ZGUgPHNiaS9zYmlfdW5wcml2Lmg+CiAjaW5jbHVkZSA8c2JpL3Ni
aV92ZWN0b3IuaD4KKyNpbmNsdWRlIDxzYmkvc2JpX2NvbnNvbGUuaD4KCiAjaWZkZWYgT1BFTlNC
SV9DQ19TVVBQT1JUX1ZFQ1RPUgoKQEAgLTE2Myw2ICsxNjQsOCBAQCBzdGF0aWMgaW5saW5lIHZv
aWQKc2JpX21pc2FsaWduZWRfdl90aW5zdF9maXh1cChzdHJ1Y3Qgc2JpX3RyYXBfaW5mbyAqdXB0
cmFwKQoKIGludCBzYmlfbWlzYWxpZ25lZF92X2xkX2VtdWxhdG9yKHVsb25nIGluc24sIHN0cnVj
dCBzYmlfdHJhcF9jb250ZXh0ICp0Y250eCkKIHsKKyAgICAgICBzYmlfcHJpbnRmKCIlczogaW5z
bj0weCVseCBtZXBjPTB4JWx4IG10dmFsPTB4JWx4XG4iLAorICAgICAgICAgICAgICAgICAgX19m
dW5jX18sIGluc24sIHRjbnR4LT5yZWdzLm1lcGMsIHRjbnR4LT50cmFwLnR2YWwpOwogICAgICAg
IHN0cnVjdCBzYmlfdHJhcF9yZWdzICpyZWdzID0gJnRjbnR4LT5yZWdzOwogICAgICAgIHN0cnVj
dCBzYmlfdHJhcF9pbmZvIHVwdHJhcDsKICAgICAgICB1bG9uZyB2bCA9IGNzcl9yZWFkKENTUl9W
TCk7CkBAIC0yNzYsNiArMjc5LDggQEAgZG9uZToKCiBpbnQgc2JpX21pc2FsaWduZWRfdl9zdF9l
bXVsYXRvcih1bG9uZyBpbnNuLCBzdHJ1Y3Qgc2JpX3RyYXBfY29udGV4dCAqdGNudHgpCiB7Cisg
ICAgICAgc2JpX3ByaW50ZigiJXM6IGluc249MHglbHggbWVwYz0weCVseCBtdHZhbD0weCVseFxu
IiwKKyAgICAgICAgICAgICAgIF9fZnVuY19fLCBpbnNuLCB0Y250eC0+cmVncy5tZXBjLCB0Y250
eC0+dHJhcC50dmFsKTsKICAgICAgICBzdHJ1Y3Qgc2JpX3RyYXBfcmVncyAqcmVncyA9ICZ0Y250
eC0+cmVnczsKICAgICAgICBzdHJ1Y3Qgc2JpX3RyYXBfaW5mbyB1cHRyYXA7CiAgICAgICAgdWxv
bmcgdmwgPSBjc3JfcmVhZChDU1JfVkwpOwoKSXMgdGhpcyBleHBlY3RlZD8gQXJlIHRoZSBsb2dn
aW5nIHByaW50cyBjYXVzaW5nIHRoZSBvdmVyZmxvdz8KCklmIEkgZG9uJ3QgaGF2ZSB0aGlzIGxv
Z2dpbmcgcHJpbnRzIGFkZGVkLCBJJ20gYWJsZSB0byBib290IGZpbmUgaW50bwpsaW51eC4gSSB3
YXMgYWJsZSB0byBkbyB0aGlzIHdpdGggeW91ciBsYXN0IHBhdGNoLCBzbyB0aGlzIHBhdGNoCmRv
ZXNuJ3QgY2hhbmdlIG11Y2ggaW4gdGhhdCBhc3BlY3QuCgo+Cj4gLS0tCj4gQm8gR2FuICg0KToK
PiAgIGxpYjogc2JpOiBjb3NtZXRpYyBjaGFuZ2VzIHRvIHJlZHVjZSBpbmRlbnRhdGlvbgo+ICAg
bGliOiBzYmk6IFJld29yayBhbmQgc3BsaXQgc2JpX21pc2FsaWduZWQoX3YpX3RpbnN0X2ZpeHVw
Cj4gICBsaWI6IHNiaTogQWRkIHZhcmlhYmxlLWxlbmd0aCB1bnByaXZpbGVnZSBhY2Nlc3MgZnVu
Y3Rpb25zCj4gICBsaWI6IHNiaTogUmV3b3JrIG1pc2FsaWduZWQgdmVjdG9yIGxvYWQvc3RvcmUK
Pgo+ICBpbmNsdWRlL3NiaS9zYmlfdHJhcF9sZHN0LmggfCAgIDMgLQo+ICBpbmNsdWRlL3NiaS9z
YmlfdW5wcml2LmggICAgfCAgMTYgKysrCj4gIGluY2x1ZGUvc2JpL3NiaV92ZWN0b3IuaCAgICB8
ICAgNiArKwo+ICBsaWIvc2JpL3NiaV90cmFwX2xkc3QuYyAgICAgfCAgNjYgKysrKysrKy0tLS0t
Cj4gIGxpYi9zYmkvc2JpX3RyYXBfdl9sZHN0LmMgICB8IDIwMSArKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0KPiAgbGliL3NiaS9zYmlfdW5wcml2LmMgICAgICAgIHwgIDg4ICsr
KysrKysrKysrKysrLS0KPiAgNiBmaWxlcyBjaGFuZ2VkLCAyNzAgaW5zZXJ0aW9ucygrKSwgMTEw
IGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAyLjM0LjEKPgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0
Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
