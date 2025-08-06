Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D5BC87FD1
	for <opensbi@archiver.kernel.org>; Wed,  6 Aug 2025 01:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=smZpwQ+Fjw0XF2SGiuu6Kk7PbbP8h04trJYysvj0084=; b=im/9iXwHRqBm1b
	RZ2Or+BsG/a8cJYGemhjkewuMBtcdRp8MsVmFRdpk1fq3efaFDBBWJ9N8YNL7deU63wTU9F011LDK
	bvAal4UENgedTZTHgepTBp9p8gLCRGEhNQUsnmgUH1gFvzOuixBhUn1rMMYgMhVtF/81QnNJtg7n2
	EiIEUadYu11YHLya769W8m9DL2YGkmNFLbL0+ODb2Hm1sal4S5iVPR4ESn+1wERLhjNdV6gjq6xeb
	gyk9XAKrOge2MrcVDp3KQfnaDP2fxc5uz1WIJiekQS60VWRPRHFkcmjS4uBEUhkGNoj6Npv7ArXbB
	rJZoxoTpgXAe8QO8HTyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujT6j-0000000E8Cc-47lk;
	Wed, 06 Aug 2025 01:38:21 +0000
Received: from m16.mail.126.com ([220.197.31.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujT6h-0000000E8Ad-2kM8
	for opensbi@lists.infradead.org;
	Wed, 06 Aug 2025 01:38:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Subject:From:To:Date:Content-Type:
	MIME-Version; bh=3sorK5b6X+Ta3szgnVRzXpQkjoobs+0kMfIQ/ZutD9k=;
	b=QGpcAnCyaY8ZUDF1NnLeh8Y4ek3c0/INCFh//7IyJG9bqNaPqp7Ldxkl8B1NcR
	GN58NZzq+YFaE+zIFrcV0sRTWbA71mQmCLk+FM05AhAvqUarbjF65HIsDPby0xx2
	Na5KXLq/iKqUxylcM+fQvE4KFF0yyTHkZWm6U5H16gT/0=
Received: from [127.0.0.1] (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnP1UHspJooMLpBA--.20270S2;
	Wed, 06 Aug 2025 09:38:15 +0800 (CST)
Message-ID: <1907533a372fa53fe08120c9e91e986c8d134117.camel@126.com>
Subject: Re: [PATCH 3/3] include: sbi: Lift the maximum harts to 1024
From: Xiang W <wxjstz@126.com>
To: wu.fei9@sanechips.com.cn, opensbi@lists.infradead.org
Date: Wed, 06 Aug 2025 09:38:14 +0800
In-Reply-To: <202508060106.57616maD072614@mse-db.zte.com.cn>
References: 20250806084123476SCLxg-qQRa8CRuhuY-dwE@zte.com.cn <202508060106.57616maD072614@mse-db.zte.com.cn>
Autocrypt: addr=wxjstz@126.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CM-TRANSID: _____wDnP1UHspJooMLpBA--.20270S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw4DAr4xXFy7JFW3GrykXwb_yoWfCFc_A3
	Z3Cr4kKrs7ZrZaqr4xtrZ8CFWY9ws5Cw48XF4rursrX3yktws5C3Z7Kr13CFs8Gw4kJFs3
	urnxWr9Ikr13ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRMmhFDUUUUU==
X-Originating-IP: [2408:823c:b211:31b5:ce10:514f:adfc:b35f]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi5B2hOmiSolXseQAAs6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_183819_999711_3D0813C5 
X-CRM114-Status: GOOD (  10.58  )
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

5ZyoIDIwMjUtMDgtMDbkuInnmoQgMDk6MDQgKzA4MDDvvIx3dS5mZWk5QHNhbmVjaGlwcy5jb20u
Y27lhpnpgZPvvJoKPiBJdCBpcyBleHBlY3RlZCB0byBoYXZlIHJpc2N2IHNlcnZlciBib2FyZHMg
d2l0aCBtYW55IGNvcmVzIHZlcnkgc29vbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXdSBGZWkgPHd1
LmZlaTlAc2FuZWNoaXBzLmNvbS5jbj4KPiAtLS0KPiDCoGluY2x1ZGUvc2JpL3NiaV9oYXJ0bWFz
ay5oIHwgMiArLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9oYXJ0bWFzay5oIGIvaW5jbHVk
ZS9zYmkvc2JpX2hhcnRtYXNrLmgKPiBpbmRleCAyMDBhYjZlLi4yZjk0ZjM5IDEwMDY0NAo+IC0t
LSBhL2luY2x1ZGUvc2JpL3NiaV9oYXJ0bWFzay5oCj4gKysrIGIvaW5jbHVkZS9zYmkvc2JpX2hh
cnRtYXNrLmgKPiBAQCAtMjAsNyArMjAsNyBAQAo+IMKgICogYWxzbyByZXByZXNlbnRzIHRoZSBt
YXhpbXVtIG51bWJlciBvZiBIQVJUIGlkcyBnZW5lcmljIE9wZW5TQkkKPiDCoCAqIGNhbiBoYW5k
bGUuCj4gwqAgKi8KPiAtI2RlZmluZSBTQklfSEFSVE1BU0tfTUFYX0JJVFPCoMKgwqDCoMKgwqDC
oMKgwqAgMTI4Cj4gKyNkZWZpbmUgU0JJX0hBUlRNQVNLX01BWF9CSVRTwqDCoMKgwqDCoMKgwqDC
oMKgIDEwMjQKMTI4IGlzIHN1aXRhYmxlIGZvciBtb3N0IGNhc2VzLiBBZGRpbmcgdGhpcyBtYWNy
byB3aWxsIGluY3JlYXNlwqAKdGhlIG1lbW9yeSBjb25zdW1wdGlvbiBvZiBtb3N0IHBsYXRmb3Jt
cy4gSXQgaXMgcmVjb21tZW5kZWQgdG/CoAphZGQgYSBjdXN0b20gb3B0aW9uIGluIEtjb25maWcK
ClJlZ2FyZHMsClhpYW5nIFcKPiAKPiDCoC8qKiBSZXByZXNlbnRhdGlvbiBvZiBoYXJ0bWFzayAq
Lwo+IMKgc3RydWN0IHNiaV9oYXJ0bWFzayB7Cj4gLS0KPiAyLjQzLjAKCgotLSAKb3BlbnNiaSBt
YWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
