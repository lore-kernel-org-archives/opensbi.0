Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42BCC54F52
	for <opensbi@archiver.kernel.org>; Wed, 29 Jul 2026 02:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5CtNNitsWZec9H+moI8M77kQ3Rvu9yvRsCo2HRqWiYA=; b=QzcEiG8mh/thcL
	z/4VLB2EcUjh01H4zrEqBUFiEMg8RL0do9XUAPFpRuinWQqjQ21+AJQV8/iQaATNkyMBC4B/oqF77
	rS6aSQ4AaM5TOjwZTQk9KHy/BtoCuBaduIqb9S7lF0SV1AMmcLuzEjObahxdsulRJ2h0/Sv6e3eOK
	2A7TaqyS3ZSm+9WXuIGGXewE06l+ixo0R1RglgRD+nyVShqPEmiZbsCbJYpYDM+/ysvrMhJ57WK1b
	n4b3ymO2AapMeW+VVVg8tn7JWWBj34svb4EVvUOKUiji9o0H0gV+Uli1hKrkA7YkeVXUCTr6SGdRN
	CwpNfIyes14xL+wCmCuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wouBE-00000006iWl-1HmX;
	Wed, 29 Jul 2026 02:38:00 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wouB9-00000006iWM-41xx
	for opensbi@lists.infradead.org;
	Wed, 29 Jul 2026 02:37:57 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-80cebd41372so7649057b3.3
        for <opensbi@lists.infradead.org>; Tue, 28 Jul 2026 19:37:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785292674; cv=none;
        d=google.com; s=arc-20260327;
        b=hbXYlEvV97X5EC5am24joqpmFacD+/9L5DcIz6kGO3CcPyHC2BeeSnYfbg08MQl6t/
         PV5nNzLQN8gmVL2AZTjNpbNCPGCXDs8BzNfjBMV1Qa9UkshynJhELBTkwMt6rtOQPLpi
         A01ymRI89nHELyiZ+bfKhJ5zoU/z1+xwonRev9ZrVAEJh+jSNTmhXruf51tA2CT1udwP
         4u/L87Bh39WdY1QHkv/CjScfXDhxkbmsTWDbrCfBaJPMHnrtzyUpa/b9w1Vpv9HKgkdf
         /w+3FIBqlbw37SdUaLOW6hpXMYn3wFj+OtDLS/kfWo2ARhVy8WHHirF4vttARJJZPA87
         4t0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ldDR1GlYqYpkOYbhLp4L6/s6FSjMIXBhq+7V6bdUGyQ=;
        fh=h4QzidvVbSzQid2HmKaNkPk78WtLj7A6fXWqi/uRbVU=;
        b=YxKfE3OmHK8kZmuysWPvd8CDHCRznyPgHlS/rIMlQ6cIrM0M96DQ2LkCzRE3W6qjZj
         jr604gcvLnKWAzNNnsrLOl4PqmZAt+oF6sCkm3SwmeR+XoTG+GEzWxLKJLqlv5k+O8aJ
         fEcUAOkiEaefngwIJ5qRMkhe/ei0zC0TtUHTkXyp3RXUfaC27DmUSkInqtj+NhukcnSv
         WiTOUYYhwEEo5YTvHVV8ePj6qs63IPvGqL2JggSTehyCV0y0F/Id3H8It9Z8kSf6mEmn
         DcB+L4v9XgijyEbZxn2SjNeJfow0OJpx7uuKXU6rT/mXgTLAkdsEDK2xkMwgZvWaIyAq
         d3oA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=summations-net.20251104.gappssmtp.com; s=20251104; t=1785292674; x=1785897474; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ldDR1GlYqYpkOYbhLp4L6/s6FSjMIXBhq+7V6bdUGyQ=;
        b=fHxjmgUXXXvWQdkwB1cUuX5OcJWRExgp17v+wMWHzQccqDqMD93q2j22fO95A/8iNT
         eoNw3QWD8ifTjBVPZpYEEaWsNG20P9pPxgnO9Q5fjjLmTbNMi+tidNEkJli3wFUp5n3Z
         voq/Dv1cM9LpZBGv3RtxNzH6ABkL8KIVs37s3Juz8HmwfIHCNa+44tcP30fm1EZd8AQb
         JaZvQYQxJ2jYc4ynrYgeHgzmX2jjNQMOHLBI6+MO/BOwOagUKzmeEpOiwtG5HDIG9Lgw
         AEVzIgiB88lcC1viTD3+r4/M9tmxKjkk6XmAPyIcodxcA+WZ2BT10dOtXIoTpm++a253
         IOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785292674; x=1785897474;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ldDR1GlYqYpkOYbhLp4L6/s6FSjMIXBhq+7V6bdUGyQ=;
        b=JoVIgTRl2eQEwZWmoAT7kCXopd4+BaXyMviLTIo1l1pc8dEJO8xgMMOKtliBZajkIb
         pglsnORGDu2+MuxH98KZKXoYCirPp1avRjjDPAqCaMRp9maGlyqcWTlngJvtIcZd+3WW
         7HbZB2w9eBJZ+lEBWosXw6paN93lVl4Jjf/RKdgLOf+djSiT4APoD0U2OZa1FGkr9YSp
         R5uy1aCvCczFJ04sd6MkgOJDb/6qzie7hR+i9HhqqWvocFA/x7CB1J7rXygsFPOSIcrV
         sApYOfbXizUI9FNCwp4bB4uR4tGmTxPEHs1C38k2wC1N4zWCBDWaSOLYbfWRNn/PGjcM
         PceQ==
X-Forwarded-Encrypted: i=1; AHgh+RprcuVs8mOcV/mZf1H87lwp3AdVE4EsCatApLGojQP3su+L1upj/ICWipRAMW+sL4LfAtjrf0fr@lists.infradead.org
X-Gm-Message-State: AOJu0YwMQpVV+kh7itOW8JYBgVSY+Z3eeCl1Hdd422MHYZyek0R90OF+
	sZDm8r1o33a7H0LRALTIL3dHTvM8P85cYK9VN9xihHJxglTiL3A8/DOvYAQwvwr0MkGoWtr/lFz
	6eHzj9MhmTh0tHGX5Q6YURCyb/G62rEX7gKBhT80deA0=
X-Gm-Gg: AR+sD13p/+n4XZu6u6gk7SfQtqZJucucCUzONXCDtZ2zMCytUgHmkPLCDo8A0CndGtk
	spKDs2d0oD3/lmMJ2m/MM+7Rif9JEUqJYy2jweOcyoiEycPdCWqm1t3E8V7dsoFo1iLphdkCkZr
	aqU89qMst5EKHY+mGaxu1/sUChY7wtuYlUALjC9uZ1AsjGfuvk+CGhxwex6Xgw7BXAMs++oGPcV
	ex4E25kH+isC/pMYsQ2K1F1p/RsUF+MN/wZGYECauCh3vNbbJ3L/N9QoVA75D4ovpz2ewNejtdr
	7PSvR/2aqcC9BDcp3bPh2WUpMNsgw43YuBG3eZf+yG0inxAAaqhSIEiMXpo4uKZRUBVdqFYYOIT
	1cw==
X-Received: by 2002:a05:690c:7205:b0:80c:85c6:898f with SMTP id
 00721157ae682-81f99260de1mr22288077b3.62.1785292674099; Tue, 28 Jul 2026
 19:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260727135605.465309-1-rahul.pathak@oss.qualcomm.com>
 <20260727135605.465309-4-rahul.pathak@oss.qualcomm.com> <CAAVgOk+rvAbyKAApWub-3KrCNVjcMb8ggaS_bTwGdN_aTPMk1g@mail.gmail.com>
In-Reply-To: <CAAVgOk+rvAbyKAApWub-3KrCNVjcMb8ggaS_bTwGdN_aTPMk1g@mail.gmail.com>
From: Rahul Pathak <rahul@summations.net>
Date: Wed, 29 Jul 2026 08:07:43 +0530
X-Gm-Features: AUfX_mwbzvw4N9IdRZPoTolxsexb5ybCvYJEIrWyUu7WIBO_C4tk13IT6dBFeSM
Message-ID: <CABdD5xmqy1NMHg=gDNCvJiJA0YFp8SaD=ukMEMHAFN7TyUvXhw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/5] platform/generic: Initialise MPT at boot
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: Rahul Pathak <rahul.pathak@oss.qualcomm.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_193756_262813_A88D5230 
X-CRM114-Status: GOOD (  18.58  )
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

T24gVHVlLCBKdWwgMjgsIDIwMjYgYXQgMTE6MzDigK9QTSBQYXdhbmRlZXAgT3phCjxwYXdhbmRl
ZXAub3phQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdWwgMjcsIDIwMjYg
YXQgNjo1NuKAr0FNIFJhaHVsIFBhdGhhawo+IDxyYWh1bC5wYXRoYWtAb3NzLnF1YWxjb21tLmNv
bT4gd3JvdGU6Cj4gPgo+ID4gSW50ZWdyYXRlcyBNUFQgaW5pdGlhbGlzYXRpb24gaW50byB0aGUg
Z2VuZXJpYyBwbGF0Zm9ybSBib290IGZsb3cuCj4gPgo+ID4gbXB0X2Vhcmx5X2luaXQoKSBwcm9i
ZXMgZm9yIFNNTVBUIGR1cmluZyBjb2xkLWJvb3QgZWFybHkgaW5pdCBhbmQKPiA+IGluaXRpYWxp
c2VzIHRoZSBzdHJ1Y3R1cmVzIHJlcXVpcmVkIHRvIGJ1aWxkIE1QVCB0YWJsZXMuCj4gPgo+ID4g
bXB0X2ZpbmFsX2luaXQoKSBjcmVhdGVzIHRoZSByb290IHN1cGVydmlzb3IgZG9tYWluIHdoaWNo
IGlzIG1hcHBpbmcgYWxsCj4gPiBwaHlzaWNhbCBtZW1vcnkgd2l0aCB0aGUgZmlybXdhcmUgcmVn
aW9uIGV4cGxjaXRseSBkZW5pZWQgdG8gUy1tb2RlIGFuZAo+ID4gYWRkcyBzdXBwb3J0IGZvciBh
biBNUFQgZG9tYWluIGZvciBlYWNoIGFkZGl0aW9uYWwgcmVnaXN0ZXJlZCBTQkkgZG9tYWluLgo+
ID4KPiA+IFRoZSBoZWFwIGJ1ZGdldCBpcyBleHRlbmRlZCB0byByZXNlcnZlIHNwYWNlIGZvciBN
UFQgdGFibGVzLgo+ID4KPiA+IFdpdGggdGhpcyBwYXRjaCBNUFQgdGFibGVzIGFyZSBidWlsdCBh
dCBib290Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFJhaHVsIFBhdGhhayA8cmFodWwucGF0aGFr
QG9zcy5xdWFsY29tbS5jb20+Cj4gPiAtLS0KPiA+ICBwbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3Jt
LmMgfCAxMDEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDEwMSBpbnNlcnRpb25zKCspCj4gPgo+ID4KPiA+ICBpbnQgZ2VuZXJpY19maW5h
bF9pbml0KGJvb2wgY29sZF9ib290KQo+ID4gIHsKPiA+ICsgICAgICAgaW50IHJjOwo+ID4gICAg
ICAgICB2b2lkICpmZHQgPSBmZHRfZ2V0X2FkZHJlc3NfcncoKTsKPiA+Cj4gPiAgICAgICAgIGlm
ICghY29sZF9ib290KQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+ID4KPiA+ICsgICAg
ICAgcmMgPSBtcHRfZmluYWxfaW5pdChjb2xkX2Jvb3QpOwo+ID4gKyAgICAgICBpZiAocmMpCj4g
PiArICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+ID4gKwo+IE96YTogZG8geW91IHRoaW5rIC0g
aWYgdGhlcmUgaXMgYSBuZWVkICB0byBtb3ZlIHRoaXMgY2FsbCBhZnRlciBhbGwKPiB0aGUgZml4
dXAgY2FsbHMgPwoKVGhlIG9ubHkgZGVwZW5kZW5jeSBpcyB3aGV0aGVyIHNiaSBkb21haW4gbWVt
cmVnaW9ucwpoYXZlIGZpbmFsaXplZCwgd2hpY2ggYWxyZWFkeSBoYXBwZW5zIGJlZm9yZQpzYmlf
cGxhdGZvcm1fZmluYWxfaW5pdC4gU28gY2FsbCB0byBtcHRfZmluYWxfaW5pdCBiZWZvcmUgb3Ig
YWZ0ZXIgdGhlICpmaXh1cHMKd29udCBjaGFuZ2UgYW55dGhpbmcgSU1PLgoKPiA+ICAgICAgICAg
ZmR0X2NwdV9maXh1cChmZHQpOwo+ID4gICAgICAgICBmZHRfZml4dXBzKGZkdCk7Cj4gPiAgICAg
ICAgIGZkdF9kb21haW5fZml4dXAoZmR0KTsKPiA+IC0tCj4gPiAyLgoKLS0gCm9wZW5zYmkgbWFp
bGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
