Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5190B606B9CD
	for <opensbi@archiver.kernel.org>; Tue, 10 Nov 2026 08:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qf6sZ1jC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=Vyi9dYbh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Fah+LF4qnJ6nXqVL7Ql3HO1z6fbm9BggQvKnoQ3sLGw=; b=Qf6sZ1jCqzeO0mtaLD2b2yKk4L
	4SxGdJSMWQpFltV3utAof16Ly9FPOPnAa0a+rGU3NMS9udmGADFNHvizSsbWJ1EcOiFOxX2q1yzSH
	cqzE57Uhce623n4Gg6Rb2jKMwpux9iTxRXF/T2117OEL4twRhLi42dPPZKf82xt/D8gSoyAyiRd7o
	+GWkNBlB5yWmKAk+rQrQfP+7k8rw1g+XLPCnC9QIc34kEYXc1WUsUi/aZMbSyg7v6uDKs6TzBmtkS
	AV/THhWvLiXozTN3fX9QeTzjXoYwCqDaQhJUL/FyHROpkVqYrjTPS+38TG9I07F5SM2xvQlRzQtDu
	FnOuGgwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQhIc-000000038I0-1ocU;
	Tue, 10 Nov 2026 08:33:50 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQhIZ-000000038Gz-3yEX
	for opensbi@lists.infradead.org;
	Tue, 10 Nov 2026 08:33:49 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so16780525e9.3
        for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 00:33:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794299624; cv=none;
        d=google.com; s=arc-20260327;
        b=b6Tac71KbJ8c28fNPnlM3NiO0j1J3xbT4HGY58rlion4R9tUSdSgTgraxwtGh6Dv9I
         vmhKhDYyJcRgyisS/zzh7O8PMT3mI/QCf9mBcNU2uC7Ttod9nqRh3dwWzXh3JcJhOrTM
         4gadgc1p7ZxNTI47ANB6ztqpl/W7hnji2Qlp8QFANSSk1fvc1QDNz/YUEUKotau3UXVN
         OJSeeFzY2ejs5at9OOCgeEEGx5I9zfpn6g+pJNXVl3UJLRBmitou3ktHNJ99TzoZ/lY5
         Mq9XGS5CvTIScdZ56RizGLD2p7FpLB5YhJk8hPolqMnnF0ThHug6wjpqDh9tA/y0hq9p
         FHTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4NKSZnDSAMOZz+dUo9d0cfVqkET2lcXgIP8D/pbi9Bw=;
        fh=4xqYwAYwrKd10EBWbR5Irc/FjLW7+VnD52vHGQd/ZcE=;
        b=pkCCOmL7cR41hfIxB10T0i+A9z5yclfaeFjXzW57dZHwFq3ouXLTU4jvWoG2KeSRIz
         oCBAsc3P2S4OPQMeVEgM6h8gW7v0O2d1biCQiOgtbgFbmoFEIzQ0r2ilbimdzkMWNKbP
         QJVAuun6w+g3UO3BwkdVFkOBvp1cekADhZo67g450k9fzhbOlAQE42hfQYxnI3O6LzkU
         4/I9PN2+MZC7WLvMF7JZHwhLD+TgxCOOQaNwQWU6e2QunmZ+dJqnUtzQbJfD4IlCvXiG
         /QAnkzfkXUGRH4wWOEYv3BaIgo7qSUim8ppqZrVuENBu8gCs8vwLVxv6Fqmawh/+k3El
         AIaw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794299624; x=1794904424; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4NKSZnDSAMOZz+dUo9d0cfVqkET2lcXgIP8D/pbi9Bw=;
        b=Vyi9dYbhj5cDJ8MzyLw/EsgXkTMvNCL5e8T62gldhCNCrUrtS5DkUMBLgncdINIzOY
         RWbzjzaDmjVj1VVkOOfsqoeNSQSIJFd507HpWOPmWoXaSHJVb8fV2+0mhufQSFK++5gO
         yB0980urbky0Dwcdh2um7XtDZ5Xuw7dqBg5K3BsSpoE2LQ7d6rPCIlssr5iZD/5f2mmu
         MnyskdL3jXKFESZ4JSkxwnvdttN6k8uB4jVmOfWfg8NEt1dPfuHAh0LTJahRWfkheqP1
         wGAFWV5oStYEGl+OgG2jbM6ri5946ZQaSZ5UgfIpbBQl8M9wwBVUgVNHgbp79ejV4NrV
         HjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794299624; x=1794904424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4NKSZnDSAMOZz+dUo9d0cfVqkET2lcXgIP8D/pbi9Bw=;
        b=kpU0ju5Ur3bP/0VKL7Q2eAMmYmlKmb0AhYBw5tPvD+Xuj7nihqIE+imPlGHm9BOzDz
         CoCup3+4NtP96wrRI+MRWrALT1WnsshpjJgjcwsM6cc22oRXpSF/Fk2TOhZX+myb+Fyn
         4gqrLsddF4DhPJE8UBeMQtkzJ5GMDTydXqvdZTw79Br/JuC4T3o4lJlTCk8HmatY62+w
         69kwKFrwISuopcGY9BgKCbW3aNWeTOK3qgUd3vB350xmQ6nhIbxKLPaRMtnpKNfXVs1f
         FbVbHNg7pWTSut3MeabpoVQmEUZzw85dcMWa63jaI+QrE70JcU+B9y7CyC4zyt7rNWcW
         uwxQ==
X-Gm-Message-State: APuU4Z+7ve8GctSnv4/QoFewnxCHXo1dYzhlp5hrRC8fin4W+HEPuYOr
	5vVS/ATH98IO4dhHxU0vPD0C2nqkSDBqrO3pQ5JWLRsAoG4WSnhED0nfFzbbK6tVMli9yMR5far
	4U42pcoIbkjL6c5izXIbo9O4B5GIckeoQ5mueb09V2/ivZTm3koYo4Ek=
X-Gm-Gg: AYBFou0E7hM9uvaBnsAVvmQ8cIrG5WYQvu0EwQ68qagqntniSaeCDeTh/aL7crnRwUH
	zB3L4D/zDnJImbicNEqB9OgPAqxDzv5aXaVAL08GFY8yZUGemWiSlpDAU/q2Tsb7TA/ru0BR8o3
	FcEprbkKJB325fmyaUBEPBIJxbDtixyBVeQ/u9g5Nm2IO/eXkbcb2ocQfZvCqERiSIdvuB+cuCw
	lKUQJC+jlH5NRXL3x149ks5IuXP0PvJFkcYXYOwTKofdh0HlsFFoHJykz26OsXNP+NYBLPmJZvc
	D2AMwdD4ziC+RQL/g6aUKl8WWoJrb+pkhfqbT+KFX2ZCqZhDSNp7Azbo5wQtuOxpo4Tcf9z/z0T
	Ry3fqQh5cRmzj7Q5wVlKJ6HYXJeTO+Cqakfvtllu8F7RczTy7Krk/vIEdCWnXykUGQS3/I8GRIt
	fr1VCR22hBcYaX7yRdi0Bfsuw958s7oQJy2KnQLAfiltMEGAMvelG/ibw=
X-Received: by 2002:a05:600c:3e88:b0:4a0:4a8:d444 with SMTP id
 5b1f17b1804b1-4ba0235a214mr25670055e9.33.1794299623892; Tue, 10 Nov 2026
 00:33:43 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261107060325.1117887-1-himanshu.chauhan@oss.qualcomm.com>
In-Reply-To: <20261107060325.1117887-1-himanshu.chauhan@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 10 Nov 2026 14:03:31 +0530
X-Gm-Features: AclHuK977huuuPhugizjVGdJM34KnN5T0PEC9ak9ecol8xovQ9dbbzyFZm6sgbo
Message-ID: <CAAhSdy0G3pjzQ_3qHwQZzBq3VWyAE+1vRROX5=5k=xiT8c6D_A@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: fix trigger read range check
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_003348_232881_26A43962 
X-CRM114-Status: GOOD (  17.69  )
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

T24gU2F0LCBOb3YgNywgMjAyNiBhdCAxMTozM+KAr0FNIEhpbWFuc2h1IENoYXVoYW4KPGhpbWFu
c2h1LmNoYXVoYW5Ab3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBzYmlfZGJ0cl9yZWFkX3Ry
aWcoKSByZWplY3RzIHJhbmdlcyBlbmRpbmcgZXhhY3RseSBhdCB0b3RhbF90cmlncwo+IGJlY2F1
c2UgaXQgdHJlYXRzIHRyaWdfaWR4X2Jhc2UgKyB0cmlnX2NvdW50ID09IHRvdGFsX3RyaWdzIGFz
Cj4gb3V0IG9mIHJhbmdlLiBUaGlzIGJyZWFrcyB0aGUgY29ybmVyIGNhc2Ugd2hlcmUgc3VwZXJ2
aXNvcgo+IHNvZnR3YXJlIHJlYWRzIHRoZSBsYXN0IHRyaWdnZXIgYnkgYXNraW5nIGZvciBiYXNl
IHRvdGFsX3RyaWdzIC0gMQo+IGFuZCBjb3VudCAxLgo+Cj4gVmFsaWRhdGUgdGhlIGJhc2UgZmly
c3QsIHRoZW4gY29tcGFyZSB0cmlnX2NvdW50IGFnYWluc3QKPiB0b3RhbF90cmlncyAtIHRyaWdf
aWR4X2Jhc2UuIFRoaXMgcGVybWl0cyBleGFjdC1lbmQgcmFuZ2VzIGFuZCBhdm9pZHMKPiByZWx5
aW5nIG9uIHVuc2lnbmVkIGFkZGl0aW9uIHRoYXQgY291bGQgb3ZlcmZsb3cgZm9yIGEgYmFkIGNv
dW50Lgo+Cj4gU2lnbmVkLW9mZi1ieTogSGltYW5zaHUgQ2hhdWhhbiA8aGltYW5zaHUuY2hhdWhh
bkBvc3MucXVhbGNvbW0uY29tPgoKR29vZCBjYXRjaCBidXQgRml4ZXMgdGFncyBhcmUgbWlzc2lu
Zy4gSSB3aWxsIGFkZCBhdCB0aGUgdGltZSBvZiBtZXJnaW5nLgoKQWxzbywgdHJpZ19jb3VudCBj
YW4gZXF1YWwgdG8gdG90YWxfdHJpZ3MgaW4gc2JpX2RidHJfaW5zdGFsbF90cmlnKCkgYW5kCnNi
aV9kYnRyX3VwZGF0ZV90cmlnKCkgc28gaGF2ZSBzcXVhc2hlZCBhcHByb3ByaWF0ZSBmaXggZm9y
IHRoZXNlCmZ1bmN0aW9ucyBpbiB0aGlzIHBhdGNoIGFzIHdlbGwuCgpSZXZpZXdlZC1ieTogQW51
cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClRoYW5rcywKQW51cAoKPiAtLS0KPiAgbGli
L3NiaS9zYmlfZGJ0ci5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9kYnRyLmMgYi9saWIv
c2JpL3NiaV9kYnRyLmMKPiBpbmRleCA1ZjY2YjY0MS4uOTY3ZDZhZjcgMTAwNjQ0Cj4gLS0tIGEv
bGliL3NiaS9zYmlfZGJ0ci5jCj4gKysrIGIvbGliL3NiaS9zYmlfZGJ0ci5jCj4gQEAgLTY0OSw3
ICs2NDksNyBAQCBpbnQgc2JpX2RidHJfcmVhZF90cmlnKHVuc2lnbmVkIGxvbmcgc21vZGUsCj4g
ICAgICAgICAgICAgICAgIHJldHVybiBTQklfRVJSX0ZBSUxFRDsKPgo+ICAgICAgICAgaWYgKHRy
aWdfaWR4X2Jhc2UgPj0gaHMtPnRvdGFsX3RyaWdzIHx8Cj4gLSAgICAgICAgICAgdHJpZ19jb3Vu
dCA+PSBocy0+dG90YWxfdHJpZ3MgLSB0cmlnX2lkeF9iYXNlKQo+ICsgICAgICAgICAgIHRyaWdf
Y291bnQgPiBocy0+dG90YWxfdHJpZ3MgLSB0cmlnX2lkeF9iYXNlKQo+ICAgICAgICAgICAgICAg
ICByZXR1cm4gU0JJX0VSUl9CQURfUkFOR0U7Cj4KPiAgICAgICAgIGlmIChzYmlfZGJ0cl9zaG1l
bV9kaXNhYmxlZChocykpCj4gLS0KPiAyLjQzLjAKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcg
bGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0
Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
