Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB33C54F54
	for <opensbi@archiver.kernel.org>; Fri, 31 Jul 2026 09:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V3rcEZOsBnY1cotmo8fU4NlWPROqz5XcvGK/3NhzGmI=; b=lNYbamx9ZS8MNa
	rQC2j7fRZrcWv3/8hFQ3jCkeHZvQIWtiaV1Zbt8QmepvCQvJpUTUgRPUH7QRWZ+Blcf02Ic5IVvGB
	WvD+1pnXSos2jZV4dhPICMAN8zw9g0OkEctGaKbmAq3pHf7BTyOGnXpFvhFaLFI6SUvj3s8kV1SSx
	KMTO2W8Pp3EiBR3EyUM0IA7wOpyuI8opFsJuYKrlbCzUhUeJQKFLSN5L40efrWK0gHdSiRI/SPPpw
	uiUS+JKSjPeyhYT5xCBmmuUEC6vxhjFEhk/9eLiN8+SkdDKcJV6iAC6OM6gx4AnnyTvPbgqXejDBX
	v44u7uclrLrx4IYb6E9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjFe-0000000C8hx-08LN;
	Fri, 31 Jul 2026 09:09:58 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjFa-0000000C8hH-15eG
	for opensbi@lists.infradead.org;
	Fri, 31 Jul 2026 09:09:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1CF701A1341;
	Fri, 31 Jul 2026 09:09:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E61456039A;
	Fri, 31 Jul 2026 09:09:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B0E6D11C165C8;
	Fri, 31 Jul 2026 11:09:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785488986; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TEImebFhQ3jSeB3FuSq/ncoFCiWyjk+MG1zV+viIUww=;
	b=RK9ziIwln5IMU8xaMT7IDga9xL0SRHbn4BS0uCEzuM3lRMnqj+mex2KVmUPArtxKiPQFwt
	U4e2Tqk3hn1GKgx/WXjMtogB3/CnTp4g4cO1r76HhDyHgG9Hjd/JWlx4DprIYREIYCAdSM
	unImsDzIse3tVe2Vc0He7Cu9BEyb3T3O53hB/hQ5U83YIjQ1JWf5FC198A5CaOnHrQACEb
	eyvuNrmWTO4rosWa2fFqu4h9bGZiAcH0d6CsFaPOaZucM71EKsSy98AmkcOpgNfB5VA0BW
	6g0qa668QOv1mPo+NaWQDxzMGwaIE3RZJcWzJwDYV771yXFEq6Knsxaa0y2Ecg==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: opensbi@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Randolph Sheng-Kai =?UTF-8?B?TGluKOael+iBluWHsSk=?= <randolph@andestech.com>,
 Jun Chang <jun.chang@metanoia-comm.com>,
 =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>,
 Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v3 0/2] Introduce Metanoia MT2824 SoC support
Date: Fri, 31 Jul 2026 11:09:41 +0200
Message-ID: <qTMAiiu2THakFrsRkN2r_A@bootlin.com>
In-Reply-To: <20260724-mt5824-v3-0-9a7d17d69974@bootlin.com>
References: <20260724-mt5824-v3-0-9a7d17d69974@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_020954_446705_2F691D41 
X-CRM114-Status: GOOD (  13.44  )
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

T24gRnJpZGF5LCAyNCBKdWx5IDIwMjYgYXQgMTc6MzU6MDYgQ0VTVCwgQmVub8OudCBNb25pbiB3
cm90ZToKPiBUaGlzIHNlcmllcyBhZGQgc3VwcG9ydCBmb3IgdGhlIE1ldGFub2lhIE1UMjgyNCBT
b0MuIFRoZSBNVDI4MjQgaXMKPiBhIGhpZ2hseSBpbnRlZ3JhdGVkIDVHIFN5c3RlbS1vbi1DaGlw
IGFpbWVkIGF0IE/igJFSQU4gUmFkaW8gVW5pdHMKPiBhbmQgc21hbGwgY2VsbHMuIFRoaXMgU29D
IGlzIHVzZWQgaW4gY29uanVuY3Rpb24gd2l0aCB0d28gTVQzODEyIDVHCj4gdHJhbnNjZWl2ZXJz
IHRvIGZvcm0gdGhlIE1UNTgyNCByZWZlcmVuY2UgZGVzaWduWzFdLgo+IFRoZSBNVDI4MjQgZmVh
dHVyZXM6Cj4gKiBDUFU6IFR3byBBbmRlc0NvcmUgQVg0NU1QIFJJU0MtViA2NCBjb3Jlcwo+ICog
RFNQL1BIWTogRGVkaWNhdGVkIERTUCBjb3JlcyBhbmQgZGlnaXRhbCBmcm9udC1lbmQgZm9yIFBI
WSBwcm9jZXNzaW5nCj4gKiBNZW1vcnk6IExQRERSNCBzdXBwb3J0IHdpdGggaW5saW5lIEVDQwo+
ICogRXRoZXJuZXQ6IER1YWwgMTBHLzI1RyBTZXJEZXMKPiAqIFNQSTogT25lIFF1YWQtU1BJIGFu
ZCA4IFNQSSBjb250cm9sbGVycwo+ICogMyBJMkMgY29udHJvbGxlcnMKPiAqIFNEL01NQyBjb250
cm9sbGVyCj4gKiAzIFVBUlRzCj4gKiBIYXJkd2FyZSB3YXRjaGRvZwo+ICogMzIgR1BJT3MKPiAq
IFVTQiBob3N0IGNvbnRyb2xsZXIKPiAKPiBbMV06IGh0dHBzOi8vbWV0YW5vaWEtY29tbS5jb20v
cHJvZHVjdHMvNWcvbXQ1ODI0Lwo+IApbQWRkaW5nIEFudXAgaW4gQ0NdCgpTbWFsbCBwaW5nIG9u
IHRoaXMgc2VyaWVzOiBBbnkgcmV2aWV3cyBvciBjb21tZW50cyBhcmUgd2VsY29tZS4KCj4gU2ln
bmVkLW9mZi1ieTogQmVub8OudCBNb25pbiA8YmVub2l0Lm1vbmluQGJvb3RsaW4uY29tPgo+IC0t
LQo+IENoYW5nZXMgaW4gdjM6Cj4gLSBSZWJhc2VkIG9uIHYxLjkuCj4gLSBDaGFuZ2UgdGhlIHN5
c3RlbV9yZXNldCBkZXZpY2UgbmFtZSB0byAibWV0YW5vaWEtbXQyODI0LXJlYm9vdCIgdG8KPiAg
IG1hdGNoIHRoZSBEVCBjb21wYXRpYmxlICJtZXRhbm9pYSxtdDI4MjQtcmVib290IiBhbmQgYXZv
aWQgY29uZnVzaW9uCj4gICB3aXRoICJtZXRhbm9pYSxtdDI4MjQtcmVzZXQiLgo+IC0gTGluayB0
byB2MjogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYwNjI1LW10NTgyNC12Mi0wLTQ4YmQ0
MzhmYzJlNUBib290bGluLmNvbQo+IAo+IENoYW5nZXMgaW4gdjI6Cj4gLSBGaXggdGhlIFNvQyBu
YW1lIChNVDI4MjQpIGFuZCBjbGFyaWZ5IHRoZSByZWZlcmVuY2UgZGVzaWduIG5hbWUgKE1UNTgy
NCkKPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2MDYxOC1tdDU4
MjQtdjEtMC1jOTkyNjNjYzZkZjRAYm9vdGxpbi5jb20KPiAKPiAtLS0KPiBCZW5vw650IE1vbmlu
ICgyKToKPiAgICAgICBwbGF0Zm9ybTogZ2VuZXJpYzogQWRkIE1ldGFub2lhIE1UMjgyNCBpbml0
aWFsIHN1cHBvcnQKPiAgICAgICBsaWI6IHV0aWxzL3Jlc2V0OiBBZGQgTWV0YW5vaWEgTVQyODI0
IHN5c3RlbSByZXNldCBkcml2ZXIKPiAKPiAgZG9jcy9wbGF0Zm9ybS9nZW5lcmljLm1kICAgICAg
ICAgICAgICAgICAgICB8ICAgMiArCj4gIGRvY3MvcGxhdGZvcm0vbWV0YW5vaWEtbXQyODI0Lm1k
ICAgICAgICAgICAgfCAxNDcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBsaWIvdXRp
bHMvcmVzZXQvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgIHwgICA0ICsKPiAgbGliL3V0aWxz
L3Jlc2V0L2ZkdF9yZXNldF9tZXRhbm9pYS5jICAgICAgICB8ICA3MiArKysrKysrKysrKysrKwo+
ICBsaWIvdXRpbHMvcmVzZXQvb2JqZWN0cy5tayAgICAgICAgICAgICAgICAgIHwgICAzICsKPiAg
cGxhdGZvcm0vZ2VuZXJpYy9LY29uZmlnICAgICAgICAgICAgICAgICAgICB8ICAgNyArKwo+ICBw
bGF0Zm9ybS9nZW5lcmljL2NvbmZpZ3MvZGVmY29uZmlnICAgICAgICAgIHwgICAyICsKPiAgcGxh
dGZvcm0vZ2VuZXJpYy9tZXRhbm9pYS9tdDI4MjQvbXQyODI0LmMgICB8ICAzMSArKysrKysKPiAg
cGxhdGZvcm0vZ2VuZXJpYy9tZXRhbm9pYS9tdDI4MjQvb2JqZWN0cy5tayB8ICAxMCArKwo+ICA5
IGZpbGVzIGNoYW5nZWQsIDI3OCBpbnNlcnRpb25zKCspCj4gLS0tCj4gYmFzZS1jb21taXQ6IGNi
ZjlmNjczNGRkODVhOTgyYzYzZTNjYjVkYjdmZmUwOWRhODM5Y2EKPiBjaGFuZ2UtaWQ6IDIwMjYw
NTI1LW10NTgyNC01NzkwODE4ZmI3NWYKPiAKCkJlc3QgcmVnYXJkcywKLS0gCkJlbm/DrnQgTW9u
aW4sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczov
L2Jvb3RsaW4uY29tCgoKCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
b3BlbnNiaQo=
