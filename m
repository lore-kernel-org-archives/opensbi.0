Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB5DEA4FD0
	for <opensbi@archiver.kernel.org>; Mon, 23 Feb 2026 14:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GyEzBEHEFm4Lf7RQ89Fe4U00pzLrd05idvVK0wITVD8=; b=ftzwYbAqQ8Qx8y
	41x9iwaOJdvWO6hylSEN21ZRTADiNSD7K9FPahK9bYYrIHAVGO2EilaEgYEyIfe/+xceCo2/1czOt
	2FT3MyXtfaYvsyAxk87n28vZL0tC2aCScCREi9qXotk2Ry1liOI3K4W5UAy5IgpnGvISXFEyuvoFz
	7UGjm2DZW68PDcrP3SortFBxSZwzzAAHt/x4SY4CFtymId6NgIAMrhBTTn9hxMcyJ52nOMznL5IOl
	sjBvpOe31XsBQ3poQkF/D3Q6HQArgR6YVWftpu6rvCdCmT22GcHNqbc/N0oW5igGTxxFlZ7RAALTH
	lp/Ipfe7s8E7KPpIBehw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLP-00000000VYm-40qm;
	Mon, 23 Feb 2026 14:55:31 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLL-00000000VVL-2MAB
	for opensbi@lists.infradead.org;
	Mon, 23 Feb 2026 14:55:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1771858527; x=1803394527;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dYf+db05fi9nXYpz4+uHp8G35P8F64ZCMKgtB1CXfFs=;
  b=s0x+O0qBFsw26/GZK6lgDqPsTkYmfY1mMThQ5qA9Y6ugXr1DYcTdABTT
   WQtaYxnt/tPtjRCUSXgzaxZSx/5Dvr+rcnXXO+YBasrAgMW5bvGGoNz+M
   S6f5ziXjNt3UFIeLI8y2KWe/qZgViDSWx5vZ8h/pWPtKw7s1MUH8SLNWv
   5cdAICrnz5AZ4OVF3M+RAFzjkheN0vjOBTBRyRZQBhdVYoGxaleICCnii
   zc5uxf5KN2U+MzY2LZmCF2rX2p5DG0tX9l2v+Nmz8TtSc7PvsGrW54aCi
   bk4gQ5o25JxHn/MNa/MxOwngLBseVZJqCtvDKZb/zl8ep4d/53D43G25K
   w==;
X-CSE-ConnectionGUID: ZuIz/U3nQlaiL3pKRXRY+A==
X-CSE-MsgGUID: bz/svVJ2RnGSuUWQ1moDnw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 16:55:23 +0200
X-CSE-ConnectionGUID: 26fxFKgxSiaJ5vJ15LeLHQ==
X-CSE-MsgGUID: isK+wlJRQ+eqIrQzQxbAgg==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces02_data.me-corp.lan with SMTP; 23 Feb 2026 16:58:04 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 23 Feb 2026 16:55:21 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	benoit.monin@bootlin.com,
	cc=cfu@mips.com,
	opensbi@lists.infradead.org
Subject: [PATCH v3 00/23] Introduce MIPS p8700 based "eyeq7h" and "boston"
Date: Mon, 23 Feb 2026 16:54:39 +0200
Message-ID: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
MIME-Version: 1.0
X-Change-ID: 20260115-for-upstream-eyeq7h-9031bdae1148
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_065528_056913_BCE06363 
X-CRM114-Status: UNSURE (   6.50  )
X-CRM114-Notice: Please train this message.
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

aW4tcmVwbHktdG86MjAyNjAxMTQwOTIxMTguMTMxNTU4MS0xLXZsYWRpbWlyLmtvbmRyYXRpZXZA
bW9iaWxleWUuY29tDQpjYzogdmxhZGltaXIua29uZHJhdGlldkBtb2JpbGV5ZS5jb20NCnRvOiBh
bnVwQGJyYWluZmF1bHQub3JnDQpjYzogYmVub2l0Lm1vbmluQGJvb3RsaW4uY29tDQpjYzogY2M9
Y2Z1QG1pcHMuY29tDQpjYzogb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnDQoNCkFkZGluZyBz
dXBwb3J0IGZvciB0aGUgTW9iaWxleWUgImV5ZXE3aCIgYXV0b21vdGl2ZSBwbGF0Zm9ybQ0KdXNp
bmcgTUlQUyBwODcwMCBDUFUuIFJlZmFjdG9yIGNvZGUgdHVybmluZyBtaXBzIHA4NzAwDQpwbGF0
Zm9ybSBpbnRvICJjcHUiIHRoYXQgaXQgYWN0dWFsbHkgaXM7IHdpdGggcGxhdGZvcm1zIHVzaW5n
DQp0aGlzIENQVSwgImV5ZXE3aCIgYnkgTW9iaWxleWUgYW5kICJib3N0b24iIEZQR0EgYm9hcmQg
YnkgTUlQUw0KDQpUZXN0ZWQgb24gdGhlIHJlYWwgZXllcTdoIGhhcmR3YXJlDQoNClNpZ25lZC1v
ZmYtYnk6IFZsYWRpbWlyIEtvbmRyYXRpZXYgPHZsYWRpbWlyLmtvbmRyYXRpZXZAbW9iaWxleWUu
Y29tPg0KLS0tDQpCZW5vw650IE1vbmluICgxKToNCiAgICAgIHBsYXRmb3JtOiBnZW5lcmljOiBt
aXBzIHA4NzAwOiBBZGQgbWF0Y2ggZGF0YSBmb3IgQ00gaW5mbw0KDQpWbGFkaW1pciBLb25kcmF0
aWV2ICgyMik6DQogICAgICBsaWI6IHNiaTogcHJpbnQgaGFydGlkIGluIGhleA0KICAgICAgbGli
OiBzYmlfaGFydF9wbXA6IGRpc2FibGUgdW5jb25maWd1cmVkIFBNUCBlbnRyaWVzDQogICAgICBw
bGF0Zm9ybTogZ2VuZXJpYzogbWlwcyBwODcwMDogaW1wcm92ZSBDTSBhY2Nlc3MgdHJhY2luZw0K
ICAgICAgcGxhdGZvcm06IGdlbmVyaWM6IG1pcHMgcDg3MDA6IHJlc2VydmUgbWVtb3J5IGZvciBN
LW1vZGUgcGVyaXBoZXJhbHMNCiAgICAgIHBsYXRmb3JtOiBnZW5lcmljOiBtaXBzIHA4NzAwOiBm
aXggcG93ZXJpbmcgdXAgb3RoZXIgY2x1c3Rlcg0KICAgICAgcGxhdGZvcm06IGdlbmVyaWM6IG1p
cHMgcDg3MDA6IGZhc3RlciBjb3JlIGJvb3QNCiAgICAgIHBsYXRmb3JtOiBnZW5lcmljOiBtaXBz
IHA4NzAwOiB1c2UgZ2xvYmFsIENNIGFkZHJlc3Nlcw0KICAgICAgcGxhdGZvcm06IGdlbmVyaWM6
IG1pcHMgcDg3MDA6IGFjY2VzcyBDTSByZWdpc3RlcnMgdmlhIG1hdGNoIGRhdGENCiAgICAgIHBs
YXRmb3JtOiBnZW5lcmljOiBtaXBzOiBhZGQgUDg3MDAgYmFzZWQgImV5ZXE3aCIgYW5kICJib3N0
b24iDQogICAgICBwbGF0Zm9ybTogZ2VuZXJpYzogbWlwcyBleWVxN2g6IHBvd2VyIHVwIGNsdXN0
ZXJzIHdpdGggT0xCDQogICAgICBwbGF0Zm9ybTogZ2VuZXJpYzogbWlwcyBleWVxN2g6IGRldGVj
dCBhY2NlbGVyYXRvcnMgY2x1c3RlciBwcmVzZW5jZQ0KICAgICAgcGxhdGZvcm06IGdlbmVyaWM6
IG1pcHMgZXllcTdoOiBkZWFzc2VydCBhY2NlbGVyYXRvciBjbHVzdGVyIHJlc2V0cw0KICAgICAg
cGxhdGZvcm06IGdlbmVyaWM6IG1pcHMgcDg3MDA6IGNhY2hlIGdlb21ldHJ5IGRldGVjdGlvbg0K
ICAgICAgcGxhdGZvcm06IGdlbmVyaWM6IG1pcHMgcDg3MDA6IENQVSBjbHVzdGVycyBtZW1yYW5n
ZXMNCiAgICAgIHBsYXRmb3JtOiBnZW5lcmljOiBtaXBzIHA4NzAwOiB1c2UgU0JJIGJpdGZpZWxk
IG1hbmlwdWxhdG9yIG1hY3Jvcw0KICAgICAgcGxhdGZvcm06IGdlbmVyaWM6IG1pcHMgcDg3MDA6
IHN5bmNocm9uaXplIGhpLXJlcyB0aW1lcnMNCiAgICAgIHBsYXRmb3JtOiBnZW5lcmljOiBtaXBz
IGV5ZXE3aDogc3luY2hyb25pemUgdGltZXJzIGFjcm9zcyBjbHVzdGVycw0KICAgICAgcGxhdGZv
cm06IGdlbmVyaWM6IG1pcHMgZXllcTdoOiBmaXggTkNPUkUgcmVnaXN0ZXJzIGFjY2VzcyBmcm9t
IGNsdXN0ZXJzIDEuLjINCiAgICAgIHBsYXRmb3JtOiBnZW5lcmljOiBtaXBzIHA4NzAwOiBkdW1w
IE1NSU8gcmVnaW9ucw0KICAgICAgcGxhdGZvcm06IGdlbmVyaWM6IG1pcHMgZXllcTdoOiBwcm9o
aWJpdCBhY2Nlc3NpbmcgbWVtb3J5IGJleW9uZCBEUkFNDQogICAgICBwbGF0Zm9ybTogZ2VuZXJp
YzogcDg3MDA6IGZpeCBNSVBTIHNwZWNpZmljIENTUnMNCiAgICAgIHBsYXRmb3JtOiBnZW5lcmlj
OiBleWVxN2g6IGVuYWJsZSBFQ0Mgb24gTDEgY2FjaGUNCg0KIGxpYi9zYmkvc2JpX2RvbWFpbi5j
ICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQ0KIGxpYi9zYmkvc2JpX2hhcnRfcG1wLmMgICAg
ICAgICAgICAgICAgICB8ICAgNiArDQogcGxhdGZvcm0vZ2VuZXJpYy9LY29uZmlnICAgICAgICAg
ICAgICAgIHwgIDE2ICstDQogcGxhdGZvcm0vZ2VuZXJpYy9jb25maWdzL2RlZmNvbmZpZyAgICAg
IHwgICAzICstDQogcGxhdGZvcm0vZ2VuZXJpYy9pbmNsdWRlL21pcHMvYm9hcmQuaCAgIHwgIDMz
IC0tLQ0KIHBsYXRmb3JtL2dlbmVyaWMvaW5jbHVkZS9taXBzL21pcHMtY20uaCB8ICA1NSArKy0t
DQogcGxhdGZvcm0vZ2VuZXJpYy9pbmNsdWRlL21pcHMvcDg3MDAuaCAgIHwgMTkwICsrKysrKysr
KystLS0NCiBwbGF0Zm9ybS9nZW5lcmljL21pcHMvYm9zdG9uLmMgICAgICAgICAgfCAxNTAgKysr
KysrKysrKw0KIHBsYXRmb3JtL2dlbmVyaWMvbWlwcy9leWVxN2guYyAgICAgICAgICB8IDQ3OCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KIHBsYXRmb3JtL2dlbmVyaWMvbWlwcy9v
YmplY3RzLm1rICAgICAgICB8ICAgNyArLQ0KIHBsYXRmb3JtL2dlbmVyaWMvbWlwcy9wODcwMC5j
ICAgICAgICAgICB8IDQxMCArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0NCiAxMSBmaWxlcyBj
aGFuZ2VkLCAxMDQ0IGluc2VydGlvbnMoKyksIDMwNiBkZWxldGlvbnMoLSkNCi0tLQ0KYmFzZS1j
b21taXQ6IDk2NTY5NDNiZDNhMmNhZDk0MTg0NjVjMmExNjhmOTA3ZWE1MjE4OWINCmNoYW5nZS1p
ZDogMjAyNjAxMTUtZm9yLXVwc3RyZWFtLWV5ZXE3aC05MDMxYmRhZTExNDgNCg0KQmVzdCByZWdh
cmRzLA0KLS0gDQpWbGFkaW1pciBLb25kcmF0aWV2IDx2bGFkaW1pci5rb25kcmF0aWV2QG1vYmls
ZXllLmNvbT4NCg0KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVu
c2JpCg==
