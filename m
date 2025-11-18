Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25C9CEDD8A
	for <opensbi@archiver.kernel.org>; Tue, 18 Nov 2025 14:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v28xE86YyjiyeVRCAIb+N4oJ4rAG1ob3WLS6wh3HCQ8=; b=1m6bOESLG6Lz84
	g+1H05AjLAsTryZCzcWIra3kpubQDcZrrySkIbMSL7ySZE1HfOFxe3t3eXNKp/6dxrZtAzDpmebfZ
	I8YbQtfQhwfgVMU/Ttfq8HI8JJhvE53lzothmMoi2G87simdgzj3EQZI7yjsEzygoZphEpk+72OJj
	qbFeFJ9j5vCR+kUBkt+Q7CxDySnxLvSbiMt0+tBRumfTjrviOWhq3l1IPNd91ctr9+fu5pChl3ssW
	4/w64aVtTAm6ZQt8wukSkwtljXR/pHOGHhRIlqgv49B1JyXDANA66F3l2ydNOu9zwsqaIDQKYYuTH
	aha8yKhn4AuxSjmu2UqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMIx-00000000Wtt-0qRe;
	Tue, 18 Nov 2025 14:03:35 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMIv-00000000WtB-1KnS
	for opensbi@lists.infradead.org;
	Tue, 18 Nov 2025 14:03:34 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b70ca7d1e78so81297366b.3
        for <opensbi@lists.infradead.org>; Tue, 18 Nov 2025 06:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1763474611; x=1764079411; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1beoHTHZxyI0/iffFOkfOBdoXM1bxMQbU9IziP68KQ=;
        b=a+j/7PUjEa7gogYHJJKHXfWeAUjB5HncxbSoGgpt0ZIuV8sU0q+s69QqdZGCi6YpY1
         LV/pCBpYWoBlfno5SE7zGLK1S+wOs0JWaJyxWf1NykCJ2SP+JobZYliloNac6Y8Nd81m
         xuzBEnrPdEl4Pix+O42ix3FY3YJHIwkzOgj6EGzkqdjFDl2F4Sd7SNrqUFVF/e4l+ZAp
         ncqUdf7t9WmqYSh+ZxaMrj2gV6Ves98NdkXQaIHx9z56aKpvEgNqnKK+NkH3L+Rr13h1
         Lvm/sjxQeZzohCob1AkSDu1ZDqHX0IbWPHUpjhRz7U8sLtzjvWLoUItU/r6lOLtN3Lxq
         AmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763474611; x=1764079411;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O1beoHTHZxyI0/iffFOkfOBdoXM1bxMQbU9IziP68KQ=;
        b=hBvbQfhq3GzrHQx/+z9dWdXHTrbLs5gOQapXcaqK2vzixmmdIir2rpNwZ8pDWWKeiP
         I1QFHWyEQHr9TBX8PP5iSI2xCXzy1xNVRNwI/qLw4dwv2Hn8sIn3C2XufSIiZoPdD1Oc
         LhOKoLfYL9M/enW9ZN4HQ6McMeAt1OZGfFH2wvppyNOa6vt3A7pREt7wv3lbuhLozD+k
         wYdm6EWGlWwvNM5BlZkFoY2bhxtHAI84kpUSifyDUXGNBbh8d/eC18yXSiqIdQSGlk+3
         QJdmOlh8OrFSqAFODThCoecC8hdb7uVi/0QDcuu+Gjq58zKJKiKM8nU6ySasPKSxviqJ
         BdAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4H4zlOEMwhEN9ccUjCa/X0AQF2d0mlGHcqAXgC/kptrvK1KGzcWwzxCBJQlgRaYCD/Iawnf+g@lists.infradead.org
X-Gm-Message-State: AOJu0YyQZsocWFagR/3f5eSGRc++EuNlv7/gbpN0bfZLP2coQbOhLIKx
	dr9buC0tCk1FjNQ8AOFNIAG1MrNdasSQvjI6Uux6F9Yq22jpog4OrTso5iw89OknvMc=
X-Gm-Gg: ASbGncvuLS5QadKh65T8P97VimeqoyTT68oU3VKsm5oxtJjfZQPrxGWEo/6Dmv0IZoM
	vKGLXwKvxm1nJFidrc0ut/dkmfuYsjY/lveKJJVSpoAish1lPanP2LTfC9R2L0XjMkjY9z3MOEf
	+VyHa/Zo5+t7tddg/Zi9/Ou08o93Bwv5HFEk8XwW2qr7ruxVYmr6ybugjVRknfeGy0IRtVPT37Y
	2wm1UOsyv+IGqZSKqW3dxfkPUVdtyiq7Dc18Eo/Qq2xFXq6U8UL/yXbdQZ2/ku+G7gKNSitR4YW
	JOlBCLT/yW0yQsZbc41FDnwpne9ed9P1mIlsMyFSspFtwmI580/cR2iG4ci9BYswx+3giOpbSsa
	0FzYcUh5F/4YTed+xQZS0uX01RQbPMcDpL7vhBB+AJM/hfIHGCOXwqH10ODMwz6cRO5AZle9Ye/
	A=
X-Google-Smtp-Source: AGHT+IEjB5xgRtHNzMt07HoTdWiO9kTEXu8D9rPT0cRvnwryiIuUhX6LnHphQuZGAm9ISmLZMUrlNw==
X-Received: by 2002:a17:907:8687:b0:b6d:5106:86d2 with SMTP id a640c23a62f3a-b76238af55amr168768366b.8.1763474610984;
        Tue, 18 Nov 2025 06:03:30 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::3052])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b734fed6315sm1374678266b.64.2025.11.18.06.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 06:03:30 -0800 (PST)
Mime-Version: 1.0
Date: Tue, 18 Nov 2025 15:03:05 +0100
Message-Id: <DEBVKGILFGWB.3JT03EV4NM4PP@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v5] lib: sbi: Enable Ssqosid Ext using mstateen0
Cc: <cp0613@linux.alibaba.com>, <opensbi@lists.infradead.org>,
 <anup@brainfault.org>, "opensbi" <opensbi-bounces@lists.infradead.org>
To: "Guo Ren" <guoren@kernel.org>
References: <20251114115722.1831-1-cp0613@linux.alibaba.com>
 <DE8GW2BKAOKE.2XBAO1XW4C2RF@ventanamicro.com>
 <CAJF2gTQjXMfvAAJma1QmsETqU7aE+Nb8=koH_B91PW8BM_khaQ@mail.gmail.com>
 <CAJF2gTTZGPZazh1GCdfktySWi048fQg4AULXxVEd5sqp5v1dWg@mail.gmail.com>
In-Reply-To: <CAJF2gTTZGPZazh1GCdfktySWi048fQg4AULXxVEd5sqp5v1dWg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_060333_380900_E11319F0 
X-CRM114-Status: GOOD (  21.09  )
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

MjAyNS0xMS0xNVQxMToxNzo1MiswODowMCwgR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Ogo+
IE9uIFNhdCwgTm92IDE1LCAyMDI1IGF0IDExOjA14oCvQU0gR3VvIFJlbiA8Z3VvcmVuQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Pgo+PiBPbiBGcmksIE5vdiAxNCwgMjAyNSBhdCA5OjU14oCvUE0gUmFk
aW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+PiA+Cj4+ID4g
MjAyNS0xMS0xNFQxOTo1NzoyMiswODowMCwgPGNwMDYxM0BsaW51eC5hbGliYWJhLmNvbT46Cj4+
ID4gPiBGcm9tOiBDaGVuIFBlaSA8Y3AwNjEzQGxpbnV4LmFsaWJhYmEuY29tPgo+PiA+ID4KPj4g
PiA+IFRoZSBRb1MgSWRlbnRpZmllcnMgZXh0ZW5zaW9uIChTc3Fvc2lkKSBpbnRyb2R1Y2VzIHRo
ZSBzcm1jZmcgcmVnaXN0ZXIsCj4+ID4gPiB3aGljaCBjb25maWd1cmVzIGEgaGFydCB3aXRoIHR3
byBpZGVudGlmaWVyczogYSBSZXNvdXJjZSBDb250cm9sIElECj4+ID4gPiAoUkNJRCkgYW5kIGEg
TW9uaXRvcmluZyBDb3VudGVyIElEIChNQ0lEKS4gVGhlc2UgaWRlbnRpZmllcnMgYWNjb21wYW55
Cj4+ID4gPiBlYWNoIHJlcXVlc3QgaXNzdWVkIGJ5IHRoZSBoYXJ0IHRvIHNoYXJlZCByZXNvdXJj
ZSBjb250cm9sbGVycy4KPj4gPiA+Cj4+ID4gPiBJZiBleHRlbnNpb24gU21zdGF0ZWVuIGlzIGlt
cGxlbWVudGVkIHRvZ2V0aGVyIHdpdGggU3Nxb3NpZCwgdGhlbgo+PiA+ID4gU3Nxb3NpZCBhbHNv
IHJlcXVpcmVzIHRoZSBTUk1DRkcgYml0IGluIG1zdGF0ZWVuMCB0byBiZSBpbXBsZW1lbnRlZC4g
SWYKPj4gPiA+IG1zdGF0ZWVuMC5TUk1DRkcgaXMgMCwgYXR0ZW1wdHMgdG8gYWNjZXNzIHNybWNm
ZyBpbiBwcml2aWxlZ2UgbW9kZXMgbGVzcwo+PiA+ID4gcHJpdmlsZWdlZCB0aGFuIE0tbW9kZSBy
YWlzZSBhbiBpbGxlZ2FsLWluc3RydWN0aW9uIGV4Y2VwdGlvbi4gSWYKPj4gPiA+IG1zdGF0ZWVu
MC5TUk1DRkcgaXMgMSBvciBpZiBleHRlbnNpb24gU21zdGF0ZWVuIGlzIG5vdCBpbXBsZW1lbnRl
ZCwKPj4gPiA+IGF0dGVtcHRzIHRvIGFjY2VzcyBzcm1jZmcgd2hlbiBWPTEgcmFpc2UgYSB2aXJ0
dWFsLWluc3RydWN0aW9uIGV4Y2VwdGlvbi4KPj4gPiA+Cj4+ID4gPiBUaGlzIGV4dGVuc2lvbiBj
YW4gYmUgZm91bmQgaW4gdGhlIFJJU0MtViBJbnN0cnVjdGlvbiBTZXQgTWFudWFsOgo+PiA+ID4g
aHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWlzYS1tYW51YWwKPj4gPiA+Cj4+ID4gPiBD
aGFuZ2VzIGluIHY1Ogo+PiA+ID4gIC0gUmVtb3ZlIFNCSV9IQVJUX0VYVF9TU1FPU0lEIGRlcGVu
ZGVuY3kgU0JJX0hBUlRfUFJJVl9WRVJfMV8xMgo+PiA+ID4KPj4gPiA+IENoYW5nZXMgaW4gdjQ6
Cj4+ID4gPiAgLSBSZW1vdmUgZXh0cmFuZW91cyBwYXJlbnRoZXNlcyBhcm91bmQgU01TVEFURUVO
MF9TUk1DRkcKPj4gPiA+Cj4+ID4gPiBDaGFuZ2VzIGluIHYzOgo+PiA+ID4gIC0gQ2hlY2sgU0JJ
X0hBUlRfRVhUX1NTUU9TSUQgd2hlbiBzd2FwcGluZyBTUk1DRkcKPj4gPiA+Cj4+ID4gPiBDaGFu
Z2VzIGluIHYyOgo+PiA+ID4gIC0gUmVtb3ZlIHRyYXAtbi1kZXRlY3QKPj4gPiA+ICAtIENvbnRl
eHQgc3dpdGNoIENTUl9TUk1DRkcKPj4gPiA+Cj4+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaGVuIFBl
aSA8Y3AwNjEzQGxpbnV4LmFsaWJhYmEuY29tPgo+PiA+ID4gLS0tCj4+ID4KPj4gPiBJdCdzIHBv
c3NpYmxlIHRoYXQgUy1tb2RlIGNvbnRyb2wgb3ZlciBzcm1jZmcgbWlnaHQgbGVhayB2ZXJ5IGxp
dHRsZQo+PiA+IGluZm9ybWF0aW9uIGFjcm9zcyBhcmNoaXRlY3R1cmFsIGlzb2xhdGlvbiBib3Vu
ZGFyaWVzLCBidXQgSSBkb24ndCBrbm93Cj4+ID4gZW5vdWdoIGFib3V0IENCUVJJIHRvIG1vdW50
IGFueSBwcmFjdGljYWwgYXR0YWNrIChpdCBtaWdodCBub3QgZXhpc3QpLAo+PiA+IHNvIHRoZSBj
dXJyZW50IGhhbmRsaW5nIHNlZW1zIGFjY2VwdGFibGUsCj4+IEZvciBtdWx0aXBsZSBkb21haW5z
LCB0aGUgc3JtY2ZnKFFvUyBJRCBQb29sKSBtdXN0IGJlIG1hbmFnZWQgZ2xvYmFsbHkKPj4gaW4g
bS1tb2RlLCBvciBkb21haW4gQSB3b3VsZCBhZmZlY3QgZG9tYWluIEIgYnkgdXNpbmcgaXRzIG93
biBzcm1jZmcuCgpSaWdodCwgdmVuZG9ycyBzaG91bGRuJ3QgYWRkIFNzcW9zaWQgdG8gdGhlIElT
QSBzdHJpbmcgdW5sZXNzIHRoZXkga25vdwp3aGF0IHRoZXkgYXJlIGRvaW5nLgppLmUuIGFsbG93
aW5nIG5vIG1vcmUgdGhhbiBzaW5nbGUgZG9tYWluIHRoYXQgcnVucyB1bmNvbnRyb2xsZWQgY29k
ZSwKYW5kIGNvbmZpZ3VyaW5nIHNybWNmZyBpbiB0aGVpciBjb250cm9sbGVkIGRvbWFpbnMgdG8g
YmUgdW5jb25zdHJhaW5lZC4KCldoZW4gd2UgaGF2ZSBTbU1UVCdzIG1ucm1jZmcsIEkgaW1hZ2lu
ZSB2ZW5kb3JzIHdpbGwgYmUgYWJsZSB0byBzdGFydAp1c2luZyBzcm1jZmcgaW5zaWRlIHNlcnZp
Y2UgZG9tYWlucywgb3IgZXZlbiBhbGxvdyBtdWx0aXBsZSB1c2VyCmRvbWFpbnMuICAoV2UnbGwg
bmVlZCBleHRyYSBtYW5hZ2VtZW50IGluIG9wZW5zYmkgZm9yIGl0LCB0aG91Z2guKQoKPj4gQ29t
cGFyZWQgdG8gc3dpdGNoaW5nIHRoZSBzcm1jZmcsIEkgcHJlZmVyIHRvIGVuYWJsZSBTTVNUQVRF
RU4wX1NSTUNGRwo+PiBvbmx5IGluIG9uZSBkb21haW4gKHRoZSBkZWZhdWx0IG9uZSkuCj4KPiBM
ZWF2aW5nIGl0IGF3YXkgaXMgbW9yZSBjb25zaWRlcmFibGUuCgpZb3UgbWVhbiB0cmFwcGluZyB0
byBvcGVuc2JpIGFuZCBpbXBsZW1lbnRpbmcgZmlsdGVyaW5nIGFraW4gdG8gU21NVFQ/Cgo+IFRo
aW5rIGFib3V0IHRoZSBDb1ZFIHNjZW5hcmlvOiBEb21haW4gQSAoS1ZNKSBzZXRzIHVwIFFvU19J
RCwgdGhlbgo+IERvbWFpbiBCIChUVk0pIHVzZXMgdGhlIFFvU19JRCBmcm9tIERvbWFpbiBBLiBU
aHVzLCBUVk0gbGV0cyByZWd1bGFyCj4gTGludXggS1ZNIG1hbmFnZSB0aGUgUW9TX0lEICYgQ0JR
UkkuCgpDb1ZFIGN1cnJlbnRseSBoYXMgbm8gb3B0aW9uIHRvIHNldCBzcm1jZmcgZm9yIGEgVFZN
IC0tIFRTTSBzaG91bGQKY3VycmVudGx5IHNldCBzcm1jZmcgdG8gdW5jb25zdHJhaW5lZCwgYW5k
IHRoaXMgcGF0Y2ggd2lsbApjb250ZXh0LXN3aXRjaCBpdCB3aXRob3V0IGxvc2luZyB0b28gbXVj
aCAoYW55PykgY29uZmlkZW50aWFsaXR5LgoKSSB0aGluayB0aGlzIHBhdGNoIGlzIGZpbmUgaWYg
dXNlZCBjb3JyZWN0bHksIGJ1dCBpdCBkZWZpbml0ZWx5IHdpZGVucwpyb29tIGZvciBlcnJvcnMu
ICBEbyB3ZSB3YW50IHRvIHNvbWVob3cgaW5jcmVhc2UgdGhlIHJvYnVzdG5lc3M/CgpUaGFua3Mu
CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
