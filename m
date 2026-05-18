Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46979CD4F52
	for <opensbi@archiver.kernel.org>; Mon, 18 May 2026 08:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1eI7yG3RDhSDpBEyxqXAljJgNHqxauu6AXqMWwExjII=; b=nM+NJJUPf4Q//r
	n6mIsa6b8SViofSlOB2TYtR9dtLG+pbXQ+7S2NelT7NeQaM0jx/ov2OKAK6ZXA7+5//zl0NEIkjDO
	nZGASTC6GAYvZByacaH4hQs23UZqMBx4v3+yj4sNHYbpbIg8CHc5AWBZQl+FPjnxnR2viYuMgo3Or
	F5ys0J/9106EpkALHmL3RdHay2eqn5kgquPv3B1OdwvQ/fwG7dOiS0P/PCb0tY/tGCoHqF8MTmxbQ
	NuA2mRLb9RrX9om+53W80skZOGuNeYyrGB0Or7UlvP5VXU/ZVdPRyaBfQqJI0t9GELTK6gpZj46la
	W3JFIua1S4YCWbyQqriQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtQX-0000000EpJN-2UCR;
	Mon, 18 May 2026 08:34:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtQW-0000000EpIj-0phK
	for opensbi@bombadil.infradead.org;
	Mon, 18 May 2026 08:34:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5Ftxi/+VPcG7tI86gHVom1gi9uqiAGHQKRiTDuwI1VQ=; b=gVEZV54XJqcDTV2bLik4KzrmbY
	7o2aL0VJNWHKwouAMpd679t6bj/wFO0A7UvZUcPY5Kn4ylYhpq+dIdlCs582/HfYMrUks/0FSJNhn
	XD39oUgS61KSypKd2+O75awmlk9kBtVJbfqn+5cc2NKcbmexW43LJ/7xUfCwZkRylRF8YA9SaOCHp
	3hwTrlrp9PMltL2JbCt9TmebpqvYBJxBsz3aciJRUsAjZ3saZZ+bisDyA5JhnRLoJWeZI266qwNjf
	Y4joXezKIt2OHvwUlSNbvMtKc4TEDEAza47BMtlFB0CY6gZeGo9V8wZenWfFVEkr45GoOVgMEZ09t
	5LTHJ6YQ==;
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtQT-0000000AOhh-01NO
	for opensbi@lists.infradead.org;
	Mon, 18 May 2026 08:34:15 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-69b8bac50dcso315969eaf.3
        for <opensbi@lists.infradead.org>; Mon, 18 May 2026 01:34:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779093251; cv=none;
        d=google.com; s=arc-20240605;
        b=jFsgeHtYcRgbrk6/3tL8Ik/cwstHDtEtxTjTS5zS8CeAMTnu77aLennsEfiCBZR4MK
         ad9C75glLw94uaucy1laYypPke35LXPq2qCdHUKLqYhyq63Dvbq4Bwx7oIAF3ozFyWeu
         YAcm5icbHOqZ+oF3VIwbUH4US3LTxFdyVOswrIlr9YnR0vYJ/CLQPFJYRpYpvcN0s87w
         S7IWZRNNqW4BI0Upwqjgfu+9r0WbT8JcFymYidqGEsGjd6lDcDt3sAJu09tXPbuogv4j
         5pYDErBamZCOb2RRa9tm0pP7/RGHx5RXuFQELMTXavTH6WEBLefMO/lBM01hiJ7LsVkc
         yWQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5Ftxi/+VPcG7tI86gHVom1gi9uqiAGHQKRiTDuwI1VQ=;
        fh=2JQ3/J+FDYDWDunFfKOoNZu9nfJ9Bo6d2O1w9EWyfq4=;
        b=eeejvKssD5X4/sNnEnrXd6QYy184iU+0ctaZpyI2+my3giA32MHQ3VLF3Ep3aP5OVw
         eVLyz/CpjflxFSs7dv1ADa3WOb66+Y9sRhbo0czrh+rePf4TnXReu5DHItEYsOKiYKFj
         xLOHnBUJ0emkN5yDuVQQZZAh+EWwTlPAIkcTYmLm2V/12/EUHT5n54eN5j+eqYBSItrF
         rPB9KZgmYwMHIcqxTJFYJemfeA3CQfbZmS/gOeiYFWJovtH5JiNaXmB7VtuDajHbgbk3
         PptTN0xCnPnRZNcSOR6PB4rIuYyoaSK9mVh6i3Hc9cisAzPm3qqRbejKmCGMl/yWhH86
         fwkQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1779093251; x=1779698051; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Ftxi/+VPcG7tI86gHVom1gi9uqiAGHQKRiTDuwI1VQ=;
        b=c8v1Krk49TNRtvz+/63LRYluuAWGjwwF4EFUL+ZbncbzdJGsqZ3s3Z4y4oytfuRx1g
         uNyHZwALCYWgAda7yv/bMxLOdkisCYugp2MwzVH5Jy9zyoxFdVU1lEbunjw+yn7fdtkX
         IYpGFl0TfB/pCinFiFDEo6K2WzFdeBsDhtGaTHgmA/HKkDqvH9n5ckpp0KKtC4aZUCc5
         XYjx1blOt+rhJ9Ge6kr2xdC/VAAMvAVH4H3EZi+Rpf6XDLnNK+1i7gdGHogv88O0s10C
         N3JJj4UHbgZkWyBfH3Ogg1PIeJXfCo0Vt+YFwXvZM//U3bn+SOBhRhu9XY+NeRaVweb3
         cIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779093251; x=1779698051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Ftxi/+VPcG7tI86gHVom1gi9uqiAGHQKRiTDuwI1VQ=;
        b=i0DsIKEUsWaUUFp/hkiubElZeHxlZ2R5vZt98EiVOqD5/bn0BNPn5r6X8jPcm18cMc
         DQ+7cZi61RgYFdcz78nH/6lBNBqSEmeKEAs8dIfR1K1E+ZRx85jE0OmEY+mHvxhHLoNy
         t1YwUVgMM5f9iHeqq4H4+CFsVnSrdKAsjl//ASi7DBibt4LWwmxPMSCVNVI+z5m8rMtD
         LRDye2AQGc/8iT1zFPCuXBdbxRxtSys57KtzNn5688MrDTl6Bh3VQyzeIarQnNZ3gB4e
         VNWV7NW+sRiCnyLGAKHNdI0FyC+j90MkacxqC/OodjvblTE/LtJCrhrySf+eghCrHUdK
         jOsg==
X-Forwarded-Encrypted: i=1; AFNElJ+6WaeH0uNgcv5xVFCC8TFmlrAEIits08N9thSe775uIYjZtm4CiPUdSbtMerI1hSV8BYXRkDGi@lists.infradead.org
X-Gm-Message-State: AOJu0YytxzjpsAG5IlwqowUu5zr3tMY1dMqvjOpMPhdzEG0CNMawZCZP
	6OgfAGab64Bxwn8TxdIpiHHRLmKHAAWadWgvdkCj3KGKBgseo5uGElAfRjIBwqEvcD+G+WZk74X
	6WCZaxyQyEBWvZl+Xhgy8NEZH9mDFBxhMK0GmLyaX9A==
X-Gm-Gg: Acq92OHVMllVxDf58cscUCSyVJmv739CZm2Kz30znu39m2hEMS7QdDAFya0AiX061ZO
	DZ2+5VxD+g58CnuZCh0D6GjKTiWL/XMwZ9hkV6QKVQgF6Z8qYQKMzsVxk57LY/8ESmUpR8bozAH
	wOvvmFYDYDpCJPvDMvTVBDh7b4Qw2U0DepPHyar8yz4Pqs9ywiv1yRdwXmbRiVtwL9rwnDwyHXm
	pCB5rGAxi/BdckqyFViCMuY9YYPtv3JoDfNh8bKGOQZInca16gE2KM9IJYKuB64Z4jcwtJwZiag
	g4IU9zevhVZmGypsZQrLelRON2DgTJRYtggXSGaVPuS45JklwGTrMnCpW9J2rxP2w5rVNL/KsZL
	8fQwRrqhHzaRVQF5LSMq713TcHQ==
X-Received: by 2002:a05:6820:982:b0:696:7697:6472 with SMTP id
 006d021491bc7-69c942a5707mr8665529eaf.5.1779093251247; Mon, 18 May 2026
 01:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260518083023.997323-1-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260518083023.997323-1-anup.patel@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 18 May 2026 14:03:59 +0530
X-Gm-Features: AVHnY4LCWu68byO-vmZU3AVuf6PlVNm08SuZvMQDreLio1sruFMm8vA4wEUX3qQ
Message-ID: <CAAhSdy2d8cO-Ny_9BCoYeVvscBW8DjinZ1P-yOVtNUxVMEeU5A@mail.gmail.com>
Subject: Re: [PATCH v8 0/3] Add eager FP and Vector context switching support
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Raymond Mao <raymond.mao@riscstar.com>, Dave Patel <dave.patel@riscstar.com>, 
	Evgeny Voevodin <evvoevod@tenstorrent.com>, Samuel Holland <samuel.holland@sifive.com>, 
	opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_093413_516892_05DE68C7 
X-CRM114-Status: GOOD (  18.94  )
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

T24gTW9uLCBNYXkgMTgsIDIwMjYgYXQgMjowMOKAr1BNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBEYXZlIFBhdGVsIDxkYXZlLnBhdGVs
QHJpc2NzdGFyLmNvbT4KPgo+IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgcHJvcGVyIHN1cHBvcnQg
Zm9yIHBlci1kb21haW4gZmxvYXRpbmctcG9pbnQgKEZQKSBhbmQKPiB2ZWN0b3IgKFYpIGNvbnRl
eHRzIGluIHRoZSBkb21haW4gY29udGV4dCBzd2l0Y2ggbG9naWMuIEVhY2ggZG9tYWluCj4gbm93
IG1haW50YWlucyBpdHMgb3duIEZQIGFuZCB2ZWN0b3Igc3RhdGUsIHdoaWNoIGlzIHNhdmVkIGFu
ZCByZXN0b3JlZAo+IGR1cmluZyBkb21haW4gc3dpdGNoZXMuCj4KPiBDb25kaXRpb25hbGl6ZSBG
UCBhbmQgVmVjdG9yIHNhdmUvcmVzdG9yZSBiYXNlZCBvbiBleHRlbnNpb25zLCB1bmNvbmRpdGlv
bmFsCj4gc2F2ZSBhbmQgcmVzdG9yZSBvZiBmbG9hdGluZy1wb2ludCAoRlApIGFuZCBWZWN0b3Ig
cmVnaXN0ZXJzIGZhaWxzIG9uCj4gZ2VuZXJpYyBwbGF0Zm9ybSBmaXJtd2FyZS4gVGhpcyBmaXJt
d2FyZSBtdXN0IHJ1biBvbiBtdWx0aXBsZSBwbGF0Zm9ybXMKPiB0aGF0IG1heSBsYWNrIHRoZXNl
IGV4dGVuc2lvbnMuCj4KPiBBZGRyZXNzIHRoaXMgYnkgY29uZGl0aW9uYWxseSBleGVjdXRpbmcg
RlAgc2F2ZS9yZXN0b3JlIG9ubHkgaWYgdGhlIHVuZGVybHlpbmcKPiBoYXJ0IHN1cHBvcnRzIHRo
ZSBGIG9yIEQgZXh0ZW5zaW9ucy4gU2ltaWxhcmx5LCBwZXJmb3JtIFZlY3RvciBzYXZlL3Jlc3Rv
cmUKPiBvbmx5IGlmIHRoZSBoYXJ0IHN1cHBvcnRzIHRoZSBWZWN0b3IgZXh0ZW5zaW9uLgo+Cj4g
Q2hhbmdlcyBzaW5jZSB2NzoKPiAtIFJlYmFzZWQgb24gbGF0ZXN0IE9wZW5TQkkgbWFzdGVyCj4g
LSBBZGRyZXNzZWQgYWxsIG15IGNvbW1lbnRzIG9uIHY3IHNlcmllcwo+Cj4gQ2hhbmdlcyBpbmNs
dWRlOgo+Cj4gLSBBZGQgVmVjdG9yIHNhdmUgYW5kIHJlc3RvcmUgZnVuY3Rpb25hbGl0eQo+IC0g
QWRkIEZsb2F0aW5nIFBvaW50IHNhdmUgYW5kIHJlc3RvcmUgZnVuY3Rpb2FubGl0eQo+IC0gQWRk
ZWQgYGZwX2N0eGAgYW5kIGB2ZWNfY3R4YCBtZW1iZXJzIHRvIGBzdHJ1Y3QgaGFydF9jb250ZXh0
YC4KPiAtIEludHJvZHVjZWQgZHluYW1pYyB2ZWN0b3Igc3RydWN0IGFsbG9jYXRpb24gZm9yIHZs
ZW5iIGluICdzdHJ1Y3QgaGFydF9jb250ZXh0Jwo+ICAgdG8gYWxsb2NhdGUgYW5kIGZyZWUgcGVy
LWRvbWFpbiBGUCBhbmQgdmVjdG9yIGNvbnRleHQuCj4gLSBNb2RpZmllZCBgc2JpX2RvbWFpbl9y
ZWdpc3RlcigpYCB0byBpbml0aWFsaXplIEZQL1ZlY3RvciBjb250ZXh0IHBlciBkb21haW4uCj4g
LSBVcGRhdGVkIGBzd2l0Y2hfdG9fbmV4dF9kb21haW5fY29udGV4dCgpYCB0byBzYXZlL3Jlc3Rv
cmUgRlAgYW5kIHZlY3Rvcgo+ICAgY29udGV4dHMgc2FmZWx5Ogo+ICAgICAtIEVuc3VyZXMgRlMv
VlMgZmllbGRzIGluIGBtc3RhdHVzYCBhcmUgZW5hYmxlZCAoc2V0IHRvIEluaXRpYWwpIG9ubHkg
aWYgT2ZmLgo+IC0gQWRkZWQgcnVudGltZSBjaGVja3MgZm9yIEZQIGFuZCB2ZWN0b3IgZXh0ZW5z
aW9ucyB3aGVyZSBuZWVkZWQuCj4gLSBBZGRlZCBTQklfSEFSVF9FWFRfRiwgU0JJX0hBUlRfRVhU
X0QsIFNCSV9IQVJUX0VYVF9WIHRvIGVudW0KPiAgIHNiaV9oYXJ0X2V4dGVuc2lvbnMgYW5kIHRo
ZSBzYmlfaGFydF9leHRbXSBhcnJheS4gVXNlIHNiaV9oYXJ0X2hhc19leHRlbnNpb24oKQo+ICAg
dG8gY2hlY2sgZm9yIHRoZXNlIGNhcGFiaWxpdGllcyBiZWZvcmUgcGVyZm9ybWluZyB0aGUgY29u
dGV4dCBzd2l0Y2hlcwo+Cj4gVGhpcyBpbXByb3ZlcyBzdXBwb3J0IGZvciBtdWx0aS1kb21haW4g
c3lzdGVtcyB3aXRoIEZQIGFuZCBWZWN0b3IKPiBleHRlbnNpb25zLCBhbmQgcHJldmVudHMgY29y
cnVwdGlvbiBvZiBGUC9WZWN0b3Igc3RhdGUgZHVyaW5nIGRvbWFpbgo+IHN3aXRjaGVzLgo+Cj4g
RGF2ZSBQYXRlbCAoMyk6Cj4gICBsaWI6IHNiaTogQWRkIFJJU0MtViB2ZWN0b3IgY29udGV4dCBz
YXZlL3Jlc3RvcmUgc3VwcG9ydAo+ICAgbGliOiBzYmk6IEFkZCBmbG9hdGluZy1wb2ludCBjb250
ZXh0IHNhdmUvcmVzdG9yZSBzdXBwb3J0Lgo+ICAgbGliOiBzYmk6IGRvbWFpbiBGUC9WZWN0b3Ig
Y29udGV4dCBzdXBwb3J0IGZvciBjb250ZXh0IHN3aXRjaAo+Cj4gIGluY2x1ZGUvc2JpL3NiaV9m
cC5oICAgICAgICAgfCAgMzUgKysrKysrKwo+ICBpbmNsdWRlL3NiaS9zYmlfaGFydC5oICAgICAg
IHwgICA2ICsrCj4gIGluY2x1ZGUvc2JpL3NiaV92ZWN0b3IuaCAgICAgfCAgNDAgKysrKysrKysK
PiAgbGliL3NiaS9vYmplY3RzLm1rICAgICAgICAgICB8ICAgMiArCj4gIGxpYi9zYmkvc2JpX2Rv
bWFpbl9jb250ZXh0LmMgfCAgMzMgKysrKysrCj4gIGxpYi9zYmkvc2JpX2ZwLmMgICAgICAgICAg
ICAgfCAxOTIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgbGliL3NiaS9z
YmlfaGFydC5jICAgICAgICAgICB8ICAgMyArCj4gIGxpYi9zYmkvc2JpX3ZlY3Rvci5jICAgICAg
ICAgfCAgOTQgKysrKysrKysrKysrKysrKysKPiAgOCBmaWxlcyBjaGFuZ2VkLCA0MDUgaW5zZXJ0
aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9zYmkvc2JpX2ZwLmgKPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvc2JpL3NiaV92ZWN0b3IuaAo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgbGliL3NiaS9zYmlfZnAuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3NiaS9zYmlf
dmVjdG9yLmMKPgo+IC0tCj4gMi40My4wCj4KCkFwcGxpZWQgdGhpcyBzZXJpZXMgdG8gdGhlIHJp
c2N2L29wZW5zYmkgcmVwby4KClJlZ2FyZHMsCkFudXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlz
dApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
