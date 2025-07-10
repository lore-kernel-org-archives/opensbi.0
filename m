Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C09C83F10
	for <opensbi@archiver.kernel.org>; Thu, 10 Jul 2025 02:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u6k/NVTGhIYeF2sj6WNWeIacIXJYdR8WEdh4T3Bjqxw=; b=DqePTKjKDQ4Z3T
	riuTr7TyJua/sLZefx4uTQ8EYsFmdE1kBJo2SV5lS+KQNPA42HABU/QD7G1hjv7K/wEldiNyIusQL
	GqleEejCZRMcx2bbAVB8P+0Xue/+w/On9uXxJNTT2HpAzlIsEKBnWHKntJG7HwqC/qTTsd3vQlWA+
	T1V10ZRkQARmvt200gRKHdfrkAf2brEOZ+FxkzjdMeP/h8RGvtSb2FDvmyCtYzBJRzRUB2bkgTgsX
	GcyoRgN0CLkYGldml+nB0Wieu9ndb5A+DqigjDUIlZ310IQAKqGE01aMCpSxBFAJrS1E2ygwVbdA8
	qaj25GyPl4Aksrqf3Qig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZhMp-0000000AWoD-24D6;
	Thu, 10 Jul 2025 02:50:35 +0000
Received: from m16.mail.126.com ([220.197.31.6])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZhJG-0000000AW5S-41cn
	for opensbi@lists.infradead.org;
	Thu, 10 Jul 2025 02:46:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Subject:From:To:Date:Content-Type:
	MIME-Version; bh=ExuaG2lU+p4opcw+bI0JLtk0PfrsKUfdM9nR+x5EaiM=;
	b=cwDTedPR7dgmQNL7HeWyPi57VRnwZzNZ/jh/wWvJQrXZC7nMZwo03fla2y8+Xw
	OrzdKz3/UcgY2EDk9OadDIdD09oAlwkobzZsSos7ZiMlJ6lZf0xPXqHQ75IaKbhn
	r7qByX9YWh45dyAOrI1CuQ1Fj4sQnJQclMcVJp+nFt2ig=
Received: from [127.0.0.1] (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3D9SWKW9oQ0BGAA--.1873S2;
	Thu, 10 Jul 2025 10:46:46 +0800 (CST)
Message-ID: <fad0dc2070017e96cd6cf3cb14e387d5aca11cad.camel@126.com>
Subject: Re: [PATCH] include: sbi: Don't use #pragma when preprocessing
 device tree sources
From: Xiang W <wxjstz@126.com>
To: Jessica Clarke <jrtc27@jrtc27.com>, opensbi@lists.infradead.org
Date: Thu, 10 Jul 2025 10:46:46 +0800
In-Reply-To: <20250709232840.37551-1-jrtc27@jrtc27.com>
References: <20250709232840.37551-1-jrtc27@jrtc27.com>
Autocrypt: addr=wxjstz@126.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CM-TRANSID: _____wD3D9SWKW9oQ0BGAA--.1873S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF18tw15XF1xJw4fZryDGFg_yoW8GryDpa
	s0ya1kGa18Wryjyr1DCr129F4xWws5Zw13XFW7Aryaywnag3Wvqrs0qr1Fya4UArWDW3yF
	grZrWrZ5CFy8ZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRoSoAUUUUU=
X-Originating-IP: [2408:823c:b211:167d:fa0d:f332:45d5:d459]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbiFw6GOmhvHU-1dAAAsx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_194655_361915_D613F95A 
X-CRM114-Status: GOOD (  11.75  )
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

5ZyoIDIwMjUtMDctMTDlm5vnmoQgMDA6MjggKzAxMDDvvIxKZXNzaWNhIENsYXJrZeWGmemBk++8
mgo+IFNpbmNlIHRoaXMgcGVyc2lzdHMgaW4gdGhlIHByZXByb2Nlc3NlZCBvdXRwdXQgKHNvIHRo
YXQgaXQgY2FuIGFmZmVjdAo+IHRoZSBzdWJzZXF1ZW50IGNvbXBpbGF0aW9uKSwgaXQgZW5kcyB1
cCBpbiB0aGUgaW5wdXQgdG8gZHRjIGFuZCBpcyBhCj4gc3ludGF4IGVycm9yLCBicmVha2luZyB0
aGUgazIxMCBidWlsZC4gSWRlYWxseSB3ZSB3b3VsZG4ndCBhZGQgdGhlCj4gLWluY2x1ZGUgZmxh
ZyB0byBEVFNDUFBGTEFHUyBpbiB0aGUgZmlyc3QgcGxhY2UgYXMgdGhpcyBoZWFkZXIgaXMgd2hv
bGx5Cj4gcG9pbnRsZXNzIHRoZXJlLCBidXQgdGhhdCdzIGEgbW9yZSBpbnZhc2l2ZSBidWlsZCBz
eXN0ZW0gY2hhbmdlIGNvbXBhcmVkCj4gdG8ganVzdCBtYWtpbmcgdGhpcyBoZWFkZXIgc2FmZSB0
byBpbmNsdWRlIHRoZXJlLgo+IAo+IEZpeGVzOiA4NmMwMWE3M2ZmOWQgKCJsaWI6IHNiaTogQXZv
aWQgR09UIGluZGlyZWN0aW9uIGZvciBnbG9iYWwgc3ltYm9sIHJlZmVyZW5jZXMiKQo+IFNpZ25l
ZC1vZmYtYnk6IEplc3NpY2EgQ2xhcmtlIDxqcnRjMjdAanJ0YzI3LmNvbT4KVGhpcyBlcnJvciB3
aWxsIHJlYXBwZWFyIHdoZW4gUExBVEZPUk09a2VuZHJ5dGUvazIxMCBMTFZNPTEuCk5vIHByb2Js
ZW0gdW5kZXIgZ2NjLgoKVGVzdGVkLWJ5OiBYaWFuZyBXIDx3eGpzdHpAMTI2LmNvbT4KUmV2aWV3
ZWQtYnk6IFhpYW5nIFcgPHd4anN0ekAxMjYuY29tPgo+IC0tLQo+IMKgaW5jbHVkZS9zYmkvc2Jp
X3Zpc2liaWxpdHkuaCB8IDIgKysKPiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykK
PiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2JpX3Zpc2liaWxpdHkuaCBiL2luY2x1ZGUv
c2JpL3NiaV92aXNpYmlsaXR5LmgKPiBpbmRleCBlOWM0MDFjLi5mOTAwYzQ0IDEwMDY0NAo+IC0t
LSBhL2luY2x1ZGUvc2JpL3NiaV92aXNpYmlsaXR5LmgKPiArKysgYi9pbmNsdWRlL3NiaS9zYmlf
dmlzaWJpbGl0eS5oCj4gQEAgLTcsMTAgKzcsMTIgQEAKPiDCoCNpZm5kZWYgX19TQklfVklTSUJJ
TElUWV9IX18KPiDCoCNkZWZpbmUgX19TQklfVklTSUJJTElUWV9IX18KPiDCoAo+ICsjaWZuZGVm
IF9fRFRTX18KPiDCoC8qCj4gwqAgKiBEZWNsYXJlIGFsbCBnbG9iYWwgb2JqZWN0cyB3aXRoIGhp
ZGRlbiB2aXNpYmlsaXR5IHNvIGFjY2VzcyBpcyBQQy1yZWxhdGl2ZQo+IMKgICogaW5zdGVhZCBv
ZiBnb2luZyB0aHJvdWdoIHRoZSBHT1QuCj4gwqAgKi8KPiDCoCNwcmFnbWEgR0NDIHZpc2liaWxp
dHkgcHVzaChoaWRkZW4pCj4gKyNlbmRpZgo+IMKgCj4gwqAjZW5kaWYKPiAtLSAKPiAyLjM0LjEK
PiAKCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
