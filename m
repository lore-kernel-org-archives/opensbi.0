Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6246D606A31C
	for <opensbi@archiver.kernel.org>; Wed, 18 Nov 2026 09:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m0d1z9qT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=summations.net header.i=@summations.net header.a=rsa-sha256 header.s=google header.b=h+GCSHJG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0dN0jfQaSqwVYQHAjPooBts3SW8LW7YPeNjQz6zn+Z4=; b=m0d1z9qT6dYSAQiwM2rcw8J9S8
	kb4ptDja/05bs5Ig5jwHIETaZC+gUSLx1ieQbsox+UmkBhv4KQsmR/zpQM09vX/fRsteH1wmw7+/V
	9jLk29G7ovITPvu1VQKWvhT3U1XtHEMm1uVgLiP9XX5+E0fPZSKgBEKNXZL/Lqruzu0B4b/sgEVly
	MCyHBo+9dBW87Hq09pGEJ3i4qvG+CTybbPAH9tlR4xrOM+i7vhoz4s4manFat41iWdxaHfjEHNS3K
	cvCLFUeIEFikcuPuUGtlytV9rKtmChaUrg0dm6Uw6HVqzVUjL/trhfpEtMfPe8CeFNNpMeDbp8huS
	4uX3cesg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbxO-00000008MjI-4BW7;
	Wed, 18 Nov 2026 09:27:59 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbxJ-00000008MdR-1iWE
	for opensbi@lists.infradead.org;
	Wed, 18 Nov 2026 09:27:57 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-8b4dd5cb4f6so4572127b3.2
        for <opensbi@lists.infradead.org>; Wed, 18 Nov 2026 01:27:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794994072; cv=none;
        d=google.com; s=arc-20260327;
        b=RX5n5Ij0HNF2WEZgIDAPRaWef868I/YuWQDbMBR0FNBW3UwEyUpfa/cCrHUFOfEvMj
         QdBfqFn2rksYj3XfwwXOjYcfqSL6gzVHlc5S3raQNOskpPc0wUi+YS3cqH9MkV5IMfjY
         YTnqfcpaIzkzC1Glu8iNqts/fr1dv/6xP+CZ/THCyQ8u//6I5Jrn+YCnMmEWqQJgb10c
         qAHPCfMLtp22oUffigO3YPy1KlRlM9HCAYU/tsQhnYDxQkCW1VTkEHi1bJtFlgelGlTO
         WpOz5srn2q78JxZ8BqDZfrpuBnNiO89PcU+fj0kv8mhUuknncgPOsrDwupdIX2bNbB/2
         +LDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BBl1PfFTOJLSDlrp9flgG1YDne9NfMwCIOuUoq+B7QE=;
        fh=Ck9X1cQ6zEXteMjVk79ib6BKr+LbI80fo5ky5B2JXhI=;
        b=NtjeQFLaS6/4FJpYUHyyDLRHj4fySuzDTYB9w3CiIVcYZydy3eFXI+4FbiqmSzzx4T
         w+CZVL3q9lCDUwcbY0RYnzNCnh7uWvQXJH+lb0576ANQICU6bpKUJr58IfK2Uys6dGDG
         fyJjjUemNa5sn8ibE4LkSa4xbnU0hV0c+oMZoaIdWNeSxdJX5ho97g8sUa3DES0yZRIf
         LaloQhfV5UyuIktcT1fnkgqcYv0In7JFUeAGWJ8m1L3OQ+P/KIEyWWrgj850tbOTiRYk
         XiC2P6SQR1ZMjHkTvEOCautyIBp+//KmHwgZlb51DskYhL/rqr3CQzhFSxd2Vg5W4QIi
         ZWMg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=summations.net; s=google; t=1794994072; x=1795598872; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BBl1PfFTOJLSDlrp9flgG1YDne9NfMwCIOuUoq+B7QE=;
        b=h+GCSHJGCHc1DC0laAqzTdTUXx3pqfjD54AeNxlB2bKmvtA8YG9PpgZEEkJLsabOtl
         wxMfOzhLDuhAg8vuiLwa1ENIK5rv6tmUxOcOJvPudayECLtvnK3wsZXiYpIeuIOp46ph
         lDZv05IPuII4wV5g6jhwQP3ZX5TY/lN6U1qIB07j9pjBeRa4+Qz8+8kfSd6hMAi3C/4o
         /0s/YtABKa42HZDEhAlF1NIaJPMNyZYl1Msp2K4Bag93tizBt84hrv0XLS8aEEBe/pQU
         s88QIVFKFPCEBjBgthM287Qs7DUuI2lCozdts9eeczQamdUJMhAH+9aAJscbin+EwNRz
         O0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994072; x=1795598872;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BBl1PfFTOJLSDlrp9flgG1YDne9NfMwCIOuUoq+B7QE=;
        b=J4pirRN0ug0762JPunbsUQogPzfWu43oyfuILoGR8MGjrDdjFoejZveBvDjOTM2t1A
         /eUOv5I9l58DHtxUIaoJC8oprhuVS0n68pTn31hf18cZfTsFKAeUwdnFwWNJtGkg9+3A
         4H6ot4uyo4Ltaw3oV6iQCy12e+tcI0Rd634NzwzpMxFXunN0yXZY/5nwX4W7yNx8R45A
         aseOUa1F00157lz16Oi3RxyfxXP4Q9UY/h/Wo5rirNAyrRkZQQUr1Ge+RJQwYaTpuwW/
         p6puXU2AMvaSrHgmO+pFB/NpiH2buYEjVgGQIoaQlufUa1eAUK64qMPkjqpvUdM+p/c2
         212g==
X-Gm-Message-State: APuU4Z/o93EW8qtvMCfLWZOxPKKrGJsl+ALddedGohEIGuzQz7cTSHDM
	Os0ztPQjuRHugqUBhd67ea4Q0uYunIJGXHAMxazZJvHGJh/t+pP5pt+jnmQsrQtNQj9XTE2sxFf
	WnDilNeFEY32Cqun8D5MI4/5CHuVivBJq6buFo7O4yaw=
X-Gm-Gg: AZFdTZdTUZUymo7sBXYMQ5Dr5/znKvLCTrra3RrbB2DlZiecOG/VLLc1sU25YEpgTbQ
	YLujZaij6zXLYbRHlGB5CReL9gzL7KQaFQqN1CtdXtyK20biCK9mf0h8RWAIxEgw/hqIwEa3JtP
	K+jda0mE5U5cvsXdxoP7lIW+qsb6isV0cr37VR4+adgWAvTp5vmekn0FN+Kq6TrtrN2mCa63sil
	5i/pV0rgpH9Mp6Nol6DfEdf8HNnp28YF/OfMRmW2ewzHBxHuEHq5GtxlzWCPVbOm+kCHsFaCaH0
	hYw+NaEEeOoZzXrMGdzmY0pBFPUOa6gsCYdtbd4GKP1ewJx0e+tQf4nDf9v/myVB2wyCVwsOFPG
	LhyKXjI5hEuClyTQejNqieJmv/MwFk0/ZneLq8XwkjO3C3EF5LICK6GlcpAFrj2VyAfH/000vml
	Hv95v7E3vTMfUZku4gV5/MeexhTw==
X-Received: by 2002:a05:690c:4d43:b0:8b2:edac:7a91 with SMTP id
 00721157ae682-8b4fed57b8bmr8469987b3.35.1794994072143; Wed, 18 Nov 2026
 01:27:52 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117184547.1145243-1-pawandeep.oza@oss.qualcomm.com> <20261117184547.1145243-8-pawandeep.oza@oss.qualcomm.com>
In-Reply-To: <20261117184547.1145243-8-pawandeep.oza@oss.qualcomm.com>
From: Rahul Pathak <rahul@summations.net>
Date: Wed, 18 Nov 2026 14:57:40 +0530
X-Gm-Features: Aa3M54rf45Wuum2DXMhLDv7xzNN8s8t1le2-GgblOQh17HCiQgSXS1URla7hCZo
Message-ID: <CABdD5xnFtY0EFxBPmst=z4jC95Fgc33CUH5DcnB7zV2M41xoFQ@mail.gmail.com>
Subject: Re: [PATCH v9 7/7] lib: sbi: mpxy: Register extension unconditionally
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_012755_813559_0C4659B0 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
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

T24gV2VkLCBOb3YgMTgsIDIwMjYgYXQgMTI6MTXigK9BTSBQYXdhbmRlZXAgT3phCjxwYXdhbmRl
ZXAub3phQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogT3phIFBhd2FuZGVlcCA8
cGF3YW5kZWVwLm96YUBvc3MucXVhbGNvbW0uY29tPgo+Cj4gUmVnaXN0ZXIgdGhlIE1QWFkgZWNh
bGwgZXh0ZW5zaW9uIHJlZ2FyZGxlc3MgaWYgYW4gTVBYWQo+IGNoYW5uZWwgaXMgYXZhaWxhYmxl
IGF0IHRoZSB0aW1lIG9mIHJlZ2l0cmF0aW9uLgoKVHlwbyAtIHJlZ2l0cmF0aW9uCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBPemEgUGF3YW5kZWVwIDxwYXdhbmRlZXAub3phQG9zcy5xdWFsY29tbS5jb20+
Cj4gLS0tCj4gIGxpYi9zYmkvc2JpX2VjYWxsX21weHkuYyB8IDMgLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAzIGRlbGV0aW9ucygtKQo+CgoKUmV2aWV3ZWQtYnk6IFJhaHVsIFBhdGhhayA8cmFodWwu
cGF0aGFrQG9zcy5xdWFsY29tbS5jb20+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNi
aUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vb3BlbnNiaQo=
