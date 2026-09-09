Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D816AC79FB6
	for <opensbi@archiver.kernel.org>; Wed,  9 Sep 2026 16:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d2Ek4CLwiBgcz7FFYT6PNn5ETaQjdVgKM2/i91woCpU=; b=AnOZoUP4ZFqOv+
	qNNlWH4pYnjgMtZPS8nIPKGvzho5+AlbA2E/xogf42mLjw6kspf1InD8uKgiYVfCu5vnzhOFfyO4t
	/UTnjggWbvCaPqbO9IMhOEnx3hzNxGVv3kRqyn3BENgr/dM4SKG4Dv8hVpxTyWYPFWD4o1ywxRID2
	RbtKsamZe80BmAUtENrJsxZ1MfZRwW9RPHjm7ECfVCGQOmWO9oYvTLalWvZ3sg83OuGcQTjDtG68m
	MNSmTWlbUZfbwsE0GGjqSHeZQmcA3Uws9fANNZ6J6rB6ntnosINefSNJq38J5IlA4JfbsOzBVHvfk
	4G6UC4ZlPKWI08429Z5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LDB-0000000CJwE-339C;
	Wed, 09 Sep 2026 16:31:49 +0000
Received: from mail-wm2-x01.google.com ([2a00:1450:4864:31::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LD8-0000000CJsl-1sTS
	for opensbi@lists.infradead.org;
	Wed, 09 Sep 2026 16:31:48 +0000
Received: by mail-wm2-x01.google.com with SMTP id 5b1f17b1804b1-49ced856e8dso26538645e9.0
        for <opensbi@lists.infradead.org>; Wed, 09 Sep 2026 09:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788971505; x=1789576305; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LCWRw1iijbc5NT4ty7WOTyJmyjCFAXRXHHvccDTOti8=;
        b=rc2GSAyt/Rz2GvDoS/x8Lw3a5k14/pK/3sqPFmavTLayGsomYaanCrKm3JfEr9Wvs+
         dEBMHk06J4bEdySfZBBX7zd+WXQ+G7BA+6IvmhliLNL7QKU88/D8ANqemq+e14xiEzAm
         y6hBWoim97BxLbI328FQ/nII/BGaZ2I7/iNApX73wD8RqLXv2K7HmpXI/PS0Ph6ceZa9
         tOTjuEN7TN38SkYj2IFKNnUlNIJ5CCpYu9BnwFeU4vFI0UKOZy63AHmTXOFEiYbiv32v
         gINrmMsiWep6nPt3i4UjFnpj7uCgLDo91bWLz3bSUjnYBNwY6SipWCOXQgpBSbC2XvKV
         uAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788971505; x=1789576305;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCWRw1iijbc5NT4ty7WOTyJmyjCFAXRXHHvccDTOti8=;
        b=n5JxNUr7XgVuz3plwuUoxBeVN0pKzjv+1pnPlyhs0BjONt2bZwMGoWR6xSWN4H3aay
         1t34eNSKlJu/DU/TweQd5436+fIqPoNhD/IWI58Ljt4aCwBsAwkforEI/hSSE8iUZgPW
         BMKK/RgonhgCwnezf73g/hteQp43Q8Pg9MXLThPHREKCU7wp+OU7HlPKK5NR4x8v2ESt
         dabxJuZH7o2oyf+EWI1hax3YznVG84J/UtQwgNc4rr+15cdZ6Nz47NM/rDn+UsFrYzzu
         TAp7x1g/d3VI152q3a8fKzD+asS5bBr5eGylsgzaW+N4qnCfQ6211uGHIyQBhQ7cpzSk
         bWNg==
X-Gm-Message-State: AFuF++lZBexevDYmbx4oDsQzvavUNjyQs596Hhmc6ml1HA0r2cvEYk+l
	iogNEDULvJvc531uZv2O8vBjccLgqOEuNP/UiRRl97rQWn2KaWN5ASb8o/bGqTSl
X-Gm-Gg: AYBFou1sgIFfvXbQhKojoxlecSa5CpUEH7bCFjO4DylgurMiSKRVyNaWGI3HPZVSM28
	XZAhnq0mDcs/tenskw4TX2RptBTKcz+Q8UcgltgEszLm4Bp44dHroQ0OYkzLYdpeJGemJkQ/oMh
	323ojvp4HGkQGuXOe5KRvKpGLxPI77Qbaho4cHLo65rcyUIJ4L4nvHtL8aBijRjWGNErM7HQjJc
	kP+A1IMsoWgixk8AapRMyaOWd3eF0Nnx+zYH/JjHNeXZLHuyqy9iQ45FeEIZeoSkNFrZp2RCtll
	tBv1I9S6arkynG1cKJK6ujRdX2+D2UkBbCvAAnXHc6UO3tc9Jbg60bIwFLq911n2SRBrHjc0DKx
	laua67nm+7uqZ8GGOi2a2MEZb1qQiNaOp7httlKGERZVB0xCVgBqGrs+sZRfn3J4jkouUTvtRZB
	WmYkR+ogv9y02DMzblengOh/SttsJPuxYJ6vS7Tfxqdl0hygQO7wMytiQt89T+R1WO2dHHb4c/K
	wwCas5khXHB2MZEIUOnBl6uqnOOlb3R0MUHd1YKRL7ovPPcSOwcupjdxEiEEUf0aPgdmeMHR4KD
	LXY=
X-Received: by 2002:a05:600c:638d:b0:49d:2450:68ac with SMTP id 5b1f17b1804b1-49d258dfc8bmr49604275e9.5.1788971504201;
        Wed, 09 Sep 2026 09:31:44 -0700 (PDT)
Received: from localhost.localdomain ([84.77.88.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c06f04sm2763705e9.13.2026.09.09.09.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 09:31:39 -0700 (PDT)
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Subject: [PATCH v2 12/14] lib: sbi_sse: add TSA annotations
Date: Wed,  9 Sep 2026 18:23:21 +0200
Message-ID: <20260909162322.29778-14-carlos.lopezr4096@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
References: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_093147_479194_288047B6 
X-CRM114-Status: GOOD (  15.83  )
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

Tm93IHRoYXQgdGhlIGxvY2sgcmVsYXRpb25zaGlwIGJldHdlZW4gYW4gZXZlbnQgYW5kIGl0cyBv
d25lciBoYXJ0IGlzCmV4cGxpY2l0LCBhZGQgVFNBIGFubm90YXRpb25zIGZvciB0aGUgU1NFIGhh
bmRsaW5nIGNvZGUuIFRoaXMgaW5jbHVkZXMKaW5kaWNhdGluZyB3aGljaCBmaWVsZHMgYXJlIHBy
b3RlY3RlZCBieSBhIHNwaW5sb2NrLCBhcyB3ZWxsIGFzCmFubm90YXRpbmcgd2hpY2ggZnVuY3Rp
b25zIG5lZWQgdG8gcnVuIHVuZGVyIGEgc3BpbmxvY2suCgpFeGNsdWRlIHNzZV9sb2NhbF9pbml0
KCksIHdoaWNoIGluaXRpYWxpemVzIHRoZSBzcGlubG9jayB0byBiZSBhY3F1aXJlZCwKYW5kIHNz
ZV9ldmVudF9nZXQoKSAvIHNzZV9ldmVudF9wdXQoKSwgd2hpY2ggcGVyZm9ybSBjb25kaXRpb25h
bCBsb2NraW5nCnRoYXQgVFNBIGlzIG5vdCBhYmxlIHRvIGZvbGxvdyBwcm9wZXJseS4KClNpZ25l
ZC1vZmYtYnk6IENhcmxvcyBMw7NwZXogPGNhcmxvcy5sb3BlenI0MDk2QGdtYWlsLmNvbT4KLS0t
CiBsaWIvc2JpL3NiaV9zc2UuYyB8IDMyICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvbGliL3NiaS9zYmlfc3NlLmMgYi9saWIvc2JpL3NiaV9zc2UuYwppbmRleCAzOWU1
Mjc1MmIwMjQuLjc2N2VhMTI4MDAxNCAxMDA2NDQKLS0tIGEvbGliL3NiaS9zYmlfc3NlLmMKKysr
IGIvbGliL3NiaS9zYmlfc3NlLmMKQEAgLTEwOCw2ICsxMDgsMTEgQEAgc3RydWN0IHNiaV9zc2Vf
ZXZlbnQgewogCiAvKiogUGVyLWhhcnQgc3RhdGUgKi8KIHN0cnVjdCBzc2VfaGFydF9zdGF0ZSB7
CisJLyoqCisJICogTG9jayB0aGF0IHByb3RlY3RzIGVuYWJsZWRfZXZlbnRfbGlzdAorCSAqLwor
CXNwaW5sb2NrX3QgZW5hYmxlZF9ldmVudF9sb2NrOworCiAJLyogUHJpb3JpdHkgc29ydGVkIGxp
c3Qgb2YgZW5hYmxlZCBldmVudHMgKGdsb2JhbCBhbmQgbG9jYWwgaW4gPj0KIAkgKiBFTkFCTEVE
IHN0YXRlKS4gVGhpcyBsaXN0IGlzIHByb3RlY3RlZCBieSB0aGUgZW5hYmxlZF9ldmVudF9sb2Nr
LgogCSAqCkBAIC0xMjQsMTIgKzEyOSw3IEBAIHN0cnVjdCBzc2VfaGFydF9zdGF0ZSB7CiAJICog
dGhpcyBlbmFibGVkX2V2ZW50X2xpc3QgYW5kIHRodXMgY2FuIG9ubHkgYmUgcmVtb3ZlZCBmcm9t
IHRoaXMKIAkgKiBsaXN0IHVwb24gZGlzYWJsZSBlY2FsbCBvciBvbiBjb21wbGV0ZSB3aXRoIE9O
RVNIT1QgZmxhZy4KIAkgKi8KLQlzdHJ1Y3Qgc2JpX2RsaXN0IGVuYWJsZWRfZXZlbnRfbGlzdDsK
LQotCS8qKgotCSAqIExvY2sgdGhhdCBwcm90ZWN0cyBlbmFibGVkX2V2ZW50X2xpc3QKLQkgKi8K
LQlzcGlubG9ja190IGVuYWJsZWRfZXZlbnRfbG9jazsKKwlzdHJ1Y3Qgc2JpX2RsaXN0IGVuYWJs
ZWRfZXZlbnRfbGlzdCBHVUFSREVEX0JZKCZlbmFibGVkX2V2ZW50X2xvY2spOwogCiAJLyoqCiAJ
ICogTGlzdCBvZiBsb2NhbCBldmVudHMgYWxsb2NhdGVkIGF0IGJvb3QgdGltZS4KQEAgLTE0Nywx
NiArMTQ3LDE2IEBAIHN0cnVjdCBzc2VfaGFydF9zdGF0ZSB7CiAgKiBHbG9iYWwgZXZlbnRzIGFy
ZSBhY2Nlc3NpYmxlIGJ5IGFsbCBoYXJ0cwogICovCiBzdHJ1Y3Qgc3NlX2dsb2JhbF9ldmVudCB7
Ci0JLyoqCi0JICogZ2xvYmFsIGV2ZW50IHN0cnVjdAotCSAqLwotCXN0cnVjdCBzYmlfc3NlX2V2
ZW50IGV2ZW50OwotCiAJLyoqCiAJICogR2xvYmFsIGV2ZW50IGxvY2sgcHJvdGVjdGluZyBhY2Nl
c3MgZnJvbSBtdWx0aXBsZSBoYXJ0cyBmcm9tIGVjYWxsIHRvCiAJICogdGhlIGV2ZW50LgogCSAq
LwogCXNwaW5sb2NrX3QgbG9jazsKKworCS8qKgorCSAqIGdsb2JhbCBldmVudCBzdHJ1Y3QKKwkg
Ki8KKwlzdHJ1Y3Qgc2JpX3NzZV9ldmVudCBldmVudCBHVUFSREVEX0JZKCZsb2NrKTsKIH07CiAK
IHN0cnVjdCBzc2VfZXZlbnRfaW5mbyB7CkBAIC0yNzIsNyArMjcyLDggQEAgc3RhdGljIHZvaWQg
c3NlX2V2ZW50X3NldF9zdGF0ZShzdHJ1Y3Qgc2JpX3NzZV9ldmVudCAqZSwKIAllLT5hdHRycy5z
dGF0dXMgfD0gbmV3X3N0YXRlOwogfQogCi1zdGF0aWMgaW50IHNzZV9ldmVudF9nZXQodWludDMy
X3QgZXZlbnRfaWQsIHN0cnVjdCBzYmlfc3NlX2V2ZW50ICoqZXJldCkKK3N0YXRpYyBpbnQgc3Nl
X2V2ZW50X2dldCh1aW50MzJfdCBldmVudF9pZCwKKwkJCSBzdHJ1Y3Qgc2JpX3NzZV9ldmVudCAq
KmVyZXQpIE5PX1RIUkVBRF9TQUZFVFlfQU5BTFlTSVMKIHsKIAl1bnNpZ25lZCBpbnQgaTsKIAlz
dHJ1Y3Qgc2JpX3NzZV9ldmVudCAqZTsKQEAgLTMwOSw3ICszMTAsNyBAQCBzdGF0aWMgaW50IHNz
ZV9ldmVudF9nZXQodWludDMyX3QgZXZlbnRfaWQsIHN0cnVjdCBzYmlfc3NlX2V2ZW50ICoqZXJl
dCkKIAlyZXR1cm4gU0JJX0VJTlZBTDsKIH0KIAotc3RhdGljIHZvaWQgc3NlX2V2ZW50X3B1dChz
dHJ1Y3Qgc2JpX3NzZV9ldmVudCAqZSkKK3N0YXRpYyB2b2lkIHNzZV9ldmVudF9wdXQoc3RydWN0
IHNiaV9zc2VfZXZlbnQgKmUpIE5PX1RIUkVBRF9TQUZFVFlfQU5BTFlTSVMKIHsKIAlzdHJ1Y3Qg
c3NlX2dsb2JhbF9ldmVudCAqZ2U7CiAKQEAgLTMzMCw2ICszMzEsNyBAQCBzdGF0aWMgdm9pZCBz
c2VfZXZlbnRfcmVtb3ZlX2Zyb21fbGlzdChzdHJ1Y3Qgc2JpX3NzZV9ldmVudCAqZSkKICAqLwog
c3RhdGljIHZvaWQgc3NlX2V2ZW50X2FkZF90b19saXN0KHN0cnVjdCBzc2VfaGFydF9zdGF0ZSAq
c3RhdGUsCiAJCQkJICAgc3RydWN0IHNiaV9zc2VfZXZlbnQgKmUpCisJTVVTVF9IT0xEKCZzdGF0
ZS0+ZW5hYmxlZF9ldmVudF9sb2NrKQogewogCXN0cnVjdCBzYmlfc3NlX2V2ZW50ICp0bXA7CiAK
QEAgLTM0OCw2ICszNTAsNyBAQCBzdGF0aWMgdm9pZCBzc2VfZXZlbnRfYWRkX3RvX2xpc3Qoc3Ry
dWN0IHNzZV9oYXJ0X3N0YXRlICpzdGF0ZSwKICAqLwogc3RhdGljIGludCBzc2VfZXZlbnRfZGlz
YWJsZShzdHJ1Y3Qgc3NlX2hhcnRfc3RhdGUgKnNocywKIAkJCSAgICAgIHN0cnVjdCBzYmlfc3Nl
X2V2ZW50ICplKQorCU1VU1RfSE9MRCgmc2hzLT5lbmFibGVkX2V2ZW50X2xvY2spCiB7CiAJaWYg
KHNzZV9ldmVudF9zdGF0ZShlKSAhPSBTQklfU1NFX1NUQVRFX0VOQUJMRUQpCiAJCXJldHVybiBT
QklfRUlOVkFMSURfU1RBVEU7CkBAIC03ODEsNiArNzg0LDcgQEAgc3RhdGljIGludCBzc2VfaW5q
ZWN0X2V2ZW50KHVpbnQzMl90IGV2ZW50X2lkLCB1bnNpZ25lZCBsb25nIGhhcnRpZCkKICAqLwog
c3RhdGljIGludCBzc2VfZXZlbnRfZW5hYmxlKHN0cnVjdCBzc2VfaGFydF9zdGF0ZSAqc2hzLAog
CQkJICAgICBzdHJ1Y3Qgc2JpX3NzZV9ldmVudCAqZSkKKwlNVVNUX0hPTEQoJnNocy0+ZW5hYmxl
ZF9ldmVudF9sb2NrKQogewogCWlmIChzc2VfZXZlbnRfc3RhdGUoZSkgIT0gU0JJX1NTRV9TVEFU
RV9SRUdJU1RFUkVEKQogCQlyZXR1cm4gU0JJX0VJTlZBTElEX1NUQVRFOwpAQCAtODAxLDYgKzgw
NSw3IEBAIHN0YXRpYyBpbnQgc3NlX2V2ZW50X2NvbXBsZXRlKHN0cnVjdCBzc2VfaGFydF9zdGF0
ZSAqc2hzLAogCQkJICAgICAgc3RydWN0IHNiaV9zc2VfZXZlbnQgKmUsCiAJCQkgICAgICBzdHJ1
Y3Qgc2JpX3RyYXBfcmVncyAqcmVncywKIAkJCSAgICAgIHN0cnVjdCBzYmlfZWNhbGxfcmV0dXJu
ICpvdXQpCisJTVVTVF9IT0xEKCZzaHMtPmVuYWJsZWRfZXZlbnRfbG9jaykKIHsKIAlpZiAoc3Nl
X2V2ZW50X3N0YXRlKGUpICE9IFNCSV9TU0VfU1RBVEVfUlVOTklORykKIAkJcmV0dXJuIFNCSV9F
SU5WQUxJRF9TVEFURTsKQEAgLTExNzUsNiArMTE4MCw3IEBAIHN0YXRpYyBpbnQgc3NlX2dsb2Jh
bF9pbml0KCkKIH0KIAogc3RhdGljIHZvaWQgc3NlX2xvY2FsX2luaXQoc3RydWN0IHNzZV9oYXJ0
X3N0YXRlICpzaHMpCisJTk9fVEhSRUFEX1NBRkVUWV9BTkFMWVNJUwogewogCXVuc2lnbmVkIGlu
dCBldiA9IDA7CiAJc3RydWN0IHNzZV9ldmVudF9pbmZvICppbmZvOwotLSAKMi41MS4wCgoKLS0g
Cm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
