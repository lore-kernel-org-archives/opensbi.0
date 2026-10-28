Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AC1606A31C
	for <opensbi@archiver.kernel.org>; Wed, 28 Oct 2026 10:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AFMwL4Gk;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=pECVfr3G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wC0MZESm7jpq7yPjigsrQ0GFJQdWJjYp+OkbT2nHFb0=; b=AFMwL4GkSpntO76UsOPn3CDGLC
	fQ7E1v56rvYgcI4lWfPgf5VPkI1MQnzZgG3bKRmc5sG5tai4WRn/ThrR+MGy6Ipr+Lhg6IV1+ex8R
	Cs53tKBLxousRw2p7LwQFqBdtKZTDbncIQp1EZtWJ/XyInxJ/dqkKXw8GmARkYtp25dFVSae62PFs
	PiH0GS2kSfe97zbwDL4XHhF1yyiNT8DEjJMMCSQQv6AMCWtJ/4ZqAKgoOztyB0dOFiJR/2N5h9aVJ
	fg/s8elkfog0Wc8vCo8Wl9qgFuydcc63MLL6RDHHeIsMoazV6v3hjX174vul1W6z5LexDVTGNLbrm
	2Enx3OWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1Hu-00000006oA8-25XX;
	Wed, 28 Oct 2026 10:53:46 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1Hr-00000006o8e-23gr
	for opensbi@lists.infradead.org;
	Wed, 28 Oct 2026 10:53:45 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so8728035e9.2
        for <opensbi@lists.infradead.org>; Wed, 28 Oct 2026 03:53:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793184822; cv=none;
        d=google.com; s=arc-20260327;
        b=MT6xKFf85N6b16gC2jsuOhKWGRezT5H4DE5Gq5chowNz9AaWfhlH4a5wOGNfIFeyYf
         Tue2xSaklo60f2LxdE5RbAyv6Bdozy5UCVCSUNqDt+hCl3g2khdiZDY4LZArhZFz7vZ1
         QpdLz1gMrZ33+rPjMxtDFPf5Pb55zh1tjnBNzrSRRjbhd+qs9c14UzxyxG0v/oLe7Zdu
         665l5cjMfxONvU4hR7bYFy/Fw2pwRnkPfzsGb9NdyPIrkhklhgCyWAvaM7BEEwsrQyIx
         h+YbhzTgABAYopTLdutfNOkqMF8gUUepTmU5tSUNqZGdNlrVzbMdU2Fpcj8A4/mOYMJH
         Z7KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rjeRqJKDPtLl0PP7RyZAGEqKnakdv4t9WlLYdtqthIQ=;
        fh=s0V2QxfkZ31uI08A+gYD94xQ3QEn9NHnxJRAVF9iZzc=;
        b=J/o4Mn3q2iRVyBBVki2PQYYBrkvmhZpt3iOrl2OG5NWiBKFZ0SVDfhHQDfyRpCCQKa
         6RPSHqulANdewUl+XkSq3I3vWa6OdAsUyolzx4TzwgaR//FscFCnDJU65xcQkKlLpL8H
         9ttMtt7VfxVeYkS99rsVS6wFxkLres/9yqlpo79AIfep1BRbKz1om92/aeozkHVf2/PB
         fOgC/GMGUaSEnhxAAtPSHPC09C52RbENByIBOtHd1mhj5rF+7D9Kxhw+rHw1ZLxXspnv
         sjvwAD83pZ6QlKuQ1JzAPwK9YFww4P+tkb2aG+WG+3iVPsk/kFkRpl/TNTRdc6e7XBeD
         GW9w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793184822; x=1793789622; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rjeRqJKDPtLl0PP7RyZAGEqKnakdv4t9WlLYdtqthIQ=;
        b=pECVfr3GHpyx90tPAjNP4I+elotop59u4NS4opEmgEQx3so+NIv0HnQPgM4yyamK+k
         f3dZlMUhrzVwZIpLHL25MZ9wAXa709JdEHRQWzPCCEIhH0fKZlh/LkrLJ9QDjPdUzJyr
         Eq4eG2E4EESg3QwYF6nLRDUIGSr/IcaCbUnlXQ1fR3dW8ezLvxHpAhInyyDybeQn4IOh
         8XdJEaU+y7TQBicMsoeWLrYpYGRA/TdysjyaL4LIHnNMJyffv6aZWi0FN6EFxJysMHqK
         pgiS8EQgx5OJ/VZO+qTjzY2+otChNUjZvTVm82r8NP/IM5nOEKFVARw2crBNYk4pfvw4
         5pLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184822; x=1793789622;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rjeRqJKDPtLl0PP7RyZAGEqKnakdv4t9WlLYdtqthIQ=;
        b=fY8lkHc67pyhjX5ObaaqXEwWrBGFrDl1yrYK0A0Q2I0Phd//cXKQC28VvnPk8MK9D5
         tcCyPolnaUgaT+XyIUDyiymaVXxZMIfUoNO0ctr1pCH/q1LRtD3TqEqgjuDBHxaRgg71
         za+kdFm6D3DniBWlB7+TWFIo2n1QLXxXpFWUig3IDnZmD7JUeOw+XizuQN7S3FuuFjKf
         hi8B9dKkI+B55M1ur8nSoEomzJYr8mh0mSsjQU6aBoO11vgqTCDi6+hlfbA4MJXyssA2
         sihjQpxVFMD+Ai9LSvi8xS1v75izJMRR055V+tQHfk3t5OAel6OwAX8rr8iQOG5XvF84
         17Bg==
X-Gm-Message-State: AFq9FYKGG6aTeIYZE6RC9sTKyElFo90Gq2DXmTMhytRbdgNxEcSqoIwC
	qJoEhNneRRtVGXTYSaEiIes3mNIavdhA8OLElwbv2XQhx+qlF34GAizlKpvuScDIXNFfYcXFI00
	4N8Bo8tRkkE0tGsCG3FKBBN9vzqzXiczxtcYq80TU2Q==
X-Gm-Gg: AYBFou2mrw9KkUPJCxAjIgkyIDntfmpWrmTtaYJx+hzmGL1UB6vomnXeJGm2iIIutkS
	vltNn7fKDkAc8LBSTg+17Wp8KxVGe/XiMDwrkA6ecHhgOrNM18iWlDuCWbNwMconhOKC+dKXzvC
	RK5t/m9vZWb/uTRzO9saVzrjlJMqyMZX2AvDKfxwqZ0JrErJ6tnkqbQq8GoxNMk6w7Wc6LlqHUh
	SH31WZ0/pZwFgQK4zwa4QxToBhSiImo11XMJugcFtYowW5rxTjL0t4Lqv0J5KirWNgu24+s1d34
	zg552xeTQmeEVZb8bvMS4cT1VZURfzkxV1GiTxh8Kp56Cs3ErDYXV9JelIpUSki7W8hwJ3WzLSz
	XJEeSynAm/oD8CDJaSOPhLvuf3rVDNfOHDfI/9Ahy9tyzlJjluHiwtnKEoW6cCVILUlcfNvR9/+
	FOrNvceT4scYRNB1OlnQsKkrSYXMiWaNHxZ+/e4+b16V17tpYn7WvIBWcr
X-Received: by 2002:a05:600c:b99:b0:4a1:f99e:f22d with SMTP id
 5b1f17b1804b1-4a96667bb22mr36611765e9.6.1793184821676; Wed, 28 Oct 2026
 03:53:41 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027083509.1076577-1-peter.lin@sifive.com> <20261027083509.1076577-5-peter.lin@sifive.com>
In-Reply-To: <20261027083509.1076577-5-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 28 Oct 2026 16:23:30 +0530
X-Gm-Features: AclHuK_pA4IJ0oHI62rDCkKAAfPWJfcxcv4QU_8zTClNafEYvhZK-FVSDiByeQc
Message-ID: <CAAhSdy0ocrhMGQNm5qrs+C_AGjROMhVBm4tS1RHy22+n492Xfg@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] lib: sbi_hart: lock mwid CSR for RoT immutability
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, pawandeep.oza@oss.qualcomm.com, 
	rkrcmar@qti.qualcomm.com, raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_035344_091537_46585D30 
X-CRM114-Status: GOOD (  15.98  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBPY3QgMjcsIDIwMjYgYXQgMjowNeKAr1BNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gTG9jayB0aGUgTS1tb2RlIFdvcmxkIElEICht
d2lkKSBDU1IgZHVyaW5nIGhhcnQgcmUtaW5pdGlhbGl6YXRpb24KPiB0byBlbmZvcmNlIGltbXV0
YWJpbGl0eSBvZiB0aGUgV0lEIGVzdGFibGlzaGVkIGJ5IHRoZSByb290LW9mLXRydXN0Lgo+Cj4g
T3BlblNCSSBkb2VzIG5vdCBhc3NpZ24gdGhlIFdJRCB2YWx1ZSBpdHNlbGY7IGl0IG9ubHkgc2V0
cyBNV0lEX0xPQ0sKPiB0byBmcmVlemUgdGhlIHZhbHVlIGVzdGFibGlzaGVkIGJ5IHByaW9yIFJv
VCBzdGFnZS4gVGhlIE1XSURfTE9DSyBiaXQKPiBhdCBYTEVOLTEgaXMgc3RpY2t5IGFuZCBtYWtl
cyB0aGUgQ1NSIHJlYWQtb25seSB1bnRpbCByZXNldCwgZW5mb3JjaW5nCj4gYSB0ZW1wb3JhbCBz
ZWN1cml0eSBib3VuZGFyeSBwZXIgdGhlIFJJU0MtViBXb3JsZHMgc3BlY2lmaWNhdGlvbi4KPgo+
IFNpZ25lZC1vZmYtYnk6IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2ZS5jb20+
Cj4gUmV2aWV3ZWQtYnk6IFBhd2FuZGVlcCBPemEgPHBhd2FuZGVlcC5vemFAb3NzLnF1YWxjb21t
LmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz4KClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gQ2hhbmdlIHYyLT52MzoKPiAtIE5vIGNoYW5nZQo+
IC0tLQo+ICBsaWIvc2JpL3NiaV9oYXJ0LmMgfCA3ICsrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2hhcnQuYyBiL2xp
Yi9zYmkvc2JpX2hhcnQuYwo+IGluZGV4IDM4YTc2MWFjLi5mMDVkOWI1ZCAxMDA2NDQKPiAtLS0g
YS9saWIvc2JpL3NiaV9oYXJ0LmMKPiArKysgYi9saWIvc2JpL3NiaV9oYXJ0LmMKPiBAQCAtNzI0
LDYgKzcyNCwxMyBAQCBpbnQgc2JpX2hhcnRfcmVpbml0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2Ny
YXRjaCkKPiAgICAgICAgIGlmIChyYykKPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+Cj4g
KyAgICAgICAvKgo+ICsgICAgICAgICogQXNzdW1lIE1XSUQgaXMgcmVzdG9yZWQgYnkgcm9vdC1v
Zi10cnVzdCBNLW1vZGUgaW4gcHJldmlvdXMKPiArICAgICAgICAqIHN0YWdlLiBMb2NrIG13aWQg
c28gUm9ULWRlZmluZWQgV0lEIHJlbWFpbnMgaW1tdXRhYmxlLgo+ICsgICAgICAgICovCj4gKyAg
ICAgICBpZiAoc2JpX2hhcnRfaGFzX2V4dGVuc2lvbihzY3JhdGNoLCBTQklfSEFSVF9FWFRfU01X
SUQpKQo+ICsgICAgICAgICAgICAgICBjc3Jfc2V0KENTUl9NV0lELCBNV0lEX0xPQ0spOwo+ICsK
PiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiAtLQo+IDIuNDMuNwo+CgotLSAKb3BlbnNiaSBt
YWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
