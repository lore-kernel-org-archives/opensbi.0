Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C50CD4F24
	for <opensbi@archiver.kernel.org>; Wed, 13 May 2026 08:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UYSaIfrTd9rhMmCCP07cLQYDQ6SqUL3nWxhVMp+h260=; b=XWq51fx4a7+qDR
	o1mtLhgZb9DlQyDy77zJxDGNN9AibEDFJwMCSmfBHVNfCm+BzcdpAlmblLhYMTqBrtuS2UZYzSEJa
	hN/VIB0yBjjT500Epn2a5etg8dUK2Fzyky7YwIZARZw/2o34zv9c+YZ54tlUCvo0dvGi2jvHvj18U
	SKgvidYBtM8vmpUkDYCRjTNkrLQ0MDvjkLoZskNTGO6NbB7qZwUbf7j2ECM7K2A3lB5NKSi9UBGCu
	csduK+ki+clMCypRC/edE0L8j/TnmRl3Yo71GK3r6qezbTSHvnWJYtDgUR2ixdCKPRJx9mJRf1cu0
	rAgZwSxR7lB4m8JBJ6fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4aU-00000001gGd-2VHo;
	Wed, 13 May 2026 08:05:02 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4aS-00000001gFP-1GGg
	for opensbi@lists.infradead.org;
	Wed, 13 May 2026 08:05:01 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-6949f3eeaf6so2847529eaf.0
        for <opensbi@lists.infradead.org>; Wed, 13 May 2026 01:04:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778659499; cv=none;
        d=google.com; s=arc-20240605;
        b=KBvVb5bVMyv2gaZpco9QMmiWVY0Z9GPH18T6wGv3F6X/BlxxUpspKkw4l2rhRhKb9c
         njsb/4YQ+y3lKGwUL9nHrply2nj0n3L7rEV6VdPETvhOl6CaNA0JNrqbGW98pdh7M8jd
         qDIIstTAu+MHeiPncSWtdS84+dITNx/QMhUTY+cuP9YovBXmnoUgJDfOvp0oNff5hBYO
         4lKpKFZb/eZZVm7L5bpIM3/6vIzVlM9o9sM2RJXR9cdQ79T7HqB7OeujLc5Rc8RMPfzR
         JZQ1ldp604Cb2e+GoUMcMWZ0ikMLbfFI2SaZoaJHBwoOtcGMHbaoUnOM5x8k5alExHXK
         6FZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lUatDDSQXNUgLkTiRa0Xp3RaN6govPnQCVKQ4p8AHu0=;
        fh=p+oJhCr+Ls79/L8LKZiu2JE+WicoVcecIq1Qz4FGIUE=;
        b=eQmnsycyNsC4AJQteqUrCjwB4Zv3/dvTOPJ05hfEIqh+LDtQdVKHiKTFcugH40tpCv
         EU0v1BIH/A/UKBWBWcROF9YuilyNFo+pKmfKs3vahD+VcNaITKFwQRdSddxqDmYR6wEv
         nelXeCynwK9Uf+xSsDI+YI6SoJ0FpGgezleBX4J+Fnku06A08wwZJF+4wijZV4l3TS0a
         LSvClShp3nS0Q3iDvb/LJCs4iLsh40eir88cLrOC1GQ2r2jeJEVOiYTWU9HVvvC8QC7T
         za3OSkQ41muDkk7L1SmNd4lKoDlfRnZw5J4iAlKwCu0qfBWEApNjCyZITg1rl0mBjewX
         M8sA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778659499; x=1779264299; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUatDDSQXNUgLkTiRa0Xp3RaN6govPnQCVKQ4p8AHu0=;
        b=a4ghtaY3Tb62jR+QvTWpjRZCtIxMztdZU9z4K0fi+B7URLbspo734HLy6eipHrIRml
         NVsd5Q8qvWaicA0S89ZoC5RM9a2OgpyiTKFAxjuKBAzTycPezxrefAdqXXoS9mJQ4p4H
         9GTnaeT3Ay3nUHMUcZWwq4Hikuu+4FqhLKzybldYF6jhIVon+k7dwfz7pftwBAcZWVZ3
         feHpwFQjbhgRovRwwCo2x1P8l+oDzuHj4SEjjoDInw7iCMaI/W77yCTjirkJ0YWPQtVd
         2iPRN2PVNtKbLyDyXcNmTO2uJKj92HMiHwmnzrPC28lvguH6Az2Xc9ynsHyTyPscCtTC
         YR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778659499; x=1779264299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lUatDDSQXNUgLkTiRa0Xp3RaN6govPnQCVKQ4p8AHu0=;
        b=pXTNTVexO/erJlz2e5WzJD4vl7jqeABxvwsImHSCVQcDC0/dJQahI627CsmLWJNeRw
         oAN3N4UQLJL1Udx9KML9BQ0P5lNUYsP7amrPAFlyo8hIq5a6ZUxCshg1v++asHBr1INB
         eD+N8FqRBUMSg9e6CUeLQLxY4FLOVL8777Gr/JTr2baaKW+FpcCpvvi7JJuN/VtES3vV
         wxy1BWaEHSZsGHRdbI+qcJ9Qbk5JYuRTF+JEi6lfjMy1XcU6CNjMeRHdVslHyTr3paMJ
         6oMFveMRDuz/2CujZIWsQxiD1VLkw6cF5ydCC8r5uVUwFczJb0dexFGQA6wEUuh3S7AU
         G1rA==
X-Forwarded-Encrypted: i=1; AFNElJ8g4rr45gufXlNj18V66x6s2+R/kwOKBC1QmqrrcXo3zIBYzQnp1FTrqAaWsUaHB5+14vBTWT5F@lists.infradead.org
X-Gm-Message-State: AOJu0YyPF2+opOrxhdi5s7tYCqZ7inmAKIsM5lvDLs0fiyBToIVOHrWi
	8U3gRXWRdTYahWlvpGIV2RVVRFgYBx+VTPn2fBpzfTwbfh+yt6GK2js+BUZtE3V3d1R8Nc5NbhK
	ksKeNt+/M1G24L2TaSZ2TTc9fg/fpWxoQCZUf45LaOQ==
X-Gm-Gg: Acq92OEpNTFlkg3o7B1pHyDJSTQsC2JZ7rkLbqICyLnqvOj4cShWnMgWqrN9OYRJnVd
	d/E80/PYyK5cbk9x9jMyRRVgUzYdw8OqeUViutUvdekRrHyyugn6ZdMK1cVfBI5C4b4cp+SY7XA
	tMIcW7XFMKnUD2X+Gstv7hQuqm882qRp+dxA7ru7e7ohh9c87U2ksZzVcLeHglQsvR9UKktlHwf
	ltwYLOlLAFkC4S0mUF0AQfEN6AmnQhPtWt6W4r++sclRrwURfkC04VmMUlc1vbmm+wD07AomGUH
	EWHqru4cK9lhGAdyAKTdr4FOtLsat3pLRxuGQQaAY+j3js1GmW2yiMJSp6YYwJ6rECkaYJUnlF3
	WhDBHArQrkjjk2kacTay2ooMPTw==
X-Received: by 2002:a05:6820:a281:10b0:699:9a73:c8df with SMTP id
 006d021491bc7-69b6782b0e3mr2455695eaf.23.1778659498861; Wed, 13 May 2026
 01:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260513071418.50957-1-dave.patel@riscstar.com>
 <CAAhSdy0D6opyLUCpHKg9cOptYgdVgrXbyacMMSHoOKhV7tkSRQ@mail.gmail.com> <478b4c36-4c98-4b21-bb08-24deeed077da@riscstar.com>
In-Reply-To: <478b4c36-4c98-4b21-bb08-24deeed077da@riscstar.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 13 May 2026 13:34:48 +0530
X-Gm-Features: AVHnY4IonsIH59rC-S7n2W8t-5P9g5l86wfax6EUuqP-Ad5vu1285xuxGBbKnTI
Message-ID: <CAAhSdy0kOnD4x-OjDrrzOUhgmEW4uCxKNTTF5+z95dYpzLFXSw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add eager FP and RISC-V vector context switching support
To: Dave Patel <dave.patel@riscstar.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Anup Patel <anuppate@qti.qualcomm.com>, 
	Scott Bambrough <scott@riscstar.com>, Robin Randhawa <robin.randhawa@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Ray Mao <raymond.mao@riscstar.com>, 
	Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_010500_345003_D30FFE73 
X-CRM114-Status: GOOD (  22.30  )
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

T24gV2VkLCBNYXkgMTMsIDIwMjYgYXQgMToyOOKAr1BNIERhdmUgUGF0ZWwgPGRhdmUucGF0ZWxA
cmlzY3N0YXIuY29tPiB3cm90ZToKPgo+IE9uIDUvMTMvMjYgMDg6NDIsIEFudXAgUGF0ZWwgd3Jv
dGU6Cj4gPiBPbiBXZWQsIE1heSAxMywgMjAyNiBhdCAxMjo0NOKAr1BNIDxkYXZlLnBhdGVsQHJp
c2NzdGFyLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiBIaSBBbnVwLAo+ID4+ICAgICAgICAgVGhhbmsg
eW91IGZvciB0YWtpbmcgb3V0IHRpbWUgYW5kIHJldmlld2luZyB0aGUgcGF0Y2hlcy4KPiA+PiBG
b2xsb3dpbmcgeW91ciByZXZpZXcgY29tbWVudHMsIEkgaGF2ZSBtYWRlIGZvbGxvd2luZyBjaGFu
Z2VzLiBBbHNvIEkgaGF2ZQo+ID4+IHRlc3RlZCB0aGUgY2hhbmdlcy4KPiA+Pgo+ID4+IFRoZSBj
aGFuZ2VzIGluY2x1ZGU6Cj4gPj4gICAgICAgICAtIERyb3BwaW5nIENPTkZJR19TQklfTUFYX1ZM
RU5CIGFuZCBzYmlfdmVjdG9yX2RvbWFpbl9pbml0KCkKPiA+PiAgICAgICAgIC0gc3RydWN0IHNi
aV92ZWN0b3JfY29udGV4dCB2ZWNfY3R4IGlzIG5vdyBzdHJ1Y3QgKiBpbgo+ID4+ICAgICAgICAg
ICAnc3RydWN0IGhhcnRfY29udGV4dCcKPiA+PiAgICAgICAgIC0gY2hhbmdpbmcgUkVBRF9DU1Ig
YW5kIFdSSVRFX0NTUiB0byB2Y3NyX3JlYWQgYW5kIHZjc3Jfd3JpdGUKPiA+Cj4gPiBJIHRoaW5r
IHlvdSBtaXN1bmRlcnN0b29kIG15IHByZXZpb3VzIGNvbW1lbnQuIFdlIGFscmVhZHkKPiA+IGhh
dmUgY3NyX3JlYWQoKSBhbmQgY3NyX3dyaXRlKCkgZGVmaW5lZCBpbiByaXNjdl9hc20uaCBzbyB1
c2UKPiA+IHRoZXNlIG1hY3JvcyBpbnN0ZWFkIG9mIGludHJvZHVjaW5nICB2Y3NyX3JlYWQoKSBh
bmQgdmNzcl93cml0ZSgpLgo+ID4KPiA+Pgo+ID4+IEkgaGF2ZSBjb3ZlcmVkIGFsbCB5b3VyIGNv
bW1lbnRzLCBwbGVhc2UgY2FuIHlvdSBoYXZlIGEgbG9vayBhbmQgbGV0IG1lIGtub3cuCj4gPj4K
PiA+Cj4gPiBSZWdhcmRzLAo+ID4gQW51cAo+Cj4gSGkgQW51cCwKPiAgICAgICAgIFRoYW5rcywK
Pgo+IFRoZXJlIGlzIHN1YnRsZSBkaWZmZXJlbmNlIGJldHdlZW4gY3NyX3JlYWQvd3JpdGUgYW5k
IHZjc3JfcmVhZC93cml0ZSBpbgo+IHRoZSBjb250ZXh0IHRoYXQgdGhpcyBleHBsaWNpdGx5IGVu
YWJsZXMgYW5kIGlzb2xhdGVzIHRoZSBSSVNDLVYgVmVjdG9yCj4gKFYpIGV4dGVuc2lvbiBkdXJp
bmcgY29tcGlsYXRpb24uIFRoaXMgYWxsb3dzIHRoZSBwcm9ncmFtIHRvIHJlYWQKPiB2ZWN0b3It
c3BlY2lmaWMgQ29udHJvbCBhbmQgU3RhdHVzIFJlZ2lzdGVycyAoc3VjaCBhcyB2bGVuYiwgdmws
IG9yCj4gdnR5cGUpIHdpdGhvdXQgcmVxdWlyaW5nIHRoZSBlbnRpcmUgcHJvamVjdCB0byBiZSBj
b21waWxlZCB3aXRoIGdsb2JhbAo+IHZlY3RvciBzdXBwb3J0LgoKSSB0b3RhbGx5IGRpc2FncmVl
LiBZb3VyIHZjc3JfcmVhZCgpIGlzIGV4YWN0bHkgc2FtZSBhcyBjc3JfcmVhZCgpCmV4Y2VwdCB0
aGF0IGl0IHJlbGllcyBvbiBjb21waWxlciBuZW1vbWljcyBpbnN0ZWFkIG9mIENTUiBudW1iZXIu
Cgo+Cj4gVmVjdG9yIEFyY2hpdGVjdHVyZSBPdmVycmlkZTogVGhlIGRpcmVjdGl2ZSAub3B0aW9u
IGFyY2gsICt2IGR5bmFtaWNhbGx5Cj4gdGVsbHMgdGhlIGFzc2VtYmxlciB0aGF0IHRoZSBWZWN0
b3IgZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCBmb3IgdGhpcwo+IHNwZWNpZmljIGluc3RydWN0aW9u
IGJsb2NrLiBBIHN0YW5kYXJkIGNzcl9yZWFkIGxhY2tzIHRoaXMsIGNhdXNpbmcKPiBjb21waWxh
dGlvbiB0byBmYWlsIGlmIHZlY3RvciByZWdpc3RlcnMgYXJlIGFjY2Vzc2VkIHdpdGhvdXQgZ2xv
YmFsCj4gLW1hcmNoIHZlY3RvciBmbGFncy4KPiBDb250ZXh0IFByb3RlY3Rpb246IFRoZSAub3B0
aW9uIHB1c2ggYW5kIC5vcHRpb24gcG9wIGRpcmVjdGl2ZXMKPiBzYWZlZ3VhcmQgdGhlIGJ1aWxk
IGVudmlyb25tZW50LiBUaGV5IHNhdmUgdGhlIG9yaWdpbmFsIGNvbXBpbGVyCj4gb3B0aW9ucywg
dGVtcG9yYXJpbHkgaW5qZWN0IHRoZSB2ZWN0b3IgZXh0ZW5zaW9uLCBhbmQgaW1tZWRpYXRlbHkK
PiByZXN0b3JlIHRoZSBvcmlnaW5hbCBzZXR0aW5ncyBzbyBzdWJzZXF1ZW50IGNvZGUgaXMgdW5h
ZmZlY3RlZC4KPiBNZW1vcnkgU2VyaWFsaXphdGlvbjogVGhlIGluY2x1c2lvbiBvZiB0aGUgIm1l
bW9yeSIgY2xvYmJlciBhY3RzIGFzIGEKPiBvcHRpbWl6YXRpb24gYmFycmllci4gSXQgcHJldmVu
dHMgdGhlIGNvbXBpbGVyIGZyb20gcmVvcmRlcmluZyBtZW1vcnkKPiByZWFkcyBvciB3cml0ZXMg
YXJvdW5kIHRoZSBDU1Igb3BlcmF0aW9uLCB3aGljaCBpcyBjcml0aWNhbCBmb3IgdmVjdG9yCj4g
c3RhdGUgdXBkYXRlcy4KPgo+IFNvIHNob3VsZCBJIHVwZGF0ZSBpdCB0byBub3JtYWwgY3NyX3Jl
YWQvd3JpdGUgaW5zdGVhZD8KCk9sZGVyIHRvb2xjaGFpbnMgZG9udCB1bmRlcnN0YW5kIHZlY3Rv
ciBuZW1vbmljcyB0aGF0CmlzIHdoeSBJIGluc2lzdCBvbiB1c2luZyBjb21tb24gY3NyX3JlYWQv
d3JpdGUoKS4KClJlZ2FyZHMsCkFudXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2Jp
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9vcGVuc2JpCg==
