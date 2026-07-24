Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E871C531FA
	for <opensbi@archiver.kernel.org>; Fri, 24 Jul 2026 15:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nqvoRjtBd2Ufy0034IgKzMbSpR/L2c0h2PbjWYw2e7s=; b=Ii3p+cvcnRq8D7
	gifMdl4k+o8GYnOLmt20caznHUbwNQqs/zKQYDYh8LByuSaZEdO7PjqoyCIIYltNKY5JtaYIMOJmF
	aY5/MEqE5bBzJOaS8i8J6RY7LgzORN7dEnSBPQeLHOJaqlAQS0lzfTIcDuBcRzvnohqIQ1kLW/OsN
	nvN77p7xcYbZNctY4AXliwGq0GRVWHRE2xswba9cpfljzpFL3lckG86lBWp8XvQEvZCnZXNJwYCYX
	dk9bY7vTgcpwQUxr9hJ61EZCREsoeRURYUBLALXmsoa89gac3jHklYv/aQ8spadbYWxBi5MV1EFr9
	DT2peliQT2a3+CQsSVRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHvw-0000000GjGK-3hiB;
	Fri, 24 Jul 2026 15:35:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHvw-0000000GjFL-07zb
	for opensbi@bombadil.infradead.org;
	Fri, 24 Jul 2026 15:35:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=KVRiRTe6OLz8Dlb5SC7DW/9Octevfdp+gVlvNAE5ZiI=; b=l6DiEYhaORonqtnsoMMRDRVBuU
	f/2OM77+CNUQX19K8w0LccUefEocfvfFjRgdxSpg9xYd+PV/bUDQCusAoj3IeIEpHZajTDc6Q7r87
	pw7StEGqsNOGgiWo1lKgi5Va0QtXlUbh++fw4rJ03Q5bHnejDlwyfzxjtBAA6KsQOPARlF0CDJXdn
	mqPbx84O9BAogMN8+yNEnoNnSgMqiJI0ipxcyno7Mfhw/v6Ov76AjnPUXJPvJg08f8UhacpMtT6L9
	WXep3i2l+XActv/w+Y3AGV2pzbBeuViLfuQjDsHY5WwdKbilpUgLVys8AMCmwe2EEPHdJ6u9yefsw
	mo2VA1kg==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wnHvs-00000002iMc-4570
	for opensbi@lists.infradead.org;
	Fri, 24 Jul 2026 15:35:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8FCB21A11EF;
	Fri, 24 Jul 2026 15:35:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 65D0F6039A;
	Fri, 24 Jul 2026 15:35:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7919511C12791;
	Fri, 24 Jul 2026 17:35:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784907321; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KVRiRTe6OLz8Dlb5SC7DW/9Octevfdp+gVlvNAE5ZiI=;
	b=agF4wjlUdjThrW+mV2fP3a4jhtG2jsOzzSRUu521/5pd/jWjN4USAd6RVEPiK7YHCxmutp
	/il8c/QtT+lF08KvExy3lFI9oAgMQQvOp5T8v1IQHNyI6kqDJoFpzS4uA+903KXr/o4KrI
	d1UBSjuPyA4is7EcS4T9ZsBBsqkuDXJNZPJIndKaKEbB1QvnorKdBSLBl10j+kz+q9i18U
	pjA0uA/iiD4q6WT7HfkH4pIuB9la60SLEGteBqnCuzPGOvGcvrYZo3oDEQwA0h5or/XxPr
	8EtnQsxrPJskZWVGWtvCa40jk/RPSXa4Icnqi3snIk28YorVz6pZr+CQRCHQLQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 24 Jul 2026 17:35:08 +0200
Subject: [PATCH v3 2/2] lib: utils/reset: Add Metanoia MT2824 system reset
 driver
MIME-Version: 1.0
Message-Id: <20260724-mt5824-v3-2-9a7d17d69974@bootlin.com>
References: <20260724-mt5824-v3-0-9a7d17d69974@bootlin.com>
In-Reply-To: <20260724-mt5824-v3-0-9a7d17d69974@bootlin.com>
To: opensbi@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Randolph_Sheng-Kai_Lin=28=E6=9E=97=E8=81=96=E5=87=B1=29?= <randolph@andestech.com>, 
 Jun Chang <jun.chang@metanoia-comm.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_163529_154325_1A91A708 
X-CRM114-Status: GOOD (  13.48  )
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

QWRkIGEgZHJpdmVyIGZvciB0aGUgc3lzdGVtIHJlc2V0IGZ1bmN0aW9uIGZvdW5kIGluIE1ldGFu
b2lhIE1UMjgyNCBTb0MKYW5kIGVuYWJsZSBpdCBpbiB0aGUgZ2VuZXJpYyBwbGF0Zm9ybSBjb25m
aWd1cmF0aW9uLgoKT3JpZ2luYWxseS1ieTogSnVuIENoYW5nIDxqdW4uY2hhbmdAbWV0YW5vaWEt
Y29tbS5jb20+ClNpZ25lZC1vZmYtYnk6IEJlbm/DrnQgTW9uaW4gPGJlbm9pdC5tb25pbkBib290
bGluLmNvbT4KLS0tCiBsaWIvdXRpbHMvcmVzZXQvS2NvbmZpZyAgICAgICAgICAgICAgfCAgNCAr
KwogbGliL3V0aWxzL3Jlc2V0L2ZkdF9yZXNldF9tZXRhbm9pYS5jIHwgNzIgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCiBsaWIvdXRpbHMvcmVzZXQvb2JqZWN0cy5tayAgICAg
ICAgICAgfCAgMyArKwogcGxhdGZvcm0vZ2VuZXJpYy9jb25maWdzL2RlZmNvbmZpZyAgIHwgIDEg
KwogNCBmaWxlcyBjaGFuZ2VkLCA4MCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbGliL3V0
aWxzL3Jlc2V0L0tjb25maWcgYi9saWIvdXRpbHMvcmVzZXQvS2NvbmZpZwppbmRleCBiMmFjMTIw
ZS4uODk4ODU0OGMgMTAwNjQ0Ci0tLSBhL2xpYi91dGlscy9yZXNldC9LY29uZmlnCisrKyBiL2xp
Yi91dGlscy9yZXNldC9LY29uZmlnCkBAIC0yOSw2ICsyOSwxMCBAQCBjb25maWcgRkRUX1JFU0VU
X0xJVEVYCiAJZGVwZW5kcyBvbiBGRFRfR1BJTwogCWRlZmF1bHQgbgogCitjb25maWcgRkRUX1JF
U0VUX01FVEFOT0lBCisJYm9vbCAiTWV0YW5vaWEgRkRUIHJlc2V0IGRyaXZlciIKKwlkZWZhdWx0
IG4KKwogY29uZmlnIEZEVF9SRVNFVF9SUE1JCiAJYm9vbCAiUlBNSSBGRFQgcmVzZXQgZHJpdmVy
IgogCWRlcGVuZHMgb24gRkRUX01BSUxCT1ggJiYgUlBNSV9NQUlMQk9YCmRpZmYgLS1naXQgYS9s
aWIvdXRpbHMvcmVzZXQvZmR0X3Jlc2V0X21ldGFub2lhLmMgYi9saWIvdXRpbHMvcmVzZXQvZmR0
X3Jlc2V0X21ldGFub2lhLmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAuLjYy
OGNkOGI2Ci0tLSAvZGV2L251bGwKKysrIGIvbGliL3V0aWxzL3Jlc2V0L2ZkdF9yZXNldF9tZXRh
bm9pYS5jCkBAIC0wLDAgKzEsNzIgQEAKKy8qCisgKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
QlNELTItQ2xhdXNlCisgKgorICogQ29weXJpZ2h0IChjKSAyMDI2IE1ldGFub2lhIENvbW11bmlj
YXRpb25zIEluYy4KKyAqCisgKi8KKworI2luY2x1ZGUgPHNiaS9yaXNjdl9pby5oPgorI2luY2x1
ZGUgPHNiaS9zYmlfcGxhdGZvcm0uaD4KKyNpbmNsdWRlIDxzYmkvc2JpX3N5c3RlbS5oPgorI2lu
Y2x1ZGUgPHNiaV91dGlscy9mZHQvZmR0X2hlbHBlci5oPgorI2luY2x1ZGUgPHNiaV91dGlscy9m
ZHQvZmR0X2RyaXZlci5oPgorCisjZGVmaW5lIFNXUlNUUkVRX0NUUkxfUkVHX09GRlNFVCAweDAw
CisjZGVmaW5lIFNXUlNUUkVRX1JFR19PRkZTRVQgMHgwNAorCitzdHJ1Y3QgcmVzZXRfbWV0YW5v
aWFfZGF0YSB7CisJdTggKnJlZ19iYXNlOworfTsKKworc3RhdGljIHN0cnVjdCByZXNldF9tZXRh
bm9pYV9kYXRhIHJlc2V0X2RhdGE7CisKK3N0YXRpYyBpbnQgbWV0YW5vaWFfc3lzdGVtX3Jlc2V0
X2NoZWNrKHUzMiB0eXBlLCB1MzIgcmVhc29uKQoreworCXN3aXRjaCAodHlwZSkgeworCWNhc2Ug
U0JJX1NSU1RfUkVTRVRfVFlQRV9XQVJNX1JFQk9PVDoKKwljYXNlIFNCSV9TUlNUX1JFU0VUX1RZ
UEVfQ09MRF9SRUJPT1Q6CisJCXJldHVybiAxOworCWNhc2UgU0JJX1NSU1RfUkVTRVRfVFlQRV9T
SFVURE9XTjoKKwlkZWZhdWx0OgorCQlyZXR1cm4gMDsKKwl9Cit9CisKK3N0YXRpYyB2b2lkIG1l
dGFub2lhX3N5c3RlbV9yZXNldCh1MzIgdHlwZSwgdTMyIHJlYXNvbikKK3sKKwl3cml0ZXcoMHgx
LCByZXNldF9kYXRhLnJlZ19iYXNlICsgU1dSU1RSRVFfQ1RSTF9SRUdfT0ZGU0VUKTsKKwl3cml0
ZXcoMHgxLCByZXNldF9kYXRhLnJlZ19iYXNlICsgU1dSU1RSRVFfUkVHX09GRlNFVCk7Cit9CisK
K3N0YXRpYyBzdHJ1Y3Qgc2JpX3N5c3RlbV9yZXNldF9kZXZpY2UgbWV0YW5vaWFfcmVzZXQgPSB7
CisJLm5hbWUJCSAgICA9ICJtZXRhbm9pYS1tdDI4MjQtcmVib290IiwKKwkuc3lzdGVtX3Jlc2V0
X2NoZWNrID0gbWV0YW5vaWFfc3lzdGVtX3Jlc2V0X2NoZWNrLAorCS5zeXN0ZW1fcmVzZXQJICAg
ID0gbWV0YW5vaWFfc3lzdGVtX3Jlc2V0LAorfTsKKworc3RhdGljIGludCBtZXRhbm9pYV9yZXNl
dF9pbml0KGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGVvZmYsCisJCQkgICAgICAgY29uc3Qgc3Ry
dWN0IGZkdF9tYXRjaCAqbWF0Y2gpCit7CisJdTY0IHJlZ19hZGRyOworCWludCByYzsKKworCXJj
ID0gZmR0X2dldF9ub2RlX2FkZHJfc2l6ZShmZHQsIG5vZGVvZmYsIDAsICZyZWdfYWRkciwgTlVM
TCk7CisJaWYgKHJjIDwgMCB8fCAhcmVnX2FkZHIpCisJCXJldHVybiBTQklfRU5PREVWOworCisJ
cmVzZXRfZGF0YS5yZWdfYmFzZSA9ICh1OCAqKXJlZ19hZGRyOworCisJc2JpX3N5c3RlbV9yZXNl
dF9hZGRfZGV2aWNlKCZtZXRhbm9pYV9yZXNldCk7CisKKwlyZXR1cm4gMDsKK30KKworc3RhdGlj
IGNvbnN0IHN0cnVjdCBmZHRfbWF0Y2ggbWV0YW5vaWFfcmVzZXRfbWF0Y2hbXSA9IHsKKwl7IC5j
b21wYXRpYmxlID0gIm1ldGFub2lhLG10MjgyNC1yZWJvb3QiIH0sCisJeyAvKiBzZW50aW5lbCAq
LyB9Cit9OworCitjb25zdCBzdHJ1Y3QgZmR0X2RyaXZlciBmZHRfcmVzZXRfbWV0YW5vaWEgPSB7
CisJLm1hdGNoX3RhYmxlID0gbWV0YW5vaWFfcmVzZXRfbWF0Y2gsCisJLmluaXQJICAgICA9IG1l
dGFub2lhX3Jlc2V0X2luaXQsCit9OwpkaWZmIC0tZ2l0IGEvbGliL3V0aWxzL3Jlc2V0L29iamVj
dHMubWsgYi9saWIvdXRpbHMvcmVzZXQvb2JqZWN0cy5tawppbmRleCAzOGI0ZTMwNi4uYTliNmVk
YWQgMTAwNjQ0Ci0tLSBhL2xpYi91dGlscy9yZXNldC9vYmplY3RzLm1rCisrKyBiL2xpYi91dGls
cy9yZXNldC9vYmplY3RzLm1rCkBAIC0yMCw2ICsyMCw5IEBAIGxpYnNiaXV0aWxzLW9ianMtJChD
T05GSUdfRkRUX1JFU0VUX0hUSUYpICs9IHJlc2V0L2ZkdF9yZXNldF9odGlmLm8KIGNhcnJheS1m
ZHRfZWFybHlfZHJpdmVycy0kKENPTkZJR19GRFRfUkVTRVRfTElURVgpICs9IGZkdF9yZXNldF9s
aXRleAogbGlic2JpdXRpbHMtb2Jqcy0kKENPTkZJR19GRFRfUkVTRVRfTElURVgpICs9IHJlc2V0
L2ZkdF9yZXNldF9saXRleC5vCiAKK2NhcnJheS1mZHRfZWFybHlfZHJpdmVycy0kKENPTkZJR19G
RFRfUkVTRVRfTUVUQU5PSUEpICs9IGZkdF9yZXNldF9tZXRhbm9pYQorbGlic2JpdXRpbHMtb2Jq
cy0kKENPTkZJR19GRFRfUkVTRVRfTUVUQU5PSUEpICs9IHJlc2V0L2ZkdF9yZXNldF9tZXRhbm9p
YS5vCisKIGNhcnJheS1mZHRfZWFybHlfZHJpdmVycy0kKENPTkZJR19GRFRfUkVTRVRfU0cyMDQy
X0hXTU9OX01DVSkgKz0gZmR0X3Jlc2V0X3NnMjA0Ml9tY3UKIGxpYnNiaXV0aWxzLW9ianMtJChD
T05GSUdfRkRUX1JFU0VUX1NHMjA0Ml9IV01PTl9NQ1UpICs9IHJlc2V0L2ZkdF9yZXNldF9zZzIw
NDJfaHdtb25fbWN1Lm8KIApkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9jb25maWdzL2Rl
ZmNvbmZpZyBiL3BsYXRmb3JtL2dlbmVyaWMvY29uZmlncy9kZWZjb25maWcKaW5kZXggODIwYzk4
YjYuLmFjNzZlYjI3IDEwMDY0NAotLS0gYS9wbGF0Zm9ybS9nZW5lcmljL2NvbmZpZ3MvZGVmY29u
ZmlnCisrKyBiL3BsYXRmb3JtL2dlbmVyaWMvY29uZmlncy9kZWZjb25maWcKQEAgLTUyLDYgKzUy
LDcgQEAgQ09ORklHX0ZEVF9SRVNFVF9BVENXRFQyMDA9eQogQ09ORklHX0ZEVF9SRVNFVF9HUElP
PXkKIENPTkZJR19GRFRfUkVTRVRfTElURVg9eQogQ09ORklHX0ZEVF9SRVNFVF9IVElGPXkKK0NP
TkZJR19GRFRfUkVTRVRfTUVUQU5PSUE9eQogQ09ORklHX0ZEVF9SRVNFVF9SUE1JPXkKIENPTkZJ
R19GRFRfUkVTRVRfU0cyMDQyX0hXTU9OX01DVT15CiBDT05GSUdfRkRUX1JFU0VUX1NQQUNFTUlU
X1AxPXkKCi0tIAoyLjU1LjAKCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vb3BlbnNiaQo=
