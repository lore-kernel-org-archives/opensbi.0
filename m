Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5842DC88E72
	for <opensbi@archiver.kernel.org>; Thu, 17 Sep 2026 07:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZUsTZKm8tN1/2v5eAEFfkLo6oXpRA603fVCfjW5QPnk=; b=ZnOxIpFbBaW6pI
	/jpHDhP65spYhD3IHbadc5HFHGqMsiSYxLtf6bkBP2i6XzemSKjwYv1zpSiHgNivBFodKpp+oS2d3
	9i9RVohbC1GlUCEjd3CZZgyg5fctLFn9jCHUCVA8+38HZ4NGZC7J/tMjff3OFxsPiszdIO2nBb3e1
	qBKDnCN7j3VqrSXgt9FBf8BSesCI7dWwv+A4pNWG0qUgtG9L1TFhzrNah3uoRZ2cZY0GOFvrsA5nC
	sQxI2qifl3mlwKDDTm6qA1slIiu7lpW0zGPvvvYIjY4oCdVAbcAoPfBaAPRGDaDjUWle4l32uy+GR
	MXFqPwPHxKUGBWeMw45Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x76cg-0000000AmHE-0w0T;
	Thu, 17 Sep 2026 07:33:34 +0000
Received: from mail-ed2-x1f.google.com ([2a00:1450:4864:33::1f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x76cc-0000000AmEA-1Oyo
	for opensbi@lists.infradead.org;
	Thu, 17 Sep 2026 07:33:32 +0000
Received: by mail-ed2-x1f.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae52so960311a12.0
        for <opensbi@lists.infradead.org>; Thu, 17 Sep 2026 00:33:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789630408; cv=none;
        d=google.com; s=arc-20260327;
        b=HfQ1j6pTXIkcHZL3jYaKZrXu2Qx+ArqHh+/ah+5zYfCfyKHamB+uruLg3FDgr6H/rF
         tBPXZTyz6wGTAqn5VRIe92XOjCKiexmoPC65shq40Y1guxBqjVZAH3Gk+A9LVdhqgtGQ
         wWPkdhYE+4Q2UnqphIaZCqnT3cmz+gPNCh+LvPwibUwE5G7CvCzWAeuJAkCutZerlw2I
         GerngXsrT3a0q01lZR7KEfByem4FpOgNiWiHW/JYP+3pDgKMuTJ2kwMdoA48MxDCDZI1
         ksY26CRnj14AO9t55T3vnrH5YlbIBu8YOHmhljQCvnBfAUF8s7UX4/aSkd6qa67vWdA8
         CsBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dHNVvLE96mOiAW72qAicR40kv9ImvEfMHpjim/ik82I=;
        fh=84iVe/PSOJxldWpQ6pMR7IhUk9iJTQ25iYxQQpMMt2s=;
        b=PPvYhcsUIsGvqtubGf7QKbzT/CSW9LGGh5kN459V55aKDZcZKfNUbCfkRgVBWsI2Tu
         mwHXt6bbB/lZc7em6//v5GoJ05YFCPNj1T5alDIHapQ4jF+q23WU19/oZFpRce1cWci8
         fcHOGyepJAJ1kr9WIE4aHpyqAfmJaG/x38jvmhUAmaRs9qi5gSJm5WfHl0W7XUS5a1OK
         gWwatjRO1yi2RzRknEnDrSCEBE36/Ai2V6/ckPJxCQoO5TdsJnrE7XEto7vUpDQBSKzS
         awAUpJEgB1xki6+dWkHt7mXcddnYOn5qGbBnmy2McINw+v9KzRqSV8j16KW4IbBI0lJd
         gujw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789630408; x=1790235208; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dHNVvLE96mOiAW72qAicR40kv9ImvEfMHpjim/ik82I=;
        b=ABLkwebuXqvRqTMMY6JW5qwdNxm5O1KHmP+16B+tHmZcuhc4xG4Bo0/MtRAOhs4QEE
         fkFHKPoofM826fHSz2hAMt3fz5jyy6Cd36ZHIasVNXfvIjZx0HVd8mpw2sVvszjiw2LG
         WzHzIywdVgM47TFS2QDmew5rmDG2cNlUAbrOrn/ILofyrekYwZvgVNJujhqAKv+QFIT2
         wvBF7vgmilNMTlAUYL8crjj6dBFYMXvLdxH6xpOTl7I61jDj8Ajo1f4vnbOS+spOP190
         C49EAa5TPd9FZBMivJe3za2y/2SnMsxDvxxvIhXJT5wFbNVjlWfbQdcoc8QWTfGXJbcl
         QVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789630408; x=1790235208;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dHNVvLE96mOiAW72qAicR40kv9ImvEfMHpjim/ik82I=;
        b=dWEqsRuTuS0y6Eree9iseC/NPte2P5UHpIOeLRYOccbVQTjuZzydlsJYI6EcVeDBgP
         8QO1XMpaskK73aEJgNfHN4RUO5jvYSC2VDUfr1ltovSWzIG8MAUjP/pRfWSjenC9ct/j
         Bn50B2fFEHLfqILUCi7hsomF//F40S99mU39dToRuAd/y65rGJYNU4fr8u/nFnaTlsmc
         LBrpCu6IjuCY+CVpowUo9NezbGtVa7hmhBPqDBu5BPmNuClxEqF4lczGJACdO4h6DpGf
         BVyjH3HdwzDanNCfQXWIyjZ9JnN48X3ba0Jbe9sZZI1Im+cZDl2jOFku3V6PbAtl/xR3
         mW9Q==
X-Gm-Message-State: AFuF++laAnNGAXfG0uM+KY2wyIZwkXpX5SAQYr9KGjEWIlAuLTdz7C1G
	nmNog0If26nDaxRpSiDgxdahwLvp3VPW3/MQqRKswOjWhKd/dpkzQSzcsOtl/35KjrhniDWq8JM
	bDyRUN0TVSHprFE+8Evjou03E9MR39WVMYDhzGPfN/zJTIUTLpFH4NAAeVg==
X-Gm-Gg: AYBFou3TlOovx7Ku6t7n0wtoFRkSHaI46fIcanyghyK/oRzyhtILZ5uNL9kmll3Ngle
	7eKILwaPJ83E/7kb74vSeXw1qVyHnDs7QqS9rAWvYn9VaigApde9P8Mk9TDBvXFaiiqGCQcW8Rj
	C+QYRUw4ty56qz2apB5ohTLrk+lV5prNEXgKXtN76xJTkAx9dmt2AJ7ozIg9xUt8SZaFf1I2OHl
	pTzpNFYqKZ4BVaQ7a2kgjWq9UXrX21Ec3quR41YId3RmzDKIy98KWcWKQtL9ogjGt5pJPZBo7/+
	+teWkvvKUFFMASdJ1FpIXEVGbSjwZcTQ0JQjJmzbtbTdk5Qd3DqrSV4hYw==
X-Received: by 2002:a05:6402:4441:b0:6aa:19bd:dc9d with SMTP id
 4fb4d7f45d1cf-6aa224027aemr8321776a12.13.1789630408013; Thu, 17 Sep 2026
 00:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260901022211.2619560-1-zong.li@sifive.com> <20260901022211.2619560-2-zong.li@sifive.com>
 <CAAhSdy2c-Cy4TZeL5J8fzQN_BCf5-M9UG_6HSuVum1D5hYNUdg@mail.gmail.com>
In-Reply-To: <CAAhSdy2c-Cy4TZeL5J8fzQN_BCf5-M9UG_6HSuVum1D5hYNUdg@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 17 Sep 2026 15:33:16 +0800
X-Gm-Features: AcwNN1XWvdV4WdkpR0lcbcYLcH-g9XWPrp-huBmFviHJjRyCW1-y0VXvaFg-gF0
Message-ID: <CANXhq0qOKJKmk137N3xRke=ngrxc+5F+aZFoT3gWHGVC6MDbPw@mail.gmail.com>
Subject: Re: [PATCH 1/3] firmware: fw_base.S: add a formatted OpenSBI firmware header
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_003330_424568_BBF6D659 
X-CRM114-Status: GOOD (  41.74  )
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

T24gV2VkLCBTZXAgMTYsIDIwMjYgYXQgMTowOeKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBTZXAgMSwgMjAyNiBhdCA3OjUy4oCvQU0gWm9u
ZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPiB3cm90ZToKPiA+Cj4gPiBBZGQgYSBmaXhlZCAxMjgt
Ynl0ZSBoZWFkZXIgYXQgdGhlIHZlcnkgYmVnaW5uaW5nIG9mIGV2ZXJ5IE9wZW5TQkkKPiA+IGZp
cm13YXJlIGltYWdlLCByZWdhcmRsZXNzIG9mIHRoZSBmaXJtd2FyZSB0eXBlLiBUaGUgaGVhZGVy
IGxldHMgdGhlCj4gPiBwcmV2aW91cyBib290aW5nIHN0YWdlIGlkZW50aWZ5IGFuIE9wZW5TQkkg
aW1hZ2UgYW5kLCBtb3JlIGltcG9ydGFudGx5LAo+ID4gZ2l2ZXMgaXQgYSB3ZWxsLWtub3duIHBs
YWNlIGluc2lkZSB0aGUgaW1hZ2UgdG8gaGFuZCBvdmVyIGluZm9ybWF0aW9uCj4gPiB0byBPcGVu
U0JJIGJ5IHBhdGNoaW5nIGEgZmV3IHdvcmRzIGluc3RlYWQgb2Ygc2V0dGluZyB1cCByZWdpc3Rl
cnMuCj4gPgo+ID4gVGhpcyBmaXJzdCBwYXRjaCBvbmx5IGludHJvZHVjZXMgdGhlIGxheW91dDoK
PiA+Cj4gPiAgIC0gYSA0LWJ5dGUganVtcCBvdmVyIHRoZSBoZWFkZXIgdG8gX3N0YXJ0X3JlYWws
IHNvIHRoYXQgX3N0YXJ0IHN0YXlzCj4gPiAgICAgdGhlIGVudHJ5IHBvaW50IG9mIHRoZSBpbWFn
ZS4gVGhlIGp1bXAgaXMgYXNzZW1ibGVkIHdpdGgKPiA+ICAgICAnLm9wdGlvbiBub3J2Yycgc28g
dGhhdCB0aGUgZmllbGRzIGJlaGluZCBpdCBhcmUgYWx3YXlzIGF0IGEgZml4ZWQKPiA+ICAgICBv
ZmZzZXQsIGV2ZW4gZm9yIGEgYnVpbGQgd2l0aCBjb21wcmVzc2VkIGluc3RydWN0aW9ucyBlbmFi
bGVkLAo+ID4KPiA+ICAgLSB0aGUgJ09TQkknIG1hZ2ljLCBhIGhlYWRlciB2ZXJzaW9uLCB0aGUg
WExFTiB0aGUgZmlybXdhcmUgd2FzIGJ1aWx0Cj4gPiAgICAgZm9yIGFuZCB0aGUgc2l6ZSBvZiB0
aGUgZmlybXdhcmUgaW1hZ2UsIHNvIHRoYXQgdGhlIHByZXZpb3VzIGJvb3RpbmcKPiA+ICAgICBz
dGFnZSBjYW4gdmFsaWRhdGUgdGhlIGltYWdlIGFuZCBmaWd1cmUgb3V0IGhvdyBtdWNoIG1lbW9y
eSBpdAo+ID4gICAgIG9jY3VwaWVzLAo+ID4KPiA+ICAgLSBhIGZsYWdzIHdvcmQgYW5kIHRocmVl
IDgtYnl0ZSBvdmVycmlkZSB2YWx1ZXMsIHdoaWNoIGFyZSB1bnVzZWQKPiA+ICAgICAoYW5kIHpl
cm8pIGZvciBub3cgYW5kIGFyZSB3aXJlZCB1cCBieSB0aGUgbmV4dCBwYXRjaC4KPiA+Cj4gPiBU
aGUgbGF5b3V0IGlzIGRlbGliZXJhdGVseSBpZGVudGljYWwgZm9yIFJWMzIgYW5kIFJWNjQgc28g
dGhhdCB0aGUKPiA+IHByZXZpb3VzIGJvb3Rpbmcgc3RhZ2UgY2FuIHBhcnNlIHRoZSBoZWFkZXIg
d2l0aG91dCBrbm93aW5nIHRoZSBYTEVOIG9mCj4gPiB0aGUgZmlybXdhcmUgdXBmcm9udC4gRWFj
aCBvdmVycmlkZSB2YWx1ZSBpcyBmb2xsb3dlZCBieSBhIHJlc2VydmVkCj4gPiA4LWJ5dGUgc2xv
dCBzbyB0aGF0IHRoZSBzYW1lIGxheW91dCBjYW4gYmUgZXh0ZW5kZWQgdG8gUlYxMjggbGF0ZXIu
Cj4gPgo+ID4gU3VnZ2VzdGVkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgo+
ID4gU2lnbmVkLW9mZi1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgo+ID4gLS0tCj4g
PiAgZmlybXdhcmUvZndfYmFzZS5TIHwgNjggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2OCBpbnNlcnRpb25zKCspCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL2Zpcm13YXJlL2Z3X2Jhc2UuUyBiL2Zpcm13YXJlL2Z3X2Jhc2Uu
Uwo+ID4gaW5kZXggMGM1YzY1YzEuLmRkMmFkYjhhIDEwMDY0NAo+ID4gLS0tIGEvZmlybXdhcmUv
ZndfYmFzZS5TCj4gPiArKysgYi9maXJtd2FyZS9md19iYXNlLlMKPiA+IEBAIC0xNyw2ICsxNywx
NSBAQAo+ID4gICNkZWZpbmUgQk9PVF9MT1RURVJZX0FDUVVJUkVEICAgICAgICAgIDEKPiA+ICAj
ZGVmaW5lIEJPT1RfU1RBVFVTX0JPT1RfSEFSVF9ET05FICAgICAxCj4gPgo+ID4gKy8qIE9wZW5T
QkkgZmlybXdhcmUgaGVhZGVyICovCj4gPiArI2RlZmluZSBGV19IRUFERVJfTUFHSUNfVkFMVUUg
ICAgICAgICAgMHg0OTQyNTM0ZiAvKiBBU0NJSSBzdHJpbmcgIk9TQkkiICovCj4gPiArI2RlZmlu
ZSBGV19IRUFERVJfVkVSU0lPTiAgICAgICAgICAgICAgMHgxCj4gPiArI2RlZmluZSBGV19IRUFE
RVJfU0laRSAgICAgICAgICAgICAgICAgMTI4Cj4gPiArI2RlZmluZSBGV19IRUFERVJfUkVTRVJW
RURfT0ZGU0VUICAgICAgMHg0OAo+ID4gKyNkZWZpbmUgRldfSEVBREVSX0ZMQUdTX09WRVJSSURF
X0EwICAgICgxIDw8IDApCj4gPiArI2RlZmluZSBGV19IRUFERVJfRkxBR1NfT1ZFUlJJREVfQTEg
ICAgKDEgPDwgMSkKPiA+ICsjZGVmaW5lIEZXX0hFQURFUl9GTEFHU19PVkVSUklERV9BMiAgICAo
MSA8PCAyKQo+ID4gKwo+ID4gIC5tYWNybyBNT1ZfM1IgX19kMCwgX19zMCwgX19kMSwgX19zMSwg
X19kMiwgX19zMgo+ID4gICAgICAgICBhZGQgICAgIFxfX2QwLCBcX19zMCwgemVybwo+ID4gICAg
ICAgICBhZGQgICAgIFxfX2QxLCBcX19zMSwgemVybwo+ID4gQEAgLTQ0LDggKzUzLDY3IEBACj4g
PiAgICAgICAgIC5zZWN0aW9uIC5lbnRyeSwgImF4IiwgJXByb2diaXRzCj4gPiAgICAgICAgIC5h
bGlnbiAzCj4gPiAgICAgICAgIC5nbG9ibCBfc3RhcnQKPiA+ICsgICAgICAgLmdsb2JsIF9zdGFy
dF9yZWFsCj4gPiAgICAgICAgIC5nbG9ibCBfc3RhcnRfd2FybQo+ID4gIF9zdGFydDoKPiA+ICsg
ICAgICAgLyoKPiA+ICsgICAgICAgICogT3BlblNCSSBmaXJtd2FyZSBoZWFkZXIKPiA+ICsgICAg
ICAgICoKPiA+ICsgICAgICAgICogRXZlcnkgT3BlblNCSSBmaXJtd2FyZSBpbWFnZSBzdGFydHMg
d2l0aCB0aGlzIGZpeGVkIDEyOC1ieXRlCj4gPiArICAgICAgICAqIGhlYWRlci4gVGhlIGxheW91
dCBpcyBpZGVudGljYWwgZm9yIFJWMzIgYW5kIFJWNjQgKGFuZCBjYW4gYmUKPiA+ICsgICAgICAg
ICogZXh0ZW5kZWQgZm9yIFJWMTI4IGJ5IHVzaW5nIHRoZSByZXNlcnZlZCBoYWxmIG9mIGVhY2gg
b3ZlcnJpZGUKPiA+ICsgICAgICAgICogZmllbGQpLCBzbyB0aGUgcHJldmlvdXMgYm9vdGluZyBz
dGFnZSBjYW4gcGFyc2UgdGhlIGhlYWRlciB3aXRob3V0Cj4gPiArICAgICAgICAqIGtub3dpbmcg
dGhlIFhMRU4gb2YgdGhlIGZpcm13YXJlIHVwZnJvbnQuCj4gPiArICAgICAgICAqCj4gPiArICAg
ICAgICAqIE9mZnNldCAgU2l6ZSAgRmllbGQKPiA+ICsgICAgICAgICogICAweDAwICAgICA0ICBq
dW1wIHRvIF9zdGFydF9yZWFsCj4gPiArICAgICAgICAqICAgMHgwNCAgICAgNCAgbWFnaWMgKCdP
U0JJJykKPiA+ICsgICAgICAgICogICAweDA4ICAgICA0ICBoZWFkZXIgdmVyc2lvbgo+ID4gKyAg
ICAgICAgKiAgIDB4MGMgICAgIDQgIGZpcm13YXJlIFhMRU4KPiA+ICsgICAgICAgICogICAweDEw
ICAgICA0ICBmaXJtd2FyZSBzaXplIChfZndfZW5kIC0gX2Z3X3N0YXJ0KQo+ID4gKyAgICAgICAg
KiAgIDB4MTQgICAgIDQgIGZsYWdzIChGV19IRUFERVJfRkxBR1NfKikKPiA+ICsgICAgICAgICog
ICAweDE4ICAgICA4ICBvdmVycmlkZSB2YWx1ZSBmb3IgYTAKPiA+ICsgICAgICAgICogICAweDIw
ICAgICA4ICByZXNlcnZlZCAodXBwZXIgaGFsZiBvZiB0aGUgYTAgdmFsdWUgb24gUlYxMjgpCj4K
PiBUaGlua2luZyBhYm91dCB0aGlzIG1vcmUsIHdlIGRvbid0IG5lZWQgIm92ZXJyaWRlIHZhbHVl
IG9mIGEwIiBpbiB0aGUKPiBoZWFkZXIgaW5zdGVhZCB3aGVuZXZlciBGV19IRUFERVJfRkxBR1Nf
T1ZFUlJJREVfQTAgaXMKPiBzZXQgd2UgY2FuIHVzZSBtaGFydGlkIENTUiB2YWx1ZSBhcyB0aGUg
dmFsdWUgb2YgYTAuIFRoaXMgd2lsbCB3b3JrCj4gYmV0dGVyIGZvciBhbGwgQ1BVcyBlbnRlcmlu
ZyBhdCBfc3RhcnQuCgpUaGFuayB5b3UgZm9yIHlvdXIgc3VnZ2VzdGlvbiBhbmQgcmVtaW5kZXIu
IEJlY2F1c2UgdGhlIGhlYWRlciBpcwpzaGFyZWQgYnkgYWxsIGhhcnRzLCBpdCBjYW5ub3Qgc2hv
dyBlYWNoIGhhcnQncyBJRCBjb3JyZWN0bHkuIEkgd2lsbApmaXggdGhpcyBwcm9ibGVtIGluIHRo
ZSBuZXh0IHBhdGNoLgoKSG93ZXZlciwgSSBhbHNvIGhhdmUgYSBxdWVzdGlvbi4gSW4gdGhlIG9y
aWdpbmFsIGZsb3csIGNvdWxkIHdlIGFsc28KbGV0IGVhY2ggaGFydCByZWFkIGl0cyBvd24gbWhh
cnRpZCBDU1IgaW50byAkYTAgYXQgdGhlIGJlZ2lubmluZz8KSWYgSSB1bmRlcnN0YW5kIGNvcnJl
Y3RseSwgdGhlIHByZXZpb3VzIHN0YWdlIG11c3QgcGFzcyBlYWNoIGhhcnQncwptaGFydGlkIHRv
IE9wZW5TQkkgdXNpbmcgJGEwLiBTaW5jZSBhIGhhcnQgc2hvdWxkIG9ubHkgdXNlIGl0cyBvd24g
SUQsCkkgYW0gd29uZGVyaW5nIHdoeSBPcGVuU0JJIGRvZXNuJ3QganVzdCByZWFkIHRoZSBJRCBi
eSBpdHNlbGYgaW4gdGhlCm9yaWdpbmFsIGZsb3cuCklmIHlvdSBhZ3JlZSB0aGF0IHdlIGNhbiBk
byB0aGlzIGluIHRoZSBvcmlnaW5hbCBmbG93LCBJIGNhbiBhbHNvIGFkZAp0aGlzIGNoYW5nZSB0
byB0aGUgbmV4dCBwYXRjaC4KClRoYW5rcwoKPgo+ID4gKyAgICAgICAgKiAgIDB4MjggICAgIDgg
IG92ZXJyaWRlIHZhbHVlIGZvciBhMQo+ID4gKyAgICAgICAgKiAgIDB4MzAgICAgIDggIHJlc2Vy
dmVkICh1cHBlciBoYWxmIG9mIHRoZSBhMSB2YWx1ZSBvbiBSVjEyOCkKPiA+ICsgICAgICAgICog
ICAweDM4ICAgICA4ICBvdmVycmlkZSB2YWx1ZSBmb3IgYTIKPiA+ICsgICAgICAgICogICAweDQw
ICAgICA4ICByZXNlcnZlZCAodXBwZXIgaGFsZiBvZiB0aGUgYTIgdmFsdWUgb24gUlYxMjgpCj4g
PiArICAgICAgICAqICAgMHg0OCAgICA1NiAgcmVzZXJ2ZWQKPiA+ICsgICAgICAgICovCj4gPiAr
X2Z3X2hlYWRlcl9qdW1wOgo+ID4gKyAgICAgICAvKgo+ID4gKyAgICAgICAgKiBNdXN0IHN0YXkg
YSA0LWJ5dGUgaW5zdHJ1Y3Rpb24gc28gdGhhdCB0aGUgZmllbGRzIGJlbG93IGFyZSBhbHdheXMK
PiA+ICsgICAgICAgICogYXQgYSBmaXhlZCBvZmZzZXQuICdub3J2Yycga2VlcHMgdGhlIGFzc2Vt
YmxlciBmcm9tIHBpY2tpbmcgYy5qIGFuZAo+ID4gKyAgICAgICAgKiAnbm9yZWxheCcga2VlcHMg
dGhlIGxpbmtlciBmcm9tIGNvbXByZXNzaW5nIGl0IGxhdGVyIG9uLCB3aGljaCBpdAo+ID4gKyAg
ICAgICAgKiB3b3VsZCBvdGhlcndpc2UgaGFwcGlseSBkbyBmb3IgYSBqdW1wIHRoaXMgc2hvcnQu
Cj4gPiArICAgICAgICAqLwo+ID4gKyAgICAgICAub3B0aW9uIHB1c2gKPiA+ICsgICAgICAgLm9w
dGlvbiBub3J2Ywo+ID4gKyAgICAgICAub3B0aW9uIG5vcmVsYXgKPiA+ICsgICAgICAgaiAgICAg
ICBfc3RhcnRfcmVhbAo+ID4gKyAgICAgICAub3B0aW9uIHBvcAo+ID4gK19md19oZWFkZXJfbWFn
aWM6Cj4gPiArICAgICAgIC53b3JkICAgRldfSEVBREVSX01BR0lDX1ZBTFVFCj4gPiArX2Z3X2hl
YWRlcl92ZXJzaW9uOgo+ID4gKyAgICAgICAud29yZCAgIEZXX0hFQURFUl9WRVJTSU9OCj4gPiAr
X2Z3X2hlYWRlcl94bGVuOgo+ID4gKyAgICAgICAud29yZCAgIF9fcmlzY3ZfeGxlbgo+ID4gK19m
d19oZWFkZXJfc2l6ZToKPiA+ICsgICAgICAgLndvcmQgICAoX2Z3X2VuZCAtIF9md19zdGFydCkK
PiA+ICtfZndfaGVhZGVyX2ZsYWdzOgo+ID4gKyAgICAgICAud29yZCAgIDAKPiA+ICtfZndfaGVh
ZGVyX292ZXJyaWRlX2EwOgo+ID4gKyAgICAgICAuZHdvcmQgIDAKPiA+ICsgICAgICAgLmR3b3Jk
ICAwICAgICAgICAgICAgICAgICAgICAgICAvKiByZXNlcnZlZCAqLwo+ID4gK19md19oZWFkZXJf
b3ZlcnJpZGVfYTE6Cj4gPiArICAgICAgIC5kd29yZCAgMAo+ID4gKyAgICAgICAuZHdvcmQgIDAg
ICAgICAgICAgICAgICAgICAgICAgIC8qIHJlc2VydmVkICovCj4gPiArX2Z3X2hlYWRlcl9vdmVy
cmlkZV9hMjoKPiA+ICsgICAgICAgLmR3b3JkICAwCj4gPiArICAgICAgIC5kd29yZCAgMCAgICAg
ICAgICAgICAgICAgICAgICAgLyogcmVzZXJ2ZWQgKi8KPiA+ICsgICAgICAgLyogUmVzZXJ2ZWQs
IHBhZHMgdGhlIGhlYWRlciB1cCB0byBGV19IRUFERVJfU0laRSBieXRlcyAqLwo+ID4gKyAgICAg
ICAuZmlsbCAgIChGV19IRUFERVJfU0laRSAtIEZXX0hFQURFUl9SRVNFUlZFRF9PRkZTRVQpLCAx
LCAwCj4gPiArX3N0YXJ0X3JlYWw6Cj4gPiAgICAgICAgIC8qIEZpbmQgcHJlZmVycmVkIGJvb3Qg
SEFSVCBpZCAqLwo+ID4gICAgICAgICBNT1ZfM1IgIHMwLCBhMCwgczEsIGExLCBzMiwgYTIKPiA+
ICAgICAgICAgY2FsbCAgICBmd19ib290X2hhcnQKPiA+IC0tCj4gPiAyLjQzLjcKPiA+Cj4KPiBS
ZWdhcmRzLAo+IEFudXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9v
cGVuc2JpCg==
