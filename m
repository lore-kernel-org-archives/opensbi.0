Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F88AC54FD2
	for <opensbi@archiver.kernel.org>; Wed, 29 Jul 2026 16:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J2QAjrzequ8xSlmjol565dws+3qwqJWRSUQnGTBL5Ow=; b=mh8ILj7cTLUMOs
	0lJMRm0zb27LDnMfoCIGhXGsLSqKt3duDKEXob4MOZGNqniimgHeC2KGMM77dBwdixdIsn7PV+PtJ
	TThafxnRUUYbDaLpt1cR4jiT+uydFDehArIGwc41GkXpwAtKTnogh2rYF72tn8dt3sNkpElNMxMVQ
	qMT4cq/HoKaI/6oSb4fVYooKVAbApZdaHzUh3+5tYkl4hSjvTvFKXoeYb14ptDnskB6jnFHanZwy9
	za1CoMQ++ByDLf71FnV6RkDwLL2wDpx9vc5CzwcOWvhOQhQ1JDhGGu7ZJKtCoOmJlvc40usCPXqKb
	q+dSo2M7RCeA4klQSFYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Oi-00000008bVA-10xP;
	Wed, 29 Jul 2026 16:44:48 +0000
Received: from mail-wr2-x01.google.com ([2a00:1450:4864:30::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Of-00000008bNc-0zxK
	for opensbi@lists.infradead.org;
	Wed, 29 Jul 2026 16:44:46 +0000
Received: by mail-wr2-x01.google.com with SMTP id ffacd0b85a97d-473b8c0fd5aso319787f8f.1
        for <opensbi@lists.infradead.org>; Wed, 29 Jul 2026 09:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785343484; x=1785948284; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=frXkNxCJrdsbXmPo9kVI1MUEwaI2viACQXhrt1/2l30=;
        b=bpHZZwDN+mONa7W4Mtz3R8inEur5I2nMic1FcPTvkNZS6Z7LXKcUJ9P963a8nTcLyE
         Tvw1BG0npSOrtNSCuGQVpl2xaRDfnoudwYoNy1AbCjrBSWhsPUXMnpfokicPARygRzOj
         rpRH1Qj/Hu0wckccAKle8hStTKvo64/+YX47CLUuQo6gtIbqbc4g+7a0HCDm6NNcI3am
         6Eu7HwiUskEjrJfYH7vA2+27W4U4bHAWHY+KMXDCp6xoziyl1T5gBEx2JG3wHpASXHp2
         C9QriWFyFoDrd/l/v0fDqSv2O4qS4JWC9HmieI23anOvOrXXaDyS/U0nGsfJ2FUyqMux
         LHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785343484; x=1785948284;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=frXkNxCJrdsbXmPo9kVI1MUEwaI2viACQXhrt1/2l30=;
        b=AAyqinv+gGggMtOgFoM0qWZOWkXTLa5jRMhcH1myFfZSDlIpG5jiZm8bBGFkT6Xj+8
         6cNIKSUPK42afkjCFHJDbqpTflV/JjSHV5B5VIdQa/i6GZQGjtJpaWd7NeMAw5+Fats1
         JmBE6aYL8wi0a3e79VjAo2Y04aahwDeOQpH8V4SaQ8Kk10us812eo3WgLMuSH+e87Adw
         U9OxrsD/7+YT+hRzmJ3o+hzBfYz2gNo6gkvCZ73ZTTN9HnPazh/KoOa6b5ZtoWTcG1Vp
         L6kP8ItztZMC/I/oKLX9q60oGSjpytM9cnAEW77UxXlj4j7+BRsF/+4gZ2yuto7q86wO
         YucQ==
X-Gm-Message-State: AOJu0YxJVhb+KH3110GEiAYMEIB3vd/nXRsWuvz50gRw4/h22f6qmtJ2
	QwERndabsDakPIZCUNuTsLSxFUhNqNHwpf/JVrhbkB4nHwQgBIOTM+gtjkPT3Y0FIUM=
X-Gm-Gg: AR+sD11kUY+oaXk93UguNsPWNH4A898HXT/JPyarFmuOUYF4qvnFbvPIoTEOS2Y1xKg
	7X9TOlkMDJlYZsCMLg16gLro/CjbELPYoGzDtq+WvDcm5rJ9/HVIjkqmgf85124l6VykHkpdDGo
	dk6ZUJ3Un6Ulwq4jXsLoQPRcsoXK8jIKv/466sDFSO6ImRkxAhpkj28Qs+aixjUsyH3iqbodhzp
	tDK5JVrNeaD+LPKMB3YJQmu9YG+525ZutCT4l8b9LUmrM23dI5Yi0+6UTrj2WcQGi0swZOShdaJ
	PNCn8lE9jLgxwDUMAatFfXXTOl6mhdyEl+XdTPnt4PEuFZ462SScZwfvLaOA0DWdfLcltHXpllB
	lg2XjNOPonZEOgv+xoqZf5PywI4Mn4scXAnsHyVhM9xcptMqJapzoqkboPr4bx7PuYVvnbsMfL6
	NVcoUuAzDKG2S1KedY5+pySVMbPi2xAbYUepMPwgBeaTszkpDwMQQEw9kQioz/mqjc47BbLp8Pa
	qlF4SDuKnNSRMhHOHRhYsaAwtl2YpJnSi9KrzT7oC7+j9jYQm9yv1Ydqg==
X-Received: by 2002:a05:6000:40c8:b0:47f:45b1:128c with SMTP id ffacd0b85a97d-47fb1f2aabdmr9476822f8f.58.1785343483552;
        Wed, 29 Jul 2026 09:44:43 -0700 (PDT)
Received: from leap.suse.de ([84.77.88.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a88sm8474869f8f.6.2026.07.29.09.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:44:43 -0700 (PDT)
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Subject: [PATCH 11/14] lib: sbi_sse: pass SSE hart state explicitly
Date: Wed, 29 Jul 2026 18:35:38 +0200
Message-ID: <20260729163540.3162978-13-carlos.lopezr4096@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
References: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_094445_299137_1B9F97E9 
X-CRM114-Status: GOOD (  12.34  )
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

SW4gcHJlcGFyYXRpb24gdG8gYWRkIFRTQSBhbm5vdGF0aW9ucywgcGFzcyB0aGUgU1NFIGhhcnQg
c3RhdGUgb3duaW5nIGFuCmV2ZW50LCBpbnN0ZWFkIG9mIHJlbHlpbmcgb24gc3NlX2dldF9oYXJ0
X3N0YXRlKCkgdG8gcmV0cmlldmUgaXQgZnJvbQp0aGUgZXZlbnQgaXRzZWxmLiBUaGlzIG1ha2Vz
IHRoZSByZWxhdGlvbnNoaXAgbW9yZSBleHBsaWNpdCwgYW5kIHdpbGwKYWxsb3cgdGhlIGNvbXBp
bGVyIHRvIHJlYXNvbiBhYm91dCB0aGUgc3RhdGUgb2YgbG9ja3MuCgpTaWduZWQtb2ZmLWJ5OiBD
YXJsb3MgTMOzcGV6IDxjYXJsb3MubG9wZXpyNDA5NkBnbWFpbC5jb20+Ci0tLQogbGliL3NiaS9z
Ymlfc3NlLmMgfCAyMyArKysrKysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEz
IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2Jp
X3NzZS5jIGIvbGliL3NiaS9zYmlfc3NlLmMKaW5kZXggMjFhNDI0NzA5NmFkLi45YjYzMDQzMDE3
M2MgMTAwNjQ0Ci0tLSBhL2xpYi9zYmkvc2JpX3NzZS5jCisrKyBiL2xpYi9zYmkvc2JpX3NzZS5j
CkBAIC0zMjgsOSArMzI4LDkgQEAgc3RhdGljIHZvaWQgc3NlX2V2ZW50X3JlbW92ZV9mcm9tX2xp
c3Qoc3RydWN0IHNiaV9zc2VfZXZlbnQgKmUpCiAvKioKICAqIE11c3QgYmUgY2FsbGVkIHVuZGVy
IG93bmVyIGhhcnQgbG9jawogICovCi1zdGF0aWMgdm9pZCBzc2VfZXZlbnRfYWRkX3RvX2xpc3Qo
c3RydWN0IHNiaV9zc2VfZXZlbnQgKmUpCitzdGF0aWMgdm9pZCBzc2VfZXZlbnRfYWRkX3RvX2xp
c3Qoc3RydWN0IHNzZV9oYXJ0X3N0YXRlICpzdGF0ZSwKKwkJCQkgICBzdHJ1Y3Qgc2JpX3NzZV9l
dmVudCAqZSkKIHsKLQlzdHJ1Y3Qgc3NlX2hhcnRfc3RhdGUgKnN0YXRlID0gc3NlX2dldF9oYXJ0
X3N0YXRlKGUpOwogCXN0cnVjdCBzYmlfc3NlX2V2ZW50ICp0bXA7CiAKIAlzYmlfbGlzdF9mb3Jf
ZWFjaF9lbnRyeSh0bXAsICZzdGF0ZS0+ZW5hYmxlZF9ldmVudF9saXN0LCBub2RlKSB7CkBAIC0z
NDYsNyArMzQ2LDggQEAgc3RhdGljIHZvaWQgc3NlX2V2ZW50X2FkZF90b19saXN0KHN0cnVjdCBz
Ymlfc3NlX2V2ZW50ICplKQogLyoqCiAgKiBNdXN0IGJlIGNhbGxlZCB1bmRlciBvd25lciBoYXJ0
IGxvY2sKICAqLwotc3RhdGljIGludCBzc2VfZXZlbnRfZGlzYWJsZShzdHJ1Y3Qgc2JpX3NzZV9l
dmVudCAqZSkKK3N0YXRpYyBpbnQgc3NlX2V2ZW50X2Rpc2FibGUoc3RydWN0IHNzZV9oYXJ0X3N0
YXRlICpzaHMsCisJCQkgICAgICBzdHJ1Y3Qgc2JpX3NzZV9ldmVudCAqZSkKIHsKIAlpZiAoc3Nl
X2V2ZW50X3N0YXRlKGUpICE9IFNCSV9TU0VfU1RBVEVfRU5BQkxFRCkKIAkJcmV0dXJuIFNCSV9F
SU5WQUxJRF9TVEFURTsKQEAgLTc4MywxMyArNzg0LDE0IEBAIHN0YXRpYyBpbnQgc3NlX2luamVj
dF9ldmVudCh1aW50MzJfdCBldmVudF9pZCwgdW5zaWduZWQgbG9uZyBoYXJ0aWQpCiAvKioKICAq
IE11c3QgYmUgY2FsbGVkIHVuZGVyIG93bmVyIGhhcnQgbG9jawogICovCi1zdGF0aWMgaW50IHNz
ZV9ldmVudF9lbmFibGUoc3RydWN0IHNiaV9zc2VfZXZlbnQgKmUpCitzdGF0aWMgaW50IHNzZV9l
dmVudF9lbmFibGUoc3RydWN0IHNzZV9oYXJ0X3N0YXRlICpzaHMsCisJCQkgICAgIHN0cnVjdCBz
Ymlfc3NlX2V2ZW50ICplKQogewogCWlmIChzc2VfZXZlbnRfc3RhdGUoZSkgIT0gU0JJX1NTRV9T
VEFURV9SRUdJU1RFUkVEKQogCQlyZXR1cm4gU0JJX0VJTlZBTElEX1NUQVRFOwogCiAJc3NlX2V2
ZW50X3NldF9zdGF0ZShlLCBTQklfU1NFX1NUQVRFX0VOQUJMRUQpOwotCXNzZV9ldmVudF9hZGRf
dG9fbGlzdChlKTsKKwlzc2VfZXZlbnRfYWRkX3RvX2xpc3Qoc2hzLCBlKTsKIAogCXNzZV9ldmVu
dF9pbnZva2VfY2IoZSwgZW5hYmxlX2NiKTsKIApAQCAtODAwLDcgKzgwMiw4IEBAIHN0YXRpYyBp
bnQgc3NlX2V2ZW50X2VuYWJsZShzdHJ1Y3Qgc2JpX3NzZV9ldmVudCAqZSkKIAlyZXR1cm4gU0JJ
X09LOwogfQogCi1zdGF0aWMgaW50IHNzZV9ldmVudF9jb21wbGV0ZShzdHJ1Y3Qgc2JpX3NzZV9l
dmVudCAqZSwKK3N0YXRpYyBpbnQgc3NlX2V2ZW50X2NvbXBsZXRlKHN0cnVjdCBzc2VfaGFydF9z
dGF0ZSAqc2hzLAorCQkJICAgICAgc3RydWN0IHNiaV9zc2VfZXZlbnQgKmUsCiAJCQkgICAgICBz
dHJ1Y3Qgc2JpX3RyYXBfcmVncyAqcmVncywKIAkJCSAgICAgIHN0cnVjdCBzYmlfZWNhbGxfcmV0
dXJuICpvdXQpCiB7CkBAIC04MTIsNyArODE1LDcgQEAgc3RhdGljIGludCBzc2VfZXZlbnRfY29t
cGxldGUoc3RydWN0IHNiaV9zc2VfZXZlbnQgKmUsCiAKIAlzc2VfZXZlbnRfc2V0X3N0YXRlKGUs
IFNCSV9TU0VfU1RBVEVfRU5BQkxFRCk7CiAJaWYgKGUtPmF0dHJzLmNvbmZpZyAmIFNCSV9TU0Vf
QVRUUl9DT05GSUdfT05FU0hPVCkKLQkJc3NlX2V2ZW50X2Rpc2FibGUoZSk7CisJCXNzZV9ldmVu
dF9kaXNhYmxlKHNocywgZSk7CiAKIAlzc2VfZXZlbnRfaW52b2tlX2NiKGUsIGNvbXBsZXRlX2Ni
KTsKIApAQCAtODM1LDcgKzgzOCw3IEBAIGludCBzYmlfc3NlX2NvbXBsZXRlKHN0cnVjdCBzYmlf
dHJhcF9yZWdzICpyZWdzLCBzdHJ1Y3Qgc2JpX2VjYWxsX3JldHVybiAqb3V0KQogCQkgKiB0aGUg
b25lIHRoYXQgbmVlZHMgdG8gYmUgY29tcGxldGVkCiAJCSAqLwogCQlpZiAoc3NlX2V2ZW50X3N0
YXRlKHRtcCkgPT0gU0JJX1NTRV9TVEFURV9SVU5OSU5HKSB7Ci0JCQlyZXQgPSBzc2VfZXZlbnRf
Y29tcGxldGUodG1wLCByZWdzLCBvdXQpOworCQkJcmV0ID0gc3NlX2V2ZW50X2NvbXBsZXRlKHN0
YXRlLCB0bXAsIHJlZ3MsIG91dCk7CiAJCQlicmVhazsKIAkJfQogCX0KQEAgLTg1Niw3ICs4NTks
NyBAQCBpbnQgc2JpX3NzZV9lbmFibGUodWludDMyX3QgZXZlbnRfaWQpCiAKIAlzaHMgPSBzc2Vf
Z2V0X2hhcnRfc3RhdGUoZSk7CiAJc3Bpbl9sb2NrKCZzaHMtPmVuYWJsZWRfZXZlbnRfbG9jayk7
Ci0JcmV0ID0gc3NlX2V2ZW50X2VuYWJsZShlKTsKKwlyZXQgPSBzc2VfZXZlbnRfZW5hYmxlKHNo
cywgZSk7CiAJc3Bpbl91bmxvY2soJnNocy0+ZW5hYmxlZF9ldmVudF9sb2NrKTsKIAlzc2VfZXZl
bnRfcHV0KGUpOwogCkBAIC04NzUsNyArODc4LDcgQEAgaW50IHNiaV9zc2VfZGlzYWJsZSh1aW50
MzJfdCBldmVudF9pZCkKIAogCXNocyA9IHNzZV9nZXRfaGFydF9zdGF0ZShlKTsKIAlzcGluX2xv
Y2soJnNocy0+ZW5hYmxlZF9ldmVudF9sb2NrKTsKLQlyZXQgPSBzc2VfZXZlbnRfZGlzYWJsZShl
KTsKKwlyZXQgPSBzc2VfZXZlbnRfZGlzYWJsZShzaHMsIGUpOwogCXNwaW5fdW5sb2NrKCZzaHMt
PmVuYWJsZWRfZXZlbnRfbG9jayk7CiAKIAlzc2VfZXZlbnRfcHV0KGUpOwotLSAKMi41MS4wCgoK
LS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
