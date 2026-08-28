Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E1AC61DCB
	for <opensbi@archiver.kernel.org>; Fri, 28 Aug 2026 14:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=870kJFHcabk2qvBrMG10wnxyMhe31y9FambihIP8OyQ=; b=Ir+xwn1A7LVqaT
	iNgEzedeyO08io0TTzFnII3ee3va+nyYER2go1IeqnrmFaPFCC/kOeK78pStQjM56hL4nT10wyQ7k
	lPH6Hx1/aubdPSuS+hmFAe8K56vFhXN0r6ZJTUM/dyAeg5dYmFto7mQGK0qJU3jT4ldnZEyN7b/Q4
	qowX6FvE35JS3AJhSqmlYvd8j8QYI1ydGzSpsgEXzuVz/NWrnZmIaVuxyneDawA27Qk3wDrfHZ7oT
	gHK+VyyUFSYaxd7kb10qQCNPlZo0hJj3XoQjeRqumauYxVVIDV9pukQ7KNwv0AT7qjqEzH8EY0nU6
	vPQSRiwZfH+VwyZpDdSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzxV1-00000005yQq-1p40;
	Fri, 28 Aug 2026 14:24:07 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzxUv-00000005yPJ-2N2k
	for opensbi@lists.infradead.org;
	Fri, 28 Aug 2026 14:24:04 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowAC3i+_8mZFq+WPABg--.52138S2;
	Fri, 28 Aug 2026 22:23:57 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anup Patel <anup.patel@oss.qualcomm.com>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Atish Patra <atishp@rivosinc.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Inochi Amaoto <inochiama@outlook.com>
Subject: [PATCH] lib: sbi: use unsigned masks for HPM counter 31
Date: Fri, 28 Aug 2026 22:22:30 +0800
Message-ID: <20260828142354.13035-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowAC3i+_8mZFq+WPABg--.52138S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tr1fAw1fWr4UKryUJr15CFg_yoW8AFW7pr
	15WF1DKw40vrs2ka45AwnIqa1rJa18GanrGr97J3yftr1SyFyrur43KrnxtF12qryDAFWU
	uayFyry093Z5uFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
	IxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUvXd8UUU
	UU=
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_072401_973515_B0D39CD8 
X-CRM114-Status: UNSURE (   8.96  )
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

The HPM feature detector and CSR emulator build mhpm_mask bits with a
plain signed 1. Both macro families expand through counter 31, so the
last expansion evaluates 1 << 31 and shifts a signed int into its sign
bit.

Use BIT() at both sites. The mask is unsigned and bit 31 is part of the
represented HPM counter set.

Fixes: c744ed77b18c ("lib: sbi_pmu: Enable noncontigous hpm event and counters")
Fixes: ee1f83ca848d ("lib: sbi_pmu: remove mhpm_count field in hart feature")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 lib/sbi/sbi_emulate_csr.c | 2 +-
 lib/sbi/sbi_hart.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_emulate_csr.c b/lib/sbi/sbi_emulate_csr.c
index c2253c82..5d3a6e9d 100644
--- a/lib/sbi/sbi_emulate_csr.c
+++ b/lib/sbi/sbi_emulate_csr.c
@@ -103,7 +103,7 @@ int sbi_emulate_csr_read(int csr_num, struct sbi_trap_regs *regs,
 
 #define switchcase_hpm(__uref, __mref, __csr)				\
 	case __csr:							\
-		if (sbi_hart_mhpm_mask(scratch) & (1 << (__csr - __uref)))\
+		if (sbi_hart_mhpm_mask(scratch) & BIT(__csr - __uref))	\
 			return SBI_ENOTSUPP;				\
 		if (!hpm_allowed(__csr - __uref, prev_mode, virt))	\
 			return SBI_ENOTSUPP;				\
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index bee88557..8e4c36d0 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -512,7 +512,7 @@ static int hart_detect_features(struct sbi_scratch *scratch, bool cold_boot)
 	if (!trap.cause) {						  \
 		csr_write_allowed(__csr, &trap, 1UL);			  \
 		if (!trap.cause && csr_swap(__csr, oldval) == 1UL) {	  \
-			(hfeatures->__mask) |= 1 << (__csr - CSR_MCYCLE); \
+			(hfeatures->__mask) |= BIT(__csr - CSR_MCYCLE);	  \
 		}							  \
 	}
 

base-commit: 4e79fd7de59f1b2899092c1a84ce68c8ebc68f93
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
