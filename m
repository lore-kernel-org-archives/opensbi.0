Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FE9C7115A
	for <opensbi@archiver.kernel.org>; Mon, 16 Jun 2025 06:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=egTnSp6uliMmdSXIrLYmtCjWepHSyI0HMbAtibXiFog=; b=ytctXUWQZe9Y6C
	baj5QbTE3afDXKG08MMZ4wNxaeqWMIO++GDviNoQAm73eGBvvlvdpQ3M1AW4tY0PAlor5V4ti+6l0
	lYpoHP79531Wvf+3NvtN/Dyg3enqWCI3uvvhqoHU/RM9uAd2wCbw8U4Akyq37BV0wemTxx3kXP9i/
	KKSJf0TmqGrPPH8ijDx3kJ9jUKSEno30vJm/wJDCr694u1Efgqdnxa0cyuZjRcAZqYPDId5g/XzFe
	Rdfo/e/4sjl2DixInFBkT4tpU8tnIRWVx4WmBc4gHDt7ezG+Bu0iaQof1a6ohJIWRqIakKTB7LojH
	joilp9tlUjbiqs+y8eOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR2uL-00000003T6l-0cYD;
	Mon, 16 Jun 2025 06:01:25 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR1ia-00000003Mkv-2HpF
	for opensbi@lists.infradead.org;
	Mon, 16 Jun 2025 04:45:13 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3ddd68aeb4fso38516785ab.2
        for <opensbi@lists.infradead.org>; Sun, 15 Jun 2025 21:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1750049111; x=1750653911; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Eqd0PC1NvGYRhBEPLueWKgdwS7lr5t2ed1cA12kJEY=;
        b=v27iXjYf5bOivopqBvvOWGbRsR6327ZRZztH8g4A7SF6QUjxXzCwIBApRAkrXi7fKi
         VZ3LNW7XlKv1ql1wSnIGA1qYYn6do2HyLmOuEu/Ah7aryEUrcaSqJqhXzhPtf6y9WKb6
         Ymch4LN/fw/Geru1ohgeu9DOi7lQIdXwitG8/2vOQuuEcKRYMQ6O5AQDDJmnOm1iGm2P
         NoNcHQd9tYq2WTiRKAgpqwQxnx3wlFlCKQY+4Mj7BxNZbyUsVVzbc/jzJNvvTGW1XODV
         X7J++O6aRKow2sAVObCkXtY0UG8v51qhd9QzoiyVpULgd7xRJERCA06u7pdVtAGQFAye
         eefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750049111; x=1750653911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Eqd0PC1NvGYRhBEPLueWKgdwS7lr5t2ed1cA12kJEY=;
        b=gTqtLARzCW0AAIzNE4EVWqkt1nnLWgiyW5lwEpjcctOLEdVFHIheTqBEF2EQlZpaPj
         7wq2/x11Yc5FRwuWRKlggYL6ElzkVve9hQq88d98hJKQUkRjToinXHL3gkEDSHEuAEQp
         h7rE46Iy+ukFxrZsFND/UyKdd34F6B6lPCdPdH0gAe87TlZvSjJVmya0cF3OPK7wQ3y7
         qotCrGfy+n59JI/kqJ6CGtxDjysc4FX/a6x8K/ogZlCjIa/TpQlpUH5+Pzyw88rluwg9
         kCInwYGLWYUMqgx1Q6L9LU9ELhCmpL6Ge9XDjj5yG4Q8iwFXzBODhsM04igbYbgkMk66
         tN8w==
X-Gm-Message-State: AOJu0YzfTzMSY8wIWIqxCSO99XNam+XqC8n0Xi9Pwdi4bDYlJ4awp6vn
	G6Fk06bhA+qH1zVMaUBZY2+4/Qw6UMLh/oCMynuiFsvrfWeIUAZl8qzcFPqvEy7cZULofw5g2z1
	FT6R749lKWzGUqxyHN3KBlwo1Z50Mi4erzxmQ6bUDbA==
X-Gm-Gg: ASbGncuNBkRAxL28MYq+fIvRPA+rPX2WvIrwiUvZjYMax9ZxKN7i07izgsqpaL405Wb
	uSMdFG2o16rUFEENcRAUQyAvoF5KyHDGlFVRXjtg5gkydzRLWyZvYC5PqwCfcgfoMyVJsB7BdUJ
	Nur2iKKJlXE0+PWH8UxZDZ7juj83G6L0UGpe9vMYT1s/qlMw==
X-Google-Smtp-Source: AGHT+IHIFl24CLgWaJNwHEwsZ+1UA9qtXObyHi+p2DHqXRPR4i8qokBoqFlIrBfe2SxQunuYLY4oga4b4x3BD+jiRcY=
X-Received: by 2002:a05:6e02:330e:b0:3dd:cdf2:fea4 with SMTP id
 e9e14a558f8ab-3de07cc010amr81041595ab.14.1750049111656; Sun, 15 Jun 2025
 21:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250604135225.842241-1-jesse@rivosinc.com>
In-Reply-To: <20250604135225.842241-1-jesse@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 16 Jun 2025 10:15:00 +0530
X-Gm-Features: AX0GCFv4HFKdLqbcIa32YO34Pyk13YOlKTjOiXUaM1VWW1sNJlFDrn9gIuipqYY
Message-ID: <CAAhSdy2nDZdto+3eqZ3yrDaKDMV1dn0z2YnfvDDNbz_ZrZ08Sw@mail.gmail.com>
Subject: Re: [PATCH v2] lib: sbi: dbtr: Fix shared memory layout
To: Jesse Taube <jesse@rivosinc.com>
Cc: opensbi@lists.infradead.org, Himanshu Chauhan <hchauhan@ventanamicro.com>, 
	Charlie Jenkins <charlie@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_214512_703073_4D0C3482 
X-CRM114-Status: GOOD (  16.52  )
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

T24gV2VkLCBKdW4gNCwgMjAyNSBhdCA3OjIy4oCvUE0gSmVzc2UgVGF1YmUgPGplc3NlQHJpdm9z
aW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGUgZXhpc3Rpbmcgc2JpX2RidHJfc2htZW1fZW50cnkgaGFz
IGEgc2l6ZSBvZiA1ICogWExFTiB3aXRoIHRoZSBmaW5hbAo+IGVudHJ5IGJlaW5nIGlkeC4gVGhp
cyBpcyBpbiBjb250cmFzdCB0byB0aGUgU0JJIHYzLjAtcmM3IENoYXB0ZXIgMTkuCj4gRGVidWcg
VHJpZ2dlcnMgRXh0ZW5zaW9uIFswXSB3aGVyZSBpZHggYW5kIHRyaWdfc3RhdGUgc2hhcmUgdGhl
IHNhbWUKPiBvZmZzZXQgKDApIGluIHNoYXJlZCBtZW1vcnksIHdpdGggYSB0b3RhbCBzaXplIG9m
IDQgKiBYTEVOIGZvciBhbGwgdGhlCj4gU0JJIGNhbGxzLgo+Cj4gUmVwbGFjZSBzdHJ1Y3Qgd2l0
aCB1bmlvbiB0byBtYXRjaCBtZW1vcnkgbGF5b3V0IGRlc2NyaWJlZCBpbiBTQkkuCj4KPiBbMF0g
aHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3Ytc2JpLWRvYy90cmVlL3YzLjAt
cmM3L3NyYy9leHQtZGVidWctdHJpZ2dlcnMuYWRvYwo+Cj4gRml4ZXM6IDk3ZjIzNGYxNWM5NiAo
ImxpYjogc2JpOiBJbnRyb2R1Y2UgdGhlIFNCSSBkZWJ1ZyB0cmlnZ2VycyBleHRlbnNpb24gc3Vw
cG9ydCIpCj4gU2lnbmVkLW9mZi1ieTogSmVzc2UgVGF1YmUgPGplc3NlQHJpdm9zaW5jLmNvbT4K
CkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtzLApB
bnVwCgo+IC0tLQo+IFYxIC0+IFYyOgo+ICAtIFJlbW92ZSBhbm9ueW1vdXMgdW5pb24KPiAgLSBS
ZXBsYWNlIHN0cnVjdCB3aXRoIHVuaW9uCj4gIC0gVXBkYXRlIGNvbW1pdCBkZXNjcmlwdGlvbgo+
IC0tLQo+ICBpbmNsdWRlL3NiaS9zYmlfZGJ0ci5oIHwgMiArLQo+ICBsaWIvc2JpL3NiaV9kYnRy
LmMgICAgIHwgNiArKystLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2JpX2RidHIuaCBiL2lu
Y2x1ZGUvc2JpL3NiaV9kYnRyLmgKPiBpbmRleCBhOGIzYTAyLi45Yjg3OTY4IDEwMDY0NAo+IC0t
LSBhL2luY2x1ZGUvc2JpL3NiaV9kYnRyLmgKPiArKysgYi9pbmNsdWRlL3NiaS9zYmlfZGJ0ci5o
Cj4gQEAgLTkwLDcgKzkwLDcgQEAgc3RydWN0IHNiaV9kYnRyX2hhcnRfdHJpZ2dlcnNfc3RhdGUg
ewo+ICAgICAgICAgfXdoaWxlICgwKTsKPgo+ICAvKiogU0JJIHNoYXJlZCBtZW0gbWVzc2FnZXMg
bGF5b3V0ICovCj4gLXN0cnVjdCBzYmlfZGJ0cl9zaG1lbV9lbnRyeSB7Cj4gK3VuaW9uIHNiaV9k
YnRyX3NobWVtX2VudHJ5IHsKPiAgICAgICAgIHN0cnVjdCBzYmlfZGJ0cl9kYXRhX21zZyBkYXRh
Owo+ICAgICAgICAgc3RydWN0IHNiaV9kYnRyX2lkX21zZyBpZDsKPiAgfTsKPiBkaWZmIC0tZ2l0
IGEvbGliL3NiaS9zYmlfZGJ0ci5jIGIvbGliL3NiaS9zYmlfZGJ0ci5jCj4gaW5kZXggZjBlOTEy
OC4uY2ZiNmIyYSAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9kYnRyLmMKPiArKysgYi9saWIv
c2JpL3NiaV9kYnRyLmMKPiBAQCAtNTA2LDcgKzUwNiw3IEBAIGludCBzYmlfZGJ0cl9yZWFkX3Ry
aWcodW5zaWduZWQgbG9uZyBzbW9kZSwKPiAgewo+ICAgICAgICAgc3RydWN0IHNiaV9kYnRyX2Rh
dGFfbXNnICp4bWl0Owo+ICAgICAgICAgc3RydWN0IHNiaV9kYnRyX3RyaWdnZXIgKnRyaWc7Cj4g
LSAgICAgICBzdHJ1Y3Qgc2JpX2RidHJfc2htZW1fZW50cnkgKmVudHJ5Owo+ICsgICAgICAgdW5p
b24gc2JpX2RidHJfc2htZW1fZW50cnkgKmVudHJ5Owo+ICAgICAgICAgdm9pZCAqc2htZW1fYmFz
ZSA9IE5VTEw7Cj4gICAgICAgICBzdHJ1Y3Qgc2JpX2RidHJfaGFydF90cmlnZ2Vyc19zdGF0ZSAq
aHMgPSBOVUxMOwo+Cj4gQEAgLTU0MSw3ICs1NDEsNyBAQCBpbnQgc2JpX2RidHJfaW5zdGFsbF90
cmlnKHVuc2lnbmVkIGxvbmcgc21vZGUsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBsb25nIHRyaWdfY291bnQsIHVuc2lnbmVkIGxvbmcgKm91dCkKPiAgewo+ICAgICAgICAg
dm9pZCAqc2htZW1fYmFzZSA9IE5VTEw7Cj4gLSAgICAgICBzdHJ1Y3Qgc2JpX2RidHJfc2htZW1f
ZW50cnkgKmVudHJ5Owo+ICsgICAgICAgdW5pb24gc2JpX2RidHJfc2htZW1fZW50cnkgKmVudHJ5
Owo+ICAgICAgICAgc3RydWN0IHNiaV9kYnRyX2RhdGFfbXNnICpyZWN2Owo+ICAgICAgICAgc3Ry
dWN0IHNiaV9kYnRyX2lkX21zZyAqeG1pdDsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgY3RybDsK
PiBAQCAtNjU5LDcgKzY1OSw3IEBAIGludCBzYmlfZGJ0cl91cGRhdGVfdHJpZyh1bnNpZ25lZCBs
b25nIHNtb2RlLAo+ICAgICAgICAgc3RydWN0IHNiaV9kYnRyX2RhdGFfbXNnICpyZWN2Owo+ICAg
ICAgICAgdW5zaWduZWQgbG9uZyB1aWR4ID0gMDsKPiAgICAgICAgIHN0cnVjdCBzYmlfZGJ0cl90
cmlnZ2VyICp0cmlnOwo+IC0gICAgICAgc3RydWN0IHNiaV9kYnRyX3NobWVtX2VudHJ5ICplbnRy
eTsKPiArICAgICAgIHVuaW9uIHNiaV9kYnRyX3NobWVtX2VudHJ5ICplbnRyeTsKPiAgICAgICAg
IHZvaWQgKnNobWVtX2Jhc2UgPSBOVUxMOwo+ICAgICAgICAgc3RydWN0IHNiaV9kYnRyX2hhcnRf
dHJpZ2dlcnNfc3RhdGUgKmhzID0gTlVMTDsKPgo+IC0tCj4gMi40My4wCj4KCi0tIApvcGVuc2Jp
IG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
