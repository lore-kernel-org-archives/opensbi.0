Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BA0C88E41
	for <opensbi@archiver.kernel.org>; Fri, 11 Sep 2026 03:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rXmD3GDymbeFCHs3KX6mnpDI0lFJuW6KiGXsyekEYrE=; b=e7MqatdBpR61ng
	NSHC7vjfejouIVGl5wiPCAtBGGnw1iCjmE3npd1M7GGO4uAJglBajEyM3NWM1wAp6/OT0C+U48q6Y
	yxpxccg94zRiXGnGQPp5aitRziwv784FeTzaiUhdwckC9Gon12LBRvZ/iNtO7KA+bF5Rr1Bw7XFNf
	hbPn8ZxfFiBjELlo3JZKYzMspst+nwOBMfSTXn+cfxfRzidDy5MR1SaMOPpQoMJ0cO1WIwSJ0FHPT
	DFL08JpVCRK9sqlPEPd07xpOo9M1bewYCJKImFx/0cZxEx/8AjaEyy+xAQLyQr0lpdgdB3N9VPMjp
	m9s2bdvT+AYtsb4L/0PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4sCF-0000000FnNC-3w6r;
	Fri, 11 Sep 2026 03:45:03 +0000
Received: from mail-vs2-x10.google.com ([2a00:1450:4864:3a::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4sCC-0000000FnM2-3rcp
	for opensbi@lists.infradead.org;
	Fri, 11 Sep 2026 03:45:02 +0000
Received: by mail-vs2-x10.google.com with SMTP id 71dfb90a1353d-5c656140de2so34050e0c.3
        for <opensbi@lists.infradead.org>; Thu, 10 Sep 2026 20:45:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789098299; cv=none;
        d=google.com; s=arc-20260327;
        b=kL8eEMYf1NGNv8orNX4kLiKW9B6Vvs/UJRwJQnZX8iS8XviUAwcQJ82VQSSXN/60iq
         9UlVPZgEYvLB+RrqfXayr6oV7wuxTrBZv1rb4m8JzW+k8vYBb766nxAEk/5dK6IBQuQU
         vWq9tb7oS1/WOqrJ4XDcwAQ5flc/pqZOFh/NJx6EdCkFG/aTFlcR96eBhpErFtwxZ4lM
         N7R6vSnr7PiyDrYp/VLv5ydZO59Y7rO3fSKz0L+ADYqal8jdjpr+YI4HTywB9olF9E2i
         hNkmaNRfZ7pDi6ttLCDUdq9EwZIWaisku6IF3g7tbcu7RacoLbVsqJL2/qJ2P0uaLbOP
         aaqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=7Obin5ozv6iR1uXS8QY+2DNZQFgJw1gAe8aAbU/5d2s=;
        fh=x1PrYqfMpP0CxF1iOQUdoQwcom88LBmeviiuKRrnMMM=;
        b=nhJhpjkUdJgnr+yAb9DXDFB7HwnloI49aq0v1F2sT+OlmBKi926fqMi/qNJgXOmWPK
         L2vRXoXZCgXyR7wwW/HrjbuEuHtgtifxPLCm7FsV1Ovm7EIxULAWwL/wvf0gkS9Sltk4
         wrI9JjgwEi1VygxSKOivAKYHuTyUAChhPC+f7v+r8MRaWxx3Ikz+iVQlAbAV4q/+nhYr
         C8WxvWPL9jcFW4x95FFrYH2L0XDaE8va/hfsf12p5ZgQmwArqSEj9rD/Cyb0j1pr212+
         v8JhuBNxR91oSs4VhTeJMAJtWCwjTmK+SDGZonY9mCLLCohOMADpAi4i1Om2cdTxg67K
         k8SA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789098299; x=1789703099; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Obin5ozv6iR1uXS8QY+2DNZQFgJw1gAe8aAbU/5d2s=;
        b=lvNspowpI+GU1QvxUc7CGk/CR/XUN9/a2SsooogRzq7VY5YKBf/0vtqtAI56Nz/6vp
         +hUhQURuYyuzQ1hbnzLDyzsOxvilF3eKLB7Q+sWYrUsafc+T6/OVd+lOaMMDBa/g4wLa
         n86291xZPEbRmmevSbMCvyBvdmxd1KIrrhkyeIiSFqy+gVG1d9VrdZfxGTtL193uabRD
         pfxqYRLnwkfctQDcAJzZxdMCsFZDc+/Apd6B+9y4lK9iKJCn7qGSw3j+IrZt1i3ydR2/
         kuWUyRB2A1eMUKrgEF1urf44r4Cczd6gmOXtrGJF4kyOBxZ0iRZ/HPAFIXtbEUP7RG1L
         yagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789098299; x=1789703099;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7Obin5ozv6iR1uXS8QY+2DNZQFgJw1gAe8aAbU/5d2s=;
        b=HItcpxTIkK8ju3AWlBxGHu9uJGMFd0wQNp8LmkOaA+ezHrZWZLM7Ux2Aww4YTP92Ve
         zfJ1AA+FU8Spdqa2ALCkD15/Hu/hfiEIFcz/JFORjJhN2gam2BuFFLVcubgfwKXfZASX
         nw7INzbCJw1Dgkg1BtPKqhH4rT7hm7PWL6ed4Lstk4tPpHLR/WXsLh49sozuCfV7V+VE
         pqTB0v7l5dGnngcy9Jof534sILDSRl24Ui9/JKDQ1Ray+SGZhHEfbO64GOaeql8KY3Y1
         WAQ9FtNx9zqQ6bl3BW2+6QPJg24JavMQ6nv0WfnSdJTAuuMF0SJzJdibLdoVL/bDx2+2
         1M1g==
X-Gm-Message-State: AFuF++nl8GXpGXBViM8tP5Ir4EVvv7NgxTY1PHO0HBP3697i/zGEJaBd
	GC4gQjogJzaZMzgpasfIYQx79eL4M17L8FE1zrakKse+BhTy3XFWdCSiXegyVXmRjaDW6B0BDph
	1GELMBcTTEB0ftXleZdVGjPAH4PYtvMlD3KRRW515JMTY
X-Gm-Gg: AYBFou3bN2PyXYpAl1GW5Z4myvdnDuA3z2udL04ioPQdpjvdNES/ldMR1xXqidOsokg
	W5se5NzH9Z4t33oL7WuIrJ5rP+400D7pHp5099dGkERoebupunczF8E3Az+IwtFbr1qzzFwPuV4
	Xl+8ium6orROLiF3Uczxs3jiqp429azjMn4vBDm6ZN9aKrW5eY6NV2WqJMwb0ozUHFnwDinabST
	kY7x19XkLkjwETQz7SbCxWqfeumhO0Wzrz7aGKvI3qKHjhTdTxEsJ3Y0vgTZkFeqhSZLXRc02Rp
	suPnvx41DrL8BpXvrfWZyqJF88cTCdrNqQlistrfn/JZXYGT+V5z6go=
X-Received: by 2002:a05:6102:1625:b0:784:a169:1925 with SMTP id
 ada2fe7eead31-792a7d0c331mr820374137.2.1789098299173; Thu, 10 Sep 2026
 20:44:59 -0700 (PDT)
MIME-Version: 1.0
From: Alex Mao <alexcoder2022@gmail.com>
Date: Fri, 11 Sep 2026 11:44:48 +0800
X-Gm-Features: AcwNN1WNaKv9lBRZAzcbQchaqkkYy0lbn-d5tCNL0h_SBP_YYhK3NP3EyJEc1vA
Message-ID: <CAFw68FX=ASi-aR30eDJOd2CgiDB1r7tp81xQaNu5FXWpu_i6Sg@mail.gmail.com>
Subject: Re: [Question] Possible tlb_sync hang when remote SFENCE.VMA races
 with HSM hart_stop
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org, bin.yao@ingenic.com
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_204500_972084_05F47DB9 
X-CRM114-Status: GOOD (  12.11  )
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

Hi Anup, Bin,

On Fri, Jul 3, 2026 at 5:03 AM Anup Patel <anup@brainfault.org> wrote:
> My suggestion is to call sbi_ipi_process() just before
> sbi_platform_early_exit() in sbi_exit(). This way the HART which is
> being stopped will process the pending IPIs before going down.

Thanks, I tried that on current master (3593a5f) with QEMU virt
(-M virt -smp 4 -m 256M, qemu-system-riscv64 9.1.1).

A small S-mode payload starts a neighbor hart, asks it to HART_STOP,
and immediately issues sbi_remote_sfence_vma to that hart. There is
no extra delay in sbi_ipi_send_many(). Local debug prints were added
only to show the enqueue and the tlb_sync stall; they are not in
upstream.

On unmodified master, iter 0 returns and the victim is already
STOPPED. iter 1 hangs:

  REPRO: HSM-stop x RFENCE tlb_sync race boot=0 victim=1
  iter 0
  RFENCE returned err=0
  victim status=1
  iter 1
  tlb_update: enqueue to hart1 in state 1
  HANG: tlb_sync stuck on hart0 count=1

state 1 is SBI_HSM_STATE_STOPPED. The sender still snapshots the
victim as interruptible, then enqueues and increments tlb_sync after
the victim has finished sbi_exit().

With only the suggested sbi_ipi_process() before
sbi_platform_early_exit(), the same command and payload still hang
at iter 1 with the same enqueue-to-STOPPED line.

The extra drain helps when an IPI is already pending. In this run
the enqueue happens after the last drain. sbi_ipi_exit() already
calls sbi_ipi_process() later in sbi_exit(), so moving that call
earlier does not close this window.

Skipping a target that can no longer process IPIs looks acceptable
for RFENCE: a stopped hart will not return to the old S-mode page
tables, and the next HART_START is a new context. I can send an RFC
that serializes the interruptible check with enqueue on the stop
path, if that direction sounds right.

Happy to adjust the approach if you would rather keep the send path
unchanged and only tighten the stop/drain side.

Thanks,
Mao Weiming

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
