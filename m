Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0C9CD37B7
	for <opensbi@archiver.kernel.org>; Mon, 11 May 2026 05:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zyNVYc0rCewFA3sHeQhpJflomylFKpc2va9JU3xNiQ0=; b=x7miCfAKR3f1S6TA4EeRJeNrf1
	mTkPhRYivR/LvuBE+txprkZQHGXn6/T1kNpoXP+q0xCaJwvItrWFCDb0LRfpCvDxqAYW/SFQzhhKe
	9yQs8h+q+IT91/3gknqh1H3sW5nAJ2amnjIKQV7thsjG0knALX14nJ9vdmJn+MfbjoV07Sr7wNaJL
	WlSk9W27mQSL7xFnkhpBF8fE8FjFpv4r2cQemshYQPnWKYDnAN2zVRGFLiMiaY5CeRvP/Z1inUXFc
	w8vHgz7X5OH8eFFJyKof5ywkuPU+bPnkUjm5wHPCeJNSIo/QtybYwRY5KSnHQfy6UIiLPSdZ8Amhe
	oRY3j4zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMJ88-0000000CNnU-1vIK;
	Mon, 11 May 2026 05:24:36 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMJ84-0000000CNmm-3MSw
	for opensbi@lists.infradead.org;
	Mon, 11 May 2026 05:24:34 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-7bd4c61765dso40941127b3.3
        for <opensbi@lists.infradead.org>; Sun, 10 May 2026 22:24:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778477071; cv=none;
        d=google.com; s=arc-20240605;
        b=LfAREHrKz2ENh7OtqFqQEl3xjQNls4hhV2X1lxzRdb9Gvt8ar6hC0HQFRzhApLcHSV
         Hcp1Nscaq7Zr3u2ynL4SClQRGaqRMga4XxXgDdCOnIWrcGg6hhi9csmqLTV0Gg7Ej9X2
         wZz9QL0vvLbCCvxem8tW4NfARqTkbP+E35wErjgcR9Bh23StRHkq7IKlz20ZgVejaeU0
         moQPYCwpLlCIMvogYf/+3ykVIJ1sboKqwMlEeqk+hEEvGbjEygXPJetnu3bd6MSvwFHB
         w0h65LqpKWzdXeDLG1Pjmnf3e3TcHlrA8d4MqH3pS4f0eqtu3xUmKgIGXHGU1m8uNXj+
         qVnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wiTtbv3TiqIYORxbhp/w7+4P1GHy9HvodjmPZOOx6mg=;
        fh=QhHcq8ruMxrw9/fJXp6dtZ/NdBzlNj28kuuEk7oGGSM=;
        b=EiXG5FHbNdQJY9vxA6u6H38m2cNQmrTmUUCwwHjYjdRpOIK33jS2fAbW2DUGebMA54
         qmioykUFS5+5mGBcSIV8ymRS7DNLohe+H1xB3MnPVV5LHLyP9ga6vc2nlo01od0m23lE
         n9ryXv58wIlGD5p+0XhX4v+jimHNEoGQJiy+ZrHCjnFmDR+Dme5C2Tj/f48dnmZoX0Ci
         pF3VVj5N2oz3BYNLd+b2CmcCsxGynUbZD/KpFO5ZjkeEuwTRMVgUwWH2maY2+pGlIhTy
         sAeUsz7D/qQ0IOfC1v+b8vWTBykoUeHpXUfM6SDeiljIYPajfGrvZs/UcZGA5LaUO6Gx
         S5tA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=summations-net.20251104.gappssmtp.com; s=20251104; t=1778477071; x=1779081871; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wiTtbv3TiqIYORxbhp/w7+4P1GHy9HvodjmPZOOx6mg=;
        b=gSy7I8RB6Geqr4Psqw6QPzaDd6nMe5QVsH7HISKBGsfLsLahAmKA94YQq5glN9At/p
         w6X40CQJaeFFOEKy5njZUOeFZefugQhJx+Qadjk6J5SWIsbROh2gTE6k5APOI1woNZtV
         WSuI1xPXO/8cKrv1loHSR2TzsYgzaFIGWXvAQ0hVM8YWK870YExtjgqL+/5FPmnJjxDv
         766mZCUnAb8uJqJ+XxOYRnE3QkDsWMKzdYIZgAyX3CZdkxJftUCkatenP4tRDByjAlPz
         oAbNkvz4fDOdIK6HBFWND27GyLjKT3OnyV4jY/sOiau/JT3BjlFUw2S988xnzcr/YxC0
         7obQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778477071; x=1779081871;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wiTtbv3TiqIYORxbhp/w7+4P1GHy9HvodjmPZOOx6mg=;
        b=iiifFfAqGS7vrcAyEWeEMeaEp8I2yhMh3oreUTcQm/1jZK5AUt6s6Chsyh4u7Wsevi
         w8YRm4tmbnt4D2iYHMdF1+4z1RVRegFvnYipkEwyiyOAomTqh8HIOFzxP4IXUheqwXLN
         8gFHV8lahYbN+hBrYvtGZA3wOo7iRdD0t/IyCvMKUgVhUURSgHI0i3oXzmGegU0mfe2U
         upvjXkpntNdePFKoz6VWmMI7jbxBvZUSBXy+iTpA9KhrXiwAEblf/0jQ6qqI7Lnc5DcA
         vz3qDj+TbVr78GexT4iO8+XWnxXeYmcagYLZL0FNKf5fi61Ly/zJwChZP3Lsh+NDwbBr
         goNw==
X-Forwarded-Encrypted: i=1; AFNElJ9gOfkN4AkMdCqHGiQO+df6wBc3kTDu6yEFGs4iwL+efOgLCOpGF9EjfeVbjp6STgzp1KFtZHem@lists.infradead.org
X-Gm-Message-State: AOJu0YxdeycPR0SDzmHHMRELY7BN7JCJqPzdLNd04yZHhU09/CxaEWKo
	WK1UthYYtoANTwwEZbi8HaRj5T0NtcpJbX4xhERZwbyf3I44zCDRjccxwFrKNLUjfN33o/3WVQ+
	E/VxfAzLo7JEcoN00obpKJPBbPLrFoUmZrC/OWMweQ38=
X-Gm-Gg: Acq92OGIawXVv3oUyjAy5aLF57lbOAEEDPAh6fBjy83gGIBC5hSfpUSPLOHkv5dSnXH
	gJ12LZ+WWCrZ/FsRFw0u/R8baFle+Mp2z+0xhCaFrrdh61wdv6C5fO0qGqu+TnK5agUHJxh8fWX
	8DgqyAAwORlwgHIIMsS0HszKblFwW18hrtfkXhymdqgmgdTqTdKCMgFhzx7wSJkt2QSlDfjcl9O
	m/CvMBiwZOeZ/eWPCbzk62NxuXNZQWR19nWZ1J4/4xQHy2Pr04Mz2GfpsAz5yrTqGG41o2LXWgb
	nT/oiN6X+qqT41HXrB9l8jPihNs9mvq6eayGOK/3
X-Received: by 2002:a05:690c:c4f9:b0:7bd:7e01:8d53 with SMTP id
 00721157ae682-7c10312f81cmr76446807b3.19.1778477071026; Sun, 10 May 2026
 22:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260319132232.51572-1-takumihara1226@gmail.com>
 <CABdD5xnMzGjyF_ssKBED_0c4=aByL8tkMGdTcRXKoivAPGitDQ@mail.gmail.com> <20260327034822.39371-1-takumihara1226@gmail.com>
In-Reply-To: <20260327034822.39371-1-takumihara1226@gmail.com>
From: Rahul Pathak <rahul@summations.net>
Date: Mon, 11 May 2026 10:54:19 +0530
X-Gm-Features: AVHnY4Ja9Ic2upMrQoxkHrGW4G9ugCZrAIb9BJtDlhnItE5vb8sB4t2kD2T8NG0
Message-ID: <CABdD5xmT94BoxR2L5VQEoxwb+EWNdvnW8MxAcbW_iHGLKBuWTw@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi_domain: reject overflowing address range in check_addr_range()
To: Takumi Hara <takumihara1226@gmail.com>, opensbi@lists.infradead.org, 
	Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_222433_152278_269FB2F2 
X-CRM114-Status: GOOD (  13.39  )
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

SGkgVGFrdW1pLAoKSSBiZWxpZXZlIGZyb20gdGhlIHNlbWFudGljcyBvZiB0aGlzIGZ1bmN0aW9u
CmlmIHRoZSBzaXplIHBhc3NlZCBpcyAwIHdoaWNoIG1ha2VzIGl0cyBhIGludmFsaWQKcmFuZ2Ug
aW4gd2hpY2ggY2FzZSB0aGlzIGZ1bmN0aW9uIHNob3VsZCByZXR1cm4KZmFsc2UgcmF0aGVyIHRo
YW4gdHJ1ZS4KQ2FsbGVyIG9mIHRoaXMgZnVuY3Rpb24gaWYgcHJvY2VlZHMgd2l0aCB0aGUgYWRk
cmVzcwp3aXRob3V0IGFueSBjaGVja3MgaGFwcGVuaW5nIGluc2lkZSB0aGUgZnVuY3Rpb24KanVz
dCBiZWNhdXNlIGl0IHBhc3NlZCB0aGUgc2l6ZSA9PSAwIHdpbGwgYmUgaW5jb3JyZWN0IHVzZSwK
ZXZlbiB0aG91Z2ggd2lsbCBiZSB0cmFwcGVkIGxhdGVyLgoKV2lsbCBsZXQgeW91IGFuZCB0aGUg
bWFpbnRhaW5lciBkZWNpZGUgb24gdGhpcyBiZWhhdmlvdXIuCgpTaW5jZSB0aGlzIGJlaGF2aW91
ciBpcyBleGlzdGluZyBhbmQgdGhlIGZpeCB5b3UgaGF2ZQpwcm92aWRlZCBpcyBzdGlsbCBhcHBs
aWNhYmxlLgoKUmV2aWV3ZWQtYnk6IFJhaHVsIFBhdGhhayA8cmFodWxAc3VtbWF0aW9ucy5uZXQ+
CgoKVGhhbmtzClJhaHVsCgpPbiBGcmksIE1hciAyNywgMjAyNiBhdCA5OjE44oCvQU0gVGFrdW1p
IEhhcmEgPHRha3VtaWhhcmExMjI2QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGFua3MgZm9yIHRo
ZSByZXZpZXcsIFJhaHVsLgo+Cj4gV2hlbiBzaXplID09IDAsIG1heCA9PSBhZGRyLCBzbyB0aGUg
b3ZlcmZsb3cgZ3VhcmQgaXMgc2tpcHBlZAo+IChpdCdzIG5vdCBhbiBvdmVyZmxvdyksIGFuZCB0
aGUgd2hpbGUoYWRkciA8IG1heCkgbG9vcCBpcyBhbHNvCj4gc2tpcHBlZCBzaW5jZSBhZGRyID09
IG1heC4gVGhlIGZ1bmN0aW9uIHJldHVybnMgdHJ1ZS4KPgo+IFRoaXMgaXMgdGhlIGV4aXN0aW5n
IGJlaGF2aW9yIGFuZCBpcyBpbnRlbnRpb25hbCAtLSBhIHplcm8tbGVuZ3RoCj4gcmFuZ2UgaGFz
IG5vIGJ5dGVzIHRvIHZhbGlkYXRlLCBzbyByZXR1cm5pbmcgdHJ1ZSBpcyBjb3JyZWN0Lgo+Cj4g
VGhpcyBwYXRjaCBvbmx5IHRhcmdldHMgdGhlIG92ZXJmbG93IGNhc2Ugd2hlcmUgYSBub24temVy
byBzaXplCj4gd3JhcHMgbWF4IGFyb3VuZCB0byA8PSBhZGRyLCB3aGljaCBzaWxlbnRseSBza2lw
cyBhbGwgcGVybWlzc2lvbgo+IGNoZWNrcyBvbiBhIHJhbmdlIHRoYXQgYWN0dWFsbHkgY292ZXJz
IG1lbW9yeS4KPgo+IEJlc3QgcmVnYXJkcywKPiBUYWt1bWkgSGFyYQoKLS0gCm9wZW5zYmkgbWFp
bGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
