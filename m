Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF08CCFA05
	for <opensbi@archiver.kernel.org>; Fri,  7 Nov 2025 10:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDaHoGvqSKAd+/0D0sJb0E5e1E9F4JERTuugPpm/BIo=; b=Z3tQ2Qtwhtnc4n
	r0mwnx1TLSx/A75SmLCB6UFKVRo62ZxXGqWp+TuQdaQYuyG3YwS0EvxbTsQvDIdm9qyD24VqRQX/H
	TRvNBFAL3NFlCYeQmZ0AQJv7jgSxZM5+E4ExeE1EDOT7HOcq+c+cu2OZkpTslGeLtBbwB3TO7mNhh
	9zT7mgfAiB/gBgIHJNALvS5cGxN1DeUPZsxNyI8S5+MZ4hWAsRAjQN5+o9NeD4wMnGML24HDMMQB/
	j/fVETbrjyTwjm1BH9Vnh6Dy+xcobZYXTIWZfvisKVwN1ySPm/Rjvc4xxe1qsa35pSFNN9W8WS697
	YlDtHWINSi8BSEI0XWfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHK04-0000000H8JD-0grJ;
	Fri, 07 Nov 2025 10:47:24 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJzz-0000000H8Ht-3DPi
	for opensbi@lists.infradead.org;
	Fri, 07 Nov 2025 10:47:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1719B1A191B;
	Fri,  7 Nov 2025 10:47:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E1E27606A6;
	Fri,  7 Nov 2025 10:47:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F600118522AB;
	Fri,  7 Nov 2025 11:47:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762512435; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OhaIsDIxRUCmLaB7igwelEGVD9GaWD6Z6P3WJqvkDIE=;
	b=RL6Ticu3NAax6KXcIUO50Cd6/Ge7CnZaqDJ93A+WABQugsemz0oD+Lb05Dzk8lLf7tJm6O
	JEUmD4nr1gNumZ2fwBvWm75CV8/T/fgnL3/yB0FL85lilkwiubsBaAuSYHpQ/ppshypBbq
	+DEEPCOcvuXpRyyJ6nd6A21ZhZoy1Ww6ILpX0IWNG97xlx17w+vgbJb61pHdgkedFE7mw0
	uyRrfAz09vT3S5KAJEdxzKva4PjAzxBHRkbpfw5rJRgrphOXEFLIUeueOzg+E8mJSKNBh+
	1N6TWYI1SGfLz0Wci+zgCmQsZxUcZk7RsnQA5cJRv6UlBkHbyqNuZ0eVImKJRQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 07 Nov 2025 11:46:58 +0100
Subject: [PATCH v3 2/2] lib: utils/timer: mtimer: add MIPS P8700 compatible
MIME-Version: 1.0
Message-Id: <20251107-p8700-aclint-v3-2-93eabb17d54e@bootlin.com>
References: <20251107-p8700-aclint-v3-0-93eabb17d54e@bootlin.com>
In-Reply-To: <20251107-p8700-aclint-v3-0-93eabb17d54e@bootlin.com>
To: opensbi@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_024719_940290_B27CFC8B 
X-CRM114-Status: UNSURE (   7.82  )
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

VGhlIE1USU1FUiBvZiB0aGUgTUlQUyBQODcwMCBpcyBjb21wbGlhbnQgd2l0aCB0aGUgQUNMSU5U
IHNwZWNpZmljYXRpb24sCnNvIGFkZCBhIGNvbXBhdGlibGUgc3RyaW5nIGZvciBpdC4KClNpZ25l
ZC1vZmYtYnk6IEJlbm/DrnQgTW9uaW4gPGJlbm9pdC5tb25pbkBib290bGluLmNvbT4KLS0tCiBs
aWIvdXRpbHMvdGltZXIvZmR0X3RpbWVyX210aW1lci5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9saWIvdXRpbHMvdGltZXIvZmR0X3RpbWVyX210
aW1lci5jIGIvbGliL3V0aWxzL3RpbWVyL2ZkdF90aW1lcl9tdGltZXIuYwppbmRleCAxZjI5ZjNh
Mi4uZDU1MjBmYWQgMTAwNjQ0Ci0tLSBhL2xpYi91dGlscy90aW1lci9mZHRfdGltZXJfbXRpbWVy
LmMKKysrIGIvbGliL3V0aWxzL3RpbWVyL2ZkdF90aW1lcl9tdGltZXIuYwpAQCAtMTU3LDYgKzE1
Nyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdGltZXJfbXRpbWVyX3F1aXJrcyB0aGVhZF9hY2xp
bnRfcXVpcmtzID0gewogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBmZHRfbWF0Y2ggdGltZXJf
bXRpbWVyX21hdGNoW10gPSB7CisJeyAuY29tcGF0aWJsZSA9ICJtaXBzLHA4NzAwLWFjbGludC1t
dGltZXIiIH0sCiAJeyAuY29tcGF0aWJsZSA9ICJyaXNjdixjbGludDAiLCAuZGF0YSA9ICZzaWZp
dmVfY2xpbnRfcXVpcmtzIH0sCiAJeyAuY29tcGF0aWJsZSA9ICJzaWZpdmUsY2xpbnQwIiwgLmRh
dGEgPSAmc2lmaXZlX2NsaW50X3F1aXJrcyB9LAogCXsgLmNvbXBhdGlibGUgPSAic2lmaXZlLGNs
aW50MiIsIC5kYXRhID0gJnNpZml2ZV9jbGludF9xdWlya3MgfSwKCi0tIAoyLjUxLjEKCgotLSAK
b3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
