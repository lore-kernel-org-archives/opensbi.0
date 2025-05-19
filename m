Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643F2C2D0CD
	for <opensbi@archiver.kernel.org>; Mon, 19 May 2025 21:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zqq1QIzts1iAiYDldwEsrKmO4I/bolSEi21AvGwLYBk=; b=M/ArhgljKkSHy7
	ENEbCHzep7rqPh6jkT5X9rUciHoBs7ztg8gZSKkR3pVMcvwzUNinOi1I8FOLr4M2oHYXZQpGI0AjP
	bJUC4kkwqyvS7WTf8VEUCIR9aFdyzZHHFT+Li0cIG1MfpOW75ubobhlomd9hLSi+2fwebMFCx1zUv
	E13VDZYIJ5B+zQiTXizGvVNpLfbhzyRO01g4qeDeWeTrLDRlbCGZDYXh5lHVoSif3HV3ThF7IUJdF
	J4adPuCtZpaPpyJpNFoTFkDz7XKwb8b5YejMKkZlWD0bjAt5DMpsTOcE28MwnPZ4ZCnxAJq1Z1d8W
	ugrsuow1HgrONvxUPw5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Qe-0000000Af1d-0Jl9;
	Mon, 19 May 2025 21:53:48 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Pz-0000000AexH-47GS
	for opensbi@lists.infradead.org;
	Mon, 19 May 2025 21:53:09 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso5837520e87.3
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 14:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747691586; x=1748296386; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlkk9YJB95llluy7UjPrFlZKLrSYlsZR/8Affngdv+8=;
        b=i536T0yW7JPU48ugs74QIBtoPo9c4rSv9XZYjxUK59V/k3X6MXba73Zq4lAd3ajqmH
         c0N+Zuv/Tb0QD1h6+cqE8wTyqoAjy55ey6RKc9AetZAPtqjph4DKvim1OtiO8WijFoNS
         7UnBWD1XlCrsDo0sHnvc1maShZ+C9nvBCRV2PwrHhHGbgkZt8BP4nEI2TPWJzZOAHDf1
         2l5YKh/cGCqVVyghGIFMEhRiBoWE2EoAcwz5S47yvGgXDYmHFWGUwIXWW5oDFiggvgzP
         +7YUlFdDRDSKXUbaV/QA1fV0HiUVKAWGT1ZthxVGbn6GKmu3AAriWKFFqohAyhsDb1Jc
         KIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747691586; x=1748296386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qlkk9YJB95llluy7UjPrFlZKLrSYlsZR/8Affngdv+8=;
        b=gs2NnXqiqGv/v+3h2rrfwqNVMDy1wMqO7jia8YY2xqZbTA9lV/YJJOSyCfG3Gi41YA
         A7LGO+58jsTCPeJktz7c6hjeEi9hxozYMe3Urggv6pgLQtEVKHx14cSAdnS+2d5F/Ygb
         RMMlH31GloWnzD1A9sV2qdnrbrybsqy+AlpDwT1zQ8llhUR18HDgRkogt+N3d8Lnfeo3
         EXr92JxuL0HogW/4B120fT0GwuiF5A809aC/GwYHCBk2VgqywW5w0hKgi0DazZPedFhg
         DK2M0qK8v3VMMyafu7vgWsBEXwFXKb72C3a6hCUCzATBwgdJZ+34/RzjtBS7lVC20dTR
         +Lkg==
X-Gm-Message-State: AOJu0YzFypiFajmzC474asDcb/1/einN01BLes+UVeLzXsN61p0Fk5SL
	q+agK80AGv08Z2IDCT1lGd1k8WJmscTbOaEWxQsBiuE7498VMjI19q+O+cSEGGbUWyU5e+NuSQ1
	yaEOnRDWyUYrZ4kcI9GRKPxx+2YxObJu9gZcW
X-Gm-Gg: ASbGncuIkSmkbgyj/NnXlq1zr9WbNAkn+Aw4ZpqCCjhGSsDFGMF4RqNqPgPGduwu2t8
	Z+6sSPjAcgribhxio1YE0Z7bJpdtVc3k84IT4boBS9UQ0BJovYZdhcQ49MfhyTNqlrRK3TrYYBB
	YaGdTYcRpgU19bt9FxAlqZ/sl83dsVU9+NJw==
X-Google-Smtp-Source: AGHT+IHhfryn120QHRY093wzvA95EhgXkzT9ljqLc2GkXcYfI8RoIOpdruU0z62GjSGD8MOnfIS7WI3uL2sQGIZihKY=
X-Received: by 2002:a05:6512:3e04:b0:54b:f33:cc16 with SMTP id
 2adb3069b0e04-550e71b2359mr5252290e87.16.1747691585692; Mon, 19 May 2025
 14:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
 <20250429232928.6499-1-cfu@mips.com> <CAAhSdy2dMXgJ9brDL_bRT3AUJFjL5isyMCy4+GO=xk6+F8KCHQ@mail.gmail.com>
 <CAM1rFzGy0tqMJzDAyZ=CVmtKgEid9GDs3-qTvpjTAkjkB7p4PA@mail.gmail.com>
In-Reply-To: <CAM1rFzGy0tqMJzDAyZ=CVmtKgEid9GDs3-qTvpjTAkjkB7p4PA@mail.gmail.com>
From: Chao-ying Fu <icebergfu@gmail.com>
Date: Mon, 19 May 2025 14:52:54 -0700
X-Gm-Features: AX0GCFtj95dh4nmKph3z_pKG9VQWeuoaQWOrPbWRLiy10z1CLJviFEZSHeQgAXU
Message-ID: <CAM1rFzGfKzGDP-5ZitXGVfyuLKRbiDFoE8hSdp44zK3eeD-akQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] *** Add MIPS P8700 platform ***
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org, Chao-ying Fu <cfu@mips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_145308_020652_82FEE2C9 
X-CRM114-Status: GOOD (  19.54  )
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

T24gTW9uLCBNYXkgMTksIDIwMjUgYXQgMTE6MzPigK9BTSBDaGFvLXlpbmcgRnUgPGljZWJlcmdm
dUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBNYXkgMTksIDIwMjUgYXQgNToxNuKAr0FN
IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwg
QXByIDMwLCAyMDI1IGF0IDU6MzfigK9BTSBDaGFvLXlpbmcgRnUgPGljZWJlcmdmdUBnbWFpbC5j
b20+IHdyb3RlOgo+ID4gPgo+ID4gPiAqKioKPiA+ID4gQ2hhbmdlcyBpbiB2NDoKPiA+ID4gICBS
ZW1vdmUgY29kZSB0aGF0IG92ZXJyaWRlcyBuYXNjZW50X2luaXQuCj4gPiA+ICAgVXBkYXRlIHA4
NzAwLmMgdG8gd29yayB3aXRoIHRoZSBsYXRlc3Qgb3ZlcnJpZGUuCj4gPiA+ICAgVXNlIGNzcl9z
ZXQgZm9yIG1pcHNjb25maWc2IGluIHA4NzAwLmMuCj4gPiA+ICAgQWRkIHJpc2N2LGNib20tYmxv
Y2stc2l6ZSB0byB0aGUgZHRzIGZpbGUuCj4gPiA+Cj4gPiA+IENoYW5nZXMgaW4gdjM6Cj4gPiA+
ICAgUmVtb3ZlIHN0dy5zLCBzdHcuaCwgYW5kIGV4dHJhIHNjcmF0Y2ggc3BhY2UuCj4gPiA+ICAg
VXNlIG5hc2NlbnRfaW5pdCB0byBpbml0aWFsemUgTUlQUyBDU1JzLgo+ID4gPiAgIEFkZCBhbW8g
ZW11bGF0aW9uIHZpYSBpbGxlZ2FsIGluc3RydWN0aW9uIGV4Y2VwdGlvbnMuCj4gPiA+ICAgQ2hh
bmdlIHRvIHVzZSBBTU8gYW5kIFJEVElNRSBpbGxlZ2FsIGluc3RydWN0aW9uIGV4Y2VwdGlvbnMu
Cj4gPiA+ICAgUmV2aXNlIHRoZSBkdHMgZmlsZS4KPiA+ID4gICBSZW1vdmUgY29kZSB0aGF0IGp1
bXBzIHRvIG1pcHNfY3BzX2NvcmVfZW50cnkuCj4gPiA+Cj4gPiA+IENoYW5nZXMgaW4gdjI6Cj4g
PiA+ICAgQnJlYWsgdXAgb25lIHBhdGNoIHRvIDExIHBhdGNoZXMuCj4gPiA+Cj4gPiA+IENoYW5n
ZXMgaW4gdjE6Cj4gPiA+ICAgT3JpZ2luYWwgY29kZS4KPiA+ID4gKioqCj4gPiA+Cj4gPiA+IENo
YW8teWluZyBGdSAoOCk6Cj4gPiA+ICAgcGxhdGZvcm06IGdlbmVyaWM6IG1pcHM6IGFkZCBQODcw
MAo+ID4gPiAgIHBsYXRmb3JtOiBnZW5lcmljOiBtaXBzOiBhZGQgaGVhZGVyIGZpbGVzCj4gPiA+
ICAgcGxhdGZvcm06IGdlbmVyaWM6IG1pcHM6IGFkZCBhbiBlbnRyeSBmdW5jdGlvbgo+ID4gPiAg
IHBsYXRmb3JtOiBnZW5lcmljOiBtaXBzOiBhZGQgdGhlIHBsYXRmb3JtIGZpbGUKPiA+ID4gICBs
aWI6IEVtdWxhdGUgYW1vIGluc3RydWN0aW9ucwo+ID4gPiAgIHBsYXRmb3JtOiBnZW5lcmljOiBt
aXBzOiBhZGQgYSBkdHMgZmlsZQo+ID4gPiAgIHBsYXRmb3JtOiBnZW5lcmljOiBtaXBzOiBhZGQg
b2JqZWN0cy5tawo+ID4gPiAgIEluaXRpYWxpemUgTUlQUyBjdXN0b20gUE1BIHJlZ2lzdGVycwo+
ID4KPiA+IERyb3AgdGhlIEFNTyBlbXVsYXRpb24gcGF0Y2ggc2luY2UgSSBoYXZlIHNlbmQgYW5v
dGhlciB2ZXJzaW9uCj4gPiBvZiB0aGlzIHBhdGNoLgo+ID4KPiA+IEFsc28sIHlvdSBuZWVkIHRv
IHJlYmFzZSB0aGlzIHNlcmllcyBvbiBsYXRlc3QgT3BlblNCSSBiZWNhdXNlCj4gPiB0aGUgcGxh
dGZvcm0gb3ZlcnJpZGUgbWVjaGFuaXNtIGluIGdlbmVyaWMgcGxhdGZvcm0gaGFzIGNoYW5nZWQu
Cj4gPgo+ID4gUmVnYXJkcywKPiA+IEFudXAKPgo+ICAgWWVzLiBJIHdpbGwgZHJvcCB0aGUgQU1P
IHBhdGNoLCByZWJhc2UsIGFuZCBzZW5kIG91dCBhIG5ldyBwYXRjaCBzZXQgKHY2KS4KPiBOb3Rl
OiBJIHNlbnQgb3V0IHY1IHR3byB3ZWVrcyBhZ28uIChQbGVhc2UgaWdub3JlIHY1LikKPiAgIFRo
YW5rcyBhIGxvdCBmb3IgdGhlIHJldmlldyEKU29ycnkuIEkgZ290IGNvbmZ1c2VkIGFib3V0IHY1
IGFuZCB2Ni4gSSBkaWRuJ3Qgc2VuZCBvdXQgdjUKcHJldmlvdXNseS4gU28sIEkgd2lsbCBzZW5k
IG91dCB2NSBzb29uLgpUaGFua3MhCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vb3BlbnNiaQo=
