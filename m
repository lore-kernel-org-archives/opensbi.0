Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC9EFEA801
	for <opensbi@archiver.kernel.org>; Wed, 25 Mar 2026 03:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pR/0ej6a6CF+GSsGhYywBNb+twCODKrTBjEKjSjo2O8=; b=plMH+x3xAp4q6U
	l9U3fNUUgtuUIJMuMoE3Pyv2ejQ5BjVjJUlYPqvpOwKQoAvV+OKuDG7a/qMc17OGiyk2UTv0bOpBr
	0ZmQ1ksMnnJh9NWzMxBgeWSed5z3CHQpVLaAQ4BeLIqCmMYl+ZSCX8R5katEfx9U8VwVS2SkJT1P7
	OYQNZiLPKlySwt405k6EOY5FJFqddof/umwx7rMNYa06fwNUf8tDqJeuJOIYkiwTR6WQseWNz06uK
	R1x0KuqbI4A/mjH50C9CDMTzfVgILQxPHg0N7x7TgEDdRIRtzrGF85ko4j7hhB2eTH9jIblEH412t
	nDJ4fI03KqKI7WkbUQCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Esn-00000002bJn-2lR1;
	Wed, 25 Mar 2026 03:26:13 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Esk-00000002bJR-3Rb8
	for opensbi@lists.infradead.org;
	Wed, 25 Mar 2026 03:26:12 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-64edb56b70cso1343622d50.1
        for <opensbi@lists.infradead.org>; Tue, 24 Mar 2026 20:26:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774409169; cv=none;
        d=google.com; s=arc-20240605;
        b=HwpugnirsxchVThcuCWLTnILPRokPTRjQevpAPOkw9d1hxSj+Og2ooNNvJIIA/FzXC
         UI8FEf1kImv2edVk/HDYLq2Rsm15GT2rh1xp0GacTI08dD6UyGnTWfJZaeuGyj8K3lzA
         QCM7Mn4s7FHlAbPnTCXR4RKM/a4/WcByZtlzByaZ1tWYtTUdl/36XNgwmpfsNullbf9d
         hnUQyUfpIrODXZXjHffp8rCsmBHAg6GMaXokCCAvlDPB0b0cxq/nSKyzCV7ixCMvlOez
         vum5hpkz7gkd/Kgj73/GuFWPyn3j/exrwmFr6JEzNZJ1kp4MT0yEdFl96s8m7lZCJAxs
         I/Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MrVcce0ok7JE793FZyGyJ/3x9PP7futgwoKTELgz9yU=;
        fh=dlp3ViTTxB8/xrEPqwyrTzbJYAHJqEN9IdxZk2p7xa0=;
        b=YA6mjTc5K0acwvNJGfvfPC1x5oHAPfNxMYf94bgrK6X/WO2WXhWI65lJvuHWSVcdAq
         AJvvG0MPl448jZKWRYaMBBLSy6ueqq/r8vMHup1ZKiKKqsoAwwAqJ4W9STN4+gF5/KIL
         wCSgEKzjfLwW15g00N+xcfpD1YZt9kShlcy1tBnCS+2e+oy8IZ8JwBwJ7J5gJ5Ji6P/k
         XSh9xtbrRF76nvXKgjeSDihOl4Fb66tjJBlMGbhWQ52dVH1SqfqW/1P+bCod8cLZp1KJ
         /Vh4+mdCRSBGYK7yh+UU+ls+NKCdEjyrBy3Fg6eMi3h6CPOKdbBdvIKEmoVebAm11prA
         sXDg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=summations-net.20230601.gappssmtp.com; s=20230601; t=1774409169; x=1775013969; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrVcce0ok7JE793FZyGyJ/3x9PP7futgwoKTELgz9yU=;
        b=FnXFg4yFwcVCRL13JBSTIhtKYzUCXiRkU3vqvpYEXpieUEyopBTEj2ahE0yH7A5K6r
         EFXE6KdXFLVCuzS59yFhYzt9HDvUjmuIFL+pvf/AZkQ/STNk19gOyE3hIuAza4J7wZcO
         tQxqUAjX8j0CnG8rWOcQfnflxa58uoNLyljEo+9t9YA27stt6qzJmv+xrMkGgkS+wXx/
         0W9RqBB0sA5OKV+oFmsQLP7maFLXJN9nKORDlKT1YxMRNSK2JrmkGCSSc8HiH59Ngf2A
         STj3+k4Mcln3l8uRZpIZCP6Q9xMSzVVTvUDkVRph3H2eRvVVsNGJCJy/m+ZPi8ExcL4Z
         Yhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774409169; x=1775013969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MrVcce0ok7JE793FZyGyJ/3x9PP7futgwoKTELgz9yU=;
        b=RIpEC0PV23jLgrVqrjP+XfZnzs4sLKhacCOE0PdFOU+zyuqpBIIhvo+MIbajL0R4+Y
         8SGL6PE1Tu1fkjL6a0u0NwPEY0/0ZwAyk2Zrx4JW9b7cM/DtpbXoa8MrpSPqBL8hrleK
         h2+nv8nZ5zNgEn6gWkWu8Jfq8h/z71/ZMJjcnV5M+QKEF3MhvWMgxgp+HpoVS1NbNlMn
         y89xVphFlly8fKr7dy6dPXWAPInkmsJMv3z/hFF5P9J3WlLqMPKtjCuCJymZ8mDd+5Ar
         M8zSFIxGP2zEnbLamW3beuPM74Chj89A31MRW/saftLVgYueGaJWc5sgu/zRGiYonaYL
         3exQ==
X-Gm-Message-State: AOJu0Ywinr51Xa4/4x656iwdc1THW9IuMnxWnubaFFOofO5zrYPkV01y
	wu4dHSGEpn+hfJ6Q0v1qCqky9w/5dLINKb/mintBnbTiRly0dKROnho+DEVRN0t/aKJd3KJGANw
	IBHzQja9V5U2q70LhzexNLk0FLbyXYKrLlSUuA7NBwx1xCP7uTXqvHw==
X-Gm-Gg: ATEYQzxzFR9wmOiUv/9Tv//FS/U338GkpXSj1UxNY7SJl1YjT7xZPs2bV3IO32kDPDS
	0An4Qza3x3bxtoImmPfeQCJqhbnN45ayZc4cA7J4f86nRG8Nt1TQjXEMsdx0Z44opBQ++57tfAT
	Q1ZfTUfG9vRhRVnTIaLplNUCuKXgnxDtoeBxb/pmagzjbh9eltzRMBeo70tSSlnsqxhf/MaMPfR
	86o/aMtWFOOq9PMuQuNDttHkVizwsYKAjHwZjOaO63QUY1CjEgDQ5n1fJSRyXFBUozGSQ7YUV8E
	W9RC+4FCH6qjEIVXdMBFkYGbbli0TCcJ527NnYIX
X-Received: by 2002:a05:690e:4005:b0:64c:fa7f:48b8 with SMTP id
 956f58d0204a3-64ee616ec0fmr1705768d50.78.1774409169201; Tue, 24 Mar 2026
 20:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260319132232.51572-1-takumihara1226@gmail.com>
In-Reply-To: <20260319132232.51572-1-takumihara1226@gmail.com>
From: Rahul Pathak <rahul@summations.net>
Date: Wed, 25 Mar 2026 08:55:58 +0530
X-Gm-Features: AaiRm52PtJemCfn76mjp_SZdooZ9wixL6ivmL9fRGwKoq27iFdRBNV20_WvDZZU
Message-ID: <CABdD5xnMzGjyF_ssKBED_0c4=aByL8tkMGdTcRXKoivAPGitDQ@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi_domain: reject overflowing address range in check_addr_range()
To: Takumi Hara <takumihara1226@gmail.com>
Cc: opensbi@lists.infradead.org, anup@brainfault.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_202610_991043_8D590D23 
X-CRM114-Status: GOOD (  15.35  )
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

T24gVGh1LCBNYXIgMTksIDIwMjYgYXQgNjo1MuKAr1BNIFRha3VtaSBIYXJhIDx0YWt1bWloYXJh
MTIyNkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gc2JpX2RvbWFpbl9jaGVja19hZGRyX3JhbmdlKCkg
Y29tcHV0ZXMgYG1heCA9IGFkZHIgKyBzaXplYCB3aXRob3V0Cj4gY2hlY2tpbmcgZm9yIGludGVn
ZXIgb3ZlcmZsb3cuIFdoZW4gYSBjYWxsZXIgcGFzc2VzIGEgc2l6ZSBsYXJnZSBlbm91Z2gKPiB0
byB3cmFwIGFyb3VuZCAoZS5nLiBhZGRyPTB4ODAwMDAwMDAsIHNpemU9MHhGRkZGRkZGRjgwMDAw
MDAwKSwgbWF4Cj4gYmVjb21lcyBsZXNzIHRoYW4gYWRkciwgY2F1c2luZyB0aGUgd2hpbGUoYWRk
ciA8IG1heCkgdmFsaWRhdGlvbiBsb29wCj4gdG8gYmUgc2tpcHBlZCBlbnRpcmVseS4gVGhlIGZ1
bmN0aW9uIHRoZW4gcmV0dXJucyB0cnVlIHdpdGhvdXQKPiBwZXJmb3JtaW5nIGFueSBwZXJtaXNz
aW9uIGNoZWNrcy4KPgo+IFRoaXMgYWxsb3dzIGFuIFMtbW9kZSBjYWxsZXIgdG8gYnlwYXNzIGRv
bWFpbiBtZW1vcnkgcHJvdGVjdGlvbiBhbmQKPiBhY2Nlc3MgTS1tb2RlIG1lbW9yeSB0aHJvdWdo
IFNCSSBleHRlbnNpb25zIHRoYXQgdXNlIGFkZHJlc3MgcmFuZ2UKPiB2YWxpZGF0aW9uIChlLmcu
IERCQ04gY29uc29sZSB3cml0ZS9yZWFkKS4KPgo+IEFkZCBhbiBvdmVyZmxvdyBjaGVjayBhZnRl
ciBjb21wdXRpbmcgbWF4OiBpZiBzaXplIGlzIG5vbi16ZXJvIGFuZAo+IG1heCB3cmFwcGVkIHRv
IGEgdmFsdWUgPD0gYWRkciwgcmVqZWN0IHRoZSByZXF1ZXN0Lgo+Cj4gU2lnbmVkLW9mZi1ieTog
VGFrdW1pIEhhcmEgPHRha3VtaWhhcmExMjI2QGdtYWlsLmNvbT4KPiAtLS0KPiAgbGliL3NiaS9z
YmlfZG9tYWluLmMgfCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4K
PiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfZG9tYWluLmMgYi9saWIvc2JpL3NiaV9kb21haW4u
Ywo+IGluZGV4IDcwMzA4NDguLjNkZjUyMWYgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfZG9t
YWluLmMKPiArKysgYi9saWIvc2JpL3NiaV9kb21haW4uYwo+IEBAIC01MDUsNiArNTA1LDkgQEAg
Ym9vbCBzYmlfZG9tYWluX2NoZWNrX2FkZHJfcmFuZ2UoY29uc3Qgc3RydWN0IHNiaV9kb21haW4g
KmRvbSwKPiAgICAgICAgIGlmICghZG9tKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7
Cj4KPiArICAgICAgIGlmIChzaXplICYmIG1heCA8PSBhZGRyKQo+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gZmFsc2U7Cj4gKwo+ICAgICAgICAgd2hpbGUgKGFkZHIgPCBtYXgpIHsKPiAgICAgICAg
ICAgICAgICAgcmVnID0gZmluZF9yZWdpb24oZG9tLCBhZGRyKTsKPiAgICAgICAgICAgICAgICAg
aWYgKCFyZWcpCgpXaGF0IGFib3V0IHRoZSBjb25kaXRpb24gd2hlbiBwYXNzZWQgc2l6ZSBpcyAw
IGFuZCBtYXggPT0gYWRkci4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9vcGVuc2JpCg==
