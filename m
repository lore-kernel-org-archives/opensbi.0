Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA4FC88E53
	for <opensbi@archiver.kernel.org>; Tue, 15 Sep 2026 07:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PjXQxalGScTCtdprNMiQ7sm0mDwRRxRYiwAb5x2SwFE=; b=HafWn/zLOfDMX5pFCaI4CDHpmE
	YYsbkzXX4szPIrvSdyMK6UCfyb0R8dtBvFug6ICwf9K8WPmi1iyy8PSGadyEHnDscSTdhJlHNghyk
	INL+W4f51sAmNdjen6QFXrun+zHZyXlTwmq8VA0Gh0g0XG5QOHZxoDlAwnsNAq5nPdfQKHV9jNs2l
	bn2MFzmzCDIzYHNYqORs6inpwgF4lCHu/gE2IoIPko0w3jlTPAQU4ITx53qEXnSejhkmUo+hsSJBV
	7smw3hToVUW1Er9WQHBFuekxyfH3VhdS282REjzvZrk5KVCyI80c97pFGGewvrA0QU5ZvkFIpd3Xn
	2nyqBhpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ne6-00000005TYG-2g9f;
	Tue, 15 Sep 2026 07:32:02 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NdO-00000005TW0-2owg
	for opensbi@lists.infradead.org;
	Tue, 15 Sep 2026 07:31:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ADEFE1A0795;
	Tue, 15 Sep 2026 07:31:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8070F60498;
	Tue, 15 Sep 2026 07:31:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4541B11C7AFC3;
	Tue, 15 Sep 2026 09:31:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=dkim; t=1789457467;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:autocrypt;
	bh=KANwIHrWm+F58wt7dmlV/0H/viUbVzCvgO4iS4qWvVw=;
	b=tqw5Ew6bdPe5EyKYGu3THEWtpyjbqrwjBUoizJBeG20gmvZl8+I3Fv73maFYxE8bW0TCJw
	7y/22icgDk7h46Ev2GRL9NmQ2NB5VfzCq2/mLL/KJW/S+JJKee+Mn62BsWdyQZV852QYZD
	xIpzh36siYV7A4ZlfZmKWY44gQ4bM2qANsr/CC0yPonwdQwtcjjUEU72CFtsLV7IJdnwaa
	zIcM/A65MLlkLlviVx/PyZqQio8REuYb5De1FoGagNMuQp+n05tLjiLISOmB1PG/mab0ks
	z0WaE9SxiEkRsylWsCOkDJ/o7n6eAP8/QlbhD1QujQ8jn/NeTfbixdMpuX8gvA==
Message-ID: <873b32a7-2e17-41dd-be7a-f97d5b768177@rootcommit.com>
Date: Tue, 15 Sep 2026 09:31:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: opensbi@lists.infradead.org
Cc: michael.opdenacker@rootcommit.com, Drew Fustini <drew@pdp7.com>,
 guoren@kernel.org, wefu@redhat.com, inochiama@gmail.com
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: TH1520: broken CPU count detection
Autocrypt: addr=michael.opdenacker@rootcommit.com; keydata=
 xjMEagLVOhYJKwYBBAHaRw8BAQdApKjypQYDpk7gc2tKU7srAaN/v2wqp3zsRtrICl5tMarN
 Nk1pY2hhZWwgT3BkZW5hY2tlciA8bWljaGFlbC5vcGRlbmFja2VyQHJvb3Rjb21taXQuY29t
 PsKQBBMWCgA4FiEEHltE0IOQ91GyZqTazXRqZ2jNCaAFAmoC1ToCGwMFCwkIBwIGFQoJCAsC
 BBYCAwECHgECF4AACgkQzXRqZ2jNCaAK/QD/fCa/2kPEcJYpt3XjoXUFC40rV5p92/Mn/CcV
 cDDLTNcA/19zgdNIKAqVOaJAcLwhBjCCIZJfAQ80CuPOdGRR5NMGzjgEagLVOhIKKwYBBAGX
 VQEFAQEHQCujvLLf/3B2yAjCRJWU9BUta58RTcZ9ZYYxzsOBj5FmAwEIB8J4BBgWCgAgFiEE
 HltE0IOQ91GyZqTazXRqZ2jNCaAFAmoC1ToCGwwACgkQzXRqZ2jNCaAWEgD/SY55n6h+sq1u
 /Kdbsd4z+uOz2+0Z9V0HtrYLdfgdBTIA/0nuXShti770G4hZDQD52XLANSdPbO7hbwmpNKHm y3UE
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_003119_226657_17EBD075 
X-CRM114-Status: UNSURE (   3.65  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

R3JlZXRpbmdzLAoKRm9yIHRoZSBZb2N0byBtZXRhLXJpc2N2IGxheWVyLCB3ZSdyZSB0cnlpbmcg
dG8gcmVwbGFjZSB0aGUgZG93bnN0cmVhbSAKb3BlbnNiaSAoY2FsbGVkIG9wZW5zYmktcmV2eW9z
KSBieSBtYWlubGluZSBvcGVuc2JpOgpodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvbWV0YS1yaXNj
di9wdWxsLzY4NS8KClRoZSBib2FyZCBib290cyBmaW5lLCBidXQgdW5mb3J0dW5hdGVseSwgb25s
eSAxIENQVSBjb3JlIGlzIGRldGVjdGVkLiAKVGhpcyBzdXJmYWNlcyBpbiB0aGUgTGludXgga2Vy
bmVsIGxvZzoKClvCoCDCoCAwLjA4OTg1MV0gc21wOiBCcmluZ2luZyB1cCBzZWNvbmRhcnkgQ1BV
cyAuLi4KW8KgIMKgMTAuMTY1NTQyXSBDUFUxIGZhaWxlZCB0byByZXBvcnQgYWxpdmUgc3RhdGUK
W8KgIMKgMjAuMjQxNjMyXSBDUFUyIGZhaWxlZCB0byByZXBvcnQgYWxpdmUgc3RhdGUKW8KgIMKg
MzAuMzE2OTgwXSBDUFUzIGZhaWxlZCB0byByZXBvcnQgYWxpdmUgc3RhdGUKCkFueSB0aXBzIGZv
ciBzb2x2aW5nIHRoaXMgaXNzdWU/ClRoYW5rcyBpbiBhZHZhbmNlCkNoZWVycwpNaWNoYWVsCgoK
LS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
