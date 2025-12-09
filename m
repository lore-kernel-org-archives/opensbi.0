Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7CAD3B7EA
	for <opensbi@archiver.kernel.org>; Tue,  9 Dec 2025 04:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3F6VovC4DSRB2JQQ/IJmvBdy1uBDV/8udoAd2qoqXUI=; b=vpuz4m3F/8Oivl
	AFv1jxY/xwsTuPQZcHmEURJFF8O9hyQ/HtdP4iYPIKVa6LpsiOWNDVoE6JLVyxM02+omz0MWsiK50
	sFJsh91BWw3bGpQMw7unOd1iScC2tHrgV5LDnLRM54Pl1vf/VWeTW9yTydVUOlpIEOSxKtYxK/LY3
	jv9BDhIB4wMJcf0khLX5zzivtWJqQe23dOvghnLvZqGw+AtyvoIBNXoUU+nZ4O4RYRx7qmFLdeSL5
	TfWDU/8CJ/8bN4U2ZE7RY1JaWT209aMAJFpvKjBtgC2P8s+takp46lQqugJEtL5YnMEzE30VX39uP
	g5K+lsKd9eIYFeGXcoVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSp2M-0000000DnVH-1eQZ;
	Tue, 09 Dec 2025 04:09:18 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSp2J-0000000DnUu-06Ol
	for opensbi@lists.infradead.org;
	Tue, 09 Dec 2025 04:09:16 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7c7bfba3996so3535952a34.0
        for <opensbi@lists.infradead.org>; Mon, 08 Dec 2025 20:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1765253353; x=1765858153; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4UmSGsF0dVZZJHw6JSpGu7r8mo6DRR62wTB0t3Ec20=;
        b=TN98urZTH1r574+rPca/HgIi9x1T3SYFwpe0xGJJlztFdCH6LtW5UXq2C7yzD33JlY
         wlY1bbl+VeqtvnzLpAEaKfGkBjv3J/EkVCLXZXnYSMG4BM5+NhfTWTV09Oxdp7jDyV8H
         26f6KQb2Cus9gXwoDiyrBndDc4UNClaWhYX0SNkUapIkBoGNIaE9V3PnY4J7NqbNMw1d
         McnYEBfNSa5wPc5j9U9ii1kmIGN9TqypYxOMUJnopxQFyHLLEpps6ZFqXUOMNPKFO+r5
         Pqo1/1K598i8amruNss8A+2JJlmgdh4Mpto7M5yxRgdLAZ2VdxztcZlLb4wkivF2osj2
         04/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765253353; x=1765858153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t4UmSGsF0dVZZJHw6JSpGu7r8mo6DRR62wTB0t3Ec20=;
        b=NrUI55xwPxOokR7lfZWm3MvPbKBdWEi1eNR2aIh2dPQKYR7GDQOJhYb0DTMBo5Ytxt
         j22czg8QuEWzTdLnYCHQV8wJB2Ov87CDRRNatzzokPLQB257rIi+tv7Ei3/h1bRAXola
         7ul78Ksw0wD1UXV7sXB4yuTokqgzYxfmZe9y1jqj6Ec0rQohstK1nijdX5+31meTCo95
         1VbcHAs5y9HRVEuU8cDmiOl4Nzfw9jnt/c+0LALYm1DH73q3FOxBSL28lhKzUn6W0tPI
         +rj2wRN9uszmHWNO/sD3jjTH1FHw3Al3PcV1dbI2DVGQi2PNa0zXRQ3p3UA8Oqv3ydJ7
         sVHA==
X-Gm-Message-State: AOJu0YxQ2bVuHvf+65n0GRKTSB6D2hDUUFxH+/owc1DwSgKQVotLrlie
	FksRw722x0LkA8d4il+AEz/J2xh4ElZ4PJ/1LgRRAev+3BVJ+VW6g5FJ7qZsFv4n2/QJRt2ZcnV
	ECWWgklIl3Pbvj6VHSEcU94OaBBlUfhGT0LREnsU2Qg==
X-Gm-Gg: ASbGncs2SIBV/AQ9uT0EFO21ez/ksTAoe4STseT57G5It6nZrjeEp9hKLac7GBrmWev
	xA/xw0b7Rfr0Lq/CwAKwPG8apfo4PChkeZit4y6vLzrUwOWmnlHkNV13LAV17lWDIuu5TMV7qu3
	pqgqhXv7EIWLh0MOHt/o5J6TdJ+DYvNjw4S2TkB+fnPUUp3sQSdLoYsuzN7d7woyRVEOh/YRaWM
	ORC5zR4B7K6gQT6oMfXwltcqMTGxabWqc3ME7beMQRfGtJeVt6UuXqBJpN/ARNzHsn96oQ=
X-Google-Smtp-Source: AGHT+IFfb3n+rO7yN8HUQhUVCdnl85q0K/we0GgwSayV+gSOgAhLKa5e9V/E/AkliZM3JFcCwIGA6g5IQWwMRVDMu6Q=
X-Received: by 2002:a05:6820:198b:b0:659:9a49:8f03 with SMTP id
 006d021491bc7-6599a8c01b6mr3623262eaf.20.1765253353597; Mon, 08 Dec 2025
 20:09:13 -0800 (PST)
MIME-Version: 1.0
References: <20251208092615.1081606-1-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20251208092615.1081606-1-vladimir.kondratiev@mobileye.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 9 Dec 2025 09:39:04 +0530
X-Gm-Features: AQt7F2rBqwWIJme4WRwmcWcdEuzPszjWUn0Xr6zwz-UdcNmWFK6_wmqTo8sMOW0
Message-ID: <CAAhSdy3X8iOME9ABsfx=N5MFnmLvYBRejDNqOjgtsn2g1JGspg@mail.gmail.com>
Subject: Re: [PATCH] lib: utils/fdt: devices to use MMIO memory
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_200915_287119_82BF059C 
X-CRM114-Status: GOOD (  15.69  )
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

T24gTW9uLCBEZWMgOCwgMjAyNSBhdCAyOjU24oCvUE0gVmxhZGltaXIgS29uZHJhdGlldgo8dmxh
ZGltaXIua29uZHJhdGlldkBtb2JpbGV5ZS5jb20+IHdyb3RlOgo+Cj4gV2hlbiBhcHBseWluZyBG
RFQgZml4dXBzLCByZXF1ZXN0IGRldmljZSBtZW1vcnkgdG8gYmUgb2YKPiBNTUlPIHR5cGUuIE1N
SU8gbWVtb3J5IHR5cGUgbWF5IGltcGx5IGRpZmZlcmVudCBwcm9wZXJ0aWVzCj4gbGlrZSBjYWNo
ZWFiaWxpdHkuIFJlcXVlc3QgZm9yIHRoZSByZWd1bGFyIG1lbW9yeSBtYXkgYmUKPiBpbmNvbXBh
dGlibGUgd2l0aCB0aGUgcGxhdGZvcm0gYXJyYW5nZW1lbnQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBW
bGFkaW1pciBLb25kcmF0aWV2IDx2bGFkaW1pci5rb25kcmF0aWV2QG1vYmlsZXllLmNvbT4KClRo
aXMgaXMgYWxyZWFkeSB0YWtlbiBjYXJlIG9mIGJ5IFNhbXVlbCdzIHBhdGNoLgpSZWZlciwgaHR0
cHM6Ly9naXRodWIuY29tL3Jpc2N2LXNvZnR3YXJlLXNyYy9vcGVuc2JpL2NvbW1pdC81MWZlNmE4
YmM5NTgxNjZmZjc5ODA1Y2Y2OWJhZmU1ZTI5Nzc3NmY0CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+
ICBsaWIvdXRpbHMvZmR0L2ZkdF9maXh1cC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9saWIvdXRpbHMvZmR0
L2ZkdF9maXh1cC5jIGIvbGliL3V0aWxzL2ZkdC9mZHRfZml4dXAuYwo+IGluZGV4IGYzZmU4YWY5
MWRmYS4uYjBlZDIwYzg1MTQ0IDEwMDY0NAo+IC0tLSBhL2xpYi91dGlscy9mZHQvZmR0X2ZpeHVw
LmMKPiArKysgYi9saWIvdXRpbHMvZmR0L2ZkdF9maXh1cC5jCj4gQEAgLTE4NSw3ICsxODUsNyBA
QCBzdGF0aWMgdm9pZCBmZHRfZG9tYWluX2Jhc2VkX2ZpeHVwX29uZSh2b2lkICpmZHQsIGludCBu
b2Rlb2ZmKQo+ICAgICAgICAgICAgICAgICByZXR1cm47Cj4KPiAgICAgICAgIGlmICghc2JpX2Rv
bWFpbl9jaGVja19hZGRyKGRvbSwgcmVnX2FkZHIsIGRvbS0+bmV4dF9tb2RlLAo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNCSV9ET01BSU5fUkVBRCB8IFNCSV9ET01BSU5f
V1JJVEUpKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0JJX0RPTUFJ
Tl9SRUFEIHwgU0JJX0RPTUFJTl9XUklURSB8IFNCSV9ET01BSU5fTU1JTykpIHsKPiAgICAgICAg
ICAgICAgICAgcmMgPSBmZHRfb3Blbl9pbnRvKGZkdCwgZmR0LCBmZHRfdG90YWxzaXplKGZkdCkg
KyAzMik7Cj4gICAgICAgICAgICAgICAgIGlmIChyYyA8IDApCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuOwo+Cj4gYmFzZS1jb21taXQ6IGRlMzc2MjUyZjRmM2UzZGY0OTk4YmQxNDg5
M2NiNjg3ODIxYjQxMDIKPiAtLQo+IDIuNDMuMAo+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QK
b3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
