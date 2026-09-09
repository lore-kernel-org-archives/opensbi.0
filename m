Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801D4C88E40
	for <opensbi@archiver.kernel.org>; Wed,  9 Sep 2026 16:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9XZtB4zfan0ykD+mMaQ39w/HjijLNv/xA63XLCA/hF8=; b=xOMph8L7Wut19K
	VzBy7/saE1Y/634HULpNzXkOxpME46Y8UJo8Es+69en1/UpMgkIE+t2avvA/n6+fvVbAWQDbsFtsY
	F64d2uTwFTxXWIbGJaCHi5JxsHPfI51s3oj9HZ/rvrDWD/kNklRB3ih2Ls9GCXtupuCaXLhjOkmHA
	UZhsOT57qNHqMh0D1uzRuM/JXWqjQ/w9DLcu0q0BfhKMMks0iw1hiS82MwtB1qyGwOgN18bCDrOzL
	VyJKfSB7WQoLRtH4JD72X2VI9q8LSkZ3V12l6ILxPuHOhlRVPhkGbUQJ+7802NAd8BKyVS/dWhOl3
	GcCkneHVirGHgEI5z4uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LCm-0000000CJcP-0yxm;
	Wed, 09 Sep 2026 16:31:24 +0000
Received: from mail-wm2-x01.google.com ([2a00:1450:4864:31::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LCk-0000000CJZp-1f3y
	for opensbi@lists.infradead.org;
	Wed, 09 Sep 2026 16:31:23 +0000
Received: by mail-wm2-x01.google.com with SMTP id 5b1f17b1804b1-49ced856e8dso26537565e9.0
        for <opensbi@lists.infradead.org>; Wed, 09 Sep 2026 09:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788971480; x=1789576280; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DktoNAKqKLYOXLHBqh97l1TqFc4XW/c0MNrB8C2nkBM=;
        b=R0PNZxNjZgnvOCth2EtXN8ZRKy82SKXmu9prZFaZe2FYkf/bxbD5H/7GsMVEgRHskM
         fPdXHicwfPTEwu4qpoJuV/MLkN0lJ2yJXkx+WL18zXJbWrqYpfp1/YlFbXE1yoncJQec
         N1OupjEeZUXZxzncF4AsP9ptYK6ptkNOyTpVPh4T05An8lSLzd+V99csujsb8y7OUqR2
         T2tIGSfYKgJbzv/mN+zq+agbuDSHrSf1Ymt38idJEi7vNJlgx0zNlVKTpRXUU5sOdLj1
         +U5GXa4/bX9CUZxcqDDqm/MP1G8ifDH2HrXmuKb6do8wmG8y9zCBxjct3jsgsdUSwS9y
         zguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788971480; x=1789576280;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DktoNAKqKLYOXLHBqh97l1TqFc4XW/c0MNrB8C2nkBM=;
        b=U2TUFzFcJKAA0Zm1eE/qW7BRSYgOJNVPmfE0+d38KjVnT/0yR+GrAidpjLDzmdwfnE
         jzUKSuJ7qFOksyRlj6iGYP1ZuKMGVdk/+robqdO9asnsVgmyNaVEAU8BZcOQtmAKpFBL
         w1QKOJXli8RuZAo3ofOO8dY8CjalXxMByFrpG06Fo/TSV0rkuVX72sWxwJ+VjZVxtZYl
         zMAckUAWGl9yfo2Z/O1bKKBoXRU7dKEbxBny/r7pF8tgT5SuP//MsZarMnUZfHFHJr72
         9wOC8q7Mh9dUf9VjG7XQFJjXbQtkaaD1NIiYEo6bW9Q57Jfe+iCc8ycOd7bI0P1c+UIS
         tcxw==
X-Gm-Message-State: AFuF++lYgVR+trI5nCWXJ2DvLvXVjAV0sgkl+GK4nVpnSL8Mot8vjula
	Pxm2vj5fWOyyyG2AEPowk6g6+57BjS4zgK8uW+xlf7j0JUQHGyFzuTfQ/KjIfbeq
X-Gm-Gg: AYBFou38CEICC/kRLecMMj0/mmh1//Norq1jHSse0gYkvRIjfs2/uBQ78Xt1T3swaFa
	knBmQaqHuXRR+0vSFkANqUgc4irpipPqB01/wLJCcrnSyhWm66uLuTBAwgDs4MMtYOsVy63/oY+
	fvafpgphuUE7yL8c7mOaSzK4+v3iSegusAVbTMffdk4hMFh1aRPVmNLIUE3ENV+lZPdlWNdmlw2
	lHqoXxkWdIvHzmuWWC4Zm20THnvltx3BVhBTa1Ul6s1Jm1ofVlhL76jjMx+92VgAd+EOaZkugse
	utyPOQyzFpIoxYSoP5j1UfaG4n2k2kIVVZ1MLh09IlE914HgtpLiOS7cymcH5kgy8cEDBiV3ooP
	X9kRbQdNMuC6tuzNMtUWfBIG+hV16xV49omuiIT/41SbS8xqrgiSp6XZhdGhNmnjzPPrLWLYeX8
	wnF6CW6FQtCoYLs1/WACwfhsgJyBslrDRp4ued8GWIhmksKKuNCuPWJu8Mbw4pXBFV1K2ZTwSDZ
	u82/mvYhXz8yudFYZTWkJUagk1Tgrpkcc7Po7etOz9LuDVVW6NtY+Rci5TelHYUjEw38cuLFXiu
	xeM=
X-Received: by 2002:a05:600c:630a:b0:49c:f89b:f82 with SMTP id 5b1f17b1804b1-49d2592c540mr44712675e9.12.1788971480453;
        Wed, 09 Sep 2026 09:31:20 -0700 (PDT)
Received: from localhost.localdomain ([84.77.88.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c06f04sm2763705e9.13.2026.09.09.09.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 09:31:18 -0700 (PDT)
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Subject: [PATCH v2 04/14] lib: sbi_heap: add TSA annotations
Date: Wed,  9 Sep 2026 18:23:13 +0200
Message-ID: <20260909162322.29778-6-carlos.lopezr4096@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
References: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_093122_452624_57A9E5A6 
X-CRM114-Status: GOOD (  11.12  )
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

QWRkIFRocmVhZCBTYWZldHkgQW5hbHlzaXMgKFRTQSkgYW5ub3RhdGlvbnMgZm9yIHRoZSBoZWFw
IGFsbG9jYXRvci4KVGhpcyBpbmNsdWRlcyBpbmRpY2F0aW5nIHdoaWNoIGZpZWxkcyBhcmUgcHJv
dGVjdGVkIGJ5IGEgc3BpbmxvY2sgYW5kCmFubm90YXRpbmcgZnVuY3Rpb25zIHRoYXQgbXVzdCBi
ZSBjYWxsZWQgdW5kZXIgYSBzcGlubG9jay4gRXhjbHVkZQpzYmlfaGVhcF9pbml0X25ldygpLCBh
cyB0aGUgc3BpbmxvY2sgY2Fubm90IGJlIGFjcXVpcmVkIGJlZm9yZSBpdCBpcwppbml0aWFsaXpl
ZC4KClNpZ25lZC1vZmYtYnk6IENhcmxvcyBMw7NwZXogPGNhcmxvcy5sb3BlenI0MDk2QGdtYWls
LmNvbT4KLS0tCiBsaWIvc2JpL3NiaV9oZWFwLmMgfCAyNSArKysrKysrKysrKysrKy0tLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaGVhcC5jIGIvbGliL3NiaS9zYmlfaGVhcC5jCmluZGV4
IDFkZTZkYzFlODdhOC4uY2RhMTI0YTRlZWJkIDEwMDY0NAotLS0gYS9saWIvc2JpL3NiaV9oZWFw
LmMKKysrIGIvbGliL3NiaS9zYmlfaGVhcC5jCkBAIC0yOCwxOCArMjgsMTggQEAgc3RydWN0IGhl
YXBfbm9kZSB7CiAKIHN0cnVjdCBzYmlfaGVhcF9jb250cm9sIHsKIAlzcGlubG9ja190IGxvY2s7
Ci0JdW5zaWduZWQgbG9uZyBiYXNlOwotCXVuc2lnbmVkIGxvbmcgc2l6ZTsKLQl1bnNpZ25lZCBs
b25nIHJlc3Y7Ci0Jc3RydWN0IHNiaV9kbGlzdCBmcmVlX25vZGVfbGlzdDsKLQlzdHJ1Y3Qgc2Jp
X2RsaXN0IGZyZWVfc3BhY2VfbGlzdDsKLQlzdHJ1Y3Qgc2JpX2RsaXN0IHVzZWRfc3BhY2VfbGlz
dDsKLQlzdHJ1Y3QgaGVhcF9ub2RlIGluaXRfZnJlZV9zcGFjZV9ub2RlOworCXVuc2lnbmVkIGxv
bmcgYmFzZSBHVUFSREVEX0JZKCZsb2NrKTsKKwl1bnNpZ25lZCBsb25nIHNpemUgR1VBUkRFRF9C
WSgmbG9jayk7CisJdW5zaWduZWQgbG9uZyByZXN2IEdVQVJERURfQlkoJmxvY2spOworCXN0cnVj
dCBzYmlfZGxpc3QgZnJlZV9ub2RlX2xpc3QgR1VBUkRFRF9CWSgmbG9jayk7CisJc3RydWN0IHNi
aV9kbGlzdCBmcmVlX3NwYWNlX2xpc3QgR1VBUkRFRF9CWSgmbG9jayk7CisJc3RydWN0IHNiaV9k
bGlzdCB1c2VkX3NwYWNlX2xpc3QgR1VBUkRFRF9CWSgmbG9jayk7CisJc3RydWN0IGhlYXBfbm9k
ZSBpbml0X2ZyZWVfc3BhY2Vfbm9kZSBHVUFSREVEX0JZKCZsb2NrKTsKIH07CiAKIHN0cnVjdCBz
YmlfaGVhcF9jb250cm9sIGdsb2JhbF9ocGN0cmw7CiAKLXN0YXRpYyBib29sIGFsbG9jX25vZGVz
KHN0cnVjdCBzYmlfaGVhcF9jb250cm9sICpocGN0cmwpCitzdGF0aWMgYm9vbCBhbGxvY19ub2Rl
cyhzdHJ1Y3Qgc2JpX2hlYXBfY29udHJvbCAqaHBjdHJsKSBNVVNUX0hPTEQoJmhwY3RybC0+bG9j
aykKIHsKIAlzaXplX3Qgc2l6ZSA9IEhFQVBfTk9ERV9CQVRDSF9TSVpFICogc2l6ZW9mKHN0cnVj
dCBoZWFwX25vZGUpOwogCXN0cnVjdCBoZWFwX25vZGUgKm4sICpuZXcgPSBOVUxMOwpAQCAtNjks
OCArNjksOSBAQCBzdGF0aWMgYm9vbCBhbGxvY19ub2RlcyhzdHJ1Y3Qgc2JpX2hlYXBfY29udHJv
bCAqaHBjdHJsKQogCXJldHVybiB0cnVlOwogfQogCi1zdGF0aWMgdm9pZCAqYWxsb2Nfd2l0aF9h
bGlnbihzdHJ1Y3Qgc2JpX2hlYXBfY29udHJvbCAqaHBjdHJsLAotCQkJICAgICAgc2l6ZV90IGFs
aWduLCBzaXplX3Qgc2l6ZSkKK3N0YXRpYyB2b2lkICphbGxvY193aXRoX2FsaWduKHN0cnVjdCBz
YmlfaGVhcF9jb250cm9sICpocGN0cmwsIHNpemVfdCBhbGlnbiwKKwkJCSAgICAgIHNpemVfdCBz
aXplKQorCU1VU1RfTk9UX0hPTEQoJmhwY3RybC0+bG9jaykKIHsKIAl2b2lkICpyZXQgPSBOVUxM
OwogCXN0cnVjdCBoZWFwX25vZGUgKm4sICpucDsKQEAgLTIzMCwxNyArMjMxLDE5IEBAIHVuc2ln
bmVkIGxvbmcgc2JpX2hlYXBfZnJlZV9zcGFjZV9mcm9tKHN0cnVjdCBzYmlfaGVhcF9jb250cm9s
ICpocGN0cmwpCiB9CiAKIHVuc2lnbmVkIGxvbmcgc2JpX2hlYXBfdXNlZF9zcGFjZV9mcm9tKHN0
cnVjdCBzYmlfaGVhcF9jb250cm9sICpocGN0cmwpCisJTk9fVEhSRUFEX1NBRkVUWV9BTkFMWVNJ
UwogewogCXJldHVybiBocGN0cmwtPnNpemUgLSBocGN0cmwtPnJlc3YgLSBzYmlfaGVhcF9mcmVl
X3NwYWNlKCk7CiB9CiAKIHVuc2lnbmVkIGxvbmcgc2JpX2hlYXBfcmVzZXJ2ZWRfc3BhY2VfZnJv
bShzdHJ1Y3Qgc2JpX2hlYXBfY29udHJvbCAqaHBjdHJsKQorCU5PX1RIUkVBRF9TQUZFVFlfQU5B
TFlTSVMKIHsKIAlyZXR1cm4gaHBjdHJsLT5yZXN2OwogfQogCiBpbnQgc2JpX2hlYXBfaW5pdF9u
ZXcoc3RydWN0IHNiaV9oZWFwX2NvbnRyb2wgKmhwY3RybCwgdW5zaWduZWQgbG9uZyBiYXNlLAot
CQkgICAgICAgdW5zaWduZWQgbG9uZyBzaXplKQorCQkgICAgICB1bnNpZ25lZCBsb25nIHNpemUp
IE5PX1RIUkVBRF9TQUZFVFlfQU5BTFlTSVMKIHsKIAlzdHJ1Y3QgaGVhcF9ub2RlICpuOwogCi0t
IAoyLjUxLjAKCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNi
aQo=
