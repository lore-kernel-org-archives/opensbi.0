Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFBBC61DB9
	for <opensbi@archiver.kernel.org>; Thu, 27 Aug 2026 09:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uxqf4u9SwZt/Noaj0G5iVYGgAXAjPWGZYdNjl4E7JGw=; b=tc1LkKpji2BFtl
	nQiv6fKuVfe89Ex1wXf3ZF3f20xz5rE5x8uDoOsi9Lfd0MEJ3qv3BbWbz6KtcY40ifIgKRvPl7Ok1
	LiGJdqt+ClaEpy8oNHuXeF67DVTJQsXhEtB697dcqlDbzlnfswqxHmYhhXU6q73Y1YSDrPd1p/p2a
	Q0tEnxTsHBe793mPF59u3WkH+by+vNNvi4rFwezhAlHkaLtDuXyapn2LLfl7STOjcUlLaHOxXSRil
	tEZN5vRrzm9TD0j9agCf4OIl3hJLmumxt+7yOC/HbWWNAmHGAT6jXOC5/yY3egd7sVdJ3gf/wJMhi
	z1CLq9kn+y4kWZzR6Q/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWHo-00000003jHu-3dB6;
	Thu, 27 Aug 2026 09:20:40 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWHk-00000003j9t-033t
	for opensbi@lists.infradead.org;
	Thu, 27 Aug 2026 09:20:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1787822398;
	bh=gZhUlOtx+40vljDnWa3grPFjDvNRaXAjawL7GTfVGN8=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=rgjIn/I4WqXX4QV3Ok0L37FdE8OYyfJWUvnEG4feDjBJjf5uh+GQjBf6pq2gitGAg
	 qMUWipX/H36rjOhfElYzHMi0Kd3pLsoNYG3SBHsB07QWnfRx9t63v/5stHLbIcwdaq
	 ODgbZfniS3thpc914YpDQzY+nfXVnKSNQ1HSnaAw=
X-QQ-mid: zesmtpgz9t1787822393taf8334f5
X-QQ-Originating-IP: SRUSFoiranbySerlCjeYFxGpPXPpzOAzquFjTbaYNO0=
Received: from = ( [183.48.244.190])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Aug 2026 17:19:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18410997541741688107
EX-QQ-RecipientCnt: 7
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 27 Aug 2026 17:19:21 +0800
Subject: [PATCH v3 3/5] platform: generic: spacemit: k1: move hart init to
 nascent hook
MIME-Version: 1.0
Message-Id: <20260827-spacemit-k3-v3-3-5d8dbb68539d@linux.spacemit.com>
References: <20260827-spacemit-k3-v3-0-5d8dbb68539d@linux.spacemit.com>
In-Reply-To: <20260827-spacemit-k3-v3-0-5d8dbb68539d@linux.spacemit.com>
To: opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1889;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=bLvPHNeA9VO+U4Hb6Myt/OCxjtrEsU6YOtleOY/qizk=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkTGJXXPIxd8v7M9QlWd9s32b2fIS3Vt31aea8bv8X1J
 zx7todJdZSyMIhxMciKKbJ0P+DZVuATZVsgUOgLM4eVCWQIAxenAEzk0lZGhvaJHtq91npxs3R9
 3JPWzVsq87Ly99wJlztjNyibfvlSeIbhn4rz25dT4z4KLpn4Jnpa+9wP3P9zzrLn73hxMuxX2qW
 vtWwA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OEqAExJEtBsfXDgnyInLVNDM7+Pyx5rb0+MwDTMZQB82zslPfvP2s1i5
	0pfgRD1rpa9KaRxJiM63fsAlaJltoQSwZHHUpswKHHelWUdtgujjAPDqnTmJsf58f3vKS0l
	87XFHeAWnCGe2WrXewsbhUG8Wq7JAMAP4JIxYfQgh0R8Ms1VGhG1t0O5pacVeyKHn9VwoLp
	K8Hzh0vrD5278P3tsbfrvVeK5qYpc5J95+5RER1jvJRM8H2FUM2hkc/pQRRc0WmDzNSUrpy
	rKvaWZkq7OnL4aediyK7A91lwpmHZ5IDQr3vuT3w6Yt1fPZOhRYyiWCOhW2KGULY8a/uaAU
	Nrltiy/csnsQOlja8za9W4r6SAhTHTkzivnRok9LTNRp0hYp8qDKL5oZUn5Ck43T84qzYhb
	5mG/iHMcjP8s2j1XU8Vu3cz9aY3M4rM7E1wnpadaO/ohaWylcTWAxyVvZczeh0aorHl9Fgb
	HEQ1Ebp0NT0Fz0EP8B+Quzjvhou6k5dQKMUcIOuwLM8naozcQHJyDpf39BdsrWe2rR3G0B8
	EmM4pXyufSxLLrrj044sB4my+sosElRHuAL9naLnIguIB2pnYdV+tAem2ueAYSMVmDbf211
	pOSYO7rFS4ift9Bu7es6EE+wJ0AmGM1jlmuGqPX+blNInyoVgONWslFNXLstPcJa96Uql2K
	xAAg0dSWBYz4nWoEYKRzgzhlzAu6xKo8oExhrYm5G9YJ4V37i68xcM+maxdS1EjdRRGPowV
	HCS+xzAp0gMKW8RFCY5k3ybj2tT0eZ/CCeqmbOc0XgLngN7Das0ELQYecmBhkE5PkQrAqwW
	RawRs1lOLoUvoHVngYFHIi+u8A+h3Bb1RmM/PwfI8zhkJBORm2g3JTsOzoZC6FydEmMAdvA
	MMsTKe189J8IP4nsVAof8c3Pz8vpU0N81Qd20ptV2PcwKTC7g42AB7IGUhO+C0IZ7h9gfCd
	ADMZRxaHzo53AL7k30HFTd7De6i2yoAq2dgQxuFV17qdPuGrUU2V8clGE6SEMGqhGBcsRhV
	CBxogIJiNLh/BH/oRuMH2n/TXOD0yGn/z0qaQVaMnlse6pWSr6sFEE56j1i4Mi3lSyBlgpZ
	XkknoZ8Ubhm/6PGRiI4btecjeP8vnJA2gO6XLwX5KLJ
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_022036_605609_7C8774FE 
X-CRM114-Status: UNSURE (   9.14  )
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

cold_boot_allowed() is a policy query and should not modify per-hart
state. The K1 callback currently programs ML2SETUP as a side effect.

Move the ML2SETUP programming to nascent_init(), which runs on every
hart before common initialization. Chain generic_nascent_init() to keep
the generic per-hart setup intact.

Fixes: 1f84ec2ac22e ("platform: generic: spacemit: add K1")
Reported-by: Bo Gan <ganboing@gmail.com>
Link: https://lore.kernel.org/r/56220293-88e3-451f-833e-8251656a83d9@gmail.com
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Reviewed-by: Bo Gan <ganboing@gmail.com>
---
 platform/generic/spacemit/k1.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/platform/generic/spacemit/k1.c b/platform/generic/spacemit/k1.c
index 7ee5f17a..19a9b27c 100644
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
+		1 << (current_hartid() % PLATFORM_MAX_CPUS_PER_CLUSTER));
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
