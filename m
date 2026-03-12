Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71067FED2F7
	for <opensbi@archiver.kernel.org>; Thu, 12 Mar 2026 09:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dhG40VnEXxvEIO/mVMYDYXKDld0x17boS8Ehm+zMAaQ=; b=jFt4mDXUN6sebo
	3ImXEDnqbKTJNGfJZh/coYh8ZTRZ0mgmHKpg2tEzI9y5Rja1PMo7wAmcoxJk5dmXTIsMgxzHRT5YA
	OiDHSH7h9N5dTW+LI6DIrWEOb9zWby66HBHdwJ3wt9EaJXYroynV+u0tLqOubx38f1HCfSl+1LCL8
	aqpaRsN62Ysew16WP+Z6qKdZW3pL+r7wfP/OSUu6FSVtuZrC3zwerqWA9uEkbWtj60ungYp2YtKe6
	P8TiaDGbJAoE1ueBiecDyZMRnMCu00pS9v8Ow+bssuYSoqMU7Dcfy8WSfT4gTJijbuAV4GAqPDBzd
	+A558J8R0Lj7BgEYbFGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0c7c-0000000Dh1U-48fy;
	Thu, 12 Mar 2026 09:14:24 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0c7X-0000000Dh0w-49Jn
	for opensbi@lists.infradead.org;
	Thu, 12 Mar 2026 09:14:22 +0000
Received: from [10.213.19.38] (unknown [210.73.43.101])
	by APP-03 (Coremail) with SMTP id rQCowAC31dzmg7JpAB5xCg--.45209S2;
	Thu, 12 Mar 2026 17:14:14 +0800 (CST)
Message-ID: <1b1d72fb-482f-49db-b41b-53bfef6edb3d@iscas.ac.cn>
Date: Thu, 12 Mar 2026 17:14:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] OpenSBI: Lazy floating-point and vector context switching
To: dave.patel@riscstar.com, opensbi@lists.infradead.org
Cc: Scott Bambrough <scott@riscstar.com>,
 Robin Randhawa <robin.randhawa@sifive.com>,
 Anup Patel <anup.patel@qti.qualcomm.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Ray Mao <raymond.mao@riscstar.com>, Anup Patel <anuppate@qti.qualcomm.com>,
 Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>
References: <20260311171103.70074-1-dave.patel@riscstar.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20260311171103.70074-1-dave.patel@riscstar.com>
X-CM-TRANSID: rQCowAC31dzmg7JpAB5xCg--.45209S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uryDZr1UAry5ZFWxCrWfKrg_yoW8Kr17pF
	WfC3yfAFWDJF4rua1kJw4jqrW3u3yxtFWUGFn8J3y8JFW3WFyvgryUt3WYvF9xCryrurWY
	va90vry8ZayUAFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Ib7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjxUygTQUUUUU
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_021420_414276_2A2B1C49 
X-CRM114-Status: GOOD (  13.27  )
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

T24gMy8xMi8yNiAwMToxMSwgZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20gd3JvdGU6Cj4gSGkgT3Bl
blNCSSBtYWludGFpbmVycyBhbmQgY29tbXVuaXR5LAo+Cj4gSSBhbSB3b3JraW5nIG9uIGFuIGlt
cGxlbWVudGF0aW9uIHRvIHN1cHBvcnQgZmxvYXRpbmctcG9pbnQgKEZQKSBhbmQKPiB2ZWN0b3Ig
cmVnaXN0ZXIgY29udGV4dCBtYW5hZ2VtZW50IGR1cmluZyBkb21haW4gYW5kIGFwcGxpY2F0aW9u
Cj4gY29udGV4dCBzd2l0Y2hlcyBpbiBPcGVuU0JJLgo+Cj4gQ3VycmVudGx5LCBPcGVuU0JJIHNh
dmVzIGFuZCByZXN0b3JlcyBvbmx5IHRoZSBpbnRlZ2VyIHJlZ2lzdGVyCj4gY29udGV4dCB3aGVu
IGhhbmRsaW5nIHRyYXBzIG9yIGRvbWFpbiB0cmFuc2l0aW9ucy4gVGhlIEZQIHJlZ2lzdGVycwo+
IChmMOKAk2YzMSkgYW5kIHZlY3RvciByZWdpc3RlcnMgKHYw4oCTdjMxKSBhcmUgbm90IGN1cnJl
bnRseSBtYW5hZ2VkIGJ5Cj4gT3BlblNCSS4KPgo+IFdpdGggaW5jcmVhc2luZyBhZG9wdGlvbiBv
ZiB0aGUgUklTQy1WIHZlY3RvciBleHRlbnNpb24gYW5kCj4gZmxvYXRpbmctcG9pbnQgd29ya2xv
YWRzLCBpdCBiZWNvbWVzIGltcG9ydGFudCB0byBlbnN1cmUgY29ycmVjdAo+IGJlaGF2aW9yIHdo
ZW4gUy1tb2RlIHNvZnR3YXJlIG9yIHRydXN0ZWQgYXBwbGljYXRpb25zIHVzZSB0aGVzZQo+IGV4
ZWN1dGlvbiB1bml0cy4KPgo+IFRoaXMgZW1haWwgcHJvcG9zZXMgYW4gYXBwcm9hY2ggdG8gc3Vw
cG9ydCBsYXp5IEZQIGFuZCB2ZWN0b3IKPiBjb250ZXh0IHN3aXRjaGluZywgYWxpZ25lZCB3aXRo
IHRoZSBtZWNoYW5pc20gZGVzY3JpYmVkIGluIHRoZQo+IFJJU0MtViBwcml2aWxlZ2VkIHNwZWNp
ZmljYXRpb24uCj4KPiAtLS0KPgo+ICMjIEJhY2tncm91bmQKPgo+IEluIFJJU0MtViwgdGhlIGBG
U2AgKEZsb2F0aW5nLXBvaW50IFN0YXRlKSBhbmQgYFZTYCAoVmVjdG9yIFN0YXRlKQo+IGZpZWxk
cyBpbiBgbXN0YXR1c2AgLyBgc3N0YXR1c2AgY29udHJvbCBhY2Nlc3MgdG8gdGhlIGZsb2F0aW5n
LXBvaW50Cj4gYW5kIHZlY3RvciB1bml0cy4KPgo+IFdoZW4gdGhlc2UgZmllbGRzIGFyZSBzZXQg
dG8gYE9mZmAsIGFueSBhdHRlbXB0IHRvIGV4ZWN1dGUgRlAgb3IKPiB2ZWN0b3IgaW5zdHJ1Y3Rp
b25zIHJlc3VsdHMgaW4gYW4gaWxsZWdhbCBpbnN0cnVjdGlvbiB0cmFwLgo+Cj4gVGhpcyBtZWNo
YW5pc20gYWxsb3dzIG9wZXJhdGluZyBzeXN0ZW1zIGFuZCBmaXJtd2FyZSB0byBpbXBsZW1lbnQK
PiBsYXp5IGNvbnRleHQgc3dpdGNoaW5nIHdoZXJlIEZQL3ZlY3RvciByZWdpc3RlcnMgYXJlIHNh
dmVkIG9yCj4gcmVzdG9yZWQgb25seSB3aGVuIHRoZXkgYXJlIGFjdHVhbGx5IHVzZWQuCgpUaGlz
IGRvZXMgbm90IHdvcmsgaW4gTWFjaGluZSBtb2RlLCB3aGVyZSBPcGVuU0JJIHJlc2lkZXMuCgpT
ZWUgcHJpdmlsZWdlZCBzcGVjLCBzZWN0aW9uICJFeHRlbnNpb24gQ29udGV4dCBTdGF0dXMgaW4g
bXN0YXR1cwpSZWdpc3RlciI6ICJNYWNoaW5lIGFuZCBTdXBlcnZpc29yIG1vZGVzIHNoYXJlIGEg
c2luZ2xlIGNvcHkgb2YgdGhlIEZTLApWUywgYW5kIFhTIGJpdHMuIgoKVGhpcyBtZWFucyB0aGF0
IGEgU3VwZXJ2aXNvciBtb2RlIHByb2dyYW0gY2FuIHNldCBzc3RhdHVzLkZTIHRvIERpcnR5LAph
Y2Nlc3MgZmxvYXRpbmcgcG9pbnQgc3RhdGUsIGFuZCBzZXQgc3N0YXR1cy5GUyBiYWNrIHRvIE9m
ZiB3aXRob3V0Ck1hY2hpbmUgbW9kZSBzb2Z0d2FyZSBub3RpY2luZyBldmVyLgoKU2VlIGFsc28g
aHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWlzYS1tYW51YWwvaXNzdWVzLzgzMgoiSW1w
b3NzaWJsZSB0byBpbXBsZW1lbnQgSFMtbGV2ZWwgc3N0YXR1cy57RlMsVlN9ID0gT2ZmIHdpdGgK
c29mdHdhcmUtZW11bGF0ZWQgaHlwZXJ2aXNvciBleHRlbnNpb24/IiB3aGVyZSBJIHJhbiBpbnRv
IHRoZSBzYW1lCnByb2JsZW0gaW4gYSBkaWZmZXJlbnQgY29udGV4dC4KClNvIGJhc2ljYWxseSwg
bGF6eSBzYXZpbmcvcmVzdG9yaW5nIEYgYW5kIFYgaW4gTWFjaGluZSBtb2RlIHdpdGgKbXVsdGlw
bGUgU3VwZXJ2aXNvciBtb2RlIHByb2dyYW1zIGlzIG5vdCBhIGRlc2lnbmVkIGZlYXR1cmUsIGFu
ZCBpcyBub3QKcG9zc2libGUgYXMgdGhlIHByaXZpbGVnZWQgYXJjaGl0ZWN0dXJlIGlzIGN1cnJl
bnRseSBkZXNpZ25lZC4gRm9yIHRoZXNlCnVzZSBjYXNlcyBub24tbGF6eSBzd2l0Y2hpbmcgaXMg
cmVxdWlyZWQuCgpWaXZpYW4gImRyYW1mb3JldmVyIiBXYW5nCgoKLS0gCm9wZW5zYmkgbWFpbGlu
ZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
