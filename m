Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F529F41998
	for <opensbi@archiver.kernel.org>; Wed, 15 Apr 2026 12:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WM6RpZOachq1CSdLAEFAdwPDrYp7Gca75xo7LEwI/t4=; b=SidDSWnCs5Ramh
	LV58Q4h1aI1cwPbrqrWqZigvV8CzIG9+aKnIcj9nSKvukfoCH+GRk5q6S5hLM9KUmmu6NcJPw6tb7
	Jr5UBPiVmvx37SXP/sCcM/Kfhl75clGkMP1gMAX3L2cIQgViJpOY+pIEbzK4kItdtfNpuh4FxMdY0
	WaCvbwuHUHUkt2d1K1AD9g6342kbbfQSKFvznIHfNBG6t3X2oZ7dej7d0NPMTG3m0RsDY54w5+vqr
	djq8gjMU+j91v9BI2DyslC/mzFc/TLqBDV2EUygWFaLMPzDRyU3ULEEAav2DMCrdUS7e2b+S/EBY8
	hKlaJvnc7JmGJ3vPV9WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCzVT-000000018F8-33EB;
	Wed, 15 Apr 2026 12:38:11 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCzVQ-000000018Do-27RS;
	Wed, 15 Apr 2026 12:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1776256684; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=IuRIdB05XOvFlg+W6dwU8jnLRNwetfEuTnQThR5If4M=;
	b=K2Fa2ji8wIi9478pTCLGumeeTC2cuX+QO0wZnwqDtVpjc6D4AxaluURKLeURwWPouxyuDWQAir1A4gIgOco1bDw0cOT0feQ9qRfsxiG3RQ53Vsjp2PT2Gu8tWI+7nhTEajJksGKc/HI/lmQKIDFqeAJxGH6xPRZHLSkRYduQNz0=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0X14hhr6_1776256677;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X14hhr6_1776256677 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 15 Apr 2026 20:38:01 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: wangruikang@iscas.ac.cn
Cc: pjw@kernel.org,
	anup@brainfault.org,
	andrew.jones@oss.qualcomm.com,
	guoren@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	opensbi@lists.infradead.org
Subject: Re: [PATCH v2] riscv: smp: Align secondary_start_sbi to 4 bytes
Date: Wed, 15 Apr 2026 20:37:57 +0800
Message-ID: <20260415123757.123581-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <83397314-c7f3-4122-9587-80c29b1d13aa@iscas.ac.cn>
References: <83397314-c7f3-4122-9587-80c29b1d13aa@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_053808_752559_0829FE51 
X-CRM114-Status: GOOD (  23.53  )
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

On Wed, 15 Apr 2026 11:39:22 +0800, wangruikang@iscas.ac.cn wrote:

> > During SMP boot, the secondary_start_sbi address is passed to the
> > slave core via sbi_hsm_hart_start. In OpenSBI, this address is
> > written to STVEC in sbi_hart_switch_mode.
> 
> This is certainly odd (OpenSBI git blames to initial git commit. No idea
> why this was needed.) but technically permitted by the SBI HSM spec (see
> below).
> 
> * Anup and other opensbi folks: Do you know/remember why it was there?
> It's not really a bug, but some historical context would be appreciated.

Yes, looking forward to responses from Anup and other opensbi folks.

> > According to the privileged specification, the BASE field of STVEC
> > must always be aligned on a 4-byte boundary. However, System.map
> > reveals that secondary_start_sbi is not a 4-byte aligned address.
> >
> > For example, the address of secondary_start_sbi is
> > 0xffffffff80001066, and the disassembly is as follows:
> >
> > Dump of assembler code from 0xffffffff80001052 to 0xffffffff8000107a:
> >    0xffffffff80001052 <_start+4178>:    c.nop   -11
> >    0xffffffff80001054 <_start+4180>:    auipc   gp,0x1a1f
> >    0xffffffff80001058 <_start+4184>:    addi    gp,gp,84
> >    0xffffffff8000105c <_start+4188>:    csrw    satp,a2
> >    0xffffffff80001060 <_start+4192>:    sfence.vma
> >    0xffffffff80001064 <_start+4196>:    ret
> >    0xffffffff80001066 <_start+4198>:    csrw    sie,zero
> >    0xffffffff8000106a <_start+4202>:    csrw    sip,zero
> >    0xffffffff8000106e <_start+4206>:    li      t0,2
> >    0xffffffff80001070 <_start+4208>:    csrw    scounteren,t0
> >    0xffffffff80001074 <_start+4212>:    auipc   gp,0x1a1f
> >    0xffffffff80001078 <_start+4216>:    addi    gp,gp,52
> >
> > When writing to STVEC at address 0xffffffff80001066, the actual
> > write address is 0xffffffff80001064, corresponding to the address
> > of the previous ret instruction.
> Also technically permitted.

Yes, but this is unintended behavior, and we should avoid it.

> > This is unexpected, and if an
> > interrupt occurs at this point, it will cause unpredictable results.
> >
> > However, secondary_start_sbi immediately masks all interrupts and
> > updates STVEC, so no problems occurred.
> 
> An interrupt cannot trap in between secondary_start_sbi starting and the
> interrupts getting masked individually. The only arch state guaranteed
> by HSM is [1]:
> 
> |Register Name | Register Value
> |satp          | 0
> |sstatus.SIE   | 0
> |a0            | hartid
> |a1            | `opaque` parameter
> |All other registers remain in an undefined state.
> 
> Of which sstatus.SIE = 0 means that interrupts are masked in Supervisor
> mode.
> > In summary, it is more reasonable to make secondary_start_sbi
> > satisfy 4-byte alignment.
> 
> Thus, it is unnecessary.
> 
> If this fixes a bug where an interrupt can trap into the wrong stvec for
> you, then your firmware is broken.

This isn't about fixing a bug (as mentioned earlier, it's highly unlikely
to happen), but rather the STVEC check mechanism added to QEMU discovered
this issue. Regarding the problem itself, I would appreciate any clarification
or modifications from OpenSBI, but currently this modification is the simplest
and most feasible.

> Michael's suggestion about SYM_CODE_START still stands, but if you do
> that, that's just a really minor refactoring, and in any case the
> current commit message cannot stand.
> 
> Vivian "dramforever" Wang
> 
> [1]:
> https://github.com/riscv-non-isa/riscv-sbi-doc/blob/v3.0/src/ext-hsm.adoc#function-hart-start-fid-0

Thanks,
Pei

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
