Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667B9C8303D
	for <opensbi@archiver.kernel.org>; Fri,  4 Jul 2025 12:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JNOyP25tcCY6NlQ/ProB7ho6R4NcvbRAxMVb+amAb7E=; b=pKgiwIoFoPdB1p
	X0NhL5ScWorkBpU2Bo7VpPNlbaLM06tx2vFqc1MFJSmPfQBcTknvsSyxouWP/JqMV6Z4DrJuJr430
	tABFxstZvdT5VlDAA5v+UjCa7S4ekH8+ekw3sN58HH6d0kTRjn6JzN6OSQSiiePg59P3H/YNTSCGp
	4ksM0I8WxfRW79QGZpW0wn43CR/tvelpuYuV1J/bjJSWtKaqMZZ4PFYHLDTK5iKUSib4tTZ1Lqfhn
	13dyGySGZVu5MnNCOsSTn2m6yEr6TOyU+BQSxwJGjAdmOFgREtsejmMIq2v2Dn85PyEuFYEnyQQxX
	3F22Op4t++ZVrYtmEfRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXfYA-0000000EOEB-0LIa;
	Fri, 04 Jul 2025 12:29:54 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXfY7-0000000EOCr-0Nwz
	for opensbi@lists.infradead.org;
	Fri, 04 Jul 2025 12:29:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OTNRAENc9vPJIhCDgbWSejCPIOrtDxcja/CoytAPOFQ=; b=ZEdgu59DdS98OYrY/5GzRipcHP
	WdxbkXjO5HJ9aC1nKBgyuRViSWz1QPM8YD0TfYXaU9HLq8JXsZjiPdAgHZP3IqCpEwUsgmZSyt97o
	xwBtp15c15XbFQia/MoMtU4McY5l/3B3k81pr774ghZsvFvkvN9arw2FGcThMqJ2bLoyL4Tw+FGtk
	5+C5lPG112gBKEF/9Qp1EDiK5zpWP1Feyp4FhIXyv3LeJLRZ4pR9zOjUQ2vjOVVV4aH/SYdyNNhii
	OGw7ux9yG3zg7jEHcD7tlfHz5p74XntQQu4EcHVvc8k0PgMQ/868bjEBU04aZc6NVNyanDleMoftf
	LKcPtSfQ==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1uXfY0-00AwaR-UR; Fri, 04 Jul 2025 13:29:45 +0100
Received: from ben by rainbowdash with local (Exim 4.98.2)
	(envelope-from <ben@rainbowdash>)
	id 1uXfY0-00000003ldC-3m4M;
	Fri, 04 Jul 2025 13:29:44 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: opensbi@lists.infradead.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] include: sbi: fix swap errors with newer gcc -Werror=sequence-point
Date: Fri,  4 Jul 2025 13:29:38 +0100
Message-Id: <20250704122938.897832-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_052951_216026_4ACEB1FA 
X-CRM114-Status: GOOD (  10.52  )
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

VGhlIEJTV0FQeHgoKSBtYWNyb3MgYXJlIG5vdyB0aHJvd2luZyB0aGUgZm9sbG93aW5nIHdhcm5p
bmdzIHdpdGgKbmV3ZXIgZ2NjIHZlcnNpb25zLiBUaGlzIGlzIGR1ZSB0byB0aHJvd2luZyBhbiBh
cmd1bWVudCBpbiB0aGF0IG1heQpiZSBldmFsdWF0ZWQgbW9yZSB0aGFuIG9uZSAoSSB0aGluaykg
YW5kIHRoZXJlZm9yZSB0aGluZ3MgbGlrZSB0aGUKZXhhbXBsZSBiZWxvdyBzaG91bGQgYmUgYXZv
aWRlZC4KCkZpeCBieSBtYWtpbmcgYSBzZXQgb2YgQlNXQVB4eCgpIHdyYXBwZXJzIHdoaWNoIHNw
ZWNpZmljYWxseSBvbmx0CmV2YWx1YXRlICd4JyBvbmNlLgoKSW4gZmlsZSBpbmNsdWRlZCBsaWIv
c2JpL3NiaV9tcHh5LmM6MjE6CmxpYi9zYmkvc2JpX21weHkuYzogSW4gZnVuY3Rpb24g4oCYc2Jp
X21weHlfd3JpdGVfYXR0cnPigJk6CmliL3NiaS9zYmlfbXB4eS5jOjYzMjo2MzogZXJyb3I6IG9w
ZXJhdGlvbiBvbiDigJhtZW1faWR44oCZIG1heSBiZSB1bmRlZmluZWQgWy1XZXJyb3I9c2VxdWVu
Y2UtcG9pbnRdCiAgNjMyIHwgICAgICAgICAgICAgICAgICAgICAgICAgYXR0cl92YWwgPSBsZTMy
X3RvX2NwdShtZW1fcHRyW21lbV9pZHgrK10pOwogICAgICB8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB+fn5+fn5+Xn4KClNpZ25lZC1vZmYt
Ynk6IEJlbiBEb29rcyA8YmVuLmRvb2tzQGNvZGV0aGluay5jby51az4KLS0tCiBpbmNsdWRlL3Ni
aS9zYmlfYnl0ZW9yZGVyLmggfCAxMCArKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9i
eXRlb3JkZXIuaCBiL2luY2x1ZGUvc2JpL3NiaV9ieXRlb3JkZXIuaAppbmRleCAyYjQ5ODFlLi5l
ZDdjYWQxIDEwMDY0NAotLS0gYS9pbmNsdWRlL3NiaS9zYmlfYnl0ZW9yZGVyLmgKKysrIGIvaW5j
bHVkZS9zYmkvc2JpX2J5dGVvcmRlci5oCkBAIC0xNCwxMyArMTQsMTMgQEAKICMgZGVmaW5lIF9j
b252X2Nhc3QodHlwZSwgdmFsKSAoKHR5cGUpKHZhbCkpCiAjZW5kaWYKIAotI2RlZmluZSBCU1dB
UDE2KHgpCSgoKCh4KSAmIDB4MDBmZikgPDwgOCkgfCBcCisjZGVmaW5lIF9fQlNXQVAxNih4KQko
KCgoeCkgJiAweDAwZmYpIDw8IDgpIHwgXAogCQkJICgoKHgpICYgMHhmZjAwKSA+PiA4KSkKLSNk
ZWZpbmUgQlNXQVAzMih4KQkoKCgoeCkgJiAweDAwMDAwMGZmKSA8PCAyNCkgfCBcCisjZGVmaW5l
IF9fQlNXQVAzMih4KQkoKCgoeCkgJiAweDAwMDAwMGZmKSA8PCAyNCkgfCBcCiAJCQkgKCgoeCkg
JiAweDAwMDBmZjAwKSA8PCA4KSB8IFwKIAkJCSAoKCh4KSAmIDB4MDBmZjAwMDApID4+IDgpIHwg
XAogCQkJICgoKHgpICYgMHhmZjAwMDAwMCkgPj4gMjQpKQotI2RlZmluZSBCU1dBUDY0KHgpCSgo
KCh4KSAmIDB4MDAwMDAwMDAwMDAwMDBmZlVMTCkgPDwgNTYpIHwgXAorI2RlZmluZSBfX0JTV0FQ
NjQoeCkJKCgoKHgpICYgMHgwMDAwMDAwMDAwMDAwMGZmVUxMKSA8PCA1NikgfCBcCiAJCQkgKCgo
eCkgJiAweDAwMDAwMDAwMDAwMGZmMDBVTEwpIDw8IDQwKSB8IFwKIAkJCSAoKCh4KSAmIDB4MDAw
MDAwMDAwMGZmMDAwMFVMTCkgPDwgMjQpIHwgXAogCQkJICgoKHgpICYgMHgwMDAwMDAwMGZmMDAw
MDAwVUxMKSA8PCA4KSB8IFwKQEAgLTI5LDYgKzI5LDEwIEBACiAJCQkgKCgoeCkgJiAweDAwZmYw
MDAwMDAwMDAwMDBVTEwpID4+IDQwKSB8IFwKIAkJCSAoKCh4KSAmIDB4ZmYwMDAwMDAwMDAwMDAw
MFVMTCkgPj4gNTYpKQogCisjZGVmaW5lIEJTV0FQNjQoeCkgKHsgdWludDY0X3QgX3N2ID0gKHgp
OyBfX0JTV0FQNjQoX3N2KTsgfSkKKyNkZWZpbmUgQlNXQVAzMih4KSAoeyB1aW50MzJfdCBfc3Yg
PSAoeCk7IF9fQlNXQVAzMihfc3YpOyB9KQorI2RlZmluZSBCU1dBUDE2KHgpICh7IHVpbnQxNl90
IF9zdiA9ICh4KTsgX19CU1dBUDE2KF9zdik7IH0pCisKICNpZiBfX0JZVEVfT1JERVJfXyA9PSBf
X09SREVSX0xJVFRMRV9FTkRJQU5fXyAgLyogQ1BVKGxpdHRsZS1lbmRpYW4pICovCiAjZGVmaW5l
IGNwdV90b19iZTE2KHgpCQlfY29udl9jYXN0KHVpbnQxNl90LCBCU1dBUDE2KHgpKQogI2RlZmlu
ZSBjcHVfdG9fYmUzMih4KQkJX2NvbnZfY2FzdCh1aW50MzJfdCwgQlNXQVAzMih4KSkKLS0gCjIu
MzcuMi4zNTIuZzNjNDQ0Mzc2NDMKCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vb3BlbnNiaQo=
