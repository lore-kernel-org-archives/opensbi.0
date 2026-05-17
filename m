Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE516CD4F21
	for <opensbi@archiver.kernel.org>; Sun, 17 May 2026 15:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1jKC7be9K0by1APe5KzRV4o8tILUPVbWi1tioeOKG/Q=; b=REYel/b7o4Z2xj
	GfNO0G6j835fl0ZtsLbYdGHsTzlrArAmh2gRdTS1p0ri9gE5/4T25LU50dDifHgKka70PEEEpRiuJ
	fjW9qxVZayeqOBpxY51JnhA9lpf7t5icKfl3OhMxg1vzSFnHQa2g+Ha7rJZATumxRfWmTSZCTNuzd
	Nqk+lARsvMeFYcW5R5k2hojj2qR+uuWxZP/5Sjqz4bfP/cfHJ7zTIk5zyPfUYjPXlys5TbiVyimXv
	n53vDUACp14eqeV5+Vdka4YI+zkLHFYilLO+hnViyKNP7Bq9sGZx8LzjeLCHTR4X+4a/aTTfS0/nM
	HoYZr3ztfD1YB3xErjKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOdYv-0000000CwiL-294t;
	Sun, 17 May 2026 15:37:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOdYt-0000000CwhJ-2VB9
	for opensbi@bombadil.infradead.org;
	Sun, 17 May 2026 15:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zH3BLahuMfZ5Sj9vUFDvm9vGakcrptX7wZFFfRawyW8=; b=FVYD/MLVVuYCeMZ7Zksbl+/wbn
	Jhl7q1mrYh+5JRcwuht6wZj0UjyLuPbRQ4oo0MWrll+ROEBnWp0uwTiQ7QjHDTlfq7P3/TLv/IKTu
	jd4CUDgUBwilFsZP+NRFcbtp9AEJoemXIjf7DRDNxIgGTRYt1LVTCh3fPH0k0iN8PqKIYAfcZBOUB
	qe7pX09I1k1MjRbx2NtNOMY12e8xj6z+EJsOXU8HpjirQp/RFTtdeRR5U1qkS82EFvOEpPJTLsCTG
	fNZO7dg7wmagGX75aU1/6rnZET8FCKf3o+dXQ6LxlxNm6hics9q5VfRmXyPinMJKdNmVX+Jt+8JO7
	lo4m8WkA==;
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOdYq-00000008wO1-0lUX
	for opensbi@lists.infradead.org;
	Sun, 17 May 2026 15:37:50 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-479dc6d26e3so988792b6e.0
        for <opensbi@lists.infradead.org>; Sun, 17 May 2026 08:37:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779032265; cv=none;
        d=google.com; s=arc-20240605;
        b=QkBrvr4cR/xd1XIx31y9/tFzzcarofhN71+gJlSIUaT1eTs2OGF46Otx2PujmxCYEx
         ttMcj09sIRdAzQyKE5Dy9MY16/jbgVv2wiIDlmjYVCM30NWq3SMrjnmssTeDCSwEtKei
         0whRermocm6zrGZlCd5fHNibsd7FwwGUkbacuUD9CeVQ/2mn7j9eoxGCrR3YbqqUdSIa
         4+zWhg+dATpGeCu7uI6da6ez478QgoSNdLd3bZA2KeYhA1MsSWxHkKdbUral1+T6n/JN
         WGwMH907/VY4yW2RPQo5ByufGUFlOAJNEXuXOwWYz0+ecnAPVgB0VPaq6pFkmaIv/hhf
         UpSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zH3BLahuMfZ5Sj9vUFDvm9vGakcrptX7wZFFfRawyW8=;
        fh=WHhEWn8zSrss4PQS6FM4IveS/fOWtph5fJQgstl1eU4=;
        b=KD/i2ZTbavKmAeS26gelQAT7MlgSt2EVZvT1bJORzrPrKOhfMkwmD9qwICV1hFBl1X
         o0UNxHBkrVo7WZq5lVbMyS+rQNvjOohPq3lbkwuuTHcNxFGJGleGCSQlTU5bJwv+m0pR
         oIfS8TBDQw7qvrZOXD7hOONO4apMwxSQDyzNIelnQjoMYoWqutUiyuC1yIluJJqrKEpT
         RlB5duk5mdeO7T6krgEK7NoD4ZMv9W27sm9C0Cigc4gIiYhXHaIajXfCBNGs9nZi4Mae
         ZkFSV+pO6ABzC6O8EozR0lwab7V4xxWZDo8YESaZ1DsXAaw/ZuX8k/kZsLXXtd8aSyFI
         oEng==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1779032265; x=1779637065; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zH3BLahuMfZ5Sj9vUFDvm9vGakcrptX7wZFFfRawyW8=;
        b=K3pz8i8Untu0NtRapDO5CDMevpT/Vo2PsSpi6Q6XWerSLINevpwKRUryZlJeVRvIYv
         Sq0hDVohB1IzLNqNukp3OKBXfcL5phT27qBbt6LtqBm94H6yPdGJHjvVCp/pLC0kIfEW
         rvrKhhM3ndae+VPQ/n9ac/TnrnH6g7HAeiTiFg6PzFDAZ9jsninoq/vlfgurQ1KUqakN
         zvzHss6jD9Q+HPxGLmCVccBcfmNyEcT+9c7A3gJ/ep8gzSaOx9vTKlAByrDKe4hLT9Cm
         jJNlI/wk67hzTodzsE6bg0XlF2SO5NqZC/MEN5STfyIOFtGLsbVSoDFYLWr527TXnIuO
         Pkog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779032265; x=1779637065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zH3BLahuMfZ5Sj9vUFDvm9vGakcrptX7wZFFfRawyW8=;
        b=Vmk8EKJ9i37pwILsLtEQhuLq/cP4ffLVGcM86TV7RMp8GlmabHAzmaQCBTjbzpPWtW
         4xZsW6JVAu4AdzVkOWPifWtscIPkkwT/PedlmaAyfh4PRTs5WXxm5veIlWnJi56Lb1E+
         P2se3VLpHJE6DPHLFzlDAuvv3/t58pENY6ysXZqx83aixYUk+Nxz/LCCCg66N/9DBZ2G
         NP94vA1DG28DkOs1PzGbQfhGdpZZNiUBGMh4T2qNO9SibNdfz1T2YslZnPpnXlWELu5U
         KzQIKO93o1NrFOkC6oyGZ5dPOYI3QNRzFMX4kx1aZyy8kRPdFsFm/uFPoK1Iul6Q2We3
         RKcw==
X-Forwarded-Encrypted: i=1; AFNElJ85ROAUM9mP953YGMLLLRl5JYPxW6TDbBELImW2NkBm6YhHkqAe1PEUhoevFhiCTjFHRqBN3JLz@lists.infradead.org
X-Gm-Message-State: AOJu0YwsL8lybkcnVFWEfnfDcjV8edNm80gxJZNZGr2wzb1Pz9LUH+kT
	Oe8r7SdW7v//OmGGFdx4InbMOPPRwUHCHwuR6/iU9tg0mR9OztKmgs74Oyu1z7WsfkjJ1ypoVTJ
	xTWGciR9O28MX5vuZb7qovGmWbeliOSW3QLA7fhU8aQ==
X-Gm-Gg: Acq92OHLk06JS6wAyKtCFZImvN7SEQDcbbvn6PYoI0YPMOb+x42IcWT0MDUEGPYj7Qh
	B/gqzWAfEfmyWI12p31+sVWNnzUrgTBG3LiCDwMySM1enQ1CxiWfEDs2d8WKd6GrNdLpIzlP9uw
	XItwtbvbffZvfwGOIFko/jaaps6msov7WCA+CTt18z19n+xMo+oaA0SPEEweNwmJeGSMfhsTWoE
	MA7VVDdrz4ciPB+CY24J2pb/VeUyIdvTMpkOrqkfYvDiyrUei4ktdhl14GBRjEKtBOygWo3O88X
	m6Mm11AJ+yGsQLTzoKNbcrqxPPfV/4QMCGoLI7AA50PHcboZukRNW4XkQhCP5tQVS9jXContxhu
	EIiuAMFWA+W0KDGTQZjdkQRwBtA==
X-Received: by 2002:a05:6820:98e:b0:69b:8e6a:e97e with SMTP id
 006d021491bc7-69c94291c92mr7071180eaf.4.1779032265284; Sun, 17 May 2026
 08:37:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260516222143.23619-1-dave.patel@riscstar.com> <20260516222143.23619-2-dave.patel@riscstar.com>
In-Reply-To: <20260516222143.23619-2-dave.patel@riscstar.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 17 May 2026 21:07:34 +0530
X-Gm-Features: AVHnY4InAcPEMEMwqKnKB9erHFOBY9S44dWIEIULVjsdY30SXTLFKC6p9rYYb8w
Message-ID: <CAAhSdy2ngCAq=GkK-KV1BNwJaEmbuCgesmnM9vakoS-KQWFYMQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] lib: sbi: Add RISC-V vector context save/restore support
To: dave.patel@riscstar.com
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Anup Patel <anuppate@qti.qualcomm.com>, 
	Scott Bambrough <scott@riscstar.com>, Robin Randhawa <robin.randhawa@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Ray Mao <raymond.mao@riscstar.com>, 
	Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_163748_682485_5148DF5B 
X-CRM114-Status: GOOD (  23.89  )
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

T24gU3VuLCBNYXkgMTcsIDIwMjYgYXQgMzo1MeKAr0FNIDxkYXZlLnBhdGVsQHJpc2NzdGFyLmNv
bT4gd3JvdGU6Cj4KPiBGcm9tOiBEYXZlIFBhdGVsIDxkYXZlLnBhdGVsQHJpc2NzdGFyLmNvbT4K
Pgo+IEVhZ2VyIGNvbnRleHQgc3dpdGNoOiBBZGQgc3VwcG9ydCBmb3Igc2F2aW5nIGFuZCByZXN0
b3JpbmcgUklTQy1WIHZlY3Rvcgo+IGV4dGVuc2lvbiBzdGF0ZSBpbiBPcGVuU0JJLiBUaGlzIGlu
dHJvZHVjZXMgYSBwZXItaGFydCB2ZWN0b3IgY29udGV4dAo+IHN0cnVjdHVyZSBhbmQgaGVscGVy
IHJvdXRpbmVzIHRvIHBlcmZvcm0gZnVsbCBjb250ZXh0IHNhdmUgYW5kIHJlc3RvcmUuCj4KPiBU
aGUgdmVjdG9yIGNvbnRleHQgaW5jbHVkZXMgdmNzciBDU1JzIGFsb25nIHdpdGggc3RvcmFnZSBm
b3IgYWxsIDMyIHZlY3Rvcgo+IHJlZ2lzdGVycy4gVGhlIHJlZ2lzdGVyIHN0YXRlIGlzIHNhdmVk
IGFuZCByZXN0b3JlZCB1c2luZyBieXRlLXdpc2UgdmVjdG9yCj4gbG9hZC9zdG9yZSBpbnN0cnVj
dGlvbnMgKHZzOHIvdmw4cikuCj4KPiBUaGUgaW1wbGVtZW50YXRpb24gZm9sbG93cyBhbiBlYWdl
ciBjb250ZXh0IHN3aXRjaGluZyBtb2RlbCB3aGVyZSB0aGUgZW50aXJlCj4gdmVjdG9yIHN0YXRl
IGlzIHNhdmVkIGFuZCByZXN0b3JlZCBvbiBldmVyeSBjb250ZXh0IHN3aXRjaC4gVGhpcyBwcm92
aWRlcyBhCj4gc2ltcGxlIGFuZCBkZXRlcm1pbmlzdGljIG1lY2hhbmlzbSB3aXRob3V0IHJlcXVp
cmluZyBsYXp5IHRyYXAtYmFzZWQKPiBtYW5hZ2VtZW50Lgo+Cj4gU2lnbmVkLW9mZi1ieTogRGF2
ZSBQYXRlbCA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvc2JpL3Ni
aV92ZWN0b3IuaCB8ICAyOCArKysrKysrKwo+ICBsaWIvc2JpL29iamVjdHMubWsgICAgICAgfCAg
IDEgKwo+ICBsaWIvc2JpL3NiaV92ZWN0b3IuYyAgICAgfCAxMzggKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTY3IGluc2VydGlvbnMo
KykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvc2JpL3NiaV92ZWN0b3IuaAo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgbGliL3NiaS9zYmlfdmVjdG9yLmMKPgo+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL3NiaS9zYmlfdmVjdG9yLmggYi9pbmNsdWRlL3NiaS9zYmlfdmVjdG9yLmgKPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwLi5iYmQ4NTdjMwo+IC0tLSAvZGV2L251bGwK
PiArKysgYi9pbmNsdWRlL3NiaS9zYmlfdmVjdG9yLmgKPiBAQCAtMCwwICsxLDI4IEBACj4gKy8q
Cj4gKyAqIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBCU0QtMi1DbGF1c2UKPiArICoKPiArICog
Q29weXJpZ2h0IChjKSAyMDI2IFJJU0NzdGFyIFNvbHV0aW9ucy4KPiArICoKPiArICogQXV0aG9y
czoKPiArICogICBEYXZlIFBhdGVsIDxkYXZlLnBhdGVsQHJpc2NzdGFyLmNvbT4KPiArICovCj4g
Kwo+ICsjaWZuZGVmIF9fU0JJX1ZFQ1RPUl9IX18KPiArI2RlZmluZSBfX1NCSV9WRUNUT1JfSF9f
Cj4gKwo+ICsjaW5jbHVkZSA8c2JpL3NiaV90eXBlcy5oPgo+ICsKPiArc3RydWN0IHNiaV92ZWN0
b3JfY29udGV4dCB7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIHZjc3I7Cj4gKyAgICAgICB1bnNp
Z25lZCBsb25nIHZzdGFydDsKPiArCj4gKyAgICAgICAvKiBzaXplIGRlcGVuZHMgb24gVkxFTiAq
Lwo+ICsgICAgICAgdWludDhfdCB2cmVnc1tdOwo+ICt9Owo+ICsKPiArdm9pZCBzYmlfdmVjdG9y
X3NhdmUoc3RydWN0IHNiaV92ZWN0b3JfY29udGV4dCAqZHN0KTsKPiArdm9pZCBzYmlfdmVjdG9y
X3Jlc3RvcmUoY29uc3Qgc3RydWN0IHNiaV92ZWN0b3JfY29udGV4dCAqc3JjKTsKPiArdW5zaWdu
ZWQgbG9uZyB2ZWN0b3JfdmxlbmIodm9pZCk7Cj4gKwo+ICsjZW5kaWYgLy9fX1NCSV9WRUNUT1Jf
SF9fCj4gKwo+IGRpZmYgLS1naXQgYS9saWIvc2JpL29iamVjdHMubWsgYi9saWIvc2JpL29iamVj
dHMubWsKPiBpbmRleCA5N2NjNDUyMS4uZGRiMmU3YWMgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9v
YmplY3RzLm1rCj4gKysrIGIvbGliL3NiaS9vYmplY3RzLm1rCj4gQEAgLTEwOSwzICsxMDksNCBA
QCBsaWJzYmktb2Jqcy15ICs9IHNiaV90cmFwX3ZfbGRzdC5vCj4gIGxpYnNiaS1vYmpzLXkgKz0g
c2JpX3VucHJpdi5vCj4gIGxpYnNiaS1vYmpzLXkgKz0gc2JpX2V4cGVjdGVkX3RyYXAubwo+ICBs
aWJzYmktb2Jqcy15ICs9IHNiaV9jcHBjLm8KPiArbGlic2JpLW9ianMteSArPSBzYmlfdmVjdG9y
Lm8KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfdmVjdG9yLmMgYi9saWIvc2JpL3NiaV92ZWN0
b3IuYwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAuLmM1OTZlYzdhCj4g
LS0tIC9kZXYvbnVsbAo+ICsrKyBiL2xpYi9zYmkvc2JpX3ZlY3Rvci5jCj4gQEAgLTAsMCArMSwx
MzggQEAKPiArLyoKPiArICogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEJTRC0yLUNsYXVzZQo+
ICsgKgo+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjYgUklTQ3N0YXIgU29sdXRpb25zLgo+ICsgKgo+
ICsgKiBBdXRob3JzOgo+ICsgKiAgICAgIERhdmUgUGF0ZWwgPGRhdmUucGF0ZWxAcmlzY3N0YXIu
Y29tPgo+ICsgKi8KPiArCj4gKyNpbmNsdWRlIDxzYmkvc2JpX2RvbWFpbi5oPgo+ICsjaW5jbHVk
ZSA8c2JpL3Jpc2N2X2VuY29kaW5nLmg+Cj4gKyNpbmNsdWRlIDxzYmkvcmlzY3ZfYXNtLmg+Cj4g
KyNpbmNsdWRlIDxzYmkvc2JpX3ZlY3Rvci5oPgo+ICsjaW5jbHVkZSA8c2JpL3NiaV90eXBlcy5o
Pgo+ICsjaW5jbHVkZSA8c2JpL3NiaV9oYXJ0Lmg+Cj4gKyNpbmNsdWRlIDxzYmkvc2JpX2Vycm9y
Lmg+Cj4gKyNpbmNsdWRlIDxzYmkvc2JpX2NvbnNvbGUuaD4KPiArCj4gKyNpZmRlZiBPUEVOU0JJ
X0NDX1NVUFBPUlRfVkVDVE9SCj4gKwo+ICt1bnNpZ25lZCBsb25nIHZlY3Rvcl92bGVuYih2b2lk
KQo+ICt7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIHZsZW5iID0gMDsKPiArCj4gKyAgICAgICBh
c20gdm9sYXRpbGUgKAo+ICsgICAgICAgICAgICAgICAiLm9wdGlvbiBwdXNoXG5cdCIKPiArICAg
ICAgICAgICAgICAgIi5vcHRpb24gYXJjaCwgK3Zcblx0Igo+ICsgICAgICAgICAgICAgICAiY3Ny
ciAlMCwgdmxlbmJcblx0Igo+ICsgICAgICAgICAgICAgICAiLm9wdGlvbiBwb3Bcblx0Igo+ICsg
ICAgICAgICAgICAgICA6ICI9ciIodmxlbmIpCj4gKyAgICAgICAgICAgICAgIDoKPiArICAgICAg
ICAgICAgICAgOiAibWVtb3J5Iik7Cj4gKwo+ICsgICAgICAgcmV0dXJuIHZsZW5iOwoKVGhpcyB3
aG9sZSBmdW5jdGlvbiBjYW4gYmUgYSBzaW5nbGUgc3RhdGVtZW50ICJjc3JfcmVhZChDU1JfVkxF
TkIpOyIKCkludHJvZHVjZSBuZXcgZnVuY3Rpb24gc2JpX3ZlY3Rvcl9jb250ZXh0X3NpemUoKSBv
dmVyIGhlcmUgd2hpY2gKZXN0aW1hdGVzIHZlY3RvciBjb250ZXh0IHNpemUgb3ZlciBoZXJlIHNv
IHRoYXQgYWxsIHZlY3RvciBjb250ZXh0CnJlbGF0ZWQgY29kZSBpcyBpbiBvbmUgcGxhY2UuCgpz
aXplX3Qgc2JpX3ZlY3Rvcl9jb250ZXh0X3NpemUodm9pZCkKewogICAgcmV0dXJuIHNpemVvZihz
dHJ1Y3Qgc2JpX3ZlY3Rvcl9jb250ZXh0KSArICgzMiAqIGNzcl9yZWFkKENTUl9WTEVOQikpOwp9
Cgo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIHZvaWQgc2V0X3ZzKHZvaWQpCj4gK3sKPiArICAg
ICAgIGNzcl9zZXQoQ1NSX01TVEFUVVMsIE1TVEFUVVNfVlMpOwo+ICt9Cj4gKwo+ICt2b2lkIHNi
aV92ZWN0b3Jfc2F2ZShzdHJ1Y3Qgc2JpX3ZlY3Rvcl9jb250ZXh0ICpkc3QpCj4gK3sKPiArICAg
ICAgIGlmICghZHN0KQo+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4gKwo+ICsgICAgICAgdW5z
aWduZWQgbG9uZyBtc3RhdHVzX29yaWc7CgpNb3ZlIGFsbCB2YXJpYWJsZSBkZWNsYXJhdGlvbnMg
YXQgdGhlIHN0YXJ0IG9mIGZ1bmN0aW9uLgoKPiArICAgICAgIC8qIFN0ZXAgMS4gU2F2ZSBvcmln
aW5hbCBtc3RhdHVzICovCj4gKyAgICAgICBhc20gdm9sYXRpbGUoImNzcnIgJTAsIG1zdGF0dXMi
IDogIj1yIihtc3RhdHVzX29yaWcpKTsKPiArCj4gKyAgICAgICAvKiBTdGVwIDIuIEVuYWJsZSBW
UyAqLwo+ICsgICAgICAgc2V0X3ZzKCk7CgpUaGVzZSB0d28gbGluZXMgY2FuIGJlIGp1c3Qgb25l
IG9uY2UgQ1NSIG9wZXJhdGlvbjoKbXN0YXR1c19vcmlnID0gY3NyX3JlYWRfc2V0KENTUl9NU1RB
VFVTLCBNU1RBVFVTX1ZTKTsKCj4gKwo+ICsgICAgICAgLyogU3RlcCAzOiBTYXZlIENTUnMgKi8K
PiArICAgICAgIGRzdC0+dmNzciA9IGNzcl9yZWFkKHZjc3IpOwo+ICsgICAgICAgZHN0LT52c3Rh
cnQgPSBjc3JfcmVhZCh2c3RhcnQpOwo+ICsKPiArICAgICAgIHVsb25nIHZsZW5iID0gdmVjdG9y
X3ZsZW5iKCk7Cj4gKyAgICAgICB1aW50OF90ICpiYXNlID0gZHN0LT52cmVnczsKPiArCj4gKyAg
ICAgICAvKiBTdGVwIDQ6IFNhdmUgdmVjdG9yIHJlZ2lzdGVycyAqLwo+ICsjZGVmaW5lIFNBVkVf
VlJFRyhpKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAg
ICAgICAoeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKPiArICAgICAgIGFzbSB2b2xhdGlsZSggICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICAiICAgICAgIC5vcHRpb24gcHVzaFxu
XHQiICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICIgICAgICAgLm9w
dGlvbiBhcmNoLCArdlxuXHQiICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAg
IiAgICAgICB2czhyLnYgdiIgI2kgIiwgKCUwKVxuXHQiICAgICAgICAgICAgICAgXAo+ICsgICAg
ICAgICAgICAgICAiICAgICAgIC5vcHRpb24gcG9wXG5cdCIgICAgICAgICAgICAgICAgICAgICAg
ICBcCj4gKyAgICAgICAgICAgICAgIDo6ICAgICAgInIiKGJhc2UgKyAoaSkgKiB2bGVuYikgOiAi
bWVtb3J5Iik7ICAgIFwKPiArICAgICAgIH0pICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsKPiArICAgICAgIFNBVkVfVlJFRygwKTsKPiAr
ICAgICAgIFNBVkVfVlJFRyg4KTsKPiArICAgICAgIFNBVkVfVlJFRygxNik7Cj4gKyAgICAgICBT
QVZFX1ZSRUcoMjQpOwo+ICsKPiArI3VuZGVmIFNBVkVfVlJFRwo+ICsKPiArICAgICAgIC8qIFN0
ZXAgNS4gUmVzdG9yZSBvcmlnaW5hbCBtc3RhdHVzIExBU1QgKi8KPiArICAgICAgIGFzbSB2b2xh
dGlsZSgiY3NydyBtc3RhdHVzLCAlMCIgOjogInIiKG1zdGF0dXNfb3JpZykpOwoKY3NyX3dyaXRl
KENTUl9NU1RBVFVTLCBtc3RhdHVzX29yaWcpOwoKPiArfQo+ICsKPiArdm9pZCBzYmlfdmVjdG9y
X3Jlc3RvcmUoY29uc3Qgc3RydWN0IHNiaV92ZWN0b3JfY29udGV4dCAqc3JjKQo+ICt7Cj4gKyAg
ICAgICBpZiAoIXNyYykKPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsKPiArICAgICAgIHVu
c2lnbmVkIGxvbmcgbXN0YXR1c19vcmlnOwoKTW92ZSBhbGwgdmFyaWFibGUgZGVjbGFyYXRpb25z
IGF0IHRoZSBzdGFydCBvZiBmdW5jdGlvbi4KCj4gKyAgICAgICAvKiBTdGVwIDEuIFNhdmUgb3Jp
Z2luYWwgbXN0YXR1cyAqLwo+ICsgICAgICAgYXNtIHZvbGF0aWxlKCJjc3JyICUwLCBtc3RhdHVz
IiA6ICI9ciIobXN0YXR1c19vcmlnKSk7Cj4gKwo+ICsgICAgICAgLyogU3RlcCAyLiBFbmFibGUg
VlMgKi8KPiArICAgICAgIHNldF92cygpOwoKU2FtZSBjb21tZW50IGFzIGFib3ZlLgoKPiArCj4g
KyAgICAgICBjb25zdCB1aW50OF90ICpiYXNlID0gc3JjLT52cmVnczsKPiArICAgICAgIHVsb25n
IHZsZW5iID0gdmVjdG9yX3ZsZW5iKCk7Cj4gKwo+ICsgICAgICAgLyogU3RlcCAzOiBSZXN0b3Jl
IHZlY3RvciByZWdpc3RlcnMgKi8KPiArI2RlZmluZSBSRVNUT1JFX1ZSRUcoaSkgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAoeyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAg
ICAgIGFzbSB2b2xhdGlsZSggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+ICsgICAgICAgICAgICAgICAiICAgICAgIC5vcHRpb24gcHVzaFxuXHQiICAgICAgICAg
ICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICIgICAgICAgLm9wdGlvbiBhcmNoLCAr
dlxuXHQiICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgIiAgICAgICB2bDhy
LnYgdiIgI2kgIiwgKCUwKVxuXHQiICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICAi
ICAgICAgIC5vcHRpb24gcG9wXG5cdCIgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAg
ICAgICAgICAgIDo6ICAgICAgInIiKGJhc2UgKyAoaSkgKiB2bGVuYikgOiAibWVtb3J5Iik7ICAg
IFwKPiArICAgICAgICB9KSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+ICsKPiArICAgICAgIFJFU1RPUkVfVlJFRygwKTsKPiArICAgICAgIFJF
U1RPUkVfVlJFRyg4KTsKPiArICAgICAgIFJFU1RPUkVfVlJFRygxNik7Cj4gKyAgICAgICBSRVNU
T1JFX1ZSRUcoMjQpOwo+ICsjdW5kZWYgUkVTVE9SRV9WUkVHCj4gKwo+ICsgICAgICAgLyogU3Rl
cCA0OiBSZXN0b3JlIENTUidzIGxhc3QgKi8KPiArICAgICAgIC8qIFJlc3RvcmUgQ1NScyBmaXJz
dCAqLwo+ICsgICAgICAgY3NyX3dyaXRlKHZjc3IsICAgc3JjLT52Y3NyKTsKPiArICAgICAgIGNz
cl93cml0ZSh2c3RhcnQsIHNyYy0+dnN0YXJ0KTsKPiArCj4gKyAgICAgICAvKiBTdGVwIDUuIFJl
c3RvcmUgb3JpZ2luYWwgbXN0YXR1cyBMQVNUICovCj4gKyAgICAgICBhc20gdm9sYXRpbGUoImNz
cncgbXN0YXR1cywgJTAiIDo6ICJyIihtc3RhdHVzX29yaWcpKTsKClNhbWUgY29tbWVudCBhcyBh
Ym92ZS4KCj4gK30KPiArCj4gKyNlbHNlCj4gKwo+ICt2b2lkIHNiaV92ZWN0b3Jfc2F2ZShzdHJ1
Y3Qgc2JpX3ZlY3Rvcl9jb250ZXh0ICpkc3QpCj4gK3sKPiArfQo+ICsKPiArdm9pZCBzYmlfdmVj
dG9yX3Jlc3RvcmUoY29uc3Qgc3RydWN0IHNiaV92ZWN0b3JfY29udGV4dCAqc3JjKQo+ICt7Cj4g
K30KPiArCj4gK3Vuc2lnbmVkIGxvbmcgdmVjdG9yX3ZsZW5iKHZvaWQpCj4gK3sKPiArICAgICAg
IHJldHVybiAwOwo+ICt9CgpzaXplX3Qgc2JpX3ZlY3Rvcl9jb250ZXh0X3NpemUodm9pZCkKewog
ICAgIHJldHVybiAwOwp9Cgo+ICsjZW5kaWYgLyogT1BFTlNCSV9DQ19TVVBQT1JUX1ZFQ1RPUiAq
Lwo+IC0tCj4gMi40My4wCj4KPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2Jp
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL29wZW5zYmkKClJlZ2FyZHMsCkFudXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlz
dApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
