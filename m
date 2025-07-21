Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495D6C83F25
	for <opensbi@archiver.kernel.org>; Mon, 21 Jul 2025 11:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cf4Dj4vK+VRcCXOs1AQfS+4zQXopg8GnJDHCm1DXuu0=; b=zB+90pgbTNde0b
	vZja/ZvxNOEIX1haRWIBg6o6nTTk7iuoQNqwBhpxHJQ3qf+8CKnLeBhUFAv4+/8QuErbljbwItaXv
	KyQvvIVUjwIhaAOnyo/Ui89fXzYPW4rLCkPjPooCabFp8SCNL5q/BZbgNm3JWTbt7FEOrqxUD0rua
	LMDSd6710I8kWqnLTpAzdvXI4AZfHS9b56L0p0QYWJZIh8fsBY9ePMxDzPLJ/KS3Ix+gyiLsMb/Ki
	Ffh5o9K8zJnhFj1SRDS+fquY/SfQFlWvWGQ2BITBXOj9pgOsXfQzJohWfxkIdwuSPtf6fNgVvzkDl
	z5yJ8rg3ldEk1t8i1Uzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udowV-0000000HAal-0dfT;
	Mon, 21 Jul 2025 11:44:27 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udoLl-0000000H2F4-0bbN
	for opensbi@lists.infradead.org;
	Mon, 21 Jul 2025 11:06:30 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3df2ccbb895so39269625ab.3
        for <opensbi@lists.infradead.org>; Mon, 21 Jul 2025 04:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1753095988; x=1753700788; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woGxk1SRwma/+O0XCcWVTGa6Nslp6ayblevU3kF/5Hg=;
        b=k1nwnPUOoKXXVw9Uncuppe31rjLjkh6WyYg4IVr/eEd1WWB3lPREe17ft4Om+r6r26
         1qiFGv7i3zgA0UZonRVT6+ruAdThHBdqO7LFoCUMl0yM5EYHZEmogqqRU0f+q0hRB2j9
         +BassSUNmJ1NyjRmij4Z5LvQppbkM/GVzjQsCxzQhrrc+NqI1gxcw8AoGAb4peQxyvLo
         Os2wtzUadlUo20iT6pU7TA5VelavtnMTsqNdIvlrXbrNKjX2E1BfKeIph1BB6Um2a0he
         75tR+Cx3x2qmUDdhENTsZRwQ6zUo993M+8PWN13Eprr5gUqrWj5PtUrKF7jTc5R4FXDB
         /DZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753095988; x=1753700788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=woGxk1SRwma/+O0XCcWVTGa6Nslp6ayblevU3kF/5Hg=;
        b=EmOfWRWkjKWPBzCScTgVyQBtMUOu7Y+v2AkLPBv/YlPHbIZcebxt0oHJ34fTrFClAo
         +DZqZ8Myb0/CiAdlxQyrayOgQzb7qEq1Itx7gf1iXWm1uS5YXFqlV4QEWOe0oGc+6tvX
         k3hK3aPsheTfbdyo1ErbGY6CdlPkaSYIdDUXwcsJzSfghgqtK5qsAf9aHsHbEOXfihj/
         7MnWEVAoNEF1Fp2frAB4930AWFyFs3Acm0gf5sBees2hcYxGNflhSis9DkWAK+8vM7uv
         /EAbA/uR2ucMbNCpZlQ4atXTImXn0LWWgYv7IGw6zRojSiS/Ge1IQSvG2u+NnDXjXYva
         DBRg==
X-Gm-Message-State: AOJu0YwsUdPHF0Sw09cFX4x3R6e1+qVWUIxxrom0/r6VAP/m54regWMO
	VYY/kS0o2SQQH/27EViMRdu1NEGObaBRWwWD3PUo7xG2z/fFml4Rs+V2ECf8nY8bLIRk8bjgLS8
	S15Nu1rdfyInJ0G20juSVBk9vOzPWxieJckYHbo3T7/jSmF8puN3J
X-Gm-Gg: ASbGncswIHiXqC9F4FFymWioK6FSL6YZlo01RXdlyDWev0cMD3HuZyb371E7gWIHDhy
	EPmxaRdLQKDwmeMAJ9A3q6jHXx0A81GHipbthrvPZwnrVQJuJBFnXc4eC5DGWWMw+21Kno451q5
	Z+X8I/QzhRgDcsTOeMfvmChCoGBDNIgb6LwJ+nm87qjMLnp1CxN89UhngnmP3v/hjXWmUCYMtnb
	K1CbPAz+zAw6NmC0TKIdsogiqPSpKDRQSN1ev44
X-Google-Smtp-Source: AGHT+IGK1Ggsv8rIFEAsxee1KuNkfwlw5fO2lIT4SJ4M2toszXWyKaFXe1m0skCLv1ni8rVoaO9geM0pnUIML2bCaKM=
X-Received: by 2002:a05:6e02:441a:10b0:3e2:8bc9:170b with SMTP id
 e9e14a558f8ab-3e28bc918f1mr131804515ab.16.1753095988106; Mon, 21 Jul 2025
 04:06:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250721010807.460788-1-wxjstz@126.com>
In-Reply-To: <20250721010807.460788-1-wxjstz@126.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 21 Jul 2025 16:36:16 +0530
X-Gm-Features: Ac12FXyqehRsuBYDGcrWe_0NnuhhxEoRypravob_EnpAcbaHWILZuyguK38Y5Xw
Message-ID: <CAAhSdy2QajRpFubdUw+md7ppU1nd6-yWOXhRcE07kMszv_DbUA@mail.gmail.com>
Subject: Re: [PATCH v2] firmware: payload: test: Add SBI shutdown call after
 test message
To: Xiang W <wxjstz@126.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_040629_183837_D183B505 
X-CRM114-Status: GOOD (  15.78  )
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

T24gTW9uLCBKdWwgMjEsIDIwMjUgYXQgNjozOeKAr0FNIFhpYW5nIFcgPHd4anN0ekAxMjYuY29t
PiB3cm90ZToKPgo+IFByZXZpb3VzbHksICdtYWtlIHJ1bicgd291bGQgaGFuZyBpbiBXRkkgYWZ0
ZXIgcHJpbnRpbmcgdGhlIHRlc3QgbWVzc2FnZS4KPiBUaGlzIGNvbW1pdCBhZGRzIGFuIFNCSSBl
Y2FsbCB0byBlbnN1cmUgUUVNVSBleGl0cyBjbGVhbmx5IGFmdGVyIHRoZSB0ZXN0Cj4gcGF5bG9h
ZCBydW5zLgo+Cj4gU2lnbmVkLW9mZi1ieTogWGlhbmcgVyA8d3hqc3R6QDEyNi5jb20+CgpMR1RN
LgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVk
IHRoaXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKPiAt
LS0KPiB2MiBjaGFuZ2VzOgo+IC0gUmVtb3ZlIHRoZSB3aGlsZSBsb29wIGFuZCBwcmludCB0aGUg
ZXJyb3IgbWVzc2FnZSBhcyBzdWdnZXN0ZWQKPiAgIGJ5IEFudXAuCj4KPiAgZmlybXdhcmUvcGF5
bG9hZHMvdGVzdF9tYWluLmMgfCAxMiArKysrKysrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9maXJtd2FyZS9w
YXlsb2Fkcy90ZXN0X21haW4uYyBiL2Zpcm13YXJlL3BheWxvYWRzL3Rlc3RfbWFpbi5jCj4gaW5k
ZXggMTk0ZGJiZTYuLjAzZjZiYTM5IDEwMDY0NAo+IC0tLSBhL2Zpcm13YXJlL3BheWxvYWRzL3Rl
c3RfbWFpbi5jCj4gKysrIGIvZmlybXdhcmUvcGF5bG9hZHMvdGVzdF9tYWluLmMKPiBAQCAtNDYs
NiArNDYsMTMgQEAgc3RhdGljIGlubGluZSB2b2lkIHNiaV9lY2FsbF9jb25zb2xlX3B1dHMoY29u
c3QgY2hhciAqc3RyKQo+ICAgICAgICAgICAgICAgICAgIHNiaV9zdHJsZW4oc3RyKSwgKHVuc2ln
bmVkIGxvbmcpc3RyLCAwLCAwLCAwLCAwKTsKPiAgfQo+Cj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBz
YmlfZWNhbGxfc2h1dGRvd24odm9pZCkKPiArewo+ICsgICAgICAgc2JpX2VjYWxsKFNCSV9FWFRf
U1JTVCwgU0JJX0VYVF9TUlNUX1JFU0VULAo+ICsgICAgICAgICAgICAgICAgIFNCSV9TUlNUX1JF
U0VUX1RZUEVfU0hVVERPV04sIFNCSV9TUlNUX1JFU0VUX1JFQVNPTl9OT05FLAo+ICsgICAgICAg
ICAgICAgICAgIDAsIDAsIDAsIDApOwo+ICt9Cj4gKwo+ICAjZGVmaW5lIHdmaSgpICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgZG8geyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAgICAgICAg
ICAgIF9fYXNtX18gX192b2xhdGlsZV9fKCJ3ZmkiIDo6OiAibWVtb3J5Iik7IFwKPiBAQCAtNTQs
NyArNjEsNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc2JpX2VjYWxsX2NvbnNvbGVfcHV0cyhjb25z
dCBjaGFyICpzdHIpCj4gIHZvaWQgdGVzdF9tYWluKHVuc2lnbmVkIGxvbmcgYTAsIHVuc2lnbmVk
IGxvbmcgYTEpCj4gIHsKPiAgICAgICAgIHNiaV9lY2FsbF9jb25zb2xlX3B1dHMoIlxuVGVzdCBw
YXlsb2FkIHJ1bm5pbmdcbiIpOwo+IC0KPiAtICAgICAgIHdoaWxlICgxKQo+IC0gICAgICAgICAg
ICAgICB3ZmkoKTsKPiArICAgICAgIHNiaV9lY2FsbF9zaHV0ZG93bigpOwo+ICsgICAgICAgc2Jp
X2VjYWxsX2NvbnNvbGVfcHV0cygic2JpX2VjYWxsX3NodXRkb3duIGZhaWxlZCB0byBleGVjdXRl
LlxuIik7Cj4gIH0KPiAtLQo+IDIuNDcuMgo+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3Bl
bnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbnNiaQo=
