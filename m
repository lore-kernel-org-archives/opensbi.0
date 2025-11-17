Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA53CEBF93
	for <opensbi@archiver.kernel.org>; Mon, 17 Nov 2025 13:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U5GYA9juLM2JuDkBF/L9FEFRomMPw8hppOUX/ltx8tc=; b=FysnniCJ8EqaJb
	rb6PLGcbp6GV2igDlsqeS609AbbELQjav0FO538FeK6MgZfOeBl1Hy0Z86Rcyu3qy9MzK+rgFucvN
	wFIVYXhb4Eah2B8lrO7shyI/BnhchQqZe15Bx/UOfLixl0POHpQ2gKRl9e68XWCsj+qSPDiZv0L8H
	4ky13MLUtQKdUFkgUlsgiy8HiZOqPDFnhrXr+0ksIzfZ4d6k0phAgkRXYZVtvpNzqfu2xuyl79Jnf
	qap24uaBoeoOgWMmLTWsmmlIQczL1vAGq5un4kCklLwocEjo5rijvtt+98GsQKVoGaKsM89amO7Ei
	jJmaJiQsPjLGBco2o4eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKz5d-0000000GA2r-1td6;
	Mon, 17 Nov 2025 13:16:17 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKz5b-0000000GA2R-0quM
	for opensbi@lists.infradead.org;
	Mon, 17 Nov 2025 13:16:16 +0000
Received: from [192.168.0.105] (unknown [114.241.85.109])
	by APP-03 (Coremail) with SMTP id rQCowAAnudsVIBtpYKMRAQ--.14742S2;
	Mon, 17 Nov 2025 21:16:05 +0800 (CST)
Message-ID: <42315089-6024-41a3-a6a1-c63ee2113cba@iscas.ac.cn>
Date: Mon, 17 Nov 2025 21:16:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] lib: sbi: ISA extension emulation (Zvbb).
From: Vivian Wang <wangruikang@iscas.ac.cn>
To: Benedikt Freisen <b.freisen@gmx.net>, opensbi@lists.infradead.org
Cc: Han Gao <gaohan@iscas.ac.cn>
References: <20251114203842.13396-1-b.freisen@gmx.net>
 <20251114203842.13396-8-b.freisen@gmx.net>
 <e9da5b9e-11fe-47c2-93cb-9fc88f872b04@iscas.ac.cn>
Content-Language: en-US
In-Reply-To: <e9da5b9e-11fe-47c2-93cb-9fc88f872b04@iscas.ac.cn>
X-CM-TRANSID: rQCowAAnudsVIBtpYKMRAQ--.14742S2
X-Coremail-Antispam: 1UD129KBjvJXoWrZw18KF1DWF43urW3ZF1UJrb_yoW8JrWDpF
	Z0kFn5Jr48tF1xtwsrJw40vFWFkwnYgFWUJF15Xw40vr95G3ZaqF1vqryv9aySgr18tr4U
	ta17ZrZ5ua1vvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyjb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
	s4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
	1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
	JVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r
	1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUv
	cSsGvfC2KfnxnUUI43ZEXa7IU8P5r7UUUUU==
X-Originating-IP: [114.241.85.109]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_051615_606844_099C8636 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

T24gMTEvMTcvMjUgMjA6MzUsIFZpdmlhbiBXYW5nIHdyb3RlOgo+IEhpwqBCZW5lZGlrdCwKPgo+
IFRoYW5rIHlvdSBmb3IgeW91ciBwYXRjaC4gV2UgaGF2ZSBmb3VuZCBpdCB2ZXJ5IHVzZWZ1bC4K
Pgo+IEhhbiBHYW8gKGNjJ2QpIGhhcyBiZWVuIHRlc3RpbmcgdGhpcyBvbiB0aGUgU0cyMDQ0LiBX
ZSBoYXZlIHNvbWUgbWlub3IKPiBzdWdnZXN0aW9ucyBhbmQgYSBidWcgcmVwb3J0IHJlZ2FyZGlu
ZyBwYXRjaCA3LiBQbGVhc2Ugc2VlIGJlbG93Lgo+Ck9vcHMsIGFsbW9zdCBmb3Jnb3QgdGhlcmUn
cyBhbm90aGVyIHRoaW5nOgo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9pbnNuX2VtdV92LmMg
Yi9saWIvc2JpL3NiaV9pbnNuX2VtdV92LmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAuLjUxNzc5MWUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvbGliL3NiaS9zYmlfaW5z
bl9lbXVfdi5jCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBmb3JlYWNoX3ZlbGVtX3Z2KGludCB2bCwg
aW50IHNldywgYm9vbCBtYXNrZWQsIGludCB2ZCwKPiArCQkJCSAgICBpbnQgdnMxLCBpbnQgdnMy
LCB1NjQgb3AodTY0LCB1NjQpKQo+ICt7Cj4gKwlzYmlfdmVjdG9yX2RhdGEgdnMxX2RhdGE7Cj4g
KwlzYmlfdmVjdG9yX2RhdGEgdnMyX2RhdGE7Cj4gKwlzYmlfdmVjdG9yX2RhdGEgdmRfZGF0YTsK
CldoaWxlIHRlc3RpbmcsIHdlJ3ZlIGFsc28gZm91bmQgdGhhdCB1c2luZyBsb2NhbCB2YXJpYWJs
ZXMgdGhpcyBsYXJnZSBpcwpwcm9uZSB0byBvdmVyZmxvd2luZyB0aGUgc3RhY2sgc3BhY2UuIEkn
bSBub3Qgc3VyZSB3aGF0IHRoZSBleGFjdApjb25kaXRpb24gdG8gdHJpZ2dlciB0aGlzIGlzLCBi
dXQgd2UndmUgaGFkIHRvIGluY3JlYXNlIHRoZSBzdGFjayBzaXplCmluIGluY2x1ZGUvc2JpL3Ni
aV9wbGF0Zm9ybS5oIGZyb206CgrCoCDCoMKgI2RlZmluZSBTQklfUExBVEZPUk1fREVGQVVMVF9I
QVJUX1NUQUNLX1NJWkXCoCDCoCA4MTkyCgpUbyAxNjM4NC4gT3RoZXJ3aXNlIGJpemFycmUgZXJy
b3JzIG9jY3VyIExpbnV4IHNlY29uZGFyeSBDUFUgc3RhcnR1cCwKcHJlc3VtYWJseSBkdXJpbmcg
Q1BVIHNwZWVkIG1lYXN1cmVtZW50LgoKUGVyaGFwcyBpdCdzIHdvcnRoIHRlc3RpbmcgY2FzZXMg
d2hlcmUgdGhlcmUgYXJlIG1hbnkgQ1BVcyB1c2luZwplbXVsYXRlZCBpbnN0cnVjdGlvbnMgc2lt
dWx0YW5lb3VzbHkuCgpWaXZpYW4gImRyYW1mb3JldmVyIiBXYW5nCgoKLS0gCm9wZW5zYmkgbWFp
bGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
