Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EA8109878B
	for <opensbi@archiver.kernel.org>; Fri, 20 Mar 2026 14:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VSTZHcENE7sCM5jgyi6px6kNQ5nUMCQy93JE9SwdWmg=; b=FdS5TsXOjJG7Kx
	Om8QVSrTWotOt4QrUP0vhAP0EfJYnKz/TIMyUEI+RpBrk/0TBfKf8c85GXHtEn7g5lLBJRYrlhgh9
	pSQg2fjVFF3Y2vKOXiqE0SEaUWLP11gwOldEbQrogchOjR8KnwqTd6758aTyYKRxEBQEVx9zT6MJL
	th7yS/JfRWOSyFqCG2OihTH/GR2zwCouVfvPe7mmOhjRyUt51au2lFkMvChgT45Pgx6x0+/1fqSEC
	6Wo18PxS+Ul1uWEWm/b5b40AGQX68QMb0C8ypPyVK5WLderED872sgGWijKA1Ptf4x6buRnOBRySd
	ypGNpWIC16iTlOKfB57g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ars-0000000CwXw-1Nfu;
	Fri, 20 Mar 2026 14:30:28 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3arp-0000000CwW5-3oVN
	for opensbi@lists.infradead.org;
	Fri, 20 Mar 2026 14:30:27 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso18530925e9.2
        for <opensbi@lists.infradead.org>; Fri, 20 Mar 2026 07:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1774017024; x=1774621824; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IrHktZAbARMvl8w9rhATdPXu3WwH+dZUkizfjLyYE/Y=;
        b=aTCdGKR4gdkZiQN0YaLYblVbvRkhXERf+6OXZC9sxXa/9wJa4xSAXI2jarMVd8lVK3
         YnliY7HxcyzWpLLwU8wRXUPAiEBu6BPuPxbRwHQr3cfZbeYIO5h5fRte8a1Ixo+LBYp+
         6wM6i0v8xD+s9hOaGpbdY41jzox3eJGyK5O7ZYb0FyKdU9YV0fjkPou/g1RYV+TuZO/x
         Edd0iZ6M3RPId57983LAa2zykAkHp77jCp3XXsfk9NETQ196L8Hyc2hNLvlqrwEitv81
         iWR50LCYtshP42wHzmToWpnBxM9jRKw17NWo7wOGCOp6ZbVaADFCwmmWynFXKasMEoSd
         d3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774017024; x=1774621824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IrHktZAbARMvl8w9rhATdPXu3WwH+dZUkizfjLyYE/Y=;
        b=L3DcF0jgOyUsyp0+p2CGK78qJJKoyShpungL8P4784QmzJdoUkg60vfUSkziw+4bTy
         k3yz6tAtT0dQXRMOqST/ku3KLwOTPAvjUdwLRYAeW0zyAV8ChVkExziFDhUuV77Wkm8H
         V00QAzjY+ZdJvbNWG3xvbn62sUnE5YyC0tN5t4U1qgEYf+ZX1qPBBVABpeQ/ITwGAcW5
         gXRemYQnpbY1lnyFxhKCv4/C70zqTQ0ad/XaqSanleihzQeTHxxBIZfwJSi8FE6B+kr8
         /xeTxttbPxD+UWxxzhgQ/fxs0sd3Y3sOwgMBp+vWfwGO78QE124nZ/2gUyg2IET2r16S
         P+YQ==
X-Gm-Message-State: AOJu0YyMVC92G2Ok0V4npT2DTpVFTVvXl8/NYBC+pPK345QBUkTG31kq
	FOyKucgXh3MqS0hZybpzYoLrj7QkGtctewV8Hhu/voizsqjha1aeNaYtHf9U8Q1aTzA1JxbdzXC
	Zq7x3IsA=
X-Gm-Gg: ATEYQzxOfknD5fP1wvbWTEIUoagqH1X2EHL0BUspVCUCUm8c9Sg5e5erS0923JkKUhU
	qxBo5d7OYPCE+3I3tsxbvyIyQX1r7tU5+PHYd4O6KvzoKyYyEkX2pNBSmDyLmnPkFNGg+tj5Qol
	4SumxGaQFeT14rGQ1Vet56MnchugjrPFaRQ51ubvQvhhWMUosajzQ1UtKeHHnO4GUyktuPRBLPR
	wYo7nnjQ1/4AUYW3T6rah3jBl/xrDoW5QUyktKZFmNAsd6FsmrFfKGIJXkhyqlzK9RFqDrzih5e
	u7CRbAmFpqFUbbVC9xMUe8JzXXFFFn+vqo99FBVRayaSwnba0e3t2cxhLYbiy9DtxS7Ct21VBAv
	bm/q/4UFDkZjmPK03MM9bzAMtSxongZ7na/bX3mQAEVIHGKYvvUK0//K/N25jW5aGr95gOIr6vi
	EPBOCEjIreAsUB7bDMaYM1L9TllUi9KJIZ4fr0WBknBRMo6d9OMZmUQZyy2hg09OTaVRY=
X-Received: by 2002:a05:600c:a69d:b0:487:288:1198 with SMTP id 5b1f17b1804b1-487028812b5mr12835185e9.22.1774017023684;
        Fri, 20 Mar 2026 07:30:23 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff1aeafdsm16608435e9.21.2026.03.20.07.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:30:23 -0700 (PDT)
From: dave.patel@riscstar.com
To: opensbi@lists.infradead.org
Cc: Scott Bambrough <scott@riscstar.com>,
	Robin Randhawa <robin.randhawa@sifive.com>,
	Anup Patel <anup.patel@qti.qualcomm.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Dave Patel <dave.patel@riscstar.com>,
	Ray Mao <raymond.mao@riscstar.com>,
	Anup Patel <anuppate@qti.qualcomm.com>,
	Dhaval <dhaval@rivosinc.com>,
	Peter Lin <peter.lin@sifive.com>
Subject: [PATCH 2/4] lib: sbi: Add floating-point context save/restore support.
Date: Fri, 20 Mar 2026 14:30:16 +0000
Message-ID: <20260320143018.74191-3-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320143018.74191-1-dave.patel@riscstar.com>
References: <20260320143018.74191-1-dave.patel@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_073025_973590_61326652 
X-CRM114-Status: GOOD (  14.99  )
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

RnJvbTogRGF2ZSBQYXRlbCA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20+CgpBZGQgc3VwcG9ydCBm
b3Igc2F2aW5nIGFuZCByZXN0b3JpbmcgUklTQy1WIGZsb2F0aW5nLXBvaW50IChGL0QpIGV4dGVu
c2lvbgpzdGF0ZSBpbiBPcGVuU0JJLiBUaGlzIGludHJvZHVjZXMgYSBwZXItaGFydCBmbG9hdGlu
Zy1wb2ludCBjb250ZXh0CnN0cnVjdHVyZSBhbmQgaGVscGVyIHJvdXRpbmVzIHRvIHBlcmZvcm0g
ZnVsbCBjb250ZXh0IHNhdmUgYW5kIHJlc3RvcmUuCgpUaGUgZmxvYXRpbmctcG9pbnQgY29udGV4
dCBpbmNsdWRlcyBzdG9yYWdlIGZvciBhbGwgMzIgRlBpIHJlZ2lzdGVycyAoZjDigJNmMzEpCmFs
b25nIHdpdGggdGhlIGZjc3IgY29udHJvbCBhbmQgc3RhdHVzIHJlZ2lzdGVyLiBUaGUgcmVnaXN0
ZXIgc3RhdGUgaXMgc2F2ZWQKYW5kIHJlc3RvcmVkIHVzaW5nIGRvdWJsZS1wcmVjaXNpb24gbG9h
ZC9zdG9yZSBpbnN0cnVjdGlvbnMgKGZzZC9mbGQpLAphc3N1bWluZyBhbiBSVjY0IHN5c3RlbSB3
aXRoIEQtZXh0ZW5zaW9uIHN1cHBvcnQuCgpUaGUgaW1wbGVtZW50YXRpb24gZm9sbG93cyBhbiBl
YWdlciBjb250ZXh0IHN3aXRjaGluZyBtb2RlbCB3aGVyZSB0aGUgZW50aXJlCkZQIHN0YXRlIGlz
IHNhdmVkIGFuZCByZXN0b3JlZCBvbiBldmVyeSBjb250ZXh0IHN3aXRjaC4gVGhpcyBhdm9pZHMg
dGhlIG5lZWQKZm9yIHRyYXAtYmFzZWQgbGF6eSBtYW5hZ2VtZW50IGFuZCBrZWVwcyB0aGUgZGVz
aWduIHNpbXBsZSBhbmQgZGV0ZXJtaW5pc3RpYy4KCkEgcGVyLWhhcnQgcG9pbnRlciBpcyB1c2Vk
IHRvIHRyYWNrIHRoZSBjdXJyZW50IGZsb2F0aW5nLXBvaW50IGNvbnRleHQgb3duZXIuCgpOb3Rl
czoKLSBUaGUgaW1wbGVtZW50YXRpb24gYXNzdW1lcyB0aGUgZmxvYXRpbmctcG9pbnQgdW5pdCBp
cyBlbmFibGVkCihtc3RhdHVzLkZTICE9IE9mZikgd2hlbiBpbnZva2VkLgotIFRoZSBjb250ZXh0
IGxheW91dCBpcyBmaXhlZCB0byA2NC1iaXQgRlAgcmVnaXN0ZXJzLgoKU2lnbmVkLW9mZi1ieTog
RGF2ZSBQYXRlbCA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20+IgotLS0KIGluY2x1ZGUvc2JpL3Ni
aV9mcC5oIHwgIDIyICsrKysrKysrCiBsaWIvc2JpL29iamVjdHMubWsgICB8ICAgMSArCiBsaWIv
c2JpL3NiaV9mcC5jICAgICB8IDExNyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDE0MCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgaW5jbHVkZS9zYmkvc2JpX2ZwLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIvc2Jp
L3NiaV9mcC5jCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2JpX2ZwLmggYi9pbmNsdWRlL3Ni
aS9zYmlfZnAuaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMC4uNThjNWI1MGUK
LS0tIC9kZXYvbnVsbAorKysgYi9pbmNsdWRlL3NiaS9zYmlfZnAuaApAQCAtMCwwICsxLDIyIEBA
CisvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAorICoKKyAqIENvcHlyaWdodCAo
YykgMjAyNiBSSVNDc3RhciBTb2x1dGlvbnMuCisgKgorICogQXV0aG9yczoKKyAqICAgICBEYXZl
IFBhdGVsIDxkYXZlLnBhdGVsQHJpc2NzdGFyLmNvbT4KKyAqLworCisjaWZuZGVmIF9fU0JJX0ZQ
X0hfXworI2RlZmluZSBfX1NCSV9GUF9IX18KKworc3RydWN0IHNiaV9mcF9jb250ZXh0IHsKKyAg
ICB1bnNpZ25lZCBsb25nIGZbMzJdOworICAgIHVuc2lnbmVkIGxvbmcgZmNzcjsKK307CisKK3N0
cnVjdCBzYmlfZnBfY29udGV4dCAqc2JpX2N1cnJlbnRfZnBfY29udGV4dCh2b2lkKTsKK3ZvaWQg
c2JpX2ZwX3NhdmUoc3RydWN0IHNiaV9mcF9jb250ZXh0ICpkc3QpOwordm9pZCBzYmlfZnBfcmVz
dG9yZShjb25zdCBzdHJ1Y3Qgc2JpX2ZwX2NvbnRleHQgKnNyYyk7CisKKyNlbmRpZiAvL19fU0JJ
X1ZFQ1RPUl9IX18KKwpkaWZmIC0tZ2l0IGEvbGliL3NiaS9vYmplY3RzLm1rIGIvbGliL3NiaS9v
YmplY3RzLm1rCmluZGV4IDVjMGNhZjM5Li5jYTU2MGMyZSAxMDA2NDQKLS0tIGEvbGliL3NiaS9v
YmplY3RzLm1rCisrKyBiL2xpYi9zYmkvb2JqZWN0cy5tawpAQCAtMTA3LDMgKzEwNyw0IEBAIGxp
YnNiaS1vYmpzLXkgKz0gc2JpX3VucHJpdi5vCiBsaWJzYmktb2Jqcy15ICs9IHNiaV9leHBlY3Rl
ZF90cmFwLm8KIGxpYnNiaS1vYmpzLXkgKz0gc2JpX2NwcGMubwogbGlic2JpLW9ianMteSArPSBz
YmlfdmVjdG9yLm8KK2xpYnNiaS1vYmpzLXkgKz0gc2JpX2ZwLm8KZGlmZiAtLWdpdCBhL2xpYi9z
Ymkvc2JpX2ZwLmMgYi9saWIvc2JpL3NiaV9mcC5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwLi40ZDVlMGY2OAotLS0gL2Rldi9udWxsCisrKyBiL2xpYi9zYmkvc2JpX2ZwLmMK
QEAgLTAsMCArMSwxMTcgQEAKKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCisg
KgorICogQ29weXJpZ2h0IChjKSAyMDI2IFJJU0NzdGFyIFNvbHV0aW9ucy4KKyAqCisgKiBBdXRo
b3JzOgorICogICAgIERhdmUgUGF0ZWwgPGRhdmUucGF0ZWxAcmlzY3N0YXIuY29tPgorICovCisK
KyNpbmNsdWRlIDxzYmkvcmlzY3ZfYXNtLmg+CisjaW5jbHVkZSA8c2JpL3Jpc2N2X2VuY29kaW5n
Lmg+CisjaW5jbHVkZSA8c2JpL3NiaV9zY3JhdGNoLmg+CisjaW5jbHVkZSA8c2JpL3NiaV9mcC5o
PgorCisvKiBQZXItaGFydCBjdXJyZW50IG93bmVyIHBvaW50ZXIgKFNNUC1zYWZlKSAqLworc3Rh
dGljIGlubGluZSBzdHJ1Y3Qgc2JpX2ZwX2NvbnRleHQgKipmcF9vd25lcl9wdHIodm9pZCkKK3sK
KyAgICBzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2ggPSBzYmlfc2NyYXRjaF90aGlzaGFydF9w
dHIoKTsKKyAgICByZXR1cm4gJnNjcmF0Y2gtPmZwX2N0eDsKK30KKworLyogR2V0IGN1cnJlbnQg
RlAgY29udGV4dCAqLworc3RydWN0IHNiaV9mcF9jb250ZXh0ICpzYmlfY3VycmVudF9mcF9jb250
ZXh0KHZvaWQpCit7CisgICAgcmV0dXJuICpmcF9vd25lcl9wdHIoKTsKK30KKwordm9pZCBzYmlf
ZnBfc2F2ZShzdHJ1Y3Qgc2JpX2ZwX2NvbnRleHQgKmRzdCkKK3sKKwlpZiAoIWRzdCkKKwkJcmV0
dXJuOworCisJYXNtIHZvbGF0aWxlKAorCQkiZnNkIGYwLCAgMCglMClcbiIKKwkJImZzZCBmMSwg
IDgoJTApXG4iCisJCSJmc2QgZjIsIDE2KCUwKVxuIgorCQkiZnNkIGYzLCAyNCglMClcbiIKKwkJ
ImZzZCBmNCwgMzIoJTApXG4iCisJCSJmc2QgZjUsIDQwKCUwKVxuIgorCQkiZnNkIGY2LCA0OCgl
MClcbiIKKwkJImZzZCBmNywgNTYoJTApXG4iCisJCSJmc2QgZjgsIDY0KCUwKVxuIgorCQkiZnNk
IGY5LCA3MiglMClcbiIKKwkJImZzZCBmMTAsIDgwKCUwKVxuIgorCQkiZnNkIGYxMSwgODgoJTAp
XG4iCisJCSJmc2QgZjEyLCA5NiglMClcbiIKKwkJImZzZCBmMTMsIDEwNCglMClcbiIKKwkJImZz
ZCBmMTQsIDExMiglMClcbiIKKwkJImZzZCBmMTUsIDEyMCglMClcbiIKKwkJImZzZCBmMTYsIDEy
OCglMClcbiIKKwkJImZzZCBmMTcsIDEzNiglMClcbiIKKwkJImZzZCBmMTgsIDE0NCglMClcbiIK
KwkJImZzZCBmMTksIDE1MiglMClcbiIKKwkJImZzZCBmMjAsIDE2MCglMClcbiIKKwkJImZzZCBm
MjEsIDE2OCglMClcbiIKKwkJImZzZCBmMjIsIDE3NiglMClcbiIKKwkJImZzZCBmMjMsIDE4NCgl
MClcbiIKKwkJImZzZCBmMjQsIDE5MiglMClcbiIKKwkJImZzZCBmMjUsIDIwMCglMClcbiIKKwkJ
ImZzZCBmMjYsIDIwOCglMClcbiIKKwkJImZzZCBmMjcsIDIxNiglMClcbiIKKwkJImZzZCBmMjgs
IDIyNCglMClcbiIKKwkJImZzZCBmMjksIDIzMiglMClcbiIKKwkJImZzZCBmMzAsIDI0MCglMClc
biIKKwkJImZzZCBmMzEsIDI0OCglMClcbiIKKwkJOgorCQk6ICJyIihkc3QtPmYpCisJCTogIm1l
bW9yeSIKKwkpOworCisJZHN0LT5mY3NyID0gY3NyX3JlYWQoQ1NSX0ZDU1IpOworfQorCit2b2lk
IHNiaV9mcF9yZXN0b3JlKGNvbnN0IHN0cnVjdCBzYmlfZnBfY29udGV4dCAqc3JjKQoreworICAg
IGlmICghc3JjKQorICAgICAgICByZXR1cm47CisKKwlhc20gdm9sYXRpbGUoCisJCSJmbGQgZjAs
ICAwKCUwKVxuIgorCQkiZmxkIGYxLCAgOCglMClcbiIKKwkJImZsZCBmMiwgMTYoJTApXG4iCisJ
CSJmbGQgZjMsIDI0KCUwKVxuIgorCQkiZmxkIGY0LCAzMiglMClcbiIKKwkJImZsZCBmNSwgNDAo
JTApXG4iCisJCSJmbGQgZjYsIDQ4KCUwKVxuIgorCQkiZmxkIGY3LCA1NiglMClcbiIKKwkJImZs
ZCBmOCwgNjQoJTApXG4iCisJCSJmbGQgZjksIDcyKCUwKVxuIgorCQkiZmxkIGYxMCwgODAoJTAp
XG4iCisJCSJmbGQgZjExLCA4OCglMClcbiIKKwkJImZsZCBmMTIsIDk2KCUwKVxuIgorCQkiZmxk
IGYxMywgMTA0KCUwKVxuIgorCQkiZmxkIGYxNCwgMTEyKCUwKVxuIgorCQkiZmxkIGYxNSwgMTIw
KCUwKVxuIgorCQkiZmxkIGYxNiwgMTI4KCUwKVxuIgorCQkiZmxkIGYxNywgMTM2KCUwKVxuIgor
CQkiZmxkIGYxOCwgMTQ0KCUwKVxuIgorCQkiZmxkIGYxOSwgMTUyKCUwKVxuIgorCQkiZmxkIGYy
MCwgMTYwKCUwKVxuIgorCQkiZmxkIGYyMSwgMTY4KCUwKVxuIgorCQkiZmxkIGYyMiwgMTc2KCUw
KVxuIgorCQkiZmxkIGYyMywgMTg0KCUwKVxuIgorCQkiZmxkIGYyNCwgMTkyKCUwKVxuIgorCQki
ZmxkIGYyNSwgMjAwKCUwKVxuIgorCQkiZmxkIGYyNiwgMjA4KCUwKVxuIgorCQkiZmxkIGYyNywg
MjE2KCUwKVxuIgorCQkiZmxkIGYyOCwgMjI0KCUwKVxuIgorCQkiZmxkIGYyOSwgMjMyKCUwKVxu
IgorCQkiZmxkIGYzMCwgMjQwKCUwKVxuIgorCQkiZmxkIGYzMSwgMjQ4KCUwKVxuIgorCQk6CisJ
CTogInIiKHNyYy0+ZikKKwkJOiAibWVtb3J5IgorCSk7CisKKwljc3Jfd3JpdGUoQ1NSX0ZDU1Is
IHNyYy0+ZmNzcik7Cit9Ci0tIAoyLjQzLjAKCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3Bl
bnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbnNiaQo=
