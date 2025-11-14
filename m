Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32245CEACDB
	for <opensbi@archiver.kernel.org>; Fri, 14 Nov 2025 20:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rcHR7cFA1rB9RHQFCK8Bhqu+6XyDQoqHhrsoB7w9zIE=; b=DJ7m5C58qKvAkC
	aKc0B4YMZnxfQpRIHZVx08y1G8eiTaNO8Y4eHT7BYXWVhgy2bZI3H7616xDXO7ogtfCvMvL+cZCcO
	bauV8sygeh6tDeOmaqkrx4Fj9CAxkYKqZPOrA+NzRcJCwVqrnfDiEWlWBPT7oN3yaznzqLdIOckIS
	oXiwH8inhe1pmLLdqxyK1c+zFY2mp5Zymr9PGR5ne2Ljh/QSa4FDMWtqTRxfNdm792UuNVuanohmb
	crSEZ51h8f2LrrSInQC5pHz28ZylFWxqbszIxivkVl/UMd6EYcv3ue0vAeFu+Zr0DWMjN+Ryvk4Nv
	HrPqifPpgSS00vx9d1ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK0ZT-0000000D5kB-387Q;
	Fri, 14 Nov 2025 20:39:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK0ZS-0000000D5hz-1m92
	for opensbi@bombadil.infradead.org;
	Fri, 14 Nov 2025 20:39:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=/LJwwyX/qb000cE1drq6xjjWsLm7rDtHhZIQQjrLslQ=; b=p0ZR15FNGVhNSPFGN4z2PgcRNc
	TpkSGtM53zcT5Jn5gqn7aeFAswl5HZ0m3YnLmfs9c0Yrsu/o1sJA5Wit0GVPS9hEcIfYMgmp0M7UD
	JQmQCxIcyv+odEBEQGge96kYFy084tYxSe11IO8JQcHqpSst+8D9qk0qAc3P18bIK9zjaeQxukiBA
	pJqoUQZr1FW+nlAbtuM1Zhrp3ONUxk6a7pCy6Ws/8f+djNmQebWKtX5M9OQHtoZXWUpclgHa1pZQP
	rDi5hL2fJtWzrMAln44yGs7kqKx9klfXwXMt69BBRrkE2ThKMd7YZ+2VX6upPUs7hGtsqlx9h9LXT
	Hlc5bsEg==;
Received: from mout.gmx.net ([212.227.15.19])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJzhk-00000003TzR-3vTf
	for opensbi@lists.infradead.org;
	Fri, 14 Nov 2025 19:43:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1763152737; x=1763757537; i=b.freisen@gmx.net;
	bh=/LJwwyX/qb000cE1drq6xjjWsLm7rDtHhZIQQjrLslQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=H8TL+NRPVELJwXZYEneEFZ8eXb1blkkqvxllWhbrjpDRYXTUyVPj2HvkeUsZheAU
	 zke9EnPn9co5Szqa7sSEusZ4MuAslHMU+h7a6PMC9xrFw2Fb6HVJCyNEtVfua/30L
	 QNZAQBjwVBraWYujKZruqUi96+Ibjev3F6oTG6Ou6B6MkSKOOC9JP8RsMgPhIex48
	 Eslp9AOoN6o5EpgAqIbXNz9A+YSKFUS2jjQ7tsOWY/zv15JVuxSW+ZgOHnw2QiUL6
	 QiqjRFYpjOIg3TNaPMx8fCcJktUC1leMYACaTGU2atK0To7k+y+UhWO11T0FMKiIH
	 eqbn6EiYfYYjHVZXFA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from blackbox ([95.223.79.138]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mqs4Z-1vxD4C1U13-00hstu; Fri, 14
 Nov 2025 21:38:57 +0100
From: Benedikt Freisen <b.freisen@gmx.net>
To: opensbi@lists.infradead.org
Cc: Benedikt Freisen <b.freisen@gmx.net>
Subject: [PATCH v2 4/7] include: sbi: Ignore rs1 and rd fields in FENCE.TSO.
Date: Fri, 14 Nov 2025 21:38:39 +0100
Message-ID: <20251114203842.13396-5-b.freisen@gmx.net>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114203842.13396-1-b.freisen@gmx.net>
References: <20251114203842.13396-1-b.freisen@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1://ko5wLvJiKlrhcoQdCF33eMcU5UGwDzJKLHMeZDlIIKd0wKKla
 FNEMINwRO0GmlRiOHhzC1v6KT0JfbZS7AmC6/0wZOngVG3S6oieqmToxjviakQuhqcLEKS9
 pZz1dUiMu1JJUNJDkoqNKlZZ09++zRCURJ/AA6iMYBqebsPnndYPFsv2OKbT82fCAPyOhbh
 3kj2weimCYMCCQDeHz5UA==
UI-OutboundReport: notjunk:1;M01:P0:nRP5GqTRonw=;oKmB0A0nE6TDrZGXI3uFPaaw2Zv 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 /LdHrcnUJ5cCg4Rtte+oqu8cY8AUJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_194333_091338_F8C9DAA9 
X-CRM114-Status: UNSURE (   8.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

While FENCE.TSO is only specified with them set to zero, it is a special
case of FENCE, which needs to ignore these otherwise reserved fields, but
in some implementations, namely XuanTie C906 and C910, apparently does not.
See the RISCVuzz paper by Thomas et al. for details.

Signed-off-by: Benedikt Freisen <b.freisen@gmx.net>
---
 include/sbi/riscv_encoding.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 92cbc27..2970ba0 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -944,7 +944,7 @@
 #define INSN_MASK_WFI			0xffffff00
 #define INSN_MATCH_WFI			0x10500000
 
-#define INSN_MASK_FENCE_TSO		0xffffffff
+#define INSN_MASK_FENCE_TSO		0xfff0707f
 #define INSN_MATCH_FENCE_TSO		0x8330000f
 
 #define INSN_MASK_VECTOR_UNIT_STRIDE		0xfdf0707f
-- 
2.51.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
