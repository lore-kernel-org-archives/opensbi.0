Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7ABFC53219
	for <opensbi@archiver.kernel.org>; Wed, 29 Jul 2026 16:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9XZtB4zfan0ykD+mMaQ39w/HjijLNv/xA63XLCA/hF8=; b=T26CJ2CP8DJ2d/
	mktAX5KCWdm4+vKFnPVWqeoR5xD39EO3zfCBkrwQG4BI3iqvWDRk0qq8FV+UQvf0w1yKSQo8UZvJe
	j3JHTQKG6WB7e5I1+fu6LkkXJpOwjib6owcr9FnYp5qVfxV37wXjnV7Iq9xXnjZepFyhWRK57BmYu
	VIxUPr1brt43HG/ogiRFrFq2YDHrFx/rkZzaopdaXTIDzhzSaN+UM1PsimQY6H6ygj+qRKqt3xwwp
	BmPdHywQS+fN5RhEML8u80CwVoBZYFodsdopTL0uiA/opuYgtvp4HJZd/bDRP7XrjJI5+mYTgG74W
	T190GB6GI7MESW0ygdhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Oa-00000008bIp-30PV;
	Wed, 29 Jul 2026 16:44:40 +0000
Received: from mail-wm2-x00.google.com ([2a00:1450:4864:31::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7OZ-00000008bGw-0IYM
	for opensbi@lists.infradead.org;
	Wed, 29 Jul 2026 16:44:40 +0000
Received: by mail-wm2-x00.google.com with SMTP id 5b1f17b1804b1-492367f3094so3565405e9.0
        for <opensbi@lists.infradead.org>; Wed, 29 Jul 2026 09:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785343477; x=1785948277; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DktoNAKqKLYOXLHBqh97l1TqFc4XW/c0MNrB8C2nkBM=;
        b=UgPlTlrkxGpzi6G4hiujwSowdJhCbDg2PCbaup8bqRk8LWEV1k69e/BtZybs4SxRbq
         xs5Ux1dMARvrGC0OGKQgA++WT/ndjUbeYx2gVRu63+ZD1JxC42KenML5cRYr/f3Bi9Gj
         9MNlcs+GPKvcAr+Uox4VNdwF4cKAx+Xn8LpSjCnN4Y52vqEsuRUZ66+WJHLZhFnACeXR
         IwqQsoxHRNzCh5DRRVmy42GrWcveBMYPcY9OgVhjUAMgo/Hdr1vQAI3gY64hL/gX/J87
         iYd1kAkKzZz0Zh60VK5/Dkugth9kzmt3+nIVKYePkwFm/f9RBe511y5vjTEKTsiWqPP+
         2Gsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785343477; x=1785948277;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DktoNAKqKLYOXLHBqh97l1TqFc4XW/c0MNrB8C2nkBM=;
        b=rVZ1Zb8lqPsVokMaOkUaPyTfQ2/m9cBgjuo7t57Ug0aQY0Ll15mu02oHmtWvbuu7Ya
         Pg0Z0p4JEDQcj9iVLE7YYH73jhfB+DsDKaaXH/K9T5VIbDThjcVdbcBO7OrL13g7GP80
         wjeqWBMZR73dLGKFiooGQhBxJzpbblE2mNVgQYgi2/0IWbnByuzshlx8XItmFO0o1Cp+
         yeQ/QqbXZU/neker07HCJtSQVeBt94HlrZt2khKYeXSWSLnNhCr2tsbydxI3mlGNl6ZU
         fo3+RUBqmHm665j2WgmK300bepeHmM/nE5QHlaWl8TAvdQDIpJ0U16t+TnQC0qSIykzU
         hueA==
X-Gm-Message-State: AOJu0YyjklhZu4q+eFn1/RPhUi6YsNzYucBR+kxgTA5W4eA8ja0Sn6xS
	+l39sPs9z7i4lUtZDKHZnDfL8EvmuaSgmSRfba8AjBDP7Z7mk7mhDFvAnmk/kSYSwD0=
X-Gm-Gg: AR+sD10NdsCl1LgCK99HvynVfkm3hY+plUXQ4Jfk+1fZP/i9wG1KLQicJib+6SymBIU
	2KMFjviIDDjQjdAZm2jwkBxzIrXcap7uWMY1vExlADDM1w951kOtLylM+w1XNAT4k0ZpFgIx2FX
	wkfyW4PfYWjw5uqzO4pdwVJAQNY7/ZAu3z8W58ipl/8V6RvyWQpzekCU/P6K4tekKm6Q1KFBXHN
	7fsCAziL9sNG20ADccy1+LWCL6MgswwxKuAiic3KZrFifNh+sP7KQETxqV3Vn7/SvUr8gndKrpP
	N/1caPbW2DRixpMtDSpljWmhcsqCOEMv7TlpBlWtpULInAZpFdhIxVA+G9G8KZNSQbwQUgNtWFq
	AJ8i54Zs4PI7uM/4nSaSEFHHRccIiFgyXG/oKx6al3JRmwlSuzsQONgetq+S2000mEHKRM6eiUC
	S2b2xDJ++GUybURU18FaxRBa6lVb5Gjf1uWYNFClMus8ywNrw6clRVfakBJFLnK8FyrQpTAp3+s
	MGQ2nAyLHBmEkuOeDLPPvXWyOzo6iDlof5H8buWvYaJJyE/uHtDrtaayw==
X-Received: by 2002:a05:6000:2c0c:b0:47f:70f1:a577 with SMTP id ffacd0b85a97d-47fb1ed7e1cmr9254144f8f.17.1785343477118;
        Wed, 29 Jul 2026 09:44:37 -0700 (PDT)
Received: from leap.suse.de ([84.77.88.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a88sm8474869f8f.6.2026.07.29.09.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:44:36 -0700 (PDT)
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Subject: [PATCH 04/14] lib: sbi_heap: add TSA annotations
Date: Wed, 29 Jul 2026 18:35:31 +0200
Message-ID: <20260729163540.3162978-6-carlos.lopezr4096@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
References: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_094439_130886_7B262A17 
X-CRM114-Status: GOOD (  10.20  )
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
