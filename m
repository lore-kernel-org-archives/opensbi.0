Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14247CCF9F8
	for <opensbi@archiver.kernel.org>; Thu, 30 Oct 2025 08:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BVX600ImQejGlOKJ3zwYU+raMpIjSqvnKv1uMXSg240=; b=XB98vvHGp6bOTM
	mAz0y786fRNAHzUSlFuzbwLKPxvTnVR7xpzNXJwh4u/bWxw1h3JTdihpGVmmPpgHqcd1qgJflP4At
	lTHqjMF9QKzuqo5OB7ZELPHkcB+rLFgC8fy3yIdN6jmS9Om5LV0AZ+vZt2JmND+cI+GDLdkgJOLpf
	rEwg0UCJhsVChqhEhmtH4/ISAu2ZdWJAQOXlSZBHw+z0uCAKP+HDklo9AO345Tu3VuUXz6gJGg5Nd
	jBAvaXVnI+IyzQGRz/S2UW0A8HAWDxNrVlTfn3GeTNGIofRKAcL/oIz/CMHQWqbI2Yt9sDXsUNEWl
	p2h6MTndVU6DkXDLXbGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEONa-00000003ngW-06xP;
	Thu, 30 Oct 2025 08:51:34 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEONX-00000003nfr-25Yx
	for opensbi@lists.infradead.org;
	Thu, 30 Oct 2025 08:51:33 +0000
Message-ID: <a4030e75-a8d8-447d-a743-e66e5ad9242f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761814289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bsFXXAbW+Sn2JM7Lz6za7+sv6JzCHUu7V347lMyRTis=;
	b=TkXBxSglgkvG9EYwQz/j8e/wvPEnwjL23kY5SsR+JftnYB0y5eqEk0h+m0ZMqczxJuCIA7
	PSCTQpL72mX/MaOmnkFY73P7p7ti2HJqLiR3zkPAg2WHnyCiUA8c6hCvBAuDo4C6d1xmZm
	SnLRp+RNgaYlmg7BAGIw1D2sd2BYhLY=
Date: Thu, 30 Oct 2025 01:51:25 -0700
MIME-Version: 1.0
Subject: Re: [PATCH] lib: sbi: sse: add local unknown nmi event
To: dong wei <weidong.wd@bytedance.com>, opensbi@lists.infradead.org
Cc: cuiyunhui@bytedance.com, heshuan@bytedance.com,
 wangziang.ok@bytedance.com, anup@brainfault.org
References: <20251014055330.59506-1-weidong.wd@bytedance.com>
 <CAHLiX_G1m-9R--j3T0V5zdTmEkCUjaxRCn-cEk-2_ZSeLHA0ZQ@mail.gmail.com>
 <CAHLiX_GptyEw9BX8cCC9q-S6jy12gYFWYz8WdN1=w8yf-0BLZQ@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
Content-Language: en-US
In-Reply-To: <CAHLiX_GptyEw9BX8cCC9q-S6jy12gYFWYz8WdN1=w8yf-0BLZQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_015131_907144_837C877A 
X-CRM114-Status: GOOD (  16.04  )
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

T24gMTAvMzAvMjUgMToyMCBBTSwgZG9uZyB3ZWkgd3JvdGU6Cj4gTWF5IEkgYXNrIGlmIHRoZXJl
IGFyZSBhbnkgdXBkYXRlcyB0byB0aGUgY29tbWVudHMgb24gdGhpcyBwYXRjaD8gVGhlCj4gdW5r
bm93biBubWkgZXZlbnQgaGFzIHByYWN0aWNhbCBhcHBsaWNhdGlvbiBzY2VuYXJpb3MgZm9yIFJJ
U0MtVgo+IHNlcnZlcnMuCj4gCgpUaGUgY29ycmVzcG9uZGluZyBMaW51eCBrZXJuZWwgcGF0Y2hl
cyBkb2Vzbid0IG1hdGNoIHRoaXMuIFdlIG5lZWQgdG8gCmhhc2ggb3V0IHRoZSBldmVudCBJRHMg
YW5kIHRoZW4gZGVjaWRlIHRoZSBwcm9jZXNzIHRvIG1lcmdlIHRoaXMgdG8gU0JJIApzcGVjLgoK
SXQgc2hvdWxkIGJlIG9rYXkgdG8gbWVyZ2UgdGhpcyBpbiBPcGVuU0JJIGFzIGFuIGV4cGVyaW1l
bnRhbCBmZWF0dXJlIAphZnRlciB0aGF0LgoKCkRvIHlvdSBoYXZlIGEgUG9DIG9uIGhvdyB0aGlz
IGlzIGhvb2tlZCB1cCB0byBhIHBsYXRmb3JtIE5NSSBldmVudCA/Cgo+IE9uIFdlZCwgT2N0IDE1
LCAyMDI1IGF0IDEwOjE44oCvUE0gZG9uZyB3ZWkgPHdlaWRvbmcud2RAYnl0ZWRhbmNlLmNvbT4g
d3JvdGU6Cj4+Cj4+IEFkZCBtb3JlIHJldmlld2Vycy4KPj4KPj4gT24gVHVlLCBPY3QgMTQsIDIw
MjUgYXQgMTo1NOKAr1BNIHdlaWRvbmd3ZCA8d2VpZG9uZy53ZEBieXRlZGFuY2UuY29tPiB3cm90
ZToKPj4+Cj4+PiBBZGQgdGhlIGlkIG9mIGxvY2FsIHVua25vd24gbm1pIGV2ZW50IGFuZCBhZGQg
dGhpcyBldmVudCB0byB0aGUKPj4+IGxpc3Qgb2Ygc3VwcG9ydGVkIGV2ZW50cy4KPj4+Cj4+PiBT
aWduZWQtb2ZmLWJ5OiB3ZWlkb25nd2QgPHdlaWRvbmcud2RAYnl0ZWRhbmNlLmNvbT4KPj4+IC0t
LQo+Pj4gICBpbmNsdWRlL3NiaS9zYmlfZWNhbGxfaW50ZXJmYWNlLmggfCAzICsrLQo+Pj4gICBs
aWIvc2JpL3NiaV9zc2UuYyAgICAgICAgICAgICAgICAgfCA4ICsrKysrKystCj4+PiAgIDIgZmls
ZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL3NiaS9zYmlfZWNhbGxfaW50ZXJmYWNlLmggYi9pbmNsdWRlL3NiaS9z
YmlfZWNhbGxfaW50ZXJmYWNlLmgKPj4+IGluZGV4IGFmN2EwNWEuLjhiYjBkMzkgMTAwNjQ0Cj4+
PiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfZWNhbGxfaW50ZXJmYWNlLmgKPj4+ICsrKyBiL2luY2x1
ZGUvc2JpL3NiaV9lY2FsbF9pbnRlcmZhY2UuaAo+Pj4gQEAgLTQzNiw3ICs0MzYsOCBAQCBlbnVt
IHNiaV9zc2Vfc3RhdGUgewo+Pj4KPj4+ICAgLyogUmFuZ2UgMHhmZmZmMDAwMCAtIDB4ZmZmZmZm
ZmYgKi8KPj4+ICAgI2RlZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX1NPRlRXQVJFICAgICAgICAg
ICAweGZmZmYwMDAwCj4+PiAtI2RlZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX1JFU0VSVkVEXzNf
U1RBUlQgICAweGZmZmYwMDAxCj4+PiArI2RlZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX1VOS05P
V05fTk1JICAgICAgICAgICAgICAgIDB4ZmZmZjAwMDEKPj4+ICsjZGVmaW5lIFNCSV9TU0VfRVZF
TlRfTE9DQUxfUkVTRVJWRURfM19TVEFSVCAgIDB4ZmZmZjAwMDIKPj4+ICAgI2RlZmluZSBTQklf
U1NFX0VWRU5UX0xPQ0FMX1JFU0VSVkVEXzNfRU5EICAgICAweGZmZmYzZmZmCj4+PiAgICNkZWZp
bmUgU0JJX1NTRV9FVkVOVF9MT0NBTF9QTEFUXzNfU1RBUlQgICAgICAgMHhmZmZmNDAwMAo+Pj4g
ICAjZGVmaW5lIFNCSV9TU0VfRVZFTlRfTE9DQUxfUExBVF8zX0VORCAgICAgICAgIDB4ZmZmZjdm
ZmYKPj4+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9zc2UuYyBiL2xpYi9zYmkvc2JpX3NzZS5j
Cj4+PiBpbmRleCA5ODZiNzcwLi5lNzcxZWZlIDEwMDY0NAo+Pj4gLS0tIGEvbGliL3NiaS9zYmlf
c3NlLmMKPj4+ICsrKyBiL2xpYi9zYmkvc2JpX3NzZS5jCj4+PiBAQCAtMTgyLDkgKzE4MiwxNCBA
QCBzdHJ1Y3Qgc3NlX2V2ZW50X2luZm8gZ2xvYmFsX3NvZnR3YXJlX2V2ZW50ID0gewo+Pj4gICAg
ICAgICAgU0JJX1NMSVNUX05PREVfSU5JVChOVUxMKSwKPj4+ICAgfTsKPj4+Cj4+PiArc3RydWN0
IHNzZV9ldmVudF9pbmZvIGxvY2FsX3Vua25vd25fbm1pX2V2ZW50ID0gewo+Pj4gKyAgICAgICAu
ZXZlbnRfaWQgPSBTQklfU1NFX0VWRU5UX0xPQ0FMX1VOS05PV05fTk1JLAo+Pj4gKyAgICAgICBT
QklfU0xJU1RfTk9ERV9JTklUKCZnbG9iYWxfc29mdHdhcmVfZXZlbnQpLAo+Pj4gK307Cj4+PiAr
Cj4+PiAgIHN0cnVjdCBzc2VfZXZlbnRfaW5mbyBsb2NhbF9zb2Z0d2FyZV9ldmVudCA9IHsKPj4+
ICAgICAgICAgIC5ldmVudF9pZCA9IFNCSV9TU0VfRVZFTlRfTE9DQUxfU09GVFdBUkUsCj4+PiAt
ICAgICAgIFNCSV9TTElTVF9OT0RFX0lOSVQoJmdsb2JhbF9zb2Z0d2FyZV9ldmVudCksCj4+PiAr
ICAgICAgIFNCSV9TTElTVF9OT0RFX0lOSVQoJmxvY2FsX3Vua25vd25fbm1pX2V2ZW50KSwKPj4+
ICAgfTsKPj4+Cj4+PiAgIHN0YXRpYyBTQklfU0xJU1RfSEVBRChzdXBwb3J0ZWRfZXZlbnRzLCBz
c2VfZXZlbnRfaW5mbykgPQo+Pj4gQEAgLTIwMiw2ICsyMDcsNyBAQCBzdGF0aWMgY29uc3QgdWlu
dDMyX3Qgc3RhbmRhcmRfZXZlbnRzW10gPSB7Cj4+PiAgICAgICAgICBTQklfU1NFX0VWRU5UX0xP
Q0FMX0xPV19QUklPX1JBUywKPj4+ICAgICAgICAgIFNCSV9TU0VfRVZFTlRfR0xPQkFMX0xPV19Q
UklPX1JBUywKPj4+ICAgICAgICAgIFNCSV9TU0VfRVZFTlRfTE9DQUxfU09GVFdBUkUsCj4+PiAr
ICAgICAgIFNCSV9TU0VfRVZFTlRfTE9DQUxfVU5LTk9XTl9OTUksCj4+PiAgICAgICAgICBTQklf
U1NFX0VWRU5UX0dMT0JBTF9TT0ZUV0FSRSwKPj4+ICAgfTsKPj4+Cj4+PiAtLQo+Pj4gMi4yMC4x
Cj4+Pgo+IAoKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2Jp
Cg==
