Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647FFC83F1A
	for <opensbi@archiver.kernel.org>; Mon, 21 Jul 2025 17:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cUn9m/PrYI75ikj/L7UnbbIva0408CtgWb+N7kT4Xsg=; b=zCv+NCOTTAlIjB
	CqIVyYsEKEcQfUSFzZI2CKNwLY/Y2OLT4iHjVD6ki8ZuY7drUDyxQ/Zc29Bq1pLSLqQUNzRhW6StJ
	viTIsaizUP/8RWd5mbJ4wTFyKFlsHOMr1wEVCzjWV5r/346ZfQP2xiYebc5RraqCI2GNoTv4zcUqi
	kUcevgELYZE8mHZHzbxiIgbwNhFFOtHe75izfl1G4F1a0xgt/uVQWgAdsXfyMXrbu95w034a69Kff
	sy7t2LH0Dc3tOC2T00dxoDY9Wry50mqbIXovIVCF2Jbzs1Qcw+lprCHUq4SwG5Xkrdtfi9/GK2nnu
	yqYy60R42KLwfQlmTDQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udttL-00000000Gij-2M3Q;
	Mon, 21 Jul 2025 17:01:31 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udt54-000000009Mg-3QAH
	for opensbi@lists.infradead.org;
	Mon, 21 Jul 2025 16:09:35 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45617a1bcdcso8014615e9.1
        for <opensbi@lists.infradead.org>; Mon, 21 Jul 2025 09:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753114173; x=1753718973; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xEv33+pOqFrUb/YCIBO+K8svX4pUekGE5U01rpdWYrM=;
        b=j92oJbExyGYPe/q/EKtlgXgyHSakQCa3tNwrhhXtu0/bq/tGoOk6276Y9VYJ+ZzOBs
         +5SEKw26gEbbsR5A3ic3bR1pSfx/hh4llfgCp8Z22QUUKoPeZ0e4ZmE/we5yvKr9mu6s
         IFBKuxW1kTGYm7lx5r/bdYddhHW9exdChIHq18X+mkuZSFNJIDV0RxKkseNahtWZA6l4
         Ne4J4h9wnb0hsa8Mtap7/HHLuKRSaxvuzpr9PNtyLSORO1JoQs36CappYlniZH7b0Gt/
         iRHhcOrlb0NOU9JXYbJbUo2U1YEnflBmgLHEkJJ1f3vom1QAPHlTDuoV5rUVI1J+YMiy
         eKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753114173; x=1753718973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xEv33+pOqFrUb/YCIBO+K8svX4pUekGE5U01rpdWYrM=;
        b=mH9s0gueQx6+d5gihETDJHSY6VKPsCdi98ZMnEIS5zRJF0jcXR3r8hwW1bhn1UmcE+
         rHdUo6HJw3ixSKsxbDWa04V8L0ByAl1Bv7cOpsWWOA1SpHdWnqXjGByu0T7NLLd6zzOd
         fnUiO/HRCQpfaeV/Ge/4U1gzIFg7iqha1OPByUfpe+c+3rGwcnp+3gyPu4pXP+R+fVXr
         0QacFXHq374PxWnGhWCziXZRt0wa4tUE5cH/rm0AhXB8eSs6zwWjAuNPtpYuI67wbS/n
         Tq3ERyzzdMO9Tlh601WVo0T8KoBwpbR7/q5VWA5qI8p+hRNipYWXxKkhcLLt8WF5tpV2
         1kpQ==
X-Gm-Message-State: AOJu0Yzb1KUVGGrTViZoyMjXKgGUDnOs0Pan0OfZFJMJyyJUqSS2kVRF
	JPAYE/5sMCWy15eMsEkxyKRsTGMY3JhiBYSW6IN1jcrm2QVw2OZfw5tvPVNaZQ==
X-Gm-Gg: ASbGnctiC7X9ww/ophgT2pl0uMh8uWq0sbYFWYDxiRNoZRZld7l9SRz0C0rEC1B3Rpl
	QgsFKH+tANPsNC6UOQCj43bPaFF2E1i5umPz0ZtpeeeVYxSDxpjvxSKBBLEFeiHJxrp6u3kUUNv
	KVxQ67Ssb9QtvqIA0wTiEzo3Toij8ZxO29qFcADk5wd6gQM2sh+S7NbO5hw39cwoFlcA9dZX+ad
	2mkTBSMJc65eqzCzVaz3VcnvBrRu0EJWoSpzvGaSYDcACRxeHhF0BD0eL4hnMUBWrYMeKxA5Drf
	t3S4heh4W7X/i4n99Ij14g0MtWiMIT7xZBthkNEusQQ/DJbFxqHskTUEbT930Oti4Y5rT8N4rmX
	Hh+aP+gwFcxTks4OOx5Ff+B5jKSzp01PpYz8ZLMtN92nhKsPGILYWmWVCq+v8g3IkZ91HpmqEV7
	u7sfh8IYmRIzI=
X-Google-Smtp-Source: AGHT+IFlRCWrdQKFVf/mWL9Eptu1M5bWIjs/1FgMwnLkQpaYr/n0rPjBr19pPA402RNjj5Lx3QOi7w==
X-Received: by 2002:a5d:588e:0:b0:3a5:2d42:aa1e with SMTP id ffacd0b85a97d-3b60dd91d78mr7834925f8f.15.1753114173142;
        Mon, 21 Jul 2025 09:09:33 -0700 (PDT)
Received: from LT-5CD4135M7L.localdomain (215.red-83-41-148.dynamicip.rima-tde.net. [83.41.148.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b5b8475sm104555305e9.12.2025.07.21.09.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 09:09:32 -0700 (PDT)
From: =?UTF-8?q?Manuel=20Hern=C3=A1ndez=20M=C3=A9ndez?= <maherme.dev@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Manuel=20Hern=C3=A1ndez=20M=C3=A9ndez?= <maherme.dev@gmail.com>
Subject: [PATCH] platform: openpiton: Add PMU initialization
Date: Mon, 21 Jul 2025 18:09:20 +0200
Message-Id: <20250721160920.8818-1-maherme.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_090934_853981_0AAC840C 
X-CRM114-Status: GOOD (  14.06  )
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

VGhlIE9wZW5QaXRvbiBmcmFtZXdvcmsgaGFzIGEgZ2VuZXJpYyBQTVUgdGhhdCBpcyBub3QgdXNl
ZCBieSBPcGVuU0JJLgpEdWUgdG8gT3BlblNCSeKAmXMgYnVpbGQgc3lzdGVtIHdlIGNhbm5vdCBk
aXJlY3RseSByZXVzZSB0aGUgZ2VuZXJpYwpwbGF0Zm9ybSBmdW5jdGlvbnMsIHNvIHNpbXBseSBj
b3B5IHRoZW0gdG8gdGhlIE9wZW5QaXRvbiBwbGF0Zm9ybS4KClNpZ25lZC1vZmYtYnk6IE1hbnVl
bCBIZXJuw6FuZGV6IE3DqW5kZXogPG1haGVybWUuZGV2QGdtYWlsLmNvbT4KLS0tCiBwbGF0Zm9y
bS9mcGdhL29wZW5waXRvbi9wbGF0Zm9ybS5jIHwgMzkgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Bs
YXRmb3JtL2ZwZ2Evb3BlbnBpdG9uL3BsYXRmb3JtLmMgYi9wbGF0Zm9ybS9mcGdhL29wZW5waXRv
bi9wbGF0Zm9ybS5jCmluZGV4IGQyY2YzZTMyLi4wODEzNjg1OSAxMDA2NDQKLS0tIGEvcGxhdGZv
cm0vZnBnYS9vcGVucGl0b24vcGxhdGZvcm0uYworKysgYi9wbGF0Zm9ybS9mcGdhL29wZW5waXRv
bi9wbGF0Zm9ybS5jCkBAIC0xMSw2ICsxMSw3IEBACiAjaW5jbHVkZSA8c2JpL3NiaV9wbGF0Zm9y
bS5oPgogI2luY2x1ZGUgPHNiaV91dGlscy9mZHQvZmR0X2hlbHBlci5oPgogI2luY2x1ZGUgPHNi
aV91dGlscy9mZHQvZmR0X2ZpeHVwLmg+CisjaW5jbHVkZSA8c2JpX3V0aWxzL2ZkdC9mZHRfcG11
Lmg+CiAjaW5jbHVkZSA8c2JpX3V0aWxzL2lwaS9hY2xpbnRfbXN3aS5oPgogI2luY2x1ZGUgPHNi
aV91dGlscy9pcnFjaGlwL3BsaWMuaD4KICNpbmNsdWRlIDxzYmlfdXRpbHMvc2VyaWFsL3VhcnQ4
MjUwLmg+CkBAIC0xNTYsNiArMTU3LDQyIEBAIHN0YXRpYyBpbnQgb3BlbnBpdG9uX3RpbWVyX2lu
aXQodm9pZCkKIAlyZXR1cm4gYWNsaW50X210aW1lcl9jb2xkX2luaXQoJm10aW1lciwgTlVMTCk7
CiB9CiAKKy8qCisgKiBJbml0aWFsaXplIG9wZW5waXRvbiBwbXUgZHVyaW5nIGNvbGQgYm9vdC4K
KyAqLworaW50IG9wZW5waXRvbl9wbXVfaW5pdCh2b2lkKQoreworCWludCByYzsKKworCXJjID0g
ZmR0X3BtdV9zZXR1cChmZHRfZ2V0X2FkZHJlc3MoKSk7CisJaWYgKHJjICYmIHJjICE9IFNCSV9F
Tk9FTlQpCisJCXJldHVybiByYzsKKworCXJldHVybiAwOworfQorCit1aW50NjRfdCBvcGVucGl0
b25fcG11X3hsYXRlX3RvX21ocG1ldmVudCh1aW50MzJfdCBldmVudF9pZHgsIHVpbnQ2NF90IGRh
dGEpCit7CisJdWludDY0X3QgZXZ0X3ZhbCA9IDA7CisKKwkvKiBkYXRhIGlzIHZhbGlkIG9ubHkg
Zm9yIHJhdyBldmVudHMgYW5kIGlzIGVxdWFsIHRvIGV2ZW50IHNlbGVjdG9yICovCisJaWYgKGV2
ZW50X2lkeCA9PSBTQklfUE1VX0VWRU5UX1JBV19JRFggfHwKKwkJZXZlbnRfaWR4ID09IFNCSV9Q
TVVfRVZFTlRfUkFXX1YyX0lEWCkKKwkJZXZ0X3ZhbCA9IGRhdGE7CisJZWxzZSB7CisJCS8qKgor
CQkgKiBHZW5lcmljIHBsYXRmb3JtIGZvbGxvd3MgdGhlIFNCSSBzcGVjaWZpY2F0aW9uIHJlY29t
bWVuZGF0aW9uCisJCSAqIGkuZS4gemVybyBleHRlbmRlZCBldmVudF9pZHggaXMgdXNlZCBhcyBt
aHBtZXZlbnQgdmFsdWUgZm9yCisJCSAqIGhhcmR3YXJlIGdlbmVyYWwvY2FjaGUgZXZlbnRzIGlm
IHBsYXRmb3JtIGRvZXMndCBkZWZpbmUgb25lLgorCQkgKi8KKwkJZXZ0X3ZhbCA9IGZkdF9wbXVf
Z2V0X3NlbGVjdF92YWx1ZShldmVudF9pZHgpOworCQlpZiAoIWV2dF92YWwpCisJCQlldnRfdmFs
ID0gKHVpbnQ2NF90KWV2ZW50X2lkeDsKKwl9CisKKwlyZXR1cm4gZXZ0X3ZhbDsKK30KKwogLyoK
ICAqIFBsYXRmb3JtIGRlc2NyaXB0b3IuCiAgKi8KQEAgLTE2NSw2ICsyMDIsOCBAQCBjb25zdCBz
dHJ1Y3Qgc2JpX3BsYXRmb3JtX29wZXJhdGlvbnMgcGxhdGZvcm1fb3BzID0gewogCS5pcnFjaGlw
X2luaXQgPSBvcGVucGl0b25faXJxY2hpcF9pbml0LAogCS5pcGlfaW5pdCA9IG9wZW5waXRvbl9p
cGlfaW5pdCwKIAkudGltZXJfaW5pdCA9IG9wZW5waXRvbl90aW1lcl9pbml0LAorCS5wbXVfaW5p
dCA9IG9wZW5waXRvbl9wbXVfaW5pdCwKKwkucG11X3hsYXRlX3RvX21ocG1ldmVudCA9IG9wZW5w
aXRvbl9wbXVfeGxhdGVfdG9fbWhwbWV2ZW50LAogfTsKIAogY29uc3Qgc3RydWN0IHNiaV9wbGF0
Zm9ybSBwbGF0Zm9ybSA9IHsKLS0gCjIuMzQuMQoKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApv
cGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9vcGVuc2JpCg==
