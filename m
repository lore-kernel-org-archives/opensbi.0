Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE90C88E42
	for <opensbi@archiver.kernel.org>; Thu, 10 Sep 2026 05:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BnWUQW6rcyPJm5XYNvvkU0P9Set9lKnBtGePrSb67pc=; b=L0+hOdhVacx1Rv
	LfWsHmetJsLOzEywY+6BsEA9OTpbXUvgQunv5tmnRWcZSMniBSqwr4EvhGPFDEhuwWGh1ulKA5vNZ
	A0gCt3a4XHNwppLfQLIlHoO6RvSfZsNmXFhNFQ5ss458gRkI8U0h2PUbckXK8CHl8FAHbQyADuSqh
	ITYD00gtygwQiOJHUiWn3tXM39RgA9Sbty6yM2LBjWcfzvqbtQwWoffdOsLpS6W7EcgqCAabhJZ7U
	sip6z9TLtcSpzxm5zUTuky5IzE0OG248FCZI2krj+BUsC4ZOKTjtcok9BenfZD0iPyZrvEQ/HsFFm
	Y1q0W25WBnaIbmUZVXtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4XJE-0000000DRIx-390Z;
	Thu, 10 Sep 2026 05:26:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4XJD-0000000DRIP-1g4q
	for opensbi@bombadil.infradead.org;
	Thu, 10 Sep 2026 05:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=udyXUWpp1kNDTl2iOqwfjq/ve8MiUgpJ/XtMxIUYJI8=; b=Nhnxn0pTw9bW8Wzaz/+5N8vM6h
	S+Lfy5dMkYB9u202VI+jYP5p2IwOznAQeQWZ39ppj+Nt9Q2/VIiJhWLG+5DnUWObOkdwMHP9y1aox
	uwmjjI2VnIoRJ351OESRtWdys/9uzSxBXoy329YKcxZ/i95FRZdtza6QHBraUTq8YkNz4xbXhOum8
	80kVg2fC2WBedQT2h/SNS4rxoHrgZ461pSsAOtNDVJWlwrfgjmTTueH4XycB7FjrLkZrQ4H0IHzal
	26tnJCdL4RYq6M23Wv+zpMyCy1eTAdy3NgacreWn+gyYP9+o+bfx7X20+MU51eN3SFvgLu7jnLRx2
	27QRScpw==;
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4XJ8-000000022Mo-39wW
	for opensbi@lists.infradead.org;
	Thu, 10 Sep 2026 05:26:50 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowABHTjyOP6Jq6atPBw--.40145S6;
	Thu, 10 Sep 2026 13:26:39 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: himanshu.chauhan@oss.qualcomm.com,
	liutong <liutong@iscas.ac.cn>
Subject: [PATCH v3 4/4] lib: sbi_mpxy: fix integer overflow in attribute range endpoint
Date: Thu, 10 Sep 2026 05:26:29 +0000
Message-Id: <20260910052629.3359493-5-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910052629.3359493-1-liutong@iscas.ac.cn>
References: <20260910052629.3359493-1-liutong@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowABHTjyOP6Jq6atPBw--.40145S6
X-Coremail-Antispam: 1UD129KBjvJXoWxurykCr1ruF15GF1xJr1DZFb_yoW5Jw43pF
	s5tayqgrs7Xan3CwsFyw4ku3W0gw18Ja12gFy5K340yFn8KryxCry8Ja90gF1UKFyDAa12
	qF4DtrZ8uF1j9aDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9K14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr
	1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0
	owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8
	JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUYOzVUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_062647_440838_129962E7 
X-CRM114-Status: GOOD (  11.89  )
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

sbi_mpxy_read_attrs() and sbi_mpxy_write_attrs() compute the end of the
requested range as a u32:

  end_id = base_attr_id + attr_count - 1;

Message protocol attribute ids extend to
SBI_MPXY_ATTR_MSGPROTO_ATTR_END (0xffffffff), so the guard
"end_id > SBI_MPXY_ATTR_MSGPROTO_ATTR_END" cannot hold for a u32 and
never rejects anything.

Such a request then reaches the message protocol driver, which computes
the same endpoint in a u32 and so passes its own range check as well,
and indexes its attribute array with attr_id2index(base_attr_id). For
base_attr_id 0xffffffff that is index 0x7fffffff, an out-of-bounds read
whose result is copied into the shared memory.

Widen end_id to u64 so the endpoint is exact and such a request is
rejected before a driver runs. The standard attribute path is not
affected, since attr_count is already limited to the shared memory size
there.

Fixes: 7939bf1329eb ("lib: sbi: Add SBI Message Proxy (MPXY) framework")
Signed-off-by: liutong <liutong@iscas.ac.cn>
---
Previously sent as [PATCH v2 6/6].

Changes in v3:
- Rebased onto current master; the code is unchanged from v2
- Commit message rewritten. v2 said the wrap made the standard
  attribute guard pass incorrectly, but attr_count is already limited
  to the shared memory size on that path, so it cannot wrap there. The
  guard that a u32 endpoint disables is the message protocol one, and
  the effect is an out-of-bounds read in the message protocol driver
  rather than on the shared memory itself.
- Split into this series

 lib/sbi/sbi_mpxy.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_mpxy.c b/lib/sbi/sbi_mpxy.c
index 2b9ad351..622c7d89 100644
--- a/lib/sbi/sbi_mpxy.c
+++ b/lib/sbi/sbi_mpxy.c
@@ -475,7 +475,8 @@ int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
 {
 	struct mpxy_state *ms = sbi_domain_mpxy_state_thishart_ptr();
 	int ret = SBI_SUCCESS;
-	u32 *attr_ptr, end_id;
+	u32 *attr_ptr;
+	u64 end_id;
 	void *shmem_base;
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 
@@ -625,7 +626,8 @@ static void mpxy_write_std_attr(struct sbi_mpxy_channel *channel, u32 attr_id,
 int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
 {
 	struct mpxy_state *ms = sbi_domain_mpxy_state_thishart_ptr();
-	u32 *mem_ptr, attr_id, end_id, attr_val;
+	u32 *mem_ptr, attr_id, attr_val;
+	u64 end_id;
 	struct sbi_mpxy_channel *channel;
 	int ret, mem_idx;
 	void *shmem_base;
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
