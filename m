Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198CECD98E4
	for <opensbi@archiver.kernel.org>; Thu, 18 Jun 2026 00:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7VrBYViWv2d3g6TCo3yBMRESb28+/CuYbblVLhYYCwI=; b=uPLVOAWwsNoFD/
	f6Z4FfwJAnHVjfCCqwh758kd4cP9lJzfWjAoOsI+xQS4Zw5KdsVp129led+KK95N8X3VXv44Kr06t
	NVA1JRR5/pI8Z0O/hjcwn43C5FL1ZX0l4BCxWwEGXQ/RGLKb5KXTBTWofxmGPsbEgAbvj6s1gHMOJ
	u3oGZfKzCfjNQUggSj1Vrfu41DtRhxBTJmNT2Nt5bpHMTlqreG/mYEmp3bdbB2CO0Bj4xz+OxVHnR
	xiRgtKM6PgHx+l9ZULYppHZqtom0cEe0SLSTzjrOiLnlTmoudoI9VwpYdCCamCRhRAwcteJHGOPq9
	st0vVTgmOIDPx83qsZJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa0sD-00000000SPB-1K3f;
	Thu, 18 Jun 2026 00:44:49 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa0s9-00000000SOl-3mWh
	for opensbi@lists.infradead.org;
	Thu, 18 Jun 2026 00:44:48 +0000
Received: from [127.0.0.1] (unknown [122.194.100.2])
	by APP-05 (Coremail) with SMTP id zQCowABn8QR4PzNqMP37Ew--.12429S2;
	Thu, 18 Jun 2026 08:44:40 +0800 (CST)
Message-ID: <dc67affd9ea73f0f2a304af1df3965c9784d348e.camel@iscas.ac.cn>
Subject: Re: [PATCH v2] lib: sbi: Allow platforms to override local TLB
 operations
From: Xiang W <wangxiang@iscas.ac.cn>
To: Samuel Holland <samuel.holland@sifive.com>, opensbi@lists.infradead.org
Cc: anup@brainfault.org, inochiama@gmail.com, Han Gao <gaohan@iscas.ac.cn>
Date: Thu, 18 Jun 2026 08:44:40 +0800
In-Reply-To: <f9968540-afe2-495d-8744-98548880c27e@sifive.com>
References: <20260617112925.1144190-2-wangxiang@iscas.ac.cn>
	 <f9968540-afe2-495d-8744-98548880c27e@sifive.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CM-TRANSID: zQCowABn8QR4PzNqMP37Ew--.12429S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tr1DXr1kAw4rJrW8ZF1kXwb_yoW8Kw43pa
	1kGF45KayDGFnag3y3Jr129rW5Gw48tw4rtryfZa4rAwnIqr1qgr1jgwn0gFyUAF4kJr1j
	vr4jyr1Y9F1YyFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvYb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l
	c2xSY4AK67AK6w1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
	Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r12
	6r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
	kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
	xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07
	jswIDUUUUU=
X-Originating-IP: [122.194.100.2]
X-CM-SenderInfo: pzdqw5pldqwq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_174446_310281_EA15D9C6 
X-CRM114-Status: GOOD (  13.72  )
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

5ZyoIDIwMjYtMDYtMTfkuInnmoQgMDk6MTMgLTA1MDDvvIxTYW11ZWwgSG9sbGFuZOWGmemBk++8
mgo+IEhpLAo+IAo+IE9uIDIwMjYtMDYtMTcgNjoyOSBBTSwgWGlhbmcgVyB3cm90ZToKPiA+IFNv
bWUgVC1IZWFkIGJhc2VkIHByb2Nlc3NvcnMsIGZvciBleGFtcGxlIHRoZSBTb3BoZ28gU0cyMDQ0
LCBoYXZlIGEKPiA+IEpUTEIgZXJyYXRhIHRoYXQgcmVxdWlyZXMgc3BlY2lhbCBoYW5kbGluZyBv
ZiBjZXJ0YWluIFRMQiBtYWludGVuYW5jZQo+ID4gaW5zdHJ1Y3Rpb25zIChzZmVuY2Uudm1hKS4K
PiA+IAo+ID4gSW50cm9kdWNlIGEgc2JpX3RsYl9sb2NhbF9vcGVyYXRpb25zIHN0cnVjdHVyZSBz
byBwbGF0Zm9ybXMgY2FuIHByb3ZpZGUKPiA+IGN1c3RvbSBsb2NhbCBUTEIgZmx1c2ggaW1wbGVt
ZW50YXRpb25zLiBVc2UgaXQgdG8gaW1wbGVtZW50IHRoZSBKVExCCj4gPiB3b3JrYXJvdW5kIG9u
IGFmZmVjdGVkIFNvQ3MgKGN1cnJlbnRseSBTb3BoZ28gU0cyMDQ0KS4KPiA+IAo+ID4gU2lnbmVk
LW9mZi1ieTogWGlhbmcgVyA8d2FuZ3hpYW5nQGlzY2FzLmFjLmNuPgo+ID4gU2lnbmVkLW9mZi1i
eTogSGFuIEdhbyA8Z2FvaGFuQGlzY2FzLmFjLmNuPgo+ID4gLS0tCj4gPiDCoGluY2x1ZGUvc2Jp
L3NiaV90bGIuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fCAzMSArKysrKysrKysrKysrCj4gPiDCoGxpYi9zYmkvc2JpX3RsYi5jwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNDYgKysrKysrKysrKysr
KysrKystLS0KPiA+IMKgcGxhdGZvcm0vZ2VuZXJpYy9pbmNsdWRlL3RoZWFkL2M5eHhfZXJyYXRh
LmggfMKgIDEgKwo+ID4gwqBwbGF0Zm9ybS9nZW5lcmljL3RoZWFkL3RoZWFkLWdlbmVyaWMuY8Kg
wqDCoMKgwqDCoCB8IDMxICsrKysrKysrKysrKy0KPiA+IMKgNCBmaWxlcyBjaGFuZ2VkLCAxMDEg
aW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiA+IAo+ID4gWy4uLl0KPiA+ICtzdGF0aWMg
dm9pZCB0aGVhZF9qdGxiX2xvY2FsX3NmZW5jZV92bWEoc3RydWN0IHNiaV90bGJfaW5mbyAqdGlu
Zm8pCj4gPiArewo+ID4gKyBzYmlfcG11X2N0cl9pbmNyX2Z3KFNCSV9QTVVfRldfU0ZFTkNFX1ZN
QV9SQ1ZEKTsKPiA+ICsgX19hc21fXyBfX3ZvbGF0aWxlX18oInNmZW5jZS52bWEiKTsKPiA+ICt9
Cj4gPiArCj4gPiArc3RhdGljIHZvaWQgdGhlYWRfanRsYl9sb2NhbF9zZmVuY2Vfdm1hX2FzaWQo
c3RydWN0IHNiaV90bGJfaW5mbyAqdGluZm8pCj4gPiArewo+ID4gKyBzYmlfcG11X2N0cl9pbmNy
X2Z3KFNCSV9QTVVfRldfU0ZFTkNFX1ZNQV9BU0lEX1JDVkQpOwo+ID4gKyAvKiBGbHVzaCBlbnRp
cmUgTU0gY29udGV4dCBmb3IgYSBnaXZlbiBBU0lEICovCj4gPiArIF9fYXNtX18gX192b2xhdGls
ZV9fKCJzZmVuY2Uudm1hIHgwLCAlMCIKPiA+ICsgwqDCoMKgwqAgOgo+ID4gKyDCoMKgwqDCoCA6
ICJyIih0aW5mby0+YXNpZCkKPiA+ICsgwqDCoMKgwqAgOiAibWVtb3J5Iik7Cj4gPiArfQo+IAo+
IFRoaXMgbG9va3Mgc2ltaWxhciB0byB0aGUgYnVnIHNlZW4gb24gb2xkZXIgU2lGaXZlIGNoaXBz
LCB3aGVyZSB3ZSBtdXN0IGFsd2F5cwo+IGZsdXNoIHRoZSBmdWxsIGFkZHJlc3Mgc3BhY2UuIElm
IHNvLCB0aGVyZSBpcyBhbHJlYWR5IGEgbXVjaCBzaW1wbGVyIHdvcmthcm91bmQKPiBhdmFpbGFi
bGUsIHVzaW5nIGdldF90bGJyX2ZsdXNoX2xpbWl0LiBTZWUgcGxhdGZvcm0vZ2VuZXJpYy9zaWZp
dmUvZnU1NDAuYy4KPiAKPiBSZWdhcmRzLAo+IFNhbXVlbApIaSBTYW11ZWwsCgpUaGFua3MgZm9y
IHRoZSBmZWVkYmFjay4KCldlIGRpZCBjb25zaWRlciBgZ2V0X3RsYnJfZmx1c2hfbGltaXRgLCBh
bmQgaXQgY2FuIGluZGVlZCBzb2x2ZSB0aGUgU0cyMDQ0IEpUTEIgaXNzdWUuwqAKSG93ZXZlciwg
Zm9yIFNHMjA0NCB3ZSBvbmx5IG5lZWQgdG8gb3ZlcnJpZGUgdGhlIGxvY2FsIGBzZmVuY2Uudm1h
YCBhbmQgYHNmZW5jZS52bWFgwqAKd2l0aCBBU0lEIGNhc2VzIChpLmUuIGBsb2NhbF9zZmVuY2Vf
dm1hYCBhbmQgYGxvY2FsX3NmZW5jZV92bWFfYXNpZGApLCB3aGlsZSBsZWF2aW5nwqAKdGhlIG90
aGVyIFRMQiBvcGVyYXRpb25zIG9uIHRoZSBkZWZhdWx0IGltcGxlbWVudGF0aW9uLiAgCgpUaGUg
bW9yZSBnZW5lcmFsIGxvY2FsIFRMQiBvcGVyYXRpb25zIG92ZXJyaWRlIG1lY2hhbmlzbSBnaXZl
cyB1cyB0aGUgZmxleGliaWxpdHkgdG/CoApkbyBleGFjdGx5IHRoYXQgd2l0aG91dCBmb3JjaW5n
IGEgZnVsbCBUTEIgZmx1c2ggbGltaXQgZm9yIGFsbCBvcGVyYXRpb25zLgoKUmVnYXJkcywgIApY
aWFuZyBXCgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
