Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151A7C53219
	for <opensbi@archiver.kernel.org>; Wed, 29 Jul 2026 06:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sy7ZmmKqmGEXYF+2A5ucWcm0epq7/VusXiQcVLDknEo=; b=fjdME65wJhysVr
	P3pdhUCJTbRRfSU5qttBllNZw1jb0j68ww+wwstBCvghBI/m2GkHzEQrHOkXU+NPXUghubFpZlbVR
	dPCXXlU4LWqFnlcp1n665Q504k/jvwnmE2rqSU7zNYcfSTF/DADixZ3S684q2o1vBqWa/yQ4XXqJV
	oq91SA3qnbHPClG1zO/ZWL4glzgECEkw2Hh+NC7L+9mJbld9+XrfHo4wbmRL3cRKdCWAfLneboWYE
	/pb7vfv8GjqtFhSVrra4InLjKjjLQg2b+ccBoiQON1ZoY6f0IkX0Ra/AWI/kNGtzuK07iqzB/f9Cz
	xnzHGptImvDQMvm7rF/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woy0J-000000073NB-1tLM;
	Wed, 29 Jul 2026 06:42:59 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woy0F-000000073Mq-1s7n
	for opensbi@lists.infradead.org;
	Wed, 29 Jul 2026 06:42:57 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowABnPfHmoGlqnFsMAg--.32458S2;
	Wed, 29 Jul 2026 14:42:46 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: liutong <liutong@iscas.ac.cn>
Subject: [PATCH v2] lib: sbi_mpxy: fix integer overflow in attribute range endpoint
Date: Wed, 29 Jul 2026 06:42:36 +0000
Message-Id: <20260729064236.936855-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CABdD5x==izS_hjx49xytTG+LMEiEO8PE25m-AyjmBeoi0RpsOQ@mail.gmail.com>
References: <CABdD5x==izS_hjx49xytTG+LMEiEO8PE25m-AyjmBeoi0RpsOQ@mail.gmail.com>
MIME-Version: 1.0
X-CM-TRANSID: qwCowABnPfHmoGlqnFsMAg--.32458S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uw47Cw4UXr15AF4DCrW8tFb_yoW8CFy5pF
	Z8Jayqgrsrt3WfKanFya1DXw4IgryrKa12gr90k340yF45tryxA3s5Wa1YgF15tF97AF4q
	vF1jqry5uF429FDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyK14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7
	v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI
	7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
	AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
	1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUYKZXUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_234255_978376_0AD69120 
X-CRM114-Status: UNSURE (   8.31  )
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

Thanks for the review, Rahul.

Changes in v2:
- Added Fixes tag as suggested

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
