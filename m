Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C602CCCF9EA
	for <opensbi@archiver.kernel.org>; Mon, 27 Oct 2025 13:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OFYoB3UwALhE4Ep2LHFpHPozD/uY+QGyFlC/6LlmDw4=; b=ibFQ76No2qLS1c
	PMtGj6RkbovC4TyiUJ9zXst49xnsu4hhd3I08+970fPMvWOjBNBXy0kWzgarXHX13ljD/7EnudUU2
	1jvJT0G0htG3MZR7WpNF6dl6MgNUCNeji5KHM9xJ9KPmzO3DPxci+T4GErZi76g1rfvuNSyQAS1hp
	wOVKmBdoiqigynYCyU7RY1zvvg3W37BYvsaQ1mlw71eeniubozdAf3eI8UU124VqCbrep2Qdsb9IX
	MlmB/Z01OQ9JLmcOaNIjxV/NdvFaXWLlHg1DMLUr3YlJSD/CBx1S2MdsiuVJERZJnU3vpmXlTafzV
	1pq9yfi33479kh8hL4Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDN1j-0000000DzWv-1g2L;
	Mon, 27 Oct 2025 13:12:47 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDN1g-0000000DzVJ-0VfQ
	for opensbi@lists.infradead.org;
	Mon, 27 Oct 2025 13:12:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2844E4E41350;
	Mon, 27 Oct 2025 13:12:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EBAFE6062C;
	Mon, 27 Oct 2025 13:12:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 679B8102F24FE;
	Mon, 27 Oct 2025 14:12:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761570758; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=vWFJE2URgBYIPpiL4cYRvEUeMCMLZ6rhW1celpj8kow=;
	b=sdI43kfrC4O0WJyghniTHRngmGYAr+CGdbspRb3u0E/ZDEeoy5LTmpT6zLP2fuKMp9pV5H
	WPZbml4Oy/sZizNlAeYu8S/+zpiojFtrbPmoFWxhUZ5AO+J33EjmA8bOMgL7hD39O/eOwO
	7b/9FGWNsCcDTJzrw+ROrOYtw98HYhPEVEAnDsL7FD7wbgUisMj83tDlrGpyjdsc9JrUBi
	I19i8U4VoMc9/z3ZR1OWTsnwZxK6vrS7BK74qLcue1MZw/1mEODDC32EnQW728cUiQPn2e
	ozGx0FFxStkcBdzsu5XxVhifCKLS1u/pFxwC4hw5rPmS7xCmLZSdKEGsMTfj1Q==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH v2 0/2] Add MIPS P8700 compatibles for ACLINT MSWI and
 MTIMER
Date: Mon, 27 Oct 2025 14:12:16 +0100
Message-Id: <20251027-p8700-aclint-v2-0-f10cbfb66e92@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALBv/2gC/1XMQQ7CIBCF4as0sxYD2NKhK+9huqgIdhItDRCia
 bi72MSFy38m79sg2kA2wtBsEGymSH6pIQ8NmHla7pbRrTZILjvBObIVe87ZZB60JGYdokJE3bc
 d1MkarKPXzl3G2jPF5MN717P4Xn+Q/oeyYJwJPElpVOu0wvPV+1RfR+OfMJZSPm0U/MGqAAAA
X-Change-ID: 20251008-p8700-aclint-ef8868889745
To: opensbi@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_061244_292939_B6536531 
X-CRM114-Status: UNSURE (   7.87  )
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

VGhlIEFDTElOVCBmb3VuZCBpbiB0aGUgTUlQUyBQODcwMCBpcyBjb21wbGlhbnQgd2l0aCB0aGUg
bm93IGFyY2hpdmVkClJJU0MtViBBZHZhbmNlZCBDb3JlIExvY2FsIEludGVycnVwdG9yIFNwZWNp
ZmljYXRpb24uIFRoZXJlIGlzIG9uZQpBQ0xJTlQgY29udHJvbGxlciBwZXIgY2x1c3RlciwgYXMg
cGFydCBvZiB3aGF0IE1JUFMgY2FsbHMgdGhlIGNvaGVyZW5jZQptYW5hZ2VyLgoKVGhlIE1TV0kg
ZG9lcyBub3QgcmVxdWlyZSBhbnkgY2hhbmdlcyBpbiB0aGUgY29kZSwgc28gb25seSBhIGNvbXBh
dGlibGUKc3RyaW5nIGlzIGFkZGVkLgoKRm9yIHRoZSBNVElNRVIsIHRoZXJlIGlzIG5vIGRlZGlj
YXRlZCBtdGltZSByZWdpc3RlciB0byBhY3QgYSByZWZlcmVuY2UKaW4gYSBtdWx0aS1jbHVzdGVy
IGNvbmZpZ3VyYXRpb24sIGFuZCB0aGVyZSBpcyBubyBNVElNRVIgd2l0aG91dAphc3NvY2lhdGVk
IEhBUlRzLiBBIHF1aXJrIGlzIGFkZGVkIHRvIHNlbGVjdCB0aGUgcmVmZXJlbmNlIE1USU1FUiBi
YXNlZApvbiBhIGRldmljZSB0cmVlIHByb3BlcnR5LgoKU2lnbmVkLW9mZi1ieTogQmVub8OudCBN
b25pbiA8YmVub2l0Lm1vbmluQGJvb3RsaW4uY29tPgotLS0KQ2hhbmdlcyBpbiB2MjoKLSBTZWxl
Y3QgdGhlIHJlZmVyZW5jZSBNVElNRVIgYmFzZWQgb24gYSBEVCBwcm9wZXJ0eSwgbm90IHRoZSBm
aXJzdCBvbmUKICBmb3VuZC4KLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9y
LzIwMjUxMDA5LXA4NzAwLWFjbGludC12MS0wLTE4MzIyYzY0Zjk2OEBib290bGluLmNvbQoKLS0t
CkJlbm/DrnQgTW9uaW4gKDIpOgogICAgICBsaWI6IHV0aWxzL2lwaTogbXN3aTogYWRkIE1JUFMg
UDg3MDAgY29tcGF0aWJsZQogICAgICBsaWI6IHV0aWxzL3RpbWVyOiBtdGltZXI6IGFkZCBNSVBT
IFA4NzAwIGNvbXBhdGlibGUKCiBsaWIvdXRpbHMvaXBpL2ZkdF9pcGlfbXN3aS5jICAgICAgIHwg
IDEgKwogbGliL3V0aWxzL3RpbWVyL2ZkdF90aW1lcl9tdGltZXIuYyB8IDI1ICsrKysrKysrKysr
KysrKysrKystLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiBhYzE2YzZiNjA0OTYxNTI1YmIwOTZjMDUxM2M2YWQ0
ZGJmNWE1Njk1CmNoYW5nZS1pZDogMjAyNTEwMDgtcDg3MDAtYWNsaW50LWVmODg2ODg4OTc0NQoK
QmVzdCByZWdhcmRzLAotLSAKQmVub8OudCBNb25pbiwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBh
bmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCgotLSAKb3BlbnNiaSBt
YWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
