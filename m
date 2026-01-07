Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0722CCFD652
	for <opensbi@archiver.kernel.org>; Wed,  7 Jan 2026 15:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QIeQshd7gC9zoruhQYtewAJyVk+Cm4oasoo23chHD5A=; b=Niv99bk2P8OPd9
	aGWD2+r7xOpgDopDx1mOmuy7zp/R9QPtrSAwDEC7j5BcaqYuCmFLoboPceU4Wv9PHeZcMUE+sfoFI
	M7sL5vaPME77dJ3U+yOHkYoCm5/vjAcYIP4JTb7xedwIki5TrzRj7OEGWiI8loROPRWbC/82gHE5x
	iZkq1wg0uIaYBV1vjbqzL8bfzbR3/ZiBG5OEb0mjhAJZVCLgJy8JBywIGOkWPitgEFM+2sp9d4MKe
	ypILrD3Dg9OEKz+Nq/SXmQDLAm81641xxyrcC9v7wumz+xdi6RMR3jEkFHEm1A+JO3lxyVqhFLbGt
	5J8hcPuQbHmPTjQnSZ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdVNV-0000000FAXg-3eQo;
	Wed, 07 Jan 2026 15:23:17 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdVNS-0000000FAXB-1hmu
	for opensbi@lists.infradead.org;
	Wed, 07 Jan 2026 15:23:16 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-65d1bff2abaso1310186eaf.1
        for <opensbi@lists.infradead.org>; Wed, 07 Jan 2026 07:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1767799393; x=1768404193; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=al5ngyHOhBMvzT6/TqZHh2u76DM5RrjT2OX3IJk/l5Y=;
        b=KVn4y2O4I2uMc9mkGpLQB6uV0NS744XDY0awX3obEbd1Pt0zuNmb66buI5QtXzhw3F
         KMpESDs1UjXlSGphu7AasLQeBkC9kOKi1TMsekfEYsqskQMS2F5bPTG/BipoEhHDMycX
         6StaHeMWo8wA8uGwyK8BFQOjdMKxgacZLn2VgbLt8899JeoycQvuFqoKWorQ7UQ4fLIt
         KcCZIMOyxoBc+EEAPfPRT+KYyCZYftDSTGkfOfQNDwKRXWld0RTjrmS1TXU5rBucgnyq
         Eq3qRTpjnDv8InXetNzoHD6sDU+amfREpWjOBOShxHzfJK/ZvQrCseLfY+2DUI8h8PIa
         wgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767799393; x=1768404193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=al5ngyHOhBMvzT6/TqZHh2u76DM5RrjT2OX3IJk/l5Y=;
        b=rDgIcpIHH4yvFUgDSDliVSTu0xsPCyrWPDllYDND5ALe4AOvC5GWxPMCWHGKx/A5Lh
         XzET2menC9uKRk2Pb6BmaN54auIFg1jOPn9xgLiXnroaeLdc9Zmqvk4Fc1k2IwRr4kRk
         DOGYi+GQXSo1OwdSZM5aLswYi1c7FwJxjMOOKUGFE00cZ/TkUGU6uTWJWEh3z47Uqm3c
         +bDn+AgG5pqqBiSajhJ/l0Djq0fu/bHvsGTesszipU3HP9Ah7VXl9KeFT4jcoGUOSa+/
         og40YpXR5DPgt6y/4MiIuLxg0hkADQtKT6TEgqeLbSH48DG8PfN+x9yuRSVxr4c64n4F
         v8AA==
X-Gm-Message-State: AOJu0YxOGx6gRoWWqwsHxhXCZRzD8jIW0yh+km2lM8YdddR6qZjNmCJ3
	lD/UiS6Pn4tTT/CUVVHTahoG3sTsj15mxtOq0SezlFxTDGbJwtPhmNh7JgW9i0VUWP9vQfQ4YRt
	h8eH7GU0uQ8yPokJid3dn9MjFS9KiKdBEk9M3G1cWD1r2l9JyBM0vfzV29BLa
X-Gm-Gg: AY/fxX6KR79DmrbS5GSXat7iMVpD0uIMNw3k5HRXfTL5b4VpdmPifYH43eZkoemCusZ
	FiblbjRvtjOQNiWs8mok8FwbtQJhizlTBGtJDYVp/gzvXUs3eDNtCPhg2I4XMwU2/LIvJnwl++M
	UVArP5uf7UNKy1JZK1/GrDaPHcJIYQWsW9rB1GS9laZqQLg+hgSV0e6xeocfkwAO6XW1qMgzFhf
	Ww7+5lJAjpS4XPZfRJ0Sww5ABa3vbaC5YQN0x33MYH2NMkEns3viRmjqthsAuU+WK6ThjT/79Qn
	LIfttIIf9PFOcr0/rGI7OfCrm/iAN98Vl8JE3vk6uvrEJfHzp1QywAPzxw2L71GU7emMJg==
X-Google-Smtp-Source: AGHT+IGsf58767BV97PTLDtN6FO9vru4VAFsZVBRt2OQjH2RXMpnED1s25FcsXYVtaMD6zDS71HkE4sl2NmhTIKj45w=
X-Received: by 2002:a05:6820:168b:b0:659:9a49:8e96 with SMTP id
 006d021491bc7-65f54ef7f6amr1113754eaf.26.1767799392982; Wed, 07 Jan 2026
 07:23:12 -0800 (PST)
MIME-Version: 1.0
References: <ff5d68f0fde594396300323736416063152dcb2a.1767797338.git.michal.simek@amd.com>
In-Reply-To: <ff5d68f0fde594396300323736416063152dcb2a.1767797338.git.michal.simek@amd.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 7 Jan 2026 20:53:02 +0530
X-Gm-Features: AQt7F2pdG8FVfjz1H3D2gPEu6bJc5hQ7rtahq8rJUrJMV5i99P4-ZNUIzkmVDO8
Message-ID: <CAAhSdy2g2hQUQLDBhkuCjAFv3nCRge-ppYb1pa-2MVxmzBE0YQ@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: Fix behavior on platform without HART protection
To: Michal Simek <michal.simek@amd.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_072314_584958_A9C8AEA5 
X-CRM114-Status: GOOD (  18.16  )
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

T24gV2VkLCBKYW4gNywgMjAyNiBhdCA4OjIw4oCvUE0gTWljaGFsIFNpbWVrIDxtaWNoYWwuc2lt
ZWtAYW1kLmNvbT4gd3JvdGU6Cj4KPiBUaGUgY29tbWl0IDQyMTM5YmI5YjdkYyAoImxpYjogc2Jp
OiBSZXBsYWNlIHNiaV9oYXJ0X3BtcF94eXooKSBhbmQKPiBzYmlfaGFydF9tYXAvdW5tYXBfYWRk
cigpIikgY2hhbmdlZCBsb2dpYyBieSBjYWxsaW5nCj4gc2JpX2hhcnRfcHJvdGVjdGlvbl9jb25m
aWd1cmUoKS4gQnV0IHdoZW4gcHJvdGVjdGlvbiBkb2Vzbid0IGV4aXN0IHRoZQo+IGZ1bmN0aW9u
IGlzIHJldHVybmluZyBTQklfRUlOVkFMLgo+IEJ1dCBvbiBzeXN0ZW1zIHdpdGhvdXQgcHJvdGVj
dGlvbiB0aGlzIGlzIGNvcnJlY3QgY29uZmlndXJhdGlvbiB0aGF0J3Mgd2h5Cj4gZG8gbm90IGhh
bmcgd2hlbiBzeXN0ZW0gZG9uJ3QgaGF2ZSBhbnkgSEFSVCBwcm90ZWN0aW9uLgo+CgpQbGVhc2Ug
YWRkIGEgRml4ZXMgdGFnIGhlcmUuCgo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBTaW1layA8bWlj
aGFsLnNpbWVrQGFtZC5jb20+Cj4gLS0tCj4KPiAgbGliL3NiaS9zYmlfaGFydF9wcm90ZWN0aW9u
LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2hhcnRfcHJvdGVjdGlvbi5jIGIvbGliL3Ni
aS9zYmlfaGFydF9wcm90ZWN0aW9uLmMKPiBpbmRleCAzMDZmNWFmYmRhZWEuLjQzZTY1YTM4Y2Zj
YyAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9oYXJ0X3Byb3RlY3Rpb24uYwo+ICsrKyBiL2xp
Yi9zYmkvc2JpX2hhcnRfcHJvdGVjdGlvbi5jCj4gQEAgLTU0LDcgKzU0LDcgQEAgaW50IHNiaV9o
YXJ0X3Byb3RlY3Rpb25fY29uZmlndXJlKHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkKPiAg
ICAgICAgIHN0cnVjdCBzYmlfaGFydF9wcm90ZWN0aW9uICpocHJvdCA9IHNiaV9oYXJ0X3Byb3Rl
Y3Rpb25fYmVzdCgpOwo+Cj4gICAgICAgICBpZiAoIWhwcm90KQo+IC0gICAgICAgICAgICAgICBy
ZXR1cm4gU0JJX0VJTlZBTDsKPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7CgpJbiBhZGRpdGlv
biB0byBzYmlfaGFydF9wcm90ZWN0aW9uX2NvbmZpZ3VyZSgpLCB0aGUKc2JpX2hhcnRfcHJvdGVj
dGlvbl9tYXBfcmFuZ2UoKSBhbmQKc2JpX2hhcnRfcHJvdGVjdGlvbl91bm1hcF9yYW5nZSgpIGZ1
bmN0aW9ucwptdXN0IGFsc28gcmV0dXJuIDAgaW5zdGVhZCBvZiBTQklfRUlOVkFMIGJlY2F1c2UK
Y2FsbGVycyBvZiB0aGVzZSBmdW5jdGlvbnMgZG9uJ3QgY2hlY2sgd2hldGhlcgpoYXJ0IHByb3Rl
Y3Rpb24gbWVjaGFuaXNtIGlzIGF2YWlsYWJsZSBvciBub3QuCgo+ICAgICAgICAgaWYgKCFocHJv
dC0+Y29uZmlndXJlKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VOT1NZUzsKPgo+IC0t
Cj4gMi40My4wCj4KPiBiYXNlLWNvbW1pdDogZTdmYTY2YzIxNjBlYzEzOWRlMTg1M2EwMGY2Njlj
MDkzMjBhOTI1Ngo+IGJyYW5jaDogdHJhY2sKPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QK
PiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKClJlZ2FyZHMsCkFudXAKCi0tIApvcGVuc2JpIG1h
aWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
