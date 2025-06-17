Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A49C71155
	for <opensbi@archiver.kernel.org>; Tue, 17 Jun 2025 04:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OsCs1aQZY/VkV4CNHYOkshCBjoNIhsS26SZe5Ru4fzk=; b=SLvTeKHlb240N9
	kc6Ah/yvRDc3vptrY3A33T+SkvKpobsPGuUvBpvKM9DTBEtPgh+oES0xvUkkMfoskWnvSrt8CoTZA
	y+pC29V1uhcHOMz03fo4AIt598T5Z5xtKfFIgKHAqYE/2DdKahFdVKW1FCaSz5eypwi30zgN5Nlv7
	ulWKoMcdcnbH+oLqCGHdmfSWoH3V+x0GWeZzMqtTX+JrSib/8ahSsHF06Koz+Ce9CNB0PQLmQj49U
	XzNABTDPFIO6TH23ncXDF9AtPiPXHTFw6DYO4YzwBOiHyJysAvVjSsYWXm8/QxW7/hwfGc3yEeVKb
	AICNiFK0GMRvq6yvjf1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRNUg-0000000686I-2E0h;
	Tue, 17 Jun 2025 04:00:18 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRNUe-0000000685w-0ymv
	for opensbi@lists.infradead.org;
	Tue, 17 Jun 2025 04:00:17 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-86cf3a3d4ccso490763339f.3
        for <opensbi@lists.infradead.org>; Mon, 16 Jun 2025 21:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1750132815; x=1750737615; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uecXjIV/cpEnf5YaHev5tqD9XUcG6Yu0qA5XbPz8+E8=;
        b=KWl+TFOvHFt673OwcmuNZxaa8wIbGXly0Uvj+Jpjef5Yqyd/Gv12P/uDsPnACRj9KG
         brkBBjiHW/irDDxGasiA0IkCNGSUSf4ATE2yS8UaGiy+R+CsfmBikyKnSOjzv0XN+bMd
         9fW4YeFQD8aOyY45l9aVTliv6JTZOh4fDX9mNvK+ZdRQR11Xn9B36SiwXt0viGIJOtzl
         Nrh2VDsM/yD6rk0knC0yKziZD2Yz75dJS8QWikWJzhwDxvJbW2xTJaC6j4U8XtOHNhX2
         3/V+HRePHS35GcEFKdDJK7ytGeucBOI6fKxXKAbTJon8vcH4fiS1XousQ+cXWFyLHjt7
         koXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750132815; x=1750737615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uecXjIV/cpEnf5YaHev5tqD9XUcG6Yu0qA5XbPz8+E8=;
        b=kA3rDvmf5XlsfOieNTvT65GzCcvBH4vg3V7/dYnBCHVapNf8kry7EhjFMLiDH5OGUG
         3PbCMRd+uws/x7xIQK/fRPPImmgeM4VK//aZZ6aE7zdn2mPn3HzemUqJ+T7Hb2zo/5S5
         4K98gvxrQAQZsKwkDXGDrbJCuhNPm+AGLmN3mjXvi/7OgVHGrovkhbuCUlKue9nQSTL9
         n0WPKlisGbMOA7D0Htjedd63b0rDj1pRuT9zbnKPd2VQ208WyBlrVvIovJ1m5SMtamNX
         BvhJJTM76xl/wN4On16NZIeiGgelBiDcy0mGk3El745NTvSo2Ui4OFwpXO5v4he0Osdw
         EHCg==
X-Forwarded-Encrypted: i=1; AJvYcCWGLzlT1t8wXJ+yPfb9dPjzuqt/KHbJ4syLoFwAzIWWvYpDJCytdFpVuVYco/j2vhGStKWB5u6h@lists.infradead.org
X-Gm-Message-State: AOJu0YzIKXvFl/gcjDQKWWCXQDYS95MeOHxuHDdr0XHVk7+W+EOEGALb
	p7ciKTMthLB6B3H6lrMFsVvo1QHxTXB+sIHkkevVXkOOEWP5X7L5VXdMa5LVt0eWapbOlkZHJ1g
	9OH/H/FvTQafb6Ju7eMOJsQeQHyoK4eqm4INN7e6T0g==
X-Gm-Gg: ASbGnctqVeLOB8LBDc+feOs9pYquWYa3Evh89+MwGj7PCTsxbPfEPWx0cl2FwtfcDVe
	ZicgjEU6aPCmLpIL7TJRao3W5CZjVxEY+sbLtkxqVJautFSolm59dd0JVqaYqmIm52Sb9Bq9h79
	Xd/aXC1hzNCMGKRO9D+FwpdqvnEWd15b5dLKbd10RQnVI9
X-Google-Smtp-Source: AGHT+IFywCd5mmSk6sugVEbTmY1DkPFk0ZCQ+kKr9/Tryl6QI25aiVX/BzGnRBfAVUjM19QZxPEj6XqeNH/UL6E3SY4=
X-Received: by 2002:a05:6e02:1fc6:b0:3dd:babf:9afb with SMTP id
 e9e14a558f8ab-3de07c29ba1mr141980375ab.2.1750132814769; Mon, 16 Jun 2025
 21:00:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250614172756.153902-1-apatel@ventanamicro.com>
 <CAAhSdy3axiPX99WS+EbkNk-EQU8r4=NYi98Toe=ucutFieWu4Q@mail.gmail.com> <SJ0PR22MB27206BD79B2E8CA385C96125C270A@SJ0PR22MB2720.namprd22.prod.outlook.com>
In-Reply-To: <SJ0PR22MB27206BD79B2E8CA385C96125C270A@SJ0PR22MB2720.namprd22.prod.outlook.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 17 Jun 2025 09:30:02 +0530
X-Gm-Features: AX0GCFumH8zbU928a8YQlEZoRHYbcZHLei9pbM_tZVTsVfGPDUeRJy7kCJBFTK0
Message-ID: <CAAhSdy3017uy6Wj_D5jNNx1_gnNetpH2B5jc2Xnc85Eet-h5Gg@mail.gmail.com>
Subject: Re: [EXTERNAL]Re: [PATCH] lib: sbi_platform: Add platform specific
 pmp_set() and pmp_disable()
To: Chao-ying Fu <cfu@mips.com>
Cc: Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	"opensbi@lists.infradead.org" <opensbi@lists.infradead.org>, Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_210016_564217_6BAFCE33 
X-CRM114-Status: GOOD (  15.84  )
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

SGkgQ2hhby15aW5nIEZ1LAoKT24gTW9uLCBKdW4gMTYsIDIwMjUgYXQgOTo0N+KAr1BNIENoYW8t
eWluZyBGdSA8Y2Z1QG1pcHMuY29tPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiA+IEhpIENoYW8t
eWluZyBGdSwKPgo+Cj4gPiBPbiBTYXQsIEp1biAxNCwgMjAyNSBhdCAxMDo1OOKAr1BNIEFudXAg
UGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gRnJvbTog
Q2hhby15aW5nIEZ1IDxjZnVAd2F2ZWNvbXAuY29tPgo+ID4gPgo+ID4gPiBBbGxvdyBwbGF0Zm9y
bXMgdG8gaW1wbGVtZW50IHBsYXRmb3JtIHNwZWNpZmljIFBNUCBzZXR1cCBhbmQKPiA+ID4gUE1Q
IGRpc2FibGUgZnVuY3Rpb25zIHdoaWNoIGFyZSBjYWxsZWQgYmVmb3JlIGFjdHVhbCBQTVAgQ1NS
cwo+ID4gPiBhcmUgY29uZmlndXJlZC4KPiA+ID4KPiA+ID4gQWxzbywgaW1wbGVtZW50IHBtcF9z
ZXQoKSBhbmQgcG1wX2Rpc2FibGUoKSBmb3IgTUlQUyBQODcwMC4KPiA+ID4KPiA+ID4gU2lnbmVk
LW9mZi1ieTogQ2hhby15aW5nIEZ1IDxjZnVAbWlwcy5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6
IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+Cj4gPiBQbGVhc2UgdHJ5IHRo
aXMgcGF0Y2ggYXQgeW91ciBlbmQgb24gdG9wIG9mIHRoZSBsYXRlc3QgT3BlblNCSQo+ID4gYW5k
IHNlZSBpZiB0aGlzIGhlbHBzIG9uIE1JUFMgUDg3MDAuCj4KPiA+IFJlZ2FyZHMsCj4gPiBBbnVw
Cj4KPiAgIFllcywgdGhpcyBwYXRjaCB3b3JrcyBmdW5jdGlvbmFsbHkgdGhlIHNhbWUgYXMgd2hh
dCB0aGUgb2xkIHZlcnNpb24gZG9lcyBvbiBGUEdBIGFuZCBRRU1VLgoKVGhhbmtzLCBJIHdpbGwg
YXBwbHkgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKPiBOb3RlOiBJIGFk
ZGVkIHR3byBtb3JlIHBhdGNoZXMgZnJvbSBWbGFkaW1pciB0byBkZWFsIHdpdGggTU1JTyByZWdp
b25zIG9uIHRvcCBvZiB0aGlzIHBhdGNoLgoKV2l0aCB0aGlzIHBhdGNoLCB3ZSBkb24ndCBuZWVk
IHRoZSBQTVBfTU1JTyBmbGFnIGFkZGVkIGJ5IFZsYWRpbWlyJ3MgcGF0Y2hlcy4KSXMgdGhlcmUg
YW55IG90aGVyIHBhdGNoID8KClJlZ2FyZHMsCkFudXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlz
dApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
