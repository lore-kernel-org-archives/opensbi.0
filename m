Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31ED7606A31A
	for <opensbi@archiver.kernel.org>; Sun, 25 Oct 2026 05:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yQ/DNeOK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=q0lsDZn9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cRMdcT1WHra+54aYEDqoOSf3neG+5+K6toCVX9nQAf4=; b=yQ/DNeOKR8acnfFstvzrnkfg9E
	eNdoei6inG3USWbbWNYTwFoXvvbKdb0f6dVdBT6pwEBTDvLf2vN5l1ZXKV6qteBlrmbndx+SM4d8O
	O948ezP3op0pg8Tv8TlFV2Dmu5jWsNSLOItoYX8omwcZOZbLhoDbmWpLsfC4ztj+f4RsxkfvrjeF5
	3MZ1+DuR/0m2aioFyhopzi4vaPB9HyIYnzuWfMWyjolmXxY3KV+ybsiacIZhKHn9n9jVdx1mNoMZC
	jr7ZQOB+fyb7GwqmMkUHJ9huoZmiYjaYnCHRQOCG0PhOIISpzqp0eHa1oIF9Fw9YOpBjUtAbHRCOl
	Za3MWUlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKrDz-00000000mSl-1ohZ;
	Sun, 25 Oct 2026 05:56:55 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKrDx-00000000mSM-1ffV
	for opensbi@lists.infradead.org;
	Sun, 25 Oct 2026 05:56:54 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1712168f8f.1
        for <opensbi@lists.infradead.org>; Sat, 24 Oct 2026 22:56:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792907811; cv=none;
        d=google.com; s=arc-20260327;
        b=YoRO0IKvc8kFHO8qtGV+sMzsaEJWXwmZOodF+1lfwsLu2H2G5TTkSH7AWZGkDqaO9N
         G41rNaD5RerDQgqo9huUndM2v7pg+4e0j0TNbyrq/0KDdDkflh+iH5+3TSCboRhx9ERP
         GS3MULuTMqQf1uoDjuFOjP/K00TViRepy1oxaTv7QsD8YjOaZmLRNHPmVSnP6zGKrgyd
         DAzE9kE9I9EMsxWtj32ENO5xifZW3fpE6gpyrIcj5N+DP7SpNTCox8uXK8wK6aE0epA+
         g/oGQSoEBa/KcmK7GFCbcEvVZfjwABuuVtSZDWPQW66L3fi78/yMWghsfyez2aHFaLmp
         DzbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lfE2ubFWqaOD1NBYpZUvCvNE4GP4Zer0oUDGMXdeBqw=;
        fh=VLZx2SPUoFwPLF5HTplS/t5fAvpUCRP2G8yzi5SkUTI=;
        b=eDa53135j+CPnoe/2cUWcqRBh1w+nPyzcMEGh6esLniGYI/qbJTk3YnjFPGVw2Jt9D
         dA5eDQjh/WbxUra+jl8tYXrLPA2fntW2E4+uBXUnN+M4AYAsuk8K9Nf7nRWlWz8WckSF
         y9Q+wA8LGguhGJI1Wm1nsOtF/Y0LsBH7Cb9QDO9R9zL0Hc2mO6AiLZMUk60o9Ksh7ld+
         ousZFSSLWpIrUmOicrXTv2Bmz58lV5waCfnPnpq9OABA9MJQKdM2OHKBLcRhG2p28yNj
         uzBW4mZ9Jz85fEHaK+jTnwrRvPD3Zvnc/+xfj7h0+JeJ4RXSwU7I+ThYuqWPvnya9oph
         2hdg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792907811; x=1793512611; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lfE2ubFWqaOD1NBYpZUvCvNE4GP4Zer0oUDGMXdeBqw=;
        b=q0lsDZn9rUp9Y3mcBpUgNqG2A4ynKDy0WRcU/W9WvLWGZkd7iKMD3j4PUWlRRrCRGV
         F7bRoL9GPJw8Ed9UwLoIvxYLov5yAZUCENwHpQzfaQDfzeakrDyheLxDfcBmm2lNDnA9
         Enn/dx6dFe8HK/PD3xnv5bXwu5hQnGkRsuTPRnXjbOCtz2Xnnb0Thqeiqytf++3/ctCs
         nldbcrVNRsZUX0+s9s/sFXwtSC0euH0yKGioVsU8jDVYQYAcFnWY9vj+fgvBGOyae/9k
         O200r1edCJ6N2urJQzUISsg6fSMaT5hFsS2XlONF1KSp8KP77NuFa2FPNOk+OirX5zps
         EIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792907811; x=1793512611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lfE2ubFWqaOD1NBYpZUvCvNE4GP4Zer0oUDGMXdeBqw=;
        b=I3Gp4xEeefiWAxer79Ku9MCT/uwruHJmyzIXPuCIo1am6WwXtBZWBrYn4OxleXE6bx
         9X1QLdXC+YuoLAmyG/Qf3XMPhXXrBjXzGN6szDZgBzFBoTlhsrAYk3Bbat307A5jg3XB
         mt4L0oJSKj9fgnjyqDxLLFBs7TkPpMPuV3AImJ1sbFnKUEKrfzz+0v3FH7UUC1LoJxO7
         XVM8sbDD+56clvfsTDYarmc5B3GmDZoIDTTLeoasycbIX+r05tWdxQx95SEF4fk/2qn1
         BCmNhrpubVHSsJWrCM+I98hY7BstRSePL/3LHcd+snIX5dxOHVbh0GcgYCWFWuO61jHE
         F5xw==
X-Forwarded-Encrypted: i=1; AKwUvBwmjKzhAjVJiSdvQ049BURXLDaIlrQwzatRxS3sgKof323w4ubH36NCWd093qODevqjB0LUWC8k@lists.infradead.org
X-Gm-Message-State: AFq9FYLlpW83FuRTbsbFWnGPbU+z08HZOjaT46Q70hegUDlxMwSuWtXV
	9JeblZiNmdTuMuFdX4ZcNKanQCp5mwcWZukAdO0wB9GzSd/I9k8foswtmjFUw1uIOxPluUiSf5S
	C3ttNHPWkkfy770GSR9nOT6cxytlD7uR2toJ01HBVVQ==
X-Gm-Gg: AYBFou3+oDRe+pXxckH68fXnE3QO5svcsPXC4CMPeizME5+xvA52cGo2/rN2GpJ4ji2
	LtQlMPCoHULA44P4D5WUhLqt8xMq5rJLgH9jMm4+P7Tpc3x7EVyjhNNmMPEoEW1hHkR7jNyOhpp
	Lhdkx6eBb5B3rvCEOrkYO9mQbvSOmG46J9aY6CeBiHTTFfHMR6sAzDD5EZWoBrsnamfujtl7qFV
	q9B7Z811ym+I/xaHxImpN55rpfEHiR6EZPmMJREEOVDiWTP3g5Bn9w1XAUlqvQrsiUiBfOWfiwL
	0pro45PaqOibLd+MaKVP8p5Dg2a7cAaSVSdIcO5GhTNiNxikz3n1MFWZpYR0pPxj4IWnY3MAlA8
	OfhWUl/VSLxBkRrcM5AIjFEnDZnG3/uj7W2o0qqMHgBBnoyNZgVYv98XBCWUtmrWQCeMghne92P
	4tB7TrC2Fyn7C4Ai52m0My0ZP1fHyHFYT2phzIwTy38nVGTmc8s2ipaDTq
X-Received: by 2002:adf:fbc3:0:b0:48e:bf0:35c with SMTP id ffacd0b85a97d-48e3eb780d3mr4090037f8f.13.1792907811222;
 Sat, 24 Oct 2026 22:56:51 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260827115718.50124-1-pengpeng@iscas.ac.cn> <20261013044221.1563754-1-sebasjosue84@gmail.com>
 <caplitmus-rv.reply.20261014.pmu-test.c7fe4ad71542422d99c77cdf4db674bd@163.com>
 <CAJD=UNc2P_=ikq-oqdh-dD+5eZU-sBzms-8Dx-xtc06=yJoGQg@mail.gmail.com>
In-Reply-To: <CAJD=UNc2P_=ikq-oqdh-dD+5eZU-sBzms-8Dx-xtc06=yJoGQg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 25 Oct 2026 11:26:39 +0530
X-Gm-Features: AclHuK_f7SSBMPXwTgQdo-5FNqVzqNKv74jFm98AB1tRW73UlO027Tkr_z-74os
Message-ID: <CAAhSdy3EaP5kxbTz-DraZv1TkEVLh3Yn2Ow=-Q98gMW22iS7UQ@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: reject PMU skip-match counter class mismatches
To: =?UTF-8?Q?Sebasti=C3=A1n_Alba?= <sebasjosue84@gmail.com>
Cc: Pengpeng Hou <hppiscas@163.com>, opensbi@lists.infradead.org, 
	anup.patel@oss.qualcomm.com, atishp@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_225653_475585_CCBD86C7 
X-CRM114-Status: GOOD (  16.95  )
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
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU2F0LCBPY3QgMjQsIDIwMjYgYXQgMTA6MTPigK9BTSBTZWJhc3Rpw6FuIEFsYmEgPHNlYmFz
am9zdWU4NEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgQW51cCwgQXRpc2gsCj4KPiBUaGlzIHBh
dGNoIGhhcyBiZWVuIGluIHBhdGNod29yayBhcyBOZXcgc2luY2UgMjAyNi0wOC0yNyBhbmQgdGhl
IGlzc3VlIGlzCj4gc3RpbGwgcHJlc2VudCBpbiBtYXN0ZXIgYXQgMTMxYmRhOTQuIEkgcmVwcm9k
dWNlZCBpdCBpbmRlcGVuZGVudGx5IGluIGJvdGgKPiBkaXJlY3Rpb25zIGVhcmxpZXIgaW4gdGhp
cyB0aHJlYWQgYW5kIFBlbmdwZW5nIGNvbmZpcm1lZCB0aGUgYW5hbHlzaXMuCj4KPiBSZXNlbmRp
bmcgd2l0aCBBdGlzaCdzIGN1cnJlbnQgYWRkcmVzcywgc2luY2UgbXkgZWFybGllciBDYyB0bwo+
IGF0aXNocEByaXZvc2luYy5jb20gYm91bmNlZCB3aXRoIGEgNTUwLgo+Cj4gT25lIG9ic2VydmF0
aW9uIGZvciB3aG9ldmVyIGFwcGxpZXMgaXQuIHBtdV9jdHJfc3RhcnRfaHcoKSBkb2VzIGNhcnJ5
IHRoZQo+IGluZGV4IGd1YXJkLCBidXQgaXRzIHJldHVybiB2YWx1ZSBpcyBkaXNjYXJkZWQgYXQg
dGhlIGNhbGwgc2l0ZSwgc28gdGhlCj4gQVVUT19TVEFSVCBwYXRoIGZhaWxzIHNpbGVudGx5IHdo
ZXJlIENMRUFSX1ZBTFVFIHRyYXBzLiBUaGlzIHBhdGNoIGNsb3Nlcwo+IHRoZSBTS0lQX01BVENI
IHJvdXRlLCBhbmQgcG11X2N0cl93cml0ZV9odygpIHN0aWxsIGhhcyBubyBndWFyZCBvZiBpdHMg
b3duLgoKSW5kZWVkLCB0aGUgZXJyb3IgcmV0dXJuZWQgYnkgcG11X2N0cl9zdGFydF9odygpIG11
c3Qgbm90IGJlIGlnbm9yZWQgaW4Kc2JpX3BtdV9jdHJfY2ZnX21hdGNoKCkuIFBsZWFzZSBzZW5k
IGEgc2VwYXJhdGUgcGF0Y2ggd2l0aCBhcHByb3ByaWF0ZQpGaXhlcyB0YWcuCgpBbHNvLCBwbXVf
Y3RyX3dyaXRlX2h3KCkgbXVzdCBhbHNvIHJldHVybiBlcnJvciB3aGVuIGNpZHggaXMgb3V0LW9m
LWJvdW5kcwpzbyBwbGVhc2Ugc2VuZCBzZXBhcmF0ZSBwYXRjaCBmb3IgdGhpcyBhcyB3ZWxsLgoK
UmVnYXJkcywKQW51cAoKPgo+IFRoYW5rcywKPiBTZWJhc3RpYW4KPgo+Cj4gRWwgbWnDqSwgMTQg
b2N0IDIwMjYgYSBsYXMgMzowMiwgUGVuZ3BlbmcgSG91ICg8aHBwaXNjYXNAMTYzLmNvbT4pIGVz
Y3JpYmnDszoKPiA+Cj4gPiBIaSBTZWJhc3RpYW4sCj4gPgo+ID4gVGhhbmtzIGZvciB0ZXN0aW5n
IGJvdGggZGlyZWN0aW9ucyBhbmQgZm9yIHRoZSBUZXN0ZWQtYnkuCj4gPgo+ID4gWWVzLCBjdHJf
aWR4IC0gbnVtX2h3X2N0cnMgaXMgZXZhbHVhdGVkIGFzIHVuc2lnbmVkIGFuZCB3cmFwczsgaXQg
ZG9lcwo+ID4gbm90IHByb2R1Y2UgYSBuZWdhdGl2ZSBhcnJheSBpbmRleC4gVGhlIGNsYXNzIGNo
ZWNrIHJlamVjdHMgZWl0aGVyCj4gPiBtaXNtYXRjaCBiZWZvcmUgaXQgcmVhY2hlcyB0aGUgY291
bnRlci1zcGVjaWZpYyBvcGVyYXRpb25zLgo+ID4KPiA+IFRoYW5rcywKPiA+IFBlbmdwZW5nCj4g
Pgo+Cj4KPiAtLQo+IFNlYmFzdGnDoW4gQWxiYQo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlz
dAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9w
ZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL29wZW5zYmkK
