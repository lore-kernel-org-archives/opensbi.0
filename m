Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8792C83F25
	for <opensbi@archiver.kernel.org>; Mon, 21 Jul 2025 11:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ihJfg4/a2Uz3Q+8xMU091XIf5rCIeq2XfEkXW4J+dz4=; b=b5OJF5CU4jysYf
	vtkiRIvf3HB1cfipJ3zUS1A1OMVSjnn1ELueJYMFg26iCtjatgB4FeX+IVo2sA+5NlIGeQreLThXK
	6LnTcJgZba2h5cV04oNrJzw6tV3Y3InPjDwCqxpnRFrjjw2MMgmXILzsbF3vMmIWbmX2JcnrJ0qpY
	d26PzLSuCqxw6NYlDLtGlrjUwwSgjio+3Nmb7lL3cuvcSKt/dHIdP+umB5AawDoiuAPxrgg4DYjGv
	cTnfIV7XI+cq6RZJ/1hH3aSc6bBxxCZKqn8oKOEmlFswyFHAQkeqqJtwa+sm0jE78DmEdeu2FFvzZ
	nQFz7wU+H/T/p/gw6j5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udosJ-0000000H8YK-0CrN;
	Mon, 21 Jul 2025 11:40:07 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udo9Z-0000000H0IO-1HNF
	for opensbi@lists.infradead.org;
	Mon, 21 Jul 2025 10:53:54 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3ddb4a7ac19so17057615ab.3
        for <opensbi@lists.infradead.org>; Mon, 21 Jul 2025 03:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1753095232; x=1753700032; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKgDMeTUMqKkRhFIGH8pCJuFjkLYtLKALjDglz2HV7E=;
        b=MUsh2VG1CIDS1mILVv73GDLjjMjpHKUQH3v3FBvs3gegRSG/t8z9L+8si2RxqZQwW0
         ifsAaPdP7sAj2+Z5H45J2VY3Ce9Qf1qSNYAwkJUm/SUoVz71dIukliPS2WZDNFyIQUy3
         zkIPUPTN3LE5neKO8o/Z0uMVLm87P/Lv5r1xDyx1rUii3yrtGwxb6Jz4nFmHt4sxnrZQ
         jCJ/qEyISrycyYX0YqIVBnaCqshBgiR0tdTNAEoOXTi7D8HcNWwkcl+Wl0SN/RaSyLhM
         7JrCbP9JUL5ZE+0hC4pWFqacXSrGNrTk4+vghNqQqIeXK8wlNi+YgjkumfZzIU6V2Hf1
         HAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753095232; x=1753700032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EKgDMeTUMqKkRhFIGH8pCJuFjkLYtLKALjDglz2HV7E=;
        b=jDB51P3ROH6MiXOkrxFHnGFwPUjtUOFCCIM9/83/pt+4m0skpPlJ9jIxc6+WJJfUZQ
         FHzsEvXLEaMgGq0uorUSsP+gppPS6t7nw7zoanetcJFsFbk447im4bDIQ3FNbem+tkZd
         jtbo65Ku5owsjJOCbhh1soSPxrb6eKyFgC317ZlHYuRnJ80ayhh9Y+Cx18MqacyEakCO
         yBk1Fv7QQXGIopQOfSQnR5p9MlOE4J+zjEvnOonYombP2kqMowCRPtY8ClsjSQqdjP3g
         KZ3sPnd/JimhLIVZRwuX8pfYeOUaz4SRyJwBs1bUbJdOP+JcGclr3qUuL5We6voFjggx
         RK6w==
X-Forwarded-Encrypted: i=1; AJvYcCXZf0TSt4TYPoCLuatI22L1yY4YdL9zmHgT0NgNOX1oUib7jGByeW3+XxkmpS54ImwUKTwGpll3@lists.infradead.org
X-Gm-Message-State: AOJu0YxywkHST6pbqwjf18Ve/5tkcU8xFX3EXrmq7IIBN72wg8Pmy9g+
	tCn38a93Irft6PNCsd2ZUVawSBopZmjwO0T3GIsplCS49qu+scSh8GG3ZF+7AXuIQ0+memuPTjR
	T1KgVBHWTNm/CQKMO1EhRrKDnMNbpLEgi70Yu0X6hng==
X-Gm-Gg: ASbGncv/nj7+7keWJyPkf7DyE0Zr9i5HsclGg9hHja7WXShrNFAUwnf0IO2kzOu7ua5
	2i0Tu9o4+MdsQHO20Eo6/z2XYEjRZAqk8YfkW9bttodgHigw7hcUmX5al6CGUzD25E+puLd59Iw
	RStJqDfYAbFjB8lkW+bttRtmjFu09XbSjKGodgvOyB4dv5HpZImZ4sOIpPa6wUjTQv0Qqv7QfCI
	pwBilmhBj5WBnudSqBp80SKO1nk2qWjGqbeBtPp
X-Google-Smtp-Source: AGHT+IFyCCx1rAYRSVeCcfUdRLUQoUEoWOcPoXp1xtbc1y8po1K6w8Q0ZSpTvKWJQ8fGLBq8kruuIS9rM03Rjaybsdk=
X-Received: by 2002:a05:6e02:2586:b0:3e2:9a93:46ec with SMTP id
 e9e14a558f8ab-3e29aa29707mr136654595ab.8.1753095231688; Mon, 21 Jul 2025
 03:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250513-fix_scounteren-v1-1-01018e0c0b0a@rivosinc.com>
 <B1E3B737-3E3D-4FCD-ADA1-136F69433F39@jrtc27.com> <1069d437-7689-4ca6-9455-13c224ee773d@linux.dev>
In-Reply-To: <1069d437-7689-4ca6-9455-13c224ee773d@linux.dev>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 21 Jul 2025 16:23:40 +0530
X-Gm-Features: Ac12FXw6bGkKOaLWSLrJcN_d8mk9Z0iV3WZpdzYanlzbVeKO7sxwuS2rhNYNCAU
Message-ID: <CAAhSdy1GBkK7u_tjK9C6R+zVUKxh=xBa5-pCi1dTcgAXn9ZkSQ@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: Only enable TM bit in scounteren
To: Atish Patra <atish.patra@linux.dev>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_035353_581766_FDF128DB 
X-CRM114-Status: GOOD (  28.23  )
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

T24gV2VkLCBNYXkgMTQsIDIwMjUgYXQgMTowNOKAr1BNIEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRy
YUBsaW51eC5kZXY+IHdyb3RlOgo+Cj4gT24gNS8xMy8yNSA1OjM1IFBNLCBKZXNzaWNhIENsYXJr
ZSB3cm90ZToKPiA+IE9uIDE0IE1heSAyMDI1LCBhdCAwMToyNSwgQXRpc2ggUGF0cmEgPGF0aXNo
cEByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4KPiA+PiBUaGUgUy1tb2RlIHNob3VsZCBkaXNhYmxl
IEN5Y2xlIGFuZCBpbnN0cnVjdGlvbiBjb3VudGVyIGZvciB1c2VyIHNwYWNlCj4gPj4gdG8gYXZv
aWQgc2lkZSBjaGFubmVsIGF0dGFja3MuIFRoZSBMaW51eCBrZXJuZWwgYWxyZWFkeSBkb2VzIHRo
aXMgc28gdGhhdAo+ID4+IGFueSByYW5kb20gdXNlciBzcGFjZSBjb2RlIHNob3VsZG4ndCBiZSBh
YmxlIHRvIG1vbml0b3IgY3ljbGUvaW5zdHJ1Y3Rpb24KPiA+PiB3aXRob3V0IGhpZ2hlciBwcml2
aWxlZ2UgbW9kZSBpbnZvbHZlbWVudC4KPiA+Pgo+ID4+IFJlbW92ZSB0aGUgQ1kvSVIgYml0cyBp
biBzY291bnRlcm4gaW4gT3BlblNCSS4KPiA+Cj4gPiBJc27igJl0IHRoaXMgYSBicmVha2luZyBj
aGFuZ2U/IFMtbW9kZSBPU2VzIHRoYXQgYXJlIGhhcHB5IHRvIGFsbG93Cj4gPiBVLW1vZGUgdG8g
cmVhZCB0aGUgY291bnRlcnMgYXJlIG5vdyBicm9rZW4sIHN1Y2ggYXMgRnJlZUJTRC4gQkJMIGFs
d2F5cwo+ID4gc2V0IHNjb3VudGVyZW4gdG8gYWxsIG9uZXMgKHdpdGggYml0cyBhYm92ZSAyIGJl
aW5nIHBvaW50bGVzcyB3aXRob3V0Cj4gPiBwcm9ncmFtbWluZyBtaHBtZXZlbnRYKSwgYW5kIE9w
ZW5TQkkgZGlkIHRoYXQgdW50aWwgaXQgc3dpdGNoZWQgdG8gdGhpcwo+ID4gYmVoYXZpb3VyIG9m
IENZfFRNfElSLiBTbyB3aGV0aGVyIG9yIG5vdCBpdCB3YXMgZXhwbGljaXQgaW4gdGhlCj4gPiBz
cGVjaWZpY2F0aW9uIHdoYXQgdGhlc2Ugd2VyZSBpbml0aWFsaXNlZCB0bywgUy1tb2RlIE9TZXMg
ZXhpc3QgdGhhdAo+ID4gYXNzdW1lZCBDWSwgVE0gYW5kIElSIGF0IGxlYXN0IHdlcmUgYXZhaWxh
YmxlLiBQbGVhc2UgZG8gbm90IGJyZWFrCj4gPiB0aGluZ3M7IHRyZWF0IHRoZSBmaXJtd2FyZTwt
PlMtbW9kZSBpbnRlcmZhY2UgaW4gdGhlIHNhbWUgd2F5IGFzCj4gPiBrZXJuZWw8LT51c2Vyc3Bh
Y2UsIGkuZS4gZG9u4oCZdCBicmVhayB1c2Vyc3BhY2UvUy1tb2RlLgo+ID4KPgo+IEFsbG93aW5n
IENZIGFuZCBJUiBkaXJlY3QgYWNjZXNzIGlzIGEgYmlnIHNlY3VyaXR5IGNvbmNlcm4gd2hpY2gg
d2FzCj4gZGlzY3Vzc2VkIGluIG11bHRpcGxlIHRocmVhZHNbMV0gYWxtb3N0IHR3byB5ZWFyIGJh
Y2suIFRoaXMgcmVzdWx0ZWQgaW4KPiBwYXRjaGVzIGluIExpbnV4IHRoYXQgcmVzdHJpY3RzIHRo
YXQgYmVoYXZpb3IuIEkgYXNzdW1lZCB0aGF0IG90aGVyIE9TCj4gbWlnaHQgaGF2ZSBhZG9wdGVk
IGEgc2ltaWxhciBiZWhhdmlvciBieSBub3cuIEhlbmNlIHRoZSBwYXRjaC4KPgo+IFsxXQo+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L0NBT25KQ1VLQ3duT1hHV0tpd1FReFo5
MnQ0MTM4SkFPcXpra3F0d0FwSFJ5Nll1UzBLd0BtYWlsLmdtYWlsLmNvbS8KPiA+IE9TZXMgdGhh
dCB3YW50IHRvIG9wdCBvdXQgY2FuLiBBbmQgaWYgeW91IHJlYWxseSB3YW50IHRvIHB1c2ggZm9y
IHRoaXMsCj4gPiB5b3UgbmVlZCB0byB3YWl0IGZvciBPU2VzIHRvIGJlIGNoYW5nZWQgdG8gZXhw
bGljaXRseSBpbml0aWFsaXNlCj4gPiBzY291bnRlcmVuIGFuZCBvbmx5IGRvIGl0IG9uY2Ugb2xk
IHZlcnNpb25zIGFyZSBzdWZmaWNpZW50bHkgcmFyZS4gQnV0Cj4gPiB5b3UgY2Fu4oCZdCBqdXN0
IGdvIGRvaW5nIHRoaXMgd2l0aCBubyB3YXJuaW5nIC8gZGVwcmVjYXRpb24gcGVyaW9kLgo+ID4K
Pgo+IEl0IHNlZW1zIEZyZWVCU0QgY29udGludWUgdG8gaGF2ZSB0aGUgbGVnYWN5IGJlaGF2aW9y
LiBJdCB3b3VsZCBiZSBncmVhdAo+IGlmIHlvdSBjYW4gZml4IHRoZSBmcmVlQlNEIGNvZGUgc29v
bmVyIHRoYW4gbGF0ZXIuIFBsZWFzZSBsZXQgdXMga25vdwo+IG9uY2UgdGhhdCBpcyBkb25lLgo+
Cj4gSSBhbSBhYnNvbHV0ZWx5IGZpbmUgd2FpdGluZyBmb3Igc29tZSBtb3JlIHRpbWUgdW50aWwg
dGhlIHRoZSBjb21tb25seQo+IHVzZWQgUy1tb2RlIE9TIGJlaGF2ZSBhcyBleHBlY3RlZC4gSG93
ZXZlciwgd2UgY2FuIG5vdCB3YWl0IGZvcmV2ZXIgYXMKPiB3ZWxsLiBTbyB3ZSBoYXZlIHRvIHNl
dCBhIGZsYWcgZGF5IGluIHRoZSBmdXR1cmUgYXZvaWQgY2FycnlpbmcgdGhpcwo+IGZvcmV2ZXIu
Cj4KPiBIb3cgYWJvdXQgT3BlblNCSSB2MS43KH4yLTMgbW9udGhzKSBvciBPcGVuU0JJIHYxLjgg
KHBsYW5uZWQgdG93YXJkcyBlbmQKPiBvZiAyMDI1KSBmb3IgdGhpcyBmaXggdG8gYmUgbWVyZ2Vk
ID8KCktWTSBSSVNDLVYgaXMgYWxyZWFkeSB1cGRhdGVkIHRvIG5vdCBpbml0aWFsaXplIHNjb3Vu
dGVyZW4KZm9yIEd1ZXN0L1ZNIHNvIGFsb25nIHRoZXNlIGxpbmVzIGxldHMgZ28gYWhlYWQgd2l0
aCB0aGlzIHBhdGNoLgoKSSBoYXZlIGFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3Bl
bnNiaSBhbmQgdGhpcyB3aWxsIGJlCnBhcnQgb2YgT3BlblNCSSB2MS44IHJlbGVhc2UgaW4gRGVj
IDIwMjUuCgpUaGFua3MsCkFudXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9vcGVuc2JpCg==
