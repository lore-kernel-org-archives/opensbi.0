Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C904C83F03
	for <opensbi@archiver.kernel.org>; Wed,  9 Jul 2025 06:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AarWwfzarykGvtA1c6HTp6fuJtCxXYSfc0JDF7W/rrI=; b=dGxn5ptqpnZ02q
	OljhWGuK6qCc07slSng3TwwXDB91yqQCvmVkqlRmp6oJKgby8xa+BnkTG6bP4kpF58y3XtkdQnyCJ
	dAn72XlZq4ZSyX8x2/kpsxbILSolkpeTRKPYy7gwla1MB7G4WyScTT9w3oe5mFx9lErIp464jEFrd
	Yf/+whcp9ty3fuGL5THG79nJc3tW1BH+4ie8bDAIJC6YGTJZdMx9ZoBeQ/AM6f/YxVMnAK1ERjyzs
	AmnR7T5ud+9jOu5K8ZtrSmH0qQiVb7z8me6KWyv/lgF+Cn/YxrYdPozGsO48gQTs6ftwMJf0g/XG3
	4ojOzU4vpVukqD2fof+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZNvC-00000007eKx-02pb;
	Wed, 09 Jul 2025 06:04:46 +0000
Received: from m16.mail.126.com ([117.135.210.7])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZNv8-00000007eKU-3xTT
	for opensbi@lists.infradead.org;
	Wed, 09 Jul 2025 06:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Subject:From:To:Date:Content-Type:
	MIME-Version; bh=93t2ngSK1MYHGzKGJ5its4LIbHixxaBiG3fw75X9rVo=;
	b=bMZV/7gHmy8wLLtdBvOX8ZsEHBmngwvodr4+5i6dteTqqdgY5xYiq8GUPL+5at
	dcivX2zmW7Q6Fz5Ek/LWfjyf/MQf9TSo21k/QGRx6ggJswr3SSXCao1UEfRX/Xeu
	MqVYm3RbVJ5hAHWdD55Q/TdUYtV92/56RUqQ4ixZIPrCA=
Received: from [127.0.0.1] (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3V+9xBm5oNpEhAA--.8158S2;
	Wed, 09 Jul 2025 14:04:34 +0800 (CST)
Message-ID: <bf236a28adababc9cf5b34265ad8a6e6ad6c3c9f.camel@126.com>
Subject: Re: [PATCH] platform: openpiton: fix uninitialized plic_data struct
From: Xiang W <wxjstz@126.com>
To: Manuel =?ISO-8859-1?Q?Hern=E1ndez_M=E9ndez?= <maherme.dev@gmail.com>, 
	opensbi@lists.infradead.org
Date: Wed, 09 Jul 2025 14:04:32 +0800
In-Reply-To: <20250708180914.1131-1-maherme.dev@gmail.com>
References: <20250708180914.1131-1-maherme.dev@gmail.com>
Autocrypt: addr=wxjstz@126.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CM-TRANSID: _____wD3V+9xBm5oNpEhAA--.8158S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw1DtrW8ury5ur18tw4xZwb_yoW8Gw1UpF
	WUKan3KFW8GryFka1jy3y8Zr4a9rn0qr40vF1UZw1ay3s0gr1qgr1Uta4Y93ZxKrn5J3WU
	AFyv9r48ZanIv3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziqNt7UUUUU=
X-Originating-IP: [153.35.240.253]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi1xCFOmht98iKywABsC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_230443_445988_D7AE7C56 
X-CRM114-Status: GOOD (  12.70  )
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

5ZyoIDIwMjUtMDctMDjkuoznmoQgMjA6MDkgKzAyMDDvvIxNYW51ZWwgSGVybsOhbmRleiBNw6lu
ZGV65YaZ6YGT77yaCj4gVGhlIHBsaWNfZGF0YSBzdHJ1Y3Qgd2FzIHVuaW5pdGlhbGl6ZWQuIFRo
aXMgbGVkIHRvIG1pc2Z1bmN0aW9uIGJlaGF2aW9yCj4gc2luY2UgaXQgd2FzIHN1YnNlcXVlbnRs
eSBhc3NpZ25lZCB0byB0aGUgZ2xvYmFsIHBsaWMgc3RydWN0LCBhbmQgc29tZQo+IHN0cnVjdCBm
aWVsZHMsIHN1Y2ggYXMgZmxhZ3MgYW5kIGlycWNoaXAsIGNvbnRhaW5lZCByYW5kb20gdmFsdWVz
Lgo+IFRoZSBmaXggcHJvcG9zZXMgdG8gaW5pdGlhbGl6ZSB0aGUgcGxpY19kYXRhIHRvIHRoZSBn
bG9iYWwgcGxpYyBzdHJ1Y3QsCj4gc28sIGFmdGVyIHBhcnNpbmcgdGhlIGZkdCwgdGhlIGZpZWxk
cyBvZiB0aGUgc3RydWN0IHdpbGwgYmUgc2V0IHRvIHRoZQo+IGRlZmF1bHQgdmFsdWVzIHNldCBp
biBnbG9iYWwgcGxpYyBzdHJ1Y3QgZGVmaW5pdGlvbiwgb3IgdGhlIHBhcnNlZCB2YWx1ZXMKPiBp
biB0aGUgZmR0LCBvciB6ZXJvLgo+IAo+IEZpeGVzOiA0YzM3NDUxICgicGxhdGZvcm06IG9wZW5w
aXRvbjogUmVhZCB0aGUgZGV2aWNlIGNvbmZpZ3VyYXRpb25zIGZyb20KPiBkZXZpY2UgdHJlZSIp
Cj4gU2lnbmVkLW9mZi1ieTogTWFudWVsIEhlcm7DoW5kZXogTcOpbmRleiA8bWFoZXJtZS5kZXZA
Z21haWwuY29tPgoKR29vZCBjYXRjaC4gTWF5YmUgd2UgY2FuIGRpcmVjdHkgcGFzcyB1YXJ0L3Bs
aWMgdG/CoApmZHRfcGFyc2VfdWFydDgyNTAvZmR0X3BhcnNlX3BsaWMKClJlZ2FyZHMsClhpYW5n
IFcKPiAtLS0KPiDCoHBsYXRmb3JtL2ZwZ2Evb3BlbnBpdG9uL3BsYXRmb3JtLmMgfCAyICstCj4g
wqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvcGxhdGZvcm0vZnBnYS9vcGVucGl0b24vcGxhdGZvcm0uYyBiL3BsYXRmb3JtL2Zw
Z2Evb3BlbnBpdG9uL3BsYXRmb3JtLmMKPiBpbmRleCBkMmNmM2UzMi4uZmFhMjk5Y2UgMTAwNjQ0
Cj4gLS0tIGEvcGxhdGZvcm0vZnBnYS9vcGVucGl0b24vcGxhdGZvcm0uYwo+ICsrKyBiL3BsYXRm
b3JtL2ZwZ2Evb3BlbnBpdG9uL3BsYXRmb3JtLmMKPiBAQCAtNzksNyArNzksNyBAQCBzdGF0aWMg
aW50IG9wZW5waXRvbl9lYXJseV9pbml0KGJvb2wgY29sZF9ib290KQo+IMKgewo+IMKgCWNvbnN0
IHZvaWQgKmZkdDsKPiDCoAlzdHJ1Y3QgcGxhdGZvcm1fdWFydF9kYXRhIHVhcnRfZGF0YSA9IHsg
MCB9Owo+IC0Jc3RydWN0IHBsaWNfZGF0YSBwbGljX2RhdGE7Cj4gKwlzdHJ1Y3QgcGxpY19kYXRh
IHBsaWNfZGF0YSA9IHBsaWM7Cj4gwqAJdW5zaWduZWQgbG9uZyBhY2xpbnRfZnJlcTsKPiDCoAl1
aW50NjRfdCBjbGludF9hZGRyOwo+IMKgCWludCByYzsKPiAtLSAKPiAyLjM0LjEKPiAKCgotLSAK
b3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
