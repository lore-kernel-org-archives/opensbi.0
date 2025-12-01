Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36143D116E2
	for <opensbi@archiver.kernel.org>; Mon,  1 Dec 2025 06:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IW/m7PTj4l+Sft0gHgtoIiYy4B9CCN/92kD3CVu3Ty0=; b=GWaiCIpOGBIwHX
	/w6I6ppVTleVY0acwvR1WxlQflpYHKrHP9Q1FHH/KMGkTmmoprrKqBvAxPFTU1ErOFULqI1NlljTJ
	JIUlwwf01IgdqwdrjZAT4kmiFPfEgmBZgF1V6NPE7CcOoPGhz5QdZV48AXei+KmPdHtWJEBEQxflT
	i1g38NA2dNV/RG1cTb5qnmmz+9c1qhqK1EBqbXgzZH9k9cq76aQZ/iEBCwX1Rb9Si/SxJOn54JYCM
	txjjVxg3zcMVGCw07jQ3qPiQNPoqUr4EWz/DBcb/4L19ijoam/7zTxtBXMCCyY+tNkfL4IsKgA5yv
	XreHzl52R+TGwgGTf/gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPwzT-00000002x5V-0zCc;
	Mon, 01 Dec 2025 06:02:27 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPwzQ-00000002x4t-1t6f
	for opensbi@lists.infradead.org;
	Mon, 01 Dec 2025 06:02:25 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-43326c74911so20247615ab.2
        for <opensbi@lists.infradead.org>; Sun, 30 Nov 2025 22:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1764568943; x=1765173743; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+CTFwpPzb60sLBbFe8VKWolFg5XdHjO+CfjMhfTpe4=;
        b=t2olWjmb6mi/lT9cmjrqUXTIJs23nX3dI/4dGzA/0hvbylK1nEs/6bA5HxvHGt0bAG
         ioTmYAeerXPdUAJ+PCDCFKJTT0HOSb1ig34hNlvusuhge/Bt6aineph9/6UX6YM2vMU8
         CJzEK0xEAqPIudwSCgg4CMhFkSVQVCuAiNv6UFdYLNWxza5HgIywI31ArdWGWXZ9S5/0
         Kmvk7rhPeHQ7Fffgcz4OBRl1NWpG3Kg7kAusuLvBOmtB8aUY6UxDVUF9VHyTkL7BBsQV
         a6zUJD2121R41r7hNYNd1P7N1uGPU/9/Ewu6feREs1wej2bEOiBVDUHNGW2o6oA2MFQl
         61Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764568943; x=1765173743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2+CTFwpPzb60sLBbFe8VKWolFg5XdHjO+CfjMhfTpe4=;
        b=UH0PZl373f55vjd2RAuH9EjgFVCYbQpDszyw9719d8WV2zoKeVVu5aKSci69ZV52Tq
         s6ZKJV9H1FqOyfSnPMryQesxndahVj+Y0X18jBL0RVPn/StEjUqsuhtLabsCzpRdRjXV
         khdxZRDq5GQewQoCUYtIiEAjUOxMa57QyZ9WumZ8WKY5v2dxaCfuVfkJKHws4zThcR2e
         C4qhGB28lfff4+hpBQ6HcIfFRZPKmXQz5QcTmANVjzwy7bl2ocJ/GmY3ZKxwvqZZ/lDI
         zuj7dcuKd/5OuKx+lCzITRLguIUtSwLq/wR8UzgWm58sEsYUdWpJXMIjR2qIZqJES6B5
         MsaQ==
X-Gm-Message-State: AOJu0Yz6d5QjZSNkhTZg08P1mYm7W1GtPaJgY01tPOQOLsMCj9suTjXb
	7yAZAPN1S/SKI+ixs0UxUwBxGScALwX5tZYYR2UMyLOxkHFTnmwkz6IXTsFIPnTtxp3qFLrbMc8
	uX2rIE9VXkDv5dXVwKGykohpct4ySX6Z9owkVrW2E4A==
X-Gm-Gg: ASbGnctBxpmoh7QIOV4shoK5kSQTUTJZl5s0KZUPnChpa3TJslfhAMA3jjOEp8no8BC
	cfJUnVV9yxTdzvAoAAWobVFjBS+D9ADjOyeJOhSLsQOlPXLDg8bSoRgNs+BiO7oG9khs7gy4hKB
	WIXBWmnn885AIGhew+Ougn3sCEM1LoiTZNnYIYm28PFZjK8ykupSju8C2kx5okRC+EcFWnjENXN
	Q2v9Xq823A7hQ/lKGfaIpEu3BOnXH8oKJgrunbSa+6gsDAqHTXRzmM/K+66S9nDZl7CkA==
X-Google-Smtp-Source: AGHT+IFh6x4zH4/F/mp9QvatNA5Fk/fiVMioXD1eRS4EPWhz68curQ255ti+hpluxAIXMBWLKJhgUZ+xpBZ+KzmuAT0=
X-Received: by 2002:a05:6e02:156a:b0:434:7087:ff5e with SMTP id
 e9e14a558f8ab-435dd0de6d7mr196055755ab.22.1764568943370; Sun, 30 Nov 2025
 22:02:23 -0800 (PST)
MIME-Version: 1.0
References: <20251110164352.163801-1-rpathak@ventanamicro.com>
In-Reply-To: <20251110164352.163801-1-rpathak@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 1 Dec 2025 11:32:11 +0530
X-Gm-Features: AWmQ_bmL4L_3twRnXFczIHbERrl5CA62WwyCuZt2cO9byWhYlfm-HeTUm2mwG0E
Message-ID: <CAAhSdy3ByiatFh5WbKf7fjjo082ZS0ig8jCZKqfrfdS=rk+VQA@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Only enable --print-gc-section for verbose(V=1) build
To: Rahul Pathak <rpathak@ventanamicro.com>
Cc: opensbi@lists.infradead.org, rahul@summations.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_220224_514943_E5FEFF31 
X-CRM114-Status: GOOD (  14.70  )
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

T24gTW9uLCBOb3YgMTAsIDIwMjUgYXQgMTA6MTTigK9QTSBSYWh1bCBQYXRoYWsgPHJwYXRoYWtA
dmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBFYXJsaWVyIHRoaXMgb3B0aW9uIHdhcyBlbmFi
bGVkIGR1cmluZwo+IGRlYnVnIGJ1aWxkIHdoaWNoIG9ubHkgcHJpbnRzIHRoZSBsaW5rZXIgbG9n
cwo+IG9mIHJlbW92aW5nIHRoZSB1bnVzZWQgc2VjdGlvbnMuIEluc3RlYWQKPiBlbmFibGUgdGhp
cyBmb3IgVj0xIGFuZCBrZWVwIHRoZSBkZWJ1ZyBidWlsZAo+IGNsZWFuLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogUmFodWwgUGF0aGFrIDxycGF0aGFrQHZlbnRhbmFtaWNyby5jb20+CgpMR1RNLgoKUmV2
aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMg
cGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKPiAtLS0KPiAg
TWFrZWZpbGUgfCA1ICsrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCj4gaW5kZXgg
Mzk4ZWFiZThjOTY0Li5kYTc5NzZkNWVmYmIgMTAwNjQ0Cj4gLS0tIGEvTWFrZWZpbGUKPiArKysg
Yi9NYWtlZmlsZQo+IEBAIC00NDQsMTEgKzQ0NCwxNCBAQCBEVFNDUFBGTEFHUyAgICAgICA9ICAg
ICAgICQoQ1BQRkxBR1MpIC1ub3N0ZGluYyAtbm9zdGRsaWIgLWZuby1idWlsdGluIC1EX19EVFNf
XyAteCBhc3NlbWJsZQo+Cj4gIGlmbmVxICgkKERFQlVHKSwpCj4gIENGTEFHUyAgICAgICAgICs9
ICAgICAgLU8wCj4gLUVMRkZMQUdTICAgICAgICs9ICAgICAgLVdsLC0tcHJpbnQtZ2Mtc2VjdGlv
bnMKPiAgZWxzZQo+ICBDRkxBR1MgICAgICAgICArPSAgICAgIC1PMgo+ICBlbmRpZgo+Cj4gK2lm
ZXEgKCQoViksIDEpCj4gK0VMRkZMQUdTICAgICAgICs9ICAgICAgLVdsLC0tcHJpbnQtZ2Mtc2Vj
dGlvbnMKPiArZW5kaWYKPiArCj4gICMgU2V0dXAgZnVuY3Rpb25zIGZvciBjb21waWxhdGlvbgo+
ICBkZWZpbmUgZHluYW1pY19mbGFncwo+ICAtSSQoc2hlbGwgZGlybmFtZSAkKDIpKSAtRF9fT0JK
TkFNRV9fPSQoc3Vic3QgLSxfLCQoc2hlbGwgYmFzZW5hbWUgJCgxKSAubykpCj4gLS0KPiAyLjQ4
LjEKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3Bl
bnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
