Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39CFCA1009
	for <opensbi@archiver.kernel.org>; Wed,  3 Sep 2025 11:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SdKOesrwcN6UHlPXbs04I0ilWLZLXcVxBsktejWqQxg=; b=ScYKmzYn1ApjUx
	J4ESBPHNF/wZR3HX/C4nNhxlkJsRryAglr93OQ8SWw+9eOToXwyoskm98TrKsgAT+kkXTjnkP0nf0
	2uIhPRV/xSYG6qulX8Sf7ZSjKHyQhL7cj5TaN6rgIt3o9rDcdTbUgl8CVkZA1ZfeqK1R4DEnUdhE2
	SJdNP/Oh0QjeFeZkLq3eQ0if41ZUc3Y/Cn1nifami8wcateCY3Ckbh350kF0ZRPfq36d/u+RbhM99
	4pJOigy/Yu1vePwYtJw4gAYbdVbX0Tsu+doCggp8vtrqh6A6XguLlE4O0/Rjz8Ic6gmFL9+5Lkpa4
	R1jZcNLSNR96HDgKfbsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlyP-00000006GeJ-3jxh;
	Wed, 03 Sep 2025 11:48:21 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utks2-000000067Jz-369q
	for opensbi@lists.infradead.org;
	Wed, 03 Sep 2025 10:37:44 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-e96df7ff20eso6132114276.1
        for <opensbi@lists.infradead.org>; Wed, 03 Sep 2025 03:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1756895862; x=1757500662; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKICFGprc+w5LJKnmsaPpEhbIBUmZ2IHLdEE2Qh4j/M=;
        b=ChS+BYS66jxQaOsymynCcSttr1YpgK5XmfGVR7IeiwkK84X5vnLB7XHvVQbGkzNp3P
         SAykBp4MCBGVA/hbv0CAhpb0MCZ/Vo/CX00ZlQHHSOsriCW3PZ9eWVPULNkfsjyd5De9
         wfGidy8+3/iNEXySOpkplu8wpv/Hwlae0TrdWXpn201bhZG2o3ZgFXznUke04mQ0Z7Hl
         qHdSdbGDLpXxykpIffdC2dN8bDiGACUlP7HkqhC5pXbY9PasvsvFexA9o8pn1/S2aWOF
         FNcnHz6zqKiivlw6fouStdypBxcq+T+TEHuKdO7CWmj+NRm/7ht7kBjwFgbRNQZks+Ny
         K2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756895862; x=1757500662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKICFGprc+w5LJKnmsaPpEhbIBUmZ2IHLdEE2Qh4j/M=;
        b=vbkGrseq0y2JM3QW4G9T7Phd7toJMIFVEuomJ1SDx+HB9OoAYS9zz8/5hhAqw/HiNC
         MBTYIEEZAHqqz/wmNlXgdUYU1lgAYl+UQWTO8AbFqKCEkzxUJXteyrjJBFhyDTu5fyki
         z5QSRTiK0debO/18ASGEyvDxD1aemvsftY2l0w/gncDxq9aYrCbk8zZZvczmvCDX4qiC
         h0ZmeIvsuOv7ipX5pEEpWWaASHQ/mwdVIvIY0zAefdh++Raeak6cx3QQQQMpZ+goMfoo
         EfSVMb/5HaOiGgUgAP7UCd92hbWU1BfmY5Girz6HHgxN5RigHgEDDV1vTt8un7nLJv60
         nBqg==
X-Forwarded-Encrypted: i=1; AJvYcCXgeSLlm4mFdTKmqRnItgxTbSR2lHy+YRrnNoCTzopPoMaJ1eD79IalTBppFfOcufiTZvcJatd1@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2Ezk+X8bz7h5yVig6YGJ7inCvoq6j0AiwWD7rSIWls630hXsy
	HOoAmW5FpiLBkYr5QWqyfjwV1QpvOl3C5v+aecrIgf5sxe3N6K/mWfVXoZT9w88MLno5/SpPnRJ
	JKrs1ZDGJFu/LWhrHgvIQLN/VP0ziyQDeTZS7FICkQw==
X-Gm-Gg: ASbGncsEtV755hxS4dNdIzV2UD/lD992gsmCUPixpRYghSopPnELz+fQQgSUNUkPzQd
	G3GrILnAvB/4PAf42pjnl0qhkkP8p5gpaDhvwRHpAe/IoOHD3a5lnZJHSQ+Sb942BYfZePkkmTX
	cP3nMwPtvz0Rx3wzVBQpy2XpYKGO8CrWjSv7qphjVR3B/oyEWMp3c0Ha7TT9hXE7rf9v3tDRHE5
	T3NIYcQKPNkuHDUfckh
X-Google-Smtp-Source: AGHT+IEXp3XNho8lQbmN55ucVSAhF2juOn4Q1nUQejM/F+3wTjGxTfdLUMla/5idS3/nAEcyRaeD9n0yfUaIjZf9SZQ=
X-Received: by 2002:a05:6902:20ca:b0:e96:c71a:8a19 with SMTP id
 3f1490d57ef6-e98a5864a90mr16258681276.47.1756895861634; Wed, 03 Sep 2025
 03:37:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250903065220.456955-1-apatel@ventanamicro.com>
In-Reply-To: <20250903065220.456955-1-apatel@ventanamicro.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Wed, 3 Sep 2025 18:37:31 +0800
X-Gm-Features: Ac12FXyczSr9xXdUZfmkwhigF7YeENEb7PO_xgeskReifiMz2r086Wjdd-c4nrE
Message-ID: <CAKddAkBL_3YOBiG1+bD5xaiB7Hbi=yU6pwah0e+PCuzQZs3rUA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] OpenSBI IPI device rating
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_033742_783902_EA715D13 
X-CRM114-Status: GOOD (  13.19  )
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

T24gV2VkLCBTZXAgMywgMjAyNSBhdCAyOjU24oCvUE0gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gSW50cm9kdWNlIElQSSBkZXZpY2UgcmF0aW5nIHdoaWNo
IGZ1cnRoZXIgYWxsb3dzIHVzIHRvIHJlbW92ZSBwbGF0Zm9ybQo+IHNwZWNpZmljIElQSSBpbml0
IGFuZCBjb252ZXJ0IElQSSBkcml2ZXJzIGFzIGVhcmx5IGRyaXZlcnMuCj4KPiBUaGVzZSBwYXRj
aGVzIGNhbiBhbHNvIGZvdW5kIGluIHNiaV9pcGlfcmF0aW5nX3YyIGJyYW5jaCBhdDoKPiBodHRw
czovL2dpdGh1Yi5jb20vYXZwYXRlbC9vcGVuc2JpLmdpdAo+Cj4gQ2hhbmdlcyBzaW5jZSB2MToK
PiAgLSBVc2UgbGlua2VkLWxpc3QgaW4gUEFUQ0gxIGluc3RlYWQgb2YgYXJyYXkKPiAgLSBJbml0
aWFsaXplIGFjbGludF9tc3cgYWZ0ZXIgc2VyaWFsIHBvcnQgaW4gUEFUQ0gyCj4KPiBBbnVwIFBh
dGVsICgzKToKPiAgIGxpYjogc2JpOiBJbnRyb2R1Y2UgSVBJIGRldmljZSByYXRpbmcKPiAgIGlu
Y2x1ZGU6IHNiaTogUmVtb3ZlIHBsYXRmb3JtIHNwZWNpZmljIElQSSBpbml0Cj4gICBsaWI6IHV0
aWxzL2lwaTogQ29udmVydCBJUEkgZHJpdmVycyBhcyBlYXJseSBkcml2ZXJzCj4KPiAgaW5jbHVk
ZS9zYmkvc2JpX2lwaS5oICAgICAgICAgICAgICAgICAgICB8ICA1ICsrLQo+ICBpbmNsdWRlL3Ni
aS9zYmlfcGxhdGZvcm0uaCAgICAgICAgICAgICAgIHwgMTcgLS0tLS0tLS0tCj4gIGluY2x1ZGUv
c2JpX3V0aWxzL2lwaS9mZHRfaXBpLmggICAgICAgICAgfCAyNiAtLS0tLS0tLS0tLS0tLQo+ICBs
aWIvc2JpL3NiaV9pbml0LmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgbGliL3Ni
aS9zYmlfaXBpLmMgICAgICAgICAgICAgICAgICAgICAgICB8IDQ2ICsrKysrKysrKysrKysrKysr
LS0tLS0tLQo+ICBsaWIvdXRpbHMvaXBpL2FjbGludF9tc3dpLmMgICAgICAgICAgICAgIHwgIDEg
Kwo+ICBsaWIvdXRpbHMvaXBpL2FuZGVzX3BsaWNzdy5jICAgICAgICAgICAgIHwgIDEgKwo+ICBs
aWIvdXRpbHMvaXBpL2ZkdF9pcGkuYyAgICAgICAgICAgICAgICAgIHwgMjIgLS0tLS0tLS0tLS0t
Cj4gIGxpYi91dGlscy9pcGkvZmR0X2lwaV9kcml2ZXJzLmNhcnJheSAgICAgfCAgMyAtLQo+ICBs
aWIvdXRpbHMvaXBpL2ZkdF9pcGlfbXN3aS5jICAgICAgICAgICAgIHwgIDIgKy0KPiAgbGliL3V0
aWxzL2lwaS9mZHRfaXBpX3BsaWNzdy5jICAgICAgICAgICB8ICAyICstCj4gIGxpYi91dGlscy9p
cGkvb2JqZWN0cy5tayAgICAgICAgICAgICAgICAgfCAgNyArKy0tCj4gIGxpYi91dGlscy9pcnFj
aGlwL2ltc2ljLmMgICAgICAgICAgICAgICAgfCAgMSArCj4gIHBsYXRmb3JtL2ZwZ2EvYXJpYW5l
L3BsYXRmb3JtLmMgICAgICAgICAgfCAyOSArKysrKysrLS0tLS0tLS0KPiAgcGxhdGZvcm0vZ2Vu
ZXJpYy9vcGVuaHdncm91cC9vcGVucGl0b24uYyB8IDIzICsrKysrLS0tLS0tLQo+ICBwbGF0Zm9y
bS9nZW5lcmljL3BsYXRmb3JtLmMgICAgICAgICAgICAgIHwgIDIgLS0KPiAgcGxhdGZvcm0va2Vu
ZHJ5dGUvazIxMC9wbGF0Zm9ybS5jICAgICAgICB8IDE3ICsrKysrLS0tLQo+ICBwbGF0Zm9ybS9u
dWNsZWkvdXg2MDAvcGxhdGZvcm0uYyAgICAgICAgIHwgMTUgKysrKy0tLS0KPiAgcGxhdGZvcm0v
dGVtcGxhdGUvcGxhdGZvcm0uYyAgICAgICAgICAgICB8IDIwICsrKysrLS0tLS0tCj4gIDE5IGZp
bGVzIGNoYW5nZWQsIDkxIGluc2VydGlvbnMoKyksIDE1MCBkZWxldGlvbnMoLSkKPiAgZGVsZXRl
IG1vZGUgMTAwNjQ0IGluY2x1ZGUvc2JpX3V0aWxzL2lwaS9mZHRfaXBpLmgKPiAgZGVsZXRlIG1v
ZGUgMTAwNjQ0IGxpYi91dGlscy9pcGkvZmR0X2lwaS5jCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBs
aWIvdXRpbHMvaXBpL2ZkdF9pcGlfZHJpdmVycy5jYXJyYXkKPgpUZXN0ZWQtYnk6IE5pY2sgSHUg
PG5pY2suaHVAc2lmaXZlLmNvbT4KCj4gLS0KPiAyLjQzLjAKPgo+Cj4gLS0KPiBvcGVuc2JpIG1h
aWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGlu
ZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
