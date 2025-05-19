Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27767C2D0CD
	for <opensbi@archiver.kernel.org>; Mon, 19 May 2025 07:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aGaNq0KkVYdO4/i+YKAC9UuFmYQcVC/PwuS3fWWHWAU=; b=mipDr/cY6BsJlv
	YR+9lfTHM0ZGmPoOmCshvqIbtys6qid8abXdp0fEmL4L5JAlAd6WgmjVLIG7H7Kf4ScYJ5LnEPpRH
	4QA5FU4Y6H/oIRPTMqRxOaZS+e36MIXF5WzhhRCxTr9qol0gt1k9phNK13w6zx3g19Rai/ahzSA+0
	wTJlRdFuj/T6Hj1r37wTIACo6DX4OUjx7wgO69Wc3DYZHYyX/0JgaQHIE7aT+Rn7EKxPxdT5CuIcp
	NJwuijaYkp1fCDpioukZzUowlIs/a9OPXaybt7M5VJpNL/TFzUxdoZ7O1PxMEGAUCwmsaHYWGw4wH
	/T350+2E7AfS0MMn6qqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGv6v-00000008FOl-1osv;
	Mon, 19 May 2025 07:40:33 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGv5A-00000008FH6-3fBu
	for opensbi@lists.infradead.org;
	Mon, 19 May 2025 07:38:46 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-af5085f7861so2614094a12.3
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 00:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747640323; x=1748245123; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZYJAzcITmLwP1tMI+v71hhdY/cLSamJf709r6K/kwm8=;
        b=0Zg0HEfhVJRFyYmy0DUQjX1mzXSh9Bb/BNi3iUGv9woETn3hCKQIughu2m4YDUPASV
         Cn5o43miR8MGqC1XqxNYMDR8UGPCg1clBtPCiEL6t2F6/EkLSjnCNKwneA89IkRUXURW
         nSIt9gxZhM2+pshuREezjOBCFEF7pQ/Yeq+xQJdtHsyjtsSBwIytsrrb/YNzsJlbiOnz
         i8LkDWOEX9FStDS7dFdlBPRvA1zKirj2svIDF576JYup/5B78V5huTluImTsxA1jIt7F
         hF4yAsnoHN0TjMelJR91FndH6/2qT4imlXhnZrHdK4wRkvWxmsNUi4+YsbMmq4d1sGGr
         hb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747640323; x=1748245123;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYJAzcITmLwP1tMI+v71hhdY/cLSamJf709r6K/kwm8=;
        b=R+Ts6K+7cH/qRAeOIceiD3xUGNnNXcM5NIF8ZGJnpuLZ9LKK2Tq6c6WCum+Kdjn0xF
         RAgTmm7BtrIVmgYs2nevnQ+3J4Wx+vdy2WeyJAOdNedPnbb9HDG6w8geSFMRRNvkq/1O
         J1N4uEoI1+fjQWrspdI1xTIL+A1Pjj5PemW1sZc8w2ppJx48Xt257dCwZoffPBpmrviB
         wZDMm1tCDxCKrnV8J8s1od/I0I/5ZM2+OZRv3NIRKGEGyAAMZ0zkcEFZERX8xurYmXqE
         mb7vANtOb0ICvSzBhF17/wyWyiUPjsVenWxbRUqu3gAvIkHlc92SVbLSj1gHpvMOCBMZ
         z3Bw==
X-Forwarded-Encrypted: i=1; AJvYcCUpCzQDr8QvbuANy6Slmx2Zio7I+izF0uSOU7jKE3ZuYjdzbY4diiP3JMNnqjpI+Gx3dg8imz7F@lists.infradead.org
X-Gm-Message-State: AOJu0YyYdFSDSMwEDteya1I2De+Oruin63sNrvvNAL3FFbCJ4ASTY144
	ou/A2jbWyYBR/hADI0IdNIH1+hPU5WSBimkDEjd5wGtJWtDVxNbdH5MfI/eYLmOASos=
X-Gm-Gg: ASbGncv7fuGbpXFWfFqHGhU+OkWRmCdQcXOylqBQz6h2HTHhmV1Yiioq6vMIzfJjBrj
	PJTtz4tExo60zLrSVY10Vp9/2NzQQqDvtwrcqSlnqKmsX+uO9NzkSHGjl70mfLNRVwkL1/vmnfP
	NkcK18WWw4Fa4q4SJAN5/2wAou1qiUEyP9m30I3J1lXmCgJPrVDfI0wdfX43rBsZn3CbgJZSOo4
	jqbmPVSZ9Vvx9tk/WhVt/WbB9+j9xYJKnkB4082Yo5CzgGVhT8pd08v6w4+1R6XwqQXgEv61EQ5
	KYYolkh6ZQrmD8f32fs/8pksLHaSnO3TUbyK1o9AmWi/Js7ZgZ+GDCAZxUsP8COUi0R8BKEK+oq
	+mWzBvYRbuBvZLeixObK3bG3bEZxLqtc=
X-Google-Smtp-Source: AGHT+IE/ZQqqWght/QMEPYs1pruDgTnprFoBAm2A9VTbMpQF4kL5fidjrCkk6v5TPKvABx1UvhkSfw==
X-Received: by 2002:a17:903:40d0:b0:22e:847b:5bbd with SMTP id d9443c01a7336-231de370cebmr172153985ad.32.1747640323344;
        Mon, 19 May 2025 00:38:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231e2118b07sm50729645ad.43.2025.05.19.00.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 00:38:42 -0700 (PDT)
Message-ID: <9dd30014-1cf3-48c9-b666-8109485895a7@rivosinc.com>
Date: Mon, 19 May 2025 09:38:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib: sbi: pmu: Rework SSE callbacks
To: Atish Patra <atish.patra@linux.dev>, opensbi@lists.infradead.org
Cc: Anup Patel <apatel@ventanamicro.com>
References: <20250516152107.556643-1-cleger@rivosinc.com>
 <3522d188-0bd8-4fc6-abb4-fc3c54eb855a@linux.dev>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <3522d188-0bd8-4fc6-abb4-fc3c54eb855a@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_003845_173905_22354C08 
X-CRM114-Status: GOOD (  13.99  )
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

CgpPbiAxNy8wNS8yMDI1IDAyOjAyLCBBdGlzaCBQYXRyYSB3cm90ZToKPiBPbiA1LzE2LzI1IDg6
MjEgQU0sIENsw4PCqW1lbnQgTMODwqlnZXIgd3JvdGU6Cj4+IFRoZSBTLW1vZGUgUE1VIGRyaXZl
ciBtaWdodCBuZWVkIHRvIGVuYWJsZS9kaXNhYmxlIFNTRSBldmVudCByZWd1bGFybHkKPj4gaW4g
b3JkZXIgdG8gbWFzayBTU0UgZXZlbnRzLlRoaXMgY29tbWl0cyByZXdvcmtzIHRoZSBQTVUgU1NF
IGNhbGxiYWNrLgo+PiBTU0UgcmVnaXN0ZXIvdW5yZWdpc3RlciBub3cganVzdCBzZXRzIHRoZSBN
SURFTEVHIHJlZ2lzdGVyIGFuZAo+PiBlbmFibGUvZGlzYWJsZSBub3cgc2V0L2NsZWFyIE1JRS4g
TUlQIGNsZWFyaW5nIGlzIGFsc28gcmVtb3ZlZCBmcm9tCj4+IHBtdV9zc2VfZW5hYmxlKCkgc2lu
Y2UgaXQgY291bGQgbGVhZCB0byBsb3NpbmcgcGVuZGluZyBpbnRlcnJ1cHRzLgo+Pgo+IAo+IFRo
ZSBjaGFuZ2VzIGxvb2tzIGdvb2QuIEhvd2V2ZXIsIGNhbiB5b3UgcGxlYXNlIHNwbGl0IGludG8g
dHdvIGNvbW1pdHMgPwo+IE9uZSBmb3IgcmVnaXN0ZXIvdW5yZWdpc3RlciBwYXJ0IGFuZCBhbm90
aGVyIGZvciBNSVAgY2hhbmdlID8KPiAKPiBUaGUgTUlQIGNsZWFyaW5nIHBhcnQgaXMgYSBjcml0
aWNhbCBjaGFuZ2UgZm9yIGFueSBmdXR1cmUgU1NFIGV2ZW50Cj4gc2ltaWxhciB0byBMQ09GSVAu
IFRodXMsIEkgd291bGQgcHJlZmVyIHRoZSBoaXN0b3J5IHByZXNlcnZlcyB3aHkgTUlQCj4gd2Fz
IHJlbW92ZWQgZXhwbGljaXRseS4KClllcyBzdXJlLCB0aGF0IG1ha2VzIHNlbnNlLgoKVGhhbmtz
LAoKQ2zDqW1lbnQKCj4gCj4gCj4+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xl
Z2VyQHJpdm9zaW5jLmNvbT4KPj4gLS0tCj4+IMKgIGxpYi9zYmkvc2JpX3BtdS5jIHwgMjkgKysr
KysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2Vy
dGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlf
cG11LmMgYi9saWIvc2JpL3NiaV9wbXUuYwo+PiBpbmRleCA1OTgzYTc4NC4uNDZjMGUwZmIgMTAw
NjQ0Cj4+IC0tLSBhL2xpYi9zYmkvc2JpX3BtdS5jCj4+ICsrKyBiL2xpYi9zYmkvc2JpX3BtdS5j
Cj4+IEBAIC0xMDk3LDI0ICsxMDk3LDE1IEBAIHZvaWQgc2JpX3BtdV9leGl0KHN0cnVjdCBzYmlf
c2NyYXRjaCAqc2NyYXRjaCkKPj4gwqAgwqAgc3RhdGljIHZvaWQgcG11X3NzZV9lbmFibGUodWlu
dDMyX3QgZXZlbnRfaWQpCj4+IMKgIHsKPj4gLcKgwqDCoCBzdHJ1Y3Qgc2JpX3BtdV9oYXJ0X3N0
YXRlICpwaHMgPSBwbXVfdGhpc2hhcnRfc3RhdGVfcHRyKCk7Cj4+IC3CoMKgwqAgdW5zaWduZWQg
bG9uZyBpcnFfbWFzayA9IHNiaV9wbXVfaXJxX21hc2soKTsKPj4gLQo+PiAtwqDCoMKgIHBocy0+
c3NlX2VuYWJsZWQgPSB0cnVlOwo+PiAtwqDCoMKgIGNzcl9jbGVhcihDU1JfTUlERUxFRywgaXJx
X21hc2spOwo+PiAtwqDCoMKgIGNzcl9jbGVhcihDU1JfTUlQLCBpcnFfbWFzayk7Cj4+IC3CoMKg
wqAgY3NyX3NldChDU1JfTUlFLCBpcnFfbWFzayk7Cj4+ICvCoMKgwqAgY3NyX3NldChDU1JfTUlF
LCBzYmlfcG11X2lycV9tYXNrKCkpOwo+PiDCoCB9Cj4+IMKgIMKgIHN0YXRpYyB2b2lkIHBtdV9z
c2VfZGlzYWJsZSh1aW50MzJfdCBldmVudF9pZCkKPj4gwqAgewo+PiAtwqDCoMKgIHN0cnVjdCBz
YmlfcG11X2hhcnRfc3RhdGUgKnBocyA9IHBtdV90aGlzaGFydF9zdGF0ZV9wdHIoKTsKPj4gwqDC
oMKgwqDCoCB1bnNpZ25lZCBsb25nIGlycV9tYXNrID0gc2JpX3BtdV9pcnFfbWFzaygpOwo+PiDC
oCDCoMKgwqDCoMKgIGNzcl9jbGVhcihDU1JfTUlFLCBpcnFfbWFzayk7Cj4+IMKgwqDCoMKgwqAg
Y3NyX2NsZWFyKENTUl9NSVAsIGlycV9tYXNrKTsKPj4gLcKgwqDCoCBjc3Jfc2V0KENTUl9NSURF
TEVHLCBpcnFfbWFzayk7Cj4+IC3CoMKgwqAgcGhzLT5zc2VfZW5hYmxlZCA9IGZhbHNlOwo+PiDC
oCB9Cj4+IMKgIMKgIHN0YXRpYyB2b2lkIHBtdV9zc2VfY29tcGxldGUodWludDMyX3QgZXZlbnRf
aWQpCj4+IEBAIC0xMTIyLDcgKzExMTMsMjUgQEAgc3RhdGljIHZvaWQgcG11X3NzZV9jb21wbGV0
ZSh1aW50MzJfdCBldmVudF9pZCkKPj4gwqDCoMKgwqDCoCBjc3Jfc2V0KENTUl9NSUUsIHNiaV9w
bXVfaXJxX21hc2soKSk7Cj4+IMKgIH0KPj4gwqAgK3N0YXRpYyB2b2lkIHBtdV9zc2VfcmVnaXN0
ZXIodWludDMyX3QgZXZlbnRfaWQpCj4+ICt7Cj4+ICvCoMKgwqAgc3RydWN0IHNiaV9wbXVfaGFy
dF9zdGF0ZSAqcGhzID0gcG11X3RoaXNoYXJ0X3N0YXRlX3B0cigpOwo+PiArCj4+ICvCoMKgwqAg
cGhzLT5zc2VfZW5hYmxlZCA9IHRydWU7Cj4+ICvCoMKgwqAgY3NyX2NsZWFyKENTUl9NSURFTEVH
LCBzYmlfcG11X2lycV9tYXNrKCkpOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgdm9pZCBwbXVfc3Nl
X3VucmVnaXN0ZXIodWludDMyX3QgZXZlbnRfaWQpCj4+ICt7Cj4+ICvCoMKgwqAgc3RydWN0IHNi
aV9wbXVfaGFydF9zdGF0ZSAqcGhzID0gcG11X3RoaXNoYXJ0X3N0YXRlX3B0cigpOwo+PiArCj4+
ICvCoMKgwqAgcGhzLT5zc2VfZW5hYmxlZCA9IGZhbHNlOwo+PiArwqDCoMKgIGNzcl9zZXQoQ1NS
X01JREVMRUcsIHNiaV9wbXVfaXJxX21hc2soKSk7Cj4+ICt9Cj4+ICsKPj4gwqAgc3RhdGljIGNv
bnN0IHN0cnVjdCBzYmlfc3NlX2NiX29wcyBwbXVfc3NlX2NiX29wcyA9IHsKPj4gK8KgwqDCoCAu
cmVnaXN0ZXJfY2IgPSBwbXVfc3NlX3JlZ2lzdGVyLAo+PiArwqDCoMKgIC51bnJlZ2lzdGVyX2Ni
ID0gcG11X3NzZV91bnJlZ2lzdGVyLAo+PiDCoMKgwqDCoMKgIC5lbmFibGVfY2IgPSBwbXVfc3Nl
X2VuYWJsZSwKPj4gwqDCoMKgwqDCoCAuZGlzYWJsZV9jYiA9IHBtdV9zc2VfZGlzYWJsZSwKPj4g
wqDCoMKgwqDCoCAuY29tcGxldGVfY2IgPSBwbXVfc3NlX2NvbXBsZXRlLAo+IAoKCi0tIApvcGVu
c2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
