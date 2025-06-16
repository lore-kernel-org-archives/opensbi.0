Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A23C71136
	for <opensbi@archiver.kernel.org>; Mon, 16 Jun 2025 12:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=87eDk4pMU1Z1gAEWts4H0hNOznka37foVtG8ckVORtc=; b=TF5kpDeT2qSsQc
	etN//2JsC/ay3ihJqhvns6aOFKOZWIjCcdzN8EEp9CsYKohWULFxF6nZXXXhnm/Ss7JRXVduppuBh
	a+/LTKn8JOWGEJewm8KqFbeqhpQsLt0HrgulyN6Gwncx3Dgxb6B0gnLFMS2tod770ldqhfsbRQ2xL
	L2Dk36Ctc8NeUZrSn4H2i9mpZYjjnHxSkOO6zemoPk6jZXBnKyZoYeoHamxfDXoIMjaTpE+HgoEmc
	BJjkuqHqJB2dUvMhhBFRhyRzpcfsnq3etUnKv75byjvDSmEIFWTsyu9mvgFU1GMZ7rqiCbkWXmb9C
	0FzuhmNjcUZTl3BqFzsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9IQ-00000004QfW-36pQ;
	Mon, 16 Jun 2025 12:50:42 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8DX-00000004EUh-33vv
	for opensbi@lists.infradead.org;
	Mon, 16 Jun 2025 11:41:36 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-8731c3473c3so111458139f.1
        for <opensbi@lists.infradead.org>; Mon, 16 Jun 2025 04:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1750074095; x=1750678895; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNwhq61c6xUJBXlgof58jOgmKKkiXvz8Xldb+Q2TMWY=;
        b=SMCoWz8LEMRfVlWU1Jslo6mbwL0vFVrIJhC98NE53NZ2SNvm8MhF/ckByH5i84J4yG
         Uxr9nBfRuTd4U3c1hiEbCcs0Ro0wy6j0JFhQ6zm2qjMAh2CnPd8maD7najtOr9ofhgOv
         DGFATNJE4sdAhnX8X9400PjayheanFoTLDnUsuvxIWtFyg3GE8AO0Dvjb0H81S4cSrRd
         R0UQf20MLQizqgdLZbZKXgLFhCLW4KH1lLIUdvd3ruGa22lO8JlBwWutDKx1UAGbgHPB
         ewSCn9oIAklupSh1ALbky4LMhSi9iQZFsgdidMcXfVnxj1zWq0zM8rT7+u+7oECyy810
         TgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750074095; x=1750678895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNwhq61c6xUJBXlgof58jOgmKKkiXvz8Xldb+Q2TMWY=;
        b=AJJWMzX1lPB19vEWAo6W1n8wWNgiAX6CuXtH1ObBpg++On2ADVyQILbyAAsee2zIWV
         vCyVgQOs/JBzeGARGQkvD0WnokfsoEmvHfSaWgZl7/N1apekbBVUzXSEd/E/M8tja2YE
         R7fIo99b0+oujhKbVyYLa9mFxADDIa0K0xBqRYP0SrGqVszrPAnkVYnG3TlbpJ6mCfu1
         4PQZxPUyeEmZl4SXzyZyM7WyguSvpjOuz9Yy/NS6ymtF6+wVblilYbItPZEfLQNuy/C/
         mH8fhbaCQzoJkjT+XddfRV4GMoJPVcVQqHcyD0NPH1/sDBZmVVPDohqi6q7CmchNmFzT
         84eg==
X-Gm-Message-State: AOJu0YwqjZtjmVq5aYGZ+84TGRwbpP5ZioFfjrOu9ukZayEN3s834lXm
	Uhl20drNRnsDryCM4q7HF6m5DKZJqOTGTRVEw0KSx/Q5d8tHFMeQcMvsC/U6/ddrU0N5/H+NA+q
	DjKTBosBR7y4ebuVXSyy5Z8PDYXTClPb5Qjnldu0fRw==
X-Gm-Gg: ASbGnctU/tamma9UL7dJeJkjcpyryRs5d/cm9oCZ1Zifp/clvcGNw3rDFJd5GfXaHRx
	IT8O0z9qsD+M1pnflwgelMWQzsmN074bHa3L0d56oi/j/BfylEQTSRlRnVbZH4Ug3Ip1UNBmhr/
	YbhtXZZxyPJ9iTjMKnRx62hb9Iq1Hk7j7gwnNLBUmBwgQ0wKwqzvSmDisOge6QKS2uS8lSUxnMV
	T2G
X-Google-Smtp-Source: AGHT+IEozzpG9iqDZnYNhtOA+LcCJc9bndtsIziil4/ZW8UpfxWCGdVplFU67LdaxqbNRug/gUyXn9NPnXl2+sr5wPI=
X-Received: by 2002:a05:6e02:1fe7:b0:3dd:88da:e804 with SMTP id
 e9e14a558f8ab-3de07d1bb31mr103480545ab.18.1750074094820; Mon, 16 Jun 2025
 04:41:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250514052422.575551-1-wxjstz@126.com>
In-Reply-To: <20250514052422.575551-1-wxjstz@126.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 16 Jun 2025 17:11:23 +0530
X-Gm-Features: AX0GCFs0qgA_NIpcml4i6Sp_nXHNK2SO4yK29YT7oMwgXaoQvM-OrXcGkFn0MSA
Message-ID: <CAAhSdy3aTKJ_4JGvH_=q_WE8y+p6fvub_esVQNfcF3hSUrg18A@mail.gmail.com>
Subject: Re: [PATCH v2] lib: sbi: Optimize saddr mapping in sbi_dbtr.c
To: Xiang W <wxjstz@126.com>
Cc: opensbi@lists.infradead.org, hchauhan@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_044135_768564_DA0D857F 
X-CRM114-Status: GOOD (  17.14  )
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

T24gV2VkLCBNYXkgMTQsIDIwMjUgYXQgMTA6NTTigK9BTSBYaWFuZyBXIDx3eGpzdHpAMTI2LmNv
bT4gd3JvdGU6Cj4KPiBUaGUgb3JpZ2luYWwgaW1wbGVtZW50YXRpb24gbWFwcGVkIHNhZGRyIGlu
ZGl2aWR1YWxseSBmb3IgZWFjaCBlbnRyeS4KPiBUaGUgdXBkYXRlZCBjb2RlIG5vdyBtYXBzIHNh
ZGRyIGZvciBhbGwgZW50cmllcyBpbiBhIHNpbmdsZSBvcGVyYXRpb24uCj4gVGhpcyBjaGFuZ2Ug
cmVkdWNlcyB0aGUgbnVtYmVyIG9mIFBNUCAoUGh5c2ljYWwgTWVtb3J5IFByb3RlY3Rpb24pCj4g
b3BlcmF0aW9ucywgaW1wcm92aW5nIGVmZmljaWVuY3kgYW5kIHBlcmZvcm1hbmNlLgo+Cj4gU2ln
bmVkLW9mZi1ieTogWGlhbmcgVyA8d3hqc3R6QDEyNi5jb20+CgpJbmNsdWRlZCBIaW1hbnNodSdz
IFJldmlld2VkLWJ5IGFuZCBUZXN0ZWQtYnkgYXQgdGhlIHRpbWUKb2YgbWVyZ2luZyB0aGlzIHBh
dGNoLgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFu
a3MsCkFudXAKCgo+IC0tLQo+IGNoYW5nZXMgaW4gdjI6Cj4gLSBGaXhlZCBhIHR5cGUgY29udmVy
c2lvbiBlcnJvcgo+IC0tLQo+ICBsaWIvc2JpL3NiaV9kYnRyLmMgfCAxNSArKysrKysrKy0tLS0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9kYnRyLmMgYi9saWIvc2JpL3NiaV9kYnRyLmMKPiBp
bmRleCBmMGU5MTI4NS4uYjAxOGU3Y2IgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfZGJ0ci5j
Cj4gKysrIGIvbGliL3NiaS9zYmlfZGJ0ci5jCj4gQEAgLTUyMywxNiArNTIzLDE3IEBAIGludCBz
YmlfZGJ0cl9yZWFkX3RyaWcodW5zaWduZWQgbG9uZyBzbW9kZSwKPgo+ICAgICAgICAgc2htZW1f
YmFzZSA9IGhhcnRfc2htZW1fYmFzZShocyk7Cj4KPiArICAgICAgIHNiaV9oYXJ0X21hcF9zYWRk
cigodW5zaWduZWQgbG9uZylzaG1lbV9iYXNlLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
IHRyaWdfY291bnQgKiBzaXplb2YoKmVudHJ5KSk7Cj4gICAgICAgICBmb3JfZWFjaF90cmlnX2Vu
dHJ5KHNobWVtX2Jhc2UsIHRyaWdfY291bnQsIHR5cGVvZigqZW50cnkpLCBlbnRyeSkgewo+IC0g
ICAgICAgICAgICAgICBzYmlfaGFydF9tYXBfc2FkZHIoKHVuc2lnbmVkIGxvbmcpZW50cnksIHNp
emVvZigqZW50cnkpKTsKPiAgICAgICAgICAgICAgICAgeG1pdCA9ICZlbnRyeS0+ZGF0YTsKPiAg
ICAgICAgICAgICAgICAgdHJpZyA9IElOREVYX1RPX1RSSUdHRVIoKF9pZHggKyB0cmlnX2lkeF9i
YXNlKSk7Cj4gICAgICAgICAgICAgICAgIHhtaXQtPnRzdGF0ZSA9IGNwdV90b19sbGUodHJpZy0+
c3RhdGUpOwo+ICAgICAgICAgICAgICAgICB4bWl0LT50ZGF0YTEgPSBjcHVfdG9fbGxlKHRyaWct
PnRkYXRhMSk7Cj4gICAgICAgICAgICAgICAgIHhtaXQtPnRkYXRhMiA9IGNwdV90b19sbGUodHJp
Zy0+dGRhdGEyKTsKPiAgICAgICAgICAgICAgICAgeG1pdC0+dGRhdGEzID0gY3B1X3RvX2xsZSh0
cmlnLT50ZGF0YTMpOwo+IC0gICAgICAgICAgICAgICBzYmlfaGFydF91bm1hcF9zYWRkcigpOwo+
ICAgICAgICAgfQo+ICsgICAgICAgc2JpX2hhcnRfdW5tYXBfc2FkZHIoKTsKPgo+ICAgICAgICAg
cmV0dXJuIFNCSV9TVUNDRVNTOwo+ICB9Cj4gQEAgLTU1NiwxMCArNTU3LDExIEBAIGludCBzYmlf
ZGJ0cl9pbnN0YWxsX3RyaWcodW5zaWduZWQgbG9uZyBzbW9kZSwKPiAgICAgICAgICAgICAgICAg
cmV0dXJuIFNCSV9FUlJfTk9fU0hNRU07Cj4KPiAgICAgICAgIHNobWVtX2Jhc2UgPSBoYXJ0X3No
bWVtX2Jhc2UoaHMpOwo+ICsgICAgICAgc2JpX2hhcnRfbWFwX3NhZGRyKCh1bnNpZ25lZCBsb25n
KXNobWVtX2Jhc2UsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgdHJpZ19jb3VudCAqIHNp
emVvZigqZW50cnkpKTsKPgo+ICAgICAgICAgLyogQ2hlY2sgcmVxdWVzdGVkIHRyaWdnZXJzIGNv
bmZpZ3VyYXRpb24gKi8KPiAgICAgICAgIGZvcl9lYWNoX3RyaWdfZW50cnkoc2htZW1fYmFzZSwg
dHJpZ19jb3VudCwgdHlwZW9mKCplbnRyeSksIGVudHJ5KSB7Cj4gLSAgICAgICAgICAgICAgIHNi
aV9oYXJ0X21hcF9zYWRkcigodW5zaWduZWQgbG9uZyllbnRyeSwgc2l6ZW9mKCplbnRyeSkpOwo+
ICAgICAgICAgICAgICAgICByZWN2ID0gKHN0cnVjdCBzYmlfZGJ0cl9kYXRhX21zZyAqKSgmZW50
cnktPmRhdGEpOwo+ICAgICAgICAgICAgICAgICBjdHJsID0gcmVjdi0+dGRhdGExOwo+Cj4gQEAg
LTU3NCwxMSArNTc2LDExIEBAIGludCBzYmlfZGJ0cl9pbnN0YWxsX3RyaWcodW5zaWduZWQgbG9u
ZyBzbW9kZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICBzYmlfaGFydF91bm1hcF9zYWRkcigp
Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBTQklfRVJSX0ZBSUxFRDsKPiAgICAg
ICAgICAgICAgICAgfQo+IC0gICAgICAgICAgICAgICBzYmlfaGFydF91bm1hcF9zYWRkcigpOwo+
ICAgICAgICAgfQo+Cj4gICAgICAgICBpZiAoaHMtPmF2YWlsYWJsZV90cmlncyA8IHRyaWdfY291
bnQpIHsKPiAgICAgICAgICAgICAgICAgKm91dCA9IGhzLT5hdmFpbGFibGVfdHJpZ3M7Cj4gKyAg
ICAgICAgICAgICAgIHNiaV9oYXJ0X3VubWFwX3NhZGRyKCk7Cj4gICAgICAgICAgICAgICAgIHJl
dHVybiBTQklfRVJSX0ZBSUxFRDsKPiAgICAgICAgIH0KPgo+IEBAIC01OTAsMTYgKzU5MiwxNSBA
QCBpbnQgc2JpX2RidHJfaW5zdGFsbF90cmlnKHVuc2lnbmVkIGxvbmcgc21vZGUsCj4gICAgICAg
ICAgICAgICAgICAqLwo+ICAgICAgICAgICAgICAgICB0cmlnID0gc2JpX2FsbG9jX3RyaWdnZXIo
KTsKPgo+IC0gICAgICAgICAgICAgICBzYmlfaGFydF9tYXBfc2FkZHIoKHVuc2lnbmVkIGxvbmcp
ZW50cnksIHNpemVvZigqZW50cnkpKTsKPiAtCj4gICAgICAgICAgICAgICAgIHJlY3YgPSAoc3Ry
dWN0IHNiaV9kYnRyX2RhdGFfbXNnICopKCZlbnRyeS0+ZGF0YSk7Cj4gICAgICAgICAgICAgICAg
IHhtaXQgPSAoc3RydWN0IHNiaV9kYnRyX2lkX21zZyAqKSgmZW50cnktPmlkKTsKPgo+ICAgICAg
ICAgICAgICAgICBkYnRyX3RyaWdnZXJfc2V0dXAodHJpZywgIHJlY3YpOwo+ICAgICAgICAgICAg
ICAgICBkYnRyX3RyaWdnZXJfZW5hYmxlKHRyaWcpOwo+ICAgICAgICAgICAgICAgICB4bWl0LT5p
ZHggPSBjcHVfdG9fbGxlKHRyaWctPmluZGV4KTsKPiAtICAgICAgICAgICAgICAgc2JpX2hhcnRf
dW5tYXBfc2FkZHIoKTsKPiArCj4gICAgICAgICB9Cj4gKyAgICAgICBzYmlfaGFydF91bm1hcF9z
YWRkcigpOwo+Cj4gICAgICAgICByZXR1cm4gU0JJX1NVQ0NFU1M7Cj4gIH0KPiAtLQo+IDIuNDcu
Mgo+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
