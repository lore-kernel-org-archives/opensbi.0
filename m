Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F9CC624A4
	for <opensbi@archiver.kernel.org>; Mon, 31 Aug 2026 15:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0vCC96hV0PIvUhK5tMYnjVu6+IGI36dsM84bv5QHRoM=; b=G9YyHhF2O4DgCG
	vKjGO51t52X6rFKLi1iHlXphgk4KVNHMtAFHTBxNkEghFj7hKKlL0f9cpS47JQhdvlVCR80AU9J1A
	gqj/+D1Wf+PPUjNgT1akJAZO9rItTwrAJ7GTXrcJQN6PkYcPQHiboL+0QUgJdvdHyhEW3+YLw7zbJ
	JxjrRidouKKLturfWbOZjh99vwK44pAmKGn1VkkxoX3CWT5vymDCAe7ssGkwFdn6vJIqFJpy0waif
	nzNKdGwyeQY0l/Z6ZX7YSYExozQjkamxtEKDpby5SJOE8IZPRaNIyVYgz/R1MmgbjJa6/0VcFMym+
	wJ19ieL1YUW25oM+PfnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14DA-00000009v1c-2NMK;
	Mon, 31 Aug 2026 15:46:16 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14D8-00000009v12-0afv
	for opensbi@lists.infradead.org;
	Mon, 31 Aug 2026 15:46:15 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-484374f54d0so1004798f8f.3
        for <opensbi@lists.infradead.org>; Mon, 31 Aug 2026 08:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788191172; cv=none;
        d=google.com; s=arc-20260327;
        b=SkDlAuwPCfRRLTs6Vf6rYyXPaGX+HH+kQKe74gGf+EHUyywF/UQ4qoN9GJvW/KbYQV
         Hi9Sjk3jNl6jtvihs5w608c4H2mHxVj+ZI3PMs8t9PkLvTkLELKQlFjoCp9636QaT03z
         NjB9N3jH2lN/AwNWBEJ77AeXQmfZo1bRIX29gj2gBDHuUM7WfNFNXC+BIn8xNoQu4OLF
         Pi7HVSCuO3ITmwSA62/+UgtP5w4xZ217hDu9UYf/GmCfHp/STCHZVumHi16tXmn5gT+R
         l0C0SEmmgyzbq30Z6Nz5lW6cKH1aa+8e8vRJE//ikJ3ZEbF4pbeYXYNW5eR+ls2Uov+8
         uyQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UkBSwcF21Ky9/ie3cObatluRVcKZlNsh46M1M3ElIPQ=;
        fh=7B6lXk3Menm4HP8Wwf3vxL6w+nHVGSzIuaBesQHVIOM=;
        b=POiQ/YGjMvwj4zb3DjIYfba3KT0nfDvVjB3eK2t4f6A1XowOaHpdTmqJ9V1C1vqHFA
         tcDBeL3ObvEQAofQtxekgT6NtniFJQJpThHkdrWVBWZ/e2XXwYTWYyvjl6cF/g/bW6hT
         8n1V52Icod225anK67T2ApMCuU6ChcEsiVBtmJsrKwNbt526GaWc4G2WXOecs/rzN44O
         Cd/yoCzkRP5bHxsUDcYyglAcoxUlZlWVSkEYCQyLo6PNmHYY34Bt8Y99KPy1nGOJ7MyD
         fzFzKntd5AxQOk8ay5cd7Sy2jIaHVNaLG23VT05jYwREvKYE8otCczQfbE+vwjmroyrB
         G0Qw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1788191172; x=1788795972; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UkBSwcF21Ky9/ie3cObatluRVcKZlNsh46M1M3ElIPQ=;
        b=NiEMin8Gfn6m1Zw/yV30DHEu+CLonjEJcVQLANIkBDXyoDHb3OJFZzq9jNf3ucCtDs
         zPZCV89eEakWO6GYqGEIBnuw2wyJI+kPBubRDvyzDSWzwUdVjLH84f1o5mK031i2U2Rg
         KuJGpUssfTqKNReorqzLP74x6o5QZUmTvASEiPcyta/HpPe8iphFZFRGfs1iEj7vPp1w
         Yw3Rql+/3t1Et/Xy3bi+yGc2JWIGsEOIJaLZ+/0NdI3cwZhX5FegdREndfBFDgdU9/D3
         KSdsPXO8BgQQyxBSGXlX6bSYLceaoT7x//y3pVtdIedEh2O3jvAdwV6si+SMiQVo3t5P
         pHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788191172; x=1788795972;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UkBSwcF21Ky9/ie3cObatluRVcKZlNsh46M1M3ElIPQ=;
        b=sa8HUoYQPh0O0yqbh5eHz9F01ephv8xNI5vbqNHptQLfMUEkxRaYuJu7AtH1anz9H0
         4OX0Dcxs7ISCJ4w/DQ6grOZakAE2zRiwrof7U7HM7h6ix8ApTGS3lSgRoJHyJ5CZhmWd
         9dsCxsJCffK+lT+ghxsRISnaaD5F7QsZRGOk0Rif3sOa1PhbKxTcuQTS/6u8CInXiEZU
         z9PJXxSFiHa2ghA1p5CqVbIzj6FKaQo8F3fysUjQ8NuDIs/VtfIoGnQBQqzyY1KjVxqg
         zsfQPuPfmb9dYC4BJV1c9oAXA7V1raX5C97tikHfqlcbqSvCQlcuArqGUiIuzUiFqem3
         PHrw==
X-Gm-Message-State: AFuF++l6DRO1HN8MlIh/TM5gdTKyh6Wg1z4SCyOJgM+u3CmgOiXziQ1L
	IbKaba8Ii2Vj/V3xybEYMgmEI/5EtjojD8f5H7GK42jBw7wH2suU7jPC3H355XtzAJZcp+XNiss
	o1Rb+GWv8Tldwtrn6/heJMv9jOuQ0yrT+fxBRskaj2w==
X-Gm-Gg: AYBFou0aykLkQAXgrbJ7oThemsanpnPjhSIX5QH2wF6t9KhJ+CYL5NVpUZMm/zLwKGi
	e+bb/1bn1nxupJfpQcJxqbRkjr170qXkh+NwBeGkBO6caiD4CwhRMpE8gfbiv0FimRoBso32Xpm
	6g6UxHwxgbxX30sYCdwWzB7nKIYi2L6hAt4F8jmvH6CSly230k+c0rJVAw9D+D1C6tO8/Z+rWmT
	hAMzP0il7932UkkZDUS4XEHcqWEeDymTairscM0Aj6eZENSwmT1126pvjmRNNzwN+i1qlgXV2FO
	x6vXahAHIwaUnMhbV81NzlbtAOEtEF2/DWaxBRKJq7oR8Cb56HxagqEnW6rqtUXA/XD06R11p2E
	QpaOGF7vt0phEh8md65wCf5AVPv4cFe4BCgXiaY6I/JYTSpRr86dHF/i1J0BGJmZ/
X-Received: by 2002:adf:e803:0:b0:484:3310:710f with SMTP id
 ffacd0b85a97d-4844103b6a0mr2802130f8f.27.1788191171944; Mon, 31 Aug 2026
 08:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260727183041.258377-1-david.garcia@aheadcomputing.com> <20260727183041.258377-3-david.garcia@aheadcomputing.com>
In-Reply-To: <20260727183041.258377-3-david.garcia@aheadcomputing.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 31 Aug 2026 21:16:00 +0530
X-Gm-Features: AcwNN1W5el6oWJLhDhwsJAzgu1xyoIey3Obe0JfxylXg0emXXccGib2N-Oiaghw
Message-ID: <CAAhSdy3QKFx_p-iudvGwTYjBkd9wC5w22bZz3GVYDKmoeA3W0g@mail.gmail.com>
Subject: Re: [PATCH 2/3] lib: sbi: dbtr: return SBI_ERR_BAD_RANGE for invalid
 trigger index range
To: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Cc: opensbi@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, 
	Himanshu Chauhan <hchauhan@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_084614_202847_422DDBD0 
X-CRM114-Status: GOOD (  14.04  )
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

T24gVHVlLCBKdWwgMjgsIDIwMjYgYXQgMTI6MDDigK9BTSBEYXZpZCBFLiBHYXJjaWEgUG9ycmFz
CjxkYXZpZC5nYXJjaWFAYWhlYWRjb21wdXRpbmcuY29tPiB3cm90ZToKPgo+IHNiaV9kYnRyX3Jl
YWRfdHJpZygpIHJldHVybnMgU0JJX0VSUl9JTlZBTElEX1BBUkFNIGZvciBhbiBvdXQtb2YtcmFu
Z2UKPiB0cmlnZ2VyIGluZGV4IHJhbmdlLCB3aGVyZSBTQkkgdjMuMCBzZWN0aW9uIDE5LjMgZGVm
aW5lcwo+IFNCSV9FUlJfQkFEX1JBTkdFLiBSZXR1cm4gU0JJX0VSUl9CQURfUkFOR0UsIG1hdGNo
aW5nIHRoZSBlcXVpdmFsZW50Cj4gcmFuZ2UgY2hlY2sgaW4gc2JpX2RidHJfdXBkYXRlX3RyaWco
KS4KPgo+IEZpeGVzOiAzMjQwMjE0MjNkMDYgKCJsaWI6IHNiaTogZGJ0cjogRml4IHVwZGF0ZV90
cmlnZ2VycyB0byBtYXRjaCBTQkkiKQo+IFNpZ25lZC1vZmYtYnk6IERhdmlkIEUuIEdhcmNpYSBQ
b3JyYXMgPGRhdmlkLmdhcmNpYUBhaGVhZGNvbXB1dGluZy5jb20+CgpMR1RNLgoKUmV2aWV3ZWQt
Ynk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMgcGF0Y2gg
dG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKPiAtLS0KPiAgbGliL3Ni
aS9zYmlfZGJ0ci5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9kYnRyLmMgYi9saWIvc2Jp
L3NiaV9kYnRyLmMKPiBpbmRleCBhMDRmMzY3ZC4uZDA2ZmNhZWIgMTAwNjQ0Cj4gLS0tIGEvbGli
L3NiaS9zYmlfZGJ0ci5jCj4gKysrIGIvbGliL3NiaS9zYmlfZGJ0ci5jCj4gQEAgLTY1MCw3ICs2
NTAsNyBAQCBpbnQgc2JpX2RidHJfcmVhZF90cmlnKHVuc2lnbmVkIGxvbmcgc21vZGUsCj4KPiAg
ICAgICAgIGlmICh0cmlnX2lkeF9iYXNlID49IGhzLT50b3RhbF90cmlncyB8fAo+ICAgICAgICAg
ICAgIHRyaWdfaWR4X2Jhc2UgKyB0cmlnX2NvdW50ID49IGhzLT50b3RhbF90cmlncykKPiAtICAg
ICAgICAgICAgICAgcmV0dXJuIFNCSV9FUlJfSU5WQUxJRF9QQVJBTTsKPiArICAgICAgICAgICAg
ICAgcmV0dXJuIFNCSV9FUlJfQkFEX1JBTkdFOwo+Cj4gICAgICAgICBpZiAoc2JpX2RidHJfc2ht
ZW1fZGlzYWJsZWQoaHMpKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VSUl9OT19TSE1F
TTsKPiAtLQo+IDIuNDMuMAo+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vb3BlbnNiaQo=
