Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA419CD4851
	for <opensbi@archiver.kernel.org>; Fri, 15 May 2026 06:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zPYxKp9TwtRdKtddO48m4Ljgggiqjim1RES+PkDvBV4=; b=wGCXRvmyUpXQBH
	H0FIIWca1M09me0pbsanghnhDcVFVUi9QhaKtSjSHb9gYGq73jiywiBFQBHtXjWrmh2tVol3HYwq0
	iQgR12gkLZqUQpLHXpIUUH1Vj4nniZ7QUPso/4OzcFyNJFRo0ibF8jNLq+asDzgZK7EjSDJTx8xZn
	ZTmxx17d2fv/MDBxIlgih1i80lcjWg0rJzrukabphv5Y+Merc3cB+XDBpERIgsRnhTlf5Qqij0JsD
	JyiGOG6uPFq1FJfmiRxBBIYL1ASL0iKvxJkV9r5+vjYGuO3EDr1iZFNGfIh3QSfpN7496wVdLeXfM
	UjHKpP6hEa5ykZgjd6TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmT2-00000007Yyy-45B9;
	Fri, 15 May 2026 06:56:17 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmT0-00000007Yy9-1QfV
	for opensbi@lists.infradead.org;
	Fri, 15 May 2026 06:56:15 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7de7dc85b74so7363228a34.2
        for <opensbi@lists.infradead.org>; Thu, 14 May 2026 23:56:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778828173; cv=none;
        d=google.com; s=arc-20240605;
        b=XachcEovHXw3usg+ckEa9VZKwwDqxagq6nn2099BgcNfXz0lpJuRFx0WTFjwCyrXx1
         SM0t8Ig0GO/XdfXuOTZg+k4NWRZQ64yCxIOvexCtMFe6ygjGogxK6HwfVGcGh+uXJG+v
         9z6/eLm34bsNIQjdJcqSlWHaDCp+jzbfpPVor0G1DsPdm8AA16NwRX8bXxkk6ccUdZfU
         5FththLxfjVUntBR1BnBdNohBVjHz4luUmNAa8Z1nhstU3GFjv1tAU/egeiC/f4ap0aV
         xM9FwFySwLZJXGWbqzwUhRr8C2KDJAff/l//IJOUo6aLihcE+g5Op48eXGURdUNJzBNi
         V99w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2IOKb24LBNIhdkWypra3wdp3eJ6bldbqV7A2u6RlJyU=;
        fh=o330F0VRzeDGn8G7En02XypiR0pDT5iczpYI7E3mnOQ=;
        b=JuTqV9KSJuHZbl6XgbjeQTzbNDJuYuhJIEUS8g9N+G3E5x5K0duDD2AfdbhW7ON4d9
         PomhP/+hb7v5yjcZDPFBj7PA6CEbpw7ntPoKiX+8GPg432WYlDbQ4M1RoWMtQJDO5q1A
         kicBui1LbRLvIoa3Xsuz5PfMKIYf/uJKci4LfXxVyNJo0o9u6//eAuDu+kxArpM7c8w/
         wHYD099t8n+JCcWdc/yOisivFvaBKC4hGj9BCQWUDNnixj475Dtr1o64itDXfmaqQeTc
         8TjORivntTpARYDME45zZZGBUOnWYowxtGpu7YMSw2pKWH5rKT6Xmi71G0OrGfYym6L4
         DQ5g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778828173; x=1779432973; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2IOKb24LBNIhdkWypra3wdp3eJ6bldbqV7A2u6RlJyU=;
        b=TxqZNAwTxZXl7o133pSAD3PT+4D5e6Gj8f0INocIyy/mT/p/sw0weZhQ9YiLyplTR+
         99tQJ+QBYl1TKu3vRIVHQaWBcYS9TrhqLBfD6VMC1ehHzGHl2PAsQLQ+ym8MeE3Xvj0/
         97uE6oYZp2SAIV/6WnFU9F5vwF5P4bJI4fSW3IbHWcvm9EiYu6uLhw7grjfJ3vfHg1Ut
         ZsK4ZCIGUdIl2daYjCHVUMY8AGGmC2SzrbeEcENsADOdd6L9tOQnZR5BJXsZu8WXCbbh
         0W9ENQiZE/99lpzoK59HT0WYcXd8hmagFJc46vgK5VrKjmmcP6BliKAKhpbDe7vMmaQg
         f2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778828173; x=1779432973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2IOKb24LBNIhdkWypra3wdp3eJ6bldbqV7A2u6RlJyU=;
        b=MejL1omTXvjYHMboFNLBL4MB2I+1MEvfTpkAUp+/rPOXu4bqeWmR8/qhCVoweu9BDA
         HMMPf+gQ29EMy3mGgIkBL0gD+BnjtnP2ywLbTR+HnD3QQrVBFltUWXPLGVzrTUPl7lXG
         TG/PYXowrgeQ9qRlmFAtXm0KrswbRgiu9JOAky2prliRynmNB9h2CTtqvpd7AjWMEraT
         7quss6DPHGeN3jlrf1E9W/xE+smEMIYrA9V0ehnB/6PbMihlsyGwukDfjGZkCwye1mWX
         mqz6lWqAxXMrpRVvzanFCRQoYOln5Pim9/x+3DaTFjYyy1jcYMHxgPm9dKysB2/gd1Bj
         PiKA==
X-Forwarded-Encrypted: i=1; AFNElJ8nSHW0zA0dXbSqiLaQQ3pUTiX8Tu56hxOolvorTEs2/uEABNiuULhnDBQBONEh9+8gd0wOc85M@lists.infradead.org
X-Gm-Message-State: AOJu0YyW38tm4+dpaTMJlLEc0M9T5YuJAPata9cAB63rnc5XarNijue/
	hnPiqIUlvymkQURnNOlVooYCKMU09SceqqMI06/B1WGxKgCzl+W5sZkpb/AYYyQNTgi0LLQtt27
	6zAeCbPusfolH00BCwv08lQipMVfjiGPbVLkpWWvxhQ==
X-Gm-Gg: Acq92OH6QRKZG7OvERPXC3V3DCk+5UlaPQsUTykuZRTVqkKghJweSugmaSltZIUzAZ8
	lvmbESqYzdsjpe3Vj9hD3TBskFDTDNEDfi9DqNztMu0obM8jJM86FSZoolWc4PT2C6dIGBoIOHJ
	Bm+j0GL/kaVziF344Fhp8yqImmNBVQX/T+K3NlfMl+QRUF0Mm7pY69He1UAfloSH6GV8a1Ojv7C
	It0VcW7Eer1usvILKqRcww/8yDcUz9uxZOlRQ4yMp8U99mQNtE1Gs2CSstERfTJmSPgx9Cxu03a
	dwDVj78Yq+t48NQ0v899ReDGw3io0glce9J5x96kSXZbPdqWJ+FO0fxTKiCfEmsXKCYFh+A5yxK
	5C9hmxZlu3UPl90OrJQgMbMFSrrw=
X-Received: by 2002:a05:6820:1792:b0:696:6585:a4b with SMTP id
 006d021491bc7-69c942923fcmr1769711eaf.5.1778828172773; Thu, 14 May 2026
 23:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260515054208.151045-1-dave.patel@riscstar.com> <20260515054208.151045-2-dave.patel@riscstar.com>
In-Reply-To: <20260515054208.151045-2-dave.patel@riscstar.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 15 May 2026 12:26:01 +0530
X-Gm-Features: AVHnY4JH4U8qZY7UbzAOBq8_hQSD80bjLs1qbfbqv_bHb6LOc8Bqbs29LK9rghk
Message-ID: <CAAhSdy0aVvCxqprEGH_Rtz96QoYJtYRg6UYiv-ajPREwQ+Cxbg@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] lib: sbi: Add RISC-V vector context save/restore support
To: dave.patel@riscstar.com
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Anup Patel <anuppate@qti.qualcomm.com>, 
	Scott Bambrough <scott@riscstar.com>, Robin Randhawa <robin.randhawa@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Ray Mao <raymond.mao@riscstar.com>, 
	Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_235614_391757_1A4B87CC 
X-CRM114-Status: GOOD (  22.32  )
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

T24gRnJpLCBNYXkgMTUsIDIwMjYgYXQgMTE6MTLigK9BTSA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5j
b20+IHdyb3RlOgo+Cj4gRnJvbTogRGF2ZSBQYXRlbCA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20+
Cj4KPiBFYWdlciBjb250ZXh0IHN3aXRjaDogQWRkIHN1cHBvcnQgZm9yIHNhdmluZyBhbmQgcmVz
dG9yaW5nIFJJU0MtViB2ZWN0b3IKPiBleHRlbnNpb24gc3RhdGUgaW4gT3BlblNCSS4gVGhpcyBp
bnRyb2R1Y2VzIGEgcGVyLWhhcnQgdmVjdG9yIGNvbnRleHQKPiBzdHJ1Y3R1cmUgYW5kIGhlbHBl
ciByb3V0aW5lcyB0byBwZXJmb3JtIGZ1bGwgY29udGV4dCBzYXZlIGFuZCByZXN0b3JlLgo+Cj4g
VGhlIHZlY3RvciBjb250ZXh0IGluY2x1ZGVzIHZjc3IgQ1NScyBhbG9uZyB3aXRoIHN0b3JhZ2Ug
Zm9yIGFsbCAzMiB2ZWN0b3IKPiByZWdpc3RlcnMuIFRoZSByZWdpc3RlciBzdGF0ZSBpcyBzYXZl
ZCBhbmQgcmVzdG9yZWQgdXNpbmcgYnl0ZS13aXNlIHZlY3Rvcgo+IGxvYWQvc3RvcmUgaW5zdHJ1
Y3Rpb25zICh2czhyL3ZsOHIpLgo+Cj4gVGhlIGltcGxlbWVudGF0aW9uIGZvbGxvd3MgYW4gZWFn
ZXIgY29udGV4dCBzd2l0Y2hpbmcgbW9kZWwgd2hlcmUgdGhlIGVudGlyZQo+IHZlY3RvciBzdGF0
ZSBpcyBzYXZlZCBhbmQgcmVzdG9yZWQgb24gZXZlcnkgY29udGV4dCBzd2l0Y2guIFRoaXMgcHJv
dmlkZXMgYQo+IHNpbXBsZSBhbmQgZGV0ZXJtaW5pc3RpYyBtZWNoYW5pc20gd2l0aG91dCByZXF1
aXJpbmcgbGF6eSB0cmFwLWJhc2VkCj4gbWFuYWdlbWVudC4KPgo+IFNpZ25lZC1vZmYtYnk6IERh
dmUgUGF0ZWwgPGRhdmUucGF0ZWxAcmlzY3N0YXIuY29tPgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9z
YmlfdmVjdG9yLmggfCAgMjggKysrKysrKysrKwo+ICBsaWIvc2JpL29iamVjdHMubWsgICAgICAg
fCAgIDEgKwo+ICBsaWIvc2JpL3NiaV92ZWN0b3IuYyAgICAgfCAxMDkgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTM4IGluc2VydGlv
bnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvc2JpL3NiaV92ZWN0b3IuaAo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgbGliL3NiaS9zYmlfdmVjdG9yLmMKPgo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL3NiaS9zYmlfdmVjdG9yLmggYi9pbmNsdWRlL3NiaS9zYmlfdmVjdG9yLmgKPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwLi5iYmQ4NTdjMwo+IC0tLSAvZGV2L251
bGwKPiArKysgYi9pbmNsdWRlL3NiaS9zYmlfdmVjdG9yLmgKPiBAQCAtMCwwICsxLDI4IEBACj4g
Ky8qCj4gKyAqIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBCU0QtMi1DbGF1c2UKPiArICoKPiAr
ICogQ29weXJpZ2h0IChjKSAyMDI2IFJJU0NzdGFyIFNvbHV0aW9ucy4KPiArICoKPiArICogQXV0
aG9yczoKPiArICogICBEYXZlIFBhdGVsIDxkYXZlLnBhdGVsQHJpc2NzdGFyLmNvbT4KPiArICov
Cj4gKwo+ICsjaWZuZGVmIF9fU0JJX1ZFQ1RPUl9IX18KPiArI2RlZmluZSBfX1NCSV9WRUNUT1Jf
SF9fCj4gKwo+ICsjaW5jbHVkZSA8c2JpL3NiaV90eXBlcy5oPgo+ICsKPiArc3RydWN0IHNiaV92
ZWN0b3JfY29udGV4dCB7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIHZjc3I7Cj4gKyAgICAgICB1
bnNpZ25lZCBsb25nIHZzdGFydDsKPiArCj4gKyAgICAgICAvKiBzaXplIGRlcGVuZHMgb24gVkxF
TiAqLwo+ICsgICAgICAgdWludDhfdCB2cmVnc1tdOwo+ICt9Owo+ICsKPiArdm9pZCBzYmlfdmVj
dG9yX3NhdmUoc3RydWN0IHNiaV92ZWN0b3JfY29udGV4dCAqZHN0KTsKPiArdm9pZCBzYmlfdmVj
dG9yX3Jlc3RvcmUoY29uc3Qgc3RydWN0IHNiaV92ZWN0b3JfY29udGV4dCAqc3JjKTsKPiArdW5z
aWduZWQgbG9uZyB2ZWN0b3JfdmxlbmIodm9pZCk7Cj4gKwo+ICsjZW5kaWYgLy9fX1NCSV9WRUNU
T1JfSF9fCj4gKwoKUmVkdW5kYW50IG5ld2xpbmUgaGVyZS4KCj4gZGlmZiAtLWdpdCBhL2xpYi9z
Ymkvb2JqZWN0cy5tayBiL2xpYi9zYmkvb2JqZWN0cy5tawo+IGluZGV4IDk3Y2M0NTIxLi5kZGIy
ZTdhYyAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL29iamVjdHMubWsKPiArKysgYi9saWIvc2JpL29i
amVjdHMubWsKPiBAQCAtMTA5LDMgKzEwOSw0IEBAIGxpYnNiaS1vYmpzLXkgKz0gc2JpX3RyYXBf
dl9sZHN0Lm8KPiAgbGlic2JpLW9ianMteSArPSBzYmlfdW5wcml2Lm8KPiAgbGlic2JpLW9ianMt
eSArPSBzYmlfZXhwZWN0ZWRfdHJhcC5vCj4gIGxpYnNiaS1vYmpzLXkgKz0gc2JpX2NwcGMubwo+
ICtsaWJzYmktb2Jqcy15ICs9IHNiaV92ZWN0b3Iubwo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3Ni
aV92ZWN0b3IuYyBiL2xpYi9zYmkvc2JpX3ZlY3Rvci5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
PiBpbmRleCAwMDAwMDAwMC4uMWQyYWM5NDQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvbGliL3Ni
aS9zYmlfdmVjdG9yLmMKPiBAQCAtMCwwICsxLDEwOSBAQAo+ICsvKgo+ICsgKiBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogQlNELTItQ2xhdXNlCj4gKyAqCj4gKyAqIENvcHlyaWdodCAoYykgMjAy
NiBSSVNDc3RhciBTb2x1dGlvbnMuCj4gKyAqCj4gKyAqIEF1dGhvcnM6Cj4gKyAqICAgICAgRGF2
ZSBQYXRlbCA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20+Cj4gKyAqLwo+ICsKPiArI2luY2x1ZGUg
PHNiaS9zYmlfZG9tYWluLmg+Cj4gKyNpbmNsdWRlIDxzYmkvcmlzY3ZfZW5jb2RpbmcuaD4KPiAr
I2luY2x1ZGUgPHNiaS9yaXNjdl9hc20uaD4KPiArI2luY2x1ZGUgPHNiaS9zYmlfdmVjdG9yLmg+
Cj4gKyNpbmNsdWRlIDxzYmkvc2JpX3R5cGVzLmg+Cj4gKyNpbmNsdWRlIDxzYmkvc2JpX2hhcnQu
aD4KPiArI2luY2x1ZGUgPHNiaS9zYmlfZXJyb3IuaD4KPiArI2luY2x1ZGUgPHNiaS9zYmlfY29u
c29sZS5oPgo+ICsKPiArI2lmZGVmIE9QRU5TQklfQ0NfU1VQUE9SVF9WRUNUT1IKPiArCj4gK3Vu
c2lnbmVkIGxvbmcgdmVjdG9yX3ZsZW5iKHZvaWQpCj4gK3sKPiArICAgICAgIHVuc2lnbmVkIGxv
bmcgdmxlbmIgPSAwOwo+ICsKPiArICAgICAgIGFzbSB2b2xhdGlsZSAoCj4gKyAgICAgICAgICAg
ICAgICIub3B0aW9uIHB1c2hcblx0Igo+ICsgICAgICAgICAgICAgICAiLm9wdGlvbiBhcmNoLCAr
dlxuXHQiCj4gKyAgICAgICAgICAgICAgICJjc3JyICUwLCB2bGVuYlxuXHQiCj4gKyAgICAgICAg
ICAgICAgICIub3B0aW9uIHBvcFxuXHQiCj4gKyAgICAgICAgICAgICAgIDogIj1yIih2bGVuYikK
PiArICAgICAgICAgICAgICAgOgo+ICsgICAgICAgICAgICAgICA6ICJtZW1vcnkiKTsKPiArCj4g
KyAgICAgICByZXR1cm4gdmxlbmI7Cj4gK30KPiArCj4gK3ZvaWQgc2JpX3ZlY3Rvcl9zYXZlKHN0
cnVjdCBzYmlfdmVjdG9yX2NvbnRleHQgKmRzdCkKPiArewo+ICsgICAgICAgaWYgKCFkc3QpCj4g
KyAgICAgICAgICAgICAgIHJldHVybjsKPiArCj4gKyAgICAgICAvKiBTdGVwIDE6IFNhdmUgQ1NS
cyAqLwo+ICsgICAgICAgZHN0LT52Y3NyID0gY3NyX3JlYWQodmNzcik7Cj4gKyAgICAgICBkc3Qt
PnZzdGFydCA9IGNzcl9yZWFkKHZzdGFydCk7Cj4gKwo+ICsgICAgICAgdWxvbmcgdmxlbmIgPSB2
ZWN0b3JfdmxlbmIoKTsKPiArICAgICAgIHVpbnQ4X3QgKmJhc2UgPSBkc3QtPnZyZWdzOwo+ICsK
PiArICAgICAgIC8qIFN0ZXAgMzogU2F2ZSB2ZWN0b3IgcmVnaXN0ZXJzICovCj4gKyNkZWZpbmUg
U0FWRV9WUkVHKGkpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
PiArICAgICAgICh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXAo+ICsgICAgICAgYXNtIHZvbGF0aWxlKCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICIgICAgICAgLm9wdGlvbiBw
dXNoXG5cdCIgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgIiAgICAg
ICAub3B0aW9uIGFyY2gsICt2XG5cdCIgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAg
ICAgICAiICAgICAgIHZzOHIudiB2IiAjaSAiLCAoJTApXG5cdCIgICAgICAgICAgICAgICBcCj4g
KyAgICAgICAgICAgICAgICIgICAgICAgLm9wdGlvbiBwb3Bcblx0IiAgICAgICAgICAgICAgICAg
ICAgICAgIFwKPiArICAgICAgICAgICAgICAgOjogICAgICAiciIoYmFzZSArIChpKSAqIHZsZW5i
KSA6ICJtZW1vcnkiKTsgICAgXAo+ICsgICAgICAgfSkgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKwo+ICsgICAgICAgU0FWRV9WUkVHKDAp
Owo+ICsgICAgICAgU0FWRV9WUkVHKDgpOwo+ICsgICAgICAgU0FWRV9WUkVHKDE2KTsKPiArICAg
ICAgIFNBVkVfVlJFRygyNCk7Cj4gKwo+ICsjdW5kZWYgU0FWRV9WUkVHCj4gK30KPiArCj4gK3Zv
aWQgc2JpX3ZlY3Rvcl9yZXN0b3JlKGNvbnN0IHN0cnVjdCBzYmlfdmVjdG9yX2NvbnRleHQgKnNy
YykKPiArewo+ICsgICAgICAgaWYgKCFzcmMpCj4gKyAgICAgICAgICAgICAgIHJldHVybjsKPiAr
Cj4gKyAgICAgICBjb25zdCB1aW50OF90ICpiYXNlID0gc3JjLT52cmVnczsKPiArICAgICAgIHVs
b25nIHZsZW5iID0gdmVjdG9yX3ZsZW5iKCk7Cj4gKwo+ICsgICAgICAgLyogU3RlcCAyOiBSZXN0
b3JlIHZlY3RvciByZWdpc3RlcnMgKi8KPiArI2RlZmluZSBSRVNUT1JFX1ZSRUcoaSkgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgKHsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICBh
c20gdm9sYXRpbGUoICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
PiArICAgICAgICAgICAgICAgIiAgICAgICAub3B0aW9uIHB1c2hcblx0IiAgICAgICAgICAgICAg
ICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICAiICAgICAgIC5vcHRpb24gYXJjaCwgK3Zcblx0
IiAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICIgICAgICAgdmw4ci52IHYi
ICNpICIsICglMClcblx0IiAgICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgIiAgICAg
ICAub3B0aW9uIHBvcFxuXHQiICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAg
ICAgICA6OiAgICAgICJyIihiYXNlICsgKGkpICogdmxlbmIpIDogIm1lbW9yeSIpOyAgICBcCj4g
KyAgICAgICAgfSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKPiArCj4gKyAgICAgICBSRVNUT1JFX1ZSRUcoMCk7Cj4gKyAgICAgICBSRVNUT1JF
X1ZSRUcoOCk7Cj4gKyAgICAgICBSRVNUT1JFX1ZSRUcoMTYpOwo+ICsgICAgICAgUkVTVE9SRV9W
UkVHKDI0KTsKPiArI3VuZGVmIFJFU1RPUkVfVlJFRwo+ICsKPiArICAgICAgIC8qIFN0ZXAgMzog
UmVzdG9yZSBDU1IncyBsYXN0ICovCj4gKyAgICAgICAvKiBSZXN0b3JlIENTUnMgZmlyc3QgKi8K
PiArICAgICAgIGNzcl93cml0ZSh2Y3NyLCAgIHNyYy0+dmNzcik7Cj4gKyAgICAgICBjc3Jfd3Jp
dGUodnN0YXJ0LCBzcmMtPnZzdGFydCk7Cj4gK30KPiArCj4gKyNlbHNlCj4gKwo+ICt2b2lkIHNi
aV92ZWN0b3Jfc2F2ZShzdHJ1Y3Qgc2JpX3ZlY3Rvcl9jb250ZXh0ICpkc3QpCj4gK3sKPiArfQo+
ICsKPiArdm9pZCBzYmlfdmVjdG9yX3Jlc3RvcmUoY29uc3Qgc3RydWN0IHNiaV92ZWN0b3JfY29u
dGV4dCAqc3JjKQo+ICt7Cj4gK30KPiArCj4gKyNlbmRpZiAvKiBPUEVOU0JJX0NDX1NVUFBPUlRf
VkVDVE9SICovCj4gLS0KPiAyLjQzLjAKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+
IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKT3RoZXJ3aXNlLCBpdCBsb29rcyBnb29kIHRvIG1l
LiBJIHdpbGwgdGFrZSBjYXJlIG9mIGFib3ZlCmlzc3VlIGF0IHRoZSB0aW1lIG9mIG1lcmdpbmcu
CgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClRoYW5rcywK
QW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
