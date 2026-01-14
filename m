Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D364FD31A36
	for <opensbi@archiver.kernel.org>; Wed, 14 Jan 2026 09:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H3a28DfzBtNoA4PfHMx8aARjhh2z1RczpbyRJB62sgc=; b=K8JI9+eyX3ajJP
	8ml6cxzITgpc/EUV5vIoM0cgXou8tQKhhBqDgLi3seNw77MUAYiHnjS93hAeMLAtjEjt0THhW2ehK
	R10GhPJ3OTTd3yqb1m7PhCLOZ/xEiPtpv0UTiIbqw0LP8NJFnjpbM4hpdCvXiagvOsDUPfH2RhKpy
	fKwRH1JwjmvGZg7ASzv00nm+BDC5uIKmfPRWngNCi4LjljTDq37utwNQrwJ4DmLU3UUO3UtICtCwS
	KXZuXAMPJMa3BTahit3WtR49jEt9CCRj4g2idVjFbXJmkkQ+SmW1Me+V6+fGvt4bL+rma6ykZTM1r
	2w/wE6o57hfaOSooYbeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxBK-00000008YS7-3plF;
	Wed, 14 Jan 2026 09:28:50 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxBG-00000008YO6-0PtN
	for opensbi@lists.infradead.org;
	Wed, 14 Jan 2026 09:28:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768382926; x=1799918926;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mdtCnPQSFxIwovvObdFlCZERgSGMFmP+bdBkWh0tR34=;
  b=ToVQrY072xwx1vQ0wiGT7DWsx8KWkWgnb/aVr18n5uI9889r3uKGXZZ8
   6qhg2f3plCEcFt32dRIkydcaY87NcDAYwz5YBSrDnLCmUWClecVGmGL1t
   WCHe2GmrfbZgrhbthj61z/OAymfyiZXd4h0iQK8ePziaqc7dq42zjb2dp
   GIKMkFylK2F/LLNhYu5WN66jfU5J9r+w6iDiMEqhdmiTKlufmWfGDZJ64
   beXgIMvvsJ2Kl3htnWxihu33neq1YowoAp6anDObDVmTs9cwABgE7HkPI
   k8aTK21fxJkbX3R4NfmCjnIQVIYcmyqq2mfptpK73TRgekuCNj5W6FLc8
   A==;
X-CSE-ConnectionGUID: IKWDQWRxSOa9djxPvOgmbg==
X-CSE-MsgGUID: 6Ies6N9oTq+WJhxwqswCgA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 11:21:31 +0200
X-CSE-ConnectionGUID: MoXfEu1SQ3y+UAzU+I8MpA==
X-CSE-MsgGUID: Pjt9v8ZSTqCGay5Y3mOtiQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces01_data.me-corp.lan with SMTP; 14 Jan 2026 11:23:18 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Wed, 14 Jan 2026 11:21:30 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: cfu@mips.com,
	opensbi@lists.infradead.org,
	benoit.monin@bootlin.com
Subject: [PATCH 09/22] platform: generic: mips p8700: Add match data for CM info
Date: Wed, 14 Jan 2026 11:21:05 +0200
Message-ID: <20260114092118.1315581-10-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
References: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_012846_447704_48BE3FCB 
X-CRM114-Status: GOOD (  16.86  )
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

RnJvbTogQmVub8OudCBNb25pbiA8YmVub2l0Lm1vbmluQGJvb3RsaW4uY29tPgoKSW50cm9kdWNl
IGEgc3RydWN0dXJlIHA4NzAwX2NtX2luZm8gaG9sZGluZyB0aGUgbnVtYmVyIG9mIGNvaGVyZW5j
ZQptYW5hZ2VycyBhbmQgdGhlaXIgYmFzZSBhZGRyZXNzZXMgZm91bmQgaW4gYSBwYXJ0aWN1bGFy
IFNvQy4KCkRlY2xhcmUgYSBnbG9iYWwgcG9pbnRlciB0byB0aGUgc3RydWN0dXJlIHRoYXQgaXMg
c2V0IGluCm1pcHNfcDg3MDBfcGxhdGZvcm1faW5pdCgpLCBiYXNlZCBvbiB0aGUgbWF0Y2ggZGF0
YSBvZiB0aGUgcGxhdGZvcm0KY29tcGF0aWJsZS4KCkZvciB0aGUgbWF0Y2ggZGF0YSBvZiB0aGUg
TUlQUyBQODcwMCwgYSBzaW5nbGUgY29oZXJlbmNlIG1hbmFnZXIgd2l0aAphIGJhc2UgYWRkcmVz
cyBvZiAweDE2MTAwMDAwIGlzIGRlY2xhcmVkLCBpZGVudGljYWwgdG8gd2hhdCBpcyBmb3VuZApp
biBtaXBzL2JvYXJkLmguCgpGb3Igbm93LCBhY2Nlc3MgdG8gdGhlIGNvaGVyZW5jZSBtYW5hZ2Vy
IHJlZ2lzdGVyIGlzIHN0aWxsIGJhc2VkIG9uCnRoZSBoYXJkLWNvZGVkIHZhbHVlcyBkZWZpbmVk
IGluIG1pcHMvYm9hcmQuaC4KClNpZ25lZC1vZmYtYnk6IEJlbm/DrnQgTW9uaW4gPGJlbm9pdC5t
b25pbkBib290bGluLmNvbT4KLS0tCiBwbGF0Zm9ybS9nZW5lcmljL2luY2x1ZGUvbWlwcy9wODcw
MC5oIHwgMTIgKysrKysrKysrKysrCiBwbGF0Zm9ybS9nZW5lcmljL21pcHMvcDg3MDAuYyAgICAg
ICAgIHwgMjEgKysrKysrKysrKysrKysrKysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDMyIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9wbGF0Zm9ybS9nZW5lcmljL2lu
Y2x1ZGUvbWlwcy9wODcwMC5oIGIvcGxhdGZvcm0vZ2VuZXJpYy9pbmNsdWRlL21pcHMvcDg3MDAu
aAppbmRleCA2NjQ0ZTkxZGQ0MmQuLjgyODFlNWU2Y2VmMiAxMDA2NDQKLS0tIGEvcGxhdGZvcm0v
Z2VuZXJpYy9pbmNsdWRlL21pcHMvcDg3MDAuaAorKysgYi9wbGF0Zm9ybS9nZW5lcmljL2luY2x1
ZGUvbWlwcy9wODcwMC5oCkBAIC0xMCw2ICsxMCwxOCBAQAogCiAjaW5jbHVkZSA8bWlwcy9ib2Fy
ZC5oPgogCisvKiogQ29oZXJlbmNlIG1hbmFnZXIgaW5mb3JtYXRpb24KKyAqCisgKiBAbnVtX2Nt
OiBOdW1iZXIgb2YgY29oZXJlbmNlIG1hbmFnZXIKKyAqIEBnY3JfYmFzZTogQXJyYXkgb2YgYmFz
ZSBhZGRyZXNzIG9mIHRoZSBDTQorICovCitzdHJ1Y3QgcDg3MDBfY21faW5mbyB7CisJdW5zaWdu
ZWQgaW50IG51bV9jbTsKKwl1bnNpZ25lZCBsb25nICpnY3JfYmFzZTsKK307CisKK2V4dGVybiBj
b25zdCBzdHJ1Y3QgcDg3MDBfY21faW5mbyAqcDg3MDBfY21faW5mbzsKKwogLyogUE1BICovCiAj
ZGVmaW5lIENTUl9NSVBTUE1BQ0ZHMAkweDdlMAogI2RlZmluZSBDU1JfTUlQU1BNQUNGRzEJMHg3
ZTEKZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2dlbmVyaWMvbWlwcy9wODcwMC5jIGIvcGxhdGZvcm0v
Z2VuZXJpYy9taXBzL3A4NzAwLmMKaW5kZXggOTRjYmExNjMxNjY2Li5jNWJmNDlmNmZmOGIgMTAw
NjQ0Ci0tLSBhL3BsYXRmb3JtL2dlbmVyaWMvbWlwcy9wODcwMC5jCisrKyBiL3BsYXRmb3JtL2dl
bmVyaWMvbWlwcy9wODcwMC5jCkBAIC0xOCw2ICsxOCw4IEBACiAjaW5jbHVkZSA8bWlwcy9wODcw
MC5oPgogI2luY2x1ZGUgPG1pcHMvbWlwcy1jbS5oPgogCitjb25zdCBzdHJ1Y3QgcDg3MDBfY21f
aW5mbyAqcDg3MDBfY21faW5mbzsKKwogZXh0ZXJuIHZvaWQgbWlwc193YXJtX2Jvb3Qodm9pZCk7
CiAjZGVmaW5lIE1NSU9fQkFTRSAweDAwMDAwMDAwCiAjZGVmaW5lIE1NSU9fU0laRSAweDgwMDAw
MDAwCkBAIC0zMzEsNiArMzMzLDE0IEBAIHN0YXRpYyBpbnQgbWlwc19wODcwMF9uYXNjZW50X2lu
aXQodm9pZCkKIAogc3RhdGljIGludCBtaXBzX3A4NzAwX3BsYXRmb3JtX2luaXQoY29uc3Qgdm9p
ZCAqZmR0LCBpbnQgbm9kZW9mZiwgY29uc3Qgc3RydWN0IGZkdF9tYXRjaCAqbWF0Y2gpCiB7CisJ
Y29uc3Qgc3RydWN0IHA4NzAwX2NtX2luZm8gKmRhdGEgPSBtYXRjaC0+ZGF0YTsKKworCWlmICgh
ZGF0YSkgeworCQlzYmlfcHJpbnRmKCJNaXNzaW5nIENNIGluZm8gZm9yICVzXG4iLCBtYXRjaC0+
Y29tcGF0aWJsZSk7CisJCXJldHVybiBTQklfRUlOVkFMOworCX0KKworCXA4NzAwX2NtX2luZm8g
PSBkYXRhOwogCWdlbmVyaWNfcGxhdGZvcm1fb3BzLmVhcmx5X2luaXQgPSBtaXBzX3A4NzAwX2Vh
cmx5X2luaXQ7CiAJZ2VuZXJpY19wbGF0Zm9ybV9vcHMuZmluYWxfaW5pdCA9IG1pcHNfcDg3MDBf
ZmluYWxfaW5pdDsKIAlnZW5lcmljX3BsYXRmb3JtX29wcy5uYXNjZW50X2luaXQgPSBtaXBzX3A4
NzAwX25hc2NlbnRfaW5pdDsKQEAgLTMzOSw4ICszNDksMTcgQEAgc3RhdGljIGludCBtaXBzX3A4
NzAwX3BsYXRmb3JtX2luaXQoY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZW9mZiwgY29uc3Qgc3Ry
dWN0IGYKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIHVuc2lnbmVkIGxvbmcgbWlwc19wODcwMF9n
Y3JfYmFzZVtdID0geworCTB4MTYxMDAwMDAsCit9OworCitzdGF0aWMgc3RydWN0IHA4NzAwX2Nt
X2luZm8gbWlwc19wODcwMF9jbV9pbmZvID0geworCS5udW1fY20gPSBhcnJheV9zaXplKG1pcHNf
cDg3MDBfZ2NyX2Jhc2UpLAorCS5nY3JfYmFzZSA9IG1pcHNfcDg3MDBfZ2NyX2Jhc2UsCit9Owor
CiBzdGF0aWMgY29uc3Qgc3RydWN0IGZkdF9tYXRjaCBtaXBzX3A4NzAwX21hdGNoW10gPSB7Ci0J
eyAuY29tcGF0aWJsZSA9ICJtaXBzLHA4NzAwIiB9LAorCXsgLmNvbXBhdGlibGUgPSAibWlwcyxw
ODcwMCIsIC5kYXRhID0gJm1pcHNfcDg3MDBfY21faW5mbyB9LAogCXsgfSwKIH07CiAKLS0gCjIu
NDMuMAoKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
