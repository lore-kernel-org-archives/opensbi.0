Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACA8C369D9
	for <opensbi@archiver.kernel.org>; Thu,  1 May 2025 00:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/cBNMPTX+bwjFAeqH9rkm4AHdmB/9a1DleGYxFwP2P0=; b=mpqIrRG4H1iqIk
	qjHkpQN2CXt2KUd+5hD/G6xGKKQBcVwsoZdPLgjN+kJ6+ynQouBXBVKKNOkuZ4fcmn1iV/f7RKP/K
	Z3P6Ex6bvn1Y7DyB7uYIBMCx5dJEeBaBTjXue5ErLiTj/LW0Qn3O5hFfvHJNAMouuvhHFzywB/hNE
	Dxrsqec1UIP8GL6eKV6pOpmL6kTxNla5eRGs3M7gjH+O71BKCVVq+CQ52ADMTU61u7FbCKGK6S9nL
	QjO6jtaedJXK/hmaepVV0rcNw8Q1qXLmOrXV8vaERyJuXUA6rtJRk5kQwFTqmCT8uQ0XgmX+yeg6+
	EHObyyeeY7IgC34cJm5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAHQ7-0000000EHoB-1ImT;
	Thu, 01 May 2025 00:04:55 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAHQ4-0000000EHnE-13iQ
	for opensbi@lists.infradead.org;
	Thu, 01 May 2025 00:04:53 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-39ee5ac4321so361898f8f.1
        for <opensbi@lists.infradead.org>; Wed, 30 Apr 2025 17:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1746057890; x=1746662690; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCXMOgriUpnrUUq+tbGHuCf4pcHjk6HW8RB/rsfnCFc=;
        b=YfRgnq2VdTkhMDG4AXBsA2QlfDJEnmEZSHqBp8E23PAwDXciKMw6QhvoHS0ozi8xfR
         qx8wGXT9Adm0kGOlEzPiplzxAqT1Kqjh068V7l7MlPTcyL0k6gbAmxP+4xXLWleGznBo
         esYHGovGIz6q0WYp6AWlAP8spsbgUBe4vIDnmVv8RVUC6egAAas3LlrDDwrFiANEig21
         vlSrDbXntdoOLAmhHe67BwQC8/B6uRJh3EJLVxOjcAr88KXrHoerTq5Jhp/D7AsVqO4q
         SAf5ODi0pDUgQJiV5x75nKTbzNKTmZkoAWKZ2DkVsPLHkmUJK53bnbwP3UqlaDd/5CBc
         a5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746057890; x=1746662690;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCXMOgriUpnrUUq+tbGHuCf4pcHjk6HW8RB/rsfnCFc=;
        b=AEzycgyAsKbRJk/B7OBTUaGydaxdgK/GRxcWo6BXuudYOgUsI+6tqY361wJ/E3KWNk
         V7FU7psXV7zz7G/4vzpt4Nh/On5Uaf7QENypX4OBtoDALZzJ3rYr3Iy033bTsbzBKnQ6
         zmlU5o8KbulkE4qbZgaSgW0642g2y3W1V8pu3vpJJjwYFtbzf35GB6L0oLj5OkZO2VXY
         XULvdXuYpJEfyHBXbBiwRmKLPpAsS82q82W9NhJ9aNjbuJYAgf/W6oXne9+yv+fp8sSU
         XaESLqmhxdNaoZDdAI5sJ/dlMJoJHl3/1I0FuuAA82zbUp6dSKKFcGKr6UKdsIegTRb0
         iMvQ==
X-Gm-Message-State: AOJu0YzEAYrfJjBIeYAlpHtvLdHAjQIIQfsh+PvN0q/Qd4SQz2pZSaib
	h8NqLzOS9wcY45iKkf+Nc5sjXp8Gl0IiDRZYslURsKaSiEZpeekwwbxX2WHWtmA=
X-Gm-Gg: ASbGncuKpW7CQpHHF2iWLYDXVOHJjKxaiVYS4XcsUbqquBAYrdWdUD1Vo8U8yXlqGz0
	6xMzGs26I+FvWM+xAZpFzJjhJfyWIoEGjA7neNNjyXFCyjaWlLzVoLa+J+xf/h2wNR8aydb5fiM
	DC5UCOSonyMZsswbs4lpU7wMegdOQnfBc1qtcIT4j7dgG17MF5BggsnkQVxbUMr4I/sdCZ/0AUf
	JPxQblAcw80eJbdLufh/K3rvNPsIP53zcGuWZ+nNCFAWxCxRhEtrKVcNYBmIWS7t/Y8h54zJoQc
	ooCqPrXdZvprQjX2eiR8x72V8uqiFAwjFLyhzIFXTiShJWPxQlgvrg==
X-Google-Smtp-Source: AGHT+IHfkuyUctaLvDF/ZmGOaDTJ8ORs7WpIDOKJwNHlCHCa0/VPHWwUtW+ECHw8I+BRnwCg70tqVg==
X-Received: by 2002:a05:6000:18a9:b0:391:41c9:7a8d with SMTP id ffacd0b85a97d-3a09417a4a7mr198772f8f.54.1746057889600;
        Wed, 30 Apr 2025 17:04:49 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5e345sm18465369f8f.94.2025.04.30.17.04.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Apr 2025 17:04:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH] Makefile: Make $(LLVM) more flexible
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20250430-improve_llvm_building-v1-1-caae96cc6be6@rivosinc.com>
Date: Thu, 1 May 2025 01:04:38 +0100
Cc: opensbi@lists.infradead.org
Message-Id: <18D74DFC-E63B-446A-806B-B7C51AA4CDA4@jrtc27.com>
References: <20250430-improve_llvm_building-v1-1-caae96cc6be6@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_170452_311478_FD27442A 
X-CRM114-Status: GOOD (  20.63  )
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

T24gMSBNYXkgMjAyNSwgYXQgMDA6MzgsIENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2lu
Yy5jb20+IHdyb3RlOgo+IAo+IEludHJvZHVjZSBhIHdheSBmb3IgZGV2ZWxvcGVycyB0byBlYXNp
bHkgc3dpdGNoIGJldHdlZW4gTExWTSB2ZXJzaW9ucwo+IHdpdGggTExWTT0vcGF0aC90by9sbHZt
LyBhbmQgTExWTT0tdmVyc2lvbi4gVGhpcyBpcyBhIHVzZWZ1bAoKRnJlZUJTRCBkb2VzbuKAmXQg
aW5jbHVkZSBhIGh5cGhlbiBpbiBpdHMgdmVyc2lvbiBudW1iZXIgc3VmZml4LCB5b3UgZ2V0CmNs
YW5nMjAgZXRjLiBJbiB0aGUgTGludXggd29ybGQgd2hlcmUgeW914oCZdmUgY29waWVkIHRoaXMg
cGF0dGVybiBmcm9tCnZlcmJhdGltIHRoYXQgbWF5IHdlbGwgaG9sZCwgYnV0IE9wZW5TQkkgc3Vw
cG9ydHMgbW9yZSB0aGFuIGp1c3QgTGludXguCgpPbmUgY291bGQgc3BlY2lhbC1jYXNlIExMVk09
MSBhbmQgdHJlYXQgYW55dGhpbmcgZWxzZSBhcyBhIHN1ZmZpeCBJCnN1cHBvc2UsIHRob3VnaCB0
aGF0IHdvdWxkIGJlIGEgbGl0dGxlIHdlaXJkLgoKSmVzcwoKPiBhZGRpdGlvbiB0byB0aGUgZXhp
c3RpbmcgTExWTT0xIHZhcmlhYmxlIHdoaWNoIHdpbGwgc2VsZWN0IHRoZSBmaXJzdAo+IGNsYW5n
IGFuZCBsbHZtIGJpbnV0aWxzIGF2YWlsYWJsZSBvbiB0aGUgcGF0aC4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+IC0tLQo+IE1ha2Vm
aWxlICB8IDE0ICsrKysrKysrKystLS0tCj4gUkVBRE1FLm1kIHwgMTIgKysrKysrKysrKysrCj4g
MiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCj4gaW5kZXggZTkwODM2YzdjNGFkMTZjMzBk
NGQ4MDY0OWZmOGIyMjg0MTMxOTBhZC4uMzdkNGNmNDFhMjIxNGUwYTgyOWYxZDRhNTNmM2Y0Zjlh
ZTA5ZWU0MSAxMDA2NDQKPiAtLS0gYS9NYWtlZmlsZQo+ICsrKyBiL01ha2VmaWxlCj4gQEAgLTEw
NCwxMCArMTA0LDE2IEBAIGVuZGlmCj4gCj4gIyBTZXR1cCBjb21waWxhdGlvbiBjb21tYW5kcwo+
IGlmbmVxICgkKExMVk0pLCkKPiAtQ0MgPSBjbGFuZwo+IC1BUiA9IGxsdm0tYXIKPiAtTEQgPSBs
ZC5sbGQKPiAtT0JKQ09QWSA9IGxsdm0tb2JqY29weQo+ICtpZm5lcSAoJChmaWx0ZXIgJS8sJChM
TFZNKSksKQo+ICtMTFZNX1BSRUZJWCA6PSAkKExMVk0pCj4gK2Vsc2UgaWZuZXEgKCQoZmlsdGVy
IC0lLCQoTExWTSkpLCkKPiArTExWTV9TVUZGSVggOj0gJChMTFZNKQo+ICtlbmRpZgo+ICsKPiAr
Q0MgPSAkKExMVk1fUFJFRklYKWNsYW5nJChMTFZNX1NVRkZJWCkKPiArQVIgPSAkKExMVk1fUFJF
RklYKWxsdm0tYXIkKExMVk1fU1VGRklYKQo+ICtMRCA9ICQoTExWTV9QUkVGSVgpbGQubGxkJChM
TFZNX1NVRkZJWCkKPiArT0JKQ09QWSA9ICQoTExWTV9QUkVGSVgpbGx2bS1vYmpjb3B5JChMTFZN
X1NVRkZJWCkKPiBlbHNlCj4gaWZkZWYgQ1JPU1NfQ09NUElMRQo+IENDID0gJChDUk9TU19DT01Q
SUxFKWdjYwo+IGRpZmYgLS1naXQgYS9SRUFETUUubWQgYi9SRUFETUUubWQKPiBpbmRleCAyNzk1
Y2MxYTVmZjBkZjYyZDgzYTRiNWMzMDYyZmYyYjY4MmRiY2FiLi5mZDQwYmUwYjQ5ODg4MTVkOGQw
MjM4NjI3MWFlYWViNzg3NTQxMjE1IDEwMDY0NAo+IC0tLSBhL1JFQURNRS5tZAo+ICsrKyBiL1JF
QURNRS5tZAo+IEBAIC0yNTIsNiArMjUyLDE4IEBAIG9wdGlvbiB3aXRoOgo+IG1ha2UgTExWTT0x
Cj4gYGBgCj4gCj4gK1RvIGJ1aWxkIHdpdGggYSBzcGVjaWZpYyB2ZXJzaW9uIG9mIExMVk0sIGEg
cGF0aCB0byBhIGRpcmVjdG9yeSBjb250YWluaW5nIHRoZQo+ICtMTFZNIHRvb2xzIGNhbiBiZSBw
cm92aWRlZDoKPiArYGBgCj4gK21ha2UgTExWTT0vcGF0aC90by9sbHZtLwo+ICtgYGAKPiArCj4g
K0lmIHlvdSBoYXZlIHZlcnNpb25lZCBsbHZtIHRvb2xzIHlvdSB3b3VsZCBsaWtlIHRvIHVzZSwg
c3VjaCBhcyBgY2xhbmctMTdgLCB0aGUgTExWTSB2YXJpYWJsZSBjYW4KPiArYmUgc2V0IGFzOgo+
ICtgYGAKPiArbWFrZSBMTFZNPS0xNwo+ICtgYGAKPiArCj4gV2hlbiB1c2luZyBDbGFuZywgKkNS
T1NTX0NPTVBJTEUqIG9mdGVuIGRvZXMgbm90IG5lZWQgdG8gYmUgZGVmaW5lZCB1bmxlc3MKPiB1
c2luZyBHTlUgYmludXRpbHMgd2l0aCBwcmVmaXhlZCBiaW5hcnkgbmFtZXMuICpQTEFURk9STV9S
SVNDVl9YTEVOKiB3aWxsIGJlCj4gdXNlZCB0byBpbmZlciBhIGRlZmF1bHQgdHJpcGxlIHRvIHBh
c3MgdG8gQ2xhbmcsIHNvIGlmICpQTEFURk9STV9SSVNDVl9YTEVOKgo+IAo+IC0tLQo+IGJhc2Ut
Y29tbWl0OiAzMTZkYWFmMWMyOTljMjlhYzQ2ZTUyMTQ1ZjY1NTIxZjQ4ZWM2M2I1Cj4gY2hhbmdl
LWlkOiAyMDI1MDQzMC1pbXByb3ZlX2xsdm1fYnVpbGRpbmctY2ZmMzE5MThlMWE2Cj4gLS0gCj4g
LSBDaGFybGllCj4gCj4gCj4gLS0gCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxp
c3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL29wZW5zYmkKCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
b3BlbnNiaQo=
