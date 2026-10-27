Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1A8606A31A
	for <opensbi@archiver.kernel.org>; Tue, 27 Oct 2026 07:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oqeY1gmQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=mThNMEsN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kEC8YT6rlSz5chaed5+++qF+fZVw/IddktUfgyUKJw0=; b=oqeY1gmQLkVP4E5BjtqZjqKhuN
	TvKKCjiD2Afw5ka3EPUQQyXDsPz/o9fArP4gudvrsS8H40GNB9gldj2BJdQMcmhn/Cz1IkALcLNmi
	aZq1PNCKky3z1HokBVDsVFFr7CnFFuS1RMLnB9zBzglZv2rODft/unay15+nceZfSgiePa65NFsN2
	6AeQ0mG63hWD+dNs2ZYfIb3eSW1z2aWpwi769HQmJdM05M3wyIgPWAbgcZJbhOxmJrm7ASD5G7lXy
	y85T8jHcielEodCZwqLZpg3DfEr+m7AEwgN659oBIA3aVDxDTvabL8j5e5xwEEogijl+bqHoWFTzL
	gLTs/E+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLc4p-00000003y10-1myc;
	Tue, 27 Oct 2026 07:58:35 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLc4n-00000003y0c-059S
	for opensbi@lists.infradead.org;
	Tue, 27 Oct 2026 07:58:34 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48c45111bebso1709352f8f.0
        for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 00:58:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793087911; cv=none;
        d=google.com; s=arc-20260327;
        b=YdhpHsk2YGeEtigGIBAp4qXDIZFLK0MIcttbB0AgLkdRkPIYDycX8y8YSwROPUiyal
         9epG15eU0YvsD0z9WfcRW9kZnyErPuAxB9rSv2jAIyNHxt4x5duiPtdo2WsEGf05kifi
         OXYbe+fcH2i5+Fk4YNrjo/rxHjXyv8SEpjdrgLBWx3qIuFsqRyRoLvPi0FKTkomz/Gz5
         5wtJT/2mviQy6Nz7c5LVjYWUO4jJU40nANoRFSvoOx/8Jh9pYqU8wU0Oz12mBhUoBAJ4
         9hASjOkK8AO9ylExGpmn1LL1rQ+7ap3yzkXJX0w/OknB2zYRy5C3YL5I3c+LFnEMBnVH
         bG8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yfs8gDTLSOa+Yy2seN3Jn5u9MB2W6ZJhFK2sGZmGCnI=;
        fh=TjU7NMYSld7Jj4ieqz061XUpZBxhA3P3ND1Lkz3B2GY=;
        b=e0v+W1nEmq3osCpzmv0roaaU+zfnwpfA/8O4OxLHc179j7xDrBFHVJDwIDaOzysGJ/
         89MvypuECqbgdGAfcGni2h3xuxC7DupWXthQs+ocHxE5QpXLLk43o1qLmKtFTfGPTg8U
         QDE5l0bKHYV1egw5bcsyBpzJheDGk1rqT4Kg/zcvWiSw7aaWVW58J5///LJ4aC/F3F+P
         XLnNc6mzDjOmcRtlfh4w+xStwfPWqEtQ5u+cAP8kJfWLKE3CsjUUvI7RmOGKuuMGbJ59
         1F5mtrr9SQeWGpJqj+9qfbSY1FcsOKdSPQnJvJ3z0j6ujIPxNsdCqhYSf+A7VPJ7EiwJ
         Tseg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793087911; x=1793692711; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yfs8gDTLSOa+Yy2seN3Jn5u9MB2W6ZJhFK2sGZmGCnI=;
        b=mThNMEsNKaADogbokAdTe1VMrj7Qts1rLPijubovjxEd7I213Zisk95L+d443Mam6G
         XI8G2ez30WZWsJSW8ZiBLtZWbpspyAbzDXWrjZG1n517BG27lH5nrtAJrz9SNQu7mXil
         +Fyi95oTD6BW9aCggoO9EMyjYIS4KOesGtQM37xJz/6GtdqpuoiiXEbTud+eckgKwPQJ
         rDzcS0t61mxw0yVjGFBm9/QxKI8y0yP2NSmS5JIlGUwzKHnhdy3r4TJlt3psMtEXqejR
         ZkhEE30TTQMLTIoYZUy2uSAXWARbs5isrzFdBaeSOKJC6E9rdnq24T/qu8P1zAxHvYvU
         zsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793087911; x=1793692711;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yfs8gDTLSOa+Yy2seN3Jn5u9MB2W6ZJhFK2sGZmGCnI=;
        b=Y9o4F3evKFpZ3dM4LuXmuu6efOrgMZM4k60JYPt1PqjcPtiUdSHf3stCmx/clLIO2K
         qx+T8NUlYcMDFwcss76jDFOagM3noqviDPGsCff6mCxsrVDSNPv78uFsSCiApGgUX3fO
         uBHAfbgckZwdMkqJud65thLe2vSLqe/WQpuNOFH6rfXYlQo5tHnOZynCobrg+gAKT1Ku
         3ZnyHjzG03fBwrRsAUs1DfGzo5pKGk+1lhuUMthPOy21L85F3zP87yXOb3Ou5gCgZ84Y
         9NndPLFsKhSMdcau4KOKfUdWSWBwbbDYRi6JZt8sA6DmC9a8S9k+Di7IrBeLPSRxgvdA
         Ur9Q==
X-Gm-Message-State: AFq9FYJx1EMtVoi9RvklqRR0DMq2AXQE5yQEq+h/4nOTK7r+4Ev6o15F
	CQ56t7kTGWxGLYhAQ/Z6GyLdzHSpUN/ojOmYBA/znCKDDeq2iSCJO3qSRlQs46ET9ECnx756t+B
	DPAUx6vJAEFg656TrxBHyRC+R0TGwNPlOQGzahGQpzQ==
X-Gm-Gg: AYBFou1P09U9Y3eQC/k9igM+jgg3jnbzdr9+pFlkSQxbZ8yAHXkUo+iW87VUEqxRaqX
	7bh2OWNH7eId3IaopD10xRUd7TvjjeV4SDIRNW1Mxzmr8hQpzysYyjZVn6sq51EQoR+kFaEIV7J
	OFvIUcnyRdA50G3ApXNcV/8LWQiTRreqSVk/Q7N/R83/N/uX449gA80EcqZSjQq5GQ+1c/06nbD
	otbcZBI/bLebMJ8N9ZThH9z9sIyoVxiFiY4PQDa96wsULGnHLappaVVtkUamtwmDKOctZNTCZzn
	DaUf6+FJlwe83zDOFKfMaY0BZm1zJitviTBWc2Q7NIZb0iVcOUtN+v4ncHkPznK+YNhHpDm2b94
	n+hidaLx5Ycocw3a8wWVB+Y9g/nWO4SV2m/33A0hL63gVLa2T+RM1zh013ju2Ld+xjezeE6Xyca
	GoxG/kZ8N/stLQsoKpZ4hyfNccWvUeHN1vG+Nzi1ZR/ium/mmRuEDoqG0O
X-Received: by 2002:a05:6000:2586:b0:48e:4f09:5350 with SMTP id
 ffacd0b85a97d-48e4f0953c8mr11270486f8f.32.1793087910953; Tue, 27 Oct 2026
 00:58:30 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260914-trap-context-fix-v2-0-3a6bedc6fcf0@sifive.com>
In-Reply-To: <20260914-trap-context-fix-v2-0-3a6bedc6fcf0@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 27 Oct 2026 13:28:19 +0530
X-Gm-Features: AclHuK9GeaYhB-IAf3pqpiwLeoVNpAy82x7eugXYeW24E2gihY5aZTc388a5OWA
Message-ID: <CAAhSdy2RQAru-Bpbg_JvqY6cniTj3YDBR_DLx3x2+asGFu9Jow@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] lib: sbi: Fix stale trap_context/prev_context linking
To: Nia Su <nia.su@sifive.com>
Cc: opensbi@lists.infradead.org, Evgeny Voevodin <evvoevod@tenstorrent.com>, 
	Nick Hu <nick.hu@sifive.com>, Nylon Chen <nylon.chen@sifive.com>, Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_005833_099669_9075F374 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBTZXAgMTQsIDIwMjYgYXQgMjowOeKAr1BNIE5pYSBTdSA8bmlhLnN1QHNpZml2ZS5j
b20+IHdyb3RlOgo+Cj4gUGF0Y2ggMSBjbGVhcnMgc2NyYXRjaC0+dHJhcF9jb250ZXh0IG9uIHdh
cm0gYm9vdCwgc2luY2UKPiBub24tcmV0ZW50aXZlIHN1c3BlbmQvcmVzdW1lIGp1bXBzIHN0cmFp
Z2h0IHRoZXJlIHdpdGhvdXQgcmVzdG9yaW5nCj4gaXQsIGxlYXZpbmcgYSBzdGFsZSBwb2ludGVy
IG1pc3VzZWQgYXMgdGhlIG5leHQgdHJhcCdzIHByZXZfY29udGV4dC4KPgo+IFBhdGNoIDIgZml4
ZXMgc2JpX3RyYXBfcm5taV9oYW5kbGVyKCkgdG8gbGluayBwcmV2X2NvbnRleHQgb24gZW50cnkK
PiBhbmQgcmVzdG9yZSBpdCBvbiBleGl0LCB0aGUgc2FtZSB3YXkgc2JpX3RyYXBfaGFuZGxlcigp
IGRvZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBOaWEgU3UgPG5pYS5zdUBzaWZpdmUuY29tPgo+IC0t
LQo+IENoYW5nZXMgaW4gdjI6Cj4gLSBQYXRjaCAxOiB0cmltbWVkIHRoZSBjb21taXQgbWVzc2Fn
ZSwgYWRkZWQgYSBGaXhlcyB0YWcuCj4gLSBBZGRlZCBSZXZpZXdlZC1ieSBmcm9tIEV2Z2VueSBW
b2V2b2Rpbi4KPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjA5
MDQtdHJhcC1jb250ZXh0LWZpeC12MS0wLTZiZjdmYTQ1ZDVmMUBzaWZpdmUuY29tCj4KPiAtLS0K
PiBOaWEgU3UgKDIpOgo+ICAgICAgIGZpcm13YXJlOiBDbGVhciBzY3JhdGNoLT50cmFwX2NvbnRl
eHQgb24gd2FybSBib290Cj4gICAgICAgbGliOiBzYmk6IEZpeCBzdGFsZSBwcmV2X2NvbnRleHQg
aW4gUk5NSSBoYW5kbGVyCgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJh
aW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMgc2VyaWVzIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJl
cG8uCgpUaGFua3MsCkFudXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9vcGVuc2JpCg==
