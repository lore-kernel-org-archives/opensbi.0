Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F532C982DE
	for <opensbi@archiver.kernel.org>; Mon, 21 Sep 2026 08:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c6LcqCA0rhVe4tJXaZUihwWCI1ZQfStHxDU0IDIVxtY=; b=JOWT11NRCwpSGE
	Idwrq53MQP0qIvI7ImJWOjh6EFpjL3M2C4rtr+3xjS+w4nX64q3ve2EphySz/4algg394qTY0xIMt
	UwWSYSSVmqGUHDk+ZRof6CMmaaCaB2NNLNC02YjfqRLDjED4WAw6koMSy5kgXNM2tQkoy3KFCzc0s
	wA5RuRcQ5+cjkYZUZ+gqo4xB/cKRbOgJ5dzitlRVEu/ziK+KkFp4Kdwch13zMBLerreHYTZWIquHW
	B/yPqG5JEhKF/CXuAMbHzvN3dq1JecjUi0ezmztRNJ5m1ctMKT8DHsgZYsvM6PNZgU1eSEd22Q9Q0
	OaXMsYgT02dNNruu8ApA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Z4R-00000001IwT-0fPx;
	Mon, 21 Sep 2026 08:08:15 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Z4O-00000001Ivi-3D16
	for opensbi@lists.infradead.org;
	Mon, 21 Sep 2026 08:08:14 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowADnTzro5bBqAH3WCA--.3970S2;
	Mon, 21 Sep 2026 16:08:08 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: himanshu.chauhan@oss.qualcomm.com,
	anup@brainfault.org,
	liutong <liutong@iscas.ac.cn>
Subject: Re: [PATCH v3 0/3] lib: sbi: fix shared memory double-fetch in DBTR and SSE
Date: Mon, 21 Sep 2026 08:08:08 +0000
Message-Id: <20260921080808.2865944-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <arC6_NukHKk_mH4U@hu-himchau-blr.qualcomm.com>
References: <20260910052958.3365324-1-liutong@iscas.ac.cn> <arC6_NukHKk_mH4U@hu-himchau-blr.qualcomm.com>
MIME-Version: 1.0
X-CM-TRANSID: zQCowADnTzro5bBqAH3WCA--.3970S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZw4xAw1UZFW3XFW3tr15CFg_yoW5WF18pr
	WYgas8Kr4kJFykC3WxAw40kayxAws2yay3J398KryDAa45Jw1jvFyfGr1YqFyfGF4DXw1Y
	vr40q3WDtF4UJaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0E
	wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbhSdDUUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_010813_182416_7358BBF6 
X-CRM114-Status: GOOD (  13.70  )
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

Hi Himanshu,

On Sun, Sep 20, 2026 at 10:05:00PM -0700, Himanshu Chauhan wrote:
> Secondly, even if there is a CPU running rogue code, cannot bring down
> the system. The triggers programmed may be bad. But again, its a
> S-mode bug.

Fair question, and I wasn't sure of the answer myself, so I measured it.
QEMU 11.1.0-rc3, -M virt -smp 2 -cpu rv64,debug=on, MTTCG, OpenSBI
3593a5fa. Hart 0 installs an mcontrol6 EXEC|S trigger with M clear;
hart 1 rewrites the same tdata1 to M=1.

Read back via TRIGGER_READ, i.e. csr_read(CSR_TDATA1):

  0x6000000000000054      type=mcontrol6, M=1, S=1, EXEC=1

  3593a5fa                : hit in 3 rounds
  3593a5fa + this series  : no hit in 20000 rounds

Submitted honestly, the same value returns SBI_ERR_INVALID_PARAM.

With tdata2 aimed at sbi_ecall_handler, the next SBI call gives:

  sbi_trap_error: hart0: trap1: trap redirect failed (error -2)
  sbi_trap_error: hart0: trap1: mcause=0x0000000000000003 mtval=0x0000000080014382
  sbi_trap_error: hart0: trap1: mepc=0x0000000080014382 mstatus=0x8000000a00007800

mcause=3 with MPP=3, so it fired in M-mode. An M-mode trap can't be
redirected, so it ends in sbi_trap_error() and sbi_hart_hang(). The
nested context below it is the DBTR ecall itself. Aimed at the trap
vector instead, the hart goes silent with no diagnostic at all: the
breakpoint sits on the vector, so every entry re-triggers it. An
honestly installed M=0 trigger at the same address survives 2000 SBI
calls untouched.

You're right that it isn't a machine kill - the trigger CSRs are
per-hart and the other hart kept running throughout. But the calling
hart ends on OpenSBI's own unrecoverable path and S-mode can't recover
it, which is what makes me hesitant to call it an S-mode bug.

On fixing it in S-mode: I may be misreading what you have in mind. The
only S-mode-side fix I can see is for S-mode to keep other harts off
the buffer while the call is in flight. That works if S-mode is merely
buggy, but the case this series is about is a deliberate one, and an
S-mode that is attacking M-mode will not adopt that discipline. So I
can't see how to close it from that side, which is why I went looking
at the M-mode side instead.

Which turns the whole thing into one question: is DBTR's validation
meant to hold against an S-mode that is deliberately attacking, or only
to catch an S-mode that is buggy? That's the one part I can't settle by
testing, so I'd rather have your answer on it.

Separately: while testing this I found sbi_dbtr_update_trig() never
calls dbtr_trigger_valid() at all. S-mode can install a benign trigger,
then set the M bit on it with TRIGGER_UPDATE - one hart, no race, both
calls returning err=0, and the bit is live in CSR_TDATA1 afterwards.
That is independent of this series and I'll send it separately.

PoC is ~200 lines, I can post it.

Regards,
liutong


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
