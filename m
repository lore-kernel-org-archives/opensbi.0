Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B703606A31C
	for <opensbi@archiver.kernel.org>; Mon, 16 Nov 2026 12:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ckbpeaAL;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=vhtZNKIa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RbmcWuzYo3sHFplFditKZtUkR9DvUfe0p/1p6uMEVR8=; b=ckbpeaALLCmQ/aIAzknulfxq/a
	1ZlMtfEp8q35FrqL4y6iQaaITeWBosETXm5AqgKbMQ83FG40R6Zgc6VhkAeqLgHDHfLmqHPgkkNtA
	xHK/TmbJA849jCPeyZ/n+7FWyPIDjncDjBNnEMyBPklLl8kK30vbwbiUEf+KSkvKF5oZX7e15xR82
	1Ob3Q3f7Mus6q5so1KR6cO1HCYJbsGvJohSA5ez//gNt8ijyjo133bLs3gQJL8fuS2n2MyF8/ypRY
	bwNLKZkgi4bf27iNnOmN/2Gfc0KriblzUJKXQd7V7G1ieRZxRzGsEDvCOlurHexD0667CET6UN3Kg
	I5lXVM/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwFw-00000002Uua-1sc4;
	Mon, 16 Nov 2026 12:56:20 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwFt-00000002UuC-3pLi
	for opensbi@lists.infradead.org;
	Mon, 16 Nov 2026 12:56:19 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-49134c8509fso3380235f8f.1
        for <opensbi@lists.infradead.org>; Mon, 16 Nov 2026 04:56:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794833776; cv=none;
        d=google.com; s=arc-20260327;
        b=IRio++iWIf2ZpcGa1Og2PDkF94XdUrRFRCvstRaZtHVGrDb1KlemDzUmiemroD/3oT
         ybgu6IaSM2YmS8PULVzhMQnKNdCfv/4rTcTmG8xo8fObKbzQ7DAIccbzucE1KxsdlG4U
         FaPgA7oH+i7sVF1Buo7LI0+KW4bZpvmXLRHO57H7I+TwboXHIOUrD4Z+03DrUcCZBtxv
         UhjmvzilDLHd6QZwMWSJZHVlGgjTTMPA8eYuHK480iVHRDomMJtyckVDUqUqPV33RP+l
         1zWF7wh3OORXTT2EGVcBbcr4GWcDIAVktomL4KeVEaXTfxvyOvCSVcthD9PEHCSRHXjd
         LBow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8C6Hpah0qg3nZPJyYk4wb9UT38RLqcW5xoKlFWCKEMM=;
        fh=KrYJhzZvIgXYjgi9IqeDq7QDVTAAX0EvLn/l70df43w=;
        b=i7l8V9yZjYBEFExUpnOVX9DfPvEPWe9rf3K4Tu2oTNQVD3sReetystqkWJfAghifGW
         vZAq3Gvogn/m0hJEQg++doPU1zi1gByhW3/yzxgFhqYRGHA0muppjQSOO42OQYEzG6xw
         awB5moDmmXlCbiK2X2c9Kgdrd96CIIRo6j8sNFzFkjoZ9TpiYhvAzS+Akic2CUgKHLNP
         qJFFEki6hEAvjFO1fC1t8mrRBRuJ5alzu3RPBCLDtEH48jObK3xcejgBGY/j5UhTG4s4
         PEeFdlru+M+o7jWWC+Vf4keiRgSxEilv8RqcoU//F/SREVTD5OlU69z2pBeJW/IUMqWj
         XxUQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794833776; x=1795438576; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8C6Hpah0qg3nZPJyYk4wb9UT38RLqcW5xoKlFWCKEMM=;
        b=vhtZNKIalK7RhfneIvqL5Q9NofziFd9moZ6c3crQ1MlcK8oa5S1dTn2592/ADBArg/
         FzkSO26vdoN4BsZz2skkWtakBr8UDjzhFitFYpmoohKz0m6FZkwaMyqbeJHROksPVd3r
         klYwiaoChxC5qrfNjthrHo+mFPrHoAFsEvLJZmynuqssWM703dqD6OvDtNA4o5yLYANE
         PkdQeZKRndYsDApxGB3zlrmIuL8ed6Mp8aC4JAxQrQYzeT57Y/CBC+OnPo8/TMShVjMf
         eYZSMB5f5LbAhgpCX1yXPLXqgxmE52PJLCpb2FEA8GzwVb7OYhI3VBd4vXUFDoCkf0Xk
         R3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794833776; x=1795438576;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8C6Hpah0qg3nZPJyYk4wb9UT38RLqcW5xoKlFWCKEMM=;
        b=E78CbB4iRo7ICPfYo+5Fj/vhXPU9NgMpbjjkUnt+x5vwwpEJrhBG2lbzm3ETl6sG6M
         Au9wt1ipDhCizfsO3F1wmnw04m3c7IWH28uym1FM0eaPaDaNPfRE9tDqpX3DW2UZNmCk
         RbjN5vFMZHuPyf43zFg/G3/Zt88gDiUS9pgQjkyIkDux6VKwknsDmjIAVMeH6NyERyF7
         aiN3hIc0/rzCi6YHz3a/7UeZO6v+geEMKk4c8L3xBlLdTeYYfWb0qgqwjc+BkD/o5hM/
         dpcb87xEAQwYMo2BcbVrhuyRh6U0cjYAXlrdj7iTSU/7Oy/P9JuIowxdIfCYteDPvNrx
         ubGg==
X-Gm-Message-State: APuU4Z8nENKVK0TV4nhgSKMu71pJtKe7vl4aveT6/QHAHm7w/yHNuyZn
	61ZL5VytYQs5lu6hDAKN7n+1VaS3nu2qDryXcPhpK4RrY2PKImdgMCyCWHobY+zae44lkx8t6rM
	P+NhX4D1RNQ69TW8VFzN1QGeG6atKQ8aelqheT1dooQ==
X-Gm-Gg: AZFdTZfS7cSP7vimwIWcFXJwZrcqCXMGcpCJOnTDCbLEuFpF0ghAEBLMeSt3tc8KsZ6
	fFzh5oa4oQyz0SjO/+Nm3cD2FQN6c2UmTzvztSGtBAsytI7eKRxEPA7zGoGDhBwQ6F0hELzvRxZ
	+ZL6qbPSmomLyum+8tFl/U2RMvBWfI4U/h84B+ukLJluk/Nt+h+GHUCo2MIxMR0uNUdHIn7GDmE
	Uj46UTCF1zeqtFUnqT7ADJ17nx2VF2wJpYH91S6tiS0OiDAOsF5Z5bB1+wN4JLpc7ssMXqpNIGM
	N8XZjLmzWyf3KbKv7utOZ5Hj3ze7rOw/RCX3Rh/8CF9qBdU3LYNAJyNOzybTyuAdrv10EwDfFBl
	XJiiwELFekUGAiS+chiF7+qvnBe3iH5VHWOV4CK0Dw5B27LIdW6hGs5QZZkg74yZo1KpXMcwbi2
	W9PPAUrIMR9aGh6kh1xTfFTXRsSXA0hZJUoMuLXi4Gp3mSjkMEpzdfWRg1BazsjQvoRU3g09HUV
	s0B
X-Received: by 2002:a05:6000:46db:b0:492:7d9c:fcf8 with SMTP id
 ffacd0b85a97d-49c73350e60mr16325024f8f.49.1794833775837; Mon, 16 Nov 2026
 04:56:15 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110000652.1298076-1-pawandeep.oza@oss.qualcomm.com>
In-Reply-To: <20261110000652.1298076-1-pawandeep.oza@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 16 Nov 2026 18:26:04 +0530
X-Gm-Features: Aa3M54oRwlVFnSEjvUuAMjbbNmVIp3hM0x1avT7-yPN4Ghc-foot2s0Fu6_eoY4
Message-ID: <CAAhSdy1OdomPUv8DrsJMK7-RpWkYFD2RJ2GXGLjF9MpYypxQ=w@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] MPXY interdomain bridge driver
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_045617_999298_C0D55BBC 
X-CRM114-Status: GOOD (  22.10  )
X-Spam-Score: -2.1 (--)
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBOb3YgMTAsIDIwMjYgYXQgNTozN+KAr0FNIFBhd2FuZGVlcCBPemEKPHBhd2FuZGVl
cC5vemFAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBPemEgUGF3YW5kZWVwIDxw
YXdhbmRlZXAub3phQG9zcy5xdWFsY29tbS5jb20+Cj4KPiBUaGlzIHNlcmllcyBpbnRyb2R1Y2Vz
IHR3byBuZXcgY2FwYWJpbGl0aWVzIHRvIE9wZW5TQkk6Cj4KPiAgIDEuIEEgZG9tYWluIHJlZ2lz
dHJhdGlvbiBub3RpZmllciBtZWNoYW5pc20KPiAgIDIuIFJQTUkgUkVRVUVTVF9GT1JXQVJEIFNl
cnZpY2UgR3JvdXAgZGVmaW5hdGlvbnMKPiAgIDMuIEFuIEZEVC1jb25maWd1cmVkIE1QWFkgYnJp
ZGdlIGRyaXZlciBmb3IgaW50ZXItZG9tYWluIG1lc3NhZ2UgcGFzc2luZwo+Cj4gLS0tIE1vdGl2
YXRpb24gLS0tCj4KPiBNb2Rlcm4gU0JJIGRlcGxveW1lbnRzIGluY3JlYXNpbmdseSByZXF1aXJl
IGNvb3BlcmF0aW9uIGJldHdlZW4gbXVsdGlwbGUKPiBkb21haW5zIHNoYXJpbmcgdGhlIHNhbWUg
cGh5c2ljYWwgaGFydCDigJQgZm9yIGV4YW1wbGUgYSB0cnVzdGVkIGJhcmUtbWV0YWwKPiBkb21h
aW4gYW5kIGFuIHVudHJ1c3RlZCBkb21haW4gcnVubmluZyBvbiBhIHNpbmdsZQo+IGNvcmUuIFdo
aWxlIE9wZW5TQkkncyBkb21haW4gY29udGV4dCBzd2l0Y2hpbmcgaW5mcmFzdHJ1Y3R1cmUgcHJv
dmlkZXMgdGhlCj4gbWVjaGFuaXNtIGZvciBoYXJ0IG11bHRpcGxleGluZyBiZXR3ZWVuIGRvbWFp
bnMsIHRoZXJlIHdhcyBubyBleGlzdGluZwo+IGZhY2lsaXR5IGZvciBkb21haW5zIHRvIGV4Y2hh
bmdlIG1lc3NhZ2VzIGFjcm9zcyBkb21haW4gYm91bmRhcmllcy4KPgo+IFRoaXMgc2VyaWVzIGFk
ZHJlc3NlcyB0aGF0IGdhcCBieSBpbXBsZW1lbnRpbmcgYSBicmlkZ2Ugb3ZlciB0aGUgTVBYWQo+
IChNZXNzYWdlIFByb3h5KSBleHRlbnNpb24gdGhhdCB1c2VzIGRvbWFpbiBjb250ZXh0IHN3aXRj
aGluZyBhcyBpdHMKPiB0cmFuc3BvcnQuCj4KPiB0aGUgc2VyaWVzIGFsc28gYWRkcyBzb3VyY2Ug
ZHJpdmVyIHdoZXJlIHZhcmlvdXMgcHJvdG9jb2xzIG92ZXIgUlBNSSBjYW4KPiBleGlzdC4gZS5n
LiBtYW5hZ2VtZW50IG1vZGUgb3IgdGVlIG1vZGUgZHJpdmVycy4KPgo+IHRoZSBEVCBiaW5kaW5n
cyBhcmUgYXMgZm9sbG93aW5nLiB3aGljaCBkZWZpbmVzIGJvdGggbXVsdGlwbGUgc291cmNlcwo+
IGFuZCBzaW5nbGUgZGVzdGluYXRpb24uCj4KPiBicmlkZ2UwOiB1bnRydXN0ZWQtdG8tdHJ1c3Rl
ZC1icmlkZ2Ugewo+ICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm9wZW5zYmkscnBtaS1t
cHh5LXJlcWZ3ZC1icmlkZ2UiOwo+ICAgICAgICAgICAgICAgICByaXNjdixkb21haW4gPSA8JnRk
b21haW4+Owo+ICAgICAgICAgICAgICAgICByaXNjdixzYmktbXB4eS1jaGFubmVsLWlkID0gPDB4
Mj47Cj4gICAgICAgICAgICAgICAgIHNvdXJjZTAgewo+ICAgICAgICAgICAgICAgICAgICAgY29t
cGF0aWJsZSA9Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIm9wZW5zYmkscnBtaS1tcHh5LXJl
cWZ3ZC1tbSI7Cj4gICAgICAgICAgICAgICAgICAgICByaXNjdixkb21haW4gPSA8JnVkb21haW4+
Owo+ICAgICAgICAgICAgICAgICAgICAgcmlzY3Ysc2JpLW1weHktY2hhbm5lbC1pZCA9IDwweDE+
Owo+ICAgICAgICAgICAgICAgICB9Owo+Cj4gICAgICAgICAgICAgICAgIHNvdXJjZTEgewo+ICAg
ICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
Im9wZW5zYmkscnBtaS1tcHh5LXJlcWZ3ZC10ZWUiOwo+ICAgICAgICAgICAgICAgICAgICAgcmlz
Y3YsZG9tYWluID0gPCZ1ZG9tYWluPjsKPiAgICAgICAgICAgICAgICAgICAgIHJpc2N2LHNiaS1t
cHh5LWNoYW5uZWwtaWQgPSA8MHgzPjsKPiAgICAgICAgICAgICAgICAgfTsKPiAgICAgICAgICAg
ICB9Owo+Cj4gLS0tIFRlc3RpbmcgLS0tCj4KPiBUaGUgc2VyaWVzIHdhcyB0ZXN0ZWQgb24gUUVN
VSBTaUZpdmUgVW5sZWFzaGVkIChzaWZpdmVfdSkgd2l0aCB0aGUKPiBhYm92ZSBkZXZpY2UgdHJl
ZSBjb25maWd1cmF0aW9uLiBUaGUgdGVzdCBzZXR1cCBjb25zaXN0cyBvZjoKPgo+ICAgLSBoYXJ0
MSBzaGFyZWQgYmV0d2VlbiB0cnVzdGVkLWRvbWFpbiBhbmQgdW50cnVzdGVkLWRvbWFpbgo+ICAg
LSB0cnVzdGVkLWRvbWFpbjogYmFyZS1tZXRhbCBhcHBsaWNhdGlvbiBsb2FkZWQgYXQgMHg4MDEw
MDAwMAo+ICAgICBib290aW5nIGluIFMtbW9kZSB2aWEgdGhlIGRvbWFpbidzIG5leHQtYWRkcgo+
ICAgLSB1bnRydXN0ZWQtZG9tYWluOiBMaW51eCBrZXJuZWwgd2l0aCBhIGtlcm5lbCB0aHJlYWQg
c2VuZGluZwo+ICAgICBwZXJpb2RpYyBNUFhZIG1lc3NhZ2VzIHZpYSBGSUQjNSAoU0VORF9NU0df
V0lUSF9SRVNQT05TRSkKPiAgICAgYW5kIEZJRCM2IChTRU5EX01TR19OT19SRVNQT05TRSkgb24g
TVBYWSBjaGFubmVsIDB4MQo+ICAgLSBBIHNlcGFyYXRlIGJhcmUtbWV0YWwgdGVsbmV0IGNvbnNv
bGUgYXBwbGljYXRpb24gcG9sbGluZwo+ICAgICBNUFhZIGNoYW5uZWwgMHgyIHVzaW5nIFJFUUZX
RF9SRVRSSUVWRV9DVVJSRU5UX01FU1NBR0UKPiAgICAgYW5kIFJFUUZXRF9DT01QTEVURV9DVVJS
RU5UX01FU1NBR0UKPgo+IFRoZSBMaW51eCBrZXJuZWwgdGhyZWFkIHNlbmRzIGEgdGVzdCBwYXls
b2FkICgiTVBYWS1IRUxMTyBzZXE9TiIpIGV2ZXJ5Cj4gMzAgc2Vjb25kcyBhbHRlcm5hdGluZyBi
ZXR3ZWVuIEZJRCM1IChleHBlY3RpbmcgYSByZXNwb25zZSkgYW5kIEZJRCM2Cj4gKGZpcmUtYW5k
LWZvcmdldCkuIFRoZSBiYXJlLW1ldGFsIGFwcGxpY2F0aW9uIHJldHJpZXZlcyB0aGUgZm9yd2Fy
ZGVkCj4gbWVzc2FnZSB2aWEgdGhlIFJFUUZXRCBzZXJ2aWNlIGdyb3VwIGFuZCBlY2hvZXMgaXQg
YmFjayBhcyB0aGUKPiBDT01QTEVURSByZXNwb25zZS4gVGhlIExpbnV4IGRyaXZlciB2ZXJpZmll
cyByZWNlaXB0IG9mIHRoZSBlY2hvZWQKPiByZXNwb25zZS4KPgo+IEJvdGggRklEIzUgYW5kIEZJ
RCM2IHBhdGhzIHdlcmUgZXhlcmNpc2VkIGFuZCB2ZXJpZmllZCBlbmQtdG8tZW5kCj4gYWNyb3Nz
IHRoZSBkb21haW4gYm91bmRhcnkgb24gYSBzaW5nbGUgc2hhcmVkIGhhcnQgd2l0aG91dCByZXF1
aXJpbmcKPiBhbnkgZGVkaWNhdGVkIGludGVyLXByb2Nlc3NvciBjb21tdW5pY2F0aW9uIGhhcmR3
YXJlLgo+Cj4gQ2hhbmdlcyBzaW5jZSB2MToKPiBkZWNvbmZpZyBzZWxlY3RzIENPTkZJR19GRFRf
TVBYWV9CUklER0UKPgo+IENoYW5nZXMgc2luY2UgdjI6Cj4gc3VwcG9ydHMgbXVsdGlwbGUgc291
cmNlIGRvbWFpbiB0b3dhcmRzIHNpbmdsZSBkZXN0aW5hdGlvbi4gKG1hbnk6b25lKQo+Cj4gQ2hh
bmdlcyBzaW5jZSB2NDoKPiBjb3NtZXRpYyBjaGFuZ2VzLCBhbmQgc29tZSBtb2R1bGFyIGNoYW5n
ZXMKPgo+IENoYW5nZXMgc2luY2UgdjU6Cj4gYWRkZWQgY29uY2VwdCBvZiBzb3VyY2UgZHJpdmVy
Cj4KPiBDaGFuZ2VzIHNpbmNlIHY2Ogo+IGNvdmVyIGxldHRlciBjaGFuZ2VzIG9ubHkKPgo+IENo
YW5nZXMgc2luY2Ugdjc6Cj4gZml4ZWQgcmV2aWV3IGNvbW1lbnRzCj4gbWFrZSB0aGUgYnJpZGdl
IGRyaXZlciBjYXJyYXkgYmFzZWQKPiB3aGVyZSBzb3VyY2UgZHJpdmVycyBhcnJheSBjYW4gYmUg
bWFpbnRhaW5lZC4KPgo+IE96YSBQYXdhbmRlZXAgKDMpOgo+ICAgc2JpX3V0aWxzOiBtYWlsYm94
OiBhZGQgUlBNSSBSRVFVRVNUX0ZPUldBUkQgc2VydmljZSBncm91cCBkZWZpbml0aW9ucwo+ICAg
c2JpX3V0aWxzOiBtcHh5OiBBZGQgRkRULWJhc2VkIE1QWFkgUlBNSSBicmlkZ2UgZHJpdmVyCj4g
ICBzYmlfdXRpbHM6IG1weHk6OiBBZGQgTVBYWSBSUE1JIGJyaWRnZSBNTSBkcml2ZXIKPgo+ICBp
bmNsdWRlL3NiaV91dGlscy9tYWlsYm94L3JwbWlfbXNncHJvdC5oICAgICAgfCAgIDIxICsKPiAg
aW5jbHVkZS9zYmlfdXRpbHMvbXB4eS9mZHRfbXB4eV9icmlkZ2UuaCAgICAgIHwgICA2MSArCj4g
IGluY2x1ZGUvc2JpX3V0aWxzL21weHkvbXB4eV9ycG1pX2JyaWRnZV9zcmMuaCB8ICAgMTEgKwo+
ICBsaWIvdXRpbHMvbXB4eS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA4ICsK
PiAgbGliL3V0aWxzL21weHkvZmR0X21weHlfcnBtaV9icmlkZ2UuYyAgICAgICAgIHwgMTAwOCAr
KysrKysrKysrKysrKysrKwo+ICBsaWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX2JyaWRnZV9t
bS5jICAgICAgfCAgMjA4ICsrKysKPiAgLi4uL21weHkvZmR0X21weHlfcnBtaV9icmlkZ2Vfc291
cmNlcy5jYXJyYXkgIHwgICAgMyArCj4gIGxpYi91dGlscy9tcHh5L29iamVjdHMubWsgICAgICAg
ICAgICAgICAgICAgICB8ICAgIDcgKwo+ICBwbGF0Zm9ybS9nZW5lcmljL2NvbmZpZ3MvZGVmY29u
ZmlnICAgICAgICAgICAgfCAgICAzICsKPiAgOSBmaWxlcyBjaGFuZ2VkLCAxMzMwIGluc2VydGlv
bnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvc2JpX3V0aWxzL21weHkvZmR0X21w
eHlfYnJpZGdlLmgKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvc2JpX3V0aWxzL21weHkv
bXB4eV9ycG1pX2JyaWRnZV9zcmMuaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3V0aWxzL21w
eHkvZmR0X21weHlfcnBtaV9icmlkZ2UuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3V0aWxz
L21weHkvZmR0X21weHlfcnBtaV9icmlkZ2VfbW0uYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbGli
L3V0aWxzL21weHkvZmR0X21weHlfcnBtaV9icmlkZ2Vfc291cmNlcy5jYXJyYXkKPgoKQWRkIHNl
cGFyYXRlIGxhc3QgcGF0Y2ggdG8gZG9jdW1lbnQgZG9tYWluIGJyaWRnZSBjb25jZXB0IGFuZCBk
ZXZpY2UKdHJlZSBiaW5kaW5ncyB3aXRoIGFuIGV4YW1wbGUgaW4gZG9jcy9kb21haW5fYnJpZGdl
Lm1kLiBBbHNvLCBsaW5rIC8gY2l0ZQpkb2NzL2RvbWFpbl9icmlkZ2UubWQgZnJvbSBkb2NzL2Rv
bWFpbl9zdXBwb3J0Lm1kCgpSZWdhcmRzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QK
b3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
