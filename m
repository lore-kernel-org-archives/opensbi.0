Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036E5F5512F
	for <opensbi@archiver.kernel.org>; Sun,  8 Mar 2026 04:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0hNJhpP2SjI4v0IC8ACluxrBFVtPIa2skI4Njt/7L/k=; b=xhk12tESzI4L2K
	dzrruPfwJj4lrzb/eZw/wA/X8Y1u5tlSm59vczbb7bbcQ0azKkRQI3NkRjEk8CD33AD/PEbDf7MIg
	gyZLfsMTBc6S4c73ovC8obKhFwlqe3xKby/sGwZiDJW7drKJCioAO2FQxh8k0HHcO/qfgs2QPI1Mz
	VzSmHEat5mwviBqkmnMxQ1g72EHvnERM390wJht8oo6bl0EHbP8uh6Yy6rsCkrWCkuxA+H+Unltrr
	HOu2/bbwjcBcNTy2FVMP/OT7/76BCAjG/10NxgaSqimY4r8+wfSN3mast7ScfGAmLc75+ft1zN0IT
	vUQ5O2GTKpw+gn7sqYAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz5uF-00000005hWU-2E2f;
	Sun, 08 Mar 2026 04:38:19 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz5uC-00000005hVn-3Srb
	for opensbi@lists.infradead.org;
	Sun, 08 Mar 2026 04:38:17 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-67bb19ac35aso4478eaf.1
        for <opensbi@lists.infradead.org>; Sat, 07 Mar 2026 20:38:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772944695; cv=none;
        d=google.com; s=arc-20240605;
        b=jPKJuXriRQjQtxe1t79qBjL63O4WSAag7eb3/So6KLDe/TZ4Z26ZcNzQSYqLV16xQ2
         IBB1MABLiikgK9Kyw5000gE74Ii8yY+K1A3Gl/5Yy0qBsF6sNsJnNYTyjCgFnXQObj0O
         baPXu9689Ip8V6jP43+S+oQ6DE2/WRPTo8YxXSIYOHKXm9XRbM7MtvkAhxJRpBUvkeWD
         yuJRrv0q6hKtYyPxB5d0fdgPST7BKQNLDL1Yzgcg7O5B0Kk39r19EYNssAanL1yOsJ24
         +s4P1RJqh86TwHks18q/bTuwIhIUNw1PTqVHz2bY8j9j5wCKXhZROu5CYHx1SAAQRy7W
         fwiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7tdW4zp+2MN7Ufe5ForKT60FFPnCD7Mt1SrykuRV2pA=;
        fh=lICAF/3RHHDyTUaDZtG1kerQI6qm1d+a0SVpV5aEtX8=;
        b=WfhIe7FusSAJ0FoVWWEYf+efEyyEK2SGErk4K4Ztc55ZOzuXpoIyV+Pi6kzK1EWCKj
         gGIzwQU0XAaiF2B74y4QMQSVevvBaF8Z149Fjc6qs9QOJbV4mdKoCsUlOWztlaFNi6+z
         mk7TYeJDQsoNHFB8vrm23CwyiJRBiJTTPRQxzYg7Cpz1kRctBvKpF0q+K9GCL7t9iZiH
         Ni7yr6ZzCPnQeDnfio7QZ7nq4TmVhULvK5egIR4BXthl3FnxTX+K3HrzjrFSEgiKbdbn
         VBESYuqhpPxEJ5NNvIfm0JiZI30KSOFdOOY4nVG3U9HCIysnS5Io970X7NBh9uEZxTac
         y2gQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772944695; x=1773549495; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tdW4zp+2MN7Ufe5ForKT60FFPnCD7Mt1SrykuRV2pA=;
        b=ztuQGe9jTu0TpQz6ibveliH9pxQJg8m7QQVqOE8UPaamQVit0Tsf8iFdL6qsMDieyE
         TpduimWOPNKsIR3Amq6OaGXURKBOq5gtOxWBjzp34H8DrfJ3ufU0gVWTChNPRy+LHaga
         bihYqCF+BwM16fM/ObA9jmE8ozGBXgpPXgP4GNPKMp3ZWPw9pa3lW/CQduValOAwmiX6
         SlLh4EZWOnHIDLZVJHTYLPQNvp7PBxiV4GJJpvpiXWO6XKWnV9jd/tlLh69Jcmq8TsLz
         Z1R7sIMdECqMrW4Yum+TfKSz9VFUMgWfw+1oddm8tmIJaSSC4PP58MJcbR6P3jzuJXJu
         wkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772944695; x=1773549495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7tdW4zp+2MN7Ufe5ForKT60FFPnCD7Mt1SrykuRV2pA=;
        b=gcIFd7JsFHgWBMILKQ1IiYzltkqdn7x/evYlVaTDwWEsfsBPgU6I+ElrpleWi2YdOH
         FM87WSLjahWKPw3Qf/rN3GeqMsAP/WY+r2UgQJMiTi4tck9zfyiCTRgt6aGvKpK4hOXr
         yWr1sGLNfo41yHOR8KB74grIOdkjE/jfmg8N2f2op/CbkNilCEujL981SZLgMqnX4bVj
         4fUEJzBe3DOYJKbj61KEFMXQCWxfGqZcl6cEfB6HFeMJsclg7Pk6aAnN71ziEjyoSy/X
         61Ljb1YHzNCDWmaxQcwB4xw2xeiOwQ8LK0fAzKHhsJcA64YxtZY8KR/eBb5ltLA6lLxB
         pV7g==
X-Forwarded-Encrypted: i=1; AJvYcCUxg2/XalzWA3TDcv3PK5f+RBCO4QfCT1jEGnlJ33Z03/gzhwOpCruEJ7ruD5ZabNUKjB+qty3s@lists.infradead.org
X-Gm-Message-State: AOJu0YzCkBfEaWXVOm3Lm3bDsb7jo7eFMMwS7KWLjkeEXB9gqDbdhrwf
	C/ieRaJ+KepRhr/+y3LT8JzqBC68TycUI226NZzG5uljPAVgl7CUy9RXxwQZLndfTGGWj074jWF
	qdV+yMFSu3veVuDUX/e+EJQXrBetAgSTYxALQI2rm3Q==
X-Gm-Gg: ATEYQzxmo//TEoU9mjsws1Nauvxas2W8qtB7K1j2n94hlTn6HDVDirDOvWfwdol+zdu
	OUPsOZG6KZnfBT8Y76aoZDe9xf3I5sne6B+MfLoOmsXZMPCDkQDSPewpQ2/+gGJintAzw9J7Zm4
	XekSpQdiT8JNVUAAB1KyZrp/OawveHJrGW7H9lg73yL3UiFD/HHLyPP2c0vaXtNvKJvBp9XFEty
	YMgPkTOoF3brGMVmvd3/WkPHSyncaJ6PQTU31MmBYgOEs1PI+b1zdhYPlhMF8381mIbePH/uzUq
	SUJCSESJERkXfFH0MG704vv2KcqdY6ppx3lwqC+G7VF0EWkGP/WclMD0kS6bi/8yrW6pqMyy3yi
	Xt3V2EutCWJC7+JntL9Zzj+icyg==
X-Received: by 2002:a05:6820:1890:b0:679:9392:ddfd with SMTP id
 006d021491bc7-67b9bca1df6mr4343081eaf.30.1772944695513; Sat, 07 Mar 2026
 20:38:15 -0800 (PST)
MIME-Version: 1.0
References: <20260129-smrnmi-v3-v1-0-5d297d3e2027@sifive.com>
 <20260129-smrnmi-v3-v1-3-5d297d3e2027@sifive.com> <DG4K5AOGY1J9.1BWQ6O7XEY7S1@qti.qualcomm.com>
 <CAHh=Yk-qMtg7y1PVaWqyBSOg6fOAh2iaWFkf=9+RgJqV5u581A@mail.gmail.com>
In-Reply-To: <CAHh=Yk-qMtg7y1PVaWqyBSOg6fOAh2iaWFkf=9+RgJqV5u581A@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 8 Mar 2026 10:08:01 +0530
X-Gm-Features: AaiRm50Ez5ZdI_0h6vR6JZ7IT5Otxr1Nz0QP0FSMjZJ1EHM2vvn4vPHCwGp9me0
Message-ID: <CAAhSdy1SS=N56o4s3Qn_9ihEJuwSq+J4QfPaQttHJdhVjCaiMw@mail.gmail.com>
Subject: Re: [PATCH 3/3] firmware: fw_base.S: Add common NMI trap handler
To: Nylon Chen <nylon.chen@sifive.com>
Cc: Radim Krcmar <rkrcmar@qti.qualcomm.com>, 
	"opensbi@lists.infradead.org" <opensbi@lists.infradead.org>, Zong Li <zong.li@sifive.com>, 
	Nick Hu <nick.hu@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, opensbi <opensbi-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_203816_873530_4EC17168 
X-CRM114-Status: GOOD (  19.33  )
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

T24gTW9uLCBNYXIgMiwgMjAyNiBhdCA5OjI24oCvQU0gTnlsb24gQ2hlbiA8bnlsb24uY2hlbkBz
aWZpdmUuY29tPiB3cm90ZToKPgo+IFJhZGltIEtyY21hciA8cmtyY21hckBxdGkucXVhbGNvbW0u
Y29tPiDmlrwgMjAyNuW5tDLmnIgy5pel6YCx5LiAIOS4i+WNiDEwOjQ55a+r6YGT77yaCj4gPgo+
ID4gMjAyNi0wMS0yOVQwMDoxMzo0My0wODowMCwgTnlsb24gQ2hlbiA8bnlsb24uY2hlbkBzaWZp
dmUuY29tPjoKPiA+ID4gQWRkIHJubWlfaGFuZGxlciBhc3NlbWJseSB3cmFwcGVyIGFuZCBzYmlf
cm5taV90cmFwX2hhbmRsZXIgZGVmYXVsdAo+ID4gPiBDIGhhbmRsZXIuIFRoZSBkZWZhdWx0IGhh
bmRsZXIgcHJpbnRzIGRpYWdub3N0aWNzIGFuZCBoYW5ncyB0aGUgaGFydC4KPiA+ID4KPiA+ID4g
Q28tZGV2ZWxvcGVkLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KPiA+ID4gU3VnZ2VzdGVkLWJ5
OiBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+Cj4gPiA+IFN1Z2dlc3RlZC1ieTogU2FtdWVs
IEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6
IE55bG9uIENoZW4gPG55bG9uLmNoZW5Ac2lmaXZlLmNvbT4KPiA+ID4gU2lnbmVkLW9mZi1ieTog
WW9uZy1YdWFuIFdhbmcgPHlvbmd4dWFuLndhbmdAc2lmaXZlLmNvbT4KPiA+ID4gLS0tCj4gPiA+
IGRpZmYgLS1naXQgYS9maXJtd2FyZS9md19iYXNlLlMgYi9maXJtd2FyZS9md19iYXNlLlMKPiA+
ID4gQEAgLTY0Myw2ICs2NDMsNzAgQEAgbWVtY21wOgo+ID4gPiArICAgICAuc2VjdGlvbiAuZW50
cnksICJheCIsICVwcm9nYml0cwo+ID4gPiArICAgICAuYWxpZ24gNAo+ID4gPiArICAgICAuZ2xv
Ymwgc2JpX3JubWlfdmVjdG9yCj4gPiA+ICtzYmlfcm5taV92ZWN0b3I6Cj4gPiA+ICsgICAgIC8q
IFN3YXAgU1Agd2l0aCBNTlNDUkFUQ0ggKi8KPiA+ID4gKyAgICAgY3NycncgICBzcCwgQ1NSX01O
U0NSQVRDSCwgc3AKPiA+ID4gKwo+ID4gPiArICAgICAvKiBBbGxvY2F0ZSBzcGFjZSBmb3IgZnVs
bCB0cmFwIHJlZ2lzdGVycyBzdHJ1Y3R1cmUgKi8KPiA+ID4gKyAgICAgYWRkaSAgICBzcCwgc3As
IC0oU0JJX1RSQVBfUkVHU19TSVpFKQo+ID4KPiA+IFsyLzNdIGRpZDoKPiA+Cj4gPiAgICAgICAg
IHJubWlfY29udGV4dF9vZmZzZXQgPSBzYmlfc2NyYXRjaF9hbGxvY19vZmZzZXQoU0JJX1RSQVBf
UkVHU19TSVpFKTsKPiA+ICAgICAgICAgcm5taV9jdHggPSBzYmlfc2NyYXRjaF9vZmZzZXRfcHRy
KHNjcmF0Y2gsIHJubWlfY29udGV4dF9vZmZzZXQpOwo+ID4gICAgICAgICBybm1pX3NwICA9ICh1
bnNpZ25lZCBsb25nKXJubWlfY3R4ICsgU0JJX1RSQVBfUkVHU19TSVpFOwo+ID4gICAgICAgICBj
c3Jfd3JpdGUoQ1NSX01OU0NSQVRDSCwgcm5taV9zcCk7Cj4gPgo+ID4gV2UgY2FuIGF2b2lkIHRo
ZSBhZGQvc3VidHJhY3QgZGFuY2UsIHNpbmNlIGl0IHByb2R1Y2VzIHJubWlfY3R4Lgo+ID4gQSBi
aWdnZXIgaXNzdWUgaXMgdGhhdCBpdCBsZWF2ZXMgMCBieXRlcyBmb3IgdGhlIHN0YWNrIG9mIHRo
ZSBjYWxsYmFjay4KPiA+Cj4gPiBJcyB0aGVyZSBhIHJlYXNvbiBub3QgdG8gcmV1c2UgdGhlIGV4
aXN0aW5nIE0tbW9kZSBzdGFjaz8KPiA+Cj4gPiBUaGFua3MuCj4gSGkgUmFkaW0KPgo+IFRoYW5r
IHlvdSBmb3IgdGhlIHJldmlldy4KPgo+IFJlZ2FyZGluZyB5b3VyIHF1ZXN0aW9uICJJcyB0aGVy
ZSBhIHJlYXNvbiBub3QgdG8gcmV1c2UgdGhlIGV4aXN0aW5nCj4gTS1tb2RlIHN0YWNrPyI6Cj4K
PiBXZSBjYW5ub3QgcmV1c2UgdGhlIE0tbW9kZSBzdGFjayBiZWNhdXNlIFJOTUkgY2FuIGludGVy
cnVwdCBNLW1vZGUgY29kZSBpdHNlbGYKPiBJZiBSTk1JIHJldXNlcyB0aGUgTS1tb2RlIHN0YWNr
LCBpdCB3b3VsZCBjb3JydXB0IHRoZSBpbnRlcnJ1cHRlZAo+IE0tbW9kZSBmdW5jdGlvbidzIHN0
YWNrIGZyYW1lLgoKSWYgeW91IGxvb2sgYXQgdGhlIGV4aXN0aW5nIE0tbW9kZSBsb3ctbGV2ZWwg
dHJhcCBoYW5kbGVyIGl0IGFscmVhZHkKaGFuZGxlcyBuZXN0ZWQgdHJhcHMgdG8gc3VwcG9ydCBk
b3VibGUtdHJhcHMuCgo+Cj4gWW91J3JlIGFic29sdXRlbHkgcmlnaHQgYWJvdXQgdGhlIHN0YWNr
IHNwYWNlIGlzc3VlLgo+Cj4gVGhlIGN1cnJlbnQgY29kZSBhbGxvY2F0ZXMgb25seSBTQklfVFJB
UF9SRUdTX1NJWkUgKDI4MCBieXRlcyksCj4gbGVhdmluZyAwIGJ5dGVzIGZvciB0aGUgQyBoYW5k
bGVyLgo+Cj4gSSdsbCBmaXggdGhpcyBieSBhbGxvY2F0aW5nIGFkZGl0aW9uYWwgc3RhY2sgc3Bh
Y2U6Cj4KPiAjZGVmaW5lIFJOTUlfU1RBQ0tfU0laRSAgMjA0OAo+ICNkZWZpbmUgUk5NSV9DT05U
RVhUX1NJWkUgIChTQklfVFJBUF9SRUdTX1NJWkUgKyBSTk1JX1NUQUNLX1NJWkUpCj4gcm5taV9j
b250ZXh0X29mZnNldCA9IHNiaV9zY3JhdGNoX2FsbG9jX29mZnNldChSTk1JX0NPTlRFWFRfU0la
RSk7Cj4gcm5taV9zcCA9ICh1bnNpZ25lZCBsb25nKXJubWlfY3R4ICsgUk5NSV9DT05URVhUX1NJ
WkU7Cj4KPiBUaGlzIGdpdmVzIHRoZSBDIGhhbmRsZXIgMjA0OCBieXRlcyBvZiBzdGFjayBzcGFj
ZSB3aGlsZSBrZWVwaW5nIHRoZQo+IHJlZ2lzdGVyIHNhdmUgYXJlYSBzZXBhcmF0ZS4KPgo+IERv
ZXMgdGhpcyBhcHByb2FjaCBzb3VuZCByZWFzb25hYmxlIHRvIHlvdT8KClBsZWFzZSByZS11c2Ug
ZXhpc3RpbmcgTS1tb2RlIHN0YWNrLgoKUmVnYXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGlu
ZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
