Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEF6C3ABDA
	for <opensbi@archiver.kernel.org>; Tue, 20 May 2025 05:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3f5yybFkAwVcbvPUcjyYXJTwLL0MTk95vCQ8k797Gkc=; b=JXQwo6PwkCLi0H
	s+6CHJPxDi1Dd9d04eNSnVs08y6b24bAV9lsiJfzHrABnDERzFLif3ocoQ1sc8p/76LWocttU2zBw
	c/so8b1Dyb9bz7kC1/bGbFbA0oOanKT0vUrHh1IAAGwUygYmwXgIukhSk6staaKsnH3XfsTZ2ABJ7
	nBctHG+JxArLVQe9MJF8uj2NJEC5Qeibp8ZU5py8mlKHYLE1eWDsbVgNgs9HJPAGipPzdpJSeRSat
	f3XGnp3ZBY43a1JHW38xL7PNVrXHzByFBX/JaaZNHGcakJuL8ZTRqoM9ZMPWSrQQoz0oxS3YrqbfW
	Fk/7iCvkEQIZp3Fre1EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHFNj-0000000BZ08-1eSS;
	Tue, 20 May 2025 05:19:15 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHFNh-0000000BYze-0qSC
	for opensbi@lists.infradead.org;
	Tue, 20 May 2025 05:19:14 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3da6fb115a6so41486355ab.1
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 22:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1747718352; x=1748323152; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAI05CNCW369gmBU1Tg72g1XsmsRxzchZojwZGDeO+E=;
        b=P4846puY440KB8A8pMfxEVQaibEeY0o6LDU3brpoW3WQIwj7f0iQmK9kL1XeeHEuuC
         LDTtAB3jsl2h+uAiFJ34Z8pSgNclXVQz/dX55CFGslJ/l1JOc35VY+GqScS7o4r+BIth
         5EbFEsQeQjlJhEhGGZqDynU4EtopQMvDzKzptnQWjuigOhkoN3ucy7pH4aysRNK+uzkX
         sQ2CyTDsvOG7krI9XsEqFZVAW4CpdJyo9ijTmbpNNJvF+TuQjEGinxCuD5JKkh6TXAE0
         LoEzOHTxBzCxcpCI3sWfQqua0tcqmbzYSUHVkBmt/kF9rkjF7IYKesGtlvasQejey7hC
         e1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747718352; x=1748323152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kAI05CNCW369gmBU1Tg72g1XsmsRxzchZojwZGDeO+E=;
        b=kkS3rAOngpNuCppzaPVMbZ6kPIuyp4eZiXzxv2dQiW6oWjOgSOsbmJK6REa5X6i6u/
         n9niGkziJIQp9cKHYsotASlkEblnCdcYkrcl41N7CLQaW0dkXlTWcthYuGAPOB9ZlWVT
         aQeCvDc8fCFgZzRI+6IEZYqR6fKg9WLM30WvFW+lvS6daj10hqb29QzC6llUAJB0Tlsf
         0I0JCmOUSMZFiTgaWVJTHhOMT9qTNx2P1PWsI/HmDlZS83McK5MutCbNBCXXekHoJbUP
         miJ2Gtu13AAuJNaJYpUkNLT1fTQC4mtDABjHB7V1j8xO+3tkFgtJvYgaCh4JvjLG02hB
         CtNw==
X-Gm-Message-State: AOJu0YwEaq9VWoXVb9k8IpVpOBGo9FMMLaadLlhczx+Kyu5yDFHPlD9C
	gWxNEOU6B8Drxy+84hLjKedjk8OCVDD6a93gVykCDSsTrxWAXEZqf5KspD/rz9Qpaq6WDfRLQa4
	2ovG1auzu0y4SIxM5iXW4+8VE/Lv9MPrLAU4kp7ev2nBCzCvS+UMu
X-Gm-Gg: ASbGncvS+4awNe1mYIc23XSirHsDRiavNZSMXXfdCbDSfh8+kz0CK3c2OcnW7RUUySn
	SugiV1d12iV13wofubeYudAeSJvldmXQ3DEP9HgSElVHT0K7Oe5P/c9YzDc6b65HQn3nrdjIXov
	S0Llw2s6RbMp09BMmSVl6zWwYcXnR77rY/aw==
X-Google-Smtp-Source: AGHT+IFd4oAIhXr9I/7zeHgy9sdwDC/eQ5FVDkJKMGyNQ10TBK2Wd0YQJFb81e4PCN93UASEkTapXOC5w248lDRNklM=
X-Received: by 2002:a05:6e02:1745:b0:3db:7b4c:309b with SMTP id
 e9e14a558f8ab-3db8429768amr188835775ab.2.1747718339082; Mon, 19 May 2025
 22:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
 <20250519215848.27569-1-cfu@mips.com>
In-Reply-To: <20250519215848.27569-1-cfu@mips.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 20 May 2025 10:48:47 +0530
X-Gm-Features: AX0GCFvNg9dwsKm4cxTz7FrmsexHtMEEtbdGkGyUXvu0jDzpPqCCNAoChyfUx3U
Message-ID: <CAAhSdy3mnC03rQkjk6QRhNi2ig8uUfT38rry+tQ6YTuGACr=Ew@mail.gmail.com>
Subject: Re: [PATCH v5 00/10] *** Add MIPS P8700 Platform ***
To: Chao-ying Fu <icebergfu@gmail.com>
Cc: opensbi@lists.infradead.org, Chao-ying Fu <cfu@mips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_221913_242563_24F7DEE9 
X-CRM114-Status: GOOD (  16.62  )
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

T24gVHVlLCBNYXkgMjAsIDIwMjUgYXQgMzoyOeKAr0FNIENoYW8teWluZyBGdSA8aWNlYmVyZ2Z1
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KClBsZWFzZSB3cml0ZSBwcm9wZXIgZGVzY3JpcHRpb24gaW4g
Y292ZXItbGV0dGVyIGFuZCBhbHNvIGRyb3AgdGhlICIqKioiCmZyb20gY292ZXItbGV0dGVyIHN1
YmplY3QuCgpVc2UgImdpdCBmb3JtYXQtcGF0Y2ggLU0gLUMgLS1jb3Zlci1sZXR0ZXIgLS1zdWJl
Y3QtcHJlZml4PXh5eiIgdG8KZ2VuZXJhdGUgcGF0Y2hlcyBhbmQgYWx3YXlzIHVzZSAiZ2l0IHNl
bmQtZW1haWwiIHRvIHNlbmQgcGF0Y2hlcy4KClJlZ2FyZHMsCkFudXAKCj4gKioqCj4gQ2hhbmdl
cyBpbiB2NToKPiAgIERyb3AgdGhlIGFtbyBlbXVsYXRpb24gY29kZS4KPiAgIENoYW5nZSB0byB1
c2UgbWFjcm9zIHRvIGluc2VydCBpbnN0cnVjdGlvbnMgaW4gcDg3MDAuYy4KPiAgIEFkZCAzIG5l
dyBwYXRjaGVzIHRvIHJlY29nbml6ZSBtbWlvIHJlZ2lvbnMgYW5kIHNldCB1cCBjYWNoZWFiaWxp
dHkgYmFzZWQgb24KPiAgIG1taW8gcmVnaW9ucy4KPgo+IENoYW5nZXMgaW4gdjQ6Cj4gICBSZW1v
dmUgY29kZSB0aGF0IG92ZXJyaWRlcyBuYXNjZW50X2luaXQuCj4gICBVcGRhdGUgcDg3MDAuYyB0
byB3b3JrIHdpdGggdGhlIGxhdGVzdCBvdmVycmlkZS4KPiAgIFVzZSBjc3Jfc2V0IGZvciBtaXBz
Y29uZmlnNiBpbiBwODcwMC5jLgo+ICAgQWRkIHJpc2N2LGNib20tYmxvY2stc2l6ZSB0byB0aGUg
ZHRzIGZpbGUuCj4KPiBDaGFuZ2VzIGluIHYzOgo+ICAgUmVtb3ZlIHN0dy5zLCBzdHcuaCwgYW5k
IGV4dHJhIHNjcmF0Y2ggc3BhY2UuCj4gICBVc2UgbmFzY2VudF9pbml0IHRvIGluaXRpYWx6ZSBN
SVBTIENTUnMuCj4gICBBZGQgYW1vIGVtdWxhdGlvbiB2aWEgaWxsZWdhbCBpbnN0cnVjdGlvbiBl
eGNlcHRpb25zLgo+ICAgQ2hhbmdlIHRvIHVzZSBBTU8gYW5kIFJEVElNRSBpbGxlZ2FsIGluc3Ry
dWN0aW9uIGV4Y2VwdGlvbnMuCj4gICBSZXZpc2UgdGhlIGR0cyBmaWxlLgo+ICAgUmVtb3ZlIGNv
ZGUgdGhhdCBqdW1wcyB0byBtaXBzX2Nwc19jb3JlX2VudHJ5Lgo+Cj4gQ2hhbmdlcyBpbiB2MjoK
PiAgIEJyZWFrIHVwIG9uZSBwYXRjaCB0byAxMSBwYXRjaGVzLgo+Cj4gQ2hhbmdlcyBpbiB2MToK
PiAgIE9yaWdpbmFsIGNvZGUuCj4gKioqCj4KPiBDaGFvLXlpbmcgRnUgKDgpOgo+ICAgcGxhdGZv
cm06IGdlbmVyaWM6IG1pcHM6IGFkZCBQODcwMAo+ICAgcGxhdGZvcm06IGdlbmVyaWM6IG1pcHM6
IGFkZCBoZWFkZXIgZmlsZXMKPiAgIHBsYXRmb3JtOiBnZW5lcmljOiBtaXBzOiBhZGQgYW4gZW50
cnkgZnVuY3Rpb24KPiAgIHBsYXRmb3JtOiBnZW5lcmljOiBtaXBzOiBhZGQgdGhlIHBsYXRmb3Jt
IGZpbGUKPiAgIHBsYXRmb3JtOiBnZW5lcmljOiBtaXBzOiBhZGQgYSBkdHMgZmlsZQo+ICAgcGxh
dGZvcm06IGdlbmVyaWM6IG1pcHM6IGFkZCBvYmplY3RzLm1rCj4gICBJbml0aWFsaXplIE1JUFMg
Y3VzdG9tIFBNQSByZWdpc3RlcnMKPiAgIHBsYXRmb3JtOiBnZW5lcmljOiBtaXBzOiBhZGQgbW1p
byB0byBhbGxtZW0gaW4gdGhlIGR0cyBmaWxlCj4KPiBWbGFkaW1pciBLb25kcmF0aWV2ICgyKToK
PiAgIGRldmljZXMgdG8gdXNlIE1NSU8gbWVtb3J5Cj4gICBGaXggUE1BIGluaXQgZm9yIE1NSU8g
cmVnaW9ucwo+Cj4gIGluY2x1ZGUvc2JpL3Jpc2N2X2FzbS5oICAgICAgICAgICAgICAgICAgICAg
fCAgIDIgKwo+ICBsaWIvc2JpL3Jpc2N2X2FzbS5jICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDMyICsrCj4gIGxpYi9zYmkvc2JpX2hhcnQuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
MTMgKwo+ICBsaWIvdXRpbHMvZmR0L2ZkdF9maXh1cC5jICAgICAgICAgICAgICAgICAgIHwgICAy
ICstCj4gIHBsYXRmb3JtL2dlbmVyaWMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgfCAgIDQg
Kwo+ICBwbGF0Zm9ybS9nZW5lcmljL2NvbmZpZ3MvZGVmY29uZmlnICAgICAgICAgIHwgICAxICsK
PiAgcGxhdGZvcm0vZ2VuZXJpYy9pbmNsdWRlL21pcHMvYm9hcmQuaCAgICAgICB8ICAzMyArKwo+
ICBwbGF0Zm9ybS9nZW5lcmljL2luY2x1ZGUvbWlwcy9taXBzLWNtLmggICAgIHwgIDg4ICsrKysr
Cj4gIHBsYXRmb3JtL2dlbmVyaWMvaW5jbHVkZS9taXBzL3A4NzAwLmggICAgICAgfCAxMTMgKysr
KysrKwo+ICBwbGF0Zm9ybS9nZW5lcmljL21pcHMvY3BzLXZlYy5TICAgICAgICAgICAgIHwgIDc1
ICsrKysrCj4gIHBsYXRmb3JtL2dlbmVyaWMvbWlwcy9taXBzLGJvc3Rvbi1wODcwMC5kdHMgfCAz
NDggKysrKysrKysrKysrKysrKysrKysKPiAgcGxhdGZvcm0vZ2VuZXJpYy9taXBzL29iamVjdHMu
bWsgICAgICAgICAgICB8ICAgNyArCj4gIHBsYXRmb3JtL2dlbmVyaWMvbWlwcy9wODcwMC5jICAg
ICAgICAgICAgICAgfCAyNzkgKysrKysrKysrKysrKysrKwo+ICAxMyBmaWxlcyBjaGFuZ2VkLCA5
OTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGxh
dGZvcm0vZ2VuZXJpYy9pbmNsdWRlL21pcHMvYm9hcmQuaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
cGxhdGZvcm0vZ2VuZXJpYy9pbmNsdWRlL21pcHMvbWlwcy1jbS5oCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBwbGF0Zm9ybS9nZW5lcmljL2luY2x1ZGUvbWlwcy9wODcwMC5oCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwbGF0Zm9ybS9nZW5lcmljL21pcHMvY3BzLXZlYy5TCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBwbGF0Zm9ybS9nZW5lcmljL21pcHMvbWlwcyxib3N0b24tcDg3MDAuZHRzCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBwbGF0Zm9ybS9nZW5lcmljL21pcHMvb2JqZWN0cy5tawo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgcGxhdGZvcm0vZ2VuZXJpYy9taXBzL3A4NzAwLmMKPgo+IC0tCj4gMi40Ny4x
Cj4KPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVh
ZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5z
YmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
