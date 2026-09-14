Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45011C88E50
	for <opensbi@archiver.kernel.org>; Mon, 14 Sep 2026 04:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4d0yauHHPcC4quUdu6wy2AYunGSZDGS9nGbcPx/JKSM=; b=dTc8mO1P9n0U8W
	69QGCMzYez3R5B1QmIbkokAl6SWrng24GNp85AyOJ341Y+0ONtnbemQgx6XwpX5e7n4rj2ro0zwAG
	PKKmVdf5fvYn58V/To8hLUwzr49oO0CgNtNKMY91HT15Z/HYtklrUtruFdbTj5gmv4Y+FFVx1UVUS
	7YZMF18XDIxq5S1R0Psq/5u8GB4gGBTW4dR92l9vDS/tzXXYhWwE6iiPllbhMqSP7zKIi15eqiXDq
	GzW9zTNe+Rm/hYIiVWVsBi1g66WXDVneSVvbnVfy+BwbZ1KnUHCqXH/cn3JPKby3kRuyJ0q+kRUhp
	hFy/VurCVH+OFImm0EcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5yOt-00000002KGx-2M5A;
	Mon, 14 Sep 2026 04:34:39 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5yOm-00000002KGW-3rw7
	for opensbi@lists.infradead.org;
	Mon, 14 Sep 2026 04:34:34 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-485aca32ab7so354186f8f.1
        for <opensbi@lists.infradead.org>; Sun, 13 Sep 2026 21:34:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789360470; cv=none;
        d=google.com; s=arc-20260327;
        b=FKcbYtQzemkmRYG5a8D4IHclWiowwFAL2cOZZQsUqIUzHOga3ZnGV2mFs5UB1OMUun
         VSGIYThILmy21Aqrm2lgTzjJBpv5izSuTwMQCjPi7MqHGNreSCe+KI9UxSbDBz2rlnQy
         AHk898U3G9N6JBnS4T9SSwqAhI+wxS7CmrDs9M2lvdwwZ69scKI/9QvjPiImp5Y1TDVN
         jX5k3SLz8RiZQvTfJARBsrP73BPdGvLg/o/W9G9KmqZX5wQJgOgoRnBMuHaqf8Cbmxgu
         18jdC/S1rYZv1+ov9oYaC6UT2e7TJZVwpUyGoKbkafg/H6H97W8X2Z7by1NoXPxnwdD5
         VxXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mifCDqqmnNjaU1gW5o4PeTYLSsVjjHUykqe0evDBcpo=;
        fh=HflxTQPuIatd/MDGfAy4m+fAIAFcu8/mtggQhE16v1Y=;
        b=FLegZQjQrPgdLmihW9q8D2fBjZo8gkG707oT4SNPs7SKSfEOl+Bx3vUy70HEXPOFLT
         e3p53VHhSwiRsr8ekU0raqt+57O61sajPv0NsizRs9ELT06HyFSQ5JK4R5ABOWz6U/Mr
         Ym3YzydEUUxMfE3L0JSDNKTj36V8CppBCyPa0Ze3ViEM/XnbrK0mk0ddTKTXW1CLqXoC
         sL3jMliFWqtuOzlHujuxBabL26eWpN1Kb/1ebR6vcrVV0sD5jIh0FPferML4R2baC6Rx
         FHfOrrxkKn5wVyCOTHuCiMWDnLnkKPZ2TWzPFOCitZtjGYJ//WdbKKg9fkRlA7/nylQB
         0PFg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789360470; x=1789965270; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mifCDqqmnNjaU1gW5o4PeTYLSsVjjHUykqe0evDBcpo=;
        b=S5+r1t8nby9Lyxb/JIvXLWfhmfUM+ecvyf4rT9f0qKvI8MYuUxIaJs2LG0cQEZh2rs
         ez0vM/ILbsnDHKJrIxmV+j4PAWbUyVDzaf/dY75rPtBTAmRIWkuN6+ELK2XRTkbnzaDo
         jotnR4z2riOtYF3Unw2ZZQedJVUb0/Ouuq/i+C8ql6KFYEJAplmOKBpViMY+O6sJM6IU
         gCi33sdAQWdLc+jnJG1B7Q1JchM6Tg0ALzRrMw3iuWsDCB1ei/YlYJyUGC/Esce6yYor
         5u3byKqolPLQzlbfBXzttYkq9uQpVGzbW2FnSxeRTXrbDZLrq3SDteUEm6V8U/ksB1P6
         m3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789360470; x=1789965270;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mifCDqqmnNjaU1gW5o4PeTYLSsVjjHUykqe0evDBcpo=;
        b=FzMTIvZf1pt2pVQyIemw3yoWqhNBog/rwjyUdL1aL0xJyWN1Pv2uwwZxN7b5hiTCle
         tEguf9KDYfntjN6Xf5Tn+3qbdXV26yF8l4C+uSBHeP6eaI0onCICA8/GqFKoJsnycq0J
         PbYNyh4Z5qs0JAh0T4tnWa0uHJnlr4b7gpKA1i1Z7pLW3opNTXhia42VeKXm7qcbeyAt
         dM+3xmhcYxPIPU9sXsSPic73lR5OVzOGr1wCF/LzAuGq4APs7ZbQoPjQghEHeW2D4hkt
         HaCj+mWJdoeLticOfybqVtfoCFc6Vo5XHAAOKfxfmDvNXUumtqJElgRXQ3BVnLdecG8M
         yfSQ==
X-Gm-Message-State: AFuF++lDpDhKhSTbc3wMevY/ap7KuqLHgtGk/z72U6U6CrXrqp5EJQFx
	5TrpXSSpUQc/XJxHzuTR9+f5I+JakGCnxbqDFEgyTT3oY0R8CE8OAOsBwWpBY+XPqNWXd9v46r/
	qp+AuBfJNOxwY+dSXPAwec+3EUs2mEG4kZ8YEtLU0kw==
X-Gm-Gg: AYBFou1HmnPdOc4SmbWCnCL57aPcRRTeCdQ62Wd7ZZltJ+1i+Yeo8BzJPBoVnCjcoNF
	sjBBmQ8XLa6YEbO4C6+AKS8+C1usydKPeze64bubcQvnOpTpw8CUUqI0o0IcLL+wCDYq6jo/JwY
	y9MjDlncZNazrdqcfgs1JSSvK6vRvwH5Gb10Mq7DYIwJQEMGPvM5IRKdPi2s1hmivVYIDhz8rOP
	0MJs1yYIhTqFK56JGVjcY230B7z/2oX/cV1B/xBINeSFH3XLPiavg0LQVDBOum7P/meLAUBiVO7
	dCL1cLqiBbBFvcXOfSAWv8s/9CYOm8ewecjhzSp7UNczyQldCLwRvDvkafJWhLWqlDtgK0FbjfZ
	S2+yGIqdK28A9R7J9Tk6ZRxHfI324nVEl+hU1rwHHzF0PxHJNgBqAcY2NvP6/PNsvySa/9NJGXA
	==
X-Received: by 2002:a05:6000:471a:b0:482:d7db:ec06 with SMTP id
 ffacd0b85a97d-48702ac3646mr732136f8f.22.1789360469236; Sun, 13 Sep 2026
 21:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260913100128.2437-1-ganboing@gmail.com>
In-Reply-To: <20260913100128.2437-1-ganboing@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 14 Sep 2026 10:04:15 +0530
X-Gm-Features: AcwNN1UpAsQCrtbyxJghwatB35vaMA0b8Vrvn0FcMbUwePB9iIFL5dOgg-MeZZE
Message-ID: <CAAhSdy0S=p8naDHkOHMR1HZFfE=X8QSJ-4ytR73oA3r9iaeeQA@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: Refactor sbi_ipi_raw_send/clear interface
To: Bo Gan <ganboing@gmail.com>
Cc: opensbi@lists.infradead.org, nick.hu@sifive.com, troy.mitchell@linux.dev, 
	zhangmeng.kevin@linux.spacemit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_213433_035756_9E17243D 
X-CRM114-Status: GOOD (  21.05  )
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

T24gU3VuLCBTZXAgMTMsIDIwMjYgYXQgMzozMeKAr1BNIEJvIEdhbiA8Z2FuYm9pbmdAZ21haWwu
Y29tPiB3cm90ZToKPgo+IENvbW1pdCA5NGYwZjg0NjU2MjIgKCJsaWI6IHNiaTogRXh0ZW5kcyBz
YmlfaXBpX3Jhd19zZW5kKCkgdG8gdXNlIGFsbAo+IGF2YWlsYWJsZSBJUEkgZGV2aWNlcyIpIGNo
YW5nZWQgdGhlIGBzYmlfaXBpX3Jhd19zZW5kYCBpbnRlcmZhY2UgdG8KPiBhbGxvdyBzZW5kaW5n
IElQSSB2aWEgYWxsIHJlZ2lzdGVyZWQgSVBJIGRldmljZXMuIFRoZSBpbnRlbnRpb24gd2FzIHRv
Cj4gYWRkcmVzcyBzcGVjaWZpYyB1c2UgY2FzZXMgb24gc29tZSBTaWZpdmUgcGxhdGZvcm1zLCB3
aGVyZSB0aGUgZGVmYXVsdAo+IElNU0lDIElQSSBkZXZpY2UgaXMgbm90IHVzYWJsZSBmb3IgaGFy
dCB3YWtldXAgaW4gSFNNIHN0YXJ0IGZ1bmN0aW9uLgo+IFNlbmRpbmcgSVBJIHZpYSBhbGwgZGV2
aWNlcyBkb2VzIHNlZW0gdG8gaGF2ZSAiZml4ZWQiIHRoZSBwcm9ibGVtLCBhcwo+IGl0J3MgdXRp
bGl6aW5nIHRoZSBDTElOVCBhcyB3ZWxsLgo+Cj4gSG93ZXZlciB0aGlzIGFwcHJvYWNoIGlzIHBy
b2JsZW1hdGljOgo+Cj4gIGEuIElmIGEgcGxhdGZvcm0gaGFzID4gMSBJUEkgZGV2aWNlcywgYW5k
IGFsbCBhcmUgZnVuY3Rpb25hbCBmb3IgSFNNCj4gICAgIHdha3VwcywgdGhlbiBtdWx0aXBsZSBJ
UElzIHdvdWxkIGJlIHRyaWdnZXJlZCBmb3IgdGhlIHdha2luZyBoYXJ0Lgo+ICBiLiBUaGVzZSBJ
UElzIGNvdWxkIGFycml2ZSBhdCB0aGUgdGFyZ2V0IGhhcnQgYXQgYW55IHRpbWUsIGFuZCBsYXRl
cgo+ICAgICBvbmVzIGNhbiBldmVuIGFycml2ZSBhZnRlciB0aGUgaGFydCdzIGZ1bGx5IHdva2Vu
IHVwLCBpbml0aWFsaXplZAo+ICAgICBldmVyeXRoaW5nLCBhbmQgcmV0dXJuZWQgdG8gdGhlIG5l
eHQgcHJpdmlsZWdlIG1vZGUuIGEgY2FsbCB0bwo+ICAgICBgc2JpX2lwaV9yYXdfY2xlYXIodHJ1
ZSlgIGlzIHRodXMgbm90IGVub3VnaCB0byBjbGVhciBhbGwgcGVuZGluZwo+ICAgICBJUElzLCBi
ZWNhdXNlIG90aGVycyBhcmUgc3RpbGwgaW4tZmxpZ2h0Lgo+Cj4gSXQncyBleGFjdGx5IHdoYXQg
d2UgYXJlIG9ic2VydmluZyBvbiBTcGFjZW1pVCdzIEszIHBsYXRmb3JtLgo+IChib3RoIElNU0lD
IGFuZCBBQ0xJTlQgYXJlIGF2YWlsYWJsZSkuCj4KPiBUbyBmaXggdGhlIGlzc3VlIHdpdGhvdXQg
bWFraW5nIGl0IHRvbyBjb21wbGljYXRlZCwgZmlyc3QsIGVzdGFibGlzaAo+IGEgZ2VuZXJhbCBy
dWxlIHRoYXQgdGhlcmUgY2FuIGJlIG9ubHkgMSBhY3RpdmUgSVBJIGRldmljZSBmb3IgYSBJUEkK
PiB1c2VyIChlLmcuLCBIU00pIGF0IGFueSBnaXZlbiB0aW1lLiBJZiB0aGUgdXNlciBvZiBJUEkg
bmVlZHMgc2VuZGluZwo+IElQSXMgdmlhIHRoZSBub24tZGVmYXVsdCBkZXZpY2UsIHNwZWNpZnkg
aXQgZXhwbGljaXRseSwgaW5zdGVhZCBvZgo+IGludm9raW5nIGFsbCBkZXZpY2VzLCBhbmQgaG9w
aW5nIHNvbWUgb2YgdGhlbSB3b3JrLiBTcGVjaWZpY2FsbHk6Cj4KPiAgMS4gRWFjaCBJUEkgZGV2
aWNlIGlzIGFzc2lnbmVkIGEgdHlwZSB0YWcuCj4gIDIuIE5vIG1vcmUgc2VuZGluZyBJUEkgdmlh
IGFsbCBkZXZpY2VzLiBFaXRoZXIgdXNlCj4gICAgICAgYHNiaV9pcGlfcmF3X3NlbmRgIGZvciB0
aGUgZGVmYXVsdCBJUEkgZGV2aWNlLCBvcgo+ICAgICAgIGBzYmlfaXBpX2RldmljZV9yYXdfc2Vu
ZGAgZm9yIHRoZSBzcGVjaWZpYyB0eXBlIG9mIGRldmljZQo+ICAzLiBgc2JpX2lwaV9yYXdfY2xl
YXIodHJ1ZSlgIGlzIG5vdyBgc2JpX2lwaV9yYXdfY2xlYXJfYWxsKClgCgpDbGVhcmx5LCB0aGlz
IHBhdGNoIGhhcyBtdWx0aXBsZSBjaGFuZ2VzIHdoaWNoIGNhbiBiZSBicm9rZW4gZG93bgppbnRv
IHNlcGFyYXRlIHBhdGNoZXMuCgpDcmVhdGUgYSBzZXJpZXMgd2l0aCBzbWFsbGVyIHBhdGNoZXMg
d2hpY2ggcHJlc2VydmUgZ2l0IGJpc2VjdGFiaWxpdHkuCgpSZWdhcmRzLApBbnVwCgotLSAKb3Bl
bnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
