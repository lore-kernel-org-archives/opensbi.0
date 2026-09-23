Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32004C9830B
	for <opensbi@archiver.kernel.org>; Wed, 23 Sep 2026 19:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AcRnWdDgoZfK3ewwqTKvnVOckJWsdwwXehTmVFKqSqw=; b=fe53TwfOWWPga7
	U7QsYRfv6ZkWXrwMat90smYJC2fxK2xzDyWLrSca48fx0mVowraVFlWulrN2HchjvNrNYfMQIGd10
	O7WDYmEaU9feEYz880U1YZbJuaO3Fj6MgwwqCC9cPWLxyUxMgT7sJ/HzF1Og1sZC8led93cT8Xu+j
	EMS6Tf57LmnHvK3cFIzQhytEDD9IH3JSZMvnFz5KTbkry0evm3UYO8bzVLlG/NzA0VaY2tVezBzdj
	xt8Js+NnXmycAoyodV0E8YD3bhocwreoH+cwCEXKciDZrTfQ0N6niovANCs+cFog6r5mty6z1re8T
	NSGlVVob1yND4Ujr4Rwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Sih-00000009L2t-112K;
	Wed, 23 Sep 2026 19:33:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Sif-00000009L2i-2DQj
	for opensbi@bombadil.infradead.org;
	Wed, 23 Sep 2026 19:33:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NY0ZAOXVnQhEBUfV2lTMXVudUznOMWjwNX3FBdu1S5A=; b=fHYpHXsZOF4vchD5L5ioNHo7Qw
	BnTYnDQKLsLkkx6e/oVqP4YMKGlS0VNQJo+Yo1vYdbXRqR4QjaxCwQ2tDCNOY4H4BrVN6ShJ81IiT
	D/d744GqAEiwtT7sJ0REPZSbanU4MtXj9R3GzgUuEWZ/HVl1wzxkC5xp4aQziDAkjwk1cAcWkOkVJ
	NtBNfOxEzc6+Io8xCCKaquOVJDp6LNJGTSTeUdnxYGMCoYoYF8EbeADI8TjlV9WK+B/6BcmDmA4i8
	p8a/+qok82QHDN5r1k0RVTVjSh+lKf9XMZg5siny0r4j7elcvATkDBYqAW0gi2OREqnvrVUXWno5E
	ge6QenuQ==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Sic-0000000FD4l-14P9
	for opensbi@lists.infradead.org;
	Wed, 23 Sep 2026 19:33:28 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccd5cef0so828661a91.0
        for <opensbi@lists.infradead.org>; Wed, 23 Sep 2026 12:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790192003; x=1790796803; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NY0ZAOXVnQhEBUfV2lTMXVudUznOMWjwNX3FBdu1S5A=;
        b=DJKU2jgOyAHAI6ORDZMguN+8CnJOv+TRCKdCgqkNkMayyLENWllIgssTCF1kRyZ4dM
         EqJhFMxfMiDJ5hxX6Ttl8n8PU36YelnTkzhd1uFgZi8LkjcNVCcxVXqXtuNSRyENNqnf
         t+JtMyIXq7vnFEk7g/5MwK+Zeu8d/ZFpv7TBFUrTpYJF6Y2jQ0+//0ixHd+vt1prNtf6
         +7Vbv0Wnm9pTJjNbVzdqK4bDCfbYuIdZJ4keAlkSVfjgOYySH2rPrX0qs59/7RgE/VAJ
         9Kr8douqv5OYg84K/S8DgsbwLS52VHMckdoEmN7oBS4ypFm23GcF6Fc6bVB8RXST4ZgP
         H3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790192003; x=1790796803;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NY0ZAOXVnQhEBUfV2lTMXVudUznOMWjwNX3FBdu1S5A=;
        b=2BxTgWhu4QIV1JXSa98ijTLWMwpCmt7UEUnse5+bkMsOvyBw8rltQ09r1qGQWyA3qM
         mkMmfX8fd+DaC1rAdUw/cJ/0X3qKTCgHGEegVtXljLlABi90F9RHBno75OP4R21UEehI
         Zal7IMTKyJKyWysvGp8WQYlQj5j0NsoYFKdEBfD1PlmqD/eTCNsWuaCcpl++4XpZrwyI
         hwcddffW1Q5loabYglJZCeLrG9A3ER3ZHfOA6F5qUVx+iUy/ElGHYOWl6YF5uaQjVIVk
         Oq5QRJyJUEdSWDgEFxLCXUyN8A2CIjJDg9kd+GIhF5HNEOnVCmpKluSjSo1o+Ycfoi4T
         10ww==
X-Gm-Message-State: AFuF++k5su6f6HKgpJhaiaT0LFqDEUQh4jObG25l+pfd6DQyrqkv5KzG
	6g+2wB0JcKolSwjePWSoqcBJ5qhGMYEFTHTcLvSNWbfZ0voyixCzuPWVcXYvkuuKJVk=
X-Gm-Gg: AYBFou3jDqPBp1bFeVnI0berclB5X2JFHcJxKZDhkKf2+iQ0qeZv0X1ZZPd5Xn0UpmT
	2pg8BgXSbOsTMtI/hxqKNTtjKrOzrpLiInrQ9NV/L4AMiEFK+l2afBSF2hbHnsdc4fND4DYO1tL
	lfJSPNnq3XC2T1eil/cXIIbwwL7/JVPVJhv9oZma5/YAQTyBh0meP2f6+fBDQd74LE1u6n9mHK0
	ju9oMg4YZwDgK+iZiOrZ9V+hc815GzCme0MSaP36sh5W3MZAZCLbZrtxqlPDHGCHkTtbhd4JHpv
	jNs2lrSG5vrbWdh1u1xxUi3hwsUYN+WrZX1BdAT73YO06fXjOnXVEr9TjDef0ycuWyJJysohGRo
	URwlA3i38Al4Z1PWVZ8CLJCSAOIt7HzREXN/89EUZ/hDcdPlbASg6j3WQhkMBdgNdYTMXfhWYwc
	oTWRLtiOgTTYAJ1tKUuiu1a/COlKdDVAVtzRl4SF2PYNZ9Gd8srz1ztC4ddzBSFo9/JSVmCmEcv
	7yqGSVZeo1DCpwBjiNkGghj9KhVf9xDdg==
X-Received: by 2002:a17:90b:3c07:b0:3a0:3d1c:2dc6 with SMTP id 98e67ed59e1d1-3a098d56c2amr128923a91.66.1790192002538;
        Wed, 23 Sep 2026 12:33:22 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0812a1eb2sm2334991a91.4.2026.09.23.12.33.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 12:33:21 -0700 (PDT)
Mime-Version: 1.0
Date: Wed, 23 Sep 2026 15:33:19 -0400
Message-Id: <DLMY3N59Q9PC.2J9Z4P0B30RVI@baylibre.com>
Subject: Re: [PATCH 0/3] Makefile: fix support checks that use grep
Cc: <opensbi@lists.infradead.org>, <carlos.lopezr4096@gmail.com>, "opensbi"
 <opensbi-bounces@lists.infradead.org>
To: "Anup Patel" <anup@brainfault.org>, "Trevor Gamblin"
 <tgamblin@baylibre.com>
From: "Trevor Gamblin" <tgamblin@baylibre.com>
X-Mailer: aerc 0.22.0
References: <20260910-makefile_extension_grep-v1-0-b3ae0d456a6e@baylibre.com> <DLL1K66Y085U.EOAJ6C1RLL6Z@baylibre.com> <CAAhSdy0=rxhvOMk-NuQnRBNtu5GZQVgaM2irp9gE0+tLggcTew@mail.gmail.com>
In-Reply-To: <CAAhSdy0=rxhvOMk-NuQnRBNtu5GZQVgaM2irp9gE0+tLggcTew@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_203326_360282_44CBF381 
X-CRM114-Status: UNSURE (   9.86  )
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

T24gVHVlIFNlcCAyMiwgMjAyNiBhdCAxMjo1NSBQTSBFRFQsIEFudXAgUGF0ZWwgd3JvdGU6Cj4g
T24gTW9uLCBTZXAgMjEsIDIwMjYgYXQgNzoyMOKAr1BNIFRyZXZvciBHYW1ibGluIDx0Z2FtYmxp
bkBiYXlsaWJyZS5jb20+IHdyb3RlOgo+Pgo+PiBIaSBhbGwsCj4+Cj4+IENoZWNraW5nIGluIG9u
IHRoaXMgc2VyaWVzLiBEbyBJIG5lZWQgdG8gbWFrZSBjaGFuZ2VzPwo+Cj4gVGhlIE1ha2VmaWxl
IGhhcyBjaGFuZ2VkIGEgYml0IGluIHRoZSBsYXRlc3QgT3BlblNCSS4KPiBDYW4geW91IHBsZWFz
ZSByZWJhc2UgYW5kIHNlbmQgYW5vdGhlciB2ZXJzaW9uID8KClN1cmUsIHBhdGNoZXMgY29taW5n
IHNob3J0bHkuCgpUcmV2b3IKPgo+IFJlZ2FyZHMsCj4gQW51cAo+Cj4+Cj4+IFRoYW5rcywKPj4g
VHJldm9yCj4+Cj4+IC0tCj4+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4+IG9wZW5zYmlAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5zYmkKCgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29w
ZW5zYmkK
