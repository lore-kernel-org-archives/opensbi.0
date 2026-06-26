Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D29CCDE008
	for <opensbi@archiver.kernel.org>; Fri, 26 Jun 2026 03:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vaXUzzxwQio3HWJ8GYdcE2JQ1UWU+WNG4yGzihGI9d8=; b=trr3q+eecWH5/W
	Mc1ej4r87/axo5mFgxTkEBE9nxQkEg1pGwTQupUnnDmp05a6ifgySu/nMfNzc1XrKXgE3j5xMOEvx
	g6XqCaFHRUp5ckRWxuinAGEAuxJtE4yY5gkTNcu0JXUxPVVr7kkSkYAmyfZzzy9COsRRecteZrDxG
	CW72qkNa5i3SsW18ljPhWNwZAXnv2HZkhkNtcPAq6nCws9BZ9oPcFZXLwQDf5VSEbMC4mwHt9/iQK
	JEoYDtaWgFJ0M1yNLVWXAvkFtk+TTRjGHUkh/bF88swR9ZGd8kv7VaDx95kHRgAuyaiRNOyHryw/j
	JTJzgJed0ZdJm3UC+Faw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcx4Q-0000000AMlo-2K5g;
	Fri, 26 Jun 2026 03:17:34 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcx4M-0000000AMkl-2vQp
	for opensbi@lists.infradead.org;
	Fri, 26 Jun 2026 03:17:33 +0000
Received: from [10.213.6.93] (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAC3k5pF7z1qtMDiFQ--.15390S2;
	Fri, 26 Jun 2026 11:17:25 +0800 (CST)
Message-ID: <48d12280-5260-4f05-87d0-324ccde0f8d0@iscas.ac.cn>
Date: Fri, 26 Jun 2026 11:17:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] lib: sbi: ISA extension emulation (Zvbb).
To: Benedikt Freisen <b.freisen@gmx.net>, opensbi@lists.infradead.org
References: <20251227121802.15703-1-b.freisen@gmx.net>
 <20251227121802.15703-4-b.freisen@gmx.net>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20251227121802.15703-4-b.freisen@gmx.net>
X-CM-TRANSID: rQCowAC3k5pF7z1qtMDiFQ--.15390S2
X-Coremail-Antispam: 1UD129KBjvJXoWrtF4rJw4DAw4xXw4xuFW5GFg_yoW8JF18pF
	ZrA3WrKFZ2qFyUKas8ta15tayIkw48Wr1Uuw1DJw1Fyrs8Ca4FgF4jgrWjvrs3ury0kr4U
	tw4qvay8urW5u3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkvb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8Jr0_Cr
	1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjcxG6xCI17CEII8vrVW3JVW8
	Jr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07bbBT5UUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_201731_140895_422A118C 
X-CRM114-Status: UNSURE (   9.19  )
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

Hi Benedikt,

We discovered another subtle problem while testing Zvbb emulation:

On 12/27/25 20:18, Benedikt Freisen wrote:
> Add trap-based emulation code for the ISA extension Zvbb based on RVV 1.0 and Zbb.
>
> Signed-off-by: Benedikt Freisen <b.freisen@gmx.net>
> ---
>
> [...]
>
> diff --git a/lib/sbi/sbi_insn_emu_v.c b/lib/sbi/sbi_insn_emu_v.c
> new file mode 100644
> index 00000000..483b0ee6
> --- /dev/null
> +++ b/lib/sbi/sbi_insn_emu_v.c
>
> [...]
>
> +
> +int sbi_insn_emu_op_v(ulong insn, struct sbi_trap_regs *regs)
> +{
>
>
> [...]
>
> +
> +	regs->mepc += 4;
> +
> +	return 0;
> +}
> +

sbi_insn_emu_op_v does not set xstatus.VS to dirty, which has a chance
to break context switching and cause vector register state to be broken.
Something like SET_VS_DIRTY from [1] is needed before returning:

#define SET_VS_DIRTY(regs) do {				\
	if (sbi_regs_from_virt(regs))			\
		csr_set(CSR_VSSTATUS, MSTATUS_VS);	\
	regs->mstatus |= MSTATUS_VS;			\
} while(0)

It seems unlikely that upstream OpenSBI would accept these emulation
patches, but I'm reporting this for the sake of anyone potentially
running into this.

Thanks,
Vivian "dramforever" Wang

[1]: https://lore.kernel.org/opensbi/20260609060024.706-5-ganboing@gmail.com/


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
