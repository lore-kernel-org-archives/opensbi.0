Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BDCC71155
	for <opensbi@archiver.kernel.org>; Mon, 16 Jun 2025 12:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eh/RHr48s0a0dqxE1E1OgLy/Z9aV2aEs3dGZ94qMa5I=; b=ALppI/RhRproVF
	c7LidMYyba7Z7JlnRiYftRbe8Ens9MXUcZz5x1kO192GFb6knY5G4pUWNtnf9D+D2GaX1UShgBDPC
	Bd/Ud7kjSorMdenYKdtYRYpb7Zq7O+iG0OekG4ef+9FF7UGQlPU1Syr/tkck2GpOYKzDsSS5jRsHU
	NwX2VxnHESKJ7dme2G4ptiqchKlQxZoyfbfZTXfBB8dSquSrrPF7WpSPkjBV0n71TGSned8/q/pac
	IaVykri1Uqzut5AhzROKY8dUOBTpi+/aE83er3DYq2B4ADZ7gsw8yzBrr+qCFIQGVtHCC7GOrZPoy
	9B0q0rPSEWlXir5hNe2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9Pg-00000004S6X-2YpX;
	Mon, 16 Jun 2025 12:58:12 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8Ra-00000004GNO-16jF
	for opensbi@lists.infradead.org;
	Mon, 16 Jun 2025 11:56:07 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3ddd38ee5b8so40238555ab.1
        for <opensbi@lists.infradead.org>; Mon, 16 Jun 2025 04:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1750074965; x=1750679765; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OpVItuHMzASM87mF57rgy+WdUwEapHvHmawsj23E1g4=;
        b=1JAYJ2AIknfMdc3tD34B7jF5kLKK7bBfPYYBI1k0fUqjMSzyAM/DD074Ww7lVEcuJb
         1mdRxLjEZC5YkRZilW+9pWLYv+jh9J8+LS1CxGWWfRMT65atlWqtw9IDpu8t07glOZZf
         gAuiSui2/t+vL1pRhRZeWKeh2DuszndZWr/OoQnTSvQRqvrGiWQSwL0gGj6nqzY0Am/n
         IAmlBlmrGjTwaEnkVSYu7NoX+UBS0T6VZXKCEv9qJMNxKJYuKEf+lBej/s49QBfsFeV1
         rY0WOLDq/QAGepUXzZ62pQ8OcCNLF66E0BjQZ7azMmpgNDdL3Gd6LqRB7S3Nnx71+TjA
         yUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750074965; x=1750679765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OpVItuHMzASM87mF57rgy+WdUwEapHvHmawsj23E1g4=;
        b=s16dAz7HD9RJHj5VGEh0vfBgMKbBcAEMj4iWsPOyaiKl7rrGxjPtBitZUUNnHzmWmm
         Fy+dIHZ1dX5EuN+nONmwE0Cvhwk6Wm14sw09SXBnv3FvjRr3yto8pPf1pzUGOdFPIsye
         yDSUibZU8H33oZwBpyxVeHd6NcuPv4g2cq6Kh1TWlf+EMNZWe4bfWIBa6y7Lb+88Stc8
         BZoT7lTe1c7k1UEf1r3DAnC1ShVU6hLfp5HGqd5wxKtGopAul0QuMgRzdcAX6L3/+yS1
         c7DIZTyelUR9AuDPRZ/m9O0YsjoaNPDIez/cQs+wK3BNzywQgZRC1vcpgfdZjYc1RhEK
         bQyQ==
X-Gm-Message-State: AOJu0YzO6PWcFGXz9jGafLArj4woQIbHAflGtfHMaoSqacaDFwuPGy7+
	EJhMQdlqccbbZGUZFMS012bdU0jYzGncQkcMd8o2Y32ji6YTBGWu/SPwigYY4P8jN7s1S3GiWBM
	nOqGE8LIoHucKgz+MwXNDuxmov7m0rM4Uu4/bGhtNB9yqxJq/aU0kEaQ=
X-Gm-Gg: ASbGncttP1ZJxNx4d44A1C8Qjw6jXjWwkVF4ZxbIMg8fJizDzSVDPhC3dDOEXMpLg1g
	P3inuNMRSXqBFrog8O9RQ1uvDhdSZ6HvlcXKBDrkgtD7NDugFyFEHtC9UjxxIFEOJdwFMVfD0AW
	aMAFF+hLjy8Xuc4sij75xj9L7q7hDZ2rUmAYwa/oL9KkvmR5LtuJUPRd1foKg3uDIyv/lMcqODu
	oOg
X-Google-Smtp-Source: AGHT+IFbdl7sLrBg7Tbw+ppWcK3++2hG6Rg2pgeeWS7g9s4xiFG91CA2S35SswIAsQxiCFb13A/fv3Te0ILNooLmz0g=
X-Received: by 2002:a05:6e02:2401:b0:3dd:f3e1:2899 with SMTP id
 e9e14a558f8ab-3de07c3718amr107098655ab.2.1750074965211; Mon, 16 Jun 2025
 04:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250611121236.937455-1-wxjstz@126.com>
In-Reply-To: <20250611121236.937455-1-wxjstz@126.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 16 Jun 2025 17:25:54 +0530
X-Gm-Features: AX0GCFtd3QECnusWnSyOiavDN-N8tt4rg35PSVCkijrweh4fWN-bcqnLt0P1oGE
Message-ID: <CAAhSdy2woTUMuEQUZ-DDysuZGo5j=iCM29351kiMFmH1ciuBOw@mail.gmail.com>
Subject: Re: [PATCH 00/12] Some improvements on boot sequence
To: Xiang W <wxjstz@126.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_045606_310446_DA4C3FDA 
X-CRM114-Status: GOOD (  13.62  )
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

T24gV2VkLCBKdW4gMTEsIDIwMjUgYXQgNTo0MuKAr1BNIFhpYW5nIFcgPHd4anN0ekAxMjYuY29t
PiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIG9mIHBhdGNoZXMgbWFpbmx5IG1lcmdlcyBpbml0X2Nv
bGRib290IGFuZCBpbml0X3dhcm1fc3RhcnR1cCwKClRoZSBleGlzdGluZyBjb2RlIG9mIGhhdmlu
ZyBjbGVhcmx5IHNlcGFyYXRlIGNvbGRib290LCB3YXJtX3N0YXJ0dXAsIGFuZAp3YXJtX3Jlc3Vt
ZSBwYXRocyBhcmUgc3RyYWlnaHRmb3J3YXJkIHRvIHVuZGVyc3RhbmQgYW5kIG1haW50YWluLiBF
dmVuLApMaW51eCBoYXMgc2VwYXJhdGUgc3RhcnRfa2VybmVsKCkgKGZvciBib290L3ByaW1hcnkg
SEFSVCksIHNtcF9jYWxsaW4oKQooZm9yIG5vbi1ib290L3NlY29uZGFyeSBIQVJUcykgYW5kIF9f
Y3B1X3Jlc3VtZV9lbnRlcigpIChmb3IgSEFSVApyZXN1bWUpLgoKPiBhbmQgc2VwYXJhdGVzIHNi
aV9oc21faGFydF93YWl0IGZyb20gc2JpX2hzbV9pbml0LCBzbyB0aGF0IG5vbi1jb2xkYm9vdAo+
IEhBUlQgY2FuIHBlcmZvcm0gbW9yZSBpbml0aWFsaXphdGlvbiB0YXNrcyBiZWZvcmUgZW50ZXJp
bmcgSFNNIHdhaXQuIEluCj4gb3JkZXIgdG8gaW1wcm92ZSBzb21lIG11bHRpIEhBUlRzIHJlbGF0
ZWQgY29kZXMuCgpQZXJmb3JtaW5nIG1vcmUgaW5pdGlhbGl6YXRpb24gb24gbm9uLWNvbGRib290
IEhBUlQgYmVmb3JlCnNiaV9oc21faGFydF93YWl0KCkgaXMgcmVkdW5kYW50IGJlY2F1c2Ugbm9u
LWNvbGRib290IEhBUlQKd2lsbCBoYXZlIHRvIGFueXdheSB3YWl0IHVudGlsIGNvbGRib290IEhB
UlQgdXNlcyBTQkkgSFNNCnN0YXJ0IGNhbGwuCgpPbiB0aGUgY29udHJhcnksIGRvaW5nIHNiaV9o
c21faGFydF93YWl0KCkgYXMgdGhlIGZpcnN0IHRoaW5nIGZvcgpub24tY29sZGJvb3QgSEFSVCBl
bnN1cmVzIHRoYXQgSEFSVCBpcyBmdWxseSBpbml0aWFsaXplZCBvbmx5CmFmdGVyIGNvbGRib290
IEhBUlQgZGVjaWRlcyB0byBicmluZyBpdCB1cCAodmlhIFNCSSBIU00gc3RhcnQpCndoaWNoIGFs
c28gZW5hYmxlcyB1cyB0byBwb3dlcm9mZiBub24tY29sZGJvb3QgSEFSVCBvbgpwbGF0Zm9ybXMg
d2l0aCBmdWxsIGhhcnQtaG90cGx1Zy4KCj4KPiBYaWFuZyBXICgxMik6Cj4gICBsaWI6IHNiaTog
QWRkIGNvbGRib290IHBhcmFtZXRlcnMgdG8gc29tZSBpbml0aWFsaXphdGlvbiBmdW5jdGlvbnMK
PiAgIGxpYjogc2JpOiBPcHRpbWlzZSB0aGUgYm9vdCBzZXF1ZW5jZQo+ICAgbGliOiBzYmk6IElt
cGxlbWVudCBzeW5jaHJvbmlzYXRpb24gYW5kIHdhaXQgYmV0d2VlbiBtdWx0aXBsZSBIQVJUcwo+
ICAgbGliOiBzYmk6IFJlbW92ZSB3YWl0X2Zvcl9jb2xkYm9vdCBhbmQgd2FrZV9jb2xkYm9vdF9o
YXJ0cwo+ICAgbGliOiBzYmk6IEFkZCB3YWl0IG9wZXJhdGlvbnMgaW4gc29tZSBpbml0aWFsaXph
dGlvbiBmdW5jdGlvbnMKPiAgIGxpYi91dGlsczogTWFrZSBmZHRfcGFyc2VfaXNhX2V4dGVuc2lv
bnMgcmVlbnRyYW50Cj4gICBsaWI6IHNiaTogSW5pdGlhbGl6ZSBhcyBtdWNoIGFzIHBvc3NpYmxl
IGJlZm9yZSBzYmlfaHNtX2luaXQKPiAgIGxpYjogc2JpOiBSZW1vdmUgY29sZF9ib290IGZyb20g
c2JpX2hzbV9pbml0Cj4gICBsaWI6IHNiaTogRW5zdXJlIHRoYXQgYWxsIEhhcnRzIGNvbXBsZXRl
IHNiaV9oYXJ0X2luaXQKPiAgIGxpYi91dGlsczogRml4IFppY250ciBkZXRlY3Rpb24gaW4gZmR0
X2NwdV9maXh1cAo+ICAgbGliOiBzYmk6IEZpeCBkdGJyIGluaXRpYWxpemF0aW9uCj4gICBsaWI6
IHNiaTogUmVtb3ZlIGNvbGRfYm9vdCBmcm9tIHNiaV9kb3VibGVfdHJhcF9pbml0CgpUaGlzIGFs
bCBzZWVtcyB1bm5lY2Vzc2FyeSBjaHVybiBhbmQgSSBzdGlsbCBmaW5kIGl0IGhhcmQKdG8gdW5k
ZXJzdGFuZCB0aGUgdW5kZXJseWluZyBwcm9ibGVtLgoKPgo+ICBpbmNsdWRlL3NiaS9zYmlfZG9t
YWluLmggICB8ICAgMiArLQo+ICBpbmNsdWRlL3NiaS9zYmlfaGFydC5oICAgICB8ICAgNiArCj4g
IGluY2x1ZGUvc2JpL3NiaV9oc20uaCAgICAgIHwgICA1ICstCj4gIGluY2x1ZGUvc2JpL3NiaV9t
cHh5LmggICAgIHwgICAyICstCj4gIGxpYi9zYmkvc2JpX2RidHIuYyAgICAgICAgIHwgIDMyICsr
Ky0KPiAgbGliL3NiaS9zYmlfZG9tYWluLmMgICAgICAgfCAgIDkgKy0KPiAgbGliL3NiaS9zYmlf
ZG91YmxlX3RyYXAuYyAgfCAgIDcgKy0KPiAgbGliL3NiaS9zYmlfZWNhbGxfZGJ0ci5jICAgfCAg
IDIgKy0KPiAgbGliL3NiaS9zYmlfZndmdC5jICAgICAgICAgfCAgIDMgKwo+ICBsaWIvc2JpL3Ni
aV9oYXJ0LmMgICAgICAgICB8ICA3NyArKysrKysrKystCj4gIGxpYi9zYmkvc2JpX2hzbS5jICAg
ICAgICAgIHwgIDUxICsrKy0tLS0KPiAgbGliL3NiaS9zYmlfaW5pdC5jICAgICAgICAgfCAzMDYg
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBsaWIvc2JpL3NiaV9pcGku
YyAgICAgICAgICB8ICAgMyArCj4gIGxpYi9zYmkvc2JpX2lycWNoaXAuYyAgICAgIHwgICA1ICst
Cj4gIGxpYi9zYmkvc2JpX21weHkuYyAgICAgICAgIHwgICA0ICstCj4gIGxpYi9zYmkvc2JpX3Bt
dS5jICAgICAgICAgIHwgICAzICsKPiAgbGliL3NiaS9zYmlfc3NlLmMgICAgICAgICAgfCAgIDMg
Kwo+ICBsaWIvc2JpL3NiaV90aW1lci5jICAgICAgICB8ICAgMyArCj4gIGxpYi9zYmkvc2JpX3Rs
Yi5jICAgICAgICAgIHwgICAzICsKPiAgbGliL3V0aWxzL2ZkdC9mZHRfZml4dXAuYyAgfCAgMjQg
Ky0tCj4gIGxpYi91dGlscy9mZHQvZmR0X2hlbHBlci5jIHwgICA0ICsKPiAgMjEgZmlsZXMgY2hh
bmdlZCwgMzAwIGluc2VydGlvbnMoKyksIDI1NCBkZWxldGlvbnMoLSkKPgo+IC0tCj4gMi40Ny4y
Cj4KClJlZ2FyZHMsCkFudXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9vcGVuc2JpCg==
