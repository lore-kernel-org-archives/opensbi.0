Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8720CC3ABC3
	for <opensbi@archiver.kernel.org>; Tue, 13 May 2025 12:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:From:In-Reply-To:
	Mime-Version:Subject:To:Message-Id:Date:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7tceTi1a/y8kLXeBcxZaTL5UJ0W+3ggKCFnB44Ul/xk=; b=NXDknCs4smqVEhNh3ARwXZfNWz
	dqukRKusT6oqQ1U0/HiY495LaHq3iqIf6l3lKyOZOmrlYlJ2NQD0GK66TmjBTHrJJ+0holFfq1TCg
	EaoqXWVEJ5ye2HB4UHeb2kqmCpAJ/uJoMATzREKMuiZp9++vy0HkxOZ7cstJ75k9xXI131jYA20YR
	duK+v/lsK/e6npAhBbhlks4wVSR4vFKNHZT8ppUK/GVZxbj05Uo6vBrFGwq3u6O4pJfB19M/JSYek
	LhrhhXz14R46bengH45tWhYIFwRhdW/NpsR5iRGK2QhOxirr7m8zeAR2tFT6c80oOg5vTPcm0CgaF
	rqXzNaxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEotN-0000000CNXy-18Wu;
	Tue, 13 May 2025 12:37:53 +0000
Received: from sg-1-104.ptr.blmpb.com ([118.26.132.104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEot1-0000000CNT4-0gEB
	for opensbi@lists.infradead.org;
	Tue, 13 May 2025 12:37:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1747139840; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=55Ty3t7mFAIrlfR6cI068Nd6hyo7MDlPIAOXaXvn1iE=;
 b=hb3zNgAbpDguQjYhQlKU0xcf2q2pm78OjZ4ad0gNwR35Sc6+3AyChaH3r/HfrhEbFYtXJP
 0jx6wGvl/Dxnc3Y3GOkoVnEM0Ro+5HkZpV0x+mRS+GLT4zL6rJSjQ41FyQ85+bl9RUz3gJ
 wCqPeXV0wQCol969r9wrAttEac9d5Oo9t9VBCVnwkVSAn47A3fPA0XmcHWGJT1qS6Sk9i+
 WG/b2a6I/8aHqmtC1UYaWY7zZWmcJ5+oB8Bbgpa36DdT3+fc0TVQ/dXnMcUe5ys1SfSwjP
 0DXF6ikrOOIV55YSHlN4D6aC1O96MrzdVTGSoLRHLNhF+ouuzyDYRB9FjgYndQ==
Date: Tue, 13 May 2025 20:37:17 +0800
Message-Id: <a06ec789e9d7658f02b890ac037777d6604113be.ec4608d7.cac6.46f1.81bf.7a1202218be0@bytedance.com>
To: <opensbi@lists.infradead.org>
Subject: Re: [PATCH] lib: utils: hsm: Do not fail on EALREADY in rpmi-hsm fixup.
Mime-Version: 1.0
In-Reply-To: <a06ec789e9d7658f02b890ac037777d6604113be.fb0549c3.7405.4bb6.a560.39ac14d4a488@bytedance.com>
From: "Ziang Wang" <wangziang.ok@bytedance.com>
X-Lms-Return-Path: <lba+168233cfe+336f65+lists.infradead.org+wangziang.ok@bytedance.com>
References: <20250507074620.3162747-1-wangziang.ok@bytedance.com>
	<a06ec789e9d7658f02b890ac037777d6604113be.fb0549c3.7405.4bb6.a560.39ac14d4a488@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_053731_561356_43762651 
X-CRM114-Status: GOOD (  16.86  )
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

T2ggSSB0aGluayBpdCdzIGJldHRlciB0byBpbnRyb2R1Y2UgbXlzZWxmIGZpcnN0IDpECk5pY2Ug
dG8gbWVldCB5b3UgZm9sa3MhIHRoaXMgaXMgWmlhbmcuIEknbSBhbiBlbmdpbmVlciBmcm9tIEJ5
dGVkYW5jZSBMdGQsIGN1cnJlbnRseSBiYXNlZCBpbiBTaGFuZ2hhaSwgQ2hpbmEuIFdlJ3ZlIGJl
ZW4gY29uc3RhbnRseSBpbnRlcmVzdGVkIGluIHRoZSBhcHBsaWNhdGlvbiBvZiBSSVNDLVYgaW4g
c2VydmVyIGFyZWEsIHBsdXMgdGhlIGNvbWJpbmF0aW9uIG9mIE9wZW5TQkkgYW5kIGNvcmVib290
L0xpbnV4Ym9vdCBhcyB0aGUgZmlybXdhcmUgc29sdXRpb24uIFdlIGFyZSBlYWdlciB0byBjb250
cmlidXRlLCBhbmQgYXJlIHJlY2VudGx5IGV4cGVyaW1lbnRpbmcgUlBNSSBvbiBvdXIgbG9jYWwg
UklTQy1WIHByb2plY3QsIGdvdCBzb21lIGZpbmRpbmcsIGhlbmNlIGNvbWUgdGhpcyB0aW55IHBh
dGNoLiBIb3BlIG15IGFicnVwdG5lc3MgZGlkbid0IGZyZWFrIHlvdSBvdXQgOiksIGFuZCB0aGlz
IGNvdWxkIGJlIHRoZSBzdGFydGluZyBwb2ludCBvZiBvdXIgY29udHJpYnV0aW9uLgoKVGhhbmtz
IQoKQmVzdCBSZWdhcmRzLApaaWFuZwo+IEZyb206ICLnjovlrZDmmIIiPHdhbmd6aWFuZy5va0Bi
eXRlZGFuY2UuY29tPgo+IERhdGU6wqAgTW9uLCBNYXkgMTIsIDIwMjUsIDE1OjMwCj4gU3ViamVj
dDrCoCBSZTogW1BBVENIXSBsaWI6IHV0aWxzOiBoc206IERvIG5vdCBmYWlsIG9uIEVBTFJFQURZ
IGluIHJwbWktaHNtIGZpeHVwLgo+IFRvOiA8b3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnPgo+
IEhpIGFsbCwKPiBJIHdvdWxkIGxpa2UgdG8gaGVhciB5b3VyIGZlZWRiYWNrIG9uIHRoaXMuCj7C
oAo+IEl0IGlzIGNvbW1vbiB0byBoYXZlIGhhcnRzwqBncm91cGVkIGJ5IGRpZmZlcmVudCBtYWls
Ym94ZXMgb24gYSBtdWx0aS1zb2NrZXQgc3lzdGVtLiBUaGUgY3VycmVudCBIU00gaW1wbGVtZW50
YXRpb24gY2FuIGFjdHVhbGx5IHN1ZmZpY2UgdGhpcyBjYXNlLCB3aXRoIHRoZSBvbmx5IG1pbm9y
IGNoYW5nZSBpbiB0aGlzIHBhdGNoLiBXZSBoYXZlIHRlc3RlZCBpdCBvbiBib3RoIFFFTVUgdmly
dCBtYWNoaW5lIGFuZCBvdXIgUklTQy1WIHByb2plY3QuCj7CoAo+IEJlc3QgUmVnYXJkcywKPiBa
aWFuZwo+wqAKPiA+IEZyb206ICJaaWFuZyBXYW5nIjx3YW5nemlhbmcub2tAYnl0ZWRhbmNlLmNv
bT4KPiA+IERhdGU6wqAgV2VkLCBNYXkgNywgMjAyNSwgMTU6NDYKPiA+IFN1YmplY3Q6wqAgW1BB
VENIXSBsaWI6IHV0aWxzOiBoc206IERvIG5vdCBmYWlsIG9uIEVBTFJFQURZIGluIHJwbWktaHNt
IGZpeHVwLgo+ID4gVG86IDxvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmc+Cj4gPiBDYzogIlpp
YW5nIFdhbmciPHdhbmd6aWFuZy5va0BieXRlZGFuY2UuY29tPgo+ID4gSW4gY2FzZSBoYXJ0cyBh
cmUgZGl2aWRlZCBpbnRvIGdyb3VwcyB0aGF0IHVzZSBkaWZmZXJlbnQKPiA+IHJwbWktaHNtIGNo
YW5uZWxzIGluIGRpZmZlcmVudCBtYWlsYm94ZXMsIHRoZSBzdXNwZW5kCj4gPiBzdGF0ZSBmaXh1
cCBmdW5jdGlvbiB3aWxsIHJldHVybiBFQUxSRUFEWSBvbiBzZWNvbmRhcnkKPiA+IGVudHJ5LCBz
aW1wbHkgc2tpcCBvbiB0aGlzIGVycm9yLgo+ID7CoAo+ID4gU2lnbmVkLW9mZi1ieTogWmlhbmcg
V2FuZyA8d2FuZ3ppYW5nLm9rQGJ5dGVkYW5jZS5jb20+Cj4gPiAtLS0KPiA+IMKgbGliL3V0aWxz
L2hzbS9mZHRfaHNtX3JwbWkuYyB8IDIgKy0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPsKgCj4gPiBkaWZmIC0tZ2l0IGEvbGliL3V0aWxzL2hz
bS9mZHRfaHNtX3JwbWkuYyBiL2xpYi91dGlscy9oc20vZmR0X2hzbV9ycG1pLmMKPiA+IGluZGV4
IGNjNzg0MzYuLjA5ZDBjOTEgMTAwNjQ0Cj4gPiAtLS0gYS9saWIvdXRpbHMvaHNtL2ZkdF9oc21f
cnBtaS5jCj4gPiArKysgYi9saWIvdXRpbHMvaHNtL2ZkdF9oc21fcnBtaS5jCj4gPiBAQCAtMzMw
LDcgKzMzMCw3IEBAIHNraXBfc3VzcGVuZF9zdGF0ZXM6Cj4gPiDCoAo+ID4gwqAgwqAgwqAgwqAg
wqAvKiBSZWdpc3RlciBIU00gZml4dXAgY2FsbGJhY2sgKi8KPiA+IMKgIMKgIMKgIMKgIMKgcmMg
PSBmZHRfcmVnaXN0ZXJfZ2VuZXJhbF9maXh1cCgmcnBtaV9oc21fZml4dXApOwo+ID4gLSDCoCDC
oCDCoCDCoGlmIChyYykKPiA+ICsgwqAgwqAgwqAgwqBpZiAocmMgJiYgcmMgIT0gU0JJX0VBTFJF
QURZKQo+ID4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBnb3RvIGZhaWxfZnJlZV9zdXNwX3N0
YXRlX25hbWVzOwo+ID4gwqAKPiA+IMKgIMKgIMKgIMKgIMKgLyogUmVnaXN0ZXIgSFNNIGRldmlj
ZSAqLwo+ID4gLS3CoAo+ID4gMi4zOS41Cj4gPsKgCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QK
b3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
