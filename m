Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426C7C53219
	for <opensbi@archiver.kernel.org>; Wed, 29 Jul 2026 16:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8O3dXBPdyZge3EYQPeiZpoOsfNxPGnqjjmZqGxZwM/Y=; b=JRqfZQpeKmhZ70
	czrCLUjNEE1hcq9ibPDZrPC4qkzig2zkuPTGLxnGOH/sC+2FJjLrEA+CP02c/z5Jqv0C+9Jm6xQ22
	9rR4nafbxVbGvH1MzMhYOgt5lZPSm9+R1rjkVK+EIofoOC0dFbLTM1FIIu5Z6buCiIlB+QUzuTWeA
	q+KMRTsf0ltY+ts45rQpEz/ZsZ5nveCJ39gEJ0EmWKRAPvKGdAMS1YLBXxbw1uESuj47DBtki8NJr
	OPVdIB4CqOhmYo7eMDgzA7bciN9wL8ZHTaEnGK0tDy27hMunPpaCGXrhvy7a4mBQSJ92iev9RKAac
	t64OZz3e1JuUcDmZXMhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Oe-00000008bNB-0Ca8;
	Wed, 29 Jul 2026 16:44:44 +0000
Received: from mail-wm2-f9.google.com ([74.125.225.137])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Ob-00000008bII-0tvd
	for opensbi@lists.infradead.org;
	Wed, 29 Jul 2026 16:44:42 +0000
Received: by mail-wm2-f9.google.com with SMTP id 5b1f17b1804b1-49553b57612so2252305e9.1
        for <opensbi@lists.infradead.org>; Wed, 29 Jul 2026 09:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785343479; x=1785948279; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fCNjZcKJRTQ5UJ6mi/Lctk0/snj0hc5jhRSqVwVbxs0=;
        b=qrhjwUvpsc1gOXRSR0COFj8g+xhwe4L4RpFPRn2FU6j5XUc2pMqZrIxAqNwUBlICnu
         IKIvBf3i6G585a0ZtLhGkf/jkvykvY6EKs4EfVREAVehPz5g369mi5Rn4EocIy+QIoCZ
         A/qQORqNjh6ZsfG5QHJfpsvUrPYLTRkLj/NF/BkOkZfvYqeeKbUm0PPV8kaVU0NdLNeQ
         kiTySmBZptB+0/mwJepxoUvQ94YgdDb+t+O5FbV2f5OR0MMYbFBHgzWEvhSJQP+zKEhe
         RWC7ocZzbpL2LJmutfkfapQYUnlK2WM5CNzI1ghYhZuKHmMDxOvVEB/ZQTXUS3YgVvoP
         yYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785343479; x=1785948279;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fCNjZcKJRTQ5UJ6mi/Lctk0/snj0hc5jhRSqVwVbxs0=;
        b=bvND4e8pDx7s1ttEWa6e7krEvXzDC8AMUKMDJ8C6kbaitBgfb1ZBVDDh7z4IZKLPj+
         qEAOido2ttV+yXjBJAqNHwFHUnhYKPfRApRjtMSYSTu0mYL8LCv7XMFeqVXCUh4O2qVn
         ikuKS+AN9NLhwLcxeCCAFEHH2+eYpllqYShKBdz8ZzKfvt6Bl2OKyf/a/UyNMscjnM0D
         xA5YuF4KA7IybCI5wPoH/O2O5LUg8Z50cVK6RCxOIQYpx9UvTTYeyoUo1BVjzV9KQjJl
         5RVKBxDxQPf2wyboJuBYj8Y0L4/TjeMUBAN9+58CG8wRrSw99n/uNAGpq5y+Lf1erIoV
         yz6Q==
X-Gm-Message-State: AOJu0YxmP68jGiISEQ/XGVCiPTaZ0f3Wm3fAuQ96OSJOCWKBcy9SYVJ2
	YxryX/ujayMULYBTb1lcl/EIzKIL7mf4tjLqfmU8j2TErYjsGINvtSmQ6tc9su4cHWI=
X-Gm-Gg: AR+sD11fSQ6bj5IquP0YV1CTYSsRq0PmRLPe9caG3x/9Pdb70RlP5bMrnw/65a9ZSJ6
	DpFtP8K7IjHArjjjDKleaTnXyFxUq0l9pSMk3Bn/uLvHq/TgVirdEVxs09jm+an3+eQZoLIz8d0
	rv9c8tBlspYIiX9cYYOXtUjc5Db49BxZDZ2rYk2V0fDGjngem5xkkR/LNMZY3RyTQjok8qVhmtH
	jJH6TPL72EaJH2CROJmr7gjqjPXdWut8pTCp5Clq2At5oCiakEF6bSqAhm6I7lNjOtbhthm0T2z
	f/vxFRQBjkppnUedOAlq0AY+Kaumj5KaU9JJm5hyyFD+LAK8FJ/6Io3QkwrAlhden30vpGBxyQk
	YyTNGi9CyYrYRgKeaFGAd3ioe6dCMmUPluFyoXRUHT1F4edKEx99PjKpYs4BpwXEEqAPIAd/yX2
	SYZc2V4DY33wRK1CnANoTXmqnmtXo79CoHp9SJBBxi88bEjbRkccfPQYDUPvHtP9yYIOQdlNosB
	g1CYxLbSu5Uqazn+gLu98jqOeCeLbUxnV777N3Pf60/Nb+xwLdMwgmaug==
X-Received: by 2002:a05:600c:6304:b0:493:e46e:157d with SMTP id 5b1f17b1804b1-496c6565d2fmr101625845e9.19.1785343478961;
        Wed, 29 Jul 2026 09:44:38 -0700 (PDT)
Received: from leap.suse.de ([84.77.88.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a88sm8474869f8f.6.2026.07.29.09.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:44:38 -0700 (PDT)
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Subject: [PATCH 06/14] lib: rpmi: add TSA annotations
Date: Wed, 29 Jul 2026 18:35:33 +0200
Message-ID: <20260729163540.3162978-8-carlos.lopezr4096@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
References: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_094441_286780_71DB5449 
X-CRM114-Status: GOOD (  11.24  )
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
