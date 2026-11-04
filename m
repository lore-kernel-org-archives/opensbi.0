Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C58D606A31B
	for <opensbi@archiver.kernel.org>; Wed,  4 Nov 2026 06:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SIqKubTg;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=JsSo8i47
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Z06jI8Q7XrnXirdX+X5yiga8sR4SuvlyWHHQdb+C8w0=; b=SIqKubTgPz222mayvuuhLB5w3P
	cmOoeAsfnalsLYli1tbtHAwyklVhao4utskx98maWHqwKQSCgb1iJwEMBXNIMgmzRa580doDwIvsR
	jG0w/tHxbH2e7U+40Fmkfjum68JBBHnLeJGcL4BiV7mfAW1DWrm1yPwF6aosTMBp27nbAwHBYX4UD
	fbxYYSz0bn6lfutcpUU753bIOVbcJeno4BMBJibZUJaT4eY5WWT7fR+npGrS7M3bi87PBGMkCfcrV
	ooHazBZXOQHPvJ5iR9eOipii6IUbEirvHPgj442RDIVWM2Th/rl/AajdCHuvBWlKOQp/0VsaLEEQ/
	3xqEBWWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUDb-00000004OYA-3rdu;
	Wed, 04 Nov 2026 06:11:31 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUDZ-00000004OXo-1zU2
	for opensbi@lists.infradead.org;
	Wed, 04 Nov 2026 06:11:30 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48e47347279so149951f8f.1
        for <opensbi@lists.infradead.org>; Tue, 03 Nov 2026 22:11:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793772687; cv=none;
        d=google.com; s=arc-20260327;
        b=TYL2mhtPQ5sakd08pQ7uecYp7ZM7Qe0MTtLInXtNYO1pwea/DRdXTTwtDgwQK6crF+
         XQTR+oq67ucWDiNM/JjIFgdkb3U5JLH03cG8D69pRiRAqRWIQwmC7NetXY8n2gHU70fR
         YYllM0J6ccr05ZGW+2wshxiEanFiNCPosqaJm5Du7vm1csoda5X2LSd7/zDjyZjP/rfo
         TlCQ1CCrqRwtnZRK2b18jDKAFeMc26x+bc9rJ+u6sg2VWOWAFXkZEataxao/Yl9pGw52
         vaviutaZtU5RYCR9oN0VDHw9SKhGqODquylPrH+t+6LTWVjdYRsO1Hk+KkiGWy8/OkiN
         qcZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t9vV8P8Oxo7E+afmlgtbSpYAeLlAEKigjyQzQeuFNRI=;
        fh=ZS5wY3UKuY+q37ts0swsaTQEPnFQSAUUS7y0rZPuQHw=;
        b=U0lfXXy98gFzFtDgTJPumr+E/b0wMqjc6Fy9LGcHJGJYFpLfrlM6CiOqo2JmsJdEmT
         I97Tp9Okve4y3CK1qMw4nU7cigb0lNINTHdhjsmjIfFePr+wOu5L50R1MVjS1nQDPMw9
         NagGIZ2GrapTHsBbK5hMjyyb0ZktXrRhTot2+nq2UBqtf2fBNzmZtumdrBpKDYhLVJ6I
         MicKpVq3rKC8PLfl0sFIdI9qCJOaCFRRBhMfNsdNMtklUwKLCGrkT1aA7yEu9N0DHgHs
         sKA4YwSSMOYeTCP4LoUMu0Fy42eyOULyJM+f49HB1wkxboWYRz1jvqawiBQjFyWCc+2b
         0d0g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793772687; x=1794377487; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t9vV8P8Oxo7E+afmlgtbSpYAeLlAEKigjyQzQeuFNRI=;
        b=JsSo8i47+yt91x24hfjJr2sW7Rjfst24V6PeUzgUxPAFX5LkI52YoetRxRU2ljDnzr
         IhvdHnUbowZCIHsoRt93O+BpLvXn742vfhp5ylzMncQILHuMQbBPpg2V9GU04oYNBPDW
         J6PTPPLYjDgaqSrAUnbfqktuNaW4v700w91yncccOf+dYBftBjm7IIWEl2VkAhQMUXm0
         /Sv4Kvn9wWFGL2/mApDXu5Aj3lrm1sg5LfcJVCYSjbkCSJ6FwP3F7Qqo5BjiwKyNmcBq
         UT/ghOHziLmXuRfFNu8OoI9YvqD8h4drnZyWYM+lNPZxXRPLwAWsUCMxfIlCQIrA8zTN
         jk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793772687; x=1794377487;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9vV8P8Oxo7E+afmlgtbSpYAeLlAEKigjyQzQeuFNRI=;
        b=SLuo+254sjUQmcN6Ad3aNwt7z9G80HXk2c22bVq+APA55pnXHu8thzBJ+SwafkwGc4
         OX/sHn5A1KZ5yOMbR7SdBLBD5x770ABTJ01Txnzjo8U68yxUTaSN61ECGMpQnYgv9tDQ
         3dqtnY1T48u2sPPtKi2BP56/FjJ5Lh8pxI5cDfEZZh8UshHUnkZH2H24MUT8L3QVO8s+
         cP55fE5247fng5DTa7OaWh5MF1ba27wFcF1KfmF9j7e1r8yNfvEgP4C7oMIUr4wmNRLX
         h67hpFCtix5d4HwoJw+wCT8dDYP5r7jwsSG5VfBvFkm3h2c6MjZrf4kHOSBFxiTy1ZUD
         Fc1A==
X-Gm-Message-State: APuU4Z9s5YVUxr/GfLRQ7fgwxVEy3KD6xOcz7vJSkd9dZC0CWMN1Irj2
	Kxje8dSwUXX4fsCQ4lpAZ83zNr/dK0zodsd+HQziM/HfwhAYXlZjw2pcjvXKUP+tghwvVdZvqq8
	ABV303Tc1Se9eKbSCJkapJs7R0bAiwXiBlGPKiyKcFMYq+WlkYjVvyW8=
X-Gm-Gg: AYBFou3zEGPVHLkwQQK1fz13A98hbzTPosXmy0julNE4s9dwRlJ+toX9uq4DLJwTqLy
	cToVZ5KQM+eq04YSKQbq9OE6LVLCHi8weyKIVNYyAq5AhrtuCAPs3vqNWoaI8h54EWDLafeX327
	yOe+ihE7t2QVJuIKspiSsmyV/k2WXIgJnDIHaOPz3tiooUKJo0fKD0d7eMuzzKMZil1thgdjdf4
	oKRop0lZ3eGoohxYVBzqeydvMN+qwsOrGqBMk0QXYJP60AoqpIdnldiNlsvCM41FYszUXwFF5Vy
	lmECCroHBMpLM1BD3v7Kjr0g78fUTVtgQBmcohv6iigPFgKDgwDb5gB8s71wQDE34zehgLwG/8G
	txGl2lXOjBzz2rMCrL7RNRL9NVfEKnlug92dNHViotG35AhslQRmAJ3BuGgcU4gmcZhRf3K7kEN
	DzfrhLkQwd8wgul12aEuluXnZVymYnDejRRNYpZSuKuq5arXqbk+4Ykz8x
X-Received: by 2002:a05:6000:420c:b0:48d:f855:d1e0 with SMTP id
 ffacd0b85a97d-48e6e50b9ddmr34224622f8f.57.1793772687561; Tue, 03 Nov 2026
 22:11:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261011222115.769450-1-nickolai@csail.mit.edu>
In-Reply-To: <20261011222115.769450-1-nickolai@csail.mit.edu>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 4 Nov 2026 11:41:13 +0530
X-Gm-Features: AclHuK9UCIpOGts3HWPTsH8IStkXcn6F6G3FK0NztukV7saCzg3okW45FmsV3Qg
Message-ID: <CAAhSdy12jjNfL2_x0-8qz97f2wMGWyu7xcH82A6q-9F-H+Zkgw@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi_pmu: Do not return uninitialized stack data on
 FW read errors
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_221129_554975_B52AF422 
X-CRM114-Status: GOOD (  28.85  )
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

T24gTW9uLCBPY3QgMTIsIDIwMjYgYXQgMzo1MeKAr0FNIE5pY2tvbGFpIFplbGRvdmljaAo8bmlj
a29sYWlAY3NhaWwubWl0LmVkdT4gd3JvdGU6Cj4KPiBzYmlfZWNhbGxfcG11X2hhbmRsZXIoKSBw
YXNzZXMgdGhlIHVuaW5pdGlhbGl6ZWQgbG9jYWwgdGVtcCB0bwo+IHNiaV9wbXVfY3RyX2Z3X3Jl
YWQoKSBhbmQgY29waWVzIGl0IGludG8gb3V0LT52YWx1ZSB1bmNvbmRpdGlvbmFsbHkuCj4gc2Jp
X3BtdV9jdHJfZndfcmVhZCgpIG9ubHkgd3JpdGVzICpjdmFsIG9uIHN1Y2Nlc3MsIHNvIGV2ZXJ5
IGVycm9yCj4gcmV0dXJuIG9mIFNCSV9FWFRfUE1VX0NPVU5URVJfRldfUkVBRCAoZS5nLiBhIGhh
cmR3YXJlIG9yIGluYWN0aXZlCj4gY291bnRlciBpbmRleCkgaGFuZHMgYW4gTS1tb2RlIHN0YWNr
IHdvcmQgdG8gdGhlIHN1cGVydmlzb3IgaW4gYTEuCj4gU0JJX0VYVF9QTVVfQ09VTlRFUl9GV19S
RUFEX0hJIGRvZXMgdGhlIHNhbWUgd2l0aCB0aGUgdXBwZXIgaGFsZiBvZgo+IHRlbXAgb24gUlYz
Mi4KPgo+IEluaXRpYWxpemUgdGVtcCB0byB6ZXJvIHNvIHRoYXQgdGhlIGVycm9yIHBhdGhzIHJl
dHVybiB6ZXJvIGluCj4gc2JpcmV0LnZhbHVlOyB0aGUgc3VjY2VzcyBwYXRocyBhcmUgdW5jaGFu
Z2VkLgo+Cj4gRml4ZXM6IDE2NjRkMGVmY2UwYiAoImxpYjogc2JpX3BtdTogUmVwbGFjZSBzYmlf
cG11X2N0cl9yZWFkKCkgd2l0aCBzYmlfcG11X2N0cl9md19yZWFkKCkiKQo+IEZpeGVzOiA1MTk1
MWQ5ZTlhZjggKCJsaWI6IHNiaV9wbXU6IEltcGxlbWVudCBzYmlfcG11X2NvdW50ZXJfZndfcmVh
ZF9oaSIpCj4gU2lnbmVkLW9mZi1ieTogTmlja29sYWkgWmVsZG92aWNoIDxuaWNrb2xhaUBjc2Fp
bC5taXQuZWR1Pgo+IENvLUF1dGhvcmVkLUJ5OiBDbGF1ZGUgRmFibGUgNS4xIDxub3JlcGx5QGFu
dGhyb3BpYy5jb20+CgpVc2UgQXNzaXN0ZWQtYnkgaW5zdGVhZCBvZiBDby1BdXRob3JlZC1CeSBm
b3IgTExNcy4gSSB3aWxsCnVwZGF0ZSBhdCB0aGUgdGltZSBvZiBtZXJnaW5nLgoKUmV2aWV3ZWQt
Ynk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMgcGF0Y2gg
dG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKPiAtLS0KPiBUaGlzIGJ1
ZyB3YXMgZm91bmQgaW4gdGhlIHByb2Nlc3Mgb2YgZm9ybWFsbHkgdmVyaWZ5aW5nIHRoZSBjb3Jy
ZWN0bmVzcwo+IG9mIE9wZW5TQkkgb24gdG9wIG9mIHRoZSBTYWlsIFJJU0MtViBzZW1hbnRpY3Mg
dXNpbmcgTGVhbi4KPgo+IFRyaWdnZXJpbmcgZXhlY3V0aW9uOiBhbnkgUy1tb2RlIGNhbGxlciwK
PiAgIGE3ID0gMHg1MDRENTUgKFBNVSksIGE2ID0gNSAoQ09VTlRFUl9GV19SRUFEKSwgYTAgPSAw
IChtY3ljbGUpLgo+IHNiaV9wbXVfY3RyX2Z3X3JlYWQoKSByZXR1cm5zIFNCSV9FSU5WQUwgYXQg
aXRzIGZpcnN0IHJhbmdlIGNoZWNrCj4gd2l0aG91dCB3cml0aW5nICpjdmFsLCB0aGUgaGFuZGxl
ciBjb3BpZXMgdGhlIG5ldmVyLXdyaXR0ZW4gdGVtcCBpbnRvCj4gb3V0LT52YWx1ZSwgYW5kIHNi
aV9lY2FsbF9oYW5kbGVyKCkgcmV0dXJucyBpdCBpbiBhMSBuZXh0IHRvCj4gYTAgPSBTQklfRVJS
X0lOVkFMSURfUEFSQU0uICB0ZW1wIGhhcyBpdHMgYWRkcmVzcyB0YWtlbiwgc28gaXQgbGl2ZXMK
PiBpbiBhIHN0YWNrIHNsb3Qgb2YgdGhlIE0tbW9kZSB0cmFwIHN0YWNrIGFuZCBhMSByZWNlaXZl
cyB3aGF0ZXZlciB0aGUKPiBsYXN0IE0tbW9kZSBjb2RlIGxlZnQgdGhlcmUuICBUaGUgc2FtZSBo
b2xkcyBmb3IgYTYgPSA2IG9uIFJWMzIKPiAodXBwZXIgaGFsZik7IHRoZSBSVjY0IGFybSBvZiBm
aWQgNiBhbHJlYWR5IHJldHVybnMgMC4KPgo+IFRoZSBzYW1lIHZlcmlmaWNhdGlvbiBwYXNzIGZv
dW5kIHRoYXQgU0JJX1BNVV9DRkdfRkxBR19TS0lQX01BVENIIGxldHMKPiBhIHN1cGVydmlzb3Ig
cGFpciBhIGZpcm13YXJlIGNvdW50ZXIgd2l0aCBhIGhhcmR3YXJlIGV2ZW50IChzYmlfcGFuaWMo
KQo+IHZpYSBjc3Jfd3JpdGVfbnVtKDB4YjIwKSkgb3IgYSBoYXJkd2FyZSBjb3VudGVyIHdpdGgg
YSBmaXJtd2FyZSBldmVudAo+IChhbiBvdXQtb2YtYm91bmRzIGZ3X2NvdW50ZXJzX2RhdGFbXSBz
dG9yZSk7IHRoYXQgaXMgZml4ZWQgYnkgdGhlCj4gcGVuZGluZyAibGliOiBzYmk6IHJlamVjdCBQ
TVUgc2tpcC1tYXRjaCBjb3VudGVyIGNsYXNzIG1pc21hdGNoZXMiCj4gZnJvbSBQZW5ncGVuZyBI
b3UsIHNvIGl0IGlzIG5vdCByZXBlYXRlZCBoZXJlLgo+Cj4gVGVzdGluZzoKPiAtIG1ha2UgUExB
VEZPUk09Z2VuZXJpYyBMTFZNPTEgUExBVEZPUk1fUklTQ1ZfWExFTj02NDogYnVpbGRzLCBubwo+
ICAgd2FybmluZ3MuICBQTEFURk9STV9SSVNDVl9YTEVOPTMyIChydjMyaW1hY196aWNzcl96aWZl
bmNlaS9pbHAzMik6Cj4gICBzYmlfZWNhbGxfcG11LmMgY29tcGlsZXMgd2l0aG91dCB3YXJuaW5n
czsgdGhlIDMyLWJpdCBidWlsZCBhcyBhCj4gICB3aG9sZSBzdG9wcyBvbiBhbiB1bnJlbGF0ZWQs
IHByZS1leGlzdGluZyBjbGFuZwo+ICAgLVdzb21ldGltZXMtdW5pbml0aWFsaXplZCBlcnJvciBp
biBsaWIvc2JpL3NiaV90cmFwX2xkc3QuYyB0aGF0Cj4gICBvcmlnaW4vbWFzdGVyIGhhcyB0b28u
Cj4gLSBBIHVzZXJzcGFjZSBtb2RlbCBvZiB0aGUgaGFuZGxlciAoZmlkIDUvNiwgc2JpX3BtdV9j
dHJfZndfcmVhZCgpCj4gICBzdHViYmVkIHdpdGggdGhlIHJlYWwgIndyaXRlICpjdmFsIG9ubHkg
b24gc3VjY2VzcyIgYmVoYXZpb3VyKSBzaG93cwo+ICAgdGhlIHN0YWxlIHdvcmQgaW4gYTEgb24g
dGhlIGVycm9yIHBhdGggYmVmb3JlIHRoZSBwYXRjaCBhbmQgMCBhZnRlci4KPiAtIE5vdCBydW4g
b24gUUVNVSAobm9uZSBhdmFpbGFibGUgaGVyZSkuICBTdWdnZXN0ZWQgY2hlY2s6IGZyb20gYW4K
PiAgIFMtbW9kZSB0ZXN0IHBheWxvYWQgKG9yIGt2bS11bml0LXRlc3RzJyBTQkkgUE1VIHRlc3Qp
LCBjYWxsCj4gICBzYmlfZWNhbGwoMHg1MDRENTUsIDUsIDAsIC4uLikgcmlnaHQgYWZ0ZXIgYSBz
dWNjZXNzZnVsIGZ3IHJlYWQgb2YKPiAgIGEgZmlybXdhcmUgY291bnRlciBjb25maWd1cmVkIHdp
dGggQ09VTlRFUl9DRkdfTUFUQ0g7IGJlZm9yZSB0aGUKPiAgIHBhdGNoIGExIGhvbGRzIHRoZSBw
cmV2aW91cyBjYWxsJ3MgY291bnRlciB2YWx1ZSAod2hhdGV2ZXIgaXMgaW4KPiAgIHRoZSBzdGFj
ayBzbG90KSwgYWZ0ZXIgaXQgYTEgPSAwLgo+Cj4gIGxpYi9zYmkvc2JpX2VjYWxsX3BtdS5jIHwg
MiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+
IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9lY2FsbF9wbXUuYyBiL2xpYi9zYmkvc2JpX2VjYWxs
X3BtdS5jCj4gaW5kZXggNDFiYjE2MjQuLjA3NjJjY2U1IDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkv
c2JpX2VjYWxsX3BtdS5jCj4gKysrIGIvbGliL3NiaS9zYmlfZWNhbGxfcG11LmMKPiBAQCAtMjIs
NyArMjIsNyBAQCBzdGF0aWMgaW50IHNiaV9lY2FsbF9wbXVfaGFuZGxlcih1bnNpZ25lZCBsb25n
IGV4dGlkLCB1bnNpZ25lZCBsb25nIGZ1bmNpZCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3Qgc2JpX2VjYWxsX3JldHVybiAqb3V0KQo+ICB7Cj4gICAgICAgICBpbnQg
cmV0ID0gMDsKPiAtICAgICAgIHVpbnQ2NF90IHRlbXA7Cj4gKyAgICAgICB1aW50NjRfdCB0ZW1w
ID0gMDsKPgo+ICAgICAgICAgc3dpdGNoIChmdW5jaWQpIHsKPiAgICAgICAgIGNhc2UgU0JJX0VY
VF9QTVVfTlVNX0NPVU5URVJTOgo+Cj4gYmFzZS1jb21taXQ6IDZhZDI0NmExNDk0ODA3ZWU5MWUz
NmZmY2Y2MGU0YzMwYmIzMDlkNDUKPiAtLQo+IDIuNTMuMAo+CgotLSAKb3BlbnNiaSBtYWlsaW5n
IGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
