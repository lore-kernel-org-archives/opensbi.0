Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B6EC55174
	for <opensbi@archiver.kernel.org>; Fri, 31 Jul 2026 10:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qd7uGlQ1b8lecpXiwzGa6Y9aTEtiSqZ+k2zEU1yH104=; b=whvMHGNsnMkZpB
	Ap1ZCLZcgbCz5gJiuduR2CSOUTl4XqsPkG5Sukne1aTyjUOBMyvbekBnrgRCzUxB7HcI/tgp2hwLc
	3FJklVfxuvGqaL2vvBFVVxe9APVIccYS6XugZqneDl5s9yLyyXJDAXQqFInq2ARZLomoMQeeip6+y
	xxeJYNz/gEg26yAAD3xuvfp8ZuD0WX/7vuK0SkNYFrZnYknJPK/aefwPdFXlVX1qTSlGt8zLGR3Pz
	u9GkWz0LHkw3FOvbFfovNhYg6VUq+Bsvxq19I7WPQ5Hcu0NCoR6wVWXOyyF1KvLf+2zVGKz3fItQH
	04IutIL673XlJvZ4xOkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkZT-0000000CKNE-3NB0;
	Fri, 31 Jul 2026 10:34:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkZS-0000000CKLk-3l60
	for opensbi@bombadil.infradead.org;
	Fri, 31 Jul 2026 10:34:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Cp4IgWNU//NO1/aJLvKRtHmBE1MdZbUaNRZ78BM1vVA=; b=WdzVM9v5auiFYSnXGfwmTq7V5i
	2poHmNowpkrDnN2gQ3RFhgXFeoAGnP4+0wgPsQ/aoHcP0ocLEfk3kqCQPGkMTaMUg4D+qecgpSv7O
	+OPytPngEkbxwQfCbokp2gNvxcEYMipZx8wJLYchIbO7Wgb1JHPAl4w+U+IWydCAFCbo7oeubQvpd
	uRoo/QkzEUSc06FPl2q9CvT7guLVM+Ma+3QDFmHTNyJYbv5/RoR8YJazlT+Pfa2E6Ws726TGnfpHl
	aTdVMQTT95H+fYdX5Jawi1PUrtF3pPHjcGgmhsUWpIrGoXjThwljph6dY3UvkaDiwOh8wPkTo+hNG
	bw89nsmA==;
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wpkZN-00000007Nu2-0r4L
	for opensbi@lists.infradead.org;
	Fri, 31 Jul 2026 10:34:29 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowADXq+8nemxqJmmDAg--.64576S3;
	Fri, 31 Jul 2026 18:34:15 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: Rahul Pathak <rahul@summations.net>,
	liutong <liutong@iscas.ac.cn>
Subject: [PATCH v2 1/6] lib: sbi_dbtr: fix integer overflow in read_trig bounds check
Date: Fri, 31 Jul 2026 10:34:00 +0000
Message-Id: <20260731103405.1535818-2-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260731103405.1535818-1-liutong@iscas.ac.cn>
References: <20260731103405.1535818-1-liutong@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowADXq+8nemxqJmmDAg--.64576S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uF17Ar4xZF17Xr4fAF1rtFb_yoW8Xw1xpF
	1xG3W3Kw40qryjy3y0k3WfJFyIga18Cw4UtrWSyry0q398Zay8u34ak3WUXayxZrykAF4a
	vF1qqr4UZF4YvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r1Y6r1xM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU1U73DUUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_113425_827041_2DC00365 
X-CRM114-Status: UNSURE (   9.16  )
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

In sbi_dbtr_read_trig(), the range check is:

  if (trig_idx_base + trig_count >= hs->total_trigs)

When trig_idx_base and trig_count are both unsigned long values supplied
by S-mode, their sum can wrap past ULONG_MAX to a small value, making
the check pass. For example trig_idx_base=1, trig_count=ULONG_MAX wraps
to 0, which is less than total_trigs.

This allows the subsequent for_each_trig_entry loop to access trigger
entries far beyond the triggers[] array, corrupting M-mode heap memory
via CSR read-back writes and leaking M-mode internal state to S-mode
shared memory.

Rewrite the condition as trig_count >= total_trigs - trig_idx_base. The
subtraction is safe because the preceding check already guarantees
trig_idx_base < total_trigs.

Fixes: 97f234f15c96 ("lib: sbi: Introduce the SBI debug triggers extension support")
Signed-off-by: liutong <liutong@iscas.ac.cn>
---

Previously sent as [PATCH].
Changes in v2:
- Added Fixes tag
- Consolidated into patch series

 lib/sbi/sbi_dbtr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 01047969..eeab7d3a 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -572,7 +572,7 @@ int sbi_dbtr_read_trig(unsigned long smode,
 		return SBI_ERR_FAILED;
 
 	if (trig_idx_base >= hs->total_trigs ||
-	    trig_idx_base + trig_count >= hs->total_trigs)
+	    trig_count >= hs->total_trigs - trig_idx_base)
 		return SBI_ERR_INVALID_PARAM;
 
 	if (sbi_dbtr_shmem_disabled(hs))
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
