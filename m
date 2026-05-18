Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B07CD4F54
	for <opensbi@archiver.kernel.org>; Mon, 18 May 2026 08:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hfZVKpcLona2k8eFwLumzisEqXHRjvQfUBQ1U1rxFlA=; b=eCnjEYpmSUYVAI
	PHLOAP2Ssg05XiNqIjVhQqFAPOjBuaQKp0HDDCod97lLN/S93TYyYuNfCeANJDJ9hDaieW+6sfNr7
	bzw8IbQn+t1y+exPwM8I4VCF1XfaegYZD4m25e9T4RXmuwv7+Egmeni7r8zpTJGynlAP7kq9KqB0V
	8I+3sf4U/FSVj//ymXjOoyWm3bl/9DeyMSeUKrTX9vxoyUWUu5gFXzOj2dlODHm4SptoSNHbsa+PF
	hEpgt9GWXqkIrR4hmxrtHMy0zXlXypDRm2Askj87pZ4n6Ran8/Tl9Hdf9OjM/YYoI9l7ldselo9Ck
	/hGQRgppDElYehHESIzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtS4-0000000Epf4-015i;
	Mon, 18 May 2026 08:35:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtS2-0000000EpeV-2vyw
	for opensbi@bombadil.infradead.org;
	Mon, 18 May 2026 08:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EIZcHYJJRIdK5u8lC6yRW1q0E8xJBFFEpiKXhXvCeYc=; b=PX7Xk0hMJZfgqScUs/XQxBTPGg
	ju5u2jy2EpPL57xbXinb1htjvOJ8I2asDSFsbjECgbXnnUEw1MTgbuz5vAlU2HhbQBIDtLJqmTuqo
	VvbSE/EDk16Eb5ZzZCc2LKCirpPCVuROr6cjqFnJxOw+LorT0+MBHdE+8nxauxnEz2Wr930UqYw0I
	y/uxRZ9a5nkB1SMSBCg6GMAwkx9JQPnLqmXAFGcUfNvR6YFNWjuO23oN384NFxvIfoEM66RAe51o/
	QbhYc7CMM6XD6ggyxdhoJcFwfNWa8yb/YS4rWoP9JZuzPIdEn9QEJ9kwFLSjPOJNzgtz5d9uhMG+o
	7e2HDxFQ==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtRy-0000000APBw-1Xcf
	for opensbi@lists.infradead.org;
	Mon, 18 May 2026 08:35:49 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso20531915e9.3
        for <opensbi@lists.infradead.org>; Mon, 18 May 2026 01:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1779093345; x=1779698145; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EIZcHYJJRIdK5u8lC6yRW1q0E8xJBFFEpiKXhXvCeYc=;
        b=y6RIHar9PumNWTr0JJBEcacPslgdHxNnFq7+aXOYL9Gs72NvLvN0CPwkLgyRIZT734
         5R5EN9vRAk1LJf2rL/WEtO4bjkNtKSxobYkC93F6QykGRP8nGpV4fc/b8LVGvYkhoGA9
         ct6cre8dZ7Vnpr/Y7paaU2hrg7vTKcQ/BHcn9Sxx7iRW+thGLm/pN1ONaCMyCVoqa5KT
         OW2P+JvgXmfJich560l+EueXoWNci0oX2EgsIy28ZhMKx6yG4YaIPdHmXzLv51ZkM4Mt
         7kNkhphmDqbzTWCe0xdiAKjpQHDHnDRl2MKftcke9kt48W7PYfsTgZ1B9QxQ/vHunpQv
         cuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779093345; x=1779698145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EIZcHYJJRIdK5u8lC6yRW1q0E8xJBFFEpiKXhXvCeYc=;
        b=Qn50zTtGp/5bX3x/ucpX1slWeiGnJrFJFWRGYnSThppPY/S1zGLQEll7sT9EK3gGTF
         KAwa4U9ZSBkoK7kRXpV+ewuLVNUxO1ZFKqpUGP/rkz/9DGflWg1r88s+0E2xw55PkY7r
         ibSQMzczBEbhke/YvRilmKnuePRJpy5dWwSnW8SIqyHZ2vYNCR62MqiPo+A6XTCfoM0Y
         Uwe+x2UVyi++9U6e7Zn1XiEkqWTyhrNl2GXVJJ2H6jYd8Lf6lDps8V/yk/duzt4yykfI
         8xpyX+yz0f4vj6BqfpgLyI7dNksWOkXNVDh4jzuScUYsoAiv2aH23J03IyGe8tSMH7+h
         zbVg==
X-Forwarded-Encrypted: i=1; AFNElJ8k8v/cySONcxg8JMNnp1LXz5mpuDGVQlRxlA/NvlFpbjZka+ZZdFMlwKkeQoknU/awGogKyxcK@lists.infradead.org
X-Gm-Message-State: AOJu0YyNx4ZOBmhBT4r3uHfE2WNc9uris8cdTlWSdj/iFevgzyABQGZ9
	4OMZ8uUSv8Aqaq/x4BKmYkRflathjWTYyE9MHFJeBkenuU3dYgjOTiDFz8ZUF1C49HE=
X-Gm-Gg: Acq92OED6NP6b/B3n5HpN+b5PCIe3x5T2SBkQ60Jxl83pHO1tbSujWG2v3Yu6CBrFLs
	8oDa3/U/ynkR9QgxgnTprRmbe4oSPGTlv1S5iXt2G82BlZM4B7AXhbh9qJQPPKAmX0c1BoyMdRw
	GaQFKDpNa97/mR7SIM9F0M95n8lRZU/LBqTbhfmybPzyO7lRB+OGG0gU7HN20NhRIEBZIqbK2r5
	/GHtSC9J1apvYqUW+1fjq4zmmczBUki2Cpkk34C1K20jLQzSWiuADIlYuw31rDx5Rzj/u+ng3aG
	7nw21NUOoODt8KDeTIa3ZjJJoNMzqKTjGHfB7MmBKTWQS/qsmMPWqEHdcRdZcHPJ3hSI4Jtlubo
	Q3GZC6cZ/SWBKItO+Jr/23orZNh+fVq0AZ7BqkvfCJ4F0giij8e8elpU6wdn8Pnih7QK7S1XL18
	L1FJUlR+GNnwlndiEWH8GDxrVxChky7Uc0O0A94r6SZ5WPqNtx/F8cMYSA
X-Received: by 2002:a05:600c:848c:b0:48f:d0f1:ed28 with SMTP id 5b1f17b1804b1-48fe60e4e32mr214124065e9.1.1779093344683;
        Mon, 18 May 2026 01:35:44 -0700 (PDT)
Received: from [172.17.225.18] (mailserver.viasat.uk.com. [212.73.234.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c8d39esm242961805e9.7.2026.05.18.01.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 01:35:44 -0700 (PDT)
Message-ID: <dfed5cec-217d-4ad6-8b14-6a52a2685285@riscstar.com>
Date: Mon, 18 May 2026 09:35:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/3] Add eager FP and RISC-V vector context switching
 support
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>,
 Anup Patel <anuppate@qti.qualcomm.com>, Scott Bambrough
 <scott@riscstar.com>, Robin Randhawa <robin.randhawa@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Ray Mao <raymond.mao@riscstar.com>, Dhaval <dhaval@rivosinc.com>,
 Peter Lin <peter.lin@sifive.com>, opensbi@lists.infradead.org
References: <20260518054219.58708-1-dave.patel@riscstar.com>
 <CAAhSdy37VLs8oXgkWvGfGn8irWgNU7+pgO0S-J4oOnbWZvikAQ@mail.gmail.com>
Content-Language: en-US
From: Dave Patel <dave.patel@riscstar.com>
In-Reply-To: <CAAhSdy37VLs8oXgkWvGfGn8irWgNU7+pgO0S-J4oOnbWZvikAQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_093546_811805_FE7EAC72 
X-CRM114-Status: GOOD (  15.26  )
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

T24gNS8xOC8yNiAwOTozMSwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBNb24sIE1heSAxOCwgMjAy
NiBhdCAxMToxMuKAr0FNIDxkYXZlLnBhdGVsQHJpc2NzdGFyLmNvbT4gd3JvdGU6Cj4+Cj4+IEZy
b206IERhdmUgUGF0ZWwgPGRhdmUucGF0ZWxAcmlzY3N0YXIuY29tPgo+Pgo+PiBUaGlzIHBhdGNo
IHNlcmllcyBhZGRzIHByb3BlciBzdXBwb3J0IGZvciBwZXItZG9tYWluIGZsb2F0aW5nLXBvaW50
IChGUCkgYW5kCj4+IHZlY3RvciAoVikgY29udGV4dHMgaW4gdGhlIGRvbWFpbiBjb250ZXh0IHN3
aXRjaCBsb2dpYy4gRWFjaCBkb21haW4KPj4gbm93IG1haW50YWlucyBpdHMgb3duIEZQIGFuZCB2
ZWN0b3Igc3RhdGUsIHdoaWNoIGlzIHNhdmVkIGFuZCByZXN0b3JlZAo+PiBkdXJpbmcgZG9tYWlu
IHN3aXRjaGVzLgo+Pgo+PiBDb25kaXRpb25hbGl6ZSBGUCBhbmQgVmVjdG9yIHNhdmUvcmVzdG9y
ZSBiYXNlZCBvbiBleHRlbnNpb25zLCB1bmNvbmRpdGlvbmFsCj4+IHNhdmUgYW5kIHJlc3RvcmUg
b2YgZmxvYXRpbmctcG9pbnQgKEZQKSBhbmQgVmVjdG9yIHJlZ2lzdGVycyBmYWlscyBvbgo+PiBn
ZW5lcmljIHBsYXRmb3JtIGZpcm13YXJlLiBUaGlzIGZpcm13YXJlIG11c3QgcnVuIG9uIG11bHRp
cGxlIHBsYXRmb3Jtcwo+PiB0aGF0IG1heSBsYWNrIHRoZXNlIGV4dGVuc2lvbnMuCj4+Cj4+IEFk
ZHJlc3MgdGhpcyBieSBjb25kaXRpb25hbGx5IGV4ZWN1dGluZyBGUCBzYXZlL3Jlc3RvcmUgb25s
eSBpZiB0aGUgdW5kZXJseWluZwo+PiBoYXJ0IHN1cHBvcnRzIHRoZSBGIG9yIEQgZXh0ZW5zaW9u
cy4gU2ltaWxhcmx5LCBwZXJmb3JtIFZlY3RvciBzYXZlL3Jlc3RvcmUKPj4gb25seSBpZiB0aGUg
aGFydCBzdXBwb3J0cyB0aGUgVmVjdG9yIGV4dGVuc2lvbi4KPj4KPj4gQ2hhbmdlcyBpbmNsdWRl
Ogo+Pgo+PiAtIEFkZCBWZWN0b3Igc2F2ZSBhbmQgcmVzdG9yZSBmdW5jdGlvbmFsaXR5Cj4+IC0g
QWRkIEZsb2F0aW5nIFBvaW50IHNhdmUgYW5kIHJlc3RvcmUgZnVuY3Rpb2FubGl0eQo+PiAtIEFk
ZGVkIGBmcF9jdHhgIGFuZCBgdmVjX2N0eGAgbWVtYmVycyB0byBgc3RydWN0IGhhcnRfY29udGV4
dGAuCj4+IC0gSW50cm9kdWNlZCBkeW5hbWljIHZlY3RvciBzdHJ1Y3QgYWxsb2NhdGlvbiBmb3Ig
dmxlbmIgaW4gJ3N0cnVjdCBoYXJ0X2NvbnRleHQnCj4+ICAgdG8gYWxsb2NhdGUgYW5kIGZyZWUg
cGVyLWRvbWFpbiBGUCBhbmQgdmVjdG9yIGNvbnRleHQuCj4+IC0gTW9kaWZpZWQgYHNiaV9kb21h
aW5fcmVnaXN0ZXIoKWAgdG8gaW5pdGlhbGl6ZSBGUC9WZWN0b3IgY29udGV4dCBwZXIgZG9tYWlu
Lgo+PiAtIFVwZGF0ZWQgYHN3aXRjaF90b19uZXh0X2RvbWFpbl9jb250ZXh0KClgIHRvIHNhdmUv
cmVzdG9yZSBGUCBhbmQgdmVjdG9yCj4+ICAgY29udGV4dHMgc2FmZWx5Ogo+PiAgICAgLSBFbnN1
cmVzIEZTL1ZTIGZpZWxkcyBpbiBgbXN0YXR1c2AgYXJlIGVuYWJsZWQgKHNldCB0byBJbml0aWFs
KSBvbmx5IGlmIE9mZi4KPj4gLSBBZGRlZCBydW50aW1lIGNoZWNrcyBmb3IgRlAgYW5kIHZlY3Rv
ciBleHRlbnNpb25zIHdoZXJlIG5lZWRlZC4KPj4gLSBBZGRlZCBTQklfSEFSVF9FWFRfRiwgU0JJ
X0hBUlRfRVhUX0QsIFNCSV9IQVJUX0VYVF9WIHRvIGVudW0KPj4gICBzYmlfaGFydF9leHRlbnNp
b25zIGFuZCB0aGUgc2JpX2hhcnRfZXh0W10gYXJyYXkuIFVzZSBzYmlfaGFydF9oYXNfZXh0ZW5z
aW9uKCkKPj4gICB0byBjaGVjayBmb3IgdGhlc2UgY2FwYWJpbGl0aWVzIGJlZm9yZSBwZXJmb3Jt
aW5nIHRoZSBjb250ZXh0IHN3aXRjaGVzCj4+Cj4+IFRoaXMgaW1wcm92ZXMgc3VwcG9ydCBmb3Ig
bXVsdGktZG9tYWluIHN5c3RlbXMgd2l0aCBGUCBhbmQgVmVjdG9yCj4+IGV4dGVuc2lvbnMsIGFu
ZCBwcmV2ZW50cyBjb3JydXB0aW9uIG9mIEZQL1ZlY3RvciBzdGF0ZSBkdXJpbmcgZG9tYWluCj4+
IHN3aXRjaGVzLgo+Pgo+PiBEYXZlIFBhdGVsICgzKToKPj4gICBsaWI6IHNiaTogQWRkIFJJU0Mt
ViB2ZWN0b3IgY29udGV4dCBzYXZlL3Jlc3RvcmUgc3VwcG9ydAo+PiAgIGxpYjogc2JpOiBBZGQg
ZmxvYXRpbmctcG9pbnQgY29udGV4dCBzYXZlL3Jlc3RvcmUgc3VwcG9ydC4KPj4gICBsaWI6IHNi
aTogZG9tYWluIEZQL1ZlY3RvciBjb250ZXh0IHN1cHBvcnQgZm9yIGNvbnRleHQgc3dpdGNoCj4+
Cj4+ICBpbmNsdWRlL3NiaS9zYmlfZnAuaCAgICAgICAgIHwgIDI2ICsrKysrCj4+ICBpbmNsdWRl
L3NiaS9zYmlfaGFydC5oICAgICAgIHwgICA2ICsKPj4gIGluY2x1ZGUvc2JpL3NiaV92ZWN0b3Iu
aCAgICAgfCAgMjggKysrKysKPj4gIGxpYi9zYmkvb2JqZWN0cy5tayAgICAgICAgICAgfCAgIDIg
Kwo+PiAgbGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYyB8ICAzNiArKysrKysKPj4gIGxpYi9z
Ymkvc2JpX2ZwLmMgICAgICAgICAgICAgfCAyMDcgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKPj4gIGxpYi9zYmkvc2JpX2hhcnQuYyAgICAgICAgICAgfCAgIDMgKwo+PiAgbGli
L3NiaS9zYmlfdmVjdG9yLmMgICAgICAgICB8IDExOCArKysrKysrKysrKysrKysrKysrKwo+PiAg
OCBmaWxlcyBjaGFuZ2VkLCA0MjYgaW5zZXJ0aW9ucygrKQo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGluY2x1ZGUvc2JpL3NiaV9mcC5oCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9zYmkv
c2JpX3ZlY3Rvci5oCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3NiaS9zYmlfZnAuYwo+PiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi9zYmkvc2JpX3ZlY3Rvci5jCj4+Cj4+IC0tCj4+IDIuNDMu
MAo+Pgo+Pgo+PiAtLQo+PiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+PiBvcGVuc2JpQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9vcGVuc2JpCj4gCj4gSSBoYXZlIHNlbmQtb3V0IHY4IHRvIGFkZHJlc3MgbXkgb3duIGNvbW1l
bnRzLgo+IAo+IFJlZ2FyZHMsCj4gQW51cAoKVGhhbmtzIEFudXAsIEkgbmVlZCB0byBjaGVjayBt
eSBlbnZpcm9ubWVudCBhcyBzcGFjZXMgc2hvdWxkIGhhdmUgYmVlbgp0YWJzIG5vdy4KClRoYW5r
cyBmb3IgVjggdmVyeSBtdWNoIGFwcHJlY2lhdGVkLgoKVGhhbmtzIGFuZCBLaW5kIFJlZ2FyZHMK
RGF2ZQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
