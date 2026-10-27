Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E82606A31B
	for <opensbi@archiver.kernel.org>; Tue, 27 Oct 2026 12:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fdczVjuU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Vay21i5u;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=UIVyfg8V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jfk+MTgVjb2grh22D+y5FS8a7frYVdaFlS4bnioz4H0=; b=fdczVjuUuNkQayWgFM2+jKyedD
	MIWXHW7P368OpMdw5Hz43qSti0oKtOh34p/nrjXpx5KhG5l22qu55Teq6NHibuaPp8+N7FOujSRTi
	g+0PbcfBqatb+3To7wotILQl+iczVZsJJirQ8jjwhQxuY5iD7wftOjCrpYtzepB+UPw21qrTNczYM
	ZvboGSbiTAxV8BMFBbgNNLu6UolIJb/rJddM63H8BqOMYwDZ3HTAgevr3rH6czdn0tb1fD70WfaLD
	VxfVnRTgw4P0vPLKAylOC+qI0QF/y9ZymZhZ9xJmQXv4ixPJwNqJ/Yg9PsAXw8W381krZxJcG7bav
	K6313aJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfzV-00000004ZiX-3cGA;
	Tue, 27 Oct 2026 12:09:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfzV-00000004ZiG-0KB7
	for opensbi@bombadil.infradead.org;
	Tue, 27 Oct 2026 12:09:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2JZXxzQWapsO6L7Tj1Eo+FFOc2TvdumNX0cfNdX1eTc=; b=Vay21i5u1tr/APRGO6n+eUHqZ4
	JdMv7WPbBnuPpU6sC9hPoZpetacYMpKYaksymJu7Y5t/Fg9GmGsjC1KDcjDGFRzN5fU6zI57NU7Pe
	AyI5IgVF8g7/IVIigNFrOMUJ2nqCQvy4CmITsqZjJkY2wJxPvu/u6fsJrqpOxBnlGSRDLrCgzVO32
	uc3n/BOAWTyp144pVn/jqAaqtKGkLADRiXuMGAMgmfg7042wy6BiRvgtJJ1NQ0/hVwz9OpaohmdF5
	Z7Hua3wZi5QhSYZOkucg30niFjh41oExrGQL2CkggW+5Fc2XHduoenJduh6yP8bQaV+iFe4NBHuc/
	EgiLS4Qw==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfzR-0000000EuMW-46q1
	for opensbi@lists.infradead.org;
	Tue, 27 Oct 2026 12:09:19 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so2417355f8f.3
        for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 05:09:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793102956; cv=none;
        d=google.com; s=arc-20260327;
        b=sRkVZ4V3daq8pFesHfWNK0Aq6o1dNKg38osNG5cJSpJxF7wd6JKXpHwqkb47b3krw/
         L5DABrlmraJGufIXeCj9GTPGEsP2I5X91lG7fw/6upKx68hN0jPTOwMheT64OWYICeGH
         JP0QeelFbmjYojplAmkmiVbz+t8xLIkzjSz/vhMMb+E3DzeGCB3h9bV4PwD/ZZj0yghd
         cDYw97+etXNGOCV5myEh5t35tCOzpm02t6EzN/6k6QYZ/iUOu28qAyW75Tj3Em5IHPgf
         ndob+2e8EhiSCIzIygeyXEvA/5ekmTJyCrg6gjkrpZ/L7BgJNy2rDjm/vduUSQJRPHXW
         K1gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2JZXxzQWapsO6L7Tj1Eo+FFOc2TvdumNX0cfNdX1eTc=;
        fh=qxHRvThAguVz85f9a94novwCNuCNTJG/S+nmMisKmkw=;
        b=oNzjtSR9NLukuzz5uQ/Q3ImUqFuQXSKIXImjKbLnPrT9yvU+Fm57gl7D2pso97h3Sr
         THANgRFaQGyWYBWoSv5cGqjXvn0oBstFWJ4j2FNLGnUyNuDnxG92lsdtLTkvOCBRST4j
         T0EiujiOoNlqW3Wyf0bnUOxL5WcO+DBjOjezjznrGD5+RWVf9fSyehTEcpXJIGXDL/+v
         kf+pp9Lco7hppAoEjRqm/tgYjobkFZqc7Hn5L48tntCQhDSPOwhS6g8aIXCAvY+AnUo5
         VmPAc14Lqo4ISEnOI5vuLI16QuY/rF772TU1BJidMVKPkP9Pro/Max1eIPQmu2Q7wZA2
         Uh6g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793102956; x=1793707756; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2JZXxzQWapsO6L7Tj1Eo+FFOc2TvdumNX0cfNdX1eTc=;
        b=UIVyfg8ViD/OmuY+Ls5A0czMs0xgUfpM0RAzQ1oKxRNjuYp2Owhp/JyD/CfCiS9yAZ
         BMr2XBJiI7qQ+U5yNhN8f86UprfcBbZsNwrPngzvYP7EMgDjrtThg7SlVnzDbzt14DCT
         j6aHpp1QvdUVwzQRd26Z9SVYRLcHWcU38PGJHLwLhou5k+SD3akriVftNy5rnD85OfK7
         ShJj3onpvsrEPJZNXTs8tiIBaKbxsEYWqPMzrKjglwqhb2moKxSUwa9qgijhl/KBhsah
         pYp6XOjPLmd/o3OktDKrQWbVvJhGfjK7vg79zaUIjikFNxIEUjzHmOsdNkHvu6iiX9Tp
         WtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102956; x=1793707756;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2JZXxzQWapsO6L7Tj1Eo+FFOc2TvdumNX0cfNdX1eTc=;
        b=0AoIzIbn5b7yYPPOmNH+HrZ5CSMjlRMxhfnJs9sCeWqAvKZao05eNzJEffXniA49fC
         u77YVZhPRKSpgW+5lgmfdpVz5ldDwdTi1rO/+F+jOPcyyqgVMG+ig9WanwhHs6EzI5Si
         j0FX+XWOuKhcvPcbgu8EEu/FQ6Oj2kXOkZU4YVK+4B2gYDIQcDhNLWqI7kMdyRxYZoS5
         fABoTQkrazfM+BnbKUbzTCAYYNJu2r5bBXX1ZMm+OawzZUeQbjHzZwy/+MzSaFopX4gq
         W8qpVaV0NtdL1ObeOY1obArZVTk2wIrbTklL9Vt5AaZM6kP3pYqpg4JGIX3PWHHfGWhp
         3ZiA==
X-Gm-Message-State: AFq9FYInp3lxEdinJNWt/1/aEp5qqan2SU+I+cLsY1CxGjDIlOg/1iYE
	NwE/1z+kU6lfgktb7wjSGTOmkPq3+jacXddf5waR+b3jO3I0PDFyc00JIhx/p8LTJq5TvKacmQ5
	8rnnzIMOgiu8uDXshKhxZGgdbnxT6dQtHS4Ov4WYRvYf5PdkQxUSZ
X-Gm-Gg: AYBFou2W+xpZJJfkzCha/lSzZVKhaP6h20Oy8ygxBMJJiu0fyuZGLC2UzrOV73KbXj3
	8YmRgCpGxMqXwHp0BuemERb/kh7g85f4JMtrtB0slrtbeQfASf12u+0+rMBRVUs7t+jhjulEqBa
	d6ObLWxVPNZIbVxFtG1vH83Od6FIfhfNBq2xBuxvZyMZnlxs6YHoGQbRxNnOi1/OrZhGnsSDj9K
	LwDla4LcVGQFyZaWManBt6MzhbpsDf7OJwmnUghz7xnN8/P0KNWV05Q4Jsy3w0wlWG8+icFziPe
	JY/zjrYhQ3zGJKwXAKrmXj85L3u0ofjvrnmSID2WgzMNssBJ+anSqbKB5LuVAj23UP/WHU191Sr
	3RDaoyVLfqXbVPNfWC5Rqt3zGkkkiZqkj99CqiOtDmOKCs66sztCl/xTubJufBjHw2OtTc36FFN
	5kVNIBa1NNKOffj5eDgMMdgI17QlPSXBPHZR4bcgPbycvLgio3SsGuIaI=
X-Received: by 2002:a05:6000:25fd:b0:48e:5071:420 with SMTP id
 ffacd0b85a97d-48e507104famr11307625f8f.2.1793102955498; Tue, 27 Oct 2026
 05:09:15 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CAK0z5OmA2vwJP3bM+cBjcTxNb_5zFpwAaY5ttdtVo9CLDUsYAQ@mail.gmail.com>
In-Reply-To: <CAK0z5OmA2vwJP3bM+cBjcTxNb_5zFpwAaY5ttdtVo9CLDUsYAQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 27 Oct 2026 17:39:04 +0530
X-Gm-Features: AclHuK88K0vuvMzYdNzitGrco1wQCrWE_wXa3HrSYHTEU8c7Rwupg6d_CAPf-Sg
Message-ID: <CAAhSdy0qxUSiKiaCL6iBb7iOn5UtGok6o5RPNM8E9gCDJS_HKQ@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: pmu: Validate reserved bits in counter config
 match flags
To: Moksh Panicker <mokshpanicker.7@gmail.com>
Cc: opensbi@lists.infradead.org, security@rustsbi.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_120918_115165_970F5032 
X-CRM114-Status: UNSURE (   8.06  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
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

SGkgTW9rc2ggUGFuaWNrZXIsCgpPbiBTYXQsIFNlcCAyNiwgMjAyNiBhdCAzOjA54oCvUE0gTW9r
c2ggUGFuaWNrZXIKPG1va3NocGFuaWNrZXIuN0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gUGF0Y2gg
YXR0YWNoZWQgYmVsb3cuCj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vb3BlbnNiaQoKUGxlYXNlIHNlbmQgeW91ciBwYXRjaCB1c2luZyAiZ2l0IHNlbmQtZW1h
aWwiIHNvIHRoYXQgZXZlcnlvbmUgY2FuIHJldmlldy4KClJlZ2FyZHMsCkFudXAKCi0tIApvcGVu
c2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
