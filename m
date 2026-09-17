Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519E3C88E72
	for <opensbi@archiver.kernel.org>; Thu, 17 Sep 2026 10:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nd8dn6E2ivjSCDNqrevFN7Q1ka4cm1owMZd0cNyLu+k=; b=hnFcupJM4hVPuz
	G4YlPVGjR6sojsF+nifU+xT+j579xa9fWpRNTP7apQds8gg2C+1hPKgisv58w7HgsxaBC/0wsPBDX
	KgeNQmEuH8x28O7gIxCsOdAjbmw1JZYiLQ5gpHEYVSOQPVUHwg83nPZ46ys7YFhCqqihd0MIQDMWm
	hejMR251LUYvkDRRK4fVfVhurljUjYvQi6iRqkBzTsRpLf7TiadiNwCIhJeBNpUDQfP9lqtSkB9y2
	xPFVAeaCSVjeTLGvRISqKyZuqabP40MrTY0zAY2K8AQpOzU/aaO4XxrT3BLA2tK03R3RMD/yjfSRV
	wqINeh1t6GGw4oVeiORQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79li-0000000B92p-2UJx;
	Thu, 17 Sep 2026 10:55:06 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79le-0000000B91P-2Lfe
	for opensbi@lists.infradead.org;
	Thu, 17 Sep 2026 10:55:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B5A1D1A0925;
	Thu, 17 Sep 2026 10:54:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 828EC5FAA3;
	Thu, 17 Sep 2026 10:54:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED03E11C7B06F;
	Thu, 17 Sep 2026 12:54:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=dkim; t=1789642492;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
	bh=KK4PrOQQSJmRDHCuLBWx/I7eJ4uJKov2xpN8jX/W2nQ=;
	b=N4ksUyfGAGvUk2hk8JJ+AVKztkPrb9vB78CnEgprlNwA8oFbfvIu6EQku4Wk0rP2eGo8MP
	fUE49ehk62ST5HpvYSD1qzt/1J09CPSOQWPQBYn+4W7dxX7dnSz8iTHzXXc9uZe4hoCDHN
	ExLaEZh1MwWGyCoNMFUDsSk0n6NRvoN/hQoATLj3gOJWnAkCJdor4wE/zjcrzrHqB5iQXi
	xUbRqdFBDrdwuLTKp36d+kC7SWxFYYcQQ0OrmCLbsl2ILLZoQ4/t1HSR21AZh744wT2xao
	sl2VdPNCoz8WJICixWlSColqouqS17jYaOzJnhtj7b6CyhSLtvHgGO1K04/NnQ==
Message-ID: <5e67bae3-753c-4f39-bdb2-b912ff2f62e8@rootcommit.com>
Date: Thu, 17 Sep 2026 12:54:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, Drew Fustini <drew@pdp7.com>,
 guoren@kernel.org, wefu@redhat.com, inochiama@gmail.com,
 opensbi@lists.infradead.org
Subject: Re: TH1520: broken CPU count detection
To: Yao Zi <me@ziyao.cc>
References: <873b32a7-2e17-41dd-be7a-f97d5b768177@rootcommit.com>
 <aqrG3uRzSjV58d8R@pie>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Autocrypt: addr=michael.opdenacker@rootcommit.com; keydata=
 xjMEagLVOhYJKwYBBAHaRw8BAQdApKjypQYDpk7gc2tKU7srAaN/v2wqp3zsRtrICl5tMarN
 Nk1pY2hhZWwgT3BkZW5hY2tlciA8bWljaGFlbC5vcGRlbmFja2VyQHJvb3Rjb21taXQuY29t
 PsKQBBMWCgA4FiEEHltE0IOQ91GyZqTazXRqZ2jNCaAFAmoC1ToCGwMFCwkIBwIGFQoJCAsC
 BBYCAwECHgECF4AACgkQzXRqZ2jNCaAK/QD/fCa/2kPEcJYpt3XjoXUFC40rV5p92/Mn/CcV
 cDDLTNcA/19zgdNIKAqVOaJAcLwhBjCCIZJfAQ80CuPOdGRR5NMGzjgEagLVOhIKKwYBBAGX
 VQEFAQEHQCujvLLf/3B2yAjCRJWU9BUta58RTcZ9ZYYxzsOBj5FmAwEIB8J4BBgWCgAgFiEE
 HltE0IOQ91GyZqTazXRqZ2jNCaAFAmoC1ToCGwwACgkQzXRqZ2jNCaAWEgD/SY55n6h+sq1u
 /Kdbsd4z+uOz2+0Z9V0HtrYLdfgdBTIA/0nuXShti770G4hZDQD52XLANSdPbO7hbwmpNKHm y3UE
In-Reply-To: <aqrG3uRzSjV58d8R@pie>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_035502_827776_66079D6F 
X-CRM114-Status: UNSURE (   7.78  )
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

SGkgWWFvCgpPbiA5LzE2LzI2IDY6NDIgUE0sIFlhbyBaaSB3cm90ZToKPiBPbiBUdWUsIFNlcCAx
NSwgMjAyNiBhdCAwOTozMTowMUFNICswMjAwLCBNaWNoYWVsIE9wZGVuYWNrZXIgd3JvdGU6Cj4+
IEdyZWV0aW5ncywKPj4KPj4gRm9yIHRoZSBZb2N0byBtZXRhLXJpc2N2IGxheWVyLCB3ZSdyZSB0
cnlpbmcgdG8gcmVwbGFjZSB0aGUgZG93bnN0cmVhbQo+PiBvcGVuc2JpIChjYWxsZWQgb3BlbnNi
aS1yZXZ5b3MpIGJ5IG1haW5saW5lIG9wZW5zYmk6Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNj
di9tZXRhLXJpc2N2L3B1bGwvNjg1Lwo+Pgo+PiBUaGUgYm9hcmQgYm9vdHMgZmluZSwgYnV0IHVu
Zm9ydHVuYXRlbHksIG9ubHkgMSBDUFUgY29yZSBpcyBkZXRlY3RlZC4gVGhpcwo+PiBzdXJmYWNl
cyBpbiB0aGUgTGludXgga2VybmVsIGxvZzoKPj4KPj4gW8KgIMKgIDAuMDg5ODUxXSBzbXA6IEJy
aW5naW5nIHVwIHNlY29uZGFyeSBDUFVzIC4uLgo+PiBbwqAgwqAxMC4xNjU1NDJdIENQVTEgZmFp
bGVkIHRvIHJlcG9ydCBhbGl2ZSBzdGF0ZQo+PiBbwqAgwqAyMC4yNDE2MzJdIENQVTIgZmFpbGVk
IHRvIHJlcG9ydCBhbGl2ZSBzdGF0ZQo+PiBbwqAgwqAzMC4zMTY5ODBdIENQVTMgZmFpbGVkIHRv
IHJlcG9ydCBhbGl2ZSBzdGF0ZQo+IFdoYXQgTGludXgga2VybmVsIGFyZSB5b3UgdXNpbmc/Ckkn
bSB1c2luZyBtYWlubGluZSBMaW51eCA3LjIueC4KSXMgdGhpcyBzb21ldGhpbmcgTGludXggY2Fu
IG1hbmFnZT8KVGhhbmtzCk1pY2hhZWwKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2Jp
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9vcGVuc2JpCg==
