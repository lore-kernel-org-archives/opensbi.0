Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5010C71143
	for <opensbi@archiver.kernel.org>; Wed, 11 Jun 2025 15:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kdzRDm8QoMnA5oCgrqMBrGDVsioUxV3IB7pxN+CsVM8=; b=UxycTlXIghtHps
	QhejrFWgn61R/nUmonz8BZvXsqCWBO2SdS4LjTwCLpKzCc2m3rGv1KuBCLtz53QVm58wYE1sC4lz5
	MOnlO6m5s4KzzMwqeAIY/fiwxBfl/iY3QgHSQYIyCB1TerdSM4huJnTgkh+cPYjSqgdox70D5M4+9
	8k16tUuQ0eGjrITlI0GFdzyRXujesfePfpsFTrz3DeCEbuVjHi0KgiRCPu8tdsifPiyMWMijVr4X2
	XQq2ZkWzLaKMyx62RseZZ9XNgQKC6GZk7xer13rBopbJw87YRhf08qbb+wE31DEjFKwFgDnKrurmU
	jPK9O7PDPdwdOG3j4G0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNL8-0000000ANoN-3UK5;
	Wed, 11 Jun 2025 15:26:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKKK-00000009p31-41i3
	for opensbi@bombadil.infradead.org;
	Wed, 11 Jun 2025 12:13:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=230KqmyMERgHjjyOWdRTs49Ygj3E6E6Cfj3EDvxnb4c=; b=lS+HqcNh/C4m0i8fz5lOahzW5D
	laSYAGlBLKDIFhx1/iYjLkVG62dll0FmQFXllX+IIxSbbkAV85b5++uNIpJ+Hs/zdOdeYqF+4znUL
	/rJhbQJosjFJBr7fjZGHpPshUvZ7JKnmeXe6S5s0//DfMYzGgWaAqH/ZwB4Uid3ggF4zbbH5QQxGE
	A/4uKpcRaLI2vDhlffWQ7s7AiQ5Hnib0GinVbw3mWn+CTBQSyYH4Fybbnjeg3aYoQVH0/R+cTb7CZ
	wjA89pdvgA1vqURuBsKBJV8lKqnRyfQeqLnr6mJ3G4PZxiEavttH0XWzWG43dIgrgwKW+eSPbRlZr
	tR+7H3hQ==;
Received: from m16.mail.126.com ([220.197.31.6])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKKI-00000002Nec-2vxS
	for opensbi@lists.infradead.org;
	Wed, 11 Jun 2025 12:13:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=23
	0KqmyMERgHjjyOWdRTs49Ygj3E6E6Cfj3EDvxnb4c=; b=MExGtDZ7anPnBErDgh
	hAhqbGZ1ERf4dHxL2xqH2bg/kduFTsBh0vQMRnG29+5oWNFVvS4I+1HcJf2oKX9W
	qIHoeQoYonMjlRP59OMQuUGzioRBi3PnwdD/Yj29akFElVFtvxUynKi3M7GX/4S6
	mQpR5SvE1gsURVyrJOYofzALE=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDHn7e3ckloWd4vAA--.63780S8;
	Wed, 11 Jun 2025 20:12:42 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH 06/12] lib/utils: Make fdt_parse_isa_extensions reentrant
Date: Wed, 11 Jun 2025 20:12:23 +0800
Message-ID: <20250611121236.937455-7-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250611121236.937455-1-wxjstz@126.com>
References: <20250611121236.937455-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDHn7e3ckloWd4vAA--.63780S8
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw4UZr4rAF15GF17uFWrGrg_yoW8GF4rp3
	WkKF45Kr4xtFyrWa9FgrWvqr4xAwsFgrsrGrZ3tw15JF98ArnxX392kF129w1UJa4Fv3Zx
	Z39Ygr9ruFZ8XaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piI38OUUUUU=
X-Originating-IP: [153.35.240.84]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi5AppOmhJaY15yQAAsI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_131307_223043_2A43B31E 
X-CRM114-Status: UNSURE (   6.84  )
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

The fdt_parse_isa_extensions function accesses a static variable,
fdt_isa_bitmap_offset, which has reentry issues when concurrent on
multiple cores. This patch fixes this issue.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/utils/fdt/fdt_helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index b2d91fdf..a8320205 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -325,6 +325,8 @@ int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq)
 #define RISCV_ISA_EXT_NAME_LEN_MAX	32
 
 static unsigned long fdt_isa_bitmap_offset;
+static spinlock_t fdt_isa_bitmap_offset_lock = SPIN_LOCK_INITIALIZER;
+
 
 static int fdt_parse_isa_one_hart(const char *isa, unsigned long *extensions)
 {
@@ -461,6 +463,7 @@ int fdt_parse_isa_extensions(const void *fdt, unsigned int hartid,
 	unsigned long *hart_exts;
 	struct sbi_scratch *scratch;
 
+	spin_lock(&fdt_isa_bitmap_offset_lock);
 	if (!fdt_isa_bitmap_offset) {
 		fdt_isa_bitmap_offset = sbi_scratch_alloc_offset(
 					sizeof(*hart_exts) *
@@ -472,6 +475,7 @@ int fdt_parse_isa_extensions(const void *fdt, unsigned int hartid,
 		if (rc)
 			return rc;
 	}
+	spin_unlock(&fdt_isa_bitmap_offset_lock);
 
 	scratch = sbi_hartid_to_scratch(hartid);
 	if (!scratch)
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
