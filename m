Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6D8D0EE18
	for <opensbi@archiver.kernel.org>; Tue, 25 Nov 2025 20:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TzvpSLiyD8SJX+Yk+Ul4hNrMAnRMRuZdM1q6z7PIMxo=; b=bXK/ocoMbVh+vBd3hMxiPmz3i7
	AgRtojlYJp+Kt2OW6jpaShv28obvkXgcVT7AYZta9HKfnHo3rEu2C3GKgPSmNHNq2+CBhVHUNpoeg
	Ce5lo+71PiIZv9zEy5srPyHb2S1Toeuq73j245ulmFHwNqPwKbJVEBl9y5B6xXmGLCZEec5EKTIc5
	Kb+deQAuVOFiDCB1mDlZUV//mIbp++kAHagrehDFafp5U/0uZ+fMvUEFeshRyGT9zVh7QwW3xs2jw
	v0R6fsqydgROHq+8GHbUKJjH0CS1mUPq44IZU+ru77nUNi/Pi6OjRt8JWYxVLArBOsoB2Bk5WvcUD
	fzCf0hgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNzHO-0000000DsJb-0vDO;
	Tue, 25 Nov 2025 20:04:50 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNzHL-0000000DsIQ-3PnX
	for opensbi@lists.infradead.org;
	Tue, 25 Nov 2025 20:04:49 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7b80fed1505so6762491b3a.3
        for <opensbi@lists.infradead.org>; Tue, 25 Nov 2025 12:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764101087; x=1764705887; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WOUU6FTUdZNnTPUIYLQ8T3l4FsuwNBWPTTchXKP65Zg=;
        b=MKxqcgHTx0MxIF3DnOrJVxQVve5xCGEmKX8E9CIH8KeAS/BiVhwaopDXyF4FcbGOIq
         OJdcEZ6La0eEte7rW0/Kib/NnromHb2B2HMhAK9NHIo1Gkd3+lWrXFtzSfkMJGH4Z9e9
         R3RIv7cLBvs5wx3OFUr8KSyg3lfJ/hCfviklbwmo+zQloRXM6Uh2dHuujDNdaYXhHJtX
         frtWpQ5gpyM0CJfoKqaFem5UMLzddceJVJeRNu7bQD6YWTlEyiprcSBZ2O/8w5VK4AfV
         F9SrD5HCPuLjeyvwvA3rHoSHjt6IbXcHJAcG64/X9BaipWwL7Nigf9uuvJ+pe5GSpiOL
         Hb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764101087; x=1764705887;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WOUU6FTUdZNnTPUIYLQ8T3l4FsuwNBWPTTchXKP65Zg=;
        b=T89xYaVVM2jpOTCxmtfoUmVBqERWGpv6dvjkwqEzZT4KYbQpDveKIV2F8U2k7a/fpw
         KiWoypZsMzSqDqOHXV1of3y4JK4brJt5zteYeHe5eofGieDlRiPy0masH+cc+ojXgEZY
         u4uSKHonnu8fuNgmhxw+cGeXyG2mrUFCUEqcF9v822GynnomZjj1QZaBk76A+haJiCzy
         vMz1eGz6mh89pIpC/GuYQHbHBja0T1EoOYoYMmk7bJIdZXbuzc8TEFcIZrxTv1flljuV
         byed0dp78zbpGHmRifARSI2V+lTJy1Q23Dc73prascIThZ2IkNJn7XkHuRv5mq2J8rdF
         KDsw==
X-Gm-Message-State: AOJu0Yzid/dbs6kTliwgFrFve/K7bBCiSWic86Jsy77WRJ33GEL1jqwC
	+4cGwmL6jjKB5+4jMfQQMNAkLeoJdj/zqa3ZxDBPITu7GvygfL/nhOVvHeOclR00ad4qLKMcR6t
	UCwnK
X-Gm-Gg: ASbGncsZpmdTBWz1cA29Os23a0ixHftGib4ZDdmho1RVv8Ntm2oYPsfkmdGBAAJIzOW
	E5xbKq0oEDoyY8cQqgywWuKlq7AnYXzWqUF2oeMgHklaeGy1VfEIvymdQbSZ6gOLR4FH8mS8RyB
	xwjp4DTzTRmpzR8M+L9ilYN+5TgUi3AP4OZHTxgrTSHlpGTIOBgSjCR9TnMbHh14KD3n500BVAm
	27E8gY/f8T0ZUDzi2gWFATMgL4rAzgduSlEhQEBIZU6WXMiGzLruY7m+RbwjwupD2s8SKf9hALF
	eVfSNYfsydrZrsFjtsdHiZvOoDhvftVF8wk9rgE7xLPOq62xxWKkhvboe7wvj3eKqdxHvnykm1U
	RALTWvsZtIvGC++y0owE+/zb7+Qmi+PSLclR0E6uxrGAOh3jfY5zlQy5H8pWH9I7LyZoz3aWXuA
	2lJc9gvIMWurQOYWxteet4
X-Google-Smtp-Source: AGHT+IH+j3p2kaRfzsoXj2sByRmP5EQRo3zYIWtOwQ0p2CHpIQYr+6KFomBqzLMsBgdo4VcBfw2Rpw==
X-Received: by 2002:a05:6a20:5483:b0:348:9a99:6253 with SMTP id adf61e73a8af0-3614edff7d1mr17373285637.57.1764101086905;
        Tue, 25 Nov 2025 12:04:46 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd760fafe6dsm16727468a12.34.2025.11.25.12.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 12:04:46 -0800 (PST)
Date: Tue, 25 Nov 2025 12:04:44 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: opensbi@lists.infradead.org,
	opensbi <opensbi-bounces@lists.infradead.org>
Subject: Re: [PATCH] lib: sbi: expected trap must always clear MPRV
Message-ID: <aSYL3FUKAKfyDgqY@debug.ba.rivosinc.com>
References: <20251124220339.3695940-1-debug@rivosinc.com>
 <DEHQBF6B4C9L.125VJJV9WIVFK@ventanamicro.com>
 <aSXvYP2OvUzePP8F@debug.ba.rivosinc.com>
 <DEI035QOBYW1.3MQ044IEZOUH9@ventanamicro.com>
 <aSYAyc347ybLinMS@debug.ba.rivosinc.com>
 <DEI1ATBUEOYS.25ZYOU3OFGQLE@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DEI1ATBUEOYS.25ZYOU3OFGQLE@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_120447_862275_688F5616 
X-CRM114-Status: GOOD (  18.13  )
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

T24gVHVlLCBOb3YgMjUsIDIwMjUgYXQgMDg6NDg6MzVQTSArMDEwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+MjAyNS0xMS0yNVQxMToxNzoyOS0wODowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0By
aXZvc2luYy5jb20+Ogo+PiBPbiBUdWUsIE5vdiAyNSwgMjAyNSBhdCAwNzo1MTozNFBNICswMTAw
LCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+PjIwMjUtMTEtMjVUMTA6MDM6MTItMDg6MDAsIERl
ZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPjoKPj4+PiBPbiBUdWUsIE5vdiAyNSwgMjAy
NSBhdCAxMjoxMjoxMVBNICswMTAwLCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+Pj4+MjAyNS0x
MS0yNFQxNDowMzozOS0wODowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+Ogo+
Pj4+Pj4gRXhwZWN0ZWQgdHJhcCBtdXN0IGFsd2F5cyBjbGVhciBNUFJWLiBDdXJyZW50bHkgaXQg
ZG9lc24ndC4gVGhlcmUgaXMgYQo+Pj4+Pj4gc2VjdXJpdHkgaXNzdWUgaGVyZSB3aGVyZSBpZiBm
aXJtd2FyZSB3YXMgZG9pbmcgbGQvc3Qgd2l0aCBNUFJWPTEgYW5kCj4+Pj4+PiBzaW5jZSB0aGVy
ZSB3b3VsZCBiZSBhIGV4cGVjdGVkIHRyYXAsIG9wZW5zYmkgd2lsbCBjb250aW51ZSB0byBydW4g
YXMKPj4+Pj4+IE1QUlY9MS4gU2VjdXJpdHkgaW1wYWN0IGlzIERvUyB3aGVyZSBvcGVuc2JpIHdp
bGwganVzdCBrZWVwIHRyYXBwaW5nLgo+Pj4+Pgo+Pj4+PkRvZXMgdGhlIERvUyBoYXBwZW4gb24g
c29tZSBpbXBsZW1lbnRhdGlvbj8KPj4+Pgo+Pj4+IEkgcmFuIGludG8gaXQgd2hpbGUgZG9pbmcg
c29tZXRoaW5nIGVsc2UuIFNvIGl0IHdhcyByZXN1bHQgb2YgYmFzaWNhbGx5Cj4+Pj4gZXllYmFs
bGluZy4gRGlkbid0IG9ic2VydmUgb24gcmVhbCBzeXN0ZW0uCj4+Pj4KPj4+Pj4KPj4+Pj5UaGUg
ZXhwZWN0ZWQgdHJhcCBjYW1lIGZyb20gTS1tb2RlLCB0aGVyZWZvcmUgd2lsbCBoYXZlIG1zdGF0
dXMuTVBQPTMsCj4+Pj4+c28gTVBSVj0xIHNob3VsZCBiZWhhdmUgdGhlIHNhbWUgYXMgTVBSVj0w
Lgo+Pj4+Cj4+Pj4gWWVhaCBJIG1pc3NlZCB0aGF0IHBhcnQuIFlvdSBoYXZlIGEgcG9pbnQgaGVy
ZS4KPj4+Pgo+Pj4+IEhvd2V2ZXIgaWYgd2UgcmVhZCBwcml2IHNwZWMKPj4+PiAiMjEuNC4xLiBN
YWNoaW5lIFN0YXR1cyAobXN0YXR1cyBhbmQgbXN0YXR1c2gpIFJlZ2lzdGVycyIKPj4+Pgo+Pj4+
IC4uLgo+Pj4+IFRoZSBNUFYgYml0IChNYWNoaW5lIFByZXZpb3VzIFZpcnR1YWxpemF0aW9uIE1v
ZGUpIGlzIHdyaXR0ZW4gYnkgdGhlCj4+Pj4gaW1wbGVtZW50YXRpb24gd2hlbmV2ZXIgYSB0cmFw
IGlzIHRha2VuIGludG8gTS1tb2RlLiBKdXN0IGFzIHRoZSBNUFAKPj4+PiBmaWVsZCBpcyBzZXQg
dG8gdGhlIChub21pbmFsKSBwcml2aWxlZ2UgbW9kZSBhdCB0aGUgdGltZSBvZiB0aGUgdHJhcCwK
Pj4+PiAuLi4KPj4+Pgo+Pj4+IEFib3ZlIHRleHQgc2VlbXMgdG8gc3VnZ2VzdCB0aGF0IG5vbWlu
YWwgcHJpdmlsZWdlIGF0IHRpbWUgb2YgdHJhcCBpcwo+Pj4+IHNldCBpbiBNUFAuCj4+Pj4KPj4+
PiBBbmQgdGhlbiBqdXN0IGEgZmV3IHBhcmFncmFwaCBiZWxvdyBpZiB3ZSByZWFkLAo+Pj4+Cj4+
Pj4gLi4uCj4+Pj4gV2hlbiBNUFJWPTEsIGV4cGxpY2l0IG1lbW9yeSBhY2Nlc3NlcyBhcmUgdHJh
bnNsYXRlZCBhbmQgcHJvdGVjdGVkLAo+Pj4+IGFuZCBlbmRpYW5uZXNzIGlzIGFwcGxpZWQsIGFz
IHRob3VnaCB0aGUgY3VycmVudCB2aXJ0dWFsaXphdGlvbiBtb2RlCj4+Pj4gd2VyZSBzZXQgdG8g
TVBWIGFuZCB0aGUgY3VycmVudCBub21pbmFsIHByaXZpbGVnZSBtb2RlIHdlcmUgc2V0IHRvIE1Q
UAo+Pj4+IC4uLgo+Pj4KPj4+SSB0aGluayB0aGF0IE1QUlYgZG9lc24ndCBjaGFuZ2UgdGhlIG5v
bWluYWwgcHJpdmlsZWdlIG1vZGUuCj4+Pk1QUlYganVzdCBtb2RpZmllcyBleHBsaWNpdCBtZW1v
cnkgYWNjZXNzZXMgdG8gYmVoYXZlICJhcyB0aHJvdWdoIiB0aGUKPj4+bm9taW5hbCBwcml2aWxl
Z2UgbW9kZSB3YXMgTVBQLgo+Pj4KPj4+ZS5nLiBsb2FkIGluc3RydWN0aW9uIGZldGNoZWQgd2l0
aCBNLW1vZGUgaW1wbGljaXQgYWNjZXNzIChub21pbmFsCj4+PnByaXZpbGVnZSkgcGVyZm9ybXMg
bm9uLU0tbW9kZSBleHBsaWNpdCBsb2FkIChlZmZlY3RpdmUgcHJpdmlsZWdlKS4KPj4+Cj4+PihU
aGUgYXJjaGl0ZWN0dXJlIHdvdWxkIGJlIGJyb2tlbiBvdGhlcndpc2UuKQo+Pgo+PiBZZWFoIEkg
dW5kZXJzdGFuZCB0aGF0J3MgdGhlIGRlc2lyZWQgYmVoYXZpb3IuCj4+IEFsdGhvdWdoIGN1cnJl
bnQgcGF0Y2ggaXMgYWRkaXRpb25hbCBzYWZldHkgYW5kIHRoYXQgdG9vIGluIG5vdCB2ZXJ5IHBl
cmYKPj4gY3JpdGljYWwgcGF0aC4KPj4KPj4gRG8geW91IHNlZSBhbnkgaXNzdWUgd2l0aCBhZGRp
dGlvbmFsIHNhZmV0eSBwYXJ0IGluIHRoZSBwYXRjaD8KPgo+QWxsIGNvZGUgaXMgYW4gaXNzdWUs
IGFuZCBJIGRvbid0IHNlZSBhIHJlYWwgYmVuZWZpdCB0byBiYWxhbmNlIGl0IG91dCwKPmJ1dCBJ
IHRoaW5rIGl0J3MgYWNjZXB0YWJsZSBpZiBvcGVuc2JpIG1haW50YWluZXJzIGxpa2UgdGhlIGlk
ZWEuCgpJJ2xsIHdhaXQgZm9yIEF0aXNoIGFuZCBBbnVwIHRoZW4uCgo+Cj4+IEkgY2FuIG1vZGlm
eSB0aGUgY29tbWl0IG1lc3NhZ2UgdG8gcmVtb3ZlIHNlY3VyaXR5IGltcGFjdCAodGhhdCBpdCBz
ZWVtcyBsaWtlCj4+IGhvdyBpbXBsZW1lbnRhdGlvbnMgYXJlIGltcGxlbWVudGluZyBpdCkgYW5k
IHJlLXNlbmQgaXQuCj4KPlRoYXQgd291bGQgaGVscC4gIFRoZSBwYXRjaCBhbHNvIHVzZXMgYSB3
cm9uZyBiaXRtYXNrIGZvciBjc3JjOgo+TVBSViBpcyBiaXQgMTcsIGJ1dCB5b3UncmUgY2xlYXJp
bmcgYml0IDUsIFNQSUUuCj4oSXNuJ3QgaXQgcG9zc2libGUgdG8gdXNlIE1TVEFUVVNfTVBSViB0
aGVyZT8pCgpJdCdzIGBsdWlgIChsb2FkIHVwcGVyIGltbWVkaWF0ZSkuIEkgY291bGQganVzdCBk
byBgbGkgYTQsIE1UU1RBVFVTX1BSVmAuCkFsdGhvdWdoIGl0cyBhIGxhcmdlciBpbW1lZGlhdGUs
IHNvIG1vc3QgbGlrZWx5IGFzc2VtYmxlciB3aWxsIHNwbGl0IGludG8KdHdvIGluc3RydWN0aW9u
cyBvciB3b3VsZCByZXBsYWNlIGl0IHdpdGggYGx1aWAuCgo+Cj5UaGFua3MuCgotLSAKb3BlbnNi
aSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
