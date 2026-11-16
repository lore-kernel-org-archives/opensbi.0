Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC6C606A32F
	for <opensbi@archiver.kernel.org>; Mon, 16 Nov 2026 15:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vwj6u1JN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=fhuHaBrt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WCpP4lBqmeSJ7DzQXSn0xLWEeMlSAtj1cjPYADFfJVQ=; b=vwj6u1JN6KloeF7Ii6x2B0N+e2
	T4il5yXnNPjj0uHNUOSaW+r2DmaW0NeFUOX2dSKUm5vpF4CwS2WwRE9n4+JfU7S0t9a8z0+4mdca8
	tIVDNY7UqZ7hSrSZhGs2WqIB6HrDF+Ezv2T/krq3vxfHGmrFd5qJYxGA1HjAfYHefq/ZViw3P9yjn
	y7kOL1XrwQxYQSyWjSa29e/691utCIDNBMzSkkWL+23bFUR2e2PyiKFOLWlfJIksmCJkT+0KrODTw
	V3aOF/ataysF9V1Xk1TclYKe5wMX8aWTl8Zd2ODgRAMs4U2JtpqopZI8bszjf4CsaFlPc0BgGdoZj
	IJ9PFvmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSycr-000000033uS-1b3a;
	Mon, 16 Nov 2026 15:28:09 +0000
Received: from outgoing2021.csail.mit.edu ([128.30.2.78])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyco-000000033tK-11Mq
	for opensbi@lists.infradead.org;
	Mon, 16 Nov 2026 15:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8fx1QdN2nP82KNZ3A5zRl3jvrBGoGEx9uVom0/63Eq8=; t=1794842886; x=1795706886; 
	b=fhuHaBrtpH4D3Wu2+OXoSepyaH1fQf6zTQkeTxUuLB6VPhEscAfodZ/b0NMDCd1YvjQBjX2Sxg5
	nTwQcmcV4L4xK7f3aFoO/8HCnx+B5zCW5I50dRrJnMOcuQtDkPh2Zl3PvNiDJvqMeuQj3egAMk6+w
	AxHsgfKjXBsSnu5Q0OeR9wYiMPqhTKfannYMtY90K/nGuc2SPioqf2tVg6Lm7oxfAlxxJ/0ZCRGen
	2pfhlEeXzepEO0epVGD8ISALSKApKUc+GYsLGtkLmTh3/Odsay3fRkBsHZt7XxIAReZOVmuSM1yVr
	IOglQ3ywqq5qrXeb0FRCzRfPw2KyvrBSFcOw==;
Received: from mail-dl1-f52.google.com ([74.125.82.52])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xSycm-006rio-Qq
	for opensbi@lists.infradead.org;
	Mon, 16 Nov 2026 10:28:04 -0500
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-14394530ec6so4355775c88.1
        for <opensbi@lists.infradead.org>; Mon, 16 Nov 2026 07:28:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGXKw7h1GsAa6E1fa41Epi/Wbyi73enky56yK842ZNO53kiriXONu9UbIkWxTtpZWxG5Cri4JP1@lists.infradead.org
X-Gm-Message-State: APuU4Z/Fh8ENBWheIXdm7RXDppLIFu2vOsmYB+2bR8CUIcgg9IFWMaS1
	TMDViYmCQ5nTpJ4UsXzk2TX6jz30UhePeVHS45lKVW/7WJCH/j707waPrgK9KyJYyHKezw3KJYA
	gD9WSDZeZLO4W6SNpKsqxNU3J+3dJ3OY=
X-Received: by 2002:a05:7023:a4d:20b0:1b3:af3a:e78f with SMTP id
 a92af1059eb24-1b503124231mr10107098c88.27.1794842883843; Mon, 16 Nov 2026
 07:28:03 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261006193630.735611-1-nickolai@csail.mit.edu>
 <20261116135623.52061-1-nickolai@csail.mit.edu> <4425d551-1518-4a53-9a4b-a5c7d38d9bd0@sifive.com>
In-Reply-To: <4425d551-1518-4a53-9a4b-a5c7d38d9bd0@sifive.com>
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
Date: Mon, 16 Nov 2026 10:27:51 -0500
X-Gmail-Original-Message-ID: <CADGQE7FN0eHksfa6wrUG6YnczxS9boo3vxV15bMwv5=5DSxi7w@mail.gmail.com>
X-Gm-Features: AclHuK_OWp3ltNtHVVBdS_3zOHfkTjseQI2LfcTo7vqzGZv68yndfuz6_gPtbY0
Message-ID: <CADGQE7FN0eHksfa6wrUG6YnczxS9boo3vxV15bMwv5=5DSxi7w@mail.gmail.com>
Subject: Re: [PATCH v2] lib: sbi_ipi: Protect the IPI device list with a
 read-write lock
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_072806_466079_68288EFF 
X-CRM114-Status: GOOD (  12.29  )
X-Spam-Score: -1.9 (-)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBOb3YgMTYsIDIwMjYgYXQgMTA6MDbigK9BTSBTYW11ZWwgSG9sbGFuZAo8c2FtdWVs
LmhvbGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gVGhpcyBpcyBhIG1vcmUgZnVuZGFtZW50YWwg
aXNzdWUsIG5vdCBqdXN0IHdpdGggdGhlIElQSSBkZXZpY2UgbGlzdC4gRWZmZWN0aXZlbHkKPiBu
b25lIG9mIHRoZSBjb2xkIGJvb3QgY29kZSBpcyB3cml0dGVuIHdpdGggc3luY2hyb25pemF0aW9u
IGluIG1pbmQsIGFuZAo+IGZ1bmN0aW9ucyBsaWtlIHNiaV9oc21faGFydF93YWl0KCkgYW5kIHNi
aV9pcGlfcmF3X2NsZWFyKCkgY2FuIGNhbGwgaW50bwo+IGFyYml0cmFyeSBwbGF0Zm9ybSBjb2Rl
ICh0aGluayB0aW1lciBvciBpcnFjaGlwIGRyaXZlcnMpLCBzbyBhbnkgZHJpdmVyCj4gc3Vic3lz
dGVtIGNvdWxkIGhhdmUgYSByYWNlIGhlcmUuIEkgdGhpbmsgdGhlIG9ubHkgcm9idXN0IHNvbHV0
aW9uIGlzIHRvIG1vdmUKPiB3YWtlX2NvbGRib290X2hhcnRzKCkgdG8gdGhlIHZlcnkgZW5kIG9m
IHRoZSBjb2xkYm9vdCBwcm9jZXNzLCBzbyBzZWNvbmRhcnkKPiBoYXJ0cyBuZXZlciBzZWUgYSBw
YXJ0aWFsbHktaW5pdGlhbGl6ZWQgc3RhdGUuCgpUaGlzIHNvdW5kcyBsaWtlIGEgcmVhc29uYWJs
ZSBwbGFuIHRvIG1lLiAgVGhhdCBzYWlkLCBJIGRvbid0IHJlYWxseQpoYXZlIGEgYnJvYWQgdW5k
ZXJzdGFuZGluZyBvZiBPcGVuU0JJJ3Mgb3ZlcmFsbCBhcmNoaXRlY3R1cmUgeWV0LgoKVGhlIGVh
cmx5LXdha2Ugc3VwcG9ydCBjYW1lIGZyb20KaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LXNvZnR3
YXJlLXNyYy9vcGVuc2JpL2NvbW1pdC83ODYyYzI0NCB0bwpyZWR1Y2Ugc2Vjb25kYXJ5IEhBUlQg
c3Bpbm5pbmcsIG1vdGl2YXRlZCBieSB0cnlpbmcgdG8gaW1wcm92ZSBxZW11CmJvb3QgdGltZXMg
YW5kIHJlZHVjZSBwb3dlciBjb25zdW1wdGlvbiBvbiByZWFsIGhhcmR3YXJlLiAgTWF5YmUgYQpi
ZXR0ZXIgcGxhbiB0byBhZGRyZXNzIHRoYXQgY29uY2VybiBpcyB0byBpbXByb3ZlIHRoZSBzcGlu
IGNvZGUgaW4Kd2FpdF9mb3JfY29sZGJvb3QsIHNheSBieSB1c2luZyBwYXVzZSBvciB3cnMubnRv
PwoKTmlja29sYWkuCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3Bl
bnNiaQo=
