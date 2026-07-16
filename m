Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68DDC43458
	for <opensbi@archiver.kernel.org>; Thu, 16 Jul 2026 05:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9D4g0GU8h73U3kMwR4rvSTu6iWPydINJ9J9zctnjKQ4=; b=Q3ygviWI61wJuR
	mfy0x1cTgAp/TuDzfq4Un4NsM7UmRbiUgLu6bg5NF9PyPDkhXyFL35SEH9g1c09O7XmN7Z9U6iJH+
	sWEUNP0wUe7PElrFwW9ReiFZHCpCgQCOQ5tIRhRvYdpSgRPS9reLkw/OLAoz1q9RWGoU+/RQVGK5j
	tqKJzBcX8pqKiLJ1wN+hbadRyRAhdJx+ybBYXqK5TvkaqRKo+6BLEPQNY8vQ2InTNi9Qfs8MU8Cc4
	bgIiVP28l6nffcCOzLXMTkuT0+W23Iw3YHJ+0PKB26SNpyCnmeYKn+LUJG9248Kwn+Wrrm2YvgXsy
	ATW+7X4Y8maiCBScn7aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkF8R-0000000GVfE-0iMd;
	Thu, 16 Jul 2026 05:59:51 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkF8O-0000000GVeW-2mJb
	for opensbi@lists.infradead.org;
	Thu, 16 Jul 2026 05:59:50 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47db714766aso86784f8f.0
        for <opensbi@lists.infradead.org>; Wed, 15 Jul 2026 22:59:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784181587; cv=none;
        d=google.com; s=arc-20260327;
        b=U/iKNbtrZre4DrF20lSNZ/ytyP2dnxC0PkvQt3j5jdi4rMNT8Mg4qmJ1BugEjKHwos
         V/Mra0SmrMBOD4XV/o6Lx5bVtD8S7miBwtkxCa0KdcaoKpOWUy5x4gF5pBvM+HxXrKca
         ifB5DwJJCEMTzEQhtQ0MXmbLiZfc+jsSc3fFYfDOuV+P/6cCr6VR9mVxHSsZMbPlnasU
         vNKCGRF+M+PSAWrKosOureZFxINVHfCVZssReDIYrMEsaK2kH+6l1uL/yc5U+d8+rMYZ
         Z3RZgW/HK0XmUpNTuqKNDElTklui6Gkgit52mbSbBSJ5sTTuP74k1iJa+/eubG6FV6bS
         qg1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EdJWIV6jTg0THwDOC+W8VaXPpy6xbgrnH3g80bNYAP0=;
        fh=KFL2ZnSEuyOnR/Qh1iesqX1KcdxrnTrRWFET+qVGlVQ=;
        b=V6AiijStz/zQBbD3dQofk8rQ1iaoVc08kvSz+m7bDLP4W2GNbJE6ShPbfrIq/l0Cxo
         J1p4N/kENkq7PFsBrNohf5tx4zMtuoY5G72NEyBPO/WHWZEPDmN8psbn/r6HSvZ8zskj
         Y/V1qPi8ej76MG23/vv7eibUdgE1MZRd6k08nCCcC1qfNAupx+jfM0C2FBtPZcg3Tc2i
         E2QUCdZxtW9tSqOD/zDWltpVIwzl04J0q2LS/JbYy/a19SfK0VIaKIYdvEQFyV/1vkEs
         AWdGcLHGjXMVb8DoUlawyznwoJ3FQV6XyUYtbcQepjfCGwzruEbQ5cROxFA+HMwnCanZ
         0OdA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1784181587; x=1784786387; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EdJWIV6jTg0THwDOC+W8VaXPpy6xbgrnH3g80bNYAP0=;
        b=YD4tPam8YSPgvNkLVGnIDs/iyOa4Hpsn1YPLTRcgbTf2AurV54okQ1zvCGW3ifzpkV
         faWoL5wjDZym7QrojrbaPYZFATmoYyxzbzrYc2oRyTITXZ5ljClHnSGOorw/VYd/VTi0
         kCzyzG40/jJY68O6ryD9SakgakojGfyHMpkRZNd+NqYLxCL8ca1xu9liHNEJpF4SNqAc
         +QNqptjiU7sTRa3fgsRPe9DK7GtA9rWBfm1Km1eMwNBJA4FXmDsf7tLWrnzps6YAZqIq
         l4wRMemuzf3iMObzOMAmnCepN28CoQdTHY8Mv37HqXBFP/yXs1p5Q7oQs/gIRB7kLRZ6
         ZkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784181587; x=1784786387;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EdJWIV6jTg0THwDOC+W8VaXPpy6xbgrnH3g80bNYAP0=;
        b=MF0qywVwBayW1oLo2UzsB8aPq8zP+qZAQ4AGV3Vs9zSNGeCtUJlzVNxOjoX358zxIf
         qTRl8wxF9FD+MMRX8R++4if/fRqLpY+Ub/polrAvwJTEQGgf5A14xJ0Z9D4sUl37jjiW
         I7G8sheIjhD1JUloRMmSVvcdxmyOHSxHt4AanA+4YCL12mSHO4LbKnuifSwIRnuprBN0
         8bg2fRDx1ZSkG8O/tgo5VCspdov7BcP8XANuCdjsfZogr6CKhsMcrW9gzfDwA4Ixh/OP
         QjCkLmEHhIVsW3xcEF4Pj7ENZjW30VK03/wisb8+I09XLwratzK6st5MUSww8DqiLUVL
         opwQ==
X-Gm-Message-State: AOJu0Yw1K3t4nj4liObUCvLqUE2IFMBkm3+t0o42Bv6mksohIg8+dKkC
	14iOibMYuA5EYms75GkuBWFrBFQ1hD+BKvkP1qza146c7XtWmP1VdbS75Fe2pE4Ta4WsXFlpOai
	mFWwkufERFkfY7WlNkJUVFw4rjq4ZeHxuEs41Gy2CuEI2627KXmtU
X-Gm-Gg: AfdE7ckqBZsj93JG2VW6jCzaT1WhhVFQQWczeokuCA+bMXsMyEg6QuZn2dwONfFw9a6
	t9xBBHq9YQ3msntt8iIiacEdfexlc5xIEvvrM3RHzHhi9xpEQXAysqnN6rFcunf0jetn8eU5wRE
	2rlA607QHWm+1Z2MWH5z1hKsYxLjVSRzaCxCtx9Zn9tcKnAZ2x5DYYBKg0PBx70UCHjiBMSlXzj
	ZwbHLmsksBmqGD36Wa8cCBID1dJXfPL8xmQTLbqbyEThNNIWD3u4jg+Z7q40AzccS8pphgeN/yZ
	Ki7WgCw5OpuAfewOigLN6MZPjwxTYqiQsZduLHV3gBUA5DtfKM6WTrDmCqs1/L8dM9YGSYdzir/
	zyYc70q6kehbhO90=
X-Received: by 2002:a05:6000:40c5:b0:475:a771:e839 with SMTP id
 ffacd0b85a97d-47f5a419737mr1207988f8f.3.1784181586675; Wed, 15 Jul 2026
 22:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260701181334.969877-1-david.garcia@aheadcomputing.com>
In-Reply-To: <20260701181334.969877-1-david.garcia@aheadcomputing.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 16 Jul 2026 11:29:34 +0530
X-Gm-Features: AUfX_mz9veldTgM-MU3gne5Mrer5WEgMc-_h3zrBJIqE5TuIVwxm-1cpMiYZESY
Message-ID: <CAAhSdy3ku10tP6g12W389d8cEKDNmtZ3SyvnxxabW5FgPZE93A@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi_irqchip: fix device lookup by caps when first is NULL
To: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_225948_968877_BEC41A83 
X-CRM114-Status: GOOD (  21.28  )
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

T24gV2VkLCBKdWwgMSwgMjAyNiBhdCAxMTo0M+KAr1BNIERhdmlkIEUuIEdhcmNpYSBQb3JyYXMK
PGRhdmlkLmdhcmNpYUBhaGVhZGNvbXB1dGluZy5jb20+IHdyb3RlOgo+Cj4gbGliOiBzYmlfaXJx
Y2hpcDogZml4IGRldmljZSBsb29rdXAgYnkgY2FwcyB3aGVuIGZpcnN0IGlzIE5VTEwKCk5vIG5l
ZWQgdG8gcmVwbGljYXRlIHRoZSBwYXRjaCBzdWJqZWN0IG92ZXIgaGVyZS4gSSB3aWxsIGRyb3Ag
aXQgYXQKdGhlIHRpbWUgb2YgbWVyZ2luZy4KCj4KPiBXaGVuIGNhbGxlZCB3aXRoIGZpcnN0ID09
IE5VTEwsIHNiaV9pcnFjaGlwX2ZpbmRfZGV2aWNlX2J5X2NhcHMoKSBzaG91bGQKPiBzY2FuIHRo
ZSBkZXZpY2UgbGlzdCBmcm9tIHRoZSBzdGFydC4gSW5zdGVhZCBpdCBhbHdheXMgcmV0dXJucyBO
VUxMOiAiZm91bmQiCj4gc3RhcnRzIGZhbHNlIGFuZCBvbmx5IGZsaXBzIHRydWUgd2hlbiBhbiBl
bnRyeSBlcXVhbHMgImZpcnN0IiwgYnV0IG5vIGVudHJ5Cj4gZXZlciBlcXVhbHMgTlVMTCwgc28g
ZXZlcnkgZW50cnkgaGl0cyAiZWxzZSBjb250aW51ZSIgYW5kIG5vdGhpbmcgaXMgY2hlY2tlZC4K
Pgo+IFRoaXMgYnJlYWtzIE1TSSBkZXRlY3Rpb24gaW4gc2JpX21weHksIHdoaWNoIGNhbGxzIGl0
IHdpdGggZmlyc3QgPT0gTlVMTDoKPgo+ICAgbXMtPm1zaV9hdmFpbCA9ICEhc2JpX2lycWNoaXBf
ZmluZF9kZXZpY2VfYnlfY2FwcyhTQklfSVJRQ0hJUF9DQVBTX01TSSwgTlVMTCk7Cj4KPiBtc2lf
YXZhaWwgaXMgdGhlcmVmb3JlIGFsd2F5cyBmYWxzZSwgc28gbXB4eV93cml0ZV9zdGRfYXR0cigp
IHNpbGVudGx5IGRyb3BzCj4gdGhlIE1TSSBhdHRyaWJ1dGVzIChNU0lfQUREUl9MTy9ISSwgTVNJ
X0RBVEEsIE1TSV9DT05UUk9MKSB3aGlsZSBzdGlsbAo+IHJldHVybmluZyBzdWNjZXNzLCBhbmQg
TVNJLWJhc2VkIE1QWFkgbm90aWZpY2F0aW9ucyBhcmUgbmV2ZXIgZGVsaXZlcmVkLgo+Cj4gSW5p
dGlhbGl6ZSAiZm91bmQiIGZyb20gImZpcnN0IiBzbyBhIE5VTEwgImZpcnN0IiBzY2FucyBmcm9t
IHRoZSBiZWdpbm5pbmcsCj4gYW5kIGFsd2F5cyBjb250aW51ZSBpbiB0aGUgcHJlLW1hdGNoIGJy
YW5jaCBzbyBhIG5vbi1OVUxMICJmaXJzdCIgcmVzdW1lcwo+IGFmdGVyIHRoZSBnaXZlbiBkZXZp
Y2UuCj4KPiBGaXhlczogODU3MGI5Mzg0NDRkICgibGliOiBzYmlfaXJxY2hpcDogQWxsb3cgaXJx
Y2hpcCBkcml2ZXJzIGFkdmVydGlzZSBjYXBhYmlsaXRpZXMiKQo+IFNpZ25lZC1vZmYtYnk6IERh
dmlkIEUuIEdhcmNpYSBQb3JyYXMgPGRhdmlkLmdhcmNpYUBhaGVhZGNvbXB1dGluZy5jb20+CgpM
R1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBs
aWVkIHRoaXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoK
PiAtLS0KPiAgbGliL3NiaS9zYmlfaXJxY2hpcC5jIHwgNSArKy0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9z
Ymkvc2JpX2lycWNoaXAuYyBiL2xpYi9zYmkvc2JpX2lycWNoaXAuYwo+IGluZGV4IDZkMGRmMDJl
Li5mMWJjMjRjYSAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9pcnFjaGlwLmMKPiArKysgYi9s
aWIvc2JpL3NiaV9pcnFjaGlwLmMKPiBAQCAtNDEyLDE0ICs0MTIsMTMgQEAgc3RydWN0IHNiaV9p
cnFjaGlwX2RldmljZSAqc2JpX2lycWNoaXBfZmluZF9kZXZpY2VfYnlfY2Fwcyh1bnNpZ25lZCBs
b25nIGNhcHMsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3Qgc2JpX2lycWNoaXBfZGV2aWNlICpmaXJzdCkKPiAgewo+ICAg
ICAgICAgc3RydWN0IHNiaV9pcnFjaGlwX2RldmljZSAqY2hpcDsKPiAtICAgICAgIGJvb2wgZm91
bmQgPSBmYWxzZTsKPiArICAgICAgIGJvb2wgZm91bmQgPSAoZmlyc3QgPT0gTlVMTCk7Cj4KPiAg
ICAgICAgIHNiaV9saXN0X2Zvcl9lYWNoX2VudHJ5KGNoaXAsICZpcnFjaGlwX2xpc3QsIG5vZGUp
IHsKPiAgICAgICAgICAgICAgICAgaWYgKCFmb3VuZCkgewo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGlmIChmaXJzdCA9PSBjaGlwKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Zm91bmQgPSB0cnVlOwo+IC0gICAgICAgICAgICAgICAgICAgICAgIGVsc2UKPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICsgICAgICAgICAgICAgICAgICAgICAg
IGNvbnRpbnVlOwo+ICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAgIGlmICgoY2hp
cC0+Y2FwcyAmIGNhcHMpID09IGNhcHMpCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IGNoaXA7Cj4gLS0KPiAyLjQzLjAKPgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL29wZW5zYmkK
