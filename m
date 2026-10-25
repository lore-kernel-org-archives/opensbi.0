Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE101606A31A
	for <opensbi@archiver.kernel.org>; Sun, 25 Oct 2026 08:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Psy/dxL9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=WZZEOrL7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Af5buvFP+04i1ZeYaFY/srhgwk+Yx+ll75jDebpRPDQ=; b=Psy/dxL9vngrn2GRY3kDFkwsL8
	05Ix4kOdhOo8BOa3hnUlzOYKXuuNOcBFk0s9K4lOiKkW6K+5Z+X1jWhq/iZNGuivTOF8kaaxVgge/
	/mfGNFZCwAyvfzu7oGdnaHOprOa9KFOSdKMc2jkqkzvrnMBrzXwnZeI5eHBzd6YZpNE+u8+FFqjTh
	MzO9RHBV37An1un1PmFlxxMO1twTR56/M0SB9zRGKIlliDHPIujqS1h1uhNlPyikbcMVSHrvQ+DFI
	pNi5oNEowb4crM76BiObebJKmqVHXCXLwKinodM4NLV7qHy3/BXHxjkI6ac4Uht4hqw0YS88sCPZ0
	eQtQHAuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKtik-00000000t4q-2ZJb;
	Sun, 25 Oct 2026 08:36:50 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKtii-00000000t4J-0k47
	for opensbi@lists.infradead.org;
	Sun, 25 Oct 2026 08:36:49 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso1524434f8f.0
        for <opensbi@lists.infradead.org>; Sun, 25 Oct 2026 01:36:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792917406; cv=none;
        d=google.com; s=arc-20260327;
        b=aDrXuziD77c+eAuKwy8rZPn4/Ol+2tqcwGbesHRmZnDKgkGnXAaihHWkriszx9zXeE
         VZpAQQNEU4cjlZcC8iso5pyiaLxo8lu8r6dEhP99nDqEKJQnekwHATPQ8bP5azl6O8yj
         RveBJcK+p7tW2Q/ck35w0uk1dVjtWNLFDvLfUVNuEF+aP4/HUMEAqT1q6wJ41EEpVB0t
         cvS79DNC1ut+NmaQTveMcb/EYEJ1MCWuyWwhi/ITU4zOwJ51SlR+1S6jM6ZAL867/rkk
         oY6RUtvtqHPX7SC9QI0fxyvnhpS7Vs2CP4B1gbBp1M8XY2KMiCn4TjlRLVHewH5ZG6J1
         LX9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MOfEQ6rP2x/uMpXoTKhFjzD7F9rq3+indxJB69JEZe8=;
        fh=dYNPijyEPMfoJfyZTf5BLfxwl8O4y8/bu/bQo6VDOZ8=;
        b=dzz3r0baSROsQ3SZbkrcR7KaU4DYQwgRqqWW1EbMc9B6YcX+O/AuG1vVpyq42Cu3AP
         k7jE3y7MLZbIK4SB+XfcbqNBKagdceusjZpc6i8CixvTdC3pzOk7YqIftJ6cwIFAxL8o
         4YzyLeMupEA7mh2coTVeRiu5cskC0sRRD+F0+At1ULPjkb5t3xR4zqtoP8GBAzEs+WqI
         d2AtUTfkUaEdemTJHbKFk/V6FR6HP95jUKxEGtErbEXVQ5TqN/jOen73Eepw5qfs2MZz
         QykbAUAbGRA9Z5gwTZEKGvQhqWfPX71RO320audjCZdPv9MgbpOvfr57OehX/9x2Hiw4
         iwHg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792917406; x=1793522206; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MOfEQ6rP2x/uMpXoTKhFjzD7F9rq3+indxJB69JEZe8=;
        b=WZZEOrL7FK8LXgGp/wcHoSIYksG1UVGIdVx6ZFfLawJtAwL/1n8MrolOMccFevwGs1
         WnuNoo6SUtzaBut7L0v+K9hIBagyuDhGbq8UVyuHR0p1wRsUpzetgXrckaof4EZV01Zt
         m3Y5+dB0aBRmPoOKZn1gV8fjBDgThLXFgDaFVoqKr+c7CIaUgbFJh6x1V80UXxpLP9Af
         MvJKoEO4I0wGYgy3CDGwVSdr9t55fnVEUFswYlvmFza6FxLjIzm7vaNJsKENP51sHZ3q
         JL1kK9QKpj50WSTashgdqcSJuq2EEW3Zy3UV+WWmx5kkH6XEvphDQvs7a2uNlkDe3KB6
         ipLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792917406; x=1793522206;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MOfEQ6rP2x/uMpXoTKhFjzD7F9rq3+indxJB69JEZe8=;
        b=cSV+jc8IV2sgxHA/FtJeEW4KfytKpCG/2OBm4B1DlqK8FEJqQfglk3RICKk4P9fmM7
         CJoqruqPUXwqo1z2BC67MKtIfOyAcRZmLRK+9q4SrztvUWTbi3dLywn/b2+E1tDd/TIi
         hGuniRtZDvVjPvoSXeA+I1VEzW9LTKDuKTuepvBWBoQ1WudCStam/zczw5WoS4qobTxA
         GcNsaDYr/D7rNDCrDkNGjYTxznDTPf1hZu8Gjwo9b3AuxGfMOHRNw46tIIM4oGcGo9lo
         xSIg69jwIxS22egMaSun2MDcJBUmDGyc3CYm5Hosz+vtmYcV+yq5PwfNkFCxBvithlos
         XUcg==
X-Gm-Message-State: AFq9FYIwogUTZWZjv32KZOQv4I4mTgIpUY1X74LhGUg+/CUxbfc3Pz1S
	I6Wig0bZ09Iuhn7EA7Jn1i8gwLJH0Y5Q1PPRKQ8a7fjt7CoItPJA5ZtTQ54aQVLc2gMS1c/kVYY
	dq6bHxcavQEjvKLfyCIfDAZxAetIFYrOuN/hmlgrr0w==
X-Gm-Gg: AYBFou0XaqXFAT3gER5qwksb/Wix/IwhtQDHlaKHYdUbjSStBA4pVcnJCUWUXhlboP7
	mJZhx1WSfgOdxtgMc2KUYcbg6/WyuUhPXK8xxJPqU6QmD3W4MTTvBZvDSDyZm0HVmBlZeW+KZ6o
	UtCmOjvrWQtTuVKhQ+H1kVt+IwZUOiEnwMZUsjjjz/ITYuflqYljjvCPrlQSrrlyAH29CIWrfm/
	R6ry1XytJSsf+HSwvdGqJJTRQU29mIdS5pZrCVjZLtedyy382SDQ00XKtlSy/o/Z7NZnkb6iTTI
	xcjs+Ch/VXOUBLB1Q+Ix5oOsRy5ZKdp/yTJFNRBukMAkoqMwImZBOjah5E2bDDysiSxaXidQvrN
	w14ppoq/eZxeLAjlUCJtI9EcHCE93fIdbGCgjub0uYzXN4Vgh5/jM4m+6+/pV7jWM49wegdh226
	AyMsXz3eX+q34pb/6NtSfHPVCekOn21IjAy8/VMw7KPwIzG/t+Hgiks1Rs
X-Received: by 2002:a05:6000:25fd:b0:48b:4a2:8175 with SMTP id
 ffacd0b85a97d-48e3ebb1541mr5528967f8f.43.1792917406197; Sun, 25 Oct 2026
 01:36:46 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261012022033.1165060-1-sebasjosue84@gmail.com>
In-Reply-To: <20261012022033.1165060-1-sebasjosue84@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 25 Oct 2026 14:06:34 +0530
X-Gm-Features: AclHuK_NMpe5xbPEVZSVk67xnKduLrOh5COZCVkEVtX14dUp-gdtAIZANY2QFbs
Message-ID: <CAAhSdy0ntyJMLdtWbsSCsiNinB+e_n-eLK0EE92reoncNG3+Fw@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi_pmu: unmap shared memory on the early exit in event_get_info
To: Sebastian Alba Vives <sebasjosue84@gmail.com>
Cc: opensbi@lists.infradead.org, atishp@rivosinc.com, 
	david.garcia@aheadcomputing.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_013648_254736_38AD24D4 
X-CRM114-Status: GOOD (  35.39  )
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

T24gTW9uLCBPY3QgMTIsIDIwMjYgYXQgNzo1MOKAr0FNIFNlYmFzdGlhbiBBbGJhIFZpdmVzCjxz
ZWJhc2pvc3VlODRAZ21haWwuY29tPiB3cm90ZToKPgo+IHNiaV9wbXVfZXZlbnRfZ2V0X2luZm8o
KSBtYXBzIHRoZSBjYWxsZXIncyBzaGFyZWQgbWVtb3J5IGludG8gTS1tb2RlIHdpdGgKPiBzYmlf
aGFydF9wcm90ZWN0aW9uX3RlbXBfbWFwX3JhbmdlKCkuIFRoZSBtdXN0LWJlLXplcm8gY2hlY2sg
YWRkZWQgaW5zaWRlIHRoZQo+IGV2ZW50IGxvb3AgcmV0dXJucyBzdHJhaWdodCB0byB0aGUgc3Vw
ZXJ2aXNvciB3aXRob3V0IHJlYWNoaW5nIHRoZSBtYXRjaGluZwo+IHRlbXBfdW5tYXBfcmFuZ2Uo
KSBhdCB0aGUgZW5kIG9mIHRoZSBmdW5jdGlvbiwgc28gdGhlIG1hcHBpbmcgaXMgbGVmdCBiZWhp
bmQuCj4KPiBUaGlzIGhhcyBhIHNlY3VyaXR5IGltcGFjdCBiZXlvbmQgbGVha2luZyBhIG1hcHBp
bmcuIFVuZGVyIFNtZXBtcCB0aGUKPiB0ZW1wb3JhcnkgbWFwcGluZyBpcyBhIHNpbmdsZSByZXNl
cnZlZCBQTVAgZW50cnksIFNCSV9TTUVQTVBfUkVTVl9FTlRSWS4KPiBzYmlfaGFydF9zbWVwbXBf
dGVtcF9tYXBfcmFuZ2UoKSByZWZ1c2VzIHRvIHJlcHJvZ3JhbSB0aGF0IGVudHJ5IHdoaWxlIGl0
IGlzCj4gYWxyZWFkeSBlbmFibGVkOgo+Cj4gICAgICAgICBpZiAoc2JpX2hhcnRfaXNfcG1wX2Vu
YWJsZWQoU0JJX1NNRVBNUF9SRVNWX0VOVFJZKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIFNC
SV9FTk9TUEM7Cj4KPiBhbmQgbm8gY2FsbGVyIGluIHRoZSB0cmVlIGNoZWNrcyB0aGF0IHJldHVy
biB2YWx1ZS4gc2JpX3BtdS5jLCBzYmlfc3NlLmMsCj4gc2JpX21weHkuYywgc2JpX2RidHIuYyBh
bmQgc2JpX2VjYWxsX2RiY24uYyBhbGwgZGlzY2FyZCBpdC4gU28gb25jZSB0aGUgZW50cnkKPiBp
cyBsZWZ0IGJlaGluZCwgZXZlcnkgbGF0ZXIgc2hhcmVkIG1lbW9yeSBlY2FsbCBvbiB0aGF0IGhh
cnQgcnVucyB3aXRoIFBNUCAwCj4gc3RpbGwgY292ZXJpbmcgdGhlIHByZXZpb3VzIHJlZ2lvbiwg
YW5kIE0tbW9kZSBmYXVsdHMgdGhlIGZpcnN0IHRpbWUgaXQKPiBkZXJlZmVyZW5jZXMgdGhlIG5l
dyBidWZmZXIuCj4KPiBBIHN1cGVydmlzb3IgdHJpZ2dlcnMgdGhpcyB3aXRoIG9uZSBlY2FsbCBj
YXJyeWluZyBhIHJlc2VydmVkIGJpdCBpbiB0aGUgZmlyc3QKPiBldmVudF9pZHguIFRoZSBuZXh0
IFNCSV9FWFRfREJDTl9DT05TT0xFX1dSSVRFIHRoZW4gdGFrZXMgYW4gTS1tb2RlIGxvYWQKPiBh
Y2Nlc3MgZmF1bHQgb24gdGhlIGNvbnNvbGUgYnVmZmVyIGFuZCB0aGUgZmlybXdhcmUgc3RvcHMg
bWFraW5nIGZvcndhcmQKPiBwcm9ncmVzcywgdGFraW5nIERCQ04sIFNTRSwgTVBYWSBhbmQgREJU
UiBkb3duIHdpdGggaXQgb24gdGhhdCBoYXJ0LiBJdCBhbHNvCj4gYnJlYWtzIHRoZSBTbWVwbXAg
aW52YXJpYW50IHRoYXQgTS1tb2RlIGRvZXMgbm90IHJldGFpbiBzdGFuZGluZyBhY2Nlc3MgdG8K
PiBzdXBlcnZpc29yIG1lbW9yeS4KPgo+IENvbmZpcm1lZCBvbiBxZW11IHZpcnQgd2l0aCBhIGJh
cmUgbWV0YWwgUy1tb2RlIHBheWxvYWQsIFFFTVUgOC4yLjI6Cj4KPiAgIGJ1aWxkICAgICAgICAg
ICAgICAgICAtY3B1ICAgICAgICAgICAgICAgIHByb3RlY3Rpb24gICByZXN1bHQKPiAgIG1hc3Rl
ciA2YWQyNDZhMSAgICAgICBydjY0ICAgICAgICAgICAgICAgIHBtcCAgICAgICAgICBjb21wbGV0
ZXMKPiAgIG1hc3RlciA2YWQyNDZhMSAgICAgICBydjY0LHNtZXBtcD10cnVlICAgIGVwbXAgICAg
ICAgICBmaXJtd2FyZSBkaWVzCj4gICBtYXN0ZXIgKyB0aGlzIHBhdGNoICAgcnY2NCxzbWVwbXA9
dHJ1ZSAgICBlcG1wICAgICAgICAgY29tcGxldGVzCj4KPiBUaGUgbWlkZGxlIHJvdyBsZWF2ZXMg
dGhpcyBhcyB0aGUgbGFzdCBlbnRyeSBpbiB0aGUgUUVNVSBleGNlcHRpb24gdHJhY2UsCj4gd2hl
cmUgdGhlIGVwYyBpcyBpbnNpZGUgbnB1dHMoKSBpbiBNLW1vZGUgYW5kIHRoZSB0dmFsIGlzIHRo
ZSBzdXBlcnZpc29yCj4gY29uc29sZSBidWZmZXI6Cj4KPiAgIGNhdXNlOjAwMDAwMDAwMDAwMDAw
MDUsIGVwYzoweDAwMDAwMDAwODAwMDIwNGMsCj4gICB0dmFsOjB4MDAwMDAwMDA4MDUwMDAwMCwg
ZGVzYz1mYXVsdF9sb2FkCj4KPiBXaXRob3V0IFNtZXBtcCB0aGUgbWFwIGFuZCB1bm1hcCBwYWly
IGNvbXBpbGVzIGRvd24gdG8gbm90aGluZywgd2hpY2ggaXMgd2h5Cj4gdGhlIGZpcnN0IHJvdyBz
dXJ2aXZlcy4KPgo+IFRoaXMgb25seSBhZmZlY3RzIG1hc3Rlci4gdjEuOSBhbmQgZWFybGllciBo
YXZlIHRoZSBzYW1lIG1hcCBhbmQgdW5tYXAgcGFpcgo+IGJ1dCBubyByZXR1cm4gYmV0d2VlbiB0
aGVtLCBzbyBubyByZWxlYXNlZCB2ZXJzaW9uIG5lZWRzIGEgYmFja3BvcnQuCj4KPiBSb3V0ZSB0
aGUgZWFybHkgZXhpdCB0aHJvdWdoIHRoZSBleGlzdGluZyB1bm1hcC4KPgo+IEZpeGVzOiBkOTdj
ZmIzM2FlMWEgKCJsaWI6IHNiaV9wbXU6IFJldHVybiBpbnZhbGlkIHBhcmFtIGVycm9yIGZvciBy
ZXNlcnZlZCBldmVudF9pZHggYml0cyIpCj4gU2lnbmVkLW9mZi1ieTogU2ViYXN0aWFuIEFsYmEg
Vml2ZXMgPHNlYmFzam9zdWU4NEBnbWFpbC5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAg
UGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhlIHJp
c2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKPiAtLS0KPgo+IEEgbm90ZSB0aGF0IGNh
bWUgb3V0IG9mIHRoZSBzYW1lIGF1ZGl0IGJ1dCBkb2VzIG5vdCBiZWxvbmcgaW4gdGhlIGNvbW1p
dAo+IG1lc3NhZ2UsIHNpbmNlIGl0IGlzIGEgZGVzaWduIHF1ZXN0aW9uIHJhdGhlciB0aGFuIHBh
cnQgb2YgdGhpcyBmaXguCj4KPiBFdmVyeSBjYWxsIHNpdGUgb2Ygc2JpX2hhcnRfcHJvdGVjdGlv
bl90ZW1wX21hcF9yYW5nZSgpIGluIHRoZSB0cmVlIGRpc2NhcmRzCj4gdGhlIHJldHVybiB2YWx1
ZS4gVGhlcmUgYXJlIGVsZXZlbiBvZiB0aGVtLCBpbiBzYmlfcG11LmMsIHNiaV9kYnRyLmMsCj4g
c2JpX21weHkuYyBhbmQgc2JpX2VjYWxsX2RiY24uYy4gVGhlIGZ1bmN0aW9uIGNhbiByZXR1cm4g
U0JJX0VOT1NQQyB3aGVuIHRoZQo+IHJlc2VydmVkIGVudHJ5IGlzIGFscmVhZHkgaW4gdXNlLCBh
bmQgd2hlbiB0aGF0IGhhcHBlbnMgdGhlIGNhbGxlciBnb2VzIG9uIHRvCj4gZGVyZWZlcmVuY2Ug
dGhlIGJ1ZmZlciB3aXRoIG5vIG1hcHBpbmcgY292ZXJpbmcgaXQsIHdoaWNoIGlzIGhvdyB0aGUg
YnVnIGFib3ZlCj4gdHVybnMgaW50byBhIGRlYWQgaGFydCByYXRoZXIgdGhhbiBhbiBlcnJvciBj
b2RlLgo+Cj4gSSBjaGVja2VkIHRoZSByZXN0IG9mIHRoZSBhY3F1aXJlIGFuZCByZWxlYXNlIHBh
aXJzIG9uIHRoZSBlY2FsbCBwYXRocyB3aGlsZSBJCj4gd2FzIHRoZXJlLiBzYmlfZGJ0cl91cGRh
dGVfdHJpZygpLCBzYmlfZGJ0cl9pbnN0YWxsX3RyaWcoKSwgdGhlIG1weHkgYXR0cmlidXRlCj4g
aGFuZGxlcnMgYW5kIHRoZSBTU0UgZXZlbnQgZ2V0IGFuZCBwdXQgcGFpcnMgYXJlIGFsbCBiYWxh
bmNlZCBvbiBldmVyeSBleGl0LAo+IGluY2x1ZGluZyB0aGUgb25lcyBpbnNpZGUgbG9vcHMsIHNv
IGV2ZW50X2dldF9pbmZvKCkgaXMgdGhlIG9ubHkgdW5iYWxhbmNlZAo+IHBhdGggSSBmb3VuZC4g
VGhlIGRpc2NhcmRlZCByZXR1cm4gdmFsdWVzIGFyZSB3aGF0IG1ha2VzIHRoYXQgc2luZ2xlIHNs
aXAKPiBmYXRhbCBpbnN0ZWFkIG9mIHZpc2libGUsIHNvIGl0IG1heSBiZSB3b3J0aCBkZWNpZGlu
ZyB3aGV0aGVyIHRoZSBjYWxsZXJzCj4gc2hvdWxkIGNoZWNrLCBvciB3aGV0aGVyIHRoZSBoZWxw
ZXIgc2hvdWxkIGZhaWwgbG91ZGx5IG9uIGl0cyBvd24uCj4KPiBJIGFtIGhhcHB5IHRvIHNlbmQg
YSBmb2xsb3cgdXAgZm9yIHdoaWNoZXZlciBzaGFwZSB5b3UgcHJlZmVyLgo+Cj4gIGxpYi9zYmkv
c2JpX3BtdS5jIHwgMTEgKysrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9wbXUuYyBi
L2xpYi9zYmkvc2JpX3BtdS5jCj4gaW5kZXggZTc5ZjZiNjAuLjNjYzFmYzRiIDEwMDY0NAo+IC0t
LSBhL2xpYi9zYmkvc2JpX3BtdS5jCj4gKysrIGIvbGliL3NiaS9zYmlfcG11LmMKPiBAQCAtMTA3
NSw3ICsxMDc1LDcgQEAgaW50IHNiaV9wbXVfZXZlbnRfZ2V0X2luZm8odW5zaWduZWQgbG9uZyBz
aG1lbV9waHlzX2xvLCB1bnNpZ25lZCBsb25nIHNobWVtX3BoeXMKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBsb25nIG51bV9ldmVudHMsIHVuc2lnbmVkIGxvbmcgZmxhZ3Mp
Cj4gIHsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgc2htZW1fc2l6ZSA9IG51bV9ldmVudHMgKiBz
aXplb2Yoc3RydWN0IHNiaV9wbXVfZXZlbnRfaW5mbyk7Cj4gLSAgICAgICBpbnQgaSwgaiwgZXZl
bnRfdHlwZTsKPiArICAgICAgIGludCBpLCBqLCBldmVudF90eXBlLCByZXQgPSAwOwo+ICAgICAg
ICAgc3RydWN0IHNiaV9wbXVfZXZlbnRfaW5mbyAqZWluZm87Cj4gICAgICAgICBzdHJ1Y3Qgc2Jp
X3BtdV9oYXJ0X3N0YXRlICpwaHMgPSBwbXVfdGhpc2hhcnRfc3RhdGVfcHRyKCk7Cj4gICAgICAg
ICB1aW50MzJfdCBldmVudF9pZHg7Cj4gQEAgLTExMTIsOCArMTExMiwxMCBAQCBpbnQgc2JpX3Bt
dV9ldmVudF9nZXRfaW5mbyh1bnNpZ25lZCBsb25nIHNobWVtX3BoeXNfbG8sIHVuc2lnbmVkIGxv
bmcgc2htZW1fcGh5cwo+ICAgICAgICAgZm9yIChpID0gMDsgaSA8IG51bV9ldmVudHM7IGkrKykg
ewo+ICAgICAgICAgICAgICAgICBldmVudF9pZHggPSBlaW5mb1tpXS5ldmVudF9pZHg7Cj4gICAg
ICAgICAgICAgICAgIC8qIEFueSBtdXN0LWJlLXplcm8gZXZlbnRfaWR4IGJpdHMgc2V0IHNob3Vs
ZCByZXR1cm4gSU5WQUxJRF9QQVJBTSBwZXItc3BlYyAqLwo+IC0gICAgICAgICAgICAgICBpZiAo
ZXZlbnRfaWR4ICYgU0JJX1BNVV9FVkVOVF9JRFhfTUJaX01BU0spCj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIFNCSV9FUlJfSU5WQUxJRF9QQVJBTTsKPiArICAgICAgICAgICAgICAg
aWYgKGV2ZW50X2lkeCAmIFNCSV9QTVVfRVZFTlRfSURYX01CWl9NQVNLKSB7Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgcmV0ID0gU0JJX0VSUl9JTlZBTElEX1BBUkFNOwo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGdvdG8gb3V0X3VubWFwOwo+ICsgICAgICAgICAgICAgICB9Cj4gICAgICAg
ICAgICAgICAgIGV2ZW50X3R5cGUgPSBwbXVfZXZlbnRfdmFsaWRhdGUocGhzLCBldmVudF9pZHgs
IGVpbmZvW2ldLmV2ZW50X2RhdGEpOwo+ICAgICAgICAgICAgICAgICBpZiAoZXZlbnRfdHlwZSA8
IDApIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBlaW5mb1tpXS5vdXRwdXQgPSAwOwo+IEBA
IC0xMTU0LDkgKzExNTYsMTAgQEAgaW50IHNiaV9wbXVfZXZlbnRfZ2V0X2luZm8odW5zaWduZWQg
bG9uZyBzaG1lbV9waHlzX2xvLCB1bnNpZ25lZCBsb25nIHNobWVtX3BoeXMKPiAgICAgICAgICAg
ICAgICAgfQo+ICAgICAgICAgfQo+Cj4gK291dF91bm1hcDoKPiAgICAgICAgIHNiaV9oYXJ0X3By
b3RlY3Rpb25fdGVtcF91bm1hcF9yYW5nZShzaG1lbV9waHlzX2xvLCBzaG1lbV9zaXplKTsKPgo+
IC0gICAgICAgcmV0dXJuIDA7Cj4gKyAgICAgICByZXR1cm4gcmV0Owo+ICB9Cj4KPiAgc3RhdGlj
IHZvaWQgcG11X3Jlc2V0X2V2ZW50X21hcChzdHJ1Y3Qgc2JpX3BtdV9oYXJ0X3N0YXRlICpwaHMp
Cj4gLS0KPiAyLjQzLjAKPgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L29wZW5zYmkK
