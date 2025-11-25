Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E8CD0EE0F
	for <opensbi@archiver.kernel.org>; Tue, 25 Nov 2025 18:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TOZB0pKsUFWyGPd2ZXOdCWs/gTeBlh5mm5Y482jWrPk=; b=jbfMa+XlrvIz4v
	2we4c67asHxiQEZteyEqRqkVkDxtN+4yx9g/x9qEQ8fiisqEDLP1obf0JiXrQspGpbFPU9n5DQQ7g
	K2sFqaj9hCmXEifh64MtGgPV6r1qP9Pme2PAHI9bSpF17AfsAG9pM/hfnSoBiHUU7ReollVZEqKWb
	46CG5nn2T5G8xM5/rDf7meEpSHau4nOFCXhgsCt+O65Bk4XCSmkuMOKKU67m8q5d6yh/8IX6ORhQ0
	pt9kXQ3hhwhe4XdrQM7JOobOsfLhpOYkEDNpv976a2lTX1ndJImba50oSTaewWYBglpkzfc2EvsP8
	PKVZVPxWw8TGBAk3nq/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNy96-0000000DnEf-49rG;
	Tue, 25 Nov 2025 18:52:12 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNy95-0000000DnDv-2daq
	for opensbi@lists.infradead.org;
	Tue, 25 Nov 2025 18:52:12 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4779cd413b4so3631575e9.2
        for <opensbi@lists.infradead.org>; Tue, 25 Nov 2025 10:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1764096730; x=1764701530; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2utFFi3Kn8IjY+wdlGgkZlLE4q4A6UQwbbQVtdtFzX8=;
        b=DcxeVKgtVJUNQJ+heoZbWSmkD+7kzCtiqLfZTVr4gunFi7gvMromvZEWXhv3afajcr
         cDvrFYrsMYDqXkKD6sFktP56kELgInMqrm0QboTcakbdHSR0gqj4nZeviLB2mjFJ0/65
         7JU/1PkhBNq1itCaBuCx7d4+GqXpLGZemddQuMjb492+dHHYYbIxDMvf5AyunRFt46jV
         GfPYmGyzyMYzp7He/13GlQ/gSsAS6r8frre/JcEBCgNlvnzn+9cQdHeYLCbRDilDlOY7
         BhshW8hDg5JVyyKGPulSRVqgwjeIeEArl3k4ZpZJ5AMtpoBdQLbwvXdTyzTZSrvVWFIL
         pakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764096730; x=1764701530;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2utFFi3Kn8IjY+wdlGgkZlLE4q4A6UQwbbQVtdtFzX8=;
        b=bzxAhg2i7qFFc9XH6mEtc56FCyohtwqW4BzE6et7O7nOqqAV1w0LmNZvuuXpFUUyiX
         jUtb6GMcarbjTIM1HZVgCpxHcWBQFMrf69TbtFr6CKzYR5rnPVtKa/RMbMaaHQGoAMiw
         RVjT4LQNjW2M87bp0ttud6/V38EkzAisp0QzcA+dmYaYwGpPyQ5/BmabHf3IQbJl0tTj
         UHhZasDvLBbEjvg8U1XjXSxNQa1nSDxb88Y+K5FTy7B10zPW4WO5YJrrgAXbmFnLeBge
         eJk80lq3bJkPA0T9uryYkD5kt660Gl475So3Wjbpt+r8NGst+iWHv2YwvPmLmQuGqXMl
         SesQ==
X-Gm-Message-State: AOJu0Yz0Rz5+ET7O4wSXpasjcDkYcnTSM3MwHX6ENwbRMQvNBJtz3kRr
	eiyeXExColpo6QmVqgPXd0kxIQIsQ2fRSMkV0IeD095ij1ZXWdM2dWmYbNOYGgfxyEg=
X-Gm-Gg: ASbGncuG3RAHsZj4omlgOgDsTfYErg5JL74XT5Jg/pKhEr25el8+lBzEqnCuJrNd/9I
	61lQfoDvdy1iJ3x3R9mr5CGnV0JAdk0DDcNYrt7VFYYHgYfwQU/wcAI3qnHE4boZukKLf5pTpdp
	Y2a2o51olFOjE0AGSCr6YGOLSwvfES0P1FfwkFTf99iwta/hhSrOCcKU8kETaZUxOyC/t+5XT1Q
	XO4Ql5OP/TWv13A2nZ2FagUqIDGRAQUimFUN8bKDey8yiEqap+YzScpLQ1K1cY+MqVIVmld1ohG
	2ocwOd+mjNDZ/aBxgvIVZfL8SGbcMk6W04w202nKQoRZqVntqWQxEZ3W5KNj69FbZ+rfVOOnvEH
	34rtxt8yymT39GnUp2mRgk+KZp4XaA4y5z2kaPO11ioQpOEBQinjLp+ocTZmr08tQ0LpIBz6Qp2
	pJf4NEvxMVUg==
X-Google-Smtp-Source: AGHT+IHQr9xM6UhG455jVgtFAByam1gnLfIjjmJTac838faW6SqnknmN1+l3QzgpP5FombSYF5UETQ==
X-Received: by 2002:a05:6000:2508:b0:42b:3ad7:fddc with SMTP id ffacd0b85a97d-42cc1ab8d7fmr8457319f8f.1.1764096729766;
        Tue, 25 Nov 2025 10:52:09 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::3052])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7fba201sm35904066f8f.32.2025.11.25.10.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 10:52:09 -0800 (PST)
Mime-Version: 1.0
Date: Tue, 25 Nov 2025 19:51:34 +0100
Message-Id: <DEI035QOBYW1.3MQ044IEZOUH9@ventanamicro.com>
Subject: Re: [PATCH] lib: sbi: expected trap must always clear MPRV
Cc: <opensbi@lists.infradead.org>, "opensbi"
 <opensbi-bounces@lists.infradead.org>
To: "Deepak Gupta" <debug@rivosinc.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20251124220339.3695940-1-debug@rivosinc.com>
 <DEHQBF6B4C9L.125VJJV9WIVFK@ventanamicro.com>
 <aSXvYP2OvUzePP8F@debug.ba.rivosinc.com>
In-Reply-To: <aSXvYP2OvUzePP8F@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_105211_711673_C6B66388 
X-CRM114-Status: GOOD (  19.78  )
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

MjAyNS0xMS0yNVQxMDowMzoxMi0wODowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5j
b20+Ogo+IE9uIFR1ZSwgTm92IDI1LCAyMDI1IGF0IDEyOjEyOjExUE0gKzAxMDAsIFJhZGltIEty
xI1tw6HFmSB3cm90ZToKPj4yMDI1LTExLTI0VDE0OjAzOjM5LTA4OjAwLCBEZWVwYWsgR3VwdGEg
PGRlYnVnQHJpdm9zaW5jLmNvbT46Cj4+PiBFeHBlY3RlZCB0cmFwIG11c3QgYWx3YXlzIGNsZWFy
IE1QUlYuIEN1cnJlbnRseSBpdCBkb2Vzbid0LiBUaGVyZSBpcyBhCj4+PiBzZWN1cml0eSBpc3N1
ZSBoZXJlIHdoZXJlIGlmIGZpcm13YXJlIHdhcyBkb2luZyBsZC9zdCB3aXRoIE1QUlY9MSBhbmQK
Pj4+IHNpbmNlIHRoZXJlIHdvdWxkIGJlIGEgZXhwZWN0ZWQgdHJhcCwgb3BlbnNiaSB3aWxsIGNv
bnRpbnVlIHRvIHJ1biBhcwo+Pj4gTVBSVj0xLiBTZWN1cml0eSBpbXBhY3QgaXMgRG9TIHdoZXJl
IG9wZW5zYmkgd2lsbCBqdXN0IGtlZXAgdHJhcHBpbmcuCj4+Cj4+RG9lcyB0aGUgRG9TIGhhcHBl
biBvbiBzb21lIGltcGxlbWVudGF0aW9uPwo+Cj4gSSByYW4gaW50byBpdCB3aGlsZSBkb2luZyBz
b21ldGhpbmcgZWxzZS4gU28gaXQgd2FzIHJlc3VsdCBvZiBiYXNpY2FsbHkKPiBleWViYWxsaW5n
LiBEaWRuJ3Qgb2JzZXJ2ZSBvbiByZWFsIHN5c3RlbS4KPgo+Pgo+PlRoZSBleHBlY3RlZCB0cmFw
IGNhbWUgZnJvbSBNLW1vZGUsIHRoZXJlZm9yZSB3aWxsIGhhdmUgbXN0YXR1cy5NUFA9MywKPj5z
byBNUFJWPTEgc2hvdWxkIGJlaGF2ZSB0aGUgc2FtZSBhcyBNUFJWPTAuCj4KPiBZZWFoIEkgbWlz
c2VkIHRoYXQgcGFydC4gWW91IGhhdmUgYSBwb2ludCBoZXJlLgo+Cj4gSG93ZXZlciBpZiB3ZSBy
ZWFkIHByaXYgc3BlYwo+ICIyMS40LjEuIE1hY2hpbmUgU3RhdHVzIChtc3RhdHVzIGFuZCBtc3Rh
dHVzaCkgUmVnaXN0ZXJzIgo+Cj4gLi4uCj4gVGhlIE1QViBiaXQgKE1hY2hpbmUgUHJldmlvdXMg
VmlydHVhbGl6YXRpb24gTW9kZSkgaXMgd3JpdHRlbiBieSB0aGUKPiBpbXBsZW1lbnRhdGlvbiB3
aGVuZXZlciBhIHRyYXAgaXMgdGFrZW4gaW50byBNLW1vZGUuIEp1c3QgYXMgdGhlIE1QUAo+IGZp
ZWxkIGlzIHNldCB0byB0aGUgKG5vbWluYWwpIHByaXZpbGVnZSBtb2RlIGF0IHRoZSB0aW1lIG9m
IHRoZSB0cmFwLAo+IC4uLgo+Cj4gQWJvdmUgdGV4dCBzZWVtcyB0byBzdWdnZXN0IHRoYXQgbm9t
aW5hbCBwcml2aWxlZ2UgYXQgdGltZSBvZiB0cmFwIGlzCj4gc2V0IGluIE1QUC4KPgo+IEFuZCB0
aGVuIGp1c3QgYSBmZXcgcGFyYWdyYXBoIGJlbG93IGlmIHdlIHJlYWQsCj4KPiAuLi4KPiBXaGVu
IE1QUlY9MSwgZXhwbGljaXQgbWVtb3J5IGFjY2Vzc2VzIGFyZSB0cmFuc2xhdGVkIGFuZCBwcm90
ZWN0ZWQsCj4gYW5kIGVuZGlhbm5lc3MgaXMgYXBwbGllZCwgYXMgdGhvdWdoIHRoZSBjdXJyZW50
IHZpcnR1YWxpemF0aW9uIG1vZGUKPiB3ZXJlIHNldCB0byBNUFYgYW5kIHRoZSBjdXJyZW50IG5v
bWluYWwgcHJpdmlsZWdlIG1vZGUgd2VyZSBzZXQgdG8gTVBQCj4gLi4uCgpJIHRoaW5rIHRoYXQg
TVBSViBkb2Vzbid0IGNoYW5nZSB0aGUgbm9taW5hbCBwcml2aWxlZ2UgbW9kZS4KTVBSViBqdXN0
IG1vZGlmaWVzIGV4cGxpY2l0IG1lbW9yeSBhY2Nlc3NlcyB0byBiZWhhdmUgImFzIHRocm91Z2gi
IHRoZQpub21pbmFsIHByaXZpbGVnZSBtb2RlIHdhcyBNUFAuCgplLmcuIGxvYWQgaW5zdHJ1Y3Rp
b24gZmV0Y2hlZCB3aXRoIE0tbW9kZSBpbXBsaWNpdCBhY2Nlc3MgKG5vbWluYWwKcHJpdmlsZWdl
KSBwZXJmb3JtcyBub24tTS1tb2RlIGV4cGxpY2l0IGxvYWQgKGVmZmVjdGl2ZSBwcml2aWxlZ2Up
LgoKKFRoZSBhcmNoaXRlY3R1cmUgd291bGQgYmUgYnJva2VuIG90aGVyd2lzZS4pCgo+IFNvIGlm
IHRha2UgdGhlbSB0b2dldGhlciwgaXQgc2VlbXMgbGlrZSBub21pbmFsIHByaXYgYXQgdGltZSB0
cmFwIGNhbiBiZQo+IGxlc3MgdGhhbiAzIGFuZCBzYW1lIHNob3VsZCByZWZsZWN0IGluIE1QUCBp
ZiBpdCBnZXRzIHRyYXBwZWQuCgpub24tTSBub21pbmFsIHByaXZpbGVnZSBtb2RlIGNhbiBvbmx5
IGJlIHJlYWNoZWQgdmlhIG1yZXQvc3JldCwgYW5kCm1yZXQvc3JldCBjbGVhciBNUFJWLCBzbyB0
aGVyZSBzaG91bGQgYmUgbm8gd2F5IHRvIGVudGVyIGEgdHJhcCBoYW5kbGVyCndpdGggTVBSViA9
PSAxICYmIE1QUCAhPSAzLgoKKFRoZSBleHBlY3RlZCB0cmFwIGhhbmRsZXIgc2hvdWxkIG9ubHkg
YmUgY29uZmlndXJlZCBkdXJpbmcgb3BlbnNiaSdzCiBNLW1vZGUgZXhlY3V0aW9uIGFueXdheS4p
Cgo+IEkgZG9uJ3Qga25vdyB3aGF0IGltcGxlbWVudGF0aW9ucyBhcmUgZG9pbmcuIFNob3VsZCBh
c2sgYXJvdW5kLgoKSSB3b3VsZG4ndCBiZSBzdXJwcmlzZWQgdG8gZmluZCBidWdzIGluIHRob3Nl
IGNvcm5lciBjYXNlcy4uLgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L29wZW5zYmkK
