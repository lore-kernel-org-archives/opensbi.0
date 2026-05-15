Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29539CD343F
	for <opensbi@archiver.kernel.org>; Fri, 15 May 2026 07:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F/eotk+mR8XE43Xow3MWyLG2wwrbdj04R+HyYhmhg/E=; b=WNOoRD+EHqv/IH
	jw0vT8iO3lvWvp2qQ85XX2r2UOMolwLcTZ1ONykWAKSY5i6Y9eTy72f8iJjG7DNwF9nFWqlmChBK/
	bjKM6jCWun6KKDKRIa8tjhw6KXpoWQcYi7vYMNO0+Pw7CF7B6gVeLSqKjJF+FdC0MSYHgysiJG3vL
	WiAb2UvorXHtf4W6x+VC5HK+BL2CwwG/2eXQr2Dd6ksvU+ff5sIWAudUsJw3miAmZlTgf+Qr1Jgh+
	k8Pomtf2pS8h5l9UDahgr569XSJG5k+hGL8zNuLl7hyv+reSQ1ig2p+ziR3lNOG6fFZ5+Mppq8HST
	Z2OtN15lTK5O3SJVmfNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNnDA-00000007eGA-359X;
	Fri, 15 May 2026 07:43:56 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNnD8-00000007eFK-0gjc
	for opensbi@lists.infradead.org;
	Fri, 15 May 2026 07:43:55 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7dbca22dbfeso5066922a34.1
        for <opensbi@lists.infradead.org>; Fri, 15 May 2026 00:43:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778831033; cv=none;
        d=google.com; s=arc-20240605;
        b=OApbLiSgE4sZ5QOBSR+h0b8KbnlhNdAPvvBw/rx9lAacDRyfVcbzbc3BBfqCag5Dm6
         eq894yT1fi4vrpA7Zhf+f3uEW2Ys9hwwj6D+qJpY+ilAM0bHKynrlhUGbgKKK6B64etp
         5Dq/wJncdUzIpsGgU4Whpy0c/zQ+0R8cjLnIPYL3aFyUR7OU05d4xuHGcjsPtwnLgkkb
         LdSohNTZxi5zTEIIz8GsVng5Baj5/IAgjDJQEkFG7jZ/W2Dn+2HwXJOWuxT3r/TNLl9u
         ObJEfcjxTJVRKtaC30pXj8w5ChAFMdv1ThosQ30k7CCHwrDZF8LEoCNDr4rzp0M6i492
         0Whw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QYL9w+4elHRTPbPcHP1SBnKxkLNVpy0igSVch47Osnc=;
        fh=gR83dghHauzO+1wqV/qHdt9qXtDQavRZxkHNLoKVagg=;
        b=k950FGk/KjuOlq9cesn0UsyZYdHKiKHlgiEodZsEgVEaiVS+3F+LGsri0ugh+SOQ3K
         4KvepyHYVpKtuvQhCB15THe3GYMagV8uGXdxAo5IAGiWjVsEB2EPz4Chz58bMUwBUtBg
         pRSwZJnb0FVNqLD/MI5xumEMSr2qJxXrFjd0YAzFq2NM8YqPiLREM3h/Z/Ye8PxUkmNg
         0hx4luJ8M97IOGkeJC4E/7xhfkYYhI3n6zMZVg31yaGUWWtTslCtCmQ/nNOyXiV4eXuz
         9cQAIYYm2WIFIJKsiYESpFhkI/t4b5qN9RqXrg4Pl+aujd6wLAd0eL4EZOhBG9myoGAo
         bXcA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778831033; x=1779435833; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QYL9w+4elHRTPbPcHP1SBnKxkLNVpy0igSVch47Osnc=;
        b=Ht5X7jAsZ6z2ydNNIcvj3ZonaQcb5qCpfqPciTMkc9hXTrmd904hwyO713haT9HeGW
         1ZDlfrTLiDyje5LbKV/fwE65yE+e9oOcKQQvcCAJDBFoMR1UaAYpBhBSwTFSJFW6xuET
         7pltqIPwFk3QKSh/4/EurFriuKXJ5fho5smP1e/PnQSeFMcd4CRMEEi4Fr1VGQLWdLiR
         6vs6GWF+SNxVxhu7AnuHmKC5Gob34kkP6ZvwseYzqQCMdM5upC8tPRLqIcrvzIpl54Wm
         LIBhxaTG0Sj33DiNtK96In/bei8Ql0eKJps65hyhiAvJvaSS4Lka7tvjRATK+Ue54JEY
         PhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778831033; x=1779435833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QYL9w+4elHRTPbPcHP1SBnKxkLNVpy0igSVch47Osnc=;
        b=eOJsqUzmqVBwsjNzwKqUlDkpJigtyYDsOP4qxZn865apsq3NfZhxSeoIDySXLjTOlA
         FFWOdFOBt/lY5A/VdfLIZX0onC86kVkfnayAqwD+LTJQgOTGCfXMepdoQVdSRKfuIowy
         Xg13aMQ1pzyilFRNXvKcXT/YiEbtJ6/jtbCSv6axnua+2QHl97wSRQIvbv8oqN/o8TpM
         CcbOrmoyZWP6aPD3dwAZsG7q2nc1JspcbgwB2E2ir+/It1IJLAc+RuL4csJ96G/l+Fug
         mLDH+CiKWuNVaQTLGFckP0Vef7lLeY8VfIActelN4qU8Zx3meGvmQFASvPAfInG9YIvc
         yBoA==
X-Forwarded-Encrypted: i=1; AFNElJ8Ms4fvFSKxsC3Jns7liDbRovEsPTjTPlSalVHVeeXsGCHia95TF5xEJsHVSgi/HYIEztDt+ONQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzkRXPoaf6GTzzCq67xbGXWb6dAodM02J/wVJGWSXzJiw5z0yAz
	oFtc6C9dC63xJrSDaxyHl92qCglF84nPob1smQvX79C6y7JJ3eFf1ED/JF3DBj5lNRrsPvrz0xT
	cgHXFHnuOHjtsraw8AStT4ct7HBtKG0tA69VZrpdJ0Q==
X-Gm-Gg: Acq92OGdiH49E7scvXq8CifDAvFIgXPKLX/oiTkLwtBqZBqHExokvUWt+cIyVFKyxYZ
	yyuBu9Zw+M22UA8IdmG51usGby+CwTrHEtxLtbB+dVoLhAgChFBRvBthPQiO6e7B1Zn6bWRhNAa
	d8UhZnqW7+vdrCqDwih7KHmFh7cs798Ik2fnl3VxIrZ+qf4UFUOBZFITuQKy4sHSd1H9QaWsOOf
	8vxh8WRmTK/cAPxCQNLrAkKl5xis4B2FB+GPd9si5Kz8WFt6OfodOwM12YNL0tmEUfzQLJAHrqA
	YzNDNa24682joAMFfN/xnawxPlTu3zHF3Ui99NlvvXw/Ag3VYJwfYsOpWa6dGGK9gaj4vsMxSSU
	Qo/r9X2qWcvDgt/K9ohCiyusQ0Co=
X-Received: by 2002:a05:6820:20e:b0:696:13e9:6855 with SMTP id
 006d021491bc7-69c942fc917mr1864803eaf.15.1778831032777; Fri, 15 May 2026
 00:43:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260515054208.151045-1-dave.patel@riscstar.com> <20260515054208.151045-4-dave.patel@riscstar.com>
In-Reply-To: <20260515054208.151045-4-dave.patel@riscstar.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 15 May 2026 13:13:40 +0530
X-Gm-Features: AVHnY4L3MZThrKVkHR2QA19LwRwrLGfmQHso3fop6NaaBHmAAErG7zTRtP_4R9k
Message-ID: <CAAhSdy2n5JF8gZXc3jfU2f90KbNi1AC7AssTXXLxA5n0NLQmoA@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] lib: sbi: domain FP/Vector context support for
 context switch
To: dave.patel@riscstar.com
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Anup Patel <anuppate@qti.qualcomm.com>, 
	Scott Bambrough <scott@riscstar.com>, Robin Randhawa <robin.randhawa@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Ray Mao <raymond.mao@riscstar.com>, 
	Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_004354_212832_C6D9D431 
X-CRM114-Status: GOOD (  25.94  )
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

T24gRnJpLCBNYXkgMTUsIDIwMjYgYXQgMTE6MTLigK9BTSA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5j
b20+IHdyb3RlOgo+Cj4gRnJvbTogRGF2ZSBQYXRlbCA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20+
Cj4KPiBUaGlzIHBhdGNoIGFkZHMgcHJvcGVyIHN1cHBvcnQgZm9yIHBlci1kb21haW4gZmxvYXRp
bmctcG9pbnQgKEZQKSBhbmQKPiB2ZWN0b3IgKFYpIGNvbnRleHRzIGluIHRoZSBkb21haW4gY29u
dGV4dCBzd2l0Y2ggbG9naWMuIEVhY2ggZG9tYWluCj4gbm93IG1haW50YWlucyBpdHMgb3duIEZQ
IGFuZCB2ZWN0b3Igc3RhdGUsIHdoaWNoIGlzIHNhdmVkIGFuZCByZXN0b3JlZAo+IGR1cmluZyBk
b21haW4gc3dpdGNoZXMuCj4KPiBDaGFuZ2VzIGluY2x1ZGU6Cj4KPiAtIEFkZGVkIGBmcF9jdHhg
IGFuZCBgdmVjX2N0eGAgbWVtYmVycyB0byBgc3RydWN0IGhhcnRfY29udGV4dGAuCj4gLSBJbnRy
b2R1Y2VkIGR5bmFtaWMgdmVjdG9yIHN0cnVjdCBhbGxvY2F0aW9uIGZvciB2bGVuYiBpbiAnc3Ry
dWN0IGhhcnRfY29udGV4dCcKPiAgIHRvIGFsbG9jYXRlIGFuZCBmcmVlIHBlci1kb21haW4gRlAg
YW5kIHZlY3RvciBjb250ZXh0Lgo+IC0gTW9kaWZpZWQgYHNiaV9kb21haW5fcmVnaXN0ZXIoKWAg
dG8gaW5pdGlhbGl6ZSBGUC9WZWN0b3IgY29udGV4dCBwZXIgZG9tYWluLgo+IC0gVXBkYXRlZCBg
c3dpdGNoX3RvX25leHRfZG9tYWluX2NvbnRleHQoKWAgdG8gc2F2ZS9yZXN0b3JlIEZQIGFuZCB2
ZWN0b3IKPiAgIGNvbnRleHRzIHNhZmVseToKPiAgICAgLSBFbnN1cmVzIEZTL1ZTIGZpZWxkcyBp
biBgbXN0YXR1c2AgYXJlIGVuYWJsZWQgKHNldCB0byBJbml0aWFsKSBvbmx5IGlmIE9mZi4KPiAt
IEFkZGVkIHJ1bnRpbWUgY2hlY2tzIGZvciBGUCBhbmQgdmVjdG9yIGV4dGVuc2lvbnMgd2hlcmUg
bmVlZGVkLgo+Cj4gVGhpcyBpbXByb3ZlcyBzdXBwb3J0IGZvciBtdWx0aS1kb21haW4gc3lzdGVt
cyB3aXRoIEZQIGFuZCBWZWN0b3IKPiBleHRlbnNpb25zLCBhbmQgcHJldmVudHMgY29ycnVwdGlv
biBvZiBGUC9WZWN0b3Igc3RhdGUgZHVyaW5nIGRvbWFpbgo+IHN3aXRjaGVzLgo+Cj4gU2lnbmVk
LW9mZi1ieTogRGF2ZSBQYXRlbCA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20+Cj4gLS0tCj4gIGxp
Yi9zYmkvc2JpX2RvbWFpbl9jb250ZXh0LmMgfCAyOCArKysrKysrKysrKysrKysrKysrKysrKysr
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEv
bGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYyBiL2xpYi9zYmkvc2JpX2RvbWFpbl9jb250ZXh0
LmMKPiBpbmRleCAxNThmNDk5MC4uNWUxODA2OTggMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlf
ZG9tYWluX2NvbnRleHQuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2RvbWFpbl9jb250ZXh0LmMKPiBA
QCAtMTgsNiArMTgsOSBAQAo+ICAjaW5jbHVkZSA8c2JpL3NiaV9kb21haW5fY29udGV4dC5oPgo+
ICAjaW5jbHVkZSA8c2JpL3NiaV9wbGF0Zm9ybS5oPgo+ICAjaW5jbHVkZSA8c2JpL3NiaV90cmFw
Lmg+Cj4gKyNpbmNsdWRlIDxzYmkvc2JpX3ZlY3Rvci5oPgo+ICsjaW5jbHVkZSA8c2JpL3NiaV9m
cC5oPgo+ICsKClJlZHVuZGFudCBuZXdsaW5lIGhlcmUuCgoKPgo+ICAvKiogQ29udGV4dCByZXBy
ZXNlbnRhdGlvbiBmb3IgYSBoYXJ0IHdpdGhpbiBhIGRvbWFpbiAqLwo+ICBzdHJ1Y3QgaGFydF9j
b250ZXh0IHsKPiBAQCAtNTUsNiArNTgsMTEgQEAgc3RydWN0IGhhcnRfY29udGV4dCB7Cj4gICAg
ICAgICBzdHJ1Y3QgaGFydF9jb250ZXh0ICpwcmV2X2N0eDsKPiAgICAgICAgIC8qKiBJcyBjb250
ZXh0IGluaXRpYWxpemVkIGFuZCBydW5uYWJsZSAqLwo+ICAgICAgICAgYm9vbCBpbml0aWFsaXpl
ZDsKPiArCj4gKyAgICAgICAvKiogZmxvYXQgY29udGV4dCBzdGF0ZSAqLwo+ICsgICAgICAgc3Ry
dWN0IHNiaV9mcF9jb250ZXh0IGZwX2N0eDsKPiArICAgICAgIC8qKiB2ZWN0b3IgY29udGV4dCBz
dGF0ZSAqLwo+ICsgICAgICAgc3RydWN0IHNiaV92ZWN0b3JfY29udGV4dCAqdmVjX2N0eDsKPiAg
fTsKPgo+ICBzdGF0aWMgc3RydWN0IHNiaV9kb21haW5fZGF0YSBkY3ByaXY7Cj4gQEAgLTE0Myw2
ICsxNTEsMTUgQEAgc3RhdGljIGludCBzd2l0Y2hfdG9fbmV4dF9kb21haW5fY29udGV4dChzdHJ1
Y3QgaGFydF9jb250ZXh0ICpjdHgsCj4gICAgICAgICBpZiAoc2JpX2hhcnRfaGFzX2V4dGVuc2lv
bihzY3JhdGNoLCBTQklfSEFSVF9FWFRfU1NRT1NJRCkpCj4gICAgICAgICAgICAgICAgIGN0eC0+
c3JtY2ZnICAgICA9IGNzcl9zd2FwKENTUl9TUk1DRkcsIGRvbV9jdHgtPnNybWNmZyk7Cj4KPiAr
ICAgICAgIC8qIE1ha2Ugc3VyZSBGUyBhbmQgVlMgaXMgb24gYmVmb3JlIGNvbnRleHQgc3dpdGNo
ICovCj4gKyAgICAgICBjc3Jfc2V0KENTUl9NU1RBVFVTLCBNU1RBVFVTX0ZTIHwgTVNUQVRVU19W
Uyk7Cj4gKwo+ICsgICAgICAgLyogRWFnZXIgY29udGV4dCBzd2l0Y2ggRiBhbmQgViAqLwo+ICsg
ICAgICAgc2JpX2ZwX3NhdmUoJmN0eC0+ZnBfY3R4KTsKPiArICAgICAgIHNiaV9mcF9yZXN0b3Jl
KCZkb21fY3R4LT5mcF9jdHgpOwo+ICsgICAgICAgc2JpX3ZlY3Rvcl9zYXZlKGN0eC0+dmVjX2N0
eCk7Cj4gKyAgICAgICBzYmlfdmVjdG9yX3Jlc3RvcmUoZG9tX2N0eC0+dmVjX2N0eCk7Cj4gKwo+
ICAgICAgICAgLyogU2F2ZSBjdXJyZW50IHRyYXAgc3RhdGUgYW5kIHJlc3RvcmUgdGFyZ2V0IGRv
bWFpbidzIHRyYXAgc3RhdGUgKi8KPiAgICAgICAgIHRyYXBfY3R4ID0gc2JpX3RyYXBfZ2V0X2Nv
bnRleHQoc2NyYXRjaCk7Cj4gICAgICAgICBzYmlfbWVtY3B5KCZjdHgtPnRyYXBfY3R4LCB0cmFw
X2N0eCwgc2l6ZW9mKCp0cmFwX2N0eCkpOwo+IEBAIC0xNzAsNiArMTg3LDEwIEBAIHN0YXRpYyBp
bnQgaGFydF9jb250ZXh0X2luaXQodTMyIGhhcnRpbmRleCkKPiAgewo+ICAgICAgICAgc3RydWN0
IGhhcnRfY29udGV4dCAqY3R4Owo+ICAgICAgICAgc3RydWN0IHNiaV9kb21haW4gKmRvbTsKPiAr
ICAgICAgIHVuc2lnbmVkIGxvbmcgdmxlbmIgPSB2ZWN0b3JfdmxlbmIoKTsKClRoaXMgd2lsbCB0
cmFwIGlmIFZlY3RvciBleHRlbnNpb24gaXMgbm90IGF2YWlsYWJsZS4KCj4gKwo+ICsgICAgICAg
LyogQ2FsY3VsYXRlIHNpemU6IGJhc2Ugc3RydWN0ICsgMzIgcmVnaXN0ZXJzIG9mIHZsZW5iIHNp
emUgKi8KPiArICAgICAgIHNpemVfdCB2ZWNfc2l6ZSA9IHNpemVvZihzdHJ1Y3Qgc2JpX3ZlY3Rv
cl9jb250ZXh0KSArICgzMiAqIHZsZW5iKTsKPgo+ICAgICAgICAgc2JpX2RvbWFpbl9mb3JfZWFj
aChkb20pIHsKPiAgICAgICAgICAgICAgICAgaWYgKCFzYmlfaGFydG1hc2tfdGVzdF9oYXJ0aW5k
ZXgoaGFydGluZGV4LAo+IEBAIC0xODAsNiArMjAxLDEzIEBAIHN0YXRpYyBpbnQgaGFydF9jb250
ZXh0X2luaXQodTMyIGhhcnRpbmRleCkKPiAgICAgICAgICAgICAgICAgaWYgKCFjdHgpCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FTk9NRU07Cj4KPiArICAgICAgICAgICAg
ICAgLyogQWxsb2NhdGUgdGhlIHZlY3RvciBjb250ZXh0IHBvaW50ZXIgKi8KPiArICAgICAgICAg
ICAgICAgY3R4LT52ZWNfY3R4ID0gc2JpX3phbGxvYyh2ZWNfc2l6ZSk7Cj4gKyAgICAgICAgICAg
ICAgIGlmICghY3R4LT52ZWNfY3R4KSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgc2JpX2Zy
ZWUoY3R4KTsKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VOT01FTTsKPiAr
ICAgICAgICAgICAgICAgfQo+ICsKPiAgICAgICAgICAgICAgICAgLyogQmluZCBjb250ZXh0IGFu
ZCBkb21haW4gKi8KPiAgICAgICAgICAgICAgICAgY3R4LT5kb20gPSBkb207Cj4gICAgICAgICAg
ICAgICAgIGhhcnRfY29udGV4dF9zZXQoZG9tLCBoYXJ0aW5kZXgsIGN0eCk7Cj4gLS0KPiAyLjQz
LjAKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3Bl
bnNiaQoKUmVnYXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5zYmkK
