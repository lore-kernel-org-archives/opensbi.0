Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8D6CD343F
	for <opensbi@archiver.kernel.org>; Sat,  9 May 2026 07:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KSWLaYfSVj0WkMJ0T9BBDgRQs17+QxF0JsbV7igyPVw=; b=re0sCJ95Q0AIfc
	79CQqNPRR8c6CViOSG98ScZBR73obuzZ4IGPqxvkDVBVkUOCTC5yfxDkC5rNLxFa2/IW4fZk5suvS
	QZ+YtbMsCmkCX4OL8HBINjFAnxIbp0IvE3GDRrl5qKQ3jwsBw1UN2rZuoCiwMkkfP401mwL16Yzf6
	uj6NFUfzViZJona0tG6BkY5nToIr2oHyvStrmqzVgtSDVIIdG1DjG6hKn4DIcZqDbvhq+/7x/AI7b
	x60XYzFbXQW2jOMG67gYmrWYolY39xlqdrACeKUuv7Ox98YeldFS5p2gnWdCubU8RF2ZtxnLzLsbW
	eciVailcfiRVKXes6jHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLcOo-00000008WN1-37dj;
	Sat, 09 May 2026 07:46:58 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLcOk-00000008WMB-3TP6
	for opensbi@lists.infradead.org;
	Sat, 09 May 2026 07:46:56 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7dca4debedaso2756229a34.2
        for <opensbi@lists.infradead.org>; Sat, 09 May 2026 00:46:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778312814; cv=none;
        d=google.com; s=arc-20240605;
        b=Kpia6mxAV+9nLz5Q2adN0XZ1DiM00cIZgg586gpqxB2booZ5D8MWflUDW15jdNO1s1
         of5BiZ+sUXMXgKDhAm2cR/MFS/avOCx2BDQojP2XJaS3gt2AK9OW3NZsP2KP49PQTCnO
         +S+3VVWolVzM8MLTnJH2RFfslWbqxZC6LZUmKVOg2MBYkw54bpX9PrKfV4bWIhAQOuNo
         1e3QTOGcreaqnNWNi9TrS+7usoQaAKt+vVVqkHcYHGaIkdE7cS6kzVzPAW2ZaulF+j7p
         iBKFlaFMPXFKcP1u8dFKhkC7UfezXWfg/T5w1vbIk/NVmJxNxSTovZUJ5oZMnLLoEK1c
         jMNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c4uqP1hqhxf3YGYWRbFNZemmdUcDS0zREYGmL0IAYn0=;
        fh=+q3mfrMMQtsSZZ5T0P8XjveAuT3bGh2wYDdgRIrz/xo=;
        b=fu/vUI33OScIhLFndBg0I3aG3zAOgHYXsPzlqba8w2NGt6CH7DUGxlYfHuKXUw77Ct
         /Uo3q80XCnAfsOGvU94+xOcPJq2OOJCRRfoEnLg7NC5Q6mBe63lv8dqZOAWD7Hlh5ipf
         w8rFGI8OCO2JbqdwDH2jKvM3HogeIQV61/I3Onp2WLjPbno9Yvd9vb0Kw8ILaNDfiyF7
         YpwRcCCiI32kQrtWEBp98Pskzh7k2ITi9tOzG4TfSNONHsIb3cUAzXjP0MOjhUNv+fdV
         l7BoaT3GTTFLB1yuwp7uLt7XhpQ6gVtzzQu4rjjR2JNCwKnfdFjSD2NHm3jcmt0enne0
         1iOw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778312814; x=1778917614; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4uqP1hqhxf3YGYWRbFNZemmdUcDS0zREYGmL0IAYn0=;
        b=BrM3Ity8IHdKhs9z72wiVTNm6AFNSB6NJ3KMQ2BwBJYVjxsFMPS+5x03MnwDNjGf0T
         BhcIDZRrGSwjNQZC9C2RUo1lOcRwF7HU4xbLL3dQcWdnGsgxiTwkK8y8Anr/5LqmwF43
         KFkM/heRBi0rY+AoGDLLv8p1tII6yNI4XNTIiP9ngNQS7GSjr5aTwiWPYzhVmmek5YON
         D9rrXLdr+9Ag/WUsm1cibD2emLM/GTyXlPk8ZTEK680Wv0vjWMXeKqJbODEit83RsLYT
         orjb/3c65NIp8TJrVHA/X0FF2OHkzCTlzt6Mu2TQMdWG184o8z0sSxb2bSDleOmH+es+
         hn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778312814; x=1778917614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c4uqP1hqhxf3YGYWRbFNZemmdUcDS0zREYGmL0IAYn0=;
        b=cRUsG+1USvPYm/m5Z0/jcLHl1XCnytfXak6vpZWE8/5G396C8XZQLrmFbeXZCdYoeJ
         PGu41cMQfF5aDeGMoPuTwiqYSRzLkwJAoaFg9d1t11xw7sjczjBfIPFokVBgFx9Tk6OI
         tErqwlULjPR3Qvp587JoWGvO7Pf/dE6zHJ42ttTXLdijtRV/m+tBSgEhO374Khk7Ba14
         J+5uj2lRv2hOnUOnbrdp+lsD4Pd63SWYTPXeq4GBmC+8YouuMGJqj4/aoAnK6Eeu7//j
         O8Of29wWGM9BGr4Jp/19Kcddr6WzqQhaO5ZBk/JXu78MvJmlvvjJ2mxvG/IA7YC+jNmO
         VvqA==
X-Forwarded-Encrypted: i=1; AFNElJ9wdAJLaiTBxAPR84q50ngD0fuOGTQr+PEViiXHJJeUbK0t+ds7eSwqHelZMBOWRIJI2PLOTTRH@lists.infradead.org
X-Gm-Message-State: AOJu0YzlAHI1Vw7rMjBYK6QVxB+Y5M0z2aLvs7mfHDfgaM7TmWNHjgMH
	a6R4xJAvzSnaLqH5bT8EsBOFw3XjaDAUXfWjxigS5xqaZlt4hrOfsLs+RDwPw0gMsW5iDGU8QKr
	OubMJ5f/houG7NcQB2QFppR7DfiqMLK7e4qC0qTyeyg==
X-Gm-Gg: AeBDievMwsXaucRrblg3xlj9SqAQm8PWzgGfmOt1IB+LTeUJRC4tgflePhUgMjPPyFJ
	oBQGeR3htp+2tObhgI53KYVEJk2H7RCcM4qAGv2YDA4fqW0QzY92OofnV45AQ3fY+HYbKqO/53b
	0WHP7k3YgzATgIMj6xQZ023zd+jTQG0HkzWnxR6QW83S0KCipBLoTnwICRPoarZRtuLBNsBnDWE
	O/YRiyCmWNkTWaCOfR7hU5qlgJsu8wgOgljAbIOwp77K5VjUEcpbL1y844F72p6yEdi29n4ZgxY
	Bex4lECo+79CyzvdS5LxGskOPMpbBzJNl/4OPUzPvlwdggE4oZepNATIEnU8TCZ/t8Kw+iS1nyL
	VGa85pBDRGAJ96g09k4+kzDTrag==
X-Received: by 2002:a05:6820:807:b0:696:7d51:79d6 with SMTP id
 006d021491bc7-69b36c90ec0mr795998eaf.31.1778312813867; Sat, 09 May 2026
 00:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260425104048.2335262-1-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260425104048.2335262-1-anup.patel@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 9 May 2026 13:16:42 +0530
X-Gm-Features: AVHnY4LeLy4Wy_T_xeNA7QBbup5HJi1EUhNZdZ1mptNzuCQ4AipEmLMSo4skmew
Message-ID: <CAAhSdy2700-Oi0xo2QriURe8d165RayreQuJtYB=kaRJHAKJGg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Timer events for OpenSBI
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Samuel Holland <samuel.holland@sifive.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_004654_889648_F1FCE58C 
X-CRM114-Status: GOOD (  14.45  )
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

T24gU2F0LCBBcHIgMjUsIDIwMjYgYXQgNDoxMOKAr1BNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHNlcmllcyBleHRlbmRzIHRoZSBzYmlf
dGltZXIgZnJhbWV3b3JrIHRvIHN1cHBvcnQKPiB0aW1lciBldmVudHMgdXNhYmxlIGZyb20gYW55
IHBhcnQgb2YgT3BlblNCSS4gVGhlIHBsYXRmb3JtCj4gZHJpdmVycyBpbiBPcGVuU0JJIGNhbiB1
c2UgdGltZXIgZXZlbnRzIGZvciB0aW1lb3V0cyBvcgo+IHBlcmlvZGljIGNoZWNrcy4KPgo+IFRo
ZXNlIHBhdGNoZXMgY2FuIGFsc28gYmUgZm91bmQgaW4gc2JpX3RpbWVyX2ltcF92MiBicmFuY2gK
PiBhdDogaHR0cHM6Ly9naXRodWIuY29tL2F2cGF0ZWwvb3BlbnNiaS5naXQKPgo+IENoYW5nZXMg
c2luY2UgdjE6Cj4gLSBOZXcgUEFUQ0g0IGFkZGluZyBzYmlfdGltZXJfY29tcHV0ZV9kZWx0YSgp
IGFuZCBmcmllbmRzCj4gLSBGaXggdHlwbyBvbiBjbGVhbnVwKCkgY29tbWVudHMgb2Ygc3RydWN0
IHNiaV90aW1lcl9ldmVudAo+IC0gUmVtb3ZlIHRoZSBzcGluX3VubG9jaygpL2xvY2soKSBkYW5j
ZSBmcm9tIHNiaV90aW1lcl9ldmVudF9zdGFydCgpCj4gICBhbmQgc2JpX3RpbWVyX2V4aXQoKQo+
IC0gVXBkYXRlIHRpbWVyIGRldmljZSBpbiBzYmlfdGltZXJfZXZlbnRfc3RvcCgpIG9ubHkgd2hl
bgo+ICAgcmVxdWlyZWQgKGkuZS4gZXYtPmhhcnRfaW5kZXggIT0gY3VycmVudF9oYXJ0aW5kZXgo
KSkKPiAtIEJyZWFrIHRoZSBsb29wIGluIHNiaV90aW1lcl9wcm9jZXNzKCkgd2hlbgo+ICAgZXYt
PnRpbWVfc3RhbXAgPiBzYmlfdGltZXJfdmFsdWUoKSkKPiAtIEFsbG93IGNhbGxiYWNrKCkgZnVu
Y3Rpb24gaW4gc3RydWN0IHNiaV90aW1lcl9ldmVudCB0bwo+ICAgb3B0aW9uYWxseSBwcm92aWRl
IGV2ZW50IHJlLXN0YXJ0IGRldGFpbHMKPgo+IEFudXAgUGF0ZWwgKDQpOgo+ICAgaW5jbHVkZTog
c2JpOiBBZGQgc2JpX3NjcmF0Y2hfaGFydGluZGV4KCkgbWFjcm8KPiAgIGxpYjogc2JpX3RpbWVy
OiBJbnRyb2R1Y2UgcGVyLUhBUlQgdGltZXIgc3RhdGUKPiAgIGxpYjogc2JpX3RpbWVyOiBBZGQg
c3VwcG9ydCBmb3IgdGltZXIgZXZlbnRzCj4gICBsaWI6IHNiaV90aW1lcjogSW50cm9kdWNlIHNi
aV90aW1lcl9jb21wdXRlX2RlbHRhKCkgYW5kIGZyaWVuZHMKPgo+ICBpbmNsdWRlL3NiaS9zYmlf
c2NyYXRjaC5oICB8ICAgNiArLQo+ICBpbmNsdWRlL3NiaS9zYmlfdGltZXIuaCAgICB8ICA5MiAr
KysrKysrKysrKystCj4gIGxpYi9zYmkvc2JpX2VjYWxsX2xlZ2FjeS5jIHwgICA0ICstCj4gIGxp
Yi9zYmkvc2JpX2VjYWxsX3RpbWUuYyAgIHwgICA0ICstCj4gIGxpYi9zYmkvc2JpX3RpbWVyLmMg
ICAgICAgIHwgMjU2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0KPiAgNSBm
aWxlcyBjaGFuZ2VkLCAzMTQgaW5zZXJ0aW9ucygrKSwgNDggZGVsZXRpb25zKC0pCj4KPiAtLQo+
IDIuNDMuMAo+CgpBcHBsaWVkIHRoaXMgc2VyaWVzIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8u
CgpUaGFua3MsCkFudXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9v
cGVuc2JpCg==
