Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309F1C79F82
	for <opensbi@archiver.kernel.org>; Tue,  8 Sep 2026 13:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B4kjXpAm7Wa6uukh579XoHfdNk8z2tq789Y2AnlR+SU=; b=kJ5cHtUS2PUumC
	bEC+2Y9i6+kp0ckZqLoi2cmdt1XzsvBwhLBtCBX01hLFDkohs3NTnil6nnzp/pFM6EG+Ot4i0r/dc
	gyDocIBC0HlRxSmJm9ZcCvZQSM/tJGHFddh2WEQ/vh6bfZLHQfH+zkC6I209JEtjexyDdDtPshfUn
	B0AaHNnlCbIZ/PboIvOmLJgHlb3fKisk7a3hw1lytKSV2MvMqNQ/gqeyMZd1in51csc7V4V9N5FAz
	dRXRftZTHLFrgx9TYCFl5h0EqakgL8VdCRRn7stLFEcHpV7HLAmdTj9fD+cHqwwfKBUItRkA39juA
	DElIGV9PpGRj7PEwlTig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vRX-000000095DC-0S7m;
	Tue, 08 Sep 2026 13:00:55 +0000
Received: from out-187.mta1.migadu.com ([2001:41d0:203:375::bb] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vRT-000000095CF-2fAX
	for opensbi@lists.infradead.org;
	Tue, 08 Sep 2026 13:00:53 +0000
X-Envelope-To: opensbi@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=9oo2dBjutCjtzVUywU+aLYNFSs71WJXXRWxyzq33mLM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788872447; v=1; x=1789477247;
 b=RqmDWMxyNtfFYQq/JOEcf3zgwzD/JC2ftgXKQ7qR/OnNU6nF35gxoTj8ZqglpByCUjKJ8vAa
 yKPSdet5mPTNy6s8bLDUk9GRhb2qL/y7ZkuXUkHZGXSanzJ6xJbJMAXhKbLbjvmRIybYvghRAgp
 FEQ9+Cn6cvuKCrbBLTTSjsyg=
X-Envelope-To: opensbi@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id 7e79054b0c62e008;
	Tue, 08 Sep 2026 13:00:47 +0000
X-Mizu-Trace-ID: 7e79054b0c62e008
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Tue, 08 Sep 2026 21:00:36 +0800
Subject: [PATCH] lib: sbi: Clear all IPI devices when processing an IPI
MIME-Version: 1.0
Message-Id: <20260908-ipi-clear-all-v1-1-b1bd5d016eb6@linux.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrE1SvylXEYuqwUiDtIikcXfF8
 lu858GRZXJQRx4snex4XQKSOAI9qWUk5D4YUpGWohISeWPUhpRFZQwWuc56GmRRygpCs1ka+Pp
 +TfvbHd1Men8ncN8PS8G21nEAAAA=
X-Change-ID: 20260908-ipi-clear-all-54c3def85689
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>, Nick Hu <nick.hu@sifive.com>, 
 Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Troy Mitchell <troy.mitchell@linux.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1714;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=9oo2dBjutCjtzVUywU+aLYNFSs71WJXXRWxyzq33mLM=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkL2L5trTvXF852rnzybD3rQw4Otormvq+j7n9Zw1ZqY
 cHicrK7o5SFQYyLQVZMkaX7Ac+2Ap8o2wKBQl+YOaxMIEMYuDgFYCIGOYwMLcJHObz/th5a8EXl
 guw7qUXSQrHSCreDNT/e4OjbO29ePsNv9r7Z0/Ped6wXjPtqW/TpU1Vc4tKamPV1LB1HH7+02rm
 fHQA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_060051_817757_20182D29 
X-CRM114-Status: UNSURE (   7.72  )
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

Hart start sends wake-up IPIs through all registered IPI devices, but
sbi_ipi_process() only clears the preferred device. A notification from
another device can arrive after warm initialization has cleared it.

With both IMSIC and ACLINT MSWI, IMSIC is preferred and has no ipi_clear
callback: its interrupts are acknowledged through MTOPEI. A late ACLINT
notification therefore leaves MSIP asserted, trapping the hart in the
machine-mode interrupt handler and potentially timing out Linux CPU
bring-up.

Clear all registered IPI devices before consuming the software IPI event
bits so that late wake-up notifications are acknowledged too.

Fixes: 94f0f8465622 ("lib: sbi: Extends sbi_ipi_raw_send() to use all available IPI devices")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 lib/sbi/sbi_ipi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index b04a5877..683d559d 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -263,7 +263,12 @@ void sbi_ipi_process(void)
 			sbi_scratch_offset_ptr(scratch, ipi_data_off);
 
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_IPI_RECVD);
-	sbi_ipi_raw_clear(false);
+	/*
+	 * A wake-up IPI is sent through all devices. A notification from a
+	 * non-preferred device can arrive after warm-boot initialization
+	 * cleared it, so acknowledge all devices when processing the IPI.
+	 */
+	sbi_ipi_raw_clear(true);
 
 	ipi_type = atomic_raw_xchg_ulong(&ipi_data->ipi_type, 0);
 	ipi_event = 0;

---
base-commit: 3593a5facc4c6938b90429a6973ba9ee21fc5899
change-id: 20260908-ipi-clear-all-54c3def85689

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.dev>


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
