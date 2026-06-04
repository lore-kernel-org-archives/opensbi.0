Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43698CD6E6E
	for <opensbi@archiver.kernel.org>; Thu,  4 Jun 2026 20:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xcQtvEeKeV2O8aXskhGe3yW3xjubg00Xl5QaoTXZETE=; b=jNBvcaxvWBD6bu
	aNOKVBLmTS8SvBmaQRmWLIRd4wQasJdI3Lxx5ygcQ37hb4+oyk5oZWDhL9e0fReecC6Ohczv7XVtL
	XsJDiAmKz24YmN3bsAjGuUUQuPhiirQTh5ZOAE/vFFhBG5qLL4mQBBlAPvOfCSP+KB+w72yoWDYrM
	dPaS0cmc5hz8i0KbrNMM/P5QKV9DAdmKrmNaPMP1VrJQgciPgpK4GtY20cOYVWd8rPvc2aF9gvGD/
	Trivk//5PQnz2z2XWjXTpnPKLXhe8jZ1h8vn8iKvsFijD3kkj6i8/j6zi1R4e/Mde0cKf4T1/bX9j
	F3a4NzpoMXFOezjR5low==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVENW-0000000HFD9-1Vxg;
	Thu, 04 Jun 2026 20:09:22 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVENS-0000000HFCn-1DvA
	for opensbi@lists.infradead.org;
	Thu, 04 Jun 2026 20:09:21 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-7e3b2a435ecso11763197b3.1
        for <opensbi@lists.infradead.org>; Thu, 04 Jun 2026 13:09:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780603756; cv=none;
        d=google.com; s=arc-20240605;
        b=jywDmJJf3ZpjHetjMHTCJBU8BIHPcYCJ3+qzNhvM0lA/X8P3AdmYrK3YpHu3SoS7CL
         VH3u5su4H5159/IoBwlY9j1+/G1ac4OS+aZ3NQl8WuIdSEuO5b4XhTer0thQyPP015B8
         BCuomfwLQAeXA5N4wsyBqqMG1G2ffyP3sm4boBwJ4ji86jWaC9MYu4dNvCz9Vg7Jj0cp
         f+sDex7KXH68FZSQpxFbKhJYKZyL2j1i+Jx8SNdg8KtoSLuDE0Nqy00snVGmPhUy901+
         L9ovAbk83aKM5xj8WMyx5GU58zQRNpwjUChpFbtdy7e0fEFH4pX8J50EZKQY1OtFvGyV
         jd8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L2CzbJtbs/QFb1EcWQnvKkzcd1v1/KatEeLtZ6WgNsc=;
        fh=vpqr1VIMywg1OPdnbu4TD6SKMwpANUZy+QCWvUHBRPc=;
        b=ea1PHU+L7SFqSRp8OMogXcECGHgVTpwYctP3ugzipDR6Y1Yx8hy1wcclR/OWN5u/p2
         4lIq21SWZHWFADePYnunHjhZvyDkcKRtKpR0rva3aVRr8UQ/mtEofBCFhEI5Q+/k7KLM
         wMYn/VonWOYb0t0yYCJIiCTg1lIsA1piBzLsGHzx9PqfR5ddHrNwkgrgtJ3fW4k8MWF3
         jgXJQ+0upa/KAbWn8TBck5SxsyZziVH+4MX8UMhJoizpNdihS+2cRvLKFvhhBV/1uW14
         e0+VFfzJq1tdIiXFJGJGafj04p2+4k/R32cxi8ZL0t+GQsRBY9tNyNVO5Xm+dOn+ekdC
         OUng==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1780603756; x=1781208556; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2CzbJtbs/QFb1EcWQnvKkzcd1v1/KatEeLtZ6WgNsc=;
        b=BDHsXWBx1H7MV2i189BxVQC/x6ZFE4pDndZPV44JOex0wYeIGhwVIW7duLRxCgkCeG
         /7VMKm3E2QVpE1eTZuzMDczuIb7asBnH2E7ix3wxX1EXvj6Bbldpvdmgw2qB7tbwu1Y8
         fBpnm48z4Oy9vAZntuhlm16B3aQCjUMKDVEVuim48sR4XCWpdu6lcZNmM0qEG9EVt0v4
         swYDmrv3qh59GTe4NqYsiHM2g0HbOHs8r54GvTURnm21VZnbYJ2fKDgya2npg9+vnYA/
         2IJg6udZ4RGomEALnIEgOc0CTLQx4sLBAy9UDXd3UmJP45FeMuFi8W9dZoawTFLTbxg9
         KYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780603756; x=1781208556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L2CzbJtbs/QFb1EcWQnvKkzcd1v1/KatEeLtZ6WgNsc=;
        b=Ok9G7cN8L86bRJRyWRZozRABCaTV3H9Me9ggBjsZf8nxQTHD9tt8BmcslhXp191Wmj
         aZxy3r3FqSZUS/SuUNvipHFxaXmXeCKu+2igNTWxIfjp48cy7/DcU+B2/33s2NyT8MLu
         kDkiCW571HHanJE0LM/YZJQrhZ9ZaD0hMQufwKEcbEWzUlI48FQZATdAWZUb7vWNhzp6
         LR7myA+QPiyVQlIY8kIxeRlKARc6t2voh0HHBGA7Glo5szmDEvJVo0xrwA8pRcrq9v8N
         9DTP9K+oz1H2+DD2gEpoWgs5zIoQOoqLp+amOptKKElpP/12YCdoE43zAi3Zdix0jJmV
         M//w==
X-Forwarded-Encrypted: i=1; AFNElJ/eeKF1BK/4TBo62sRPmISt8H2nLb1n7gkjOyreAiZjQUjPfOou996WjP/eUk2VESTVF+xSlHzA@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+gI/gSHMfDohVU9f2m5UL1aIIts6jh4WMsqGAyKieFG41w+W/
	VysH7A2O2sTDRGJcrN8MlA8KtGFjNVgaE2z/xamARG2Eo8hHVhnVnzMZUXqnhG+rjo4yjqVIGP4
	o44jvLk0WfQxzbJI8vi9EVvNXYGl7k7e6JGqX4Jgo3A==
X-Gm-Gg: Acq92OExsqDZSSRRsj0/Yk7NzxWVI0tRVv8hPjNJEDw6DX/zfmt9/PtIcliDobAqga3
	DQerVgLmjzu8GO5fHNgbrQVNH4ZwmuiL4/9GCv9HtchmJj3kBsx+cOyN9BbQXW4T0Th0/Tws0HS
	7Bcf4rZQRM8jgUcaz6ZDqaZ7z8CSUjouzmhTcp5zSLpmuu28zetq1sHa5NbKb4mbMzsrjEERCzL
	CGd6v5yKlL8Y/3ui6okUEi+bkVaahwjoCn1vzpn4zyAlDcLFLdtBB+ZTx15/o7AVAikV49Pz7fC
	Zn2pYew70BTSW9KMqHYapSkn1s6ejBodmRJMjZIPkYDoenh9yOAETiyEPk8=
X-Received: by 2002:a05:690c:c1d:b0:7b8:338d:7d80 with SMTP id
 00721157ae682-7ed0c32bd57mr4842687b3.31.1780603756356; Thu, 04 Jun 2026
 13:09:16 -0700 (PDT)
MIME-Version: 1.0
References: <edbce78c-71a7-41d7-aa81-3fa57241644a@iscas.ac.cn> <ah8rCkntd95JPfti@aurel32.net>
In-Reply-To: <ah8rCkntd95JPfti@aurel32.net>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 4 Jun 2026 15:09:05 -0500
X-Gm-Features: AVVi8Cd875ihwGg05iZMgHrpOnR1O_r95Si8ioi5ppYxLQRrDjQ4XdfJQafxLOM
Message-ID: <CAEev2e9yixsoPSp4dQZdVXH=JTC3GKKkiOAOvuPgqykPzGz0FA@mail.gmail.com>
Subject: Re: [PATCH] include: sbi_platform: Increase default stack size
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, opensbi@lists.infradead.org, 
	Michael Ellerman <mpe@kernel.org>, Bo Gan <ganboing@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_130918_473232_25219D47 
X-CRM114-Status: GOOD (  20.00  )
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

SGkgQXVyZWxpZW4sCgpPbiBUdWUsIEp1biAyLCAyMDI2IGF0IDI6MTLigK9QTSBBdXJlbGllbiBK
YXJubyA8YXVyZWxpZW5AYXVyZWwzMi5uZXQ+IHdyb3RlOgo+Cj4gT24gMjAyNi0wNS0yNCAxMzo1
MywgVml2aWFuIFdhbmcgd3JvdGU6Cj4gPiBzYmlfbWlzYWxpZ25lZF92X2xkX2VtdWxhdG9yKCkg
aGFzIGEgbG9jYWwgYnVmZmVyIChuYW1lbHkgbWFzaykgd2hpY2ggaXMKPiA+IDgxOTIgYnl0ZXMg
aW4gc2l6ZSwgc28gdGhlIGRlZmF1bHQgc3RhY2sgc2l6ZSBpcyBub3QgZW5vdWdoLiBEb3VibGUg
aXQKPiA+IHRvIDE2Mzg0Lgo+ID4KPiA+IFRoaXMgc3RhY2sgb3ZlcmZsb3cgY2FuIGJlIG9ic2Vy
dmVkIGJ5IGFueSBTLW1vZGUgc29mdHdhcmUgYW5kIGxlYWRzIHRvCj4gPiBNLW1vZGUgY3Jhc2gg
b3IgdW5leHBlY3RlZCBiZWhhdmlvciwgYXMgbG9uZyBhcyB0aGUgUy1tb2RlIHNvZnR3YXJlIGRv
ZXMKPiA+IG5vdCBlbmFibGUgRldGVCBtaXNhbGlnbmVkIGRlbGVnYXRpb24gWzFdLiBUaGlzIG1h
eSBiZSBjb25zaWRlcmVkIGEKPiA+IHRlbXBvcmFyeSBmaXggdW50aWwgZnVydGhlciBmaXhlcyBh
cmUgbWFkZSB0byBtaXNhbGlnbmVkIGhhbmRsaW5nIFsyXS4KPiA+Cj4gPiBMaW5rOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9ucnZ0NzRxbm9qYXViaXdqbzM3dW1zNGxuY2x1
NDY2aG92d3JobXRiYWc2ZjV1aHJxbEBxNm1zb2Uyb3RvNGIgIyBbMV0KPiA+IExpbms6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL29wZW5zYmkvMjAyNjAyMTAwOTQwNDQuNzI1OTEtMS1nYW5ib2lu
Z0BnbWFpbC5jb20gIyBbMl0KPiA+IFNpZ25lZC1vZmYtYnk6IFZpdmlhbiBXYW5nIDx3YW5ncnVp
a2FuZ0Bpc2Nhcy5hYy5jbj4KPiA+IC0tLQo+ID4gIGluY2x1ZGUvc2JpL3NiaV9wbGF0Zm9ybS5o
IHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+Cj4gVGVzdGVkLWJ5OiBBdXJlbGllbiBKYXJubyA8YXVyZWxpZW5AYXVyZWwzMi5uZXQ+Cj4K
PiBJIGNhbiBjb25maXJtIHRoYXQgdGhpcyBmaXggaXMgcmVxdWlyZWQgdG8gYm9vdCBhIDcuMS1y
YzYga2VybmVsIG9uIGEKPiBDUFUgd2l0aCB2ZWN0b3IgaW5zdHJ1Y3Rpb25zIChpbiBteSBjYXNl
IFNwYWNlbWlUIEsxKS4KCkFyZSB5b3Ugc3VyZSB0aGF0IHRoaXMgaXMgbmVlZGVkIGZvciB0aGUg
SzE/IEl0IHNlZW1lZCBsaWtlIHRoaXMgd2FzCm9ubHkgYW4gaXNzdWUgb24gYm9hcmRzIHdpdGgg
bGFyZ2UgdmxlbiAoNTEyIGxpa2UgdGhlIHgyODApPyBEbyB5b3UKbWluZCBzaGFyaW5nIGFueSBr
ZXJuZWwgYm9vdCBsb2dzIHdpdGgvd2l0aG91dCB0aGlzIHBhdGNoPwoKSSB3YXMgYWJsZSB0byBi
b290IDcuMS4wLXJjNi1uZXh0LTIwMjYwNjAzIGRlZmNvbmZpZyB3aXRob3V0IGlzc3VlIG9uCmEg
TWlsa1YgSnVwaXRlci4gT25seSBjYXZlYXQgaXMgdGhhdCBteSBib2FyZCBpcyAgcnVubmluZyBh
biBvbGQKdmVuZG9yIG9wZW5zYmkgKHZlcnNpb24gazEtYmwtdjIuMi40IHRoYXQgbWF5IGJlIGJh
c2VkIG9uIHVwc3RyZWFtCnYxLjMpIHRoYXQgdGhlIGJvYXJkIHNoaXBwZWQgd2l0aCwgYW5kIG5v
dCBzdXJlIGlmIHRoYXQncwpoZWxwaW5nL2h1cnRpbmcgaW4gYW55IG1hbm5lci4KCgo+Cj4gUmVn
YXJkcwo+IEF1cmVsaWVuCj4KPiAtLQo+IEF1cmVsaWVuIEphcm5vICAgICAgICAgICAgICAgICAg
ICAgICAgICBHUEc6IDQwOTZSLzFEREQ4QzlCCj4gYXVyZWxpZW5AYXVyZWwzMi5uZXQgICAgICAg
ICAgICAgICAgICAgICBodHRwOi8vYXVyZWwzMi5uZXQKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlz
dApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
