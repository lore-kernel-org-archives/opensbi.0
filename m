Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FAB606A31A
	for <opensbi@archiver.kernel.org>; Sun, 25 Oct 2026 08:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MKWUvM3y;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=KAW+CmtN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CMNFvsYfz0r08vEDDwrypDHv4weu2N4ymp+0GPLss+A=; b=MKWUvM3yShza4T3OYMPfztTCVV
	B9ti8odpQl9/cccrVU7UCmWeSX6R6a0ufn8J9iREfGLWG0Zmcj7dJUYkGEtXMd24n9YTAbuN1rI0W
	oQGTE2XlNL+a3oJwCcvjRKQVcHLZOv66O4HmFfElVpyWHxtRn7ip+Owu8BndxVWHyjzDGLD0i4YJF
	4SoeEof3lBgFbVNF/RophSvFZnjeSsRG3apj6IeFW1z6j6tLGt7JfX+e0mHtUdvlaTFwdBUgC4BVi
	6US/H03eI2NmQRIicjeGE1i2282wcI1Farzl7klheuni26l3mTtKjRShrwgxXoPCw1BXLVifapUq8
	3aHX7DcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKtRm-00000000sNt-2Emg;
	Sun, 25 Oct 2026 08:19:18 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKtRj-00000000sNW-2Ilk
	for opensbi@lists.infradead.org;
	Sun, 25 Oct 2026 08:19:16 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so1177425e9.0
        for <opensbi@lists.infradead.org>; Sun, 25 Oct 2026 01:19:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792916353; cv=none;
        d=google.com; s=arc-20260327;
        b=Jr8HY9pt1y/ptUXo+TQ8mDcxJjUNRIOtBWeWwnTvHtz1TtB7uv5HjPPSN0/Tyj2/Bt
         yAv0gFedh92iE2oE3CYwrYx4k4cKPKxpM1a7af5w6ea9LY2QX6HOXmDwwDviO0os1U35
         Dca5aeESvk9+wZPzIvm7EbiuDVmwoI29fQ/sn3gDk8M27q5DkZmFEo3YujggG2cSqXmr
         NAeHrEdhnaLEA4AZGftNo1iCKVufbm1UlWkFb2FzKej1Ozzc/nxXzVfR2N1eSGE6CDFO
         DINSHJmkFFEi7ohr0JyCatci/jV5AihhKDEog22fxbhlEk3wqTUX12cQJf+GGOo2EHiL
         cOfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hGRak8YmR2wRu3A4Z0gCk7c7CGwB6I/mVdc1Cj+N3lI=;
        fh=vIdEKAS85wJF4kVr1hPvqPxowGm5XGH5KR4fr+ORURk=;
        b=Z4U48unHPNSRlDCiWF8fqCAHR5qCNiFQVZzmvrZA5Y4WW5i/FAsQQUr0KbQIdnlWj+
         2ZPUwrMSSV3iS6oLQXTzjTAZ3dCyGfTwZJ2FYfXShfRuzn10Bba86ycZLV4NyJDnL24I
         q7M/tZEkyU/Tbk9hON/LL0x3s1ZB9s//hCC/TlBgJ62uQP3PzPGbEOqsLEkfJXFYmFhM
         3r8qCJl/R2dpQxKrpEIll/+Ow2LEpfUz/SbrGAy4pdAUym4zGwxWCb4cnWsHwOyyMy0T
         2Q0LZkL42JKBAxPW0AFBqOkAJJetFrHrkJXVIMb1W65hFMzmV5mw1hPi38iO9TTT9uXm
         xk3Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792916353; x=1793521153; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hGRak8YmR2wRu3A4Z0gCk7c7CGwB6I/mVdc1Cj+N3lI=;
        b=KAW+CmtNYu2jJT05Sw6m3ZySs/cIGSaKs0XYHXp7XC3HRBYFdm3fF3kqRYa0shYUbT
         5qkLHsUiNJGtGq7EbZTYABHLw/i2ceH4AqEhx3FFivV9jxx+CgRhPG4b40JeUJRweqwc
         I4zXufItysMy85B2I0NoMfGo/+KINeDayelByiAZVg4bwJ2OPxUUlo0SWVYYtI50Xghp
         ObnG5laQuF6sLDz4uYUpytnT0lDXYRPqWi2EEd4xkT1nPPYcLueIlo505g4Ocw8yrY6j
         1J4nyWZ8LbwwXe9YjNj3VHhU9YexA1PGuMV+gIqTKxraq0rgelBK8WmjvqbrERa5Xnnh
         i6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792916353; x=1793521153;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hGRak8YmR2wRu3A4Z0gCk7c7CGwB6I/mVdc1Cj+N3lI=;
        b=wJCJZ1Jfnjyu1va2DFuPVoHTc48N/8eyFUNBTvYzB636a7z7mRsz5NdP5LBI8kvoox
         xF9wuwMo+GzvOhJmHBgI/Xg4ktCl8BDQwKNfrpGkdL7l2MXn2Mxh7N8Odi5sLTHbUkno
         zWc52heDa6imEKG4zDwJvxwrret+sD6ATYoMK5jAtebW5ihlqv2sur38/R7nxsWmZ3a/
         IrRoRhV3TLTpbXsQ7dcI8QrGHWOn2LEQNm9kPitMgSLiluJyOxzIwYSv4rkRUPWKtbnQ
         R6bR/++mROFtka40q5X72Th+HeSMy7+R81yGdhhXjnD1OsOuGb/CbyVnr9kjDIGZNWmd
         DwCw==
X-Gm-Message-State: AFq9FYIRH8Y0zMxrxfoGfYEFoacdfIIj+jJHmo4bpKbbq+CxiUFVDcY+
	/CePf2EYVIj7/l5cMnSx8jDYh3/titBa+AXdat81VDmkr7xKRanc3ZbDW6InCb/WpjxPNMkOuna
	P75+RZX1VP+Azfk+eBsRQ3Aw4ehcaEb3iDrc2TRAUIQ==
X-Gm-Gg: AYBFou3kBKoqFMtrxavrZEeBDDf9uihT3lKOYSpUrK0Y0vwgsHA6BdsuyZD+kLjfNrp
	tD7Regkle2ievQDI+vUEVimg/7fXXPFtuCg0WW1H2FfGbglucarpoBz/wAG0t1IiqpdEfW5auTE
	1UeMzB4cZlvPD7HUsvE+c6xhLrnN1ia17ajbNhZTsJaBSs8Xzrku7hwLzoUQEsBM0lBNb2/bxTH
	h0NVmsgxecxRC631SZVw9tofPEodNN/RqufDrQ9UzUOHoHav3jN5olqFjBP2djv1TobrvVrH8IM
	K+LBG+Qy8Y2VjwBWsvXiJid5pWPwSG2hy3Xc9JprVc1DYsx/sLMH2S0I0L1erE2kP2Ihznskb3T
	6dakdqvaYENguBk/XSRxl2anamZH+WBes80TBvt0aip1ZbgQVy4IOeXG3IMr3H3UQOqywWlLrzb
	F8NQloOhuNiQJ7Ss/C7T8CvbA9B9iTp3E/WTyquHKkVt8inqDnxrbcIYOQPAYLpeJZVU/ZWPrwC
	f6CpuU=
X-Received: by 2002:a05:600c:46cb:b0:4a5:1cf1:b7b8 with SMTP id
 5b1f17b1804b1-4a51cf1b81bmr19313335e9.28.1792916353289; Sun, 25 Oct 2026
 01:19:13 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261025062836.2445655-1-sebasjosue84@gmail.com> <20261025062836.2445655-2-sebasjosue84@gmail.com>
In-Reply-To: <20261025062836.2445655-2-sebasjosue84@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 25 Oct 2026 13:49:02 +0530
X-Gm-Features: AclHuK954PcfHCd1ta_MJdMLewBikyU5IJgM7AY91GS4BrUeWRLZ69zj9nfAa5A
Message-ID: <CAAhSdy255yQbqaU=q2=2OTFv5+SXaL58Jvugk4R7_JegN7yyuQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] lib: sbi_pmu: do not ignore pmu_ctr_start_hw() error
 in cfg_match
To: Sebastian Alba Vives <sebasjosue84@gmail.com>
Cc: opensbi@lists.infradead.org, anup.patel@oss.qualcomm.com, 
	pengpeng@iscas.ac.cn, hppiscas@163.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_011915_642866_9DBBB71D 
X-CRM114-Status: GOOD (  28.80  )
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

T24gU3VuLCBPY3QgMjUsIDIwMjYgYXQgMTE6NTnigK9BTSBTZWJhc3RpYW4gQWxiYSBWaXZlcwo8
c2ViYXNqb3N1ZTg0QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBzYmlfcG11X2N0cl9jZmdfbWF0Y2go
KSBjYWxscyBwbXVfY3RyX3N0YXJ0X2h3KCkgZm9yIHRoZSBBVVRPX1NUQVJUCj4gZmxhZyBhbmQg
ZHJvcHMgdGhlIHJlc3VsdC4gcG11X2N0cl9zdGFydF9odygpIGNhcnJpZXMgaXRzIG93biBpbmRl
eAo+IGd1YXJkCj4KPiAgICAgICAgIGlmIChjaWR4ID49IG51bV9od19jdHJzIHx8IGNpZHggPT0g
MSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FSU5WQUw7Cj4KPiBzbyBhIHJlamVjdGVk
IGluZGV4IGlzIHJlcG9ydGVkIHRvIHRoZSBjYWxsZXIgYXMgYSBzdWNjZXNzZnVsCj4gY29uZmln
dXJlLgo+Cj4gVGhpcyBpcyB0aGUgb25seSBvbmUgb2YgdGhlIHRocmVlIHN0YXJ0IHBhdGhzIGlu
IHRoZSBmaWxlIHRoYXQKPiBkaXNjYXJkcyB0aGUgZXJyb3IuIHNiaV9wbXVfY3RyX3N0YXJ0KCkg
cHJvcGFnYXRlcyBpdDoKPgo+ICAgICAgICAgcmV0ID0gcG11X2N0cl9zdGFydF9odyhjaWR4LCBp
dmFsLCBiVXBkYXRlKTsKPiAgICAgICAgIGlmIChyZXQpCj4gICAgICAgICAgICAgICAgIHJldHVy
biByZXQ7Cj4KPiBhbmQgdGhlIGZpcm13YXJlIGJyYW5jaCBkaXJlY3RseSBiZWxvdyB0aGlzIGNh
bGwgc2l0ZSBwcm9wYWdhdGVzIHRoZQo+IGVycm9yIGZyb20gcG11X2Rldi0+ZndfY291bnRlcl9z
dGFydCgpIGFzIHdlbGwuCj4KPiBQcm9wYWdhdGUgdGhlIGVycm9yLCBleGNlcHQgU0JJX0VBTFJF
QURZX1NUQVJURUQuIFRoYXQgdmFsdWUgb25seQo+IHNheXMgdGhlIG1jb3VudGluaGliaXQgYml0
IHdhcyBhbHJlYWR5IGNsZWFyLCB3aGljaCBpcyBhIGJlbmlnbgo+IGNvbmRpdGlvbiBmb3IgYSBj
b25maWd1cmUgY2FsbCwgYW5kIGZhaWxpbmcgdGhlIHdob2xlIGNhbGwgYmVjYXVzZQo+IHRoZSBj
b3VudGVyIHdhcyBhbHJlYWR5IHJ1bm5pbmcgd291bGQgYmUgYSBiZWhhdmlvdXIgY2hhbmdlIGZv
cgo+IGV4aXN0aW5nIHN1cGVydmlzb3JzLgoKT24gdGhlIGNvbnRyYXJ5LCB0aGUgY29uZmlndXJl
IHNob3VsZCBmYWlsIGlmIHRoZSBjb3VudGVyIHdhcyBhbHJlYWR5CnJ1bm5pbmcgYmVjYXVzZSB0
aGUgY291bnRlciBtaWdodCBoYXZlIGJlZW4gY29uZmlndXJlZCBmb3IgYSBkaWZmZXJlbnQKZXZl
bnQgcHJldmlvdXNseS4KCk90aGVyd2lzZSwgdGhpcyBsb29rcyBnb29kLgoKUmVnYXJkcywKQW51
cAoKPgo+IEZpeGVzOiAxM2Q0MGYyMWQ1ODggKCJsaWI6IHNiaTogQWRkIFBNVSBzdXBwb3J0IikK
PiBTaWduZWQtb2ZmLWJ5OiBTZWJhc3RpYW4gQWxiYSBWaXZlcyA8c2ViYXNqb3N1ZTg0QGdtYWls
LmNvbT4KPiAtLS0KPgo+IFR3byB0aGluZ3MgSSBrZXB0IG91dCBvZiB0aGUgY29tbWl0IG1lc3Nh
Z2UgYmVjYXVzZSB0aGV5IGFyZSBkZXNpZ24KPiBxdWVzdGlvbnMgcmF0aGVyIHRoYW4gcGFydCBv
ZiB0aGUgZml4Lgo+Cj4gSSBmaWx0ZXJlZCBTQklfRUFMUkVBRFlfU1RBUlRFRCBvbiB0aGUgYXNz
dW1wdGlvbiB0aGF0IGEgY29uZmlndXJlCj4gY2FsbCBzaG91bGQgbm90IGZhaWwganVzdCBiZWNh
dXNlIHRoZSBjb3VudGVyIHdhcyBhbHJlYWR5IHJ1bm5pbmcuIElmCj4geW91IHdvdWxkIHJhdGhl
ciBoYXZlIGV2ZXJ5IHZhbHVlIHByb3BhZ2F0ZWQsIHRoZSBjaGFuZ2UgaXMgdG8gZHJvcAo+IHRo
ZSBzZWNvbmQgaGFsZiBvZiB0aGUgY29uZGl0aW9uLgo+Cj4gVGhlIG90aGVyIGlzIHBhcnRpYWwg
c3VjY2Vzcy4gQnkgdGhlIHRpbWUgdGhpcyBjYWxsIHNpdGUgcnVucywKPiBwaHMtPmFjdGl2ZV9l
dmVudHNbY3RyX2lkeF0gaGFzIGFscmVhZHkgYmVlbiB3cml0dGVuLCBzbyByZXR1cm5pbmcgYW4K
PiBlcnJvciBsZWF2ZXMgdGhlIGNvdW50ZXIgY29uZmlndXJlZCB3aGlsZSByZXBvcnRpbmcgYSBm
YWlsZWQgY29uZmlndXJlCj4gdG8gdGhlIHN1cGVydmlzb3IuIEkgZGlkIG5vdCBhZGQgYSByb2xs
YmFjayBiZWNhdXNlIHRoYXQgZ29lcyBiZXlvbmQKPiB3aGF0IHlvdSBhc2tlZCBmb3IsIGJ1dCBJ
IGNhbiBzZW5kIHRoYXQgaW5zdGVhZCBpZiB5b3Ugd291bGQgcmF0aGVyCj4gdGhlIGNhbGwgYmUg
YWxsLW9yLW5vdGhpbmcuCj4KPiAgbGliL3NiaS9zYmlfcG11LmMgfCA3ICsrKysrLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9saWIvc2JpL3NiaV9wbXUuYyBiL2xpYi9zYmkvc2JpX3BtdS5jCj4gaW5kZXggNjUzYjhm
NjkuLjYyZDVlMjA2IDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX3BtdS5jCj4gKysrIGIvbGli
L3NiaS9zYmlfcG11LmMKPiBAQCAtOTgyLDggKzk4MiwxMSBAQCBza2lwX21hdGNoOgo+ICAgICAg
ICAgICAgIGV2ZW50X3R5cGUgPT0gU0JJX1BNVV9FVkVOVF9UWVBFX0hXX1JBV19WMikgewo+ICAg
ICAgICAgICAgICAgICBpZiAoZmxhZ3MgJiBTQklfUE1VX0NGR19GTEFHX0NMRUFSX1ZBTFVFKQo+
ICAgICAgICAgICAgICAgICAgICAgICAgIHBtdV9jdHJfd3JpdGVfaHcoY3RyX2lkeCwgMCk7Cj4g
LSAgICAgICAgICAgICAgIGlmIChmbGFncyAmIFNCSV9QTVVfQ0ZHX0ZMQUdfQVVUT19TVEFSVCkK
PiAtICAgICAgICAgICAgICAgICAgICAgICBwbXVfY3RyX3N0YXJ0X2h3KGN0cl9pZHgsIDAsIGZh
bHNlKTsKPiArICAgICAgICAgICAgICAgaWYgKGZsYWdzICYgU0JJX1BNVV9DRkdfRkxBR19BVVRP
X1NUQVJUKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gcG11X2N0cl9zdGFydF9o
dyhjdHJfaWR4LCAwLCBmYWxzZSk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKHJldCAm
JiByZXQgIT0gU0JJX0VBTFJFQURZX1NUQVJURUQpCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICByZXR1cm4gcmV0Owo+ICsgICAgICAgICAgICAgICB9Cj4gICAgICAgICB9IGVsc2Ug
aWYgKGV2ZW50X3R5cGUgPT0gU0JJX1BNVV9FVkVOVF9UWVBFX0ZXKSB7Cj4gICAgICAgICAgICAg
ICAgIGlmIChmbGFncyAmIFNCSV9QTVVfQ0ZHX0ZMQUdfQ0xFQVJfVkFMVUUpCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgcGhzLT5md19jb3VudGVyc19kYXRhW2N0cl9pZHggLSBudW1faHdfY3Ry
c10gPSAwOwo+IC0tCj4gMi40My4wCj4KPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBv
cGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2Jp
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9vcGVuc2JpCg==
