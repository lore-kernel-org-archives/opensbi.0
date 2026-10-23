Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F71606A31A
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 06:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mlkskGGm;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=JA7bIsl3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=klxVQTXMV5sSM1SfZuhfj28F9yrd2kWNRoGzIwo4QLY=; b=mlkskGGmrAjVgO7gg6YoojhXq3
	UEV2BYhdUorRJ9Uu+42IH+tIw/TVXku34Or0CZ2ks50M47aepbgy6n6pvhflYK9bKUjPocF/RNv2U
	CNqNNPgv1IH+MfpjxMgWxOoUY1MrHSVfxQLisNkrGY1ARtMng/7nsKWCobz5TknujNZkUsug55Iqz
	88+Zl5Pr6mR1F3tP97Ywj9fsFspd6RcHazDe8Mv6ARsE+ZyexnAVl0IEHY6Q3G5zAoy5db3EDyLkr
	l15SualS00UXHjqeXqJFWTEyKVYUJnOJzkdXNaQIc92FEluNb2PFJGRMeeFyMXxG20J3FWBVCwrTP
	G8Pvp0og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8Sh-0000000FYoJ-1CZZ;
	Fri, 23 Oct 2026 06:09:07 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8Sf-0000000FYnQ-03Yl
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 06:09:06 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso265527f8f.2
        for <opensbi@lists.infradead.org>; Thu, 22 Oct 2026 23:09:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792735743; cv=none;
        d=google.com; s=arc-20260327;
        b=FGUkbSOWlr/HZarG09LsCfNIv8R8BTiAy1OYKdj02bbMZ8B3nsk43acZXzXNRFb8H2
         zzYUvDMRHaYX8PMRlPHoQr57Eg9L/Al9yT2KTUVNIMIUReAIazLSHixTjpWopiEF+QhO
         O14k8/5rYMQHpAuuSDynLCPm38u22gIpVs41zhXTXBolzLZSSbJBgh0ACt2ty2OHZ8ri
         arOe+Zgw9oRLhbEzcAGxDPgGAh/2OgH+EsxWW33Yb2rx0xPUZq4YouvnlGHI/1Qqcc7O
         TG+UEx9YQbjeQqixUrVR+Niy1lsY8sMs85L/TZDyqYJoeIkg+QAWdl9X50us/CS/mLbx
         simw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RMAJfxkL639WTf2NJAYzK3/0F6tM1GLKATkrVvbA/2I=;
        fh=DvUZaCZeGFM/iKDgemEdcvjZTXBGU6zmoXACXNg+ctg=;
        b=mYRYF5rYUcU7gBiHC81XTMSZg8k48Tt5DRPyUmvzQQIUtRNEEo6U5uGipeT9amTJyY
         UaJjHgdjGH3O5CNglrzqwXIoCZtqVV9VMoxQ9eX9Oo4TWFyOLbEeptts2aHvezBRnD7D
         LUuHf3pEADzYYOJRrPdUimwaUmXJ+OAoq+rSm9ka6fM9A4iy/oRm+lmipqOt56yNZJQb
         O4mYHoZXNASswVxiDiEwmGpQncnQA5dRX0CevlYKakviXsrC7eTvfOn90bSjYH6gltgG
         zIwVuDaDiZhw38ROhLVnnxltyVMdUWAKAm62RqjzAISYg+pel5fw0FZdDmrquyLo70pZ
         sheQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792735743; x=1793340543; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RMAJfxkL639WTf2NJAYzK3/0F6tM1GLKATkrVvbA/2I=;
        b=JA7bIsl3KlYzFFGqrRNKDe6iuUaMwZDwU6suzgOlaMI2A2Om15t/EGR7aNLilV4UOS
         cp0EK2yFziXdRBIgiqc7zTpP19Z3ybrUI74Srszp+w5qVqJJMtr6pdHvYEld37l25jlV
         KVxH7rs2r+xpo7xDNXcSEIAPUdx1rV4xGulRpgC+l64jvjGT+HBU2e3QMk9jjtI/zPUO
         sdkLMLuzZJb0ipcqjGiDvnLaIFf1UcHrdrW2kzMAlJwdD/6nU2G3harpWPga/2J42n1A
         3/foEnbusfGzcj+yo4p4OZgqBHpuv6lMnaCvHkslnhK5sZnWUMBdOTpQB0ggyg5Z6lWE
         5cHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792735743; x=1793340543;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RMAJfxkL639WTf2NJAYzK3/0F6tM1GLKATkrVvbA/2I=;
        b=MRxHInC4bP0H0rB2+GExQJqij/vNGlxjViZoaX3H7IIjNJVws38wse8/gA53uxdGhP
         fMvMa+W0CAUoH+iCZxiJYtXhtwIUB6Xjys0sPiJkYUBHN9APBAlpHl4l6RZGPmL9K964
         zB5jwFnPvEUkh7poGAlNQZmJm//G6l/HISblIiw3Pu7kvkg2WUJiTn5tBMOIISNGC+sR
         XPj9PVV6DQJo6l/kvD1LUEdYL+YaIj/SVnis+IhhEY51dei+Df67WDP4i1w5PwqTph5I
         buVAx9zFfyWxrGJXe+YtF8qpApwT2qf8lS1EZKXWzXzG5eIoKHED0+b7+wmVmfo3lNkZ
         IEIQ==
X-Gm-Message-State: AFq9FYJsDxSo5g0PobW4kcST4Z+P2Hn6wzA/PgAwL/7/ulqyqFBomGbc
	dmVu8yuh7rKVNWqbndwCUjmR8WITetB7uFbC4cNPkLweHQsEZLkWEC4gDR6aR9p7I0j+NZCjFHP
	VqZ43miAETpmvM226Q7whR23SYor2rDRPIM8oTZrTdA==
X-Gm-Gg: AYBFou2U5v+TfkpMLhT4Acas0ZM8xruA0cZxCu3RU1QMoZUVPcjUuBDe1K50usUNl5b
	qXyJofacdhCGxjRFVPxxgU5fAyLhXmDWn31nV+oX/K8Aco4pPYXgRSwsCoDq5SQ/Pt2gvJ/IJmy
	ON2KLGUTTV2GqDNPq8OtPxWbGELZgMcvQR81yTbCOBhBKHK813m1rfsIP9Ymuy4az4IBJozVBQq
	5xci+YEu3wikuIp9OdCAWaKH9ZywJ+qim1Nm/HiJ3QTuN0SEKbDfj3aGP4X0+4Lin0JEGaBemwF
	c0HM3ZAgH4iFsZdjpqLEZiN/BGz9bJd7SVjKqvrlhrCheG3z+nHYTiO7mbz27lVntTgNwXOXoEQ
	W+XjSJQOYHFcG1+gFsNhXq1aAv3DzpMAeitPrBZBF8FhMHWgYjiChs31ETfSHyS6O+saPcRVfIE
	bMmeUTvdhnEW0AsTJiAYyxZcS6cZpAh0SpfnTRlG76QFMSvu6Tkcw/8tU=
X-Received: by 2002:a05:6000:454b:b0:48b:5e2:52dd with SMTP id
 ffacd0b85a97d-48e38588944mr948536f8f.11.1792735742870; Thu, 22 Oct 2026
 23:09:02 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023000241.345893-1-theodoruswensanfebruanto025@gmail.com>
In-Reply-To: <20261023000241.345893-1-theodoruswensanfebruanto025@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2026 11:38:51 +0530
X-Gm-Features: AclHuK-U2T_AkRArwk21BAsHiDnCb_-JFxt3-C3qN8EjUWOgPH5oRzqLa5me3rw
Message-ID: <CAAhSdy2xRXFZ6pNByQqVBXHC=TFa8R8zkomQnu7aLZKEkBraJA@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: Preserve hcounteren and htimedelta across
 domain switches
To: whensun <theodoruswensanfebruanto025@gmail.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_230905_073599_2178369B 
X-CRM114-Status: GOOD (  17.47  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBPY3QgMjMsIDIwMjYgYXQgNTozMuKAr0FNIHdoZW5zdW4KPHRoZW9kb3J1c3dlbnNh
bmZlYnJ1YW50bzAyNUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gU2F2ZSBhbmQgcmVzdG9yZSBoY291
bnRlcmVuIGFuZCBodGltZWRlbHRhIHdoZW4gc3dpdGNoaW5nIGJldHdlZW4KPiBkb21haW5zIG9u
IGhhcnRzIHN1cHBvcnRpbmcgdGhlIEh5cGVydmlzb3IgZXh0ZW5zaW9uLgo+Cj4gV2l0aG91dCB0
aGlzIHByZXNlcnZhdGlvbiwgYSByZXN1bWVkIGRvbWFpbiBjYW4gb2JzZXJ2ZSB0aGUgcmVnaXN0
ZXIKPiB2YWx1ZXMgbGVmdCBieSBhbm90aGVyIGRvbWFpbi4KPgo+IExpbms6IGh0dHBzOi8vZ2l0
aHViLmNvbS9yaXNjdi1zb2Z0d2FyZS1zcmMvb3BlbnNiaS9pc3N1ZXMvNDMzCj4gU2lnbmVkLW9m
Zi1ieTogd2hlbnN1biA8dGhlb2RvcnVzd2Vuc2FuZmVicnVhbnRvMDI1QGdtYWlsLmNvbT4KClNx
dWFzaCB0aGlzIGluIGFwcHJvcHJpYXRlIHBhdGNoIG9mIHlvdXIgb3RoZXIgc2VyaWVzICJQcmVz
ZXJ2ZSBtb3JlClMvSFMgYXJjaGl0ZWN0dXJhbCBzdGF0ZSBhY3Jvc3MgZG9tYWluIHN3aXRjaGVz
IgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAgbGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYyB8
IDYgKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1n
aXQgYS9saWIvc2JpL3NiaV9kb21haW5fY29udGV4dC5jIGIvbGliL3NiaS9zYmlfZG9tYWluX2Nv
bnRleHQuYwo+IGluZGV4IDA4NjFkNTQxLi4zMWZhNWFmYyAxMDA2NDQKPiAtLS0gYS9saWIvc2Jp
L3NiaV9kb21haW5fY29udGV4dC5jCj4gKysrIGIvbGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQu
Ywo+IEBAIC01MCw2ICs1MCw4IEBAIHN0cnVjdCBoYXJ0X2NvbnRleHQgewo+ICAgICAgICAgdW5z
aWduZWQgbG9uZyBzZW52Y2ZnOwo+ICAgICAgICAgLyoqIFN1cGVydmlzb3IgcmVzb3VyY2UgbWFu
YWdlbWVudCBjb25maWd1cmF0aW9uIHJlZ2lzdGVyICovCj4gICAgICAgICB1bnNpZ25lZCBsb25n
IHNybWNmZzsKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgaGNvdW50ZXJlbjsKPiArICAgICAgIHU2
NCBodGltZWRlbHRhOwo+Cj4gICAgICAgICAvKiogRmxvYXQgY29udGV4dCBzdGF0ZSAqLwo+ICAg
ICAgICAgc3RydWN0IHNiaV9mcF9jb250ZXh0IGZwX2N0eDsKPiBAQCAtMTQ1LDYgKzE0NywxMCBA
QCBzdGF0aWMgaW50IHN3aXRjaF90b19uZXh0X2RvbWFpbl9jb250ZXh0KHN0cnVjdCBoYXJ0X2Nv
bnRleHQgKmN0eCwKPiAgICAgICAgICAgICAgICAgY3R4LT5zZW52Y2ZnICAgID0gY3NyX3N3YXAo
Q1NSX1NFTlZDRkcsIGRvbV9jdHgtPnNlbnZjZmcpOwo+ICAgICAgICAgaWYgKHNiaV9oYXJ0X2hh
c19leHRlbnNpb24oc2NyYXRjaCwgU0JJX0hBUlRfRVhUX1NTUU9TSUQpKQo+ICAgICAgICAgICAg
ICAgICBjdHgtPnNybWNmZyAgICAgPSBjc3Jfc3dhcChDU1JfU1JNQ0ZHLCBkb21fY3R4LT5zcm1j
ZmcpOwo+ICsgICAgICAgaWYgKG1pc2FfZXh0ZW5zaW9uKCdIJykpIHsKPiArICAgICAgICAgICAg
ICAgY3R4LT5oY291bnRlcmVuID0gY3NyX3N3YXAoQ1NSX0hDT1VOVEVSRU4sIGRvbV9jdHgtPmhj
b3VudGVyZW4pOwo+ICsgICAgICAgICAgICAgICBjdHgtPmh0aW1lZGVsdGEgPSBjc3Jfc3dhcDY0
KENTUl9IVElNRURFTFRBLCBkb21fY3R4LT5odGltZWRlbHRhKTsKPiArICAgICAgIH0KPgo+ICAg
ICAgICAgLyogRWFnZXIgY29udGV4dCBzd2l0Y2ggZm9yIGZsb2F0ICovCj4gICAgICAgICBpZiAo
c2JpX2hhcnRfaGFzX2V4dGVuc2lvbihzY3JhdGNoLCBTQklfSEFSVF9FWFRfRikgfHwKPiAtLQo+
IDIuNDMuMAo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5p
bmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNi
aQo=
