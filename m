Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352EFD1CDC6
	for <opensbi@archiver.kernel.org>; Tue,  9 Dec 2025 06:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=70v67j+Onf2jXS87F1cklc75+Sa1SAqmimdJa6nYuV8=; b=DQg9ieaPfwBJTp
	w7fvkuyIvmaSn2UsLb+cEBpngEIp/xtLDelY4JRvQaCyCgo7f72MKun5LSqCnXfOHEEBV0vW7wT3D
	Q6Cd3N+7c0dwA3G4N1I5zUIeXrzcqgRupk6C1ujsC9eDnhbHiJwcOUC6uAUuQ8j02noeyn2gUjitc
	YzSLUwy+dHOknSihwOqJiUXuoDU7mpJoHXzO4D5j/iKnG8y5FqfxJ+jM6B3TSNZu8QR/Fifx3wfuQ
	zaV+Wa8CWFk4Nm/ZjYWou7IjDliPEV+3RGMsYmYIik71iePyLtfRZQyQZBqn6IU1q7araggYvoosy
	0HjOLJ5BFMQJFCW2j/uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSrHa-0000000DtQe-1K60;
	Tue, 09 Dec 2025 06:33:10 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSrHY-0000000DtQE-1TBn
	for opensbi@lists.infradead.org;
	Tue, 09 Dec 2025 06:33:09 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso6540771b3a.1
        for <opensbi@lists.infradead.org>; Mon, 08 Dec 2025 22:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1765261987; x=1765866787; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SRQcmFS8gEwpnBqRfLFg8jo/GOwRPxgdXCEMjiVXLzc=;
        b=i6ChD0fkFGTcOJk2Fr1pkbwdO2/Qu1TCPPQczOwRzohCsKcwzwvBR+GpBwib+mCOnQ
         u2XUyzDUYQ9XrXrTi8Duhkjt3ybpoQ+Q4j3FjCYa2bIXF18Rxv383xSpHbDqaaVeJgSp
         mz8hZO9TTkXYxho51+n2GzxfMRKoyw+Co5H/ClXJOarFcqf6hCXG5a6niNXbdK4k5GU4
         XHXrgOOwkFlYe5R/YDlQwZELYyVjgQPOCsR0Mhyuq+PuF+7h8pqbamYmR8As5193Dg39
         rUfPODIyxGcs23xN3+8pW5/FMi5dcXhSIqw+TwZbErKZwagE7WfEBdOnQim3iTIJJAeo
         e+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765261987; x=1765866787;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRQcmFS8gEwpnBqRfLFg8jo/GOwRPxgdXCEMjiVXLzc=;
        b=HKYNY6+tHhYhvrmy2Zp6i99yrU2t5gPOWGh/jiivcGdu54n20My9x6pdGFNGyCtxdy
         88LAppHfo+UvV9W4/CSbGbFTbCjUrF0//Zrt79jnZdMpThJepeKV+CuZKDiU4duUIa0X
         Bs8rVjHM/zxaFWqI2T6x5HGL+mEDTwGOm+bxLDPN00VRfVE14HvYbBCecRqIRRmw6xDB
         vsbUBB8Za/lFWLeT99hpQxujT0W0jNTFNUDPI7VzR0Zd51FBudmpsmwAVuPtMHu+0mUh
         slWA/pyjXEG+5Kfs1EtzBi8SwoCqm3vACefR7if86FqTKhFq44F1zhJvKHSazeWnDdXX
         7GCA==
X-Forwarded-Encrypted: i=1; AJvYcCX/oTsJ8MA7P0S7WKkrCR6ywxqLy9TpjVy81Lu4MOEA89RTcv43v+v+zEWTSY0u51CDWFQt055b@lists.infradead.org
X-Gm-Message-State: AOJu0YxQmpjUGFXeYUubD56J6PEmfE4kDYTb3a+7xl8f9jk56/djT3/6
	uAWp5mKe4X7h744YCmw7B7CruGjMixUTlUn6PlI4cCzDqTfBgi5AG/W1boa91aDvFXR7wtmljQF
	U3lFQ
X-Gm-Gg: ASbGncv8l1cstboRtqpbjlXQwncDiG1/MZXK5uZSYnWDwK6F+k3CCauSBKI2l/TvHfE
	MYo6AmbgdtMLxg1jQM1SQ26JqCQjio1FuLHpwixr2wQiiMo+HuLvKNsFFEQksTeRO8ZSjk0TCaG
	Sto6gc/gqjVTxSjf9KUPXBVfPD1+Lp+KcKIjBDlYKM4kedWVmIYYCesajrcF///TCIiLoffNYvU
	67x7MJ/0FK0CzrRIYeRWtBmCZKfEzkEQylir8X3t0yIECXTaeGSRbqF8yQxIU/o5HmQmBEtiQRC
	tBcRvMO3jZRn3oDHKyFzLRtigRZ4q98HYhtRFNss8NRSqsuYnS2DJSK2SVdeLfi0jAVgnstYchO
	qE//8bJ/LFdyWWb5g869lNTyZ2pCI4TeVsKmsa+ufrHO618JkRDnaxUbpibj/OnMlOyrKQWbrM/
	Thn4OnDsGse89El8UJg/ixW6vLxPfqDRC0j2Opi0XATg==
X-Google-Smtp-Source: AGHT+IEZ/FLk9HJmsDFNep5c+Mj6sPaPoq/C9XBy+N5bzfWuVzwE+ONdk3cKz5kLpb4K73Y59MWGPw==
X-Received: by 2002:a05:6a00:2e0f:b0:7e8:4433:8f9b with SMTP id d2e1a72fcca58-7e8c542b45fmr8329392b3a.35.1765261982158;
        Mon, 08 Dec 2025 22:33:02 -0800 (PST)
Received: from [100.64.0.1] ([165.225.110.109])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2ae6fa818sm14992554b3a.48.2025.12.08.22.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 22:33:01 -0800 (PST)
Message-ID: <49c1fe3b-8d77-4d22-9b08-8698ffd8ccb1@sifive.com>
Date: Tue, 9 Dec 2025 15:32:59 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform: generic: Keep some empty space in FDT passed
 to next stage
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>, opensbi@lists.infradead.org
References: <20251201050014.8788-1-apatel@ventanamicro.com>
 <4d25665d-d152-47ab-8da6-c7297dd117b3@sifive.com>
 <CAAhSdy367b6XBKSWp4PoKeDi7uz3L08oncSyb9c8rk+AmLqbHw@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <CAAhSdy367b6XBKSWp4PoKeDi7uz3L08oncSyb9c8rk+AmLqbHw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_223308_395666_5F8AB37A 
X-CRM114-Status: GOOD (  22.84  )
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

SGkgQW51cCwKCk9uIDIwMjUtMTItMDcgMTE6NTMgUE0sIEFudXAgUGF0ZWwgd3JvdGU6Cj4gT24g
U3VuLCBEZWMgNywgMjAyNSBhdCA0OjI54oCvUE0gU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xs
YW5kQHNpZml2ZS5jb20+IHdyb3RlOgo+PiBPbiAyMDI1LTExLTMwIDExOjAwIFBNLCBBbnVwIFBh
dGVsIHdyb3RlOgo+Pj4gTGVhdmluZyBubyBlbXB0eSBzcGFjZSBpbiB0aGUgRkRUIHBhc3NlZCB0
byB0aGUgbmV4dCBib290aW5nIHN0YWdlCj4+PiBjYXVzZXMgdGhlIGZvbGxvd2luZyBVLUJvb3Qg
Y3Jhc2ggb24gVmVudGFuYSBpbnRlcm5hbCBwbGF0Zm9ybXM6Cj4+Pgo+Pj4gVW5oYW5kbGVkIGV4
Y2VwdGlvbjogTG9hZCBhY2Nlc3MgZmF1bHQKPj4+IEVQQzogMDAwMDAwMDBmZmZhNjM3MiBSQTog
MDAwMDAwMDBmZmZhNzQxOCBUVkFMOiAwMDAxNzQ2MTc0NzMwMDY4Cj4+PiBFUEM6IDAwMDAwMDAw
ODAyNDUzNzIgUkE6IDAwMDAwMDAwODAyNDY0MTggcmVsb2MgYWRqdXN0ZWQKPj4+Cj4+PiBTUDog
IDAwMDAwMDAwZmVmMzg0NDAgR1A6ICAwMDAwMDAwMGZlZjQwZTYwIFRQOiAgMDAwMDAwMDAwMDAw
MDAwMAo+Pj4gVDA6ICAwMDAwMDAwMGZlZjQwYTcwIFQxOiAgMDAwMDAwMDAwMDAwZmYwMCBUMjog
IDAwMDAwMDAwMDAwMDAwMDAKPj4+IFMwOiAgMDAwMDAwMDBmZmZjMTdhOCBTMTogIDAwMDAwMDAw
ZmVmMzhkNDAgQTA6ICA3Mzc1NzQ2MTc0NzMwMDY4Cj4+PiBBMTogIDAwMDAwMDAwZmZmYzE3YTgg
QTI6ICAwMDAwMDAwMDAwMDAwMDEwIEEzOiAgMDAwMDAwMDAwMDAwMDAxMAo+Pj4gQTQ6ICAwMDAw
MDAwMDAwMDAwMDAwIEE1OiAgMDAwMDAwMDBmZmZjMTdiOCBBNjogIDAwMDAwMDAwMDBmZjAwMDAK
Pj4+IEE3OiAgMDAwMDAwMDAwMDAwYjEwMCBTMjogIDAwMDAwMDAwMDAwMDAwMDAgUzM6ICAwMDAw
MDAwMDAwMDAwMDAxCj4+PiBTNDogIDAwMDAwMDAwZmVmMzhkNDAgUzU6ICA3Mzc1NzQ2MTc0NzMw
MDY4IFM2OiAgMDAwMDAwMDAwMDAwMDAwMAo+Pj4gUzc6ICAwMDAwMDAwMGZlZjRlZWYwIFM4OiAg
MDAwMDAwMDBmZWY0ZWY5MCBTOTogIDAwMDAwMDAwMDAwMDAwMDAKPj4+IFMxMDogMDAwMDAwMDAw
MDAwMDAwMCBTMTE6IDAwMDAwMDAwZmVmNGVmYzAgVDM6ICAwMDAwMDAwMGZlZjQwZWE4Cj4+PiBU
NDogIDAwMDAwMDAwMDBmZjAwMDAgVDU6ICAwMDAwMDAwMGZlZjQwYTYwIFQ2OiAgMDAwMDAwMDBm
ZWY0MGE2Ywo+Pj4KPj4+IFRvIGFkZHJlc3MgdGhlIGFib3ZlIGlzc3VlLCBrZWVwIHNvbWUgbWlu
aW1hbCBlbXB0eSBzcGFjZSBpbiB0aGUKPj4+IEZEVCBpbnN0ZWFkIG9mIG5vIGVtcHR5IHNwYWNl
Lgo+Pj4KPj4+IEZpeGVzOiBiYmU5YTIzMDYwZTkgKCJwbGF0Zm9ybTogZ2VuZXJpYzogUGFjayB0
aGUgRkRUIGFmdGVyIGFwcGx5aW5nIGZpeHVwcyIpCj4+PiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBh
dGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPj4+IC0tLQo+Pj4gQ2hhbmdlcyBzaW5jZSB2
MToKPj4+IC0gQWRkIEtjb25maWcgb3B0aW9uIGZvciBhbW91bnQgb2YgZW1wdHkgc3BhY2UgaW4g
RkRUIHdpdGggZGVmYXVsdAo+Pj4gICB2YWx1ZSBhcyA0S0IKPj4+IC0tLQo+Pj4gIHBsYXRmb3Jt
L2dlbmVyaWMvS2NvbmZpZyAgICB8IDUgKysrKysKPj4+ICBwbGF0Zm9ybS9nZW5lcmljL3BsYXRm
b3JtLmMgfCAzICsrKwo+Pj4gIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4+Pgo+
Pj4gZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2dlbmVyaWMvS2NvbmZpZyBiL3BsYXRmb3JtL2dlbmVy
aWMvS2NvbmZpZwo+Pj4gaW5kZXggMjViODg4NmIuLmIxODA4MDEyIDEwMDY0NAo+Pj4gLS0tIGEv
cGxhdGZvcm0vZ2VuZXJpYy9LY29uZmlnCj4+PiArKysgYi9wbGF0Zm9ybS9nZW5lcmljL0tjb25m
aWcKPj4+IEBAIC0yMyw2ICsyMywxMSBAQCBjb25maWcgUExBVEZPUk1fR0VORVJJQ19NSU5PUl9W
RVIKPj4+ICAgICAgIHJhbmdlIDAgNjU1MzUKPj4+ICAgICAgIGRlZmF1bHQgMQo+Pj4KPj4+ICtj
b25maWcgUExBVEZPUk1fR0VORVJJQ19GRFRfRU1QVFlfU1BBQ0UKPj4+ICsgICAgIGludCAiUGxh
dGZvcm0gRkRUIGVtcHR5IHNwYWNlIChLQikiCj4+PiArICAgICByYW5nZSAwIDEwMjQKPj4+ICsg
ICAgIGRlZmF1bHQgNAo+Pgo+PiBTaW5jZSB0aGlzIGlzIGEgd29ya2Fyb3VuZCBmb3IgYSBzcGVj
aWZpYyBwbGF0Zm9ybSwgYW5kIHRoZSB3b3JrYXJvdW5kIHNob3VsZAo+PiBldmVudHVhbGx5IGJl
IG9ic29sZXRlZCBieSBhIFUtQm9vdCBmaXgsIHBsZWFzZSBkZWZhdWx0IHRoaXMgdG8gemVyby4K
PiAKPiBBbHRob3VnaCB0aGUgaXNzdWUgbWFuaWZlc3RzIG9uIFZlbnRhbmEgaW50ZXJuYWwgcGxh
dGZvcm1zLAo+IHRoZSBpc3N1ZSBpcyBub3QgVmVudGFuYSBzcGVjaWZpYyBhbmQgY2FuIGhhcHBl
biBvbiBhbnkgcGxhdGZvcm0KPiB3aGVyZSBVLUJvb3QgdHJpZXMgdG8gbW9kaWZ5IEZEVCBwYXNz
ZWQgYnkgT3BlblNCSSB3aXRob3V0Cj4gYWRkaW5nIGV4dHJhIHNwYWNlLgoKSXQncyBzdGlsbCBh
IFUtQm9vdCBidWcsIG5vPyBJcyB5b3VyIHBsYW4gdG8ga2VlcCB0aGUgd29ya2Fyb3VuZCBpbmRl
ZmluaXRlbHk/Cgo+Pj4gKwo+Pj4gIGNvbmZpZyBQTEFURk9STV9BTExXSU5ORVJfRDEKPj4+ICAg
ICAgIGJvb2wgIkFsbHdpbm5lciBEMSBzdXBwb3J0Igo+Pj4gICAgICAgZGVwZW5kcyBvbiBGRFRf
SVJRQ0hJUF9QTElDCj4+PiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5j
IGIvcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jCj4+PiBpbmRleCBlNjZmOTlmYS4uZGRmYzll
ODAgMTAwNjQ0Cj4+PiAtLS0gYS9wbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMKPj4+ICsrKyBi
L3BsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYwo+Pj4gQEAgLTI0NSw3ICsyNDUsMTAgQEAgaW50
IGdlbmVyaWNfZmluYWxfaW5pdChib29sIGNvbGRfYm9vdCkKPj4+ICAgICAgIGZkdF9maXh1cHMo
ZmR0KTsKPj4+ICAgICAgIGZkdF9kb21haW5fZml4dXAoZmR0KTsKPj4+Cj4+PiArICAgICAvKiBN
aW5pbWl6ZSB0aGUgZW1wdHkgc3BhY2UgaW4gRkRUIHRvIDRLQiAqLwo+Pgo+PiBUaGlzIGNvbW1l
bnQgaXMgbm8gbG9uZ2VyIGFjY3VyYXRlLCBzaW5jZSB0aGUgcGFkZGluZyBpcyBub3QgYSBmaXhl
ZCBzaXplLgo+IAo+IFN1cmUsIEkgd2lsbCB1cGRhdGUuCj4gCj4+Cj4+PiAgICAgICBmZHRfcGFj
ayhmZHQpOwo+Pj4gKyAgICAgZmR0X29wZW5faW50byhmZHQsIGZkdCwgZmR0X3RvdGFsc2l6ZShm
ZHQpICsKPj4+ICsgICAgICAgICAgICAgICAgICAgQ09ORklHX1BMQVRGT1JNX0dFTkVSSUNfRkRU
X0VNUFRZX1NQQUNFICogMTAyNCk7Cj4+Cj4+IFRoaXMgY2hhbmdlIHJlaW50cm9kdWNlcyB0aGUg
cHJvYmxlbSB0aGF0IG1vdGl2YXRlZCBhZGRpbmcgZmR0X3BhY2soKS4KPj4gZmR0X29wZW5faW50
bygpIGRvZXMgbm90IGluaXRpYWxpemUgdGhlIHVudXNlZCBzcGFjZSwgc28gb25jZSBhZ2FpbiB0
aGUgcmFuZ2UKPj4gW2ZkdCwgZmR0ICsgZmR0X3RvdGFsc2l6ZShmZHQpKSBjb250YWlucyB1bml0
aWFsaXplZCBkYXRhLgo+Pgo+PiBJZiBoYXZpbmcgdW5pdGlhbGl6ZWQgZGF0YSBpbiB0aGUgRkRU
IGJsb2IgaXMgbm90IGEgcHJvYmxlbSBvbiB0aGUgcGxhdGZvcm0KPj4gcmVxdWlyaW5nIHRoaXMg
d29ya2Fyb3VuZCwgdGhlbiBJIHN1cHBvc2UgdGhlIGNvZGUgaXMgZmluZS4gT3RoZXJ3aXNlLCB0
aGlzCj4+IHdvdWxkIG5lZWQgYSBtZW1zZXQoKS4KPiAKPiBJIHRoaW5rIGl0IGlzIGJldHRlciB0
byBkbyBtZW1zZXQoKSBvbiBhZGRpdGlvbmFsIHNwYWNlIGluIGZkdF9vcGVuX2ludG8oKQo+IGl0
c2VsZiBidXQgdGhhdCB3b3VsZCBiZSBhIHNlcGFyYXRlIGNoYW5nZSBpbiBsaWJmZHQuCgpJIGRv
bid0IGhhdmUgYW4gb3BpbmlvbiBvbiB3aGV0aGVyIGl0IGlzIGJldHRlciB0byBjaGFuZ2UgbGli
ZmR0LCBidXQgd2UgbmVlZCB0bwphZGQgdGhlIG1lbXNldCgpIGluIGF0IGxlYXN0IG9uZSBwbGFj
ZSB0byBhdm9pZCByZWdyZXNzaW5nIGhlcmUuCgpSZWdhcmRzLApTYW11ZWwKCgotLSAKb3BlbnNi
aSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
