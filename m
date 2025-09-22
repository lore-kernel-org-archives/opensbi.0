Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD66CAC5A7
	for <opensbi@archiver.kernel.org>; Mon, 22 Sep 2025 06:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Cfv+y7uGU8iCUO66W0Ln/f9/ad7ZvJpKinfmTY1/JU=; b=HCLkDeTCduuNPb
	3SevO6a8p8St/5+n6tDoj3NF5WlKNC/qaZwUsg7tkH1zJb83ducxGfYtih8yd0S6MK/UebnKU8Z87
	PHroPQfhICLAHaZaeXGNnKNHdsLxZMI7nsjSc67oAXq+DdqYSWzCkOGJ/5loMMpzmQHd/rjQUM62t
	e+6MhQCajCs4NDeG6PELenYSsa87LUEYzL6gdfyLOsJ0iO7wn0yxmPaL5B/x6x+0/XgXM3zvxv5O1
	zAZH1/AwNSPJASx2MRtYZ/qxjetUa6TwhRjYqtmOcyS9aVai7QPRYd+irpsGqog0uemfbt6BFJv42
	M9BcVEVp9ZbjyEctK6vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Zkp-00000008vPI-18mW;
	Mon, 22 Sep 2025 06:10:27 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Zkm-00000008vOC-0eFG
	for opensbi@lists.infradead.org;
	Mon, 22 Sep 2025 06:10:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758521392;
	bh=MMxJvKNpQvGN3Tb434bOjQWpSjuDkEef6jsXWw5x7o0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=SZJHqhVOe6OMnnfDxsIilUz7NZODynG2ySgBUwh/RQ5O8uAmwXJtl/p4+ZpLgH36q
	 I+R9idFavWoY+vsG4Iq2voZtfwEacwlwicQfhi6SCP59l+6Smg9eRbeQspI2qJpU9b
	 h61ytXw97JotixhhLI8/v3f1j4ZFxP8KBZY0Ew6c=
X-QQ-mid: esmtpgz12t1758521386ta6baff07
X-QQ-Originating-IP: fMR2sv0JVDcV8eFmYG8ZcVDPlIDoAyKIaRq5zFeGFoE=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 22 Sep 2025 14:09:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11643118317340530721
EX-QQ-RecipientCnt: 4
Date: Mon, 22 Sep 2025 14:09:45 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Anup Patel <anup@brainfault.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: opensbi@lists.infradead.org,
	Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
Subject: Re: [PATCH v2] platform: generic: spacemit: add K1
Message-ID: <10FA4FAF4385199D+aNDoKROfVoYsolIw@LT-Guozexi>
References: <20250922-smt-k1-8-cores-v2-1-dceae56f36d9@linux.spacemit.com>
 <CAAhSdy2x2w0+92W1+L5FPYVpcTypakMjop7YLCADvZyrWKoe4g@mail.gmail.com>
 <869418C0C5B4E860+aNDhto1P8_DVRowH@LT-Guozexi>
 <CAAhSdy1hdEyhV+paEOx3Y8SYVgpsV0MGCSEBQrVH57=sdV8YBg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy1hdEyhV+paEOx3Y8SYVgpsV0MGCSEBQrVH57=sdV8YBg@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: M30zLW4InuR8J8sPtVAFFsJ0FIeKKXkfaItbQwRCl5rWz1g+exS5mPkA
	px6gauPDuJitbA+Lf9FIBmeqBt90lfmCz0C6F0sRpPXKBfNycYD5g0AQ4GSTvvio0oPWVHD
	R993ki99nMt6O4LiFMdlZleZOPTlXnnxtlqBdr5ulj5U8p/f/SBsDX4RqEOSSVVmaisMBHz
	T1W9EreP+QcwoyGxCpon8469Y9CYD9T3IaBLAkv6XBLyDkNZHCiKC6A76zaZqY3hQapyVxe
	o5hcyiSJYac/C+4NUIAq+9wpFEXwGYd3plClCN09fmwqpK9R/nc39GN9zR86WQiBD2Q3y/N
	s/otn9sK5u959Om5HKk5+SagPzFaNHVTYAAhL9gc2b6aJUYWCbXZ5nYz58tJiYWJP/bkzzN
	TQR55+KJzsbV0bpkOyDrWpxqJBzmeYrrc/1OqGLpJSx1wssIlVznoFns4Mafj6rQcXyi/Mz
	SWVknoUchvzxTpKDfVbRcYbS84ssrWYApDAua1hfLlt1J4xcX8tF6NUWn3yFYqY23+9MdzN
	VbAVSVk8Ek4JxPOTyBb8x/Z+045M2vdF7TK4qe2ASd3tnUC2zvt14wswuXbVxV+C5IQY5v+
	EXT++7DZA6DsJgogsryyAw3v0WUKwGXkxPPqRhKCQ45MPtk2hEgnj+nxyXUdzUezsLnYgPZ
	NtWhufZsdS1mTVe5zkCJYs01fBACJBvT/FGvwV4aTDFZxCp9yZFiOYdCr85YSaMOOkoQ0i3
	+T5LGqeHMdBCy/cHKlsSycVYLtSbDv4skeKprws5GT+q1ebgQxQX83J7v2KqnAwgJYYQstg
	iAhjUE4Xaz3likAgWJeqYFZRtT5u6tX1M2gNiyQYEvJRpb5WwmRCC+kRf8MuE5qs7mcp+PK
	VoK+v07rNXLdaBeDWspmivVRJe9iVy88VfMheLSIgHEdDvNxncIMr6r7oUIFofSiKhokqH9
	lP2uLkb999tYvPItS8ACr+ZzLli1wxdBf/GTsWnHQ4WYXzoi09RFiOZ+iJx5CqIFG5Et2zZ
	nWot/2cww+N7o6IxCjM2NwEtkin/ZBPchV1CBwIaxCnSl4siBFCLZqRNTBFcKUAiX8/PNcK
	iEVbcUovkkBPw3i4a4aEfUUoaZOMTI0pw==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_231024_923323_A18BE7C6 
X-CRM114-Status: GOOD (  21.23  )
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

T24gTW9uLCBTZXAgMjIsIDIwMjUgYXQgMTE6MzE6MzVBTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBNb24sIFNlcCAyMiwgMjAyNSBhdCAxMToxMuKAr0FNIFRyb3kgTWl0Y2hlbGwKPiA8
dHJveS5taXRjaGVsbEBsaW51eC5zcGFjZW1pdC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwg
U2VwIDIyLCAyMDI1IGF0IDA4OjU1OjI1QU0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiA+
IE9uIE1vbiwgU2VwIDIyLCAyMDI1IGF0IDY6NDbigK9BTSBUcm95IE1pdGNoZWxsCj4gPiA+IDx0
cm95Lm1pdGNoZWxsQGxpbnV4LnNwYWNlbWl0LmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBG
cm9tOiBYaWFuYmluIFpodSA8eGlhbmJpbi56aHVAbGludXguc3BhY2VtaXQuY29tPgo+ID4gPiA+
Cj4gPiA+ID4gRXh0ZW5kIGdlbmVyaWMgcGxhdGZvcm0gdG8gc3VwcG9ydCBTcGFjZW1pVCBLMS4K
PiA+ID4gPgo+ID4gPiA+IE9uIEsxLCB0aGUgQlJPTSBvbmx5IGJyaW5ncyB1cCB0aGUgcHJpbWFy
eSBjb3JlIGFuZCBsZWF2ZXMgdGhlCj4gPiA+ID4gb3RoZXIgY29yZXMgaW4gYSBkaXNhYmxlZCBz
dGF0ZS4gVGhpcyBwcmV2ZW50cyBMaW51eCBmcm9tIGJvb3RpbmcKPiA+ID4gPiBTTVAgYW5kIG9u
bHkgb25lIGNvcmUgaXMgYXZhaWxhYmxlLgo+ID4gPiA+Cj4gPiA+ID4gQWRkIGNvZGUgdG8gYnJp
bmcgdXAgYWxsIDggY29yZXMgZHVyaW5nIE9wZW5TQkkgaW5pdGlhbGl6YXRpb24gc28KPiA+ID4g
PiB0aGF0IHRoZSBMaW51eCBrZXJuZWwgY2FuIGRldGVjdCBhbmQgdXNlIGFsbCBjb3JlcyBwcm9w
ZXJseS4KPiA+ID4gPgo+ID4gPiA+IENvLWF1dGhvcmVkLWJ5OiBUcm95IE1pdGNoZWxsIDx0cm95
Lm1pdGNoZWxsQGxpbnV4LnNwYWNlbWl0LmNvbT4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBUcm95
IE1pdGNoZWxsIDx0cm95Lm1pdGNoZWxsQGxpbnV4LnNwYWNlbWl0LmNvbT4KPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBYaWFuYmluIFpodSA8eGlhbmJpbi56aHVAbGludXguc3BhY2VtaXQuY29tPgo+
ID4gPiA+IC0tLQo+ID4gPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiA+ID4gLSByZW1vdmUgX19zYmlf
aHNtX2hhcnRfZ2V0X3N0YXRlKCkgaW4gc3BhY2VtaXRfY29sZF9ib290X2FsbG93ZWQoKQo+ID4g
PiA+IC0gcGx1cyBQTVVfQVBfQkFTRSBpbiBQTVVfQVBfQ09SRSgwfDQpXyhXQUtFVVB8SURMRSlf
T0ZGU0VUCj4gPiA+ID4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIw
MjUwOTE2LXNtdC1rMS04LWNvcmVzLXYxLTEtNWI3NmUwNmQxMmRhQGxpbnV4LnNwYWNlbWl0LmNv
bQo+ID4gPgo+ID4gPiBJdCBpcyBiZXR0ZXIgdG8gaGF2ZSBhIHNlcGFyYXRlIGZkdF9oc21fc3Bh
Y2VtaXQgZHJpdmVyIHVuZGVyCj4gPiA+IGxpYi91dGlscy9oc20gZGlyZWN0b3J5Lgo+ID4gV2Ug
YXJlIG5vdCBnb2luZyB0byBzdXBwb3J0IHRoaXMgZmVhdHVyZS4KPiA+IFRoYW5rcyBmb3IgeW91
ciBzdWdnZXN0aW9uLgo+ID4KPiAKPiBJIGRvbid0IHVuZGVyc3RhbmQuCj4gVGhpcyBwYXRoIGFs
cmVhZHkgcmVnaXN0ZXJzIHNiaV9oc21fZGV2aWNlIHNvIGFsbAo+IEkgYW0gYXNraW5nIGlzIHRv
IGNyZWF0ZSBhIHByb3BlciBIU00gZHJpdmVyIHVuZGVyCj4gbGliL3V0aWxzL2hzbSBkaXJlY3Rv
cnkuClBlcmhhcHMgSSBtaXN1bmRlcnN0b29kIHNvbWV0aGluZy4gV2hhdCBJIG1lYW50IGlzIHRo
YXQKd2UgZG8gbm90IHBsYW4gdG8gc3VwcG9ydCBycG1pLgpBbHNvLCBJIG5vdGljZWQgb3RoZXIg
cGxhdGZvcm1zIGFyZSBkaXJlY3RseSByZWdpc3RlcmluZyB2aWEKc2JpX2hzbV9zZXRfZGV2aWNl
KCkgaW4gdGhlaXIgcGxhdGZvcm0gY29kZToKCmBgYAphbGx3aW5uZXIvc3VuMjBpLWQxLmM6MTkw
OiAgICAgIHNiaV9oc21fc2V0X2RldmljZSgmc3VuMjBpX2QxX3BwdSk7CmFuZGVzL2FlMzUwLmM6
MTAxOiAgICAgICAgICAgICAgc2JpX2hzbV9zZXRfZGV2aWNlKCZhbmRlc19zbXUpOwptaXBzL3A4
NzAwLmM6MjE5OiAgICAgICAgICAgICAgIHNiaV9oc21fc2V0X2RldmljZSgmbWlwc19oc20pOwpg
YGAKCkNvdWxkIHlvdSBwbGVhc2UgcHJvdmlkZSBtZSB3aXRoIG1vcmUgaW5mb3JtYXRpb24/Cgog
ICAgICAgICAgICAgICAgIC0gVHJveQo+IAo+IFJlZ2FyZHMsCj4gQW51cAo+IAoKLS0gCm9wZW5z
YmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
