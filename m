Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05A0C369D5
	for <opensbi@archiver.kernel.org>; Mon, 28 Apr 2025 14:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lmmP2D2Wa2gz6bTbZ1ChVmABSITcGcCgccyW+yiqjao=; b=LMIbc205dISZPB
	Xw6hsCHO5MIANwgFCbxqHlvI0/sKmR8274pRr6Tb8UUIgk3MH12uuv1pANEjFus4tQmrRIjm0ntKN
	mB9s8Yt0Ae8NPKv93ZEnoiOkCX1rWZMUc46S+F7VYUWZ+c0nPIBzFm87BWO1dsZsktebLd0veSOoz
	14mGxU7YPKZDfRP1+ApK3heZtwj97Wi8E56RSbks/JGkGFZrxEM6egWS+/nmwKux3pH9Ltw+RTdtz
	hNKbhWzq3C494EQ9hx83gl6MUrbbp1skTnbfMuFXexHlLGIxGbSCoy2ewSTKtitPS70qaUMZrtxp6
	wNpcK65yzKhbfs0HTYNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9PHA-00000006b6j-1lhI;
	Mon, 28 Apr 2025 14:16:04 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Nhx-00000006DBo-0wNd
	for opensbi@lists.infradead.org;
	Mon, 28 Apr 2025 12:35:38 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3d940c7ea71so12695435ab.0
        for <opensbi@lists.infradead.org>; Mon, 28 Apr 2025 05:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745843736; x=1746448536; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zET11s+MEp1D6s3Cq3kIbgUWTVa8oUQPIA8juh42TU=;
        b=muoBiq0nHboiBhkpHHMoxq+7dwSAiwjiUPpgbcGyhcsc8bmNfpiIU8G+6sO/+kq14s
         sPRyigmadPlfWRDrbhqQjpg9ptsZuRbF/KlwJRxGLVPVQsXCCrIGb82imsqVvBPUopIr
         f9Q3iCTbtWLzyos5uBNAZr2WLsTt9IK10uiAt5OPjoMdcsKurQlv/e8v7ZM9yi46nK70
         mYG7xg/FTVzQ0tuDaJxH4LIqH5rkW28U2DdJs88+mFg5uPo6rI1Lfu3nM3x7jvJwywxr
         NHjsHkTY0CNrLdS4DZkA0Qm5wjpC/OiSe5deR2bPPMNuaRgnufLLa8wajCw4wtagRyFH
         wJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745843736; x=1746448536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+zET11s+MEp1D6s3Cq3kIbgUWTVa8oUQPIA8juh42TU=;
        b=kc9hJtn8cIMc9yRRz9eRERkj/ZfOPXnRsolMLX25m2LxiaDi6GZm0difbmtt+5BRIy
         CTL/6RXkHrWHW8VZPDlpJ5E32OlXRFtsCTCuqIPjGaOxf/EJqGBpqKutR6+muT7rm8cV
         rqtJ7yFaUfNVPSohb7KVuQkR3bMafoozq9YsmUu5dkOuEDg3LSWBgcd4usyOlEGsrF5W
         jk70j2f/SUMFG9rLw4tHEBJJlCERddd4Ex7YrP8PLhyu1rPAJkcI1oIL9kZkE+ERdVhS
         ZrAE1GjR125ZO2LSisMoDsmoJsZAe4wxio+4c/4/o3D5enwHr1Cj0Lkgw+0HEs2wUgjt
         w8Yw==
X-Gm-Message-State: AOJu0YwMe7oZOjYj6b3P55+N2QKMSHR0OwpPl6RI31nTgzYwgE8VwgQd
	O7vGNLZuVTBwbXohxBgx31sqNVOuQA+DzrkB9CmUzDlJS2GS5GSonDOM6fgAg1BSWPKFuhlSmyG
	+my5U+KvFqxvX4hXomQ59DxwY1kDCbu/N0fIJaR4DqCxCy/Ehb6M=
X-Gm-Gg: ASbGncvrJIGX9jVrIH4XuIR2KJb1lMykRoKPJI+oxRxAgBtgWbESrj8VhRe/AUukYv8
	IyAKyaMZlLc/6a5BdFp6dlXLpcMUsYkgvZCkMMv6eeS6OOFYAcOXXukotyl0DEC6/2ToHETp7gg
	M+F4AlkIUdZVWvnmPSkfbBFrFtKkEF5NOoKQ==
X-Google-Smtp-Source: AGHT+IGct9wk7884dgCp37ow8Z2exzCG9EG5T95kpV6z2JxB11rDiXWmPYtg+yWITheBlvIGZRxjHsnlG/CJa+ecVyQ=
X-Received: by 2002:a05:6e02:2288:b0:3d6:cd54:ba53 with SMTP id
 e9e14a558f8ab-3d942e3e305mr92531855ab.22.1745843736129; Mon, 28 Apr 2025
 05:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250415131908.2699782-2-rkrcmar@ventanamicro.com> <20250415131908.2699782-8-rkrcmar@ventanamicro.com>
In-Reply-To: <20250415131908.2699782-8-rkrcmar@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Apr 2025 18:05:24 +0530
X-Gm-Features: ATxdqUEZNNRUCFEG_xEsso_EOiGoXSf9WhQ4hIOfX4txYvXZNXMLdYgWoAObjsg
Message-ID: <CAAhSdy3AMEciyT5tY2c4szHc8SGFwy6xxYsFA+fj81jMDtGH7Q@mail.gmail.com>
Subject: Re: [PATCH 6/8] lib: sbi_hart: reset mstateen0
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_053537_263050_E8BA2BE8 
X-CRM114-Status: GOOD (  18.88  )
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

T24gVHVlLCBBcHIgMTUsIDIwMjUgYXQgODoxM+KAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21h
ckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFRoZSBjdXJyZW50IGxvZ2ljIGNsZWFycyBz
b21lIGJpdHMgYmFzZWQgb24gU0JJIGtub3duIGV4dGVuc2lvbnMuCj4gQmUgc2FmZSBhbmQgZG8g
bm90IGxlYXZlIGVuYWJsZWQgYW55dGhpbmcgdGhhdCBTQkkgZG9lc24ndCBjb250cm9sLgo+Cj4g
VGhpcyBpcyBub3QgYSBicmVha2luZyBjaGFuZ2UsIGJlY2F1c2UgdGhlIHJlZ2lzdGVyIG11c3Qg
YmUgaW5pdGlhbGl6ZWQKPiB0byAwIGJ5IHRoZSBJU0Egb24gcmVzZXQsIGJ1dCBpdCBpcyBiZXR0
ZXIgdG8gbm90IGRlcGVuZCBvbiBpdCB3aGVuIHdlCj4gZG9uJ3QgbmVlZCB0by4KPgo+IFNpZ25l
ZC1vZmYtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPgoKTEdU
TS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJk
cywKQW51cAoKPiAtLS0KPiAgbGliL3NiaS9zYmlfaGFydC5jIHwgMiArLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9saWIv
c2JpL3NiaV9oYXJ0LmMgYi9saWIvc2JpL3NiaV9oYXJ0LmMKPiBpbmRleCBiMjA5ZjFjYWIyN2Qu
LjU2OWY4MDA4YjUyMyAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9oYXJ0LmMKPiArKysgYi9s
aWIvc2JpL3NiaV9oYXJ0LmMKPiBAQCAtODksNyArODksNyBAQCBzdGF0aWMgdm9pZCBtc3RhdHVz
X2luaXQoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoKQo+ICAgICAgICAgICAgICAgICBjc3Jf
d3JpdGUoQ1NSX0hTVEFUVVMsIDApOwo+Cj4gICAgICAgICBpZiAoc2JpX2hhcnRfaGFzX2V4dGVu
c2lvbihzY3JhdGNoLCBTQklfSEFSVF9FWFRfU01TVEFURUVOKSkgewo+IC0gICAgICAgICAgICAg
ICBtc3RhdGVlbl92YWwgPSBjc3JfcmVhZDY0KENTUl9NU1RBVEVFTjApOwo+ICsgICAgICAgICAg
ICAgICBtc3RhdGVlbl92YWwgPSAwOwo+ICAgICAgICAgICAgICAgICBtc3RhdGVlbl92YWwgfD0g
U01TVEFURUVOX1NUQVRFTjsKPiAgICAgICAgICAgICAgICAgbXN0YXRlZW5fdmFsIHw9IFNNU1RB
VEVFTjBfQ09OVEVYVDsKPiAgICAgICAgICAgICAgICAgbXN0YXRlZW5fdmFsIHw9IFNNU1RBVEVF
TjBfSFNFTlZDRkc7Cj4gLS0KPiAyLjQ4LjEKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlz
dAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9w
ZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL29wZW5zYmkK
