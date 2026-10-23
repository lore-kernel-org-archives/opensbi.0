Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD41606A319
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 03:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2Gqv35FJ;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=q7po1iZy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=upJHpYDBNFKwBQSfLDnvFl9o4s1YsU4rdoipYI2srSY=; b=2Gqv35FJ70zNdtkFXsvvX55LMA
	mOOQTWB3Gh/z5OBk3Uql1nl6d8yg8uI7FPjAgQaMFuooiy/8RLs7O9hzw+CYLxZSszEs7HHLvgTF3
	DWcei4e5RBc46WLOKk+HAAv6tGUfsViErV5teDQqFjkgJM+qLBO8GOhv9Y2yJ3zzY/jfkGEEt9xsO
	ph3aFm6ZVxfDl9EzCwxpRo/p+J0AqGp1l1LlYQhA20A59MytFlVUERUzl5ia4Pw5zsiO++nGTKeI3
	2RnHosFXfPjwoi44pVja24qwz3ukISQ/QLKt9kv9p/hFpcLU5wgBhGmPTd6WZ/Fkoi8rn2wRr3Tln
	GEJbxW1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK6En-0000000FRmt-2D7k;
	Fri, 23 Oct 2026 03:46:37 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK6Ek-0000000FRl9-2TjC
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 03:46:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792727111;
	bh=Rj/LNXRvR9BFWyEwvQWuGnfxpzwTjAbLBwQFCPAeiBc=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=q7po1iZyhN32wkea0CvkHz0TBy0S6/fVc7Bj2gRSgtsrFcMpGxeIMNBciIhlmcW+G
	 K52/js/urjo/bYzUyDlE6hAIqLprsn8mWrgsVmllCurR8CnramBP+dg/85nA+3uHP3
	 lAnG9BMc+Xo6gt9uJ4g+Jdpu1X4wZhV2itF135zI=
X-QQ-mid: zesmtpgz6t1792727106t2c81dd92
X-QQ-Originating-IP: 0nqUcn5hgjTOhRRACrBS1/5g+xQR3o4xf0tE336rTyY=
Received: from = ( [183.48.246.89])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:45:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15374963336377134550
EX-QQ-RecipientCnt: 8
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 23 Oct 2026 11:44:43 +0800
Subject: [PATCH v5 3/6] platform: generic: spacemit: k1: move hart init to
 nascent hook
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261023-spacemit-k3-v5-3-c5ddfc72caa4@linux.spacemit.com>
References: <20261023-spacemit-k3-v5-0-c5ddfc72caa4@linux.spacemit.com>
In-Reply-To: <20261023-spacemit-k3-v5-0-c5ddfc72caa4@linux.spacemit.com>
To: opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1887;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=1aIJY7Hi5Yu17nUyjuvaOV8vm0u8oCXZh9QpLBncE44=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFm3bugJCwX4Fipq88Zcejrhf82D8Jfbol5oRi7mc+g/b
 Lu1s7i6o5SFQYyLQVZMkaX7Ac+2Ap8o2wKBQl+YOaxMIEMYuDgFYCLMfIwMy5Om7Dy8bFPNnCNv
 +T5MbN7x5+bHu5cvbHS/veDZ/isH2/8y/K+xszdvPucb4zXj9rrCjSeDl4mxO39injij7Hxlpfd
 pBx4A
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mwd3O3Pa/wOLmtY081y9vGI71cOVtaWj2x6XwwYbhjvm0c7Fq96CfiIK
	/mXEjPbH2qJxYzjXVf+ljx/voqHGTnJSWp4Mj/eNFO0khvAMvf1SC1ZvXzOCHN+KFMVySMO
	7YJXPgqrAPnMb2Jaxd2q8cAfTUC483FFNzunaxtyvEW0TjXTByZUB0pOvX3wguRcRUM62Gh
	dsz9n2JQDmQALdaQ8gsbx5ebvX+qTTI2WgqwbB2eV79lLIGnl1ebBmE9EyAgBNJ2mG2GXSK
	96Pvhf4D8A4U3lY7ex5VDgJD98DR63IH7+L27FlTZaDbHNMxKf5HgFNIE19b98Zyb6HF40z
	mK9+6GraFhkrufO/Y+8E9nN1MFyOCuXl1geyMM7P0JfC361rxhsMzXVcWuRyxjXoqNsgRxE
	HXQoIobm9YEt4YifIFldj6vTrX8UCVplr4WGDgQQqh4OtQXN4SOkLgm4WE2rDjkDjlrLC8D
	bfj1it391f6lOPoBdCbO+r4yyKMaTSmVjRQyPMY5QasASeQQjTOdhS2OtGeSz3Eamyat0BK
	2Mubbz7y3SngoZgS3QIffV2JZlA6/U8RLjOqfhrOHSjg3TPa5E2Jo1P3nEMJz1/oeA9eQfB
	h8hNzMWbw3pxHPfxaIcGNgD2DxDQoaONagONDBdgF2hAOcGmZSJLb1x29KUXAlhWRIbFwS5
	g3AQGmWEVyzY97oafgposQ5l77GfmqqIMoBq4n/fuwWYCp6jIAH/BHm+3W7VlWvX0e7l+rp
	im/rSk+Fg1+9TiLjfCnzHg7qhuvfwtU6i6neiTPS2OXglfUEN9PeqVNi5SOsAbbZ36oemPA
	uFZ0C/sML3tN4RwGPbo0BUYzX7Ki/9hTa4uWBhe/MENlsiwltvsmsaBu9QV7XXflVY4/LKp
	ZcAnKMWOT1JIuxkj6XSmjTXQLtmyG2VSGqCV6Z6jo0X2OTPPo6/C91ZQbHBBoKi+XihDAH5
	oUF8jCYQeKUYgxoisofNBaO/BOF71+MY9qLogrwntNvydtzfyBCwSJUaCPxBFuIcJbR5euf
	VG66CDPEjD5NlNMuOZ6KLDBlWkc8fY0I2MutYz4c8fhgTerKmefWk3uhMVKmElKaVvvLdaf
	Kz4PBl/hcFsAa1dFi+oltnLi5jUYhZIIX+aN4f3d37UHN6W95p0tBmcjoAs008kcgXe/LDP
	y6EFWqnux2BGS97lsyqxDvK5BV5rk0Vx9CxGhCjk5eL629oQaYavZ8U4Zb8j/GMnqhmo
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-SPAM: true
X-QQ-RECHKSPAM: 3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_204634_948497_F91E2371 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

cold_boot_allowed() is a policy query and should not modify per-hart
state. The K1 callback currently programs ML2SETUP as a side effect.

Move the ML2SETUP programming to nascent_init(), which runs on every
hart before common initialization. Chain generic_nascent_init() to keep
the generic per-hart setup intact.

Fixes: 1f84ec2ac22e ("platform: generic: spacemit: add K1")
Reported-by: Bo Gan <ganboing@gmail.com>
Link: https://lore.kernel.org/r/56220293-88e3-451f-833e-8251656a83d9@gmail.com
Reviewed-by: Bo Gan <ganboing@gmail.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 platform/generic/spacemit/k1.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/platform/generic/spacemit/k1.c b/platform/generic/spacemit/k1.c
index 7ee5f17a..5e699f8e 100644
--- a/platform/generic/spacemit/k1.c
+++ b/platform/generic/spacemit/k1.c
@@ -8,6 +8,7 @@
  */
 
 #include <platform_override.h>
+#include <sbi/riscv_asm.h>
 #include <sbi/riscv_io.h>
 #include <sbi/sbi_hsm.h>
 #include <spacemit/k1.h>
@@ -86,16 +87,23 @@ static int spacemit_k1_early_init(bool cold_boot)
 	return 0;
 }
 
-static bool spacemit_cold_boot_allowed(u32 hartid)
+static int spacemit_k1_nascent_init(void)
 {
-	csr_set(CSR_ML2SETUP, 1 << (hartid % PLATFORM_MAX_CPUS_PER_CLUSTER));
+	csr_set(CSR_ML2SETUP,
+		BIT(current_hartid() % PLATFORM_MAX_CPUS_PER_CLUSTER));
+
+	return generic_nascent_init();
+}
 
+static bool spacemit_cold_boot_allowed(u32 hartid)
+{
 	return !hartid;
 }
 
 static int spacemit_k1_platform_init(const void *fdt, int nodeoff,
 				     const struct fdt_match *match)
 {
+	generic_platform_ops.nascent_init = spacemit_k1_nascent_init;
 	generic_platform_ops.early_init = spacemit_k1_early_init;
 	generic_platform_ops.cold_boot_allowed = spacemit_cold_boot_allowed;
 

-- 
2.55.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
