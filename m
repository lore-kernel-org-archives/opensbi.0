Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F82606A31A
	for <opensbi@archiver.kernel.org>; Mon, 26 Oct 2026 08:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pq+vyy1e;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=ep3rr8El
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2amWoMAt5Z1pquhik8cgLWMr/Gj1PHhmGSOmQR6QMZc=; b=pq+vyy1eHjiPwtv89QAz7v3vss
	2hfhY/JbtGSBbbDPWXROvXfjQQ13DcGdAfcxDPlKQxtXfW82bQlypI1Vz9V6ngXkNIQ+sKxD46PiC
	Pn1cEcYVypYnQF47U4i1zn3QZGUhf1UjMpvZbxAO/NdbU2If2l5vV1Hla0bpdjoTrXms2ppHrvD7X
	05rw7ro6n055jWxmMFuIw0hh2BIzyzzqtElRygsRqG705osGLQrwPJe7qD6nzoGuwMmyeGHqAzK1j
	H8fIGzaVsQgnmyNlpDxEm6CiNo3/ydxX9IzZdHdY0GgaF3srsZS8zsO6q/PyGHG40w3cpFg6XPQhK
	HEkqVorA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFtH-00000001vzP-2vX1;
	Mon, 26 Oct 2026 08:17:11 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFsw-00000001vyo-1p62
	for opensbi@lists.infradead.org;
	Mon, 26 Oct 2026 08:17:10 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so21882065e9.3
        for <opensbi@lists.infradead.org>; Mon, 26 Oct 2026 01:16:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793002608; cv=none;
        d=google.com; s=arc-20260327;
        b=R9Zm9PiY6eiLCk8Xwyc4gFJVuMtzNZdfKOA8vLoKadW/Mbu5FWEbkZ9wTjDtC3riGp
         eK77dR6CGdu2whC5RGBRGlCoJae9w/WPQqvj8ek+P4JJDd74vE3Y2B/Qs0v7XtmIbklY
         9GTxTjGUZPSS4AMeleJCpEiApHFsBmodLdw84PZe9KUkZhBv9BD9CxKNHpMfWWpFYbIA
         AhTMdB+T7PUlFJG5mBTViVtleV4fS/ENidVHl5SMmVag2nQ/EyC392e7b/SBg5l35heY
         /8qt6SDQAdDmzYmdotpFnU7gNm/v8Ao7dhb/yikK6snJVeVdHFl1gZQSB/xf2SrR4PuA
         LXSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ImBHwn+KxvVMshK6bbuNaNXAtu0oUR6JIFvjb3u/ml8=;
        fh=ptzNB7g9a30gS3iMdXy8hchchj5+04tEpHu43QD535Q=;
        b=K/GlmHy2uobodo1Dc5zOkRAbjW3nSwW0R1JJLRQ6IMzs7Rzd7hBpEWAaXVAbSfiLCw
         Q+hHjZ9rNY3MT48kcuvU7nrOiUXDX5K5EXrMqT6HijDzOI3upwlmpGRGSjEbcJV+mWfW
         99wrkVyM5Gx7g5gDb25d6hDrOHRxEbML481M4zqzkvKyaErPEd/FTAd+RbYA6yeP3hQa
         7Wg9H8gaeiXHTKyXI6NljcsSBaMU2o+RKBkebltqQVlMVRZrFmMba/Nf9REmfw5GFflA
         B9k2j00ye6bdRd1f5xVJU7pgdjsruWjo6E1cNvsVTzfVjFQg3szbd3u6lvhYiAZ1+YZw
         4jPg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793002608; x=1793607408; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ImBHwn+KxvVMshK6bbuNaNXAtu0oUR6JIFvjb3u/ml8=;
        b=ep3rr8EliFJyAOT8e5MlP6veB1Ocnxn2PFNsAIJE1mgI7VL5ORUt/HQ3iwVPVQsUag
         Vu65d5T9cdR4RURPkbbOd65loVigetD3wTCNIWWkwEETgGPyLnzRQvPPUwHdIOisalll
         X3nmrwMrG1MDJfSs3IbRFnPbmiG4nkd516BnhP3Ihq/VtdBqkKsXysmt3KA3dGGP+a6b
         NABcIwP8/jb6CvLmSJh0xbnn3yff1vJB43MVUCk7VWpKsqPgGrbIHxPq7Sp2rtoAJu9N
         za6j9mr+1c1lqaB7BRfPCHaNUih1tLFhOZ1a/jtGbF+Io7/unk1lIHgmZHiwMYCYHttV
         qe+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793002608; x=1793607408;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ImBHwn+KxvVMshK6bbuNaNXAtu0oUR6JIFvjb3u/ml8=;
        b=yGQa8ufgbUmTCcLZzEQ1Su2Aidda6gJ7nCGiSVCFK+hpuOm8oGdQtujwKB9meoBAgN
         EM80x/LGtF1722aTl2w+sK75PbLooWGAWhwFS3RJve7OzJAal4rH7CHBc9x2uzeUoB1A
         k5Zn/jXymp/3cQ7V5VP3n9cs+NkTJFKxWK283OPLPCozc8wIwk1lws1KvekNJIMvxcl+
         /hw9TQ5qGiun6eiBgHyXliUcRk/EIY5XhaHK4I1yxyf0bnloNc0xma576xbC+8ewqZzO
         bwWJJA9dz/SN6FNS40MZeLroti722X6J1jvTrlm01P2hvvjkUwYQ8GVyoClbDYTihKt1
         zRzQ==
X-Gm-Message-State: AFq9FYLrt1rvzeRsQwGFIpSIDFmJc5Ntr5trh8fheLS5Nn/pzdDXmz1x
	rQ5il6vBGB62LlDdSNj5SciBvfaoaxiHTE6Y61vFXhQcU0Y2Zf8p4QoSjEktcR1SNU2Yfjvyxvn
	B5lYFX3qfNXkQ3WZJJ7Q3hMIS1wXWgJ5X/BZUXMuENCBUY5djVm0vfRw=
X-Gm-Gg: AYBFou0t7kDjNotta/ChdEYguAPVTDG+q3+rcRsxh1fBSqFw1r9eHREe/9dE/1oJKas
	Gx3BJz83cXkN3jNdzN378oPGrSh1m+XxuWhkuoviimJxcP6/EZYkLVH+ShEeh7suKRbZPbv41yj
	iFb//b1UMScGtLUEmzb/0yZi7lIg5TmLPVC0GSR7rbfVaDpqBeNi4QTjaz7Zgd4VyG5JE2gtntH
	edAR3d0bIV0sAiMTNT9QYwkmn77/A2PKosGgRa6Y5CjTz4JP33UCCzPy4ZA59tzyp3GVJpnlQ6v
	bYSxKy4WwKchzBsrEbvvvO+1vQIWjtGWIrdgCNHN1+CLgVKt3dSQfK3zzm8OmbfU1oEGrsaqNUY
	KE59kgLsj/6nDxOaZOMtDZ6oDELTOIhwM7ItQ4A3LVMmN2zn8XdzfVWfMF7pCoENVpIRWkKmo2G
	EjD3Eyt/Ljy0MAROYnsNaAbnozx+ny2UEwpnHWnxikwWHVEXNJcBON0c0BKnmmO8i6cvrExyZeA
	TtrTA==
X-Received: by 2002:a05:600c:8183:b0:4a1:d893:263e with SMTP id
 5b1f17b1804b1-4a35acaa170mr91203225e9.28.1793002607546; Mon, 26 Oct 2026
 01:16:47 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260910052629.3359493-1-liutong@iscas.ac.cn> <CAAhSdy15MDJB09AUCuMuG1xtPxAyJUHtM5jDcquZ3t_2PvGMOA@mail.gmail.com>
 <20261026061004.2955544-1-liutong@iscas.ac.cn>
In-Reply-To: <20261026061004.2955544-1-liutong@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 26 Oct 2026 13:46:35 +0530
X-Gm-Features: AclHuK_Qgdg4EwnmQK4q56NMJ9yE0szl2Mx7mbj_jcFFrsbC2nCmcYMMo3o2xGU
Message-ID: <CAAhSdy3+Mj7mOQW3uYLFcDjJP6Ew0B8o+rX0NCZZoBXjcr-gkw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] lib: sbi_mpxy: fix integer overflow in attribute
 range endpoint
To: liutong <liutong@iscas.ac.cn>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_011650_494713_CC679452 
X-CRM114-Status: GOOD (  14.96  )
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

T24gTW9uLCBPY3QgMjYsIDIwMjYgYXQgMTE6NDDigK9BTSBsaXV0b25nIDxsaXV0b25nQGlzY2Fz
LmFjLmNuPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBUaGFua3MgZm9yIGFwcGx5aW5nIHRoZXNl
LiBCZWZvcmUgdGhpcyBvbmUgZ29lcyBvdXQsIHBsZWFzZSBob2xkIGl0IC0KPiBhcyBzZW50IGl0
IGRvZXMgbm90IGFjdHVhbGx5IGZpeCB0aGUgb3ZlcmZsb3cuCj4KPiBXaWRlbmluZyBlbmRfaWQg
aXMgbm90IGVub3VnaC4gYmFzZV9hdHRyX2lkIGFuZCBhdHRyX2NvdW50IGFyZSBib3RoCj4gdTMy
LCBzbwo+Cj4gICAgICAgICBlbmRfaWQgPSBiYXNlX2F0dHJfaWQgKyBhdHRyX2NvdW50IC0gMTsK
Pgo+IGlzIGV2YWx1YXRlZCBpbiAzMi1iaXQgYXJpdGhtZXRpYyBhbmQgd3JhcHMgdGhlcmU7IHRo
ZSBhbHJlYWR5LXdyYXBwZWQKPiByZXN1bHQgaXMgdGhlbiB3aWRlbmVkIG9uIGFzc2lnbm1lbnQu
IFdpdGggYmFzZV9hdHRyX2lkID0gMHhmZmZmZmZmZgo+IGFuZCBhdHRyX2NvdW50ID0gMiB0aGUg
ZXhwcmVzc2lvbiBzdGlsbCB5aWVsZHMgMCwgYW5kIHRoZSBtc2dwcm90bwo+IHJhbmdlIGNoZWNr
IHN0aWxsIHBhc3Nlcy4KPgo+ICAgICAgICAgdTY0IGVuZF9pZCA9IGJhc2UgKyBjbnQgLSAxICAg
ICAgIC0+IDB4MAo+ICAgICAgICAgdTY0IGVuZF9pZCA9ICh1NjQpYmFzZSArIGNudCAtIDEgIC0+
IDB4MTAwMDAwMDAwCj4KPiBUaGUgZml4IGlzIGEgY2FzdCBhdCBib3RoIHNpdGVzLCBsaW5lcyA1
MDAgYW5kIDY1MzoKPgo+ICAgICAgICAgLSAgICAgICBlbmRfaWQgPSBiYXNlX2F0dHJfaWQgKyBh
dHRyX2NvdW50IC0gMTsKPiAgICAgICAgICsgICAgICAgZW5kX2lkID0gKHU2NCliYXNlX2F0dHJf
aWQgKyBhdHRyX2NvdW50IC0gMTsKPgo+IEkgY2hlY2tlZCB0aGF0IHRoZSB3aWRlciB2YWx1ZSBj
YW5ub3QgZXNjYXBlIGludG8gYW4gaW5kZXggb3IgYSBsb29wCj4gYm91bmQuIEluIHdyaXRlX2F0
dHJzKCkgdGhlIHR3byBsb29wcyBvdmVyIGF0dHJfaWQgYXJlIG9ubHkgcmVhY2hlZAo+IGFmdGVy
IGVuZF9pZCA+PSBTQklfTVBYWV9BVFRSX1NURF9BVFRSX01BWF9JRFggaGFzIGJlZW4gcmVqZWN0
ZWQsIGFuZAo+IHRoZSBtc2dwcm90byBicmFuY2ggcGFzc2VzIGJhc2VfYXR0cl9pZCBhbmQgYXR0
cl9jb3VudCB0byB0aGUgZHJpdmVyCj4gcmF0aGVyIHRoYW4gZW5kX2lkLiByZWFkX2F0dHJzKCkg
aGFzIG5vIGxvb3Agb3ZlciBpdC4KPgoKSSBoYXZlIHNxdWFzZWQgdGhlIHU2NCB0eXBlLWNhc3Qg
Zm9yIGVuZF9pZCBhc3NpZ25tZW50IGJlZm9yZQpwdXNoaW5nIHRvIHRoZSB1cHN0cmVhbSByZXBv
IHNvIG5vdGhpbmcgdG8gYmUgZG9uZSBmb3IgeW91ciBzaWRlLgoKUmVnYXJkcywKQW51cAoKLS0g
Cm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
