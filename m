Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737B1C5516D
	for <opensbi@archiver.kernel.org>; Fri, 31 Jul 2026 10:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xlf+3nWxt4CBEfqM0x5mYMeBv2OKsjQhn76FsBgDLzA=; b=q/HwjMtIpF0Mqb
	/4sy4eoaj2BGC+sJVrM98vhwV+l9uE8paj9HhEfw86ZWVtaT8Tlkx7ZePPUsf9lkEcz8wGJBEUFJu
	XObH8CaD4nkBfcqdDc2QGKrUMRRqgxA3v1faOkqTD3SwhG+B4CjLpl8OF90l5IyKub7G7JgD8+kbA
	w7dEYw/+1v43LvX42qRCQCyg25HHJrbZ0PcGuYxRsm32irF73qE4MtEA095M3P/X9XdhAF/UfOkG7
	Bgow06jJa/hNsTmJANgX9kqLvF0+j5gTAN/NC2y3ZBEzbMTROGWK6njjZ9QoO4ci5XMQvDf407LXv
	zemtKhSYCWjxl5k3nMmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkZT-0000000CKNX-3mW9;
	Fri, 31 Jul 2026 10:34:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkZS-0000000CKLl-3kHP
	for opensbi@bombadil.infradead.org;
	Fri, 31 Jul 2026 10:34:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FY3t2K3Geko7diBArR37OIlXN3ziwg3O5sHT1uWwAro=; b=O3/0SAXVcXmaHO06lb6W6GNQOX
	1F4AiaPM1Pceuz4uNku5sladBQ+PHYAafhQ7KuGMGq40yGA1weB5Twt+q8pATcljAALazpytb0zCD
	1zzzuGDAlcqhc8kcQ5FeJcVmCakb54430Ba6PMo130TTbD9lktorp1UvgTEDkCNKs791ceni3y520
	1Pg2olPrB4szXDEulyDMu/Xj+EznSRjfojGxgWuBKqp373s1TOSs8ekzqkvAbF8BiZoyKh0KoUmsr
	X41BKAUY/1jfPZHryRhOliY3DhWZeW6hb/K1H/sYdgT/qog4mJpy5Hzmh/vMlARbs7brzvbbYPp38
	REBMDxqQ==;
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wpkZM-00000007Nu5-2JBc
	for opensbi@lists.infradead.org;
	Fri, 31 Jul 2026 10:34:29 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowADXq+8nemxqJmmDAg--.64576S5;
	Fri, 31 Jul 2026 18:34:16 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: Rahul Pathak <rahul@summations.net>,
	liutong <liutong@iscas.ac.cn>
Subject: [PATCH v2 3/6] lib: sbi_dbtr: use range check for shared memory domain validation
Date: Fri, 31 Jul 2026 10:34:02 +0000
Message-Id: <20260731103405.1535818-4-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260731103405.1535818-1-liutong@iscas.ac.cn>
References: <20260731103405.1535818-1-liutong@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowADXq+8nemxqJmmDAg--.64576S5
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar1xWF4Uury7Cr4rJw15twb_yoW8ArykpF
	4kWF12qw4Iqr9FvrZrK3ZYqFy0kw48Za1UK398CFnYy3Z8Zw1xCrWYgw1qv34xAFyrJa1j
	kF18AFsruF45ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbaFAJUUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_113425_205754_A3B33782 
X-CRM114-Status: UNSURE (   8.48  )
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

sbi_dbtr_setup_shmem() validates the shared memory address using
sbi_domain_check_addr(), which only checks a single address. However,
subsequent DBTR operations (install, read, update) access up to
total_trigs * sizeof(sbi_dbtr_shmem_entry) bytes starting from that
address.

If the shared memory region spans a domain boundary, accesses beyond
the first byte could violate domain isolation, allowing S-mode to
read or write M-mode memory through DBTR operations.

Replace the single-address check with sbi_domain_check_addr_range()
to validate the entire shared memory region that DBTR operations
will use.

Fixes: 23b7badeee3c ("lib: sbi: check incoming dbtr shmem address")
Signed-off-by: liutong <liutong@iscas.ac.cn>
---

Previously sent as [PATCH v2].
Changes in v2:
- Added Fixes tag
- Consolidated into patch series

 lib/sbi/sbi_dbtr.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 5cca0922..b0f1019d 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -304,9 +304,10 @@ int sbi_dbtr_setup_shmem(const struct sbi_domain *dom, unsigned long smode,
 	if (shmem_phys_hi)
 		return SBI_EINVALID_ADDR;
 
-	if (dom && !sbi_domain_check_addr(dom,
-		  DBTR_SHMEM_MAKE_PHYS(shmem_phys_hi, shmem_phys_lo), smode,
-		  SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
+	if (dom && !sbi_domain_check_addr_range(dom,
+		  DBTR_SHMEM_MAKE_PHYS(shmem_phys_hi, shmem_phys_lo),
+		  hart_state->total_trigs * sizeof(union sbi_dbtr_shmem_entry),
+		  smode, SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
 		return SBI_ERR_INVALID_ADDRESS;
 
 	hart_state->shmem.phys_lo = shmem_phys_lo;
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
