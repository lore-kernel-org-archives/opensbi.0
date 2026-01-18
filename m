Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71883C9832F
	for <opensbi@archiver.kernel.org>; Sun, 18 Jan 2026 11:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DKNoFRj5HDEiLO8Tw6l6wVRwBOWVvN47BA6lLIPpsVo=; b=htt8rUFNn03gua
	gLj9bzlmxxxbiwesm8w9PpmrWtqfzKaX3vl5sgzySjSjQQBj88fTrOOKHPnPy7VHpd0zXKQLl7CDr
	beCkf8F5rmhpN6Syo546LjiNgxclQDYKOttaJbr6s9oQIjWBtbNOrdQEbqMtBcPBpAgdI31PvKKzc
	kO7RQEuN9SZY6iQ+iLk3Ics7IzM/JZ5UOiatqynKzvI7jrNx2XinFUSW1u6Ha7ybCbq8vjQnOJqvQ
	/K2PYHONYiy7SQMRGfr5gvDoIomAAy6UrVx7E4lEwnV/9N0lTjjbjbSpk3OnRuc2VSywETi6jGZr2
	TkjUQyVReNi5z5TkMi3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhR6l-0000000HSqP-2U18;
	Sun, 18 Jan 2026 11:38:15 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhR6h-0000000HSoX-3PEQ
	for opensbi@lists.infradead.org;
	Sun, 18 Jan 2026 11:38:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768736291; x=1800272291;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Xn0FVN1csOI8QASOd6j2w53mu8cs4PsxGeEzgLA0CfM=;
  b=mBa+HTMsUTFoJZpod9WhA5WRlPAFfNMHyyFhEyDQH2SniE9Ud2C8yvZX
   DDXTD7NLn4/k/GAJR2E8PKicp7LGGUFaII9pJGN9qHXspJkMcw83Gt5WH
   eM3CpdqatU62zMYvyXxGcmWaRUk93jIg7NLPjR22VAb/GfS7Qf11d9e9o
   Z5zk11ONDxqfDroXthJJpEwupLm+41Rq7eq9m3sKHl6s6lfXVOe50XNh1
   NMTWm3sKuSXilRVerqWrI2sbT8eduHMlBwGHa7+dfTUuJJaHBpFrGvbxP
   kbcNPfhL6zAL91njzULEaNcU4RC2qpxBsIR9v+/VPUpQavjPay7pd5n2M
   w==;
X-CSE-ConnectionGUID: jesx3HWBTBa07iaw9MlIGQ==
X-CSE-MsgGUID: m9i9ZlFTRL6kJQwvHX11aA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 13:38:05 +0200
X-CSE-ConnectionGUID: 8W4unF/ASD2TVMaWUZ1Rkg==
X-CSE-MsgGUID: XdG+IcVwRKKYjzwpn1RUJA==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces04_data.me-crop.lan with SMTP; 18 Jan 2026 13:39:55 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Sun, 18 Jan 2026 13:38:04 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: vladimir.kondratiev@mobileye.com,
	anup@brainfault.org
Cc: benoit.monin@bootlin.com,
	cfu@mips.com,
	opensbi@lists.infradead.org,
	cc=cfu@mips.com
Subject: [PATCH v2 00/20] Introduce MIPS p8700 based "eyeq7h" and "boston"
Date: Sun, 18 Jan 2026 13:37:42 +0200
Message-ID: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
In-Reply-To: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
References: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-Change-ID: 20260115-for-upstream-eyeq7h-9031bdae1148
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_033812_312045_7BCCECC4 
X-CRM114-Status: UNSURE (   7.21  )
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
aWV2ICgxOSk6DQogICAgICBsaWI6IHNiaTogcHJpbnQgaGFydGlkIGluIGhleA0KICAgICAgcGxh
dGZvcm06IGdlbmVyaWM6IG1pcHMgcDg3MDA6IGltcHJvdmUgQ00gYWNjZXNzIHRyYWNpbmcNCiAg
ICAgIHBsYXRmb3JtOiBnZW5lcmljOiBtaXBzIHA4NzAwOiByZXNlcnZlIG1lbW9yeSBmb3IgTS1t
b2RlIHBlcmlwaGVyYWxzDQogICAgICBwbGF0Zm9ybTogZ2VuZXJpYzogbWlwcyBwODcwMDogZml4
IHBvd2VyaW5nIHVwIG90aGVyIGNsdXN0ZXINCiAgICAgIHBsYXRmb3JtOiBnZW5lcmljOiBtaXBz
IHA4NzAwOiBmYXN0ZXIgY29yZSBib290DQogICAgICBwbGF0Zm9ybTogZ2VuZXJpYzogbWlwcyBw
ODcwMDogdXNlIGdsb2JhbCBDTSBhZGRyZXNzZXMNCiAgICAgIHBsYXRmb3JtOiBnZW5lcmljOiBt
aXBzIHA4NzAwOiBhY2Nlc3MgQ00gcmVnaXN0ZXJzIHZpYSBtYXRjaCBkYXRhDQogICAgICBwbGF0
Zm9ybTogZ2VuZXJpYzogbWlwczogYWRkIFA4NzAwIGJhc2VkICJleWVxN2giIGFuZCAiYm9zdG9u
Ig0KICAgICAgcGxhdGZvcm06IGdlbmVyaWM6IG1pcHMgZXllcTdoOiBwb3dlciB1cCBjbHVzdGVy
cyB3aXRoIE9MQg0KICAgICAgcGxhdGZvcm06IGdlbmVyaWM6IG1pcHMgZXllcTdoOiBkZXRlY3Qg
YWNjZWxlcmF0b3JzIGNsdXN0ZXIgcHJlc2VuY2UNCiAgICAgIHBsYXRmb3JtOiBnZW5lcmljOiBt
aXBzIGV5ZXE3aDogZGVhc3NlcnQgYWNjZWxlcmF0b3IgY2x1c3RlciByZXNldHMNCiAgICAgIHBs
YXRmb3JtOiBnZW5lcmljOiBtaXBzIHA4NzAwOiBjYWNoZSBnZW9tZXRyeSBkZXRlY3Rpb24NCiAg
ICAgIHBsYXRmb3JtOiBnZW5lcmljOiBtaXBzIHA4NzAwOiBDUFUgY2x1c3RlcnMgbWVtcmFuZ2Vz
DQogICAgICBwbGF0Zm9ybTogZ2VuZXJpYzogbWlwcyBwODcwMDogdXNlIFNCSSBiaXRmaWVsZCBt
YW5pcHVsYXRvciBtYWNyb3MNCiAgICAgIHBsYXRmb3JtOiBnZW5lcmljOiBtaXBzIHA4NzAwOiBz
eW5jaHJvbml6ZSBoaS1yZXMgdGltZXJzDQogICAgICBwbGF0Zm9ybTogZ2VuZXJpYzogbWlwcyBl
eWVxN2g6IHN5bmNocm9uaXplIHRpbWVycyBhY3Jvc3MgY2x1c3RlcnMNCiAgICAgIHBsYXRmb3Jt
OiBnZW5lcmljOiBtaXBzIGV5ZXE3aDogZml4IE5DT1JFIHJlZ2lzdGVycyBhY2Nlc3MgZnJvbSBj
bHVzdGVycyAxLi4yDQogICAgICBwbGF0Zm9ybTogZ2VuZXJpYzogbWlwcyBwODcwMDogZHVtcCBN
TUlPIHJlZ2lvbnMNCiAgICAgIHBsYXRmb3JtOiBnZW5lcmljOiBtaXBzIGV5ZXE3aDogcHJvaGli
aXQgYWNjZXNzaW5nIG1lbW9yeSBiZXlvbmQgRFJBTQ0KDQogbGliL3NiaS9zYmlfZG9tYWluLmMg
ICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0NCiBwbGF0Zm9ybS9nZW5lcmljL0tjb25maWcg
ICAgICAgICAgICAgICAgICB8ICAxNiArLQ0KIHBsYXRmb3JtL2dlbmVyaWMvY29uZmlncy9kZWZj
b25maWcgICAgICAgIHwgICAxIC0NCiBwbGF0Zm9ybS9nZW5lcmljL2NvbmZpZ3MvZXllcTdoX2Rl
ZmNvbmZpZyB8ICA2MSArKysrDQogcGxhdGZvcm0vZ2VuZXJpYy9pbmNsdWRlL21pcHMvYm9hcmQu
aCAgICAgfCAgMzMgLS0NCiBwbGF0Zm9ybS9nZW5lcmljL2luY2x1ZGUvbWlwcy9taXBzLWNtLmgg
ICB8ICA1NSArKy0tDQogcGxhdGZvcm0vZ2VuZXJpYy9pbmNsdWRlL21pcHMvcDg3MDAuaCAgICAg
fCAxNjYgKysrKysrKy0tLQ0KIHBsYXRmb3JtL2dlbmVyaWMvbWlwcy9ib3N0b24uYyAgICAgICAg
ICAgIHwgMTUwICsrKysrKysrKw0KIHBsYXRmb3JtL2dlbmVyaWMvbWlwcy9leWVxN2guYyAgICAg
ICAgICAgIHwgNDkzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KIHBsYXRmb3JtL2dl
bmVyaWMvbWlwcy9vYmplY3RzLm1rICAgICAgICAgIHwgICA3ICstDQogcGxhdGZvcm0vZ2VuZXJp
Yy9taXBzL3A4NzAwLmMgICAgICAgICAgICAgfCA0MTAgKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LQ0KIDExIGZpbGVzIGNoYW5nZWQsIDEwOTIgaW5zZXJ0aW9ucygrKSwgMzAyIGRlbGV0aW9ucygt
KQ0KLS0tDQpiYXNlLWNvbW1pdDogNzQ0MzRmMjU1ODczZDc0ZTU2Y2M1MGFhNzYyZDFjYWYyNGMw
OTlmOA0KY2hhbmdlLWlkOiAyMDI2MDExNS1mb3ItdXBzdHJlYW0tZXllcTdoLTkwMzFiZGFlMTE0
OA0KDQpCZXN0IHJlZ2FyZHMsDQotLSANClZsYWRpbWlyIEtvbmRyYXRpZXYgPHZsYWRpbWlyLmtv
bmRyYXRpZXZAbW9iaWxleWUuY29tPg0KDQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5z
YmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL29wZW5zYmkK
