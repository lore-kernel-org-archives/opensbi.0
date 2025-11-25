Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED870D0EE11
	for <opensbi@archiver.kernel.org>; Tue, 25 Nov 2025 18:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pYwZMmspZwwhfOOUMFw/ITnq6oQ1zwjcvG+ki6BptCc=; b=PZpVbbrQkVDwKBglACCLgtPXqj
	Jwo+adiX9Nk7vMFTGteC1yrKXeBd1HO6Qq++SvY6ayJBHNmUenkC7/eN8UuPMB+oLRNXgm8oy7XdV
	6PYGgED/0BfY/NrB4drc+e/Ukvfno6qTy6CDgm67oYylJQU48bu2R9kGyatIGZh6bnF/x9Shh/Rcb
	gXbSXVLCTGIxeQtPyhvVFsd/b2ESZN/aVYhaoVSRu1EzFx2IE4RdAl/usDkwOfca/jCQSSuxPZM3z
	fA59WQSV8LlrBMjrhZJYfsNUUwTY2FvKY9Jymu7U0Z0LIDcfAxLFHfgQbY4mbfINsdDCrwnLhn+HB
	K1sraEfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNxNm-0000000DiyS-1VT5;
	Tue, 25 Nov 2025 18:03:18 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNxNj-0000000Dixb-0uqD
	for opensbi@lists.infradead.org;
	Tue, 25 Nov 2025 18:03:16 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso8794053b3a.1
        for <opensbi@lists.infradead.org>; Tue, 25 Nov 2025 10:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764093794; x=1764698594; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jGlEKCpDaIu/cbcwW+nR+ZDl3BfNh4a+WFct07dB4iY=;
        b=eDqec+Q5SBdOMBNwmV2p2TIYOCfnGi+JqDsMIpMuR/9IpzhvCaKMiFD3naooxO8xxf
         PSmGuQegK7/nEhWU2vBCKeJ+9IUWmRD7FBa0Xl6qbD5QtdjoDrgH9mo9XMvXzssYYiUb
         fCNj+AvY+iI29VPOCmGYlfT7GftIfQ9qJYHKV8H5Yrts1JxYO4NBvTDJNuEosnJRUcyY
         nxvhkQmLyeBNabSWviG27H2LrMwu64drTHKTpzdyA4YKsKpbjCx3V0uUUdLRwWKySAN6
         4Exuz9tqN8gssxADKYTh2iPI+nQLdMem2B4/2rHNkSTCQgF1q6mvXqKWUXAJ622F9hdm
         a40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764093794; x=1764698594;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jGlEKCpDaIu/cbcwW+nR+ZDl3BfNh4a+WFct07dB4iY=;
        b=O15JGhXxwg3clCigK8uYLimEKU1p4XGbD9ObJJj7NtNBFpilfSTVjYwAoKUu8rvawr
         8UxSr7AecT2yrKphEtEngD1usqZwyh4iCE2ZfmErcamVIAqg1WT7va16cqfzskXCa62h
         Dx5dnutA6mEdjo7i44VTMjXOCNzB8O6OO7aiWgyFbE+PlopgvaxWGX3VBYkBsE/2/rJL
         A+laK1Tni3y8Mq0P9s1N3mHz6yRmkrncPANb8MGTrsesblvtWKk/lbFz0jyQ5nM5J2AG
         YNFkcnvYvYie35lHwYhtBDn9tz6TBmvNVAjZfOWMyzR0m3SNMHA0fkqInqRBP9Rzo/Rr
         FnxA==
X-Gm-Message-State: AOJu0YzuCsOylnzKqX19zS5ztp37G5L4yEJaRwZ2njpPgLcu0FO9cwDc
	MSth3mCgJTjRliJ6bU2FPNzo8bp4gfT0ybmE/94gGwnCHTnz+77tDuy7wsv9h0chxRk=
X-Gm-Gg: ASbGnctuNYahUskNKRwdxrSUnvw8DfkrKdfhmXzi0wPa7Wctij5fQcFm8byDCFv80LN
	QTNv8NzSNE4pbPACOy1RusHE8onUye0dAc5YTFw2sH64sW4uTXd9HhZcHyPcvuOH2aVKYxmGius
	PX3unSa68Cg3SCgGjEDGIRK6OeVOx1Tez5h7iWSF3GH8ATuYRlaWAat8dd3waVFrnustFl7mKs7
	h/uxcQY5dwXuF/xSj6XIn7eXzl9E2+Jt01GLVYp/18tQxCJi3xIF+BGCQf1CRFDeFyjyqx+Joh9
	7J6X9EeFTriw3NuwVCp9d4Xo38BWyidLCpIrcjf7m+nrTHmmPItVV2W6IUAoynwpY3gGJVXSOwW
	Rb/j+MciHEK6cwtT+JNkJ6YDLgf1atShOH0SgaxsiTHG6ZiTxJ+5iuccAg9zqAlvZeGIxlWLZyz
	h/8FAwuploVEByyzVgWR9j
X-Google-Smtp-Source: AGHT+IHBTVfM2Z6dT0BOvHGRjuLa2ZwiDKWKK81ktJC0LmERg4xV+5A/Zajts2K1oRLVoq7jaKWZFw==
X-Received: by 2002:a05:6a20:258b:b0:33b:bce3:31c2 with SMTP id adf61e73a8af0-3637db64ec7mr4358963637.20.1764093794209;
        Tue, 25 Nov 2025 10:03:14 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75e5c9f45sm17096841a12.12.2025.11.25.10.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 10:03:13 -0800 (PST)
Date: Tue, 25 Nov 2025 10:03:12 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: opensbi@lists.infradead.org,
	opensbi <opensbi-bounces@lists.infradead.org>
Subject: Re: [PATCH] lib: sbi: expected trap must always clear MPRV
Message-ID: <aSXvYP2OvUzePP8F@debug.ba.rivosinc.com>
References: <20251124220339.3695940-1-debug@rivosinc.com>
 <DEHQBF6B4C9L.125VJJV9WIVFK@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DEHQBF6B4C9L.125VJJV9WIVFK@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_100315_395216_F0AA8199 
X-CRM114-Status: GOOD (  12.45  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBOb3YgMjUsIDIwMjUgYXQgMTI6MTI6MTFQTSArMDEwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+MjAyNS0xMS0yNFQxNDowMzozOS0wODowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0By
aXZvc2luYy5jb20+Ogo+PiBFeHBlY3RlZCB0cmFwIG11c3QgYWx3YXlzIGNsZWFyIE1QUlYuIEN1
cnJlbnRseSBpdCBkb2Vzbid0LiBUaGVyZSBpcyBhCj4+IHNlY3VyaXR5IGlzc3VlIGhlcmUgd2hl
cmUgaWYgZmlybXdhcmUgd2FzIGRvaW5nIGxkL3N0IHdpdGggTVBSVj0xIGFuZAo+PiBzaW5jZSB0
aGVyZSB3b3VsZCBiZSBhIGV4cGVjdGVkIHRyYXAsIG9wZW5zYmkgd2lsbCBjb250aW51ZSB0byBy
dW4gYXMKPj4gTVBSVj0xLiBTZWN1cml0eSBpbXBhY3QgaXMgRG9TIHdoZXJlIG9wZW5zYmkgd2ls
bCBqdXN0IGtlZXAgdHJhcHBpbmcuCj4KPkRvZXMgdGhlIERvUyBoYXBwZW4gb24gc29tZSBpbXBs
ZW1lbnRhdGlvbj8KCkkgcmFuIGludG8gaXQgd2hpbGUgZG9pbmcgc29tZXRoaW5nIGVsc2UuIFNv
IGl0IHdhcyByZXN1bHQgb2YgYmFzaWNhbGx5CmV5ZWJhbGxpbmcuIERpZG4ndCBvYnNlcnZlIG9u
IHJlYWwgc3lzdGVtLgoKPgo+VGhlIGV4cGVjdGVkIHRyYXAgY2FtZSBmcm9tIE0tbW9kZSwgdGhl
cmVmb3JlIHdpbGwgaGF2ZSBtc3RhdHVzLk1QUD0zLAo+c28gTVBSVj0xIHNob3VsZCBiZWhhdmUg
dGhlIHNhbWUgYXMgTVBSVj0wLgoKWWVhaCBJIG1pc3NlZCB0aGF0IHBhcnQuIFlvdSBoYXZlIGEg
cG9pbnQgaGVyZS4KCkhvd2V2ZXIgaWYgd2UgcmVhZCBwcml2IHNwZWMKIjIxLjQuMS4gTWFjaGlu
ZSBTdGF0dXMgKG1zdGF0dXMgYW5kIG1zdGF0dXNoKSBSZWdpc3RlcnMiCgouLi4KVGhlIE1QViBi
aXQgKE1hY2hpbmUgUHJldmlvdXMgVmlydHVhbGl6YXRpb24gTW9kZSkgaXMgd3JpdHRlbiBieSB0
aGUKaW1wbGVtZW50YXRpb24gd2hlbmV2ZXIgYSB0cmFwIGlzIHRha2VuIGludG8gTS1tb2RlLiBK
dXN0IGFzIHRoZSBNUFAKZmllbGQgaXMgc2V0IHRvIHRoZSAobm9taW5hbCkgcHJpdmlsZWdlIG1v
ZGUgYXQgdGhlIHRpbWUgb2YgdGhlIHRyYXAsCi4uLgoKQWJvdmUgdGV4dCBzZWVtcyB0byBzdWdn
ZXN0IHRoYXQgbm9taW5hbCBwcml2aWxlZ2UgYXQgdGltZSBvZiB0cmFwIGlzCnNldCBpbiBNUFAu
CgpBbmQgdGhlbiBqdXN0IGEgZmV3IHBhcmFncmFwaCBiZWxvdyBpZiB3ZSByZWFkLAoKLi4uCldo
ZW4gTVBSVj0xLCBleHBsaWNpdCBtZW1vcnkgYWNjZXNzZXMgYXJlIHRyYW5zbGF0ZWQgYW5kIHBy
b3RlY3RlZCwKYW5kIGVuZGlhbm5lc3MgaXMgYXBwbGllZCwgYXMgdGhvdWdoIHRoZSBjdXJyZW50
IHZpcnR1YWxpemF0aW9uIG1vZGUKd2VyZSBzZXQgdG8gTVBWIGFuZCB0aGUgY3VycmVudCBub21p
bmFsIHByaXZpbGVnZSBtb2RlIHdlcmUgc2V0IHRvIE1QUAouLi4KCgpTbyBpZiB0YWtlIHRoZW0g
dG9nZXRoZXIsIGl0IHNlZW1zIGxpa2Ugbm9taW5hbCBwcml2IGF0IHRpbWUgdHJhcCBjYW4gYmUK
bGVzcyB0aGFuIDMgYW5kIHNhbWUgc2hvdWxkIHJlZmxlY3QgaW4gTVBQIGlmIGl0IGdldHMgdHJh
cHBlZC4KCkkgZG9uJ3Qga25vdyB3aGF0IGltcGxlbWVudGF0aW9ucyBhcmUgZG9pbmcuIFNob3Vs
ZCBhc2sgYXJvdW5kLgoKPgo+VGhhbmtzLgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5z
YmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL29wZW5zYmkK
