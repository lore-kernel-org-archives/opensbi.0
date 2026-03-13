Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6E1105F7AE
	for <opensbi@archiver.kernel.org>; Fri, 13 Mar 2026 13:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e1PU5dlFtB05uNRgCLggaE9tMf6NkW0hHA6AtJPsD1M=; b=xfp7LFteIRY3Py
	8ZcttQIQMVgT0z+C1WzE8GFmy/r+iU5rHrt2vD77P9EkYp7/uh8WYsSigMUJ3oM8iwr9I3Gijq9Pq
	aWWCqS45mkdvZaEf8NOeLRho3+LwCQxEQwxTsLQH6kc3Y3muFnhlE89nrafKITrQhk9VRZ0bMLqJw
	VgcX8Gg7kjOxjROHvNcQTzZNShRJwhR59xtQdUeHtKYUdR6zNzPjN5EkNqVUu68hxYpInN8lGnpw5
	h2yH+fApa8IayLcOUVrHfFUlrYUTHXVEEXWcBPa7adoYy/IP5oVvUbMq6qlxv65xKMomOTOo78JAD
	lQ3zwpBa22TXP49sJWwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12kB-00000000IXg-0Adg;
	Fri, 13 Mar 2026 13:39:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12kA-00000000IW0-0BbB
	for opensbi@bombadil.infradead.org;
	Fri, 13 Mar 2026 13:39:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PvVumowxSMWW+yQK1Ca2tkCSNxvPNYttoNKLdxakZZ0=; b=Oo2X0OKqU/q41gWGnUK3SSnPz0
	4eXRJeGxAL1hY+NTlMUr2dES1lM6DH3RVQsdk81u34qtI+p0mP3cZ7QVCTWZPUZsRJxAt/o+dXCRr
	vdyHmsXQ5b1m2OnQJXFum2h+5Pmd75QTRNUafT9QMOss9MX1PZTBMIWetfmtC2e1VGmh1rmOwgb4D
	dV/ykQ/AWKVgkoHVjHuIAQljvc6zXO3Dq74YrGBUzPYqvndQNWa55Q4VENAy8hGLlJVAv8ztcx3Jz
	FuNnx2HmYQ1JCOCcFdda+cWmgcoMMnOPA0Rhig1DA1w7h3VyrJqmfTyOMaqmv+YN0nmRc6AcIl34U
	FI/twG1A==;
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12k1-00000003PpH-3XVx
	for opensbi@lists.infradead.org;
	Fri, 13 Mar 2026 13:39:56 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-2bea246f55aso614472eec.1
        for <opensbi@lists.infradead.org>; Fri, 13 Mar 2026 06:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773409186; x=1774013986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvVumowxSMWW+yQK1Ca2tkCSNxvPNYttoNKLdxakZZ0=;
        b=J03Pp3gdfuGilfrhv1MY9iMOUz/qaXGcEBzY7DUGteTfmdbs4Kwn1kg7bQRFhqmNZw
         WIJUdcxcRpVKuz3Izu3Zg+KJVCoilWhL81IdlfhbJ9ASFvqzmM5xdQr4WNAniFBXbuhf
         X4FqnnvMJLZ3Ggg8QOChim9LVh+pQts0z21MoIZeDeO1L6QSVo1boSPtmkikdE8YGmQz
         imD5FVTkGweF7DXw4K6wXghRjJIRQuk9b0EFdt5VDyzXReoLXeJVtHPhb1eHb6g0gNhP
         ostp/7+1dbZvaSpBOuIPVRpldinLLl2Gi7ynBcySHXynQendRrMyBkyJ79uDNAkF4URl
         y0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773409186; x=1774013986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PvVumowxSMWW+yQK1Ca2tkCSNxvPNYttoNKLdxakZZ0=;
        b=E64wjvzwVNIq8ZaKXK7O+xN/XGrcAVXIz547n5zwsjyC2A4zEAOpb3hs7Mg5FcXHDd
         ll4qm6faCuzbGAQPi8MslcalrvY0LS7Ir5TVO7dkJCPLHrx3iixmi9CibwK89biM3GjP
         x7/Zmh0WDFwZQDMl532whVSv58q42TAiI4ZbhzyNeHenmNSFgyLcU5d8+OOoQp5ihUFy
         HD6ALBdMKXroSdeDHf14nB/FyL4Cd8CbJi78ruO1tMftAPrxc3Kq5vsM9M3zajA9Kajf
         SSyOphLri+Yc+k1CaOTw4YThOuMiIJH2kf/1+uKnJaQJEM4HK0uuu+03XwyPDf1K+C3U
         K7fQ==
X-Gm-Message-State: AOJu0YxEd0QCiBzMtwl7qL03AuwCwnN75MKuYiGtNo5Emvzfp2ig3db2
	QdEUfw1Ysxb6mJjqBwynjg7Q4Tpi2U3hsub4BHFUds394aPYoX21yzdREQ4q1CLv/7XIy3hjdMf
	vfZqg/M6UwpVd/vRhUHqeMsBDl6WlfRBPXa0HY8D2eE3qiRbmXZcu6wAPtmaKk3fUxGx8VCKkxK
	4Z6jsnh9w7z73TOstzX55uEsthOCDAfjQg8QxThSk26MDBcas33j7J
X-Gm-Gg: ATEYQzwjusOgJ+muH52f5C6/bijferkql4NXs6tJtEnJEecM5p9O3xkQkZUG1TvNQuS
	g42dndvrv7JwE7/Df6k8D8wezxec0nh6RRqdSLPv7YvkNYmOhLLNLiH5wE4z0Dhw3H6RqaXqY8K
	w+BC6u6F9yTtLparSbaGPkiWoX6rHxlkcX4hbpeN5oG/cmBTr5ldLVulIsFtoc6Ajrzfdrn9R3B
	vXTSVWXa4D8Ls1vIOVKMjMITv+6mNETV9tW5s1dLm1tVSRv70x1GFsjVPG5v7JyeZatmghV3v4u
	RCVhomGxKOfoWVKb6n4UXLGIcbRXwVfmjfnhXJiZy3MmRSC4UXIvfpRoUEgmKg4dp6WlkHZ3FA4
	OfYipksmpnQQ2JfBzUxED+f1gV1zbxqFMMsa1HuUr/f3Pj+S0jrLywgNT/hj6MIRoHy7WrIWpzt
	fbX+r9+hCW8sepIylaejI8CksHawwbfvINKaDr6wY=
X-Received: by 2002:a05:7301:128d:b0:2be:88f2:3c98 with SMTP id 5a478bee46e88-2bea539d852mr1334515eec.1.1773409185591;
        Fri, 13 Mar 2026 06:39:45 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab57b1d2sm2441671eec.32.2026.03.13.06.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:39:45 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	nick.hu@sifive.com,
	samuel.holland@sifive.com,
	yongxuan.wang@sifive.com,
	anup@brainfault.org,
	rkrcmar@qti.qualcomm.com,
	atishp@rivosinc.com,
	Nylon Chen <nylon.chen@sifive.com>
Subject: [PATCH v4 3/3] firmware: fw_base.S: Add common NMI trap handler
Date: Fri, 13 Mar 2026 06:39:41 -0700
Message-ID: <20260313133941.3012966-4-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260313133941.3012966-1-nylon.chen@sifive.com>
References: <20260313133941.3012966-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_133953_219488_9A8ED415 
X-CRM114-Status: GOOD (  20.78  )
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

Implement the firmware-level RNMI entry point and complete the RNMI
initialization:

fw_base.S - sbi_rnmi_vector assembly entry:
  Mirrors the existing _trap_handler pattern.  MNSCRATCH holds the
  per-hart scratch pointer (set by rnmi_vector_init), so the entry
  sequence is structurally identical to _trap_handler:

    csrrw sp, MNSCRATCH, sp      ; sp=scratch_ptr, MNSCRATCH=original_sp
    REG_S t0, TMP0(sp)           ; stash t0 in scratch tmp0 slot
    check MNSTATUS.MNPP          ; same bit layout as MSTATUS.MPP

  S/U-mode interrupted:
    frame allocated below scratch area (same as _trap_handler_s_mode)

  M-mode interrupted:
    frame allocated on the existing M-mode stack so no separate RNMI
    stack is required (same as _trap_handler_m_mode)

  After saving all registers, MNEPC/MNSTATUS are saved into the
  standard sbi_trap_regs mepc/mstatus fields so the C handler can
  inspect them with the same accessors used for normal traps.

  The handler is called as:
    sbi_rnmi_trap_handler(regs, mncause)

  On return registers are restored and mnret is executed.  The mnret
  opcode is emitted as a raw .word (0x70200073) because older toolchain
  versions do not recognise the mnemonic.

sbi_trap.c - sbi_rnmi_trap_handler default implementation:
  Prints mnepc, mncause, and mnstatus, then hangs the hart.  This is
  the correct behaviour for an unexpected NMI; a platform that can
  actually handle and resume from an NMI should override this function.

sbi_trap.h - declarations for sbi_rnmi_vector and sbi_rnmi_trap_handler.

sbi_hart.c - complete rnmi_vector_init():
  Adds the platform set_rnmi_trap_vector() call and MNSTATUS.NMIE
  enablement that were deferred from the previous patch.

Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Suggested-by: Nick Hu <nick.hu@sifive.com>
Suggested-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 firmware/fw_base.S     | 141 +++++++++++++++++++++++++++++++++++++++++
 include/sbi/sbi_trap.h |  22 ++++++-
 lib/sbi/sbi_hart.c     |  34 ++++++++--
 lib/sbi/sbi_trap.c     |  17 +++++
 4 files changed, 208 insertions(+), 6 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index bce9e226..641f314a 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -643,6 +643,147 @@ memcmp:
 	REG_L	a0, SBI_TRAP_REGS_OFFSET(a0)(a0)
 .endm
 
+/* Smrnmi mnret instruction encoding (0x70200073) */
+.macro MNRET
+	.word 0x70200073
+.endm
+
+	.align 4
+	.section .entry, "ax", %progbits
+	.globl sbi_rnmi_vector
+sbi_rnmi_vector:
+	/* Swap SP with MNSCRATCH. After: sp=scratch_ptr, MNSCRATCH=original_sp */
+	csrrw	sp, CSR_MNSCRATCH, sp
+
+	/* Save T0 in scratch tmp0 slot */
+	REG_S	t0, SBI_SCRATCH_TMP0_OFFSET(sp)
+
+	/* Check MNSTATUS.MNPP to determine interrupted privilege mode */
+	csrr	t0, CSR_MNSTATUS
+	srl	t0, t0, MSTATUS_MPP_SHIFT
+	and	t0, t0, PRV_M
+	xori	t0, t0, PRV_M
+	beq	t0, zero, _sbi_rnmi_m_mode
+
+	/* Interrupted S/U-mode: use scratch area as exception stack */
+_sbi_rnmi_s_mode:
+	/* Load original SP from MNSCRATCH into T0 */
+	csrr	t0, CSR_MNSCRATCH
+	/* Restore MNSCRATCH = scratch_ptr for future RNMI entries */
+	csrw	CSR_MNSCRATCH, sp
+	/* Allocate exception frame just below scratch area */
+	addi	sp, sp, -(SBI_TRAP_REGS_SIZE)
+	j	_sbi_rnmi_save_regs
+
+	/* Interrupted M-mode: reuse existing M-mode stack */
+_sbi_rnmi_m_mode:
+	/* Load original SP from MNSCRATCH into T0 */
+	csrr	t0, CSR_MNSCRATCH
+	/* Restore MNSCRATCH = scratch_ptr for future RNMI entries */
+	csrw	CSR_MNSCRATCH, sp
+	/* Allocate exception frame on the existing M-mode stack */
+	addi	sp, t0, -(SBI_TRAP_REGS_SIZE)
+
+_sbi_rnmi_save_regs:
+	/* sp = exception frame, t0 = original SP, MNSCRATCH = scratch_ptr */
+
+	/* Save original SP (from T0) */
+	REG_S	t0, SBI_TRAP_REGS_OFFSET(sp)(sp)
+
+	/* Reload saved T0 from scratch tmp0, then save to exception frame */
+	csrr	t0, CSR_MNSCRATCH
+	REG_L	t0, SBI_SCRATCH_TMP0_OFFSET(t0)
+	REG_S	t0, SBI_TRAP_REGS_OFFSET(t0)(sp)
+
+	/* Save all general registers except SP and T0 (already saved) */
+	REG_S	zero, SBI_TRAP_REGS_OFFSET(zero)(sp)
+	REG_S	ra,   SBI_TRAP_REGS_OFFSET(ra)(sp)
+	REG_S	gp,   SBI_TRAP_REGS_OFFSET(gp)(sp)
+	REG_S	tp,   SBI_TRAP_REGS_OFFSET(tp)(sp)
+	REG_S	t1,   SBI_TRAP_REGS_OFFSET(t1)(sp)
+	REG_S	t2,   SBI_TRAP_REGS_OFFSET(t2)(sp)
+	REG_S	s0,   SBI_TRAP_REGS_OFFSET(s0)(sp)
+	REG_S	s1,   SBI_TRAP_REGS_OFFSET(s1)(sp)
+	REG_S	a0,   SBI_TRAP_REGS_OFFSET(a0)(sp)
+	REG_S	a1,   SBI_TRAP_REGS_OFFSET(a1)(sp)
+	REG_S	a2,   SBI_TRAP_REGS_OFFSET(a2)(sp)
+	REG_S	a3,   SBI_TRAP_REGS_OFFSET(a3)(sp)
+	REG_S	a4,   SBI_TRAP_REGS_OFFSET(a4)(sp)
+	REG_S	a5,   SBI_TRAP_REGS_OFFSET(a5)(sp)
+	REG_S	a6,   SBI_TRAP_REGS_OFFSET(a6)(sp)
+	REG_S	a7,   SBI_TRAP_REGS_OFFSET(a7)(sp)
+	REG_S	s2,   SBI_TRAP_REGS_OFFSET(s2)(sp)
+	REG_S	s3,   SBI_TRAP_REGS_OFFSET(s3)(sp)
+	REG_S	s4,   SBI_TRAP_REGS_OFFSET(s4)(sp)
+	REG_S	s5,   SBI_TRAP_REGS_OFFSET(s5)(sp)
+	REG_S	s6,   SBI_TRAP_REGS_OFFSET(s6)(sp)
+	REG_S	s7,   SBI_TRAP_REGS_OFFSET(s7)(sp)
+	REG_S	s8,   SBI_TRAP_REGS_OFFSET(s8)(sp)
+	REG_S	s9,   SBI_TRAP_REGS_OFFSET(s9)(sp)
+	REG_S	s10,  SBI_TRAP_REGS_OFFSET(s10)(sp)
+	REG_S	s11,  SBI_TRAP_REGS_OFFSET(s11)(sp)
+	REG_S	t3,   SBI_TRAP_REGS_OFFSET(t3)(sp)
+	REG_S	t4,   SBI_TRAP_REGS_OFFSET(t4)(sp)
+	REG_S	t5,   SBI_TRAP_REGS_OFFSET(t5)(sp)
+	REG_S	t6,   SBI_TRAP_REGS_OFFSET(t6)(sp)
+
+	/* Save MNEPC into regs->mepc, MNSTATUS into regs->mstatus */
+	csrr	t0, CSR_MNEPC
+	REG_S	t0, SBI_TRAP_REGS_OFFSET(mepc)(sp)
+	csrr	t0, CSR_MNSTATUS
+	REG_S	t0, SBI_TRAP_REGS_OFFSET(mstatus)(sp)
+
+	/* Call C RNMI handler: a0=regs, a1=mncause */
+	add	a0, sp, zero
+	csrr	a1, CSR_MNCAUSE
+	call	sbi_rnmi_trap_handler
+
+	/* Restore MNEPC and MNSTATUS from exception frame */
+	REG_L	t0, SBI_TRAP_REGS_OFFSET(mepc)(sp)
+	csrw	CSR_MNEPC, t0
+	REG_L	t0, SBI_TRAP_REGS_OFFSET(mstatus)(sp)
+	csrw	CSR_MNSTATUS, t0
+
+	/* Restore all general registers except SP and T0 */
+	REG_L	ra,  SBI_TRAP_REGS_OFFSET(ra)(sp)
+	REG_L	gp,  SBI_TRAP_REGS_OFFSET(gp)(sp)
+	REG_L	tp,  SBI_TRAP_REGS_OFFSET(tp)(sp)
+	REG_L	t1,  SBI_TRAP_REGS_OFFSET(t1)(sp)
+	REG_L	t2,  SBI_TRAP_REGS_OFFSET(t2)(sp)
+	REG_L	s0,  SBI_TRAP_REGS_OFFSET(s0)(sp)
+	REG_L	s1,  SBI_TRAP_REGS_OFFSET(s1)(sp)
+	REG_L	a0,  SBI_TRAP_REGS_OFFSET(a0)(sp)
+	REG_L	a1,  SBI_TRAP_REGS_OFFSET(a1)(sp)
+	REG_L	a2,  SBI_TRAP_REGS_OFFSET(a2)(sp)
+	REG_L	a3,  SBI_TRAP_REGS_OFFSET(a3)(sp)
+	REG_L	a4,  SBI_TRAP_REGS_OFFSET(a4)(sp)
+	REG_L	a5,  SBI_TRAP_REGS_OFFSET(a5)(sp)
+	REG_L	a6,  SBI_TRAP_REGS_OFFSET(a6)(sp)
+	REG_L	a7,  SBI_TRAP_REGS_OFFSET(a7)(sp)
+	REG_L	s2,  SBI_TRAP_REGS_OFFSET(s2)(sp)
+	REG_L	s3,  SBI_TRAP_REGS_OFFSET(s3)(sp)
+	REG_L	s4,  SBI_TRAP_REGS_OFFSET(s4)(sp)
+	REG_L	s5,  SBI_TRAP_REGS_OFFSET(s5)(sp)
+	REG_L	s6,  SBI_TRAP_REGS_OFFSET(s6)(sp)
+	REG_L	s7,  SBI_TRAP_REGS_OFFSET(s7)(sp)
+	REG_L	s8,  SBI_TRAP_REGS_OFFSET(s8)(sp)
+	REG_L	s9,  SBI_TRAP_REGS_OFFSET(s9)(sp)
+	REG_L	s10, SBI_TRAP_REGS_OFFSET(s10)(sp)
+	REG_L	s11, SBI_TRAP_REGS_OFFSET(s11)(sp)
+	REG_L	t3,  SBI_TRAP_REGS_OFFSET(t3)(sp)
+	REG_L	t4,  SBI_TRAP_REGS_OFFSET(t4)(sp)
+	REG_L	t5,  SBI_TRAP_REGS_OFFSET(t5)(sp)
+	REG_L	t6,  SBI_TRAP_REGS_OFFSET(t6)(sp)
+
+	/* Restore T0 */
+	REG_L	t0, SBI_TRAP_REGS_OFFSET(t0)(sp)
+
+	/* Restore SP */
+	REG_L	sp, SBI_TRAP_REGS_OFFSET(sp)(sp)
+
+	/* Return from RNMI */
+	MNRET
+
 	.section .entry, "ax", %progbits
 	.align 3
 	.globl _trap_handler
diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h
index 731a0c98..6a56e64e 100644
--- a/include/sbi/sbi_trap.h
+++ b/include/sbi/sbi_trap.h
@@ -289,6 +289,24 @@ static inline void sbi_trap_set_context(struct sbi_scratch *scratch,
 
 struct sbi_trap_context *sbi_trap_handler(struct sbi_trap_context *tcntx);
 
-#endif
+/**
+ * Common firmware RNMI trap handler entry in M-mode.
+ *
+ * Platforms program their RNMI trap vector to this address using the
+ * set_rnmi_trap_vector platform operation.
+ */
+void sbi_rnmi_vector(void);
 
-#endif
+/**
+ * Default RNMI trap handler called from sbi_rnmi_vector.
+ *
+ * This is the default handler for Resumable Non-Maskable Interrupts (RNMI).
+ * It prints diagnostic information and hangs the hart. Platforms that can
+ * handle and resume from an NMI should override this function.
+ */
+void __attribute__((weak)) sbi_rnmi_trap_handler(struct sbi_trap_regs *regs,
+						  unsigned long mncause);
+
+#endif /* !__ASSEMBLER__ */
+
+#endif /* __SBI_TRAP_H__ */
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index eca6662f..519d29a0 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -766,21 +766,47 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
 	return rnmi_vector_init(scratch, cold_boot);
 }
 
+/* Forward declaration for the RNMI vector entry point in fw_base.S */
+extern void sbi_rnmi_vector(void);
+
 static int rnmi_vector_init(struct sbi_scratch *scratch, bool cold_boot)
 {
+	int ret;
+	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
+	const struct sbi_platform_operations *ops =
+		plat ? sbi_platform_ops(plat) : NULL;
+
 	/* If the hart does not support Smrnmi then nothing to do. */
 	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMRNMI))
 		return 0;
 
+	/* Platform MUST provide RNMI vector hook if hart supports Smrnmi. */
+	if (!ops || !ops->set_rnmi_trap_vector) {
+		sbi_printf("%s: platform does not support Smrnmi\n", __func__);
+		return SBI_ENOTSUPP;
+	}
+
 	/*
 	 * Set MNSCRATCH to the scratch pointer (same role as MSCRATCH).
-	 * The RNMI handler (to be added in the next patch) will check
-	 * MNSTATUS.MNPP to determine whether to use the scratch area
-	 * (S/U-mode interrupted) or reuse the existing M-mode stack
-	 * (M-mode interrupted).
+	 * The RNMI handler swaps SP/MNSCRATCH on entry, detects the
+	 * interrupted mode via MNSTATUS.MNPP, and then either reuses the
+	 * existing M-mode stack (M-mode interrupted) or uses the scratch
+	 * area as a stack base (S/U-mode interrupted) -- mirroring what
+	 * _trap_handler already does for nested M-mode traps.
 	 */
 	csr_write(CSR_MNSCRATCH, (unsigned long)scratch);
 
+	/* Ask the platform to program the RNMI trap vector. */
+	ret = ops->set_rnmi_trap_vector((unsigned long)sbi_rnmi_vector,
+					cold_boot);
+	if (ret == SBI_ENODEV)
+		return 0;
+	if (ret)
+		return ret;
+
+	/* Enable RNMI now that MNSCRATCH and the trap vector are set up. */
+	csr_set(CSR_MNSTATUS, MNSTATUS_NMIE);
+
 	return 0;
 }
 
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index f41db4d1..38be122a 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -375,3 +375,20 @@ trap_done:
 	sbi_trap_set_context(scratch, tcntx->prev_context);
 	return tcntx;
 }
+
+/**
+ * Default RNMI trap handler.
+ *
+ * This is the default handler for Resumable Non-Maskable Interrupts (RNMI).
+ * It is invoked directly from the firmware RNMI entry (rnmi_handler)
+ * and prints diagnostic information before hanging the hart.
+ */
+void __attribute__((weak)) sbi_rnmi_trap_handler(struct sbi_trap_regs *regs,
+						  unsigned long mncause)
+{
+	sbi_printf("mnepc    = 0x%" PRILX "\n", regs->mepc);
+	sbi_printf("mncause  = 0x%" PRILX "\n", mncause);
+	sbi_printf("mnstatus = 0x%" PRILX "\n", regs->mstatus);
+
+	sbi_hart_hang();
+}
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
