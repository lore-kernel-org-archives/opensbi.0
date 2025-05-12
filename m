Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E3FC3ABBC
	for <opensbi@archiver.kernel.org>; Mon, 12 May 2025 07:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Date:In-Reply-To:References:From:
	Subject:Message-Id:Mime-Version:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3yoHrfq/b1uArYbl72qpffj2xZvSSzIb6TKaWve+DaU=; b=H2/BK2Mn5/H4dw
	p3AobjuLPn5sqMiL0G+aLHZhogYd370T8ntIlwZePvZOE4kTWNd1Vynoz4lvGTyEKmQ4AYWClYKY5
	5PMy3S5hB/KQfVRiN83OIE+hi5NRK1Qrt7XG3Zv2bwfk7q4o4E2nYqwzIPR+4Wda26L4NGK6SOFHR
	CJuzrdzPqn8r3CAiayJ+OewX6cSfLoKJpUHD4hDyQBlfR3VYcf3q0NfTgqN33p5w2Kiv7XZuhTIKM
	N3nbadyJ2qF+umwwgt8g03T671dNBo5ZddFUUunyimRFXliOFZipKJqZQbeUCzHCuGS8DvecQDf3K
	ca6Gewgix+4qW5J9EY0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uENcL-00000008cre-1wN0;
	Mon, 12 May 2025 07:30:29 +0000
Received: from sg-1-103.ptr.blmpb.com ([118.26.132.103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uENcE-00000008cqy-01Xr
	for opensbi@lists.infradead.org;
	Mon, 12 May 2025 07:30:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1747035008; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=VBjo0xYHuE8jnvgctGD9sgtIR5Uw4VhT8kIrxQ4dZvU=;
 b=EqR9aTb+AUmsYqeKLQAgGVs9r8pGMpeBe7sywZjh00N5r2w0r6N4ofJDLJxQEBIh/ilbyI
 JeOIQsQmguHoGzM8KzYULlkrI0oRzDI13rz694txjEbvGxUsCdkU4S4avKJYWL66W0cmzD
 RKsoCnHsRxwhi0ZRkr1xQFS7oIcJ5OlhfZP5MEVYRxSJW3YpiGwL5TStJmZI/eDU3+fpAX
 hKLued+EV2KAZL0/w+KH+LDqT7lx5Ez7F4Pip6CPIzALU5T5J0KCLY55bHmlwF17Di8fYf
 3bhcG2Z3zvLFsLlEdE+ktMpKe5JxkXUzJCN4Ly0Aer2rg4BxCWAjfYFIeq1DOw==
Mime-Version: 1.0
Message-Id: <a06ec789e9d7658f02b890ac037777d6604113be.fb0549c3.7405.4bb6.a560.39ac14d4a488@bytedance.com>
Subject: Re: [PATCH] lib: utils: hsm: Do not fail on EALREADY in rpmi-hsm fixup.
From: =?utf-8?q?=E7=8E=8B=E5=AD=90=E6=98=82?= <wangziang.ok@bytedance.com>
References: <20250507074620.3162747-1-wangziang.ok@bytedance.com>
In-Reply-To: <20250507074620.3162747-1-wangziang.ok@bytedance.com>
X-Lms-Return-Path: <lba+16821a37e+366d41+lists.infradead.org+wangziang.ok@bytedance.com>
Date: Mon, 12 May 2025 15:30:05 +0800
To: <opensbi@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_003022_220750_BB655EB6 
X-CRM114-Status: GOOD (  13.04  )
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

SGkgYWxsLApJIHdvdWxkIGxpa2UgdG8gaGVhciB5b3VyIGZlZWRiYWNrIG9uIHRoaXMuCgpJdCBp
cyBjb21tb24gdG8gaGF2ZSBoYXJ0c8KgZ3JvdXBlZCBieSBkaWZmZXJlbnQgbWFpbGJveGVzIG9u
IGEgbXVsdGktc29ja2V0IHN5c3RlbS4gVGhlIGN1cnJlbnQgSFNNIGltcGxlbWVudGF0aW9uIGNh
biBhY3R1YWxseSBzdWZmaWNlIHRoaXMgY2FzZSwgd2l0aCB0aGUgb25seSBtaW5vciBjaGFuZ2Ug
aW4gdGhpcyBwYXRjaC4gV2UgaGF2ZSB0ZXN0ZWQgaXQgb24gYm90aCBRRU1VIHZpcnQgbWFjaGlu
ZSBhbmQgb3VyIFJJU0MtViBwcm9qZWN0LgoKQmVzdCBSZWdhcmRzLApaaWFuZwoKPiBGcm9tOiAi
WmlhbmcgV2FuZyI8d2FuZ3ppYW5nLm9rQGJ5dGVkYW5jZS5jb20+Cj4gRGF0ZTrCoCBXZWQsIE1h
eSA3LCAyMDI1LCAxNTo0Ngo+IFN1YmplY3Q6wqAgW1BBVENIXSBsaWI6IHV0aWxzOiBoc206IERv
IG5vdCBmYWlsIG9uIEVBTFJFQURZIGluIHJwbWktaHNtIGZpeHVwLgo+IFRvOiA8b3BlbnNiaUBs
aXN0cy5pbmZyYWRlYWQub3JnPgo+IENjOiAiWmlhbmcgV2FuZyI8d2FuZ3ppYW5nLm9rQGJ5dGVk
YW5jZS5jb20+Cj4gSW4gY2FzZSBoYXJ0cyBhcmUgZGl2aWRlZCBpbnRvIGdyb3VwcyB0aGF0IHVz
ZSBkaWZmZXJlbnQKPiBycG1pLWhzbSBjaGFubmVscyBpbiBkaWZmZXJlbnQgbWFpbGJveGVzLCB0
aGUgc3VzcGVuZAo+IHN0YXRlIGZpeHVwIGZ1bmN0aW9uIHdpbGwgcmV0dXJuIEVBTFJFQURZIG9u
IHNlY29uZGFyeQo+IGVudHJ5LCBzaW1wbHkgc2tpcCBvbiB0aGlzIGVycm9yLgo+wqAKPiBTaWdu
ZWQtb2ZmLWJ5OiBaaWFuZyBXYW5nIDx3YW5nemlhbmcub2tAYnl0ZWRhbmNlLmNvbT4KPiAtLS0K
PiDCoGxpYi91dGlscy9oc20vZmR0X2hzbV9ycG1pLmMgfCAyICstCj4gwqAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPsKgCj4gZGlmZiAtLWdpdCBhL2xpYi91
dGlscy9oc20vZmR0X2hzbV9ycG1pLmMgYi9saWIvdXRpbHMvaHNtL2ZkdF9oc21fcnBtaS5jCj4g
aW5kZXggY2M3ODQzNi4uMDlkMGM5MSAxMDA2NDQKPiAtLS0gYS9saWIvdXRpbHMvaHNtL2ZkdF9o
c21fcnBtaS5jCj4gKysrIGIvbGliL3V0aWxzL2hzbS9mZHRfaHNtX3JwbWkuYwo+IEBAIC0zMzAs
NyArMzMwLDcgQEAgc2tpcF9zdXNwZW5kX3N0YXRlczoKPiDCoAo+IMKgIMKgIMKgIMKgIMKgLyog
UmVnaXN0ZXIgSFNNIGZpeHVwIGNhbGxiYWNrICovCj4gwqAgwqAgwqAgwqAgwqByYyA9IGZkdF9y
ZWdpc3Rlcl9nZW5lcmFsX2ZpeHVwKCZycG1pX2hzbV9maXh1cCk7Cj4gLSDCoCDCoCDCoCDCoGlm
IChyYykKPiArIMKgIMKgIMKgIMKgaWYgKHJjICYmIHJjICE9IFNCSV9FQUxSRUFEWSkKPiDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdvdG8gZmFpbF9mcmVlX3N1c3Bfc3RhdGVfbmFtZXM7Cj4g
wqAKPiDCoCDCoCDCoCDCoCDCoC8qIFJlZ2lzdGVyIEhTTSBkZXZpY2UgKi8KPiAtLcKgCj4gMi4z
OS41Cj7CoAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
