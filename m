Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56623C88E42
	for <opensbi@archiver.kernel.org>; Wed,  9 Sep 2026 16:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8O3dXBPdyZge3EYQPeiZpoOsfNxPGnqjjmZqGxZwM/Y=; b=iRibfQ4OUwhoy1
	6TH/5DC+cCIWEyaewnodXlQsssRgyEeuwfhvedD3N2fYpHazvPr5xVzz/6rcrtAy8hf5SHwAKQc+f
	yUAdgK2zDVibogM6d/i2IS+H+HqbqkKTi9PPDxIAhMvohtSnLQQXLQG22zD1Xky/LR/5bzeDeJtld
	JI3RG6LtCG1HQxXbZM2jOtZokxsIE7s4ynqaUUQXxSyWvbaX2BTl95dMqaWnjSYRGZR7L5mP+ay41
	t/LKVDAcGl8+1Af0UPk7SY3SJWreLw0Sab6OZXwTANwIqojIQAIbJYgjM1nDgyq1JTUMPh44cY2VP
	H01Z2ATvOwxc603xslxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LCp-0000000CJg3-2Q31;
	Wed, 09 Sep 2026 16:31:27 +0000
Received: from mail-wr2-x09.google.com ([2a00:1450:4864:30::9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LCn-0000000CJbz-0eDG
	for opensbi@lists.infradead.org;
	Wed, 09 Sep 2026 16:31:26 +0000
Received: by mail-wr2-x09.google.com with SMTP id ffacd0b85a97d-484392e3450so287736f8f.0
        for <opensbi@lists.infradead.org>; Wed, 09 Sep 2026 09:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788971483; x=1789576283; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fCNjZcKJRTQ5UJ6mi/Lctk0/snj0hc5jhRSqVwVbxs0=;
        b=VyJgi3eodqXnFbcKOfXCGze1BrwulkLbVWEjLUAc0JeHyjzxaX91XPrLDFCzrvn+kb
         gp/cT89XVttLzfSCGd6oFzG4Rj7HKP6V7tCl6kNt1/BnfOnMKc6DrRXwgpuPGuzOw/c4
         JkVO3pi1/KqSz4gFs7vua9bO3dkrnyZk9/67uZJDMgoY1FwtyUlsUdiE9QslduncAIBx
         yc5TJi9mJEKO+m75jFryZK9Rst/n28eCnfVq/uziHNWVoz+na19A8mXEt/P1i6t3pYWI
         AE9dXR1x8fYAbLBahnfDyKChBgKImVeb/cu66PftvqkKqpiFJ1CrRrznkJlf/b8Q3bHQ
         pIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788971483; x=1789576283;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fCNjZcKJRTQ5UJ6mi/Lctk0/snj0hc5jhRSqVwVbxs0=;
        b=Bzd4A2nhaIhowcgkV77inlAsvnm2i9/d4ucSox4Cz5BO2Y0S1RZyGM+G8Wt5YQycx9
         xG61zh30xOukunpStc8TfKFAOwB8TTSbF9Geaeu73+ocaq2qz7I1m12z68fna4ne77C0
         b5pOnVP7RAM8i70IdQE75ylq2k+qqzYkm9/K1TsVfBJ893L5iyAgjlhO+Du4OXs40f8J
         c4y79xRxRKjJyQsfVXlxZ1EFpMbFZeIYOJbn+Hj/k73D7L/6jM4tB8hx8/7IpBOSt4fJ
         5QF6Lco7sfiZkJSoGDPQKLsKWTsIyx9rhO/9Wobm46khTNJ+FVQeDvjvctTwP6HUFsHy
         c5MQ==
X-Gm-Message-State: AFuF++ml8vqaVBM3ihyMPmfjqLnjgRy67q2KkipyBAvpCHNUERTc5Gsa
	5TVg8JBEoFoPyvHJ00VVoXovbyleT1nn9IMcktqIX9LKQYTfnmbfQ/EdJcnJyn3b
X-Gm-Gg: AYBFou34oo61Jcl5DPTy6Z1DxLyql/HS0RXtsgJ1oAqZResMS6RABIZDjJS8oJH4xN1
	7BDHjpXIt3lSRalItQPvuTGVf9TLv/B4KUQm8nIHOo63Px2czEwnb4A+W1ulK83xeDI2qzts3RK
	OPe5Cf+3iJWyYYro9NhER4wjMyXoCrV5Zi0a7liFdzgFv9oTxoUIdbT+LbHJjBKIhPMw7yMMb+z
	+QMshfDjAsgLENBExtqTIaXKQ6BvIhaakZmfmWBCBs3l+k27lip7vK8zLoQqwElcRuOQpM98wxF
	TwRBy3dvl+pZX/3ywHg0R9pbD3c8w+2kklFr1QuEaQImXXmakNrioBCqPhqXAzMJpE3s+jmdHHA
	T1zexR+w0OfAqjVJDRDztVE41gr8tdihCrb7IViLmD0+nsr/jZNnWfMJUbQISgUHJXf/A4bFj4J
	Avu2+g9qDvP/0Q1BHZpJeRoU60aHQT+ldpKluE1wqHpMnv7tusiefYEVrNnSyW22I7D5nIcC5U0
	VSoujDsj5qY8QNoaDWeN0h8zQ+W80uYpIrq+1aCsDgclqUdHdzJFrHnMH/qS8w45AbL1wt1Prxj
	aqc=
X-Received: by 2002:a05:600d:8647:10b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-49d26d863famr1242425e9.1.1788971483205;
        Wed, 09 Sep 2026 09:31:23 -0700 (PDT)
Received: from localhost.localdomain ([84.77.88.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c06f04sm2763705e9.13.2026.09.09.09.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 09:31:22 -0700 (PDT)
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Subject: [PATCH v2 06/14] lib: rpmi: add TSA annotations
Date: Wed,  9 Sep 2026 18:23:15 +0200
Message-ID: <20260909162322.29778-8-carlos.lopezr4096@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
References: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_093125_226295_11FDD332 
X-CRM114-Status: GOOD (  11.67  )
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

QWRkIFRocmVhZCBTYWZldHkgQW5hbHlzaXMgKFRTQSkgYW5ub3RhdGlvbnMgZm9yIHRoZSBSUE1J
IG1haWxib3gKaW1wbGVtZW50YXRpb24uIFRoaXMgaW5jbHVkZXMgaW5kaWNhdGluZyB3aGljaCBm
aWVsZHMgYXJlIHByb3RlY3RlZApieSBhIHNwaW5sb2NrLCBhbmQgYW5ub3RhdGluZyB3aGljaCBm
dW5jdGlvbnMgbXVzdCBiZSBjYWxsZWQgdW5kZXIgYQpzcGlubG9jay4gRXhjbHVkZSBycG1pX3No
bWVtX3RyYW5zcG9ydF9pbml0KCksIGFzIHRoZSBzcGlubG9jayBjYW5ub3QgYmUKYWNxdWlyZWQg
YmVmb3JlIGl0IGlzIGluaXRpYWxpemVkLgoKU2lnbmVkLW9mZi1ieTogQ2FybG9zIEzDs3BleiA8
Y2FybG9zLmxvcGV6cjQwOTZAZ21haWwuY29tPgotLS0KIGxpYi91dGlscy9tYWlsYm94L2ZkdF9t
YWlsYm94X3JwbWlfc2htZW0uYyB8IDE0ICsrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi91dGlscy9t
YWlsYm94L2ZkdF9tYWlsYm94X3JwbWlfc2htZW0uYyBiL2xpYi91dGlscy9tYWlsYm94L2ZkdF9t
YWlsYm94X3JwbWlfc2htZW0uYwppbmRleCA1MjFlMDY3MzU4NzMuLmNmOTc1NjU4MWNmMCAxMDA2
NDQKLS0tIGEvbGliL3V0aWxzL21haWxib3gvZmR0X21haWxib3hfcnBtaV9zaG1lbS5jCisrKyBi
L2xpYi91dGlscy9tYWlsYm94L2ZkdF9tYWlsYm94X3JwbWlfc2htZW0uYwpAQCAtMTEzLDkgKzEx
Myw5IEBAIHN0cnVjdCBzbXFfcXVldWVfY3R4IHsKIAkvKiBUeXBlIG9mIHF1ZXVlIC0gUkVRIG9y
IEFDSyAqLwogCWVudW0gcnBtaV9xdWV1ZV90eXBlIHF1ZXVlX3R5cGU7CiAJLyogUG9pbnRlcnMg
dG8gdGhlIHF1ZXVlIHNoYXJlZCBtZW1vcnkgKi8KLQl2b2xhdGlsZSBsZTMyX3QgKmhlYWRwdHI7
Ci0Jdm9sYXRpbGUgbGUzMl90ICp0YWlscHRyOwotCXZvbGF0aWxlIHVpbnQ4X3QgKmJ1ZmZlcjsK
Kwl2b2xhdGlsZSBsZTMyX3QgKmhlYWRwdHIgUFRfR1VBUkRFRF9CWSgmcXVldWVfbG9jayk7CisJ
dm9sYXRpbGUgbGUzMl90ICp0YWlscHRyIFBUX0dVQVJERURfQlkoJnF1ZXVlX2xvY2spOworCXZv
bGF0aWxlIHVpbnQ4X3QgKmJ1ZmZlciBQVF9HVUFSREVEX0JZKCZxdWV1ZV9sb2NrKTsKIAkvKiBO
YW1lIG9mIHRoZSBxdWV1ZSAqLwogCWNoYXIgbmFtZVtSUE1JX05BTUVfQ0hBUlNfTUFYXTsKIH07
CkBAIC0xNTQsMTIgKzE1NCwxNCBAQCBzdHJ1Y3QgcnBtaV9zaG1lbV9tYm94X2NvbnRyb2xsZXIg
ewogLyoqKioqKioqKioqKioqKiogU2hhcmVkIE1lbW9yeSBRdWV1ZXMgSGVscGVycyAqKioqKioq
KioqKioqKi8KIAogc3RhdGljIGJvb2wgX19zbXFfcXVldWVfZnVsbChzdHJ1Y3Qgc21xX3F1ZXVl
X2N0eCAqcWN0eCkKKwlNVVNUX0hPTEQoJnFjdHgtPnF1ZXVlX2xvY2spCiB7CiAJcmV0dXJuICgo
bGUzMl90b19jcHUoKnFjdHgtPnRhaWxwdHIpICsgMSkgJSBxY3R4LT5udW1fc2xvdHMgPT0KIAkJ
CWxlMzJfdG9fY3B1KCpxY3R4LT5oZWFkcHRyKSkgPyB0cnVlIDogZmFsc2U7CiB9CiAKIHN0YXRp
YyBib29sIF9fc21xX3F1ZXVlX2VtcHR5KHN0cnVjdCBzbXFfcXVldWVfY3R4ICpxY3R4KQorCU1V
U1RfSE9MRCgmcWN0eC0+cXVldWVfbG9jaykKIHsKIAlyZXR1cm4gKGxlMzJfdG9fY3B1KCpxY3R4
LT5oZWFkcHRyKSA9PQogCQlsZTMyX3RvX2NwdSgqcWN0eC0+dGFpbHB0cikpID8gdHJ1ZSA6IGZh
bHNlOwpAQCAtMTY3LDYgKzE2OSw3IEBAIHN0YXRpYyBib29sIF9fc21xX3F1ZXVlX2VtcHR5KHN0
cnVjdCBzbXFfcXVldWVfY3R4ICpxY3R4KQogCiBzdGF0aWMgaW50IF9fc21xX3J4KHN0cnVjdCBz
bXFfcXVldWVfY3R4ICpxY3R4LCB1MzIgc2xvdF9zaXplLAogCQkgICAgdTMyIHNlcnZpY2VfZ3Jv
dXBfaWQsIHN0cnVjdCBtYm94X3hmZXIgKnhmZXIpCisJTVVTVF9IT0xEKCZxY3R4LT5xdWV1ZV9s
b2NrKQogewogCXZvaWQgKmRzdCwgKnNyYzsKIAlzdHJ1Y3QgcnBtaV9tZXNzYWdlICptc2c7CkBA
IC0yNTAsNyArMjUzLDcgQEAgc3RhdGljIGludCBfX3NtcV9yeChzdHJ1Y3Qgc21xX3F1ZXVlX2N0
eCAqcWN0eCwgdTMyIHNsb3Rfc2l6ZSwKIAogc3RhdGljIGludCBfX3NtcV90eChzdHJ1Y3Qgc21x
X3F1ZXVlX2N0eCAqcWN0eCwgc3RydWN0IHJwbWlfbWJfcmVncyAqbWJfcmVncywKIAkJICAgIHUz
MiBhMnBfZG9vcmJlbGxfdmFsdWUsIHUzMiBzbG90X3NpemUsIHUzMiBzZXJ2aWNlX2dyb3VwX2lk
LAotCQkgICAgc3RydWN0IG1ib3hfeGZlciAqeGZlcikKKwkJICAgIHN0cnVjdCBtYm94X3hmZXIg
KnhmZXIpIE1VU1RfSE9MRCgmcWN0eC0+cXVldWVfbG9jaykKIHsKIAl1MzIgaSwgdGFpbGlkeDsK
IAl2b2lkICpkc3QsICpzcmM7CkBAIC01ODMsNyArNTg2LDggQEAgc3RhdGljIHZvaWQgcnBtaV9z
aG1lbV9tYm94X2ZyZWVfY2hhbihzdHJ1Y3QgbWJveF9jb250cm9sbGVyICptYm94LAogZXh0ZXJu
IHN0cnVjdCBmZHRfbWFpbGJveCBmZHRfbWFpbGJveF9ycG1pX3NobWVtOwogCiBzdGF0aWMgaW50
IHJwbWlfc2htZW1fdHJhbnNwb3J0X2luaXQoc3RydWN0IHJwbWlfc2htZW1fbWJveF9jb250cm9s
bGVyICptY3RsLAotCQkJCSAgICAgY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZW9mZikKKwkJCQkg
ICAgIGNvbnN0IHZvaWQgKmZkdCwKKwkJCQkgICAgIGludCBub2Rlb2ZmKSBOT19USFJFQURfU0FG
RVRZX0FOQUxZU0lTCiB7CiAJY29uc3QgY2hhciAqbmFtZTsKIAljb25zdCBmZHQzMl90ICpwcm9w
OwotLSAKMi41MS4wCgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29w
ZW5zYmkK
