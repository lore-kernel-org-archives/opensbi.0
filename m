Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A791AC9833F
	for <opensbi@archiver.kernel.org>; Mon, 28 Sep 2026 13:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bl8d0jPG6Q/zuzwWB/A+Cos5g22IOyby+5fdhK/5R6I=; b=xs8dNHNy9XJAZe
	OPYEmLWiC7iIsK76TCQBbe8WmxOtxHkBY7fr15LlcMVz47ch3U99iGe8HFVOl/V2HuT/gsomgbD8L
	gEVvwFvk+B3dt+moM2QgOf4yMcTAIdry370wkJjHd7lpg6zQ5tvWNFt55yPZL3kwtnH6tQFZEbpZs
	aeqbL//AZBvRjkhnmJDAMo8btT+lAU5qSVqInYchDjy5SdbK1PPj8ICe33uO3nfz5zZphXVWZVc9X
	CgzrWijmKMRc9VuAlpGzKQgud+IPDpXyAS+EW4Dxo/7jAjR0hTDbN2W4bjRLSvFENe8QixLkA9W2/
	2vdeLitLcTvfCOCeoKcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBV5-00000000fTz-1ies;
	Mon, 28 Sep 2026 13:34:35 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBV0-00000000fTX-1mWH
	for opensbi@lists.infradead.org;
	Mon, 28 Sep 2026 13:34:34 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f63546c5so2733396f8f.2
        for <opensbi@lists.infradead.org>; Mon, 28 Sep 2026 06:34:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790602468; cv=none;
        d=google.com; s=arc-20260327;
        b=Y+IP5OHTduCeczq2pGWNZnCKjitHRbuYV8dcDT9H8OqSbkhAZyoMcqrOM01r11v4kq
         CR8yDnJvg/db+CbzIIMbWuUFuzq+cjObM9IVo06XZrUTud+oAE8MXYMab53I8NOacQPZ
         Rpng86+SPe+f0u7W/HSQsQRWXeIkpidSr67/B9l2ukuVuVROEwLM5yFqFia9tvhIPlFs
         fcigp1IFrO3rMTDD9M87An2CMUFiUa8x95jXjbnQhoFhv740j3aN6xgbMHVKnZM1etMj
         zy4m28jlhsGEVphWkw8XX6s9D/X/iBJ7v1Tw7SVprJzF2UW2h4PUPCn6/tRuZI21ffC3
         So3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I6Isdo+P1E2CAsROPPxdoZaOGzCjgXKHL/wL7HBxDIc=;
        fh=tS0wfGmwcvSiP6CKVlnw1CPNC300j5L0stMF+8xfeRI=;
        b=pnPGUP4CGH+yd063pEEwMyTDSlfmBnIiGQk7gCLHl9N+H94qOVHfcV+22T6MK63TyU
         mfMu6uH6F88ZkMimfguOD1u3SVvP1XB1sJ/U//KDpP1MLnCU1GmFNnmVzLJ1xwIqmx4B
         WJsj4JUaUGgfc4wXRcGOvgXmL5+8avNnjB5UKYzB3G2jONLctLZ9N9N/PNd8CArIRoa6
         TlSiSWsjEtWc6DzlvCz/vGs6hIcRCKeMJ4c7vmr8lODyqDdUblBl8yIqHnLY0ikSeQ1G
         yqcZy5vPunSAdpVjYS+qFnXQaU0vpMzi9yKGOlBtZhW4LpdbcpXL/JYNkyCM4BcaPPqb
         6uLA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1790602468; x=1791207268; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I6Isdo+P1E2CAsROPPxdoZaOGzCjgXKHL/wL7HBxDIc=;
        b=LNSX44t4ZTGW48m0ClNrT0kobkl7spYQZncaAQL66r/5W/AVRUH1iw4TlsPK6mywmN
         /jfJz6o2nBDwHcRolDBHiAPaqe27xnSoaAqZBgJOM+BICveKUVs4MQnYKI1vlQzWcHrC
         dOaN3q4gRK+TtP5HgTNIITIG3ly5DT32gZrj3wtHzDESfs2+QX/x3AS3WzVX9Jppcd6I
         Fi9j+vioG/nGQxOke9GPoK7noryICFVKJKRaqtP4kSc7iIII28/rZbB2h7J21pNfNUcF
         IyRzZlmPfxUhJJu211kiC1sO81Z/kEGjjlwBHpDfmoia4jt0L9pYmnW6JcyMVlD84rO1
         CcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790602468; x=1791207268;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6Isdo+P1E2CAsROPPxdoZaOGzCjgXKHL/wL7HBxDIc=;
        b=at+GPny3wuMGWY3jEul0Bzjc/32QojtbYvJI53leWo4g07O3OxXWkcMgKrXDH1y/l7
         tTF/6lRe9tKLiKsVq4J5HOwf8dCbgBYiYSeMlWrD1A4+k3sXh6e/CoWLDHXH7r880xt5
         KM7tj342a2dIh4RkJPTolDFpbdeK/UnC+yNNqbxExYE8d09enm1K1ITHJdMAUUFVLTrh
         4l/JlJO4SURXZvdjzuamx3dXC3t29586w6i6LX8uBT5+niT3cGWUF+TA9ya9UL7R3rY/
         iUZwCriTpGb0f3Pgph43F1txpmhbyMnCZ+M4fO8alzUDwKLLKAAlxIq2ivqV2wc1mWUJ
         UMgA==
X-Gm-Message-State: AFq9FYJiHJxcD3/sysW9QPayeaWAWlabJfpj1qNqxYlmtC1Qw1CZqQZg
	spjC1NtRcqZij+HMO35BP8S7cSAgaJ2duSZhlUwonc02wdKLYuWFoaAFkf9pANEGHtCQR6tK7RW
	+VwkGmTwOTe1q4PiDKjQIVRLKQHB8ONa3MNu0+iS2eb3ju+9pJw+H
X-Gm-Gg: AYBFou3Utg8fsgYVHA7Dox2hX8tpY88nYQsAZ/wIjuc+D8auC5E0GZR9X7h7ILTlqGK
	q8NoifOJj/FCZF6XIrodnDrLs9nZA02f+QOjaxEhn+ThdDEg4copA4Kvv6Fbg+19rEvW9Xr547a
	fKldUFyYfMGhNeEcHkkAYE+0ftCXKRW2uxfMx0gxU9LUMZP/LiC9d9Gl4M5KAOiZev6md3Palg7
	UAxU8MhGGuCAwkVLmwFWucVIRWwBimZF1KOGgYxPcrW0Lmq7Jv/8B3zznjce+vQ5Zvv2JIW8OKh
	JDwr5sw6PHsR0EfwLzMwfqi+tdGI0Gt38OY2MiSvlt+S0WbdBz+8TSjPX0s7x1XYi/AO+oAnsb5
	ZhWLj4swQDis9qOBzvopGeFcJ/zuipZmtN/myMygen+lc+k7urtofeFtOhxSmzAaIoOwkkINjD9
	I=
X-Received: by 2002:a05:6000:2008:b0:486:e300:a0c3 with SMTP id
 ffacd0b85a97d-48871714777mr26058887f8f.12.1790602468574; Mon, 28 Sep 2026
 06:34:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260821101339.3563598-1-alvinga@andestech.com>
In-Reply-To: <20260821101339.3563598-1-alvinga@andestech.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Sep 2026 19:04:15 +0530
X-Gm-Features: AclHuK9Q1smkfd8N3zqZlYN6w8TfpXeLnS5bSbUGUZGvRXjblvPb6wmYnfQKd0M
Message-ID: <CAAhSdy2dzjiTkS+=PrcmEoofU_w8NsdrbGSCX18rpKHhNhBn3Q@mail.gmail.com>
Subject: Re: [PATCH] firmware: payload: test: Relocate GOT entries before
 calling C code
To: Alvin Chang <alvinga@andestech.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_063430_498549_75631072 
X-CRM114-Status: GOOD (  22.80  )
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

T24gRnJpLCBBdWcgMjEsIDIwMjYgYXQgMzo0M+KAr1BNIEFsdmluIENoYW5nIDxhbHZpbmdhQGFu
ZGVzdGVjaC5jb20+IHdyb3RlOgo+Cj4gVGhlIHRlc3QgcGF5bG9hZCBpcyBsaW5rZWQgYXMgYSBQ
SUUgYnV0LCB1bmxpa2UgZndfYmFzZS5TLCBpdHMgc3RhcnR1cAo+IGNvZGUgbmV2ZXIgcHJvY2Vz
c2VkIGl0cyBvd24gZHluYW1pYyByZWxvY2F0aW9ucy4gTm90aGluZyBpbiB0aGUgcGF5bG9hZAo+
IG5lZWRlZCBhIEdPVCBzbyBmYXIsIHNvIHRoaXMgd2VudCB1bm5vdGljZWQuCj4KPiBDT05GSUdf
U1RBQ0tfUFJPVEVDVE9SX0FMTD15IGNoYW5nZXMgdGhhdC4gR0NDIGRlcml2ZXMgdGhlCj4gX19z
dGFja19jaGtfZ3VhcmQgcmVmZXJlbmNlIGZyb20gYW4gYXJ0aWZpY2lhbCBkZWNsYXJhdGlvbiB3
aXRoIGRlZmF1bHQKPiB2aXNpYmlsaXR5LCBzbyB1bmRlciAtZlBJRSBpdCBhbHdheXMgbG9hZHMg
dGhlIGd1YXJkIGFkZHJlc3MgdGhyb3VnaCB0aGUKPiBHT1QuIFRoZSBsaW5rZXIgemVyb2VzIHRo
YXQgZW50cnkgYW5kIHJlY29yZHMgYW4gUl9SSVNDVl9SRUxBVElWRQo+IHJlbG9jYXRpb24gaW5z
dGVhZCwgd2hpY2ggbm9ib2R5IGFwcGxpZXMuIHRlc3RfbWFpbigpIHRoZW4gcmVhZHMgdGhlCj4g
Y2FuYXJ5IGZyb20gYSBOVUxMIHBvaW50ZXIgYmVmb3JlIHRoZSBmaXJzdCBzYmlfZWNhbGxfY29u
c29sZV9wdXRzKCksIHNvCj4gdGhlIHBheWxvYWQgaGFuZ3Mgc2lsZW50bHkgcmlnaHQgYWZ0ZXIg
dGhlIE9wZW5TQkkgYm9vdCBiYW5uZXIuIFRoZSBvdGhlcgo+IHR3byBjb25maWd1cmF0aW9ucyBl
bWl0IG5vIGNhbmFyeSBpbiB0aGUgcGF5bG9hZCwgbGVhdmluZyAucmVsYS5keW4KPiBlbXB0eSwg
d2hpY2ggaXMgd2h5IG9ubHkgdGhpcyBvbmUgYnJlYWtzLgo+Cj4gS2VlcCAucmVsYS5keW4gaW4g
dGhlIHBheWxvYWQgaW1hZ2UgYW5kIGFwcGx5IHRoZSBSX1JJU0NWX1JFTEFUSVZFCj4gZW50cmll
cyBhdCB0aGUgdG9wIG9mIF9zdGFydCwgcmV1c2luZyB0aGUgY29kZSBmcm9tIGZ3X2Jhc2UuUy4g
VGhlIGxvb3AKPiBpcyBza2lwcGVkIHdoZW4gLnJlbGEuZHluIGlzIGVtcHR5Lgo+Cj4gRml4ZXM6
IGVkZmJjMTI4NWRkOSAoImZpcm13YXJlOiBJbml0aWFsIGNvbXBpbGVyIGJ1aWx0LWluIHN0YWNr
IHByb3RlY3RvciBzdXBwb3J0IikKPiBSZXBvcnRlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFp
bmZhdWx0Lm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBBbHZpbiBDaGFuZyA8YWx2aW5nYUBhbmRlc3Rl
Y2guY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQu
b3JnPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFu
a3MsCkFudXAKCj4gLS0tCj4gIGZpcm13YXJlL3BheWxvYWRzL3Rlc3QuZWxmLmxkUyB8ICA2ICsr
KysrKwo+ICBmaXJtd2FyZS9wYXlsb2Fkcy90ZXN0X2hlYWQuUyAgfCAzMCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCj4K
PiBkaWZmIC0tZ2l0IGEvZmlybXdhcmUvcGF5bG9hZHMvdGVzdC5lbGYubGRTIGIvZmlybXdhcmUv
cGF5bG9hZHMvdGVzdC5lbGYubGRTCj4gaW5kZXggMjMyOGExYjcuLjY2MzJjMTMyIDEwMDY0NAo+
IC0tLSBhL2Zpcm13YXJlL3BheWxvYWRzL3Rlc3QuZWxmLmxkUwo+ICsrKyBiL2Zpcm13YXJlL3Bh
eWxvYWRzL3Rlc3QuZWxmLmxkUwo+IEBAIC00Nyw2ICs0NywxMiBAQCBTRUNUSU9OUwo+ICAgICAg
ICAgICAgICAgICBQUk9WSURFKF9yb2RhdGFfZW5kID0gLik7Cj4gICAgICAgICB9Cj4KPiArICAg
ICAgIC5yZWxhLmR5biA6IHsKPiArICAgICAgICAgICAgICAgUFJPVklERShfX3JlbGFfZHluX3N0
YXJ0ID0gLik7Cj4gKyAgICAgICAgICAgICAgICooLnJlbGEqKQo+ICsgICAgICAgICAgICAgICBQ
Uk9WSURFKF9fcmVsYV9keW5fZW5kID0gLik7Cj4gKyAgICAgICB9Cj4gKwo+ICAgICAgICAgLyog
RW5kIG9mIHRoZSByZWFkLW9ubHkgZGF0YSBzZWN0aW9ucyAqLwo+Cj4gICAgICAgICAuID0gQUxJ
R04oMHgxMDAwKTsgLyogRW5zdXJlIG5leHQgc2VjdGlvbiBpcyBwYWdlIGFsaWduZWQgKi8KPiBk
aWZmIC0tZ2l0IGEvZmlybXdhcmUvcGF5bG9hZHMvdGVzdF9oZWFkLlMgYi9maXJtd2FyZS9wYXls
b2Fkcy90ZXN0X2hlYWQuUwo+IGluZGV4IGU0ZmNhYWNhLi4wOWQwYWQxOCAxMDA2NDQKPiAtLS0g
YS9maXJtd2FyZS9wYXlsb2Fkcy90ZXN0X2hlYWQuUwo+ICsrKyBiL2Zpcm13YXJlL3BheWxvYWRz
L3Rlc3RfaGVhZC5TCj4gQEAgLTcsNiArNyw3IEBACj4gICAqICAgQW51cCBQYXRlbCA8YW51cC5w
YXRlbEB3ZGMuY29tPgo+ICAgKi8KPgo+ICsjaW5jbHVkZSA8c2JpL3Jpc2N2X2VsZi5oPgo+ICAj
aW5jbHVkZSA8c2JpL3Jpc2N2X2VuY29kaW5nLmg+Cj4gICNkZWZpbmUgX19BU01fU1RSKHgpICAg
eAo+Cj4gQEAgLTI0LDYgKzI1LDEzIEBACj4gICNkZWZpbmUgUkVHX1MgICAgICAgICAgX19SRUdf
U0VMKHNkLCBzdykKPiAgI2RlZmluZSBSRUdfQUREVyAgICAgICBfX1JFR19TRUwoYWRkdywgYWRk
KQo+Cj4gKy8qIExpbmsgdGltZSBhZGRyZXNzIG9mIF9wYXlsb2FkX3N0YXJ0LCBzZWUgdGVzdC5l
bGYubGRTICovCj4gKyNpZmRlZiBGV19QQVlMT0FEX09GRlNFVAo+ICsjZGVmaW5lIFBBWUxPQURf
TElOS19TVEFSVCAgICAgKEZXX1RFWFRfU1RBUlQgKyBGV19QQVlMT0FEX09GRlNFVCkKPiArI2Vs
c2UKPiArI2RlZmluZSBQQVlMT0FEX0xJTktfU1RBUlQgICAgIDAKPiArI2VuZGlmCj4gKwo+ICAg
ICAgICAgLnNlY3Rpb24gLmVudHJ5LCAiYXgiLCAlcHJvZ2JpdHMKPiAgICAgICAgIC5hbGlnbiAz
Cj4gICAgICAgICAuZ2xvYmwgX3N0YXJ0Cj4gQEAgLTQ1LDYgKzUzLDI4IEBAIF9zY19mYWlsOgo+
ICAjZW5kaWYKPiAgICAgICAgIGJuZXogICAgYTMsIF9zdGFydF9oYW5nCj4KPiArICAgICAgIC8q
IHJlbG9jYXRlIHRoZSBnbG9iYWwgdGFibGUgY29udGVudCAqLwo+ICsgICAgICAgbGkgICAgICB0
MCwgUEFZTE9BRF9MSU5LX1NUQVJUICAvKiBsaW5rIHN0YXJ0ICovCj4gKyAgICAgICBsbGEgICAg
IHQxLCBfcGF5bG9hZF9zdGFydCAgICAgIC8qIGxvYWQgc3RhcnQgKi8KPiArICAgICAgIHN1YiAg
ICAgdDIsIHQxLCB0MCAgICAgICAgICAgICAgLyogbG9hZCBvZmZzZXQgKi8KPiArICAgICAgIGxs
YSAgICAgdDAsIF9fcmVsYV9keW5fc3RhcnQKPiArICAgICAgIGxsYSAgICAgdDEsIF9fcmVsYV9k
eW5fZW5kCj4gKyAgICAgICBiZXEgICAgIHQwLCB0MSwgX3JlbG9jYXRlX2RvbmUKPiArMjoKPiAr
ICAgICAgIFJFR19MICAgdDUsIF9fU0laRU9GX0xPTkdfXyh0MCkgLyogdDUgPC0tIHJlbG9jYXRp
b24gaW5mbzp0eXBlICovCj4gKyAgICAgICBsaSAgICAgIHQzLCBSX1JJU0NWX1JFTEFUSVZFICAg
IC8qIHJlbG9jIHR5cGUgUl9SSVNDVl9SRUxBVElWRSAqLwo+ICsgICAgICAgYm5lICAgICB0NSwg
dDMsIDNmCj4gKyAgICAgICBSRUdfTCAgIHQzLCAwKHQwKQo+ICsgICAgICAgUkVHX0wgICB0NSwg
KF9fU0laRU9GX0xPTkdfXyAqIDIpKHQwKSAgIC8qIHQ1IDwtLSBhZGRlbmQgKi8KPiArICAgICAg
IGFkZCAgICAgdDUsIHQ1LCB0Mgo+ICsgICAgICAgYWRkICAgICB0MywgdDMsIHQyCj4gKyAgICAg
ICBSRUdfUyAgIHQ1LCAwKHQzKSAgICAgICAgICAgICAgIC8qIHN0b3JlIHJ1bnRpbWUgYWRkcmVz
cyB0byB0aGUgR09UIGVudHJ5ICovCj4gKwo+ICszOgo+ICsgICAgICAgYWRkaSAgICB0MCwgdDAs
IChfX1NJWkVPRl9MT05HX18gKiAzKQo+ICsgICAgICAgYmx0ICAgICB0MCwgdDEsIDJiCj4gK19y
ZWxvY2F0ZV9kb25lOgo+ICsKPiAgICAgICAgIC8qIFNhdmUgYTAgYW5kIGExICovCj4gICAgICAg
ICBsbGEgICAgIGEzLCBfYm9vdF9hMAo+ICAgICAgICAgUkVHX1MgICBhMCwgMChhMykKPiAtLQo+
IDIuNDMuMAo+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNi
aQo=
