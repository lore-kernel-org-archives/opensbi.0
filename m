Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A8BCAC5A7
	for <opensbi@archiver.kernel.org>; Mon, 22 Sep 2025 06:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=040oPbaVUHIcYK8/Cg5fSh+S3B+bYxSS312I79hvmUw=; b=iD0OnXs/AfsRgI
	9Qmyjkhf1XrS0ue1D881lxAI2B1for7DZReKQoItf/PhR6B88lwOeWUG/DtQbOi0rIoOz4+LAG5xT
	bp0c6DqmBQfJ9x//wozvSdDttHxxQl3a9+QrGfubTm247kURr4At2l3yKH6o8EMyNlCfBXrhS6KzZ
	HswgSdD8PsXU4JHLeIUE98/FpZ9zwY4f5ssfoQ0vSg9lCsCSeiS1pTNlZ1t1vj2921JET1f6+ci4x
	z8NEvF+n00NsABWCZBgDNQSqkBActz+7yrfGY15mUXRuYu6JCStRDZ5rn4cLTSAagXqrEGLDrt1dJ
	708LxRrQ+liIBtvjKraQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0a28-00000008yVB-1roT;
	Mon, 22 Sep 2025 06:28:20 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0a24-00000008yUP-24aZ
	for opensbi@lists.infradead.org;
	Mon, 22 Sep 2025 06:28:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758522468;
	bh=fPbzDcW7sw+UkJ/d7llc6TbxPvJfjEs1jpjxpM50r5g=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=dDBjPgRsuk+hG7BdsStVNiov1zOEBnYQXlQZ4aVy1fDPgu0qsb2AcflDAFwkTQoVy
	 HcqD+6mdMOLwcoRq3D+v/3km1ae3T8mkyUiH1+1iwxE/iD3YhyEvhudFgLdqHZpnYn
	 OTUhMRIceBBLdbBtLyzGg8LL18XPD1HXcrcJ9EWs=
X-QQ-mid: zesmtpgz7t1758522463tc35e5748
X-QQ-Originating-IP: 61no6R0hwGjuaAwiycbexlXFU18bjvZaVeIiQ70a8ag=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 22 Sep 2025 14:27:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9886330703530323386
EX-QQ-RecipientCnt: 4
Date: Mon, 22 Sep 2025 14:27:42 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Anup Patel <anup@brainfault.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: opensbi@lists.infradead.org,
	Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
Subject: Re: [PATCH v2] platform: generic: spacemit: add K1
Message-ID: <84B498E97DCDF5D1+aNDsXkDCXMlENDMt@LT-Guozexi>
References: <20250922-smt-k1-8-cores-v2-1-dceae56f36d9@linux.spacemit.com>
 <CAAhSdy2x2w0+92W1+L5FPYVpcTypakMjop7YLCADvZyrWKoe4g@mail.gmail.com>
 <869418C0C5B4E860+aNDhto1P8_DVRowH@LT-Guozexi>
 <CAAhSdy1hdEyhV+paEOx3Y8SYVgpsV0MGCSEBQrVH57=sdV8YBg@mail.gmail.com>
 <10FA4FAF4385199D+aNDoKROfVoYsolIw@LT-Guozexi>
 <CAAhSdy2E+ZCrJUmB_Tm1qBC6gY6JOgwQKOXpVbcHOiZe9zJUHg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy2E+ZCrJUmB_Tm1qBC6gY6JOgwQKOXpVbcHOiZe9zJUHg@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NPA/2U4T9X6wxcc3/ENamiXOwqXYrElrseNEqeptAjAzQLRMfBSU5aIB
	qTvWTbgS5mGgl3SSBn8u0+7zjFHNF3xUDzW++Vtvh/RXL4TYhzbKNGhhyGd5eHJDItzJbKP
	Ly9jzSUPu/kCyDsm2OsUEoYvMEGySXS/KG5/khjtGrB2N9FkVD+M0mibV4e3FXyCUQ6dqFO
	08l14j3VAWYw/MSJaaCatwQnQ3EC15XkhRtwTeLPCloTRvo4r5GSzZv0wvwA9u0Mi+2ySBv
	tZsJITC51Wvb3/Spqokgnu1cQAaTAwEVWsYmxRMXj378+0He7wBkc+8FE32P4e/4toQCml/
	eTnbrwlM0toUsQDuqlDl1kR4nPwbU6OiaFYgilHxHQ43KzpGcMQgRBpLLTWXPCLa1VwPVNu
	vOIQnM1SG8yb2z5lm34+tA6TyFM0UAzaKvMhwewIXnq+UUQKbhNDA0P4pUIMtMWryySxUjp
	+Wtqkvm8BVpbaNHumkXS/tRMdKaYB8UgX2mSE4jXMIytc7cw9JKjEKyzNmqmXXoBWrF12Cv
	Oq+63LbS7qa2L1kMFbpl1gzdrA1zoOIDgIVa4fD3ODGbEdh0Oqk+0z0yLc976NOsQlEgpSU
	vWmcxzhx1TSwpsS2hcGHXtd/ClpDSThzM4BiagQ0+FLk8AYpBEWrn2LBiQLgGojNoJsaByx
	lBZctbf3bnpxHPbYVXraxAZIJTvoUZOSc5dAi+jkKCaa6PN5dhMqQsBrK0i0tXxRBKX3Y7R
	Tw7VedujToJneAsQD187u4e4sD8/S3WTwARULv//vKy+OmNxkhYRmOmbuhqW2Gj9K/0msIz
	EiIDHVv+JUfJMiM29RB1Gb9fj20PK53maazcKASLGSXZv9Esl8MSpPBvTYyvWj6yrle5GPI
	HkU6zk3WeL0xQoqBbeplH7M70VX/e1ssrMT7955Tz7XL3GT596tacpYM5wVuJ0Ty0Nfl0Vk
	UIpfAlYy6pkjVV3njEyv4d1PVKNb+5/NoK5dY2R/mV5yNt8qXqoaX3l1GQRCvU3mugW4cpt
	XuSuU9EvC7/Ix5ct5q3ztmMe2ad15N0qCHzM8IlCjIlYoqb4MfOtyXywh82xcQ4kKRTl5hl
	p4gz/aB5mrCprvSlwfAsvcGgdh+y3jbqA==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_232817_417562_55F1B8C9 
X-CRM114-Status: GOOD (  27.56  )
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

T24gTW9uLCBTZXAgMjIsIDIwMjUgYXQgMTE6NDk6MzhBTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBNb24sIFNlcCAyMiwgMjAyNSBhdCAxMTozOeKAr0FNIFRyb3kgTWl0Y2hlbGwKPiA8
dHJveS5taXRjaGVsbEBsaW51eC5zcGFjZW1pdC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwg
U2VwIDIyLCAyMDI1IGF0IDExOjMxOjM1QU0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiA+
IE9uIE1vbiwgU2VwIDIyLCAyMDI1IGF0IDExOjEy4oCvQU0gVHJveSBNaXRjaGVsbAo+ID4gPiA8
dHJveS5taXRjaGVsbEBsaW51eC5zcGFjZW1pdC5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4g
T24gTW9uLCBTZXAgMjIsIDIwMjUgYXQgMDg6NTU6MjVBTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiA+ID4gPiA+IE9uIE1vbiwgU2VwIDIyLCAyMDI1IGF0IDY6NDbigK9BTSBUcm95IE1pdGNo
ZWxsCj4gPiA+ID4gPiA8dHJveS5taXRjaGVsbEBsaW51eC5zcGFjZW1pdC5jb20+IHdyb3RlOgo+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBGcm9tOiBYaWFuYmluIFpodSA8eGlhbmJpbi56aHVAbGlu
dXguc3BhY2VtaXQuY29tPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBFeHRlbmQgZ2VuZXJpYyBw
bGF0Zm9ybSB0byBzdXBwb3J0IFNwYWNlbWlUIEsxLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBP
biBLMSwgdGhlIEJST00gb25seSBicmluZ3MgdXAgdGhlIHByaW1hcnkgY29yZSBhbmQgbGVhdmVz
IHRoZQo+ID4gPiA+ID4gPiBvdGhlciBjb3JlcyBpbiBhIGRpc2FibGVkIHN0YXRlLiBUaGlzIHBy
ZXZlbnRzIExpbnV4IGZyb20gYm9vdGluZwo+ID4gPiA+ID4gPiBTTVAgYW5kIG9ubHkgb25lIGNv
cmUgaXMgYXZhaWxhYmxlLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBBZGQgY29kZSB0byBicmlu
ZyB1cCBhbGwgOCBjb3JlcyBkdXJpbmcgT3BlblNCSSBpbml0aWFsaXphdGlvbiBzbwo+ID4gPiA+
ID4gPiB0aGF0IHRoZSBMaW51eCBrZXJuZWwgY2FuIGRldGVjdCBhbmQgdXNlIGFsbCBjb3JlcyBw
cm9wZXJseS4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gQ28tYXV0aG9yZWQtYnk6IFRyb3kgTWl0
Y2hlbGwgPHRyb3kubWl0Y2hlbGxAbGludXguc3BhY2VtaXQuY29tPgo+ID4gPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBUcm95IE1pdGNoZWxsIDx0cm95Lm1pdGNoZWxsQGxpbnV4LnNwYWNlbWl0LmNv
bT4KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWGlhbmJpbiBaaHUgPHhpYW5iaW4uemh1QGxp
bnV4LnNwYWNlbWl0LmNvbT4KPiA+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiA+IENoYW5nZXMgaW4g
djI6Cj4gPiA+ID4gPiA+IC0gcmVtb3ZlIF9fc2JpX2hzbV9oYXJ0X2dldF9zdGF0ZSgpIGluIHNw
YWNlbWl0X2NvbGRfYm9vdF9hbGxvd2VkKCkKPiA+ID4gPiA+ID4gLSBwbHVzIFBNVV9BUF9CQVNF
IGluIFBNVV9BUF9DT1JFKDB8NClfKFdBS0VVUHxJRExFKV9PRkZTRVQKPiA+ID4gPiA+ID4gLSBM
aW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwOTE2LXNtdC1rMS04LWNv
cmVzLXYxLTEtNWI3NmUwNmQxMmRhQGxpbnV4LnNwYWNlbWl0LmNvbQo+ID4gPiA+ID4KPiA+ID4g
PiA+IEl0IGlzIGJldHRlciB0byBoYXZlIGEgc2VwYXJhdGUgZmR0X2hzbV9zcGFjZW1pdCBkcml2
ZXIgdW5kZXIKPiA+ID4gPiA+IGxpYi91dGlscy9oc20gZGlyZWN0b3J5Lgo+ID4gPiA+IFdlIGFy
ZSBub3QgZ29pbmcgdG8gc3VwcG9ydCB0aGlzIGZlYXR1cmUuCj4gPiA+ID4gVGhhbmtzIGZvciB5
b3VyIHN1Z2dlc3Rpb24uCj4gPiA+ID4KPiA+ID4KPiA+ID4gSSBkb24ndCB1bmRlcnN0YW5kLgo+
ID4gPiBUaGlzIHBhdGggYWxyZWFkeSByZWdpc3RlcnMgc2JpX2hzbV9kZXZpY2Ugc28gYWxsCj4g
PiA+IEkgYW0gYXNraW5nIGlzIHRvIGNyZWF0ZSBhIHByb3BlciBIU00gZHJpdmVyIHVuZGVyCj4g
PiA+IGxpYi91dGlscy9oc20gZGlyZWN0b3J5Lgo+ID4gUGVyaGFwcyBJIG1pc3VuZGVyc3Rvb2Qg
c29tZXRoaW5nLiBXaGF0IEkgbWVhbnQgaXMgdGhhdAo+ID4gd2UgZG8gbm90IHBsYW4gdG8gc3Vw
cG9ydCBycG1pLgo+IAo+IFRoZSBsaWIvdXRpbHMvaHNtIGlzIG5vdCBvbmx5IGZvciBSUE1JIEhT
TSBkcml2ZXIuIFBsYXRmb3Jtcwo+IGNhbiBhZGQgdGhlaXIgSFNNIGRyaXZlciB1bmRlciB0aGlz
IGRpcmVjdG9yeSBhcyB3ZWxsLgo+IAo+ID4gQWxzbywgSSBub3RpY2VkIG90aGVyIHBsYXRmb3Jt
cyBhcmUgZGlyZWN0bHkgcmVnaXN0ZXJpbmcgdmlhCj4gPiBzYmlfaHNtX3NldF9kZXZpY2UoKSBp
biB0aGVpciBwbGF0Zm9ybSBjb2RlOgo+ID4KPiA+IGBgYAo+ID4gYWxsd2lubmVyL3N1bjIwaS1k
MS5jOjE5MDogICAgICBzYmlfaHNtX3NldF9kZXZpY2UoJnN1bjIwaV9kMV9wcHUpOwo+ID4gYW5k
ZXMvYWUzNTAuYzoxMDE6ICAgICAgICAgICAgICBzYmlfaHNtX3NldF9kZXZpY2UoJmFuZGVzX3Nt
dSk7Cj4gPiBtaXBzL3A4NzAwLmM6MjE5OiAgICAgICAgICAgICAgIHNiaV9oc21fc2V0X2Rldmlj
ZSgmbWlwc19oc20pOwo+ID4gYGBgCj4gCj4gRmV3IG9mIHRoZXNlIHBsYXRmb3JtcyB3ZXJlIGFk
ZGVkIGJlZm9yZSBhIGRlZGljYXRlZAo+IGxpYi91dGlscy9oc20gZGlyZWN0b3J5IHdhcyBjcmVh
dGVkIGZvciBIU00gZHJpdmVycy4KPiAKPiA+Cj4gPiBDb3VsZCB5b3UgcGxlYXNlIHByb3ZpZGUg
bWUgd2l0aCBtb3JlIGluZm9ybWF0aW9uPwo+IAo+IEdyYWR1YWxseSwgd2UgbmVlZCB0byBtb3Zl
IEhTTSBkcml2ZXJzIGZyb20gcGxhdGZvcm0vZ2VuZXJpYyB0bwo+IGxpYi91dGlscy9oc20gYXMg
aW5kZXBlbmRlbnQgSFNNIGRyaXZlcnMKPiAKPiBJIGhhdmUgYWxyZWFkeSBzdWdnZXN0ZWQgdGhp
cyBmb3IgU2lGaXZlIFRNQzAgYW5kIFNNQzAgZHJpdmVycwo+IGFzIHdlbGwuCj4gKFJlZmVyICJb
UEFUQ0ggdjYgMDAvMTFdIEFkZCBTaUZpdmUgVE1DMCBhbmQgU01DMCBkcml2ZXIiKQpUaGFua3Mg
Zm9yIHlvdXIgcGF0aWVuY2UgQW51cCEKSXQncyBjbGVhbiBub3cuIEknbGwgc2VwYXJhdGUgdGhp
cyBwYXRjaC4KCiAgICAgICAgICAgICAgICAgICAgLSBUcm95Cj4gCj4gUmVnYXJkcywKPiBBbnVw
Cj4gCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
