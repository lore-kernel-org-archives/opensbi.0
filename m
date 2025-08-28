Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F3CCA0EED
	for <opensbi@archiver.kernel.org>; Thu, 28 Aug 2025 05:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJfENcJvDtjSVQ8RJK4eYh3SAe6ZZApRwUJFTjMGTy4=; b=qFCrk0Do6qFgb9
	H6uzr/lyxv0YDevJvyQe63xIBjaBt/5TeMckAJv8v14xSoncS4l2tjywbGlly6plkZ4+wkW60p16I
	Sv+D8HFB1+lpmxfrAgBV9tEW+nPAl7Uvf/sAXejYVFs1Cwk3Qml7/BsjKZWHBSKjIWDo2BiJUdb8l
	P+EEMZRLG99U6TE8RYTSKnavJ3ob7BHEoo37kpd1NJQgJ4ykHlWUpAZNuzGp/AbLUEGHM+iKREDj9
	zi0ZhLGdX3qdgf3U/acp+ZyP0fO8xzqtZdf6uAT2WG3Pl0YoXcXecugcNwqXIkpPcaJd6S4Lq5oTO
	romxBi7oiVrS/UcKXcXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urUlA-00000000Hvn-2Lwv;
	Thu, 28 Aug 2025 05:01:16 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urUl5-00000000Hv1-1gMM
	for opensbi@lists.infradead.org;
	Thu, 28 Aug 2025 05:01:15 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3e854d14bdaso5755935ab.1
        for <opensbi@lists.infradead.org>; Wed, 27 Aug 2025 22:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1756357270; x=1756962070; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnZWuJWADJh7wIZTxpt3AYzkh0TVrfph7nXU+LURYbs=;
        b=YcB8cPl8VyyNTEEnxtkRv3Rhlh/B8creJ3aePC1QaBC8YHVND37rEM8q/au/qtNzw9
         Ujqdvnt5Uub5dhgaKVnTdBWR42T51qP+g3W3tPeNeU1yytG7/D9pA7SEmEUZSVfFEo3N
         /y6x/oZ3J19MH9I4jooVw9za/cwmXLUIOatLLsdHuVA0+ULpSN9V9lWZU0Tti1cZQ5ML
         Mpj9mFIBnKB+6VDpDyavauTRiryRUJEyYFTVCVzfOjl9q2a7hOmNgeXf+kf0raPqa1aj
         B8N3Lx7bv5rN4tdkkkEsIX8vcGbcrx7dstH5oi3Ycv7bBHk2SZFlS6yOYaIbL80w/BBF
         XrnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756357270; x=1756962070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VnZWuJWADJh7wIZTxpt3AYzkh0TVrfph7nXU+LURYbs=;
        b=U/SxEM68kiKvrOx+LyJqe/UZZ/mLhzdbGY6iVgJoZpqhLm7/gLLTcIKOEPNPjbd6Lo
         MUw7W3xEy4nT+FFTArCxnRnXZ2CqDOTY1GhnUGPOKc4nOTCp847VV3muqsixRa85V3iV
         UVZhvAeufC2zdybJ/FD3x2irWHb1Y/eSn3V4MgdKPOrA08Ma5MUI536Gb1r7+YEizRiT
         rbrFJsf5zR1EqAxPdmA4OC0q9zraFsfuJMzbuZiDwpZYKObTLHNetmsMJPV9Fp9dPT7f
         UwyZ9cJOoCjkRYRu5igkMj8G6poojvVNiyfTwnHwbeuvN9JzW4x3w+N3XC7Mffp8aeFX
         JFYw==
X-Gm-Message-State: AOJu0YxkrSs0/AFoI1VVviJsFIAAUDTRoULnDlBqiYROqqip5K8V+StQ
	PvpFHA9QkfzJYYoRSxJv5sUUD10gVP6ANsdj2Yj5/g2iooUszxiFri0czVIcfDvk+loZI/UuKdJ
	2yM5HzqNuVa9lKI/5SIcjlzegs0eoagPF5bAki9ua3DN44xHZsUCq
X-Gm-Gg: ASbGnctCIi1Fs+LjjbLVM2fEZlxfo4YhOEiolpYRFIKz2HSm1ZQdmTFnJyGBscyrsck
	QPlRRoiCcNw9PpSj9/z8WZ/kHvZOBC72mdf7Pc7H9qKyG+kJS12IKBAaVWlfZO5Rw/0jm6Fx+pr
	Lfl6ccKJyx1i3cQd6DFGDNdE4Vbd5eMBoB74NyK9tG2HC9wkLrZTlKfu8Ib0UbuS6rhX9BADdaL
	+D8GOW7B4l9cu+MheyQ1zocxXBNiBDQH7LPAC3x3B1VYFYig8U=
X-Google-Smtp-Source: AGHT+IEHFMtMU6xl3R/tVLgPHmpLAXdjTM7UW7UBdzm3F1ov+b2fdSOrRDuBOkxQhmPorgsUgsmcREhzQFpbV0MqTRs=
X-Received: by 2002:a05:6e02:1568:b0:3ec:df8e:6ab5 with SMTP id
 e9e14a558f8ab-3ecdf8e6e90mr184226755ab.20.1756357269787; Wed, 27 Aug 2025
 22:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250722233923.1356605-1-samuel.holland@sifive.com>
In-Reply-To: <20250722233923.1356605-1-samuel.holland@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 28 Aug 2025 10:30:58 +0530
X-Gm-Features: Ac12FXwL238KZVd8W33UHCNa92Y9ooRXstwx5UPvJ-PIQ786Pa1XUROH5jwoS7Q
Message-ID: <CAAhSdy1+PRJTQpVHcJ-EtNgxT=15+Q_EGjLZmhU8AzLbRfjVCg@mail.gmail.com>
Subject: Re: [PATCH] platform: generic: Pack the FDT after applying fixups
To: Samuel Holland <samuel.holland@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_220111_548125_A4D5A23F 
X-CRM114-Status: GOOD (  14.89  )
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

T24gV2VkLCBKdWwgMjMsIDIwMjUgYXQgNTowOeKAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IFRoaXMgbWluaW1pemVzIHRoZSBzaXplIHRo
YXQgd2lsbCBiZSByZXNlcnZlZCBieSB0aGUgT1MgZm9yIHRoZSBGRFQsIGFuZAo+IGl0IHByZXZl
bnRzIHRoZSBGRFQgYnVmZmVyIGZyb20gY29udGFpbmluZyB1bmluaXRpYWxpemVkIG1lbW9yeSwg
d2hpY2gKPiBjYW4gYmUgaW1wb3J0YW50IGZvciBzb21lIHNpbXVsYXRpb24gcGxhdGZvcm1zIGFu
ZCBmb3IgYXR0ZXN0YXRpb24uCj4KPiBDbG9zZXM6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1z
b2Z0d2FyZS1zcmMvb3BlbnNiaS9pc3N1ZXMvMzg4Cj4gU2lnbmVkLW9mZi1ieTogU2FtdWVsIEhv
bGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+CgpBcHBsaWVkIHRoaXMgcGF0Y2ggdG8g
dGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKPiAtLS0KPgo+ICBwbGF0Zm9y
bS9nZW5lcmljL3BsYXRmb3JtLmMgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKykKPgo+IGRpZmYgLS1naXQgYS9wbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMgYi9wbGF0
Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMKPiBpbmRleCA0N2U3NzFhZC4uODg5ZDY5MDUgMTAwNjQ0
Cj4gLS0tIGEvcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jCj4gKysrIGIvcGxhdGZvcm0vZ2Vu
ZXJpYy9wbGF0Zm9ybS5jCj4gQEAgLTI0NSw2ICsyNDUsOCBAQCBpbnQgZ2VuZXJpY19maW5hbF9p
bml0KGJvb2wgY29sZF9ib290KQo+ICAgICAgICAgZmR0X2ZpeHVwcyhmZHQpOwo+ICAgICAgICAg
ZmR0X2RvbWFpbl9maXh1cChmZHQpOwo+Cj4gKyAgICAgICBmZHRfcGFjayhmZHQpOwo+ICsKPiAg
ICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiAtLQo+IDIuNDcuMgo+Cj4gYmFzZS1jb21taXQ6IGNj
NTQ2ZTFhMDY5MzBjNWViYWY2ZTkwYTlhMjhkY2E0MjE4ZjE5NTQKPiBicmFuY2g6IHVwL2ZkdC1w
YWNrCj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRl
YWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVu
c2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
