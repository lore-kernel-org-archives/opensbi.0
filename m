Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8FEC531C9
	for <opensbi@archiver.kernel.org>; Sat, 25 Jul 2026 02:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5LJZb9mZSjibxy9faiNdnd51euqOJ1f5Na2hsxBMqg4=; b=cA2UjDTjkneTBq
	Igy8twHIZb1piJdB2mdrIUnm73cAbOF+wXzgG3XETY17aQE8JtRri9U2FWjljYH9FllqgTaHJ3MRw
	mnCA0xmJYJAms/fo21KkASs+r++AhS1jCY+kbtdgaC+s8pxqywHMVoHjX7K+4GIlp6kb288YIGm6W
	Zehq+GoH9RJP5+ksCKpWo8jTTMY7izD8qPrvxyu2ReNXCAMAxp9A7CNz3JVOAyAexjKYoHdsK+D60
	0pNy7ETFvS7OgwzAPF41p+i8+jaGh6G7O4FSVU8f6ag4Ql37BeRApijv3VpgoH9yNMuaQyDommVn6
	GhDz80ICQujCxliQJ7vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnSVU-0000000HV5F-3gZC;
	Sat, 25 Jul 2026 02:52:56 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnSVS-0000000HV4r-20G3
	for opensbi@lists.infradead.org;
	Sat, 25 Jul 2026 02:52:56 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-74ab6c88052so430814137.2
        for <opensbi@lists.infradead.org>; Fri, 24 Jul 2026 19:52:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784947973; cv=none;
        d=google.com; s=arc-20260327;
        b=G/9lbPd8F7sLjkTiNUKh+UanU6+pStSdtU5z1RjBZgvqTHcG0jF1cak28gCZdwM03x
         sA4HWtEKdv+UXlvrJHQX5impc3ETBNqDt7JiE/YMyksLZJVZO30fq3C4eVv4n95sDxLk
         GnYVw3dp2dPusx37AykMUsbsq40rgEbFA5UkVJWG+bWHQBCtuYLIgVa+k5AtuvvMTeeR
         6jidhFgzeO5k22ArbeDBrcjmXt+XobPrpnXox99NSGMND7hbjlgAilowtKc5rB64ouvN
         BBlAuA0K+Tg7/J0jEgH3V5LTNW+TgsJpB/0kmB422fvo3Yn+BiEZ6phUNE4OTzm6m2PK
         IAQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0fZuGJBWNR3GZLLfcP50yXxTo5Scmg6UVYKYl8niiZk=;
        fh=ZHC1jv6cLtiyt7BdpK0AAolkVqV52ALs/6Wb+AV85eQ=;
        b=qqdXHTrq/IJwSheb3yPcNgwCIPH+wfgp7ZCiojdBSXs63Y8sUNX/MXVYb7B8tsU0+F
         336BPg6+GbJrFAZgUIP+m2DOlbUro9nqgQIBf2xMoK+fB+U+iWWcYgJuj64mETLgNIQN
         Bfh87uQs213dgynbxmgYw/zHKIrqjht4WDzYu7l0CRnHwX/o59S7oPWAkHzKaNue9nKV
         rEyCozdRJh+9nUZScy+JwAzOWkRppLPX62QiW/E5REoXT5wVCRkq/uCKps48EPTjAAzl
         LqsRzty8OiID8yOXUAFQOX1e8lTiRO9m2QRzLaRAckklYiVv28eVvNftdzbEfJDzphZy
         hbPA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784947973; x=1785552773; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0fZuGJBWNR3GZLLfcP50yXxTo5Scmg6UVYKYl8niiZk=;
        b=nTLOjdX/23l+xXWEXJpPvzk2D23H6ZGFKSI/wyW+IJldw5nt36xpOxuKNyVJqcDafe
         yiTNourLIF8kXvGEuOBkEOBbJFWdBNjaOlMpjL0hBVvqZ0BSfpDa9pydV9n+wuJheHaH
         QyFuoW+/RUKBsqJb1PNkLCHKazM/LS39iadlcjsF8muF9l8gP0QiWnoXl6AzT/bI2t+S
         kuq1woXaZCbMqnudpNKxTqSbEP8SbD4+rV7yFT+hMY11r1OCmcXkIc2kX4s4/TiOPZYp
         a7JWXzeEdP/gaAHxsutBrcJJeXq/krtyy8vW2KeCO6LBTUEPXLJSp8mkzQeI0WxOXWx+
         5U4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784947973; x=1785552773;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0fZuGJBWNR3GZLLfcP50yXxTo5Scmg6UVYKYl8niiZk=;
        b=PqeZsdMQhQNQomYkrrsoo3KK6SgDvM0aXXUY1hWiNNlLQS4Z9b3ZJheKiQMSc/rN4y
         dFx6KsG2kGNPhTjfIGX+9rINb7dpGx6FM/e46KuZW/Zs/J3D6/A0OjWHqQGlJuDBFZ5J
         Z9gBqE9gJMDsNr47qM3g0x9SKcCsmC/qX7nts3KzzljX424tiT+bZ6ulWJ4lAE6P4fP0
         t36KEUEqTanM5juC96ciwzUcZ3XWiiBzXVc7FTYi/1634uZczybkKpymaJrPyjC5zo5v
         4wjPz+b19Q9YeKlu/D9hmEKqlr5MTikxl+oRPRBCSdhPB8hCZ8ms7arH+2eLzhXcfJgz
         pvSg==
X-Forwarded-Encrypted: i=1; AHgh+RrcG9a2tgvy67niE070wTmoDlWQXrxl1FOHa43tGvw56nfZMvhYpK6kdd/7QAX3Qp7r2+WQqmz3@lists.infradead.org
X-Gm-Message-State: AOJu0YyuJTcKI9kpbQMRK5lAIkymP9XyV0pLI6/7l3gN3Yx2tI+wL38m
	LFLqBKQgggrGoWK38sXJYqZvz1hbR6ljDjgBcQvPemzYP5/nsbK6K4FAtoHlL/lIcvSnyEilEH7
	LhPyBp316zjJ3JaNSnahnCkwsqyJ1HDU=
X-Gm-Gg: AR+sD11aAuSY5SJ7kR8HEO4uCGS2BRfdr6Mnj0LkzAVCQFVDSvqrpQiQw0DxCTPEsxy
	DNSglCHK0tAoZb1w5zQUZPsBeKLVcdcbOZCNdsAmwRhcVLzZ9xvlZPP0h8OrmEWaTDei3s2vJ/H
	eKpKNOSN2Lqn1kxn4w03bG4rxwPVDxIBA1/1cmDUg5zJDSCA6WO4FCghWG6dLmM7719/HCaEa0Q
	IgqB2+VOXWx2wny6i3jK0fZHkqUfqjW4KaZzgwBLI0szP/VCz474a00SSv1bA==
X-Received: by 2002:a05:6102:15a1:b0:720:7e04:b306 with SMTP id
 ada2fe7eead31-7503e06a7d6mr907703137.5.1784947972999; Fri, 24 Jul 2026
 19:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260519203331.2773185-1-raymondmaoca@gmail.com>
 <CAAhSdy1i+1oxkP5XdMJCzjgze3sZ0SSxZ-jzcFJSNPHQfSjm-Q@mail.gmail.com>
 <CAMDkj5ytwo-zQvx_eMMBE6nA4BkN_b2_R3LFykxrb-A78avJfQ@mail.gmail.com> <CAHZsQ-N0uQAiOkdDx0JHJ7iSivBLL3Vnu_OOO3R=mGaMdgDUWA@mail.gmail.com>
In-Reply-To: <CAHZsQ-N0uQAiOkdDx0JHJ7iSivBLL3Vnu_OOO3R=mGaMdgDUWA@mail.gmail.com>
From: Raymond Mao <raymondmaoca@gmail.com>
Date: Fri, 24 Jul 2026 22:52:41 -0400
X-Gm-Features: AUfX_myYfL5v61z9XVFCBwozSNa9fd-6brfU2tmAi7daIsp1XoxsA6Ze1xi9m40
Message-ID: <CAMDkj5zg3HjEb_DMjBXYNF1nDY2d+j474T1YrW2_KHb_ps9r7A@mail.gmail.com>
Subject: Re: [PATCH 0/7] Add WorldGuard hwiso support
To: Peter Lin <peter.lin@sifive.com>
Cc: Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org, scott@riscstar.com, 
	dave.patel@riscstar.com, raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, anup.patel@qti.qualcomm.com, 
	anuppate@qti.qualcomm.com, dhaval@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_195254_562741_DC802DAF 
X-CRM114-Status: GOOD (  27.17  )
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

SGkgUGV0ZXIgYW5kIEFudXAsCgpPbiBUdWUsIEp1bCAyMSwgMjAyNiBhdCAyOjMy4oCvQU0gUGV0
ZXIgTGluIDxwZXRlci5saW5Ac2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBUaGFua3MgUmF5bW9uZCwK
Pgo+IEZvciB0aGUgV29ybGRHdWFyZCBjaGVja2VyIHBhcnQsIHdlIGFyZSBzdGlsbCBhZGRyZXNz
aW5nCj4gcmV2aWV3ZXIgZmVlZGJhY2sgWzFdLiBQbGVhc2UgZXhwZWN0IGNoYW5nZXMgdGhhdCBt
YXkKPiBpbXBhY3QgeW91ciBpbXBsZW1lbnRhdGlvbiBpbiBPcGVuU0JJLgo+Cj4gWzFdIGh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1yaXNjdi9wYXRjaC8yMDI2MDYx
OTEwNTgzNC4xMjc3MzAyLTQtcGV0ZXIubGluQHNpZml2ZS5jb20vCj4KCkkgaGF2ZSBwb3N0ZWQg
YSB2MiBzZXJpZXMgIltQQVRDSCB2MiAwLzRdIEFkZCBXb3JsZEd1YXJkIHN1cHBvcnQgd2l0aAp3
Z2NoZWNrZXIyIiBbMV0gYmFzZWQgb24gQW51cCdzIHNlcmllcyBbMl0gYW5kIFBldGVyJ3MgRFQt
YmluZGluZyBSRkMKWzNdLgpBbGwgaW1wbGVtZW50YXRpb25zIG9mIFdHIGFyZSBvbiB0b3Agb2Yg
c2JpX2hhcnRfcHJvdGVjdGlvbiBhbmQgc2JpX2RvbWFpbl9kYXRhLgpQbGVhc2Uga2luZGx5IHBy
b3ZpZGUgeW91ciBmZWVkYmFjay4KClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9vcGVuc2Jp
LzIwMjYwNzI1MDIzODIxLjM3OTU2MTgtMS1yYXltb25kbWFvY2FAZ21haWwuY29tLwpbMl0gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb3BlbnNiaS8yMDI2MDcxNzA3NDQxMy4yNTM2NDE2LTEtYW51
cC5wYXRlbEBvc3MucXVhbGNvbW0uY29tLwpbM10gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wcm9qZWN0L2xpbnV4LXJpc2N2L2xpc3QvP3Nlcmllcz0xMTEzODgxCgpUaGFua3MgYW5kIHJl
Z2FyZHMsClJheW1vbmQKCgoKCj4gT24gTW9uLCBKdWwgMjAsIDIwMjYgYXQgMTE6MDnigK9QTSBS
YXltb25kIE1hbyA8cmF5bW9uZG1hb2NhQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Cj4+IEhpIEFudXAs
Cj4+Cj4+IE9uIE1vbiwgSnVsIDIwLCAyMDI2IGF0IDQ6NDHigK9BTSBBbnVwIFBhdGVsIDxhbnVw
QGJyYWluZmF1bHQub3JnPiB3cm90ZToKPj4gPgo+PiA+IE9uIFdlZCwgTWF5IDIwLCAyMDI2IGF0
IDI6MDPigK9BTSBSYXltb25kIE1hbyA8cmF5bW9uZG1hb2NhQGdtYWlsLmNvbT4gd3JvdGU6Cj4+
ID4gPgo+PiA+ID4gRnJvbTogUmF5bW9uZCBNYW8gPHJheW1vbmQubWFvQHJpc2NzdGFyLmNvbT4K
Pj4gPiA+Cj4+ID4gPiBUaGlzIHNlcmllcyBhZGRzIFdvcmxkR3VhcmQgaW1wbGVtZW50YXRpb24g
Zm9yIE9wZW5TQkkgb24gdG9wIG9mIHRoZQo+PiA+ID4gZ2VuZXJpYyBoYXJkd2FyZSBpc29sYXRp
b24gKEhXSVNPKSBob29rcy4KPj4gPiA+Cj4+ID4gPiBUaGUgZ29hbCBpcyB0byBsZXQgT3BlblNC
SToKPj4gPiA+IC0gcHJvZ3JhbSBwbGF0Zm9ybSBXb3JsZEd1YXJkIGNoZWNrZXIgc3RhdGUgYXQg
Ym9vdAo+PiA+ID4gLSBwYXJzZSBwZXItZG9tYWluIFdvcmxkR3VhcmQgbWV0YWRhdGEgZnJvbSB0
aGUgZGV2aWNlIHRyZWUKPj4gPiA+IC0gcmVwcm9ncmFtIGhhcnQgV29ybGRHdWFyZCBydW50aW1l
IHN0YXRlIGR1cmluZyBkb21haW4gdHJhbnNpdGlvbnMKPj4gPiA+Cj4+ID4gPiBUaGUgY3VycmVu
dCBpbXBsZW1lbnRhdGlvbiB0YXJnZXRzIHRoZSBXb3JsZEd1YXJkIG1vZGVsIG9mCj4+ID4gPiBg
c2lmaXZlLHdnY2hlY2tlcjJgIGNoZWNrZXIgcGx1cyBwZXItaGFydCBhbmQgcGVyLWRvbWFpbiBX
b3JsZEd1YXJkCj4+ID4gPiBtZXRhZGF0YSBmcm9tIERULgo+PiA+ID4KPj4gPiA+IFRoZSBzZXJp
ZXMgaXMgb3JnYW5pemVkIGFzIGZvbGxvd3M6Cj4+ID4gPiAxLiBhZGQgdGhlIFdvcmxkR3VhcmQg
Q1NSIGRlZmluaXRpb25zIGFuZCBoYXJ0IGV4dGVuc2lvbiBmbGFncyBuZWVkZWQKPj4gPiA+ICAg
IHRvIGRldGVjdCBzdXBwb3J0IGZvciBNTFdJRCwgTVdJRERFTEVHLCBhbmQgU0xXSUQKPj4gPiA+
IDIuIGRvY3VtZW50IHRoZSBIV0lTTyAvIFdvcmxkR3VhcmQgZGV2aWNlLXRyZWUgbWV0YWRhdGEg
dXNlZCBieSB0aGUKPj4gPiA+ICAgIGN1cnJlbnQgaW1wbGVtZW50YXRpb24KPj4gPiA+IDMuIGFk
ZCBhIFFFTVUgdmlydCBEVCBvdmVybGF5IHRoYXQgZGVzY3JpYmVzIGRvbWFpbiBXSUQvV0lEIGxp
c3QKPj4gPiA+ICAgIGFzc2lnbm1lbnQgYW5kIGNoZWNrZXIgcGVybWlzc2lvbiBwb2xpY3kgZm9y
IHRoZSBjdXJyZW50IHRlc3QgZmxvdwo+PiA+ID4gNC4gYWRkIGdlbmVyaWMtcGxhdGZvcm0gV29y
bGRHdWFyZCBydW50aW1lIHN1cHBvcnQgdG9nZXRoZXIgd2l0aAo+PiA+ID4gICAgYHdnY2hlY2tl
cjJgIGNoZWNrZXIgcGFyc2luZyBhbmQgYm9vdC10aW1lIE1NSU8gcHJvZ3JhbW1pbmcKPj4gPiA+
IDUuIGFkZCBnZW5lcmljIEhXSVNPIFNCSVVOSVQgY292ZXJhZ2UKPj4gPiA+IDYuIGFkZCBRRU1V
IHZpcnQgV29ybGRHdWFyZCBtZWNoYW5pc20tc3BlY2lmaWMgU0JJVU5JVCBjaGVja3MgZm9yCj4+
ID4gPiAgICBib290LXRpbWUgY2hlY2tlciBwcm9ncmFtbWluZyBhbmQgcnVudGltZSBDU1Igc3Rh
dGUKPj4gPiA+IDcuIGFkZCBhIFFFTVUgdmlydCBmYWlsdXJlLW1vZGUgU0JJVU5JVCB0ZXN0IHRo
YXQgaW50ZW50aW9uYWxseQo+PiA+ID4gICAgdHJpZ2dlcnMgYSBkZW5pZWQgV29ybGRHdWFyZCBh
Y2Nlc3MgYW5kIHZlcmlmaWVzIHRoZSBleHBlY3RlZCB0cmFwCj4+ID4gPgo+PiA+ID4gTm90ZXM6
Cj4+ID4gPiAtIFRoZSBpbXBsZW1lbnRhdGlvbiBoYXMgYmVlbiB2ZXJpZmllZCB3aXRoIFFFTVUg
dmlydCB0aGF0IHN1cHBvcnRzCj4+ID4gPiAgIGB3Zz1vbmBbMV0uCj4+ID4gPiAtIFRoaXMgc2Vy
aWVzIGRlcGVuZHMgb24gcHJldmlvdXMgcGF0Y2hlcyAoWzJdIGFuZCBbM10pIGZvcgo+PiA+ID4g
ICBpbnRyb2R1Y2luZyBIV0lTTyBmcmFtZXdvcmsuCj4+ID4gPgo+PiA+ID4gWzFdIGh0dHBzOi8v
Z2l0aHViLmNvbS9jd3NodS9xZW11L3RyZWUvcmlzY3Ytd2ctZHRzCj4+ID4gPiBbMl0gW1BBVENI
IDEvMl0gc2JpOiBhZGQgaGFyZHdhcmUgaXNvbGF0aW9uIGFic3RyYWN0aW9uIGZyYW1ld29yawo+
PiA+ID4gICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29wZW5zYmkvMjAyNjA1MDQxNzM5NDgu
MTY2MzgyMy0xLXJheW1vbmRtYW9jYUBnbWFpbC5jb20vCj4+ID4gPiBbM10gW1BBVENIIDIvMl0g
c2JpOiByb3V0ZSBkb21haW4gbGlmZWN5Y2xlIHRyYW5zaXRpb25zIHRocm91Z2ggaHdpc28gaG9v
a3MKPj4gPiA+ICAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9vcGVuc2JpLzIwMjYwNTA0MTcz
OTQ4LjE2NjM4MjMtMi1yYXltb25kbWFvY2FAZ21haWwuY29tLwo+PiA+ID4KPj4gPiA+IFJheW1v
bmQgTWFvICg3KToKPj4gPiA+ICAgaGFydDogYWRkIFdvcmxkR3VhcmQgQ1NSIElEcyBhbmQgaGFy
dCBleHRlbnNpb24gZmxhZ3MKPj4gPiA+ICAgZG9jczogZG9jdW1lbnQgaHdpc28gV29ybGRHdWFy
ZCBEVCBiaW5kaW5ncwo+PiA+ID4gICBbTk9ULUZPUi1VUFNUUkVBTV0gcGxhdGZvcm06IHZpcnQ6
IGFkZCBRRU1VIFdvcmxkR3VhcmQgaHdpc28gb3ZlcmxheQo+PiA+ID4gICBwbGF0Zm9ybTogZ2Vu
ZXJpYzogYWRkIFdvcmxkR3VhcmQgaHdpc28gc3VwcG9ydCB3aXRoIHdnY2hlY2tlcjIKPj4gPiA+
ICAgdGVzdDogYWRkIGdlbmVyaWMgaHdpc28gU0JJIHVuaXQgY292ZXJhZ2UKPj4gPiA+ICAgcGxh
dGZvcm06IHZpcnQ6IGFkZCBRRU1VIHZpcnQgV29ybGRHdWFyZCBod2lzbyB0ZXN0cwo+PiA+ID4g
ICBwbGF0Zm9ybTogdmlydDogYWRkIFdvcmxkR3VhcmQgSFdJU08gZmFpbHVyZS1tb2RlIFNCSVVO
SVQgdGVzdAo+PiA+Cj4+ID4gSSB3aWxsIGNvbnNpZGVyIHRoaXMgc2VyaWVzIHN1cGVyc2VkZWQg
YnkgIkFkZCBSSVNDLVYgV29ybGRzIElTQQo+PiA+IHN1cHBvcnQgdG8gT3BlblNCSSIgcG9zdGVk
IGJ5IFl1LUNoZWluIFBldGVyIExpbiAoU2lGaXZlKS4KPj4gPgo+Pgo+PiBOb3QgcmVhbGx5LCB0
aGUgb25lIGZyb20gUGV0ZXIgaXMgd2l0aCB0aGUgSVNBIGFuZCBEVC1iaW5ncyBidXQKPj4gd2l0
aG91dCB0aGUgV0cgaW1wbGVtZW50YXRpb25zLgo+PiBCdXQgSSB3aWxsIHJlYmFzZSBteSBzZXJp
ZXMgb24gdG9wIG9mIGhpcyBvbmUgYW5kIHNlbmQgYSB2Mi4KPj4KPj4gUmVnYXJkcywKPj4gUmF5
bW9uZAo+Pgo+PiA+IFJlZ2FyZHMsCj4+ID4gQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0
Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
