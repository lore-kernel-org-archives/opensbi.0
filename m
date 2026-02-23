Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE32EA4FD4
	for <opensbi@archiver.kernel.org>; Mon, 23 Feb 2026 14:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tuXmhEcl9hxmq28LCtdq3Qc6llfUz3/OT7V0Ge1Sj8U=; b=MFyV6TYc4TFWda
	TDBAM6ny5BIYKXHOlKb7wXvZv7knBpwwOniZGiYuNq3D7+2K2qGM/EeNOcmsd40Eu4DNIYH24Lam3
	6SZ5eldOzUJs938ZRB7JWfHyot6a9sOdkxxh05yfArWDidCdKb7TQa/MgX7z9ERxLnMrXiUQ0Pr0Z
	EOgJR7KRj/GEMxGhNpLtWnbWplk9JlFEGYU3ZfbwaTqzm8QHOCLPGeO+kLZacI7g3gTKzA/z4d0OS
	+Gzq2Sk3vq7YcQiS95M9AKoRW0hP1+BSykztv47zGxbfC4FZ068m8kQ0ViRhH8BVRHbQKoUSKKt4o
	/4S+YGR0rQk60/pfEKYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLU-00000000VeD-0TPg;
	Mon, 23 Feb 2026 14:55:36 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLQ-00000000VVL-2Jyn
	for opensbi@lists.infradead.org;
	Mon, 23 Feb 2026 14:55:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1771858532; x=1803394532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R/ybOWpImhSYjynI2wKcA5I4CWrZEyyZ3JJkarSdwBQ=;
  b=s//wZUxBOJsz08R0D8lvWr7M9uHaB3LaZjQ20kh4l8oqtmyjy/1SVS36
   twNdmQs7RvOnXHa/dIfupRUxYcBRkTzUKjmTVBFslULSfYp5sKM4to2Yk
   37HR7FMRO8xxBwqYK1oCnzi8OYe7uUV+aLVRV5CE0fAUqnrc9LdiOCly3
   oE4OV8vDfhV8/A2A5WTYY8tf4mdZ/MHu132Q+Ljd6/4/WR6sdZxzfOIY5
   Lnypre1RX4ABjYyte2ox5NHbQcMYN6jCP1RG5RIDsZX7XanFe6DkNdFUe
   LdCWACDuezFu8qRvVLQlo8NGLQb8UNtMs86a4iM7SVz/VH6NGpRZHSn+C
   g==;
X-CSE-ConnectionGUID: ZuIz/U3nQlaiL3pKRXRY+A==
X-CSE-MsgGUID: PFnBXaJ+Rluhz3OhKcO80g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 16:55:30 +0200
X-CSE-ConnectionGUID: VJ/ME8zlTNyw+3cN3P6oXA==
X-CSE-MsgGUID: 2dys1c2JSE2815HCYCP1hA==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces02_data.me-corp.lan with SMTP; 23 Feb 2026 16:58:12 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 23 Feb 2026 16:55:30 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	benoit.monin@bootlin.com,
	cc=cfu@mips.com,
	opensbi@lists.infradead.org
Subject: [PATCH v3 08/23] platform: generic: mips p8700: Add match data for CM info
Date: Mon, 23 Feb 2026 16:54:47 +0200
Message-ID: <20260223-for-upstream-eyeq7h-v3-8-621d004d1a21@mobileye.com>
In-Reply-To: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
References: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_065532_877360_7BDAB0A4 
X-CRM114-Status: GOOD (  16.64  )
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
aAppbmRleCA2NjQ0ZTkxZGQ0MmRiMmEzZDc0M2I1YzM0MzEzZjRhOGQ4NDllZGRjLi44MjgxZTVl
NmNlZjI4OWZkMDI0NThmNDY4ZjA2MjU2ZmMxOTY5MzdjIDEwMDY0NAotLS0gYS9wbGF0Zm9ybS9n
ZW5lcmljL2luY2x1ZGUvbWlwcy9wODcwMC5oCisrKyBiL3BsYXRmb3JtL2dlbmVyaWMvaW5jbHVk
ZS9taXBzL3A4NzAwLmgKQEAgLTEwLDYgKzEwLDE4IEBACiAKICNpbmNsdWRlIDxtaXBzL2JvYXJk
Lmg+CiAKKy8qKiBDb2hlcmVuY2UgbWFuYWdlciBpbmZvcm1hdGlvbgorICoKKyAqIEBudW1fY206
IE51bWJlciBvZiBjb2hlcmVuY2UgbWFuYWdlcgorICogQGdjcl9iYXNlOiBBcnJheSBvZiBiYXNl
IGFkZHJlc3Mgb2YgdGhlIENNCisgKi8KK3N0cnVjdCBwODcwMF9jbV9pbmZvIHsKKwl1bnNpZ25l
ZCBpbnQgbnVtX2NtOworCXVuc2lnbmVkIGxvbmcgKmdjcl9iYXNlOworfTsKKworZXh0ZXJuIGNv
bnN0IHN0cnVjdCBwODcwMF9jbV9pbmZvICpwODcwMF9jbV9pbmZvOworCiAvKiBQTUEgKi8KICNk
ZWZpbmUgQ1NSX01JUFNQTUFDRkcwCTB4N2UwCiAjZGVmaW5lIENTUl9NSVBTUE1BQ0ZHMQkweDdl
MQpkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9taXBzL3A4NzAwLmMgYi9wbGF0Zm9ybS9n
ZW5lcmljL21pcHMvcDg3MDAuYwppbmRleCA1MGQzM2NhY2VhZDFhNTdhYmQxYWQ4MGJjMTE3ZDU2
YWQ3OWQyMDlkLi43NWUxOTQxNmM1ZTEzZWI4M2JlNTgyNDNhMjE5NTI0NGU0MTQ3ZDNjIDEwMDY0
NAotLS0gYS9wbGF0Zm9ybS9nZW5lcmljL21pcHMvcDg3MDAuYworKysgYi9wbGF0Zm9ybS9nZW5l
cmljL21pcHMvcDg3MDAuYwpAQCAtMTcsNiArMTcsOCBAQAogI2luY2x1ZGUgPG1pcHMvcDg3MDAu
aD4KICNpbmNsdWRlIDxtaXBzL21pcHMtY20uaD4KIAorY29uc3Qgc3RydWN0IHA4NzAwX2NtX2lu
Zm8gKnA4NzAwX2NtX2luZm87CisKIGV4dGVybiB2b2lkIG1pcHNfd2FybV9ib290KHZvaWQpOwog
I2RlZmluZSBNTUlPX0JBU0UgMHgwMDAwMDAwMAogI2RlZmluZSBNTUlPX1NJWkUgMHg4MDAwMDAw
MApAQCAtMjg3LDYgKzI4OSwxNCBAQCBzdGF0aWMgaW50IG1pcHNfcDg3MDBfbmFzY2VudF9pbml0
KHZvaWQpCiAKIHN0YXRpYyBpbnQgbWlwc19wODcwMF9wbGF0Zm9ybV9pbml0KGNvbnN0IHZvaWQg
KmZkdCwgaW50IG5vZGVvZmYsIGNvbnN0IHN0cnVjdCBmZHRfbWF0Y2ggKm1hdGNoKQogeworCWNv
bnN0IHN0cnVjdCBwODcwMF9jbV9pbmZvICpkYXRhID0gbWF0Y2gtPmRhdGE7CisKKwlpZiAoIWRh
dGEpIHsKKwkJc2JpX3ByaW50ZigiTWlzc2luZyBDTSBpbmZvIGZvciAlc1xuIiwgbWF0Y2gtPmNv
bXBhdGlibGUpOworCQlyZXR1cm4gU0JJX0VJTlZBTDsKKwl9CisKKwlwODcwMF9jbV9pbmZvID0g
ZGF0YTsKIAlnZW5lcmljX3BsYXRmb3JtX29wcy5lYXJseV9pbml0ID0gbWlwc19wODcwMF9lYXJs
eV9pbml0OwogCWdlbmVyaWNfcGxhdGZvcm1fb3BzLmZpbmFsX2luaXQgPSBtaXBzX3A4NzAwX2Zp
bmFsX2luaXQ7CiAJZ2VuZXJpY19wbGF0Zm9ybV9vcHMubmFzY2VudF9pbml0ID0gbWlwc19wODcw
MF9uYXNjZW50X2luaXQ7CkBAIC0yOTUsOCArMzA1LDE3IEBAIHN0YXRpYyBpbnQgbWlwc19wODcw
MF9wbGF0Zm9ybV9pbml0KGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGVvZmYsIGNvbnN0IHN0cnVj
dCBmCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyB1bnNpZ25lZCBsb25nIG1pcHNfcDg3MDBfZ2Ny
X2Jhc2VbXSA9IHsKKwkweDE2MTAwMDAwLAorfTsKKworc3RhdGljIHN0cnVjdCBwODcwMF9jbV9p
bmZvIG1pcHNfcDg3MDBfY21faW5mbyA9IHsKKwkubnVtX2NtID0gYXJyYXlfc2l6ZShtaXBzX3A4
NzAwX2djcl9iYXNlKSwKKwkuZ2NyX2Jhc2UgPSBtaXBzX3A4NzAwX2djcl9iYXNlLAorfTsKKwog
c3RhdGljIGNvbnN0IHN0cnVjdCBmZHRfbWF0Y2ggbWlwc19wODcwMF9tYXRjaFtdID0gewotCXsg
LmNvbXBhdGlibGUgPSAibWlwcyxwODcwMCIgfSwKKwl7IC5jb21wYXRpYmxlID0gIm1pcHMscDg3
MDAiLCAuZGF0YSA9ICZtaXBzX3A4NzAwX2NtX2luZm8gfSwKIAl7IH0sCiB9OwogCgotLSAKMi40
My4wCgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
