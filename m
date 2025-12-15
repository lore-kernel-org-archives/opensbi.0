Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78160D5B841
	for <opensbi@archiver.kernel.org>; Mon, 15 Dec 2025 15:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wjWhADIMAlSyphEI7eMY0hUW0/mhtt281bXXsTaWqWg=; b=qiEetqimgO+A2E
	CxNSZ/XKJBSBAmiyKyceQtHJyyhPpFoIyD7R0+0500UqdjqQTZ0AhVUD9OeeiFGt61Zp3+94fu2fE
	gkOWvmy+jlVuUH3k3MyQJXmKFgTFaFEs2vXaDsHpTT1bEpmOoO/6tFJZ2k5TXgjdgsGfpIKd5oU3F
	zr4zqbCtHHMsZQbvl9vDWNu5RQHCdLoyHvKKPhweC/rjrvRmGCOfNL/JEyMg9HrMctEhiEB66s/Ig
	Wp6QdX4VXobkHpi5P+JNhJFWRw9d0xViPDCeHUCKvW/yOMh/3HUKn1vKYoxSzaokKAwOP/9x/D1aL
	OT7GVpBp0UDjVJGJxJKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAmm-00000003vdL-2VqR;
	Mon, 15 Dec 2025 15:46:56 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAmk-00000003vc2-24uM
	for opensbi@lists.infradead.org;
	Mon, 15 Dec 2025 15:46:55 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-3ec47e4c20eso2434941fac.1
        for <opensbi@lists.infradead.org>; Mon, 15 Dec 2025 07:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1765813613; x=1766418413; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KA2VpLUMJsjeJiDV2AaojuDk7V2NQvHr8TY4ieTv+5A=;
        b=fsyb1L47SFplTRwnOzbwRM0Xl9BHVKXRO9897dtM9+iYlm6ZNHdbmW+ysm2pluQjQY
         NMd/FV59Y3ettxTCXKpT7pYIOG7uFklGiamYVNq1U+h0Z9b3m0N8pTydbEKOCz038KPS
         oTJZfnxVz/uAWrppBbigPgRWt2AqyrZ+PCx6z9bp9/Ivi4R1Bfhwsh0il+zKEEfrVLO7
         1SfrYAzvqU3GOW5+GHv/+H/QYVZNMQNARlHvkXMUEk9lNNDSjVdQ/S9VCs4cDOMenypE
         ObT95RnJogfdMmq1heYyFg7YBpQoSo7S3rWJjMzNxT0D1emxOIcep6T78vgKqeKwZ6hu
         CDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765813613; x=1766418413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KA2VpLUMJsjeJiDV2AaojuDk7V2NQvHr8TY4ieTv+5A=;
        b=rn5cb0DXOGfqEX3GScwZ4l8sX7/c14BMi4yZvvpxorFk1xVoxsURFHbXUE/Rany2ZD
         tAwiDw2t2Sfewx4pi6Ly8Ff/Ci2H1HQEH+kDm/53mJVbonfIb4WL4cR+1flMxb/A+57g
         HxHyZdaFC+Wjw6lAQDgKEvXnC5pi6YEN84TcJ4KD1eHj5yHj3M2htw3EAml4FK3BdP0t
         24Z5ZfCtU1SVmEZinzKStgMPR9kPkbRo9AaljoAnJQhk+duQDOuwKBx8W6399AYXasCJ
         OJznVCuGlUq1BmVq6jQ/9GpEttN7IiJMlPnrQAa0gH+ConGXiLxYoK/Jg+y43Ud2LGU/
         4xbw==
X-Gm-Message-State: AOJu0YwQPjfcuqoO7de69ykQn7IKw5Fx8O8rOxKFTE62Hww/PczswqY0
	ztv6t0kSOEAxv7hAvthQUuw8qaOY/cNMEOsZnJJBUOM+TMjt79iZOmpnNMjHP1ZbG4msDqit4t9
	OHOeP3XjCquzr6Orjo4uqKfh39y7tXX+vudoiDTF8+rHVM4qNrlIO9iGWVA==
X-Gm-Gg: AY/fxX4L+y+7Vr7hIJWtZxv5aYCKFB/hVNCfif9PS006Gl3D8ZqiNADhRZ+GF9RZNd+
	WtEX2jFnOM4UQVEbXBhIDX8KS9fDDnlyjzdhIxbkVltdtyX4CF/aH9EOFCI1Tv6JAvfo6iyK+05
	ECROQ+nvi1m4r+QU2wDEAZDfGB8Y6XfEmRnRuB5HtdtymKpdYf0bnjysCdjdU88ygNC73eJA4cC
	+rN6F161uY77PWWUUTLWyzGuCpsPXr7SAVSoIUmQK112HG8T43WeyZdlgNyWzeSpfTOV2o=
X-Google-Smtp-Source: AGHT+IHmkmXoq2i6jyYZs01oYGDyxcVIqmSS5ykG0nRAWnDPzOK6Ak+bfrAkxllJKZSR3S6TYPCtM73Dbc2NGS0VGu4=
X-Received: by 2002:a05:6820:1b0f:b0:659:9a49:9022 with SMTP id
 006d021491bc7-65b452c68demr5111285eaf.79.1765813613374; Mon, 15 Dec 2025
 07:46:53 -0800 (PST)
MIME-Version: 1.0
References: <20251114203842.13396-1-b.freisen@gmx.net> <20251114203842.13396-3-b.freisen@gmx.net>
In-Reply-To: <20251114203842.13396-3-b.freisen@gmx.net>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 15 Dec 2025 21:16:42 +0530
X-Gm-Features: AQt7F2p31XbbwhWyxO9mEPYFs-OoXEVpi2tE7PD1yefN756YCl3YyUj0NyDqFEc
Message-ID: <CAAhSdy0Hr+hYY-aN24yerXSP81QOXiASCHAFLbbP9160+RoJ8A@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] Makefile: sensible default value for OPENSBI_CC_XLEN.
To: Benedikt Freisen <b.freisen@gmx.net>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_074654_536528_44EF7702 
X-CRM114-Status: GOOD (  14.03  )
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

T24gU2F0LCBOb3YgMTUsIDIwMjUgYXQgMjowOeKAr0FNIEJlbmVkaWt0IEZyZWlzZW4gPGIuZnJl
aXNlbkBnbXgubmV0PiB3cm90ZToKPgo+IElmIGd1ZXNzaW5nIHRoZSBjb21waWxlcidzIFhMRU4g
ZmFpbHMsIHVzZSA2NCByYXRoZXIgdGhhbiBnYXJiYWdlLgo+IFRoZSBwcmV2aW91cyBiZWhhdmlv
ciBjb3VsZCBzaWxlbnRseSBicmVhayBlLmcuIE9QRU5TQklfQ0NfU1VQUE9SVF9WRUNUT1IKPiB3
aGVuIGNyb3NzLWNvbXBpbGluZyB3aXRoIGEgc3lzdGVtJ3MgbmF0aXZlIGNsYW5nLgo+Cj4gU2ln
bmVkLW9mZi1ieTogQmVuZWRpa3QgRnJlaXNlbiA8Yi5mcmVpc2VuQGdteC5uZXQ+CgpMR1RNLgoK
UmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRo
aXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKPiAtLS0K
PiAgTWFrZWZpbGUgfCA2ICsrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQo+IGluZGV4IDM5OGVhYmUuLmFm
Y2M1NDQgMTAwNjQ0Cj4gLS0tIGEvTWFrZWZpbGUKPiArKysgYi9NYWtlZmlsZQo+IEBAIC0xNTEs
NiArMTUxLDEyIEBAIGVuZGlmCj4KPiAgIyBHdWVzcyB0aGUgY29tcGlsZXIncyBYTEVOCj4gIE9Q
RU5TQklfQ0NfWExFTiA6PSAkKHNoZWxsIFRNUD1gJChDQykgJChDTEFOR19UQVJHRVQpIC1kdW1w
bWFjaGluZSB8IHNlZCAncy9yaXNjdlwoWzAtOV1bMC05XVwpLiovXDEvJ2A7IGVjaG8gJCR7VE1Q
fSkKPiArIyBJZiBndWVzc2luZyBYTEVOIGZhaWxzLCBkZWZhdWx0IHRvIDY0Cj4gK2lmbmVxICgk
KE9QRU5TQklfQ0NfWExFTiksMzIpCj4gKyAgaWZuZXEgKCQoT1BFTlNCSV9DQ19YTEVOKSw2NCkK
PiArICAgIE9QRU5TQklfQ0NfWExFTiA9IDY0Cj4gKyAgZW5kaWYKPiArZW5kaWYKPgo+ICAjIEd1
ZXNzIHRoZSBjb21waWxlcidzIEFCSSBhbmQgSVNBCj4gIGlmbmVxICgkKENDX0lTX0NMQU5HKSx5
KQo+IC0tCj4gMi41MS4xCj4KPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2Jp
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9vcGVuc2JpCg==
