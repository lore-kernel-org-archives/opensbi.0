Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECC0C982E1
	for <opensbi@archiver.kernel.org>; Mon, 21 Sep 2026 09:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lEmR/GJwkkKdf+u4UWeZtAmbzkC6JTjlR7Sl9ezdHS4=; b=wQk2SL2kFvcrfH
	0rfXCRCIbxH9STIOI/zPqATCBp7I/dUN5oBHPcKbD0Wz6hbIxcgt1s9acb3diDckK4Pa1ZQGuo8R0
	QuF16Q4tvV0saOmv+UI2/y5gpl473qOojAdIk/IcASPcN2svkeaAEfoiYJmU5JIEiL3wrG2WGfJqb
	m25ZYueBE5Yrbc99Q4ePoiJtz4tCAIJBPX7ROkUbC5GJav3KIFvj8ipSbALkffHXLy691iera/Y3w
	/rmTKQpr4/zN7+N94IiSipqDMLhDxsbm3yejsKiUElbF2wZbA/KmIxVLwaz9zLJKWvL1tryB7YKLF
	vq+1PZfGy68AxE0ncxoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8aCF-00000001UGU-1mlK;
	Mon, 21 Sep 2026 09:20:23 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8aCD-00000001UFx-0ucb
	for opensbi@lists.infradead.org;
	Mon, 21 Sep 2026 09:20:22 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowABHTjzR9rBqqRdGCA--.4127S2;
	Mon, 21 Sep 2026 17:20:17 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: npiggin@gmail.com,
	pengpeng@iscas.ac.cn,
	himanshu.chauhan@oss.qualcomm.com,
	liutong <liutong@iscas.ac.cn>
Subject: Re: [PATCH 07/18] dbtr: Check for invalid and unsupported triggers in update
Date: Mon, 21 Sep 2026 09:20:17 +0000
Message-Id: <20260921092017.2916971-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313051948.4017134-8-npiggin@gmail.com>
References: <20260313051948.4017134-1-npiggin@gmail.com> <20260313051948.4017134-8-npiggin@gmail.com>
MIME-Version: 1.0
X-CM-TRANSID: rQCowABHTjzR9rBqqRdGCA--.4127S2
X-Coremail-Antispam: 1UD129KBjvJXoWrZw13KrWktw18Cr1DKr15Arb_yoW8JrW8pr
	yrGFyfGFWkJr4fArZ7urW0va17X3ykAa17XFZ8AFWjk3y5ur10vrnrXw4fCFWrKrs5X34F
	9r1jvr1jkrs8ZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
	Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU5uc_DU
	UUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_022021_645584_2D2D505E 
X-CRM114-Status: UNSURE (   5.96  )
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

Hi Nick,

I hit this independently while auditing DBTR, six months after you -
sorry for not finding your series sooner.

It's still open on current master (5a175017). sbi_dbtr_update_trig()
never calls dbtr_trigger_valid(), so S-mode can install a trigger that
passes install's check and then set mcontrol6.M on it via
TRIGGER_UPDATE. QEMU, single hart, no race:

  install benign (M=0)  : err=0, CSR_TDATA1 = 0x6000000000000014
  update to M=1         : err=0, CSR_TDATA1 = 0x6000000000000054

Pointed at an address OpenSBI executes, the next ecall takes an M-mode
breakpoint, which can't be redirected, and ends in sbi_hart_hang().

Are you planning to resend, either the series or 07/18 alone?

Also, your 01/18 and 18/18 are being re-done piecemeal without the
correction between them. Pengpeng Hou's "validate complete shared
memory range" adds the same install_trig check as your 01/18 -
trig_count >= hs->total_trigs, SBI_ERR_BAD_RANGE - and has a
Reviewed-by; my own v3 1/3 copied that form to avoid conflicting with
it. Neither carries your 18/18 fix, and the effect is measurable: with
total_trigs = 2, install(2) is rejected, so only total_trigs - 1 can be
installed per call. Any news on riscv-sbi-doc#257?

Regards,
liutong


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
