Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703BDC87FD3
	for <opensbi@archiver.kernel.org>; Thu,  7 Aug 2025 00:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SJCMYtnSpYebg3erBgJtdR2TmxZCGtTnPF05ThY+eY0=; b=ujS+gKqcStZht7
	pgWe9VV4UG5su6idGDMm/GyY+dfci6MlYlxiai+Pb07pquoW0ru4KH8C3wyh3xOiGodOJPiEV5qfQ
	nPw3ugApopKxSqIfRghPpbCUw0JDpixYo/XDtCtGqhYrLrBY7YTnsvBa1V1fIw2UrKn/ojfYt5iLI
	MB0SOk8NVey07+CTc9CvFEUL4kURenz4gklF4Oo4kJcLXhrLgRlCzsuptHv1xJF553E4zSILu01Fu
	vbcOwGm/0HQuQV0Ro1orXlapyH+rpq/B81W5sAzQ/MhlObroaokdIDcbZh19+QTP5KRijj+LibFQ5
	RydaJKgw5B/NJU8kQspw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujoHK-0000000GtZ1-3JIr;
	Thu, 07 Aug 2025 00:14:42 +0000
Received: from m16.mail.126.com ([220.197.31.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujoHH-0000000GtWy-3gAU
	for opensbi@lists.infradead.org;
	Thu, 07 Aug 2025 00:14:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Subject:From:To:Date:Content-Type:
	MIME-Version; bh=hHpEI0ZL4U0VLYs1GKDfI0pSOr9q0KkxNDh7Zk38rpk=;
	b=PjAPoNQLePFOAro0Q9X/uMzvkFmc4g612UFt4J+f/MNZmakychY8Cp2l7Jt0LW
	0ctagI0QhTPX9nOnoDg44ZleIPBxsZRTdG+Vl6d3AFMXf2gF2OWgRzZ+D0s8RKRu
	6BbDMPvFfj3dYFimtBx/2MKw+WLqgTpVX+DQQhPpZq4es=
Received: from [127.0.0.1] (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3l+3n75NovpntBA--.32473S2;
	Thu, 07 Aug 2025 08:14:32 +0800 (CST)
Message-ID: <332ca1a6955e1b1be1b7157180757cfa9acbda44.camel@126.com>
Subject: Re: [PATCH] dbtr: Fix sbi_dbtr_read_trig to read from CSRs
From: Xiang W <wxjstz@126.com>
To: Jesse Taube <jesse@rivosinc.com>, opensbi@lists.infradead.org
Cc: Anup Patel <apatel@ventanamicro.com>, Charlie Jenkins
 <charlie@rivosinc.com>,  Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Thu, 07 Aug 2025 08:14:31 +0800
In-Reply-To: <20250806171041.810270-1-jesse@rivosinc.com>
References: <20250806171041.810270-1-jesse@rivosinc.com>
Autocrypt: addr=wxjstz@126.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CM-TRANSID: _____wD3l+3n75NovpntBA--.32473S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Gr15JFy8KrWxJrWfurW3KFg_yoW8Jr47pF
	95CFW7W3yIqryDt347Aa1qqr1rurs2g3WDK39ruryFk3s8Zw1xGrn7u348t3yftFyrury7
	XF1UuFWY9rsxZrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRZvtZUUUUU=
X-Originating-IP: [2408:823c:b211:31b5:ce10:514f:adfc:b35f]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi1wWiOmiT7vUMpQAAsD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_171440_329413_5D30DCDD 
X-CRM114-Status: UNSURE (   9.73  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjUtMDgtMDbkuInnmoQgMTA6MTAgLTA3MDDvvIxKZXNzZSBUYXViZeWGmemBk++8mgo+
IHNiaV9kYnRyX3JlYWRfdHJpZyByZXR1cm5lZCB0aGUgc2F2ZWQgc3RhdGUgb2YgdGRhdGF7MS0z
fSwgd2hlbiBpdAo+IHNob3VsZCBoYXZlIHJldHVybmVkIHRoZSB1cGRhdGVkIHN0YXRlIHJlYWQg
ZnJvbSBDU1JzLgo+IAo+IFVwZGF0ZSBzYmlfZGJ0cl9yZWFkX3RyaWcgdG8gcmV0dXJuIHVwZGF0
ZWQgc3RhdGUgcmVhZCBmcm9tIENTUnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmVzc2UgVGF1YmUg
PGplc3NlQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiDCoGxpYi9zYmkvc2JpX2RidHIuYyB8IDYgKysr
LS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9kYnRyLmMgYi9saWIvc2JpL3NiaV9kYnRyLmMK
PiBpbmRleCBhODMyYzdmMS4uYTM5YzMxNjQgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfZGJ0
ci5jCj4gKysrIGIvbGliL3NiaS9zYmlfZGJ0ci5jCj4gQEAgLTUyOSw5ICs1MjksOSBAQCBpbnQg
c2JpX2RidHJfcmVhZF90cmlnKHVuc2lnbmVkIGxvbmcgc21vZGUsCj4gwqAJCXhtaXQgPSAmZW50
cnktPmRhdGE7Cj4gwqAJCXRyaWcgPSBJTkRFWF9UT19UUklHR0VSKChfaWR4ICsgdHJpZ19pZHhf
YmFzZSkpOwo+IMKgCQl4bWl0LT50c3RhdGUgPSBjcHVfdG9fbGxlKHRyaWctPnN0YXRlKTsKPiAt
CQl4bWl0LT50ZGF0YTEgPSBjcHVfdG9fbGxlKHRyaWctPnRkYXRhMSk7Cj4gLQkJeG1pdC0+dGRh
dGEyID0gY3B1X3RvX2xsZSh0cmlnLT50ZGF0YTIpOwo+IC0JCXhtaXQtPnRkYXRhMyA9IGNwdV90
b19sbGUodHJpZy0+dGRhdGEzKTsKPiArCQl4bWl0LT50ZGF0YTEgPSBjc3JfcmVhZChDU1JfVERB
VEExKTsKPiArCQl4bWl0LT50ZGF0YTIgPSBjc3JfcmVhZChDU1JfVERBVEEyKTsKPiArCQl4bWl0
LT50ZGF0YTMgPSBjc3JfcmVhZChDU1JfVERBVEExKTsKCnRoZSBkZWJ1ZyB0cmlnZ2VyIHN0YXRl
IGFuZCBjb25maWd1cmF0aW9uIGNvbnNpc3Rpbmcgb2YgZm91ciBYTEVOLWJpdMKgCndvcmRzIGFy
ZSB3cml0dGVuIGluIGxpdHRsZS1lbmRpYW4gZm9ybWF0CgpEbyBub3QgcmVtb3ZlIGNwdV90b19s
bGUuCgpSZWdhcmRzLApYaWFuZyBXCj4gwqAJfQo+IMKgCXNiaV9oYXJ0X3VubWFwX3NhZGRyKCk7
Cj4gwqAKPiAtLSAKPiAyLjQzLjAKPiAKCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNi
aUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vb3BlbnNiaQo=
