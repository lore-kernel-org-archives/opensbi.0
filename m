Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0770CD98E2
	for <opensbi@archiver.kernel.org>; Wed, 17 Jun 2026 06:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J6kFoKFxQt9vfJKdYr3mUqZZ/OyALe+IPvGEnSy2hk0=; b=wBz+Cg/TH1Oy3r
	7nK4quRq5moWGLMZhKJdc0NEZy7QJpZhkdjKnN5Wje6yl1DINPiWcffq1qEa/lr4UsGXrrpn87YOY
	a6/z6R6Cbm2mrC/g2V5Jwt1/nAhXeHCYRgZH+YTVjW9TlQRNfocFUZnrIyBC2yakvK73IMBSaHoNx
	dpJYmvyhp+JLZ0EOSwx/HZmGnZIeqtiJJwCRR8TRbI6MiCefWt1Lv9E6sziMXtCmn7cZa4ut3zUI/
	y2gUjwW74FSzo/lflzpmbOmULpCod5kzHjosdRpCOIr6x5ki8K2b7RJE9rYCSBu5QO20rA+CH346A
	jiTpYEGJL+0IdpX5qCtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZja8-0000000Ghdg-2YkE;
	Wed, 17 Jun 2026 06:17:00 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZja6-0000000Ghcc-3pXk
	for opensbi@lists.infradead.org;
	Wed, 17 Jun 2026 06:17:00 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-3967738c801so46270341fa.2
        for <opensbi@lists.infradead.org>; Tue, 16 Jun 2026 23:16:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781677017; cv=none;
        d=google.com; s=arc-20240605;
        b=l2P9Gk62YzpyUCk3RRJhL2vJF7tuBXdKRpRcDxNFZeeosU7+13U7FaQXTvUj8h5s3B
         xp3hvBZ/qp0buScnaT81D5dvWSHYYXkvnsOH+LY3TRspGdvEwwBbqTzdozt7R/nHyeUc
         89X4jktP+lAUIkECWShuPdCdUfQPD88zDxCfL4xwk33DpgEpS9ZkLpTAsF/LebD3eS6H
         4Rpm604+P8ITy1wubP98ytcR/xO6vgXV/MJrpUMIhdKXzrXqAtz6EgZJkCCuJdtqpnHr
         GuVSinzzTDh3EL0athwDMy6ksL87q3KYH1xjqi+sJ+YR59LhvgiO37L/R4rHEgDSoXO8
         36zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o6uI2Q+/aZotDRlFClbDJJSI5ADcOg31QWIYv1S5wfE=;
        fh=0p86q/2ythAQMBPuGbnW44JppkNwhxCdadir6TIka8w=;
        b=I+MQqnWnXZD1jrb960AP/4xDKIvzrhuoflRJ/wuh2dIU+49ZetRZp5Ygtexb+Swwba
         rG3TN7PxnJeZktKzU7JPnhsJm6OGYsV2EnOk5NgqwQw4wEx7c4lJG8jSJF4O9Pqb8BxF
         VzSL/EI95E8fNo6A5cxQ+SiqwAAtc0JEVpHOKLyThyHkjTPiC9v+IAL8GpWmuEu4MKtT
         1MXsnBh6DmgfY7xtXaR3YShwJCkCbqCcscmCfvEAXBznqdXTpzqldya3GESVnhHeFK13
         qcH2idEqCePJdDLCG4rqH0J75lyusSJeoqTZp2mEIpZ0XJJ3+VQ/fZmUTEDzo37s2q3y
         SVpQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1781677017; x=1782281817; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6uI2Q+/aZotDRlFClbDJJSI5ADcOg31QWIYv1S5wfE=;
        b=Qu5dxxdM1DrP68GiBhbgkEnDgCRG4D87fWkKW146yV+hS6YSA1ILHxY1hyI8IwToLX
         4IQkHeRLKiRjgR1ocaP70U0PPvnt3+TCXm379d9tloS5vNdw07BFhmdAtPzdbNcb1LO4
         L1kEEz3jBrZ/5RP0VbGdi5JBqBckBcAdkczwTRBVEaPURfyc/v+az1LcWRP+ZUuwYAZq
         05HK87qGcqqug40usbV6brI3qZjIaRXwcPJwKPOK0aTIaZFnlsR8IqZjNbUgaRqaxbfn
         fwT2virNLEJuTKn3Wx10JaYv6kfIS7hakEGjW+RgPYrDUGSMV1PXiD76pQMpq6o5Bm75
         HpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781677017; x=1782281817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o6uI2Q+/aZotDRlFClbDJJSI5ADcOg31QWIYv1S5wfE=;
        b=QNMq11qzg2s2/N341QiiFLlhwKulElHAWHzAajDA97q+AsHY52JWbxAQYk/aGQQuXW
         E/d/w1jhyfv+AzxIi05Yi/sckTzSiUb2xXbzog6jwaPOcL+Yari13cxv/0LnXevRSZhm
         N0RxNEN6xbNCRysHDWBdZl2zz4sG3AhED7+bSOQ1+u4JUaYltGfLSgIdB/VUurkkk8Xf
         ZwY72fXYs7YX4S3/K/WIEpfPIMPu5awaXESs/kUmGvTKvLeS7WBANg95fVW1ywZgTmpx
         BazpQzphkNrp7ytS+pnvF+8LFHe67Yx09guK0yUBitIIvvbwgtw5XZxQzDw7Z6V+O+iw
         Kamg==
X-Gm-Message-State: AOJu0YwgDcX60hlg3pwbJ5ui8P0ctX+qWgmrZpUR6JmIOxfQaSuOB02s
	EFXkgZ4Hx9W07jPKcb4O4hG1KSXEusUbBDvoCmd1FHozE7vtKI0JuBwR21nUQ2Tv/6MtHilyZbJ
	1a3+dPSaBWhvzFuiAb+pr8JMDx06khRvMzHUjVzSOiQ==
X-Gm-Gg: Acq92OFQ7ra5nlMqI/xGkvok+lfcvRZ4nzfwz6OFs2ZHQrlRYesQWiKrlDPJKf+n05Z
	EO3msJFmpV50d+/JD3HIwJO/U+TGZt/0fiK10EEPMxy26jW8LsbbtmNaInAHNqMyQieYRQxS/uA
	zjaxXRq1YuvdNr3CdP4sy/ksV9FjQ0LWw8YEyOROOVQjz/4GhBtbit+3RBFZGyU32owxBYV8GFN
	NnR1gQ3C7x6w8QbNuap9jgGdy+8SWOwi3qTvEUiGvRKPlfhmzoZ+5qdd9vEEw9ruCAoN/Gc/gVd
	JgE9rP7bvd9/kuoeXxCbYoaoZ8pq4A==
X-Received: by 2002:a05:6512:1090:b0:5ad:a04:e62a with SMTP id
 2adb3069b0e04-5ad46ff6205mr679537e87.33.1781677016641; Tue, 16 Jun 2026
 23:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260609060024.706-1-ganboing@gmail.com>
In-Reply-To: <20260609060024.706-1-ganboing@gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 17 Jun 2026 11:46:44 +0530
X-Gm-Features: AVVi8CffqJ-f246I1qurLlVIAEmh0MmHZTAmmY47sdJqRTa5E3RNeU6oOwNO77k
Message-ID: <CAK9=C2W__DgLp1fBK04-kjvWrFvQ7Jp5j=uqVKqruzpQa7ioHA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Fixes for vector misaligned load/store handlers
To: Bo Gan <ganboing@gmail.com>
Cc: opensbi@lists.infradead.org, wangruikang@iscas.ac.cn, dramforever@live.com, 
	andrew.jones@oss.qualcomm.com, cleger@rivosinc.com, pjw@kernel.org, 
	asrinivasan@oss.tenstorrent.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_231658_989613_7C6B6D4C 
X-CRM114-Status: GOOD (  15.30  )
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

T24gVHVlLCBKdW4gOSwgMjAyNiBhdCAxMTozN+KAr0FNIEJvIEdhbiA8Z2FuYm9pbmdAZ21haWwu
Y29tPiB3cm90ZToKPgo+IFJlLXZpc2l0IHRoZSB2ZWN0b3IgbWlzYWxpZ25lZCBsb2FkL3N0b3Jl
IGhhbmRsZXJzIGFuZCBmaXg6Cj4KPiBhLiBBdm9pZCBzdGFjayBvdmVyZmxvdyBieSB1c2luZyBh
IHNtYWxsIHNsaWRpbmcgbWFza1tdIGJ1ZmZlciwKPiAgICB0aHVzIG9wdGltaXplcyBzdGFjayB1
c2FnZSAqSU1QT1JUQU5UKiAoY29ycmVjdG5lc3MpLiBUaGVyZSdzIG5vLQo+ICAgIGxvbmdlciBh
IG5lZWQgdG8gaGF2ZSBhIHByZS1kZWZpbmVkIHZsZW4gbWF4aW11bSwgYW5kIHdvcnJ5IGFib3V0
Cj4gICAgd2hldGhlciB0aGUgc3RhY2sgY2FuIGhvbGQgdGhlIG1hc2tbXSB2YXJpYWJsZS4KPgo+
IGIuIE1haW50YWluIHRoZSB2YWx1ZSBvZiB2c3RhcnQgd2hlbiByZWRpcmVjdGluZyB1cHRyYXAu
IChvcHRtaXphdGlvbikKPiAgICBBdm9pZHMgZG9pbmcgZHVwbGljYXRlIHdvcmsgd2hlbiB0aGUg
aW5zdHJ1Y3Rpb24gZ2V0cyByZXN0YXJ0ZWQuCj4KPiBjLiBFeHBsaWNpdGx5IHNldCBWUyBkaXJ0
eSBpbiAoVilTU1RBVFVTLiAoY29ycmVjdG5lc3MpLCBWUyBpbgo+ICAgIFZTU1RBVFVTIG11c3Qg
YmUgc2V0IGRpcnR5IGlmIGNvbWluZyBmcm9tIFY9MS4KPgo+IGQuIFplcm8gb3V0IHRpbnN0IGlu
IHVwdHJhcCBpZiBub3QgZ3Vlc3QtcGFnZSBmYXVsdCAoY29ycmVjdG5lc3MpLgo+Cj4gVGhpcyBp
cyBhIGZvbGxvdyB1cCBwYXRjaCB0byBbMV0gYW5kIHNob3VsZCBiZSBhcHBsaWVkIG9uIHRvcC4K
PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb3BlbnNiaS9DQUVldjJlX1ZnMW1NUDRtT0th
bkZYX0VHZVV6cGN6UmNXVysrdkJCdU4xQ2Z5TTBCSndAbWFpbC5nbWFpbC5jb20vVC8jdAo+IC0t
LQo+IHYyOiBGaXggdGhlIHdyb25nIFBBVENIIDQvNCBnZW5lcmF0ZWQgaW4gdjEuCj4KPiAtLS0K
PiBCbyBHYW4gKDQpOgo+ICAgbGliOiBzYmk6IGNvc21ldGljIGNoYW5nZXMgdG8gcmVkdWNlIGlu
ZGVudGF0aW9uCj4gICBsaWI6IHNiaTogUmV3b3JrIGFuZCBzcGxpdCBzYmlfbWlzYWxpZ25lZChf
dilfdGluc3RfZml4dXAKPiAgIGxpYjogc2JpOiBBZGQgdmFyaWFibGUtbGVuZ3RoIHVucHJpdmls
ZWdlIGFjY2VzcyBmdW5jdGlvbnMKPiAgIGxpYjogc2JpOiBSZXdvcmsgbWlzYWxpZ25lZCB2ZWN0
b3IgbG9hZC9zdG9yZQoKQXBwbGllZCB0aGlzIHNlcmllcyB0byB0aGUgcmlzY3Yvb3BlbnNiaSBy
ZXBvLgoKPgo+ICBpbmNsdWRlL3NiaS9zYmlfdHJhcF9sZHN0LmggfCAgIDMgLQo+ICBpbmNsdWRl
L3NiaS9zYmlfdW5wcml2LmggICAgfCAgMTYgKysrCj4gIGluY2x1ZGUvc2JpL3NiaV92ZWN0b3Iu
aCAgICB8ICAgNiArKwo+ICBsaWIvc2JpL3NiaV90cmFwX2xkc3QuYyAgICAgfCAgNjYgKysrKysr
Ky0tLS0tCj4gIGxpYi9zYmkvc2JpX3RyYXBfdl9sZHN0LmMgICB8IDIwMSArKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiAgbGliL3NiaS9zYmlfdW5wcml2LmMgICAgICAgIHwg
IDg4ICsrKysrKysrKysrKysrLS0KPiAgNiBmaWxlcyBjaGFuZ2VkLCAyNzAgaW5zZXJ0aW9ucygr
KSwgMTEwIGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAyLjM0LjEKPgo+Cj4gLS0KPiBvcGVuc2JpIG1h
aWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKVGhhbmtzLApBbnVwCgotLSAK
b3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
