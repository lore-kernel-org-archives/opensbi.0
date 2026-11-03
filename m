Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5E3606A32E
	for <opensbi@archiver.kernel.org>; Tue,  3 Nov 2026 08:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4PdACfGd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8ViZac3C5Y6hsfDy9vaOLCLftugeJwKKe58UKWhWdZk=; b=4PdACfGd5sgH1b35Rz8qedyoJ0
	3rH5zyc9nydZEyD+2byj+OR6jBwVBR1n/PCsO3kjlsgSuc4mHoEofjr92dX0KJFgZkcclBtq5HIxX
	izltPeWciiC6a4YRwBXfkAvDPD5L+O/Ie7u/7BzC2+qbxU/B/36USZ/IhVQ6uLSmDXq2koAu+ygJ8
	h50zfSxmc9Ikqj7uYZnuDyerZBckhnvI7eXt9NUJGYjlMwMDp3PVUPktP8DFo/0qgCzf7y6MP+AlV
	WjSkgrd/eEB2Z99rOKkg31nOiq1gU3HX+L+cbpIByiBgLrcGw6kRWZPMLdI3dc0raLfQ+QbtZ4fTk
	H6McTPdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9bP-00000001Uuv-36t3;
	Tue, 03 Nov 2026 08:10:43 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9bC-00000001Uo9-19yd
	for opensbi@lists.infradead.org;
	Tue, 03 Nov 2026 08:10:40 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowACneZrzlulq_EI6AA--.4344S2;
	Tue, 03 Nov 2026 16:10:27 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: himanshu.chauhan@oss.qualcomm.com,
	anup@brainfault.org,
	liutong <liutong@iscas.ac.cn>
Subject: Re: [PATCH v3 0/3] lib: sbi: fix shared memory double-fetch in DBTR and SSE
Date: Tue,  3 Nov 2026 08:10:16 +0000
Message-Id: <20261103081016.2948072-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <arIXYQCyjvgZX1jM@hu-himchau-blr.qualcomm.com>
References: <20260910052958.3365324-1-liutong@iscas.ac.cn> <arC6_NukHKk_mH4U@hu-himchau-blr.qualcomm.com> <20260921080808.2865944-1-liutong@iscas.ac.cn> <arIXYQCyjvgZX1jM@hu-himchau-blr.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: rQCowACneZrzlulq_EI6AA--.4344S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFyfJw48Xr4DtrWrKw18AFb_yoW8Gw17pa
	y093W7AFsrK3ySyrZ7J3y0g3yDCws5Ary5Xrn8W3yjy345Wry0kr9Iga1DuFZ8urn3WrWj
	qr4YqrWfZF4DAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUym14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Cr1j6rxdMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUumhrUUUUU=
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_001038_078850_68F09F3B 
X-CRM114-Status: GOOD (  12.29  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Himanshu,

You asked for the patch that fails if M=1 is being set. Sent as
"lib: sbi: dbtr: validate trigger configuration in update_trig":

  https://lore.kernel.org/opensbi/20261103081001.2948003-1-liutong@iscas.ac.cn/

It covers update only. install_trig still runs dbtr_trigger_valid() on
one read of the entry and programs a later one, so the escalation is
still reachable there; the commit message says so rather than leaving
it to be assumed. I have a tested patch for that which moves the check
into dbtr_trigger_setup(), where the value is actually stored, so one
check covers both paths. It restructures install_trig, and after your
note about churn I did not want to fold it into this patch or send it
unasked. Say the word and I will.

On the rest of your mail. Validation and allocation in one pass with
installation in another is what that second patch does, and rollback
there is just the free, since nothing before the install pass writes a
CSR - you were right that clearing CSRs was the wrong shape for it.

The one I could not reconcile is restoring prior triggers to their
original values on failure. On update that needs the old tdata1/2/3
kept for the whole batch, which is the per-entry array you objected to
in the first place. I did not want to pick one of your comments over
the other silently. My own preference is to leave update's batch
behaviour as it is today, but it is your call.

Regards,
liutong


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
