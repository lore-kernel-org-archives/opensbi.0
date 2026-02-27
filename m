Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60266FD9E26
	for <opensbi@archiver.kernel.org>; Fri, 27 Feb 2026 01:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/6++IyvYEO/Lhy7aHDONdRM+RMZg6ZcROT3v3B9f+jk=; b=ZcNBtiTPQW+e3U
	FGF1PdP8xfellKerEQbTn2+wDJ98+je8+zttDOuZ+j6yX6T0IwR4N5qQZLIk7Huzex5+/3+F/A8pZ
	jJQ1tnjbzrD8pnJsMcLzsIA5CW520WmUDz363A+/kknRJ2uxpAJ3wxHM2KkMrM8q9L7TTG8j+2+y2
	FwUyJnD5A38QeiJll9GEIDxH0yQ/fNwFNpFm1KmG3vBdt3tU3JAvUO7MSQTz8AaRRiFD9m7B7+/nt
	GgVuQ2GlnHRsBt3KzOfEGyFbvxYdhZCVixaS9Ea8Z3IY3LMEIAt8ggyx2S55/DchpuCgVZP4LrKAR
	91Pvbv074pBUGlll6riA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvmXq-00000007TwY-2xGF;
	Fri, 27 Feb 2026 01:21:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvmXp-00000007TwL-01IG
	for opensbi@lists.infradead.org;
	Fri, 27 Feb 2026 01:21:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FC4860008
	for <opensbi@lists.infradead.org>; Fri, 27 Feb 2026 01:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D994BC19423
	for <opensbi@lists.infradead.org>; Fri, 27 Feb 2026 01:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772155287;
	bh=1Zp9KN+AvXamLbucBxG14zoRc8LFTrZgtG60YtaJ34M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hiM6H6NwTMYNLqEcOCOJApc1cK5be9/U3oV76AsEWcfjDEac9vobs3lz28StMEV6q
	 JkLg/9kXmSO6x5J0j5qiD4i1epLtI7IB8NfLE3QwoyEaGnS4rWHlVt35eemi1HW3Yh
	 +SaX9xGVR156+whmuXCd8cKK/RKeiHclaohOmn8nVs8W5xFx7NbVVfpMzkjRPj520O
	 IGPj7GmoBrj6r1S43iAtVav2dRNDOPsJPtYk6mnu3U9Hu4B6LnPYTNtx64u0r4za2M
	 e/ZRkwUIJoH0TXSIlzP3Y2yyMrRt8Z4g+k8NRSu8dt7N5yslgQYhdOdUVkJtP/Exkp
	 ZekLYFjsor2kA==
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4377174e1ebso987465f8f.3
        for <opensbi@lists.infradead.org>; Thu, 26 Feb 2026 17:21:27 -0800 (PST)
X-Gm-Message-State: AOJu0Yyyhj0Ue5Gh1cxFTTDnaRBz8+A+D2Lp1CJkxtaurXTc/jBWumCu
	II/eMlwSV+/H+c9or7C+dLkTiB9ot3qvApuobNdS29bSNE+nmpZO36JsvYvmNz7ba5GKSReEl1Q
	8oA9kcf0Lh/NRwvbbRoIjzPSuE+xJyWM=
X-Received: by 2002:a5d:5f47:0:b0:437:895d:2026 with SMTP id
 ffacd0b85a97d-4399de2b9b7mr1498542f8f.38.1772155286389; Thu, 26 Feb 2026
 17:21:26 -0800 (PST)
MIME-Version: 1.0
References: <20260226123408.1597-1-cp0613@linux.alibaba.com> <20260226123408.1597-3-cp0613@linux.alibaba.com>
In-Reply-To: <20260226123408.1597-3-cp0613@linux.alibaba.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 27 Feb 2026 09:21:14 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRKVrSwmPdXR3h2Q67PSBLGEq3bWBeRQtkn67twvXfHFg@mail.gmail.com>
X-Gm-Features: AaiRm53lT8VgS5HTBIO5aPmTctceUS2TLbRtHkxHXinKaRgMGxtW-SQ5V-Lyi0U
Message-ID: <CAJF2gTRKVrSwmPdXR3h2Q67PSBLGEq3bWBeRQtkn67twvXfHFg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] lib: sbi: Flush cache entries after writing PMP CSRs
To: cp0613@linux.alibaba.com
Cc: opensbi@lists.infradead.org, anup@brainfault.org, 
	samuel.holland@sifive.com
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

T24gVGh1LCBGZWIgMjYsIDIwMjYgYXQgODozNOKAr1BNIDxjcDA2MTNAbGludXguYWxpYmFiYS5j
b20+IHdyb3RlOgo+Cj4gRnJvbTogQ2hlbiBQZWkgPGNwMDYxM0BsaW51eC5hbGliYWJhLmNvbT4K
Pgo+IEFzIHRoZSBwcml2aWxlZ2VkIHNwZWNpZmljYXRpb24gc3RhdGVzLCBhZnRlciB3cml0aW5n
IHRvIHRoZSBQTVAgQ1NScywKPiBhIFNGRU5DRS5WTUEgb3IgSEZFTkNFLkdWTUEgaW5zdHJ1Y3Rp
b24gc2hvdWxkIGJlIGV4ZWN1dGVkIHdpdGggcnMxPXgwCj4gYW5kIHJzMj14MCB0byBmbHVzaCBh
bGwgYWRkcmVzcyB0cmFuc2xhdGlvbiBjYWNoZSBlbnRyaWVzLgo+Cj4gQ29uc2lkZXJpbmcgdGhl
IHBlcmZvcm1hbmNlIGlzc3VlcyBjYXVzZWQgYnkgZmx1c2hpbmcgYWxsIGFkZHJlc3MKPiB0cmFu
c2xhdGlvbiBjYWNoZSBlbnRyaWVzLCBzYmlfaGFydF9wbXBfZmVuY2Vfdm1hIGlzIHVzZWQuCkl0
J3Mgbm90IGFsaWduZWQgd2l0aCB0aGUgc3BlYyBkZXNjcmlwdGlvbjsgUE1QIGlzIGFib3V0IFBB
LCBidXQKU0ZFTkNFLiBWTUEgaXMgYWJvdXQgdGhlIFZBLiBTbyB3ZSBkb24ndCBrbm93IHdoZXRo
ZXIgdGhlIG90aGVyIFZBcwpoYXMgbWFwcGVkIHRvIHRoZSBQQSB0aGF0IHRoZSBwbXAgaXMgcmVs
YXRlZCB0by4KClRoYXQncyB3aHkgc3BlYyBuZWVkcyAicnMxPXgwIGFuZCByczI9eDAgdG8gZmx1
c2ggYWxsIGFkZHJlc3MKdHJhbnNsYXRpb24gY2FjaGUgZW50cmllcy4iCgo+Cj4gU2lnbmVkLW9m
Zi1ieTogQ2hlbiBQZWkgPGNwMDYxM0BsaW51eC5hbGliYWJhLmNvbT4KPiAtLS0KPiAgbGliL3Ni
aS9zYmlfaGFydF9wbXAuYyB8IDExICsrKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlf
aGFydF9wbXAuYyBiL2xpYi9zYmkvc2JpX2hhcnRfcG1wLmMKPiBpbmRleCA4MDQwNzExMC4uZGM3
ZjYxZmIgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfaGFydF9wbXAuYwo+ICsrKyBiL2xpYi9z
Ymkvc2JpX2hhcnRfcG1wLmMKPiBAQCAtMjcwLDE0ICsyNzAsMjEgQEAgc3RhdGljIGludCBzYmlf
aGFydF9zbWVwbXBfbWFwX3JhbmdlKHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCwKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBtcF9mbGFncywgYmFzZSwgb3JkZXIpOwo+ICAgICAg
ICAgcG1wX3NldChTQklfU01FUE1QX1JFU1ZfRU5UUlksIHBtcF9mbGFncywgYmFzZSwgb3JkZXIp
Owo+Cj4gKyAgICAgICBzYmlfaGFydF9wbXBfZmVuY2Vfdm1hKGFkZHIsIHNpemUpOwo+ICsKPiAg
ICAgICAgIHJldHVybiBTQklfT0s7Cj4gIH0KPgo+ICBzdGF0aWMgaW50IHNiaV9oYXJ0X3NtZXBt
cF91bm1hcF9yYW5nZShzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBs
b25nIHNpemUpCj4gIHsKPiArICAgICAgIGludCByZXQ7Cj4gKwo+ICAgICAgICAgc2JpX3BsYXRm
b3JtX3BtcF9kaXNhYmxlKHNiaV9wbGF0Zm9ybV9wdHIoc2NyYXRjaCksIFNCSV9TTUVQTVBfUkVT
Vl9FTlRSWSk7Cj4gLSAgICAgICByZXR1cm4gcG1wX2Rpc2FibGUoU0JJX1NNRVBNUF9SRVNWX0VO
VFJZKTsKPiArICAgICAgIHJldCA9IHBtcF9kaXNhYmxlKFNCSV9TTUVQTVBfUkVTVl9FTlRSWSk7
Cj4gKyAgICAgICBzYmlfaGFydF9wbXBfZmVuY2Vfdm1hKGFkZHIsIHNpemUpOwo+ICsKPiArICAg
ICAgIHJldHVybiByZXQ7Cj4gIH0KPgo+ICBzdGF0aWMgaW50IHNiaV9oYXJ0X29sZHBtcF9jb25m
aWd1cmUoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoKQo+IEBAIC0zMzMsNiArMzQwLDggQEAg
c3RhdGljIHZvaWQgc2JpX2hhcnRfcG1wX3VuY29uZmlndXJlKHN0cnVjdCBzYmlfc2NyYXRjaCAq
c2NyYXRjaCkKPiAgICAgICAgICAgICAgICAgc2JpX3BsYXRmb3JtX3BtcF9kaXNhYmxlKHNiaV9w
bGF0Zm9ybV9wdHIoc2NyYXRjaCksIGkpOwo+ICAgICAgICAgICAgICAgICBwbXBfZGlzYWJsZShp
KTsKPiAgICAgICAgIH0KPiArCj4gKyAgICAgICBzYmlfaGFydF9wbXBfZmVuY2VfYWxsKCk7Cj4g
IH0KPgo+ICBzdGF0aWMgc3RydWN0IHNiaV9oYXJ0X3Byb3RlY3Rpb24gcG1wX3Byb3RlY3Rpb24g
PSB7Cj4gLS0KPiAyLjUwLjEKPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCi0tIApvcGVu
c2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
