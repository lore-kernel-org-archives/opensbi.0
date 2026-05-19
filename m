Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2BDCD343F
	for <opensbi@archiver.kernel.org>; Tue, 19 May 2026 00:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lf/JR9rmUDAU3adZhj77Eu84H+DtpPf1kQ06Ws+aVtw=; b=I2qoBIb5tjLa9c
	Hn+3efCTmMvehsfsf2+GecgT+YEHVaEfV6izxTiidpHjzxphFBYU0RGpeuCbClllyJyWnqw9tCVEs
	kdclbd6OMb01O6iO8wi9UHBGi02/yZOn8gz6jUM6roNZJpj4T4Znj6qoE5VROkbxi/FBDWN5r+kp/
	80TeAZhJ/dbzx7Uq7nrXvOhF/L0lg6sJy1GsBGdFkk2NG7zw6E8+CYiqbE0lHiy4uV6wjGVZ5AFMY
	FPRUlBgpmfdnxmiVMtEmsI+jRH0FxvfWw4c0yFyhdHTICkdAnisyVsHF5dbRR8LlVTRLfr81CsvTC
	D84/zEcC0MB/o9wBNMnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP8On-0000000HH4g-0qgp;
	Tue, 19 May 2026 00:33:29 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP8Ok-0000000HH3w-2UsF
	for opensbi@lists.infradead.org;
	Tue, 19 May 2026 00:33:28 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-2f33ae12f97so10352106eec.1
        for <opensbi@lists.infradead.org>; Mon, 18 May 2026 17:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20251104.gappssmtp.com; s=20251104; t=1779150805; x=1779755605; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pm5x2mfrdXIpBBo70cb4jJx3sJ2lDiohcScIC0pQbtg=;
        b=bUnt5niEN5rzoyVff+t3O6dm8ISiz1DbGXLRznY1jxHGer+w9PRbU8SiVSapDMrKRR
         elo2NOnpl4EfiDZVnFgBvifjWLb7UnQzzO535WCbNGwzKIHu/hWHDFOGArvdoaW7CevS
         PtRm2xiLSKDlTM1YKCxa7wpmXHmvyTrSTWSPvbbgd0O8JmItgyLNKvGfLCqW4zPuDf64
         CPFg4aKXN5Uaq+dFICSZXtf6hPD7Mv9YTLXffdj/q2LJ+qDay1/3Gz2UD/cFJEST686r
         LQmZEPPaXLXWbMny4X/o9p810VWCoSIPE3lNHjqAgqDSzGSI9VKaC87DFJyEdiV3lF6o
         hljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779150805; x=1779755605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pm5x2mfrdXIpBBo70cb4jJx3sJ2lDiohcScIC0pQbtg=;
        b=h4vL6vkejFQrbtxGodZUqUGE2AoYtePUAB5mKo64ImJRlVvQ/668bNSW+qy5WGlZGX
         jfqB4SQEoSvYDe5jOgYidVEb+aLehga820/KKdhyTY3IT9afn++NSLhFf8eO/mB/q81n
         VSJb0wd0A1ilwSchOgTYSsXhhlGB5o2E8bxYrrGyQQMG6r2m+3z8OnpH/E+e7dAdun75
         L6EmERTTLOzU0ydi4PzlhfQlbt2pNoQlW5uq4WKEHYFrCkcaj4UTJGs269Lo/Zo0es8c
         8dOU9hJIOVZrvFCJEW21p9Qom57ZcCvvup76slrziPGpJDYJnX/x/TEGmNYERwBNeH9E
         mTVQ==
X-Gm-Message-State: AOJu0YwbCnZvQuW8yEGgU4eoxI/t0S8PPFleZ2NJW2KFg/3OxkPPbhKZ
	3Ljf9OSGZQxCEJDovg0wLfrJUJyNy/jWsxtW+dNLizOvY/2gwHmThjjIflGHnzg3AGA=
X-Gm-Gg: Acq92OGDMRzgsYHb2wUqCIATNMOVON6gy6iTQGFXEYt+xC26EdI1J8eHDxkXe2nlLJg
	j3CTc/qojD2mHT1tK2V+8jHz+cnDIFnR/TAp0yvtjL4kgpZ3W7H+8xBl99JgfqU08tntfeJirS1
	gdQtrxDhP8rn1LoIrQvMD+7DWUf8XC9B3w1twVB3j6YLhp/LaKT5WDrwhNtM6/mojOfTcrmQcvq
	EPhyhwvUXgJHJmQfzCuvhXGbNl96S8TWp3wUfIuwLjk3ms7mlKvlcdRsrkhGJdrfXjWJg8jrBY/
	9a7APtO9c8Bd3Vme9Jm/0hKmQeGv1m7Roxi+/VuH+tWhgCJStlKU0xZOcyNRFECfC2uVzUpTjVr
	KK1OPXpnkkFGKBE0KhO8nIdxgdtjz7sUznjhTpcTrKc2LNEclPFXXTFkbEE30fUG/fFHR7OvwcR
	JzrXY/eehfix1V
X-Received: by 2002:a05:7300:a504:b0:2ef:9961:27fa with SMTP id 5a478bee46e88-3039862587emr8477591eec.18.1779150804843;
        Mon, 18 May 2026 17:33:24 -0700 (PDT)
Received: from localhost ([99.152.116.91])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-30293e2e3c0sm19204298eec.3.2026.05.18.17.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:33:23 -0700 (PDT)
Date: Mon, 18 May 2026 17:33:17 -0700
From: Olof Johansson <olof@lixom.net>
To: Benedikt Freisen <b.freisen@gmx.net>
Cc: opensbi@lists.infradead.org
Subject: Re: [PATCH v3 2/3] lib: sbi: ISA extension emulation.
Message-ID: <aguvzdqGOepMuG9x@chonkvm.lixom.net>
References: <20251227121802.15703-1-b.freisen@gmx.net>
 <20251227121802.15703-3-b.freisen@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227121802.15703-3-b.freisen@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_173326_733291_A310CF83 
X-CRM114-Status: GOOD (  22.60  )
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

Hi,

This is really useful, even if it's not very fast, for obvious reasons.

Fairly late feedback on this, but I found two bugs and a nit when working
to get Ubuntu 26.04 working on X280 (Tenstorrent Blackhole). It boots
with these fixes applied. In particular, without the cbo.zero fix Python
crashes on init.

For those curious, booting is quite slow due to the massive amount of emulation
needed. Implemented stats, boot to login prompt takes:

L2CPU 0 ISA-emulation counters (version 5, hart 0):
  ID  Extension      count
----  -------------  ---------------
   1  ANY                  128201838 (sum of all below)
   2  Zcb                  103287492
   5  Zbs                   12818741
   6  Zicond                12090563
   9  Zfa                       4517
  17  Zvbb                        69
  18  VS-off-bounce              455



-Olof

On Sat, Dec 27, 2025 at 01:18:01PM +0100, Benedikt Freisen wrote:
> Add trap-based emulation code or compatibility stubs for the following ISA extensions:
> Zicbom, Zicboz, Zicond, Zimop, Zawrs, Zfa, Zfhmin, Zcb, Zcmop, Zba, Zbb, Zbc, Zbs, Supm
> 
> Signed-off-by: Benedikt Freisen <b.freisen@gmx.net>
> ---

[...]

> diff --git a/lib/sbi/sbi_insn_emu.c b/lib/sbi/sbi_insn_emu.c
> new file mode 100644
> index 00000000..ffc3bade
> --- /dev/null
> +++ b/lib/sbi/sbi_insn_emu.c

[...]

> +#if defined(CONFIG_EMU_ZBA) || defined(CONFIG_EMU_ZBB) ||     \
> +	defined(CONFIG_EMU_ZBC) || defined(CONFIG_EMU_ZBS) || \
> +	defined(CONFIG_EMU_ZICOND)
> +int sbi_insn_emu_op(ulong insn, struct sbi_trap_regs *regs)
> +{

[...]

> +#ifdef CONFIG_EMU_ZBC
> +	/* Emulate Zbc instructions */
> +	case INSN_MATCH_CLMUL:
> +		rd_val = 0;
> +		for (int i = 0; i < __riscv_xlen; i++) {
> +			if ((rs2_val >> i) & 1)
> +				rd_val ^= rs1_val << i;
> +		}
> +		break;
> +	case INSN_MATCH_CLMULH:
> +		rd_val = 0;
> +		for (int i = 1; i <= __riscv_xlen; i++) {
> +			if ((rs2_val >> i) & 1)
> +				rd_val ^= rs1_val >> (__riscv_xlen - i);
> +		}
> +		break;

The above needs to be < __riscv_xlen. Per the spec:

        for (int i = 1; i < XLEN; i++)
            if ((rs2 >> i) & 1)
                x ^= rs1 >> (XLEN - i);

> +	case INSN_MATCH_CLMULR:
> +		rd_val = 0;
> +		for (int i = 0; i < __riscv_xlen; i++) {
> +			if ((rs2_val >> i) & 1)
> +				rd_val ^= rs1_val >> (__riscv_xlen - i - 1);
> +		}
> +		break;
> +#endif

[...]

> +int sbi_insn_emu_zicbom_zicboz(ulong insn, struct sbi_trap_regs *regs)
> +{
> +	/* NOTE: Errata workarounds for fence instructions are handled in
> +	 * misc_mem_opcode_insn. */
> +
> +	/* Emulate Zicbom and Zicboz */
> +	switch (insn & INSN_MASK_CBO) {
> +	case INSN_MATCH_CBO_ZERO: {
> +		/* Check whether the instruction was even allowed */
> +		ulong prev_mode = sbi_mstatus_prev_mode(regs->mstatus);
> +		if ((prev_mode == PRV_U &&
> +		     !(read_senvcfg_or_emu() & ENVCFG_CBZE)) ||
> +		    (prev_mode == PRV_S &&
> +		     !(read_menvcfg_or_emu() & ENVCFG_CBZE)))
> +			return truly_illegal_insn(insn, regs);
> +
> +		u32 *addr =
> +			(u32 *)(GET_RS1S(insn, regs) & 0xffffffffffffffc0ull);

This needs to be GET_RS1(), or you end up picking up the wrong register in some
cases (gpr[8]). 

[...]

> +int sbi_insn_emu_store_fp(ulong insn, struct sbi_trap_regs *regs)
> +{
> +	struct sbi_trap_context *tcntx =
> +		container_of(regs, struct sbi_trap_context, regs);
> +
> +	/* If floating point is available and insn is FSH,
> +	 * simply use the misaligned store handler */
> +	if ((regs->mstatus & MSTATUS_FS) != 0 &&
> +	    (sbi_mstatus_prev_mode(regs->mstatus) != PRV_U ||
> +	     (csr_read(CSR_SSTATUS) & SSTATUS_FS) != 0) &&
> +	    (insn & INSN_MASK_FSH) == INSN_MATCH_FSH) {
> +		tcntx->trap.cause = CAUSE_MISALIGNED_LOAD;

Nit: This should be CAUSE_MISALIGNED_STORE

> +		tcntx->trap.tval  = GET_RS1(insn, regs) + IMM_S(insn);
> +		return sbi_misaligned_store_handler(tcntx);
> +	}
> +
> +	return truly_illegal_insn(insn, regs);
> +}



-Olof

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
