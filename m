Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFEE6EF3718
	for <opensbi@archiver.kernel.org>; Mon,  9 Mar 2026 08:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tRVXuPNv7y3oFKDke0WADuk7Gqfd/Syb49hFeBiG8D0=; b=kbPGuYjx0gNCOd
	DEWUV1dK6i6UQ+NKrF8iiCOu9Drd5M8/7VE3S5TKCSgJu+A08DJs5vg1Fk9vqhYpKP4KVW2tXYzLJ
	Z1djQxEoweck2BDX5By4onkK0ghUCko6vZy8QGH0ODXAP5xy3VqhjZQqM2Bg6gtRYxzOkPj38kw34
	SiBRGu/uYYGz2KNlMp03a0DnUgYeWtDHsEuts6/7QGtGHF3CWmPx0y+Otd0/n8Qha3DdvoxBXvD4F
	1r+hUZRJT8HYK7vZCO5erWYi22fpAq22632CbHbRvSXNtIALOuBQsDwzEz2rMqJoupsM3lFce5sk2
	b+pOEqrp2leTv6CG+JJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWSQ-00000006v38-48fU;
	Mon, 09 Mar 2026 08:59:22 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWSO-00000006v1x-2ZTt
	for opensbi@lists.infradead.org;
	Mon, 09 Mar 2026 08:59:22 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-67ba6e63922so1002179eaf.2
        for <opensbi@lists.infradead.org>; Mon, 09 Mar 2026 01:59:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773046759; cv=none;
        d=google.com; s=arc-20240605;
        b=eT2jMJg0sZ7I1FWQXRcvQeBZOuP0wFeOWoCXAaQRJ+WUN0rx4MIoiUGdCuGImJH/g9
         PGJE6m7l5QnlbUc/PowI7ndoq2pz75TyAP8AUVTSCgnFsyXMzMpDJpCDHcFXsscHRHAF
         i5NrmvJb8Rts1/BC24Z6vHtV2vJjARsx5XYKhJG5VbHNU7MFoFbXK9/ZoXtc1NsSn/4b
         vuvrWK9572UarLv8rWKBmCH5wO1ORSOpUJgOSNXhHjZVAYdG5LWYELS0xLqHyDGoZGhb
         0pQIXDRY7n39TPRzcaX2XWUMtGqaAFx3bU9KN4Evfq5ztgJ1MTdv/JNYUWLFY1FBylpA
         +XOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HNzb8LcenLteN1K0Z+jt1uXAJ4gy9pcRAqeDEM1QVPc=;
        fh=T8OP/o7zS5H+6Uq6ILsRcHUpiRyWJDEXKBvt02zT5EI=;
        b=C6CrIDuLb/0lYDmEEAdiI55YTO8IvvpAf9O6HW99bZAER1s3z01jQ8g6vI8B8tbtMR
         FHsTz1jU1NIadNeh0YlngMcvi5RTjapJnD0FmzIMGQPwhrfkXTtCveYhAaaZDHKmHPV4
         rPAPWbhjjjASRqdiMMxTQ0BN61UV8CHr1Peb51/cPhukLFJ6ZAySDb365EOsWtb4DWa7
         /QfjN1amktUarxheYoBEh2SC5oQPG9CITJmBPmKKK4BBaXjYFxe/3XFOZ9n2RdfoJn+r
         h/NkDPlLxvR9HJnlyxfE4Ew0JoYdey4yfYqx9aD9zLBE7uJilkHMUA85GC/luvbwo6pK
         wCNA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1773046759; x=1773651559; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNzb8LcenLteN1K0Z+jt1uXAJ4gy9pcRAqeDEM1QVPc=;
        b=Q0dTBcjtMSlAeBj/ZTSgibrqGL40H/69ObP0+v0JlMouwQaIbXy3Z1Jy1tpXYAc6GL
         2TU7DW8NBKgBxDDdvfn2JNvTkKWJT0/Ocu/4iV2hClqTf35AXcxdIEU2LBQYwLPjz6Lx
         y9D5yFdUaZHgi4Vm9VgethGN//oWcn0DvV8uy36hCqwhlIG8xJWXhgRRqCTb0eLj0qYY
         451DGYLRGTT1WNxAy7A1AKRhRKaMtsnjNkaWYupP1IjesUyFJYcjxYsy0W4nfwDXvivG
         I5Wx1K1mAaMAvph+srLI/89EWQm7cGg0hfF2SOE/SKX/hgefKpLVjfTUyhVW8JwRmqlA
         f6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773046759; x=1773651559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HNzb8LcenLteN1K0Z+jt1uXAJ4gy9pcRAqeDEM1QVPc=;
        b=CkO8BlM71KUZaW42FQGylk1ECfbpFRDK+z+417rQd3t/2TDNzoe7RiGZc9TsiDyzHI
         5wtCQr4lCgY4CcfVMW0bmbR0qNJoZ3+l6hf2IoZXRK2VlNGlEFOMwUnrOY4yU5hAFfqC
         DQVVjIhUU8vSt4TfSzYqGvyA18TU/A2ZG9Fhst5oEnTuq//rNygfIh9KKz5tCFrM5lBO
         /vcm9WG4TfHsZ50baPGcstLPnr8NVRycz5/7iJrdrIAIpFPV9LVtScmAR+R7LwNQJC9n
         v7tgfwUVywyP86Rp54NBSWMmAeaPPfkl2Zy4Z/y+v2F0Pnw7kOyLpysU15Jvn48VI56h
         +Llw==
X-Gm-Message-State: AOJu0YyLWyrRq98rMa/rF+gTq7vKDw/DnebPjnk7XugH2MSQgcQ3EI+o
	hcN2XVPk2SXpuP+VzMO+lCzej3qMYV0jiNl0VB/KK+mkjQophBxsO5h+1/b7wbW+4JQoxQ1H/A3
	/ho8rNlg50CGNHK1dbFbxajlycn0sjZMofatl0I25/Q==
X-Gm-Gg: ATEYQzy5aPY8YMxK/KmQYaflGdb3rjhhzCqoxl8TKGGIQtlfZEOLVy9HJGtVUAb98TU
	/Pw7C+rrTD6NVIhyAQrUdVZTKCADWdKrHJLJsTTjPIFK8QSijfUEhJPvYw349utkERaEmHuAZ+S
	69JuuoeOJtvzXdIWhZB6o8Uha2jn/mc6KAkyb6J1ueRtzsrJ5ZnL9SAB+8y3qTFR/7f++y12IEF
	UXbiVQr0LOhYXCAZZtgWatLDYQpJpt7TPCz1HkxOdKT++UMLzWVkVRz6EzS42+NppmaPpGwjGMD
	viClheJl4vW9wyhgs3Eb22pngrTOC2ohutI9shRAk5gwGjfTjzYjyz7poCkM2eACKH6tMm+KiFt
	TBS6dkD0py/z6an4Pgqy44RTqQi9pzJRxYN59
X-Received: by 2002:a05:6820:4df3:b0:67b:b3ea:360 with SMTP id
 006d021491bc7-67bb3ea0552mr1763707eaf.4.1773046759497; Mon, 09 Mar 2026
 01:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260223001202.284612-1-marcos.oduardo@gmail.com>
In-Reply-To: <20260223001202.284612-1-marcos.oduardo@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 9 Mar 2026 14:29:07 +0530
X-Gm-Features: AaiRm53LfALn18NHvscL7wjtMQCOc7CKO1PBSCdbZ202KkBo3N3SruUL73fvHfQ
Message-ID: <CAAhSdy1tyifzuzkjqPbBnJDGq-+VF9mBr-YtmzWvw85t1LEkxA@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: fix undefined behavior in signed shifts in
 sbi_hart.c, sbi_ecall_interface.h
To: Marcos Oduardo <marcos.oduardo@gmail.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_015920_726418_81440775 
X-CRM114-Status: GOOD (  20.70  )
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

T24gTW9uLCBGZWIgMjMsIDIwMjYgYXQgNTo0MeKAr0FNIE1hcmNvcyBPZHVhcmRvIDxtYXJjb3Mu
b2R1YXJkb0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVUJTYW4gZGV0ZWN0ZWQgdW5kZWZpbmVkIGJl
aGF2aW9yIGluIHNiaV9oYXJ0LmMgYW5kIHNiaV9md2Z0LmMgKGluIHRoZSBjYXNlCj4gb2Ygc2Jp
X2Z3ZnQuYywgdGhlIGJ1ZyBjb21lcyBmcm9tIGEgbWFjcm8gY2FsbCBkZWZpbmVkIGF0IHNiaV9l
Y2FsbF9pbnRlcmZhY2UuaCkKPiBjYXVzZWQgYnkgc2hpZnRpbmcgYSBzaWduZWQgaW50ZWdlciBp
bnRvIHRoZSBzaWduIGJpdCAoMSA8PCAzMSkKPgo+IFRoaXMgY2FuIGJlIGZpeGVkIGJ5IHVzaW5n
IHRoZSAxVUwgbGl0ZXJhbCwgZW5zdXJpbmcgZGVmaW5lZCBhcml0aG1ldGljLgo+Cj4gUGxlYXNl
IGxldCBtZSBrbm93IGlmIHRoZXJl4oCZcyBhbnkgb3RoZXIgbW9zdCBzdWl0YWJsZSBzb2x1dGlv
biBmb3IgdGhpcyBidWcuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNYXJjb3MgT2R1YXJkbyA8bWFyY29z
Lm9kdWFyZG9AZ21haWwuY29tPgoKVGhlIHBhdGNoIHN1YmplY3QgY2FuIGJlIGEgYml0IHNob3J0
ZXIuIEkgaGF2ZSB0YWtlbiBjYXJlIGF0IHRoZQp0aW1lIG9mIG1lcmdpbmcuCgpSZXZpZXdlZC1i
eTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0
byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgoKPiAtLS0KPiAgaW5jbHVk
ZS9zYmkvc2JpX2VjYWxsX2ludGVyZmFjZS5oIHwgMiArLQo+ICBsaWIvc2JpL3NiaV9oYXJ0LmMg
ICAgICAgICAgICAgICAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9lY2FsbF9p
bnRlcmZhY2UuaCBiL2luY2x1ZGUvc2JpL3NiaV9lY2FsbF9pbnRlcmZhY2UuaAo+IGluZGV4IDc2
NjI0ZTNmLi45YTc3NmY3OSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfZWNhbGxfaW50
ZXJmYWNlLmgKPiArKysgYi9pbmNsdWRlL3NiaS9zYmlfZWNhbGxfaW50ZXJmYWNlLmgKPiBAQCAt
MTQ0LDcgKzE0NCw3IEBAIGVudW0gc2JpX2Z3ZnRfZmVhdHVyZV90IHsKPiAgICAgICAgIFNCSV9G
V0ZUX0dMT0JBTF9QTEFURk9STV9FTkQgICAgICAgICAgICA9IDB4ZmZmZmZmZmYsCj4gIH07Cj4K
PiAtI2RlZmluZSBTQklfRldGVF9HTE9CQUxfRkVBVFVSRV9CSVQgICAgICAgICAgICAoMSA8PCAz
MSkKPiArI2RlZmluZSBTQklfRldGVF9HTE9CQUxfRkVBVFVSRV9CSVQgICAgICAgICAgICAoMVVM
IDw8IDMxKQo+ICAjZGVmaW5lIFNCSV9GV0ZUX1BMQVRGT1JNX0ZFQVRVUkVfQklUICAgICAgICAg
ICgxIDw8IDMwKQo+Cj4gICNkZWZpbmUgU0JJX0ZXRlRfU0VUX0ZMQUdfTE9DSyAgICAgICAgICAg
ICAgICAgKDEgPDwgMCkKPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaGFydC5jIGIvbGliL3Ni
aS9zYmlfaGFydC5jCj4gaW5kZXggNjBlOTViY2EuLjk5ZTEzOTkwIDEwMDY0NAo+IC0tLSBhL2xp
Yi9zYmkvc2JpX2hhcnQuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+IEBAIC03MCw3ICs3
MCw3IEBAIHN0YXRpYyB2b2lkIG1zdGF0dXNfaW5pdChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0
Y2gpCj4gICAgICAgICAgKi8KPiAgICAgICAgIG1ocG1ldmVudF9pbml0X3ZhbCB8PSAoTUhQTUVW
RU5UX09GIHwgTUhQTUVWRU5UX01JTkgpOwo+ICAgICAgICAgZm9yIChjaWR4ID0gMDsgY2lkeCA8
PSAyODsgY2lkeCsrKSB7Cj4gLSAgICAgICAgICAgICAgIGlmICghKG1ocG1fbWFzayAmIDEgPDwg
KGNpZHggKyAzKSkpCj4gKyAgICAgICAgICAgICAgIGlmICghKG1ocG1fbWFzayAmIDFVTCA8PCAo
Y2lkeCArIDMpKSkKPiAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiAgI2lmIF9f
cmlzY3ZfeGxlbiA9PSAzMgo+ICAgICAgICAgICAgICAgICBjc3Jfd3JpdGVfbnVtKENTUl9NSFBN
RVZFTlQzICsgY2lkeCwKPiAtLQo+IDIuNTMuMAo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBs
aXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QK
b3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
