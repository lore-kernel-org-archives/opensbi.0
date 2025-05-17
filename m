Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF26C3ABD8
	for <opensbi@archiver.kernel.org>; Sat, 17 May 2025 00:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M/v0hGNS4Ah8U3fO1X+/7Ltj/1mGfXERMX0lxy4RzG4=; b=afea4aTqmAsLF5
	5YpbPqmIoOKllRfjNDSWNGWFz1rkV4CPMR+csf0u6Ow9uG7lNTEGfHxgMYTvi4CKcgsI9qnzQpZg4
	3UybIQAz0jZTDHEJVp2pDruz2bM4HAnq5/so6A1yPbXdpMZlkN280g0thLH3ALiiImd1ogyv59w2x
	2tWsGIv0cTYELxoBr9Z10c1wLcU6wdMgFLC2hHGZE/lFvqsP7QBuQUUTGF9SQFIJntNhvPmkopa/a
	vR86IubMfx31rDQ5SeNCNJCv2o4+WOj48zYFhCVJw0ZBROCpCJysMVfKID4uUcIHGvcTa6kY2Bq3W
	qqW+4TaDNrGXijY6lAwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG51A-00000004tqm-0ioW;
	Sat, 17 May 2025 00:03:08 +0000
Received: from out-184.mta0.migadu.com ([2001:41d0:1004:224b::b8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG516-00000004tpx-2Kbc
	for opensbi@lists.infradead.org;
	Sat, 17 May 2025 00:03:06 +0000
Message-ID: <3522d188-0bd8-4fc6-abb4-fc3c54eb855a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747440181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mkA8j8KVJ4Pj/XFOH+s7mGHv8EEnPCx11w/jiYrdwsc=;
	b=qCxn09oaZd+mfnftwIcM1gWVihAuZ66yW+cBiMwZwXqEu3skpNZNFLpMT1cFT21HuKWZHi
	S96q3NjF1aG7k/WVZ010F/55SxMvHvGKPdmE33vsq2peftwfAUkaL6vL/wVcNfRcDMudY0
	GQHnOQ/W/4q1Xgp9XkrXCUrfiYPrsek=
Date: Fri, 16 May 2025 17:02:50 -0700
MIME-Version: 1.0
Subject: Re: [PATCH] lib: sbi: pmu: Rework SSE callbacks
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 opensbi@lists.infradead.org
Cc: Anup Patel <apatel@ventanamicro.com>
References: <20250516152107.556643-1-cleger@rivosinc.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250516152107.556643-1-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_170304_736584_5B4C81C8 
X-CRM114-Status: GOOD (  13.93  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

T24gNS8xNi8yNSA4OjIxIEFNLCBDbMODwqltZW50IEzDg8KpZ2VyIHdyb3RlOgo+IFRoZSBTLW1v
ZGUgUE1VIGRyaXZlciBtaWdodCBuZWVkIHRvIGVuYWJsZS9kaXNhYmxlIFNTRSBldmVudCByZWd1
bGFybHkKPiBpbiBvcmRlciB0byBtYXNrIFNTRSBldmVudHMuVGhpcyBjb21taXRzIHJld29ya3Mg
dGhlIFBNVSBTU0UgY2FsbGJhY2suCj4gU1NFIHJlZ2lzdGVyL3VucmVnaXN0ZXIgbm93IGp1c3Qg
c2V0cyB0aGUgTUlERUxFRyByZWdpc3RlciBhbmQKPiBlbmFibGUvZGlzYWJsZSBub3cgc2V0L2Ns
ZWFyIE1JRS4gTUlQIGNsZWFyaW5nIGlzIGFsc28gcmVtb3ZlZCBmcm9tCj4gcG11X3NzZV9lbmFi
bGUoKSBzaW5jZSBpdCBjb3VsZCBsZWFkIHRvIGxvc2luZyBwZW5kaW5nIGludGVycnVwdHMuCj4g
CgpUaGUgY2hhbmdlcyBsb29rcyBnb29kLiBIb3dldmVyLCBjYW4geW91IHBsZWFzZSBzcGxpdCBp
bnRvIHR3byBjb21taXRzID8gCk9uZSBmb3IgcmVnaXN0ZXIvdW5yZWdpc3RlciBwYXJ0IGFuZCBh
bm90aGVyIGZvciBNSVAgY2hhbmdlID8KClRoZSBNSVAgY2xlYXJpbmcgcGFydCBpcyBhIGNyaXRp
Y2FsIGNoYW5nZSBmb3IgYW55IGZ1dHVyZSBTU0UgZXZlbnQgCnNpbWlsYXIgdG8gTENPRklQLiBU
aHVzLCBJIHdvdWxkIHByZWZlciB0aGUgaGlzdG9yeSBwcmVzZXJ2ZXMgd2h5IE1JUCAKd2FzIHJl
bW92ZWQgZXhwbGljaXRseS4KCgo+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xl
Z2VyQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgIGxpYi9zYmkvc2JpX3BtdS5jIHwgMjkgKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25z
KCspLCAxMCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfcG11LmMg
Yi9saWIvc2JpL3NiaV9wbXUuYwo+IGluZGV4IDU5ODNhNzg0Li40NmMwZTBmYiAxMDA2NDQKPiAt
LS0gYS9saWIvc2JpL3NiaV9wbXUuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX3BtdS5jCj4gQEAgLTEw
OTcsMjQgKzEwOTcsMTUgQEAgdm9pZCBzYmlfcG11X2V4aXQoc3RydWN0IHNiaV9zY3JhdGNoICpz
Y3JhdGNoKQo+ICAgCj4gICBzdGF0aWMgdm9pZCBwbXVfc3NlX2VuYWJsZSh1aW50MzJfdCBldmVu
dF9pZCkKPiAgIHsKPiAtCXN0cnVjdCBzYmlfcG11X2hhcnRfc3RhdGUgKnBocyA9IHBtdV90aGlz
aGFydF9zdGF0ZV9wdHIoKTsKPiAtCXVuc2lnbmVkIGxvbmcgaXJxX21hc2sgPSBzYmlfcG11X2ly
cV9tYXNrKCk7Cj4gLQo+IC0JcGhzLT5zc2VfZW5hYmxlZCA9IHRydWU7Cj4gLQljc3JfY2xlYXIo
Q1NSX01JREVMRUcsIGlycV9tYXNrKTsKPiAtCWNzcl9jbGVhcihDU1JfTUlQLCBpcnFfbWFzayk7
Cj4gLQljc3Jfc2V0KENTUl9NSUUsIGlycV9tYXNrKTsKPiArCWNzcl9zZXQoQ1NSX01JRSwgc2Jp
X3BtdV9pcnFfbWFzaygpKTsKPiAgIH0KPiAgIAo+ICAgc3RhdGljIHZvaWQgcG11X3NzZV9kaXNh
YmxlKHVpbnQzMl90IGV2ZW50X2lkKQo+ICAgewo+IC0Jc3RydWN0IHNiaV9wbXVfaGFydF9zdGF0
ZSAqcGhzID0gcG11X3RoaXNoYXJ0X3N0YXRlX3B0cigpOwo+ICAgCXVuc2lnbmVkIGxvbmcgaXJx
X21hc2sgPSBzYmlfcG11X2lycV9tYXNrKCk7Cj4gICAKPiAgIAljc3JfY2xlYXIoQ1NSX01JRSwg
aXJxX21hc2spOwo+ICAgCWNzcl9jbGVhcihDU1JfTUlQLCBpcnFfbWFzayk7Cj4gLQljc3Jfc2V0
KENTUl9NSURFTEVHLCBpcnFfbWFzayk7Cj4gLQlwaHMtPnNzZV9lbmFibGVkID0gZmFsc2U7Cj4g
ICB9Cj4gICAKPiAgIHN0YXRpYyB2b2lkIHBtdV9zc2VfY29tcGxldGUodWludDMyX3QgZXZlbnRf
aWQpCj4gQEAgLTExMjIsNyArMTExMywyNSBAQCBzdGF0aWMgdm9pZCBwbXVfc3NlX2NvbXBsZXRl
KHVpbnQzMl90IGV2ZW50X2lkKQo+ICAgCWNzcl9zZXQoQ1NSX01JRSwgc2JpX3BtdV9pcnFfbWFz
aygpKTsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgdm9pZCBwbXVfc3NlX3JlZ2lzdGVyKHVpbnQzMl90
IGV2ZW50X2lkKQo+ICt7Cj4gKwlzdHJ1Y3Qgc2JpX3BtdV9oYXJ0X3N0YXRlICpwaHMgPSBwbXVf
dGhpc2hhcnRfc3RhdGVfcHRyKCk7Cj4gKwo+ICsJcGhzLT5zc2VfZW5hYmxlZCA9IHRydWU7Cj4g
Kwljc3JfY2xlYXIoQ1NSX01JREVMRUcsIHNiaV9wbXVfaXJxX21hc2soKSk7Cj4gK30KPiArCj4g
K3N0YXRpYyB2b2lkIHBtdV9zc2VfdW5yZWdpc3Rlcih1aW50MzJfdCBldmVudF9pZCkKPiArewo+
ICsJc3RydWN0IHNiaV9wbXVfaGFydF9zdGF0ZSAqcGhzID0gcG11X3RoaXNoYXJ0X3N0YXRlX3B0
cigpOwo+ICsKPiArCXBocy0+c3NlX2VuYWJsZWQgPSBmYWxzZTsKPiArCWNzcl9zZXQoQ1NSX01J
REVMRUcsIHNiaV9wbXVfaXJxX21hc2soKSk7Cj4gK30KPiArCj4gICBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHNiaV9zc2VfY2Jfb3BzIHBtdV9zc2VfY2Jfb3BzID0gewo+ICsJLnJlZ2lzdGVyX2NiID0g
cG11X3NzZV9yZWdpc3RlciwKPiArCS51bnJlZ2lzdGVyX2NiID0gcG11X3NzZV91bnJlZ2lzdGVy
LAo+ICAgCS5lbmFibGVfY2IgPSBwbXVfc3NlX2VuYWJsZSwKPiAgIAkuZGlzYWJsZV9jYiA9IHBt
dV9zc2VfZGlzYWJsZSwKPiAgIAkuY29tcGxldGVfY2IgPSBwbXVfc3NlX2NvbXBsZXRlLAoKCi0t
IApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
