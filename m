Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224F6C88E41
	for <opensbi@archiver.kernel.org>; Thu, 10 Sep 2026 05:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D37uox88RlN/JNLrDKJSzKvlbP1MlsQzUcVVjDp5WQI=; b=nfVwPii7l+MPm5
	+iaiBaUCK3gqLkxmkxSWcDKcx1+iLPYADXtW/R1LTgxAsRRWjAiyH9l6W50DcuJWFDUbqzbbpNPRT
	tgRWmX1Uu0Sxm01hIrVfLXJl9ogScebFn7EQXzFbJhwV65305mZUVzPxX8Dq6J0NSvfTDGv2RU4M6
	OaZEijdUt+OXzavM33yd7evBJqyZhVaGfDJ6S82fSXsvt4+x+RUQekyK9GeQyYTbg4tf9aM5A1RVm
	bFOviX11Dx6ZL/ou6ek+2z6vhkQUzoDHBcn4a9w2i6P3yO4t+KssHXtg6Tidudr0i7p463BjDDNUw
	s67yg9+dRoB4vTtf5RiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4XMW-0000000DRjr-1Rly;
	Thu, 10 Sep 2026 05:30:16 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4XMQ-0000000DRhR-0DXt
	for opensbi@lists.infradead.org;
	Thu, 10 Sep 2026 05:30:13 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowABHUT9fQKJq9rRPBw--.30051S5;
	Thu, 10 Sep 2026 13:30:07 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: himanshu.chauhan@oss.qualcomm.com,
	david.garcia@aheadcomputing.com,
	liutong <liutong@iscas.ac.cn>
Subject: [PATCH v3 3/3] lib: sbi: sse: fix shared memory double-fetch in sse_write_attrs
Date: Thu, 10 Sep 2026 05:29:58 +0000
Message-Id: <20260910052958.3365324-4-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910052958.3365324-1-liutong@iscas.ac.cn>
References: <20260910052958.3365324-1-liutong@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowABHUT9fQKJq9rRPBw--.30051S5
X-Coremail-Antispam: 1UD129KBjvJXoWxuF1xCw4UAF1xXFWruw4fGrg_yoW5Ww1kpF
	s7Kas0grWft3WxKr9xZw48X3WfXw4rJ34aqFZxtr18ZF15Xry7X3yayryYvryjyr93AF4j
	vayjgFy5ZFWDZ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWl
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb3Ef7UUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_223010_463323_C6C28B91 
X-CRM114-Status: GOOD (  15.67  )
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

sse_write_attrs() reads the attribute values from the S-mode shared
memory in two passes: first to validate them, then to apply them.
S-mode may write the shared memory between the passes, so a value that
sse_event_set_attr_check() would have rejected can still be applied.

Copy the attributes into a local array, unmap the shared memory right
away, and run both passes against that copy.

The copy is a fixed size stack array. Its bound is currently guaranteed
by sbi_sse_attr_check() in the only caller, but relying on that would
turn a future unchecked call site into a stack buffer overflow, where
today it would only read past the shared mapping. Check attr_count here
as well, so the function does not depend on validation done elsewhere.

Fixes: c8cdf01d8f3a ("lib: sbi: Add support for Supervisor Software Events extension")
Suggested-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Signed-off-by: liutong <liutong@iscas.ac.cn>
---
Previously sent as [PATCH v2 5/6].

Changes in v3:
- Rebased onto current master (sbi_hart_protection_*_range rename)
- Added the attr_count > SBI_SSE_ATTR_MAX check inside
  sse_write_attrs(), so that it does not depend on the bound being
  established by its caller
- Subject prefix changed to "lib: sbi: sse:"

 lib/sbi/sbi_sse.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index f6d0111d..1fc7221c 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -1059,25 +1059,39 @@ static int sse_write_attrs(struct sbi_sse_event *e, uint32_t base_attr_id,
 	unsigned long attr = 0, val;
 	uint32_t id, end_id = base_attr_id + attr_count;
 	unsigned long *attrs = (unsigned long *)input_phys;
+	unsigned long local_attrs[SBI_SSE_ATTR_MAX];
+
+	/*
+	 * The caller rejects a larger count, but local_attrs is a fixed
+	 * size stack array, so do not depend on a check made elsewhere.
+	 */
+	if (attr_count > SBI_SSE_ATTR_MAX)
+		return SBI_ERR_INVALID_PARAM;
 
 	sbi_hart_protection_temp_map_range(input_phys, sizeof(unsigned long) * attr_count);
 
+	/*
+	 * Snapshot the attributes so that the values checked below are the
+	 * ones applied, even though S-mode can keep writing the shared
+	 * memory.
+	 */
+	copy_attrs(local_attrs, attrs, attr_count);
+
+	sbi_hart_protection_temp_unmap_range(input_phys, sizeof(unsigned long) * attr_count);
+
 	for (id = base_attr_id; id < end_id; id++) {
-		val = attrs[attr++];
+		val = local_attrs[attr++];
 		ret = sse_event_set_attr_check(e, id, val);
 		if (ret)
-			goto out;
+			return ret;
 	}
 
 	attr = 0;
 	for (id = base_attr_id; id < end_id; id++) {
-		val = attrs[attr++];
+		val = local_attrs[attr++];
 		sse_event_set_attr(e, id, val);
 	}
 
-out:
-	sbi_hart_protection_temp_unmap_range(input_phys, sizeof(unsigned long) * attr_count);
-
 	return ret;
 }
 
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
