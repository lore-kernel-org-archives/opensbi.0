Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A32606A31A
	for <opensbi@archiver.kernel.org>; Sun, 25 Oct 2026 09:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bgZkSP4q;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=iTU8AtCh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r0YumSBROjSfKuRxww3+7XdP5Mmzr3Uw3qAK9IAELb8=; b=bgZkSP4qqF+TH12YsRKnX6d9vo
	Svi2qXBDZXCuqSHkoE+01WPTG8syMMCHBF7emR49JEilUGZcvMcp75TjtnMGAcngH4h9nDuHHqfHD
	XeiYRptLq92uYeCOSKwESfCTEV1E8sEJT5R7cfJZLZUsGGXfqWy0iLJLKcCqY+2xkNXiTwiZjNZ4D
	x4PeNmFDa/0Q1Eqj8KBueVkLUU43bb7HXC6Mn9c39CjB5ZOEwiikNtSBQkE2SttLOfb6t5sy/OoQ6
	i6Sh94j9kRBQ5aJhZl5VW2W3olpOpysaMPQOIZ4iqQpgJeHWTP9jrSxLXZdb88Cujkfy2F0hb9mBw
	STP0C/Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKuBq-00000000uuG-24Hc;
	Sun, 25 Oct 2026 09:06:54 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKuBm-00000000utr-2exK
	for opensbi@lists.infradead.org;
	Sun, 25 Oct 2026 09:06:52 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48dee593f18so1582325f8f.3
        for <opensbi@lists.infradead.org>; Sun, 25 Oct 2026 02:06:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792919208; cv=none;
        d=google.com; s=arc-20260327;
        b=ZbDZKXWhfUMSR01ZyZOpD34dPCtPxkbZ8rzIHtxiqC6b/Ye9GCME9GDNSlpniSxALQ
         cDHqAmBL8J11Wwevl1u1i//WANol87iuRpi9TupxEpTxemAA+7fwE0wFEf4XE8tZm+Jy
         cbre3PPyuljLMAYdLooLaPko3ZiWoNeRvj1nYZAIfUriZFFP4nT07Or2sdHn9xr5mdGy
         95ciYb/SXigcgavE5QDunjseh4pXtI+QJDnHIEY6Zm8n3/6e5yrn6ESZKNZlGn0FMdi7
         FPSW80Sf9VyRGNmBhGtPJEKBxUoxEphNXigokmCsPH+AYUGrZzvREjsSgpeDKTwOuk+a
         tOCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N7gGHAzRTTwC2sE4xTA6z4S/nyqA+E9ngjbibV8JlEc=;
        fh=jxy/KMam5P3YUur2Qb/qz5mA2dkp4WBv/Dod9sh/4tQ=;
        b=LJj/ls9AWN2r1azc45Vu3Xrg6Mmn3n8AzJM8JB/E+GJUXpCJbupXmNrM8MaJK+WeOr
         2DhWUVqsycHUPtjjokLJ1RwELuR2bZ02aOrDR8K9n8lEnnmIgHOKImtGdRrlTD2L8F5Q
         ZBWcNyV6Je3Sf6G8KtA1zy9TLSTv9d6gqN1CeCr2aXAAag7fv7XRBbzzMZBaPml/xzYp
         BL1uJav/XDDg04amej8lr2alEjAjs8Ft69mfm5a+DJ3R0Vvk+rgTXNYZDW+Lb5KGSU8V
         4RWYHbSJdiA06a5/LfaLgaXWCWsWTDzZfgkGoU62NPZ5roBCopJ8KzpeetQUEqGgQlxa
         Rjkg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792919208; x=1793524008; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N7gGHAzRTTwC2sE4xTA6z4S/nyqA+E9ngjbibV8JlEc=;
        b=iTU8AtChQIF01rfl/juTR4pRNG0KMMZo5Tzvk4UuuPxAcsJ0amszuNiFoStZfpzIDb
         NYQEaBjECzd2RB75W64u8H1k4IgUZOw4ttCdIKGC2kGXPgkSk4uYabUJlO8OJgK6PXSR
         ujOp6kVU/oNcMTWtFg2Jr4K19MeKHjYJa65we6WoPWZxkSHgFrI+srcaMaFqVwUHpD5u
         VbnWWzXCPXKKY+E47zrvV0pOaZpo1qU6oM0X4Of/4KZlvSE2dYhFeJSsMHtIQ8BgkSrt
         1mumNHr4yDR7cpUJ3fF8mvKd7I11AdBpL1d57oTopKJR8om3iQEbBqPVT1IjkAvmWphU
         Llkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792919208; x=1793524008;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N7gGHAzRTTwC2sE4xTA6z4S/nyqA+E9ngjbibV8JlEc=;
        b=bVi7R1OpjaKgzoXHeHS+5McRdgcFcddAvCt2nkZjwsmqXw5xPevKqR+o5EMcMTpf9p
         tKqV65c5wHDBGG3vX28lR61GkHPPb0jFVu/D1igi2Tf1QJSKxUV3sd8yO/wsasV52rD6
         zn8Imkc4UbA/pAp6xazxIKK6UX88m8So40tFBT6gM+NnycuciDOHvecLcz5vS5AYN85G
         Mr5lqXDKs6DCjdocQDcbkHtrLiEsND1Ofv1YF8M9RAgBnoxVB2nphWn+o4tYbf+YXViE
         +DCmwchYFEp2+3B73+Tn7GOQLNf+m9acAXmiH1YHXDEY1FlnQT7zDmcm5u+T93Oc9QB9
         kGTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAem03Xuhy+w8b3aad2kXGt4c2WnDJEFjHu3iR6g6RRxYrcFc35Nvja5LCu6b5csZ44tIbfDC1@lists.infradead.org
X-Gm-Message-State: AFq9FYIwDOcv9a7n8D9XQ7QFiL1vIVPabkhwXSaiVg7i8fIA66Pl7zU9
	AcwlMyjES6+4dYfW4TUudzq7uE0bMyHMMpYN01dcj5SYV7t6dN0qxpwtHeSbnNu7oR9oI+Y03Ff
	Xoc5rrHa0Xtpd72+EuzyqvP5K+sBNC7t3mBbAbRA9bz8AZUUI1Olry0g=
X-Gm-Gg: AYBFou30b1B/6KQuJ0B0218051urpKwuZfE+XSg4MRyp1uxBIk7cKh07P7SQwT7JNCu
	1quGgejQ7L+zLDGAXw7t4vgkrBPweKStZqG/f+KEBwsv8wd1PpUXVEBngpxfq90Wr+/KLRqIvY6
	qVUpvu6LYqo9XPPW9GUiXJvgDAgmrr9GTustZXmpEPXqY93M7mvqwNM6d9IVxXz3iwNcW64QHiG
	WuPOBW2Is8KrQVZtvABdUhDMS8ljsv0hisuntYCo7cYZZsrJKLsV6oxKPJiMGtTcvLX9iKR6gk4
	xnIucUvcwFCkmUQx7ds+fOGWR1ubxbR1BlXjcLTyvO6mXWIsJwALDgAZUbzlT/2ljn17quLZ7+E
	KZl42h+VyPrT0aRfQfk1pMBc8S71r5+IgMGtbwUviRjed+5gLPaE98F10McCEhVe2ifpRY8mhu5
	H1FOBUtI7ygWQIUmtalDOsf1AFn6K2xcjEDHJ1/lgCqqcj8czYIAxhdyUS
X-Received: by 2002:a05:6000:1862:b0:48e:4316:411a with SMTP id
 ffacd0b85a97d-48e43164158mr5833944f8f.49.1792919208517; Sun, 25 Oct 2026
 02:06:48 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 25 Oct 2026 14:36:36 +0530
X-Gm-Features: AclHuK81M3v4zp_tobsCKEqpC9b46zGf8GpWfnq8yzzTfa3OSlOUnWiB8YfjnqU
Message-ID: <CAAhSdy0uAf9G2DLqYomO7SECpBQ9fazGHcN2++fOSxowPYSdvg@mail.gmail.com>
Subject: Re: [PATCH 00/11] Improve the common MPXY RPMI driver
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Samuel Holland <samuel.holland@sifive.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_020650_731873_B09CFE66 
X-CRM114-Status: GOOD (  13.85  )
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBTZXAgMjMsIDIwMjYgYXQgODo1NOKAr0FNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBDdXJyZW50bHksIHRoZSBjb21tb250IE1QWFkg
UlBNSSBkcml2ZXIgaXMgb25seSBmb2N1c2VkIG9uIGVtdWxhdGluZwo+IE1QWFkgY2hhbm5lbCBv
bi10b3Atb2YgaGFyZHdhcmUgUlBNSSBzZXJ2aWNlIGdyb3VwIGNoYW5uZWwuIEluIHJlYWwKPiB3
b3JsZCwgd2Ugd2lsbCBhbHNvIGhhdmUgTVBYWSBSUE1JIGNoYW5uZWxzIGJldHdlZW4gZG9tYWlu
cyBhcyB3ZWxsCj4gYXMgcHVyZSBzb2Z0d2FyZSBlbXVsYXRlZCBNUFhZIFJQTUkgY2hhbm5lbHMu
IFRvIGFkZHJlc3MgdGhpcywgaW1wcm92ZQo+IHRoZSBjb21tb24gTVBYWSBSUE1JIGRyaXZlciB0
byBzdXBwb3J0IGludGVyLWRvbWFpbiBhbmQgc29mdHdhcmUKPiBlbXVsYXRlZCBjaGFubmVscy4K
Pgo+IFRoZXNlIHBhdGNoZXMgY2FuIGFsc28gYmUgZm91bmQgaW4gbXB4eV9ycG1pX2ltcF92MSBi
cmFuY2ggYXQ6Cj4gaHR0cHM6Ly9naXRodWIuY29tL2F2cGF0ZWwvb3BlbnNiaS5naXQKPgo+IEFu
dXAgUGF0ZWwgKDEwKToKPiAgIGxpYjogdXRpbHMvbXB4eTogUmVuYW1lIGZkdF9tcHh5X3JwbWlf
bWJveCB0byBmZHRfbXB4eV9ycG1pCj4gICBsaWI6IHV0aWxzL21weHk6IFNldHVwIGdyb3VwIGVh
cmx5IGluIGZkdF9tcHh5X3JwbWlfaW5pdCgpCj4gICBsaWI6IHV0aWxzL21weHk6IEludHJvZHVj
ZSBnZXRfYXR0cmlidXRlX2dyb3VwKCkgZm9yIE1QWFkgUlBNSSBkYXRhCj4gICBsaWI6IHNiaV9k
b21haW46IEludHJvZHVjZSBzYmlfZG9tYWluX2ZpbmRfYnlfbmFtZSgpIGZ1bmN0aW9uCj4gICBs
aWI6IHV0aWxzL21weHk6IEludHJvZHVjZSBtcHh5X3JwbWlfbm9fbWJveF9pbml0KCkgZnVuY3Rp
b24KPiAgIGxpYjogdXRpbHMvbXB4eTogU2ltcGxpZnkgZmR0X21weHlfcnBtaS5oIGJ5IG1vdmlu
ZyB0aGluZ3MgdG8KPiAgICAgZmR0X21weHlfcnBtaS5jCj4gICBsaWI6IHNiaV9kb21haW46IE1h
a2UgZG9tYWluIHJlZ2lvbnMgYXMgZml4ZWQgYXJyYXkKPiAgIGxpYjogc2JpX2RvbWFpbjogQWxs
b3cgYWRkaW5nIG1lbXJhbmdlIHRvIGEgcGFydGljdWxhciBkb21haW4gZnJvbQo+ICAgICBkcml2
ZXJzCj4gICBsaWI6IHV0aWxzL21weHk6IEFkZCBkb21haW4gcGFyYW1ldGVyIHRvIHNldHVwX2dy
b3VwKCkgY2FsbGJhY2sKPiAgIGxpYjogdXRpbHMvbXB4eTogVXNlIGRvbWFpbiBub3RpZmllciBm
b3IgZGVmZXJyZWQgY3JlYXRpb24gb2YgTVBYWQo+ICAgICBSUE1JCj4KPiBPemEgUGF3YW5kZWVw
ICgxKToKPiAgIGxpYjogc2JpX2RvbWFpbjogQWRkIGRvbWFpbiBub3RpZmllciBpbmZyYXN0cnVj
dHVyZQo+Cj4gIGluY2x1ZGUvc2JpL3NiaV9kb21haW4uaCAgICAgICAgICAgICAgICAgICAgfCAg
NzMgKystCj4gIGluY2x1ZGUvc2JpX3V0aWxzL21weHkvZmR0X21weHlfcnBtaS5oICAgICAgfCAg
NTggKysrCj4gIGluY2x1ZGUvc2JpX3V0aWxzL21weHkvZmR0X21weHlfcnBtaV9tYm94LmggfCAg
ODUgLS0tCj4gIGxpYi9zYmkvc2JpX2RvbWFpbi5jICAgICAgICAgICAgICAgICAgICAgICAgfCAx
NzIgKysrKystLQo+ICBsaWIvdXRpbHMvZmR0L2ZkdF9kb21haW4uYyAgICAgICAgICAgICAgICAg
IHwgIDE3ICstCj4gIGxpYi91dGlscy9tcHh5L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAg
fCAgIDYgKy0KPiAgbGliL3V0aWxzL21weHkvZmR0X21weHlfcnBtaS5jICAgICAgICAgICAgICB8
IDU0MCArKysrKysrKysrKysrKysrKysrKwo+ICBsaWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1p
X2Nsb2NrLmMgICAgICAgIHwgICA3ICstCj4gIGxpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWlf
ZGV2aWNlX3Bvd2VyLmMgfCAgIDcgKy0KPiAgbGliL3V0aWxzL21weHkvZmR0X21weHlfcnBtaV9s
b2dnaW5nLmMgICAgICB8ICAgNyArLQo+ICBsaWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX21i
b3guYyAgICAgICAgIHwgMzYyIC0tLS0tLS0tLS0tLS0KPiAgbGliL3V0aWxzL21weHkvZmR0X21w
eHlfcnBtaV9tbS5jICAgICAgICAgICB8ICAxNSArLQo+ICBsaWIvdXRpbHMvbXB4eS9mZHRfbXB4
eV9ycG1pX3BlcmZvcm1hbmNlLmMgIHwgICA3ICstCj4gIGxpYi91dGlscy9tcHh5L2ZkdF9tcHh5
X3JwbWlfc3lzbXNpLmMgICAgICAgfCAgMTAgKy0KPiAgbGliL3V0aWxzL21weHkvZmR0X21weHlf
cnBtaV92b2x0YWdlLmMgICAgICB8ICAgNyArLQo+ICBsaWIvdXRpbHMvbXB4eS9vYmplY3RzLm1r
ICAgICAgICAgICAgICAgICAgIHwgICAyICstCj4gIHBsYXRmb3JtL2dlbmVyaWMvY29uZmlncy9k
ZWZjb25maWcgICAgICAgICAgfCAgIDIgKy0KPiAgcGxhdGZvcm0vZ2VuZXJpYy9taXBzL2V5ZXE3
aC5jICAgICAgICAgICAgICB8ICAgNiArLQo+ICAxOCBmaWxlcyBjaGFuZ2VkLCA4MzggaW5zZXJ0
aW9ucygrKSwgNTQ1IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9z
YmlfdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pLmgKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGluY2x1
ZGUvc2JpX3V0aWxzL21weHkvZmR0X21weHlfcnBtaV9tYm94LmgKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGxpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWkuYwo+ICBkZWxldGUgbW9kZSAxMDA2NDQg
bGliL3V0aWxzL21weHkvZmR0X21weHlfcnBtaV9tYm94LmMKPgo+IC0tCj4gMi40My4wCj4KCkFw
cGxpZWQgdGhpcyBzZXJpZXMgdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51
cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
