Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A141C61DC2
	for <opensbi@archiver.kernel.org>; Thu, 27 Aug 2026 11:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v2i/w56YJrDfqapr+nTxnzOT488SB2d9uHE3EXSOl1Q=; b=b8o8wNqz5xWvsQ
	+mcMrNnVADG3hhQj26D2ZbxZTw6PBv0tKfZ7FYwIbLouH5Mi4+seZ1pkvEVJ984ybfkXH5nDdLzi3
	+f8yIRCSwLf7Msv/GSi6uuqX52y0BYt5UwFBE+jXjMx98aADA0PV/AXWmQt+kN8ytwwQFSZSEslZe
	6DMlWRywDrHmPVDLQ3+XlNSvu0QW7rg5iYkf7hPMy9N4t4x1h6jeq98PzQar4X1vavWHB2dW6I7MU
	hJsJxcwb3VBcqeQIg4B4E9orkqEy5jsJqaNNld6tyVJNRypgsaVlZpbK/79yZrI992dSXxLQpDDZt
	e3124ziLrJmAzoE/+csA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzYgw-00000003unR-1rGx;
	Thu, 27 Aug 2026 11:54:46 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzYgt-00000003ump-1aqc
	for opensbi@lists.infradead.org;
	Thu, 27 Aug 2026 11:54:45 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-05 (Coremail) with SMTP id zQCowABXxD57JZBqd4TJBg--.40763S2;
	Thu, 27 Aug 2026 19:54:35 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: opensbi@lists.infradead.org
Subject: [PATCH] platform: generic: andes: validate PMAADDR decoding
Date: Thu, 27 Aug 2026 19:54:35 +0800
Message-ID: <20260827115435.49190-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowABXxD57JZBqd4TJBg--.40763S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXF17XrWfGFWxKr1kGF4xtFb_yoW5Xw1rpF
	4SgrW5tr45uw12qF4fAF18X398Cr10vrWfGrW2qry0vF18XF15WryUW3W5KF1DZF97X3Wa
	y390yFWDCa12qaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUehL0UUUUU
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_045443_781500_A0DFA667 
X-CRM114-Status: GOOD (  10.18  )
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
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

decode_pmaaddrx() reconstructs a NAPOT region with signed int shifts.  The
QiLai platform configures 2^35 and 2^37 PCIe regions, so decoding the first
enabled region while checking the next one reaches shifts by 32 and 35.
Those shifts are undefined even on RV64.

The all-ones PMAADDR value also violates the sbi_ffz() precondition, and a
decoded base or end may not fit in unsigned long.

Use unsigned shifts and make the decoder reject encodings whose size, base,
or inclusive end cannot be represented.  Treat an invalid enabled entry as
overlapping when adding a region, and fail rather than skipping it when
freeing a region.

Fixes: aa56084c4dfb ("platform: generic: andes: add a new Andes SBI call to set up a PMA entry")

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Base-commit: 4e79fd7de59f1b2899092c1a84ce68c8ebc68f93

 platform/generic/andes/andes_pma.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/platform/generic/andes/andes_pma.c b/platform/generic/andes/andes_pma.c
index ba9a35b..cdc06ac 100644
--- a/platform/generic/andes/andes_pma.c
+++ b/platform/generic/andes/andes_pma.c
@@ -69,10 +69,10 @@ static void set_pmaxcfg(int entry_id, char flags)
 	csr_write_num(pmacfg_addr, pmacfg_val);
 }
 
-static void decode_pmaaddrx(int entry_id, unsigned long *start,
+static bool decode_pmaaddrx(int entry_id, unsigned long *start,
 			    unsigned long *size)
 {
-	unsigned long pmaaddr;
+	unsigned long addr, pmaaddr;
 	int k;
 
 	/**
@@ -81,9 +81,23 @@ static void decode_pmaaddrx(int entry_id, unsigned long *start,
 	 * start = 4 * ($pmaaddr - (size / 8) + 1)
 	 */
 	pmaaddr = csr_read_num(CSR_PMAADDR0 + entry_id);
+	if (pmaaddr == ~0UL)
+		return false;
+
 	k = sbi_ffz(pmaaddr);
-	*size = 1 << (k + 3);
-	*start = (pmaaddr - (1 << k) + 1) << 2;
+	if (k >= __riscv_xlen - 3)
+		return false;
+
+	addr = pmaaddr - (1UL << k) + 1;
+	if (addr > (~0UL >> 2))
+		return false;
+
+	*size = 1UL << (k + 3);
+	*start = addr << 2;
+	if (*start > ~0UL - (*size - 1))
+		return false;
+
+	return true;
 }
 
 static bool has_pma_region_overlap(unsigned long start, unsigned long size)
@@ -97,7 +111,8 @@ static bool has_pma_region_overlap(unsigned long start, unsigned long size)
 		if (is_pma_entry_disable(pmaxcfg))
 			continue;
 
-		decode_pmaaddrx(i, &_start, &_size);
+		if (!decode_pmaaddrx(i, &_start, &_size))
+			return true;
 		_end = _start + _size - 1;
 
 		if (MAX(start, _start) <= MIN(end, _end)) {
@@ -352,7 +367,8 @@ int andes_sbi_free_pma(unsigned long pa)
 		if (is_pma_entry_disable(pmaxcfg))
 			continue;
 
-		decode_pmaaddrx(i, &start, &size);
+		if (!decode_pmaaddrx(i, &start, &size))
+			return SBI_ERR_FAILED;
 		if (start != pa)
 			continue;
 
-- 
2.50.1 (Apple Git-155)


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
