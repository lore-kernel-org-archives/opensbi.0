Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4260CD4F52
	for <opensbi@archiver.kernel.org>; Mon, 18 May 2026 08:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ar0qXjFBCAGVpTmW7SyLnzcJ9LVNZ2USCfENJNWicfg=; b=uB2e7kRzdjZkFn
	G8LJtJ7gCebzHVs+/a2reucqFngWmVtrpk1RELfCN14ffnT8gYQpmKSdkOhAs13i1ZxtiNZvxVU89
	i4Otfgg7sYQhtcmehcT3Mu/dBVHU06Qb0K8WJ1BjMyrirr+9N5HFBJwRM0BB9TMWVLihOdUHq/Fy/
	PcHYM0cmopJ+MNy+z+hOLtFrtFCYlyDt1TpNHFMyjzM3iMaqTuCDXaWVheEU6QMgxT5gnGLZzDp0H
	ij9o5Qh72ZnoyWyr+HhEyNTJQEOQWVspIxxl/u6yxeMXEsuG9PEb9vvyxvWzod83Kim2+riTjOjIa
	g6txfpibdsxiw3tz062w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtWI-0000000EqgO-22uD;
	Mon, 18 May 2026 08:40:14 +0000
Received: from mail-wm1-f43.google.com ([209.85.128.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtWF-0000000Eqes-39fp
	for opensbi@lists.infradead.org;
	Mon, 18 May 2026 08:40:13 +0000
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891b0786beso13988045e9.1
        for <opensbi@lists.infradead.org>; Mon, 18 May 2026 01:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1779093609; x=1779698409; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=98sbANLHkxk8r1u0Q3Q9kXUoSgnHrQdJAT7CH0W1tNY=;
        b=nCOUWw/Vi1dmZvz4LH24YU6+AxZR3AXRWHQwhDiEPl5EngPWAjUjd7MBbj2f3yJXmV
         096/clh8lhuPg6ig54X7Os6rf64qqBEy2JGIXpNkWVM5Oej/dp+gefXvbbmlnumQS3JA
         l2AF/1buj+YW6Bnekv3gFuJMwmxciAuFsSoJCF8pl/Pv+pSxi1KR7zEfUX8Zm4QmGDuW
         bLQvMWY/hVxUSw94m+i1Y7tovcKN0XDCnJnVyp99ymfIqV90qKFeUuCAfDR2sZmpp+EQ
         bY0qAVOrIn55Fh/ZJigHODSqHopALegx13MsfyFURRH+t++GjPiZd3uLjQMBRBcQoG2x
         2MtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779093609; x=1779698409;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=98sbANLHkxk8r1u0Q3Q9kXUoSgnHrQdJAT7CH0W1tNY=;
        b=CUD/77QhmV4fSxX9bVo+xR9Dy5icASWeQV98c3Ioa7rFmkQ4RvAO677JwdE7vVjRUZ
         pVTY8WQuQhPC1nydzLo4EHmRkWJsOMc5q2Wl+Ez9aqo5Mcm2YSKRbsG0fe2AAOlO+giu
         ndPVB3vg3xk0mxhWhy9AJUYi/1SCMHw6eQaN0KHeCcz+lPR9Zop6yFUhY9voHLOGPLlT
         nDONSz7rTbxnBMRVfwSH2SS7tDmYukZgjhmlvDmhLipL5b2A09sENT05uMpGN/Ac0Lja
         gQbrmp7uvKs8odXc7oQr9rZrK9NxPIr1N/zrFaAjHj95zrmkMf+qI/Gqrftc1o25zb/k
         ikKA==
X-Forwarded-Encrypted: i=1; AFNElJ9t6PiF5mpxmnHoR1LqsDifROPK86cWw8lM3bgWG1ADnBX0pyfivaIx2qqiUo+JjYK7Jktdl4pL@lists.infradead.org
X-Gm-Message-State: AOJu0YzqBkKximFDIqgFxsOLtrNJxCZt8QWf4D0A4LWMUAVhtdI3gs7v
	Kx7WD5Rb/NnTYsSbiMmHkk7K/1xCY4vJ/SMkWt6gBW4dMBJYR4vM1KCSJRbWyWgfP1U=
X-Gm-Gg: Acq92OG3xePURoSG9ZTz0EMkHFEMsBFZjmpwme6FviBEtIaXoDlvncUPkR8q2BOdRk5
	Hl8KBgtf+UGbTanXKnuiqgB5u4Mvr6Tjh2mCR++kQIy7ktYGt50VtbgC3tWHrKNef7RirXeMzJ+
	eNo91cEG/5QKkdqRFU261zSOsFXvx6l2De0U01kHXGsQSLGDVYcqz36K0gegCz4MVCy5rom9wmw
	Jf4nPn2QoEfRPIYMBOtPxS7jKz9NqCtoEqT/7aNN3fHYuaITfn7x2fRoA2yAWSJguOLy/pQb9CX
	eFL4bxq3zWWrKlX0+IMZrmxjoDNgVoCI2Ojw33ZS5/Hrad7bCWIzbSEgRApADvZgr39pXFrSK9x
	K+UR3xU6DuVIBQ3ImaPWrEzaGtlnBrjbQ2IIvBSt4OZ2s/ID7X74TiQsAMeuP1XDBZuB460BfGy
	gqKf+3tESNclpCcEfoks/YafnKgMDy+So5hBN4wFRP8oDLl2pz8+WcXxzh
X-Received: by 2002:a05:600c:c116:b0:48f:e230:2a22 with SMTP id 5b1f17b1804b1-48fe6632e84mr172586055e9.33.1779093609080;
        Mon, 18 May 2026 01:40:09 -0700 (PDT)
Received: from [172.17.225.18] (mailserver.viasat.uk.com. [212.73.234.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe6b9efsm112943135e9.5.2026.05.18.01.40.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 01:40:08 -0700 (PDT)
Message-ID: <1f06c227-e8e1-4913-bc54-891a269e8938@riscstar.com>
Date: Mon, 18 May 2026 09:40:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] Add eager FP and Vector context switching support
To: Anup Patel <anup@brainfault.org>, Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Raymond Mao <raymond.mao@riscstar.com>,
 Evgeny Voevodin <evvoevod@tenstorrent.com>,
 Samuel Holland <samuel.holland@sifive.com>, opensbi@lists.infradead.org
References: <20260518083023.997323-1-anup.patel@oss.qualcomm.com>
 <CAAhSdy2d8cO-Ny_9BCoYeVvscBW8DjinZ1P-yOVtNUxVMEeU5A@mail.gmail.com>
Content-Language: en-US
From: Dave Patel <dave.patel@riscstar.com>
In-Reply-To: <CAAhSdy2d8cO-Ny_9BCoYeVvscBW8DjinZ1P-yOVtNUxVMEeU5A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_014011_812708_8CBFE3CA 
X-CRM114-Status: GOOD (  14.93  )
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

T24gNS8xOC8yNiAwOTozMywgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBNb24sIE1heSAxOCwgMjAy
NiBhdCAyOjAw4oCvUE0gQW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVhbGNvbW0uY29tPiB3
cm90ZToKPj4KPj4gRnJvbTogRGF2ZSBQYXRlbCA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20+Cj4+
Cj4+IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgcHJvcGVyIHN1cHBvcnQgZm9yIHBlci1kb21haW4g
ZmxvYXRpbmctcG9pbnQgKEZQKSBhbmQKPj4gdmVjdG9yIChWKSBjb250ZXh0cyBpbiB0aGUgZG9t
YWluIGNvbnRleHQgc3dpdGNoIGxvZ2ljLiBFYWNoIGRvbWFpbgo+PiBub3cgbWFpbnRhaW5zIGl0
cyBvd24gRlAgYW5kIHZlY3RvciBzdGF0ZSwgd2hpY2ggaXMgc2F2ZWQgYW5kIHJlc3RvcmVkCj4+
IGR1cmluZyBkb21haW4gc3dpdGNoZXMuCj4+Cj4+IENvbmRpdGlvbmFsaXplIEZQIGFuZCBWZWN0
b3Igc2F2ZS9yZXN0b3JlIGJhc2VkIG9uIGV4dGVuc2lvbnMsIHVuY29uZGl0aW9uYWwKPj4gc2F2
ZSBhbmQgcmVzdG9yZSBvZiBmbG9hdGluZy1wb2ludCAoRlApIGFuZCBWZWN0b3IgcmVnaXN0ZXJz
IGZhaWxzIG9uCj4+IGdlbmVyaWMgcGxhdGZvcm0gZmlybXdhcmUuIFRoaXMgZmlybXdhcmUgbXVz
dCBydW4gb24gbXVsdGlwbGUgcGxhdGZvcm1zCj4+IHRoYXQgbWF5IGxhY2sgdGhlc2UgZXh0ZW5z
aW9ucy4KPj4KPj4gQWRkcmVzcyB0aGlzIGJ5IGNvbmRpdGlvbmFsbHkgZXhlY3V0aW5nIEZQIHNh
dmUvcmVzdG9yZSBvbmx5IGlmIHRoZSB1bmRlcmx5aW5nCj4+IGhhcnQgc3VwcG9ydHMgdGhlIEYg
b3IgRCBleHRlbnNpb25zLiBTaW1pbGFybHksIHBlcmZvcm0gVmVjdG9yIHNhdmUvcmVzdG9yZQo+
PiBvbmx5IGlmIHRoZSBoYXJ0IHN1cHBvcnRzIHRoZSBWZWN0b3IgZXh0ZW5zaW9uLgo+Pgo+PiBD
aGFuZ2VzIHNpbmNlIHY3Ogo+PiAtIFJlYmFzZWQgb24gbGF0ZXN0IE9wZW5TQkkgbWFzdGVyCj4+
IC0gQWRkcmVzc2VkIGFsbCBteSBjb21tZW50cyBvbiB2NyBzZXJpZXMKPj4KPj4gQ2hhbmdlcyBp
bmNsdWRlOgo+Pgo+PiAtIEFkZCBWZWN0b3Igc2F2ZSBhbmQgcmVzdG9yZSBmdW5jdGlvbmFsaXR5
Cj4+IC0gQWRkIEZsb2F0aW5nIFBvaW50IHNhdmUgYW5kIHJlc3RvcmUgZnVuY3Rpb2FubGl0eQo+
PiAtIEFkZGVkIGBmcF9jdHhgIGFuZCBgdmVjX2N0eGAgbWVtYmVycyB0byBgc3RydWN0IGhhcnRf
Y29udGV4dGAuCj4+IC0gSW50cm9kdWNlZCBkeW5hbWljIHZlY3RvciBzdHJ1Y3QgYWxsb2NhdGlv
biBmb3IgdmxlbmIgaW4gJ3N0cnVjdCBoYXJ0X2NvbnRleHQnCj4+ICAgdG8gYWxsb2NhdGUgYW5k
IGZyZWUgcGVyLWRvbWFpbiBGUCBhbmQgdmVjdG9yIGNvbnRleHQuCj4+IC0gTW9kaWZpZWQgYHNi
aV9kb21haW5fcmVnaXN0ZXIoKWAgdG8gaW5pdGlhbGl6ZSBGUC9WZWN0b3IgY29udGV4dCBwZXIg
ZG9tYWluLgo+PiAtIFVwZGF0ZWQgYHN3aXRjaF90b19uZXh0X2RvbWFpbl9jb250ZXh0KClgIHRv
IHNhdmUvcmVzdG9yZSBGUCBhbmQgdmVjdG9yCj4+ICAgY29udGV4dHMgc2FmZWx5Ogo+PiAgICAg
LSBFbnN1cmVzIEZTL1ZTIGZpZWxkcyBpbiBgbXN0YXR1c2AgYXJlIGVuYWJsZWQgKHNldCB0byBJ
bml0aWFsKSBvbmx5IGlmIE9mZi4KPj4gLSBBZGRlZCBydW50aW1lIGNoZWNrcyBmb3IgRlAgYW5k
IHZlY3RvciBleHRlbnNpb25zIHdoZXJlIG5lZWRlZC4KPj4gLSBBZGRlZCBTQklfSEFSVF9FWFRf
RiwgU0JJX0hBUlRfRVhUX0QsIFNCSV9IQVJUX0VYVF9WIHRvIGVudW0KPj4gICBzYmlfaGFydF9l
eHRlbnNpb25zIGFuZCB0aGUgc2JpX2hhcnRfZXh0W10gYXJyYXkuIFVzZSBzYmlfaGFydF9oYXNf
ZXh0ZW5zaW9uKCkKPj4gICB0byBjaGVjayBmb3IgdGhlc2UgY2FwYWJpbGl0aWVzIGJlZm9yZSBw
ZXJmb3JtaW5nIHRoZSBjb250ZXh0IHN3aXRjaGVzCj4+Cj4+IFRoaXMgaW1wcm92ZXMgc3VwcG9y
dCBmb3IgbXVsdGktZG9tYWluIHN5c3RlbXMgd2l0aCBGUCBhbmQgVmVjdG9yCj4+IGV4dGVuc2lv
bnMsIGFuZCBwcmV2ZW50cyBjb3JydXB0aW9uIG9mIEZQL1ZlY3RvciBzdGF0ZSBkdXJpbmcgZG9t
YWluCj4+IHN3aXRjaGVzLgo+Pgo+PiBEYXZlIFBhdGVsICgzKToKPj4gICBsaWI6IHNiaTogQWRk
IFJJU0MtViB2ZWN0b3IgY29udGV4dCBzYXZlL3Jlc3RvcmUgc3VwcG9ydAo+PiAgIGxpYjogc2Jp
OiBBZGQgZmxvYXRpbmctcG9pbnQgY29udGV4dCBzYXZlL3Jlc3RvcmUgc3VwcG9ydC4KPj4gICBs
aWI6IHNiaTogZG9tYWluIEZQL1ZlY3RvciBjb250ZXh0IHN1cHBvcnQgZm9yIGNvbnRleHQgc3dp
dGNoCj4+Cj4+ICBpbmNsdWRlL3NiaS9zYmlfZnAuaCAgICAgICAgIHwgIDM1ICsrKysrKysKPj4g
IGluY2x1ZGUvc2JpL3NiaV9oYXJ0LmggICAgICAgfCAgIDYgKysKPj4gIGluY2x1ZGUvc2JpL3Ni
aV92ZWN0b3IuaCAgICAgfCAgNDAgKysrKysrKysKPj4gIGxpYi9zYmkvb2JqZWN0cy5tayAgICAg
ICAgICAgfCAgIDIgKwo+PiAgbGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYyB8ICAzMyArKysr
KysKPj4gIGxpYi9zYmkvc2JpX2ZwLmMgICAgICAgICAgICAgfCAxOTIgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPj4gIGxpYi9zYmkvc2JpX2hhcnQuYyAgICAgICAgICAgfCAg
IDMgKwo+PiAgbGliL3NiaS9zYmlfdmVjdG9yLmMgICAgICAgICB8ICA5NCArKysrKysrKysrKysr
KysrKwo+PiAgOCBmaWxlcyBjaGFuZ2VkLCA0MDUgaW5zZXJ0aW9ucygrKQo+PiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGluY2x1ZGUvc2JpL3NiaV9mcC5oCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5j
bHVkZS9zYmkvc2JpX3ZlY3Rvci5oCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3NiaS9zYmlf
ZnAuYwo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi9zYmkvc2JpX3ZlY3Rvci5jCj4+Cj4+IC0t
Cj4+IDIuNDMuMAo+Pgo+IAo+IEFwcGxpZWQgdGhpcyBzZXJpZXMgdG8gdGhlIHJpc2N2L29wZW5z
YmkgcmVwby4KPiAKPiBSZWdhcmRzLAo+IEFudXAKCk1hbnkgdGhhbmtzIEFudXAhCgpLaW5kIFJl
Z2FyZHMsCkRhdmUKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVu
c2JpCg==
