Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A77606A326
	for <opensbi@archiver.kernel.org>; Sun, 25 Oct 2026 05:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fQi7NimU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=S9V3UsS8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0TE9rfT8anve9p5KncXncJK+HaztMMSmiYErjQYmgNU=; b=fQi7NimURnTKGyrIUEMJ2S+xBL
	DZsbK2IociI00a8FVeldCbyCB/bdYY4K0M/+nJ+nZgn8HNyavt4vErnwgkAEH00EwYCxQ9sWW3suL
	jw50yi7uk2K4x3A3bnPfVLnBCo4SpUyobrjhMeQUlV18J0WgkExbI76QKqG29fp8YoutJ7qAdET89
	sVwtOeqOjiyGatbIBJH9aiqSg+7wVoKJ8SSkMyoNqLTJwPqVq1vU3PGUbKZJ/OUgPp5lkLQOIXhWB
	nlvLlX7DNrcPJ+L9A0AjjWT9BuSAcO8+4hvrnNwZ+vQh7J203j7cWl1MncVg31sBxmW0uTzbvjDVB
	tvOuhRTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKr7N-00000000m7M-3JA7;
	Sun, 25 Oct 2026 05:50:05 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKr7K-00000000m6h-1V9W
	for opensbi@lists.infradead.org;
	Sun, 25 Oct 2026 05:50:03 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so414745e9.2
        for <opensbi@lists.infradead.org>; Sat, 24 Oct 2026 22:50:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792907400; cv=none;
        d=google.com; s=arc-20260327;
        b=pm/acG4Z3BxDSmHh8IZRXLr+twOl8h2xH6cQzWj1vQ2jKmZht2OklVZn3GmCBMxDZ0
         89wodOmx/DCe/qELtXkbCjulyQZn29y6FoKWHg+EKVYriVCbe4V0W4H8i8XiPvM5K0wO
         z0/Lo1eMUEKHnWpedtXnqpKUYbxlIR26yp1jIthOlhf7NJHZwHb0l6kFIuG4amM3bH0g
         rfMfKFyqTtVOpTKJXJKy3UMoMgPbr8Moa+r9S70gL3pg52vvz9EWJKcY1BTbLxRfoAZS
         j1jn4wevQ04oWKZTsfh1t8Kwh6iPqGpunenLgpkldqScXwp2EPD4wDZu0WxzEScZpvsE
         l5Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FSbJPHcqVRDQMDJW1JConBd3nUYzQ+wEdgLg7Og2z1E=;
        fh=vLmPHpNKorPCJmmtuIWyrOzUGDvXXw1YzeRy+MRqT2s=;
        b=LR8gOZC5/G7iw3Tm9Hhd14C/vgsNiT1Ql2LcYm7u5O44VuvkSa59y6grXMsS+vJDLh
         X7wsvVItxSpEqVvFicCmiQ/DMLTr7uJ9qH6vIZ+/KIUTG3KwouRYshJyR5wrY8XqF5y6
         RGMr1fAAoSF9Bfwc1HdJ4lRlWYZYFXYkyjjQMUL9UOA3EDBncdiQJWFe0GKErYuvTXUj
         IbcyX76vNpj5ymLzOXbSJHvKN0I14A0qxCOI6AgU/y1cVJuPr7Qh7reaujsNBfhX4euh
         wsCSkK6+9LgAeMahtYhaBicIT7DmOpy8i2QUqs1Hbb8qUZQ2BtWJ4VPIFApxiSY3NOzN
         FSDw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792907400; x=1793512200; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FSbJPHcqVRDQMDJW1JConBd3nUYzQ+wEdgLg7Og2z1E=;
        b=S9V3UsS8ETM1Cbi7flOZ0WOrmQRcy0jdz55VM9R64mlyR9QpqLpfMJMcsRh4TSItWj
         4iFUg4T5BDYmh9EQeDCHFmosAytzuXjYq2cDg01N02bszwdCM38IONVIfvhFsKBz/w9w
         Rbb6HoogSsaIn8SAj6Dt4lahSqG06Y9ZoerVBXlAm4MV5JpHYlZ7uXL1OCTHSKiKKc4e
         Pi3W4Zo8WY51GPUDpmZrJ23g7QMapWkGUPdA360kTRraOush+5oM7S61mubx39Ro/lWs
         yrpmTiRcXSLAAiXzr4+wHlxmMCZRVVD50wePhG6OzWppx9ZEFt52hmXwZjdyaJBBOZhs
         8hKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792907400; x=1793512200;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FSbJPHcqVRDQMDJW1JConBd3nUYzQ+wEdgLg7Og2z1E=;
        b=DNXig+vgcwV73ogdO+nRAJmI9xgCJz/XEd3xv1ykYGK3ncU6S4uWA5qJbnhxlDlszd
         xSFvE6yriq7nJDEBUN6cpj7T2MzB5qm68CJwHad9WQBTZJKcBb/l0O4uXUTw/pnTaW16
         hCg6qefBle9s5clEJvDF43qtMNDI/FtUTdalsWkQWqQL4rguwN2xxsLZpxa8c+E83cXK
         kd0SpIaO8fBd0CFRy2bLs9lGBSkYvumY07w4gpntmjFcpL6ktSO8tFniIHY26E9AT6UK
         dP7bkJZJXLkvt+KvhwiWkKecrdYyOXywWoPMm6q3rlaT1DHnSZI19nUcrAhw005XMbZS
         FSMA==
X-Gm-Message-State: AFq9FYJ9sIF3SpZqUW4spwwI0n6NxZR9aZK7xzDg4bGXeG4kt6LCqks5
	yuf/plI5SxYiDlDII5IfIsY13cLtC8++9usehBev1y0gXGkghsP9EmZne958hTguvadvL2J1aJJ
	8qLQViGi+hsOxdtmWStCfQdy1d3lOJKpfjHL3svrs9MfFJVoAt/5UXI0=
X-Gm-Gg: AYBFou3gHaDUiZOy4qz3bgPydmBb8R3rMsc2Xz5YcHZhGIjTfDrKDSht0GX509XQeet
	B7xSdcxXxPiDBqxk3v7WCTqzm1//xdNzcs68p6rp9FsEYJ+yTgaCDrr2ZVw9zgN1JgAR5bSc2We
	mWK740I/WrUbPkTpOqBagoljBspEZXK2ydLWr+pXaEdMlATjBsDouCFThvN9v1AKf9eD75vGmQc
	ZPxWUnY+XNWSuOJr/X1YOqwpohwUdtzunvGYv/o5Wa+UuJM5EHcrwu8L+nZXzlF8Np2+IXD35js
	ku3kpH3nbK0O6ViQBQj9fLCgYf2GJSa5un0hqaPORkuRG2hAIFuql0vv+mkimzkj8FvR4ODn7YO
	9HNMtwZQHnC6OgDTmO+3VSV8MencdQXJ12AOqQmv6qDQPYOlvPDke8CwiJybKxqzdpaXKzvBdwA
	9W589bp3cHznzeNol3cyRsEMMCxJmsGKeFqX7qkgwnOOlIjfPswA5EhaD2
X-Received: by 2002:a05:600c:1992:b0:4a3:59c9:a743 with SMTP id
 5b1f17b1804b1-4a35acaaac3mr64699685e9.27.1792907399499; Sat, 24 Oct 2026
 22:49:59 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260827115718.50124-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260827115718.50124-1-pengpeng@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 25 Oct 2026 11:19:47 +0530
X-Gm-Features: AclHuK9BGVUxVyCiLTqFtchhlQsdI5eFzVwZpek169a0nwaggqYeRteeDl5QhKI
Message-ID: <CAAhSdy1T4G=1sSZZRMsMgQ2+Ru4T3shLGgpcUpD9wtJm4VqdyQ@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: reject PMU skip-match counter class mismatches
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: opensbi@lists.infradead.org, Atish Patra <atishp@rivosinc.com>, 
	Anup Patel <anup.patel@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_225002_445407_B8B10209 
X-CRM114-Status: GOOD (  15.42  )
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

T24gVGh1LCBBdWcgMjcsIDIwMjYgYXQgNToyN+KAr1BNIFBlbmdwZW5nIEhvdSA8cGVuZ3BlbmdA
aXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gU0tJUF9NQVRDSCBzZWxlY3RzIHRoZSBmaXJzdCBjb3Vu
dGVyIGluIHRoZSBjYWxsZXItcHJvdmlkZWQgc2V0LCBidXQgdGhlCj4gY3VycmVudCBwYXRoIGNo
ZWNrcyBvbmx5IHRoYXQgdGhlIGluZGV4IGV4aXN0cyBhbmQgaXMgYWN0aXZlLiAgQSBzdXBlcnZp
c29yCj4gY2FuIHNlbGVjdCBhbiBhY3RpdmUgaGFyZHdhcmUgY291bnRlciBmb3IgYSBmaXJtd2Fy
ZSBldmVudC4gIENMRUFSX1ZBTFVFIG9yCj4gQVVUT19TVEFSVCB0aGVuIGluZGV4ZXMgZmlybXdh
cmUtY291bnRlciBzdGF0ZSB3aXRoCj4gY3RyX2lkeCAtIG51bV9od19jdHJzLCB3aGljaCB1bmRl
cmZsb3dzLiAgVGhlIGludmVyc2UgbWlzbWF0Y2ggc2VuZHMgYQo+IGZpcm13YXJlLWNvdW50ZXIg
aW5kZXggdG8gaGFyZHdhcmUtY291bnRlciBvcGVyYXRpb25zLgo+Cj4gUmVqZWN0IHRoZSBzZWxl
Y3RlZCBjb3VudGVyIHdoZW4gaXRzIGhhcmR3YXJlL2Zpcm13YXJlIGNsYXNzIGNhbm5vdCBtb25p
dG9yCj4gdGhlIHJlcXVlc3RlZCBldmVudC4gIFJldHVybiBTQklfRU5PVFNVUFAsIG1hdGNoaW5n
IHRoZSBQTVUgc3BlY2lmaWNhdGlvbidzCj4gY2FzZSB3aGVyZSB0aGUgc2VsZWN0ZWQgY291bnRl
ciBjYW5ub3QgbW9uaXRvciB0aGF0IGV2ZW50Lgo+Cj4gRml4ZXM6IDEzZDQwZjIxZDU4OCAoImxp
Yjogc2JpOiBBZGQgUE1VIHN1cHBvcnQiKQo+Cj4gU2lnbmVkLW9mZi1ieTogUGVuZ3BlbmcgSG91
IDxwZW5ncGVuZ0Bpc2Nhcy5hYy5jbj4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8
YW51cEBicmFpbmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3Bl
bnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+IEJhc2UtY29tbWl0OiA0ZTc5ZmQ3ZGU1
OWYxYjI4OTkwOTJjMWE4NGNlNjhjOGViYzY4ZjkzCj4KPiAgbGliL3NiaS9zYmlfcG11LmMgfCA2
ICsrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0
IGEvbGliL3NiaS9zYmlfcG11LmMgYi9saWIvc2JpL3NiaV9wbXUuYwo+IGluZGV4IGEwZjZkMmYu
LjA0MGRiNjEgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfcG11LmMKPiArKysgYi9saWIvc2Jp
L3NiaV9wbXUuYwo+IEBAIC05MjYsNiArOTI2LDEyIEBAIGludCBzYmlfcG11X2N0cl9jZmdfbWF0
Y2godW5zaWduZWQgbG9uZyBjaWR4X2Jhc2UsIHVuc2lnbmVkIGxvbmcgY2lkeF9tYXNrLAo+ICAg
ICAgICAgICAgICAgICBpZiAoY2lkeF9maXJzdCA+PSB0b3RhbF9jdHJzKQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+Cj4gKyAgICAgICAgICAgICAgIGlmICgo
ZXZlbnRfdHlwZSA9PSBTQklfUE1VX0VWRU5UX1RZUEVfRlcgJiYKPiArICAgICAgICAgICAgICAg
ICAgICBjaWR4X2ZpcnN0IDwgbnVtX2h3X2N0cnMpIHx8Cj4gKyAgICAgICAgICAgICAgICAgICAo
ZXZlbnRfdHlwZSAhPSBTQklfUE1VX0VWRU5UX1RZUEVfRlcgJiYKPiArICAgICAgICAgICAgICAg
ICAgICBjaWR4X2ZpcnN0ID49IG51bV9od19jdHJzKSkKPiArICAgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gU0JJX0VOT1RTVVBQOwo+ICsKPiAgICAgICAgICAgICAgICAgaWYgKHBocy0+YWN0
aXZlX2V2ZW50c1tjaWR4X2ZpcnN0XSA9PSBTQklfUE1VX0VWRU5UX0lEWF9JTlZBTElEKQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+ICAgICAgICAgICAgICAg
ICBjdHJfaWR4ID0gY2lkeF9maXJzdDsKPiAtLQo+IDIuNTAuMSAoQXBwbGUgR2l0LTE1NSkKPgo+
Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoK
LS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
