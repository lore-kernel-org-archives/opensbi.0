Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EF7C3ABC9
	for <opensbi@archiver.kernel.org>; Thu, 15 May 2025 11:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cV+D9Q+9eoKnzssxEDYN1PP8zauWatMsYhxRymPlGPA=; b=prGQ9BB+ppve2r
	dFvieFpt69WeUGHjpIPFTyXB2EpGxJc0vVduRGODUMqgB1n3Pfsgw7KG9GRFohTPqiLDukanHndHl
	VEcOX+yujKL8Bd0rftp1S32yhSNeSZ6VdKOF3U4dw4ux2TRxOdMohQYfrbaJJ1tER6X63EXshyoKd
	rpiSfJQm2iFEHjmyJ1KOSW2aUkU3l2HmE0dfRVUz41RJWnzlHifX1eaEUX44HTT4tRvROqhsA5+W3
	7DSMN+RwRGf9ft27TMBhz3li/f7os9QQtFIY03KRYJgozZCT8g7J948AERlMvBW2KSYnPzITh+tnd
	tXGqAi40LwTMAGfK5nUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFWzS-00000000R4k-2L1c;
	Thu, 15 May 2025 11:43:06 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFWzP-00000000R45-3Aa7
	for opensbi@lists.infradead.org;
	Thu, 15 May 2025 11:43:05 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3d8e9f26b96so7007885ab.1
        for <opensbi@lists.infradead.org>; Thu, 15 May 2025 04:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1747309383; x=1747914183; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6tlmFeWyIOiUTnxMbmAGx8H08UOXw1waRqv9PFtArA=;
        b=ZkPl0zqPCoMKybqm1xWNk/ahOpMKVOEkm+fOyXpnPqclGo8Itfide1wklmOAySHKo9
         ARHJ5/Q4+4ot7kdlh8IBnZfZrNqaSlsQkK2YE7WQGUktxLkQZ6tRb1Ix5pr7qGr1JS9B
         O9p9Zv0cKYuEMYbc1Ptpj/LgUqAwr5Q0eIDYPLaXeeOpknfLPzkgj0TLuc5zFFvSJ8d6
         8uwC+miU2YFnMHom+RqedZAOEvZWLY7fz1Z5m/ATrn8VTVAVbPZBkiP0lpQKO1w8c44n
         kCm1r0nF2RLhDgkUTXgMDcH74r2FojPfAMM4Hc64q0TGtK+kGDRYrfpVrFjZCDutVAFQ
         VYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747309383; x=1747914183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i6tlmFeWyIOiUTnxMbmAGx8H08UOXw1waRqv9PFtArA=;
        b=jgawRCJfYF6M3JD9hEaRzpBYc9RqAD66eooXlv97xsTBjDsfPdCeBdcqEdwKurhgzs
         ZFwd97LIc2DI6879sKLhfWWOvBquMmokpa4jeV3kRwvW+vRF7LVqJe2fBWsoQcY7OyyQ
         3r6kEPZo6eEI+ncbFnLNhqN0He+pXV5dInQrHxx7q1VsSBEmp20KCQWPtke2oDQSphlJ
         KhISvkG1LrJmar7C8BMs4Z6b/gNrR5Gl7EVJOb0eOv5dhHpI2PNItxGsPEBsKiGYYixS
         BMtQGKoFVzUAN/tsCm2ySTwJ8tZgjccYAxj9I2j6F6k/NZRl3K0BKR+ZkOF5AXCogyFf
         o/5A==
X-Gm-Message-State: AOJu0Yz+zrvvqWSQU96ws+eAD04AjgX5eBe7lkiYyzbwwIZr1Gid4rM3
	4rtuuSInICww5WrmB2EGwmJpW4/oPn/Y9fhLU5TNSI4Fb7EYzF+MtRPb1u4e8HhsAmsGoT9ciTo
	7j0RpGWxWq/wzaISeftTpmErcW7U9G4xjZOyRlw==
X-Gm-Gg: ASbGncucmGFOdPUVQjv2FLz/Nv5WBCnMlhjVP6jyLAPwADdWEHzIuttqxl0lTJ7z47B
	42VrvnrPhDzO6qH9z/gNFaeG5uMbjcP34r0CeoYQIvDYYAYKZrS/bNuKiU1mtXFsFDgJ1HEmYGJ
	WzX/QSZawxTbQY95gXuh9qngBTD1r28oeGNQ==
X-Google-Smtp-Source: AGHT+IFnCZDPv3mpDgBylDJdX55QDImDwvd1GydMmivXBFSc9xIvkymgvg0BbyJ3UrG3JBmUJcExxDRJxGqq7/iqp0g=
X-Received: by 2002:a05:6e02:1785:b0:3d3:d00c:3602 with SMTP id
 e9e14a558f8ab-3db6f7a4048mr66174985ab.10.1747309378286; Thu, 15 May 2025
 04:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250413150628.75614-1-wxjstz@126.com> <20250413150628.75614-3-wxjstz@126.com>
In-Reply-To: <20250413150628.75614-3-wxjstz@126.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 15 May 2025 17:12:46 +0530
X-Gm-Features: AX0GCFuGGYuhzymup7SNbfxwoGJBJ00_gCBn30e1GdCOyGs64VoB_0zj4vOttt4
Message-ID: <CAAhSdy0RfR3bVhZDg7TUbDsPzAyBmEAH4SVPorKFXQ0uOaw4sw@mail.gmail.com>
Subject: Re: [PATCH 2/5] lib: sbi: Add error message for sbi_timer_event_start
To: Xiang W <wxjstz@126.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_044304_058426_B03F7BDE 
X-CRM114-Status: GOOD (  14.63  )
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

T24gU3VuLCBBcHIgMTMsIDIwMjUgYXQgODozNuKAr1BNIFhpYW5nIFcgPHd4anN0ekAxMjYuY29t
PiB3cm90ZToKPgo+IEFkZGVkIGVycm9yIG1lc3NhZ2Ugb3V0cHV0IHdoZW4gbm8gdGltZXIgZGV2
aWNlIGlzIGF2YWlsYWJsZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFhpYW5nIFcgPHd4anN0ekAxMjYu
Y29tPgoKV2UgZG9uJ3QgbmVlZCB0aGlzIHBhdGNoIGJlY2F1c2Ugd2UgYXJlIGFscmVhZHkgcHJp
bnRpbmcgdGhlCnBsYXRmb3JtIHRpbWVyIGRldmljZSBhdCBib290IHRpbWUuCgpSZWdhcmRzLApB
bnVwCgo+IC0tLQo+ICBsaWIvc2JpL3NiaV90aW1lci5jIHwgOCArKysrKysrLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
bGliL3NiaS9zYmlfdGltZXIuYyBiL2xpYi9zYmkvc2JpX3RpbWVyLmMKPiBpbmRleCA3YWQxMmJm
Zi4uMTRlNWVlNDYgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfdGltZXIuYwo+ICsrKyBiL2xp
Yi9zYmkvc2JpX3RpbWVyLmMKPiBAQCAtMTQ1LDExICsxNDUsMTcgQEAgdm9pZCBzYmlfdGltZXJf
ZXZlbnRfc3RhcnQodTY0IG5leHRfZXZlbnQpCj4gICNlbHNlCj4gICAgICAgICAgICAgICAgIGNz
cl93cml0ZShDU1JfU1RJTUVDTVAsIG5leHRfZXZlbnQpOwo+ICAjZW5kaWYKPiAtICAgICAgIH0g
ZWxzZSBpZiAodGltZXJfZGV2ICYmIHRpbWVyX2Rldi0+dGltZXJfZXZlbnRfc3RhcnQpIHsKPiAr
ICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIGlmICh0aW1l
cl9kZXYgJiYgdGltZXJfZGV2LT50aW1lcl9ldmVudF9zdGFydCkgewo+ICAgICAgICAgICAgICAg
ICB0aW1lcl9kZXYtPnRpbWVyX2V2ZW50X3N0YXJ0KG5leHRfZXZlbnQpOwo+ICAgICAgICAgICAg
ICAgICBjc3JfY2xlYXIoQ1NSX01JUCwgTUlQX1NUSVApOwo+ICAgICAgICAgICAgICAgICBjc3Jf
c2V0KENTUl9NSUUsIE1JUF9NVElQKTsKPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ICAgICAg
ICAgfQo+ICsKPiArICAgICAgIHNiaV9wcmludGYoIiVzOiBjYWxsZWQgd2l0aG91dCB0aW1lciBk
ZXZpY2VcbiIsIF9fZnVuY19fKTsKPiAgfQo+Cj4gIHZvaWQgc2JpX3RpbWVyX3Byb2Nlc3Modm9p
ZCkKPiAtLQo+IDIuNDcuMgo+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vb3BlbnNiaQo=
