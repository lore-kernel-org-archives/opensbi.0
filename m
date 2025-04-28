Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C6AC3ABA5
	for <opensbi@archiver.kernel.org>; Mon, 28 Apr 2025 13:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0wGy2Da2Bz2mCwuSirO33COwGVNbY9v8hm/a07JEjWk=; b=cU715wU9QW/Dpn
	Mm1kBP4Ln+lJPdVXjqID5BtghyRcyE1+JJBICLZeOlYIqs3/TSQVC8iOjOMibHdn2aIM00NDxrj79
	7xwe4hzkzURj33sCBoIRagtq+Po6Y3SXUXSSnV+LzyIEZVUKlRJblrgPQbHYDjUFO9qA52V0qUBH+
	2wyCgPIlMGsXxUtQfrgncUhcxkiIo46E9R2bbhkGSK9KZXLdnVg1gcTVR/18GOvZf7ZFwH3YxM0TN
	0W6uDaxyFTovAZoSr2OhBYI5g7W6aRj+seWFkv06KVE58n1LYlIoVFYlP+fircV/+O7GWHNfd1YCh
	31m0rXENqvAQXtR+V9NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Owu-00000006YIB-0WIn;
	Mon, 28 Apr 2025 13:55:08 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9OqM-00000006XI2-1xYN
	for opensbi@lists.infradead.org;
	Mon, 28 Apr 2025 13:48:23 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cee550af2so2831815e9.1
        for <opensbi@lists.infradead.org>; Mon, 28 Apr 2025 06:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745848101; x=1746452901; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAe6W2gZk1iGHoxhoEUMCfyIjqKxJSFAIm22Dz+2LF8=;
        b=ULVF5qNcwuAcxOsFYC0/1sc+JmjL/U7tWRIMPDjKr0ljlexVX7XgbVQAsiFMI3cFD4
         9TmatQSKH20OAlsU7yTsiM5Qm03Y/G0CWDJ+sIetC/V5K94Tq6TjvnsPwB53pLiOpDbX
         u2xZ+nLWjj5GW1K+YgUg+iqctNxDkyVhOs3RWjuMUZDMphIhBHF6GkS4X4n5pX2Zlhcg
         4m7aJacU2s5sl+80cJZG9kT0nOVuFLUIaOvhVOrbx5FGzhGrcYyOakxEt3fxKQ++cvMG
         9958rxRvHHHXTmBHX8+IsuG5hrRERwFS1WjcXrOHIsmz4Lh4336u+HA4u+5uiI1WT5YK
         Z/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745848101; x=1746452901;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GAe6W2gZk1iGHoxhoEUMCfyIjqKxJSFAIm22Dz+2LF8=;
        b=iIHrhpjoPa8LyGZy5yOA4F1Tpx12HBibs5tn2ql8Wg1Nbna2cgJjopNdTtsr52Ngcq
         Q3QqFI4kjBpVDd+r0Dr64CZKKb2wMmmxSyqtLuNvdJByp0OihOKBMnd6Ga05bUPqd0Q/
         sV1fXjv4emXK43tsFedgg3cuxeXr079n+u1M6B33LM4u25u7/pKbfBirTMOY8G+k74kC
         aATPU6As/C3mQ2DtgGE/PGUyTmt/heMvrO8b0RYSzDGForBSMHTmKNBj75mnOX5fNVaf
         JOvF9qB/cegaUEYN7z6XK97Mk0oByQnDFHyndjiVHoW5LenwEjmHOfJmdUH6xWUyASAO
         U4Mw==
X-Gm-Message-State: AOJu0YzhVa+30DL3FIuCsIR0fN8nvyGcT32TsUuxFcqyqtp6tDSQ2j3T
	tzCMyBcWIBmCgIo7olv6tyBNwkvfVU6xQWVZWBLsMNssc6dislqZt6KUk4IUzK9xFLGjnYc+jvS
	N9YA=
X-Gm-Gg: ASbGncug3J9nhIE9ecWzAn+66R+6/XmVFkPGx1FOPSGHLMcRnJkD5rYZRVoe8ln1CZ5
	n71IX49ZmXoCcpLxlSRdTIKSNx4YSKH9NKUn2dsa95CVKMi6ANsfaWL2YnD1WFLsF1gZ7eUlSgu
	iMeJ8EKELSdNUKTHoe3rAvzMoZzoYdevImiHoWOKY+Q6v9OXI4PCvJL6G+mYqP/w3sJLN6tYyIm
	QeerfmD0qq8W3WzKZKGjFTSllZw0X1yINXQ0Cf2VzO8QZ7BxQDWllDQ8DmjaYrjYcBQUQzNfExY
	8L4BpEw45oMmPVWBioKOOvK8dU7+Dd9iXq1TTnQ2tYctXEGgzCqsQDZkLg==
X-Google-Smtp-Source: AGHT+IH4O527aHguIUVV3siL388IM07vR/UbUC+eNQfwzzAc/Vwm7SV0+DuudgAPsYmuQyIZhrvkUA==
X-Received: by 2002:a05:600c:82c3:b0:43b:ca39:a9b8 with SMTP id 5b1f17b1804b1-440a65b9f26mr37913035e9.2.1745848100956;
        Mon, 28 Apr 2025 06:48:20 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:785:f3a7:1fbb:6b76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5303c68sm124326705e9.12.2025.04.28.06.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 06:48:20 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 28 Apr 2025 15:48:20 +0200
Message-Id: <D9IBI128G7PQ.10FJADCTGTA4T@ventanamicro.com>
Subject: Re: [PATCH 1/8] lib: sbi: add 64 bit csr macros
Cc: <opensbi@lists.infradead.org>
To: "Anup Patel" <anup@brainfault.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250415131908.2699782-2-rkrcmar@ventanamicro.com>
 <20250415131908.2699782-3-rkrcmar@ventanamicro.com>
 <CAAhSdy3L1_FFuy-UzViRdCWSQeZc6v_fBhwbHb9oT7Ei4FA0KQ@mail.gmail.com>
In-Reply-To: <CAAhSdy3L1_FFuy-UzViRdCWSQeZc6v_fBhwbHb9oT7Ei4FA0KQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_064822_507690_49EE999D 
X-CRM114-Status: GOOD (  10.57  )
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

MjAyNS0wNC0yOFQxNzo1ODozMSswNTozMCwgQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz46Cj4gT24gVHVlLCBBcHIgMTUsIDIwMjUgYXQgODoxM+KAr1BNIFJhZGltIEtyxI1tw6HFmSA8
cmtyY21hckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPj4KPj4gTW9zdCBDU1JzIGFyZSBYTEVO
IGJpdHMgd2lkZSwgYnV0IHNvbWUgYXJlIDY0IGJpdCwgc28gcnYzMiBuZWVkcyB0d28KPj4gYWNj
ZXNzZXMsIHBsYWd1aW5nIHRoZSBjb2RlIHdpdGggaWZkZWZzLgo+Pgo+PiBBZGQgbmV3IGhlbHBl
cnMgdGhhdCBzcGxpdCA2NCBiaXQgb3BlcmF0aW9uIGludG8gdHdvIG9wZXJhdGlvbnMgb24gcnYz
Mi4KPj4KPj4gVGhlIGhlbHBlcnMgZG9uJ3QgdXNlICJjc3IgKyAweDEwIiwgYnV0IGFwcGVuZCAi
SCIgYXQgdGhlIGVuZCBvZiB0aGUgY3NyCj4+IG5hbWUgdG8gZ2V0IGEgY29tcGlsZS10aW1lIGVy
cm9yIHdoZW4gYWNjZXNzaW5nIGEgbm9uIDY0IGJpdCByZWdpc3Rlci4KPj4gVGhpcyBoYXMgdGhl
IGRvd25zaWRlIHRoYXQgeW91IGhhdmUgdG8gdXNlIHRoZSBuYW1lIHdoZW4gYWNjZXNzaW5nIHRo
ZW0uCj4+IGUuZy4gY3NyX3JlYWQ2NCgweDEyMzQpIG9yIGNzcl9yZWFkNjQoQ1NSX1NBVFApIHdv
bid0IGNvbXBpbGUgYW5kIHRoZQo+PiBlcnJvciBtZXNzYWdlcyB5b3UgZ2V0IGZvciB0aGVzZSBi
dWdzIGFyZSBub3Qgc3RyYWlnaHRmb3J3YXJkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSYWRpbSBL
csSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4KPj4gLS0tCj4+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL3NiaS9yaXNjdl9hc20uaCBiL2luY2x1ZGUvc2JpL3Jpc2N2X2FzbS5oCj4+IEBA
IC0xNTYsNiArMTU2LDI3IEBACj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICA6ICJtZW1vcnkiKTsgICAgICAgICAgICAgICAgICBcCj4+ICAgICAgICAgfSkKPj4KPj4gKwo+
Cj4gUmVkdW5kYW50IG5ld2xpbmUuCgpPb3BzLCBpdCB3aWxsIGJlIGdvbmUgaW4gdjIsIHRoYW5r
cy4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
