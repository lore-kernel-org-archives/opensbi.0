Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9693C606A31C
	for <opensbi@archiver.kernel.org>; Wed, 28 Oct 2026 13:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SXnTfR1c;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Kv5swhxA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=upJHpYDBNFKwBQSfLDnvFl9o4s1YsU4rdoipYI2srSY=; b=SXnTfR1cy6A7G+glIVeiyzlmmT
	mrvxNATiovrMrsYzpYeOksJ42zgZbg8txZtKX3EVZzRZI0pK0lB+Mg/J5LF/mlWtOTx0mbA76r6sI
	SCYwPLeI7jbeb3lT/YTE+TYu821xJIShyMhgziWMm1Swo+aBYltiP1lxzS4KLT8cjJDUTTOSCq6vC
	Ql8wbiG+LOqIjB4ly7NfxWip50LmJgnLWVgJFCWnh8AG+5kcbcdx3aTz1PRsm0JXCmv8KVrnV/RiL
	vapYAuZASWN1w1tXZrqyZQf7esyFTB3+D3LdIVnnXlOjSvPIoLOPlW+rcNftzdUeLHa4fJOFBmfGK
	o99m5jvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM47I-000000078KE-3Nag;
	Wed, 28 Oct 2026 13:55:00 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM47F-000000078JB-1iaw
	for opensbi@lists.infradead.org;
	Wed, 28 Oct 2026 13:54:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793195664;
	bh=Rj/LNXRvR9BFWyEwvQWuGnfxpzwTjAbLBwQFCPAeiBc=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Kv5swhxA4mgamfS4xewmhUaI16LPLfgi6nN50NbJusETQPPl6i0H3XJVhM2onyIwY
	 CZjhd/JovZ5+1wXDZZiirgzG5wwtzgx94ooLZyWuo7A/NRcaQvPE1iMQV6WQcK+yCD
	 3SVyC/nuS3Z08dkQi+r0jmB2KlDb7KvEYWSHtohY=
X-QQ-mid: zesmtpgz3t1793195660t1578c063
X-QQ-Originating-IP: by92IRdNax/CB1M9KCil/ibpSaCz9+YM1HwijrgyFY8=
Received: from = ( [183.48.246.227])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 28 Oct 2026 21:54:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17387601454904259992
EX-QQ-RecipientCnt: 8
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 28 Oct 2026 21:43:32 +0800
Subject: [PATCH v6 3/6] platform: generic: spacemit: k1: move hart init to
 nascent hook
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261028-spacemit-k3-v6-3-01d984f60941@linux.spacemit.com>
References: <20261028-spacemit-k3-v6-0-01d984f60941@linux.spacemit.com>
In-Reply-To: <20261028-spacemit-k3-v6-0-01d984f60941@linux.spacemit.com>
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
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkP/1haFeUsd1jp88L4zEchZ6vVOwW7xXPcZgSrTml89
 yS7JqK9o5SFQYyLQVZMkaX7Ac+2Ap8o2wKBQl+YOaxMIEMYuDgFYCI3nzAy/H016wb3K7+y3/pe
 1yv/pDK/+anaq137tCJd4pLA7g8PlBj+R9+S4zuQ7ir7Lit0+tRVDS0+Xh+VTn1NqvILdfg5M86
 WAwA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MgenFrdum+vC9RlQnwaT3rjB3IkyVuUZCCV0z1NA6O8EgclrMpMPWTkd
	4sAjzFIvnBj3/dA9SWraXaONB/gWYC/YN181cdt6dOGnjcf65g1MN/d5JkGS6H9awaxa5jA
	pt6nqGQLzKcf+QMYO4ZE0C13deYn+FQR6++Xl/5ATY4QqYE2l29MA1k58ZvUhmvfWv65QQy
	cCz+H12SpxSUnn+rvCpcGa0udAuggozV9fwfdz/MF/BAoa/Lfehmqf3ebUwQ/Ooq9x05yQl
	OJeyE3Xsp9peSsQVoQDnrlNzAnqMZtaP8aSFOyPVxCq2NCh43EV3GbscvSm9UMuVo8xcMR+
	5widx3e3KdZ1yKWfZMOU1t+DAGUIiHt8/0phf+lJsclDcDbTOb+HHp/LHCFTJj5nYz5cvIB
	99QI47+rz7Ckd6CcAhk3qJCLvUcBqr+5lDdR26/gLssZj0gKNH1feACDA9d+seHXCg4876w
	GB5l20QndI/S+icVnHopnz1ZYA3S5+DSSL23HqCyvv2X6AatR5ahVcCoGau/60u6C1Hc/S9
	Flw8DtM+uldEXm9vBaumQX5EikKdFP2znAfHYXykGxYax71qz9r4TgeCJUgmt/ka76PPwO5
	JxVtTyt38ZkCHDqrDcOdnBL7TD8gAhdBI66WGA9FhXxUMPSUNACxiLHQI6ctc8zOu2CrDTL
	+C+Hd2LlMTpDWbE9BKP0PyQ46dqVfpiEhOg3vPmP6uKbDQnwb+NLXqQpGgzc5d65ZAXQgZO
	pCJcR8h4LVe17kRt4yh9T6auemDiVrRVEyoG6iSixNNsa7jn/RDwRFANwctFMhxaVirnSOI
	fuQsuAmjw+9fZYKJr7PWQaey4g6kV7MX5Yr5KTRfDjes+sqRuQftAegFh6pfmg4AMff9QD+
	oqX6et5IiyPtEMcO6lnkoEy+irpoY52qjWgmIrtiSa7E26INhb4/e+doiWCMMvu7Tqf2SsJ
	2zDT1bzNuyRaCOEUpTvt5J/5Iumo6rzynvJ2Wc02255Vk89hUsqs0oUzqGwQJXpRUAuZrZf
	GkSoVcXa84ptaXb1ox3c7T7wEFm4BhR5fngCLuGphB184xOTnKWNPjdTIH2mUQqVs4kYgux
	neoFh9d6lBtdFQIlM8OU0U9mq4WbEnyf1YKcFIPBZ/OAb5AyyziZznnPifKFL7hN3Gaw+ew
	xFLYiQls16gFYx0n14e4Xos020oM+BfVcAhG
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_065458_206614_9A449266 
X-CRM114-Status: UNSURE (   8.99  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
