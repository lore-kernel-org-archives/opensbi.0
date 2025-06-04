Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C9CC5B549
	for <opensbi@archiver.kernel.org>; Wed,  4 Jun 2025 04:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLT9zlxA2Ae3LwubHk5MPLmu/nTPOC0OU8BR2HpAbSE=; b=TXQ96yBtrwU5Ja
	4aaQSZ2YKFy5DYvnMm21pHpfrdG+rFZfs7MikPLfNmwh3tlVnTAVkgd9mJpXccDUtUfsTFKqavnQx
	cx3ZvBm768Osojxg+/rANQXN4pKqI3zzCY31B69cU3sPdrkLsIt/kCets2+UEMjnbCvd3NE0XGFWZ
	rccaKYIzwSmSig37Ob9EGtEbf4BHZzojkiqy93DUsok6fMGFZq8QwGAp449jPnYUH7xL7jauzVQG9
	uCOJlZV8ljMwPGSl8uVoNO0+aIdoAC3u0R9IsDWhQFed6VZjP8WwOjNXaELEYZeT+XzxeMA8fEQOG
	Ok/z3e/LNMgX3E2BtYRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMfhT-0000000CYXn-2xeJ;
	Wed, 04 Jun 2025 04:26:03 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMeur-0000000CSVr-1rfE
	for opensbi@lists.infradead.org;
	Wed, 04 Jun 2025 03:35:50 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-742af848148so4197885b3a.1
        for <opensbi@lists.infradead.org>; Tue, 03 Jun 2025 20:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749008148; x=1749612948; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7gnaOB6TTQKeOQXkaIfSCPfkZdZGAkj+Dwujgriw/o=;
        b=QHMn1D05AeApfv878zeCeAXVE22BVApddn/csCHAkenjJOY+sj5pn5go8gcZlgbTL3
         u57HLU3t82WmsScZzn7Q/qnZsml1Iv1ZwjEjxr52H0ShSHZVpilTgLU5aHq+lmgD/FHO
         D+walj+EihzqnYlDTiY8Hs5wmlGRmbuYtTiDx5yD/o5lDxFkCtVdenSJiMS46x2spxiw
         rWU2OC4uUXjBYYHzP2jZgway+kQ521cLZsW+15rdgCQAy1Vh8+wf2dx2+nrSFV8GEj/0
         egydnvsKQk12nDxO9M0ZaJ2adWQWOdkgAuvFYWPHFR9pQZ1L6MmswaSf/bJ02gcqstgg
         L4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749008148; x=1749612948;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7gnaOB6TTQKeOQXkaIfSCPfkZdZGAkj+Dwujgriw/o=;
        b=qm6u/g4woJDljm5oL+jiRyD9C/xiqhqZc+szsoXcy+NQYsx37LYm5uWekoPMgkXjM1
         D9l6su7SCAKjox1DaJnbujBsI0qbMnd8alS8NOjrs+lb6lyQBUyF4jMuArtj2L22KJo7
         FWScYLHvmwfQg2Oz3naEq0tdoVl+q50Uc7i/R0kRT2vpR39oSwu+IUQM9WE/F5SfI6rY
         1Oxce4aCKhKOC25yk1bnyRCB5ucf/+QeGROMACRejyCF7uraz7HFieosgTs2EWVzUldg
         k/P1lq8+wNP/KC4vQdQDUNcLE4G/oHZVWTknE5vq8smbj86r9OSZ7iF/CBmYkHp3MOFU
         ZVeg==
X-Gm-Message-State: AOJu0YzNw1k7B7nQ8d9WwfbO9ABvh77iLnGKeQMXcr7eO9/SMVS1high
	b7+NyYx7t9CJHcgNr/2pvoK9qWOP2FgOnLIwdJ99hXh5s5C/l4leoPgX+j5Nc/OH3zVzFpKb8tl
	6X0q5
X-Gm-Gg: ASbGncvaZEoYOcFJfI9DyAPFYocvv0j98B0tS1Rzl0MVXuLcPE7TqHnKllzQ2EaRu+u
	9B61/W4wPc5qQN+vDoG9hBzz0hibJXyLTa/EbRBZcqpwYGgpFvGHxdSlbN6RIlGZn0xL8iROLKT
	VzYaM/6XXkLu68zIwvEJX7WzufC7VCQ3HJ6cqb2hLuyG36UJisNTKlZc+5Mry6nRSqoVBRFhNKH
	sCp99BAWO5cJNmLNxifBgUzeQg5549IM1+FJaQOAqXU7SFAJbBohf3C80ZcGeRHApU3Ut6sygPC
	zVxi9xa3/3JcyokLqzQXzS7UxAIxv8IXxxoFttwsRLMQHwqy0i/93z1I8Y+Hq6RJ0HNaJEQ=
X-Google-Smtp-Source: AGHT+IFQvGVOIbuYZ5y0jPs+VGYe7nHm9bKLy/ciZ14eLIzcqSEx2nVA5fpSXQeH9OXTM/Xjmbx2AA==
X-Received: by 2002:a05:6a21:6da0:b0:215:e818:9fe5 with SMTP id adf61e73a8af0-21d22c0ed97mr1873922637.18.1749008148216;
        Tue, 03 Jun 2025 20:35:48 -0700 (PDT)
Received: from smtpclient.apple ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affd4398sm10464103b3a.134.2025.06.03.20.35.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Jun 2025 20:35:47 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] lib: sbi: dbtr: Fix shared memory layout
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
In-Reply-To: <20250527182713.527202-1-jesse@rivosinc.com>
Date: Wed, 4 Jun 2025 09:05:34 +0530
Cc: opensbi@lists.infradead.org,
 Anup Patel <anup@brainfault.org>,
 Charlie Jenkins <charlie@rivosinc.com>
Message-Id: <BFD73D5A-8529-4CFD-A397-1D9780E6B3E8@ventanamicro.com>
References: <20250527182713.527202-1-jesse@rivosinc.com>
To: Jesse Taube <jesse@rivosinc.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_203549_487227_2D667815 
X-CRM114-Status: GOOD (  18.09  )
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

Cgo+IE9uIDI3IE1heSAyMDI1LCBhdCAxMTo1N+KAr1BNLCBKZXNzZSBUYXViZSA8amVzc2VAcml2
b3NpbmMuY29tPiB3cm90ZToKPiAKPiBUaGUgZXhpc3Rpbmcgc2JpX2RidHJfc2htZW1fZW50cnkg
aGFzIGEgc2l6ZSBvZiA1ICogWExFTiB3aXRoIHRoZSBmaW5hbAo+IGVudHJ5IGJlaW5nIGlkeC4g
VGhpcyBpcyBpbiBjb250cmFzdCB0byB0aGUgU0JJIHYzLjAtcmM3IENoYXB0ZXIgMTkuCj4gRGVi
dWcgVHJpZ2dlcnMgRXh0ZW5zaW9uIFswXSB3aGVyZSBpZHggYW5kIHRyaWdfc3RhdGUgc2hhcmUg
dGhlIHNhbWUKPiBvZmZzZXQgKDApIGluIHNoYXJlZCBtZW1vcnksIHdpdGggYSB0b3RhbCBzaXpl
IG9mIDQgKiBYTEVOIGZvciBhbGwgdGhlCj4gU0JJIGNhbGxzLgo+IAo+IEFkZCB1bmlvbiB0byBt
YXRjaCBtZW1vcnkgbGF5b3V0IGRlc2NyaWJlZCBpbiBTQkkuCj4gCj4gWzBdIGh0dHBzOi8vZ2l0
aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LXNiaS1kb2MvdHJlZS92My4wLXJjNy9zcmMvZXh0
LWRlYnVnLXRyaWdnZXJzLmFkb2MKPiAKPiBGaXhlczogOTdmMjM0ZjE1Yzk2ICgibGliOiBzYmk6
IEludHJvZHVjZSB0aGUgU0JJIGRlYnVnIHRyaWdnZXJzIGV4dGVuc2lvbiBzdXBwb3J0IikKPiBT
aWduZWQtb2ZmLWJ5OiBKZXNzZSBUYXViZSA8amVzc2VAcml2b3NpbmMuY29tPgo+IC0tLQo+IGlu
Y2x1ZGUvc2JpL3NiaV9kYnRyLmggfCA2ICsrKystLQo+IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3Ni
aV9kYnRyLmggYi9pbmNsdWRlL3NiaS9zYmlfZGJ0ci5oCj4gaW5kZXggYThiM2EwMi4uOGNiNzc2
YyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfZGJ0ci5oCj4gKysrIGIvaW5jbHVkZS9z
Ymkvc2JpX2RidHIuaAo+IEBAIC05MSw4ICs5MSwxMCBAQCBzdHJ1Y3Qgc2JpX2RidHJfaGFydF90
cmlnZ2Vyc19zdGF0ZSB7Cj4gCj4gLyoqIFNCSSBzaGFyZWQgbWVtIG1lc3NhZ2VzIGxheW91dCAq
Lwo+IHN0cnVjdCBzYmlfZGJ0cl9zaG1lbV9lbnRyeSB7Cj4gLSBzdHJ1Y3Qgc2JpX2RidHJfZGF0
YV9tc2cgZGF0YTsKPiAtIHN0cnVjdCBzYmlfZGJ0cl9pZF9tc2cgaWQ7Cj4gKyB1bmlvbiB7CgpJ
IHRoaW5rIGJldHRlciB0byBoYXZlIGp1c3QgdGhlIHVuaW9uIGluc3RlYWQgb2YgdW5pb24gaW5z
aWRlIHRoZSBzdHJ1Y3R1cmUgc2luY2UgaXQgaXMgY29udHJvbGxlZCBieSB0aGUgU0JJIHNwZWMu
CgpSZWdhcmRzCkhpbWFuc2h1CgoKPiArIHN0cnVjdCBzYmlfZGJ0cl9kYXRhX21zZyBkYXRhOwo+
ICsgc3RydWN0IHNiaV9kYnRyX2lkX21zZyBpZDsKPiArIH07Cj4gfTsKPiAKPiAjZGVmaW5lIFNC
SV9EQlRSX1NITUVNX0FMSUdOX01BU0sgKChfX3Jpc2N2X3hsZW4gLyA4KSAtIDEpCj4gLS0gCj4g
Mi40My4wCj4gCgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5z
YmkK
