Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89883C982FA
	for <opensbi@archiver.kernel.org>; Tue, 22 Sep 2026 16:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=umnfQzE+2vCaBzHV6PuOkkJOhpONBQqdr1e29QiSmVA=; b=enAPTO4wncqTP/
	3R6Hsl0GHr+iqoqoRCMf6eGz0oSPwFk18E4xbXsOOAO32qq9OgkTAAm6x0lPF9YY87V/ppIsRXG3p
	/Kbv5W62blUe2tlEXy7cnusa9t35oJXmtAe34pLCsDBoDJPmaDi/wm9cyddai56YKQOL3T51OWhul
	WLvmektMndBGBw9pp2RSKQYcoLdvV8ZGWLeq8MRQHpkiRCVCYon+84uNcboxFvfNVFGFivzJnwV6S
	efdxsZA6coFeiDMDfwf7OO+SJSw2fN+0w9e3FqdDCZjKYSsIxsiTdElapvi3CA3ZJ+9KkqBfn26ji
	zqcxQf2wHVHNALlf5AhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93mI-000000067GG-1BxW;
	Tue, 22 Sep 2026 16:55:34 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93mG-000000067F5-16ms
	for opensbi@lists.infradead.org;
	Tue, 22 Sep 2026 16:55:33 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so26091595e9.2
        for <opensbi@lists.infradead.org>; Tue, 22 Sep 2026 09:55:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790096130; cv=none;
        d=google.com; s=arc-20260327;
        b=GJqVywO13nc5MaBeVLj0b9tdYoYWlIROtN0GLcmYQvhngdFzTRY/2UqCA+ZNAJSjK0
         Czmvc8fyL6waC0OTTqRntBePKCXD/OJOEBUDrt3GJApbQpk5TZj/oicBPtgd6BvDy6CL
         Oi75aRG4F4gkAknmkFkbg0y+KiNT/FWtqf55WZZ/O6mRDW+JDzvt6o5qLXQ4cVZgncF4
         oK7rMu8aAcDKS8gmnG8eUAnWVn/ZRkjGVEdnl1d6MKloMNwe+54x8/18LEWm4v/Hp8RI
         RheEy3QLDqCEFP/BtHOC7yHfU2ikmj76jSfPfsTKV14EsCeJ4kyqNfcDfJ+FSnLDFSkh
         2k7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TCtq5MKWxnk1/njnz+IM1YdAEamePLEq8LQHJWu21wQ=;
        fh=eBLVYaGvqfgrtIr63KLE0b0TuqfQxec1imdQOlGyl2g=;
        b=nGd34dGDRDaD2ZN0mJxpQ4xRV7DMSttmkDS5JLqHR1xL1bT98Ktr1dM+wZalPrk5yg
         wB6uyNyJk0JEuGOaWOcYFplUMihM4uehvf8f2RBhJg2OYPA8mvkgUFHbR9Qs3kgSvRgf
         /FsY1JXvLwJz9acxeVyEaMzkrgzPBZumI8sWNMgj2BJJRROts+AwFdkifFpq0dX6uCNB
         FjMg0dT59sZq3TvxXWMbF0naTfzh8Qz0Fug8AU9iBlFrdmTHvDuRz3+3oKmV9A8PbFA9
         Lhi5tpIUA8Cu4Cpyh8Cm2XyPy1Jer/fpOjCnJymQpyzzR/pRD+V3NXTOYfLKda0OAteP
         udDA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1790096130; x=1790700930; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TCtq5MKWxnk1/njnz+IM1YdAEamePLEq8LQHJWu21wQ=;
        b=BwV3CdLqol5px90Vf66Zi5W//1M6e9lCt/tj1mPInm+JODCa5djT4cW+owbtU7XE+k
         BFOcp2+wykjO4yyHpnrOeoLNekX4U2aPGKRrgSrY0UpzeGJmIJnNitwenAQeFnc4LgPs
         QImlrdkAtfA37jsp9laqzNKSXEpOno6yqTTbWCwHLB0kVhAV2mda7TrvC9XXW3X6TkF+
         Fh99VxtjSHjt49up8ZsYuutmlrtNiCowR3vB/26cXEvTcoVPywS8vy/z2dRRKmP78Y1b
         a5INIwxYHm+NdEhyJR9187QZBumZHquDStUqPHROpS0y3xHC3c+lXHMCyrq0u+ydyfQS
         EYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790096130; x=1790700930;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TCtq5MKWxnk1/njnz+IM1YdAEamePLEq8LQHJWu21wQ=;
        b=kWWBUHwtENxDxea1GxCO0g4AjEMGRJ2jDCHJIo+N8BXBCW0FLcRWKe3Bnwssnh9LOQ
         JG+6dgNl0mjRRc4ZWxkzOP4NgKQ4AhWOqRJgRqynbw/+kfIzFnIojieFAMYSoG6Hif3R
         Ec6z5eVjeVc+f/pvOeK+S3TUu5T21Fw8hIuip8s+lK84U+rWirpbfURtCQAWVJMGN3vn
         mkeUOKyQEbWbREasv8Gbab88FNa2/BczokXKc7nPHn9QPyED5SHnHjyvYDGQp2WFVXWJ
         b/HRZq1d55XvgBLCioIjQfLOWcHK/0gtCveBIFIKGDpaqq7L81uvmo25CC0UZD0KkXOJ
         jVhA==
X-Gm-Message-State: AFuF++lp8NuGEPgSj/BBQoFkx2dy7cU99D10so50ys1Tw1KbxlolPbz1
	Tlyv/Mlij1+NLPCJcD54IJIFcSJGABKKIhFDIJEqm/lTCzW3Pfvc0QOOIIpRClS9CNeyDOJhqDv
	sqxoeingZ6pXkJn2DHePMkqaUfwRrpCEwtT/wvOU0yA==
X-Gm-Gg: AYBFou0QjOdE9fGBVUP/o8tW93M+joRB+7Bi6i6siNsWIJmP6/qMhgRsLWjyZ7OsGiA
	j0UfWO83ZAg8ay1QOts9emBTRAaZm8pDmiR7K7nuR4Z+yXKwtRxwYvNGGASvdYpcFYmgrRhcCMy
	8a48whwLQTAgpH8T4kocLEIrS6BwEr1imV94s19kn51FKuKQFNoffXTCsZbrCg5YbABqiZW9vRT
	maXt5DQy1xXDXNJEREaQ8y1e2mrkZhwvY1l1nnOHPxOQnEU+8UhAq4cI+SI+L7kJ/SflJHnB8Q6
	vx0ZgOf/YdGzG/01VnutKg7SfC3v4DqQ0fUERrhPgcIFPx6JAKuwVAi1imPD9+w77ACt5g5I/aP
	3HlNn8t0rYqtY1UERW4hkRa9iX2f7trn5EadBlPfhl4ptKFhiNRA0+XCRxxH5/sMRMQzN3o61eY
	s=
X-Received: by 2002:a05:600c:674f:b0:49c:dc14:d681 with SMTP id
 5b1f17b1804b1-49fc56dbcb5mr213222275e9.3.1790096129641; Tue, 22 Sep 2026
 09:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260910-makefile_extension_grep-v1-0-b3ae0d456a6e@baylibre.com> <DLL1K66Y085U.EOAJ6C1RLL6Z@baylibre.com>
In-Reply-To: <DLL1K66Y085U.EOAJ6C1RLL6Z@baylibre.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 22 Sep 2026 22:25:18 +0530
X-Gm-Features: AclHuK_YrF8ZtGpyUmrNuvyRFDj34eTqc3Q8Q3dnYWy4Mn2J-7dSl6RRq-1uylk
Message-ID: <CAAhSdy0=rxhvOMk-NuQnRBNtu5GZQVgaM2irp9gE0+tLggcTew@mail.gmail.com>
Subject: Re: [PATCH 0/3] Makefile: fix support checks that use grep
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: opensbi@lists.infradead.org, carlos.lopezr4096@gmail.com, 
	opensbi <opensbi-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_095532_313505_DA9557CA 
X-CRM114-Status: GOOD (  10.52  )
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

T24gTW9uLCBTZXAgMjEsIDIwMjYgYXQgNzoyMOKAr1BNIFRyZXZvciBHYW1ibGluIDx0Z2FtYmxp
bkBiYXlsaWJyZS5jb20+IHdyb3RlOgo+Cj4gSGkgYWxsLAo+Cj4gQ2hlY2tpbmcgaW4gb24gdGhp
cyBzZXJpZXMuIERvIEkgbmVlZCB0byBtYWtlIGNoYW5nZXM/CgpUaGUgTWFrZWZpbGUgaGFzIGNo
YW5nZWQgYSBiaXQgaW4gdGhlIGxhdGVzdCBPcGVuU0JJLgpDYW4geW91IHBsZWFzZSByZWJhc2Ug
YW5kIHNlbmQgYW5vdGhlciB2ZXJzaW9uID8KClJlZ2FyZHMsCkFudXAKCj4KPiBUaGFua3MsCj4g
VHJldm9yCj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZy
YWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9v
cGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
