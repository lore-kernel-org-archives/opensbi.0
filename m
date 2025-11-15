Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786B2CEACEF
	for <opensbi@archiver.kernel.org>; Sat, 15 Nov 2025 03:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jraX7O/AckLEGniXlmM9LXO7lWQKlYvHZ+ixGznWvko=; b=cwF1LPmIO8J7CL
	CXjKvhXE4QZgHDF2Mbd2pIz2FnekmndX0KlT1MoiNpI74aLtj65JOc/IstrV0AwYC5BDUBwivDZLy
	p8eA01/znSHSahW5PAlxC2mHr96M44a2pnlDkGZu8JdqBRFO1qFb7WTaVaS20YRZTQsH+5PbtU7fF
	Bw4FwY6C3Po4glfzHJHY0LKim5L4rTw+XJnGxMnLhbCKfyS6OI8B0vJpxppmtKkYosJFMPH2U0EHr
	748QvesPb9JD072c87qNRUlVwyek2v4Baeyji1hHhcxWVzjAsatMMO17vSRjxAkRS10IpT+MMQfVl
	4ykO5ezANrYYlmQLgsqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK6ng-0000000DPIc-3Jyu;
	Sat, 15 Nov 2025 03:18:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK6nf-0000000DPHg-03Vj
	for opensbi@lists.infradead.org;
	Sat, 15 Nov 2025 03:18:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 23B9C60007
	for <opensbi@lists.infradead.org>; Sat, 15 Nov 2025 03:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2451C116B1
	for <opensbi@lists.infradead.org>; Sat, 15 Nov 2025 03:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763176685;
	bh=ar3Enn3BhA6HB7w2Etg3NhqSzpNarp8MeftsScL5k/Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DqoQIh0LQUJWX81lSMEiPsy/M8yK6+LGAD52DrG/kTgsqEIzO57/w/WL8A0oMQh6g
	 Hk30bSW8PVraMVHQd3bk3ippanpBuJsThG0CDy8zPtmrNXzwBgYHQUnbQ8iYVKMsyq
	 J21R3iuQ5fqBXNKUXgx7guh0vyOSBMlEFqsGFG/mqqZ8aRXvmtPlGnbPnQDere27E0
	 jzvXgivFb9/F7+GKMwzBgYu0DE/NS2GJlpdwPNc0lBko/8yZrQK2d9e7TwhYukaWLC
	 YUikIpxe4QZ+PlDFhaxccv7T9BG91ep5X0fYatibZ4/dXejOxajgh9lktWS/+gjny+
	 Qj0inTFqzDZtQ==
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b38693c4dso1220057f8f.3
        for <opensbi@lists.infradead.org>; Fri, 14 Nov 2025 19:18:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWFqa+8FySqQq+XQqRDqW1JKV3yT86ftUoArPTiyLeBf/CK8c3MYhSLaUhyOmfGz75sNjkhB/zE@lists.infradead.org
X-Gm-Message-State: AOJu0YzTIVMzQTkpv2AefZX7xMRY73WxJCPpq9GFZobw9QsiBpAgO5HU
	cMXimS21MwKGijijPAznxyHOzjSBgVvr42RP62YN7h3/YEfv6E2Z8INr4Jma4AaAMgVBpzKJek5
	dMmELfbmD5UVDJE5MPexkf+mgDgaIEQk=
X-Google-Smtp-Source: AGHT+IFghZNdUn5PdpArAAqQ9RLSM1k4trUhRICFG5oiCXNnYzMM/teASBd1TvNi2QQeZu6QhgeSL1dQtMRg5bMKWZI=
X-Received: by 2002:a05:6000:2406:b0:42b:3592:1b88 with SMTP id
 ffacd0b85a97d-42b59398ab3mr4995029f8f.50.1763176684266; Fri, 14 Nov 2025
 19:18:04 -0800 (PST)
MIME-Version: 1.0
References: <20251114115722.1831-1-cp0613@linux.alibaba.com>
 <DE8GW2BKAOKE.2XBAO1XW4C2RF@ventanamicro.com> <CAJF2gTQjXMfvAAJma1QmsETqU7aE+Nb8=koH_B91PW8BM_khaQ@mail.gmail.com>
In-Reply-To: <CAJF2gTQjXMfvAAJma1QmsETqU7aE+Nb8=koH_B91PW8BM_khaQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 15 Nov 2025 11:17:52 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTZGPZazh1GCdfktySWi048fQg4AULXxVEd5sqp5v1dWg@mail.gmail.com>
X-Gm-Features: AWmQ_bkQAriUmDQbzhUCGfrOl0Houqj9UkeSO1_h8KA3tTqUTB1x2uRNRJ4n9Gc
Message-ID: <CAJF2gTTZGPZazh1GCdfktySWi048fQg4AULXxVEd5sqp5v1dWg@mail.gmail.com>
Subject: Re: [PATCH v5] lib: sbi: Enable Ssqosid Ext using mstateen0
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: cp0613@linux.alibaba.com, opensbi@lists.infradead.org, anup@brainfault.org, 
	opensbi <opensbi-bounces@lists.infradead.org>
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

T24gU2F0LCBOb3YgMTUsIDIwMjUgYXQgMTE6MDXigK9BTSBHdW8gUmVuIDxndW9yZW5Aa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIE5vdiAxNCwgMjAyNSBhdCA5OjU14oCvUE0gUmFkaW0g
S3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4KPiA+IDIwMjUt
MTEtMTRUMTk6NTc6MjIrMDg6MDAsIDxjcDA2MTNAbGludXguYWxpYmFiYS5jb20+Ogo+ID4gPiBG
cm9tOiBDaGVuIFBlaSA8Y3AwNjEzQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gPgo+ID4gPiBUaGUg
UW9TIElkZW50aWZpZXJzIGV4dGVuc2lvbiAoU3Nxb3NpZCkgaW50cm9kdWNlcyB0aGUgc3JtY2Zn
IHJlZ2lzdGVyLAo+ID4gPiB3aGljaCBjb25maWd1cmVzIGEgaGFydCB3aXRoIHR3byBpZGVudGlm
aWVyczogYSBSZXNvdXJjZSBDb250cm9sIElECj4gPiA+IChSQ0lEKSBhbmQgYSBNb25pdG9yaW5n
IENvdW50ZXIgSUQgKE1DSUQpLiBUaGVzZSBpZGVudGlmaWVycyBhY2NvbXBhbnkKPiA+ID4gZWFj
aCByZXF1ZXN0IGlzc3VlZCBieSB0aGUgaGFydCB0byBzaGFyZWQgcmVzb3VyY2UgY29udHJvbGxl
cnMuCj4gPiA+Cj4gPiA+IElmIGV4dGVuc2lvbiBTbXN0YXRlZW4gaXMgaW1wbGVtZW50ZWQgdG9n
ZXRoZXIgd2l0aCBTc3Fvc2lkLCB0aGVuCj4gPiA+IFNzcW9zaWQgYWxzbyByZXF1aXJlcyB0aGUg
U1JNQ0ZHIGJpdCBpbiBtc3RhdGVlbjAgdG8gYmUgaW1wbGVtZW50ZWQuIElmCj4gPiA+IG1zdGF0
ZWVuMC5TUk1DRkcgaXMgMCwgYXR0ZW1wdHMgdG8gYWNjZXNzIHNybWNmZyBpbiBwcml2aWxlZ2Ug
bW9kZXMgbGVzcwo+ID4gPiBwcml2aWxlZ2VkIHRoYW4gTS1tb2RlIHJhaXNlIGFuIGlsbGVnYWwt
aW5zdHJ1Y3Rpb24gZXhjZXB0aW9uLiBJZgo+ID4gPiBtc3RhdGVlbjAuU1JNQ0ZHIGlzIDEgb3Ig
aWYgZXh0ZW5zaW9uIFNtc3RhdGVlbiBpcyBub3QgaW1wbGVtZW50ZWQsCj4gPiA+IGF0dGVtcHRz
IHRvIGFjY2VzcyBzcm1jZmcgd2hlbiBWPTEgcmFpc2UgYSB2aXJ0dWFsLWluc3RydWN0aW9uIGV4
Y2VwdGlvbi4KPiA+ID4KPiA+ID4gVGhpcyBleHRlbnNpb24gY2FuIGJlIGZvdW5kIGluIHRoZSBS
SVNDLVYgSW5zdHJ1Y3Rpb24gU2V0IE1hbnVhbDoKPiA+ID4gaHR0cHM6Ly9naXRodWIuY29tL3Jp
c2N2L3Jpc2N2LWlzYS1tYW51YWwKPiA+ID4KPiA+ID4gQ2hhbmdlcyBpbiB2NToKPiA+ID4gIC0g
UmVtb3ZlIFNCSV9IQVJUX0VYVF9TU1FPU0lEIGRlcGVuZGVuY3kgU0JJX0hBUlRfUFJJVl9WRVJf
MV8xMgo+ID4gPgo+ID4gPiBDaGFuZ2VzIGluIHY0Ogo+ID4gPiAgLSBSZW1vdmUgZXh0cmFuZW91
cyBwYXJlbnRoZXNlcyBhcm91bmQgU01TVEFURUVOMF9TUk1DRkcKPiA+ID4KPiA+ID4gQ2hhbmdl
cyBpbiB2MzoKPiA+ID4gIC0gQ2hlY2sgU0JJX0hBUlRfRVhUX1NTUU9TSUQgd2hlbiBzd2FwcGlu
ZyBTUk1DRkcKPiA+ID4KPiA+ID4gQ2hhbmdlcyBpbiB2MjoKPiA+ID4gIC0gUmVtb3ZlIHRyYXAt
bi1kZXRlY3QKPiA+ID4gIC0gQ29udGV4dCBzd2l0Y2ggQ1NSX1NSTUNGRwo+ID4gPgo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBDaGVuIFBlaSA8Y3AwNjEzQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gPiAt
LS0KPiA+Cj4gPiBJdCdzIHBvc3NpYmxlIHRoYXQgUy1tb2RlIGNvbnRyb2wgb3ZlciBzcm1jZmcg
bWlnaHQgbGVhayB2ZXJ5IGxpdHRsZQo+ID4gaW5mb3JtYXRpb24gYWNyb3NzIGFyY2hpdGVjdHVy
YWwgaXNvbGF0aW9uIGJvdW5kYXJpZXMsIGJ1dCBJIGRvbid0IGtub3cKPiA+IGVub3VnaCBhYm91
dCBDQlFSSSB0byBtb3VudCBhbnkgcHJhY3RpY2FsIGF0dGFjayAoaXQgbWlnaHQgbm90IGV4aXN0
KSwKPiA+IHNvIHRoZSBjdXJyZW50IGhhbmRsaW5nIHNlZW1zIGFjY2VwdGFibGUsCj4gRm9yIG11
bHRpcGxlIGRvbWFpbnMsIHRoZSBzcm1jZmcoUW9TIElEIFBvb2wpIG11c3QgYmUgbWFuYWdlZCBn
bG9iYWxseQo+IGluIG0tbW9kZSwgb3IgZG9tYWluIEEgd291bGQgYWZmZWN0IGRvbWFpbiBCIGJ5
IHVzaW5nIGl0cyBvd24gc3JtY2ZnLgo+Cj4gQ29tcGFyZWQgdG8gc3dpdGNoaW5nIHRoZSBzcm1j
ZmcsIEkgcHJlZmVyIHRvIGVuYWJsZSBTTVNUQVRFRU4wX1NSTUNGRwo+IG9ubHkgaW4gb25lIGRv
bWFpbiAodGhlIGRlZmF1bHQgb25lKS4KTGVhdmluZyBpdCBhd2F5IGlzIG1vcmUgY29uc2lkZXJh
YmxlLgoKVGhpbmsgYWJvdXQgdGhlIENvVkUgc2NlbmFyaW86IERvbWFpbiBBIChLVk0pIHNldHMg
dXAgUW9TX0lELCB0aGVuCkRvbWFpbiBCIChUVk0pIHVzZXMgdGhlIFFvU19JRCBmcm9tIERvbWFp
biBBLiBUaHVzLCBUVk0gbGV0cyByZWd1bGFyCkxpbnV4IEtWTSBtYW5hZ2UgdGhlIFFvU19JRCAm
IENCUVJJLgoKPgo+IC0tCj4gQmVzdCBSZWdhcmRzCj4gIEd1byBSZW4KCgoKLS0gCkJlc3QgUmVn
YXJkcwogR3VvIFJlbgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29w
ZW5zYmkK
