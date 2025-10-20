Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CCFCCD199
	for <opensbi@archiver.kernel.org>; Mon, 20 Oct 2025 05:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gOYwANrBNqa+6/sVTYrgfJYhMw+1F8sgSK7YVMRyKj4=; b=dkwRNbXjycN0hn
	P9zWrVlArsEy/708Y19XQKQWb0VFkCvgRaPMjSh8FUl/WmI2HeFX28qARpbeXaSmCaKWhDrdfZEhu
	4B6d/9fcFemJh6iL6hY/cjaSasg7pjfMlaJoOqwLgBbkKfgmwEQKIG5QIyADYIi4jgn+653qKZ6nS
	sYoSK3lVIRm+HUqeslCOftdM54dlAa31tLJ4D4jECW4TsHqJrwD2pEpKb65zMHiLHy4tuokXhXxAM
	ZCWZjJXOamQWo0W6MVpTALg8H3GAU1zMvY6vdgJrmmoKAEpPRrqONijoDMdndShspcIuCkG/dbCzs
	6pIYPOXkd6mq94i9poKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAiSw-0000000BwG7-0Nym;
	Mon, 20 Oct 2025 05:29:54 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAiSq-0000000BwFg-3Ukr
	for opensbi@lists.infradead.org;
	Mon, 20 Oct 2025 05:29:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760938153;
	bh=2v+1BSHtVGvByxqiKK4y50WYZuF6GssIj6WXq594Di0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=O0k5VLlUYHEmSSOtWkcOihOaUxTQpaViYt+62VMjy47Yfhj6poABCiy84CP9a202S
	 W9PQcmafSck3zeN+uNQNDCEf03v6aQn+72BVcaX0SEvLO47wQYUrWOlqzo30/knR9x
	 3ot2Azcw0ppZQB9Kv7a4RnfUonmhkDwIxnHWPUDw=
X-QQ-mid: esmtpsz19t1760938150t356308b2
X-QQ-Originating-IP: Jb3FgZyggboeE6xmNjEKqZn9giwggmCU4e+a1JI6/Yo=
Received: from = ( [14.123.254.135])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 20 Oct 2025 13:29:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6239166896715856015
EX-QQ-RecipientCnt: 4
Date: Mon, 20 Oct 2025 13:29:08 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Anup Patel <anup@brainfault.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: opensbi@lists.infradead.org,
	Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
Subject: Re: [PATCH v3 1/3] platform: generic: spacemit: add K1
Message-ID: <0FD4CA9D9BBF41A2+aPXIpGmc7jIr3rZZ@kernel.org>
References: <20250925-smt-k1-8-cores-v3-0-0885a8a70f8e@linux.spacemit.com>
 <20250925-smt-k1-8-cores-v3-1-0885a8a70f8e@linux.spacemit.com>
 <CAAhSdy13YUVLb0SGrM3UZ5D-LfOQGJ-j8Jotx1mX3rRBYhBa2w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy13YUVLb0SGrM3UZ5D-LfOQGJ-j8Jotx1mX3rRBYhBa2w@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NJYnAvh5o174LRA4mMcbCV0Wct8+O6EWTyBVQtsLTDSuHH8YEUwexlLy
	JC8ewZ/K2aP4luROquOwvdGWjlYKQ5nlyNcnJ+riln8CCmorNs5IyS81pWSQZFIlP78AO1s
	XAodOwf4/1BswR+X2ZJgh6fdAUV/CvWuTbjpdokI3XIgLnELhV4ipmWjEeJQZaXoLZrJlb0
	2iZmhv4ZqqygLjwDKGspsLs9sHBlo5Tykif/SbtjgJl4Xw70XVxsO0Zlbvt3DQoDV5y9iZK
	zfJdpiREjS6qrM3WX/GluNWxJIWmnP6AuDnBa4s5Yqh/G8+yaOHLm/c6z/Phaae4SAl55rS
	1ZDWpf/FX/iUu90A0qBejw5uTi71LUS+odV+CPa7I7rjbt9oWQxyuUTGkIQSDLULz4GlTCU
	d1qXDJcw+T4gQw87t/aDjFhPt/VDp4hbeVxnfQbUcY5dagU/9lWCKNfB4SxrZW7DJDeWFkU
	v5hluQ/eo0ezUsSLY/Tp2/FG/DM8j7WOcikkCVUGI7IpEkVdrCcx+i0/ZeaVyJyxnX1EvaA
	IxP6r+uFq7vff8GXzTGzC4bS0iAB3A9awZ3ZIdWDg8rw0HKjZCEQqA2IafoyMzDKAb4+yX2
	zdxGn1MeObL1JrdmcOMYs/5azHSZMKD2Pm+eDO73uKmKa9fVbCArbVgSl6nsMedNDfl/VV9
	XNQK3EVGMvuyvtPNZpSNX8ooMpJvZF0Rdjl1sBGryfvlj873QfDEc21VnrJ9uoz+WWs+f3k
	m6ODhQhaQvIefycFn4juQE7Gns+zpHZZjWMg8tWulpZCa6b4bWF3W/3CbVdRugLr24685xq
	Ggq8v1VhDcb8OVWz3fBKp9FgpRTh1R+V2ayaJ2KkdTRqrCWPhLcWI6/dKmdl38T12Lgn2Cb
	oBkqs/j5e5PrvNdw+5Y3acuCRLQ90k4KgJta51ptNUkzXV+L5fAcL0yOMacOo4xweyXOgtA
	YOAEPACkfE0VpEDV6L5jEAeMZt36UA7SBacgAqkTVfHtrKBh0nWwN0Dc0Ub4/3XOmrK7+dz
	DQXc1ZHYCqDIxLs7UZLtHPUT3tqaLAvCwbqCF+MiJsLtXugHf2U+BJ17Ii/I830N918UTbN
	OTXsJ4V1AvK8mNki5fXQT4=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_222950_853564_BF1A0099 
X-CRM114-Status: GOOD (  19.70  )
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

T24gTW9uLCBPY3QgMjAsIDIwMjUgYXQgMTA6Mzk6MTBBTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBUaHUsIFNlcCAyNSwgMjAyNSBhdCAzOjE54oCvUE0gVHJveSBNaXRjaGVsbAo+IDx0
cm95Lm1pdGNoZWxsQGxpbnV4LnNwYWNlbWl0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gRnJvbTogWGlh
bmJpbiBaaHUgPHhpYW5iaW4uemh1QGxpbnV4LnNwYWNlbWl0LmNvbT4KPiA+Cj4gPiBBZGQgaW5p
dGlhbCBwbGF0Zm9ybSBzdXBwb3J0IGZvciB0aGUgU3BhY2VtaVQgSzEgU29DLCBpbmNsdWRpbmcK
PiA+IGVhcmx5L2ZpbmFsIGluaXQgaG9va3MsIGNvbGQgYm9vdCBoYW5kbGluZywgYW5kIENDSS01
NTAgc25vb3AvRFZNCj4gPiBlbmFibGVtZW50Lgo+ID4KPiA+IENvLWF1dGhvcmVkLWJ5OiBUcm95
IE1pdGNoZWxsIDx0cm95Lm1pdGNoZWxsQGxpbnV4LnNwYWNlbWl0LmNvbT4KPiA+IFNpZ25lZC1v
ZmYtYnk6IFRyb3kgTWl0Y2hlbGwgPHRyb3kubWl0Y2hlbGxAbGludXguc3BhY2VtaXQuY29tPgo+
ID4gU2lnbmVkLW9mZi1ieTogWGlhbmJpbiBaaHUgPHhpYW5iaW4uemh1QGxpbnV4LnNwYWNlbWl0
LmNvbT4KPiA+IC0tLQo+ID4gIHBsYXRmb3JtL2dlbmVyaWMvS2NvbmZpZyAgICAgICAgICAgICAg
IHwgICA0ICsrCj4gPiAgcGxhdGZvcm0vZ2VuZXJpYy9pbmNsdWRlL3NwYWNlbWl0L2sxLmggfCAg
OTggKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgcGxhdGZvcm0vZ2VuZXJpYy9zcGFj
ZW1pdC9rMS5jICAgICAgICAgfCAxMTkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Cj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAyMjEgaW5zZXJ0aW9ucygrKQo+ID4KWy4uLl0KPiA+ICtz
dGF0aWMgaW50IHNwYWNlbWl0X2sxX2ZpbmFsX2luaXQoYm9vbCBjb2xkX2Jvb3QpCj4gPiArewo+
ID4gKyAgICAgICByZXR1cm4gZ2VuZXJpY19maW5hbF9pbml0KGNvbGRfYm9vdCk7Cj4gPiArfQo+
IAo+IFRoZSBzcGFjZW1pdF9rMV9maW5hbF9pbml0KCkgaXMgcmVkdW5kYW50IGJlY2F1c2UgaXQg
ZG9lcyBub3RoaW5nCj4gYW5kIGZhbGxzIGJhY2sgdG8gZ2VuZXJpY19maW5hbF9pbml0KCk7Cj4g
Cj4gPiArCj4gPiArc3RhdGljIGJvb2wgc3BhY2VtaXRfY29sZF9ib290X2FsbG93ZWQodTMyIGhh
cnRpZCkKPiA+ICt7Cj4gPiArICAgICAgIGNzcl9zZXQoQ1NSX01MMlNFVFVQLCAxIDw8IChoYXJ0
aWQgJSBQTEFURk9STV9NQVhfQ1BVU19QRVJfQ0xVU1RFUikpOwo+ID4gKwo+ID4gKyAgICAgICBy
ZXR1cm4gIWhhcnRpZDsKPiAKPiBGb3Igbm93IGl0J3Mgb2theSBidXQgdHJ5IHRvIGF2b2lkIHJl
Z2lzdGVyIHByb2dyYW1taW5nCj4gc3BhY2VtaXRfY29sZF9ib290X2FsbG93ZWQoKS4KPiAKPiA+
ICt9Cj4gPiArCj4gPiArc3RhdGljIGludCBzcGFjZW1pdF9rMV9wbGF0Zm9ybV9pbml0KGNvbnN0
IHZvaWQgKmZkdCwgaW50IG5vZGVvZmYsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY29uc3Qgc3RydWN0IGZkdF9tYXRjaCAqbWF0Y2gpCj4gPiArewo+ID4gKyAgICAg
ICBnZW5lcmljX3BsYXRmb3JtX29wcy5lYXJseV9pbml0ID0gc3BhY2VtaXRfazFfZWFybHlfaW5p
dDsKPiA+ICsgICAgICAgZ2VuZXJpY19wbGF0Zm9ybV9vcHMuZmluYWxfaW5pdCA9IHNwYWNlbWl0
X2sxX2ZpbmFsX2luaXQ7Cj4gPiArICAgICAgIGdlbmVyaWNfcGxhdGZvcm1fb3BzLmNvbGRfYm9v
dF9hbGxvd2VkID0gc3BhY2VtaXRfY29sZF9ib290X2FsbG93ZWQ7Cj4gPiArCj4gPiArICAgICAg
IHJldHVybiAwOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGZkdF9tYXRj
aCBzcGFjZW1pdF9rMV9tYXRjaFtdID0gewo+ID4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gInNw
YWNlbWl0LGsxIiB9LAo+ID4gKyAgICAgICB7IC8qIHNlbnRpbmVsICovIH0KPiA+ICt9Owo+ID4g
Kwo+ID4gK2NvbnN0IHN0cnVjdCBmZHRfZHJpdmVyIHNwYWNlbWl0X2sxID0gewo+ID4gKyAgICAg
ICAubWF0Y2hfdGFibGUgPSBzcGFjZW1pdF9rMV9tYXRjaCwKPiA+ICsgICAgICAgLmluaXQgPSBz
cGFjZW1pdF9rMV9wbGF0Zm9ybV9pbml0LAo+ID4gK307Cj4gPgo+ID4gLS0KPiA+IDIuNTEuMAo+
ID4KPiA+Cj4gPiAtLQo+ID4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiA+IG9wZW5zYmlAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9vcGVuc2JpCj4gCj4gT3RoZXJ3aXNlLCB0aGlzIGxvb2tzIGdvb2QgdG8gbWUuIEkgaGF2
ZSBkcm9wcGVkCj4gc3BhY2VtaXRfazFfZmluYWxfaW5pdCgpIGF0IHRoZSB0aW1lIG9mIG1lcmdp
bmcuClRoYW5rcyBmb3IgeW91ciBwYXRpZW5jZSwgQW51cC4KCiAgICAgICAgICAgICAgICAgICAg
LSBUcm95Cj4gCj4gUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+
Cj4gCj4gQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCj4gCj4g
VGhhbmtzLAo+IEFudXAKPiAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9vcGVuc2JpCg==
