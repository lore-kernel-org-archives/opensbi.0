Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BE1CCD199
	for <opensbi@archiver.kernel.org>; Fri, 17 Oct 2025 05:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xdx57FgEGPRvfU9H8rXDtGSEHNGGTrAgZ2hNzBky4uI=; b=gNcuABOcbK24iA
	ZoIkx3yTs8F8ctEZgcP3RGEokgq5xGa2NHPnyCsm/S+w/ec8HNKuDegGIRVC1TaLQcNARwPJODjD9
	UAXEwAuiNxFCFCbaf/H8yh50Zde04CXY+WeaJkV1tgWMn5YA6+hbfpA1TcRgMUJdqWx7rR1tz4HTQ
	n1YBKJbVlgvb9uqw6+T1l41byD+P8k/1D/76xXqYxvmfE8IJ8nOFrRyPzCSN7MpMu8WRXLhrA9rus
	a7ID8x3bqYJiDxajGdELTv34L9AJOG88x2lkJREjRbmX9KQfG4I/2TrVg+aotHrZ0v92RJoAen7PQ
	9NhR8k6mlqUQOoj0jOfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9dSn-00000006g8J-3IrX;
	Fri, 17 Oct 2025 05:57:17 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9dSl-00000006g5H-0fkk
	for opensbi@lists.infradead.org;
	Fri, 17 Oct 2025 05:57:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760680611;
	bh=5hhqQoLHJpcoTiQjHkuWKzs8xGcaWNmU23yC1NBMDdE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=Rk/6UgsTZKse6A5ZmbUlIBgRV+banUMPKg5SgPU+6Zq/5wNNvtf6k6JrS6bgbLm7l
	 3woo8ENRJY1mHr5hZfpQVx3aUBzp1/WfM8V3B1gsTQIMIhFznDYUtgJcuKsjsKjLl5
	 sbrQtP+fsN1h9nlxyQLXw3qO6FRahm+6vcB0i+Io=
X-QQ-mid: zesmtpgz4t1760680610t3d0ae766
X-QQ-Originating-IP: 2ygBZlIY4SHYBBLou+uZwDynS01AsTUGZq9xiDGdhcE=
Received: from = ( [14.123.253.52])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 17 Oct 2025 13:56:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11332119504673631677
EX-QQ-RecipientCnt: 4
Date: Fri, 17 Oct 2025 13:56:49 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Xiang W <wxjstz@126.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
Subject: Re: [PATCH v3 1/3] platform: generic: spacemit: add K1
Message-ID: <CEDA1BDE8D93F026+aPHaocqU46Q9RwAM@kernel.org>
References: <20250925-smt-k1-8-cores-v3-0-0885a8a70f8e@linux.spacemit.com>
 <20250925-smt-k1-8-cores-v3-1-0885a8a70f8e@linux.spacemit.com>
 <63d825e59b9ac55a9cd74d1e0f8b9b071ad979a2.camel@126.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <63d825e59b9ac55a9cd74d1e0f8b9b071ad979a2.camel@126.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MPAlP4yRn0xgl6bIp4iRbqTV1SURJzK3W9qesiSrS8hYkzca2PrVYaBB
	eF2u8hUIDV2iYALQBUEtNfaSNdDm/7kcv4EjA1ceDtyAHY3ndDWDNInW6eNP1V/Iusn27OT
	NHQlAgbAfZIZFpOmJFIHkJIV+zbAvjDeL9fSQbJSMQTmE05gA7dY4a4RelA3VAr7GdL8ydd
	bJMhHP9+0CcJgQGLjq9bAs/uObD2ozipEV5GhNcM1I4Ha/tCkvsb2TDTQ3Q1JyGOocgKqB8
	QySHIFHWmGIazd4XaONyD68iK9qE9SA37ZF94CpPYsA6/xsQ5HJ2OF5Pl7QlsKYc1vLwMKa
	yLiqP07wLWS+hO4z94PgDrGMIcjzqqvtD+yFOzKaNqfja9T2hzKnDilCrnjiJX8ENOCPsd+
	TLqXnKu7bRneaytmgVARsJYd2AkX+nytXWJEZnohiPNFi6bp/8Q4ZrUu4Av3G/u4ON9bCP7
	7tOhh1p91cBx2tr3l0CjDGrObMoV8yde3Oj8ah+Aachv7bHg7UaAUayDZn5s339aPzDkZOZ
	RaJ55AGgFOvAEKs/NbMmYT6LHSTV+x8fAWG+ln/E9uYFfbmzWGrrrgDc1Tv6JcMGtKAf91H
	Mg1Em44prJnIacrVG8fsxAOEqcuenxVttq9kbd615oY2Zy2PVVK60rBqyM/pi+McB3iVNFH
	s9g1im3081oIhCok/Fm7k6ZD7N5fboz7dO8Xi+jDy6JcdQDOS9bmRFwCl0KVPbFG/rtyqxY
	4TuMAnBTqsgjAhZku2K0TjtQueVUB1gvvFPzqbi4xrWTBJd9TKsFCXWkPw20mx3KtuOV+kS
	vaBqMGaxUXcM0xJxrvbJmOClvbvc00qiMKcnTgR29hyOFEGJA+R/o55LMvJ/QymHm6D1adq
	P+CY2Epph1S/Mu3fFoXGgqSdYYKf0EISmCoh8mc+ZHLOG6QnwzQ6o8b8IeuD+9bdPc647ax
	0VH8yCuE5K3Q41D7xpcVha2kanOw3yjfYSrqunOn4qkmIqVgQqqT69Q6G67DWO88Mh/79SC
	NxnJYAAlknpSna8tRUPueUlt1EwNoHKLTj6UHPQrDRehg/DMTYmzsoUJhfQ4u5MzaotPs7k
	daQ9VGFdkmk
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_225715_700238_9D38A111 
X-CRM114-Status: GOOD (  12.22  )
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

T24gRnJpLCBTZXAgMjYsIDIwMjUgYXQgMDM6MTc6MjNQTSArMDgwMCwgWGlhbmcgVyB3cm90ZToK
PiDlnKggMjAyNS0wOS0yNeWbm+eahCAxNzo0OCArMDgwMO+8jFRyb3kgTWl0Y2hlbGzlhpnpgZPv
vJoKPiA+IEZyb206IFhpYW5iaW4gWmh1IDx4aWFuYmluLnpodUBsaW51eC5zcGFjZW1pdC5jb20+
Cj4gPiAKPiA+IEFkZCBpbml0aWFsIHBsYXRmb3JtIHN1cHBvcnQgZm9yIHRoZSBTcGFjZW1pVCBL
MSBTb0MsIGluY2x1ZGluZwo+ID4gZWFybHkvZmluYWwgaW5pdCBob29rcywgY29sZCBib290IGhh
bmRsaW5nLCBhbmQgQ0NJLTU1MCBzbm9vcC9EVk0KPiA+IGVuYWJsZW1lbnQuCj4gPiAKPiA+IENv
LWF1dGhvcmVkLWJ5OiBUcm95IE1pdGNoZWxsIDx0cm95Lm1pdGNoZWxsQGxpbnV4LnNwYWNlbWl0
LmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFRyb3kgTWl0Y2hlbGwgPHRyb3kubWl0Y2hlbGxAbGlu
dXguc3BhY2VtaXQuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogWGlhbmJpbiBaaHUgPHhpYW5iaW4u
emh1QGxpbnV4LnNwYWNlbWl0LmNvbT4KPiA+IC0tLQo+ID4gwqBwbGF0Zm9ybS9nZW5lcmljL0tj
b25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDQgKysKPiA+IMKgcGxhdGZv
cm0vZ2VuZXJpYy9pbmNsdWRlL3NwYWNlbWl0L2sxLmggfMKgIDk4ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ID4gwqBwbGF0Zm9ybS9nZW5lcmljL3NwYWNlbWl0L2sxLmPCoMKgwqDCoMKg
wqDCoMKgIHwgMTE5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gwqAzIGZp
bGVzIGNoYW5nZWQsIDIyMSBpbnNlcnRpb25zKCspCj4gPiAKWy4uLl0KPiA+ICtzdGF0aWMgYm9v
bCBzcGFjZW1pdF9jb2xkX2Jvb3RfYWxsb3dlZCh1MzIgaGFydGlkKQo+ID4gK3sKPiA+ICsJY3Ny
X3NldChDU1JfTUwyU0VUVVAsIDEgPDwgKGhhcnRpZCAlIFBMQVRGT1JNX01BWF9DUFVTX1BFUl9D
TFVTVEVSKSk7Cj4gPiArCj4gPiArCXJldHVybiAhaGFydGlkOwo+ID4gK30KPiBPbmx5IHRoZSBw
cmltYXJ5IGNvcmUgd2lsbCBiZSBicm91Z2h0IHVwLCBzbyB3ZSBkbyBub3QgbmVlZCB0byBpbXBs
ZW1lbnQgCj4gY29sZF9ib290X2FsbG93ZWQuIFRoZSBDU1Igb3BlcmF0aW9uIGhlcmUgY2FuIGJl
IG1vdmVkIHRvIG5hc2NlbnRfaW5pdAo+IAo+IFJlZ2FyZHMsCj4gWGlhbmcgVwpJJ20gbm90IHN1
cmUgaWYgZXZlcnlvbmUgcmVjZWl2ZWQgdGhpcyBlbWFpbCBbMV0uLi4KaXQgZG9lc24ndCBzZWVt
IHRvIGZvcm0gYSBwcm9wZXIgdGhyZWFkLgoKICAgICAgICAgICAgICAgICAgICAgICAgICAtIFRy
b3kKCkxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8xNTE2OUUzOTI1OTdEMzE5K2FP
Y0t1akNsOG16NFhLNExAa2VybmVsLm9yZy8gWzFdCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QK
b3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
