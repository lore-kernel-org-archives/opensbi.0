Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A128CCF9E0
	for <opensbi@archiver.kernel.org>; Mon, 27 Oct 2025 10:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TVVPOsntV0s0DoNf3zx+pNdhDQ5czedpvUyFh7kSCMs=; b=I1akhTsHsJc6Yk
	PPfAgFYZYQUcO9Sz45O96ygM2VuR4TYd4IC60XFlRXQvcurobx8ehfG4t5mgamobV+X/152xgrubM
	V08aSZsHAxYbOdCF0Zo1C3LZi/MGHODO56fqGfshLTzoJDwYFgi7vWUM0oYkVTGfBbhzAA5F1Gx51
	FomndcKL8tID+tVn2bbYo5/Xd0o/8Z8N3ROueb12b+f/rymCjHusRyILAPRQ1+18deZveS8kyyPDx
	92iFnTyrV3uMPbjGHzlFRhk7ubWyXH/z4cWYX2F8csQgzIRes71YiqZjnN3QBD3cjkcBCjYuOztRY
	hkp6en01MCRF3jie4f9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDK49-0000000Dc9I-0wXV;
	Mon, 27 Oct 2025 10:03:05 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDK45-0000000Dc8P-1ZsA
	for opensbi@lists.infradead.org;
	Mon, 27 Oct 2025 10:03:03 +0000
Received: from [127.0.0.1] (unknown [112.83.182.103])
	by APP-01 (Coremail) with SMTP id qwCowAB3TK9QQ_9oUEzRAg--.664S2;
	Mon, 27 Oct 2025 18:02:56 +0800 (CST)
Message-ID: <3003220bcebd3decdf6d9455c1e55df7aeeccd1b.camel@iscas.ac.cn>
Subject: Re: [PATCH] Add trap-based ISA extension emulation
From: Xiang W <wangxiang@iscas.ac.cn>
To: Benedikt Freisen <b.freisen@gmx.net>, opensbi@lists.infradead.org
Date: Mon, 27 Oct 2025 18:02:56 +0800
In-Reply-To: <20251026202416.23550-1-b.freisen@gmx.net>
References: <20251026202416.23550-1-b.freisen@gmx.net>
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CM-TRANSID: qwCowAB3TK9QQ_9oUEzRAg--.664S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur45Zr4xJrW3Zry7XFW3Awb_yoW8AF4rpF
	Z5Kw43Ka9rJ34Ikwn7Zrs7Ar4Y93yrtw4UGFn8XrWxA3yDAF10vF1vkF1Y9FykWr48JFy7
	Zr90qr1vk3WkAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyjb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
	s4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
	1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
	JVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r
	1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUv
	cSsGvfC2KfnxnUUI43ZEXa7IU5PpnJUUUUU==
X-Originating-IP: [112.83.182.103]
X-CM-SenderInfo: pzdqw5pldqwq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_030301_792131_A8860E0B 
X-CRM114-Status: GOOD (  12.05  )
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

5ZyoIDIwMjUtMTAtMjbml6XnmoQgMjE6MjEgKzAxMDDvvIxCZW5lZGlrdCBGcmVpc2Vu5YaZ6YGT
77yaCj4gVGhpcyBwYXRjaCBzZXJpZXMgc2Vla3MgdG8gYWRkIHRyYXAtYmFzZWQgZW11bGF0aW9u
IGZ1bmN0aW9uYWxpdHkgZm9yIHZhcmlvdXMgSVNBIGV4dGVuc2lvbnMgcmVsZXZhbnQgdG8gUlZB
MjIsIFJWQjIzIGFuZCBSVkEyMy4KPiBUaGUgZW11bGF0aW9uIGZ1bmN0aW9uYWxpdHkgY29udGFp
bmVkIGhlcmVpbiBoYXMgYmVlbiBkZW1vbnN0cmF0ZWQgdG8gZS5nLiBhbGxvdyB0aGUgVmlzaW9u
Rml2ZSAyJ3MgSkg3MTEwIHRvIHJ1biBzb2Z0d2FyZSB1c2luZyB0aGUgUlZBMjJVNjQKPiBhbmQg
UlZCMjNVNjQgcHJvZmlsZXMsIGFsbG93IHRoZSBPcmFuZ2UgUGkgUlYyJ3MgS3kgWDEgKGEgU3Bh
Y2VtaVQgSzEgZGVyaXZhdGl2ZSkgdG8gcnVuIFVidW50dSAyNS4xMCAoUlZBMjNVNjQpIGluIGEg
ZG9ja2VyIGNvbnRhaW5lciwgYW5kCj4gYWxsb3cgdGhlIFRlbnN0b3JyZW50IEJsYWNraG9sZSdz
IFNpRml2ZSBYMjgwIChHZW4uIDEpIHRvIGJvb3QgaW50byBVYnVudHUgMjUuMTAuCj4gCj4gVGhl
IGZpcnN0IHBhdGNoIG1lcmVseSBmaXhlcyB0aGUgdGFiIGFsaWdubWVudCBpbiByaXNjdl9lbmNv
ZGluZy5oLgo+IAo+IFRoZSBzZWNvbmQgcGF0Y2ggYWRkcyB3b3JrYXJvdW5kcyBmb3IgZGVjb2Rl
ciBidWdzIGluIHRoZSBDOTA2IGFuZCBDOTEwLCB3aGVyZSBGRU5DRSBhbmQgRkVOQ0UuSSBpbnN0
cnVjdGlvbnMgd2l0aCBub256ZXJvIHJlc2VydmVkIGZpZWxkcyBhcmUKPiBtaXN0YWtlbmx5IHRy
ZWF0ZWQgYXMgaWxsZWdhbCBpbnN0cnVjdGlvbnMuCj4gCj4gVGhlIHRoaXJkIHBhdGNoIGNvcnJl
Y3RzIHRoZSB0eXBlZGVmIG9mICJzOCIgZnJvbSAiY2hhciIgdG8gInNpZ25lZCBjaGFyIiwgYmVj
YXVzZSAiY2hhciIgaXMgaW1wbGljaXRseSB1bnNpZ25lZCBvbiBSSVNDLVYuCj4gCj4gVG8gbWUs
IHBlcnNvbmFsbHksIHRoZXNlIHRocmVlIGxvb2sgbGlrZSB1bmNvbnRyb3ZlcnNpYWwgaW1wcm92
ZW1lbnRzLgo+IAo+IFRoZSBmb3VydGggcGF0Y2gsIHRoZSBiaWcgb25lLCBhZGRzIHRoZSBhY3R1
YWwgSVNBIGV4dGVuc2lvbiBlbXVsYXRpb24gY29kZS4KPiBGb3IgaW5pdGlhbCBjb25zaWRlcmF0
aW9uLCBJIGFtIGhlcmVieSBzdWJtaXR0aW5nIGl0ICJhcy1pcyIsIG1haW5seSB0byBzZWUgd2hl
dGhlciB0aGVyZSBpcyBldmVuIGludGVyZXN0IGluIGhhdmluZyB0aGlzIGtpbmQgb2YKPiBmdW5j
dGlvbmFsaXR5IGluIG1haW5saW5lIE9wZW5TQkkuCj4gSWYgdGhhdCB0dXJucyBvdXQgdG8gYmUg
dGhlIGNhc2UsIHRoaXMgcGF0Y2ggd2lsbCBuZWVkIGZ1cnRoZXIgaXRlcmF0aW9ucyB0aGF0LCBh
c2lkZSBmcm9tIGluY29ycG9yYXRpbmcgeW91ciBmZWVkYmFjaywgZS5nLiBhZGQgY29uZmlndXJh
dGlvbgo+IG9wdGlvbnMgZm9yIGNvbmRpdGlvbmFsIGNvbXBpbGF0aW9uLgo+IAo+IFRoZSBmaWZ0
aCBwYXRjaCBpcyBpbmNsdWRlZCBmb3IgZG9jdW1lbnRhcnkgcHVycG9zZXMgb25seSwgbm90IGZv
ciBtZXJnaW5nLgo+IEl0IGNvbnRhaW5zIHRoZSBzZWN0aW9uIG9mIG15IGZvcmsncyBSRUFETUUg
ZmlsZSB0aGF0IGV4cGxhaW5zIHdoaWNoIGV4dGVuc2lvbnMgY2FuIGJlIGVtdWxhdGVkLiBUaGUg
aW5mb3JtYXRpb24gdGhlcmVpbiBjb3VsZCBhbHNvIGdvCj4gc29tZXdoZXJlIGVsc2UuCj4gClBB
VENINCBtaXNzaW5nIAoKUmVnYXJkcywKWGlhbmcgVwoKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlz
dApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
