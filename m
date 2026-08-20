Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D74CC5DF86
	for <opensbi@archiver.kernel.org>; Thu, 20 Aug 2026 07:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tv2PLC99iTOp31RCbVTVv57enifGBJBHUax3NE6CbVk=; b=UKXfQ75mHCuQBj
	vIlqkPCAeDYzEKn7pghmK9+uIcj0d5zJbEhJ83mvPomY3CwhEY4VpSz6CqPigo2kZX+5wN0htZZvs
	pGzPLArhZiuQXnNi0R8ICJIIjqOrvBJtFa5NS61oX6ZcZm1tJJJ4if5g+ptXLLhEE8LYDf8PMBwyE
	sw4QP4z7d4t3dQjw0+MDjYRGQl+E7wwEcgkTpxChx5uUg4npN0YfBM1qPHVS5DYArdUCUeRgp1feM
	ygKaSpRlRUJwD2hF5YlgWqlzSu5bk+ApsmA1ZZDr7h0J1M6gZRd1vhHzdJ/G5CL/mTekDnkKtHHkx
	fGTG2RLlnkku+8oc5p4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwxUW-0000000B5kH-1puE;
	Thu, 20 Aug 2026 07:47:12 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwxUT-0000000B5iH-1YKI
	for opensbi@lists.infradead.org;
	Thu, 20 Aug 2026 07:47:11 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso4451555e9.3
        for <opensbi@lists.infradead.org>; Thu, 20 Aug 2026 00:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787212027; cv=none;
        d=google.com; s=arc-20260327;
        b=Cb74xgbIUkOCPOIQiUAo0KBHEvoYeSIrvpVD9+xW9CAMS567ZMFDmEwXdFRRnCjRQZ
         mS20QQVyR3wb1lumE4PU6tHtmdR13+/wj3iBo1A4sZe2PPzr0DpKSdrrLhcrx3gENa/5
         DWm/sJFg0uj568RfjaE8DrcFYbuVj60qGCwH0VSD69kHnx0S0rkZ9QyGiM/09hxRwxRK
         RjBXLu9MhxYOeKP77YBH2k+maM90LxgL1J9Co5TvIoHDUfNBFIdDaK+O76k380iTxIzv
         JQRaKiV6rBY5PvC9i2KojIklMoqEUSPBl4SrfNbrSHMhCsWOKLWbsWpsuHZYPPLWwX5c
         bysA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zrNjk8zMqPk+dcxe+bydK/tEb2M6zH5HNxVhgxxey+I=;
        fh=xAAyU86WSld90ZywRZAoVSIV6hCFtSu1clQuBxOw/xQ=;
        b=YvN+/iQq5qGG0BDPmvZ9zTQfNnu8TjvV7A6KfuWPe1ep6ak5/0jppcbgIrfPSVXHQs
         hIFfuaWRmsEIzBlMmLjns0oUtbvPdlWn5LAg0NgzUR1WICshHUDn25+Az/wbGKJx5OFL
         A0aNI5jWJi5GVktrkIsAZBnjhUW34y2XphJLXnic7tYBoX6yS0GO15lTolP+M9yBQHFe
         K+I7y0UDgI76ypaazfHIbu1dxlc71jW0GU3GXb3Ye/TfF/2iml0N64qOZin4DyJ6NEwC
         UGdek28VOly+RUAEBQwBOvaWLPCzkxKMrCIGl88bBqyfe+ASKB7aEiDZK1KKiVkDU4il
         DulA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1787212027; x=1787816827; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zrNjk8zMqPk+dcxe+bydK/tEb2M6zH5HNxVhgxxey+I=;
        b=iLGwWzsSwGhbbVVwD0Y90h4fB9p4/LC44rkUKGN78eTd64z2yPiQbxdnxhBbYpkdjy
         i6YrTnGqykikTI6wO1FGfcS2rDs1pSAvIm2EsrAkqz/N1TxQVQs2s4UjhgOr1DdLsm0/
         DZsAspwyZs1TSs/RkXS5nsqQgWNk32TBF9yaAVKeH9QpB8PBCg3zqoWAmotzX4GIaKJM
         1W7M9oczGQFmeTu7bx+qBwNw928k5KKYaQKQMujd+WnkqYaYlwd3XVcPYpAgbrwsugIN
         g/oc4YeWac9L62Kx4i5aBqffjRpzpBx6JClix+jkjC+PYNdx4GnHQXRkBTxwT0kNWifv
         PoQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787212027; x=1787816827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zrNjk8zMqPk+dcxe+bydK/tEb2M6zH5HNxVhgxxey+I=;
        b=X6zz1bc/jfrWhtxUXf4MUXrQdRuwI9gclxF/Z+UCJfgZH9tdPAtVeD+PLEmnW3ZB+k
         lqtfaHq0jD4aK+vS8hJNA7tzhTJPQ0Q6PEPFRaw3+x0BU1Ihw8aT6GjKeoFQ2xVh9lWw
         cvCLC/AfjY7++bgikGg9zB/XIcA6iv4Q7ig4pw4urHQh635wm4n7ekjfFkNy7Y5cOawU
         lO8Iwvi/jQONncHxi8UxT/ZC6OfJ9IJHxLEfwQFXDrD/bWzFBzeKUZuDNbsIVv3f0nwZ
         /D4G8qOvRXCU/wG7e4hp1Dd58X0sGu2p1Ii3lAg44uweYLcuP7An6guA0Bb3TAlkWQ8Z
         TVgQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1f5v/a8MNsibi2pPy8omNvUusB4Az9IXqs4Qv7bP7dQSy8b1659bT/UTFQv1cHYN2bmBNYiag@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj+W+wt8v0Z/uFFZtQWhHncwkyfKft0XfYCEaehVtHNt3xChQ4
	bXFfBmpuwEtJ1OchUHbH6qJRkD9xVHeZx+4j7TGPw8yqhId+UgFKkpx6Cze7h80a6h2fnIod/Sq
	YxudPfcC7oe4HOcxFxxV8zL7TOTuLLpzzKEe4egXwlhZmGOs4sTNXYEU=
X-Gm-Gg: AR+sD12QvPjMFadlvulEa6VGTR03XtFLDvXRVOH+ddWjQLlofu4hvsz86PsYEiH45Q5
	MMSZNsJg2hSIGxaSycdvC8c0ygfOYmcewOrwCyH2P5cX44HQURMmuy8w0jxgQU34rXG/OHJOjYV
	3cBS1z7W+rMdau7pKD96jDUIirzE0GH7z6U2mxRGHDdLY1oht/zuNAwVPIwvfgGmEIl35vFVtJB
	2eGIsG5dBBn4yTsR7IcIc/xzdPFbo0vO9TGbAlvKb/MtmsKqb59xJQ5NG1YDXVWAJ8LjU8Wf75l
	phARa5trOqv/pSZbNF7i4dEk0VRgHZifs3C3h4Ntn2SP5BVZtIEb8heWNb9Kh+0Cqq1uggMIh37
	T4ouMlAjbR7mjTfoNkt0sIhXyypKaUTQoDGuqFX8LHHLguSrJCScEQjmabuh0vFQ=
X-Received: by 2002:a05:600c:37c6:b0:499:9eb7:4558 with SMTP id
 5b1f17b1804b1-499aa1e43b7mr194410665e9.10.1787212027177; Thu, 20 Aug 2026
 00:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260706160544.697409-1-heinrich.schuchardt@canonical.com>
In-Reply-To: <20260706160544.697409-1-heinrich.schuchardt@canonical.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 20 Aug 2026 13:16:55 +0530
X-Gm-Features: AcwNN1X0djQKORWZh5olEdu-MONruREKQWs4-fxkEvRT2HoH5icUSmo1HGz394c
Message-ID: <CAAhSdy3k1L7X4WBTtkb97P15E_gOE=bwhxuGhjhScSuOQugv9w@mail.gmail.com>
Subject: Re: [PATCH 1/1] sbi: make SBI_HARTMASK_MAX_BITS customizable, default 256
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Atish Patra <atishp@atishpatra.org>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_004709_423230_15659A60 
X-CRM114-Status: GOOD (  17.18  )
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

T24gTW9uLCBKdWwgNiwgMjAyNiBhdCA5OjM14oCvUE0gSGVpbnJpY2ggU2NodWNoYXJkdAo8aGVp
bnJpY2guc2NodWNoYXJkdEBjYW5vbmljYWwuY29tPiB3cm90ZToKPgo+IExpbnV4IGhhcyByYWlz
ZWQgdGhlIGRlZmF1bHQgbnVtYmVyIG9mIDY0Yml0IENQVXMgdG8gMjU2IGluIGNvbW1pdAo+IDBm
YTc0OTc3MTk5MyAoInJpc2N2OiBSYWlzZSBkZWZhdWx0IE5SX0NQVVMgZm9yIDY0QklUIHRvIDI1
NiIpLgo+IE9wZW5TQkkgc2hvdWxkIHVzZSBhIG1hdGNoaW5nIHZhbHVlIGZvciBTQklfSEFSVE1B
U0tfTUFYX0JJVFMuCj4KPiBJbnRyb2R1Y2UgY29uZmlndXJhdGlvbiB2YXJpYWJsZSBDT05GSUdf
SEFSVE1BU0tfTUFYX0JJVFMgd2l0aAo+IHJhbmdlIDMyLTUxMiBhbmQgZGVmYXVsdCAyNTYuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBIZWlucmljaCBTY2h1Y2hhcmR0IDxoZWlucmljaC5zY2h1Y2hhcmR0
QGNhbm9uaWNhbC5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJh
aW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVw
by4KClRoYW5rcywKQW51cAoKPiAtLS0KPiAgaW5jbHVkZS9zYmkvc2JpX2hhcnRtYXNrLmggfCAy
ICstCj4gIGxpYi9zYmkvS2NvbmZpZyAgICAgICAgICAgIHwgOSArKysrKysrKysKPiAgMiBmaWxl
cyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9zYmkvc2JpX2hhcnRtYXNrLmggYi9pbmNsdWRlL3NiaS9zYmlfaGFydG1hc2su
aAo+IGluZGV4IDIwMGFiNmU1Li4zMzljZDQwZiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NiaS9z
YmlfaGFydG1hc2suaAo+ICsrKyBiL2luY2x1ZGUvc2JpL3NiaV9oYXJ0bWFzay5oCj4gQEAgLTIw
LDcgKzIwLDcgQEAKPiAgICogYWxzbyByZXByZXNlbnRzIHRoZSBtYXhpbXVtIG51bWJlciBvZiBI
QVJUIGlkcyBnZW5lcmljIE9wZW5TQkkKPiAgICogY2FuIGhhbmRsZS4KPiAgICovCj4gLSNkZWZp
bmUgU0JJX0hBUlRNQVNLX01BWF9CSVRTICAgICAgICAgIDEyOAo+ICsjZGVmaW5lIFNCSV9IQVJU
TUFTS19NQVhfQklUUyAgICAgICAgICBDT05GSUdfSEFSVE1BU0tfTUFYX0JJVFMKPgo+ICAvKiog
UmVwcmVzZW50YXRpb24gb2YgaGFydG1hc2sgKi8KPiAgc3RydWN0IHNiaV9oYXJ0bWFzayB7Cj4g
ZGlmZiAtLWdpdCBhL2xpYi9zYmkvS2NvbmZpZyBiL2xpYi9zYmkvS2NvbmZpZwo+IGluZGV4IGU3
NmFlY2NhLi4yNDEzMmVhYSAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL0tjb25maWcKPiArKysgYi9s
aWIvc2JpL0tjb25maWcKPiBAQCAtMiw2ICsyLDE1IEBACj4KPiAgbWVudSAiR2VuZXJpYyBTQkkg
U3VwcG9ydCIKPgo+ICtjb25maWcgSEFSVE1BU0tfTUFYX0JJVFMKPiArICAgICAgIGludCAiTWF4
aW11bSBudW1iZXIgb2YgaGFydCBtYXNrIGJpdHMgKDMyLTUxMikiCj4gKyAgICAgICByYW5nZSAz
MiA1MTIKPiArICAgICAgIGRlZmF1bHQgMjU2Cj4gKyAgICAgICBoZWxwCj4gKyAgICAgICAgIFRo
ZSBoYXJ0bWFzayBpcyBpbmRleGVkIHVzaW5nIHBoeXNpY2FsIGhhcnQgSURzIHNvIHRoaXMgc2V0
dGluZwo+ICsgICAgICAgICBhbHNvIHJlcHJlc2VudHMgdGhlIG1heGltdW0gbnVtYmVyIG9mIGhh
cnQgSURzIGdlbmVyaWMgT3BlblNCSQo+ICsgICAgICAgICBjYW4gaGFuZGxlLgo+ICsKPiAgY29u
ZmlnIERFRkFVTFRfSEFSVF9TVEFDS19TSVpFCj4gICAgICAgICBpbnQgIkRlZmF1bHQgcGVyLUhB
UlQgc3RhY2sgc2l6ZSAoYnl0ZXMpIgo+ICAgICAgICAgcmFuZ2UgODE5MiAxMDQ4NTc2Cj4gLS0K
PiAyLjUzLjAKPgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5z
YmkK
