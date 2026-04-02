Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253D81112240
	for <opensbi@archiver.kernel.org>; Wed,  1 Apr 2026 23:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RdpjfQEu4M1hXa5AT17TbZL+/oQNdBTmNE3EFJ3+1Hw=; b=A+WzgzCqxj/uAz
	UGm/Gy2OrcyU9AZRq2tb7g1ry/wTAdv7fq3lXeqGMYZRuC45JQXWbyJkEtX28dhXbxG27HW8UOnWV
	Ntr5dSIxGLPD9wtzYbuo0NIkQvDDj5v/UoXDl5ecc1IiCdrLTIw2yTZahsz7QAa8EpZMh+EWJEbD8
	Wr1T8ylviyHMIp1itLYKmxU3cM6G0TieY0FhXYovshYJtM/1w82wRuOewLSuZEm04ZrW8ijSSz9ub
	DhR52UMXvalWpG61/GBw5iP3R4GTIU9bvjkJxCeSlNGz1515HKf/r+HofkCApSTr2SmrlWP2RoYnE
	iB2w58bQhjoGBpUNLsiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w85Qi-0000000GSuN-1584;
	Wed, 01 Apr 2026 23:57:00 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w85Qf-0000000GStQ-14WJ
	for opensbi@lists.infradead.org;
	Wed, 01 Apr 2026 23:56:58 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-1271257ae53so394550c88.1
        for <opensbi@lists.infradead.org>; Wed, 01 Apr 2026 16:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775087815; x=1775692615; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NATVv9ODaDzBca0UK8yV2auFTRsa0gCOISbI4d+bz7M=;
        b=jXqiVgToMsgURH/MhJxgpeFT+OsnCYCr3H/AwjilLHO25L05DEBIV9i8lOea4qjuhp
         egN1Z88rod/1iZIqEhW4yizbxrqm4B4kzuGUhEzytKBsaydmpEW6Dh+v37eLf9vOCj+6
         l/6holuCC46T2iBATn5IZDUt+3FYojK+XGRbmnmwq7f6rNZMXx7I+JbN6bVecBz4tv3T
         OtqeX3LcRN2WOCZFwV1NXXcqlU4cKfn26YYzIPlmjVgCSGU68nE3KtkB1b4Xhy5pe23z
         hR0cmwOAhp4mjwtGZ9tr7xYqmn4GOZtlorR9sP1rni/zTmuUwAIE4Rwj91/If6z0FMMb
         +gMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775087815; x=1775692615;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NATVv9ODaDzBca0UK8yV2auFTRsa0gCOISbI4d+bz7M=;
        b=KN4/3BFcXmLO3xZE5SG1T9tZ/W2CfmlTB2itvVlvVhKPR3Rk7BbRH5izwX3L9szAcI
         lQ3CZU+ZdmjkwPXCnU9qakg82XYX/f8n+d6sLnri97Pg2uuN/7C5HcFZewoAb2PMi/vE
         DUG+oQeIaYe08Dhew+BYa7KFWtLujqy6Crx2kmFKy2/GEOl0l906QQbUO4fAu/1GrDS5
         gwLIiGYvpskvIPsliV6GJlvPuj6z7L9kCSkRlpm4lpbnU+zDNoKZ8jTcs0PdwZXlhNct
         invDnH2rt9rBHzaKWS8hZmmg2Nyy9bsK4QI28WRBGhBSJOg0SjOxqmKkQvL/2aWjU/Kq
         6PAg==
X-Gm-Message-State: AOJu0Yw8kOIC00xvqoMspCGfAbCerJ5DV6z3bTou27miei1swPlfXDS0
	jQ756IjBPVa8T7LICeTSWsnFLeJcGdQDXoFFx5FJZedgrK2zT5uSvFzllL6JxQ==
X-Gm-Gg: ATEYQzz7hax81QV2LLq8d7XXDTOPTkQEpPYtZepC/Yp02XqkNfazM2Cox6w0EsAFQaQ
	vffWNT1VunYmccUex/GniWnoSG3/0dgvm9bp5wj0l9OxmBUd1leZTwepxhMzq8+n8WAtLtKkLpH
	j7L+1KNm1ahXMx6SL0d4Ha/wWYRsbw5pRhKaQhHJvnG9Yj//Wdg/BW1lYRsj7vGZmijSoQvc4KJ
	SUI1ch/RGuBzOQlwZyWo7q8CXSDsHHYdVkmsnpWwjvHT7egEH3Wu+bM9cknXIDKUE/f5s5sr5gM
	vmX8Ib08L8cE+XwzMEVEgmxes6Y330AZRmzGHr7+MExhT/DHm/h8voGRodNJzxN9vzRdthR1Fv6
	Q41r+0f9cobVy2pzBnZRfYhh97U6RvKzNHOJI15oz/Jc/4lMLBIaKbxM2EKK4p/ZsQySRRrMBs7
	gvu+8FCu8sMKcHOzuo3emRzVrRRydylg3WAEe73Jb7K8A4C0c=
X-Received: by 2002:a05:7022:fa2:b0:122:345:a944 with SMTP id a92af1059eb24-12be6574886mr2807085c88.29.1775087815183;
        Wed, 01 Apr 2026 16:56:55 -0700 (PDT)
Received: from [172.16.0.242] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede5a225sm1761699c88.9.2026.04.01.16.56.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 16:56:54 -0700 (PDT)
Message-ID: <d1557584-2f42-46e4-b2ae-07a902f3dca8@gmail.com>
Date: Wed, 1 Apr 2026 17:02:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] lib: sbi: Rework load/store emulator instruction
 decoding
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org, dramforever@live.com,
 anup.patel@oss.qualcomm.com
Cc: anup@brainfault.org, cleger@rivosinc.com, samuel.holland@sifive.com
References: <20260210094044.72591-1-ganboing@gmail.com>
 <20260210094044.72591-7-ganboing@gmail.com>
Content-Language: en-US
In-Reply-To: <20260210094044.72591-7-ganboing@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_165657_325765_327E55AC 
X-CRM114-Status: GOOD (  41.05  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

@Anup, any comments on this patch? I can address it together with your
other comments. Thanks.

Bo

On 2/10/26 01:40, Bo Gan wrote:
> Rehaul instruction decoding to fix the following issues:
> 
> - We assume the XLEN of previous mode is the same as MXLEN. However,
>    RVC instructions decodes differently in RV32 and RV64, so shouldn't
>    have assumed that.
> - We assume it's a misaligned fault and the load/store offset is 0,
>    i.e., base address == fault address, but access faults can have
>    non-0 offset (on HW supporting misaligned accesses), so platform
>    specific load/store fault handler gets the wrong base address.
> - No checking of [63:32] of tinst in RV64, which is explicitly
>    required by Privileged ISA 19.6.3. Must reject tinst with non-0
>    high 32 bits.
> 
> Thus, fix all the above. For misaligned load/store fault, the address
> offset is always 0, thus we kill the use of base address, and use trap
> address instead (same as before), which lets the compiler optimize out
> imm parsing and other calculations.
> 
> I also analyzed the behavior of misaligned fault handler before fix.
> With the following conditions met, it can trigger data corruption:
> 
> - HW doesn't transform instruction into tinst.
> - HW doesn't support misaligned load/store, and OS doesn't enable
>    misaligned delegation, thus OpenSBI handler is in effect
> - HW supports mixed XLEN, and M mode is running RV64, and the trapping
>    mode (U/VS/VU) is running RV32.
> - The trapping instruction is c.f{l|s}w(sp).
> 
> Due to the incorrect insn decoding, the trapping instruction would
> mistakenly be decoded as c.{l|s}d(sp). With this fix, c.f{l|s}w(sp)
> in RV32 is now emulated correctly.
> 
> Validation:
> The patch is validated to have fixed the issue with test cases running
> on a modified version of QEMU that exposes misaligned faults [1], and
> a further modified version that removes tinst transformation [2]. The
> S-mode OS is a local build of Debian Trixie 6.12 kernel that enables
> COMPAT (RV32), and the U-mode test application exercises all integer
> and floating-point load/store (RVIFD64/32+RVC64/32) instructions with
> all possible imm values. The patch is also tested on real HW (Sifive
> P550/ESWIN EIC7700), which only supports RV64. On P550, the same test
> was validated both in U mode and VU mode, where the host runs a 6.12
> ESWIN vendor kernel that has some ESWIN SoC device driver patches [3]
> applied, and the guest runs the exact same Debian Trixie 6.12 kernel
> mentioned above.
> 
> [1] https://github.com/ganboing/qemu/tree/ganboing-misalign
> [2] https://github.com/ganboing/qemu/tree/ganboing-misalign-no-tinst
> [3] https://github.com/sifiveinc/riscv-linux/tree/rel/kernel-6.12/hifive-premier-p550
> 
> Fixes: 7219477f7b40 ("lib: Use MTINST CSR in misaligned load/store emulation")
> Fixes: b5ae8e8a650d ("lib: Add misaligned load/store trap handling")
> Fixes: 4c112650bbb0 ("lib: sbi: abstract out insn decoding to unify mem fault handlers")
> Signed-off-by: Bo Gan <ganboing@gmail.com>
> ---
>   lib/sbi/sbi_trap_ldst.c | 427 +++++++++++++++++++++++++++-------------
>   1 file changed, 295 insertions(+), 132 deletions(-)
> 
> diff --git a/lib/sbi/sbi_trap_ldst.c b/lib/sbi/sbi_trap_ldst.c
> index 22c4d5a7..2371abca 100644
> --- a/lib/sbi/sbi_trap_ldst.c
> +++ b/lib/sbi/sbi_trap_ldst.c
> @@ -44,30 +44,34 @@ ulong sbi_misaligned_tinst_fixup(ulong orig_tinst, ulong new_tinst,
>   		return orig_tinst | (addr_offset << SH_RS1);
>   }
>   
> +static inline bool sbi_trap_tinst_valid(ulong tinst)
> +{
> +	/*
> +	 * Bit[0] == 1 implies trapped instruction value is
> +	 * transformed instruction or custom instruction.
> +	 * Also do proper checking per Privileged ISA 19.6.3,
> +	 * and make sure high 32 bits of tinst is 0
> +	 */
> +	return tinst == (uint32_t)tinst && (tinst & 0x1);
> +}
> +
>   static int sbi_trap_emulate_load(struct sbi_trap_context *tcntx,
>   				 sbi_trap_ld_emulator emu)
>   {
>   	const struct sbi_trap_info *orig_trap = &tcntx->trap;
>   	struct sbi_trap_regs *regs = &tcntx->regs;
> -	ulong insn, insn_len;
> +	ulong insn, insn_len, imm = 0, shift = 0, off = 0;
>   	union sbi_ldst_data val = { 0 };
>   	struct sbi_trap_info uptrap;
> -	int rc, fp = 0, shift = 0, len = 0;
> -	bool xform = false;
> -
> -	if (orig_trap->tinst & 0x1) {
> -		/*
> -		 * Bit[0] == 1 implies trapped instruction value is
> -		 * transformed instruction or custom instruction.
> -		 */
> +	bool xform = false, fp = false, c_load = false, c_ldsp = false;
> +	int rc, len = 0, prev_xlen = 0;
> +
> +	if (sbi_trap_tinst_valid(orig_trap->tinst)) {
>   		xform	 = true;
>   		insn	 = orig_trap->tinst | INSN_16BIT_MASK;
>   		insn_len = (orig_trap->tinst & 0x2) ? INSN_LEN(insn) : 2;
>   	} else {
> -		/*
> -		 * Bit[0] == 0 implies trapped instruction value is
> -		 * zero or special value.
> -		 */
> +		/* trapped instruction value is zero or special value */
>   		insn = sbi_get_insn(regs->mepc, &uptrap);
>   		if (uptrap.cause) {
>   			return sbi_trap_redirect(regs, &uptrap);
> @@ -75,92 +79,170 @@ static int sbi_trap_emulate_load(struct sbi_trap_context *tcntx,
>   		insn_len = INSN_LEN(insn);
>   	}
>   
> +	/**
> +	 * Common for RV32/RV64:
> +	 *    lb, lbu, lh, lhu, lw, flw, flw
> +	 *    c.lbu, c.lh, c.lhu, c.lw, c.lwsp, c.fld, c.fldsp
> +	 */
>   	if ((insn & INSN_MASK_LB) == INSN_MATCH_LB) {
> -		len   = 1;
> -		shift = 8 * (sizeof(ulong) - len);
> +		len = -1;
>   	} else if ((insn & INSN_MASK_LBU) == INSN_MATCH_LBU) {
>   		len = 1;
> -	} else if ((insn & INSN_MASK_LW) == INSN_MATCH_LW) {
> -		len   = 4;
> -		shift = 8 * (sizeof(ulong) - len);
> -#if __riscv_xlen == 64
> -	} else if ((insn & INSN_MASK_LD) == INSN_MATCH_LD) {
> -		len   = 8;
> -		shift = 8 * (sizeof(ulong) - len);
> -	} else if ((insn & INSN_MASK_LWU) == INSN_MATCH_LWU) {
> -		len = 4;
> -#endif
> -#ifdef __riscv_flen
> -	} else if ((insn & INSN_MASK_FLD) == INSN_MATCH_FLD) {
> -		fp  = 1;
> -		len = 8;
> -	} else if ((insn & INSN_MASK_FLW) == INSN_MATCH_FLW) {
> -		fp  = 1;
> -		len = 4;
> -#endif
> +	} else if ((insn & INSN_MASK_C_LBU) == INSN_MATCH_C_LBU) {
> +		/* Zcb */
> +		len = 1;
> +		imm = RVC_LB_IMM(insn);
> +		c_load = true;
>   	} else if ((insn & INSN_MASK_LH) == INSN_MATCH_LH) {
> -		len   = 2;
> -		shift = 8 * (sizeof(ulong) - len);
> +		len = -2;
> +	} else if ((insn & INSN_MASK_C_LH) == INSN_MATCH_C_LH) {
> +		/* Zcb */
> +		len = -2;
> +		imm = RVC_LH_IMM(insn);
> +		c_load = true;
>   	} else if ((insn & INSN_MASK_LHU) == INSN_MATCH_LHU) {
>   		len = 2;
> -#if __riscv_xlen >= 64
> -	} else if ((insn & INSN_MASK_C_LD) == INSN_MATCH_C_LD) {
> -		len   = 8;
> -		shift = 8 * (sizeof(ulong) - len);
> -		insn  = RVC_RS2S(insn) << SH_RD;
> -	} else if ((insn & INSN_MASK_C_LDSP) == INSN_MATCH_C_LDSP &&
> -		   ((insn >> SH_RD) & 0x1f)) {
> -		len   = 8;
> -		shift = 8 * (sizeof(ulong) - len);
> -#endif
> +	} else if ((insn & INSN_MASK_C_LHU) == INSN_MATCH_C_LHU) {
> +		/* Zcb */
> +		len = 2;
> +		imm = RVC_LH_IMM(insn);
> +		c_load = true;
> +	} else if ((insn & INSN_MASK_LW) == INSN_MATCH_LW) {
> +		len = -4;
>   	} else if ((insn & INSN_MASK_C_LW) == INSN_MATCH_C_LW) {
> -		len   = 4;
> -		shift = 8 * (sizeof(ulong) - len);
> -		insn  = RVC_RS2S(insn) << SH_RD;
> +		/* Zca */
> +		len = -4;
> +		imm = RVC_LW_IMM(insn);
> +		c_load = true;
>   	} else if ((insn & INSN_MASK_C_LWSP) == INSN_MATCH_C_LWSP &&
> -		   ((insn >> SH_RD) & 0x1f)) {
> -		len   = 4;
> -		shift = 8 * (sizeof(ulong) - len);
> +		GET_RD_NUM(insn)) {
> +		/* Zca */
> +		len = -4;
> +		imm = RVC_LWSP_IMM(insn);
> +		c_ldsp = true;
>   #ifdef __riscv_flen
> +	} else if ((insn & INSN_MASK_FLW) == INSN_MATCH_FLW) {
> +		len = 4;
> +		fp = true;
> +	} else if ((insn & INSN_MASK_FLD) == INSN_MATCH_FLD) {
> +		len = 8;
> +		fp = true;
>   	} else if ((insn & INSN_MASK_C_FLD) == INSN_MATCH_C_FLD) {
> -		fp   = 1;
> -		len  = 8;
> -		insn = RVC_RS2S(insn) << SH_RD;
> +		/* Zcd */
> +		len = 8;
> +		imm = RVC_LD_IMM(insn);
> +		c_load = true;
> +		fp = true;
>   	} else if ((insn & INSN_MASK_C_FLDSP) == INSN_MATCH_C_FLDSP) {
> -		fp  = 1;
> +		/* Zcd */
>   		len = 8;
> -#if __riscv_xlen == 32
> -	} else if ((insn & INSN_MASK_C_FLW) == INSN_MATCH_C_FLW) {
> -		fp   = 1;
> -		len  = 4;
> -		insn = RVC_RS2S(insn) << SH_RD;
> -	} else if ((insn & INSN_MASK_C_FLWSP) == INSN_MATCH_C_FLWSP) {
> -		fp  = 1;
> -		len = 4;
> +		imm = RVC_LDSP_IMM(insn);
> +		c_ldsp = true;
> +		fp = true;
>   #endif
> +	} else {
> +		prev_xlen = sbi_regs_prev_xlen(regs);
> +	}
> +
> +	/**
> +	 * Must distinguish between rv64 and rv32, RVC instructions have
> +	 * overlapping encoding:
> +	 *     c.ld in rv64 == c.flw in rv32
> +	 *     c.ldsp in rv64 == c.flwsp in rv32
> +	 */
> +	if (prev_xlen == 64) {
> +		/* RV64 Only: lwu, ld, c.ld, c.ldsp  */
> +		if ((insn & INSN_MASK_LWU) == INSN_MATCH_LWU) {
> +			len = 4;
> +		} else if ((insn & INSN_MASK_LD) == INSN_MATCH_LD) {
> +			len = 8;
> +		} else if ((insn & INSN_MASK_C_LD) == INSN_MATCH_C_LD) {
> +			/* Zca */
> +			len = 8;
> +			imm = RVC_LD_IMM(insn);
> +			c_load = true;
> +		} else if ((insn & INSN_MASK_C_LDSP) == INSN_MATCH_C_LDSP &&
> +			GET_RD_NUM(insn)) {
> +			/* Zca */
> +			len = 8;
> +			imm = RVC_LDSP_IMM(insn);
> +			c_ldsp = true;
> +		}
> +#ifdef __riscv_flen
> +	} else if (prev_xlen == 32) {
> +		/* RV32 Only: c.flw, c.flwsp */
> +		if ((insn & INSN_MASK_C_FLW) == INSN_MATCH_C_FLW) {
> +			/* Zcf */
> +			len = 4;
> +			imm = RVC_LW_IMM(insn);
> +			c_load = true;
> +			fp = true;
> +		} else if ((insn & INSN_MASK_C_FLWSP) == INSN_MATCH_C_FLWSP) {
> +			/* Zcf */
> +			len = 4;
> +			imm = RVC_LWSP_IMM(insn);
> +			c_ldsp = true;
> +			fp = true;
> +		}
>   #endif
> -	} else if ((insn & INSN_MASK_C_LHU) == INSN_MATCH_C_LHU) {
> -		len = 2;
> -		insn = RVC_RS2S(insn) << SH_RD;
> -	} else if ((insn & INSN_MASK_C_LH) == INSN_MATCH_C_LH) {
> -		len = 2;
> +	}
> +
> +	if (len < 0) {
> +		len = -len;
>   		shift = 8 * (sizeof(ulong) - len);
> -		insn = RVC_RS2S(insn) << SH_RD;
>   	}
>   
> -	rc = emu(xform ? 0 : insn, len, orig_trap->tval, &val, tcntx);
> +	if (!len || orig_trap->cause == CAUSE_MISALIGNED_LOAD)
> +		/* Unknown instruction or no need to calculate offset */
> +		goto do_emu;
> +
> +	if (xform)
> +		/* Transformed insn */
> +		off = GET_RS1_NUM(insn);
> +	else if (c_load)
> +		/* non SP-based compressed load */
> +		off = orig_trap->tval - GET_RS1S(insn, regs) - imm;
> +	else if (c_ldsp)
> +		/* SP-based compressed load */
> +		off = orig_trap->tval - REG_VAL(2, regs) - imm;
> +	else
> +		/* I-type non-compressed load */
> +		off = orig_trap->tval - GET_RS1(insn, regs) - (ulong)IMM_I(insn);
> +	/**
> +	 * Normalize offset, in case the XLEN of unpriv mode is smaller,
> +	 * and/or pointer masking is in effect
> +	 */
> +	off &= (len - 1);
> +
> +do_emu:
> +	rc = emu(xform ? 0 : insn, len, orig_trap->tval - off, &val, tcntx);
>   	if (rc <= 0)
>   		return rc;
> +	if (!len)
> +		goto epc_fixup;
> +
> +	if (!fp) {
> +		ulong v = ((long)(val.data_ulong << shift)) >> shift;
>   
> -	if (!fp)
> -		SET_RD(insn, regs, ((long)(val.data_ulong << shift)) >> shift);
> +		if (c_load)
> +			SET_RDS(insn, regs, v);
> +		else
> +			SET_RD(insn, regs, v);
>   #ifdef __riscv_flen
> -	else if (len == 8)
> -		SET_F64_RD(insn, regs, val.data_u64);
> -	else
> -		SET_F32_RD(insn, regs, val.data_ulong);
> +	} else if (len == 8) {
> +		if (c_load)
> +			SET_F64_RDS(insn, regs, val.data_u64);
> +		else
> +			SET_F64_RD(insn, regs, val.data_u64);
> +	} else {
> +		if (c_load)
> +			SET_F32_RDS(insn, regs, val.data_ulong);
> +		else
> +			SET_F32_RD(insn, regs, val.data_ulong);
>   #endif
> +	}
>   
> +epc_fixup:
>   	regs->mepc += insn_len;
>   
>   	return 0;
> @@ -171,25 +253,18 @@ static int sbi_trap_emulate_store(struct sbi_trap_context *tcntx,
>   {
>   	const struct sbi_trap_info *orig_trap = &tcntx->trap;
>   	struct sbi_trap_regs *regs = &tcntx->regs;
> -	ulong insn, insn_len;
> +	ulong insn, insn_len, imm = 0, off = 0;
>   	union sbi_ldst_data val;
>   	struct sbi_trap_info uptrap;
> -	int rc, len = 0;
> -	bool xform = false;
> -
> -	if (orig_trap->tinst & 0x1) {
> -		/*
> -		 * Bit[0] == 1 implies trapped instruction value is
> -		 * transformed instruction or custom instruction.
> -		 */
> +	bool xform = false, fp = false, c_store = false, c_stsp = false;
> +	int rc, len = 0, prev_xlen = 0;
> +
> +	if (sbi_trap_tinst_valid(orig_trap->tinst)) {
>   		xform	 = true;
>   		insn	 = orig_trap->tinst | INSN_16BIT_MASK;
>   		insn_len = (orig_trap->tinst & 0x2) ? INSN_LEN(insn) : 2;
>   	} else {
> -		/*
> -		 * Bit[0] == 0 implies trapped instruction value is
> -		 * zero or special value.
> -		 */
> +		/* trapped instruction value is zero or special value */
>   		insn = sbi_get_insn(regs->mepc, &uptrap);
>   		if (uptrap.cause) {
>   			return sbi_trap_redirect(regs, &uptrap);
> @@ -197,62 +272,150 @@ static int sbi_trap_emulate_store(struct sbi_trap_context *tcntx,
>   		insn_len = INSN_LEN(insn);
>   	}
>   
> -	val.data_ulong = GET_RS2(insn, regs);
> -
> +	/**
> +	 * Common for RV32/RV64:
> +	 *    sb, sh, sw, fsw, fsd
> +	 *    c.sb, c.sh, c.sw, c.swsp, c.fsd, c.fsdsp
> +	 */
>   	if ((insn & INSN_MASK_SB) == INSN_MATCH_SB) {
>   		len = 1;
> -	} else if ((insn & INSN_MASK_SW) == INSN_MATCH_SW) {
> -		len = 4;
> -#if __riscv_xlen == 64
> -	} else if ((insn & INSN_MASK_SD) == INSN_MATCH_SD) {
> -		len = 8;
> -#endif
> -#ifdef __riscv_flen
> -	} else if ((insn & INSN_MASK_FSD) == INSN_MATCH_FSD) {
> -		len	     = 8;
> -		val.data_u64 = GET_F64_RS2(insn, regs);
> -	} else if ((insn & INSN_MASK_FSW) == INSN_MATCH_FSW) {
> -		len	       = 4;
> -		val.data_ulong = GET_F32_RS2(insn, regs);
> -#endif
> +	} else if ((insn & INSN_MASK_C_SB) == INSN_MATCH_C_SB) {
> +		/* Zcb */
> +		len = 1;
> +		imm = RVC_SB_IMM(insn);
> +		c_store = true;
>   	} else if ((insn & INSN_MASK_SH) == INSN_MATCH_SH) {
>   		len = 2;
> -#if __riscv_xlen >= 64
> -	} else if ((insn & INSN_MASK_C_SD) == INSN_MATCH_C_SD) {
> -		len	       = 8;
> -		val.data_ulong = GET_RS2S(insn, regs);
> -	} else if ((insn & INSN_MASK_C_SDSP) == INSN_MATCH_C_SDSP) {
> -		len	       = 8;
> -		val.data_ulong = GET_RS2C(insn, regs);
> -#endif
> +	} else if ((insn & INSN_MASK_C_SH) == INSN_MATCH_C_SH) {
> +		/* Zcb */
> +		len = 2;
> +		imm = RVC_SH_IMM(insn);
> +		c_store = true;
> +	} else if ((insn & INSN_MASK_SW) == INSN_MATCH_SW) {
> +		len = 4;
>   	} else if ((insn & INSN_MASK_C_SW) == INSN_MATCH_C_SW) {
> -		len	       = 4;
> -		val.data_ulong = GET_RS2S(insn, regs);
> +		/* Zca */
> +		len = 4;
> +		imm = RVC_SW_IMM(insn);
> +		c_store = true;
>   	} else if ((insn & INSN_MASK_C_SWSP) == INSN_MATCH_C_SWSP) {
> -		len	       = 4;
> -		val.data_ulong = GET_RS2C(insn, regs);
> +		/* Zca */
> +		len = 4;
> +		imm = RVC_SWSP_IMM(insn);
> +		c_stsp = true;
>   #ifdef __riscv_flen
> +	} else if ((insn & INSN_MASK_FSW) == INSN_MATCH_FSW) {
> +		len = 4;
> +		fp = true;
> +	} else if ((insn & INSN_MASK_FSD) == INSN_MATCH_FSD) {
> +		len = 8;
> +		fp = true;
>   	} else if ((insn & INSN_MASK_C_FSD) == INSN_MATCH_C_FSD) {
> -		len	     = 8;
> -		val.data_u64 = GET_F64_RS2S(insn, regs);
> +		/* Zcd */
> +		len = 8;
> +		imm = RVC_SD_IMM(insn);
> +		c_store = true;
> +		fp = true;
>   	} else if ((insn & INSN_MASK_C_FSDSP) == INSN_MATCH_C_FSDSP) {
> -		len	     = 8;
> -		val.data_u64 = GET_F64_RS2C(insn, regs);
> -#if __riscv_xlen == 32
> -	} else if ((insn & INSN_MASK_C_FSW) == INSN_MATCH_C_FSW) {
> -		len	       = 4;
> -		val.data_ulong = GET_F32_RS2S(insn, regs);
> -	} else if ((insn & INSN_MASK_C_FSWSP) == INSN_MATCH_C_FSWSP) {
> -		len	       = 4;
> -		val.data_ulong = GET_F32_RS2C(insn, regs);
> +		/* Zcd */
> +		len = 8;
> +		imm = RVC_SDSP_IMM(insn);
> +		c_stsp = true;
> +		fp = true;
>   #endif
> +	} else {
> +		prev_xlen = sbi_regs_prev_xlen(regs);
> +	}
> +
> +	/**
> +	 * Must distinguish between rv64 and rv32, RVC instructions have
> +	 * overlapping encoding:
> +	 *     c.sd in rv64 == c.fsw in rv32
> +	 *     c.sdsp in rv64 == c.fswsp in rv32
> +	 */
> +	if (prev_xlen == 64) {
> +		/* RV64 Only: sd, c.sd, c.sdsp */
> +		if ((insn & INSN_MASK_SD) == INSN_MATCH_SD) {
> +			len = 8;
> +		} else if ((insn & INSN_MASK_C_SD) == INSN_MATCH_C_SD) {
> +			/* Zca */
> +			len = 8;
> +			imm = RVC_SD_IMM(insn);
> +			c_store = true;
> +		} else if ((insn & INSN_MASK_C_SDSP) == INSN_MATCH_C_SDSP) {
> +			/* Zca */
> +			len = 8;
> +			imm = RVC_SDSP_IMM(insn);
> +			c_stsp = true;
> +		}
> +#ifdef __riscv_flen
> +	} else if (prev_xlen == 32) {
> +		/* RV32 Only: c.fsw, c.fswsp */
> +		if ((insn & INSN_MASK_C_FSW) == INSN_MATCH_C_FSW) {
> +			/* Zcf */
> +			len = 4;
> +			imm = RVC_SW_IMM(insn);
> +			c_store = true;
> +			fp = true;
> +		} else if ((insn & INSN_MASK_C_FSWSP) == INSN_MATCH_C_FSWSP) {
> +			/* Zcf */
> +			len = 4;
> +			imm = RVC_SWSP_IMM(insn);
> +			c_stsp = true;
> +			fp = true;
> +		}
>   #endif
> -	} else if ((insn & INSN_MASK_C_SH) == INSN_MATCH_C_SH) {
> -		len		= 2;
> -		val.data_ulong = GET_RS2S(insn, regs);
>   	}
>   
> -	rc = emu(xform ? 0 : insn, len, orig_trap->tval, val, tcntx);
> +	if (!fp) {
> +		if (c_store)
> +			val.data_ulong = GET_RS2S(insn, regs);
> +		else if (c_stsp)
> +			val.data_ulong = GET_RS2C(insn, regs);
> +		else
> +			val.data_ulong = GET_RS2(insn, regs);
> +#ifdef __riscv_flen
> +	} else if (len == 8) {
> +		if (c_store)
> +			val.data_u64 = GET_F64_RS2S(insn, regs);
> +		else if (c_stsp)
> +			val.data_u64 = GET_F64_RS2C(insn, regs);
> +		else
> +			val.data_u64 = GET_F64_RS2(insn, regs);
> +	} else {
> +		if (c_store)
> +			val.data_ulong = GET_F32_RS2S(insn, regs);
> +		else if (c_stsp)
> +			val.data_ulong = GET_F32_RS2C(insn, regs);
> +		else
> +			val.data_ulong = GET_F32_RS2(insn, regs);
> +#endif
> +	}
> +
> +	if (!len || orig_trap->cause == CAUSE_MISALIGNED_STORE)
> +		/* Unknown instruction or no need to calculate offset */
> +		goto do_emu;
> +
> +	if (xform)
> +		/* Transformed insn */
> +		off = GET_RS1_NUM(insn);
> +	else if (c_store)
> +		/* non SP-based compressed store */
> +		off = orig_trap->tval - GET_RS1S(insn, regs) - imm;
> +	else if (c_stsp)
> +		/* SP-based compressed store */
> +		off = orig_trap->tval - REG_VAL(2, regs) - imm;
> +	else
> +		/* S-type non-compressed store */
> +		off = orig_trap->tval - GET_RS1(insn, regs) - (ulong)IMM_S(insn);
> +	/**
> +	 * Normalize offset, in case the XLEN of unpriv mode is smaller,
> +	 * and/or pointer masking is in effect
> +	 */
> +	off &= (len - 1);
> +
> +do_emu:
> +	rc = emu(xform ? 0 : insn, len, orig_trap->tval - off, val, tcntx);
>   	if (rc <= 0)
>   		return rc;
>   


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
