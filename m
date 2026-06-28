Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3804C43458
	for <opensbi@archiver.kernel.org>; Sun, 28 Jun 2026 08:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IYrMo16VlD3Op3Dcw/KQRIJpaneRoOIFJj4cy0SpSpY=; b=rIls4unlMDfwTt
	ASsTglz+VKdpMVfGYYRw4Jx00ZleTUi+O7ffYS6qNSRTnqqyQvLBQ3IcK2Eqj1DV44f6cKD/dIJnW
	rPkZk/EYI9+NVvjK+8IPabaH+4tisGoodnYGT0dLZ/0WFH4O7gqh3ccBmsTJSd0sa7l4mlP9OPYir
	OIFyiC3ygYEFjesVOCCpwyvnuckHtYet8I1LyUbAbtbkhO/151bECDYafpoL8V1w1+0txVG+LlZrH
	AzC/9dt1uphBYlyRvJMzmtsONRNVoAv5OSvQ8f4snF/gokrGy5XXEvcarLJjByV6lHEwMRTUunSns
	G4rF7BFMfE9VAXPEoXRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdl6K-0000000CzkA-08SB;
	Sun, 28 Jun 2026 08:42:52 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdl6H-0000000CzjZ-1Sdm
	for opensbi@lists.infradead.org;
	Sun, 28 Jun 2026 08:42:50 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5aea9d606f0so1342959e87.3
        for <opensbi@lists.infradead.org>; Sun, 28 Jun 2026 01:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782636166; cv=none;
        d=google.com; s=arc-20260327;
        b=KxqRHNkSyFowaoHODkevA5c2bloEKWtmTr5lv91Rva6q+HAspmw9vgPlmZtcdD9G5B
         rPM0xwCy+JJNnC5Wrj1iRwsoRbdx3MNoWuoR65Gb1G8fYv9ZCMGTQStKdzS8kJJWjL0a
         e/oiboAjH0ljDFjEYdHnWOU9c3hQknEkfE0w8q+E60uhVRyjmWLkn0GNfAy1biY7S0Uc
         U2inBMSNr7I3j48+MLSGs8SIFmAYgCjZROL4lblVgaTFyWoHH9qKwUG6OGnfHuQQbeZD
         O+uUqpSW0iXbPowy7Nli0uxaV1JcPwvAUXvnf3Zpugk3TOyri/dHYYBvW5G7thawzMpz
         NxVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tHrBEDUlx1462bBu5t1gY619u22Pyo/Z/6XEovdPzks=;
        fh=eQRLnJNeHQBGvSQQ3K81dsZjCFpV01l3b0rpGkosk9o=;
        b=lhLEspKnPBXEW+OenLXx54BlySyYPBC4DIdiujABxzVRRezOC+AaAzLuBNnj44id3d
         /mmqk9M0Gh7c8w9/VXaRwnjXjTHB9CzHQkFLh4iYfWXMLd6APmAmHFpTuKSrm8v/kZEq
         SWjNUFYNsFYqA0XWMY/kVHBBwTr6dwTOn/z1+8vI8jW/EMc/F82bgkzmsRsVYU8JMU/a
         g3hG7qMxwkyZzyNipvY4gI9ZdDNKt9nFPDRHfSB/9yt9rH2J3vGMROhV+EFiIRs43ZWx
         /CbI9KGUX1m6+5rFelE0lPb3muVf5kaarUuLUmpxW9QOQVcXqjsWFhRB30KnrhEAKhuA
         aklQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1782636166; x=1783240966; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHrBEDUlx1462bBu5t1gY619u22Pyo/Z/6XEovdPzks=;
        b=TP1981EJm5uwzYgIJy5jFGLV7qVoZzJwLQftmT8Wr8O1w0gIUro0WOUQTW98bvM77u
         z+956nrvzQ+HgIYaqZH1ArPlkb/0KL5cmTsfDmc4Ir2djqjILIayPf9m34SQD5PexcXk
         MJ44yma4aMe7aoaqjcx4ERu45YWxUarL+bpomE3gvOiUy8sNPv22NtoeMiXO9tWtL8PC
         jXJO20+t67bNIA4AJ4F+7lVGI+cp1cJMQxbaovgyY8k6ba3jcS5f3C8ug6BF5e4jN/pF
         v5mh9NCEZHsCHn5OHklnZkCH8/nctljAwzXk9nqa3IBbVk2DiMZFzL8/qwiKiXZgeBt0
         0HNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782636166; x=1783240966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tHrBEDUlx1462bBu5t1gY619u22Pyo/Z/6XEovdPzks=;
        b=kcd9MNgyM2NQPZYC/ZilJXF4IW9gYeZT/QA9dNt+vFQs3zKnm94LHLj0nCEIZwSPvp
         ZirmXTXaQk+YVW61Cx09JXWU5Ca9f5iSBkO0i5UvYes6ooaNkXTbDNiKmRRq9ck0PZXG
         u5XiHlqYTBBU3YiEFSE6ILWp5ZEFHuA2NltvVdCeGUMBnAVc1hTFstzx3Grz8Bqotecj
         gkc1/GfjCz3+h7Ua0jFrH4fOi+9DUtKLuLVtXkzY7CZPHE9nuQQ3T8GDz4bKawP6QWn7
         DMTG1F8sSeFlsnc3FSyZge/FmERo7Gs51NeBbEBRewortFBxJO9xV26nHURlwU5K2zfx
         N/Jw==
X-Gm-Message-State: AOJu0Yz7sDIhaxSUqCnZ5oWBmR6XE0vJN5Uh0KSbc9l7Tgjyg3S8iEyF
	dRCF53N7SgpsbfOF+9EiqN1vp1MmnVk7ZG9CGhnOF5pk3e7nuTKCFM10bUhvV9r/TDRteq80tJp
	EUllNBeHQ41dXJ9ShVDnpl3kJHSGS14hmPysjOws5HJl24pjtDtDhA9w=
X-Gm-Gg: AfdE7ck+T1ZwM4A1ZoiRqwfcDVKFhpZpwq6cd3Lrm1tUavV2kTmI1/N1vIWIAIDHX4a
	2tzbfLjpEbhGZDAr58YUw+WAdpB274QwT+kW4jLGRqS/IoX1Lh2YTdi0mPkiXYAv5MF356u4c+L
	/noQJwm9LmtBz7SGvM3uPwE2IxnJBrAJJdAmwIbyMRHmqylNcaGxNvjG+/nP2wHo9NNfd+B+Wmf
	fp2WeQODhK/bKXqxvlTwhfVzNHy3ywuIs+bU8BwF8iQnm6KvxPdoSvaNS5ZF4Gcn2CuJsReaKzD
	08PrSiFX/Bf0TyQLPs/EK3MPUAuXhg==
X-Received: by 2002:ac2:51ca:0:b0:5ae:b731:302d with SMTP id
 2adb3069b0e04-5aeb73130aemr145634e87.6.1782636165923; Sun, 28 Jun 2026
 01:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260626022121.1885209-1-zong.li@sifive.com>
In-Reply-To: <20260626022121.1885209-1-zong.li@sifive.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sun, 28 Jun 2026 14:12:34 +0530
X-Gm-Features: AVVi8CcGFGOT_hK28ZEGiuiSM0GjTQKcs0edcC42yrJD3yWkUUSnF5_GuhvsUKQ
Message-ID: <CAK9=C2WZEhXpNk9=AoWiBYvsecoiUD3zbxoyE13Md7edFVRLug@mail.gmail.com>
Subject: Re: [PATCH] firmware: Fix comment after relocation completion
To: Zong Li <zong.li@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_014249_417273_F9D81E88 
X-CRM114-Status: GOOD (  17.59  )
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

T24gRnJpLCBKdW4gMjYsIDIwMjYgYXQgNzo1NuKAr0FNIFpvbmcgTGkgPHpvbmcubGlAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBBZnRlciByZWxvY2F0aW9uIGlzIGRvbmUsIHRoZSBjb2RlIGlzIHJ1
bm5pbmcgZnJvbSB0aGUgbG9hZCBhZGRyZXNzLAo+IG5vdCB0aGUgbGluayBhZGRyZXNzLiBGaXgg
dGhlIGNvbW1lbnQgdG8gY29ycmVjdGx5IHJlZmxlY3QgdGhpcy4KPgo+IFNpZ25lZC1vZmYtYnk6
IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQ
YXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlz
Y3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBmaXJtd2FyZS9md19iYXNl
LlMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+Cj4gZGlmZiAtLWdpdCBhL2Zpcm13YXJlL2Z3X2Jhc2UuUyBiL2Zpcm13YXJlL2Z3X2Jhc2Uu
Uwo+IGluZGV4IDVkNjU0MGQ3Li4wYzVjNjVjMSAxMDA2NDQKPiAtLS0gYS9maXJtd2FyZS9md19i
YXNlLlMKPiArKysgYi9maXJtd2FyZS9md19iYXNlLlMKPiBAQCAtOTMsNyArOTMsNyBAQCBfc2Nf
ZmFpbDoKPiAgICAgICAgIGFkZGkgICAgdDAsIHQwLCAoX19TSVpFT0ZfTE9OR19fICogMykKPiAg
ICAgICAgIGJsdCAgICAgdDAsIHQxLCAyYgo+ICBfcmVsb2NhdGVfZG9uZToKPiAtICAgICAgIC8q
IEF0IHRoaXMgcG9pbnQgd2UgYXJlIHJ1bm5pbmcgZnJvbSBsaW5rIGFkZHJlc3MgKi8KPiArICAg
ICAgIC8qIEF0IHRoaXMgcG9pbnQgd2UgYXJlIHJ1bm5pbmcgZnJvbSBsb2FkIGFkZHJlc3MgKi8K
Pgo+ICAgICAgICAgLyogUmVzZXQgYWxsIHJlZ2lzdGVycyBleGNlcHQgcmEsIGEwLCBhMSwgYTIs
IGEzIGFuZCBhNCBmb3IgYm9vdCBIQVJUICovCj4gICAgICAgICBsaSAgICAgIHJhLCAwCj4gLS0K
PiAyLjQzLjcKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5z
YmkK
