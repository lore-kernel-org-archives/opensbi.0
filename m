Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25171C5B543
	for <opensbi@archiver.kernel.org>; Wed,  4 Jun 2025 13:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3uH0EOgH3Ws+vHm9wDdLANNMXNeCKThJGyS+GeeoMXw=; b=rHxPnqlVBxbmAX
	txkzwbnP8RaNH1h6PTu0ifnnwb8seyvThfMxmX2d7GBFVQ0G6oFH91FbZnY7f9tMMguOIrA45uqDn
	6Sg2z/ociTCfe+oxUTE4bAtEtYCC1HUi+iQJAXEHDzbafExY2JxmB/X/eys9ZUvejcVQm8Eg3FVtJ
	zRrUUE8tcGIXXwl+D8GjaoFOWvkXxE5v8yethA44fSnsRTqdCG4ahUJ1ij/SMKCD9e+FVAkE8WIVY
	Nxn6IJLyhm+iTyFd866M9hQ0eH9iAxg42wbYIKEQt2alkOSccoU46Yst5+yatSP8eHsclS3OtW3oT
	N/VwI2EmKNKQC5j4lKEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMoJk-0000000DTUx-41SM;
	Wed, 04 Jun 2025 13:38:08 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMoJi-0000000DTUI-1DVk
	for opensbi@lists.infradead.org;
	Wed, 04 Jun 2025 13:38:07 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-86dc3482b3dso743720241.0
        for <opensbi@lists.infradead.org>; Wed, 04 Jun 2025 06:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749044285; x=1749649085; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKPXRHAThbqC1cbP6bGcoJbdAUGBDl85P1LuNXSazx4=;
        b=j5CMpyiOxbmDHJFMV3YndvbrX74Xcfj6rl/AQPL4w3T5bpWXoqIaAz7kBpPLrs2Lq3
         cLe8O79vcP0i3pMfSFvLJuwXBKeMj/Lv2hmHQwpnpVYcCoX6PnAsWHWyBQ8C0CYmJlzH
         6/q7BoyYGQrPB0IihmNPIhfCLxh0hrCNj+WcvevA4VlbN7Rk8cVhQtpLb+37XbwUyhzj
         KYUiM+oDlwEmn3aOaPl2pLQ33J4h2bvRJJqHbnK3LNXeWZI0SU1zivsJDgaE4/mS2Wdj
         86g+HHKFeTDAlqi90naRN/rLf4uzwpIVURPN9pxpaDi8XezLQsJKQNgwtE7SToDm5uDU
         HHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749044285; x=1749649085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKPXRHAThbqC1cbP6bGcoJbdAUGBDl85P1LuNXSazx4=;
        b=bAQTHJJPXpi2zU22I/rolPMdAQTndim18GDR8W+IiP9UrRWcGHa9dWrcnLhWa04Btg
         ZT5fGzNuIbhCeHxF2dwTgyuQfrze2UDDrH1kqwPVESw9QWIx0pcln7+sw0p1EnhfqW8g
         CQxv+hymCfG9PV/40wNJBK96vtPLsLOX/x/sJlJQNW603NDLE7BRwxCPldidcwcSqMsd
         gwUUXIsEjV46gMj+xLbaDufKPOX/NiN9kWPI/M0JL5xun7z7L9zxMyH5mjJAC6Bnfrrm
         U54A2U6YdD8NxC1QfYjUT419LF2WhA5XXLZ6GTifZBmzhTJPQWq7VuzuiQrB9KjQjYQF
         s7ig==
X-Gm-Message-State: AOJu0Yzav5zSYPAVEMU6LJyZOAoqXWTDmS5YUTfvd4BLvtIpd8EvVNnO
	xOaHOCpxc9WPoqcZUvJmLVbzInDr6K10DBS4ZKc6ln9hLOBf5MaApPpp74IlXH71lWfnR4jui13
	d562F/xbI9JaK1acU7Ih93ylQclwBZjbFsxVH1XgseqqHMVt40TFX
X-Gm-Gg: ASbGncvFaA1OXE5yBaawx8RvhHTX8WTOYmMXbi8yqBf4yq89PqVh5W8KFfjf9f3DnRw
	vrAUtwo4/67n+cur1VRhgnft/yYO5AZZDouTgL684l99uSVLUBCnZkrL/tGw8a5EZSvFWKfIxUg
	4Gexp021DU33g516oyVAZ24fa8nf8hTLFl
X-Google-Smtp-Source: AGHT+IFhIrgHG2tsSNgnQgsQ+U7XzDhYVE+nhXmXvS3elbDloBJR/qvFHrrIMPQIY/iFSPEpvFZoi4yaSHJTSiXrxaY=
X-Received: by 2002:ac5:c899:0:b0:52f:a0c8:263d with SMTP id
 71dfb90a1353d-530ba2f34eemr4446329e0c.5.1749044285040; Wed, 04 Jun 2025
 06:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250527182713.527202-1-jesse@rivosinc.com> <BFD73D5A-8529-4CFD-A397-1D9780E6B3E8@ventanamicro.com>
In-Reply-To: <BFD73D5A-8529-4CFD-A397-1D9780E6B3E8@ventanamicro.com>
From: Jesse Taube <jesse@rivosinc.com>
Date: Wed, 4 Jun 2025 06:37:52 -0700
X-Gm-Features: AX0GCFvY6xXQHXbTj1R82DQKVbC5W_Znw-sYeLtcS7zkVBWCGCAl4-tpwlGqma4
Message-ID: <CALSpo=Y1OGniZNUxFUXWHnqBr5fCGzHPA0tEZA-vYLDL715D_w@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: dbtr: Fix shared memory layout
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>, 
	Charlie Jenkins <charlie@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_063806_418530_1156A87C 
X-CRM114-Status: GOOD (  19.45  )
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

T24gVHVlLCBKdW4gMywgMjAyNSBhdCA4OjM14oCvUE0gSGltYW5zaHUgQ2hhdWhhbgo8aGNoYXVo
YW5AdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gPiBPbiAyNyBNYXkgMjAyNSwgYXQg
MTE6NTfigK9QTSwgSmVzc2UgVGF1YmUgPGplc3NlQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPgo+
ID4gVGhlIGV4aXN0aW5nIHNiaV9kYnRyX3NobWVtX2VudHJ5IGhhcyBhIHNpemUgb2YgNSAqIFhM
RU4gd2l0aCB0aGUgZmluYWwKPiA+IGVudHJ5IGJlaW5nIGlkeC4gVGhpcyBpcyBpbiBjb250cmFz
dCB0byB0aGUgU0JJIHYzLjAtcmM3IENoYXB0ZXIgMTkuCj4gPiBEZWJ1ZyBUcmlnZ2VycyBFeHRl
bnNpb24gWzBdIHdoZXJlIGlkeCBhbmQgdHJpZ19zdGF0ZSBzaGFyZSB0aGUgc2FtZQo+ID4gb2Zm
c2V0ICgwKSBpbiBzaGFyZWQgbWVtb3J5LCB3aXRoIGEgdG90YWwgc2l6ZSBvZiA0ICogWExFTiBm
b3IgYWxsIHRoZQo+ID4gU0JJIGNhbGxzLgo+ID4KPiA+IEFkZCB1bmlvbiB0byBtYXRjaCBtZW1v
cnkgbGF5b3V0IGRlc2NyaWJlZCBpbiBTQkkuCj4gPgo+ID4gWzBdIGh0dHBzOi8vZ2l0aHViLmNv
bS9yaXNjdi1ub24taXNhL3Jpc2N2LXNiaS1kb2MvdHJlZS92My4wLXJjNy9zcmMvZXh0LWRlYnVn
LXRyaWdnZXJzLmFkb2MKPiA+Cj4gPiBGaXhlczogOTdmMjM0ZjE1Yzk2ICgibGliOiBzYmk6IElu
dHJvZHVjZSB0aGUgU0JJIGRlYnVnIHRyaWdnZXJzIGV4dGVuc2lvbiBzdXBwb3J0IikKPiA+IFNp
Z25lZC1vZmYtYnk6IEplc3NlIFRhdWJlIDxqZXNzZUByaXZvc2luYy5jb20+Cj4gPiAtLS0KPiA+
IGluY2x1ZGUvc2JpL3NiaV9kYnRyLmggfCA2ICsrKystLQo+ID4gMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9zYmkvc2JpX2RidHIuaCBiL2luY2x1ZGUvc2JpL3NiaV9kYnRyLmgKPiA+IGluZGV4IGE4YjNh
MDIuLjhjYjc3NmMgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfZGJ0ci5oCj4gPiAr
KysgYi9pbmNsdWRlL3NiaS9zYmlfZGJ0ci5oCj4gPiBAQCAtOTEsOCArOTEsMTAgQEAgc3RydWN0
IHNiaV9kYnRyX2hhcnRfdHJpZ2dlcnNfc3RhdGUgewo+ID4KPiA+IC8qKiBTQkkgc2hhcmVkIG1l
bSBtZXNzYWdlcyBsYXlvdXQgKi8KPiA+IHN0cnVjdCBzYmlfZGJ0cl9zaG1lbV9lbnRyeSB7Cj4g
PiAtIHN0cnVjdCBzYmlfZGJ0cl9kYXRhX21zZyBkYXRhOwo+ID4gLSBzdHJ1Y3Qgc2JpX2RidHJf
aWRfbXNnIGlkOwo+ID4gKyB1bmlvbiB7Cj4KPiBJIHRoaW5rIGJldHRlciB0byBoYXZlIGp1c3Qg
dGhlIHVuaW9uIGluc3RlYWQgb2YgdW5pb24gaW5zaWRlIHRoZSBzdHJ1Y3R1cmUgc2luY2UgaXQg
aXMgY29udHJvbGxlZCBieSB0aGUgU0JJIHNwZWMuCgpBZ3JlZWQuIEkgYWRkZWQgYW4gYW5vbnlt
b3VzIHVuaW9uIGFzIGl0IHdhcyBhIDYgbGluZSBjaGFuZ2UgdnMgNTAgbGluZXMuCgpUaGFua3Ms
Ckplc3NlIFRhdWJlCgo+Cj4gUmVnYXJkcwo+IEhpbWFuc2h1Cj4KPgo+ID4gKyBzdHJ1Y3Qgc2Jp
X2RidHJfZGF0YV9tc2cgZGF0YTsKPiA+ICsgc3RydWN0IHNiaV9kYnRyX2lkX21zZyBpZDsKPiA+
ICsgfTsKPiA+IH07Cj4gPgo+ID4gI2RlZmluZSBTQklfREJUUl9TSE1FTV9BTElHTl9NQVNLICgo
X19yaXNjdl94bGVuIC8gOCkgLSAxKQo+ID4gLS0KPiA+IDIuNDMuMAo+ID4KPgoKLS0gCm9wZW5z
YmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
