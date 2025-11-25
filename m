Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BB1D0EE0F
	for <opensbi@archiver.kernel.org>; Tue, 25 Nov 2025 19:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Phv4pwVQK5JzovsYqN3YNkNCJ1ax83XXBLo7GA32iY=; b=kgunrxs8xWMeBQnpAPNRmZOw1s
	vbzQvJZBf1trNfviHIA6JM6wrQ5vr9zAt1Ye0dS8drFPAozMv6GcC88043Lc5mda/JvXE8dEsLYQZ
	7YvRV6Ez/XLKdtkKJLvO/QPWt41YYKFMWd7il8LRYHqJfLBH3yJkWDrQrKdMNyIc5jUJ1aO5oxVF4
	+4zWJ1ZprkbBADVr6155XmAIXy37gEArOyUXwXBH6XlFp20Y3GoHddphOjVGYhMUdj8am+2WJdlqo
	eRCMGQawGeMWXgP9do7lusiLbwqSNk2Q1kYsBd7X0/M/vKtbco4aZ3H5cB9Qps+Y2l8WdKYaihXrG
	cMkxw3nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNyXf-0000000DolQ-2EE5;
	Tue, 25 Nov 2025 19:17:35 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNyXc-0000000Dok9-2TS2
	for opensbi@lists.infradead.org;
	Tue, 25 Nov 2025 19:17:33 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-340a5c58bf1so3969713a91.2
        for <opensbi@lists.infradead.org>; Tue, 25 Nov 2025 11:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764098252; x=1764703052; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jzwz6FARM7nBWQU1XCM4IUIntTAYAp7ZHltHFrdz/Kc=;
        b=PwS4Pr0cnJNTB7JsZKMfGtaQD73jqyAOAJaLNcZWHVmLykvyAjHjAVOUn5b/s1cI8z
         1twfjMpex5tHEV6be5H0TJ1iGyGQWvRJkXD13P1Z8bJ6hS4kpn0XPCGJDIGAC1azMUsw
         yFGUQEVjnHlhOagLmPB37cvl3+hs8Ta9WO0BLncnSTdI7wTKBtqZOIUWflvB+94sEZ2b
         qZTOPHnQzLJkAUrqzfAfNJuqUOUGrsVWb6tc7FyGvIVemQ2SQZO6mhOiScaQhD/HPEYH
         9fZsseE4CaBlEJXZc2ofaUsAzMBAd7lln81ZIhxfIuLn36x+AkswtAghVDO9LDSwPjAm
         CovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764098252; x=1764703052;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jzwz6FARM7nBWQU1XCM4IUIntTAYAp7ZHltHFrdz/Kc=;
        b=faApIbv/TnVh+QtsfpJJX6vDBht3VqBDmKRYaoPb6fUa4ltOjr+35FBBzOtKT3T+mE
         8u7HQBoFXE4I6Ec8hdv5RED4TMr9T+n0CNLfL1qf4xhf9iq/l+om7Ur46drTlxHrx3kz
         AhkvrR6QSjMT+MCxnVa+i8OHnzCs8K+mpUskZYNXCEOoOdXDoEIVGDQhSxKQrEqAuKnf
         Jpm7e/CxHSZWvMBYLgsjLV7m+x86TQQiK1DCS702Ku/u/6BVfWOKS+/W6c9LRJ1N8OBA
         U4a9/ZXMLrzvwztjveuaBRLR+X0UGIMtMaL13dJ6MPrHrwY4u2alKRcMSysgyJJjV4wm
         YLxg==
X-Gm-Message-State: AOJu0YxQ6p/N23NQvXg8kygxUmfgfV9HG/ciEkdPeuph0Fztv8TuTUgF
	W7J6riJ2XfNpXOmjFwVe75DYvLQdIOYk4dtlWvzeMWCHK+tg1tfScQ/J8ZGPPyIfhDs=
X-Gm-Gg: ASbGncs/3neBk0FgeyfLQNMRI3HIhBmwJ8CtHey7S3lv+DT77gWZg/TKGhX2N4LHygx
	akuP59qPPVi4F9tDulReRusJwffFhAOzU0YnntQUm9IhQFoVgPtI8wn32omSXjD4b32qnE1wDmd
	NzxOBGR1EyOXgI3M8wIfUzJ6NtYGTuKzxz8LgZ9pyeG5sHwFLPE1hWgW17Qg2iVJpFRJ7qtZGfm
	AL/KuXW9QHh4qjG7QHevqDI6DLSDvZon+rW1aCxB1JtVgHJXLy4nb/DeJKaD6EhUW2sBSVXsCrp
	/mjG3XqFgCaXaLtf78KnpVdRm3uSQI7jEhVF4euIzB2aDBuLlThcBTSgKz8I4q5KFvHLLGAWeur
	bev9scPwCJpWLcT3BaJGJbEaLlqA83aA4x7OJ+2EGDaB2t+kZGo8oF5Ol8ZMh8OxEjP0Yq+TQCT
	WhjoffxthOm0Mcn1rnRkBt
X-Google-Smtp-Source: AGHT+IHSjc1P0xSBQ3I0rI/vvnoiQshP1UlTK0x6D6+g0yLoDkmzczP05nvDuEvltuZxetdaT+TSdw==
X-Received: by 2002:a17:90b:54cd:b0:33b:a5d8:f198 with SMTP id 98e67ed59e1d1-3475ed6ada7mr3310113a91.25.1764098251775;
        Tue, 25 Nov 2025 11:17:31 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a43ac07sm203470a91.0.2025.11.25.11.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 11:17:31 -0800 (PST)
Date: Tue, 25 Nov 2025 11:17:29 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: opensbi@lists.infradead.org,
	opensbi <opensbi-bounces@lists.infradead.org>
Subject: Re: [PATCH] lib: sbi: expected trap must always clear MPRV
Message-ID: <aSYAyc347ybLinMS@debug.ba.rivosinc.com>
References: <20251124220339.3695940-1-debug@rivosinc.com>
 <DEHQBF6B4C9L.125VJJV9WIVFK@ventanamicro.com>
 <aSXvYP2OvUzePP8F@debug.ba.rivosinc.com>
 <DEI035QOBYW1.3MQ044IEZOUH9@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DEI035QOBYW1.3MQ044IEZOUH9@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_111732_630051_A1A346A0 
X-CRM114-Status: GOOD (  20.49  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBOb3YgMjUsIDIwMjUgYXQgMDc6NTE6MzRQTSArMDEwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+MjAyNS0xMS0yNVQxMDowMzoxMi0wODowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0By
aXZvc2luYy5jb20+Ogo+PiBPbiBUdWUsIE5vdiAyNSwgMjAyNSBhdCAxMjoxMjoxMVBNICswMTAw
LCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+PjIwMjUtMTEtMjRUMTQ6MDM6MzktMDg6MDAsIERl
ZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPjoKPj4+PiBFeHBlY3RlZCB0cmFwIG11c3Qg
YWx3YXlzIGNsZWFyIE1QUlYuIEN1cnJlbnRseSBpdCBkb2Vzbid0LiBUaGVyZSBpcyBhCj4+Pj4g
c2VjdXJpdHkgaXNzdWUgaGVyZSB3aGVyZSBpZiBmaXJtd2FyZSB3YXMgZG9pbmcgbGQvc3Qgd2l0
aCBNUFJWPTEgYW5kCj4+Pj4gc2luY2UgdGhlcmUgd291bGQgYmUgYSBleHBlY3RlZCB0cmFwLCBv
cGVuc2JpIHdpbGwgY29udGludWUgdG8gcnVuIGFzCj4+Pj4gTVBSVj0xLiBTZWN1cml0eSBpbXBh
Y3QgaXMgRG9TIHdoZXJlIG9wZW5zYmkgd2lsbCBqdXN0IGtlZXAgdHJhcHBpbmcuCj4+Pgo+Pj5E
b2VzIHRoZSBEb1MgaGFwcGVuIG9uIHNvbWUgaW1wbGVtZW50YXRpb24/Cj4+Cj4+IEkgcmFuIGlu
dG8gaXQgd2hpbGUgZG9pbmcgc29tZXRoaW5nIGVsc2UuIFNvIGl0IHdhcyByZXN1bHQgb2YgYmFz
aWNhbGx5Cj4+IGV5ZWJhbGxpbmcuIERpZG4ndCBvYnNlcnZlIG9uIHJlYWwgc3lzdGVtLgo+Pgo+
Pj4KPj4+VGhlIGV4cGVjdGVkIHRyYXAgY2FtZSBmcm9tIE0tbW9kZSwgdGhlcmVmb3JlIHdpbGwg
aGF2ZSBtc3RhdHVzLk1QUD0zLAo+Pj5zbyBNUFJWPTEgc2hvdWxkIGJlaGF2ZSB0aGUgc2FtZSBh
cyBNUFJWPTAuCj4+Cj4+IFllYWggSSBtaXNzZWQgdGhhdCBwYXJ0LiBZb3UgaGF2ZSBhIHBvaW50
IGhlcmUuCj4+Cj4+IEhvd2V2ZXIgaWYgd2UgcmVhZCBwcml2IHNwZWMKPj4gIjIxLjQuMS4gTWFj
aGluZSBTdGF0dXMgKG1zdGF0dXMgYW5kIG1zdGF0dXNoKSBSZWdpc3RlcnMiCj4+Cj4+IC4uLgo+
PiBUaGUgTVBWIGJpdCAoTWFjaGluZSBQcmV2aW91cyBWaXJ0dWFsaXphdGlvbiBNb2RlKSBpcyB3
cml0dGVuIGJ5IHRoZQo+PiBpbXBsZW1lbnRhdGlvbiB3aGVuZXZlciBhIHRyYXAgaXMgdGFrZW4g
aW50byBNLW1vZGUuIEp1c3QgYXMgdGhlIE1QUAo+PiBmaWVsZCBpcyBzZXQgdG8gdGhlIChub21p
bmFsKSBwcml2aWxlZ2UgbW9kZSBhdCB0aGUgdGltZSBvZiB0aGUgdHJhcCwKPj4gLi4uCj4+Cj4+
IEFib3ZlIHRleHQgc2VlbXMgdG8gc3VnZ2VzdCB0aGF0IG5vbWluYWwgcHJpdmlsZWdlIGF0IHRp
bWUgb2YgdHJhcCBpcwo+PiBzZXQgaW4gTVBQLgo+Pgo+PiBBbmQgdGhlbiBqdXN0IGEgZmV3IHBh
cmFncmFwaCBiZWxvdyBpZiB3ZSByZWFkLAo+Pgo+PiAuLi4KPj4gV2hlbiBNUFJWPTEsIGV4cGxp
Y2l0IG1lbW9yeSBhY2Nlc3NlcyBhcmUgdHJhbnNsYXRlZCBhbmQgcHJvdGVjdGVkLAo+PiBhbmQg
ZW5kaWFubmVzcyBpcyBhcHBsaWVkLCBhcyB0aG91Z2ggdGhlIGN1cnJlbnQgdmlydHVhbGl6YXRp
b24gbW9kZQo+PiB3ZXJlIHNldCB0byBNUFYgYW5kIHRoZSBjdXJyZW50IG5vbWluYWwgcHJpdmls
ZWdlIG1vZGUgd2VyZSBzZXQgdG8gTVBQCj4+IC4uLgo+Cj5JIHRoaW5rIHRoYXQgTVBSViBkb2Vz
bid0IGNoYW5nZSB0aGUgbm9taW5hbCBwcml2aWxlZ2UgbW9kZS4KPk1QUlYganVzdCBtb2RpZmll
cyBleHBsaWNpdCBtZW1vcnkgYWNjZXNzZXMgdG8gYmVoYXZlICJhcyB0aHJvdWdoIiB0aGUKPm5v
bWluYWwgcHJpdmlsZWdlIG1vZGUgd2FzIE1QUC4KPgo+ZS5nLiBsb2FkIGluc3RydWN0aW9uIGZl
dGNoZWQgd2l0aCBNLW1vZGUgaW1wbGljaXQgYWNjZXNzIChub21pbmFsCj5wcml2aWxlZ2UpIHBl
cmZvcm1zIG5vbi1NLW1vZGUgZXhwbGljaXQgbG9hZCAoZWZmZWN0aXZlIHByaXZpbGVnZSkuCj4K
PihUaGUgYXJjaGl0ZWN0dXJlIHdvdWxkIGJlIGJyb2tlbiBvdGhlcndpc2UuKQoKWWVhaCBJIHVu
ZGVyc3RhbmQgdGhhdCdzIHRoZSBkZXNpcmVkIGJlaGF2aW9yLgpBbHRob3VnaCBjdXJyZW50IHBh
dGNoIGlzIGFkZGl0aW9uYWwgc2FmZXR5IGFuZCB0aGF0IHRvbyBpbiBub3QgdmVyeSBwZXJmCmNy
aXRpY2FsIHBhdGguCgpEbyB5b3Ugc2VlIGFueSBpc3N1ZSB3aXRoIGFkZGl0aW9uYWwgc2FmZXR5
IHBhcnQgaW4gdGhlIHBhdGNoPwpJIGNhbiBtb2RpZnkgdGhlIGNvbW1pdCBtZXNzYWdlIHRvIHJl
bW92ZSBzZWN1cml0eSBpbXBhY3QgKHRoYXQgaXQgc2VlbXMgbGlrZQpob3cgaW1wbGVtZW50YXRp
b25zIGFyZSBpbXBsZW1lbnRpbmcgaXQpIGFuZCByZS1zZW5kIGl0LgoKPgo+PiBTbyBpZiB0YWtl
IHRoZW0gdG9nZXRoZXIsIGl0IHNlZW1zIGxpa2Ugbm9taW5hbCBwcml2IGF0IHRpbWUgdHJhcCBj
YW4gYmUKPj4gbGVzcyB0aGFuIDMgYW5kIHNhbWUgc2hvdWxkIHJlZmxlY3QgaW4gTVBQIGlmIGl0
IGdldHMgdHJhcHBlZC4KPgo+bm9uLU0gbm9taW5hbCBwcml2aWxlZ2UgbW9kZSBjYW4gb25seSBi
ZSByZWFjaGVkIHZpYSBtcmV0L3NyZXQsIGFuZAo+bXJldC9zcmV0IGNsZWFyIE1QUlYsIHNvIHRo
ZXJlIHNob3VsZCBiZSBubyB3YXkgdG8gZW50ZXIgYSB0cmFwIGhhbmRsZXIKPndpdGggTVBSViA9
PSAxICYmIE1QUCAhPSAzLgo+Cj4oVGhlIGV4cGVjdGVkIHRyYXAgaGFuZGxlciBzaG91bGQgb25s
eSBiZSBjb25maWd1cmVkIGR1cmluZyBvcGVuc2JpJ3MKPiBNLW1vZGUgZXhlY3V0aW9uIGFueXdh
eS4pCj4KPj4gSSBkb24ndCBrbm93IHdoYXQgaW1wbGVtZW50YXRpb25zIGFyZSBkb2luZy4gU2hv
dWxkIGFzayBhcm91bmQuCj4KPkkgd291bGRuJ3QgYmUgc3VycHJpc2VkIHRvIGZpbmQgYnVncyBp
biB0aG9zZSBjb3JuZXIgY2FzZXMuLi4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2Jp
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9vcGVuc2JpCg==
