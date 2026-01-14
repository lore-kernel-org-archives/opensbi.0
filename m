Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C5AD31A2E
	for <opensbi@archiver.kernel.org>; Wed, 14 Jan 2026 09:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BlH/iEmMnGRZPSkWoCSusQps2ScrwrpLdq4Ia8Lc5vA=; b=wOMyNnkFCthBeK
	Ci0RR+qQgK6/BvUNd/56bvpvjNVe6cKO3CYLyyAf5lTosFK7wlqRjD2GASP2UY/BLdbjUFgSWkNqB
	RnyrXN/DmxOjP78QwQhzbqDljhqu+pu5MTc4oFGOWn7cq2G09MWafhwi8bQRvMQAWD3WZCgVWCtr8
	aTklAE1CP7dugnvg30rvnqLnmm2P6v8gGb4BHvGfEYHVKrlSU30YQfBEsesi9C3nadizw4b0lYtcp
	bZGnnf03wioSuaeKxw21Crzl0z6j5vJKWlODegbPVEePcC0W59Knyi5mNyl219EgH1CYYcTOTSshZ
	+m/9x4FB8Sk/Bi+AkfEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx4J-00000008VjM-0M32;
	Wed, 14 Jan 2026 09:21:35 +0000
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx49-00000008Vcr-1kza
	for opensbi@lists.infradead.org;
	Wed, 14 Jan 2026 09:21:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768382485; x=1799918485;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jnxc0orv7ABzVqKCy113MZMbgzKq4SdfnLcmMENkJ/Q=;
  b=q2H7wUnLc1D8Dtd6fxlVfl54zNRMWFTyKAixnzXIxLV5LsDCVVKazOCl
   8bGFz3ccgoUt/Rfsqzj4jApgIxlQpy3DKXitjuPg9nnlAVGOWjK5iZBDG
   GElMm/8+lGCbYDc2Nzn/i+EgK34bOnjjodKAKFkUButpwk6pcKU5mKWf/
   yYFb97J3+w9cox2TaRCgQSeHeGpQhiQ8TBRa7fbsf2V74CGr5H0pFBBDv
   qx7Wn3iBAQg1xLdnmJ0nq1MNVe9kiNG/P6NwOTjS9X9r6/gF3HWrmfUJt
   g3qjuFl6NtUeRGeRy+ihGCHfaSIKdY7c+T2e1tsTkpzXJgcwH7SGPQT9r
   g==;
X-CSE-ConnectionGUID: MsoH76DQSHu9KUKdT0D58Q==
X-CSE-MsgGUID: kb0477ukS3aIUzeWEEz4gQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 11:21:21 +0200
X-CSE-ConnectionGUID: uh9cci4TRwed3ZVLA0x81A==
X-CSE-MsgGUID: gcOCz2maR8uHVL0StU9KPQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces04_data.me-crop.lan with SMTP; 14 Jan 2026 11:23:06 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Wed, 14 Jan 2026 11:21:20 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: cfu@mips.com,
	opensbi@lists.infradead.org,
	benoit.monin@bootlin.com,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH 00/22] Introduce MIPS p8700 based "eyeq7h" and "boston"
Date: Wed, 14 Jan 2026 11:20:56 +0200
Message-ID: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_012126_825112_F2BA3B63 
X-CRM114-Status: GOOD (  10.61  )
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

QWRkaW5nIHN1cHBvcnQgZm9yIHRoZSBNb2JpbGV5ZSAiZXllcTdoIiBhdXRvbW90aXZlIHBsYXRm
b3JtCnVzaW5nIE1JUFMgcDg3MDAgQ1BVLiBSZWZhY3RvciBjb2RlIHR1cm5pbmcgbWlwcyBwODcw
MApwbGF0Zm9ybSBpbnRvICJjcHUiIHRoYXQgaXQgYWN0dWFsbHkgaXM7IHdpdGggcGxhdGZvcm1z
IHVzaW5nCnRoaXMgQ1BVLCAiZXllcTdoIiBieSBNb2JpbGV5ZSBhbmQgImJvc3RvbiIgRlBHQSBi
b2FyZCBieSBNSVBTCgpUZXN0ZWQgb24gdGhlIHJlYWwgZXllcTdoIGhhcmR3YXJlCgpCZW5vw650
IE1vbmluICgxKToKICBwbGF0Zm9ybTogZ2VuZXJpYzogbWlwcyBwODcwMDogQWRkIG1hdGNoIGRh
dGEgZm9yIENNIGluZm8KClZsYWRpbWlyIEtvbmRyYXRpZXYgKDIxKToKICBsaWI6IHNiaTogcHJp
bnQgaGFydGlkIGluIGhleAogIHBsYXRmb3JtOiBnZW5lcmljOiBtaXBzIHA4NzAwOiBpbXByb3Zl
IENNIGFjY2VzcyB0cmFjaW5nCiAgcGxhdGZvcm06IGdlbmVyaWM6IG1pcHMgcDg3MDA6IHJlc2Vy
dmUgbWVtb3J5IGZvciBNLW1vZGUgcGVyaXBoZXJhbHMKICBwbGF0Zm9ybTogZ2VuZXJpYzogbWlw
cyBwODcwMDogcHJvaGliaXQgYWNjZXNzaW5nIG1lbW9yeSBiZXlvbmQgRFJBTQogIHBsYXRmb3Jt
OiBnZW5lcmljOiBtaXBzIHA4NzAwOiBmaXggcG93ZXJpbmcgdXAgb3RoZXIgY2x1c3RlcgogIHBs
YXRmb3JtOiBnZW5lcmljOiBtaXBzIHA4NzAwOiB1c2UgZGV0ZWN0ZWQgUE1QIGNvdW50CiAgcGxh
dGZvcm06IGdlbmVyaWM6IG1pcHMgcDg3MDA6IGZhc3RlciBjb3JlIGJvb3QKICBwbGF0Zm9ybTog
Z2VuZXJpYzogbWlwcyBwODcwMDogdXNlIGdsb2JhbCBDTSBhZGRyZXNzZXMKICBwbGF0Zm9ybTog
Z2VuZXJpYzogbWlwcyBwODcwMDogYWNjZXNzIENNIHJlZ2lzdGVycyB2aWEgbWF0Y2ggZGF0YQog
IHBsYXRmb3JtOiBnZW5lcmljOiBtaXBzIHA4NzAwOiByZXN0cmljdCBtZW1vcnkgcmVnaW9uIHRv
IHBoeXNpY2FsCiAgICBtZW1vcnkgYXMgaW4gRFRTCiAgcGxhdGZvcm06IGdlbmVyaWM6IG1pcHM6
IGFkZCBQODcwMCBiYXNlZCAiZXllcTdoIiBhbmQgImJvc3RvbiIKICBwbGF0Zm9ybTogZ2VuZXJp
YzogbWlwcyBleWVxN2g6IHBvd2VyIHVwIGNsdXN0ZXJzIHdpdGggT0xCCiAgcGxhdGZvcm06IGdl
bmVyaWM6IG1pcHMgZXllcTdoOiBkZXRlY3QgYWNjZWxlcmF0b3JzIGNsdXN0ZXIgcHJlc2VuY2UK
ICBwbGF0Zm9ybTogZ2VuZXJpYzogbWlwcyBleWVxN2g6IGRlYXNzZXJ0IGFjY2VsZXJhdG9yIGNs
dXN0ZXIgcmVzZXRzCiAgcGxhdGZvcm06IGdlbmVyaWM6IG1pcHMgcDg3MDA6IGNhY2hlIGdlb21l
dHJ5IGRldGVjdGlvbgogIHBsYXRmb3JtOiBnZW5lcmljOiBtaXBzIHA4NzAwOiBnZW5lcmljIG1l
bXJhbmdlcyBpbml0CiAgcGxhdGZvcm06IGdlbmVyaWM6IG1pcHMgcDg3MDA6IHVzZSBTQkkgYml0
ZmllbGQgbWFuaXB1bGF0b3IgbWFjcm9zCiAgcGxhdGZvcm06IGdlbmVyaWM6IG1pcHMgcDg3MDA6
IHN5bmNocm9uaXplIGhpLXJlcyB0aW1lcnMKICBwbGF0Zm9ybTogZ2VuZXJpYzogbWlwcyBleWVx
N2g6IHN5bmNocm9uaXplIHRpbWVycyBhY3Jvc3MgY2x1c3RlcnMKICBwbGF0Zm9ybTogZ2VuZXJp
YzogbWlwcyBleWVxN2g6IGZpeCBOQ09SRSByZWdpc3RlcnMgYWNjZXNzIGZyb20KICAgIGNsdXN0
ZXJzIDEuLjIKICBwbGF0Zm9ybTogZ2VuZXJpYzogbWlwcyBwODcwMDogZHVtcCBNTUlPIHJlZ2lv
bnMKCiBsaWIvc2JpL3NiaV9kb21haW4uYyAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQog
cGxhdGZvcm0vZ2VuZXJpYy9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAgMTYgKy0KIHBsYXRm
b3JtL2dlbmVyaWMvY29uZmlncy9kZWZjb25maWcgICAgICAgIHwgICAxIC0KIHBsYXRmb3JtL2dl
bmVyaWMvY29uZmlncy9leWVxN2hfZGVmY29uZmlnIHwgIDYxICsrKwogcGxhdGZvcm0vZ2VuZXJp
Yy9pbmNsdWRlL21pcHMvYm9hcmQuaCAgICAgfCAgMzMgLS0KIHBsYXRmb3JtL2dlbmVyaWMvaW5j
bHVkZS9taXBzL21pcHMtY20uaCAgIHwgIDU1ICsrLQogcGxhdGZvcm0vZ2VuZXJpYy9pbmNsdWRl
L21pcHMvcDg3MDAuaCAgICAgfCAxNjYgKysrKysrLS0KIHBsYXRmb3JtL2dlbmVyaWMvbWlwcy9i
b3N0b24uYyAgICAgICAgICAgIHwgMTUwICsrKysrKysKIHBsYXRmb3JtL2dlbmVyaWMvbWlwcy9l
eWVxN2guYyAgICAgICAgICAgIHwgNDg2ICsrKysrKysrKysrKysrKysrKysrKysKIHBsYXRmb3Jt
L2dlbmVyaWMvbWlwcy9vYmplY3RzLm1rICAgICAgICAgIHwgICA3ICstCiBwbGF0Zm9ybS9nZW5l
cmljL21pcHMvcDg3MDAuYyAgICAgICAgICAgICB8IDQxMSArKysrKysrKystLS0tLS0tLS0KIDEx
IGZpbGVzIGNoYW5nZWQsIDEwODYgaW5zZXJ0aW9ucygrKSwgMzAyIGRlbGV0aW9ucygtKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IHBsYXRmb3JtL2dlbmVyaWMvY29uZmlncy9leWVxN2hfZGVmY29uZmln
CiBkZWxldGUgbW9kZSAxMDA2NDQgcGxhdGZvcm0vZ2VuZXJpYy9pbmNsdWRlL21pcHMvYm9hcmQu
aAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBsYXRmb3JtL2dlbmVyaWMvbWlwcy9ib3N0b24uYwogY3Jl
YXRlIG1vZGUgMTAwNjQ0IHBsYXRmb3JtL2dlbmVyaWMvbWlwcy9leWVxN2guYwoKCmJhc2UtY29t
bWl0OiA3NDQzNGYyNTU4NzNkNzRlNTZjYzUwYWE3NjJkMWNhZjI0YzA5OWY4Ci0tIAoyLjQzLjAK
CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
