Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19B4C71155
	for <opensbi@archiver.kernel.org>; Mon, 16 Jun 2025 12:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AJbimanxUXB/mohe4JdRhWjA1UuononrAfeBen8Ubmk=; b=PuNu2DosKIwEZv
	IWgIbfjnLozHTKBtxTCRv0Ii2C3tZrzEkeU0cMCGzP2so9NqfuH2czwLYH1YGIcEQnW08LswQtxjz
	rUBeNjHsKi4r744fjw+sjTHT8skocjfs033bjftrx4nh7bthWvqPOV7fLgFQs+nEcdmXZ4rCXpXrD
	WuLCe9lGSNJ+EKHQGwzzRmk+pNG0a0rM5lIgRsnKN986/NAKqpCWXWXE0PurtmCT5H7FkeX3iAcv5
	ddlePiM3UP/LtyZle1EFz/Wp6hzwubMF8mhI9GAqBugDaVlc1Er7tnn9rkP3Z8jOismwKsi89dIA/
	JzTfSqhAfE/FhsGq0iRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9IR-00000004QgG-1UAu;
	Mon, 16 Jun 2025 12:50:43 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8Df-00000004EV5-18fk
	for opensbi@lists.infradead.org;
	Mon, 16 Jun 2025 11:41:44 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3d80bbf3aefso21174415ab.1
        for <opensbi@lists.infradead.org>; Mon, 16 Jun 2025 04:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1750074102; x=1750678902; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPdTBcmHW/NO7yBlT9qGRTqOtKUlTNYGPaW+QOymlFU=;
        b=WuxcWqT3Lnm5BHUAKHFcyh8KNQYVk8zHQTTyd1r4gLbLVNJieuiRFnhNAzzwixmoRq
         fAw44MeQfJogYzdxXezZu69QvI4U9xF03UarYnvSo8wHR09MCf3wEMNeacYFxnZfpCKJ
         X7JMWsRILtD+PliH9enJOXFjNgKihtD4YL1aiIFAoe+POT1z5ILSApl8UylgFy471AAP
         53uxmVxWkzBGalk/AxsJLvcY2zpH+KC23WNIGt7JKGFoO8WXIQgczxondFAqiFETBAgG
         4r4sZq7q2BJYcehjuhCrbmLyJFUtJvscJJ7VZuBpfPGAe7QsrWk64QARFWCCtN+VOjDI
         7UFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750074102; x=1750678902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPdTBcmHW/NO7yBlT9qGRTqOtKUlTNYGPaW+QOymlFU=;
        b=ALh2TWKHRCIb/C5J7ivcXBjR10cuWffq+YPaBj1+b7WPlHhuwUrGXNl2YKFHbNpmOx
         rr6uSnjYmiKmuXhceU5tHpyGdkg9l4svjwq7k8UgWo43ISKyd32m6aiG+ks6MQnPr/X/
         N1b3MNUz6c6Y9G20aorX326nUH/7EiWZF3xxUabHpAp6Yb7JAgYMlxkxix4eTehbH6Qa
         KrtCq1QMucApOkmY3WpQB3M8BU3zNMRhFlYOXLry9E/kviKaA1awvlFyR2Jt2L/QeiAZ
         5tMMXNvtnUyLjH5ba03rmw1ZykO9x3+nNtK/Ybu2CUbFmYyvK4wZQzFmuGm9ik5KKmfO
         PG1g==
X-Gm-Message-State: AOJu0YwDM1toVbxpO31a87awB+56pvN9d6H2xW7nfUHxoz8R8GrbtO99
	nFCG7I02uMCuy1XOwLEAei+OeGvdC+bGXBnSPi6XKNwL+NW+WE+UYJT87BfBXWzzr2zKN6hl8xv
	hOCCIu4WfJ8Xbcu5LGBeGmqtpWv5EgAdMG/gGFXC5Tw==
X-Gm-Gg: ASbGncuEWlaHTzztbbN9QgdNFu2HUCJM1FTj+YVwsSdiDh7rzkY8jEakSv5ri6qwxUy
	n46OlSvRFOm5n/V9dmHYuDkZ0ybQMK+xzkYhh1H2G0EStoebCV6YB5fnYc3zmEDFwU2Ak7dgChK
	N9ZuCrn9SHov9YXEHAAAj8YEoouRzb5dG19wpA8DGDk22rLtuJUAgQ+UlyMbb1pIHQ6S8sCz+7l
	J/T
X-Google-Smtp-Source: AGHT+IFHtaiaIj839EOlmhKXnKDr1ZVJkpucaOTG/L3CLLKxCyQ21TYS3xo1pnuBIx15CSZNtAmSJwgYYtwH1re0y04=
X-Received: by 2002:a05:6e02:1a01:b0:3dd:89dc:ab07 with SMTP id
 e9e14a558f8ab-3de07cb6373mr95998845ab.8.1750074102316; Mon, 16 Jun 2025
 04:41:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250528154604.571815-1-jesse@rivosinc.com>
In-Reply-To: <20250528154604.571815-1-jesse@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 16 Jun 2025 17:11:31 +0530
X-Gm-Features: AX0GCFszFkr2AY1Du8QvQphpYteWCRkqD5j-TIiwrXRC3Qf1bqVcWMyETflxOXU
Message-ID: <CAAhSdy2xhyozuexUJdLRZBXD3mbcoLa8r0NFnfB3pQq5v8iUyg@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: dbtr: Fix update_triggers to match SBI
To: Jesse Taube <jesse@rivosinc.com>
Cc: opensbi@lists.infradead.org, Himanshu Chauhan <hchauhan@ventanamicro.com>, 
	Charlie Jenkins <charlie@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_044143_311183_342386A4 
X-CRM114-Status: GOOD (  15.96  )
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

T24gV2VkLCBNYXkgMjgsIDIwMjUgYXQgOToxNuKAr1BNIEplc3NlIFRhdWJlIDxqZXNzZUByaXZv
c2luYy5jb20+IHdyb3RlOgo+Cj4gT3BlblNCSSBpbXBsZW1lbnRzIHNiaV9kYnRyX3VwZGF0ZV90
cmlnIGFzCj4gYHNiaV9kYnRyX3VwZGF0ZV90cmlnKHVuc2lnbmVkIGxvbmcgdHJpZ19pZHhfYmFz
ZSwKPiAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyB0cmlnX2lkeF9tYXNrKWAK
PiB5ZXQgU0JJIHYzLjAtcmM3IENoYXB0ZXIgMTkuIERlYnVnIFRyaWdnZXJzIEV4dGVuc2lvbiBb
MF0gZGVjbGFyZXMgaXQgYXMKPiBgc2JpX2RlYnVnX3VwZGF0ZV90cmlnZ2Vycyh1bnNpZ25lZCBs
b25nIHRyaWdfY291bnQpYAo+Cj4gQ2hhbmdlIHVwZGF0ZV90cmlnZ2VycyB0byBtYXRjaCBTQkku
Cj4KPiBbMF0gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3Ytc2JpLWRvYy90
cmVlL3YzLjAtcmM3L3NyYy9leHQtZGVidWctdHJpZ2dlcnMuYWRvYwo+Cj4gRml4ZXM6IDk3ZjIz
NGYxNWM5NiAoImxpYjogc2JpOiBJbnRyb2R1Y2UgdGhlIFNCSSBkZWJ1ZyB0cmlnZ2VycyBleHRl
bnNpb24gc3VwcG9ydCIpCj4gU2lnbmVkLW9mZi1ieTogSmVzc2UgVGF1YmUgPGplc3NlQHJpdm9z
aW5jLmNvbT4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoK
VGhhbmtzLApBbnVwCgoKPiAtLS0KPiAgaW5jbHVkZS9zYmkvc2JpX2RidHIuaCAgIHwgIDMgKy0t
Cj4gIGxpYi9zYmkvc2JpX2RidHIuYyAgICAgICB8IDMzICsrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLQo+ICBsaWIvc2JpL3NiaV9lY2FsbF9kYnRyLmMgfCAgMiArLQo+ICAzIGZpbGVz
IGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvc2JpL3NiaV9kYnRyLmggYi9pbmNsdWRlL3NiaS9zYmlfZGJ0ci5oCj4gaW5k
ZXggOGNiNzc2Yy4uYjFjZmI1YiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfZGJ0ci5o
Cj4gKysrIGIvaW5jbHVkZS9zYmkvc2JpX2RidHIuaAo+IEBAIC0xMTcsOCArMTE3LDcgQEAgaW50
IHNiaV9kYnRyX3VuaW5zdGFsbF90cmlnKHVuc2lnbmVkIGxvbmcgdHJpZ19pZHhfYmFzZSwKPiAg
aW50IHNiaV9kYnRyX2VuYWJsZV90cmlnKHVuc2lnbmVkIGxvbmcgdHJpZ19pZHhfYmFzZSwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyB0cmlnX2lkeF9tYXNrKTsKPiAg
aW50IHNiaV9kYnRyX3VwZGF0ZV90cmlnKHVuc2lnbmVkIGxvbmcgc21vZGUsCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgdHJpZ19pZHhfYmFzZSwKPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyB0cmlnX2lkeF9tYXNrKTsKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyB0cmlnX2NvdW50KTsKPiAgaW50IHNiaV9kYnRy
X2Rpc2FibGVfdHJpZyh1bnNpZ25lZCBsb25nIHRyaWdfaWR4X2Jhc2UsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHRyaWdfaWR4X21hc2spOwo+Cj4gZGlmZiAtLWdp
dCBhL2xpYi9zYmkvc2JpX2RidHIuYyBiL2xpYi9zYmkvc2JpX2RidHIuYwo+IGluZGV4IGYwZTkx
MjguLjEyNDg2MzQgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfZGJ0ci5jCj4gKysrIGIvbGli
L3NiaS9zYmlfZGJ0ci5jCj4gQEAgLTY1MSwxMyArNjUxLDkgQEAgaW50IHNiaV9kYnRyX2VuYWJs
ZV90cmlnKHVuc2lnbmVkIGxvbmcgdHJpZ19pZHhfYmFzZSwKPiAgfQo+Cj4gIGludCBzYmlfZGJ0
cl91cGRhdGVfdHJpZyh1bnNpZ25lZCBsb25nIHNtb2RlLAo+IC0gICAgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBsb25nIHRyaWdfaWR4X2Jhc2UsCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgdHJpZ19pZHhfbWFzaykKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgbG9uZyB0cmlnX2NvdW50KQo+ICB7Cj4gLSAgICAgICB1bnNpZ25lZCBsb25n
IHRyaWdfbWFzayA9IHRyaWdfaWR4X21hc2sgPDwgdHJpZ19pZHhfYmFzZTsKPiAtICAgICAgIHVu
c2lnbmVkIGxvbmcgaWR4ID0gdHJpZ19pZHhfYmFzZTsKPiAtICAgICAgIHN0cnVjdCBzYmlfZGJ0
cl9kYXRhX21zZyAqcmVjdjsKPiAtICAgICAgIHVuc2lnbmVkIGxvbmcgdWlkeCA9IDA7Cj4gKyAg
ICAgICB1bnNpZ25lZCBsb25nIHRyaWdfaWR4Owo+ICAgICAgICAgc3RydWN0IHNiaV9kYnRyX3Ry
aWdnZXIgKnRyaWc7Cj4gICAgICAgICBzdHJ1Y3Qgc2JpX2RidHJfc2htZW1fZW50cnkgKmVudHJ5
Owo+ICAgICAgICAgdm9pZCAqc2htZW1fYmFzZSA9IE5VTEw7Cj4gQEAgLTY3MiwxOCArNjY4LDI5
IEBAIGludCBzYmlfZGJ0cl91cGRhdGVfdHJpZyh1bnNpZ25lZCBsb25nIHNtb2RlLAo+Cj4gICAg
ICAgICBzaG1lbV9iYXNlID0gaGFydF9zaG1lbV9iYXNlKGhzKTsKPgo+IC0gICAgICAgZm9yX2Vh
Y2hfc2V0X2JpdF9mcm9tKGlkeCwgJnRyaWdfbWFzaywgaHMtPnRvdGFsX3RyaWdzKSB7Cj4gLSAg
ICAgICAgICAgICAgIHRyaWcgPSBJTkRFWF9UT19UUklHR0VSKGlkeCk7Cj4KPiAtICAgICAgICAg
ICAgICAgaWYgKCEodHJpZy0+c3RhdGUgJiBSVl9EQlRSX0JJVF9NQVNLKFRTLCBNQVBQRUQpKSkK
PiArICAgICAgIGlmICh0cmlnX2NvdW50ID49IGhzLT50b3RhbF90cmlncykKPiArICAgICAgICAg
ICAgICAgcmV0dXJuIFNCSV9FUlJfQkFEX1JBTkdFOwo+ICsKPiArICAgICAgIGZvcl9lYWNoX3Ry
aWdfZW50cnkoc2htZW1fYmFzZSwgdHJpZ19jb3VudCwgdHlwZW9mKCplbnRyeSksIGVudHJ5KSB7
Cj4gKyAgICAgICAgICAgICAgIHNiaV9oYXJ0X21hcF9zYWRkcigodW5zaWduZWQgbG9uZyllbnRy
eSwgc2l6ZW9mKCplbnRyeSkpOwo+ICsgICAgICAgICAgICAgICB0cmlnX2lkeCA9IGVudHJ5LT5p
ZC5pZHg7Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAodHJpZ19pZHggPj0gaHMtPnRvdGFsX3Ry
aWdzKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgc2JpX2hhcnRfdW5tYXBfc2FkZHIoKTsK
PiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VSUl9JTlZBTElEX1BBUkFNOwo+
ICsgICAgICAgICAgICAgICB9Cj4KPiAtICAgICAgICAgICAgICAgZW50cnkgPSAoc2htZW1fYmFz
ZSArIHVpZHggKiBzaXplb2YoKmVudHJ5KSk7Cj4gLSAgICAgICAgICAgICAgIHJlY3YgPSAmZW50
cnktPmRhdGE7Cj4gKyAgICAgICAgICAgICAgIHRyaWcgPSBJTkRFWF9UT19UUklHR0VSKHRyaWdf
aWR4KTsKPgo+IC0gICAgICAgICAgICAgICB0cmlnLT50ZGF0YTIgPSBsbGVfdG9fY3B1KHJlY3Yt
PnRkYXRhMik7Cj4gKyAgICAgICAgICAgICAgIGlmICghKHRyaWctPnN0YXRlICYgUlZfREJUUl9C
SVRfTUFTSyhUUywgTUFQUEVEKSkpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBzYmlfaGFy
dF91bm1hcF9zYWRkcigpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBTQklfRVJS
X0ZBSUxFRDsKPiArICAgICAgICAgICAgICAgfQo+ICsKPiArICAgICAgICAgICAgICAgZGJ0cl90
cmlnZ2VyX3NldHVwKHRyaWcsICZlbnRyeS0+ZGF0YSk7Cj4gKyAgICAgICAgICAgICAgIHNiaV9o
YXJ0X3VubWFwX3NhZGRyKCk7Cj4gICAgICAgICAgICAgICAgIGRidHJfdHJpZ2dlcl9lbmFibGUo
dHJpZyk7Cj4gLSAgICAgICAgICAgICAgIHVpZHgrKzsKPiAgICAgICAgIH0KPgo+ICAgICAgICAg
cmV0dXJuIFNCSV9TVUNDRVNTOwo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9lY2FsbF9kYnRy
LmMgYi9saWIvc2JpL3NiaV9lY2FsbF9kYnRyLmMKPiBpbmRleCA5YzQ5NmM0Li40MGE0MzdlIDEw
MDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2VjYWxsX2RidHIuYwo+ICsrKyBiL2xpYi9zYmkvc2Jp
X2VjYWxsX2RidHIuYwo+IEBAIC00Myw3ICs0Myw3IEBAIHN0YXRpYyBpbnQgc2JpX2VjYWxsX2Ri
dHJfaGFuZGxlcih1bnNpZ25lZCBsb25nIGV4dGlkLCB1bnNpZ25lZCBsb25nIGZ1bmNpZCwKPiAg
ICAgICAgICAgICAgICAgcmV0ID0gc2JpX2RidHJfZW5hYmxlX3RyaWcocmVncy0+YTAsIHJlZ3Mt
PmExKTsKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICBjYXNlIFNCSV9FWFRfREJU
Ul9UUklHR0VSX1VQREFURToKPiAtICAgICAgICAgICAgICAgcmV0ID0gc2JpX2RidHJfdXBkYXRl
X3RyaWcoc21vZGUsIHJlZ3MtPmEwLCByZWdzLT5hMSk7Cj4gKyAgICAgICAgICAgICAgIHJldCA9
IHNiaV9kYnRyX3VwZGF0ZV90cmlnKHNtb2RlLCByZWdzLT5hMCk7Cj4gICAgICAgICAgICAgICAg
IGJyZWFrOwo+ICAgICAgICAgY2FzZSBTQklfRVhUX0RCVFJfVFJJR0dFUl9ESVNBQkxFOgo+ICAg
ICAgICAgICAgICAgICByZXQgPSBzYmlfZGJ0cl9kaXNhYmxlX3RyaWcocmVncy0+YTAsIHJlZ3Mt
PmExKTsKPiAtLQo+IDIuNDMuMAo+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vb3BlbnNiaQo=
