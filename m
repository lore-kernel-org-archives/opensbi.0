Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54361C5DF87
	for <opensbi@archiver.kernel.org>; Thu, 20 Aug 2026 12:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lHrSajQnzserd8VSpNJlw8VAHhIGky3gh/N9Io3jzNQ=; b=WeFkAPg542otTv
	FqffCFIw8eZQy8/DWhmkrxNMc+m+bo9zXGRq6f83/xqxuW8zeXj5SKwia9YN92I0GuR4ENadkfSxV
	fakWmKTjLheqY0/+ajQI1yvr21ez/PRcLqEtkSOMPI/2C6MynEGYG5zHDKA7vXUzW6dyj92oauliD
	xGBKwlaA598uwcAAxZ/XrwrxBW8wiyBzIXGSKQljl7dmu1jlGaH2985vk1sDRbpmfgwcpCGYGEseM
	XStTYp9Z6b8TTlYB923Pnf/PLMkbJ7FaY4s2W1Yo2GpGklwr+yfAVKg4YgSIwpdCVdbMh4BlYY71k
	5wadKPXPq9+DQBkh630w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1pJ-0000000BWfl-3mxt;
	Thu, 20 Aug 2026 12:24:57 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1pH-0000000BWf2-1nsQ
	for opensbi@lists.infradead.org;
	Thu, 20 Aug 2026 12:24:56 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4956242332dso22537255e9.2
        for <opensbi@lists.infradead.org>; Thu, 20 Aug 2026 05:24:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787228693; cv=none;
        d=google.com; s=arc-20260327;
        b=MOtmUTL3kjES9IVkNFrBD0YlNQEo5KT0H0H6Zz23uJyzZKeOTpReUnB8jFLHVqISmH
         u19SrE221XagCAFoVm+65QZbe9eLtqkn7jHjtg7YzVxab2jyTVPO+hx5yvA7NzWZl++5
         MguQjm6+ogcAZnUEBMJKSL1e/lGFQKkBdgr1oEDwhNItlEDaxz2TbLvG2ExP2/ctSjtW
         YKdhxiKXGRyKg/xojepNz8Tv8gjvFN2goDkNyOl7SSII6EnZTA4jdBVk0C7UQ9N3k93Q
         e5aIHX2MHqgGZIY1L/7Pr5Oli3DSVqeId62LW1HD86uodun429V/CqIF4YzDYw/jddlj
         Dbog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x2Rr++MRk/ewro1xITdNqjVYQIdJoA7j/1OpgzfAwFE=;
        fh=vWBTJ5u4vDeOgnYgHX4HHagFw3/FzFzl9a/hyFHyfkM=;
        b=US6OOA4lDvqOrs/6iLtgaWlJ3LplGLCCz9KevTNPT4I4QIJxiF/vmazyfxT2yBDLe9
         idmgWWYCJHl2YJDb6/JlJ5l3RwZQBlqF8eeDK7w7ldc/HG+PhIh/hOlIonO2yQp/LXte
         q61cw/jZKvbdLqj3DZAtE4ag1Xdh8oxQjPGDKhBEI8qsV4ErerJQ98UnszNnsbo/+8Pv
         +ehBH5BdyYrXgNgknmoGiaWWH6rVjxp1oN4oxCsEt6l9pgd+E71ZppXqdyp1UagUbShQ
         RzjjLTftSDeJEIdXkm543fKQHhkQZ6B+YtbL7rOw56lFK2Fgsmvx1fkKOC/xnN/1LgYY
         IXNA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1787228693; x=1787833493; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x2Rr++MRk/ewro1xITdNqjVYQIdJoA7j/1OpgzfAwFE=;
        b=H6v4wSMtBOFb8MxVq0M3nSdZYSjbq3lcBLelCa7J4uzj7wF3lG+EAVrsWDladRCqQQ
         HeDctuJEjawn4mEzdvemHeIQGZzCjOm70bsvvUdGX4x3SHsw7xnmxsIs1jW3HRWYbua4
         /LElaZS5Hn8Tb7VYCjSAxodFh5DG+4qT63FvhVc6zPeFZzXv56yoLaP2EngdqhyVY8Q6
         uXeeNMt+M7AwiGEF2CGG4WNN7gmavX8+CCxF7X8+VMOfpPugaCeMKkho9A6tSuTCJIDY
         oZmQ9XZOC7yOxX3ZioUFunURFOxlkbuGxt8KBz7YMW17rpGIcUOku/vWm6pQtk4fPdF+
         uIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787228693; x=1787833493;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x2Rr++MRk/ewro1xITdNqjVYQIdJoA7j/1OpgzfAwFE=;
        b=iwzs7S7V1AsmUbq84/zuMG2HGYKcqNGN2ocpxuUm0qQXUGbVW45+Qh4DBR4ZtFnnlf
         v2VhHhXrR8h8vzZKy4V1z1vsS8g9p8vAvngXZ2xFfDGBnup6fcdGPSKhd3+I/XJRGp6/
         L1icSStbCa36A2AJeQHL9sMtRHKELJqAC78cvgOTiGYwIId9ytiT5BrZCmo+8siscnRM
         99DkBeZF7aARllIjOHE4UZZ2wk9LRb1Wos77IUUKCUOPjHxlaI2JmS7vP4Me7J7yQeY2
         7/AGo/RIm0xBVMpTBZIcttzIWjgMB4qth3qJvo9TGPRiEZ2F4BPuBZL1rwB8unQx0FbA
         U2hw==
X-Gm-Message-State: AOJu0YwRvSdwmJcNoft+kxEEObELeO+7W9X4V7xxCSS9xik3J7yAizwP
	/TCo4djJ6rui3oJiWXccosu/sr7QFmJJM/4skGUJ6MdkBf557TtPfUqVspKucrH7T1B6PKrA9bX
	U5OoH9LnlSm4EGehILqY2t6BlO/BAJ5CEvkaYVp91zcpdM/rK+E5JgEU=
X-Gm-Gg: AR+sD13EwUyPjDXOhnfOThqVh7n2qH4HjSLswmGEJVaBsZvlTYOyYc6APTZYNmFTOOl
	iRW9IuhY7lDW3T/azA3ZUZuygxB/mIhBamhJxKM01/BriuaH9XpIpc1bqFkfrvs+1H1grml0UFW
	7fS87RHVN2y/c6y/VWvqd4Ne5P17QlhdyCDW2BOCOCU6s5IZDM58g+Ml3qcZZWDMgJPbFdHhD8E
	mYwPD80zhwXZma36xWS7c3T9Nwyu4TagLjT9bYJTQdfhPfhdLPQ5/H0TX0EL4Isz3NeY87/eiWj
	NB3v2dCHbKmVsB7TrSH/eryVn0XfAqAhailoBwmsFJwnL6ti9HrIJ8neTRl/QF+N/xa/ai0u/q4
	Cy1lK8ENq/NJEYxCSHuUjjKPj53m08e/Dk/wqb5BnFdZrC5/6RMOYJsR4PhbkMoA=
X-Received: by 2002:a05:600c:c493:b0:493:cefc:d113 with SMTP id
 5b1f17b1804b1-499aa15df47mr202116085e9.5.1787228693199; Thu, 20 Aug 2026
 05:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260703050530.2460037-1-sunilvl@oss.qualcomm.com>
In-Reply-To: <20260703050530.2460037-1-sunilvl@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 20 Aug 2026 17:54:41 +0530
X-Gm-Features: AcwNN1WhnjGTpiibewdiJK3Mk_rs30I3v44KSi3rLqFxnUif8AfdP06PkkoTFdU
Message-ID: <CAAhSdy1YQRsmJW7XTTp7vRc2LS5w9-Tc4JmcPpxPnmqqTtWTqg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Improve CPPC counter scalability via local emulation
To: Sunil V L <sunilvl@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_052455_497073_61856870 
X-CRM114-Status: GOOD (  10.36  )
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

T24gRnJpLCBKdWwgMywgMjAyNiBhdCAxMDozNeKAr0FNIFN1bmlsIFYgTCA8c3VuaWx2bEBvc3Mu
cXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IEZyb206IFN1bmlsIFYgTCA8c3VuaWx2bEBvc3MucXVh
bGNvbW0uY29tPgo+Cj4gVGhpcyBzZXJpZXMgaW1wcm92ZXMgdGhlIHNjYWxhYmlsaXR5IG9mIHRo
ZSBSUE1JLWJhc2VkIENQUEMgZHJpdmVyJ3MKPiBSRUZFUkVOQ0VfQ1RSIGFuZCBERUxJVkVSRURf
Q1RSIHJlZ2lzdGVycywgd2hpY2ggYXJlIHJlYWQgZnJlcXVlbnRseQo+IGJ5IENQVSBmcmVxdWVu
Y3kgZ292ZXJub3JzLgo+Cj4gQ3VycmVudGx5LCBldmVyeSByZWFkIG9mIHRoZXNlIGNvdW50ZXJz
IHNlbmRzIGFuIFJQTUkgbWVzc2FnZSB0byB0aGUKPiBjb250cm9sbGVyLiBTaW5jZSBSRUZFUkVO
Q0VfQ1RSIGNhbiBiZSBqdXN0IHRoZSBUSU1FIGNzciBhbmQsIHdoZW4gdGhlCj4gZmFzdCBjaGFu
bmVsIGlzIHN1cHBvcnRlZCwgREVMSVZFUkVEX0NUUiBjYW4gYmUgZGVyaXZlZCBmcm9tIHRoZQo+
IGN1cnJlbnQgZnJlcXVlbmN5IGV4cG9zZWQgdmlhIHRoZSBmYXN0IGNoYW5uZWwsIGJvdGggY2Fu
IGluc3RlYWQgYmUKPiBlbXVsYXRlZCBsb2NhbGx5IHdpdGhvdXQgYSByb3VuZCB0cmlwIHRvIHRo
ZSBjb250cm9sbGVyLgo+Cj4gU3VuaWwgViBMICgyKToKPiAgIGxpYi9zYmkvc2JpX3RpbWVyOiBB
ZGQgc2JpX3RpbWVyX2ZyZXF1ZW5jeSgpIGZ1bmN0aW9uCj4gICBsaWIvdXRpbHMvY3BwYzogRW11
bGF0ZSBSRUZFUkVOQ0VfQ1RSIGFuZCBERUxJVkVSRURfQ1RSIGxvY2FsbHkKCkxHVE0uCgpSZXZp
ZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmlhbmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBz
ZXJpZXMgdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKLS0gCm9wZW5z
YmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
