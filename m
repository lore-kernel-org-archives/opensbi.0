Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ADA606A320
	for <opensbi@archiver.kernel.org>; Mon, 26 Oct 2026 03:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d84n2yO7;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=vstk02xK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6jYJlD7jBP1rPs7pIfW4ZtY6guYkkOdjS55wXISp5PU=; b=d84n2yO7X494s7I11D9XA1w1yS
	Xwu8hmBNZFc5fwXrNELbB5JnT3KXr7jYkHq8CXnlj7NDqvN+cAGOv5Dxb3zj5aByFHtdpH6SrFR96
	5allSGSKFMg3iZF8FBENRCRlQ/Q31vbg5sVinlkimddn0swGnh59NmRl3dgC5xWwz7LpYZZDNoEZM
	4s3lkxcnSZEpiuHnDzYOEpg3JlU5J9LF+zSdlgj7mS/gWApNImft8YnLWpUxzLDTvuM4prVM42bPZ
	VUGhC4ZlVxyorNVBX/YQKxRgBDg75C6azsxFUAPYfZbBliPvLgo5Obd+w0K1gTJqJTdD0lB4qDOg6
	ZAyMCETw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLBY7-00000001fTa-1Vt8;
	Mon, 26 Oct 2026 03:39:03 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLBY4-00000001fT4-2RWe
	for opensbi@lists.infradead.org;
	Mon, 26 Oct 2026 03:39:01 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so4666615e9.2
        for <opensbi@lists.infradead.org>; Sun, 25 Oct 2026 20:38:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792985939; cv=none;
        d=google.com; s=arc-20260327;
        b=PtgTgItIul4wRUK/YXJ8xobuktaBYwiOPosfsuyjt2EMtFpLUgGs5zQxzbvnX4VsYh
         ia4bewmhuSae2CEtn6W9G9tyUkkrvRFzS5sUcPMkOTaqPjwO1o1F50io/EZvWi6LLiz5
         tnbe4vMTSOrw0gWBTYIFCMWBeNwjOQBBVC+nVCrxlC1+lHqlM9jtpbWs0eFPnycDPmDM
         5vChPqf6md+G23CE3F9qdSAZXavEykcFigx+OKwnFlXksuK3Tng8BYSLPVU9fofr1lNv
         wq7Gsa8wVjQDAI7cbphaooGCuRRN57NPwSuttHVPNgUGZ6dqt+n/ilX3WE3p89Wy3Vnb
         Miig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N9F43lK2NWhV4Ki7Elnt3R8wVPDJN16I9PpOYIv7Urs=;
        fh=SD7QiKy5Vs2wzQilLwPHhamtFp/F9Py16cVUCVZdICY=;
        b=sWjmDUjhOQ6xkeazJj3F9mYcjIaVOD3HhnKiJDqDGfLtBHtvxYyMzXrUaGoc7+nQO1
         5ozN/CbMJhtZ1xmWX81lxnshnQcRsY4qevKv/RTdvwUYTl2JY1Qo0J6R0fGJsNlChoU1
         xQfzvESiRpAYVhgwICSph1GkgYSqR5kyzbZW++jmco4sTewP+g71UoshXn7N7O3+gLwi
         aaGShkxIjnEr3o/K/I2iu+ccV0OzRKWh6E5R/xhCiQfHwOWdg7GWQSoZk8hg/hIKyIwP
         lcwXXJAJgx3BO9Ha3s2nnPXQYBUDKpekIQF9OQrG7ZU5OxnG89RZBM7CmbzbyunVP6I7
         vA1g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792985939; x=1793590739; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N9F43lK2NWhV4Ki7Elnt3R8wVPDJN16I9PpOYIv7Urs=;
        b=vstk02xKODHSzigRuYrU6QVyHfsqMnM91kPx5k8iLBeyufu0dOGI+JRmy84ZHFywif
         S5tVHNUFHnlgjAVOurb5e1k79STNdGxRYHtpPJalljxWEi1ZQq+7A+v4TVLkPKDI2OoH
         /jW0p2BNalUdToYFUMAx9HsodTDWqruL8jPemn7hJsamE/Ri7cooh5y6LW19uLbMYCri
         mwTK9TdreUAZ/zK2gKlaKFoEjlIKwWS4Qxy0cYBPRBVp7HhwZgjp9D5kK8l/oNv5UZBV
         JVZvy2F2Tjis3E+wzFyGmQ7AT0XF3ZVigqPN841SUPCBlpREA2GdCrN8x84q+gRQeCS1
         RZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792985939; x=1793590739;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N9F43lK2NWhV4Ki7Elnt3R8wVPDJN16I9PpOYIv7Urs=;
        b=jWTpcUyOyknQX+T7rQaCIgHutEH0M3rZI0hOuZkBxXHazI8z0YDQW6M0dOkNbl99FZ
         W1JoRaxWVMbjI9sdYpWs16sMTVyIoTjzgv8g1ArnQQIFbXs7o2MAFMNjfvWjC3Hggfb1
         gsQgm3PO48pioQg7p9yfliGGdYBvFPs02AReK2DpeKaJQE9/ZaBKKevQ2MCrLVef4vTs
         mXFmX0L6HNZ5e5HVZxcYgmmFgXiAD4cKpvdJ2+k8SLhXHPTmWw0OUpHtXoDMqXNzl5LI
         xAiA7glbz9wADkNU7CdnM+Nownl8Fo3VuSquZR0AFf1D4M1C0SAWu+VawdToPF0mzV3T
         tlZg==
X-Gm-Message-State: AFq9FYLocAbIB6rlDUgbGBNaQrTGadXFTZ/uP+lkOPN1VCVVuqv1BfJN
	hd0dppfjSq7UyZZJQZXJY5Gio8ziT0W94/mIXuCBaHPJTSXjYq5jol8TeoTRkglrB/ctpwa7T1U
	PV5efJmTCM5jOQU1JC85WwTBVnzztby2evxRR9OezFg==
X-Gm-Gg: AYBFou3YoXqHQP5np1aQI2eL/P9w0Vv3KcNQWI7NiNgOU2lxt6SoRmIc6TFJFGTjS2p
	JOyvYKqEzBsE2rnhg6rgnN5o2jUWWRNw7Pi6OoK7IK7Ge5WbRN/VxBIwwd9bbiT240uh/dn+/tW
	RnZzxpHrdwl3QWqQAGu1x7gIOU2eMgJnQeLxYxxOmOL6Ddi+F0tBTph3MiQneQIrWwKtIFv8LRH
	38SgZX20SzzURrOmDb0X7ybGDHAH3TVZzN4oJaObG8ycx56I4So7r5QjNkIE4vQu9lrmXVkt9s9
	8sqewsZXuM+7jwYCIxCXWkmIfYz7c37/8TCsppJSXbcVggR2zZlGTRm6mZtbGn0CTH4mo+oYAYS
	gSOdyxxd278lm63ysRY7wavTA7Z8Ac7vlh2gf3PvzCTfbMK/d5RghddTbQ14HSDiTIYL5t2FP0E
	qfXEesxOKW6OGHydx688HO1fMy3/TaI+j9VKGBSzQ/oM2QJRHbsbIgc18t
X-Received: by 2002:a05:600c:3e8c:b0:4a2:392:9de2 with SMTP id
 5b1f17b1804b1-4a35acab6cdmr84486055e9.28.1792985938366; Sun, 25 Oct 2026
 20:38:58 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261012022033.1165060-1-sebasjosue84@gmail.com> <20261025145704.2570129-1-sebasjosue84@gmail.com>
In-Reply-To: <20261025145704.2570129-1-sebasjosue84@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 26 Oct 2026 09:08:47 +0530
X-Gm-Features: AclHuK9FciQ2kPwK15IcWxXbG0H7yJXtrtu0kLawnysA5IQEai5kg9XtTFhqTf8
Message-ID: <CAAhSdy21+URDb3TWXjhzrQhXjzrvpg1SFta5F95AHrZFKR=3Lg@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi_pmu: unmap shared memory on the early exit in event_get_info
To: Sebastian Alba Vives <sebasjosue84@gmail.com>
Cc: opensbi@lists.infradead.org, anup.patel@oss.qualcomm.com, 
	liutong@iscas.ac.cn, david.garcia@aheadcomputing.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_203900_641013_5FF60E57 
X-CRM114-Status: GOOD (  13.06  )
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
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCBPY3QgMjUsIDIwMjYgYXQgODoyN+KAr1BNIFNlYmFzdGlhbiBBbGJhIFZpdmVzCjxz
ZWJhc2pvc3VlODRAZ21haWwuY29tPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBUaGFua3MgZm9y
IGFwcGx5aW5nIHRoaXMuCj4KPiBPbmUgdGhpbmcgdGhhdCBiZWxvbmdzIG9uIHRoZSByZWNvcmQ6
IGxpdXRvbmcgc2VudCB0aGUgc2FtZSBmaXggYSBtb250aAo+IGJlZm9yZSBtaW5lLCBvbiAyMDI2
LTA5LTEwLCBhcyBwYXJ0IG9mIGEgdjMgc2VyaWVzLgo+Cj4gICBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9yLzIwMjYwOTEwMDUyNjI5LjMzNTk0OTMtNC1saXV0b25nQGlzY2FzLmFjLmNuCj4KPiBT
YW1lIGZ1bmN0aW9uLCBzYW1lIGVhcmx5IGV4aXQsIHNhbWUgRml4ZXMgdGFnLiBJIHdhcyBub3Qg
YXdhcmUgb2YgaXQKPiB3aGVuIEkgc2VudCBtaW5lLiBJdCBhcnJpdmVkIGFzIHBhdGNoIDMvNCBv
ZiBhIHNlcmllcyB3aG9zZSBjb3ZlciBsZXR0ZXIKPiBpcyBhYm91dCBpbnRlZ2VyIG92ZXJmbG93
cywgYW5kIEkgaGFkIG9ubHkgY2hlY2tlZCB0aGUgc3RhbmRhbG9uZSBKdWx5Cj4gcGF0Y2ggZm9y
IHRoYXQgZnVuY3Rpb24uCj4KPiBsaXV0b25nIGlzIENjJ2QgaGVyZS4gVGhhdCBwYXRjaCBpcyBz
dGlsbCB1bm1lcmdlZCwgc28gaWYgeW91IHdvdWxkCj4gcmF0aGVyIGFkZCBhIFJlcG9ydGVkLWJ5
IG9yIGhhbmRsZSB0aGUgY3JlZGl0IHNvbWUgb3RoZXIgd2F5LCB0aGF0IGlzCj4gdGhlIHJpZ2h0
IG91dGNvbWUgYXMgZmFyIGFzIEkgYW0gY29uY2VybmVkLgoKVGhhbmtzIGZvciBicmluZ2luZyB0
aGlzIHVwLgoKSSBnZW5lcmFsbHkgdHJ5IG15IGJlc3QgdG8gcGljayBvbGRlciBwYXRjaGVzIGZp
cnN0IGJ1dCBJIGNhbiBtYWtlCm1pc3Rha2VzLiBJIGV4cGVjdCBwYXRjaCBhdXRob3JzIHRvIGhp
Z2hsaWdodCBkdXBsaWNhdGUgY2hhbmdlcwpzb29uZXIuCgpVbmZvcnR1bmF0ZWx5LCBpbiB0aGlz
IGNhc2UsIEkgaGF2ZSBhbHJlYWR5IHB1c2hlZCB0aGUgY29tbWl0cyBpbgp1cHN0cmVhbSBhbmQg
bm93IGlmIEkgcmUtd3JpdGUgb2xkIGNvbW1pdHMgdGhlbiBwZW9wbGUgd2lsbCBoYXZlCnByb2Js
ZW1zIHN5bmNpbmcgdGhlaXIgZm9ya3MuCgpSZWdhcmRzLApBbnVwCgotLSAKb3BlbnNiaSBtYWls
aW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
