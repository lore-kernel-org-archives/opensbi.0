Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124BBCE8D6B
	for <opensbi@archiver.kernel.org>; Sat, 15 Nov 2025 03:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=75WBix7rxfF1yFYj3YPTvg4jejyYrU/fgA/AKPVZY4A=; b=xCknFQDbuC79Ni
	5vFPUh+xOv2Xzp5k2/VDpZLjC169Yr/tp5hUoco8KOGV7EcDo32iaq94QTmE4zMp9/YbHYTYGgh16
	IayT1nLlfXE6TOhr4oeMKNkFJwBGNcnmpxCP1OuZf32V4go9faqtia3GMugEipyLB0fPXQrCJ3t+0
	h80EktPrQq5aajvWal/s0BvOs9oxAwpZAS8vxIgWEYD5ZBloPoOf8bvuMxAitBdQnNK9yMVS4zh1m
	m/8DI6lwtuMkW8WmvWX+V3F623JaxjKWQ94G6j42oxM29IEhR/Z1c5mcWyXoQWUSvc+Gpvtb67PEg
	kt1OnJwGh8Y6ruAxy8pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK6bk-0000000DOZh-06Lm;
	Sat, 15 Nov 2025 03:05:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK6bh-0000000DOZ5-0IX0
	for opensbi@lists.infradead.org;
	Sat, 15 Nov 2025 03:05:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B7AD543F36
	for <opensbi@lists.infradead.org>; Sat, 15 Nov 2025 03:05:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95474C16AAE
	for <opensbi@lists.infradead.org>; Sat, 15 Nov 2025 03:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763175943;
	bh=3Of2RPsN3CyuVPIIffXoiToe/2A7rC/x3D1oCfaYVDc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kqNa+b/kE5N4poRNYul4j3kPrmEA4RtVwfdALizAvWLH+42sJAUKiiYPOzL9fJ61f
	 5n8wFnvLLNeMnEDTGICpCm84PuDKY7b32rPLwEKEpiNsSNbnkHsjQvQU4J6kG5ZQUJ
	 47wk8WhW/ytEsbBil3q3rPB5SYoc1wgoDYcRFrg14cqlB9lggrFZNFSnmSi3Qr+52M
	 bNnbSnBbSwKlzvZjo8cy4IOKQW8UQfZvg6bHv23op940EHWyd6p/P/nQNDL6UgO6UJ
	 AWeA0l3Ni9V7WPazvXO7oc3OBGJoZ5NWWEx59b5YDtwNb+QrGYQsuiUHJgbbjU4vlV
	 YpbVIpeohJdGw==
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b3108f41fso1462489f8f.3
        for <opensbi@lists.infradead.org>; Fri, 14 Nov 2025 19:05:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWcjbPFO4L/ap5K6DqsHxEaGTzXvxKgnW8NRkMbdAzaANtMTgUMMxT64tV8WxlHqfiLRYaV4q9B@lists.infradead.org
X-Gm-Message-State: AOJu0YxHadDusLScuJ/RT3VyLuriuVucbDhZdTCkkGIyA4jlWFFCU3yq
	IGdXTV3SrdZdes8/KaneaPBUNmLXaDcfG33bz2nEdrICHO3FTXipN3j8Ql459JT5TuRHAgErnEO
	UNZ2cjNASyQNtwU+Ju5GvVLaBmwXgg7c=
X-Google-Smtp-Source: AGHT+IGGqWCHMmVQ2XoqU1p4KWc/xzdOyIjVtbufV2sHbavSM/E2RMmeUt4YHiUz2+vi925sF7vFfTskDKUWPF2rFzo=
X-Received: by 2002:a5d:5f49:0:b0:42b:36f4:cd21 with SMTP id
 ffacd0b85a97d-42b593742e7mr4578785f8f.40.1763175942116; Fri, 14 Nov 2025
 19:05:42 -0800 (PST)
MIME-Version: 1.0
References: <20251114115722.1831-1-cp0613@linux.alibaba.com> <DE8GW2BKAOKE.2XBAO1XW4C2RF@ventanamicro.com>
In-Reply-To: <DE8GW2BKAOKE.2XBAO1XW4C2RF@ventanamicro.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 15 Nov 2025 11:05:29 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQjXMfvAAJma1QmsETqU7aE+Nb8=koH_B91PW8BM_khaQ@mail.gmail.com>
X-Gm-Features: AWmQ_blAAkhRUFcBo639cH2-CoLXIxhie7QHpZExtWb0pj7eQvdKy1o2xj4I7pU
Message-ID: <CAJF2gTQjXMfvAAJma1QmsETqU7aE+Nb8=koH_B91PW8BM_khaQ@mail.gmail.com>
Subject: Re: [PATCH v5] lib: sbi: Enable Ssqosid Ext using mstateen0
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: cp0613@linux.alibaba.com, opensbi@lists.infradead.org, anup@brainfault.org, 
	opensbi <opensbi-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_190545_160734_B38B3F63 
X-CRM114-Status: GOOD (  16.09  )
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

T24gRnJpLCBOb3YgMTQsIDIwMjUgYXQgOTo1NeKAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21h
ckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IDIwMjUtMTEtMTRUMTk6NTc6MjIrMDg6MDAs
IDxjcDA2MTNAbGludXguYWxpYmFiYS5jb20+Ogo+ID4gRnJvbTogQ2hlbiBQZWkgPGNwMDYxM0Bs
aW51eC5hbGliYWJhLmNvbT4KPiA+Cj4gPiBUaGUgUW9TIElkZW50aWZpZXJzIGV4dGVuc2lvbiAo
U3Nxb3NpZCkgaW50cm9kdWNlcyB0aGUgc3JtY2ZnIHJlZ2lzdGVyLAo+ID4gd2hpY2ggY29uZmln
dXJlcyBhIGhhcnQgd2l0aCB0d28gaWRlbnRpZmllcnM6IGEgUmVzb3VyY2UgQ29udHJvbCBJRAo+
ID4gKFJDSUQpIGFuZCBhIE1vbml0b3JpbmcgQ291bnRlciBJRCAoTUNJRCkuIFRoZXNlIGlkZW50
aWZpZXJzIGFjY29tcGFueQo+ID4gZWFjaCByZXF1ZXN0IGlzc3VlZCBieSB0aGUgaGFydCB0byBz
aGFyZWQgcmVzb3VyY2UgY29udHJvbGxlcnMuCj4gPgo+ID4gSWYgZXh0ZW5zaW9uIFNtc3RhdGVl
biBpcyBpbXBsZW1lbnRlZCB0b2dldGhlciB3aXRoIFNzcW9zaWQsIHRoZW4KPiA+IFNzcW9zaWQg
YWxzbyByZXF1aXJlcyB0aGUgU1JNQ0ZHIGJpdCBpbiBtc3RhdGVlbjAgdG8gYmUgaW1wbGVtZW50
ZWQuIElmCj4gPiBtc3RhdGVlbjAuU1JNQ0ZHIGlzIDAsIGF0dGVtcHRzIHRvIGFjY2VzcyBzcm1j
ZmcgaW4gcHJpdmlsZWdlIG1vZGVzIGxlc3MKPiA+IHByaXZpbGVnZWQgdGhhbiBNLW1vZGUgcmFp
c2UgYW4gaWxsZWdhbC1pbnN0cnVjdGlvbiBleGNlcHRpb24uIElmCj4gPiBtc3RhdGVlbjAuU1JN
Q0ZHIGlzIDEgb3IgaWYgZXh0ZW5zaW9uIFNtc3RhdGVlbiBpcyBub3QgaW1wbGVtZW50ZWQsCj4g
PiBhdHRlbXB0cyB0byBhY2Nlc3Mgc3JtY2ZnIHdoZW4gVj0xIHJhaXNlIGEgdmlydHVhbC1pbnN0
cnVjdGlvbiBleGNlcHRpb24uCj4gPgo+ID4gVGhpcyBleHRlbnNpb24gY2FuIGJlIGZvdW5kIGlu
IHRoZSBSSVNDLVYgSW5zdHJ1Y3Rpb24gU2V0IE1hbnVhbDoKPiA+IGh0dHBzOi8vZ2l0aHViLmNv
bS9yaXNjdi9yaXNjdi1pc2EtbWFudWFsCj4gPgo+ID4gQ2hhbmdlcyBpbiB2NToKPiA+ICAtIFJl
bW92ZSBTQklfSEFSVF9FWFRfU1NRT1NJRCBkZXBlbmRlbmN5IFNCSV9IQVJUX1BSSVZfVkVSXzFf
MTIKPiA+Cj4gPiBDaGFuZ2VzIGluIHY0Ogo+ID4gIC0gUmVtb3ZlIGV4dHJhbmVvdXMgcGFyZW50
aGVzZXMgYXJvdW5kIFNNU1RBVEVFTjBfU1JNQ0ZHCj4gPgo+ID4gQ2hhbmdlcyBpbiB2MzoKPiA+
ICAtIENoZWNrIFNCSV9IQVJUX0VYVF9TU1FPU0lEIHdoZW4gc3dhcHBpbmcgU1JNQ0ZHCj4gPgo+
ID4gQ2hhbmdlcyBpbiB2MjoKPiA+ICAtIFJlbW92ZSB0cmFwLW4tZGV0ZWN0Cj4gPiAgLSBDb250
ZXh0IHN3aXRjaCBDU1JfU1JNQ0ZHCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hlbiBQZWkgPGNw
MDYxM0BsaW51eC5hbGliYWJhLmNvbT4KPiA+IC0tLQo+Cj4gSXQncyBwb3NzaWJsZSB0aGF0IFMt
bW9kZSBjb250cm9sIG92ZXIgc3JtY2ZnIG1pZ2h0IGxlYWsgdmVyeSBsaXR0bGUKPiBpbmZvcm1h
dGlvbiBhY3Jvc3MgYXJjaGl0ZWN0dXJhbCBpc29sYXRpb24gYm91bmRhcmllcywgYnV0IEkgZG9u
J3Qga25vdwo+IGVub3VnaCBhYm91dCBDQlFSSSB0byBtb3VudCBhbnkgcHJhY3RpY2FsIGF0dGFj
ayAoaXQgbWlnaHQgbm90IGV4aXN0KSwKPiBzbyB0aGUgY3VycmVudCBoYW5kbGluZyBzZWVtcyBh
Y2NlcHRhYmxlLApGb3IgbXVsdGlwbGUgZG9tYWlucywgdGhlIHNybWNmZyhRb1MgSUQgUG9vbCkg
bXVzdCBiZSBtYW5hZ2VkIGdsb2JhbGx5CmluIG0tbW9kZSwgb3IgZG9tYWluIEEgd291bGQgYWZm
ZWN0IGRvbWFpbiBCIGJ5IHVzaW5nIGl0cyBvd24gc3JtY2ZnLgoKQ29tcGFyZWQgdG8gc3dpdGNo
aW5nIHRoZSBzcm1jZmcsIEkgcHJlZmVyIHRvIGVuYWJsZSBTTVNUQVRFRU4wX1NSTUNGRwpvbmx5
IGluIG9uZSBkb21haW4gKHRoZSBkZWZhdWx0IG9uZSkuCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8g
UmVuCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
