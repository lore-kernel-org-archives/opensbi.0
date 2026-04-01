Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CC4D3517C
	for <opensbi@archiver.kernel.org>; Wed,  1 Apr 2026 12:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q/eJUsFIxre/5r/ExNtHG1z2xPSPTuGNvmVnDdOjRMs=; b=rDDtNNq9koS5cM
	4dmsCPBQLK2ulLt1T+5E5TOUX89dDM0/sJQISbqrb1SPX641HwUt9MaVHt/6bjgpG44aO24x72JCn
	W1PLMwlG/LQuwQzgQyT0piRjqaQjKdh3+f7feebXuTJznPN5orwQj87brzJeBQ5jli6AL2wmTJLFt
	4hmwqMZJDa6qwTRBT99S7waRykduwDt9/0vh9TtLq+G+E34MjglZb0JCH22RUM8AVxyIOhyv97DfU
	XNQe8jdmmaQd95q5dTVTRAVdIaouyb/yHJPZCm9mTXVVmwLgF48Mc733mNSxh5aa57bV281uZchNr
	zojp6J3HaghqUI6FN79w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7v2P-0000000FFnN-11Jx;
	Wed, 01 Apr 2026 12:51:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7v2N-0000000FFnC-1bo0
	for opensbi@bombadil.infradead.org;
	Wed, 01 Apr 2026 12:51:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YygZQMdGXsQu4eKSIEJuHOhoViis+VHTnHxud8gnQE8=; b=TOQQVarJbf/7MhEjv/RkM8lGQU
	8skbv6K3tSe+P6xnQzPHFRj+3MJO+0PSA2okOorQzCDspIBZr3vRMZwkp1DhQ74mg2rBhQCXPA491
	CKmuuVSkphtrlqZOSsKJIBF7Lp9VOSKrmMnPswXTGEvRY7gOU0xVzjM/GO/uXetanPe5AbIXB+QAR
	UF9UkJLQEjSJUyka9oO3tNzb6ms/GfhJhMeSjlf6AzlhmEsyb5rN8XlfwDK5q7FdbFWog57lgNdNj
	DWoF1pn+6LYE8zAft8Hn4xcNrB3sgKcYsAORlX1JI4IR63jM9yHUbBDyzWjHPmk/3uuqHP8Q73uIF
	HphRAqTQ==;
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7v2K-00000000OHv-2jRn
	for opensbi@lists.infradead.org;
	Wed, 01 Apr 2026 12:51:10 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-79db5e18ac6so7989777b3.1
        for <opensbi@lists.infradead.org>; Wed, 01 Apr 2026 05:51:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775047867; cv=none;
        d=google.com; s=arc-20240605;
        b=MnanIvykNWu5Kp54mfNGVtgDKtX7+jEVekcmKTJMbEt/9W6788oROlZoA2g1GKjNBT
         Gx4LzYJgS6wvAqcD7z/dD2H6+PtpyeDVRtKPiamJ9ptZT6VreuWyA58erKrDr3zebli8
         1iUjUtbhez1J9hdemGEd69vgPwF0mh5R2nariSg5SP4hSyq/kv1sH5PNqS7boK5IFnWO
         Tt20UgN1FZ8YnTe3W8W85Xi5IGzu2pDhRUv4DqQnTNcpdpNC+nLmSexl+AN7ASlvHiQE
         XZwA4tDfNHI6gXqU8ANhqH0hItMF3xOAe5YDmZ+NxN5Y8udBf2BFVNAO6UQANVCAfdS1
         sH+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YygZQMdGXsQu4eKSIEJuHOhoViis+VHTnHxud8gnQE8=;
        fh=s8r/FTK/68oCjpkCnOc1fK9DCo6TBMvdxlAYkLUYfOI=;
        b=BjPls9NUoGvhC8XjrBbmoy9yXaRzBc+wKWKt/mcvdP7frObZClfIW9UPahh2UorcPs
         sPdRsVfp1GEPpSz80lkGPgUSbqg0+RTJk3seXWKSyQ6k+yLqAWR3eVc/YQbI93nlKJRF
         WCB8cEgR5/t14hsLyzRTzIj0Vcra6brBz/I5zfjA2DUqSqvTQfyLFG4ZWf7azbrvtTTn
         8TDKall8wOFVbOt0KRi4bW0vdlmTiNMIVqMlN/Ez64NQhN6Zfrfrb6ip02yaxrIYBPXq
         uttRWrhmPIdOMcgtOmaTUnu0RoctYMuufObXMg/DurHyP/RdmyjnAk573m9+4vESyQQS
         YMGg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1775047867; x=1775652667; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YygZQMdGXsQu4eKSIEJuHOhoViis+VHTnHxud8gnQE8=;
        b=jZeJHajCk6uHq0RQ9SZ20dVyrm66/Yqzz37i1VWd0P0GISHBT//okkD+A/3SNVupAp
         hS3/ufIDdkFKnZ4QOfqnRtTLfIWIdWAoEleGE20hbig4gIkxfmAuq/TbR2EIaDwKU/UH
         Hj96W8u5JSEc4drgZYtWDtotdQg0jwwe/GoZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775047867; x=1775652667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YygZQMdGXsQu4eKSIEJuHOhoViis+VHTnHxud8gnQE8=;
        b=VXjg3Cyocp6IuATqJFG1W8e5TtsKDktO4D3LXbwN1XIcvffZKNyYrIH83i8A6Gc36q
         +1au0+HZPtAF61mqDxRsy7ZTiapoeVvzybyWO9JPkIa++wguGVqD4VLeVRHezKe78PZm
         7wXBEIkuMV2hPMsK/k5Uf9MWmL2MGsB7/kgYrksrXjEwjcD8Sma1ihu68xl4WHx81Dcg
         G4hryy8BmWnG9fLjnKXuzegos90lpMcdTkJ+yvv+8xbCyKwl+FFoWokvmsIKgbrADKFk
         CQ4wHGktSf7XK+qnC/pPWP+x88jHCPk9DseDs4G+RDJvhxZRzvKEmsTrBXFR0fzYsc+Y
         opjA==
X-Gm-Message-State: AOJu0Yy12V+Ti/VREJofELAqUwipiB0qZoKCVQJMpAE9bB83TLaSO7AZ
	jENTL3JU3he9V3uA0l312UTDwBG0oHOLpFUkTxjB4fcojln6XLRWT+ekjC7gKiFky7pKxb9Le25
	/yqvfDJwcT4K+LsfXjJPxtj8fTBJrL9Q=
X-Gm-Gg: ATEYQzxX7Y+ZreIyqaliFlX/7fJ3OvaBTI4H9MNfe8GkftPfIhwXnmlNUFH7CbxBTg5
	XBiNNIIfgD3iybLuqL6jCCVjaClf30qqvukYMhfPsiTuO8FowFIY1LL06ytVsI3QXlArXKHuu0w
	ljP+X+0FdhjIyI3Cre+TB8dkkAlXf9g6DdDyMMBZ8mMY7tQlXH9K2FWmUIRcX2OzRVzzh1Njaty
	7k2Ykeg2oj8CE27VizigbsRoMOmhM0zulO5sQLH0+LyMxa+USQgVTlyZRr8h5sG1vxRb5h9bmoE
	KvpiWI/BmCcvOIrQAT+93+DHLiWD9nuxequOzBZeQWWldgyKDEPqPShErIczXrBAExG5
X-Received: by 2002:a05:690c:11:b0:79a:b440:5c8d with SMTP id
 00721157ae682-7a20fcd8907mr32741927b3.11.1775047866497; Wed, 01 Apr 2026
 05:51:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260310005000.3837512-1-npiggin@gmail.com> <20260310005000.3837512-2-npiggin@gmail.com>
In-Reply-To: <20260310005000.3837512-2-npiggin@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Apr 2026 23:20:53 +1030
X-Gm-Features: AQROBzAADQ3MepFOjY1vRaNZVvWGT276zQQjjg9xAoRRa8UEcbawmgEOwkyfLK0
Message-ID: <CACPK8Xc_q-N7kNtixS75z8=cX3ryHY6Kw-+S-8NjZhd+q4173Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] lib: sbi: Move PMP encoding into a new file
To: Nicholas Piggin <npiggin@gmail.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_135108_780014_4D185BEF 
X-CRM114-Status: GOOD (  21.26  )
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

On Tue, 10 Mar 2026 at 11:19, Nicholas Piggin <npiggin@gmail.com> wrote:
>
> The Tenstorrent RISC-V IOMMU PMP MMRs use the same encoding as PMP CSRs.
> In preparation to support it, move the non hart-specific PMP operations
> into their own file where they will also be used to build the IOMMU
> PMPs.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

> --- a/lib/sbi/riscv_asm.c
> +++ b/lib/sbi/riscv_asm.c

> +int is_pmp_entry_mapped(unsigned int entry)
> +{
> +       pmp_t pmp;

> +       if (hart_pmp_read(entry, &pmp))
> +               return pmp_enabled(&pmp);

The diff is a bit all over the place so I may have confused myself.
The patch keeps is_pmp_entry_mapped but changes the body from

    if (pmp_get(entry, &prot, &addr, &log2len) != 0)
        return false;

to

    if (hart_pmp_read(entry, &pmp))
        return pmp_enabled(&pmp);

but hart_pmp_read returns SBI_OK (0) on success. So we should keep the !=0?

> +int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
> +           unsigned long *log2len)
> +{
> +       pmp_t pmp;
> +       int rc;
>
> -       /* return details */
> -       *prot_out    = prot;

It looks like prot_out is no longer written to after your patch. This
hunk never made it into the new pmp_decode:

       /* decode PMP config */
       cfgmask = (0xffUL << pmpcfg_shift);
       pmpcfg  = csr_read_num(pmpcfg_csr) & cfgmask;
       prot    = pmpcfg >> pmpcfg_shift;


> --- /dev/null
> +++ b/lib/sbi/sbi_pmp.c
> @@ -0,0 +1,91 @@

> +int pmp_create(pmp_t *pmp, unsigned long prot, unsigned long addr,
> +           unsigned long log2len)
> +{
> +       unsigned long addrmask, pmpaddr;
> +
> +       /* check parameters */
> +       if (log2len > __riscv_xlen || log2len < PMP_SHIFT)
> +               return SBI_EINVAL;

Here we check that log2len <=__riscv_xlen, but in pmp_decode below we
set log2len =  __riscv_xlen + 3. Is that just how it works, or should
pmp_decode be able to decode what pmp_create does?

> +
> +       /* encode PMP config */
> +       prot &= ~PMP_A;
> +       prot |= (log2len == PMP_SHIFT) ? PMP_A_NA4 : PMP_A_NAPOT;
> +
> +       /* encode PMP address */
> +       if (log2len == PMP_SHIFT) {
> +               pmpaddr = (addr >> PMP_SHIFT);
> +       } else {
> +               if (log2len == __riscv_xlen) {
> +                       pmpaddr = -1UL;
> +               } else {
> +                       addrmask = (1UL << (log2len - PMP_SHIFT)) - 1;
> +                       pmpaddr  = ((addr >> PMP_SHIFT) & ~addrmask);
> +                       pmpaddr |= (addrmask >> 1);
> +               }
> +       }
> +
> +       pmp->cfg = prot;
> +       pmp->addr = pmpaddr;
> +
> +       return SBI_OK;
> +}
> +
> +int pmp_decode(pmp_t *pmp, unsigned long *prot_out, unsigned long *addr_out,
> +           unsigned long *log2len)
> +{
> +       /* check parameters */
> +       if (!pmp || !prot_out || !addr_out || !log2len)
> +               return SBI_EINVAL;
> +
> +       if (!pmp_enabled(pmp))
> +               return SBI_EINVAL;
> +
> +       /* decode PMP address */
> +       if ((pmp->cfg & PMP_A) == PMP_A_NAPOT) {
> +               if (pmp->addr == -1UL) {
> +                       *addr_out = 0;
> +                       *log2len = __riscv_xlen + 3;
> +               } else {
> +                       unsigned long mask = ~((1UL << cto(pmp->addr)) - 1);
> +                       *addr_out = (pmp->addr & mask) << PMP_SHIFT;
> +                       *log2len = (cto(pmp->addr) + PMP_SHIFT + 1);
> +               }
> +       } else {
> +               *addr_out = pmp->addr << PMP_SHIFT;
> +               *log2len = PMP_SHIFT;
> +       }
> +
> +       return SBI_OK;
> +}

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
