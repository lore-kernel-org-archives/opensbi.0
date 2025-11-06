Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4005DCCFA03
	for <opensbi@archiver.kernel.org>; Thu,  6 Nov 2025 09:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gpbBgePJua7Gi2m36NX2UJduKi+ftfsFkCA60boO1UY=; b=JIU9H3gQoVGevw
	UQIMILTcX4z2PqmOoR6YkPCdapzlneMHFWNfoJU0rrVGktbirjUS41NAT/2PacMwibtprScgNCrpz
	i+rBieazbC3/jfFq9fp9lPJTBd0a5lCdyvC6O7yhbD+YduJtbQ2ga0pmJNp3oIXwBL+cgYV5Kdin6
	cBppdvO/X9edEbKEmvd7NZFzH7091ZQPbYn+m5c/vx4p92O/XeJcFb8MYgF2QPLLwFs61dkUy49Ys
	Ch40lnwq2++sYcTjvsQU+E7ByYCQwC/33An2GwMn57nwi8wyLjjA200UdQcDcE+Qjyr/fJsZROlK7
	qqPxPvqyH9b1lYspB7/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwI2-0000000F9Jj-0Uyf;
	Thu, 06 Nov 2025 09:28:22 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwHy-0000000F9JM-2vON
	for opensbi@lists.infradead.org;
	Thu, 06 Nov 2025 09:28:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A63FCC0FA83;
	Thu,  6 Nov 2025 09:27:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD30D6068C;
	Thu,  6 Nov 2025 09:28:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E52EA11850703;
	Thu,  6 Nov 2025 10:28:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762421293; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=67pOpbYRaRkiQht7P/y+0XiGGDgjFRZEmPnBi3GRFOA=;
	b=fZw7br+EM+67W7EmP/oGL13XYNx8x26acM2lTCsH7hJGYUUSknkWTgtxCozytb2py8xnJE
	EF2/BrARSBOa/lX3532h6vwdP3QOsFl1WsZLFqalx+SFfeyPNUbLyABrzJKJudorwQVq5v
	ZacVV0WCG7ZuDXJTz/zTVLfLSWedN7NvsPh1cY46z1OOKHUOcW1NIvqQuJcWgwiOlQcVjh
	k//C7wykbZJp7d5uhuXWFZb1ogX2U7U6sliNo5OPaF/L52NyPydkcB40e2A695PD2V0/7O
	OLYtVVe6ZMtDUa+XApSMLN4K7PI58KzFc8FDxZ7BRNlkxCechpVHnrbxGzG8gg==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH v2 2/2] lib: utils/timer: mtimer: add MIPS P8700 compatible
Date: Thu, 06 Nov 2025 10:12:27 +0100
Message-ID: <4998143.OV4Wx5bFTl@benoit.monin>
In-Reply-To: <CAAhSdy3QTuFkuqjGaibU5btxxbsANwLpwaiku30cavG+jtrKwQ@mail.gmail.com>
References: <20251027-p8700-aclint-v2-0-f10cbfb66e92@bootlin.com>
 <20251027-p8700-aclint-v2-2-f10cbfb66e92@bootlin.com>
 <CAAhSdy3QTuFkuqjGaibU5btxxbsANwLpwaiku30cavG+jtrKwQ@mail.gmail.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_012819_059490_F0A1C22B 
X-CRM114-Status: GOOD (  31.37  )
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

SGkgQW51cCwKCk9uIFdlZG5lc2RheSwgNSBOb3ZlbWJlciAyMDI1IGF0IDE3OjExOjExIENFVCwg
QW51cCBQYXRlbCB3cm90ZToKPiBPbiBNb24sIE9jdCAyNywgMjAyNSBhdCA2OjQy4oCvUE0gQmVu
b8OudCBNb25pbiA8YmVub2l0Lm1vbmluQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+Cj4gPiBUaGUg
TVRJTUVSIG9mIHRoZSBNSVBTIFA4NzAwIGlzIGNvbXBsaWFudCB3aXRoIHRoZSBBQ0xJTlQgc3Bl
Y2lmaWNhdGlvbiwKPiA+IHNvIGFkZCBhIGNvbXBhdGlibGUgc3RyaW5nIGZvciBpdC4KPiA+Cj4g
PiBJbiBhIG11bHRpLWNsdXN0ZXIgY29uZmlndXJhdGlvbiwgdGhlcmUgaXMgb25lIE1USU1FUiBw
ZXIgY2x1c3RlciwgZWFjaAo+ID4gYXNzb2NpYXRlZCB3aXRoIHRoZSBIQVJUUyBvZiB0aGUgY2x1
c3Rlci4gU28gd2UgZG8gbm90IGhhdmUgYSBNVElNRVIKPiA+IHdpdGggbm8gYXNzb2NpYXRlZCBI
QVJUcyB0byB1c2UgYXMgb3VyIHJlZmVyZW5jZS4KPiA+Cj4gPiBUbyBiZSBhYmxlIHRvIHNlbGVj
dCBhIHJlZmVyZW5jZSBNVElNRVIgaW4gdGhhdCBjYXNlLCBhZGQgYSBxdWlyayB0byBsb29rCj4g
PiB1cCBhbiBvcHRpb25hbCBkZXZpY2UgdHJlZSBwcm9wZXJ0eSB0aGF0IGluZGljYXRlIHdoaWNo
IE1USU1FUiB0byB1c2UuCj4gPiBGb3IgdGhlIE1JUFMgUDg3MDAsIHRoZSBwcm9wZXJ0eSBpcyAi
bWlwcyxyZWZlcmVuY2UtbXRpbWVyIi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCZW5vw650IE1v
bmluIDxiZW5vaXQubW9uaW5AYm9vdGxpbi5jb20+Cj4gPiAtLS0KPiA+ICBsaWIvdXRpbHMvdGlt
ZXIvZmR0X3RpbWVyX210aW1lci5jIHwgMjUgKysrKysrKysrKysrKysrKysrKy0tLS0tLQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9saWIvdXRpbHMvdGltZXIvZmR0X3RpbWVyX210aW1lci5jIGIvbGliL3V0
aWxzL3RpbWVyL2ZkdF90aW1lcl9tdGltZXIuYwo+ID4gaW5kZXggZTFmZDA1MS4uZTk4Yzk5ZiAx
MDA2NDQKPiA+IC0tLSBhL2xpYi91dGlscy90aW1lci9mZHRfdGltZXJfbXRpbWVyLmMKPiA+ICsr
KyBiL2xpYi91dGlscy90aW1lci9mZHRfdGltZXJfbXRpbWVyLmMKPiA+IEBAIC0yMCw2ICsyMCw3
IEBAIHN0cnVjdCB0aW1lcl9tdGltZXJfcXVpcmtzIHsKPiA+ICAgICAgICAgdW5zaWduZWQgaW50
ICAgIGNsaW50X210aW1lX29mZnNldDsKPiA+ICAgICAgICAgYm9vbCAgICAgICAgICAgIGNsaW50
X3dpdGhvdXRfbXRpbWU7Cj4gPiAgICAgICAgIGJvb2wgICAgICAgICAgICBoYXNfNjRiaXRfbW1p
bzsKPiA+ICsgICAgICAgY29uc3QgY2hhciAgICAgICpkdF9yZWZfcHJvcDsKPiA+ICB9Owo+ID4K
PiA+ICBzdHJ1Y3QgdGltZXJfbXRpbWVyX25vZGUgewo+ID4gQEAgLTM5LDYgKzQwLDcgQEAgc3Rh
dGljIGludCB0aW1lcl9tdGltZXJfY29sZF9pbml0KGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGVv
ZmYsCj4gPiAgICAgICAgIHN0cnVjdCBhY2xpbnRfbXRpbWVyX2RhdGEgKm10Owo+ID4gICAgICAg
ICBjb25zdCBzdHJ1Y3QgdGltZXJfbXRpbWVyX3F1aXJrcyAqcXVpcmtzID0gbWF0Y2gtPmRhdGE7
Cj4gPiAgICAgICAgIGJvb2wgaXNfY2xpbnQgPSBxdWlya3MgJiYgcXVpcmtzLT5pc19jbGludDsK
PiA+ICsgICAgICAgYm9vbCBpc19yZWYgPSBmYWxzZTsKPiA+Cj4gPiAgICAgICAgIG10biA9IHNi
aV96YWxsb2Moc2l6ZW9mKCptdG4pKTsKPiA+ICAgICAgICAgaWYgKCFtdG4pCj4gPiBAQCAtMTEw
LDEzICsxMTIsMTggQEAgc3RhdGljIGludCB0aW1lcl9tdGltZXJfY29sZF9pbml0KGNvbnN0IHZv
aWQgKmZkdCwgaW50IG5vZGVvZmYsCj4gPiAgICAgICAgIH0KPiA+Cj4gPiAgICAgICAgIC8qCj4g
PiAtICAgICAgICAqIFNlbGVjdCBmaXJzdCBNVElNRVIgZGV2aWNlIHdpdGggbm8gYXNzb2NpYXRl
ZCBIQVJUcyBhcyBvdXIKPiA+IC0gICAgICAgICogcmVmZXJlbmNlIE1USU1FUiBkZXZpY2UuIFRo
aXMgaXMgb25seSBhIHRlbXBvcmFyeSBzdHJhdGVneQo+ID4gLSAgICAgICAgKiBvZiBzZWxlY3Rp
bmcgcmVmZXJlbmNlIE1USU1FUiBkZXZpY2UuIEluIGZ1dHVyZSwgd2UgbWlnaHQKPiA+IC0gICAg
ICAgICogZGVmaW5lIGFuIG9wdGlvbmFsIERUIHByb3BlcnR5IG9yIHNvbWUgb3RoZXIgbWVjaGFu
aXNtIHRvCj4gPiAtICAgICAgICAqIGhlbHAgdXMgc2VsZWN0IHRoZSByZWZlcmVuY2UgTVRJTUVS
IGRldmljZS4KPiA+ICsgICAgICAgICogSWYgd2UgaGF2ZSBhIERUIHByb3BlcnR5IHRvIGluZGlj
YXRlIHdoaWNoIE1USU1FUiBpcyB0aGUgcmVmZXJlbmNlLAo+ID4gKyAgICAgICAgKiBzZWxlY3Qg
dGhlIGZpcnN0IE1USU1FUiBkZXZpY2UgdGhhdCBoYXMgaXQuIE90aGVyd2lzZSwgc2VsZWN0IHRo
ZQo+ID4gKyAgICAgICAgKiBmaXJzdCBNVElNRVIgZGV2aWNlIHdpdGggbm8gYXNzb2NpYXRlZCBI
QVJUcyBhcyBvdXIgcmVmZXJlbmNlLgo+ID4gICAgICAgICAgKi8KPiA+IC0gICAgICAgaWYgKCFt
dC0+aGFydF9jb3VudCAmJiAhbXRfcmVmZXJlbmNlKSB7Cj4gPiArICAgICAgIGlmIChxdWlya3Mg
JiYgcXVpcmtzLT5kdF9yZWZfcHJvcCkgewo+ID4gKyAgICAgICAgICAgICAgIGlmIChmZHRfZ2V0
cHJvcChmZHQsIG5vZGVvZmYsIHF1aXJrcy0+ZHRfcmVmX3Byb3AsIE5VTEwpKQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgaXNfcmVmID0gdHJ1ZTsKPiA+ICsgICAgICAgfSBlbHNlIGlmICgh
bXQtPmhhcnRfY291bnQpIHsKPiA+ICsgICAgICAgICAgICAgICBpc19yZWYgPSB0cnVlOwo+ID4g
KyAgICAgICB9Cj4gPiArCj4gPiArICAgICAgIGlmIChpc19yZWYgJiYgIW10X3JlZmVyZW5jZSkg
ewo+ID4gICAgICAgICAgICAgICAgIG10X3JlZmVyZW5jZSA9IG10Owo+ID4gICAgICAgICAgICAg
ICAgIC8qCj4gPiAgICAgICAgICAgICAgICAgICogU2V0IHJlZmVyZW5jZSBmb3IgYWxyZWFkeSBw
cm9wYmVkIE1USU1FUiBkZXZpY2VzCj4gPiBAQCAtMTUyLDYgKzE1OSwxMCBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IHRpbWVyX210aW1lcl9xdWlya3MgdGhlYWRfYWNsaW50X3F1aXJrcyA9IHsKPiA+
ICAgICAgICAgLmhhc182NGJpdF9tbWlvICAgICAgICAgPSBmYWxzZSwKPiA+ICB9Owo+ID4KPiA+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IHRpbWVyX210aW1lcl9xdWlya3MgbWlwc19hY2xpbnRfcXVp
cmtzID0gewo+ID4gKyAgICAgICAuZHRfcmVmX3Byb3AgICAgICAgICAgICA9ICJtaXBzLHJlZmVy
ZW5jZS1tdGltZXIiLAo+ID4gK307Cj4gPiArCj4gCj4gSSB0aGluayB0aGlzIERUIHByb3BlcnR5
IGNhbiBiZSB1c2VmdWwgdG8gb3RoZXIgcGxhdGZvcm1zIGFzIHdlbGwuCj4gSG93IGFib3V0ICJy
aXNjdixyZWZlcmVuY2UtbXRpbWVyIiBhcyBhIERUIHByb3BlcnR5ID8gVGhpcyB3YXkKPiB5b3Ug
ZG9uJ3QgbmVlZCB0byBtYWtlIGl0IGFzIE1JUFMgcXVpcmsuCj4gCkFDTElOVCBpcyBub3QgYSBy
YXRpZmllZCBzcGVjaWZpY2F0aW9uLCBpcyBpdCBva2F5IHRvIHVzZSB0aGUgInJpc2N2LCIKcHJl
Zml4PyBUaGF0J3MgdGhlIHJlYXNvbiBJIHdlbnQgd2l0aCBhIHZlbmRvciBwcmVmaXguCgpbLi4u
XQoKQmVzdCByZWdhcmRzLAotLSAKQmVub8OudCBNb25pbiwgQm9vdGxpbgpFbWJlZGRlZCBMaW51
eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCgoKCi0tIApvcGVu
c2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
