Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24CEC54F32
	for <opensbi@archiver.kernel.org>; Fri, 23 May 2025 09:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xEgXwdHAPf7v6zqekuYcvAtEK6t/qZITBCxUhPZpx9w=; b=JW7KJL75MJ0SouZ0VstzCZQEOF
	chAzQnOpeMyrwD/ruGQXz+QBVsGvtZXVjoacrIkAC2PshoxjeJXrTjbxHCAr5Wkbsi7F7XTWlmdOu
	ZcXT8yBeAOAoo+D6nwTRR3ffpwcW459iAJrSTFDvFtYvoXB8VQy9pGzQjV9kq186umtRgW6mEYpS7
	mox/QVNZjUToDkDt1nZY1d2M6+hELKNKXfrj7s2nB/VHBplz9MYS9FcktVYcy1yuF4w34kR5Rt5aC
	6VGBz6dnJec2PgNQMLq0szpCDGUyeodJwNlaIPQLDIeeavCoqDV5hnDZWkj+l0j6cj212b1/k42Vz
	bWhwFpXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIOtV-00000003SgC-3q6w;
	Fri, 23 May 2025 09:40:49 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIOrN-00000003SLI-2YBh
	for opensbi@lists.infradead.org;
	Fri, 23 May 2025 09:38:38 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-72bd5f25ea6so2438346a34.1
        for <opensbi@lists.infradead.org>; Fri, 23 May 2025 02:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747993113; x=1748597913; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7OH15xkVXX1YWXZ2f61buU8Fj/3RA4X3rQCGV3eFWo=;
        b=MJNoLdb59PgY4YwxE4tfChsDnFFvH4PXkKKiQcQMPql0tYTGv4Ye8wSw7YB8Vg7wmr
         URnpWaHrv/KCJAZFFvFz1ARX8+MpWWnmHMYin54GSasoqWLqNBukMzCm1XMS4tWHOlf4
         HYCRiNfZ3CmWbC//mJR2dksj0fOtyYxUXBc76eH9Yo14haiqlB7fWoSP4TfMqPjXinTO
         XFfiENED/niogowte+/qokdFtgcbiD8WeTuTDE73Dd5YqlmcJLF20kY/t8xscT2xOLhS
         sEzSBWY4xmF8hNLw7yo/r8kO0KNyFn5YUHdF2hXteHh7Ih6pc1qA7g06uXimdovcXTww
         gt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747993113; x=1748597913;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7OH15xkVXX1YWXZ2f61buU8Fj/3RA4X3rQCGV3eFWo=;
        b=fvgGKiEYbSPGqdpZ2Syy/y/hnmDAC4v89gs4z8V91dtr3oMBjZlAN8QbtvS6z0qdOX
         chADxVPlD7GDCdpCFNomseQheOPdFog3S20esonKwxZNcuZw36gRHSyYFpgY0as9QKHU
         rPrUXsyi3LVR4TpdaqfklnKfmTQnL1996M0JYKbMWiTUaOUz82sy4MAJYOYNFm8dOdHL
         TkBWN5u4YASEQp+wSIZfVdy/11YnUzOOFcXU0v8z8fkEVd0I0d5JvQhR32dovBe4KzvQ
         4LJZiQKkjho5lHbqG9Mq5Hvt8vjb0ktmQBfPVzcOFMxA34r4suwvoRAyLkiZGaGUzO7N
         sgwg==
X-Gm-Message-State: AOJu0YzyoPEYIvchAKzzKh565WuOyMwZmA/0t6JgDEPo4VgwiiF2dYxY
	GW3t6kHWrlXnJKQe10YZdTG2epLfs1++LES5E6gLf4bW5nL0KvIS6xlnmYM6ATEugQ3TpO/QaMb
	YzxZIMapgLgt+B79/TaVBTDLzNdLRdQuifum2JLhqXHVrfe5iIBlb/eOVew==
X-Gm-Gg: ASbGncs/Y4dirSvixI6JRxArrcBI/6n7R592f7xVMXuxde852ETcl7+MhmPjNY2lP/g
	2j43muDJI7UgXvdDn37777zBLSLei4VOkj9Xj05Z63639D2t+9wpG/0Xswlee8IQR2Lhe2D9N1d
	6EJH7dakPIjIk6MMw48Ov1+QutScyncrjzdoxASnnnJK1m7g==
X-Google-Smtp-Source: AGHT+IENGvNjQpFINv59p7CNsQdrv+FzUVjTPoJFpvt8k0nYRflOS+X8xkqWy77KYsYI4oRsfI9kvJOAG5NChgGzX54=
X-Received: by 2002:a05:6830:6205:b0:72b:a196:5221 with SMTP id
 46e09a7af769-734f987f276mr22319836a34.8.1747993113481; Fri, 23 May 2025
 02:38:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250507074620.3162747-1-wangziang.ok@bytedance.com>
In-Reply-To: <20250507074620.3162747-1-wangziang.ok@bytedance.com>
From: Ziang Wang <wangziang.ok@bytedance.com>
Date: Fri, 23 May 2025 17:38:21 +0800
X-Gm-Features: AX0GCFui_E6T1hHQQkh7iUHi3uML2OFivGwXc064udI1SJ7-NXP7n8Bo9fx4gjE
Message-ID: <CAEeO-uWiv5pPLd_aZ2Pp_k8_XnOc3JBACV3MTMA0zTqDQJb5rA@mail.gmail.com>
Subject: Re: [PATCH] lib: utils: hsm: Do not fail on EALREADY in rpmi-hsm fixup.
To: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_023837_664642_C0508E08 
X-CRM114-Status: GOOD (  15.26  )
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

SGksCgpBbnkgZmVlZGJhY2sgb24gdGhpcz8KCk9uIFdlZCwgTWF5IDcsIDIwMjUgYXQgMzo0NuKA
r1BNIFppYW5nIFdhbmcgPHdhbmd6aWFuZy5va0BieXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IElu
IGNhc2UgaGFydHMgYXJlIGRpdmlkZWQgaW50byBncm91cHMgdGhhdCB1c2UgZGlmZmVyZW50Cj4g
cnBtaS1oc20gY2hhbm5lbHMgaW4gZGlmZmVyZW50IG1haWxib3hlcywgdGhlIHN1c3BlbmQKPiBz
dGF0ZSBmaXh1cCBmdW5jdGlvbiB3aWxsIHJldHVybiBFQUxSRUFEWSBvbiBzZWNvbmRhcnkKPiBl
bnRyeSwgc2ltcGx5IHNraXAgb24gdGhpcyBlcnJvci4KPgo+IFNpZ25lZC1vZmYtYnk6IFppYW5n
IFdhbmcgPHdhbmd6aWFuZy5va0BieXRlZGFuY2UuY29tPgo+IC0tLQo+ICBsaWIvdXRpbHMvaHNt
L2ZkdF9oc21fcnBtaS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9saWIvdXRpbHMvaHNtL2ZkdF9oc21fcnBt
aS5jIGIvbGliL3V0aWxzL2hzbS9mZHRfaHNtX3JwbWkuYwo+IGluZGV4IGNjNzg0MzYuLjA5ZDBj
OTEgMTAwNjQ0Cj4gLS0tIGEvbGliL3V0aWxzL2hzbS9mZHRfaHNtX3JwbWkuYwo+ICsrKyBiL2xp
Yi91dGlscy9oc20vZmR0X2hzbV9ycG1pLmMKPiBAQCAtMzMwLDcgKzMzMCw3IEBAIHNraXBfc3Vz
cGVuZF9zdGF0ZXM6Cj4KPiAgICAgICAgIC8qIFJlZ2lzdGVyIEhTTSBmaXh1cCBjYWxsYmFjayAq
Lwo+ICAgICAgICAgcmMgPSBmZHRfcmVnaXN0ZXJfZ2VuZXJhbF9maXh1cCgmcnBtaV9oc21fZml4
dXApOwo+IC0gICAgICAgaWYgKHJjKQo+ICsgICAgICAgaWYgKHJjICYmIHJjICE9IFNCSV9FQUxS
RUFEWSkKPiAgICAgICAgICAgICAgICAgZ290byBmYWlsX2ZyZWVfc3VzcF9zdGF0ZV9uYW1lczsK
Pgo+ICAgICAgICAgLyogUmVnaXN0ZXIgSFNNIGRldmljZSAqLwo+IC0tCj4gMi4zOS41Cj4KCi0t
IApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
