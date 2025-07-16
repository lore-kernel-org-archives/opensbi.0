Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C0CC83F22
	for <opensbi@archiver.kernel.org>; Wed, 16 Jul 2025 23:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6b3DCTopPbXx+Ukn+6Fm9xT/dhH1ULrCbZZ/NdEJzz0=; b=D46Xl9jb1X65T/
	bBchLezYlUxurjKsIZSDhVCNkRx7YP8fSm608LalDijzKQqUTmY98jwtQ5r33pdgQaxtp6CG10fNQ
	GnnahakjGsVBpWw6kvq/yQ299IOM1iRlUfPglHzwt8FuKRIN9OVZxUfzv0KPni5qRS18G5MovxT8D
	f22HmIFLH2v1a4vG4c6TvycGS4CG9qYCNe+BvMKSXd2ue9OSAvbKYXOeSpE3UvLRPjyprgABfUciI
	Hsx1Esc++QSzLIRk/xT/+iTWeqZyfZxykIBMnU+jNCRTRlgQ4O6H65dLS/6uCO3O+mCpijnA5O5yb
	LDePLf+WLSCQtM+gzvYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucBNr-00000008qhC-07mC;
	Wed, 16 Jul 2025 23:17:55 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucBNp-00000008qgs-1MoF
	for opensbi@lists.infradead.org;
	Wed, 16 Jul 2025 23:17:54 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-55a27e6da1cso323493e87.3
        for <opensbi@lists.infradead.org>; Wed, 16 Jul 2025 16:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752707871; x=1753312671; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kRreFVOVNkToN4qLFhFJaAV/03l7V/9Q42yJNMzHDTw=;
        b=QmlbYFsXp3Sqeljrh4+FnBZY3dAHe7VN0DwJ43AjWc7ZmD9Y0hdZ+4nK6BcIgqym6T
         99SyUqJYe3Jb5xeQRWRHbWOAA3RyRXpmHyRQY3NwDMFSYXICecQbjt/BO336VNofVEOY
         coLFFBY4x6Coh/+51YQZS0TkRpfghOLPmPVWQzSgzEuajHQGKJYFZknc7SEwydRSa+0D
         YYE5iiCY0cZJSu2V8j0zBy3+oauW9fmNZBbv80rnMaLKkb4a7Z2/BmtIARYDdbhEqv6H
         XNhQxM+6syH7xd8dM7JhrePpBCf0dc8+aoK+E+8xSCmZX85aj8h5lzIRkkYm5ocfdzjU
         dWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752707871; x=1753312671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kRreFVOVNkToN4qLFhFJaAV/03l7V/9Q42yJNMzHDTw=;
        b=btNcWXzaj1s1ulZ14zlkZeLUHJ/VJpH0qugoIakuLcl1TegBEQHDycKW5fop007aJ4
         NnaHFqLiGUtE4am5ugUe4xUL0jE22VyNvbw186KnYTb2lFRcZuvrpNK5fQYh6V4eCXXV
         dC2PMU6BuJusj9sz9LYhEKj0Dl3jNRGevImqZnfJoxxcEmoftfL4OB+9ApenmGNswLcT
         HkLudQ8WB83LdUU/omWhq2FZo0FBlVK+RPLSTduYLRqHnXUqjxenr8NxL0FISAgyBZ43
         Bzv3K3q510Z2nWqpUBFh5gyemwflI8PTqhohwbs+y6rQGKXPzU/Hp+vFm0tGsFtX6Mh7
         6W4g==
X-Gm-Message-State: AOJu0Yxn0RmqXGVRhnVbVkobazdDWi7VDDhZDotPYzlrNMDcnj5Cu0dx
	jzRrG59VFzRDBJJ6fee5tIQzp6qA8kyRsCbgDeTumoDeI0FyMyzvF9fJBk/j+pFJ8+UWRKRwWAL
	mUe5G7k8vW086ON5vM0jcbz79L1MkAVY=
X-Gm-Gg: ASbGncs2EZaJhomsVQfuUmgudhHnNwAFbBoMEDSc6YmtEdws8Di0DwFb4fr8TPLsaRc
	x16sBswdNPd2O/GWTUfFIpDezVI6pD3dedk6msC4f/iTjfvpRwVk4V0o1StvTu3ZEpOd+4ZN5t2
	Xi88Q+lZx6qXPKdc+OdZGRS4q1p/QJOCqr13IDRoVulXcQMpG0Hqxh6XfoFjfitKdeQM8lxiMqd
	+fzfnO7
X-Google-Smtp-Source: AGHT+IGna7jxLUxN3bFfuPNHLBGR7aX3WJsmH8ylVBJF2bp0Cf3jnR0fmu0cMMD7yfbWRNJNHo35u3YS4MTpWwbWZgI=
X-Received: by 2002:a05:6512:3046:b0:553:3916:4e1c with SMTP id
 2adb3069b0e04-55a23edf53bmr1114095e87.2.1752707870538; Wed, 16 Jul 2025
 16:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250710231708.4553-1-cfu@mips.com> <06A6B90B-EB43-4CF9-8840-DE0DDB8210BD@jrtc27.com>
In-Reply-To: <06A6B90B-EB43-4CF9-8840-DE0DDB8210BD@jrtc27.com>
From: Chao-ying Fu <icebergfu@gmail.com>
Date: Wed, 16 Jul 2025 16:17:38 -0700
X-Gm-Features: Ac12FXxd3liNM2aXlzcYimPbH5Fk9Vg5NtR3y9b89K_6CVIx91_Qc-diTvCUtVs
Message-ID: <CAM1rFzFb9mTzs1_xCKMAa3WdmkvuL5jbUQdQkjQY4i6sRRHrVA@mail.gmail.com>
Subject: Re: [PATCH v1] generic: mips: support harts to boot from mips_warm_boot
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: opensbi@lists.infradead.org, Chao-ying Fu <cfu@mips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_161753_365149_1F38B04C 
X-CRM114-Status: GOOD (  16.26  )
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

T24gVGh1LCBKdWwgMTAsIDIwMjUgYXQgOTozNOKAr1BNIEplc3NpY2EgQ2xhcmtlIDxqcnRjMjdA
anJ0YzI3LmNvbT4gd3JvdGU6Cj4KPiBPbiAxMSBKdWwgMjAyNSwgYXQgMDA6MTcsIENoYW8teWlu
ZyBGdSA8aWNlYmVyZ2Z1QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gV2UgcHJvZ3JhbSByZXNl
dCBiYXNlIGZvciBoYXJ0cyAob3RoZXIgdGhhbiBoYXJ0IDApIHRvIGJvb3QgYXQKPiA+IG1pcHNf
d2FybV9ib290IHRoYXQganVtcHMgdG8gX3N0YXJ0X3dhcm0uIFRoaXMgaGVscHMgdG8gc2tpcCBz
b21lIGNvZGUKPiA+IHNlcXVlbmNlIHRvIHNwZWVkIHVwLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IENoYW8teWluZyBGdSA8Y2Z1QG1pcHMuY29tPgo+ID4gLS0tCj4gPiBwbGF0Zm9ybS9nZW5lcmlj
L21pcHMvcDg3MDAuYyB8IDE5ICsrKysrKysrKysrKysrKysrKysKPiA+IDEgZmlsZSBjaGFuZ2Vk
LCAxOSBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2dlbmVyaWMv
bWlwcy9wODcwMC5jIGIvcGxhdGZvcm0vZ2VuZXJpYy9taXBzL3A4NzAwLmMKPiA+IGluZGV4IDg4
OGE0NWMuLjY4NzkxMmEgMTAwNjQ0Cj4gPiAtLS0gYS9wbGF0Zm9ybS9nZW5lcmljL21pcHMvcDg3
MDAuYwo+ID4gKysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9taXBzL3A4NzAwLmMKPiA+IEBAIC0xNDAs
NiArMTQwLDIyIEBAIHN0YXRpYyB2b2lkIHBvd2VyX3VwX290aGVyX2NsdXN0ZXIodTMyIGhhcnRp
ZCkKPiA+IH0KPiA+ICNlbmRpZgo+ID4KPiA+ICtzdGF0aWMgdm9pZCBfX2F0dHJpYnV0ZV9fKChu
YWtlZCxub19pbnN0cnVtZW50X2Z1bmN0aW9uLGFsaWduZWQoNDA5NikpKQo+ID4gK21pcHNfd2Fy
bV9ib290KHZvaWQpCj4gPiArewo+ID4gKyAgX19hc21fXyBfX3ZvbGF0aWxlX18oCj4gPiArICIg
aiAxZlxuIgo+ID4gKyAiIC5hbGlnbiAyXG4iCj4gPiArICIgaiAxZlxuIgo+ID4gKyAiIC5hbGln
biAyXG4iCj4gPiArICIgaiAxZlxuIgo+ID4gKyAiIC5hbGlnbiAyXG4iCj4gPiArICIgaiAxZlxu
Igo+ID4gKyAiMTogbGxhIHQwLCBfc3RhcnRfd2FybVxuIgo+ID4gKyAiIGpyIHQwXG4iCj4gPiAr
ICk7Cj4gPiArfQo+Cj4gV2hhdCBpcyB0aGUgcG9pbnQgb2Ygd3JpdGluZyB0aGlzIGFzIGEgQyBm
dW5jdGlvbiBpZiBpdOKAmXMgZ29pbmcgdG8gYmUKPiBlbnRpcmVseSBhc3NlbWJseT8gSnVzdCB3
cml0ZSBhbiBhc3NlbWJseSBmdW5jdGlvbj8KCiAgTXkgaW50ZW50aW9uIGlzIHRvIGhhdmUgYSBt
aW5pbXVtIGNoYW5nZSwgYXMgdGhlcmUgaXMgb25seSBvbmUgZmlsZQptb2RpZmllZCBpbiB0aGUg
cGF0Y2guCkVpdGhlciB3cml0aW5nIGFzc2VtYmx5IGNvZGUgb3Igd3JpdGluZyBDIGNvZGUgZm9y
IG1pcHNfd2FybV9ib290IGlzCmZpbmUgb3IgZXF1aXZhbGVudC4KVG8gaGF2ZSBhc3NlbWJseSBj
b2RlLCB3ZSB3aWxsIG5lZWQgdG8gbW9kaWZ5IE1ha2VmaWxlIGFuZCBjcmVhdGUgYQpuZXcgYXNz
ZW1ibHkgZmlsZSBpbiB0aGUgcGF0Y2guCgogIFRoYW5rcyBhIGxvdCEKClJlZ2FyZHMsCkNoYW8t
eWluZwoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
