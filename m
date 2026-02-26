Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225ADFCE06A
	for <opensbi@archiver.kernel.org>; Thu, 26 Feb 2026 12:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zs5erTIyP3LeAVmwHVzCvn7Vy9kzvYdshGM04mSh5XA=; b=y2LTK8EVKlClAG
	yH5I0B8amVoPQf7q2N74FwJ99A5HGYgjkCKug6oSYp9wX7nhifwWb/p5f4IXKpW8gQb9gtYhlz1Vv
	94LQLQFUCWbyh02RMfGyjt3DRgouWoa/1uvsCWQiBCbxxappBxKaTzzWJ6ICXoIPfVFN698X1W0Gr
	btMqzf9Ufk5QJkDR4W9p6gnZGBLDk+dl4MbTOsBDBm8gjJxFu67mmd3bw7sJ+4D92/Ln9XkYuO51k
	nq9cm4tqMcuwISLXzemDi3FibIAXFjJ9PmKMUECc2bV2JcYHoLgZicVHhG65nQmqzEtSx44cBHKbA
	2mc8+JnqfN1klghVA7uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvaZy-0000000680F-0vCt;
	Thu, 26 Feb 2026 12:34:54 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvaZu-000000067z0-0iqG
	for opensbi@lists.infradead.org;
	Thu, 26 Feb 2026 12:34:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1772109280; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=TM+3NniAUrewtms+03K87nbMVy5Uj64+SUX0kCne9BM=;
	b=tDOjD/YPfho0ZHDJoLQSIjBrCGz5htVZIBnGIAEutbJKwQ2Ezqcp4/NcA3Li6QkIiuSb9PdCUbCRtU9KK9ALZfZnNxlh80Ht9jYKEdM3ZVDhIqcfkIxYOyG3O7eGc4i8jVHqmVmUEytFpLoLHJ1ottzE57uCeRqDWCiUUxwGiio=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0WzrCT1o_1772109269 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 26 Feb 2026 20:34:40 +0800
From: cp0613@linux.alibaba.com
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	samuel.holland@sifive.com,
	guoren@kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH v2 0/2] lib: sbi: Flush cache entries after writing PMP CSRs
Date: Thu, 26 Feb 2026 20:34:06 +0800
Message-ID: <20260226123408.1597-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_043451_761011_75110E4A 
X-CRM114-Status: UNSURE (   6.91  )
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

From: Chen Pei <cp0613@linux.alibaba.com>

As the privileged specification states, after writing to the PMP CSRs,
a SFENCE.VMA or HFENCE.GVMA instruction should be executed with rs1=x0
and rs2=x0 to flush all address translation cache entries.

The original implementation does not cover all possible cases. For
example, the unconfigure and map_range/unmap_range functions of
sbi_hart_protection calls pmp_set but does not execute the SFENCE.VMA
instruction. This patch covers these cases, ensuring that dbtr, sse, and
other modules can safely update pmpcfg.

Considering the performance issues caused by flush all address translation
cache entries, sbi_hart_pmp_fence_vma is introduced to flush only the
entries corresponding to a given address and size.

Changes in v2:
 - Introduce sbi_hart_pmp_fence_vma
 - Use sbi_hart_pmp_fence_vma when calling map_range/unmap_range in
   sbi_hart_protection to avoid performance issues caused by using
   sbi_hart_pmp_fence_all.

Chen Pei (2):
  lib: sbi: Introduce sbi_hart_pmp_fence_vma
  lib: sbi: Flush cache entries after writing PMP CSRs

 include/sbi/sbi_hart_pmp.h       |  3 ++-
 lib/sbi/sbi_hart_pmp.c           | 41 ++++++++++++++++++++++++++++----
 platform/generic/eswin/eic770x.c |  2 +-
 3 files changed, 40 insertions(+), 6 deletions(-)

-- 
2.50.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
