Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AEE606A31C
	for <opensbi@archiver.kernel.org>; Mon, 16 Nov 2026 02:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vOPXaG3L;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=rLZE7mA5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nYVVkgjblfEkAsCJhYpkVS3HWbtDJM7P/4IfEr9zgjs=; b=vOPXaG3LXPLzpraAs0ridx+cBZ
	nWtEFY0P6OCWXTisTZNs+PHEtnpPtOyAyekZQThZIaCfF+jj8AsywrKelA1DgCENx3iM7vVq1TwkC
	cVKldz+2ENgzE43/vxdhZw52ISPNuuE6Jv3YHLpEGJ18coMbcbLvd2Iw9S1sVnnE60lpU2V/OSeSk
	4iWDn4Ob4hXVbFhXGrBzeAdfUz2aNIdebmYVs6QDPgOOyyvxNe79xoz6XtA2fX2DPIV4ydyK4y7Je
	OBHhH+uzhA1wmwTnZr1Heb7Ax7hTnd+x56Pkj1PUjoBR2fNwdg/v28SoUwkDP1vm3FK/He07ttxp2
	h4CZplow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmK8-00000000vaJ-1HAR;
	Mon, 16 Nov 2026 02:20:00 +0000
Received: from outgoing2021.csail.mit.edu ([128.30.2.78])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmK6-00000000vZk-1ea1
	for opensbi@lists.infradead.org;
	Mon, 16 Nov 2026 02:19:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zh/OuUmzZqxpCINl0/iUP7yoGLSb/HzSeArgIIixC6Y=; t=1794795598; x=1795659598; 
	b=rLZE7mA5hK7PIqcSzesFnxC3XM1NWnELbIg2saL7ZDMPKGdXo2KvSZIGUs1KozFoY6TzjUoI+hC
	R1aDHYX5gclYYBAmpkbK9YrhVL81krDEQQV8RixSadhcTC2qnzrKbD9KAVb+jguznTUPjC11Rl1B/
	Bf9ncmwpeljjUOFfwOWsPOj/DFgXKeV5hpNl28JayIo+MwrGeunPkCxkEXbLsHsc6EEQi1p0JUZ5V
	nqcJe7OF3ZPv72gtcGbiSZLnh7p2qvkjS6LPkw60ZocbevJB67fDoLwLTbyYtiJxC+98hcR+z0WYH
	MbAUMMdUZhcxbG/HE4aq7AiBaxvALGOcSPQA==;
Received: from mail-dl1-f45.google.com ([74.125.82.45])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xSmK5-004AIW-Ge
	for opensbi@lists.infradead.org;
	Sun, 15 Nov 2026 21:19:57 -0500
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3b4944abeso495952c88.1
        for <opensbi@lists.infradead.org>; Sun, 15 Nov 2026 18:19:57 -0800 (PST)
X-Gm-Message-State: APuU4Z8qBzJhgDfvECXjC1TAC2O6DKUtXUjozfNOjQrxoAsU1u1hgoFI
	AfO15bxjsG/Xqh3K56tnD8Og4nQEfFAt1j9JVdIIVKlNGUuz8ugkmf0jtgSpdiuO98f2JlqqZQZ
	GKAm6jJXwbTb4E1nkb8EP5YNYJMYe+JA=
X-Received: by 2002:a05:701b:428e:10b0:181:5cac:8f27 with SMTP id
 a92af1059eb24-1b50312eb6cmr9819756c88.35.1794795596573; Sun, 15 Nov 2026
 18:19:56 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261006193630.735611-1-nickolai@csail.mit.edu> <CAAhSdy1VZSuvO0fhxJqrR8w+P5O7DL3xWb6st3mMw8__WPhAzQ@mail.gmail.com>
In-Reply-To: <CAAhSdy1VZSuvO0fhxJqrR8w+P5O7DL3xWb6st3mMw8__WPhAzQ@mail.gmail.com>
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
Date: Sun, 15 Nov 2026 21:19:45 -0500
X-Gmail-Original-Message-ID: <CADGQE7FDVSPvrLuGbyb8OO=EFk9tne9W2NQ7Ot9hLjRiT0duxA@mail.gmail.com>
X-Gm-Features: AclHuK_C2xBHF6A0k49SzLz3kn8hvZRssOQyaRZ2dQgel2clx8tDnEnCbehTooU
Message-ID: <CADGQE7FDVSPvrLuGbyb8OO=EFk9tne9W2NQ7Ot9hLjRiT0duxA@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: Order the publication of IPI device nodes
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_181958_608423_6549B01C 
X-CRM114-Status: UNSURE (   7.14  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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

T24gV2VkLCBOb3YgNCwgMjAyNiBhdCAxOjIx4oCvQU0gQW51cCBQYXRlbCA8YW51cEBicmFpbmZh
dWx0Lm9yZz4gd3JvdGU6Cj4gVGhpcyBsb29rcyB1bm1haW50YWluYWJsZS4KPgo+IFdoeSBub3Qg
aW50cm9kdWNlIHJlYWQtd3JpdGUgc3BpbmxvY2sgYW5kIHVzZSB0aGF0IHRvCj4gcHJvdGVjdCBp
cGlfZGV2X25vZGVfbGlzdCA/IEJhc2ljYWxseSwgc2JpX2lwaV9hZGRfZGV2aWNlKCkKPiB3aWxs
IHRha2Ugd3JpdGUtbG9jayB3aGVyZWFzIHNiaV9pcGlfcmF3X2NsZWFyKCkgYW5kCj4gc2JpX2lw
aV9yYXdfc2VuZCgpIHdpbGwgdGFrZSByZWFkLWxvY2suCgpGYWlyIGVub3VnaDsgSSB3YXMgd3Jv
bmdseSBhc3N1bWluZyB0aGUgY29kZSB3YXMgd3JpdHRlbiBsb2NrLWZyZWUgb24KcHVycG9zZS4g
IERvIHlvdSB0aGluayBpdCdzIHdvcnRoIGFkZGluZyBhIHJ3bG9jayBpbXBsZW1lbnRhdGlvbiB0
bwpPcGVuU0JJIGZvciB0aGlzPyAgQWx0ZXJuYXRpdmVseSwgaXQgd291bGQgYmUgZWFzeSB0byBn
cmFiIGEgcmVndWxhcgpzcGlubG9jayBpbiB0aGUgcmVsZXZhbnQgZnVuY3Rpb25zLgoKVGhhbmtz
LAoKTmlja29sYWkuCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3Bl
bnNiaQo=
