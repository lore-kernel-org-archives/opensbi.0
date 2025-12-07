Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA42D1CDC6
	for <opensbi@archiver.kernel.org>; Sun,  7 Dec 2025 06:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yBgsHtNgduob8F2WQtYI3Gkf92k7dER52m0+oaHF4FE=; b=m0ENGkbX8ufy/U
	ZBk4EHKnnUhMKgjegPkeoVwtEzw9ReIkb9bY9Nif0xa11psSa8Kza4zcL0I5VFANTWW1j59wUjFFU
	kIhBVGwWnk4HvqKEy09LGjxn92rr0zRY//T+L4ZgYYtqHpKwof7ueLSBcWtDVgoOfSPECaQMlAqoL
	ntAKj6C1qIrKiiz2yvplJ7ybeNuBMtgizWpKwBMZExLmjykRBC/gUQnsGT+6BdF2iNvAuCoUsUcT5
	ECFGgd88Q5slGdfbuEYPKV1HavabYT+U16t+ESOyv8MrZEACpD+X6dIIEs2UwnBtUskl1osDs4ODb
	G+BO83+4gK12xntd5QkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vS81o-0000000BWKT-1OAG;
	Sun, 07 Dec 2025 06:13:52 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vS81m-0000000BWK6-158y
	for opensbi@lists.infradead.org;
	Sun, 07 Dec 2025 06:13:51 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-29555b384acso34713225ad.1
        for <opensbi@lists.infradead.org>; Sat, 06 Dec 2025 22:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765088029; x=1765692829; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sZECDSxCiq2osFAJw1GLJ/7i4ugks476URulcKmH/zY=;
        b=Xrsy3cxQXQUfXQPcCvH/mLIF7xW1hK1UHbnJW1+QeMbzjACK4cRCf3A2cjFbP3zlzy
         sIxkOXTIskT5kivj2SI0sZMJ5CNbZtVoyonfNE4qQIEHH0ff8xOPia33tybZlxcyhHkV
         hUzSr6wG/wM4pJ3qSA1YizxZ9BTtzKqvlSP88Xd5JredfKHU89sny0NHA6JdN3T9Y8Zm
         G4QuTikhhAn7M3zjz0jSPUlNp7fHF20N/+D7PBlqubR3DveLvrO/K0Xmt5uGJuQx5wwL
         bubZqjX6cbSyOOwdXasE9B5mxGe9sU62dWSTPAwiAsw0xcBfjdBfgzI+Lcb6D5PwEXDh
         Qetw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765088029; x=1765692829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZECDSxCiq2osFAJw1GLJ/7i4ugks476URulcKmH/zY=;
        b=mRsi51aviZ/UTYH0wzWKbAyOFLyy82yFk7WgP9H7JP6TPE/aSISGMtoFlCAJUKZg7h
         jH32l28wj9Rih8k3fxOgy/Og07Tc+t4njLrPOs2Ir5WU8/ma/z/Rk1DwpXHeIjM+kF4I
         F2a/DHakwIXno9iQgeaTV8fJbSLgdwH0f2AfVtq3Tjgdxu52WgsNiGEIJOziXdQAVa4d
         yOIsivf7+P9ylF+cIUUb3cvRuPbdTb6QXin6Y+F+RmIfpdIGN2yq/9bd3Ow20kYJGOGf
         j95AyPy2cUEt0wJVocmjNklrySf1DGkpFhpRi380ntLiaNVk9AbCMxuYuXwmbjcByhWJ
         siTA==
X-Gm-Message-State: AOJu0YycFAlYC1TBF45QdRgsyKJaO+ySM2U/OUyIKP+kAr8Th443QZlF
	r1V6d1dqsTCBwUlIMIErOZDjP0Bx/4xu9n1YmJhVOSR0s4z4mwzvV4tPddacBESZ
X-Gm-Gg: ASbGncuMt8QAuyO8g9zrrj9cb/ba1k3zzEcny6UqzAk0RUTCZ0kYF52XCoHlHg+oWE4
	/6RvPaMfZo9BGxGe6MP6ZScrjCIfLGnp4Q/PPwF9lv+l5/qCLDM5PourXFj3RA6RHkCgFHQ2n5H
	ZFe2t/gAGAsyckUPNNBBIMoaEZo1Py6owYB3qG/WoCFhQ9By3N3/vnS1EPYLogiv8lQ/nJViV82
	updlsgzoguZmMJrUCpmHJ87989dcflbMBtZIwpl+oj49qiKLsXWwP+AGIXeqOdHIj7rlMNYcLfO
	nMEuLnOBGTxZtlsrr44pql9iNV3bagc8p6+NwlNfT6iAVDgT85qgMEkUmf8xdq+FdiyQ2lp+HuF
	doXyD9mgBdfGNM7uBm8oNgnjYDBOfChxnYZnV13RLF8N4BM4bP0vw2GamgKhCxjX6UW/OnnhajD
	Yj8piUEy303t+t
X-Google-Smtp-Source: AGHT+IFJpHuQ55sK9Zqqx7liNusYROs3BiviBJ452Uo1MKwGQ+bh8v6M/pGGO2w6934i1np79xf5/g==
X-Received: by 2002:a17:902:dac4:b0:295:94e1:91da with SMTP id d9443c01a7336-29df5ca8fc0mr34343645ad.33.1765088029405;
        Sat, 06 Dec 2025 22:13:49 -0800 (PST)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae49c379sm89454095ad.6.2025.12.06.22.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 22:13:48 -0800 (PST)
Message-ID: <9cdb9efb-00e3-4db6-a7fb-cca57ff877b5@gmail.com>
Date: Sat, 6 Dec 2025 22:12:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Initial ESWIN/EIC7700 support
To: Bo Gan <ganboing@gmail.com>, Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org, linmin@eswincomputing.com,
 pinkesh.vaghela@einfochips.com, gaohan@iscas.ac.cn, samuel@sholland.org,
 wangxiang@iscas.ac.cn
References: <20251120093440.4533-1-ganboing@gmail.com>
 <CAAhSdy1fEUk=2GWAWf12SR2r5vc3R+heg7sZMniTgYTjdu5Rjg@mail.gmail.com>
 <018c4467-b637-4de9-9410-27b3de69f455@gmail.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <018c4467-b637-4de9-9410-27b3de69f455@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_221350_301639_161D16C1 
X-CRM114-Status: GOOD (  11.23  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

SGkgQW51cCwKCklzIHRoZSBoYXJ0IHByb3RlY3Rpb24gYWJzdHJhY3Rpb24gZ29pbmcgdG8gYmUg
bWVyZ2VkIHNvb24/IEluIHYxLjg/CkknbSBtYWtpbmcgYSB2NCB3aGljaCBpcyByZWJhc2VkIG9u
IHlvdXIgY2hhbmdlLiBMZXQgbWUga25vdyBpZiB0aGVyZSdzCmFueSBvdGhlciBjaGFuZ2UgdG8g
dGhlIGhhcnQgcHJvdGVjdGlvbiBhYnN0cmFjdGlvbiwgc28gSSBjYW4gcmViYXNlCmFnYWluIGJl
Zm9yZSBzZW5kaW5nIG91dC4gQWxzbyBhbnkgZmVlZGJhY2sgb24gUGV0ZXIgTGluJ3MgY29tbWVu
dHM/CgpJIGhvcGUgSSBjYW4gbWFrZSBpdCBmb3IgdjEuOC4gVGhhbmtzIGFnYWluLgoKQm8KCk9u
IDExLzI2LzI1IDE0OjU2LCBCbyBHYW4gd3JvdGU6Cj4gSGkgQW51cCwKPiAKPiBPbiAxMS8yNi8y
NSAwNjoyMywgQW51cCBQYXRlbCB3cm90ZToKPj4gT24gVGh1LCBOb3YgMjAsIDIwMjUgYXQgMzow
NuKAr1BNIEJvIEdhbiA8Z2FuYm9pbmdAZ21haWwuY29tPiB3cm90ZToKPj4+IC4uLgo+Pgo+PiBJ
bnN0ZWFkIG9mIHBsYXRmb3JtIHNwZWNpZmljIFBNUCAodW4pY29uZmlndXJhdGlvbiBvdmVycmlk
ZSwgeW91Cj4+IGNhbiByZWJhc2UgdGhpcyBzZXJpZXMgdXBvbiAiT3BlblNCSSBoYXJ0IHByb3Rl
Y3Rpb24gYWJzdHJhY3Rpb24iCj4+IHNlcmllcyBhbmQgaW1wbGVtZW50IEVJQzc3MFggc3BlY2lm
aWMgaGFydCBwcm90ZWN0aW9uIHVzaW5nIFBNUC4KPj4KPiAKPiBUaGFua3MsIEFudXAuIFdpbGwg
cmViYXNlIG9uIGhhcnQgcHJvdCBhYnN0cmFjdGlvbiBjaGFuZ2UuIEkgYWxzbyBmb3VuZAo+IGFu
b3RoZXIgaXNzdWUgcmVnYXJkaW5nIHRoZSBtZW1vcnkgcmVnaW9uIGNvdmVyaW5nIHRoZSB1bmNh
Y2hlZCByYW5nZSBvZgo+IGZpcm13YXJlLCB3aGVyZSBpdCBzaG91bGQgdXNlIHRoZSBNTUlPIGZs
YWcgdG8gbm90IGV4cG9zZSB0aGUgaXQgdGhyb3VnaAo+IEZEVCB0byBTIG1vZGUuIE1NSU8gZmxh
ZyBhbHNvIGJldHRlciBtYXRjaGVzIHRoZSBTeXN0ZW0gUG9ydCBQTUEgaW4gSFcuCj4gTGV0IG1l
IGtub3cgaWYgeW91IGZvdW5kIGFueSBvdGhlciBpc3N1ZXMsIGFuZCBJIGNhbiBmaXggYWx0b2dl
dGhlci4KPiAKPj4+IMKgwqAgbGliOiBzYmk6IGdpdmUgcGxhdGZvcm0gY2hvaWNlIG9mIHVzaW5n
IHNpbmdsZSBtZW1yZWdpb24gdG8gY292ZXIKPj4+IMKgwqDCoMKgIE9wZW5TQkkKPj4+IMKgwqAg
aW5jbHVkZTogc2JpX2RvbWFpbjogbWFrZSBpc19yZWdpb25fc3Vic2V0IHB1YmxpYwo+Pj4gwqDC
oCBwbGF0Zm9ybTogZ2VuZXJpYzogZXN3aW46IGFkZCBFSUM3NzAwCj4+PiAuLi4KPj4KPj4gUmVn
YXJkcywKPj4gQW51cAo+IAo+IEJvCj4gCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNi
aUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vb3BlbnNiaQo=
