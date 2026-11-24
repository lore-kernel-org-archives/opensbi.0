Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1B1606A339
	for <opensbi@archiver.kernel.org>; Tue, 24 Nov 2026 10:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TDs50B6k;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=ScvBwGOk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QRwJOH7c1Cll5OTGwkzK4xMPs9Uxwud2a78EjA36k3w=; b=TDs50B6kEvCRpg2u5uE2IrmPxR
	JArmqfmsvMCAiX9L7VNXjj9QdLCoQQujYEYF0g/jy43BjFYKycallBIOvKJamqqgZDexwRxIQli1R
	k4DVQ8DSofheV56DgskwRoUay02tM0YY3GR7HwfMBXf4E8Odmkw5IHA6kgFxeUxKS6pMp1z558ZU3
	eGpTH00mdXq7m0hlGlPaOBpBYgSRO+JdhWiR2KIRdKjM2PiBrVWJjniZPGoxrmGxT8jokmyHCciLF
	TTSuo11lj6mbjNvy9xMSTvdI01dZhpPFRpZJdsrmTKR8j+b99Za+qi0O3L6mPO/EVE+rxeLFzNMIj
	0v/nIE0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnYl-00000006CJF-3jsT;
	Tue, 24 Nov 2026 10:15:35 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnYh-00000006CIT-28f1
	for opensbi@lists.infradead.org;
	Tue, 24 Nov 2026 10:15:35 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so36607895e9.2
        for <opensbi@lists.infradead.org>; Tue, 24 Nov 2026 02:15:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795515329; cv=none;
        d=google.com; s=arc-20260327;
        b=GQGenAd7BRYqVdohLqj6ydH34xv3UdPjm+CSCfNnXm2Azi/7jB1jL8fbiM59ON+czl
         Ex9i9ClwmYLVRatu6+xIDe9y0OhSJqGZVKPl2280t/CjK08GSAyLNSOT21onwIi9wyIn
         0Dtj2uWC7XemmAUclmL/+8c36EHVFXFPEJATGxT/9sXmeQduOiPF6fU+TExXcb2YVUIM
         0oTjlUWQbkd17hLiYn1wUO02iKGsqz/VTPt0h0eZkz8PpIpupd+yFfyGfCSMuYPA1bgz
         k4zWe+K0WTnxpAo6JLZF7yorR6rb0pE2q2LAThRwY+qVyfIPXkqA62tkksbH5a4dbuNK
         xPgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iozpp+aaQ2swQvoduWwUbW6pS4OR3wOmziTpzs2EzaE=;
        fh=s0V2QxfkZ31uI08A+gYD94xQ3QEn9NHnxJRAVF9iZzc=;
        b=GGmxy4YZutaupGuyLblHdJ15jSmGGMnTeaqkQiPKPWWnhUx1gPhpb7QIjvVu7GuTDW
         zJAPBTwJFCWaMR/4Mjp+M35OtK+i/CQmy+rUodP9jqJSQ9ZYP3nEdDcAxMWlSJW3BCXK
         rCQwYOloxgbASfN80OsdD93FiWT+n7wgO1hGTaXPevDsJ11+dZYJpoRaAPefsRqtp3hh
         FgtMleu3FPzaW4ADBzjIhWXFCmhs4cjyul7rFOFUwvIgEi58eduQSHWX8BKzngQScgQw
         FxTN3/CGE1XUKQp1t0dw72BG1jEepPMCoyzyiJTfH5phzaAEK3yN4UFZN+Du8kKrztT5
         /fLg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795515329; x=1796120129; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iozpp+aaQ2swQvoduWwUbW6pS4OR3wOmziTpzs2EzaE=;
        b=ScvBwGOkRgDc+w1m7xuS+xONfL7wCCkeSX9MOrV+BFtWtqM7FlEFXN52ajLnr/OlBh
         OftkTl+5D6op+dd9WgFyLQ7PWzekZPc+U1A+Qkd65UwEx+DyB7w7jPHj7Ib1OjalMc3q
         IdBKIZ/b5HEbUkmncdO2XQZmHwMD/MTom5dQK6yf5ILjN4v/eXiR3wGrKHmAgChw4TL9
         hyMWAjbRzeYG8fNz1GGGBEo/Rplzjq0LA+yEw4RxNkwhlrfUGoK9+F2MHBIGH1gxx3Pf
         S763BLRwgycEXz3TyTFrI2hVJ3HXLH5hHtxYm2Hwhd7YHO8TJMi2C7krCKtbNcu/9EnH
         IteA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515329; x=1796120129;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iozpp+aaQ2swQvoduWwUbW6pS4OR3wOmziTpzs2EzaE=;
        b=T0gyuBEinbRQwo5lvRRLM6kUaTbPZyuVQG4vU8y+7RSU9kuLIGvzIolWhbxPBfhIlI
         pZ9B/OHaPpSVftYItjUTE3xZyqYAkhkippPOkHYy9IfmiGyQlDjwyhec8cUIcmE4y93k
         t4mtzZUQrvLUA06IzD3YSA2/ahbAg4U1S2RwAsWQmVn7cBGWt3LNScODeAxz86PGM8E1
         zQ5z7tOSQHepzjNPHx31iIczm6oln64aDdUlxxDIoTjxVSUrerofFYX3gveqS1xJcFuI
         lKTqvgIt8PWt+5BviFnpRDQyYbv4i+vuGn8tWf0gbnRu/nEJ7pRIVqhNt64T79zh/S8B
         EUPQ==
X-Gm-Message-State: APuU4Z+nMyVTb/grziwLsCzFU40ARPIKf+FYydv32v5yOr7dIGDqEbm0
	wi5Sq4UzaYMhqDBqSWTBbpwtLIAReY27VKgH1+kgHYE+cq+KD6/mdj4xpJI2i1s6MeOoRzqwgT/
	FR1YPEMwqiW5+YfSLX8Uae5jSoK1gzVz0cvxU9L/rCdlO3eta58HK
X-Gm-Gg: AZFdTZfBYm0dZHJDhZJO8QLm0raog3aspiGwgpUlHuJ39VBVgt94gTpOW6HY4Car3LF
	N1Gn/lSnK8RyFQFnzNeHH+KggJxoJk6JyxucPj6cGhUk+kldTHvUFtTaeCT+dAZ9CKbdtc7DnSL
	lLX8h35kA+1p87ixX0ioXVjmbuZW/YQKdBeMxIVVW7yBSWmdZa4bohxZPip71kFeOyGXRTK/moL
	ym9hA27VhkI7AWaud4onsSKo9kBHVChIXu7getdmqFFQDaH/Y0aXSaVMLxY41qAlCtTAHWtGmkX
	JIFfepSlmWfTd0/IvNnrD/V7w2ykuO8b/toPsjzHNfnPjOxK4AvrnXkwQU8qXZt2aZL8DEUxnOa
	6s5KhpBLt46giRLrkygHoZromD/4uTf4kp/ZUhGdCBkO2zWPDcMppfxSOxtH6rj4WaMdJtHh7FC
	N2aNQjvLvVjiWZFtP8DPr8ZgwXNPYpvNZaKtFeN9PzXSVpODjAZK6CZfU=
X-Received: by 2002:a05:600c:5309:b0:4bb:62d5:4ab1 with SMTP id
 5b1f17b1804b1-4bb88924a5bmr292008855e9.33.1795515329433; Tue, 24 Nov 2026
 02:15:29 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261124041631.1049169-1-peter.lin@sifive.com>
In-Reply-To: <20261124041631.1049169-1-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 24 Nov 2026 15:45:17 +0530
X-Gm-Features: Aa3M54qoZHmSGALtl7Ch-lNdZwGTFeqgwu4h1VWe1TueOfimn9mLTuzZX-fIC8Y
Message-ID: <CAAhSdy1nchBsY6UGBWhaD+BfwtpYpDo0GTDadv8gpY3U06zUMw@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] Add RISC-V Worlds ISA support to OpenSBI
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, pawandeep.oza@oss.qualcomm.com, 
	rkrcmar@qti.qualcomm.com, raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_021532_667080_06489987 
X-CRM114-Status: GOOD (  17.26  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBOb3YgMjQsIDIwMjYgYXQgOTo0NuKAr0FNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBzdXBw
b3J0IGZvciB0aGUgUklTQy1WIFdvcmxkcyBJU0EgZXh0ZW5zaW9ucyBpbgo+IE9wZW5TQkksIGlu
dHJvZHVjaW5nIGEgV0lELWJhc2VkIGhhcnQgcHJvdGVjdGlvbiBiYWNrZW5kIHRvIGVuZm9yY2UK
PiBoYXJkd2FyZSBpc29sYXRpb24gYm91bmRhcmllcyBhY3Jvc3MgZG9tYWlucy4KPgo+IFRydXN0
IE1vZGVsIGFuZCBCb290LXRpbWUgUm9sZXMKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4KPiBUaGUgaW1wbGVtZW50YXRpb24gYWRoZXJlcyB0byB0aGUgdHdvLXBoYXNlIE0tbW9k
ZSB0cnVzdCBtb2RlbDoKPgo+IC0gUm9UIE0tbW9kZSBwaGFzZTogQW4gZWFybGllciBib290IHN0
YWdlIChlLmcuLCBST00gb3IgU1BMKSBtYXkgcHJvZ3JhbQo+ICAgbXdpZCBhbmQgbWx3aWRsaXN0
LCBsb2NraW5nIG13aWQgcHJpb3IgdG8gaGFuZGluZyBvZmYgZXhlY3V0aW9uIHRvCj4gICBPcGVu
U0JJLgo+Cj4gLSBSZWd1bGFyIE0tbW9kZSBwaGFzZSAoT3BlblNCSSk6IE9wZW5TQkkgdHJlYXRz
IHRoZSBub24tSVNBIHBsYXRmb3JtCj4gICBjb25zdHJhaW50cyAocG13aWQsIHBtd2lkbGlzdCwg
cG1sd2lkbGlzdCkgYW5kIENTUiBzdGF0ZXMgKG13aWQsCj4gICBtbHdpZGxpc3QpIGFzIGltbXV0
YWJsZSBpbnB1dCBwb2xpY2llcyBmcm9tIHRoZSBoYXJkd2FyZS9Sb1QuIEl0IGxvY2tzCj4gICBt
d2lkIGlmIHN0aWxsIHVubG9ja2VkLCBwcmV2ZW50aW5nIHN1YnNlcXVlbnQgTS1tb2RlIHNvZnR3
YXJlIGZyb20KPiAgIGFsdGVyaW5nIGl0cyBvd24gV0lELCBhbmQgcHJvZ3JhbXMgcGVyLWRvbWFp
biBtbHdpZCBhbmQgbXdpZGRlbGVnIGJhc2VkCj4gICBvbiBkZXZpY2UgdHJlZSBjb25maWd1cmF0
aW9uLgo+Cj4gRGV2aWNlIFRyZWUgQmluZGluZ3MKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLQo+Cj4g
UGVyLWhhcnQgcHJvcGVydGllcyBkZWZpbmVkIGluIExpbnV4IGtlcm5lbCBEVCBiaW5kaW5ncyB2
MyBbMV06Cj4gLSByaXNjdixwbXdpZDogTS1tb2RlIFdvcmxkIElECj4gLSByaXNjdixwbXdpZGxp
c3Q6IE0tbW9kZSBwZXJtaXR0ZWQgV0lEIGJpdG1hcAo+IC0gcmlzY3YscG1sd2lkbGlzdDogUy1t
b2RlIHBlcm1pdHRlZCBXSUQgYml0bWFwCj4KPiBQZXItZG9tYWluIHByb3BlcnRpZXMgKHNlZSBk
b2NzL2RvbWFpbl9zdXBwb3J0Lm1kKToKPiAtIHdpZDogV29ybGQgSUQgYXNzaWduZWQgdG8gdGhp
cyBkb21haW4gZm9yIFMtbW9kZQo+IC0gd2lkZGVsZWc6IFdJRCBkZWxlZ2F0aW9uIGJpdG1hcCBm
b3IgdGhpcyBkb21haW4KPgo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA4
MTIxMjIxMzEuMTUzNDkwNi0xLXBldGVyLmxpbkBzaWZpdmUuY29tLwo+Cj4gQmFzZSBjb21taXQ6
IDYxZjE5NzNiZDUwMzM4YjM2YzUyZGMzNDAwNmY3NmQ0NjRjYTRmMzQKPgo+IFl1LUNoaWVuIFBl
dGVyIExpbiAoOSk6Cj4gICBsaWI6IHNiaV9oYXJ0OiBhZGQgUklTQy1WIFdvcmxkcyBJU0EgZXh0
ZW5zaW9ucwo+ICAgbGliOiB1dGlsczogZmR0X2hlbHBlcjogcGFyc2UgUklTQy1WIFdvcmxkcyBw
ZXItaGFydCBXSUQgcHJvcGVydGllcwo+ICAgbGliOiBmZHRfZG9tYWluOiBwYXJzZSBkb21haW4g
V0lEIHByb3BlcnRpZXMKPiAgIGxpYjogc2JpX2hhcnQ6IGxvY2sgbXdpZCBDU1IgZm9yIFJvVCBp
bW11dGFiaWxpdHkKPiAgIGxpYjogc2JpX2RvbWFpbl9jb250ZXh0OiBwcm9wYWdhdGUgZXJyb3Ig
ZnJvbQo+ICAgICBzYmlfaGFydF9wcm90ZWN0aW9uX3JlY29uZmlndXJlCj4gICBsaWI6IHNiaV9o
YXJ0X3dvcmxkczogSW1wbGVtZW50IFdJRCBoYXJ0IHByb3RlY3Rpb24gYmFja2VuZAo+ICAgaW5j
bHVkZTogc2JpX3R5cGVzOiBhZGQgUFJJeDY0IGZvcm1hdCBtYWNybwo+ICAgbGliOiBzYmk6IGRp
c3BsYXkgV29ybGQgSUQgY29uZmlndXJhdGlvbiBhdCBib290Cj4gICBkb2NzOiBkb2N1bWVudCBX
SUQgRFQgcHJvcGVydGllcwo+Cj4gIGRvY3MvZG9tYWluX3N1cHBvcnQubWQgICAgICAgIHwgIDM4
ICsrKysrKysrCj4gIGluY2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmggIHwgIDEyICsrKwo+ICBp
bmNsdWRlL3NiaS9zYmlfZG9tYWluLmggICAgICB8ICAgNiArKwo+ICBpbmNsdWRlL3NiaS9zYmlf
aGFydC5oICAgICAgICB8ICAxNSArKysKPiAgaW5jbHVkZS9zYmkvc2JpX2hhcnRfd29ybGRzLmgg
fCAgMjQgKysrKysKPiAgaW5jbHVkZS9zYmkvc2JpX3R5cGVzLmggICAgICAgfCAgIDIgKwo+ICBs
aWIvc2JpL29iamVjdHMubWsgICAgICAgICAgICB8ICAgMSArCj4gIGxpYi9zYmkvc2JpX2RvbWFp
bi5jICAgICAgICAgIHwgIDIwICsrKysKPiAgbGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYyAg
fCAgIDUgKy0KPiAgbGliL3NiaS9zYmlfaGFydC5jICAgICAgICAgICAgfCAgMzcgKysrKysrKysK
PiAgbGliL3NiaS9zYmlfaGFydF93b3JsZHMuYyAgICAgfCAxNzQgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ICBsaWIvc2JpL3NiaV9pbml0LmMgICAgICAgICAgICB8ICAxMyAr
KysKPiAgbGliL3V0aWxzL2ZkdC9mZHRfZG9tYWluLmMgICAgfCAxMDIgKysrKysrKysrKysrKysr
KysrKysKPiAgbGliL3V0aWxzL2ZkdC9mZHRfaGVscGVyLmMgICAgfCAgNjkgKysrKysrKysrKysr
LS0KPiAgMTQgZmlsZXMgY2hhbmdlZCwgNTEwIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0p
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL3NiaS9zYmlfaGFydF93b3JsZHMuaAo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgbGliL3NiaS9zYmlfaGFydF93b3JsZHMuYwo+Cj4gLS0KPiAyLjQz
LjcKPgoKQXBwbGllZCB0aGlzIHNlcmllcyB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhh
bmtzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNi
aQo=
