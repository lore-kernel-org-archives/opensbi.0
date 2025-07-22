Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA72C83F25
	for <opensbi@archiver.kernel.org>; Tue, 22 Jul 2025 10:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iGR6CEEUusoVm10gXN6+c+6ew0a7QBL4Jsgs9cgv+7w=; b=plebln1OdWNcYF
	saqxMVdQiKa2e0sbdM3TmcrteItVut0i51jo8Cntv4gtjM5kV+r8xKsLRfJuu454FJAHVZ358+z35
	2R6J4nzTB33htvTBx3P923vuvzPny+Qr9ARYOEe7axplcyZRcMjT78CE23JJgSog3IW9T/NJ97gs3
	Tw1poaFeEKTEYrNPPMjxSjPj1fpme4E8JPYOdsIUZn58ZXWUPXnJ0u1x3ycQG9XKbaM+SrgvrH8U8
	88z+woxmdLe5h6OM7gxz5h9GVdDLnB0fYNcuxxkNx6X2NPDP7II0A11FXoQ8IGJ/g3EQTrEYgyApr
	X7lBQqgzi3+eVrW+4Wbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAUu-00000002Bhw-3Fia;
	Tue, 22 Jul 2025 10:45:24 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAM1-00000002Ajx-22Sl
	for opensbi@lists.infradead.org;
	Tue, 22 Jul 2025 10:36:14 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3e28be470f1so23978245ab.0
        for <opensbi@lists.infradead.org>; Tue, 22 Jul 2025 03:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1753180572; x=1753785372; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LBIS6bcePng2QExEORUvACdl5zinMzwrf/CIPAfx1XU=;
        b=UG0z2XleSmYPfC1C0xeOqOD9pxPMwXSsqvLa8ZYrL0MIzuKC51ZHncOc+FnqGrXSzl
         qACJffkxtkLdoSzLO1lFZpHGijrIGqms5TbFJU6ZNMZD3yNb5/vi+1wIfor57Eu/86D8
         G1aeKooaAwKs4MMjathMkK9Eeb2Bip1/J9UxtRnSEKC5yNSCaex+63lL1SxF98d2rPVg
         4sTN3y8ild/ue+eZNWnXQwRM6uErN//V3YdeuO8i85+/ScjVRIDm1AUOJAQTcVV7vx3b
         pdrqjZvv3n1HGIRG1KOzpRiLpf6AzC2Auz6RQ+apunKH5pP1aSAd5RDiEJcUFrDxnDZ/
         oFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753180572; x=1753785372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBIS6bcePng2QExEORUvACdl5zinMzwrf/CIPAfx1XU=;
        b=tHjDD5t79V/H7JxmQ/f1Iw0QNNMwbYFQRW5ZR/tiOyEiQWWMIloTc749ZmuUrWdwtB
         dYSvqAvAAToGzHEXGsTqFVF+1jB8NFEp11rn/zoAbK9pFRViag8wYQFxVo8DNmg/yJD/
         Y3C4/3h8ekjNZzThLf2w7wx6GVZ+z5qjreeCubNUHxb2BpZ+JqZX70UyL+615Zg01mb1
         Jg3zAZsXfc9QOQjDQuO341A0eUm/4JbUDo/kI4h4qj5AEG8H+CxqMyxI4F7CNXRDkWom
         tjElakxtSOLC4sN30mIih1wOrLHXOkZ3wWKZ0zuG3ABilu/Dbfn/RqIvfvZc60Hto/pL
         bpxQ==
X-Gm-Message-State: AOJu0YzckM3vGrBjz34XiRPlw0B63+3l0AG/LVPWB5qo6Gk+Ke1GMkuG
	OjDTn32G3GZIJ5YMFde5mMqQnOaEeY9KS+pHCwjELraVgeHilNMTW1qw8/8M9Ie8pKo0peQ+sBR
	esO8hT0ovCmrE9BCmOj2X6+S1KZU6dS61im+OmNHujQ==
X-Gm-Gg: ASbGncvtRcAxn1NSQ/UdpiaYZ6HODcPQ+/Rye/KRzCIJo4gKqR8Xdjqwf4BqGDWhZVo
	ZcvseTUahLG8s2+r79/aQckAs38oB0/kMDcVDS5Q/xjecF7+uWPHXCRNeTee8U0KupjIVcm2rLZ
	wGSe8n7f2q8SXPnwVeWh8S8OM6IjmoEigsN7WBcTDXlGWxjOD+sSOwiWorKM4WdBNl/Chjjk6dK
	Mt4kDQ=
X-Google-Smtp-Source: AGHT+IGW2fAJCzjBVApOWi2cL9AgE2DlXBQsl/I/ndz92Jh7KTcp+BcAqcpfN51E/6eVWG0QDmGJunZrtELxdHXY3BM=
X-Received: by 2002:a05:6e02:480f:b0:3de:e74:be13 with SMTP id
 e9e14a558f8ab-3e2be56d8e0mr55824395ab.0.1753180572555; Tue, 22 Jul 2025
 03:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250708180914.1131-1-maherme.dev@gmail.com>
In-Reply-To: <20250708180914.1131-1-maherme.dev@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 22 Jul 2025 16:06:01 +0530
X-Gm-Features: Ac12FXys3pLj_0EaoSvqqKgMG9baIMCqEPja1_oCJSMnkfgI3KP-PyYe7voAFM8
Message-ID: <CAAhSdy0K+dyCU4OoHC1W-trqFwGEoq6+hOm7GGY6oUJ5qwWkJg@mail.gmail.com>
Subject: Re: [PATCH] platform: openpiton: fix uninitialized plic_data struct
To: =?UTF-8?Q?Manuel_Hern=C3=A1ndez_M=C3=A9ndez?= <maherme.dev@gmail.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_033613_759206_209E5526 
X-CRM114-Status: GOOD (  19.48  )
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

T24gV2VkLCBKdWwgOSwgMjAyNSBhdCAxOjEw4oCvQU0gTWFudWVsIEhlcm7DoW5kZXogTcOpbmRl
ego8bWFoZXJtZS5kZXZAZ21haWwuY29tPiB3cm90ZToKPgo+IFRoZSBwbGljX2RhdGEgc3RydWN0
IHdhcyB1bmluaXRpYWxpemVkLiBUaGlzIGxlZCB0byBtaXNmdW5jdGlvbiBiZWhhdmlvcgo+IHNp
bmNlIGl0IHdhcyBzdWJzZXF1ZW50bHkgYXNzaWduZWQgdG8gdGhlIGdsb2JhbCBwbGljIHN0cnVj
dCwgYW5kIHNvbWUKPiBzdHJ1Y3QgZmllbGRzLCBzdWNoIGFzIGZsYWdzIGFuZCBpcnFjaGlwLCBj
b250YWluZWQgcmFuZG9tIHZhbHVlcy4KPiBUaGUgZml4IHByb3Bvc2VzIHRvIGluaXRpYWxpemUg
dGhlIHBsaWNfZGF0YSB0byB0aGUgZ2xvYmFsIHBsaWMgc3RydWN0LAo+IHNvLCBhZnRlciBwYXJz
aW5nIHRoZSBmZHQsIHRoZSBmaWVsZHMgb2YgdGhlIHN0cnVjdCB3aWxsIGJlIHNldCB0byB0aGUK
PiBkZWZhdWx0IHZhbHVlcyBzZXQgaW4gZ2xvYmFsIHBsaWMgc3RydWN0IGRlZmluaXRpb24sIG9y
IHRoZSBwYXJzZWQgdmFsdWVzCj4gaW4gdGhlIGZkdCwgb3IgemVyby4KPgo+IEZpeGVzOiA0YzM3
NDUxICgicGxhdGZvcm06IG9wZW5waXRvbjogUmVhZCB0aGUgZGV2aWNlIGNvbmZpZ3VyYXRpb25z
IGZyb20KPiBkZXZpY2UgdHJlZSIpCj4gU2lnbmVkLW9mZi1ieTogTWFudWVsIEhlcm7DoW5kZXog
TcOpbmRleiA8bWFoZXJtZS5kZXZAZ21haWwuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVw
IFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSBy
aXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIHBsYXRmb3JtL2ZwZ2Ev
b3BlbnBpdG9uL3BsYXRmb3JtLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2ZwZ2Evb3BlbnBp
dG9uL3BsYXRmb3JtLmMgYi9wbGF0Zm9ybS9mcGdhL29wZW5waXRvbi9wbGF0Zm9ybS5jCj4gaW5k
ZXggZDJjZjNlMzIuLmZhYTI5OWNlIDEwMDY0NAo+IC0tLSBhL3BsYXRmb3JtL2ZwZ2Evb3BlbnBp
dG9uL3BsYXRmb3JtLmMKPiArKysgYi9wbGF0Zm9ybS9mcGdhL29wZW5waXRvbi9wbGF0Zm9ybS5j
Cj4gQEAgLTc5LDcgKzc5LDcgQEAgc3RhdGljIGludCBvcGVucGl0b25fZWFybHlfaW5pdChib29s
IGNvbGRfYm9vdCkKPiAgewo+ICAgICAgICAgY29uc3Qgdm9pZCAqZmR0Owo+ICAgICAgICAgc3Ry
dWN0IHBsYXRmb3JtX3VhcnRfZGF0YSB1YXJ0X2RhdGEgPSB7IDAgfTsKPiAtICAgICAgIHN0cnVj
dCBwbGljX2RhdGEgcGxpY19kYXRhOwo+ICsgICAgICAgc3RydWN0IHBsaWNfZGF0YSBwbGljX2Rh
dGEgPSBwbGljOwo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBhY2xpbnRfZnJlcTsKPiAgICAgICAg
IHVpbnQ2NF90IGNsaW50X2FkZHI7Cj4gICAgICAgICBpbnQgcmM7Cj4gLS0KPiAyLjM0LjEKPgo+
Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoK
LS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
