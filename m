Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE3AC83F22
	for <opensbi@archiver.kernel.org>; Sun, 20 Jul 2025 15:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o5+Wck9orjNj0iNfZECHmwOmIScblCOFlYqjOsqNJjk=; b=m1rW5gRIJxGt9B
	L6dtzCJJIWibadDrOvsSJPxDM6RXc/Zroe9sp0NjSc1nKfKnR+MbCv+8yEGthemuRNtpUKGpVTVbf
	u+oL+sR6yQSnnC+bbuRaGP/xw+Bbp034FkmSxsaxbPPTNG2dBM7JST6Vnpo5LdCvLIcBSX1v061fy
	QEfLsIRfbaBGa8/JfLnbw9p1fi6LrB+HhTX4c/ipffGrisgHQK9Qa/xW9yGeO622OqlisdAXLyEBJ
	6kEa5VOnqrb8wsX4m5J2nZRq0M2hbb/o1YFj8g9T9QOGhB8N2FOblpi2ds/yLs8GhDBOXBWjLSjLh
	ssQ+uHFoUZarP3vm9qMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udVpG-0000000FRcz-1NWu;
	Sun, 20 Jul 2025 15:19:42 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udVnF-0000000FRYg-0eJy
	for opensbi@lists.infradead.org;
	Sun, 20 Jul 2025 15:17:38 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3e28058c18cso37785405ab.0
        for <opensbi@lists.infradead.org>; Sun, 20 Jul 2025 08:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1753024656; x=1753629456; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/dZuKea7tLg3TzvQ29ptFlyE4o4TXgdcErnb+Q/NK4=;
        b=cR2Jx/miiBT+6G5N/SmVAmlg9//sbQYzBlXvCGgARudl9gZU3rr4S4A8jPq1alyCWg
         6zWaG5GhJXN6UJ26P0h+P6DOkIcHDw2gRLzN/g1i6cP0EWk3m60lUbs+BqSvlR30OhLi
         drFShV5skjYh41ZLKHdg2loH6yP2Qnv3btScLaYhkkUAx/X8N+vlLw6XRpdgk5URZBlM
         9PJeagTrCzhTyxH1HsMMiPDRrRmoJS3felm9dxlgLdAhgmrh/nDDqLi5wG+MVQ9wD9TC
         Ke7vjxbOEwBtQt0jubqnRdjjrZBDYSlMOUkiHzSpWJoN+SSXIyW4xGchPYw46FrvFOhO
         G1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753024656; x=1753629456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/dZuKea7tLg3TzvQ29ptFlyE4o4TXgdcErnb+Q/NK4=;
        b=l2FvywErZmBrrLPWzBTtBqCFhVp1bkoGuRYSnhbMSRqMK5AS/8xcVk4hmjJftPESBJ
         ShcG4p14GUZptJvWMtdKy2wrB2xCwPEl3YU8VAupPKhvXvZfqRAhfJmQ4dEdQ9Vbw+1h
         tRFG337Ah7BTI0ujyGOriWB0JqjKHmD+48kj3rn+xSDrEMdTFTUee7J6I7hnE/KMelUT
         E9xazEeWRn2uEzS2an/ZHUnzb/JAaecgmQbXUIlcR1rR+jAHnS7d4bAbJzjs4gA/0Y/f
         UxBfY0v2xI7GhJYk94WJ/sXhrBYXShkfv1abLxllMNp5w8EB6OnEWNVtwvU8V0ZejS4K
         I2EA==
X-Gm-Message-State: AOJu0YxA0AP8cd7fg83kfn97o+6aXt5Jr8thNLYgskcptO6985+w/D1H
	+g9Pf9+tYnwcdr7MryW3KAoQiJjGFF5xNVnqcSDmz8imPUb4jLejB65Z3zPT2FDk8Zbh17WzMjr
	xM+7P+JZOK3XNajk6MtDADxTa/k80wz9GuZaPkBb0WOVVnJ7z0Wdh
X-Gm-Gg: ASbGncvNM16YQVYRuouKWG0nPewvMldxM9g5Qt7DCoqV1wecGeJHLrmzIrDcc/G6Q2S
	g1NydIXrZr4SC8cLylq68YZg25qwbyFtxifaMohxmy8+9FVA6nfFpppHDzxmn0MDabYn51beH4q
	cbYdgJ2huhhf/b5fx4x0YX4JBSTiVpKy3f01yWV+WKpTZ0g+K6lVqkWJ/CrZTtvo23mcXxLCwqc
	dYLfo1n
X-Google-Smtp-Source: AGHT+IGDlHKZ8VdUvrsRy7c8ya86bFEtmzVs1mpiv8w/01hjJ4rgLNmYFEBUk4z5aBaL0xCBHMU2dLRTvsE7ihj6tN8=
X-Received: by 2002:a05:6e02:3497:b0:3e2:99f3:9c60 with SMTP id
 e9e14a558f8ab-3e299f39f13mr92143595ab.10.1753024656337; Sun, 20 Jul 2025
 08:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250618025416.5331-1-yongxuan.wang@sifive.com>
In-Reply-To: <20250618025416.5331-1-yongxuan.wang@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 20 Jul 2025 20:47:25 +0530
X-Gm-Features: Ac12FXyRGL01X8nTxZNOkt1LAb1Dop3Zq5a0Wx2iy4gVniBp8mzkgkD4cPnotE8
Message-ID: <CAAhSdy2w4kBP1CYGRvppAkJs8h6_VoAdPykinfBU2NsSWaTOsg@mail.gmail.com>
Subject: Re: [PATCH 1/1] lib: sbi_list: add a helper for safe list iteration
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: opensbi@lists.infradead.org, greentime.hu@sifive.com, 
	vincent.chen@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_081737_195314_008A4810 
X-CRM114-Status: GOOD (  15.54  )
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

T24gV2VkLCBKdW4gMTgsIDIwMjUgYXQgODoyNOKAr0FNIFlvbmctWHVhbiBXYW5nIDx5b25neHVh
bi53YW5nQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gU29tZSB1c2UgY2FzZXMgcmVxdWlyZSBpdGVy
YXRpbmcgc2FmZSBhZ2FpbnN0IHJlbW92YWwgb2YgbGlzdCBlbnRyeS4KPgo+IFNpZ25lZC1vZmYt
Ynk6IFlvbmctWHVhbiBXYW5nIDx5b25neHVhbi53YW5nQHNpZml2ZS5jb20+CgpMR1RNLgoKUmV2
aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMg
cGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKPiAtLS0KPiAg
aW5jbHVkZS9zYmkvc2JpX2xpc3QuaCB8IDEzICsrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDEzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9zYmlfbGlz
dC5oIGIvaW5jbHVkZS9zYmkvc2JpX2xpc3QuaAo+IGluZGV4IDllNTZjNTI2ZmFmMi4uYmU2OWZj
NDMxNGUwIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV9saXN0LmgKPiArKysgYi9pbmNs
dWRlL3NiaS9zYmlfbGlzdC5oCj4gQEAgLTE2MCw0ICsxNjAsMTcgQEAgc3RhdGljIGlubGluZSB2
b2lkIHNiaV9saXN0X2RlbF9pbml0KHN0cnVjdCBzYmlfZGxpc3QgKmVudHJ5KQo+ICAgICAgICAg
ICAgICAmcG9zLT5tZW1iZXIgIT0gKGhlYWQpOyAgICBcCj4gICAgICAgICAgICAgIHBvcyA9IHNi
aV9saXN0X2VudHJ5KHBvcy0+bWVtYmVyLm5leHQsIHR5cGVvZigqcG9zKSwgbWVtYmVyKSkKPgo+
ICsvKioKPiArICogSXRlcmF0ZSBvdmVyIGxpc3Qgb2YgZ2l2ZW4gdHlwZSBzYWZlIGFnYWluc3Qg
cmVtb3ZhbCBvZiBsaXN0IGVudHJ5Cj4gKyAqIEBwYXJhbSBwb3MgdGhlIHR5cGUgKiB0byB1c2Ug
YXMgYSBsb29wIGN1cnNvci4KPiArICogQHBhcmFtIG4gYW5vdGhlciB0eXBlICogdG8gdXNlIGFz
IHRlbXBvcmFyeSBzdG9yYWdlLgo+ICsgKiBAcGFyYW0gaGVhZCB0aGUgaGVhZCBmb3IgeW91ciBs
aXN0Lgo+ICsgKiBAcGFyYW0gbWVtYmVyIHRoZSBuYW1lIG9mIHRoZSBsaXN0X3N0cnVjdCB3aXRo
aW4gdGhlIHN0cnVjdC4KPiArICovCj4gKyNkZWZpbmUgc2JpX2xpc3RfZm9yX2VhY2hfZW50cnlf
c2FmZShwb3MsIG4sIGhlYWQsIG1lbWJlcikgXAo+ICsgICAgICAgZm9yIChwb3MgPSBzYmlfbGlz
dF9lbnRyeSgoaGVhZCktPm5leHQsIHR5cGVvZigqcG9zKSwgbWVtYmVyKSwgIFwKPiArICAgICAg
ICAgICAgbiA9IHNiaV9saXN0X2VudHJ5KHBvcy0+bWVtYmVyLm5leHQsIHR5cGVvZigqcG9zKSwg
bWVtYmVyKTsgICAgICAgIFwKPiArICAgICAgICAgICAgJnBvcy0+bWVtYmVyICE9IChoZWFkKTsg
ICAgXAo+ICsgICAgICAgICAgICBwb3MgPSBuLCBuID0gc2JpX2xpc3RfZW50cnkocG9zLT5tZW1i
ZXIubmV4dCwgdHlwZW9mKCpwb3MpLCBtZW1iZXIpKQo+ICsKPiAgI2VuZGlmCj4gLS0KPiAyLjE3
LjEKPgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
