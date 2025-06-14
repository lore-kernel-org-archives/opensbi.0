Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29923C71135
	for <opensbi@archiver.kernel.org>; Sat, 14 Jun 2025 08:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IaEAY92NlD6ObbmPWV+HFLdUrrQanga4avoF8mLM9U4=; b=HKMoP/nMXNQwvc
	lEHgad3+urz2r4kIuSERosfIYu/dZJqG5cNAswQZfacB3Nai7ONh26ju0R7DMGx7Gp0tD4OIvZKrI
	jaSBKOTjxrAmBjE5k4/vaU9Y03DV2CVVsWk+oz/bTw/ImL89ZRgth53D8SJ1P9UvMQsq5WExeCPNu
	h+QKiF+eEzCiV1swQD9tBw9iaNw0f7rADTxQdUSqlbaaln5aCwAUnk2nrvz687ixzMTJnffJhDvz3
	QGWIT7r6Nn+vG+1a/uyOgyMiijpXW/U22eD8ltuIIkNHXTNDX62H/zHIFMmKAemLFvb+Ln/QPEY8C
	tFDWCzOw7MlcGtY4K3Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQM3K-00000000yLs-1ZG2;
	Sat, 14 Jun 2025 08:15:50 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQLPa-00000000u46-1CNt
	for opensbi@lists.infradead.org;
	Sat, 14 Jun 2025 07:34:47 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3ddc5084952so11438455ab.2
        for <opensbi@lists.infradead.org>; Sat, 14 Jun 2025 00:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1749886485; x=1750491285; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ln48mZlTUMRAdkCZqapjk9VuE9kSnGZ9b+2LoApQKN4=;
        b=jbY1rKxJVK9s0EWxiOV1DWfGGgpEJ9H1rX6ySj6BLcke7Xf+G1tbaWek/ZTNCMwAb5
         jkULBk0xEQTeHzUvsqujVIjyAqQyIqXxV+XK/0Vk7J6H6WpvYhT49wU/wUX2mf79x4Py
         VIz/9UejvXn+GSOuN79Atf86jC8gOZtDLQ7DjGbtCmZVGn/BBUG+UXQx6FnsSOJuobXV
         K+ytEnTAjZt/Vp/NoJ4FDcnCw+cTRhdmjWV/3yIk+BhiMCcVrL2wEMRgteQZXZwk2gi/
         l6RydoiT6RozakADEcLJJaF+jJAlGtJHucKdzJsNvth7UGjLuIYp8tOJPYpBTwL8y1x7
         guzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749886485; x=1750491285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ln48mZlTUMRAdkCZqapjk9VuE9kSnGZ9b+2LoApQKN4=;
        b=iAaJEqok0wq5JGvsqYBss4/6eXAXGs+kXPYeP9EuwUAKFem5MW8botY1tdCBGJxxf8
         u8mwjtflRQOgcGBU8XLTfqUcWT5KjWw20L31nuE5TEXmKyVGBjnpbK7msMXGrKggMC2P
         1YsmK1FVagGgKmkD3GR0u65YyD6My3WeycF45XZXSp2iuJyhskIsaEmQxAxwiJUaNEuQ
         hh399ncGm0PGqR69PKSLpKnmG3XOBTgjq/1MoytHYFPQDOTBCSn0r0joyFz5nq5unb6S
         U2TjGyJlCsg8ETWNPfUq9NDUNu8j98MIdWYdKRrTYtV9V0DOtteu1IQPXVgsIXzYKYMZ
         vxnQ==
X-Gm-Message-State: AOJu0Yx6+dbZ6udxzMdIddPALVWAHts1GARei/DHcyhEVRCyZbEO1Leb
	I8bqZuf2G0F8YXgNxZpAG4wt8i+tsiEdb1mfL0V2cmNxJHhiwxKUNSUEUgvuHNYxLhuVaWYOudV
	1Z0a+EYcOIGGzaWUpl11tNdVK/nCZ/7OIl6jUBHLy5mQysPhG1Po0
X-Gm-Gg: ASbGncv9e5A8xmaIbdA74gBXGE6G0YRu3U0OwdgU+1komXg7VAkVSKEkN7D+M9Py6nZ
	0mqj3eu86u/p7x7jvZ7YuoeOGtcsFp/sTnj6vb0mDMPsz7LPPnNsE7gakBl7PD0vLvJfjU77rDS
	FrnLIP+urc1jxQE3xgewYo+GkigrnETlsq3FRNK/Tb0Meh
X-Google-Smtp-Source: AGHT+IHCIdANoOT+wFnDb6ym1hrKWdcGNi79QQUcBUXk7o/xUXX9mzcUNSeZUFw/bWaQngVbSvpaDHRKYPbP/V86Tos=
X-Received: by 2002:a05:6e02:1fc2:b0:3dc:7240:94c7 with SMTP id
 e9e14a558f8ab-3de07c55879mr28011545ab.6.1749886485429; Sat, 14 Jun 2025
 00:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250507074620.3162747-1-wangziang.ok@bytedance.com>
In-Reply-To: <20250507074620.3162747-1-wangziang.ok@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 14 Jun 2025 13:04:33 +0530
X-Gm-Features: AX0GCFvlVOyeYQBVlb89ul5cHD4MAA7tW4sqqmMjInn9qA-nC3O0PmyoiedL-_k
Message-ID: <CAAhSdy1EY0kgJ4XPtKHWAgRszm=yEkHSuC54OGXBbrDK882TaA@mail.gmail.com>
Subject: Re: [PATCH] lib: utils: hsm: Do not fail on EALREADY in rpmi-hsm fixup.
To: Ziang Wang <wangziang.ok@bytedance.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_003446_324011_7535C32D 
X-CRM114-Status: GOOD (  16.35  )
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

T24gV2VkLCBNYXkgNywgMjAyNSBhdCAyOjEx4oCvUE0gWmlhbmcgV2FuZyA8d2FuZ3ppYW5nLm9r
QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gSW4gY2FzZSBoYXJ0cyBhcmUgZGl2aWRlZCBpbnRv
IGdyb3VwcyB0aGF0IHVzZSBkaWZmZXJlbnQKPiBycG1pLWhzbSBjaGFubmVscyBpbiBkaWZmZXJl
bnQgbWFpbGJveGVzLCB0aGUgc3VzcGVuZAo+IHN0YXRlIGZpeHVwIGZ1bmN0aW9uIHdpbGwgcmV0
dXJuIEVBTFJFQURZIG9uIHNlY29uZGFyeQo+IGVudHJ5LCBzaW1wbHkgc2tpcCBvbiB0aGlzIGVy
cm9yLgo+Cj4gU2lnbmVkLW9mZi1ieTogWmlhbmcgV2FuZyA8d2FuZ3ppYW5nLm9rQGJ5dGVkYW5j
ZS5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5v
cmc+CgpBcHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5r
cywKQW51cAoKCj4gLS0tCj4gIGxpYi91dGlscy9oc20vZmR0X2hzbV9ycG1pLmMgfCAyICstCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAt
LWdpdCBhL2xpYi91dGlscy9oc20vZmR0X2hzbV9ycG1pLmMgYi9saWIvdXRpbHMvaHNtL2ZkdF9o
c21fcnBtaS5jCj4gaW5kZXggY2M3ODQzNi4uMDlkMGM5MSAxMDA2NDQKPiAtLS0gYS9saWIvdXRp
bHMvaHNtL2ZkdF9oc21fcnBtaS5jCj4gKysrIGIvbGliL3V0aWxzL2hzbS9mZHRfaHNtX3JwbWku
Ywo+IEBAIC0zMzAsNyArMzMwLDcgQEAgc2tpcF9zdXNwZW5kX3N0YXRlczoKPgo+ICAgICAgICAg
LyogUmVnaXN0ZXIgSFNNIGZpeHVwIGNhbGxiYWNrICovCj4gICAgICAgICByYyA9IGZkdF9yZWdp
c3Rlcl9nZW5lcmFsX2ZpeHVwKCZycG1pX2hzbV9maXh1cCk7Cj4gLSAgICAgICBpZiAocmMpCj4g
KyAgICAgICBpZiAocmMgJiYgcmMgIT0gU0JJX0VBTFJFQURZKQo+ICAgICAgICAgICAgICAgICBn
b3RvIGZhaWxfZnJlZV9zdXNwX3N0YXRlX25hbWVzOwo+Cj4gICAgICAgICAvKiBSZWdpc3RlciBI
U00gZGV2aWNlICovCj4gLS0KPiAyLjM5LjUKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlz
dAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9w
ZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL29wZW5zYmkK
