Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17BD606A31C
	for <opensbi@archiver.kernel.org>; Mon, 16 Nov 2026 03:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JOvMXTK4;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=GfxKLaQW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=czYSIRMhUihCT2gyXOFl7pNESuIeTwD1vOp4am2vUSE=; b=JOvMXTK4KDxhypAGmaYAauv33r
	h5qJjmzwg9lYdIkzJ3ny/Ox/kYNZKy5sc04b/F2qqUvD53Hat25sbKdjYOSo1qK6HtgZ0C4W+G/+d
	8b7Kwt5Uj0b+9PPMRe51QBc5CBTsGdRmA6lUvR9V7Ww9LtM9hxXyEPmHZSbeAXHwrK8+bGEEKBpG/
	DuvfSPdkLErKyAIpxm/jMaUS2TAfayBrxZZ4vbTjD0JgZ+xUNKxHP0bRGETKCGV2semDzOaMCKc8o
	jrpOrX6j+pJHgezyWHblQZ7bmzCIFYKJDaXM3XdoGYkvDyyk8lClPfBMcr8gnJC5efjpWZr3a7KIF
	sPQefmxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSnqX-0000000157B-032D;
	Mon, 16 Nov 2026 03:57:33 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSnqU-0000000156o-1UPq
	for opensbi@lists.infradead.org;
	Mon, 16 Nov 2026 03:57:31 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48dee593f18so3146195f8f.3
        for <opensbi@lists.infradead.org>; Sun, 15 Nov 2026 19:57:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794801448; cv=none;
        d=google.com; s=arc-20260327;
        b=oNaGGJgO2kqBEe8ytW6eATYgG/r3KjDPdtSHCT4ATO+HJM5zJrowS0qG8VlMhh187q
         M1U41VCZZK48mjVpmTi6uwjUaNGxD5IOYxfXmOZFcXS9BgDmfjslpDxwK+U7ypf2Lg9o
         5fZFmoEjX9WOHWh79gKQpvTj5BplR8FG5tB2SGwxsjBn8o5x8x7KAQV2GEyclzBkxJjB
         gVVK/KoyH8iuU8/78Hcdtg1n1+1rQZSeUChVn9B6/5mYsH0WrUNmjiyqpQkjinmxTIg1
         HY3eTxUC0I6FbKooNc9DOJ7kufKnHigB9bcxd2IsGKisGXxYuwFLRD9KrV4ON7Acmsq8
         DcjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oqIHBAi+kpADTA2aWIoT9X2jwQWlNDbem03MVJAewVs=;
        fh=ZS5wY3UKuY+q37ts0swsaTQEPnFQSAUUS7y0rZPuQHw=;
        b=oX5GUMeav/VCZrhSbeWQXRbZGZ5TJe6OjdjXF4Sq+FKe9uNffZObUBaKsZfHVGoxk9
         XsrPTTJgF//bNV8mkbK3Z2NGGvflDF16uaAJZku08n0RurfWYh98MZC/ykecJaLRxJNJ
         ciA2TTaspw1HxhsPMOSJdrgvx2g6BhKiFeENKRWyR4AwL494/vE2QrpB2ttjhDPSAZWM
         WumbHkcewFywW+UL/o3FfPUeg7NEeHNneVqQ1RBAuWD6ocMkJ7tUbVYvgBvC6ILM8jjz
         9OjCWe4BnKRygmg9G7bondFJjuZu4zLs+tmDPw52QnPF7LCK5Vl0biKsAEWBdLE5p3lY
         YUOA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794801448; x=1795406248; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oqIHBAi+kpADTA2aWIoT9X2jwQWlNDbem03MVJAewVs=;
        b=GfxKLaQWSr81EBCKyWBlC5ejjXjmMIWbcfaC4hFEJYADGVt80W9Tp3Qf7/IycWyUje
         V6SJNCOByctZQkIRVecW96cOlTOAa6Wi+Sy3I0iiqzoABZsz59HqkDxzjhXPOgds2KiY
         VmAO/cnHi1KnzaoBoAaMhCDpj/AbnerjZrzn1nVHbti576bfFVaEd62FO06eO5hctrxR
         L/EwgjNMdJDIZ/qXj9F7jJl3YZi6lGJ/CcU1hL1FZNQcGnP1DjWOVvbuokyPPqkXNzgI
         t4FU+oz/mQx/6HpYLJj5FJWzNTRNieyUJtr1G+SbBWX3VoKOOWytMT2uT+G4Q84TdpwT
         xdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794801448; x=1795406248;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqIHBAi+kpADTA2aWIoT9X2jwQWlNDbem03MVJAewVs=;
        b=YdrcTWR2ZJN2IPaPnBrwr2tnxOTcPzunDM97R1doYeYapKS2tbzTKPSBF7fz2YQnH0
         JcpR9UW6kHTlbOzAV0OWFUZMd56AuWaUxpKLSgbsUPRW1RJJt3zDyADC6xU0vJh0t264
         QHvhE2Qg4L6s7pL+uhS38n4XqFyqSnH1Ad7tUJei0KuxGQrNQ61gc8WxZu0SQCG/2fXZ
         LpfY+Y+va4vnJPo7kf0FrtX0QBqNXCa9mS9XY67Z3WJx6ETl/J6fd+P5+vFzPmCPMuHd
         61ORnVGw2v/Js32bra95yV/2kK4ZtW2tlz7w3vGvHCDRz2NMdvmGkEX9CZn7d85cOt3L
         FfEw==
X-Gm-Message-State: APuU4Z/AYSG+XHJfBvY5HhJsRrwvBA7BeL8BfEDfQgohaL0DORQmtlqe
	rJAy2y2fYxh64gcLrrk48QGCgTMjdIGptTQMAF1Y/p5auoJ38hOFjoQMssyM3PUs+ULsxUjRTDe
	Bt5/AKb3YVOL33XSFog0uZJ6S6qR+AFyj59Lkf77qyw==
X-Gm-Gg: AYBFou1hx6Qnm3rOd1m5EKAtxSDEvqRvIDPaDmGr/hzCss2Ff7HnWHzpdqKuKeoj1LE
	N+jkHttWzS8froR+XbZFNDICOrY9jwxbIhyaLHoRs210I+jQNKwficjFYwbEn5f2PrPEAml9xRl
	Q+cyVgF5zuFiqf3n7BcfsI6SilCosG79TYfitIs+Y1KeYkK+wLC3cLHNyoQmFX76tzekTU/g4kZ
	Dib1S7KIBrVSQ6nxUHzaAdKSqcnHbfR+vg8qeJ4gKXSmpVe2rOzU5S4Dy2vRTJy+T+VyJLQyUSV
	rjMS9ZfJJqHhXEPcYcQwEg6Wr/cAFQtfczi2YPtGjRQaSR4AxjvAUeIuBB7tNCc5YRuMG3sHnTe
	038MjBc8rw9dzWvezXFkf1FJEFLnL3aKz0yLfKuNRSKxUsLH32o0YLzLLmWZpOiyKgmI8wAmqCk
	fq1WtTY+bgZOrCi0u9YwUvFdRSPoKxsTjjyaXBx0YMjLCHQbQrReLYAPk=
X-Received: by 2002:a05:6000:290b:b0:499:9ffc:59bd with SMTP id
 ffacd0b85a97d-49c70a0ee43mr19845854f8f.30.1794801447506; Sun, 15 Nov 2026
 19:57:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261006193630.735611-1-nickolai@csail.mit.edu>
 <CAAhSdy1VZSuvO0fhxJqrR8w+P5O7DL3xWb6st3mMw8__WPhAzQ@mail.gmail.com> <CADGQE7FDVSPvrLuGbyb8OO=EFk9tne9W2NQ7Ot9hLjRiT0duxA@mail.gmail.com>
In-Reply-To: <CADGQE7FDVSPvrLuGbyb8OO=EFk9tne9W2NQ7Ot9hLjRiT0duxA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 16 Nov 2026 09:27:16 +0530
X-Gm-Features: AclHuK8RCnx3Qy9aydznI-aqFR_gkLT9Qf-05qB2CM-dNXXJoYLt7esP-QFtTxk
Message-ID: <CAAhSdy2A0+5EtxRAue65eS8zayw-+CoSxh5aMF6ZFQg9+nt=rQ@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: Order the publication of IPI device nodes
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_195730_416635_B80E26F9 
X-CRM114-Status: GOOD (  11.68  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBOb3YgMTYsIDIwMjYgYXQgNzo0OeKAr0FNIE5pY2tvbGFpIFplbGRvdmljaAo8bmlj
a29sYWlAY3NhaWwubWl0LmVkdT4gd3JvdGU6Cj4KPiBPbiBXZWQsIE5vdiA0LCAyMDI2IGF0IDE6
MjHigK9BTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPiA+IFRoaXMg
bG9va3MgdW5tYWludGFpbmFibGUuCj4gPgo+ID4gV2h5IG5vdCBpbnRyb2R1Y2UgcmVhZC13cml0
ZSBzcGlubG9jayBhbmQgdXNlIHRoYXQgdG8KPiA+IHByb3RlY3QgaXBpX2Rldl9ub2RlX2xpc3Qg
PyBCYXNpY2FsbHksIHNiaV9pcGlfYWRkX2RldmljZSgpCj4gPiB3aWxsIHRha2Ugd3JpdGUtbG9j
ayB3aGVyZWFzIHNiaV9pcGlfcmF3X2NsZWFyKCkgYW5kCj4gPiBzYmlfaXBpX3Jhd19zZW5kKCkg
d2lsbCB0YWtlIHJlYWQtbG9jay4KPgo+IEZhaXIgZW5vdWdoOyBJIHdhcyB3cm9uZ2x5IGFzc3Vt
aW5nIHRoZSBjb2RlIHdhcyB3cml0dGVuIGxvY2stZnJlZSBvbgo+IHB1cnBvc2UuICBEbyB5b3Ug
dGhpbmsgaXQncyB3b3J0aCBhZGRpbmcgYSByd2xvY2sgaW1wbGVtZW50YXRpb24gdG8KPiBPcGVu
U0JJIGZvciB0aGlzPyAgQWx0ZXJuYXRpdmVseSwgaXQgd291bGQgYmUgZWFzeSB0byBncmFiIGEg
cmVndWxhcgo+IHNwaW5sb2NrIGluIHRoZSByZWxldmFudCBmdW5jdGlvbnMuJwoKSW4gYWRkaXRp
b24gdG8gSVBJcywgdGhlcmUgYXJlIG90aGVyIGFyZWFzIGluIE9wZW5TQkkgd2hpY2ggY2FuCmJl
bmVmaXQgZnJvbSByd2xvY2tzIHNvIEkgdGhpbmsgd2Ugc2hvdWxkIGRlZmluZXRseSBoYXZlIHJ3
bG9jawppbXBsZW1lbnRhdGlvbiBpbiBPcGVuU0JJIHdoZXJlOgoxKSByZWFkX2xvY2soKSBvbmx5
IHNwaW5zIGlmIHNvbWVvbmUgaGFzIHRha2VuIHdyaXRlIGxvY2sKMikgd3JpdGVfbG9jaygpIHNw
aW5zIGlmIHNvbWVvbmUgaGFzIHRha2VuIHJlYWQvd3JpdGUgbG9jawoKUmVnYXJkcywKQW51cAoK
LS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
