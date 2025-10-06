Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508E6CCA471
	for <opensbi@archiver.kernel.org>; Mon,  6 Oct 2025 05:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hd4S/bXv56bAWn/+VAL9JFRmEY++Ctf1V6Vxq8p34d0=; b=kU2c6w9z+51kRn
	Dceu5ck/WyS4nLMyCZaoVCf2KWHNc7HOIeKiIoXn++lJsHMIfL8DVnHglbiRdzY2vLry0NzZa/msA
	jNF8nCHggctW4f68MvjpzlDEBiYEe6G1dHhEapcJhUlz2gp1BgwMLHEJkmxUTJqhxgD+bMxzQkMW0
	cm1aaXrRmIsXynQM83SoQ3b9ePlHU5fgCz7Eak2EwmNEmQfXQBQK+naVrjRpOqHyVlomhLNG9gojH
	LNIVgR4eWpknAkaFBdh7m/40rgCLUvUIEAlu+OOMcphcU+1AAwB5po/7RDCN3+QWWJU5VJ0VlsOyP
	QFEn/5OVm9fmAZgwknkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5dfn-0000000Gxfm-1UWk;
	Mon, 06 Oct 2025 05:22:11 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5dfk-0000000GxfK-1XB9
	for opensbi@lists.infradead.org;
	Mon, 06 Oct 2025 05:22:09 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-93ba2eb817aso193640939f.2
        for <opensbi@lists.infradead.org>; Sun, 05 Oct 2025 22:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1759728127; x=1760332927; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Us6Jw7GsV+Ghyhb1VWrM1KMcKdSb/QJGWDbqbWfJL7I=;
        b=fDwJ9KXzBWgKb1aoPASH7imK1Er5ZFTPIyQPEaQix7KLjcDrXmuH2Du3STKPA1BK9d
         ntQAXtmJG6DMpi1rw/TrUu7m8i37t02Ki8ZrVXLRMt6lW37jY4wdyOGglRxPSvdqtM7X
         8m157LPpkj2F2pOIe4fI71MuXsbZQlEDq411suf9wYZvqWmS4z5u2fH7aP2g6uVKAYxs
         mvVpJG1vALBeCp/zzDe5N1s5XADBH8FiJaaC5ZYPJFHFOM+AvigfwAIGaoSYz6a13XaI
         3fie7rUyCysnaoyxY2OvFplGBLg3VkpWnzabwrjMsA4pxzJXrBmlMac7WKZnCTLoYMl/
         yVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759728127; x=1760332927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Us6Jw7GsV+Ghyhb1VWrM1KMcKdSb/QJGWDbqbWfJL7I=;
        b=EvtSeakbeRLM/eJVf2o1aU2bB1ppxXcdnOMV4UUE+csEv2lXtPP+389D/yPOGGEYbo
         Rx8DSS8CM9rQNA0eKyKlWx2NdCcN6ATCOqYrcdWKYQbTis8o1jowOaMe5EftgI7D2aIM
         ObV9ZsVTTTdkc2F1hLBOPgj0GhoVwxOGbZJdUrFuImdrP2Lew9pEKRcO8g3Z2lC5kVSD
         ZTj+TYfoNPs7VtuDadJ6oL/wNn78L5HLx0ym06/N3u5fO5OcfdXP6BD3iIF41V12KOgB
         l1Ga8USf7V9xTMYLMsyjNmXAmQICtFIouD0KoBD6M/cyWog8KA/dxpblZIlbrstOVxkb
         3xtQ==
X-Gm-Message-State: AOJu0YypqRULW3jvDngu7bMFZEQmp25iCAPPvwuWyBBO5cv2JAbGCfWN
	SY1/4bQmrVwfioOIzaM4UNDFiGfCWZbd0dvFIkxJ+UMX5QpFJJ02zHkMUcD7RwMy7+Fg00lgD4C
	faG5YOUipycSjEWPMEpt5iLjPouUs0X8z7BZFGEbCmA==
X-Gm-Gg: ASbGnctyIMdvKMcjwZWx0gIgkO1qG5AWY8M5B/PMJyzD7UR0J/1WorI+88m6ZRQAkKZ
	X5Pe/LVsN9zJZ9WU4SqFZhkPhXs6N7UEQT1JB+OuAgGYYaHXOcYm6t7U07Xgr46VT3VOodSYaHM
	z1sPeUR9HnA9XEJ6y0OLYeCriWWqWjUxvSQvuXgQaSfWa5cPNf4EzzQJOujHL+0xIvYx6BecS0d
	xZh0CuzGnYVSju1D9FukvP+Qfoh+Nd9E3d2aHNZjr4sWI/LBnVj+/jpG2cSUfQMA/60YmAEMC8=
X-Google-Smtp-Source: AGHT+IFsjAsR9VAE8uDLLvmtzeU/kZHmX5YtEJkjJ85yZrdt6XsqmcEQS1PUdjmIOrAIkBBPzC+n3imSM7HD0zQ5TRQ=
X-Received: by 2002:a05:6e02:1986:b0:41f:5e50:23f1 with SMTP id
 e9e14a558f8ab-42e7ad9e3c0mr174303675ab.25.1759728127127; Sun, 05 Oct 2025
 22:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250815100116.27776-1-peter.lin@sifive.com>
In-Reply-To: <20250815100116.27776-1-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 6 Oct 2025 10:51:55 +0530
X-Gm-Features: AS18NWBhkVFd6Gdg4R10KwjQit6ZvX12Cei83G5oCPKRIklJeDCnnzvJQGbwwNg
Message-ID: <CAAhSdy135ZxJpqHZP0xyETSGArw_9gqwpVqM7bdfgG_uvKegkw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] Extend the reserved PMP entries
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, greentime.hu@sifive.com, zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251005_222208_410212_0A81E59C 
X-CRM114-Status: GOOD (  15.57  )
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

T24gRnJpLCBBdWcgMTUsIDIwMjUgYXQgNjo0NOKAr1BNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gVGhpcyBzZXJpZXMgZXh0ZW5kcyB0aGUgbnVt
YmVyIG9mIHJlc2VydmVkIFBNUCBlbnRyeS4KPiBUaGUgY2FwYWJpbGl0aWVzIG9mIHRoZSByZXNl
cnZlZCBQTVAgZW50cmllcyBpbmNsdWRlOgo+IC0gSGlnaGVzdCBwcmlvcml0eQo+IC0gQWxsb3cg
VE9SIG1vZGUgZm9yIHBsYXRmb3JtLXNwZWNpZmljIHVzZSBjYXNlcwo+IC0gQ2FuIGJlIGNvbnNp
c3RlbnQgYWNyb3NzIGRvbWFpbiBjb250ZXh0IHN3aXRjaGVzCj4gLSBBbGxvdyBydW50aW1lIFBN
UCBhbGxvY2F0aW9uCj4KPiBBIHBvdGVudGlhbCB1c2UgY2FzZSBmb3IgcmVzZXJ2ZWQgUE1QIGVu
dHJpZXMgaXMgcGFyc2luZyBnYXBzIGluCj4gbWVtb3J5IHBvcnRzIG1hcmtlZCBhcyBQTUFfVU5T
QUZFIFsxXSBpbiBkZXZpY2UtdHJlZS4gVGhlc2UgZ2Fwcwo+IG1heSBub3QgYmUgYWJsZSB0byBl
eGFjdGx5IGNvdmVyZWQgYnkgMSBvciAyIE5BUE9UIGVudHJpZXMsIHNvIFRPUgo+IG1vZGUgUE1Q
IGNhbiBiZSBhbGxvY2F0ZWQgdG8gc2F2ZSBQTVAgdXNhZ2UuIEJlc2lkZXMsIHRoZXkgZG9uJ3QK
PiBuZWVkIHJlY29uZmlndXJhdGlvbiBhY3Jvc3MgZG9tYWlucy4KPgo+IFRoaXMgc2VyaWVzIGRl
cGVuZHMgb246Cj4gMSkgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwODE1MDI0NDM0
LjE0MzAzLTEtcGV0ZXIubGluQHNpZml2ZS5jb20vCj4gMikgaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzIwMjUwODE0MTEwNTIyLjE4ODA5LTEtcGV0ZXIubGluQHNpZml2ZS5jb20vCj4KPiBb
MV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJpc2N2L3BhdGNo
LzIwMjQxMTAyMDAwODQzLjEzMDEwOTktMi1zYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tLwo+Cj4g
WXUtQ2hpZW4gUGV0ZXIgTGluICg3KToKPiAgIGxpYjogdXRpbHM6IGZkdF9oZWxwZXI6IGFkZCBm
ZHRfaGFzX2lzYV9leHRlbnNpb24oKSBoZWxwZXIKPiAgIGluY2x1ZGU6IHNiaTogc2JpX3BsYXRm
b3JtOiBhZGQgcmVzZXJ2ZWRfcG1wX2NvdW50IGZpZWxkCj4gICBwbGF0Zm9ybTogZ2VuZXJpYzog
cGxhdGZvcm06IGludHJvZHVjZQo+ICAgICBmd19wbGF0Zm9ybV9nZXRfcmVzZXJ2ZWRfcG1wX2Nv
dW50KCkKPiAgIGxpYjogc2JpX2luaXQ6IHByaW50IHRvdGFsIGFuZCByZXNlcnZlZCBQTVAgY291
bnRzCj4gICBsaWI6IHNiaTogcmlzY3ZfYXNtOiBhZGQgcmVzZXJ2ZWRfcG1wX2FsbG9jKCkgdG8g
YWxsb2NhdGUgYSByZXNlcnZlZAo+ICAgICBQTVAKPiAgIGxpYjogc2JpOiBzYmlfaGFydDogZXh0
ZW5kIFBNUCBoYW5kbGluZyB0byBzdXBwb3J0IG11bHRpcGxlIHJlc2VydmVkCj4gICAgIGVudHJp
ZXMKPiAgIGRvY3M6IG9wZW5zYmlfY29uZmlnOiBhZGQgZGVzY3JpcHRpb24gZm9yIHJlc2VydmVk
LXBtcC1jb3VudAoKU2FtZSBpc3N1ZSBhcyB0aGUgb3RoZXIgc2VyaWVzLCBpdCBpcyBub3Qgc2hv
d2luZyB1cCBpbiBPcGVuU0JJCnBhdGNod29yayAoaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9y
Zy9wcm9qZWN0L29wZW5zYmkvbGlzdC8pLgoKQ2FuIHlvdSBwbGVhc2UgcmViYXNlIGFuZCByZXNl
bmQgdGhpcyBzZXJpZXMgPwoKUmVnYXJkcywKQW51cAoKPgo+ICBkb2NzL29wZW5zYmlfY29uZmln
Lm1kICAgICAgICAgICAgIHwgIDQgKysrCj4gIGluY2x1ZGUvc2JpL3Jpc2N2X2FzbS5oICAgICAg
ICAgICAgfCAgMiArKwo+ICBpbmNsdWRlL3NiaS9zYmlfaGFydC5oICAgICAgICAgICAgIHwgMTUg
LS0tLS0tLS0KPiAgaW5jbHVkZS9zYmkvc2JpX3BsYXRmb3JtLmggICAgICAgICB8IDE1ICsrKysr
LS0tCj4gIGluY2x1ZGUvc2JpX3V0aWxzL2ZkdC9mZHRfaGVscGVyLmggfCAgMiArKwo+ICBsaWIv
c2JpL3Jpc2N2X2FzbS5jICAgICAgICAgICAgICAgIHwgMjUgKysrKysrKysrKysrKwo+ICBsaWIv
c2JpL3NiaV9kb21haW5fY29udGV4dC5jICAgICAgIHwgIDYgKysrLQo+ICBsaWIvc2JpL3NiaV9o
YXJ0LmMgICAgICAgICAgICAgICAgIHwgNTYgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
Cj4gIGxpYi9zYmkvc2JpX2luaXQuYyAgICAgICAgICAgICAgICAgfCAgNiArKy0tCj4gIGxpYi91
dGlscy9mZHQvZmR0X2hlbHBlci5jICAgICAgICAgfCAzNSArKysrKysrKysrKysrKysrKysrCj4g
IHBsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYyAgICAgICAgfCAzNCArKysrKysrKysrKysrKysr
KysKPiAgMTEgZmlsZXMgY2hhbmdlZCwgMTYzIGluc2VydGlvbnMoKyksIDM3IGRlbGV0aW9ucygt
KQo+Cj4gLS0KPiAyLjQ4LjAKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5z
YmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5zYmkK
