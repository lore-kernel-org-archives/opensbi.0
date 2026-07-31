Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C1BC54F54
	for <opensbi@archiver.kernel.org>; Fri, 31 Jul 2026 10:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qo7OTysnzjw+oJ8YHRjkeNVJyPQXUCUHdIFjhhR5IFw=; b=vn334jo9DLRAH5
	w65zxqy67IwI8w0+/6ExxzKOX9FNN79iAQ7Hg/m/3G9tC5H9tFejMdj6cuy3tQkcgFfJ/0j7oirfw
	QHCDrkHFQ9FveI92Ru7fUSZl01eYOkzauepM1xddGml22Kav6E43LmedCMauZ22irK1OcafDnCwov
	KXhaeYHOjN/FE18W43p8I3hUUTytK0FedQplEPaKacjTg0rmF4V5dOhBdGxnFQqqFd6kS+l2JXqG6
	lApvmLorlmNyo8rw7eJ/4JtnObG89fT85OEuVWrJvHFIJwwdTYJZc52rUQHvEM6egZlIrodgD4PJQ
	j4up48zwaMq+xM3dBflg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkZS-0000000CKLn-2E7F;
	Fri, 31 Jul 2026 10:34:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkZR-0000000CKLD-1Tj2
	for opensbi@bombadil.infradead.org;
	Fri, 31 Jul 2026 10:34:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=O9B3j3MRzrmadkRTHbjS8GQvt9Ad/PGz3fmEd1senA8=; b=XGkr1V5Xik7QaHwBTJGrrS0/8N
	JSdKF5ej/3edIWqd4ak6jHAa8uoPmJwqhiI76K7d+K2Vu3N5FNGZbMlBYmUJfPTOn9s0Z1hAPgc6R
	s+5msqyOp0QiFQ/XJbMvnPn2CthNlI+DzpETyLJZky+l5Z2JONKmYJFYZVKxfni4ExY6BkDomMnSI
	WtqBHYm9wXBZT75E1uIH+ltuKEOOBluD7/EBR/EyKE6cYDUnXVOiFp5TasSb4uc1mpte8EnhGqg8Y
	ILZK3pAW7hoEuJo/+SO9fa5WsbP5+juKANACcR3D0vbtSyd1S8jp2Bnk82l1TXkAPBS5SzcVTBIzh
	C7zOdkHg==;
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wpkZM-00000007Nu3-289U
	for opensbi@lists.infradead.org;
	Fri, 31 Jul 2026 10:34:28 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowADXq+8nemxqJmmDAg--.64576S8;
	Fri, 31 Jul 2026 18:34:16 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: Rahul Pathak <rahul@summations.net>,
	liutong <liutong@iscas.ac.cn>
Subject: [PATCH v2 6/6] lib: sbi_mpxy: fix integer overflow in attribute range endpoint
Date: Fri, 31 Jul 2026 10:34:05 +0000
Message-Id: <20260731103405.1535818-7-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260731103405.1535818-1-liutong@iscas.ac.cn>
References: <20260731103405.1535818-1-liutong@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowADXq+8nemxqJmmDAg--.64576S8
X-Coremail-Antispam: 1UD129KBjvJXoW7uw47Cw4UXr15AF4DCrW8tFb_yoW8Cw1UpF
	Z5Jayqgrsrt3WfKwsFyw4DXw40gryrKa17Wryqk340yF45tryxA3s5Wa1YgF1UKF97AF4q
	qF4jqry5uF429aDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9E14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr
	1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0
	owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr0_
	Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjaFAJUUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_113425_187857_675086C6 
X-CRM114-Status: UNSURE (   7.83  )
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

In sbi_mpxy_read_attrs() and sbi_mpxy_write_attrs(), the attribute range
endpoint is computed as:

  u32 end_id = base_attr_id + attr_count - 1;

When base_attr_id + attr_count exceeds UINT32_MAX, end_id wraps around to
a small value. This makes downstream range checks such as
"end_id >= SBI_MPXY_ATTR_STD_ATTR_MAX_IDX" pass incorrectly, turning them
into dead code.

A malicious or misconfigured S-mode caller can supply crafted
base_attr_id and attr_count values that trigger the wraparound, bypassing
range validation and causing out-of-bounds read/write on the shared
memory attribute array.

Widen end_id to u64 so the addition cannot wrap within the u32 range.

Fixes: 7939bf1329eb ("lib: sbi: Add SBI Message Proxy (MPXY) framework")
Signed-off-by: liutong <liutong@iscas.ac.cn>
---

Previously sent as [PATCH v2].
Changes in v2:
- Added Fixes tag
- Consolidated into patch series

 lib/sbi/sbi_mpxy.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_mpxy.c b/lib/sbi/sbi_mpxy.c
index 19f59f3a..37dc8e7e 100644
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
