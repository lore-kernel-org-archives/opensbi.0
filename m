Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2860CF256A
	for <opensbi@archiver.kernel.org>; Wed, 19 Nov 2025 02:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hbXmVx0Ye1e3OhLbiESUGcuh01X3UQ1dB7aWhGKxyi0=; b=gwq2KrSYtWmHpJ
	s+Sj8Tb1DT+SJ5kwuStbruXYgUEAuSpKY9pGQPq7IwWh915urzPUpnJEyvi8idQsDEktqNaHhG+2N
	GZUX63mjUFmZKEp6GhYHYTHuf1c8v6FVglRkrnhxQJD1Hkj+q7z9eVbLBVQn5dxbR+TZa7hddBklf
	bdMvxoBi+sj4muFCqQaWhfuxB4AQhjX633p6Ne+yTJFJo6wb97RqTKlK0FdAvXGgzRp6nl913Yxf7
	suST3/hq/cH48bBCKzKBNDipX91SJBAT8032LzhhcDAIx/CZjkXt55a+skGDy7K6gSghHFHN3w4tm
	F4IsXxYgs0STF0fpt7tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLXiA-00000001NY6-2tMX;
	Wed, 19 Nov 2025 02:14:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLXi8-00000001NXU-2e0q
	for opensbi@lists.infradead.org;
	Wed, 19 Nov 2025 02:14:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 450CC44016
	for <opensbi@lists.infradead.org>; Wed, 19 Nov 2025 02:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE21C19425
	for <opensbi@lists.infradead.org>; Wed, 19 Nov 2025 02:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763518458;
	bh=fKGnVdJEe1l+ODmXpk6PsToZH2suDKiONf4/ktvV9hw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vR81gFQtU4sLakT1t6X45HIhkhuQXjKTLsAyC9HLGdXbauTdVEvF7xJ+QgwYUSj2F
	 XCQTC5DhvfXA4MvpNviVsc8WY9gIKHu09VHqUPLdiGcgR/3h9zveMK0e0gn0VPRygL
	 4hWTt4bHxV13z0zgcudH+XmeSxzk+YMjYOZW82K2ki8Wf84LahMwAcm2NBS1Yw0TuF
	 eK+/zk4eF9dFDSw3vc0ZHX2nnJkb9DSongVx/V6jkKOrlMff/SiToVEkxeUS8zcbqb
	 2OJ34dygS3filyKxPDj30GW300mhx52zrcwSDmtRndbde34FlzLi/PIftDiL79LcrS
	 MExVqjEawHvOQ==
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b3ac40ae4so3740033f8f.0
        for <opensbi@lists.infradead.org>; Tue, 18 Nov 2025 18:14:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW2dO7Rex5qN+hsMiQ57LKvbzDLOMehN1VgEfH/hVTQaZRpIkNnTIo9Dfcb9LhBPIgVpJY/r8oM@lists.infradead.org
X-Gm-Message-State: AOJu0YxRexRDomcZ3gSnqaOyirbqP1VPcLFhuyy1cV8FTMY8i3yrj9jq
	PeADGejWdBPCvPm20qaC5KOilhigTsjVwDE3DUkDdGVRsgWFIA0/3k+xo86AZdIsmIPZRPfoE5V
	HBLm1x/da5VhUPNGvXwwNA1Hr+Amk/bc=
X-Google-Smtp-Source: AGHT+IHY/gYnwqk6CNec2SWKrPOGCgezi3wLc9zsNApgd+TOUNFRTL4eOIJgkIiUb/0AuXmDhJcb49G6nWFdCNTiRhA=
X-Received: by 2002:a5d:5f49:0:b0:42b:36f4:cd21 with SMTP id
 ffacd0b85a97d-42b593742e7mr17626953f8f.40.1763518455962; Tue, 18 Nov 2025
 18:14:15 -0800 (PST)
MIME-Version: 1.0
References: <20251114115722.1831-1-cp0613@linux.alibaba.com>
 <DE8GW2BKAOKE.2XBAO1XW4C2RF@ventanamicro.com> <CAJF2gTQjXMfvAAJma1QmsETqU7aE+Nb8=koH_B91PW8BM_khaQ@mail.gmail.com>
 <CAJF2gTTZGPZazh1GCdfktySWi048fQg4AULXxVEd5sqp5v1dWg@mail.gmail.com> <DEBVKGILFGWB.3JT03EV4NM4PP@ventanamicro.com>
In-Reply-To: <DEBVKGILFGWB.3JT03EV4NM4PP@ventanamicro.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 19 Nov 2025 10:14:03 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRFKuF_uQ_xsjGm1L8nvn-Hzv8951xVP9wn8j=rayNE4A@mail.gmail.com>
X-Gm-Features: AWmQ_blmVSXSwNKwRX5GPkNEWV6AOjowYNPUyJ5ukphj3bnRl0y7IejzXdNT_pw
Message-ID: <CAJF2gTRFKuF_uQ_xsjGm1L8nvn-Hzv8951xVP9wn8j=rayNE4A@mail.gmail.com>
Subject: Re: [PATCH v5] lib: sbi: Enable Ssqosid Ext using mstateen0
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: cp0613@linux.alibaba.com, opensbi@lists.infradead.org, anup@brainfault.org, 
	opensbi <opensbi-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_181420_716278_2CACC17B 
X-CRM114-Status: GOOD (  31.96  )
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

T24gVHVlLCBOb3YgMTgsIDIwMjUgYXQgMTA6MDPigK9QTSBSYWRpbSBLcsSNbcOhxZkgPHJrcmNt
YXJAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiAyMDI1LTExLTE1VDExOjE3OjUyKzA4OjAw
LCBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz46Cj4gPiBPbiBTYXQsIE5vdiAxNSwgMjAyNSBh
dCAxMTowNeKAr0FNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPiB3cm90ZToKPiA+Pgo+ID4+
IE9uIEZyaSwgTm92IDE0LCAyMDI1IGF0IDk6NTXigK9QTSBSYWRpbSBLcsSNbcOhxZkgPHJrcmNt
YXJAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPj4gPgo+ID4+ID4gMjAyNS0xMS0xNFQxOTo1
NzoyMiswODowMCwgPGNwMDYxM0BsaW51eC5hbGliYWJhLmNvbT46Cj4gPj4gPiA+IEZyb206IENo
ZW4gUGVpIDxjcDA2MTNAbGludXguYWxpYmFiYS5jb20+Cj4gPj4gPiA+Cj4gPj4gPiA+IFRoZSBR
b1MgSWRlbnRpZmllcnMgZXh0ZW5zaW9uIChTc3Fvc2lkKSBpbnRyb2R1Y2VzIHRoZSBzcm1jZmcg
cmVnaXN0ZXIsCj4gPj4gPiA+IHdoaWNoIGNvbmZpZ3VyZXMgYSBoYXJ0IHdpdGggdHdvIGlkZW50
aWZpZXJzOiBhIFJlc291cmNlIENvbnRyb2wgSUQKPiA+PiA+ID4gKFJDSUQpIGFuZCBhIE1vbml0
b3JpbmcgQ291bnRlciBJRCAoTUNJRCkuIFRoZXNlIGlkZW50aWZpZXJzIGFjY29tcGFueQo+ID4+
ID4gPiBlYWNoIHJlcXVlc3QgaXNzdWVkIGJ5IHRoZSBoYXJ0IHRvIHNoYXJlZCByZXNvdXJjZSBj
b250cm9sbGVycy4KPiA+PiA+ID4KPiA+PiA+ID4gSWYgZXh0ZW5zaW9uIFNtc3RhdGVlbiBpcyBp
bXBsZW1lbnRlZCB0b2dldGhlciB3aXRoIFNzcW9zaWQsIHRoZW4KPiA+PiA+ID4gU3Nxb3NpZCBh
bHNvIHJlcXVpcmVzIHRoZSBTUk1DRkcgYml0IGluIG1zdGF0ZWVuMCB0byBiZSBpbXBsZW1lbnRl
ZC4gSWYKPiA+PiA+ID4gbXN0YXRlZW4wLlNSTUNGRyBpcyAwLCBhdHRlbXB0cyB0byBhY2Nlc3Mg
c3JtY2ZnIGluIHByaXZpbGVnZSBtb2RlcyBsZXNzCj4gPj4gPiA+IHByaXZpbGVnZWQgdGhhbiBN
LW1vZGUgcmFpc2UgYW4gaWxsZWdhbC1pbnN0cnVjdGlvbiBleGNlcHRpb24uIElmCj4gPj4gPiA+
IG1zdGF0ZWVuMC5TUk1DRkcgaXMgMSBvciBpZiBleHRlbnNpb24gU21zdGF0ZWVuIGlzIG5vdCBp
bXBsZW1lbnRlZCwKPiA+PiA+ID4gYXR0ZW1wdHMgdG8gYWNjZXNzIHNybWNmZyB3aGVuIFY9MSBy
YWlzZSBhIHZpcnR1YWwtaW5zdHJ1Y3Rpb24gZXhjZXB0aW9uLgo+ID4+ID4gPgo+ID4+ID4gPiBU
aGlzIGV4dGVuc2lvbiBjYW4gYmUgZm91bmQgaW4gdGhlIFJJU0MtViBJbnN0cnVjdGlvbiBTZXQg
TWFudWFsOgo+ID4+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtaXNhLW1hbnVh
bAo+ID4+ID4gPgo+ID4+ID4gPiBDaGFuZ2VzIGluIHY1Ogo+ID4+ID4gPiAgLSBSZW1vdmUgU0JJ
X0hBUlRfRVhUX1NTUU9TSUQgZGVwZW5kZW5jeSBTQklfSEFSVF9QUklWX1ZFUl8xXzEyCj4gPj4g
PiA+Cj4gPj4gPiA+IENoYW5nZXMgaW4gdjQ6Cj4gPj4gPiA+ICAtIFJlbW92ZSBleHRyYW5lb3Vz
IHBhcmVudGhlc2VzIGFyb3VuZCBTTVNUQVRFRU4wX1NSTUNGRwo+ID4+ID4gPgo+ID4+ID4gPiBD
aGFuZ2VzIGluIHYzOgo+ID4+ID4gPiAgLSBDaGVjayBTQklfSEFSVF9FWFRfU1NRT1NJRCB3aGVu
IHN3YXBwaW5nIFNSTUNGRwo+ID4+ID4gPgo+ID4+ID4gPiBDaGFuZ2VzIGluIHYyOgo+ID4+ID4g
PiAgLSBSZW1vdmUgdHJhcC1uLWRldGVjdAo+ID4+ID4gPiAgLSBDb250ZXh0IHN3aXRjaCBDU1Jf
U1JNQ0ZHCj4gPj4gPiA+Cj4gPj4gPiA+IFNpZ25lZC1vZmYtYnk6IENoZW4gUGVpIDxjcDA2MTNA
bGludXguYWxpYmFiYS5jb20+Cj4gPj4gPiA+IC0tLQo+ID4+ID4KPiA+PiA+IEl0J3MgcG9zc2li
bGUgdGhhdCBTLW1vZGUgY29udHJvbCBvdmVyIHNybWNmZyBtaWdodCBsZWFrIHZlcnkgbGl0dGxl
Cj4gPj4gPiBpbmZvcm1hdGlvbiBhY3Jvc3MgYXJjaGl0ZWN0dXJhbCBpc29sYXRpb24gYm91bmRh
cmllcywgYnV0IEkgZG9uJ3Qga25vdwo+ID4+ID4gZW5vdWdoIGFib3V0IENCUVJJIHRvIG1vdW50
IGFueSBwcmFjdGljYWwgYXR0YWNrIChpdCBtaWdodCBub3QgZXhpc3QpLAo+ID4+ID4gc28gdGhl
IGN1cnJlbnQgaGFuZGxpbmcgc2VlbXMgYWNjZXB0YWJsZSwKPiA+PiBGb3IgbXVsdGlwbGUgZG9t
YWlucywgdGhlIHNybWNmZyhRb1MgSUQgUG9vbCkgbXVzdCBiZSBtYW5hZ2VkIGdsb2JhbGx5Cj4g
Pj4gaW4gbS1tb2RlLCBvciBkb21haW4gQSB3b3VsZCBhZmZlY3QgZG9tYWluIEIgYnkgdXNpbmcg
aXRzIG93biBzcm1jZmcuCj4KPiBSaWdodCwgdmVuZG9ycyBzaG91bGRuJ3QgYWRkIFNzcW9zaWQg
dG8gdGhlIElTQSBzdHJpbmcgdW5sZXNzIHRoZXkga25vdwo+IHdoYXQgdGhleSBhcmUgZG9pbmcu
Cj4gaS5lLiBhbGxvd2luZyBubyBtb3JlIHRoYW4gc2luZ2xlIGRvbWFpbiB0aGF0IHJ1bnMgdW5j
b250cm9sbGVkIGNvZGUsCj4gYW5kIGNvbmZpZ3VyaW5nIHNybWNmZyBpbiB0aGVpciBjb250cm9s
bGVkIGRvbWFpbnMgdG8gYmUgdW5jb25zdHJhaW5lZC4KPgo+IFdoZW4gd2UgaGF2ZSBTbU1UVCdz
IG1ucm1jZmcsIEkgaW1hZ2luZSB2ZW5kb3JzIHdpbGwgYmUgYWJsZSB0byBzdGFydAo+IHVzaW5n
IHNybWNmZyBpbnNpZGUgc2VydmljZSBkb21haW5zLCBvciBldmVuIGFsbG93IG11bHRpcGxlIHVz
ZXIKPiBkb21haW5zLiAgKFdlJ2xsIG5lZWQgZXh0cmEgbWFuYWdlbWVudCBpbiBvcGVuc2JpIGZv
ciBpdCwgdGhvdWdoLikKPgo+ID4+IENvbXBhcmVkIHRvIHN3aXRjaGluZyB0aGUgc3JtY2ZnLCBJ
IHByZWZlciB0byBlbmFibGUgU01TVEFURUVOMF9TUk1DRkcKPiA+PiBvbmx5IGluIG9uZSBkb21h
aW4gKHRoZSBkZWZhdWx0IG9uZSkuCj4gPgo+ID4gTGVhdmluZyBpdCBhd2F5IGlzIG1vcmUgY29u
c2lkZXJhYmxlLgo+Cj4gWW91IG1lYW4gdHJhcHBpbmcgdG8gb3BlbnNiaSBhbmQgaW1wbGVtZW50
aW5nIGZpbHRlcmluZyBha2luIHRvIFNtTVRUPwo+Cj4gPiBUaGluayBhYm91dCB0aGUgQ29WRSBz
Y2VuYXJpbzogRG9tYWluIEEgKEtWTSkgc2V0cyB1cCBRb1NfSUQsIHRoZW4KPiA+IERvbWFpbiBC
IChUVk0pIHVzZXMgdGhlIFFvU19JRCBmcm9tIERvbWFpbiBBLiBUaHVzLCBUVk0gbGV0cyByZWd1
bGFyCj4gPiBMaW51eCBLVk0gbWFuYWdlIHRoZSBRb1NfSUQgJiBDQlFSSS4KPgo+IENvVkUgY3Vy
cmVudGx5IGhhcyBubyBvcHRpb24gdG8gc2V0IHNybWNmZyBmb3IgYSBUVk0gLS0gVFNNIHNob3Vs
ZCwKPiBjdXJyZW50bHkgc2V0IHNybWNmZyB0byB1bmNvbnN0cmFpbmVkLCBhbmQgdGhpcyBwYXRj
aCB3aWxsCj4gY29udGV4dC1zd2l0Y2ggaXQgd2l0aG91dCBsb3NpbmcgdG9vIG11Y2ggKGFueT8p
IGNvbmZpZGVudGlhbGl0eS4KPgo+IEkgdGhpbmsgdGhpcyBwYXRjaCBpcyBmaW5lIGlmIHVzZWQg
Y29ycmVjdGx5LCBidXQgaXQgZGVmaW5pdGVseSB3aWRlbnMKPiByb29tIGZvciBlcnJvcnMuICBE
byB3ZSB3YW50IHRvIHNvbWVob3cgaW5jcmVhc2UgdGhlIHJvYnVzdG5lc3M/CkkgcmVjb21tZW5k
IHJlbW92aW5nIHRoZSBzd2l0Y2hfdG9fbmV4dF9kb21haW5fY29udGV4dCBtb2RpZmljYXRpb24g
aW4KdGhpcyBwYXRjaCwgYmVjYXVzZSB0aGUgc29sdXRpb24gaXMgbm90IHJlYWR5LiBXZSBjb3Vs
ZCBsZWF2ZSBpdCBmb3IgYQpsYXRlciBjb21wcmVoZW5zaXZlIHNvbHV0aW9uIChlLmcuLCBUU00p
LgoKV2hlbiB3ZSBzZXQgc3JtY2ZnIG9uIHRoZSBMaW51eCBzaWRlIHZpYSB0aGUgcmVzY3RybCBp
bnRlcmZhY2UgYW5kCmNyZWF0ZSBhIFRWTSB1c2luZyB0aGUgQ29WRSBBUEksIHRoZSBxb3NpZCBz
ZXR0aW5nIGlzIG5hdHVyYWxseQppbmhlcml0ZWQgYnkgdGhlIFRWTSwgd2hpY2ggaXMgd2hhdCBJ
IGV4cGVjdDogbGV0IHRoZSBsb3dlc3QtcHJpdmlsZWdlCmRvbWFpbiBzZXQgdXAgc3JtY2ZnLiBU
aGlzIHBhdGNoJ3Mgc3JtY2ZnIHN3aXRjaCBpbgpzd2l0Y2hfdG9fbmV4dF9kb21haW5fY29udGV4
dCBicmVha3MgdGhlIHBhdGguCgo+Cj4gVGhhbmtzLgoKCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8g
UmVuCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
