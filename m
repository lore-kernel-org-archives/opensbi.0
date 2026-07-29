Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC04C53200
	for <opensbi@archiver.kernel.org>; Wed, 29 Jul 2026 16:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t8h6jbnKuToSDRWG+x/CRG1IQez771ELJwApywP/T7I=; b=PySYcrLNe+98eD
	qeR2Twj8nZ3tf7voFsPX4ckj4h4dABIGkSOgGpIoMpa0ody1BamoKIT4lH5O/OYYQp7MVvr9zdlEC
	ke5ruQs3viEI4z+7qSKkgMRw/R+9sPRdeZw5tywnb6XqSPOw6CF69uxPW/e3qk3IRRRjL3AOrjXvL
	9CaS+CnF+aLetY0ywSFfTpB+vTvalZszLbqscInq3D6eyO9g7FCiSM8QOAYeFGM9jJTaLJKam+r38
	Kqok1aCLb6bHZ2GGQlU4YqEPFMZu+3s3CHhpoE3sEGsRj0180L0PfxBpSq7ERYkDuqwk9XrWpzXgZ
	8zxKAwm55FhtReoOUUrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Od-00000008bMd-3L6m;
	Wed, 29 Jul 2026 16:44:43 +0000
Received: from mail-wm2-x07.google.com ([2a00:1450:4864:31::7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Oa-00000008bHT-0Hsc
	for opensbi@lists.infradead.org;
	Wed, 29 Jul 2026 16:44:41 +0000
Received: by mail-wm2-x07.google.com with SMTP id 5b1f17b1804b1-49557073245so3361475e9.1
        for <opensbi@lists.infradead.org>; Wed, 29 Jul 2026 09:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785343478; x=1785948278; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JWaCfIhsI79tG2kum+UW1v5KPAC9pDehWxou4MG5t18=;
        b=lq2Q56s/ph7yFq9H6yFeSAEN/70DOgWIhDmhMXpWTJq3uUPHRA0fVKEIL8cgGCyeQs
         qPL72djGkroR4ev/GDbZYuv9HFXVfyRAfmiuQpPuTm+p7U0aPGe4eNGrbQjAX4yTg1DS
         AbZPn5Nzyo1AcsyksTb4Xps5sjn4tBSRqgxOnxB6tUWgZc7oF6KrrgYfQug7HFy0CM17
         cvWtOwx3dz3LxYM2tR64cEF64mMZmDtiHY8/dfnDomJLrUiyjyP8uztiGP12tQWDxb2g
         WApYzMmc6kQFe26KGTh8FTwloaOMR/8AFk3ciAH1o1Om2Lz6MtJ9ymYOJYs9/r43PCrZ
         51Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785343478; x=1785948278;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JWaCfIhsI79tG2kum+UW1v5KPAC9pDehWxou4MG5t18=;
        b=D9+agd1nqlglNnH8MPtFUME7sELfhxEBEa0wsB6kNtEyzEYlC1mCJS0Fav7z6fySqq
         grbrGmSOdU7PzA7F9q5XZvh1psbsA/gH2Hd3+FC9n11qRTykTjDyEp71gYKLPd4/WKrO
         iUn9e4H6Bne/sKyI7zaezU2p+sx5pL00gtKsgODOFLrW9YaNkpmWj6ZhYQlRDyu4wzsp
         BvNFHoEF+jXximwW155sBCKq2KyfZ///vlu/XQQn0X8Z90Jf4PmHeVzoWvAmpvC3vIxQ
         lLEWKpeH5rAnQZUacMslHBlwzJIU3hzn3l/0B030oceWo0kVrpO+q967E38uj4POgwhM
         93zw==
X-Gm-Message-State: AOJu0YwsZ4MzOBEUv/NnMbYu6jalBZPO0NHHCWrpuDvycIvMGozBWe9j
	2xOcMYR9F4MPlhaZ8uENVf2bXrC38FnSZH2nSbzs8aD7Hktz4Fmv2z2K2YC/U+GEBhg=
X-Gm-Gg: AR+sD12g1bnveikd6sQRvAz1kCcCAkE1IFlIcsO4ne2d/dcmOAC9CNb7R4M5hQqU6Ur
	Oi1Apfu3mDzJm314X2CDE+tn4y7ILLtLhppKZM+COWRlhPolG+kN1IM0E2NqV8nGAk1y2zaUYU/
	dR36Ay8e5CXDjpbw+zi8gTUEfawKjRtnQzcJ/u40EetVgnqd+dpE/g4YUOIf/f4dYsuvZuz9BRc
	L0nULYqawDvJ2AoqQdbqE1IQdpDU6zVmigd9EQU3qHBmQg48FsYd2gYkAbI4FOqv/nqJ/OKTanH
	fLrcrecMmHxQSKCB9UJSRxppDD1/K6CZnJE5+9WoRqpeGAp0UnQt7vs6+OqNfRdLv/68l4Vr613
	ehbs3KMWsHQjUDWtxAejOnaOCCoMBU6w3aM613onj5OneRsKej7kAuTGX8a7P+dwzovWpSiTilM
	iAQd6ERSg+I11jmlDE00gcqlpZpDk1oEMsJaq5pIFsi3wWi68YNn6dXgEnT9rWbAeSSamFhkxTc
	B79pLxqJMN+dgN7hyw6JTsXKnNVXIId6+DKq1T356GDnnmUJpH9AuRmyg==
X-Received: by 2002:a05:600c:4fd2:b0:493:f262:b8 with SMTP id 5b1f17b1804b1-496c641e88bmr94580505e9.1.1785343478071;
        Wed, 29 Jul 2026 09:44:38 -0700 (PDT)
Received: from leap.suse.de ([84.77.88.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a88sm8474869f8f.6.2026.07.29.09.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:44:37 -0700 (PDT)
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Subject: [PATCH 05/14] lib: sbi_scratch: add TSA annotations
Date: Wed, 29 Jul 2026 18:35:32 +0200
Message-ID: <20260729163540.3162978-7-carlos.lopezr4096@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
References: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_094440_113712_6C098A28 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

QWRkIFRocmVhZCBTYWZldHkgQW5hbHlzaXMgKFRTQSkgYW5ub3RhdGlvbnMgZm9yIHRoZSBzY3Jh
dGNoIHNwYWNlCmltcGxlbWVudGF0aW9uLiBUaGlzIG9ubHkgY29uc2lzdHMgb2YgYW5ub3RhdGlu
ZyB0aGF0IHRoZSBleHRyYV9vZmZzZXQKZ2xvYmFsIG11c3QgYmUgYWNjZXNzZWQgdW5kZXIgdGhl
IGV4dHJhX2xvY2sgc3BpbmxvY2suCgpTaWduZWQtb2ZmLWJ5OiBDYXJsb3MgTMOzcGV6IDxjYXJs
b3MubG9wZXpyNDA5NkBnbWFpbC5jb20+Ci0tLQogbGliL3NiaS9zYmlfc2NyYXRjaC5jIHwgMyAr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9saWIvc2JpL3NiaV9zY3JhdGNoLmMgYi9saWIvc2JpL3NiaV9zY3JhdGNoLmMKaW5k
ZXggYmIxNGExYTI1ZmViLi4yMTEyMGIxNDUyMDIgMTAwNjQ0Ci0tLSBhL2xpYi9zYmkvc2JpX3Nj
cmF0Y2guYworKysgYi9saWIvc2JpL3NiaV9zY3JhdGNoLmMKQEAgLTIxLDcgKzIxLDggQEAgdTMy
IGhhcnRpbmRleF90b19oYXJ0aWRfdGFibGVbU0JJX0hBUlRNQVNLX01BWF9CSVRTXSA9IHsgWzAg
Li4uIFNCSV9IQVJUTUFTS19NQVgKIHN0cnVjdCBzYmlfc2NyYXRjaCAqaGFydGluZGV4X3RvX3Nj
cmF0Y2hfdGFibGVbU0JJX0hBUlRNQVNLX01BWF9CSVRTXTsKIAogc3RhdGljIHNwaW5sb2NrX3Qg
ZXh0cmFfbG9jayA9IFNQSU5fTE9DS19JTklUSUFMSVpFUjsKLXN0YXRpYyB1bnNpZ25lZCBsb25n
IGV4dHJhX29mZnNldCA9IFNCSV9TQ1JBVENIX0VYVFJBX1NQQUNFX09GRlNFVDsKK3N0YXRpYyB1
bnNpZ25lZCBsb25nCisJZXh0cmFfb2Zmc2V0IEdVQVJERURfQlkoJmV4dHJhX2xvY2spID0gU0JJ
X1NDUkFUQ0hfRVhUUkFfU1BBQ0VfT0ZGU0VUOwogCiAvKgogICogR2V0IHRoZSBhbGlnbm1lbnQg
c2l6ZS4KLS0gCjIuNTEuMAoKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9vcGVuc2JpCg==
