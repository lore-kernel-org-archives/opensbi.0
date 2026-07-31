Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC90C55167
	for <opensbi@archiver.kernel.org>; Fri, 31 Jul 2026 08:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bDuyliHwuIYvI5H1yFISBG+j99UG1XRmEaBPKsBZcN4=; b=PfZIRRdY26bke/
	L1XJ0EK6a38P6YFPqQ66D+GFxMxSKwunh0WL9ny5qiWzL2spnyiGyg1hvpA4GUuEJepzuV7fnRc+N
	xEu5lXRwPp2nR5Bu0fq8pAoZiHu0yoM1kr3sKApqDLHaq9sDmynIr5RH3kCDDnQExF5rGbwKMIPAb
	63cM0eQZelxBGZ1tmvL3BWso0sLvkXggWPV1Nv1cxo+weP8TUZkXkl4PbVL9kSVk7PCIqINa4jyDo
	pACCEfgaqL/DTkqhjr0sK9IKW3tn2OzgAb4qO5Lmj4mbDb23ci6bENznL7zBX5m2Rb3veOpqER/b0
	lDEXoD41YRaK0gwpJnqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiu3-0000000C6IH-0F6T;
	Fri, 31 Jul 2026 08:47:39 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiu0-0000000C6HH-0avq
	for opensbi@lists.infradead.org;
	Fri, 31 Jul 2026 08:47:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B64201A134B
	for <opensbi@lists.infradead.org>; Fri, 31 Jul 2026 08:47:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 838886039A;
	Fri, 31 Jul 2026 08:47:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 20F0911C1658D;
	Fri, 31 Jul 2026 10:47:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785487651; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=66KWe5dD16ZPvH9Jv1gCZ6IGFp8fXmzpAjG5XV8e7HQ=;
	b=irl0VI/izsX+pJhwl4paZ6SxoIAeEh7LRA65FeRBeEkta8ccImkPNlEa0Jsnr+5TXfwFtC
	Y9YxZJvq2YsfEgGqQG7T1kVQGmBKeO46FGM/F0yzROYXcWKR1ae3B0aV9qFUXpW0zIj+uh
	9tbfsw1SyTO4NeazIVqM+efNy7QtT1JOJj75Pj3f/1lJLfmk494MJp3MiwmN2TnsdW0GKK
	0p6zoLJ2aOVQm5qU37cJNDh88MLuS+bn7z4ZK4vy0PQIk/nl5tyRBUD+38Zqwu/9JpPbMH
	NBK40Nn+QcMZr4CUkSp7QqTwZZd9FxyRqH8Cj0rxCWLtIQO72OhL5B53ZppITw==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: opensbi@lists.infradead.org
Cc: Randolph <randolph@andestech.com>
Subject: Re: [PATCH] platform: generic/andes: fix 32-bit shift overflow in
 decode_pmaaddrx()
Date: Fri, 31 Jul 2026 10:47:27 +0200
Message-ID: <Nwqvc9X0S76pmOXY1bOJ2w@bootlin.com>
In-Reply-To: <20260729092317.2848665-1-randolph@andestech.com>
References: <20260729092317.2848665-1-randolph@andestech.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_014736_325403_5D21ECC8 
X-CRM114-Status: UNSURE (   7.28  )
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

T24gV2VkbmVzZGF5LCAyOSBKdWx5IDIwMjYgYXQgMTE6MjM6MTcgQ0VTVCwgUmFuZG9scGggd3Jv
dGU6Cj4gZGVjb2RlX3BtYWFkZHJ4KCkgcmVjb25zdHJ1Y3RzIHRoZSBOQVBPVCByZWdpb24gc3Rh
cnQgYW5kIHNpemUgZnJvbSBhCj4gcG1hYWRkciBDU1IgdmFsdWUgdXNpbmcgIjEgPDwgKGsgKyAz
KSIgYW5kICIxIDw8IGsiLiBUaGUgaW50ZWdlcgo+IGxpdGVyYWwgMSBoYXMgdHlwZSBpbnQsIHNv
IHRoZXNlIHNoaWZ0cyBhcmUgcGVyZm9ybWVkIGluIDMyLWJpdAo+IHByZWNpc2lvbi4gU2hpZnRp
bmcgYSAzMi1iaXQgdmFsdWUgYnkgMzIgb3IgbW9yZSBiaXRzIGlzIHVuZGVmaW5lZAo+IGJlaGF2
aW9yLCBhbmQgb24gUlY2NCB0aGUgY29tcGlsZXIgZW1pdHMgc2xsdywgd2hpY2ggdHJ1bmNhdGVz
IHRoZQo+IHNoaWZ0IGFtb3VudCBtb2R1bG8gMzIuCj4gCj4gQXMgYSByZXN1bHQsIGFueSBQTUEg
cmVnaW9uIHdpdGggc2l6ZSA+PSA0IEdpQiAoayA+PSAyOSkgaXMgZGVjb2RlZAo+IGluY29ycmVj
dGx5LiBGb3IgZXhhbXBsZSwgb24gdGhlIEFuZGVzIFFpTGFpIFNvQyB0aGUgUENJZSByZWdpb24K
PiAweDEwMDAwMDAwMDAgLSAweDE3ZmZmZmZmZmYgKHBtYWFkZHIgPSAweDRmZmZmZmZmZiwgayA9
IDMyKSBpcyBkZWNvZGVkCj4gYXMgYW4gOC1ieXRlIHJlZ2lvbiBhdCAweDEzZmZmZmZmZmMuCj4g
Cj4gVGhpcyBpcyBub3QgbWVyZWx5IGNvc21ldGljOiBkZWNvZGVfcG1hYWRkcngoKSBpcyB1c2Vk
IGJ5Cj4gaGFzX3BtYV9yZWdpb25fb3ZlcmxhcCgpIGFuZCBhbmRlc19zYmlfZnJlZV9wbWEoKSwg
c28gb3ZlcmxhcCBjaGVja3MKPiBhcmUgcGVyZm9ybWVkIGFnYWluc3QgYm9ndXMgcmFuZ2VzIGFu
ZCBmcmVlaW5nIHN1Y2ggYW4gZW50cnkgYnkgaXRzCj4gcGh5c2ljYWwgYWRkcmVzcyBhbHdheXMg
ZmFpbHMuCj4gCj4gUHJvbW90ZSB0aGUgc2hpZnRzIHRvIHVuc2lnbmVkIGxvbmcgc28gdGhleSBh
cmUgcGVyZm9ybWVkIGluIHRoZQo+IG5hdGl2ZSByZWdpc3RlciB3aWR0aC4KPiAKV29ya3MgZmlu
ZSBvbiBNZXRhbm9pYSBNVDI4MjQgU29DLgoKVGVzdGVkLWJ5OiBCZW5vw650IE1vbmluIDxiZW5v
aXQubW9uaW5AYm9vdGxpbi5jb20+CgpCZXN0IHJlZ2FyZHMsCi0tIApCZW5vw650CgoKCgotLSAK
b3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
