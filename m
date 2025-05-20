Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202F2C3ABDA
	for <opensbi@archiver.kernel.org>; Tue, 20 May 2025 05:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qmtTLG4ayVrfh4FLs6L3rtB9baKvOWeWDlm4kDmQq7E=; b=YKFfU52nfniOoZ
	uYB79eXHtFh1T480RpqBxnc3c1JaDsH/tGuhBbWtde2oJtzbc/GjmpnwnsCpzF0Xfsg53t844M2d9
	Yd++4hWEwGyDeSnwbdb7X3jplyfuGtuGUm07a9yPgJsQYXtu5Ob+oAZIdt398uxCC/CD6xrPl/v2n
	6ifz8y4559KyWHybOa4idrqSopca86b1n6DW2kyJZbBM5uigLHAX9wN9Kcnso2NuYWUPWecYJgXPt
	GveyAduHLJUifyuSWiNWBhO2NGWcHWK4d5Of65iZIlDBe8KDnP3wlya/rQy9sHhcTx1Iqr+17Zao6
	uxzlRyHQJLY+vzwdAnUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHFqn-0000000BcPr-0fve;
	Tue, 20 May 2025 05:49:17 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHFql-0000000BcPQ-0xJI
	for opensbi@lists.infradead.org;
	Tue, 20 May 2025 05:49:16 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3dc643c1c30so9121615ab.2
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 22:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1747720154; x=1748324954; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ulXZIvsSoPb28jjoKxOKc702dnjFh3PN8Wn4fPxB3Ys=;
        b=n+5BV1z+jULIagHlFJcU13hkNg/eWJCX97eNXfp+Hx1GCp4RVe3ix0rV/M6g9F/hOD
         BtXUc4fnNyHa7H8EUDwTba47kA/Kgn0OXnX9k6VM5o/fTbikxDycvziMDBNqv2yathHp
         oT+MwpxFnpbUDg8g2OUXQ+n2+F/ymOmmWXRQGV/upCyUqM5KAihCIkwBdAbyD9o74vTa
         sd901fU1wGMN+OfOctstJQjaQe5YlkCGCgFWEHaRfUXkzf6mWt8Wm57WSVUDWo4zVLe+
         qAZnDGzRPRWN8nu2rk7IBjUqMPMnB68OdhSFLcZPmhoOkXLK1UjvfXe8xBY8+a+le96a
         OUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747720154; x=1748324954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ulXZIvsSoPb28jjoKxOKc702dnjFh3PN8Wn4fPxB3Ys=;
        b=LKeIjuQMFQtgivLpWTqH+rrpgy9FjchfCisWTh3sQH7zKagSzd29lbEGtlttq2HByv
         EyAlNwnmiOJnWHO7KtOZbxtkYBxSa4DRU9rqh+OU9ERtAx3s69Zii7LcRanxJGjvNX1D
         WNc93PqaNEm2e5xyGybKGcekw9XKWnfsHV+c35KqOsMvvgXmrly1ZwD32gqYA0EXxiaC
         gWRjWmqfhwpyvIQlJSuj8iKDPoO/WAMv0HwmTTsbo45NSrokVGeMPcPG3GIFXh99sQsA
         OD+XG0hkcwomk3I87PORFkYpPHKKHke9FPRQFNCmoPMPrOrIztegwT2swFSuhebyPSHx
         zeiQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8LVSDIW5KXOd810i/pANpfOgwbqfzO7g0h9BsG+4StUGNZOv/PCv17Yl8IIEXz3czxvb0GMMg@lists.infradead.org
X-Gm-Message-State: AOJu0YxvNHvIfzZpyPb3BybyV6Dps/TwRZ1IUjBkzH1YPdl2h3H9R/jG
	W9JToiuVvPw2eNJcGdAVYj+s5j/DAjYYFtWZKHy8x+8T437ItzYrCKA1qCEuJJBbizL0+BPwrZm
	prvBlrqwDIKbPBkeNNe6Oo7yc+0l2xnXARjes35Q8G5REIsZa/eqx
X-Gm-Gg: ASbGncvQC/mxUVAUKGR/IfdCTDzbBn++XXqn15+BLe6XbXCABwruusqLqbu9H/3zuSX
	q4/lF8X0W58Be24keqNy972ovfnKdzAiSwO1kXwgKOnpZJTtwHoEANym94pXwdvJxTCHv8oMyYI
	NdgQOoO/LWbtocOkBheg2hWvs16ScMu6F5PA==
X-Google-Smtp-Source: AGHT+IH4FFcPPApxvj/KzzcYB/RI2GoTSuujJu/y/6R3JizRbEfS09rm5J5/dmZnH7ZAm2NsM5ko25uPXHfaIUIUBhw=
X-Received: by 2002:a05:6e02:349c:b0:3da:7176:81bf with SMTP id
 e9e14a558f8ab-3db8434a2afmr150715645ab.21.1747720154296; Mon, 19 May 2025
 22:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250512083827.804151-1-apatel@ventanamicro.com>
In-Reply-To: <20250512083827.804151-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 20 May 2025 11:19:03 +0530
X-Gm-Features: AX0GCFt0mtVfbZ9VfOmxmnQzyxkB1sUPD5rmodD1uLVi72djxuMwRcb5TkTDHZE
Message-ID: <CAAhSdy0j50avDVdi7rPq-azbwC0qM=h9VHJi+SSG3Y-OUwYK_g@mail.gmail.com>
Subject: Re: [PATCH 0/4] Driver updates to match frozen RPMI specification
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_224915_265670_1C51F234 
X-CRM114-Status: GOOD (  12.43  )
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

T24gTW9uLCBNYXkgMTIsIDIwMjUgYXQgMjowOOKAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFRoZSBSUE1JIHYxLjAgc3BlY2lmaWNhdGlvbiBpcyBm
cm96ZW4gYW5kIGluIHB1YmxpYyByZXZpZXcgc28gdXBkYXRlCj4gUlBNSSBkcml2ZXJzIHRvIG1h
dGNoIGxhc3QgbWludXRlIHNwZWNpZmljYXRpb24gY2hhbmdlcyB3aGljaCB3ZXJlCj4gYmFzZWQg
b24gQVJDIGZlZWRiYWNrLgo+Cj4gVGhlc2UgcGF0Y2hlcyBjYW4gYWxzbyBiZSBmb3VuZCBpbiB0
aGUgcnBtaV9maXhlc192MSBicmFuY2ggYXQ6Cj4gaHR0cHM6Ly9naXRodWIuY29tL2F2cGF0ZWwv
b3BlbnNiaS5naXQKPgo+IFRvIHRlc3QgdGhlc2UgcGF0Y2hlcywgdXNlIHRoZSBkZXYtdXBzdHJl
YW0gYnJhbmNoIG9mIHRoZSBmb2xsb3dpbmcgcmVwb3M6Cj4gKiBodHRwczovL2dpdGh1Yi5jb20v
dmVudGFuYW1pY3JvL3FlbXUuZ2l0Cj4gKiBodHRwczovL2dpdGh1Yi5jb20vdmVudGFuYW1pY3Jv
L2xpbnV4LmdpdAo+Cj4gVG8gZW5hYmxlIFFFTVUgUlBNSSBlbXVsYXRpb24gKHVzaW5nIGxpYnJw
bWkpIGZvciB2aXJ0IG1hY2hpbmUsIHVzZQo+ICJ2aXJ0LHJwbWk9b24sYWlhPWFwbGljLWltc2lj
IiBhcyB0aGUgUUVNVSBtYWNoaW5lIG5hbWUuCj4KPiBBbnVwIFBhdGVsICg0KToKPiAgIGxpYjog
dXRpbHMvbWFpbGJveDogVXBkYXRlIERUIHJlZ2lzdGVyIG5hbWUgb2YgQTJQIGRvb3JiZWxsCj4g
ICBsaWI6IHV0aWxzL21haWxib3g6IFBhcnNlIFAyQSBkb29yYmVsbCBzeXN0ZW0gTVNJIGluZGV4
IGZyb20gRFQKPiAgIGxpYjogdXRpbHMvbWFpbGJveDogUGFyc2UgQTJQIGRvb3JiZWxsIHZhbHVl
IGZyb20gRFQKPiAgIGxpYjogdXRpbHMvbXB4eTogUmVtb3ZlIHAyYV9kYl9pbmRleCBmcm9tIFJQ
TUkgc3lzdGVtIE1TSSBhdHRyaWJ1dGVzCgpBcHBsaWVkIHRoaXMgc2VyaWVzIHRvIHRoZSByaXNj
di9vcGVuc2JpIHJlcG8uCgpSZWdhcmRzLApBbnVwCgo+Cj4gIGluY2x1ZGUvc2JpX3V0aWxzL21h
aWxib3gvcnBtaV9tc2dwcm90LmggICB8ICAyICstCj4gIGxpYi91dGlscy9tYWlsYm94L2ZkdF9t
YWlsYm94X3JwbWlfc2htZW0uYyB8IDM0ICsrKysrKysrKysrKysrKy0tLS0tLS0KPiAgbGliL3V0
aWxzL21weHkvZmR0X21weHlfcnBtaV9zeXNtc2kuYyAgICAgIHwgMTMgKysrKysrLS0tCj4gIDMg
ZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCj4KPiAtLQo+
IDIuNDMuMAo+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNi
aQo=
