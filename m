Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B1CC53219
	for <opensbi@archiver.kernel.org>; Wed, 29 Jul 2026 16:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w7YED4DhJKxbAepEWDquGb7nr6bAXJLlg7FMxHEmz5Q=; b=tqaUw8zBekvjah
	n8CY87Qo/tDQtb4eDfYM3TUMc6zusZb1LIFuhTiori3udsis3dlhy4iBlhkD/2itjUlA2C+4JhFOP
	tMYSexeyfvlJn6mKHjM7euJDvdkamGqqNbvYkP4I0FrA9ZHkgjjRHmkAfwIEeKRfBHXbESf86jFsf
	QxIKNxGU3VnMS+kzSzhCY9lUsc4tJouCJom9pq7+1Vv4QIGfIXqLPp6td2W7N2Cw4MzU51NKm/1s4
	f9DIe+9F2yIANqHGUF+vt2W+m2nlao0GAd2K4NaUwKNtb/E5v6wvFzK05U1YZgRoB6gyWxKhXv6B1
	A9WggHYy5k69X3/wZ9SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Oj-00000008bWe-1VPm;
	Wed, 29 Jul 2026 16:44:49 +0000
Received: from mail-wm2-x07.google.com ([2a00:1450:4864:31::7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Og-00000008bPP-1IWJ
	for opensbi@lists.infradead.org;
	Wed, 29 Jul 2026 16:44:47 +0000
Received: by mail-wm2-x07.google.com with SMTP id 5b1f17b1804b1-49557073245so3361715e9.1
        for <opensbi@lists.infradead.org>; Wed, 29 Jul 2026 09:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785343485; x=1785948285; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l3eovktarYu6kc0YM1CCqJB9mOn8AatGd4cOliD/xKw=;
        b=kk6y1U7hJ1X12yPUXyvnGxGbBpmlM3VzXxUkkMYpMxszp/tNaHiGW9gOiQx+Syoi+q
         1p2G8NA0BMM3eAAu8de3qw1aec4t92hem70CMFbxrAJxy8MBZ3WURz0+kDEyt72mOYCi
         mn+gNGPwztFmc0a44f0Rx51EDxLGucbQXfaz0/cXzfRNWCbH35xllT97u86ffuwkvpBU
         pvOZS3ePm/O3ZD26T5ehlz3Dja9Aq5H3kf87K+U0hiQOe8t4Xkkyl+0Q1LVTO+r4SJDp
         IZhA/vp9oemSsX/DIBRznAmA8+G4H3Qw7XRSinR987H9gDAlJ68an2FA0wh+JOMRH7Jg
         86vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785343485; x=1785948285;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l3eovktarYu6kc0YM1CCqJB9mOn8AatGd4cOliD/xKw=;
        b=WMKXJ/yAUNwrZFUnVvUnoAXFsrZaG0m4jV5WBK1d5oKzfK+hWcCGI47ZqoczIkS8tw
         7NARCSdUpbLoHC/g3bZIMbDAlZYGTHSUWaLL1SsCsO7zzU5A1OS2c72q+LiEwUq1bhWu
         CMUHRer3uGFHdiq2OAmb1d7Wml3XixlX5sufw5L0vkISBYouCGhg2jNydV/FDnteixk+
         tSwMyIyfxTH8pA5qV5JB425cC2x2xJpXPkt2NRhw6TfjjaGYF7rvd0Pa5d5l5eKYu0kJ
         CIcTWwaxMEBMTo6Rx8T7bEl3lmBAAUCMG2UAgBrjclWOZ6LqRti5zu3GS4Z+Jgen8DBD
         Vn4Q==
X-Gm-Message-State: AOJu0Yz0VijKPLWkGMh556G6nszkyHhLpExGjviJVDsn6604Ijwt7ZpW
	xN6OvqfTTVokKCcSZCiBGV3Sqhsf19WjnqE5HOvA/812fB0ac/FohwR5LK2wMyi8fbI=
X-Gm-Gg: AR+sD11xSqhqYpeCo6FY7282ZHk05TF5myFthpvoScVNiuz+EhhDm6RemKWZ2Fja4XS
	9qKZ46ZKs/Ht1TqjZs20b5WAi1QMQ2W4DTutpgDcRIs6Lc5RsiMXOyoMC9nkVid/Nug9mN0bF7r
	aW0Q+eYiqYJIoNP9zbH2b8mOeRs7ErBU5VHXfubmDOlSCAcIysovjBVk8iKnsglDl253Uhp1rn8
	kqfDqzj7ygKxgINIB2t1tJqX8WYz8bBJQg/Y50gdltLaOvF+gRJIzIhe/Kr43W+xSZdOq8Nai+j
	j9BBlyCnuydYHNjTI8I1L/AydD+nXVAo4QFr9ewCO07b1EdGJXjKRvFiu8kD52w6dE78OpwQYBK
	jzkk993cHmhtIYapXyqPG3FrYdR640hSb9trqLpFI2/Xcpsz2IifvC5C6IC59ur93B/EDwYanGA
	dZkwohTidTYzGD7aj4COpZ8pbWRXEYqUaz6t0iIXc3QQyfeAQR1oNryWnuSf/G4V76kJRvchYUj
	rbzavz6gH8gCglgR+Z1SjnAynSIK1xkhMPr8mOWSvdG6EfGxv+/yYnQog==
X-Received: by 2002:a05:6000:25c2:b0:47f:9311:34cf with SMTP id ffacd0b85a97d-47fb1ed8167mr9518830f8f.22.1785343484548;
        Wed, 29 Jul 2026 09:44:44 -0700 (PDT)
Received: from leap.suse.de ([84.77.88.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a88sm8474869f8f.6.2026.07.29.09.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:44:44 -0700 (PDT)
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Subject: [PATCH 12/14] lib: sbi_sse: add TSA annotations
Date: Wed, 29 Jul 2026 18:35:39 +0200
Message-ID: <20260729163540.3162978-14-carlos.lopezr4096@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
References: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_094446_433965_124DF754 
X-CRM114-Status: GOOD (  15.21  )
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
IC0tZ2l0IGEvbGliL3NiaS9zYmlfc3NlLmMgYi9saWIvc2JpL3NiaV9zc2UuYwppbmRleCA5YjYz
MDQzMDE3M2MuLjdiNGQ2NGI3Y2M2MyAxMDA2NDQKLS0tIGEvbGliL3NiaS9zYmlfc3NlLmMKKysr
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
QklfRUlOVkFMSURfU1RBVEU7CkBAIC03ODYsNiArNzg5LDcgQEAgc3RhdGljIGludCBzc2VfaW5q
ZWN0X2V2ZW50KHVpbnQzMl90IGV2ZW50X2lkLCB1bnNpZ25lZCBsb25nIGhhcnRpZCkKICAqLwog
c3RhdGljIGludCBzc2VfZXZlbnRfZW5hYmxlKHN0cnVjdCBzc2VfaGFydF9zdGF0ZSAqc2hzLAog
CQkJICAgICBzdHJ1Y3Qgc2JpX3NzZV9ldmVudCAqZSkKKwlNVVNUX0hPTEQoJnNocy0+ZW5hYmxl
ZF9ldmVudF9sb2NrKQogewogCWlmIChzc2VfZXZlbnRfc3RhdGUoZSkgIT0gU0JJX1NTRV9TVEFU
RV9SRUdJU1RFUkVEKQogCQlyZXR1cm4gU0JJX0VJTlZBTElEX1NUQVRFOwpAQCAtODA2LDYgKzgx
MCw3IEBAIHN0YXRpYyBpbnQgc3NlX2V2ZW50X2NvbXBsZXRlKHN0cnVjdCBzc2VfaGFydF9zdGF0
ZSAqc2hzLAogCQkJICAgICAgc3RydWN0IHNiaV9zc2VfZXZlbnQgKmUsCiAJCQkgICAgICBzdHJ1
Y3Qgc2JpX3RyYXBfcmVncyAqcmVncywKIAkJCSAgICAgIHN0cnVjdCBzYmlfZWNhbGxfcmV0dXJu
ICpvdXQpCisJTVVTVF9IT0xEKCZzaHMtPmVuYWJsZWRfZXZlbnRfbG9jaykKIHsKIAlpZiAoc3Nl
X2V2ZW50X3N0YXRlKGUpICE9IFNCSV9TU0VfU1RBVEVfUlVOTklORykKIAkJcmV0dXJuIFNCSV9F
SU5WQUxJRF9TVEFURTsKQEAgLTExODAsNiArMTE4NSw3IEBAIHN0YXRpYyBpbnQgc3NlX2dsb2Jh
bF9pbml0KCkKIH0KIAogc3RhdGljIHZvaWQgc3NlX2xvY2FsX2luaXQoc3RydWN0IHNzZV9oYXJ0
X3N0YXRlICpzaHMpCisJTk9fVEhSRUFEX1NBRkVUWV9BTkFMWVNJUwogewogCXVuc2lnbmVkIGlu
dCBldiA9IDA7CiAJc3RydWN0IHNzZV9ldmVudF9pbmZvICppbmZvOwotLSAKMi41MS4wCgoKLS0g
Cm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
