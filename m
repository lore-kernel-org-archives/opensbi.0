Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6FD606A31B
	for <opensbi@archiver.kernel.org>; Thu,  5 Nov 2026 01:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uBifHxI1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gH0CfrXKIDCicSi1gaRFh1IOb7yLUAl83tV+Y2ZdvmA=; b=uBifHxI1FeKX3B+EpYqXx6L+QC
	24hHc6H+lsXtqcsYAvxVVKtdUc6lrzVYTG6YuTok6o+WZb9cIpFFTOG0W/M4KSb0vSf7wKPUh8AF8
	FMwIMb//O9Us2lboAB3+7oR9INj8UXk+OuHZeybeqojrRmXJLM1z9CDO5NkaOvLFCRQuMhp1/HR28
	QRxDbsgCVUcr7L4khHhRzfT3Iv7AdZr3EvGcpk7yKoF18rrmLFedbtca6lMbv7ebvJDCnbaaWAN+r
	zL2Rry4F108taIZtjeOqbOXH9z3rfEzt6109PAbPXh3EGjD3C8CeiaeeU4fySaNyHki7lVWjVeJX2
	OYezDxNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOmSk-00000007Uvm-0ePh;
	Thu, 05 Nov 2026 01:40:22 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOmSg-00000007UvK-0trV
	for opensbi@lists.infradead.org;
	Thu, 05 Nov 2026 01:40:21 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowABX8rd63utqetVVAA--.14237S2;
	Thu, 05 Nov 2026 09:40:10 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: cleger@rivosinc.com,
	himanshu.chauhan@oss.qualcomm.com,
	anup@brainfault.org
Subject: [PATCH] lib: sbi: sse: fix shared memory double-fetch in sse_write_attrs
Date: Thu,  5 Nov 2026 01:39:58 +0000
Message-Id: <20261105013958.32686-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: zQCowABX8rd63utqetVVAA--.14237S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuF1xCw1DtFW5uF1ruFWktFb_yoWrJr43pF
	97KF9xKrZ5tayxtr9xAw48X3Zxu3yxJ3yaqF9IyF18ZF45AF1xu343t34jvr1Utr97AFWa
	vayqqFy5ZFWDZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUySb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr1j6F
	4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
	6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07bYpBfUUUUU=
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_174018_638661_CD63093B 
X-CRM114-Status: GOOD (  16.82  )
X-Spam-Score: -1.9 (-)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

sse_write_attrs() reads the attribute values from the S-mode shared
memory in two passes: first to validate them, then to apply them.
S-mode may write the shared memory between the passes, so a value that
sse_event_set_attr_check() would have rejected can still be applied.
For SBI_SSE_ATTR_PREFERRED_HART this leaves e->hartindex derived from
a hart id that sse_event_set_hart_id_check() refused, which
sbi_sse_enable() then resolves to a NULL scratch.

Copy the attributes into a local array, unmap the shared memory right
away, and run both passes against that copy.

The copy is a fixed size stack array. Its bound is currently guaranteed
by sbi_sse_attr_check() in the only caller. Check attr_count here as
well, so that the bound of the array does not depend on validation done
in another function.

Fixes: c8cdf01d8f3a ("lib: sbi: Add support for Supervisor Software Events extension")
Suggested-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Signed-off-by: liutong <liutong@iscas.ac.cn>
---
Resent on its own from "[PATCH v3 0/3] lib: sbi: fix shared memory
double-fetch in DBTR and SSE":

  https://lore.kernel.org/opensbi/20260910052958.3365324-4-liutong@iscas.ac.cn/

Himanshu NAKed that series on a debug trigger argument. This one is a
different subsystem, so I would rather it be judged on its own; if the
NAK was meant to cover it too, say so and I will drop it.

The attribute that matters is PREFERRED_HART: winning the race stores a
hart id that sse_event_set_hart_id_check() refused, e->hartindex becomes
-1U, and sbi_sse_enable() then dereferences a NULL scratch. Measured on
f6abdaf2 under QEMU MTTCG, -smp 2: unpatched, won in 6 rounds, and
SSE_ENABLE then takes an M-mode load access fault (mcause=0x5,
mtval=0x540); patched, 20000 rounds with no win.

Unchanged from v3 apart from the commit message, which overstated the
bound check: it covers attr_count only.
 lib/sbi/sbi_sse.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index 767ea128..b3d35d65 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -1049,25 +1049,40 @@ static int sse_write_attrs(struct sbi_sse_event *e, uint32_t base_attr_id,
 	unsigned long attr = 0, val;
 	uint32_t id, end_id = base_attr_id + attr_count;
 	unsigned long *attrs = (unsigned long *)input_phys;
+	unsigned long local_attrs[SBI_SSE_ATTR_MAX];
+
+	/*
+	 * sbi_sse_attr_check() in the only caller already rejects a larger
+	 * count, but local_attrs is a fixed size stack array, so do not
+	 * rely on that for its bound.
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
 

base-commit: f6abdaf25dfe0608277fc634f3927c1f184ede6d
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
