Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3BC606A31E
	for <opensbi@archiver.kernel.org>; Tue, 24 Nov 2026 15:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zcU/VBGO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=EZnV/MXK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2aUSN3hr75oHpSElmXfGO0itvXRT6NDK0ngCkhs8xzc=; b=zcU/VBGOEYXKS6TGoY7w9pk9BK
	85SckDOYB/G0D0m4fYwr+PJOHUWhGKL/0g/o3TfAklIR23mHoDGQomllEaGWzJz41R25T/SVidUnB
	79cMXYZNrVBCuf/KZMpzQp1fNOo+SZY65S1BetKO9s4bHtdJ6zRGxUzyCVG5SuZ2frIIgA9L3WsQ7
	7O3B08Evw9rrTdTiR+Deij+xmssBHIZ/Lb70IKbr+v0b8idzZvrlGp3IXpPdKA+Ipq6SecChxm9hr
	OlVgFeEReTfFMDs3XWZjqBaoOGlIOxlvIpSfSMDijp03a8d5/3XE1w2EtOxI2e45Ox4bOLuGgR3KR
	g6VvK0Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsu3-0000000721O-3Oi4;
	Tue, 24 Nov 2026 15:57:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVssg-000000070if-0UAE
	for opensbi@bombadil.infradead.org;
	Tue, 24 Nov 2026 15:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=3UM19eHJiObzPNRO69x4zGA0makC2zHNwvxRNSa667A=; b=EZnV/MXKc+VtSbDKhQr+hZrLCz
	szXWbNPDq0sydMYR1THko7+QMNLFD7EBk2l6MSaLDZO6sore2kfqD0QtoQ2imcMinLvoCatN9jWKb
	tJlQfD22zL2rj313V0Y2788rtWfxoGlzoqoC7amT4SXqksm6r4ClZR0n07qAeQgk6DJl5ao9cEZMw
	SLefKKTg/8BVzHlSEizMsFgjmXr7uAFqfZO1BsZ8THM95eZvj0VTUwIYf0dB5eGwC80CeNfYlJGc1
	lQOIHyOrj5rtVxEn85DWCXVKjVGfmBP5QTJxsPHLSlNbMfxgJ3uCDxCjUf3QhA3dDCBNlHhOts/6m
	32O8fxUA==;
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVssb-00000004IuI-2OuG
	for opensbi@lists.infradead.org;
	Tue, 24 Nov 2026 15:56:28 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAB3ELaeswVr2g3YAQ--.6799S2;
	Tue, 24 Nov 2026 23:56:14 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: heinrich.schuchardt@canonical.com
Cc: himanshu.chauhan@oss.qualcomm.com,
	atishp@atishpatra.org,
	anup@brainfault.org,
	opensbi@lists.infradead.org,
	liutong <liutong@iscas.ac.cn>
Subject: Re: [PATCH 5/7] lib: sbi: dbtr: keep type and chain of a trigger in UPDATE
Date: Tue, 24 Nov 2026 15:55:59 +0000
Message-Id: <20261124155559.3260535-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261120231119.90214-6-heinrich.schuchardt@canonical.com>
References: <20261120231119.90214-1-heinrich.schuchardt@canonical.com> <20261120231119.90214-6-heinrich.schuchardt@canonical.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAB3ELaeswVr2g3YAQ--.6799S2
X-Coremail-Antispam: 1UD129KBjvJXoW7XryxXr4UKFyDAr4kZr45GFg_yoW8JryDpr
	Z5GF17G3yvqr4Ivr4IyF1UtFyrAr4fAr13K3WDur1Fv34jg3s3Kry7WayS9FW09rZaqr1U
	Aa1YqrZ8Ja15ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVWxJr0_GcWlOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUXID7UUU
	UU=
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_155626_028201_C9267D30 
X-CRM114-Status: UNSURE (   6.52  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.0 (/)
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

On 11/21/26 00:11, Heinrich Schuchardt wrote:
> +		if (type != TDATA1_GET_TYPE(trig->tdata1) ||
> +		    dbtr_tdata1_chain(tdata1) !=
> +			    dbtr_tdata1_chain(trig->tdata1))

trig->tdata1 holds two different things. dbtr_trigger_setup() stores the
value the caller supplied; sbi_dbtr_read_trig() replaces it with the CSR
read-back:

	lib/sbi/sbi_dbtr.c:666
	trig->tdata1 = csr_read(CSR_TDATA1);

So the chain comparison depends on whether READ_TRIGGERS was called in
between. On QEMU that flips the result. type6_mcontrol6_validate() in
target/riscv/tcg/debug.c never writes the chain bit back, and
dbtr_trigger_valid() only rejects dmode and m, so chain=1 installs:

  install chain=1, update chain=0
	reference chain=1, rejected, although the CSR already has chain=0

  install chain=1, READ_TRIGGERS, update chain=0
	reference chain=0, accepted, although it differs from the install

The same update gets opposite answers and the discriminator is an
unrelated earlier call. The type comparison is not affected: a type that
passed type_mask survives the write back.

A field that read_trig does not touch would fix it. My update_trig v2
omits the chain check for the same reason and needs the same field.

liutong


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
