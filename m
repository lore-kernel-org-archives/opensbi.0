Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEE6CCFA04
	for <opensbi@archiver.kernel.org>; Tue,  4 Nov 2025 04:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6uq0GDtxo08CjkcOrTEaY+vRT2qSZKiWALBUhpDmjbY=; b=a+eMwNyALnF87T
	Ox26WvyUKrqoGWepp8rn3tyt57RnVGatTZqWEtnykdCYYLvFI45RbgEbx0KkJdF3nl1ryHnp9duT3
	MqmsRAiM/vbDvthTQ3r2OxHgJ7DAwsoopwqsnVd76ftcwKSEN4C+5XG5LZCdsAr3GlJ8jGTQ9zkrJ
	yZtUp5cYlVMDDdk64zZ6NDCtYHb9Bg3/YPYvEAjpKQhwkvaPKJvoJ7rS5kUlgOGSteY5PgMio8pjY
	LvtMYEjx/PTlNYQr2iNwYnbLS9elxMn63/FqgxJcfyxgRWAD7CRsJavW9Ao+5Z/vzC0qwR1P8mHUK
	wppxYf6Ula7fYZdrbOjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG8ua-0000000B9Oz-1YUa;
	Tue, 04 Nov 2025 04:44:52 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG8uX-0000000B9Oa-3NTw
	for opensbi@lists.infradead.org;
	Tue, 04 Nov 2025 04:44:51 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-4330d78f935so36150395ab.2
        for <opensbi@lists.infradead.org>; Mon, 03 Nov 2025 20:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1762231489; x=1762836289; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KydNVly0VH2RiLNE1Yr5Toqv6p4LvD1Z1Asu5PEme6U=;
        b=aZqoGqv9R/2entMWxV/HPV1RFWtVzBZ8WA4qY4nvh1L6V/Th584iV3hQiEIMBcWbyb
         ZxqlGSjQnYVc0dqgci8pN4OtGsUoRoPWnBNTvZRJtNPCxyN/MmFfjz6nupmf+Gd1CUwm
         9p4ZU90djAifPoAUnlcGeTUIGerTn8s0jqsf0YOBcUtinZs1Nd3ZvnC2uRblZM0YPkmE
         7/iInwEpXW08uU0i46IyWGvY/tta0X5/v8wheeik5Z/DmEQgQq6Qn7n2Z+q90LpuXs9D
         8EjTQx4nKwj563hN0njjdyRx+YICIJdI43LP2rrxOiO53zF3c0aFVKJRx9FaYLszVQwl
         Alxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762231489; x=1762836289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KydNVly0VH2RiLNE1Yr5Toqv6p4LvD1Z1Asu5PEme6U=;
        b=IzZyqmQxEPBVBuAXYt6chjp/asUMaPzyE5yIwHjUSWhKXPQovXYKo3KSef1nd5vghV
         hC8B1iyCMXD75sIIXqQXeEkpMxU56JW5qsz9bYuIuyEhvbra5V4yffwwJYKj/h8bzaVo
         ohRSKvKi9cdjMdq5oxbcv8/BhcPjdzi+k/wDkWN06Eftjj7T6155My9RQz/hiYUMh0si
         wTxwdH+Ahwm26TcKfqRlwUNzb2nM3IXeCDMWr0eq+oajXC8uK24uKK6PXGjlgi9JbOt0
         DP/7GNH0IonSZAwRXdkivG2zlC+CnfFCBCg6RpSbC6WecrdvQTxEEy3FnrWLETg+KE/g
         JW+Q==
X-Gm-Message-State: AOJu0YxgvfAH4+0QfoxD6YrLECTDTL/OxumUhPoetwIlZwnKXZHvYn0e
	LFgg7qxvIvGCvk1SACk2chVbPiXXWCLrftdhucyR1zFTqxSmtB2PQk94zfotGdeChLeST7bk2Ez
	xIfoq0TfJ9OVDaoTv4WAxQySNjHA/J51n6cj1tpYX3rYA8wxbUPDgMhM=
X-Gm-Gg: ASbGnctRuV7g0quqEcbVu22CKy7vPbz65uzUIzfv4DmMmV8Kksod2qnrOrZdYAZOljh
	Hfb23XYyzUcpUleYP3Smv+WVpudQXbe0aPV2FTyrc2BHhOTVbOlY62JAdCbckMU3SEmh8sqkXl8
	16HIIu1jK/ervJdg7wgqOWArRUcE6fPC6EdGNC1NOMuWhh1i+0QqJwItrOfUBD3/PfPHSWB60E6
	JvwDlujgDQxW5pGu23qew3PUqZphL1CFGYyUsOPMboRMzJnW1NbDPzvwVYn1J8RdD4uF/s=
X-Google-Smtp-Source: AGHT+IGnfsVDJtZzV+FkaUJtiGdu6mDs52jNKOa7kxrMghqRinJ5nP8vxVT1ER5kaULWxCb4T1jCeSOTGSv+k4USnFA=
X-Received: by 2002:a05:6e02:b27:b0:430:b05a:ecbe with SMTP id
 e9e14a558f8ab-4330d126b2bmr234464915ab.4.1762231488651; Mon, 03 Nov 2025
 20:44:48 -0800 (PST)
MIME-Version: 1.0
References: <20250923095803.71287-1-cp0613@linux.alibaba.com>
In-Reply-To: <20250923095803.71287-1-cp0613@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 4 Nov 2025 10:14:37 +0530
X-Gm-Features: AWmQ_bl5DoYfBw2Djn5iTS0zFMJGsQl7MhzapZoJIq1XMdmlYnRlI259cL2LZ5k
Message-ID: <CAAhSdy2GMYMb1yOkzxmfE9raiCtsd+8UkrvsEPZ2U=sv4hZ6tg@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: Enable Ssqosid Ext using mstateen0
To: cp0613@linux.alibaba.com
Cc: opensbi@lists.infradead.org, guoren@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_204449_856858_5FA93358 
X-CRM114-Status: GOOD (  21.75  )
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

T24gVHVlLCBTZXAgMjMsIDIwMjUgYXQgMzoyOOKAr1BNIDxjcDA2MTNAbGludXguYWxpYmFiYS5j
b20+IHdyb3RlOgo+Cj4gRnJvbTogQ2hlbiBQZWkgPGNwMDYxM0BsaW51eC5hbGliYWJhLmNvbT4K
Pgo+IFRoZSBRb1MgSWRlbnRpZmllcnMgZXh0ZW5zaW9uIChTc3Fvc2lkKSBpbnRyb2R1Y2VzIHRo
ZSBzcm1jZmcgcmVnaXN0ZXIsCj4gd2hpY2ggY29uZmlndXJlcyBhIGhhcnQgd2l0aCB0d28gaWRl
bnRpZmllcnM6IGEgUmVzb3VyY2UgQ29udHJvbCBJRAo+IChSQ0lEKSBhbmQgYSBNb25pdG9yaW5n
IENvdW50ZXIgSUQgKE1DSUQpLiBUaGVzZSBpZGVudGlmaWVycyBhY2NvbXBhbnkKPiBlYWNoIHJl
cXVlc3QgaXNzdWVkIGJ5IHRoZSBoYXJ0IHRvIHNoYXJlZCByZXNvdXJjZSBjb250cm9sbGVycy4K
Pgo+IElmIGV4dGVuc2lvbiBTbXN0YXRlZW4gaXMgaW1wbGVtZW50ZWQgdG9nZXRoZXIgd2l0aCBT
c3Fvc2lkLCB0aGVuCj4gU3Nxb3NpZCBhbHNvIHJlcXVpcmVzIHRoZSBTUk1DRkcgYml0IGluIG1z
dGF0ZWVuMCB0byBiZSBpbXBsZW1lbnRlZC4gSWYKPiBtc3RhdGVlbjAuU1JNQ0ZHIGlzIDAsIGF0
dGVtcHRzIHRvIGFjY2VzcyBzcm1jZmcgaW4gcHJpdmlsZWdlIG1vZGVzIGxlc3MKPiBwcml2aWxl
Z2VkIHRoYW4gTS1tb2RlIHJhaXNlIGFuIGlsbGVnYWwtaW5zdHJ1Y3Rpb24gZXhjZXB0aW9uLiBJ
Zgo+IG1zdGF0ZWVuMC5TUk1DRkcgaXMgMSBvciBpZiBleHRlbnNpb24gU21zdGF0ZWVuIGlzIG5v
dCBpbXBsZW1lbnRlZCwKPiBhdHRlbXB0cyB0byBhY2Nlc3Mgc3JtY2ZnIHdoZW4gVj0xIHJhaXNl
IGEgdmlydHVhbC1pbnN0cnVjdGlvbiBleGNlcHRpb24uCj4KPiBUaGlzIGV4dGVuc2lvbiBjYW4g
YmUgZm91bmQgaW4gdGhlIFJJU0MtViBJbnN0cnVjdGlvbiBTZXQgTWFudWFsOgo+IGh0dHBzOi8v
Z2l0aHViLmNvbS9yaXNjdi9yaXNjdi1pc2EtbWFudWFsCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaGVu
IFBlaSA8Y3AwNjEzQGxpbnV4LmFsaWJhYmEuY29tPgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9yaXNj
dl9lbmNvZGluZy5oIHwgNSArKysrKwo+ICBpbmNsdWRlL3NiaS9zYmlfaGFydC5oICAgICAgIHwg
MiArKwo+ICBsaWIvc2JpL3NiaV9oYXJ0LmMgICAgICAgICAgIHwgOSArKysrKysrKysKPiAgMyBm
aWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9z
YmkvcmlzY3ZfZW5jb2RpbmcuaCBiL2luY2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmgKPiBpbmRl
eCA0MGE4NTRlLi44OGQyM2I5IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvc2JpL3Jpc2N2X2VuY29k
aW5nLmgKPiArKysgYi9pbmNsdWRlL3NiaS9yaXNjdl9lbmNvZGluZy5oCj4gQEAgLTM4OSw2ICsz
ODksOSBAQAo+ICAvKiBWUy1MZXZlbCBDb250cm9sIHRyYW5zZmVyIHJlY29yZHMgQ1NScyAqLwo+
ICAjZGVmaW5lIENTUl9WU0NUUkNUTCAgICAgICAgICAgICAgICAgICAgMHgyNGUKPgo+ICsvKiBT
dXBlcnZpc29yIFJlc291cmNlIE1hbmFnZW1lbnQgQ29uZmlndXJhdGlvbiBDU1JzICovCj4gKyNk
ZWZpbmUgQ1NSX1NSTUNGRyAgICAgICAgICAgICAgICAgICAgIDB4MTgxCj4gKwo+ICAvKiA9PT09
PSBIeXBlcnZpc29yLWxldmVsIENTUnMgPT09PT0gKi8KPgo+ICAvKiBIeXBlcnZpc29yIFRyYXAg
U2V0dXAgKEgtZXh0ZW5zaW9uKSAqLwo+IEBAIC04MTUsNiArODE4LDggQEAKPiAgI2RlZmluZSBT
TVNUQVRFRU4wX0ZDU1IgICAgICAgICAgICAgICAgICAgICAgICAoX1VMTCgxKSA8PCBTTVNUQVRF
RU4wX0ZDU1JfU0hJRlQpCj4gICNkZWZpbmUgU01TVEFURUVOMF9DVFJfU0hJRlQgICAgICAgICAg
IDU0Cj4gICNkZWZpbmUgU01TVEFURUVOMF9DVFIgICAgICAgICAgICAgICAgIChfVUxMKDEpIDw8
IFNNU1RBVEVFTjBfQ1RSX1NISUZUKQo+ICsjZGVmaW5lIFNNU1RBVEVFTjBfU1JNQ0ZHX1NISUZU
ICAgICAgICAgICAgICAgIDU1Cj4gKyNkZWZpbmUgU01TVEFURUVOMF9TUk1DRkcgICAgICAgICAg
ICAgIChfVUxMKDEpIDw8IFNNU1RBVEVFTjBfU1JNQ0ZHX1NISUZUKQo+ICAjZGVmaW5lIFNNU1RB
VEVFTjBfQ09OVEVYVF9TSElGVCAgICAgICA1Nwo+ICAjZGVmaW5lIFNNU1RBVEVFTjBfQ09OVEVY
VCAgICAgICAgICAgICAoX1VMTCgxKSA8PCBTTVNUQVRFRU4wX0NPTlRFWFRfU0hJRlQpCj4gICNk
ZWZpbmUgU01TVEFURUVOMF9JTVNJQ19TSElGVCAgICAgICAgIDU4Cj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvc2JpL3NiaV9oYXJ0LmggYi9pbmNsdWRlL3NiaS9zYmlfaGFydC5oCj4gaW5kZXggODJi
MTlkYy4uZmY1MDFmNSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfaGFydC5oCj4gKysr
IGIvaW5jbHVkZS9zYmkvc2JpX2hhcnQuaAo+IEBAIC04MSw2ICs4MSw4IEBAIGVudW0gc2JpX2hh
cnRfZXh0ZW5zaW9ucyB7Cj4gICAgICAgICBTQklfSEFSVF9FWFRfU1NDVFIsCj4gICAgICAgICAv
KiogSEFSVCBoYXMgU3NzdGF0ZWVuIGV4dGVuc2lvbiAqKi8KPiAgICAgICAgIFNCSV9IQVJUX0VY
VF9TU1NUQVRFRU4sCj4gKyAgICAgICAvKiogSGFydCBoYXMgU3Nxb3NpZCBleHRlbnNpb24gKi8K
PiArICAgICAgIFNCSV9IQVJUX0VYVF9TU1FPU0lELAo+Cj4gICAgICAgICAvKiogTWF4aW11bSBp
bmRleCBvZiBIYXJ0IGV4dGVuc2lvbiAqLwo+ICAgICAgICAgU0JJX0hBUlRfRVhUX01BWCwKPiBk
aWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaGFydC5jIGIvbGliL3NiaS9zYmlfaGFydC5jCj4gaW5k
ZXggYzA4NTgwNC4uYWFmOTIyYiAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9oYXJ0LmMKPiAr
KysgYi9saWIvc2JpL3NiaV9oYXJ0LmMKPiBAQCAtMTEwLDYgKzExMCwxMSBAQCBzdGF0aWMgdm9p
ZCBtc3RhdHVzX2luaXQoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoKQo+ICAgICAgICAgICAg
ICAgICBlbHNlCj4gICAgICAgICAgICAgICAgICAgICAgICAgbXN0YXRlZW5fdmFsICY9IH5TTVNU
QVRFRU4wX0NUUjsKPgo+ICsgICAgICAgICAgICAgICBpZiAoc2JpX2hhcnRfaGFzX2V4dGVuc2lv
bihzY3JhdGNoLCBTQklfSEFSVF9FWFRfU1NRT1NJRCkpCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgbXN0YXRlZW5fdmFsIHw9IChTTVNUQVRFRU4wX1NSTUNGRyk7Cj4gKyAgICAgICAgICAgICAg
IGVsc2UKPiArICAgICAgICAgICAgICAgICAgICAgICBtc3RhdGVlbl92YWwgJj0gfihTTVNUQVRF
RU4wX1NSTUNGRyk7Cj4gKwoKU2luY2Ugd2UgYXJlIGVuYWJsaW5nIFNybWNmZyBDU1IgZm9yIFMt
bW9kZSwgd2Ugc2hvdWxkIGFsc28gY29udGV4dApzd2l0Y2ggaXQgaW4gdGhlIHN3aXRjaF90b19u
ZXh0X2RvbWFpbl9jb250ZXh0KCkgZnVuY3Rpb24uCgo+ICAgICAgICAgICAgICAgICBjc3Jfd3Jp
dGU2NChDU1JfTVNUQVRFRU4wLCBtc3RhdGVlbl92YWwpOwo+ICAgICAgICAgICAgICAgICBjc3Jf
d3JpdGU2NChDU1JfTVNUQVRFRU4xLCBTTVNUQVRFRU5fU1RBVEVOKTsKPiAgICAgICAgICAgICAg
ICAgY3NyX3dyaXRlNjQoQ1NSX01TVEFURUVOMiwgU01TVEFURUVOX1NUQVRFTik7Cj4gQEAgLTcy
Nyw2ICs3MzIsNyBAQCBjb25zdCBzdHJ1Y3Qgc2JpX2hhcnRfZXh0X2RhdGEgc2JpX2hhcnRfZXh0
W10gPSB7Cj4gICAgICAgICBfX1NCSV9IQVJUX0VYVF9EQVRBKHNtY3RyLCBTQklfSEFSVF9FWFRf
U01DVFIpLAo+ICAgICAgICAgX19TQklfSEFSVF9FWFRfREFUQShzc2N0ciwgU0JJX0hBUlRfRVhU
X1NTQ1RSKSwKPiAgICAgICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEoc3NzdGF0ZWVuLCBTQklfSEFS
VF9FWFRfU1NTVEFURUVOKSwKPiArICAgICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEoc3Nxb3NpZCwg
U0JJX0hBUlRfRVhUX1NTUU9TSUQpLAo+ICB9Owo+Cj4gIF9TdGF0aWNfYXNzZXJ0KFNCSV9IQVJU
X0VYVF9NQVggPT0gYXJyYXlfc2l6ZShzYmlfaGFydF9leHQpLAo+IEBAIC05ODksNiArOTk1LDkg
QEAgX19wbXBfc2tpcDoKPiAgICAgICAgIC8qIERldGVjdCBpZiBoYXJ0IHN1cHBvcnRzIHNtY250
cnBtZiAqLwo+ICAgICAgICAgX19jaGVja19leHRfY3NyKFNCSV9IQVJUX1BSSVZfVkVSXzFfMTIs
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgQ1NSX01DWUNMRUNGRywgU0JJX0hBUlRfRVhUX1NN
Q05UUlBNRik7Cj4gKyAgICAgICAvKiBEZXRlY3QgaWYgaGFydCBzdXBwb3J0cyBzc3Fvc2lkICov
Cj4gKyAgICAgICBfX2NoZWNrX2V4dF9jc3IoU0JJX0hBUlRfUFJJVl9WRVJfMV8xMiwKPiArICAg
ICAgICAgICAgICAgICAgICAgICBDU1JfU1JNQ0ZHLCBTQklfSEFSVF9FWFRfU1NRT1NJRCk7CgpG
b3IgbmV3ZXIgZXh0ZW5zaW9ucywgZGV0ZWN0aW5nIGZyb20gSVNBIHN0cmluZyBpcyBzdWZmaWNp
ZW50IHNvIG5vIG5lZWQKdG8gdHJhcC1uLWRldGVjdCBoZXJlLgoKPiAgICAgICAgIC8qIERldGVj
dCBpZiBoYXJ0IHN1cHBvcnQgc2R0cmlnIChkZWJ1ZyB0cmlnZ2VycykgKi8KPiAgICAgICAgIF9f
Y2hlY2tfZXh0X2NzcihTQklfSEFSVF9QUklWX1ZFUl9VTktOT1dOLAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIENTUl9UU0VMRUNULCBTQklfSEFSVF9FWFRfU0RUUklHKTsKPiAtLQo+IDIuNDku
MAo+CgpSZWdhcmRzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vb3BlbnNiaQo=
