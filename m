Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AAACD98D8
	for <opensbi@archiver.kernel.org>; Sat, 13 Jun 2026 18:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B3RjIG/Me83/v9T7/9NcKlBRawEgkJJsMyNYibnCbZU=; b=QoTpR0FxsNo0sK
	uRWb6xalLA86/XpwaQko9eEbzJ94HSNTHF/F7o3JDROkHBCg3gcRDt8TH2ZTD+nP4yItc2iQWTj8b
	WZe9EXug01J8o4d/Wjy3Zw81nMig2nLLaqxAMzwFbynoiC48fn91x1CNa84hG5BfHPjnG8PMn8nRa
	6Q54jrbRqVRXMCU2oWE+QAGucfUMg6+u0NNfXFeYzTLYqJSm7scr64r0eUaVZUqglH9FjBWr1zhiG
	Eq8x2qJWVyZMzamTVZ0MMfjAQYl+Os24ffC6FC0U/btHKbszkUGqUZiWtsLiMDzsTKds+mZB36x7S
	b2hosoZUyZfSUVC5S83A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYSsi-0000000CTDD-1qH0;
	Sat, 13 Jun 2026 18:14:56 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYSsd-0000000CTCi-3Xjl
	for opensbi@lists.infradead.org;
	Sat, 13 Jun 2026 18:14:54 +0000
Received: from [192.168.0.113] (unknown [123.118.218.239])
	by APP-05 (Coremail) with SMTP id zQCowACnCt4Uni1qrI9cEw--.7204S2;
	Sun, 14 Jun 2026 02:14:45 +0800 (CST)
Message-ID: <2f3a8cb0-831e-4293-8ab3-2b1d7dd49296@iscas.ac.cn>
Date: Sun, 14 Jun 2026 02:14:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] include: sbi_platform: Increase default stack size
To: Anup Patel <apatel@ventanamicro.com>
Cc: opensbi@lists.infradead.org, Michael Ellerman <mpe@kernel.org>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Bo Gan <ganboing@gmail.com>
References: <edbce78c-71a7-41d7-aa81-3fa57241644a@iscas.ac.cn>
 <CAK9=C2XGzAM+Qh3hXX78G6KjW7XxKOAd3Gwz9GBM6OdviYLPyw@mail.gmail.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <CAK9=C2XGzAM+Qh3hXX78G6KjW7XxKOAd3Gwz9GBM6OdviYLPyw@mail.gmail.com>
X-CM-TRANSID: zQCowACnCt4Uni1qrI9cEw--.7204S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZr48tF18KrW8trWkZF47Arb_yoWkGrb_CF
	yrAF48J3W0gw1DGw1rtFWYvryrKw1kJr1rt390qw1fWas8Kr9xG3yvkF9xArn8Xws5urnI
	kwna93yFqry2gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb2kYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF
	04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8KLvtUUUUU==
X-Originating-IP: [123.118.218.239]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_111452_314741_8E4DE19F 
X-CRM114-Status: UNSURE (   8.49  )
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

Ck9uIDYvMTMvMjYgMjE6MjAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gT24gU3VuLCBNYXkgMjQsIDIw
MjYgYXQgMTE6MjjigK9BTSBWaXZpYW4gV2FuZyA8d2FuZ3J1aWthbmdAaXNjYXMuYWMuY24+IHdy
b3RlOgo+PiBzYmlfbWlzYWxpZ25lZF92X2xkX2VtdWxhdG9yKCkgaGFzIGEgbG9jYWwgYnVmZmVy
IChuYW1lbHkgbWFzaykgd2hpY2ggaXMKPj4gODE5MiBieXRlcyBpbiBzaXplLCBzbyB0aGUgZGVm
YXVsdCBzdGFjayBzaXplIGlzIG5vdCBlbm91Z2guIERvdWJsZSBpdAo+PiB0byAxNjM4NC4KPiBJ
bmNyZWFzaW5nIHRoZSBzdGFjayBzaXplIGluIG9ubHkgYSB0ZW1wb3JhcnkgZml4IGFuZCBvbmx5
IGRlZmVycmluZwo+IHRoZSBwcm9ibGVtIHRvIHNvbWUgb3RoZXIgZGF5LgoKSnVzdCBmb3IgY29u
dGV4dCwgQm8gR2FuIGhhcyBhbHJlYWR5IHBvc3RlZCBhIHNvbHV0aW9uIGZvciBlbXVsYXRpb24g
dG8KdXNlIGEgc21hbGwgZml4ZWQgKHJlbGF0aXZlIHRvIFZMRU4pIGFtb3VudCBvZiBzdGFjayBm
b3IgdGhlIG1hc2sgWzFdCihkZXBlbmRpbmcgb24gb3RoZXIgZml4ZXMgWzJdKSwgc28gdGhpcyAi
c29tZSBvdGhlciBkYXkiIHNob3VsZCBoYXBwZW4Kc29vbiAoa25vY2tpbmcgb24gd29vZCkuCgpN
eSBwZXJzb25hbCBwcmVmZXJlbmNlIGlzIHRvIG5vdCB0byBmdXJ0aGVyIGNvbXBsaWNhdGUgdGhl
IGNvZGUgaW4gdGhlCm1lYW4gdGltZSwgc28gSSBkb24ndCB0aGluayB0aGUgaGVhcCBhbGxvY2F0
aW9uIHNvbHV0aW9uIGlzIHJlYWxseQpuZWNlc3NhcnkuIEJ1dCBpZiBidW1waW5nIHRoZSBzdGFj
ayBzaXplIGlzIG5vdCBhY2NlcHRhYmxlIHRoZW4gaGVhcAphbGxvY2F0aW9uIGlzIHByb2JhYmx5
IHRoZSB3YXkgdG8gZ28sIGFsdGhvdWdoIHRoYXQgd291bGQgc3RpbGwgYmUgYQp0ZW1wb3Jhcnkg
c29sdXRpb24uCgpbMV06Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29wZW5zYmkvMjAyNjA2MDkw
NjAwMjQuNzA2LTEtZ2FuYm9pbmdAZ21haWwuY29tLwpbMl06Cmh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL29wZW5zYmkvMjAyNjA2MDUxMTMyMTQuMjQyLTEtZ2FuYm9pbmdAZ21haWwuY29tLwoKCi0t
IApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
