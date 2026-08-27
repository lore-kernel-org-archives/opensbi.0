Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6892DC61DC2
	for <opensbi@archiver.kernel.org>; Thu, 27 Aug 2026 11:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eeYlAtyOWkkyqFyp2k8iHvicfHMI6m5NxlKvCTvoBz0=; b=dAlafcR2ex0PVM
	aJ4ACzgTrCeFzUOMVD0vvUXcWZjqgPMGCmw8jmjSrH2fW2+tzPkLFsYWoY8sUxcaKne69bQ081C+i
	PjSFVKoyfSiMDYSLTaiN4TVJSpaaD9kACOHYreHds1RPOy7j3l69Avnf9nnC2m4reacUTONgj9cGG
	LYnUva2qtJwn7ba37/IYk0tVV4mdVPUmCdKdVFwdAsxqiW0EjfuyL8qJ/jyE4DanN4/3qMudiLnJ4
	A0Pr0OhI+rgdFCyz4MSH+nOXgc+jxk9DgOG3ICTCjR+cHSYSpn91GUzNmVMLTB3+r9Efv567zv6rn
	FwomoH8+87auUZD8nAjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzYhn-00000003usT-2U8M;
	Thu, 27 Aug 2026 11:55:39 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzYhl-00000003urN-0MQo
	for opensbi@lists.infradead.org;
	Thu, 27 Aug 2026 11:55:38 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-05 (Coremail) with SMTP id zQCowAD3J0K2JZBqkIfJBg--.50059S2;
	Thu, 27 Aug 2026 19:55:34 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH] lib: utils: irqchip: handle IMSIC mask boundaries
Date: Thu, 27 Aug 2026 19:55:34 +0800
Message-ID: <20260827115534.49509-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowAD3J0K2JZBqkIfJBg--.50059S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWF17XF13XF1DAFy7Cw13XFb_yoWrGF45pF
	1fCr909FWUC340vrsYyayDWa4rAwn3CrZxGrZrGwn0krW7XF18Wr1jkryruw1rJFsrAFy7
	ZF4rZFW5Way5CaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyq14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUozVbDUUUU
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_045537_504243_70BDD123 
X-CRM114-Status: GOOD (  14.17  )
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

imsic_data_check() accepts field geometries that reach the native word
width, but then constructs masks with 1UL << bits.  A full-width low field
therefore shifts by BITS_PER_LONG.  The group endpoint calculation also
underflows when group_index_bits is zero, even though an absent group field
has no shift semantics.

Build all geometry masks through a checked helper.  Represent a full-width
field as ~0UL, keep zero-width fields as a zero mask, and validate the group
shift only when a group field exists.  Reuse the resulting masks for base
canonicalization and regset-size alignment.

Fixes: 9f73669959dd ("lib: utils/irqchip: Add IMSIC library")

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Base-commit: 4e79fd7de59f1b2899092c1a84ce68c8ebc68f93

 lib/utils/irqchip/imsic.c | 72 +++++++++++++++++++++++++++------------
 1 file changed, 50 insertions(+), 22 deletions(-)

diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index f6da9f7..5f6eed5 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -300,10 +300,30 @@ static int imsic_warm_irqchip_init(struct sbi_irqchip_device *dev)
 	return 0;
 }
 
+static int imsic_make_field_mask(u32 bits, u32 shift,
+				 unsigned long *mask)
+{
+	if (!bits) {
+		*mask = 0;
+		return 0;
+	}
+
+	if (shift >= BITS_PER_LONG || bits > BITS_PER_LONG - shift)
+		return SBI_EINVAL;
+
+	if (bits == BITS_PER_LONG)
+		*mask = ~0UL;
+	else
+		*mask = ((1UL << bits) - 1) << shift;
+
+	return 0;
+}
+
 int imsic_data_check(struct imsic_data *imsic)
 {
-	u32 i, tmp;
-	unsigned long base_addr, addr, mask;
+	u32 i, low_index_bits, tmp;
+	unsigned long addr, base_addr, group_mask, low_mask, regset_mask;
+	int rc;
 
 	/* Sanity checks */
 	if (!imsic ||
@@ -325,13 +345,29 @@ int imsic_data_check(struct imsic_data *imsic)
 	if (tmp < imsic->group_index_bits)
 		return SBI_EINVAL;
 
-	tmp = IMSIC_MMIO_PAGE_SHIFT + imsic->guest_index_bits +
-	      imsic->hart_index_bits;
-	if (imsic->group_index_shift < tmp)
-		return SBI_EINVAL;
-	tmp = imsic->group_index_bits + imsic->group_index_shift - 1;
-	if (tmp >= BITS_PER_LONG)
-		return SBI_EINVAL;
+	low_index_bits = IMSIC_MMIO_PAGE_SHIFT + imsic->guest_index_bits +
+			 imsic->hart_index_bits;
+	rc = imsic_make_field_mask(low_index_bits, 0, &low_mask);
+	if (rc)
+		return rc;
+
+	rc = imsic_make_field_mask(imsic->guest_index_bits +
+				   IMSIC_MMIO_PAGE_SHIFT, 0, &regset_mask);
+	if (rc)
+		return rc;
+
+	if (imsic->group_index_bits) {
+		if (imsic->group_index_shift < low_index_bits)
+			return SBI_EINVAL;
+
+		rc = imsic_make_field_mask(imsic->group_index_bits,
+					   imsic->group_index_shift,
+					   &group_mask);
+		if (rc)
+			return rc;
+	} else {
+		group_mask = 0;
+	}
 
 	/*
 	 * Number of interrupt identities should be 1 less than
@@ -346,23 +382,15 @@ int imsic_data_check(struct imsic_data *imsic)
 
 	/* Match patter of each regset */
 	base_addr = imsic->regs[0].addr;
-	base_addr &= ~((1UL << (imsic->guest_index_bits +
-				 imsic->hart_index_bits +
-				 IMSIC_MMIO_PAGE_SHIFT)) - 1);
-	base_addr &= ~(((1UL << imsic->group_index_bits) - 1) <<
-			imsic->group_index_shift);
+	base_addr &= ~low_mask;
+	base_addr &= ~group_mask;
 	for (i = 0; i < IMSIC_MAX_REGS && imsic->regs[i].size; i++) {
-		mask = (1UL << imsic->guest_index_bits) * IMSIC_MMIO_PAGE_SZ;
-		mask -= 1UL;
-		if (imsic->regs[i].size & mask)
+		if (imsic->regs[i].size & regset_mask)
 			return SBI_EINVAL;
 
 		addr = imsic->regs[i].addr;
-		addr &= ~((1UL << (imsic->guest_index_bits +
-					 imsic->hart_index_bits +
-					 IMSIC_MMIO_PAGE_SHIFT)) - 1);
-		addr &= ~(((1UL << imsic->group_index_bits) - 1) <<
-				imsic->group_index_shift);
+		addr &= ~low_mask;
+		addr &= ~group_mask;
 		if (base_addr != addr)
 			return SBI_EINVAL;
 	}
-- 
2.50.1 (Apple Git-155)


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
