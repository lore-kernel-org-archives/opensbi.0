Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FB4606A32C
	for <opensbi@archiver.kernel.org>; Wed, 18 Nov 2026 09:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UUJ06Hcl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=summations.net header.i=@summations.net header.a=rsa-sha256 header.s=google header.b=jSQVfDwV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=j2ZzlOS29o45tMlMmLJB6j4tLvcawNL1FUoZ1HzfSIw=; b=UUJ06HcllK+CEks9fVsJSWR88b
	QuKA2KuNWxnHYjOejpQVOQwoKdHW/fQM0MebnMHRjvpWhwX0Jw5sWLQPj0p44zHab61dlhjwLBXxN
	mRt5GsW4XBR1kPzqQPWyaR6flVruop+Y7rshuyw7NU+EArt7pKz7UWRlT40G8CKL6AGDnEuizK0yK
	J6ApK+Ltifdep6e47E2DmYKQ7j59+lKIloChHU/CTOEnFqSe5aVHJTe1DqYBNJtc93Bvf9qG3j7dG
	369FhMeK0b5k9NAtZLza3gChJO0e1lO/swzf2V3nRU9ZyFKdrTkwVtsLGsWG0dWqCSF1l0rfSop0I
	KAZPgN8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbzZ-00000008Nwp-3zHr;
	Wed, 18 Nov 2026 09:30:13 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbzX-00000008NvX-2ROa
	for opensbi@lists.infradead.org;
	Wed, 18 Nov 2026 09:30:13 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-8b4f4095a7aso6270137b3.0
        for <opensbi@lists.infradead.org>; Wed, 18 Nov 2026 01:30:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794994210; cv=none;
        d=google.com; s=arc-20260327;
        b=ODfHDAJdksPS0Gn9jkaRBAX4DAi7hw/Iw1+8qFWPN8DrXu+27UTEWbqORky0gh7uzr
         aZnU98rdCibmpDkr/449/fp3qDuWbmcWOiqMX8VNYsTVedIgFCdo7lvOC6OiQlo8kF2M
         Jv/Nl6vJaubSRyZMuyXnQbLlyfqoz30hgMPPh440J1MwblsFKKbjp2yuqrD5aUQztBTi
         4RoPsyEQ5eOOtPY7hjq/7dqOoXucqIpYxBw8H9RoHaRHR+NR6bcooTmWnEhoAUwiazCC
         BInghqpfYnC3cAAMw7naf0xru7ECXjL2Wygr9DiVvRUZ/NGfY1d0W6mNU0Sl4KHFY0wr
         Wgow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=abInSiZ92XO3g6MACU4OXtBosPVDGTJkJqR3H8Oa3DA=;
        fh=Ck9X1cQ6zEXteMjVk79ib6BKr+LbI80fo5ky5B2JXhI=;
        b=aoYdKqZlMvPSUdCkAhn+G2P6itHsYRfzmATG3CkxcDjATpPbRxoMYO9UOhYavtXhBv
         5l0cJb0lfJRn15Vn58kQ4mTDAsVHz0s9shvl89osZanF+59VLqnLhHEUPHAx7ttmCGHc
         phxl+VYKQMDy69jqcq5h8FOgauKo48SXvDxldPYYnz/P5HWwGojDxK/gHTif1lVccglk
         TJASpONbSrV6GTklTxmSLDqk1BY4kqjoITftl7eHiEFG0L1mEKqyELcjpwR3V2yTD+is
         r5RmYF7PfN/UbfKe+WvsqOHxycGDaUon9rmdmLPo/QSBHjmhP8Gie6kaW1AEM79ne96E
         RLgQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=summations.net; s=google; t=1794994210; x=1795599010; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=abInSiZ92XO3g6MACU4OXtBosPVDGTJkJqR3H8Oa3DA=;
        b=jSQVfDwVieWoFnFhzXlsh5hrDXC3Eh7nFEHgkehCQm0JgcHami3ZpYe8oEINNzYrkv
         /c+FyhgMfRVxqMoyUcpFVGhuxff4E9kvg+eXdOOoC0q8HHDmdjbSpQP0VfvzhKFlyNyC
         9I/YuvbXXbdNaf6m0M6Ody2p0inPBk3rr9H+/UIvVzZE+qpLeC8xcX962JOQQ6TsWBrc
         o9z5nT1eCqq/ecMN4MMHdjp0GMBYVUyW0YPTh2OAlEBPrtu08QjUAwmaa18RgxJlHwrM
         zGJ8LNSAkIf9NOSQ9J8ADEnr2aTlC6Y5n+4KOj43E2j3//l4rvuZplfX+o8oTIu6obfp
         9wNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994210; x=1795599010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=abInSiZ92XO3g6MACU4OXtBosPVDGTJkJqR3H8Oa3DA=;
        b=ysc0uh0kFlMDDQ5RCJnf60CRrjPxcg6IP0DQ3bAiv4HwiQ30C3RmG7eE015GOX0myW
         eDt8q9yYLobi3oL9oQVl/LP7Vi/wI2rmVGu3Rg/0D/IjO2FYP1jqg9B+KiAAUf1kIwH4
         83F5L5dy9rn4f9dxcCHgidKZQeoU0cUGQXH6DxUtjna+o8G6EilzaIONWPOT8xzSbLnP
         8fVIsE3Sm6FNz9nMRiDa2v9ozPDSo8ZUvGiPknFzh89QcUIO3VrRth1IeUMuWzLFGgzJ
         EePzGRh+fC55QhEDGgMbRbNwt/F6rYXPpocX96bdq6BnFR0S/NF2bWIyg4h8LKb7cqGa
         Ui3Q==
X-Gm-Message-State: APuU4Z+P0TE/bLteFsCEPYKAYsNFvWRV1LohZjESW6OvxVrPwcAhD3Ef
	7Yktq/LMeRiH8Azm6weJrwSBtny/5qI3kD6xfJcbJUdC7rNJGSFz2HETiLCz4yOqTY1HEL9reCC
	nrFxSPF9y8vah8wLcJ7kvekwEkC4bW9Hk1yaTmLmA+MAZDRqtCKdBvoSU
X-Gm-Gg: AZFdTZeqkUXx+dDymG4Ye6/vKst/lPoCGZgiJ0doDRedLnbgU6h7BJVjxfMDzrZZgFu
	tkagtPVvB86nKnDZk/E+xZwncx0yGtOaqQ2VHWC5klrQSe/vFlgzkothRUU9x36sb9zcMUvDI4j
	XjdzL+3T+pXskoodCYY+f63k1uLWd6fpqqbdgangkS/sfIABELnsnbMpHlfe004mYF/BJufqykt
	V2tGINgYPjU1XfX5Gj3wu92F8b2hi/P0qVbnf/Ci0HwDwnbgG3pBE6KoxuURHLoCfkmrXi8tUWV
	JP3cko6G+1KmLDlkblFYJ8v3tQNpaDKZma5UcWTzf+lofjVun8iHiUi6Y5mnT8hNn2MiHlg/Iq3
	Zbs1ZV/+q6e1x13LHoUREtDXxS3MD3lHjG6pyun60ihrj7pjchn5CUuB3OLA3mvrLB0//use+I/
	gcw4fPQ0yeKibos3MgqmmZCjf/pg==
X-Received: by 2002:a05:690c:282:b0:8b4:ccfc:e397 with SMTP id
 00721157ae682-8b4fed08c08mr8624267b3.11.1794994210178; Wed, 18 Nov 2026
 01:30:10 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117184547.1145243-1-pawandeep.oza@oss.qualcomm.com> <20261117184547.1145243-7-pawandeep.oza@oss.qualcomm.com>
In-Reply-To: <20261117184547.1145243-7-pawandeep.oza@oss.qualcomm.com>
From: Rahul Pathak <rahul@summations.net>
Date: Wed, 18 Nov 2026 14:59:58 +0530
X-Gm-Features: Aa3M54pAp-vCjVAdTUJ8Td7_0PxcYNNIumlFlAV4JhTYihBqdqhzEWQ1X3VxqxE
Message-ID: <CABdD5xk2h80seMJcv=iU64CO_UyMz2tH10Bh766h=jydSC4_Yw@mail.gmail.com>
Subject: Re: [PATCH v9 6/7] lib: utils: mpxy: Fix RPMI service ID lookup
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_013011_651472_CFD3EF8A 
X-CRM114-Status: GOOD (  11.40  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMTgsIDIwMjYgYXQgMTI6MTjigK9BTSBQYXdhbmRlZXAgT3phCjxwYXdhbmRl
ZXAub3phQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogT3phIFBhd2FuZGVlcCA8
cGF3YW5kZWVwLm96YUBvc3MucXVhbGNvbW0uY29tPgo+Cj4gbXB4eV9maW5kX3JwbWlfc3J2aWQo
KSBpbmNvcnJlY3RseSB1c2VkIHRoZSBjdXJyZW50IHNlcnZpY2UgSUQgdG8KPiBjb250cm9sIGl0
ZXJhdGlvbiB0aHJvdWdoIHRoZSBzZXJ2aWNlIHRhYmxlLiBUaGlzIGNvdWxkIHN0b3AgdGhlCj4g
c2VhcmNoIHByZW1hdHVyZWx5IG9yIHJlYWQgYmV5b25kIHRoZSB0YWJsZS4KPgo+IEJvdW5kIHRo
ZSBzZWFyY2ggdXNpbmcgbnVtX3NlcnZpY2VzIHNvIGV2ZXJ5IHJlZ2lzdGVyZWQgc2VydmljZSBp
cwo+IGNoZWNrZWQgd2l0aG91dCBhY2Nlc3NpbmcgZW50cmllcyBwYXN0IHRoZSBlbmQgb2YgdGhl
IGFycmF5Lgo+Cj4gRml4ZXM6IGM1YThiMTVlMzk4YSAoImxpYjogdXRpbHMvbXB4eTogQWRkIFJQ
TUkgY2xpZW50IGRyaXZlciBmb3IgTVBYWSIpCj4gU2lnbmVkLW9mZi1ieTogT3phIFBhd2FuZGVl
cCA8cGF3YW5kZWVwLm96YUBvc3MucXVhbGNvbW0uY29tPgo+IC0tLQo+ICBsaWIvdXRpbHMvbXB4
eS9mZHRfbXB4eV9ycG1pLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+CgpSZXZpZXdlZC1ieTogUmFodWwgUGF0aGFrIDxyYWh1bC5wYXRo
YWtAb3NzLnF1YWxjb21tLmNvbT4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9vcGVuc2JpCg==
