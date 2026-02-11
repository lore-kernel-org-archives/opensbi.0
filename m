Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0ABECD6D0
	for <opensbi@archiver.kernel.org>; Wed, 11 Feb 2026 17:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A41lpAmCDdAUYFAtBbroZhx2o3h1zWNKN/pwgxnV1as=; b=17JICgErl0KBaa
	dOm3MVVjiZf9dEWXb+2dfSEoAzmOPWhCPMN5e9esndkzl5UBsoSUv+v5YvZ3GNSTiNbUieKTeGvgg
	2Y6msBsei82H92Zbgwj8u5A2BfQxt2DZvl1bYpfqt/KDNSU8c8gDAWYK0oxY/8koZcLgT2ROe4Bvm
	yU6M3/rOk+JnuJqMtIS7FgNL623ZTVe0RjzmYU4fWF4RQruhskA9wnwxZAzCT10R0LXHyAyPIXHGS
	kBssI5Ccou30SUWpRj89Kf5jtjTblV/900xy4ONoYaBA/Cr3lHm62sPyNhWi4LKsv4yQQj9fd0ZOT
	m9tC1CQrQ6NROC+aQkQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqELv-00000000v2M-0h9z;
	Wed, 11 Feb 2026 17:50:15 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqELs-00000000v1v-1om2
	for opensbi@lists.infradead.org;
	Wed, 11 Feb 2026 17:50:13 +0000
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-5fa3f2b8f7dso830829137.0
        for <opensbi@lists.infradead.org>; Wed, 11 Feb 2026 09:50:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770832211; cv=none;
        d=google.com; s=arc-20240605;
        b=CeUpmkyMAiRXoxvlNRLJcUWKrDHH82BZ95CP+bu0fU2msyYl9EVcutpvtJan23jG4I
         eJiqIFWIKI7Ibz7D5IAMI9Xx+RAxbHKP5xac7aPBFavmtsVpcjfv/j8QQzGz4TiGyc4l
         NettWps49MZk24OtgIilzfpN2MSE66AZ5osD9WiignzfErXG5J/jvawSZoQN5YmwkvxS
         UciEPCFvOwWPxJ5BpTI5n9VSkd9zgG8/v9yVnQXdGroMekYaFNHl0hqv3/AY7p5qvZ4D
         wZf4zpVAYXUmknASeNgrfJ47VNIC1LhDxfx4awBgqsm5IL5XQqwgbguEVqvbIiwhRBgw
         XKkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pn8sDMNsgGsb6+fW0fOqB9P2pV423vVfx//UP6CsNxU=;
        fh=J1rgPW0WwnTPzoulgQAL56i8/FC24vd7rtwmhSx9LnE=;
        b=IcmcuQ6yVQoQgA24NyLV6v7Ckq0FseOM8y/l1b+cHhgDk7x9DuMLTgypkOLiprjyV4
         C1hU2sFqZGvgDKDW2DZyj2lh0wepK3hJ1R8IPnAIRYSf5GUDOv1HXq+Du4kPQ/qnZALK
         Phm6U+6Op1ZKiQX6Z05bkBCLXxWifCLisB0jujzshHXOlwhwrHSWDJpXmZaJwDvLFCRv
         IDhsMr6ApZix+up87DWuAEp2JudaRqCRc82c+g7+e7YxeSlTiJzdA9MlGEwyP7LOlKP7
         YgDGMIlyBQFKbqNGfdXcV2nrP++0RlpIta0sp9JsSeq/v60PbkD6RF1KEZLN6rJM++6f
         m4Ig==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770832211; x=1771437011; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pn8sDMNsgGsb6+fW0fOqB9P2pV423vVfx//UP6CsNxU=;
        b=Ewf9dAHUTuD2JqXKvj4I17birKYjoRLyHpe0xOWTgoqCRGET3/1p/l1tUzkL5K6/Tv
         xDAhL778ArJ2DJurQC/KhK3DtgNE/zTXcYgGjlOcQpKTlgun1agJ7xA0oE/9uI2ONli7
         EGYn5gL18nbdamSqVat9wFDCnJar7QgEDkhJX1BdAqmfA+xWCodOABU7oIvwLGn6UFX+
         hao+SKied5d/I3KA+DN3ZtiwqmGToK20QmlzN92nCUwHUKJMZXL5Oyq9KoW625Wd7NLg
         7AkIjiKo3SbayrGO/2lVHWCYb9PHMpNfsJUOwzLQwrzgCzStBTn3yOl2Zg/6W0HQRD+W
         WvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770832211; x=1771437011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pn8sDMNsgGsb6+fW0fOqB9P2pV423vVfx//UP6CsNxU=;
        b=oTMUSfz4b+wua2MBkkH/KRgiZ45LfW4W3nhGODrVA+cYhLVYLgQnkyhhWGLhS20HHo
         oBcaFdquPUJsmF+2m82mslY9UCrZGHqx7fw9zJNKYk+j7qKA9YWnF1xgD36NHSBdqIXH
         dRysuqXCwWuIQbFXzy2tPRWy5cNjgr3YQPCZjpH22KUaPZwFgqIC/pmnKUJCPqRUP7cs
         18V/bb1cjKBr/I7daao1YeFZ5Jj8OKjE/cIbaK/ZJJF9hyu3HDLqmj+1QwrqzkgoKkpJ
         bPofYw2vLEoNK0eKD3SJK2IbWlsR88H2ApbHcdEiuS9+ivSq+CrMXU1W5BzJ9Rl5j4gF
         09IA==
X-Forwarded-Encrypted: i=1; AJvYcCXyLlNm7Nz3Nw9XiNVLKbzrf8GROfrUCXXp7C3x7+vpnlK5j2r53cZvgnMnHcw2rQEhuTkJVpVT@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2Ymp1lL0J9Sqq4Hih5HEymSElLJDRY+BPn1F9LqrFOLjx5nVR
	OsUBV+3ZDnKdAXAmbqqaLgDy51JM/ImxM4edCMHZE25xB8CHKOBxygwvhXPD77hZUdMbqv1zXcs
	a230nGXJJ7X0vbew+K+JZ3+m6rNAxVjE=
X-Gm-Gg: AZuq6aJ1yM5tORhoqTOfxEUSZ/MXBmiSJi1pEx1CzURJFTN5hKiajvG8ExGaLConJxZ
	fbbV7IE/SrSk1Zs7HdYBR/+BwmKSKSQiqwc45nypwH3hr4irlNh+7dtHKKbPv3Tu3D5+ExldraD
	OmBVt8Pwsta6pOBKfiPGuWZYgQpqWhd4cT5oUd4o0AkHdAmsbSW57Qih7p1ePW0yinhnDmxB05U
	/jNTogkBYUXYqFQ3sJhSxIOFc+6/oZuutc378yx+/TbaYfcfibjndzQGI2iRGQ+F9GTENQGGWup
	dSrDSp20
X-Received: by 2002:a05:6102:41a5:b0:5ef:a1ea:bd33 with SMTP id
 ada2fe7eead31-5fc467af9bdmr2404841137.9.1770832210594; Wed, 11 Feb 2026
 09:50:10 -0800 (PST)
MIME-Version: 1.0
References: <20260207102602.2917520-1-anup.patel@oss.qualcomm.com>
 <20260207102602.2917520-6-anup.patel@oss.qualcomm.com> <0f55c5db-929f-4192-994a-8432c5bda1b4@gmail.com>
 <CAAhSdy26XNCbfDhe8EpK-AWMneyS=Hpwo8mb7vC1zrcVhBMKPQ@mail.gmail.com>
 <CAMDkj5yiHTa3uwZ8NHXTj-6LGOKPdyH36AoY1L0cVzXmvyb6PQ@mail.gmail.com> <CAAhSdy1GRzGC4nV1F-gEPTjOgegHYWd6312mf7gvhXqT+L9+1g@mail.gmail.com>
In-Reply-To: <CAAhSdy1GRzGC4nV1F-gEPTjOgegHYWd6312mf7gvhXqT+L9+1g@mail.gmail.com>
From: Raymond Mao <raymondmaoca@gmail.com>
Date: Wed, 11 Feb 2026 12:49:59 -0500
X-Gm-Features: AZwV_QjQKGBnuGrevQixmLO0nK3dQbD6NLsLKMXltjY06WX-LuRRO76PV3ynu04
Message-ID: <CAMDkj5wQmMNrzLaqrQz_u46ecC4BBz3C71eUAco8eB6RXcrOKQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] lib: sbi_irqchip: Support irqchip device targetting
 subset of harts
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Atish Patra <atish.patra@linux.dev>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Dave Patel <dave.patel@riscstar.com>, 
	Samuel Holland <samuel.holland@sifive.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_095012_496350_FF4AB0AC 
X-CRM114-Status: GOOD (  37.44  )
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

SGkgQW51cCwKCk9uIFdlZCwgRmViIDExLCAyMDI2IGF0IDEwOjQz4oCvQU0gQW51cCBQYXRlbCA8
YW51cEBicmFpbmZhdWx0Lm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEZlYiAxMSwgMjAyNiBhdCA4
OjMy4oCvUE0gUmF5bW9uZCBNYW8gPHJheW1vbmRtYW9jYUBnbWFpbC5jb20+IHdyb3RlOgo+ID4K
PiA+IEhpIEFudXAsCj4gPgo+ID4gT24gVHVlLCBGZWIgMTAsIDIwMjYgYXQgMTE6MDnigK9BTSBB
bnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gVHVl
LCBGZWIgMTAsIDIwMjYgYXQgMTo1NeKAr0FNIFJheW1vbmQgTWFvIDxyYXltb25kbWFvY2FAZ21h
aWwuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IEhpIEFudXAsCj4gPiA+ID4KPiA+ID4gPiBP
biAyMDI2LTAyLTA3IDU6MjUgYS5tLiwgYW51cC5wYXRlbCBhdCBvc3MucXVhbGNvbW0uY29tIChB
bnVwIFBhdGVsKSB3cm90ZToKPiA+ID4gPiA+IEl0IGlzIHBvc3NpYmxlIHRvIGhhdmUgcGxhdGZv
cm0gd2hlcmUgYW4gaXJxY2hpcCBkZXZpY2UgdGFyZ2V0cwo+ID4gPiA+ID4gYSBzdWJzZXQgb2Yg
aGFydHMgYW5kIHRoZXJlIGFyZSBtdWx0aXBsZSBpcnFjaGlwIGRldmljZXMgdG8gY292ZXIKPiA+
ID4gPiA+IGFsbCBoYXJ0cy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUbyBzdXBwb3J0IHRoaXMgc2Nl
bmFyaW86Cj4gPiA+ID4gPiAxKSBBZGQgdGFyZ2V0X2hhcnRzIGhhcnRtYXNrIHRvIHN0cnVjdCBz
YmlfaXJxY2hpcF9kZXZpY2Ugd2hpY2gKPiA+ID4gPiA+ICAgICByZXByZXNlbnRzIHRoZSBzZXQg
b2YgaGFydHMgdGFyZ2V0dGVkIGJ5IHRoZSBpcnFjaGlwIGRldmljZQo+ID4gPiA+ID4gMikgQ2Fs
bCB3YXJtX2luaXQoKSBhbmQgaXJxX2hhbmRsZSgpIGNhbGxiYWNrcyBvZiBhbiBpcnFjaGlwIGRl
dmljZQo+ID4gPiA+ID4gICAgIG9uIGEgaGFydCBvbmx5IGlmIGlycWNoaXAgZGV2aWNlIHRhcmdl
dHMgdGhhdCBwYXJ0aWN1bGFyIGhhcnQKPiA+ID4gPiA+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBBbnVwIFBhdGVsIDxhbnVwLnBhdGVsIGF0IG9zcy5xdWFsY29tbS5jb20+Cj4gPiA+ID4gPiAt
LS0KPiA+ID4gPiA+ICAgaW5jbHVkZS9zYmkvc2JpX2lycWNoaXAuaCB8ICA4ICsrKysrLS0KPiA+
ID4gPiA+ICAgbGliL3NiaS9zYmlfaXJxY2hpcC5jICAgICB8IDQ4ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLQo+ID4gPiA+ID4gICBsaWIvdXRpbHMvaXJxY2hpcC9hcGxp
Yy5jIHwgMTIgKysrKysrKysrLQo+ID4gPiA+ID4gICBsaWIvdXRpbHMvaXJxY2hpcC9pbXNpYy5j
IHwgIDcgKysrKy0tCj4gPiA+ID4gPiAgIGxpYi91dGlscy9pcnFjaGlwL3BsaWMuYyAgfCAgNSAr
Ky0tCj4gPiA+ID4gPiAgIDUgZmlsZXMgY2hhbmdlZCwgNTkgaW5zZXJ0aW9ucygrKSwgMjEgZGVs
ZXRpb25zKC0pCj4gPiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3Ni
aV9pcnFjaGlwLmggYi9pbmNsdWRlL3NiaS9zYmlfaXJxY2hpcC5oCj4gPiA+ID4gPiBpbmRleCBj
ZGExZTUwZi4uYzNkZWQyNzEgMTAwNjQ0Cj4gPiA+ID4gPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlf
aXJxY2hpcC5oCj4gPiA+ID4gPiArKysgYi9pbmNsdWRlL3NiaS9zYmlfaXJxY2hpcC5oCj4gPiA+
ID4gPiBAQCAtMTAsNiArMTAsNyBAQAo+ID4gPiA+ID4gICAjaWZuZGVmIF9fU0JJX0lSUUNISVBf
SF9fCj4gPiA+ID4gPiAgICNkZWZpbmUgX19TQklfSVJRQ0hJUF9IX18KPiA+ID4gPiA+Cj4gPiA+
ID4gPiArI2luY2x1ZGUgPHNiaS9zYmlfaGFydG1hc2suaD4KPiA+ID4gPiA+ICAgI2luY2x1ZGUg
PHNiaS9zYmlfbGlzdC5oPgo+ID4gPiA+ID4gICAjaW5jbHVkZSA8c2JpL3NiaV90eXBlcy5oPgo+
ID4gPiA+ID4KPiA+ID4gPiA+IEBAIC0yMCwxMSArMjEsMTQgQEAgc3RydWN0IHNiaV9pcnFjaGlw
X2RldmljZSB7Cj4gPiA+ID4gPiAgICAgICAvKiogTm9kZSBpbiB0aGUgbGlzdCBvZiBpcnFjaGlw
IGRldmljZXMgKi8KPiA+ID4gPiA+ICAgICAgIHN0cnVjdCBzYmlfZGxpc3Qgbm9kZTsKPiA+ID4g
PiA+Cj4gPiA+ID4gPiArICAgICAvKiogU2V0IG9mIGhhcnRzIHRhcmdldHRlZCBieSB0aGlzIGly
cWNoaXAgKi8KPiA+ID4gPiA+ICsgICAgIHN0cnVjdCBzYmlfaGFydG1hc2sgdGFyZ2V0X2hhcnRz
Owo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gICAgICAgLyoqIEluaXRpYWxpemUgcGVyLWhhcnQgc3Rh
dGUgZm9yIHRoZSBjdXJyZW50IGhhcnQgKi8KPiA+ID4gPiA+ICAgICAgIGludCAoKndhcm1faW5p
dCkoc3RydWN0IHNiaV9pcnFjaGlwX2RldmljZSAqY2hpcCk7Cj4gPiA+ID4gPgo+ID4gPiA+ID4g
ICAgICAgLyoqIFByb2Nlc3MgaGFyZHdhcmUgaW50ZXJydXB0cyBmcm9tIHRoaXMgaXJxY2hpcCAq
Lwo+ID4gPiA+ID4gLSAgICAgaW50ICgqcHJvY2Vzc19od2lycXMpKHZvaWQpOwo+ID4gPiA+ID4g
KyAgICAgaW50ICgqcHJvY2Vzc19od2lycXMpKHN0cnVjdCBzYmlfaXJxY2hpcF9kZXZpY2UgKmNo
aXApOwo+ID4gPiA+ID4gICB9Owo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgLyoqCj4gPiA+ID4gPiBA
QCAtMzgsNyArNDIsNyBAQCBzdHJ1Y3Qgc2JpX2lycWNoaXBfZGV2aWNlIHsKPiA+ID4gPiA+ICAg
aW50IHNiaV9pcnFjaGlwX3Byb2Nlc3Modm9pZCk7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gICAvKiog
UmVnaXN0ZXIgYW4gaXJxY2hpcCBkZXZpY2UgdG8gcmVjZWl2ZSBjYWxsYmFja3MgKi8KPiA+ID4g
PiA+IC12b2lkIHNiaV9pcnFjaGlwX2FkZF9kZXZpY2Uoc3RydWN0IHNiaV9pcnFjaGlwX2Rldmlj
ZSAqY2hpcCk7Cj4gPiA+ID4gPiAraW50IHNiaV9pcnFjaGlwX2FkZF9kZXZpY2Uoc3RydWN0IHNi
aV9pcnFjaGlwX2RldmljZSAqY2hpcCk7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gICAvKiogSW5pdGlh
bGl6ZSBpbnRlcnJ1cHQgY29udHJvbGxlcnMgKi8KPiA+ID4gPiA+ICAgaW50IHNiaV9pcnFjaGlw
X2luaXQoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoLCBib29sIGNvbGRfYm9vdCk7Cj4gPiA+
ID4gPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaXJxY2hpcC5jIGIvbGliL3NiaS9zYmlfaXJx
Y2hpcC5jCj4gPiA+ID4gPiBpbmRleCAzYjk3MDUyNy4uNzdlYzA1YWYgMTAwNjQ0Cj4gPiA+ID4g
PiAtLS0gYS9saWIvc2JpL3NiaV9pcnFjaGlwLmMKPiA+ID4gPiA+ICsrKyBiL2xpYi9zYmkvc2Jp
X2lycWNoaXAuYwo+ID4gPiA+ID4gQEAgLTEzLDI0ICsxMyw0NCBAQAo+ID4gPiA+ID4KPiA+ID4g
PiA+ICAgc3RhdGljIFNCSV9MSVNUX0hFQUQoaXJxY2hpcF9saXN0KTsKPiA+ID4gPiA+Cj4gPiA+
ID4gPiAtc3RhdGljIGludCBkZWZhdWx0X2lycWZuKHZvaWQpCj4gPiA+ID4gPiAraW50IHNiaV9p
cnFjaGlwX3Byb2Nlc3Modm9pZCkKPiA+ID4gPiA+ICAgewo+ID4gPiA+ID4gLSAgICAgcmV0dXJu
IFNCSV9FTk9ERVY7Cj4gPiA+ID4gPiAtfQo+ID4gPiA+ID4gKyAgICAgc3RydWN0IHNiaV9pcnFj
aGlwX2RldmljZSAqY2hpcDsKPiA+ID4gPiA+ICsgICAgIGludCByYyA9IFNCSV9FTk9ERVY7Cj4g
PiA+ID4gPgo+ID4gPiA+ID4gLXN0YXRpYyBpbnQgKCpleHRfaXJxZm4pKHZvaWQpID0gZGVmYXVs
dF9pcnFmbjsKPiA+ID4gPiA+ICsgICAgIHNiaV9saXN0X2Zvcl9lYWNoX2VudHJ5KGNoaXAsICZp
cnFjaGlwX2xpc3QsIG5vZGUpIHsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgaWYgKCFjaGlwLT5w
cm9jZXNzX2h3aXJxcykKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsK
PiA+ID4gPiA+ICsgICAgICAgICAgICAgaWYgKCFzYmlfaGFydG1hc2tfdGVzdF9oYXJ0aW5kZXgo
Y3VycmVudF9oYXJ0aW5kZXgoKSwgJmNoaXAtPnRhcmdldF9oYXJ0cykpCj4gPiA+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gPiA+ID4gPiArICAgICAgICAgICAgIHJjID0g
Y2hpcC0+cHJvY2Vzc19od2lycXMoY2hpcCk7Cj4gPiA+ID4gPiArICAgICAgICAgICAgIGlmIChy
YykKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+ID4gPiA+ICsgICAg
IH0KPiA+ID4gPiA+Cj4gPiA+ID4gPiAtaW50IHNiaV9pcnFjaGlwX3Byb2Nlc3Modm9pZCkKPiA+
ID4gPiA+IC17Cj4gPiA+ID4gPiAtICAgICByZXR1cm4gZXh0X2lycWZuKCk7Cj4gPiA+ID4gPiAr
ICAgICByZXR1cm4gcmM7Cj4gPiA+ID4gPiAgIH0KPiA+ID4gPiA+Cj4gPiA+ID4gPiAtdm9pZCBz
YmlfaXJxY2hpcF9hZGRfZGV2aWNlKHN0cnVjdCBzYmlfaXJxY2hpcF9kZXZpY2UgKmNoaXApCj4g
PiA+ID4gPiAraW50IHNiaV9pcnFjaGlwX2FkZF9kZXZpY2Uoc3RydWN0IHNiaV9pcnFjaGlwX2Rl
dmljZSAqY2hpcCkKPiA+ID4gPiA+ICAgewo+ID4gPiA+ID4gLSAgICAgc2JpX2xpc3RfYWRkX3Rh
aWwoJmNoaXAtPm5vZGUsICZpcnFjaGlwX2xpc3QpOwo+ID4gPiA+ID4gKyAgICAgc3RydWN0IHNi
aV9pcnFjaGlwX2RldmljZSAqYzsKPiA+ID4gPiA+ICsgICAgIHN0cnVjdCBzYmlfaGFydG1hc2sg
aG07Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICBpZiAoIWNoaXAgfHwgIXNiaV9oYXJ0bWFz
a193ZWlnaHQoJmNoaXAtPnRhcmdldF9oYXJ0cykpCj4gPiA+ID4gPiArICAgICAgICAgICAgIHJl
dHVybiBTQklfRUlOVkFMOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgaWYgKGNoaXAtPnBy
b2Nlc3NfaHdpcnFzKSB7Cj4gPiA+ID4gPiArICAgICAgICAgICAgIHNiaV9saXN0X2Zvcl9lYWNo
X2VudHJ5KGMsICZpcnFjaGlwX2xpc3QsIG5vZGUpIHsKPiA+ID4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICBpZiAoIWMtPnByb2Nlc3NfaHdpcnFzKQo+ID4gPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY29udGludWU7Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
c2JpX2hhcnRtYXNrX2FuZCgmaG0sICZjLT50YXJnZXRfaGFydHMsICZjaGlwLT50YXJnZXRfaGFy
dHMpOwo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGlmIChzYmlfaGFydG1hc2tfd2Vp
Z2h0KCZobSkpCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
U0JJX0VJTlZBTDsKPiA+ID4gPgo+ID4gPiA+IEkgdGVzdGVkIHRoaXMgYnkgcmVnaXN0ZXJpbmcg
YSAncHJvY2Vzc19od2lycXMnIGhvb2ssIGJ1dAo+ID4gPiA+ICdzYmlfaGFydG1hc2tfd2VpZ2h0
JyByZXR1cm5zIGVycm9ycy4KPiA+ID4KPiA+ID4gVGhpcyBsb29wIGVuc3VyZXMgdGhhdCBpcnFj
aGlwcyB3aGljaCBkaXJlY3RseSBjb25uZWN0Cj4gPiA+IHRvIGV4dGVybmFsIGludGVycnVwdCBs
aW5lIG9mIGhhcnRzIChha2EgaXJxY2hpcHMgd2hpY2gKPiA+ID4gaW1wbGVtZW50IHByb2Nlc3Nf
aHdpcnFzKSBkb24ndCBoYXZlIG92ZXJsYXBwaW5nCj4gPiA+IHRhcmdldF9oYXJ0cy4KPiA+ID4K
PiA+Cj4gPiBJZiBteSB1bmRlcnN0YW5kaW5nIGlzIGNvcnJlY3QsIHRoaXMgbWVhbnMgb25seSBz
aW5nbGUgcHJvY2Vzc19od2lycXMKPiA+IGNhbiBiZSByZWdpc3RlcmVkIGZvciBhIHRhcmdldCBo
YXJ0IC0gaWYgSU1TSUMgcmVnaXN0ZXJlZCBpdCB0aGVuIGl0Cj4gPiByZWplY3RzIHdoZW4gQVBM
SUMgdHJpZXMgdG8gcmVnaXN0ZXIgaXRzIG93biBwcm9jZXNzX2h3aXJxcy4KPgo+IFRoYXQncyBy
aWdodC4KPgo+IEFQTElDIG11c3QgcmVnaXN0ZXIgaXRzIG93biBwcm9jZXNzX2h3aXJxcygpIG9u
bHkgd2hlbiBpdCBpcwo+IGluIERJUkVDVCBtb2RlLgo+Cj4gT24gcGxhdGZvcm1zIHdpdGggSU1T
SUMrQVBMSUMsIHRoZSBBUExJQyB3aWxsIGJlIGluIE1TSSBtb2RlCj4gc28gaW4gdGhpcyBjYXNl
IEFQTElDIG11c3Qgbm90IHJlZ2lzdGVyIHByb2Nlc3NfaHdpcnFzKCkuCj4KPiA+IEJ1dCBhY2Nv
cmRpbmcgdG8gb3VyIHVzZSBjYXNlLCBlYWNoIGlycWNoaXAgc2hvdWxkIGJlIGFsbG93ZWQgdG8K
PiA+IHJlZ2lzdGVyIGl0cyBvd24gb3BlcmF0aW9uIGhvb2tzLCBpbmNsdWRpbmcgcHJvY2Vzc19o
d2lycXMuCj4gPiBUaGVuIHRoZSBJTVNJQydzIHByb2Nlc3NfaHdpcnFzIGhhbmRsZXMgTVNJLCB3
aGlsZSB0aGUgQVBMSUMncwo+ID4gcHJvY2Vzc19od2lycXMgaGFuZGxlcyB3aXJlZCBleHQgaW50
ZXJydXB0LCB0aGV5IGRvbid0IG92ZXJsYXAgZWFjaAo+ID4gb3RoZXIuCj4gPiBJIHdvdWxkIHN1
Z2dlc3QgYWxsb3dpbmcgbXVsdGlwbGUgcHJvY2Vzc19od2lycXMgaG9va3MgZm9yIG9uZSB0YXJn
ZXQgaGFydC4KPgo+IFlvdXIgdW5kZXJzdGFuZGluZyBpcyBub3QgY29ycmVjdC4gUGxlYXNlIHNl
ZSB0aGUgYWJvdmUgY29tbWVudC4KPgo+IEluIHlvdXIgdXNlLWNhc2UsIHlvdSBoYXZlIEFQTElD
IGluIERJUkVDVCBtb2RlIHdpdGhvdXQgYW55Cj4gSU1TSUMuCj4KCkluIEFQTElDLCBJIGNhbiBh
ZGQgYSBjb25kaXRpb246CmBgYAppZiAoIWFwbGljLT5oYXNfbXNpY2ZnX21tb2RlICYmICFhcGxp
Yy0+aGFzX21zaWNmZ19zbW9kZSkKYXBsaWMtPmlycWNoaXAucHJvY2Vzc19od2lycXMgPSBhcGxp
Y19wcm9jZXNzX2h3aXJxcywKYGBgCnRvIG1ha2Ugc3VyZSBwcm9jZXNzX2h3aXJxcyBpcyByZWdp
c3RlcmVkIHdoZW4gdGhlcmUgYXJlIG5vIElNU0lDIGNvbmZpZ3MuCgpCdXQgaW4gSU1TSUMgc2lk
ZSwgd2UgbmVlZCB0byBjaGVjayB0aGUgZXhpc3RlbmNlIG9mIGFuIElNSVNDIG5vZGUKYmVmb3Jl
IHJlZ2lzdGVyaW5nIHByb2Nlc3NfaHdpcnFzLgpGb3IgZXhhbXBsZSwgd2hlbiBydW5uaW5nIFFF
TVUgd2l0aCBgLU0gdmlydCxhaWE9YXBsaWNgLCB0aGVyZSBpcyBubwpJTVNJQyBub2RlIGFuZCBp
dCBzaG91bGQgc2tpcCByZWdpc3RlcmluZyBwcm9jZXNzX2h3aXJxcywgYnV0IEkgdGhpbmsKdGhp
cyBwYXJ0IGlzIG1pc3NpbmcgYXQgdGhlIG1vbWVudC4KClJlZ2FyZHMsClJheW1vbmQKCgo+IFJl
Z2FyZHMsCj4gQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29w
ZW5zYmkK
