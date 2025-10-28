Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CFBCCD1BF
	for <opensbi@archiver.kernel.org>; Tue, 28 Oct 2025 05:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A8LHnCRK7/fBJu6izq8qbRym4OABV+UV5ROzPH7CA4c=; b=nTdkAxul8MeIUA
	JXZ8RBs6Jts5oFQ2XR2xvfZoHGAIRrX0WsklhtmsuXuSYZl3sGxcOK8jBt/1Zw4PQfgAYbUhwRUK7
	00hC+2gYnuLHmyWKREOZCvJayg0HCTdnA73IIuUxizY/ld6KbbF9IsSFpFqjQ98Pc3ef00kygZYD2
	e8qDncJkTOFUb+NlmAoik20tETmfi718pxLwgR6sjFcMuWU7MC9iWQnmbkQiORxMlJSn9T4JtguCN
	3AucjIRU4GKCrAixX84DRGCFdBRPuTCYjjhTX7dN8RgjqvQVWyu9UzTofEZhUT8PbKXsXLatpO/Dr
	sK5nR3zfTP7zoCUCPo+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDboM-0000000FE58-15sg;
	Tue, 28 Oct 2025 04:59:58 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDboJ-0000000FE4l-0oTN
	for opensbi@lists.infradead.org;
	Tue, 28 Oct 2025 04:59:56 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-938bf212b72so234845839f.1
        for <opensbi@lists.infradead.org>; Mon, 27 Oct 2025 21:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1761627593; x=1762232393; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdPpNver165pi9lgP2Yy0WMY1RvdYBDI1LSGSLM23Sc=;
        b=d4QPNjQrNEAkvYAcYU0F+s6tU/dmtT1Tp91+XIg1lxptxuCuzNGpHHL10noN3JFr3D
         crub18D7EIoKHbZrAW4HCvab77P0Y2MG4szfJZTM3xsM7VHuJeHXPOZkx8fzLu0Srmfr
         /B+TljdPpAph5X9FtTREmamh7hxRR4Ll5qQYhIXxrQdrDFRbPHX3m5CokpFfJMad8beB
         4orEthqtpdTtODct04uLFsc6U+2mmwlzqz9jGEz/F175lxdseI/qmsSIeBwBCeo6PnJn
         tRSj3DL+AB/PiLgKs6n8NoW+9vqqKUpRjjENQToi0pjjde0o/9SHx+Djyc/83iDXZln8
         bLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761627593; x=1762232393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OdPpNver165pi9lgP2Yy0WMY1RvdYBDI1LSGSLM23Sc=;
        b=l/RsSN6scSTWu4VF0ndWrtN0ttwjahMQ1BTEJCM69pH+Vpx+LkrOG8bZY8XzVb6J0n
         NNtpOk2CZFhewIuQlWMAa4kBQrLM/CD2S87fBu5yHArhev6HdUo06c735cY+mHRCc4N+
         AWtA7+ZL6jFb3oPU+sx7gymj80t9TUEbtI0H3QxFRVXYRWPiuzdzPan1Ef6338TzxV9y
         ul+Q9tQ6EHw0THIQ6zLB4ghttnWg5SflLvbaRbe8LhT+BuIuut3hbuAVvVHYuk5XQbcl
         Isu4lg+bkJPL+YGTG+9e16QnPoMntIqC585ftN3gtItgER/SY/YCElCMoD8OY2wo6TPW
         BJaQ==
X-Gm-Message-State: AOJu0YxrDmo4aE0i3+YT7GcBNn96HTWuTzqzqLBlnI6OTp1XDPQqNQiB
	HzgZPAhaJOF+/Hs01RaNrVyDbXOB17A2eD/mJAc8JVAU+L9AuncjauX4QQMFvOFCvnBR0HUjhRU
	wZXRi8DUwYYSILyXl1+dQ0uCdPFD2mjpeXbHtzVNT96a5x6ida58TV6xdHw==
X-Gm-Gg: ASbGncsnrHB+VFEKJp3IgFO1+deQIA4juMkniMye7fGr/gU2Hp8SUBAUnZgkHuvn/7U
	o3qhoAC9WztIuuqnsjJKsE4Bw+CUbS5z43XknTrxyvIBfgejb1H45gHV3B0i03nup6qL1/jIFrp
	z1ePsCADHLN1TbT5tIL6bHJ7GDXHztJELJAae5KUg1XRDD8xWrxeTZu75ARAzdAzT4RzMqK+2s1
	5k0V/ABE2OqWltAj1CTNhFJcdY6KsjFqEnNmR0EOeGtKwMU5S6gNlPoQzJX4sCUoSer8V32b2PU
	4corgO/j/rfsCqLDRg==
X-Google-Smtp-Source: AGHT+IHsEm4iUHsrP1jAvF+AqnwEnkK0Fj9pCKe/KMozGftm5e8qO5GhfVTURCjJMvLZ85AS+mva0T2aE5UHQ746SrY=
X-Received: by 2002:a05:6e02:33a1:b0:430:aedb:3719 with SMTP id
 e9e14a558f8ab-4320f6a7730mr38579395ab.4.1761627593412; Mon, 27 Oct 2025
 21:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <20251020-cache-upstream-v7-0-69a132447d8a@sifive.com> <20251020-cache-upstream-v7-8-69a132447d8a@sifive.com>
In-Reply-To: <20251020-cache-upstream-v7-8-69a132447d8a@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 28 Oct 2025 10:29:42 +0530
X-Gm-Features: AWmQ_blb51BE1SU47ypK1m8F_0EzmQnsf3lyMWH05bDgXh2jHk8lTPo99ppHIN8
Message-ID: <CAAhSdy0yzzf=_bEdj4ob9mBwvvFGhgqvcX14JBBSV=a=W9CBjw@mail.gmail.com>
Subject: Re: [PATCH v7 08/12] lib: sbi: Extends sbi_ipi_raw_send() to use all
 available IPI devices
To: Nick Hu <nick.hu@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_215955_471498_A42732D3 
X-CRM114-Status: GOOD (  19.47  )
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

T24gTW9uLCBPY3QgMjAsIDIwMjUgYXQgMTE6NTfigK9BTSBOaWNrIEh1IDxuaWNrLmh1QHNpZml2
ZS5jb20+IHdyb3RlOgo+Cj4gQSBwbGF0Zm9ybSBtYXkgY29udGFpbiBtdWx0aXBsZSBJUEkgZGV2
aWNlcy4gSW4gY2VydGFpbiB1c2UgY2FzZXMsCj4gc3VjaCBhcyBwb3dlciBtYW5hZ2VtZW50LCBp
dCBtYXkgYmUgbmVjZXNzYXJ5IHRvIHNlbmQgYW4gSVBJIHRocm91Z2ggYQo+IHNwZWNpZmljIGRl
dmljZSB0byB3YWtlIHVwIGEgQ1BVLiBGb3IgZXhhbXBsZSwgaWYgYW4gSU1TSUMgaXMgcG93ZXJl
ZAo+IGRvd24gYW5kIHJlc2V0LCB0aGUgY29yZSBjYW5ub3QgcmVjZWl2ZSBJUElzIGZyb20gaXQs
IHNvIHRoZSB3YWtlLXVwIG11c3QKPiBpbnN0ZWFkIGJlIHRyaWdnZXJlZCB0aHJvdWdoIHRoZSBD
TElOVC4KPgo+IFN1Z2dlc3RlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4K
PiBTaWduZWQtb2ZmLWJ5OiBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+CgpMR1RNLgoKUmV2
aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVw
Cgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9zYmlfaXBpLmggICAgICAgICAgfCAgMiArLQo+ICBsaWIv
c2JpL3NiaV9oc20uYyAgICAgICAgICAgICAgfCAgMiArLQo+ICBsaWIvc2JpL3NiaV9pcGkuYyAg
ICAgICAgICAgICAgfCAxNiArKysrKysrKysrKysrLS0tCj4gIHBsYXRmb3JtL2dlbmVyaWMvYW5k
ZXMvYWUzNTAuYyB8ICAyICstCj4gIDQgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwg
NiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9zYmlfaXBpLmggYi9p
bmNsdWRlL3NiaS9zYmlfaXBpLmgKPiBpbmRleCAyNmQxYjY2YjdjZmZmYmFhNmY3Y2FkZDBmYWI4
YzgxMGFkZmIxODExLi4yYzIzMTA0MTY2MmJmYjU1YjJmOTYyY2E0OGQ3MjRjZjZhYTUzZjZkIDEw
MDY0NAo+IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV9pcGkuaAo+ICsrKyBiL2luY2x1ZGUvc2JpL3Ni
aV9pcGkuaAo+IEBAIC04OCw3ICs4OCw3IEBAIGludCBzYmlfaXBpX3NlbmRfaGFsdCh1bG9uZyBo
bWFzaywgdWxvbmcgaGJhc2UpOwo+Cj4gIHZvaWQgc2JpX2lwaV9wcm9jZXNzKHZvaWQpOwo+Cj4g
LWludCBzYmlfaXBpX3Jhd19zZW5kKHUzMiBoYXJ0aW5kZXgpOwo+ICtpbnQgc2JpX2lwaV9yYXdf
c2VuZCh1MzIgaGFydGluZGV4LCBib29sIGFsbF9kZXZpY2VzKTsKPgo+ICB2b2lkIHNiaV9pcGlf
cmF3X2NsZWFyKGJvb2wgYWxsX2RldmljZXMpOwo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2Jp
X2hzbS5jIGIvbGliL3NiaS9zYmlfaHNtLmMKPiBpbmRleCBiYjI3NGIzM2Q2ZWU1ZTNkYjk5NTNm
NGI1OTE1MDJlNDUyMmQ5OWQxLi4wZDk3YjQzZTBjZDhmN2I0ZmM5NzQwN2VmMDEwMDc0ODVlM2Y1
YTI0IDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2hzbS5jCj4gKysrIGIvbGliL3NiaS9zYmlf
aHNtLmMKPiBAQCAtMzY0LDcgKzM2NCw3IEBAIGludCBzYmlfaHNtX2hhcnRfc3RhcnQoc3RydWN0
IHNiaV9zY3JhdGNoICpzY3JhdGNoLAo+ICAgICAgICAgICAgKGhzbV9kZXZpY2VfaGFzX2hhcnRf
c2Vjb25kYXJ5X2Jvb3QoKSAmJiAhaW5pdF9jb3VudCkpIHsKPiAgICAgICAgICAgICAgICAgcmMg
PSBoc21fZGV2aWNlX2hhcnRfc3RhcnQoaGFydGlkLCBzY3JhdGNoLT53YXJtYm9vdF9hZGRyKTsK
PiAgICAgICAgIH0gZWxzZSB7Cj4gLSAgICAgICAgICAgICAgIHJjID0gc2JpX2lwaV9yYXdfc2Vu
ZChoYXJ0aW5kZXgpOwo+ICsgICAgICAgICAgICAgICByYyA9IHNiaV9pcGlfcmF3X3NlbmQoaGFy
dGluZGV4LCB0cnVlKTsKPiAgICAgICAgIH0KPgo+ICAgICAgICAgaWYgKCFyYykKPiBkaWZmIC0t
Z2l0IGEvbGliL3NiaS9zYmlfaXBpLmMgYi9saWIvc2JpL3NiaV9pcGkuYwo+IGluZGV4IGVkOWNj
ZmZiNmM5NmNkZmExMTUxYTIyZDA3YzJiZmM4MTgxNzY5YmQuLjViMmQyZjcyZWViOTE4YTg4Nzdi
NGI4ZmJmMjAxZjJiOTYyOGYwNjkgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfaXBpLmMKPiAr
KysgYi9saWIvc2JpL3NiaV9pcGkuYwo+IEBAIC04OCw3ICs4OCw3IEBAIHN0YXRpYyBpbnQgc2Jp
X2lwaV9zZW5kKHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCwgdTMyIHJlbW90ZV9oYXJ0aW5k
ZXgsCj4gICAgICAgICAgKi8KPiAgICAgICAgIGlmICghX19hdG9taWNfZmV0Y2hfb3IoJmlwaV9k
YXRhLT5pcGlfdHlwZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJJVChldmVu
dCksIF9fQVRPTUlDX1JFTEFYRUQpKQo+IC0gICAgICAgICAgICAgICByZXQgPSBzYmlfaXBpX3Jh
d19zZW5kKHJlbW90ZV9oYXJ0aW5kZXgpOwo+ICsgICAgICAgICAgICAgICByZXQgPSBzYmlfaXBp
X3Jhd19zZW5kKHJlbW90ZV9oYXJ0aW5kZXgsIGZhbHNlKTsKPgo+ICAgICAgICAgc2JpX3BtdV9j
dHJfaW5jcl9mdyhTQklfUE1VX0ZXX0lQSV9TRU5UKTsKPgo+IEBAIC0yNzEsOCArMjcxLDEwIEBA
IHZvaWQgc2JpX2lwaV9wcm9jZXNzKHZvaWQpCj4gICAgICAgICB9Cj4gIH0KPgo+IC1pbnQgc2Jp
X2lwaV9yYXdfc2VuZCh1MzIgaGFydGluZGV4KQo+ICtpbnQgc2JpX2lwaV9yYXdfc2VuZCh1MzIg
aGFydGluZGV4LCBib29sIGFsbF9kZXZpY2VzKQo+ICB7Cj4gKyAgICAgICBzdHJ1Y3Qgc2JpX2lw
aV9kZXZpY2Vfbm9kZSAqZW50cnk7Cj4gKwo+ICAgICAgICAgaWYgKCFpcGlfZGV2IHx8ICFpcGlf
ZGV2LT5pcGlfc2VuZCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FSU5WQUw7Cj4KPiBA
QCAtMjg3LDcgKzI4OSwxNSBAQCBpbnQgc2JpX2lwaV9yYXdfc2VuZCh1MzIgaGFydGluZGV4KQo+
ICAgICAgICAgICovCj4gICAgICAgICB3bWIoKTsKPgo+IC0gICAgICAgaXBpX2Rldi0+aXBpX3Nl
bmQoaGFydGluZGV4KTsKPiArICAgICAgIGlmIChhbGxfZGV2aWNlcykgewo+ICsgICAgICAgICAg
ICAgICBzYmlfbGlzdF9mb3JfZWFjaF9lbnRyeShlbnRyeSwgJmlwaV9kZXZfbm9kZV9saXN0LCBo
ZWFkKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKGVudHJ5LT5kZXYtPmlwaV9zZW5k
KQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW50cnktPmRldi0+aXBpX3NlbmQo
aGFydGluZGV4KTsKPiArICAgICAgICAgICAgICAgfQo+ICsgICAgICAgfSBlbHNlIHsKPiArICAg
ICAgICAgICAgICAgaXBpX2Rldi0+aXBpX3NlbmQoaGFydGluZGV4KTsKPiArICAgICAgIH0KPiAr
Cj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+Cj4gZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2dlbmVy
aWMvYW5kZXMvYWUzNTAuYyBiL3BsYXRmb3JtL2dlbmVyaWMvYW5kZXMvYWUzNTAuYwo+IGluZGV4
IGYwNmUyMDdkODBmNTg3MDMwOThlZjgwNWExNGUxZjg3NjRjMmNiMTYuLjA4MDgwNjU3NDVhZjIx
ZjVkNjVmMDExNGNhMzNhMjM5NDkyODAyOTYgMTAwNjQ0Cj4gLS0tIGEvcGxhdGZvcm0vZ2VuZXJp
Yy9hbmRlcy9hZTM1MC5jCj4gKysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9hbmRlcy9hZTM1MC5jCj4g
QEAgLTM1LDcgKzM1LDcgQEAgc3RhdGljIGludCBhZTM1MF9oYXJ0X3N0YXJ0KHUzMiBoYXJ0aWQs
IHVsb25nIHNhZGRyKQo+ICAgICAgICAgICogMikgdGhlIHRhcmdldCBoYXJ0IGlzIG5vbi1zbGVl
cGFibGUgMjUtc2VyaWVzIGhhcnQwCj4gICAgICAgICAgKi8KPiAgICAgICAgIGlmICghc2JpX2lu
aXRfY291bnQoaGFydGluZGV4KSB8fCAoaXNfYW5kZXMoMjUpICYmIGhhcnRpZCA9PSAwKSkKPiAt
ICAgICAgICAgICAgICAgcmV0dXJuIHNiaV9pcGlfcmF3X3NlbmQoaGFydGluZGV4KTsKPiArICAg
ICAgICAgICAgICAgcmV0dXJuIHNiaV9pcGlfcmF3X3NlbmQoaGFydGluZGV4LCBmYWxzZSk7Cj4K
PiAgICAgICAgIC8qIFdyaXRlIHdha2V1cCBjb21tYW5kIHRvIHRoZSBzbGVlcCBoYXJ0ICovCj4g
ICAgICAgICBzbXVfc2V0X2NvbW1hbmQoJnNtdSwgV0FLRVVQX0NNRCwgaGFydGlkKTsKPgo+IC0t
Cj4gMi4zNC4xCj4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVu
c2JpCg==
