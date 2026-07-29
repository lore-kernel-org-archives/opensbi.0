Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2BFC53200
	for <opensbi@archiver.kernel.org>; Wed, 29 Jul 2026 16:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4AhSE7OzFwbi+BJcUaLZEBPU3ktRpDUXxZrl/og4kSs=; b=V91ZCdKQvJyR0+
	73cnOMSwxm3dpypzgi3MGpJNyhNnetgEYsE4fEytJuFequEg3+6dXpsRW++rhGWm702zh5txQnDWC
	v5DaAGRvRZ2OnsXXEn/ojPrqlef6BVHXojLMy9ZzZqHjtZR1Ph8PY+omHJ/RIyNyAJgPwX4kQzK+9
	cwwY0FSqIcFekm2QfIKeVggv1BR36TcD9hUE2wUUN2F23RTuxQ6z6xST8BlJP3MUKOIWqxm8O1yzi
	uFD6rNmKFVnoLhs3A/Txaya9LeONXRaobq5ku/Rmv2XpGAUYYTAO8r5DMc2luKy8DySzWaMRx4aC8
	dqb8UqOj2HUBND3hG0Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Of-00000008bQW-3cYe;
	Wed, 29 Jul 2026 16:44:45 +0000
Received: from mail-wm2-x08.google.com ([2a00:1450:4864:31::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Od-00000008bL8-2z8z
	for opensbi@lists.infradead.org;
	Wed, 29 Jul 2026 16:44:44 +0000
Received: by mail-wm2-x08.google.com with SMTP id 5b1f17b1804b1-49559189028so202535e9.0
        for <opensbi@lists.infradead.org>; Wed, 29 Jul 2026 09:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785343482; x=1785948282; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DHeiXyor77ClyFfIsOa5U1murMmbfjdw/tjwXhqwGbo=;
        b=Uip8edkKgcNwneyc5rkTCir5QsIhCjZWUcAxir8wnEGyglxiy6O6s00meFheqiFEVx
         CXlk2LsvI2tIfyyMOJ8/uW6tOEYoyXeUg13lcuyY/I+S1zDSsAhpKguxGl09J0E82cna
         I0UCDCCB5RYcVK7aX7z1ChYKqxn87ecnhMjJmcoDhF4gaXwL4IUVZEUngfZ3NhzSO6Ti
         MzksTPqZbuxAIGjPhsn/mwk52n7ZvwPuROA3mesYX0ArCm0i15/dIXFAVtONLCi9Abzc
         m3imiOv8pSbZmQJQa7CJNfZAfDcJvEU7S9NhY+avopZyEL/rUUxTyLLb3xw5ZWtHcMko
         AqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785343482; x=1785948282;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DHeiXyor77ClyFfIsOa5U1murMmbfjdw/tjwXhqwGbo=;
        b=VpyZZwMul5HbR0qFDW4dYJn1lEXqTMs482PnqKiBz5R31CvDEJwRmGGd99YwudUj8D
         QSEkrVDRp/8pHFy90dpmF21M64MCC4eHEMgQstcNduFXRdDyxOKpzN9O4RSB54wCpcXW
         TV4ipgEq1cdScubHc3+DroDxjmad8mQNRQJuNEf2jUYah/lL/z9zFHWjqYJcOsCg+o4x
         /HoLKtDrQ9Hgwh39Ex+0oZbZ5OrdGsQAU2yu4tP+WjuMNXln8MtOQ5RE7hrTugNZvpox
         9Gm6bc1YInqotoN9682cyaA5pfa+QAMX1MVnpFTPYjEzldhF5SoWO8VLqSHVx83wOrz5
         MQew==
X-Gm-Message-State: AOJu0YwpUMeHkvwfxmUHK1nOtOLxJlo4SaVUxLwUR4Hr9qfVlCACKbXQ
	71XLlEcSw5MaT416rRp4w4Pi02hcYo5af95521LUta6SZtQp286y8rvoOSHp36fyfI8=
X-Gm-Gg: AR+sD11GLOKwPC0ONFyQlvrJlBVPaLuFAXseVEUk8XfXb4pZupAHW01tL2moSA7MDlh
	0Es4UGszCJ7C+6csqUklpZRAOOdu6zNg20SvrmWdrmxLRYy9+hjmzMDDhPE1dZ1Cswj+n2r+qJM
	THcJThnWTZZz9qI0ZI9a9R9vO7J/blx4IjXdnIt00BvtGwqfpKKeVc6uLybWewa62hLsmLOXB2b
	W0jBJsZJpiG0LuUW/iOtqv4+mZ1kRJA0/Yx/O27QsC3k7QXcEEW5dPU8pEPPtjYINOTPiatVtK6
	yUnJi9IKO7U5wCSQazcP173cn3DBfc6GHVXH/Rk6rsvarwMchZwuskMAiezjx24DFpLA4id5Cs3
	yFx91bekL/OTpG5n/QPtW8zulObaXCpw53tUdri3Subg+mVnCc7QDAKVZoftgPWdFFeL3xgwfYv
	Go0CGNLy1Vr6yn/aAJXwsVgaH8b1UWcypPSzCMtANln21V0ulfi0LIvfCZPehtbsiP8BrPoC4iK
	wXiherQ5cNtyIZr0yqJNBeTM/5rVQh0i6XuNFcNw7kng8IY+m/sl3HZAw==
X-Received: by 2002:a05:600c:1e0a:b0:495:6193:c6c0 with SMTP id 5b1f17b1804b1-497fd31a32dmr34739535e9.18.1785343481728;
        Wed, 29 Jul 2026 09:44:41 -0700 (PDT)
Received: from leap.suse.de ([84.77.88.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a88sm8474869f8f.6.2026.07.29.09.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:44:41 -0700 (PDT)
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Subject: [PATCH 09/14] lib: sbi_domain: add TSA annotations
Date: Wed, 29 Jul 2026 18:35:36 +0200
Message-ID: <20260729163540.3162978-11-carlos.lopezr4096@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
References: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_094443_764314_0B1A677A 
X-CRM114-Status: GOOD (  13.85  )
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

QWRkIFRocmVhZCBTYWZldHkgQW5hbHlzaXMgKFRTQSkgYW5ub3RhdGlvbnMgZm9yIHRoZSBkb21h
aW4gaGFuZGxpbmcKY29kZS4gVGhpcyBpbmNsdWRlcyBpbmRpY2F0aW5nIHdoaWNoIGZpZWxkcyBh
cmUgcHJvdGVjdGVkIGJ5IGEgc3BpbmxvY2ssCmFuZCBhbm5vdGF0aW5nIHdoaWNoIGZ1bmN0aW9u
cyBhY3F1aXJlIGEgc3BpbmxvY2ssIGluIG9yZGVyIHRvIHByZXZlbnQKbmVzdGluZy4gRXhjbHVk
ZSBzYmlfZG9tYWluX3JlZ2lzdGVyKCkgZnJvbSBhbmFseXNpcywgYXMgaXQgaW5pdGlhbGl6ZXMK
YSBkb21haW4ncyBzcGlubG9jay4KClNpZ25lZC1vZmYtYnk6IENhcmxvcyBMw7NwZXogPGNhcmxv
cy5sb3BlenI0MDk2QGdtYWlsLmNvbT4KLS0tCiBpbmNsdWRlL3NiaS9zYmlfZG9tYWluLmggICAg
IHwgMTAgKysrKysrLS0tLQogbGliL3NiaS9zYmlfZG9tYWluLmMgICAgICAgICB8ICAzICsrKwog
bGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYyB8ICAyICsrCiAzIGZpbGVzIGNoYW5nZWQsIDEx
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkv
c2JpX2RvbWFpbi5oIGIvaW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5oCmluZGV4IDE2ZWRkNGNlNDQ5
My4uZDRhZDIyOTcyODRlIDEwMDY0NAotLS0gYS9pbmNsdWRlL3NiaS9zYmlfZG9tYWluLmgKKysr
IGIvaW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5oCkBAIC0xOTMsMTAgKzE5MywxMCBAQCBzdHJ1Y3Qg
c2JpX2RvbWFpbiB7CiAJc3RydWN0IHNiaV9kb21haW5fZGF0YV9wcml2IGRhdGFfcHJpdjsKIAkv
KiogTG9naWNhbCBpbmRleCBvZiB0aGlzIGRvbWFpbiAqLwogCXUzMiBpbmRleDsKLQkvKiogSEFS
VHMgYXNzaWduZWQgdG8gdGhpcyBkb21haW4gKi8KLQlzdHJ1Y3Qgc2JpX2hhcnRtYXNrIGFzc2ln
bmVkX2hhcnRzOwogCS8qKiBTcGlubG9jayBmb3IgYWNjZXNzaW5nIGFzc2lnbmVkX2hhcnRzICov
CiAJc3BpbmxvY2tfdCBhc3NpZ25lZF9oYXJ0c19sb2NrOworCS8qKiBIQVJUcyBhc3NpZ25lZCB0
byB0aGlzIGRvbWFpbiAqLworCXN0cnVjdCBzYmlfaGFydG1hc2sgYXNzaWduZWRfaGFydHMgR1VB
UkRFRF9CWSgmYXNzaWduZWRfaGFydHNfbG9jayk7CiAJLyoqIE5hbWUgb2YgdGhpcyBkb21haW4g
Ki8KIAljaGFyIG5hbWVbNjRdOwogCS8qKiBQb3NzaWJsZSBIQVJUcyBpbiB0aGlzIGRvbWFpbiAq
LwpAQCAtMjUyLDcgKzI1Miw4IEBAIGV4dGVybiBzdHJ1Y3Qgc2JpX2RsaXN0IGRvbWFpbl9saXN0
OwogICogQHBhcmFtIGhhcnRpbmRleCB0aGUgSEFSVCBpbmRleAogICogQHJldHVybiB0cnVlIGlm
IEhBUlQgaXMgYXNzaWduZWQgdG8gZG9tYWluIG90aGVyd2lzZSBmYWxzZQogICovCi1ib29sIHNi
aV9kb21haW5faXNfYXNzaWduZWRfaGFydChjb25zdCBzdHJ1Y3Qgc2JpX2RvbWFpbiAqZG9tLCB1
MzIgaGFydGluZGV4KTsKK2Jvb2wgc2JpX2RvbWFpbl9pc19hc3NpZ25lZF9oYXJ0KGNvbnN0IHN0
cnVjdCBzYmlfZG9tYWluICpkb20sIHUzMiBoYXJ0aW5kZXgpCisJTVVTVF9OT1RfSE9MRCgmZG9t
LT5hc3NpZ25lZF9oYXJ0c19sb2NrKTsKIAogLyoqCiAgKiBHZXQgdGhlIGFzc2lnbmVkIEhBUlQg
bWFzayBmb3IgZ2l2ZW4gZG9tYWluCkBAIC0yNjEsNyArMjYyLDggQEAgYm9vbCBzYmlfZG9tYWlu
X2lzX2Fzc2lnbmVkX2hhcnQoY29uc3Qgc3RydWN0IHNiaV9kb21haW4gKmRvbSwgdTMyIGhhcnRp
bmRleCk7CiAgKiBAcmV0dXJuIDAgb24gc3VjY2VzcyBhbmQgU0JJX0V4eHggKDwgMCkgb24gZmFp
bHVyZQogICovCiBpbnQgc2JpX2RvbWFpbl9nZXRfYXNzaWduZWRfaGFydG1hc2soY29uc3Qgc3Ry
dWN0IHNiaV9kb21haW4gKmRvbSwKLQkJCQkgICAgIHN0cnVjdCBzYmlfaGFydG1hc2sgKm1hc2sp
OworCQkJCSAgICAgc3RydWN0IHNiaV9oYXJ0bWFzayAqbWFzaykKKwlNVVNUX05PVF9IT0xEKCZk
b20tPmFzc2lnbmVkX2hhcnRzX2xvY2spOwogCiAvKioKICAqIEluaXRpYWxpemUgYSBkb21haW4g
bWVtb3J5IHJlZ2lvbiBiYXNlZCBvbiBpdCdzIHBoeXNpY2FsCmRpZmYgLS1naXQgYS9saWIvc2Jp
L3NiaV9kb21haW4uYyBiL2xpYi9zYmkvc2JpX2RvbWFpbi5jCmluZGV4IGZhNjkxNzBiZGM5Mi4u
N2JkYjkxMmFjZjI1IDEwMDY0NAotLS0gYS9saWIvc2JpL3NiaV9kb21haW4uYworKysgYi9saWIv
c2JpL3NiaV9kb21haW4uYwpAQCAtNjAsNiArNjAsNyBAQCB2b2lkIHNiaV91cGRhdGVfaGFydGlu
ZGV4X3RvX2RvbWFpbih1MzIgaGFydGluZGV4LCBzdHJ1Y3Qgc2JpX2RvbWFpbiAqZG9tKQogfQog
CiBib29sIHNiaV9kb21haW5faXNfYXNzaWduZWRfaGFydChjb25zdCBzdHJ1Y3Qgc2JpX2RvbWFp
biAqZG9tLCB1MzIgaGFydGluZGV4KQorCU1VU1RfTk9UX0hPTEQoJmRvbS0+YXNzaWduZWRfaGFy
dHNfbG9jaykKIHsKIAlib29sIHJldDsKIAlzdHJ1Y3Qgc2JpX2RvbWFpbiAqdGRvbSA9IChzdHJ1
Y3Qgc2JpX2RvbWFpbiAqKWRvbTsKQEAgLTc2LDYgKzc3LDcgQEAgYm9vbCBzYmlfZG9tYWluX2lz
X2Fzc2lnbmVkX2hhcnQoY29uc3Qgc3RydWN0IHNiaV9kb21haW4gKmRvbSwgdTMyIGhhcnRpbmRl
eCkKIAogaW50IHNiaV9kb21haW5fZ2V0X2Fzc2lnbmVkX2hhcnRtYXNrKGNvbnN0IHN0cnVjdCBz
YmlfZG9tYWluICpkb20sCiAJCQkJICAgICBzdHJ1Y3Qgc2JpX2hhcnRtYXNrICptYXNrKQorCU1V
U1RfTk9UX0hPTEQoJmRvbS0+YXNzaWduZWRfaGFydHNfbG9jaykKIHsKIAl1bG9uZyByZXQgPSAw
OwogCXN0cnVjdCBzYmlfZG9tYWluICp0ZG9tID0gKHN0cnVjdCBzYmlfZG9tYWluICopZG9tOwpA
QCAtNjI3LDYgKzYyOSw3IEBAIHZvaWQgc2JpX2RvbWFpbl9kdW1wX2FsbChjb25zdCBjaGFyICpz
dWZmaXgpCiAKIGludCBzYmlfZG9tYWluX3JlZ2lzdGVyKHN0cnVjdCBzYmlfZG9tYWluICpkb20s
CiAJCQljb25zdCBzdHJ1Y3Qgc2JpX2hhcnRtYXNrICphc3NpZ25fbWFzaykKKwlOT19USFJFQURf
U0FGRVRZX0FOQUxZU0lTCiB7CiAJdTMyIGk7CiAJaW50IHJjOwpkaWZmIC0tZ2l0IGEvbGliL3Ni
aS9zYmlfZG9tYWluX2NvbnRleHQuYyBiL2xpYi9zYmkvc2JpX2RvbWFpbl9jb250ZXh0LmMKaW5k
ZXggY2M0Y2MwNGRkYjQ2Li4zMWYwMGU1YjBmNTYgMTAwNjQ0Ci0tLSBhL2xpYi9zYmkvc2JpX2Rv
bWFpbl9jb250ZXh0LmMKKysrIGIvbGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYwpAQCAtMTA3
LDYgKzEwNyw4IEBAIHN0YXRpYyB2b2lkIGhhcnRfY29udGV4dF9zZXQoc3RydWN0IHNiaV9kb21h
aW4gKmRvbSwgdTMyIGhhcnRpbmRleCwKICAqLwogc3RhdGljIGludCBzd2l0Y2hfdG9fbmV4dF9k
b21haW5fY29udGV4dChzdHJ1Y3QgaGFydF9jb250ZXh0ICpjdHgsCiAJCQkJCSAgc3RydWN0IGhh
cnRfY29udGV4dCAqZG9tX2N0eCkKKwlNVVNUX05PVF9IT0xEKCZjdHgtPmRvbS0+YXNzaWduZWRf
aGFydHNfbG9jaykKKwlNVVNUX05PVF9IT0xEKCZkb21fY3R4LT5kb20tPmFzc2lnbmVkX2hhcnRz
X2xvY2spCiB7CiAJdTMyIGhhcnRpbmRleCA9IGN1cnJlbnRfaGFydGluZGV4KCk7CiAJc3RydWN0
IHNiaV90cmFwX2NvbnRleHQgKnRyYXBfY3R4OwotLSAKMi41MS4wCgoKLS0gCm9wZW5zYmkgbWFp
bGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
