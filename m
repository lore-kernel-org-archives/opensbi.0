Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EC5CD98F7
	for <opensbi@archiver.kernel.org>; Thu, 18 Jun 2026 12:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sNamu1wvoHpyHBEreb8hNO3gCixcz24VX0uv1ric0vU=; b=hZ3N6FH78K1cyX
	9e2ihdP/ODhWCV8iXRalgibTg3PyI/QjUDLOYDlbJXLl3tUEI7Hy2ASltdkvXwh13ZErvdch0rlP3
	kLpQHc9SVfuhlhDxGtA7ewcJY0bGYTKGV3K1hQ5y09qpbKgpD0Qud982NfW4zScN0rIbJuIsvumOM
	HPBB3qeb0drsvG3lR2DEim94OENgj5rrtm3khx2ecXhsFPDf96TKONZokM5f382zyXfY5gw01hCWb
	oHBxyxUbe1/wr4vgJnOlf9DcKIkmTN7inaWt0cSs7fDwn3en0U4JhYS17xStDRqRWSXY2OEYjv8IS
	s+U8GSg0mmeNM6LlXo+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waBkC-00000001FxD-0e7U;
	Thu, 18 Jun 2026 12:21:16 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waBk6-00000001Fvh-1pNO
	for opensbi@lists.infradead.org;
	Thu, 18 Jun 2026 12:21:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 867EFC06CD1;
	Thu, 18 Jun 2026 12:21:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2697C5FF03;
	Thu, 18 Jun 2026 12:21:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 50F4D106C8112;
	Thu, 18 Jun 2026 14:21:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781785266; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HHg+fQOPQCOO8k1D+R0LhGGRfIBCc9M/G3f/QzullsA=;
	b=EDSqHBvaV6MfXPXvjXBypOVGRsYeG53x2tIUfX2MhWMrlWhSibK38HsFFt9T7fyDoFokO9
	7g/GG4sJffyrS+QhdtnrAGOYIZr7tgrENjVdj0SeeNkDj1pO2lL6sV4w8Y3+x8Xy0yKXdd
	VDg0b5DeFyjKI+bgigOJ77xbM0qR7YIf4xgP/GviqJoJuHgs3IMEANrAvlbLmKDO11CX4L
	mDkdIkaUpB//hxTxG0JlhjR1w4J35MY7Vqlf6Xz8TU+eDXuSwEwXkWgKHHCGdgvXfWoiY6
	xDz6HytYxUNK64HGdEbrDDQ/RRqWpI/Q+gCnclronpgs2tYUJOPMTVfOyr3yLA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Thu, 18 Jun 2026 14:20:33 +0200
Subject: [PATCH 2/2] lib: utils/reset: Add Metanoia MT5824 system reset
 driver
MIME-Version: 1.0
Message-Id: <20260618-mt5824-v1-2-c99263cc6df4@bootlin.com>
References: <20260618-mt5824-v1-0-c99263cc6df4@bootlin.com>
In-Reply-To: <20260618-mt5824-v1-0-c99263cc6df4@bootlin.com>
To: opensbi@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Randolph_Sheng-Kai_Lin=28=E6=9E=97=E8=81=96=E5=87=B1=29?= <randolph@andestech.com>, 
 Jun Chang <jun.chang@metanoia-comm.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_052110_643932_7A8724D9 
X-CRM114-Status: GOOD (  13.54  )
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
b2lhIE1UNTgyNCBTb0MKYW5kIGVuYWJsZSBpdCBpbiB0aGUgZ2VuZXJpYyBwbGF0Zm9ybSBjb25m
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
X3Jlc2V0X21ldGFub2lhLmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAuLjhh
NzFlMTA3Ci0tLSAvZGV2L251bGwKKysrIGIvbGliL3V0aWxzL3Jlc2V0L2ZkdF9yZXNldF9tZXRh
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
CisJLm5hbWUJCSAgICA9ICJtZXRhbm9pYSBtdDU4MjQgcmVzZXQiLAorCS5zeXN0ZW1fcmVzZXRf
Y2hlY2sgPSBtZXRhbm9pYV9zeXN0ZW1fcmVzZXRfY2hlY2ssCisJLnN5c3RlbV9yZXNldAkgICAg
PSBtZXRhbm9pYV9zeXN0ZW1fcmVzZXQsCit9OworCitzdGF0aWMgaW50IG1ldGFub2lhX3Jlc2V0
X2luaXQoY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZW9mZiwKKwkJCSAgICAgICBjb25zdCBzdHJ1
Y3QgZmR0X21hdGNoICptYXRjaCkKK3sKKwl1NjQgcmVnX2FkZHI7CisJaW50IHJjOworCisJcmMg
PSBmZHRfZ2V0X25vZGVfYWRkcl9zaXplKGZkdCwgbm9kZW9mZiwgMCwgJnJlZ19hZGRyLCBOVUxM
KTsKKwlpZiAocmMgPCAwIHx8ICFyZWdfYWRkcikKKwkJcmV0dXJuIFNCSV9FTk9ERVY7CisKKwly
ZXNldF9kYXRhLnJlZ19iYXNlID0gKHU4ICopcmVnX2FkZHI7CisKKwlzYmlfc3lzdGVtX3Jlc2V0
X2FkZF9kZXZpY2UoJm1ldGFub2lhX3Jlc2V0KTsKKworCXJldHVybiAwOworfQorCitzdGF0aWMg
Y29uc3Qgc3RydWN0IGZkdF9tYXRjaCBtZXRhbm9pYV9yZXNldF9tYXRjaFtdID0geworCXsgLmNv
bXBhdGlibGUgPSAibWV0YW5vaWEsbXQ1ODI0LXJlYm9vdCIgfSwKKwl7IC8qIHNlbnRpbmVsICov
IH0KK307CisKK2NvbnN0IHN0cnVjdCBmZHRfZHJpdmVyIGZkdF9yZXNldF9tZXRhbm9pYSA9IHsK
KwkubWF0Y2hfdGFibGUgPSBtZXRhbm9pYV9yZXNldF9tYXRjaCwKKwkuaW5pdAkgICAgID0gbWV0
YW5vaWFfcmVzZXRfaW5pdCwKK307CmRpZmYgLS1naXQgYS9saWIvdXRpbHMvcmVzZXQvb2JqZWN0
cy5tayBiL2xpYi91dGlscy9yZXNldC9vYmplY3RzLm1rCmluZGV4IDM4YjRlMzA2Li5hOWI2ZWRh
ZCAxMDA2NDQKLS0tIGEvbGliL3V0aWxzL3Jlc2V0L29iamVjdHMubWsKKysrIGIvbGliL3V0aWxz
L3Jlc2V0L29iamVjdHMubWsKQEAgLTIwLDYgKzIwLDkgQEAgbGlic2JpdXRpbHMtb2Jqcy0kKENP
TkZJR19GRFRfUkVTRVRfSFRJRikgKz0gcmVzZXQvZmR0X3Jlc2V0X2h0aWYubwogY2FycmF5LWZk
dF9lYXJseV9kcml2ZXJzLSQoQ09ORklHX0ZEVF9SRVNFVF9MSVRFWCkgKz0gZmR0X3Jlc2V0X2xp
dGV4CiBsaWJzYml1dGlscy1vYmpzLSQoQ09ORklHX0ZEVF9SRVNFVF9MSVRFWCkgKz0gcmVzZXQv
ZmR0X3Jlc2V0X2xpdGV4Lm8KIAorY2FycmF5LWZkdF9lYXJseV9kcml2ZXJzLSQoQ09ORklHX0ZE
VF9SRVNFVF9NRVRBTk9JQSkgKz0gZmR0X3Jlc2V0X21ldGFub2lhCitsaWJzYml1dGlscy1vYmpz
LSQoQ09ORklHX0ZEVF9SRVNFVF9NRVRBTk9JQSkgKz0gcmVzZXQvZmR0X3Jlc2V0X21ldGFub2lh
Lm8KKwogY2FycmF5LWZkdF9lYXJseV9kcml2ZXJzLSQoQ09ORklHX0ZEVF9SRVNFVF9TRzIwNDJf
SFdNT05fTUNVKSArPSBmZHRfcmVzZXRfc2cyMDQyX21jdQogbGlic2JpdXRpbHMtb2Jqcy0kKENP
TkZJR19GRFRfUkVTRVRfU0cyMDQyX0hXTU9OX01DVSkgKz0gcmVzZXQvZmR0X3Jlc2V0X3NnMjA0
Ml9od21vbl9tY3UubwogCmRpZmYgLS1naXQgYS9wbGF0Zm9ybS9nZW5lcmljL2NvbmZpZ3MvZGVm
Y29uZmlnIGIvcGxhdGZvcm0vZ2VuZXJpYy9jb25maWdzL2RlZmNvbmZpZwppbmRleCAxYWU0MzZl
NC4uOWU2NzEyMmEgMTAwNjQ0Ci0tLSBhL3BsYXRmb3JtL2dlbmVyaWMvY29uZmlncy9kZWZjb25m
aWcKKysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9jb25maWdzL2RlZmNvbmZpZwpAQCAtNTIsNiArNTIs
NyBAQCBDT05GSUdfRkRUX1JFU0VUX0FUQ1dEVDIwMD15CiBDT05GSUdfRkRUX1JFU0VUX0dQSU89
eQogQ09ORklHX0ZEVF9SRVNFVF9MSVRFWD15CiBDT05GSUdfRkRUX1JFU0VUX0hUSUY9eQorQ09O
RklHX0ZEVF9SRVNFVF9NRVRBTk9JQT15CiBDT05GSUdfRkRUX1JFU0VUX1JQTUk9eQogQ09ORklH
X0ZEVF9SRVNFVF9TRzIwNDJfSFdNT05fTUNVPXkKIENPTkZJR19GRFRfUkVTRVRfU1BBQ0VNSVRf
UDE9eQoKLS0gCjIuNTQuMAoKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9vcGVuc2JpCg==
