Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C640C79FB7
	for <opensbi@archiver.kernel.org>; Wed,  9 Sep 2026 16:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9glMkHwAf4E044MIzBWU6mQ0cSFct+4k7zeeOXyNFbA=; b=PhF1ZC1JRYSSui
	dqugKNCm9KRD0jw3kbXyj+vvb+uhfIiUq+Tsz9tZaqsFAgJbZWpvScbGjD7jx7zUrmivmcBgq/sdt
	lCuL7Zmjdzdy3t0jcYySqH4ASVDei3/66iZ3/yZCxUKU5DYmLffKEQsMvV/PrC794YdfpeHMZv80y
	fCOQaP7yOBQHHqd//8PtRbwxtVGW3LUG+96BnpwEaU5YHOL+ZkWGnf2m9IVYWl3e2GDmY2vfLzS36
	Yzy8sEGjpzPUSKZ0jORoRr8f0J0ZMV7Ny6LYJcmbTrDdvSDr+BUpiLaPW3JhmsP82nElGhEpZ2j2B
	jCYUYkHajpX4a5mACDFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LD9-0000000CJtl-2Ndr;
	Wed, 09 Sep 2026 16:31:47 +0000
Received: from mail-wm2-x08.google.com ([2a00:1450:4864:31::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LD3-0000000CJpm-0EUa
	for opensbi@lists.infradead.org;
	Wed, 09 Sep 2026 16:31:42 +0000
Received: by mail-wm2-x08.google.com with SMTP id 5b1f17b1804b1-4956bc73c0eso23553075e9.1
        for <opensbi@lists.infradead.org>; Wed, 09 Sep 2026 09:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788971499; x=1789576299; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=faxMVVyLJl/oJAx43ReP9bzWmTo8mn+Gh4SoRWjAAE0=;
        b=q6OqQA88QkE/oHene85aF6Y5Hcaybhuybkl1Je6EKnZ5SrDl+xRyda6BIgstf4BbOZ
         VQRlX73MAu4Zhl/o/wr6QHfrxEvSahqLc3xoCIG+04+VCUdvYfvmrTj5/njdX8e6doeG
         Zk6D9eDO2oFSoR/j+qDeoOA7R3YF9hWzUf0mOIH6e9wZaD8AGm5nZBcgp8SiYntU4Cmd
         SL+HsGWhXF1Gh43xi/1rJsqXqXLu7S8j/SZC2lwjLZvDwsGHWzBjvDmrXIz1xqeXTzeT
         RGcMA8Nf9XdxrB5aU4MXY+PDy9mm/+7Rg413rk3n73/JkD9f47BghEwQdE4LcfEf1COR
         hciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788971499; x=1789576299;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=faxMVVyLJl/oJAx43ReP9bzWmTo8mn+Gh4SoRWjAAE0=;
        b=dZEMJwioDmpWqP93JUuI2wZn1s9bfNW7nL6s9+bnhJOqvoiANhWtyaBUp426uH4OLD
         MRNO08/Iww4QJFl+OmpRaJFxQMO8lFHajSeN/gNW/NnHxJZJIW3rOmDo8znC24WzhVTW
         xq5A0KPB5Ta1+hC8lFYzwcbRgArSu8s4b1RoseE1O/5fmhVkZ4J5S/OVVAZus1aQHxJV
         ls4gIlk9rxLluewrZ4IWWhftV6JG3ocqnnWWxrIuwHW1igFsDrNyINl3p32w5ZD0YnRr
         qmHARd4CTgIKyJWdB9TtdEreI8V3qNGwo9Hp33QcHLpxPlYJOFxEG/tPNrw75qX0C/ef
         pMrw==
X-Gm-Message-State: AFuF++nzOxHUzaZxc9kSwTND+7GeaI608NlomAe01FLE77MBV7TtCdDq
	bdNUoO3dGASv/pRL4LSiXNIPR5Y+CoZ5NXaMicK9z7SEZbDHT0Bg9CNnUoL5QlJY
X-Gm-Gg: AYBFou30+I4Nz1Bt410zMd1aY9REA1eYeihtDCa9PAohKO04hSRCgGDoek+rttrGRoK
	u4w45ycscstEuXS5JTDrKZr+wzE4/15eWhLWVG2K6zMNiamXWfb/4tmSznISmzm9H8po1IDuYGw
	soqlsTgTYmdnqAy4cjyZhSrARE0KSBRlPWbeSy/HDFdWODwzF6M5yBlHheLSCvsTH1u33kQwuNg
	6EbrGYOo3Aw9/i7aM+filLaR8dfp1L2ZnbEmcOnR6Q6YzJgMaFwguJMHb5hITZbA0r2fV5XNwwY
	QWKzodXHr7BLbAVd2j9sy0sSq4vaTebgNHsjWNIA367/U4jWV0HWQcvS4cWY8+zJuu8v7Ygi0K6
	B93S4MxG4Jh20TZJMuXqHz6UM7KHlJG0+SHCsGAt1XdFDzXXnqlhxNJjAwD0XdH3PiAv502VjSS
	16LjhEKU9de8xIoTn+8l3LbAJX/60zXRZ+mMZd0V3ETf3kTKN4uzPVo98CDDHuIUWlw5xfTG/BS
	jS/ExrzHk1434HECdQh7kxCj7sz92V+WOBX3pMKF4VaVhgZkSPjy0RuK21AM/ZXJo3HiWGoyCwV
	vlw=
X-Received: by 2002:a05:600c:4fc9:b0:49c:fc6e:8cb9 with SMTP id 5b1f17b1804b1-49cfc6e8e1emr334656805e9.29.1788971499262;
        Wed, 09 Sep 2026 09:31:39 -0700 (PDT)
Received: from localhost.localdomain ([84.77.88.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c06f04sm2763705e9.13.2026.09.09.09.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 09:31:37 -0700 (PDT)
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Subject: [PATCH v2 11/14] lib: sbi_sse: pass SSE hart state explicitly
Date: Wed,  9 Sep 2026 18:23:20 +0200
Message-ID: <20260909162322.29778-13-carlos.lopezr4096@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
References: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_093141_112045_B83DB4FD 
X-CRM114-Status: GOOD (  12.97  )
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
X3NzZS5jIGIvbGliL3NiaS9zYmlfc3NlLmMKaW5kZXggM2QxNjAxNjc0ZTA3Li4zOWU1Mjc1MmIw
MjQgMTAwNjQ0Ci0tLSBhL2xpYi9zYmkvc2JpX3NzZS5jCisrKyBiL2xpYi9zYmkvc2JpX3NzZS5j
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
SU5WQUxJRF9TVEFURTsKQEAgLTc3OCwxMyArNzc5LDE0IEBAIHN0YXRpYyBpbnQgc3NlX2luamVj
dF9ldmVudCh1aW50MzJfdCBldmVudF9pZCwgdW5zaWduZWQgbG9uZyBoYXJ0aWQpCiAvKioKICAq
IE11c3QgYmUgY2FsbGVkIHVuZGVyIG93bmVyIGhhcnQgbG9jawogICovCi1zdGF0aWMgaW50IHNz
ZV9ldmVudF9lbmFibGUoc3RydWN0IHNiaV9zc2VfZXZlbnQgKmUpCitzdGF0aWMgaW50IHNzZV9l
dmVudF9lbmFibGUoc3RydWN0IHNzZV9oYXJ0X3N0YXRlICpzaHMsCisJCQkgICAgIHN0cnVjdCBz
Ymlfc3NlX2V2ZW50ICplKQogewogCWlmIChzc2VfZXZlbnRfc3RhdGUoZSkgIT0gU0JJX1NTRV9T
VEFURV9SRUdJU1RFUkVEKQogCQlyZXR1cm4gU0JJX0VJTlZBTElEX1NUQVRFOwogCiAJc3NlX2V2
ZW50X3NldF9zdGF0ZShlLCBTQklfU1NFX1NUQVRFX0VOQUJMRUQpOwotCXNzZV9ldmVudF9hZGRf
dG9fbGlzdChlKTsKKwlzc2VfZXZlbnRfYWRkX3RvX2xpc3Qoc2hzLCBlKTsKIAogCXNzZV9ldmVu
dF9pbnZva2VfY2IoZSwgZW5hYmxlX2NiKTsKIApAQCAtNzk1LDcgKzc5Nyw4IEBAIHN0YXRpYyBp
bnQgc3NlX2V2ZW50X2VuYWJsZShzdHJ1Y3Qgc2JpX3NzZV9ldmVudCAqZSkKIAlyZXR1cm4gU0JJ
X09LOwogfQogCi1zdGF0aWMgaW50IHNzZV9ldmVudF9jb21wbGV0ZShzdHJ1Y3Qgc2JpX3NzZV9l
dmVudCAqZSwKK3N0YXRpYyBpbnQgc3NlX2V2ZW50X2NvbXBsZXRlKHN0cnVjdCBzc2VfaGFydF9z
dGF0ZSAqc2hzLAorCQkJICAgICAgc3RydWN0IHNiaV9zc2VfZXZlbnQgKmUsCiAJCQkgICAgICBz
dHJ1Y3Qgc2JpX3RyYXBfcmVncyAqcmVncywKIAkJCSAgICAgIHN0cnVjdCBzYmlfZWNhbGxfcmV0
dXJuICpvdXQpCiB7CkBAIC04MDcsNyArODEwLDcgQEAgc3RhdGljIGludCBzc2VfZXZlbnRfY29t
cGxldGUoc3RydWN0IHNiaV9zc2VfZXZlbnQgKmUsCiAKIAlzc2VfZXZlbnRfc2V0X3N0YXRlKGUs
IFNCSV9TU0VfU1RBVEVfRU5BQkxFRCk7CiAJaWYgKGUtPmF0dHJzLmNvbmZpZyAmIFNCSV9TU0Vf
QVRUUl9DT05GSUdfT05FU0hPVCkKLQkJc3NlX2V2ZW50X2Rpc2FibGUoZSk7CisJCXNzZV9ldmVu
dF9kaXNhYmxlKHNocywgZSk7CiAKIAlzc2VfZXZlbnRfaW52b2tlX2NiKGUsIGNvbXBsZXRlX2Ni
KTsKIApAQCAtODMwLDcgKzgzMyw3IEBAIGludCBzYmlfc3NlX2NvbXBsZXRlKHN0cnVjdCBzYmlf
dHJhcF9yZWdzICpyZWdzLCBzdHJ1Y3Qgc2JpX2VjYWxsX3JldHVybiAqb3V0KQogCQkgKiB0aGUg
b25lIHRoYXQgbmVlZHMgdG8gYmUgY29tcGxldGVkCiAJCSAqLwogCQlpZiAoc3NlX2V2ZW50X3N0
YXRlKHRtcCkgPT0gU0JJX1NTRV9TVEFURV9SVU5OSU5HKSB7Ci0JCQlyZXQgPSBzc2VfZXZlbnRf
Y29tcGxldGUodG1wLCByZWdzLCBvdXQpOworCQkJcmV0ID0gc3NlX2V2ZW50X2NvbXBsZXRlKHN0
YXRlLCB0bXAsIHJlZ3MsIG91dCk7CiAJCQlicmVhazsKIAkJfQogCX0KQEAgLTg1MSw3ICs4NTQs
NyBAQCBpbnQgc2JpX3NzZV9lbmFibGUodWludDMyX3QgZXZlbnRfaWQpCiAKIAlzaHMgPSBzc2Vf
Z2V0X2hhcnRfc3RhdGUoZSk7CiAJc3Bpbl9sb2NrKCZzaHMtPmVuYWJsZWRfZXZlbnRfbG9jayk7
Ci0JcmV0ID0gc3NlX2V2ZW50X2VuYWJsZShlKTsKKwlyZXQgPSBzc2VfZXZlbnRfZW5hYmxlKHNo
cywgZSk7CiAJc3Bpbl91bmxvY2soJnNocy0+ZW5hYmxlZF9ldmVudF9sb2NrKTsKIAlzc2VfZXZl
bnRfcHV0KGUpOwogCkBAIC04NzAsNyArODczLDcgQEAgaW50IHNiaV9zc2VfZGlzYWJsZSh1aW50
MzJfdCBldmVudF9pZCkKIAogCXNocyA9IHNzZV9nZXRfaGFydF9zdGF0ZShlKTsKIAlzcGluX2xv
Y2soJnNocy0+ZW5hYmxlZF9ldmVudF9sb2NrKTsKLQlyZXQgPSBzc2VfZXZlbnRfZGlzYWJsZShl
KTsKKwlyZXQgPSBzc2VfZXZlbnRfZGlzYWJsZShzaHMsIGUpOwogCXNwaW5fdW5sb2NrKCZzaHMt
PmVuYWJsZWRfZXZlbnRfbG9jayk7CiAKIAlzc2VfZXZlbnRfcHV0KGUpOwotLSAKMi41MS4wCgoK
LS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
