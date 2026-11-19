Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42F9606A324
	for <opensbi@archiver.kernel.org>; Thu, 19 Nov 2026 15:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=THEu5e8d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ew1sGDCaQ8cxH8rfLGnj1aC889c2VRSI1mNaWiAR+Uc=; b=THEu5e8dVQn8Ayms4ajIDSLlkA
	5aQ+rTBR3DzkTzR1wypVqCapWde62En0QMledXCnrD+DeEo1yE1T3Wy6voxUBBuj7JMvUo2nRPw3J
	xhm3Czgp1iyFIDS5XgDhIh4XEBYJcvIFUAIJFLK8IzLEXmh5+UB5QdibeOnJeMZUwXcgaQvAfmqk8
	O854Ui2JNL8kPFoaFYDQyxY2keihvwMNjMR8QzHNrSdsCAdcfYygWIyqOI9GeIt0sITODZoZ6CqA2
	HiPIwzH6IPjpvr1g47/a/dkNECd9c6xjxhQUCK+vcLSKUVDtJM0adH1y1gR+4nc80+UMFgeGA35HH
	+thlwOlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4U2-0000000CYEv-3kJs;
	Thu, 19 Nov 2026 15:55:34 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4Tz-0000000CYBw-1h8v
	for opensbi@lists.infradead.org;
	Thu, 19 Nov 2026 15:55:34 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAAXtLntG_9qqWB5AQ--.937S2;
	Thu, 19 Nov 2026 23:55:25 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	himanshu.chauhan@oss.qualcomm.com,
	sebasjosue84@gmail.com,
	liutong <liutong@iscas.ac.cn>
Subject: [PATCH 0/2] lib: sbi: fix two hart hangs reachable through the temporary PMP mapping
Date: Thu, 19 Nov 2026 15:55:09 +0000
Message-Id: <20261119155511.1204901-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAXtLntG_9qqWB5AQ--.937S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw4xAryDWF1DurWUZry3CFg_yoW8uw1fpF
	15GFs8Gr4kKryI9343tw18t3Z5Aay8Aa4DGr47t34Sy3y8Zr1IvrWFgry0kw4Utr1xt3W7
	Ka18Ja4xGa45ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26F4UJVW0owAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
	Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUFzVbDU
	UUU
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_075531_824902_9E4C6E83 
X-CRM114-Status: UNSURE (   7.11  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On a build with Smepmp, supervisor software can stop a hart for good
with a single ecall, in two different ways.

sbi_hart_smepmp_temp_map_range() rounds a request up to a NAPOT block,
aligned down, and programs it into PMP entry 0 with the shared-data
encoding, which grants execute permission to no mode. Entry 0 has the
highest priority, so a block that reaches the firmware takes M-mode's
execute permission on its own text away. mtvec is in that text, so the
trap entry faults too and nothing is printed.

The backend also declines when no block fits at all, and no caller
looks at the return value, so the access goes ahead regardless and
faults the same way.

Patch 1 makes the 13 call sites check. Patch 2 rejects a block that
reaches outside the range the caller validated. Each is needed:
neither alone fixes both paths, and in that order every commit is safe
to stop at.

Patch 1 is the check described here:

  https://lore.kernel.org/opensbi/20261012022033.1165060-1-sebasjosue84@gmail.com/

Measured on qemu virt, -m 1G, -smp 1, fw_jump, over 61f1973b, with
sbi_debug_console_write():

  num_bytes=0x200001 base=0x80200000, block rounds to
  [0x80000000, 0x807fffff]
    before            no output, hart gone, killed at 90s
    patch 1 only      no output, hart gone
    both              SBI_ERR_INVALID_PARAM

  num_bytes=2^63, no block fits
    before            no output, hart gone
    patch 1 only      SBI_ERR_INVALID_PARAM
    both              SBI_ERR_INVALID_PARAM

  num_bytes=0x200001 base=0x80400000, block misses the firmware
    2 MB written, unchanged

  -cpu rv64, no Smepmp, no temporary mapping is programmed
    2 MB written, unchanged

Built for generic RV64 and RV32.

liutong (2):
  lib: sbi: check the result of sbi_hart_protection_temp_map_range()
  lib: sbi: pmp: do not grant a NAPOT block outside the caller's range

 lib/sbi/sbi_dbtr.c       | 18 +++++++++++++-----
 lib/sbi/sbi_ecall_dbcn.c |  3 ++-
 lib/sbi/sbi_hart_pmp.c   | 19 +++++++++++++++++--
 lib/sbi/sbi_mpxy.c       | 24 ++++++++++++++++++------
 lib/sbi/sbi_pmu.c        |  3 ++-
 lib/sbi/sbi_sse.c        | 10 ++++++++--
 6 files changed, 60 insertions(+), 17 deletions(-)


base-commit: 61f1973bd50338b36c52dc34006f76d464ca4f34
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
