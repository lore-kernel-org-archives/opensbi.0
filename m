Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9946C44529
	for <opensbi@archiver.kernel.org>; Tue, 21 Jul 2026 06:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/caBu88LNQvNcTNng++MCzo/yzyoYReC1aoC5pCznzk=; b=soRPdQOkDaPia/
	zmpNKL6SPwub2meZ73HRdPvgmsW/hmK/CxqE7Ar8zzm/JxHezH89gwuYYtyirjIpmyONSXgZQnxPg
	wsj1GhUW1ry/MmE6+CWAf2M42TNrvbPFNryeT7Wg0GR47IdhOVle+rE+eJc6njkw/mxzjmgLBjDdk
	w1i83Osaj5WCqLJFLZiXpGhnAR8eukEPuFzn7Hgmz+hiyIdZb4rlx4NtOPO4FzGr+tR8Pkgwxa7S9
	uL2D5A+wEW3mLRvX7tccXxwNkOXashKxMN1aBHWgf382V86iNjqh0ls0Zwe3JKHATsEHOlfEfcjmH
	WxvaoadBX7rRZNcQ9p0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm46B-00000008XVM-1RP9;
	Tue, 21 Jul 2026 06:37:03 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm468-00000008XUF-2jvG
	for opensbi@lists.infradead.org;
	Tue, 21 Jul 2026 06:37:01 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-472326ca506so8400362f8f.2
        for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 23:37:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784615819; cv=none;
        d=google.com; s=arc-20260327;
        b=h59b5MbZ0TOBXvdBIfV4LixNkoMTRALniEiiwlztmCXTJqYye7smp+MkvzQiDhitYj
         WFDYf3Tvt85r94o0R5UWVf67T+JyWdyPGHB0cj4PJABE9RG0scehzSfmTFr+td/bP4ah
         Z5nt57YdcY75ON/Z/NAs3dP3bqM1HJz7e1fiA2Yx/LaZfcrrdZee9TPhV5CYF7v1xwr1
         AvQmACPBFwGyR37YGe8dLqdDvUVbmKBjNXXc6Q+dfDAZXI+iyawnCoK9n5btS8EfwlP+
         C0olRyTaKvKZZnjmsDADLPHilpkXSLiHV3HgI4mCXzpxY8iQzLMAjBtYxPm4mriVrmSz
         HqcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4NCW7ra+qXvStSIhW18FVIzOrh0Y9vS6cuwsAe7MMBA=;
        fh=UnmeFaeQrm9MnhTHr0bkXx0556DYEpg2eYjbyAE46dU=;
        b=ldXeAlOJpc80igUuaC9EmXzG0Y7EdRUx35AuhBSTTT6UWXeR0o/Koxn1PtAJMVfuqK
         Wa4kVCvnFw5NvcAXPOkQkx+2AbEQHMeozHAiOMKbOG9poHSy9uXV3jZpYOZGVSEhb/S0
         N/Wf+92QVI87P0HKpbzI/2jI5V8O49qaHcQVdDoHAgit95//nlXenTxUEJnav1TrlvE1
         TkNlvo4Fs+0LIpFq7rA8gCemW6zI+O8rqNYGk5yijlEd6SuNEWVXvUu3VH39S4tVYlHh
         vEWJA/WU0ZL3PuJVjdN/Hz/COiLxrYU4H52ZZkVOuHYdTSprS147uuzf0s34af1fR1Ci
         LymA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1784615819; x=1785220619; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4NCW7ra+qXvStSIhW18FVIzOrh0Y9vS6cuwsAe7MMBA=;
        b=iZ0T+TNK4nea9EcVf0wOhKYu+1YUHCfyyzrh1Qrs4Os94s3A/xh8U1hEkH8wRIqm55
         N+5Rl6bZ2X/CR1nlrIL3JPGgd4z7qLwoRy2otfSGqmdpguYN0XuBC1SpB/4vgcBiNzhz
         Xzw/ca4tyw6q9DIM+C4GJHIQh/jIY+be0XteuCvN1UiUUdBSSF7WtrB7+phDsar2kBEk
         6i+gqqez0e3p11Z+G74GJ7lcHoogYsZndtRIm9AeDsjZBPxRBT16T/S9HMRMiKSmihXz
         wmf8DfJTccWtSiUWod+Bs1bIE4KKRxgq5zunNHJEsLxyB4pIIibO7gIKaP3ekUINUrsJ
         gkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784615819; x=1785220619;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4NCW7ra+qXvStSIhW18FVIzOrh0Y9vS6cuwsAe7MMBA=;
        b=tW0ytRp0y8c0zKg1xrYIaOjG9tv1SYBwTMus2EOno/8YRzbpfT57xiYpZbsnTMkYYi
         XWM1JQYFa2eoenqXxavuzpxRTNVFcWPycck4oUmzO/3L2gJEZev/+KGSTQX52/y1PCoU
         eP+aocBbyDjcG3UPXKBlyGvc7ED4/+2QY5r5T1X2X4r/tYk1j3kjQlfPayrMy1MMMhst
         bhDsnTyac6rpPIDWjq+Rxaf5qBa78Bits/z8YLHt5aFCrnMy/4pREeK5dRaDp/4cTLLG
         nl0UtRkquLgc5hoRy5CmpxqwrQXsBUORwmeNwZ76SA5wqb+YPy0NMf6b37H1GgUqmIpj
         vDFA==
X-Forwarded-Encrypted: i=1; AHgh+RqtrI8Eyu+da75aLzRVPZxsVEr4Ms2220UoSYEsgVgQ/uJzDQZsvJ/JjwnyAwPWyy0j7L9iJFFE@lists.infradead.org
X-Gm-Message-State: AOJu0YzPQ73s/Xf2x9lyWhFlGPm6b2UamaxTviH+fw2c66ccIa3X3s0E
	GrGrn/Q5QK2KDceitT4xnDXgbXVdJWZUe6cjCDTceFoqefuy4W3JAdjB77TBf3AmF02qfKQ5uIx
	hY9zqGcrBKgDD4G83QTmn/WC0ExmCGSgNwX1lszVqVQ==
X-Gm-Gg: AR+sD13UWFpaQPM4sY+KRyaYWwH/xc6BAUgvkKNwWoW2NSNXMMSOTRBiipAVYkCdPME
	cx/ZQjjnpFbAX64XVlkK9e4QD3OJ6O1tiQeamybqgFcn7m2/NS4dE6baGL1YW8lMCoowEdlsznj
	s4C0pRMzOY1hEK5fCvkwE+hNqbUntFyWflSZanrOHIkvrCdreQwR+KIzuIB7+8EcFB6l2+Dpa7m
	Zg+/z7WV0kTkUVNusJBfk+kW5vwyOkB64C0jlQLWsjuT3us4WRP0F4zm3QCuih1JZyMbMs5pFg4
	j87i47TahDd3EU/actaRz7KzBFHer2IrGoxtwQkH9bBPjU/f9579XkZpBtEl6vHIkgXAkMAFrJr
	aBL44CQ==
X-Received: by 2002:a05:6000:60f:b0:47f:6d75:7a52 with SMTP id
 ffacd0b85a97d-47f6d757ac4mr15562310f8f.31.1784615818577; Mon, 20 Jul 2026
 23:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260613132129.2135128-1-anup.patel@oss.qualcomm.com> <20260613132129.2135128-3-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260613132129.2135128-3-anup.patel@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 21 Jul 2026 12:06:46 +0530
X-Gm-Features: AUfX_myNtPt-EBysxwCocxdYqG-StCeQc7KJwe7U3M1MYFXJRuCRC5SG5NofOJM
Message-ID: <CAAhSdy31+u7PurUjbKFDR3jA9kszeYdDdW8POX56V1GCGv_FHw@mail.gmail.com>
Subject: Re: [PATCH 2/2] lib: sbi: Reduce stack usage of vector misaligned
 load/store emulation
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, Bo Gan <ganboing@gmail.com>, 
	opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_233700_730744_ADC8B2BA 
X-CRM114-Status: GOOD (  20.90  )
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

T24gU2F0LCBKdW4gMTMsIDIwMjYgYXQgNjo1MeKAr1BNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBUaGUgdmVjdG9yIG1pc2FsaWduZWQgbG9hZC9z
dG9yZSBlbXVsYXRpb24gcmVxdWlyZXMgbWFza1tdIG9mIDgxOTIKPiBieXRlcyB3aGljaCBjYXVz
ZSBzdGFjayBjb3JydXB0aW9ucyBzaW5jZSBkZWZhdWx0IHN0YWNrIHNpemUgaXMgYWxzbwo+IDgx
OTIgYnl0ZXMuCj4KPiBUbyBhZGRyZXNzIHRoZSBhYm92ZSBpc3N1ZSwgYWxsb2NhdGUgbWFza1td
IG9uLWRlbWFuZCBmcm9tIGhlYXAgZm9yCj4gZWFjaCBoYXJ0IGFuZCBzdG9yZSB0aGUgcGVyLWhh
cnQgcG9pbnRlciBpbiBzY3JhdGNoIHNwYWNlIGZvciByZXVzZS4KPgo+IFNpZ25lZC1vZmYtYnk6
IEFudXAgUGF0ZWwgPGFudXAucGF0ZWxAb3NzLnF1YWxjb21tLmNvbT4KClRoaXMgcGF0Y2ggaXMg
bm90IG5lZWRlZCBhbnkgbW9yZSBkdWUgcmVjZW50IGltcHJvdmVtZW50cyBpbgp2ZWN0b3IgbWlz
YWxpZ25lZCBsb2FkL3N0b3JlIGVtdWxhdGlvbi4KClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIGlu
Y2x1ZGUvc2JpL3NiaV90cmFwX2xkc3QuaCB8ICAyICsrCj4gIGxpYi9zYmkvc2JpX3RyYXAuYyAg
ICAgICAgICB8ICA4ICsrKysrCj4gIGxpYi9zYmkvc2JpX3RyYXBfdl9sZHN0LmMgICB8IDYxICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA2
OCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
c2JpL3NiaV90cmFwX2xkc3QuaCBiL2luY2x1ZGUvc2JpL3NiaV90cmFwX2xkc3QuaAo+IGluZGV4
IGE2YTZjNzViLi42NTUzOTAzNSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfdHJhcF9s
ZHN0LmgKPiArKysgYi9pbmNsdWRlL3NiaS9zYmlfdHJhcF9sZHN0LmgKPiBAQCAtMzcsNCArMzcs
NiBAQCBpbnQgc2JpX21pc2FsaWduZWRfdl9sZF9lbXVsYXRvcihpbnQgcmxlbiwgdW5pb24gc2Jp
X2xkc3RfZGF0YSAqb3V0X3ZhbCwKPiAgaW50IHNiaV9taXNhbGlnbmVkX3Zfc3RfZW11bGF0b3Io
aW50IHdsZW4sIHVuaW9uIHNiaV9sZHN0X2RhdGEgaW5fdmFsLAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCBzYmlfdHJhcF9jb250ZXh0ICp0Y250eCk7Cj4KPiAraW50
IHNiaV9taXNhbGlnbmVkX3ZfbGRzdF9pbml0KHZvaWQpOwo+ICsKPiAgI2VuZGlmCj4gZGlmZiAt
LWdpdCBhL2xpYi9zYmkvc2JpX3RyYXAuYyBiL2xpYi9zYmkvc2JpX3RyYXAuYwo+IGluZGV4IDE2
Nzc0ZmQyLi40MjhkOTI5NiAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV90cmFwLmMKPiArKysg
Yi9saWIvc2JpL3NiaV90cmFwLmMKPiBAQCAtNDU5LDUgKzQ1OSwxMyBAQCBzdGF0aWMgaW50IGRl
bGVnYXRlX3RyYXBzKHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkKPgo+ICBpbnQgc2JpX3Ry
YXBfaW5pdChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gsIGJvb2wgY29sZF9ib290KQo+ICB7
Cj4gKyAgICAgICBpbnQgcmM7Cj4gKwo+ICsgICAgICAgaWYgKGNvbGRfYm9vdCkgewo+ICsgICAg
ICAgICAgICAgICByYyA9IHNiaV9taXNhbGlnbmVkX3ZfbGRzdF9pbml0KCk7Cj4gKyAgICAgICAg
ICAgICAgIGlmIChyYykKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4gKyAg
ICAgICB9Cj4gKwo+ICAgICAgICAgcmV0dXJuIGRlbGVnYXRlX3RyYXBzKHNjcmF0Y2gpOwo+ICB9
Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX3RyYXBfdl9sZHN0LmMgYi9saWIvc2JpL3NiaV90
cmFwX3ZfbGRzdC5jCj4gaW5kZXggZjRkNDY5ZGMuLmU2NDJkNGEyIDEwMDY0NAo+IC0tLSBhL2xp
Yi9zYmkvc2JpX3RyYXBfdl9sZHN0LmMKPiArKysgYi9saWIvc2JpL3NiaV90cmFwX3ZfbGRzdC5j
Cj4gQEAgLTEyLDE1ICsxMiw0NSBAQAo+ICAjaW5jbHVkZSA8c2JpL3Jpc2N2X2FzbS5oPgo+ICAj
aW5jbHVkZSA8c2JpL3Jpc2N2X2VuY29kaW5nLmg+Cj4gICNpbmNsdWRlIDxzYmkvc2JpX2Vycm9y
Lmg+Cj4gKyNpbmNsdWRlIDxzYmkvc2JpX2hlYXAuaD4KPiArI2luY2x1ZGUgPHNiaS9zYmlfc2Ny
YXRjaC5oPgo+ICAjaW5jbHVkZSA8c2JpL3NiaV90cmFwX2xkc3QuaD4KPiAgI2luY2x1ZGUgPHNi
aS9zYmlfdHJhcC5oPgo+ICAjaW5jbHVkZSA8c2JpL3NiaV91bnByaXYuaD4KPiAtI2luY2x1ZGUg
PHNiaS9zYmlfdHJhcC5oPgo+Cj4gICNpZmRlZiBPUEVOU0JJX0NDX1NVUFBPUlRfVkVDVE9SCj4K
PiAgI2RlZmluZSBWTEVOX01BWCA2NTUzNgo+Cj4gK3N0cnVjdCBtaXNhbGlnbmVkX3ZfbGRzdF9k
YXRhIHsKPiArICAgICAgIHVpbnQ4X3QgbWFza1tWTEVOX01BWCAvIDhdOwo+ICt9Owo+ICsKPiAr
c3RhdGljIHVuc2lnbmVkIGxvbmcgbWlzYWxpZ25lZF92X2xkc3RfZGF0YXB0cl9vZmZzZXQ7Cj4g
Kwo+ICsjZGVmaW5lIG1pc2FsaWduZWRfdl9sZHN0X2dldF9kYXRhX3B0cihfX3NjcmF0Y2gpICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgc2JpX3NjcmF0Y2hfcmVhZF90
eXBlKChfX3NjcmF0Y2gpLCB2b2lkICosIG1pc2FsaWduZWRfdl9sZHN0X2RhdGFwdHJfb2Zmc2V0
KQo+ICsKPiArI2RlZmluZSBtaXNhbGlnbmVkX3ZfbGRzdF9zZXRfZGF0YV9wdHIoX19zY3JhdGNo
LCBfX2xkc3QpICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgIHNiaV9zY3JhdGNoX3dy
aXRlX3R5cGUoKF9fc2NyYXRjaCksIHZvaWQgKiwgbWlzYWxpZ25lZF92X2xkc3RfZGF0YXB0cl9v
ZmZzZXQsIChfX2xkc3QpKQo+ICsKPiArc3RhdGljIHN0cnVjdCBtaXNhbGlnbmVkX3ZfbGRzdF9k
YXRhICptaXNhbGlnbmVkX3ZfbGRzdF90aGlzaGFydF9kYXRhX3B0cih2b2lkKQo+ICt7Cj4gKyAg
ICAgICBzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2ggPSBzYmlfc2NyYXRjaF90aGlzaGFydF9w
dHIoKTsKPiArICAgICAgIHN0cnVjdCBtaXNhbGlnbmVkX3ZfbGRzdF9kYXRhICpwdHI7Cj4gKwo+
ICsgICAgICAgaWYgKCFtaXNhbGlnbmVkX3ZfbGRzdF9kYXRhcHRyX29mZnNldCkKPiArICAgICAg
ICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gKwo+ICsgICAgICAgcHRyID0gbWlzYWxpZ25lZF92X2xk
c3RfZ2V0X2RhdGFfcHRyKHNjcmF0Y2gpOwo+ICsgICAgICAgaWYgKCFwdHIpIHsKPiArICAgICAg
ICAgICAgICAgcHRyID0gc2JpX3phbGxvYyhzaXplb2YoKnB0cikpOwo+ICsgICAgICAgICAgICAg
ICBtaXNhbGlnbmVkX3ZfbGRzdF9zZXRfZGF0YV9wdHIoc2NyYXRjaCwgcHRyKTsKPiArICAgICAg
IH0KPiArCj4gKyAgICAgICByZXR1cm4gbWlzYWxpZ25lZF92X2xkc3RfZ2V0X2RhdGFfcHRyKHNi
aV9zY3JhdGNoX3RoaXNoYXJ0X3B0cigpKTsKPiArfQo+ICsKPiAgc3RhdGljIGlubGluZSB2b2lk
IHNldF92cmVnKHVsb25nIHZsZW5iLCB1bG9uZyB3aGljaCwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdWxvbmcgcG9zLCB1bG9uZyBzaXplLCBjb25zdCB1aW50OF90ICpieXRlcykKPiAg
ewo+IEBAIC0xNDIsNiArMTcyLDcgQEAgaW50IHNiaV9taXNhbGlnbmVkX3ZfbGRfZW11bGF0b3Io
aW50IHJsZW4sIHVuaW9uIHNiaV9sZHN0X2RhdGEgKm91dF92YWwsCj4gIHsKPiAgICAgICAgIGNv
bnN0IHN0cnVjdCBzYmlfdHJhcF9pbmZvICpvcmlnX3RyYXAgPSAmdGNudHgtPnRyYXA7Cj4gICAg
ICAgICBzdHJ1Y3Qgc2JpX3RyYXBfcmVncyAqcmVncyA9ICZ0Y250eC0+cmVnczsKPiArICAgICAg
IHN0cnVjdCBtaXNhbGlnbmVkX3ZfbGRzdF9kYXRhICpoYXJ0X2RhdGE7Cj4gICAgICAgICBzdHJ1
Y3Qgc2JpX3RyYXBfaW5mbyB1cHRyYXA7Cj4gICAgICAgICB1bG9uZyBpbnNuID0gc2JpX2dldF9p
bnNuKHJlZ3MtPm1lcGMsICZ1cHRyYXApOwo+ICAgICAgICAgdWxvbmcgdmwgPSBjc3JfcmVhZChD
U1JfVkwpOwo+IEBAIC0xNTcsMTIgKzE4OCwxNyBAQCBpbnQgc2JpX21pc2FsaWduZWRfdl9sZF9l
bXVsYXRvcihpbnQgcmxlbiwgdW5pb24gc2JpX2xkc3RfZGF0YSAqb3V0X3ZhbCwKPiAgICAgICAg
IHVsb25nIHZsbXVsID0gR0VUX1ZMTVVMKHZ0eXBlKTsKPiAgICAgICAgIGJvb2wgaWxsZWdhbCA9
IEdFVF9NRVcoaW5zbik7Cj4gICAgICAgICBib29sIG1hc2tlZCA9IElTX01BU0tFRChpbnNuKTsK
PiAtICAgICAgIHVpbnQ4X3QgbWFza1tWTEVOX01BWCAvIDhdOwo+ICAgICAgICAgdWludDhfdCBi
eXRlc1s4ICogc2l6ZW9mKHVpbnQ2NF90KV07Cj4gICAgICAgICB1bG9uZyBsZW4gPSBHRVRfTEVO
KHZpZXcpOwo+ICAgICAgICAgdWxvbmcgbmYgPSBHRVRfTkYoaW5zbik7Cj4gICAgICAgICB1bG9u
ZyB2ZW11bCA9IEdFVF9WRU1VTCh2bG11bCwgdmlldywgdnNldyk7Cj4gICAgICAgICB1bG9uZyBl
bXVsID0gR0VUX0VNVUwodmVtdWwpOwo+ICsgICAgICAgdWludDhfdCAqbWFzazsKPiArCj4gKyAg
ICAgICBoYXJ0X2RhdGEgPSBtaXNhbGlnbmVkX3ZfbGRzdF90aGlzaGFydF9kYXRhX3B0cigpOwo+
ICsgICAgICAgaWYgKCFoYXJ0X2RhdGEpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBTQklfRU5P
TUVNOwo+ICsgICAgICAgbWFzayA9IGhhcnRfZGF0YS0+bWFzazsKPgo+ICAgICAgICAgaWYgKElT
X1VOSVRfU1RSSURFX0xPQUQoaW5zbikgfHwgSVNfRkFVTFRfT05MWV9GSVJTVF9MT0FEKGluc24p
KSB7Cj4gICAgICAgICAgICAgICAgIHN0cmlkZSA9IG5mICogbGVuOwo+IEBAIC0yNDIsNiArMjc4
LDcgQEAgaW50IHNiaV9taXNhbGlnbmVkX3Zfc3RfZW11bGF0b3IoaW50IHdsZW4sIHVuaW9uIHNi
aV9sZHN0X2RhdGEgaW5fdmFsLAo+ICB7Cj4gICAgICAgICBjb25zdCBzdHJ1Y3Qgc2JpX3RyYXBf
aW5mbyAqb3JpZ190cmFwID0gJnRjbnR4LT50cmFwOwo+ICAgICAgICAgc3RydWN0IHNiaV90cmFw
X3JlZ3MgKnJlZ3MgPSAmdGNudHgtPnJlZ3M7Cj4gKyAgICAgICBzdHJ1Y3QgbWlzYWxpZ25lZF92
X2xkc3RfZGF0YSAqaGFydF9kYXRhOwo+ICAgICAgICAgc3RydWN0IHNiaV90cmFwX2luZm8gdXB0
cmFwOwo+ICAgICAgICAgdWxvbmcgaW5zbiA9IHNiaV9nZXRfaW5zbihyZWdzLT5tZXBjLCAmdXB0
cmFwKTsKPiAgICAgICAgIHVsb25nIHZsID0gY3NyX3JlYWQoQ1NSX1ZMKTsKPiBAQCAtMjU3LDEy
ICsyOTQsMTcgQEAgaW50IHNiaV9taXNhbGlnbmVkX3Zfc3RfZW11bGF0b3IoaW50IHdsZW4sIHVu
aW9uIHNiaV9sZHN0X2RhdGEgaW5fdmFsLAo+ICAgICAgICAgdWxvbmcgdmxtdWwgPSBHRVRfVkxN
VUwodnR5cGUpOwo+ICAgICAgICAgYm9vbCBpbGxlZ2FsID0gR0VUX01FVyhpbnNuKTsKPiAgICAg
ICAgIGJvb2wgbWFza2VkID0gSVNfTUFTS0VEKGluc24pOwo+IC0gICAgICAgdWludDhfdCBtYXNr
W1ZMRU5fTUFYIC8gOF07Cj4gICAgICAgICB1aW50OF90IGJ5dGVzWzggKiBzaXplb2YodWludDY0
X3QpXTsKPiAgICAgICAgIHVsb25nIGxlbiA9IEdFVF9MRU4odmlldyk7Cj4gICAgICAgICB1bG9u
ZyBuZiA9IEdFVF9ORihpbnNuKTsKPiAgICAgICAgIHVsb25nIHZlbXVsID0gR0VUX1ZFTVVMKHZs
bXVsLCB2aWV3LCB2c2V3KTsKPiAgICAgICAgIHVsb25nIGVtdWwgPSBHRVRfRU1VTCh2ZW11bCk7
Cj4gKyAgICAgICB1aW50OF90ICptYXNrOwo+ICsKPiArICAgICAgIGhhcnRfZGF0YSA9IG1pc2Fs
aWduZWRfdl9sZHN0X3RoaXNoYXJ0X2RhdGFfcHRyKCk7Cj4gKyAgICAgICBpZiAoIWhhcnRfZGF0
YSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FTk9NRU07Cj4gKyAgICAgICBtYXNrID0g
aGFydF9kYXRhLT5tYXNrOwo+Cj4gICAgICAgICBpZiAoSVNfVU5JVF9TVFJJREVfU1RPUkUoaW5z
bikpIHsKPiAgICAgICAgICAgICAgICAgc3RyaWRlID0gbmYgKiBsZW47Cj4gQEAgLTMzMCw2ICsz
NzIsMTUgQEAgaW50IHNiaV9taXNhbGlnbmVkX3Zfc3RfZW11bGF0b3IoaW50IHdsZW4sIHVuaW9u
IHNiaV9sZHN0X2RhdGEgaW5fdmFsLAo+Cj4gICAgICAgICByZXR1cm4gdmw7Cj4gIH0KPiArCj4g
K2ludCBzYmlfbWlzYWxpZ25lZF92X2xkc3RfaW5pdCh2b2lkKQo+ICt7Cj4gKyAgICAgICBtaXNh
bGlnbmVkX3ZfbGRzdF9kYXRhcHRyX29mZnNldCA9IHNiaV9zY3JhdGNoX2FsbG9jX3R5cGVfb2Zm
c2V0KHZvaWQgKik7Cj4gKyAgICAgICBpZiAoIW1pc2FsaWduZWRfdl9sZHN0X2RhdGFwdHJfb2Zm
c2V0KQo+ICsgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VOT01FTTsKPiArCj4gKyAgICAgICBy
ZXR1cm4gMDsKPiArfQo+ICAjZWxzZQo+ICBpbnQgc2JpX21pc2FsaWduZWRfdl9sZF9lbXVsYXRv
cihpbnQgcmxlbiwgdW5pb24gc2JpX2xkc3RfZGF0YSAqb3V0X3ZhbCwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc2JpX3RyYXBfY29udGV4dCAqdGNudHgpCj4gQEAg
LTM0MSw0ICszOTIsOCBAQCBpbnQgc2JpX21pc2FsaWduZWRfdl9zdF9lbXVsYXRvcihpbnQgd2xl
biwgdW5pb24gc2JpX2xkc3RfZGF0YSBpbl92YWwsCj4gIHsKPiAgICAgICAgIHJldHVybiAwOwo+
ICB9Cj4gK2ludCBzYmlfbWlzYWxpZ25lZF92X2xkc3RfaW5pdCh2b2lkKQo+ICt7Cj4gKyAgICAg
ICByZXR1cm4gMDsKPiArfQo+ICAjZW5kaWYgLyogT1BFTlNCSV9DQ19TVVBQT1JUX1ZFQ1RPUiAq
Lwo+IC0tCj4gMi40My4wCj4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9vcGVuc2JpCg==
