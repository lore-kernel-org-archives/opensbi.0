Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFE21098782
	for <opensbi@archiver.kernel.org>; Fri, 20 Mar 2026 14:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VSTZHcENE7sCM5jgyi6px6kNQ5nUMCQy93JE9SwdWmg=; b=wS+t/k1IlK5bCK
	ytIVcGM/Ix42LcRuxUCkGYxGEt1bOPi62/CuIB6EIOOPLiW8s4d7aTH2BbLUawwJTSuuRa2vgHLn/
	8ULxB0oKYkRWGFkCJXPvr9RHhKBvHXfuSKQ76TDLnFYYxpVfRf9BU9nKewctOJ3mXx0+nhpXKtmPd
	tI7pRChsl7or0nPGENZesPFC+Eat95byxHOtEorho9G2l+jDL1LjOk8eV+jtPcL0VBaAaY/3QTKRp
	/dhxIoAt3tX0kV8Dn+fYmORuujKCOFusC98tfz+TsNnZ5nqONDpse/ImhzV/iyL5PdYDBK0AZ9sKI
	JfNAvT7OZCthyUSliuBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3alc-0000000CvqX-2GsW;
	Fri, 20 Mar 2026 14:24:00 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ala-0000000Cvom-2AGj
	for opensbi@lists.infradead.org;
	Fri, 20 Mar 2026 14:23:59 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so16491685e9.1
        for <opensbi@lists.infradead.org>; Fri, 20 Mar 2026 07:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1774016636; x=1774621436; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IrHktZAbARMvl8w9rhATdPXu3WwH+dZUkizfjLyYE/Y=;
        b=lBGnqQTRKuBsIRuzYrWleGG3g9vdVex6koLP1x8OjLISNWoKggOxNfgWufGaKNFaC5
         lgJ7m5lkrjIDhFmO8Ue7W0ZQdoiYMZShPah35WT/Z/pXD82yah+EsBUFNJzUBadJQ3//
         8MQCv8IHbFwFMitPMlizVp7+D2GpXhTZ7vpjc5j8cCDg9h8gu8U1jZGfD7dRTK5OQBO2
         vFRRH7t1f8z86FAahDqzAbEtjUTy94oprcLsmzug4mBRG6VfNV61fGpskxuzCIOxSVuV
         OlAktAzD286APTKoZjNCS3KLk/wuKHYnfmFMy4AHThbo7HXnJntq0oVd3h5gVuTUNHbs
         TKVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774016636; x=1774621436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IrHktZAbARMvl8w9rhATdPXu3WwH+dZUkizfjLyYE/Y=;
        b=dupfTh77W83TOtQ5WTD+qWjXXnIvym0BYxmQUSTXtJyVXR/nBWLzuAXHa5wBX0sIGi
         jbb3l506htDfNkwaQoMjBkXGRyttd9vdLWsry65btgMoIyDdf+umzrGX0Tip3wKkboG5
         EjIQtohR5jVb5OY0kwTSn/qR2bsBlX7m24pD+rQ1tHED1JvCq1gz8bbewCrCspmpUBES
         YJtkskVJwEuQTLDGxQUndtu96dQmkn6zu18cCl8uFF+XmZSUKxF3Rxw3QpXwVbXmjzeW
         Iq1uoE9m+TtwwJ02KdMWDNxJGQSFVGlri63XDwEpEDKwFaZYgJVJCZ1Igr0YMZTnejaB
         4w7w==
X-Gm-Message-State: AOJu0YyoB81YEikUHVmpJHwtJa8vuOIO9RvGQ2knSye95W2dGP59W+n0
	ll8YxBeptR8ywRsEea48voMuFno4gytg8HyRT/Y31kfz+U/Pde1qN7dkp8qhp3ttfeq/T8Sqaap
	Ga9cfuak=
X-Gm-Gg: ATEYQzz8MnSuKHixZTmcbq06iCSFU5BXc6GYNLKzG10qzFUrpfE7cna8ewI5nho9ya9
	Am4sKU/AGDBZUuqU8x40KsQGVMoeA7v+Hd6aEdj8cJVl4gxaVOnySnxTJ6lQPkCSdhRPX7g9PPU
	Et6amTOkVLSEde0UHOL5B2squj7gq+gY/bi9EpGl9vncpH/wv8Eqt3I7zd2Jd6/hPgZn52zAkQh
	7f1o2+eY/OafskuRlifwxRWQKp87GVTjX8DlFslI3gl0J55+rg/eJ+E79JCdSm0ngD6BGwz9/lG
	SGPspt6vojNcbUO4PDotEpR5A5W2bqOuI9fterOpqHmINjGUsADC2854U5G32ybf0fjPxTghv/k
	PbK3omgKSZtbA1V05tKVXFNeIxpdd7QAaipVnoYFZlIfG/h2MgEUoLXiP/5QvIpMf0GeeE8ylKR
	XusZT26kGDyRJ6PByVyWA65dY6yiACZgWKki1VcJLSP7nfdM2g+xDH/7S68HcDGNNb41s=
X-Received: by 2002:a05:600c:8b61:b0:485:3471:cffb with SMTP id 5b1f17b1804b1-486fedd8164mr47846845e9.15.1774016636367;
        Fri, 20 Mar 2026 07:23:56 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe6d923fsm108445265e9.1.2026.03.20.07.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:23:56 -0700 (PDT)
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
Subject: [PATCH 3/4] lib: sbi: Add floating-point context save/restore support.
Date: Fri, 20 Mar 2026 14:23:48 +0000
Message-ID: <20260320142349.72980-4-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320142349.72980-1-dave.patel@riscstar.com>
References: <20260320142349.72980-1-dave.patel@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_072358_584788_502C93F9 
X-CRM114-Status: GOOD (  15.09  )
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
