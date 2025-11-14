Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E971DCEACDA
	for <opensbi@archiver.kernel.org>; Fri, 14 Nov 2025 20:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kYZ1HWPhoo00IO7zov/wdWv7POZQp8jUB+mbtmVjYFc=; b=btJEK7RoszbIXb
	Ea8aZ2lG9zl0tyr+thkeI6mcAK+q+5jJa1CZJL9ZUHsZaRIb9n5zXOnslAqkSH9Hto6bQ9KDcjm0u
	UG9ItiIqn+ACY8hcyEbaVPLn91p8S2bj4ADAMTvgYwxI8lORymdy06ib6W8UaXpYq1xsjYjU+sv58
	V/SsFwm70NYWN7fcg8Uv6WnYPaqbd4BlOjWYNw56vLyd4aupU5AT7yHqPs9hVoWDZt7PCUkmZmDam
	wrRRlt4SX1R/rityUpT9rADsFVWbuKGHV/gVEi4YrQ7mBT6Aia+3721e2S3JbfL+utNzdKDU5xnoN
	Os3WxFWE4t2eq1hZPHjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK0ZP-0000000D5gl-2B2Y;
	Fri, 14 Nov 2025 20:38:59 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK0ZM-0000000D5el-3hBF
	for opensbi@lists.infradead.org;
	Fri, 14 Nov 2025 20:38:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1763152733; x=1763757533; i=b.freisen@gmx.net;
	bh=kuLz9HXzP6j5dCQD2KD59NFyHNEHYkU6vwh3I1b76Q0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=n4PDQBgA0JHekO5k6ekGwVm+3uB8YB5FLzpBjBHspvemO1iI96EO2ITCY0W3eWYh
	 atXa7EOD6JG0Uga5XXhB6f43RhIdHR0ZFPB9zGjHZ1GI9fStX3N2WdRWrmc86eMqX
	 1kVJWIO3/8p9T5OCb0BcHgmnrmqGhS+rAdKGfv+UBbODdMn1ikfOes58L4aPPFAYB
	 Mpo5c6CFM1gR+Rb4Diso/tPr+pG6QXQrI0Z47bLsiGQNufr2cjLYYvChP7/sJZueK
	 XphaSCFY7U1CFMmSJ8HbIEMY6BC3TgyvYWSPiQKFfjzhH3vlFNKrmkNuYNx0wUGkW
	 S6FfVkktL4qQbcS9rw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from blackbox ([95.223.79.138]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNswE-1vZT0v0ulM-00WZM3; Fri, 14
 Nov 2025 21:38:53 +0100
From: Benedikt Freisen <b.freisen@gmx.net>
To: opensbi@lists.infradead.org
Cc: Benedikt Freisen <b.freisen@gmx.net>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: [PATCH v2 1/7] include: sbi: Make "s8" actually signed.
Date: Fri, 14 Nov 2025 21:38:36 +0100
Message-ID: <20251114203842.13396-2-b.freisen@gmx.net>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114203842.13396-1-b.freisen@gmx.net>
References: <20251114203842.13396-1-b.freisen@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:9y2UXbq4XGiW/rF+1oA0GvVlfFEgrpy0fifPN5VRURuc9Uvsdfk
 rEWS9nNAba5lET5pYRZm8xHkdTzqmpadpmsv9siA+XuLwpNK8Dz1ZheJpy2hIYow/mewGZY
 kJEPqbuQKCN9atLpbPK/UH5vpmeuvYjPPdCxmIXMhyHSYUTQbyyysrINqgDCu3sjO6bRD2g
 6KhLkzoLKzIGT8eXfex9g==
UI-OutboundReport: notjunk:1;M01:P0:oo6b7oWOBss=;Vag7ZQinhUEa92V8B11p1GHMtvP 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 fNmuJC/N67j7it+H4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_123857_199183_08ED29D6 
X-CRM114-Status: UNSURE (   8.11  )
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

U2luY2UgcGxhaW4gImNoYXIiIGlzIGltcGxpY2l0bHkgdW5zaWduZWQgb24gUklTQy1WLCAiczgi
IHNob3VsZCBiZSBhbiBhbGlhcyBmb3IgInNpZ25lZCBjaGFyIi4KClNpZ25lZC1vZmYtYnk6IEJl
bmVkaWt0IEZyZWlzZW4gPGIuZnJlaXNlbkBnbXgubmV0PgpSZXZpZXdlZC1ieTogUmFkaW0gS3LE
jW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+Ci0tLQogaW5jbHVkZS9zYmkvc2JpX3R5
cGVzLmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9zYmlfdHlwZXMuaCBiL2luY2x1ZGUvc2JpL3Ni
aV90eXBlcy5oCmluZGV4IDI2MzdmYWYuLmI4YTdlNmMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvc2Jp
L3NiaV90eXBlcy5oCisrKyBiL2luY2x1ZGUvc2JpL3NiaV90eXBlcy5oCkBAIC0xNCw3ICsxNCw3
IEBACiAKIC8qIGNsYW5nLWZvcm1hdCBvZmYgKi8KIAotdHlwZWRlZiBjaGFyCQkJczg7Cit0eXBl
ZGVmIHNpZ25lZCBjaGFyCQlzODsKIHR5cGVkZWYgdW5zaWduZWQgY2hhcgkJdTg7CiB0eXBlZGVm
IHVuc2lnbmVkIGNoYXIJCXVpbnQ4X3Q7CiAKLS0gCjIuNTEuMQoKCi0tIApvcGVuc2JpIG1haWxp
bmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
