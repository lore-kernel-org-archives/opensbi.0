Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE91107BCC6
	for <opensbi@archiver.kernel.org>; Fri, 13 Mar 2026 16:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bLoOFt0CMz86vkyIvDfQvmvwT+gLML0L1bixBDnELKk=; b=kcfYiCor+rVVRE
	A+LH48y0nvc2/ulVCEmI2o12Hi5YMw1l+x+Th377VCZfGaVI7gZwXGSe1RwPeOEkZUJb/zDOGjURE
	wMZUOtfJ14B1qvLpuiK3Ao1QYLaYBfbRp7wHbsVNpx9V53clS+2kWentn8j/d8KCwdJcUCImWZn5p
	s9buJVwD+f0KQkNDgG/yXfBUS2R1OZIb7J7CK7hXfYnIOuCSmYNeV3aUwo7ynJEAf1/TqIRCtYSaw
	vJ55HQwZ46qdOtQPvumpPWbl95gyD/57/IYrZTJN4e2UWINDbj78hnQ0bodcM612M1GXdpgwoTZ6x
	V7PCea6ehqMNIpbTtmcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14zK-00000000bm3-1cSH;
	Fri, 13 Mar 2026 16:03:46 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14zG-00000000blf-1ovT
	for opensbi@lists.infradead.org;
	Fri, 13 Mar 2026 16:03:43 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-944168e8c5fso1176234241.2
        for <opensbi@lists.infradead.org>; Fri, 13 Mar 2026 09:03:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773417820; cv=none;
        d=google.com; s=arc-20240605;
        b=Hp0Q/M9VdrGWBGFpMcH7+um+QuT2gkfnpGvz9Hkv1V0Ipi/uH3rJRdhr0q+b3029a6
         FLQ92bcpcT5GevvKycYwvxBglsn/vAUVmzIj8LY+zlM7059GjellJ5MYVFM4Megrxb/+
         ub6U/4VwRUL32hKOW0NSHf2rRpKMqfet7rRcHqLihBzMj0pBc1/7Yuwq2WaN/ESFnx6C
         DRggqKY0BPvThxDFHdBrfVDAakVikLjWBdJWKFH/qwfeI/frHPDVvSUNKUMLfx6AjReb
         kxl+EeTPdUAWifgUQMlmuTg6EXtZlIoEsEXYJkkDrybqtdRWi0BTFWL0/61bTT3bsKd/
         AYhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=exIdNfqlf/ueAO4HWwqRCwyj0gLSmC7EU6xt1HXWJTg=;
        fh=/RaGPFvdyxhLF+9lSHkwI7z7RIC+hDa2OJZs0xNnCyI=;
        b=EcXIs4D6SAfp7f78HWLSxz/ZTU++eDGnw0CcH21UDy0+z6NhodhJzASguPL89e64EE
         Fa3gO3VRU6u9ZFW32ih0p4hHRiFKtW/N9pwZYpQ6+QPjnDS+mI67oEtCgacWZjs+mfkc
         0sTY+pu0nCY6f1vWOwGKnDNKPZ1HRXz5uqJ8Q4Rztprb1cq9NOw1q1f7rv4GBe/DNgIn
         K51bD6tO7pihDz/nKn7zg97XsZueR/R7DEjWMYXygS1Xi4UWtmK5QwJwNpNOqX6uE3qP
         C8FNYV/ASlzF5uY25C46S+OtyIkiZzYRHKvXgpEWkZyiJgBnpQpr2Obgm3hO9SM9gjM4
         +Q0w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773417820; x=1774022620; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exIdNfqlf/ueAO4HWwqRCwyj0gLSmC7EU6xt1HXWJTg=;
        b=DoBOE5dpVVySSBzK3BZxd87lQr5ibRCka54ScZxq6YM5LgEP9Kd3SMYrc3ncP3XLqL
         16GD95j8aRrZYzL2POyZnQNqP52clZRhl9BlbWvrM7MULFVI90svi/pz8+fmPx8FwJTa
         SJIBqqD9qfNP9t6gk8SZxqoEk+1XPZNQXkMr1o8Mag/nmvwURJY2C0IUjIIYrwb+T6eZ
         VeVLQSWZFhjpkSAItrXvjS5I/x/n75ijABz7LpNIWB2R872daZ8ibKu+w3G+R3lb6K00
         qagglHoxqMedXTBPW74t8rtYbCQWLrn6Im5D59+vPyeCTu+OCrFrO40DurSaVofAwbHc
         UP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773417820; x=1774022620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=exIdNfqlf/ueAO4HWwqRCwyj0gLSmC7EU6xt1HXWJTg=;
        b=O9ikFnUj3uHYp1Xyyuq8wFgOM0Yk0lVnXbHnr6RSyXSREdXf/PT71g17AfFOCf5V40
         jSttHqh9SrgFz0Zs01HsyiADuQ+rvdYpqFiT5kCFvV4jWQLMCphqPsf0Qb8AjgpmYQER
         k9Ygk+IHzhwDCca30AClCUpz05dUyRT8BcmCxletUWIiy4Omq557iouD6HCPD7tj8Qt8
         6p7Pcb1FijsRSRqXcDHnax6Ai2i8UpGSpYv59RVxYtfR1s9h6KhiojV9FRvNhHTD64Kp
         iVYVhONltgTA3+WM10SUmKoADmUDi5s69CUoxuEMzTeMY38ROKnB2d0zvjLOVt4tFObC
         K5Xg==
X-Gm-Message-State: AOJu0Yyq57u/rBi16ofbu0mShzheu5D/+TaZL4A9GyE4SOUfZeSbwc/F
	WeB2KoUu8o94Ko3xeF5G8TjWqO+a93sdrQa/XqdFu2G+KwU23OpgmSi6Pc+EVNb/4wgKqj7hRd+
	X0FUNx7yQBCTQGXfznpcA26Wb5/+Gb9+CN+44+3v3WR+cDu8/e7IzUWrabg==
X-Gm-Gg: ATEYQzz//S3c9UYM3WYu71KRME3JqPT9uq2EFwpa5wG6Mw3aINv+SgMVGD0WKtQm2oH
	Fw7WchBasFHgKY2+5rg9vPf3lCAGNtdd/kkiqX96if3cXqoITVUwMdB2E9RvWSu/qJH2SAYBscx
	hjMTH4nvvpFxUCJBjPP8bh6ooZZ29Uz2QJFf5G8J1Y9fgFbsKGNy7WGd1vm2mIGJdWv1aOKH6/P
	Su33IPKCQfPq7vEZ937pUtpQh6rcOvqBP1zwTdDcdUxq8/G4e1O4suP3bhRKCx939ajvbWL23vC
	s7+tNkOb
X-Received: by 2002:a05:6123:2e5:b0:566:963a:1648 with SMTP id
 71dfb90a1353d-56b6297aafdmr1690669e0c.16.1773417820432; Fri, 13 Mar 2026
 09:03:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260313133941.3012966-1-nylon.chen@sifive.com>
In-Reply-To: <20260313133941.3012966-1-nylon.chen@sifive.com>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Sat, 14 Mar 2026 00:03:29 +0800
X-Gm-Features: AaiRm53nKhoEBOLSJrSKb5eJ-QUYE3AjcJWD_SrfJLXZGi2uYbt-sqda_pHQA1k
Message-ID: <CAHh=Yk_dtFNH6jywc0nXCagen1xyJR7GB8MpYUfrY5GwdaQ1Qw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add support for RISC-V Smrnmi extension
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com, nick.hu@sifive.com, samuel.holland@sifive.com, 
	yongxuan.wang@sifive.com, anup@brainfault.org, rkrcmar@qti.qualcomm.com, 
	atishp@rivosinc.com, npiggin@gmail.com, 
	Evgeny Voevodin <evvoevod@oss.tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_090342_499573_75B79EDD 
X-CRM114-Status: GOOD (  20.22  )
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

U29ycnksIHBsZWFzZSBpZ25vcmUgdGhpcyB2NCBzZXJpZXMuIEl0IHdhcyBzZW50IGJlZm9yZSBJ
IGhhZCBmdWxseQpyZXZpZXdlZCB0aGUgb25nb2luZyBkaXNjdXNzaW9uLCBwYXJ0aWN1bGFybHkg
TmljaydzIGNvbW1lbnRzIGFuZApFdmdlbnkncyBTbXJubWkgc2VyaWVzIGZvciBBc2NhbG9uLgoK
SSB3aWxsIHRha2UgdGltZSB0byByZXZpZXcgdGhlaXIgd29yayBjYXJlZnVsbHkgYW5kIHNlbmQg
YSByZXZpc2VkCnZlcnNpb24gdGhhdCBiZXR0ZXIgYWxpZ25zIHdpdGggdGhlIGRpcmVjdGlvbiBv
ZiB0aGUgZGlzY3Vzc2lvbi4KCkFwb2xvZ2llcyBmb3IgdGhlIG5vaXNlLgoKVGhhbmtzLApOeWxv
bgoKTnlsb24gQ2hlbiA8bnlsb24uY2hlbkBzaWZpdmUuY29tPiDmlrwgMjAyNuW5tDPmnIgxM+aX
pemAseS6lCDkuIvljYg5OjM55a+r6YGT77yaCj4KPiBUaGlzIHBhdGNoIHNlcmllcyBhZGRzIHN1
cHBvcnQgZm9yIHRoZSBSSVNDLVYgU21ybm1pIChSZXN1bWFibGUKPiBOb24tTWFza2FibGUgSW50
ZXJydXB0cykgZXh0ZW5zaW9uIHRvIE9wZW5TQkkuCj4KPiAxLiBQQVRDSCAxLzM6IEFkZCBTbXJu
bWkgZXh0ZW5zaW9uIGRldGVjdGlvbgo+ICAgIC0gRGVmaW5lcyBTbXJubWkgQ1NSIHJlZ2lzdGVy
cyAoTU5TQ1JBVENILCBNTkVQQywgTU5DQVVTRSwgTU5TVEFUVVMpCj4gICAgLSBEZWZpbmVzIE1O
U1RBVFVTIGJpdCBmaWVsZHMgKE5NSUUsIE1OUFYsIE1OUEVMUCwgTU5QUCkKPiAgICAtIFJlZ2lz
dGVycyB0aGUgU21ybm1pIGV4dGVuc2lvbiBpbiBoYXJ0IGV4dGVuc2lvbiBlbnVtZXJhdGlvbgo+
Cj4gMi4gUEFUQ0ggMi8zOiBFbmFibGUgU21ybm1pIGV4dGVuc2lvbiBoYW5kbGVyCj4gICAgLSBJ
bXBsZW1lbnRzIHJubWlfdmVjdG9yX2luaXQoKSBhcyBhIHN0YXRpYyBmdW5jdGlvbiBpbiBzYmlf
aGFydC5jCj4gICAgLSBTZXRzIE1OU0NSQVRDSCB0byB0aGUgc2NyYXRjaCBwb2ludGVyIChzYW1l
IHJvbGUgYXMgTVNDUkFUQ0gpCj4gICAgLSBBZGRzIHBsYXRmb3JtIG9wZXJhdGlvbiBzZXRfcm5t
aV90cmFwX3ZlY3RvcigpIGZvciB0cmFwIHZlY3RvciBwcm9ncmFtbWluZwo+ICAgIC0gQWRkcyBz
dXNwZW5kL3Jlc3VtZSBzdXBwb3J0IGZvciBSTk1JIENTUnMgKE1OU0NSQVRDSCwgTU5TVEFUVVMp
Cj4gICAgLSBDYWxscyBybm1pX3ZlY3Rvcl9pbml0KCkgYXQgdGhlIGVuZCBvZiBzYmlfaGFydF9p
bml0KCkKPiAgICAtIE5vdGU6IERvZXMgbm90IHlldCBlbmFibGUgUk5NSTsgdHJhcCB2ZWN0b3Ig
c2V0dXAgZGVmZXJyZWQgdG8gUGF0Y2ggMwo+Cj4gMy4gUEFUQ0ggMy8zOiBBZGQgY29tbW9uIE5N
SSB0cmFwIGhhbmRsZXIKPiAgICAtIEltcGxlbWVudHMgc2JpX3JubWlfdmVjdG9yIGFzc2VtYmx5
IGVudHJ5IHBvaW50IGluIGZ3X2Jhc2UuUwo+ICAgIC0gQ2hlY2tzIE1OU1RBVFVTLk1OUFAgdG8g
ZGlzdGluZ3Vpc2ggUy9VLW1vZGUgdnMgTS1tb2RlIGludGVycnVwdHMKPiAgICAtIFVzZXMgc2Ny
YXRjaCBhcmVhIGZvciBTL1UtbW9kZSBpbnRlcnJ1cHRzCj4gICAgLSBSZXVzZXMgZXhpc3Rpbmcg
TS1tb2RlIHN0YWNrIGZvciBNLW1vZGUgaW50ZXJydXB0cyAobmVzdGVkIFJOTUkpCj4gICAgLSBJ
bXBsZW1lbnRzIGRlZmF1bHQgc2JpX3JubWlfdHJhcF9oYW5kbGVyKCkgaW4gQyAobWFya2VkIF9f
YXR0cmlidXRlX18oKHdlYWspKSkKPiAgICAtIENvbXBsZXRlcyBybm1pX3ZlY3Rvcl9pbml0KCkg
d2l0aCBwbGF0Zm9ybSBob29rIGNhbGwgYW5kIE5NSUUgZW5hYmxlbWVudAo+Cj4gQ2hhbmdlcyBp
biB2NDoKPiAgLSBBZGRlZCBNTlNUQVRVUy5NTlBFTFAgYml0IGRlZmluaXRpb24gKGZvciBaaWNm
aWxwIGV4dGVuc2lvbikKPiAgLSBNYWRlIHJubWlfdmVjdG9yX2luaXQoKSBhIHN0YXRpYyBmdW5j
dGlvbiBhbmQgcmVtb3ZlZCBnbG9iYWwgZGVjbGFyYXRpb24KPiAgLSBNb3ZlZCBybm1pX3ZlY3Rv
cl9pbml0KCkgY2FsbCBmcm9tIHNiaV9pbml0LmMgdG8gZW5kIG9mIHNiaV9oYXJ0X2luaXQoKQo+
ICAtIENoYW5nZWQgc2V0X3JubWlfdHJhcF92ZWN0b3IoKSBwYXJhbWV0ZXIgdHlwZSBmcm9tIHVp
bnRwdHJfdCB0byB1bnNpZ25lZCBsb25nCj4gIC0gQ2hhbmdlZCBwbGF0Zm9ybSBob29rIHJlcXVp
cmVtZW50IGZyb20gInNob3VsZCIgdG8gIm11c3QiIGluIGRvY3VtZW50YXRpb24KPiAgLSBTaW1w
bGlmaWVkIE1OU0NSQVRDSCBzZXR1cDogZGlyZWN0bHkgdXNlIHNjcmF0Y2ggcG9pbnRlciBpbnN0
ZWFkIG9mIGFsbG9jYXRpbmcKPiAgICBzZXBhcmF0ZSBSTk1JIGNvbnRleHQgKGFkZHJlc3NlcyBS
YWRpbSdzIGZlZWRiYWNrIG9uIHN0YWNrIHNwYWNlKQo+ICAtIFJld3JvdGUgc2JpX3JubWlfdmVj
dG9yIHRvIGNoZWNrIE1OU1RBVFVTLk1OUFAgYW5kIHJldXNlIE0tbW9kZSBzdGFjayBmb3IKPiAg
ICBuZXN0ZWQgUk5NSSAoYWRkcmVzc2VzIFJhZGltJ3MgZmVlZGJhY2sgb24gTS1tb2RlIHN0YWNr
IHJldXNlKQo+ICAtIFJlbW92ZWQgUk5NSV9TQVZFX1JFR1MvUk5NSV9SRVNUT1JFX1JFR1MgbWFj
cm9zIGluIGZhdm9yIG9mIGV4cGxpY2l0Cj4gICAgcmVnaXN0ZXIgc2F2ZS9yZXN0b3JlIGZvciBi
ZXR0ZXIgY29udHJvbAo+ICAtIEFkZGVkIHNiaV9ybm1pX3RyYXBfaGFuZGxlcigpIGRlY2xhcmF0
aW9uIGluIHNiaV90cmFwLmgKPiAgLSBDaGFuZ2VkIHByaW50ZiBmb3JtYXQgZnJvbSAlMDE2bHgg
dG8gUFJJTFggbWFjcm8gZm9yIDMyLzY0LWJpdCBjb21wYXRpYmlsaXR5Cj4gIC0gRml4ZWQgcGF0
Y2ggc3RydWN0dXJlOiBQYXRjaCAyIG5vdyBvbmx5IHNldHMgdXAgTU5TQ1JBVENIOyBQYXRjaCAz
IGNvbXBsZXRlcwo+ICAgIHRoZSBpbml0aWFsaXphdGlvbiB3aXRoIHRyYXAgdmVjdG9yIHNldHVw
IGFuZCBOTUlFIGVuYWJsZW1lbnQgKGVuc3VyZXMgZWFjaAo+ICAgIHBhdGNoIGNhbiBiZSBjb21w
aWxlZCBpbmRlcGVuZGVudGx5KQo+ICAtIE1hcmtlZCBzYmlfcm5taV90cmFwX2hhbmRsZXIoKSBh
cyBfX2F0dHJpYnV0ZV9fKCh3ZWFrKSkgdG8gYWxsb3cgcGxhdGZvcm0gb3ZlcnJpZGUKPgo+IENo
YW5nZXMgaW4gdjM6Cj4gIC0gU3BsaXQgc2luZ2xlIHBhdGNoIGludG8gdGhyZWUtcGF0Y2ggc2Vy
aWVzIHBlciBBbnVwJ3MgZmVlZGJhY2s6Cj4gICAqIFBBVENIIDE6IEFkZCBTbXJubWkgZXh0ZW5z
aW9uIGRldGVjdGlvbiAod2l0aG91dCBlbmFibGluZyBOTUkpCj4gICAqIFBBVENIIDI6IEVuYWJs
ZSBTbXJubWkgZXh0ZW5zaW9uIGhhbmRsZXIKPiAgICogUEFUQ0ggMzogQWRkIGNvbW1vbiBOTUkg
dHJhcCBoYW5kbGVyIGluIGZ3X2Jhc2UuUwo+ICAtIEFkZGVkIHBsYXRmb3JtIGFic3RyYWN0aW9u
IHZpYSBzZXRfcm5taV90cmFwX3ZlY3RvcigpIGNhbGxiYWNrCj4gIC0gQWRkZWQgcGVyLUhBUlQg
Uk5NSSBjb250ZXh0IGFsbG9jYXRpb24KPiAgLSBBZGRlZCBzdXNwZW5kL3Jlc3VtZSBzdXBwb3J0
IGZvciBSTk1JIENTUnMKPgo+IENoYW5nZXMgaW4gdjI6Cj4gIC0gUmVtb3ZlIGhhcnRfc21ybm1p
X2dldF9hbGxvd2VkKCkgYW5kIHVzZSBzYmlfaGFydF9oYXNfZXh0ZW5zaW9uKCkgZm9yCj4gICAg
U21ybm1pIGRldGVjdGlvbgo+Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBab25nIExpIDx6b25nLmxpQHNp
Zml2ZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgo+
IFN1Z2dlc3RlZC1ieTogTmljayBIdSA8bmljay5odUBzaWZpdmUuY29tPgo+IFN1Z2dlc3RlZC1i
eTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogTnlsb24gQ2hlbiA8bnlsb24uY2hlbkBzaWZpdmUuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IFlvbmctWHVhbiBXYW5nIDx5b25neHVhbi53YW5nQHNpZml2ZS5jb20+Cj4KPiBOeWxvbiBDaGVu
ICgzKToKPiAgIGxpYjogc2JpOiBBZGQgU21ybm1pIGV4dGVuc2lvbiBkZXRlY3Rpb24KPiAgIGxp
Yjogc2JpOiBFbmFibGUgU21ybm1pIGV4dGVuc2lvbiBoYW5kbGVyCj4gICBmaXJtd2FyZTogZndf
YmFzZS5TOiBBZGQgY29tbW9uIE5NSSB0cmFwIGhhbmRsZXIKPgo+ICBmaXJtd2FyZS9md19iYXNl
LlMgICAgICAgICAgIHwgMTQxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4g
IGluY2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmggfCAgMTIgKysrCj4gIGluY2x1ZGUvc2JpL3Ni
aV9oYXJ0LmggICAgICAgfCAgIDIgKwo+ICBpbmNsdWRlL3NiaS9zYmlfcGxhdGZvcm0uaCAgIHwg
ICA4ICsrCj4gIGluY2x1ZGUvc2JpL3NiaV90cmFwLmggICAgICAgfCAgMjIgKysrKystCj4gIGxp
Yi9zYmkvc2JpX2hhcnQuYyAgICAgICAgICAgfCAgNTQgKysrKysrKysrKysrKy0KPiAgbGliL3Ni
aS9zYmlfaHNtLmMgICAgICAgICAgICB8ICAxNCArKysrCj4gIGxpYi9zYmkvc2JpX3RyYXAuYyAg
ICAgICAgICAgfCAgMTcgKysrKysKPiAgOCBmaWxlcyBjaGFuZ2VkLCAyNjcgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKPgo+IC0tCj4gMi40My43Cj4KCi0tIApvcGVuc2JpIG1haWxpbmcg
bGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
