Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA579C44529
	for <opensbi@archiver.kernel.org>; Tue, 21 Jul 2026 06:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8WiO6cBXi/CC01ZkwN6PL/g/517hkQfOt+y9Mtrz8ts=; b=mZoNj7fVPRXmi2
	n7CmCVPY44D+gXuMmI0Q7pL6C8lThqA+3uWBGGgdFRh1Ou6SP6GwukI2o7quEUkgDw1TN2jEuAJEJ
	yJORjK0enhL+LyCUiIszqErWZvE3p85f+OKITm5aZs+9Od+Vg7FKutsX9sQLiTCWv3Uz4MUekYzqP
	Sf7WcHk334KGUbkM6Z+4hoRvg70y6tzUcCErcQzIGHBXrJKkcpgpqmWfNh5S3hCJus/DeR1MLvSJt
	vvD+JPmhnAx5kEOZAKW9PGXLPLil8WXXEX//r1lYR8kMi1jdujm8m1nX/4ldnHl4imkO589Yugr2G
	LTBBII7PwyX4+Dej9cYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm3uZ-00000008W80-2uOz;
	Tue, 21 Jul 2026 06:25:03 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm3uX-00000008W7W-2ksy
	for opensbi@lists.infradead.org;
	Tue, 21 Jul 2026 06:25:03 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cacf197759so124208155ad.2
        for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 23:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1784615100; x=1785219900; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xkb8lLfa0w/+RQT8rMgdqE5M+X2Eiq+QOdrCozLTeA0=;
        b=FdL9CPkMXQI5MX1mqjAzOm0ruLnsb8BmcqP765UbrE/YFWh3XwkXmxbWkE/nHXd/4c
         PSJRQeViGQOzfPk9QfHzmvlTFeFe7tFe47ET8TxQPXN3INH0wluOVyk5Kw8ZwiA5FMIW
         HbedurKFWsQzEG8cLaNVkb/RSg7iGJKYiLjo6MWnDTkAeyKZDhfGqhwQWwql7JPeEIUr
         yWKj9+47SbAWkF1Fd/0eEmhxJQw7GV8v8SurwudOBuvJUJ7ph15zRp+dqAc8EDtoLosw
         WcnMnaIj0HLd9Df2yuiCzwXfZIA85/n1SlVc7H7fj9cBbDnigHxRhtVBM27qCZKkJ73h
         W6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784615100; x=1785219900;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xkb8lLfa0w/+RQT8rMgdqE5M+X2Eiq+QOdrCozLTeA0=;
        b=gMTNd/r66WnXgwZuGcR1yGYWBem8zJG9YLFbRORgaND0dgPFYPlHlaykDA6KjMXe2Z
         oTw2+m9XbYWzwr7POCOZth215pp1neHF3CZzI3JRHm7dNjtJOvT7Q11mB6IiyUOinia6
         PAL6TQOMdT7fC5omgDVz1HP2a4MLsjHcNukPiCTnsb8YNew/JO/08l9CHT1SHQnaQeGF
         s9KACDIlzj7LOmjEoRSO+e2UG/XkTnqhFdkqOVABDG3dCEKjt/TxaEKFbr8FXmGS+9pD
         S7HDNIBQT2ukacxdyEpxycCoY5YhS0LTtK7xAgSNqtE7A4aAC91rQPTy4/aocNCAxdb2
         +KUw==
X-Forwarded-Encrypted: i=1; AHgh+RrLQLcH+DcmpYuyOL0RcIvjZjZGMD/igx774DaDbrmYuYHva7WO2jCtdfaosCvepc1rVTssTSuJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzpPQpkDmz+HjURjJzhKyxAGdOteoBnxToBFe8S+I/qKTPt7T5k
	Qr+Ad7ycpApH4sudvBH/fDSVdEr4t4gcIkgNWBadjnVboOINJN8mmKixQp1XvlgACIo=
X-Gm-Gg: AR+sD12DHwCyPiR7pmPLFpTVtTVqPANSSBAj8Lb4XpmGzrclCYOBGcW8WtnGC4j3yAQ
	BVoJoATtD4n5topI9RRLfAts3zk36rgJflq7eIO/xxme/w1tV3r5zoreQDtn8Y4peHZ7LpDwoyK
	eio2wHL/H5PgX1kk2JcOBSbsO2EuRpeUB8+1Qil8jjVsOI5VhB5x+9k7ZoV5h1p86l7+1wFcQCo
	Rh+Gb4SmSYrmfMNSPC1gV8Qox745Y3OCCGIG1QQZYBCYc/wNrOLx5Pg+mv28GvOMQIjUwy5CC8Y
	hcF3JKsRK/Bb5/b4of/aZLUQLKFgZvMd43E+ZD+mOzB2sQHYd00H/k73pAMQ7++S0hjYgcC6T6L
	aCF5Mxnlkd298/YDHFwDMdU5KuzKOnOAAuo6KHh874Nec0YKuOvdKr6Rv41/Zpd9+G7Ch1xCsyp
	ru
X-Received: by 2002:a17:903:2287:b0:2ca:b8fd:1a8f with SMTP id d9443c01a7336-2cf349c2497mr186398345ad.39.1784615100300;
        Mon, 20 Jul 2026 23:25:00 -0700 (PDT)
Received: from plin-1878 ([136.226.240.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344b78e2sm68507915ad.24.2026.07.20.23.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:24:59 -0700 (PDT)
Date: Tue, 21 Jul 2026 14:24:54 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
	zong.li@sifive.com, greentime.hu@sifive.com, scott@riscstar.com,
	conor@kernel.org, dave.patel@riscstar.com, raymond.mao@riscstar.com,
	robin.randhawa@sifive.com, samuel.holland@sifive.com
Subject: Re: [RFC PATCH 09/12] platform: generic: parse root domain WID
 config from DT
Message-ID: <al8Qtr44PCu0F4Nl@plin-1878>
References: <20260626101433.3133466-1-peter.lin@sifive.com>
 <20260626101433.3133466-10-peter.lin@sifive.com>
 <CAAVgOk+==we31kXGJxG0XQeRY4B0e9rR3e_4PLT22WwVy-e-dQ@mail.gmail.com>
 <al3iXVFNChVjXsHa@plin-1878>
 <CAAhSdy2D_6CFkMztW96UxitGNy07zyw812kDa8js2VmvSKgF6w@mail.gmail.com>
 <CAAVgOk+YPQNyTzYFaEyihzSdtuDLXSC0z_-nf5fL+BaB6WshTg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAVgOk+YPQNyTzYFaEyihzSdtuDLXSC0z_-nf5fL+BaB6WshTg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_232501_715379_DAF89D53 
X-CRM114-Status: GOOD (  28.47  )
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

T24gTW9uLCBKdWwgMjAsIDIwMjYgYXQgMDI6MTQ6MTZQTSAtMDcwMCwgUGF3YW5kZWVwIE96YSB3
cm90ZToKPiBJIGdhdmUgdGhlIGNvbW1lbnQgb24geW91ciBjb3ZlciBsZXR0ZXIgd2hpY2ggd2Fz
IGRlZmluaW5nIERULiBwYXN0aW5nCj4gaXQgaGVyZSBmb3IgdGhlIHJlZmVyZW5jZS4KPiAKPiBP
emE6IGxldHMgc3RhcnQgYSBiaXQgZnJvbSBoZXJlIGZyb20gZGV2aWNlIHRyZWUuCj4gCj4gY3B1
cyB7Cj4gICAgIHJpc2N2LG53b3JsZHMgPSA8ND47Cj4gCj4gICAgIGNwdUAwIHsKPiAgICAgICAg
IHJpc2N2LHBtd2lkICAgICAgPSA8Mz47ICAgICAgIC8qIE0tbW9kZSBsaXZlcyBpbiBXb3JsZCAz
ICovCj4gICAgICAgICByaXNjdixwbXdpZGxpc3QgID0gPDB4MCAweGY+OyAvKiBNLW1vZGUgY2Fu
IGFjY2VzcyBXb3JsZHMgMC0zICovCj4gICAgICAgICByaXNjdixwbWx3aWRsaXN0ID0gPDB4MCAw
eGY+OyAvKiBTL1UtbW9kZSBjYW4gdXNlIFdvcmxkcyAwLTMgKi8KPiAgICAgfTsKPiB9Owo+IAo+
IGNob3NlbiB7Cj4gICAgIG9wZW5zYmktZG9tYWlucyB7Cj4gICAgICAgICAvKiBXSUQgMyDigJQg
TS1tb2RlIChpbXBsaWNpdCwgdmlhIHBtd2lkKSAqLwo+ICAgICAgICAgdHJ1c3RlZC1kb21haW4g
ewo+ICAgICAgICAgICAgIHdpZCAgICAgPSA8Mj47ICAgICAgIC8qIFdJRCAyIOKAlCB0cnVzdGVk
IFMtbW9kZSAqLwo+ICAgICAgICAgICAgIHdpZGxpc3QgPSA8MHgwIDB4ND47IC8qIGNhbiBkZWxl
Z2F0ZSBXSUQgMiB0byBVLW1vZGUgKi8KPiAgICAgICAgIH07Cj4gICAgICAgICB1bnRydXN0ZWQt
ZG9tYWluIHsKPiAgICAgICAgICAgICB3aWQgICAgID0gPDE+OyAgICAgICAvKiBXSUQgMSDigJQg
dW50cnVzdGVkIFMtbW9kZSAqLwo+ICAgICAgICAgICAgIHdpZGxpc3QgPSA8MHgwIDB4MD47IC8q
IG5vIGRlbGVnYXRpb24gKi8KPiAgICAgICAgIH07Cj4gICAgICAgICByb290LWRvbWFpbiB7Cj4g
ICAgICAgICAgICAgd2lkICAgICA9IDwwPjsgICAgICAgLyogV0lEIDAg4oCUIHJvb3QvdW5wcm90
ZWN0ZWQgKi8KPiAgICAgICAgICAgICB3aWRsaXN0ID0gPDB4MCAweDA+OwoKQWgsIEkgb3Zlcmxv
b2tlZCB0aGF0IHJlcGx5LCB0aGFua3MgQW51cCBhbmQgT3phIGZvciBzdWdnZXN0aW9uLgpJIHdp
bGwgZm9sbG93IGl0LgoKUmVnYXJkcywKUGV0ZXIgTGluCgo+IAo+IE9uIE1vbiwgSnVsIDIwLCAy
MDI2IGF0IDM6MznigK9BTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToK
PiA+Cj4gPiBPbiBNb24sIEp1bCAyMCwgMjAyNiBhdCAyOjI04oCvUE0gWXUtQ2hpZW4gUGV0ZXIg
TGluIDxwZXRlci5saW5Ac2lmaXZlLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFdlZCwgSnVs
IDA4LCAyMDI2IGF0IDA1OjM5OjM0UE0gLTA3MDAsIFBhd2FuZGVlcCBPemEgd3JvdGU6Cj4gPiA+
ID4gT24gRnJpLCBKdW4gMjYsIDIwMjYgYXQgMzoxN+KAr0FNIFl1LUNoaWVuIFBldGVyIExpbiA8
cGV0ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IFBhcnNlIHJv
b3QtZG9tYWluLW5leHQtd2lkICgzMi1iaXQpIGFuZCByb290LWRvbWFpbi1uZXh0LXdpZGxpc3QK
PiA+ID4gPiA+ICg2NC1iaXQpIHByb3BlcnRpZXMgZnJvbSAvY2hvc2VuL29wZW5zYmksY29uZmln
IG5vZGUgZHVyaW5nCj4gPiA+ID4gPiBnZW5lcmljX2RvbWFpbnNfaW5pdCgpLiBTZXRzIHJvb3Qu
bmV4dF93aWQvaGFzX25leHRfd2lkIGFuZAo+ID4gPiA+ID4gcm9vdC5uZXh0X3dpZGxpc3QuCj4g
PiA+ID4gPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWXUtQ2hpZW4gUGV0ZXIgTGluIDxwZXRl
ci5saW5Ac2lmaXZlLmNvbT4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gIHBsYXRmb3JtL2dlbmVy
aWMvcGxhdGZvcm0uYyB8IDIwICsrKysrKysrKysrKysrKysrKystCj4gPiA+ID4gPiAgMSBmaWxl
IGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gPiA+Cj4gPiA+
ID4gPiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jIGIvcGxhdGZvcm0v
Z2VuZXJpYy9wbGF0Zm9ybS5jCj4gPiA+ID4gPiBpbmRleCA1MWU5ZjM0Mi4uZGUxMmRlYjUgMTAw
NjQ0Cj4gPiA+ID4gPiAtLS0gYS9wbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMKPiA+ID4gPiA+
ICsrKyBiL3BsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYwo+ID4gPiA+ID4gQEAgLTExLDYgKzEx
LDcgQEAKPiA+ID4gPiA+ICAjaW5jbHVkZSA8cGxhdGZvcm1fb3ZlcnJpZGUuaD4KPiA+ID4gPiA+
ICAjaW5jbHVkZSA8c2JpL3Jpc2N2X2FzbS5oPgo+ID4gPiA+ID4gICNpbmNsdWRlIDxzYmkvc2Jp
X2JpdG9wcy5oPgo+ID4gPiA+ID4gKyNpbmNsdWRlIDxzYmkvc2JpX2RvbWFpbi5oPgo+ID4gPiA+
ID4gICNpbmNsdWRlIDxzYmkvc2JpX2hhcnRtYXNrLmg+Cj4gPiA+ID4gPiAgI2luY2x1ZGUgPHNi
aS9zYmlfaGVhcC5oPgo+ID4gPiA+ID4gICNpbmNsdWRlIDxzYmkvc2JpX3BsYXRmb3JtLmg+Cj4g
PiA+ID4gPiBAQCAtMjc2LDcgKzI3Nyw5IEBAIGludCBnZW5lcmljX2V4dGVuc2lvbnNfaW5pdChi
b29sIGNvbGRfYm9vdCkKPiA+ID4gPiA+ICBpbnQgZ2VuZXJpY19kb21haW5zX2luaXQodm9pZCkK
PiA+ID4gPiA+ICB7Cj4gPiA+ID4gPiAgICAgICAgIGNvbnN0IHZvaWQgKmZkdCA9IGZkdF9nZXRf
YWRkcmVzcygpOwo+ID4gPiA+ID4gLSAgICAgICBpbnQgb2Zmc2V0LCByZXQ7Cj4gPiA+ID4gPiAr
ICAgICAgIGNvbnN0IGZkdDMyX3QgKnZhbDsKPiA+ID4gPiA+ICsgICAgICAgaW50IGxlbiwgb2Zm
c2V0LCByZXQ7Cj4gPiA+ID4gPiArICAgICAgIHU2NCB2YWw2NDsKPiA+ID4gPiA+Cj4gPiA+ID4g
PiAgICAgICAgIHJldCA9IGZkdF9kb21haW5zX3BvcHVsYXRlKGZkdCk7Cj4gPiA+ID4gPiAgICAg
ICAgIGlmIChyZXQgPCAwKQo+ID4gPiA+ID4gQEAgLTI5MCw2ICsyOTMsMjEgQEAgaW50IGdlbmVy
aWNfZG9tYWluc19pbml0KHZvaWQpCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgaWYgKG9mZnNl
dCA+PSAwICYmCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgIGZkdF9nZXRfcHJvcGVydHko
ZmR0LCBvZmZzZXQsICJzeXN0ZW0tc3VzcGVuZC10ZXN0IiwgTlVMTCkpCj4gPiA+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICBzYmlfc3lzdGVtX3N1c3BlbmRfdGVzdF9lbmFibGUoKTsKPiA+
ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBpZiAob2Zmc2V0ID49IDApIHsKPiA+
ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHZhbCA9IGZkdF9nZXRwcm9wKGZkdCwgb2Zm
c2V0LCAicm9vdC1kb21haW4tbmV4dC13aWQiLCAmbGVuKTsKPiA+ID4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGlmICh2YWwgJiYgbGVuID09IHNpemVvZihmZHQzMl90KSkgewo+ID4gPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByb290Lm5leHRfd2lkID0gZmR0MzJf
dG9fY3B1KHZhbFswXSk7Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHJvb3QuaGFzX25leHRfd2lkID0gdHJ1ZTsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIH0KPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHZhbCA9
IGZkdF9nZXRwcm9wKGZkdCwgb2Zmc2V0LCAicm9vdC1kb21haW4tbmV4dC13aWRsaXN0IiwgJmxl
bik7Cj4gPiA+ID4gT3phOiBSb290IGRvbWFpbiBXSUQgY29uZmlnIGlzIHNlbWFudGljYWxseSBp
ZGVudGljYWwgdG8gcGVyLWRvbWFpbgo+ID4gPiA+IFdJRCBjb25maWcgYnV0IGxpdmVzIGluIGEg
Y29tcGxldGVseSBkaWZmZXJlbnQgRFQgbG9jYXRpb24KPiA+ID4gPiByb290IGNhbiBiZSBhbm90
aGVyIGRlZmF1bHQgZG9tYWluIHVuZGVyIGNob3NlbiB7IG9wZW5zYmktZG9tYWlucyB7Cj4gPiA+
Cj4gPiA+IFN1cmUsIGl0IHdvdWxkIGJlIGJldHRlciB0byBoYXZlIHJvb3QgZG9tYWluIHdpZCBj
b25maWd1cmF0aW9uCj4gPiA+IHNwZWNpZmllZCB1bmRlciB0aGUgb3BlbnNiaS1kb21haW4gcGFy
ZW50IG5vZGUgYWxvbmdzaWRlIG90aGVyCj4gPiA+IGRvbWFpbnMuIEkgYWxzbyBhbSBwbGFubmlu
ZyB0byBpbnRyb2R1Y2UgIm9wZW5zYmksZG9tYWluLGluc3RhbmNlLHJvb3QiCj4gPiA+IGNvbXBh
dGlibGUgc3RyaW5nLgo+ID4KPiA+IEFub3RoZXIgYXBwcm9hY2ggaXMgdG8gdHJlYXQgRFQgbm9k
ZSBuYW1lZCAicm9vdCIgdW5kZXIgcGF0aAo+ID4gIi9jaG9zZW4vb3BlbnNiaS1kb21haW5zIiBm
b3IgUklTQy1WIHdvcmxkcyByZWxhdGVkIERUIHByb3BlcnR5Lgo+ID4gSW4gdGhlIGZ1dHVyZSwg
c2FtZSAicm9vdCIgRFQgbm9kZSBjYW4gYmUgdXNlZCBvdGhlciByb290IGRvbWFpbgo+ID4gRFQg
cHJvcGVydGllcy4KPiA+Cj4gPiBSZWdhcmRzLAo+ID4gQW51cAo+ID4KPiA+ID4KPiA+ID4gVGhh
bmtzLAo+ID4gPiBQZXRlciBMaW4KPiA+ID4KPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGlmICh2YWwgJiYgKGxlbiA9PSAoMiAqIHNpemVvZihmZHQzMl90KSkpKSB7Cj4gPiA+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZhbDY0ID0gZmR0MzJfdG9fY3B1KHZh
bFswXSk7Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZhbDY0ID0g
KHZhbDY0IDw8IDMyKSB8IGZkdDMyX3RvX2NwdSh2YWxbMV0pOwo+ID4gPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICByb290Lm5leHRfd2lkbGlzdCA9IHZhbDY0Owo+ID4gPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgfQo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIH0K
PiA+ID4gPiA+ICAgICAgICAgfQo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgICAgICAgcmV0dXJuIDA7
Cj4gPiA+ID4gPiAtLQo+ID4gPiA+ID4gMi40My43Cj4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4g
PiA+IC0tCj4gPiA+ID4gPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+ID4gPiA+ID4gb3BlbnNiaUBs
aXN0cy5pbmZyYWRlYWQub3JnCj4gPiA+ID4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2Jp
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9vcGVuc2JpCg==
