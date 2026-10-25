Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50954606A31A
	for <opensbi@archiver.kernel.org>; Sun, 25 Oct 2026 08:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iBaTgirl;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=hcGUmNtm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/7EG8HI5fKDaXA0vsR/NYrkf3DAMJuQavklZH6rn/AU=; b=iBaTgirl/lwZank8YLljEINogk
	Z2m/plJkAXyoJ5CIap4XsynRHi2JxoMxK7o3liVU/SJhMDIB0gkbv79dYwv22gXFgprEuhvGwbx20
	IThEp9ccKZTPc0f0JRiwcOgqCXXfuZpEbstKxBWxKVuN76Lc52MkFmh72aP8GlKmgD5Vg1Ia7rVZ9
	m9RCePu8ydWvaF8ngfuRpyDozNeWbYMFpwf4dNQhogoUJ8akr0dAie+/jzSto+b0rJ7OQVcsPvTSO
	mSBt32PcI6XPGvU1b7RfyjPFEGmMD6qN4SzFio7y7LvgEqlo4rRxgq5HIhgjYBNAYyFNUGr4Hu7PJ
	Wv0vrjWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKtyt-00000000uNi-3FiN;
	Sun, 25 Oct 2026 08:53:31 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKtyq-00000000uNN-3pJu
	for opensbi@lists.infradead.org;
	Sun, 25 Oct 2026 08:53:30 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so1250423f8f.0
        for <opensbi@lists.infradead.org>; Sun, 25 Oct 2026 01:53:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792918407; cv=none;
        d=google.com; s=arc-20260327;
        b=FSYXoLbmdemAhoeTUys2HC6gjrm8lciDhJBy51arXJi0o5kc14wOSkjA4i7qh+4a29
         lSeQnAlxXpr+hlE7k1NszntiQ7fnFWdFZMHU6WYLqHARRRHeCFk3i4fi8pwGiO2L+8Yc
         tS1j3PEGX5jGdIOw8ELS5/xqyNLsV/Ogf5aDdhWct+dyrWS7cFvA1fnLvt8+jxeGNFpo
         Znet1MW0odHByPIbSCQP+I9O+2k/vMstUbPt4RGps4qcJmRx2JPUJk3S9D2BLWPCnOaU
         ldH7uHKjpycIlcim3J/A623l3MYerMhr5/zlhjUzclFIcnfTvj/7LJ24X+0OX+Ig8w3m
         zusA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QuXDkHKvUbn2IrN40ggz3VflcRgTBdQIDAovTxIvZks=;
        fh=w1sQTthhun7iHXZ4nnvjwGqAmGVCTU+wYHW0CT6WtOY=;
        b=RIi4+ogtcraxbazNdo/3lcWjiMmsxq1a6W6AT6YOdwSmIs+q+nZc5f+yjEtPfNyheN
         rFHC+rL8A2Qux1ejPCQDj/KW6mOQ3coBJaClQwSGFcOhFzuPdq5keiB/7ynPTM5kL7Cv
         /Sgb1BOMPkTt/t0jvAHWmQ+CEjM+IGgzNKj3Lw50UN22AnUzhTNlSLYzAIIlBH8gmLq9
         VOq85ToueElsXemxOMu0uLM0NF8C3FSvnXKG/p1o53UyH2zMvxh99FbsItz+HO89kac7
         oHcyl/ZtGR6emP7fQQ5WEbUyJWqj1K1PUzh5DQb24KX7yc3xsV7BElDfcpVRWkHWSUDl
         jdNw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792918407; x=1793523207; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QuXDkHKvUbn2IrN40ggz3VflcRgTBdQIDAovTxIvZks=;
        b=hcGUmNtmjNm3C+VlnLVyfvtwQIy5aj7+mzDeA4W/fIUOM+p9GQUYSDQMb1pgr2BBod
         EVqOsYQutiDA3N4tUwAWmuRuN/FwfrrJOiyWiCrSNzNJxcPjuQeQpOSoYBOKaNpKdcy3
         OjZ3wpW+9fC829AfGGJDaMYjAmdcF55YL/7QjRkdAh0JOXeyTvM9kWBO1eUQG/DpiqKG
         FYTgQCSKK3u63U422sNqqmZ+8MytP0cErQKUfepbtv9svJd6BPvNIJwJhP7nHAZ4e4nv
         RHcMKm+zRPkf8tIHWU+UtHMiOL/EduiaorNcdjIbxnzS+7hzp85VXG3xOfu24mqbECJj
         x4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918407; x=1793523207;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QuXDkHKvUbn2IrN40ggz3VflcRgTBdQIDAovTxIvZks=;
        b=UNYt37QtExCFFaE4JNCNBpcrD/CwCK3Gymg/apr57yjN9NHoUSpDvr2ChcvYlLGkV7
         az0hDcJJCmXkwpkCzPyZBDtvwqmseYBTA9+NEhz7LoVsaR3IyaghzTtoqQkhJb87w8Xq
         IsIAjQkYYi1VyPJPMAz5Qqey41msZVSD+nT4408ygbSmmFJxPTJ9MVsplL1yDj3KA09l
         uLitsp7zjkPf533lNiVKcrKn3KvAxss4CKcdy3s17uelHGNin2T53KklAJO9HGokWWj8
         LdW7mIr0WlEMwFNoHaJW/NPFh+Kg9yGDib4uAwVFSz1j0PD0NvckhUDw1khQSaKcrmjK
         8Bkg==
X-Gm-Message-State: AFq9FYLQ+ocaFSzpwNwMl8uIYewFKcV3DJXf15nQTsmNpWuOHOUnm/ts
	Ou0W0DekOTbcrXqKuePhVP12nES/FSRaqLKWpE00mMhCXTuYhCOEROmC+wTNiK/wfLlUqMvcT9/
	tWcPQvixv/M/RAYdb3mBxS0KNCFP0P5woyxBWkGi9Bg==
X-Gm-Gg: AYBFou0szJxahhZYlqy3jg5cS9RB1i5A+roGqLv3J/d5qQXYkZxoSmHMtRVltXw76mT
	a9WCsKJT/aL/5Kda5+e/qpjNzXaWanQFn7zKKOjN0ayAl35PRJWkhVz1SKyE0EgnQ12z9cfFDTz
	BtWNiHyk5MPp03AWb4gF/cCTgVQay/uhZxzaElCib85tswJ7YIy+KeO3FZqylN7yBgYC7lodzVH
	jaVG48ngRtv674Zhodo6uYbnFQfpdBgZf/SlISp8OXF33mtxq5MSBcX6mgRvKZJPZ7jm7hMxY0D
	9lhglScgA9akdrheB2kXBnhVJUYwbeJyt5ufLUQpuE5tHE26jobcSNCD/UXkWXpf1wSdhQYMpxr
	ViOdphw2d9RyAXdeeEwGPUBBnq8xZdZJcM+6dWdxi/+hb2bAhDeckdKdVm4Urqq7W/CQ+5QhaMO
	EiNSxL8wvMoOliTbkuCvQwetDmBFwqW5fL330cclqLC6rYW3xzdn1Xq+jF
X-Received: by 2002:a5d:40cf:0:b0:488:8da2:4b0e with SMTP id
 ffacd0b85a97d-48e3ed3e5bcmr4502680f8f.21.1792918406901; Sun, 25 Oct 2026
 01:53:26 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261001084412.1383854-1-prajwal.n@oss.qualcomm.com>
In-Reply-To: <20261001084412.1383854-1-prajwal.n@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 25 Oct 2026 14:23:15 +0530
X-Gm-Features: AclHuK-Jqbur1I_XXNK5cnsU4nTsZU_sXYE-DlfIgry1_V0s1398Rj3hoRuvhOw
Message-ID: <CAAhSdy1Aw=PeROhjf--f=dzumzMaTRNNOzDSgP=hBwPagtafxA@mail.gmail.com>
Subject: Re: [PATCH] include/sbi_utils: Fix warm reboot failure
To: Prajwal N <prajwal.n@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, prajwal.n.oss@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_015328_996048_DE511808 
X-CRM114-Status: GOOD (  17.28  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBPY3QgMSwgMjAyNiBhdCAyOjE04oCvUE0gUHJhandhbCBOIDxwcmFqd2FsLm5Ab3Nz
LnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBXaGVuIHNiaV9zeXN0ZW1fcmVzZXQoKSBpcyBpbnZv
a2VkIHdpdGggU0JJX1NSU1RfUkVTRVRfVFlQRV9XQVJNX1JFQk9PVCwKPiB0aGUgUlBNSSBzeXN0
ZW0gcmVzZXQgZHJpdmVyIHJlcG9ydHMgd2FybSByZWJvb3QgYXMgdW5zdXBwb3J0ZWQuCj4KPiBU
aGUgZHJpdmVyIHdhcyBjaGVja2luZyB0aGUgd3JvbmcgYml0IGluIHRoZSBGTEFHUyBmaWVsZCBy
ZXR1cm5lZAo+IGJ5IHJwbWlfc3lzcmVzZXRfZ2V0X2F0dHJpYnV0ZXMoKS4KPgo+IEZpeDogQ2hl
Y2sgdGhlIGNvcnJlY3QgYml0IHRvIGRldGVjdCB3YXJtIHJlYm9vdCBzdXBwb3J0Cj4KPiBGaXhl
czogNmEyNjcyNmUwOGU0IChsaWIvdXRpbHM6IHJlc2V0OiBBZGQgUlBNSSBTeXN0ZW0gUmVzZXQg
ZHJpdmVyKQo+Cj4gU2lnbmVkLW9mZi1ieTogUHJhandhbCBOIDxwcmFqd2FsLm5Ab3NzLnF1YWxj
b21tLmNvbT4KCkkgZGlkIG1pbm9yIGNvcnJlY3Rpb24gaW4gcGF0Y2ggc3ViamVjdCBhbmQgZGVz
Y3JpcHRpb24gYXQgdGhlIHRpbWUgb2YgbWVyZ2luZy4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0
aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBpbmNsdWRlL3Ni
aV91dGlscy9tYWlsYm94L3JwbWlfbXNncHJvdC5oIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3Ni
aV91dGlscy9tYWlsYm94L3JwbWlfbXNncHJvdC5oIGIvaW5jbHVkZS9zYmlfdXRpbHMvbWFpbGJv
eC9ycG1pX21zZ3Byb3QuaAo+IGluZGV4IDdhZTRhYmUwLi5iNDczZTVmNiAxMDA2NDQKPiAtLS0g
YS9pbmNsdWRlL3NiaV91dGlscy9tYWlsYm94L3JwbWlfbXNncHJvdC5oCj4gKysrIGIvaW5jbHVk
ZS9zYmlfdXRpbHMvbWFpbGJveC9ycG1pX21zZ3Byb3QuaAo+IEBAIC0zOTIsNyArMzkyLDcgQEAg
ZW51bSBycG1pX3N5c3JzdF9yZXNldF90eXBlIHsKPiAgICAgICAgIFJQTUlfU1lTUlNUX1RZUEVf
TUFYLAo+ICB9Owo+Cj4gLSNkZWZpbmUgUlBNSV9TWVNSU1RfQVRUUlNfRkxBR1NfUkVTRVRUWVBF
X1BPUyAgICAgICAgICAoMSkKPiArI2RlZmluZSBSUE1JX1NZU1JTVF9BVFRSU19GTEFHU19SRVNF
VFRZUEVfUE9TICAgICAgICAgICgwKQo+ICAjZGVmaW5lIFJQTUlfU1lTUlNUX0FUVFJTX0ZMQUdT
X1JFU0VUVFlQRV9NQVNLICAgICAgICAgXAo+ICAgICAgICAgICAgICAgICAgICAgICAgICgxVSA8
PCBSUE1JX1NZU1JTVF9BVFRSU19GTEFHU19SRVNFVFRZUEVfUE9TKQo+Cj4gLS0KPiAyLjQzLjAK
PgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
