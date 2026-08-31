Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE2DC61DE2
	for <opensbi@archiver.kernel.org>; Mon, 31 Aug 2026 03:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UQBwAnAdPN3wbeBS5HYZPdboTT+R+ISFd4MNbiNpoUY=; b=efqlPfWzHmdfNj
	cl8y56PJ85Ri1CQ8rfUSvB3Re3eYep00j3StUueTa9r+MnTQJs+2vngmPltAEqBkVg5C9wM47eAdY
	jvbioJy96JbanXeP4/uDnL9TGCE5V9gYhiPl9UtqXqJIMR2V/K9NcXOw8nfhL5Z6UoWeqicTJcRQR
	5Z60coL7cWQihAgHWszPFqwYKaGmDwmw9p+LYX/EYRvj+W862SOgkT4a7/VIQUTZEhRzbYnXE86j2
	R1V6DzhsIaRIz7Ys5/36A2x48vmU7d/JG94gqUcgiUCNM2kU3t8o++N/xvARWqqE88PxXWlxAAOJl
	9wVscNBrBIX8D+TQ/RWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0sGB-00000008NmX-0e22;
	Mon, 31 Aug 2026 03:00:35 +0000
Received: from atcsqr.andestech.com ([220.128.198.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0sG5-00000008NlW-0oZH
	for opensbi@lists.infradead.org;
	Mon, 31 Aug 2026 03:00:33 +0000
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 67V2xwOD043827
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Aug 2026 10:59:58 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.43; Mon, 31 Aug
 2026 10:59:58 +0800
Received: from swlinux02 (10.0.15.183) by ATCPCS34.andestech.com (10.0.1.134)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 31 Aug
 2026 10:59:58 +0800
Date: Mon, 31 Aug 2026 10:59:57 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
CC: <opensbi@lists.infradead.org>,
        Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Anup Patel
	<anup.patel@oss.qualcomm.com>
Subject: Re: [PATCH] platform: generic: andes: validate PMAADDR decoding
Message-ID: <apTuLW4FYdKNblRB@swlinux02>
References: <20260827115435.49190-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260827115435.49190-1-pengpeng@iscas.ac.cn>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs55.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 67V2xwOD043827
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_200029_577927_25A2282C 
X-CRM114-Status: GOOD (  22.35  )
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

On Thu, Aug 27, 2026 at 07:54:35PM +0800, Pengpeng Hou wrote:
> decode_pmaaddrx() reconstructs a NAPOT region with signed int shifts.  The
> QiLai platform configures 2^35 and 2^37 PCIe regions, so decoding the first
> enabled region while checking the next one reaches shifts by 32 and 35.
> Those shifts are undefined even on RV64.
>
> The all-ones PMAADDR value also violates the sbi_ffz() precondition, and a
> decoded base or end may not fit in unsigned long.
>
> Use unsigned shifts and make the decoder reject encodings whose size, base,
> or inclusive end cannot be represented.  Treat an invalid enabled entry as
> overlapping when adding a region, and fail rather than skipping it when
> freeing a region.
>
> Fixes: aa56084c4dfb ("platform: generic: andes: add a new Andes SBI call to set up a PMA entry")
>
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
> Base-commit: 4e79fd7de59f1b2899092c1a84ce68c8ebc68f93
>
>  platform/generic/andes/andes_pma.c | 28 ++++++++++++++++++++++------
>  1 file changed, 22 insertions(+), 6 deletions(-)
>
> diff --git a/platform/generic/andes/andes_pma.c b/platform/generic/andes/andes_pma.c
> index ba9a35b..cdc06ac 100644
> --- a/platform/generic/andes/andes_pma.c
> +++ b/platform/generic/andes/andes_pma.c
> @@ -69,10 +69,10 @@ static void set_pmaxcfg(int entry_id, char flags)
>         csr_write_num(pmacfg_addr, pmacfg_val);
>  }
>
> -static void decode_pmaaddrx(int entry_id, unsigned long *start,
> +static bool decode_pmaaddrx(int entry_id, unsigned long *start,
>                             unsigned long *size)
>  {
> -       unsigned long pmaaddr;
> +       unsigned long addr, pmaaddr;
>         int k;
>
>         /**
> @@ -81,9 +81,23 @@ static void decode_pmaaddrx(int entry_id, unsigned long *start,
>          * start = 4 * ($pmaaddr - (size / 8) + 1)
>          */
>         pmaaddr = csr_read_num(CSR_PMAADDR0 + entry_id);
> +       if (pmaaddr == ~0UL)
> +               return false;
> +
>         k = sbi_ffz(pmaaddr);
> -       *size = 1 << (k + 3);
> -       *start = (pmaaddr - (1 << k) + 1) << 2;
> +       if (k >= __riscv_xlen - 3)
> +               return false;
> +
> +       addr = pmaaddr - (1UL << k) + 1;
> +       if (addr > (~0UL >> 2))
> +               return false;
> +
> +       *size = 1UL << (k + 3);
> +       *start = addr << 2;
> +       if (*start > ~0UL - (*size - 1))
> +               return false;
> +
> +       return true;

Hi Pengpeng,

Thanks for catching this.

andes_pma_setup() is the only place that programs a PMA entry, and it
already requires a power-of-two size >= 4096 at a naturally aligned addr,
both of type unsigned long. That guarantees k is exactly log2(size) - 3,
so none of the above checks can ever trigger.

Changing 1 to 1UL is reasonable, but we already sent a patch [1] for this
issue, so I would rather see that one land. No need for a v2.

[1] https://patchwork.ozlabs.org/project/opensbi/patch/20260729092317.2848665-1-randolph@andestech.com/

Thanks,
Ben

>  }
>
>  static bool has_pma_region_overlap(unsigned long start, unsigned long size)
> @@ -97,7 +111,8 @@ static bool has_pma_region_overlap(unsigned long start, unsigned long size)
>                 if (is_pma_entry_disable(pmaxcfg))
>                         continue;
>
> -               decode_pmaaddrx(i, &_start, &_size);
> +               if (!decode_pmaaddrx(i, &_start, &_size))
> +                       return true;
>                 _end = _start + _size - 1;
>
>                 if (MAX(start, _start) <= MIN(end, _end)) {
> @@ -352,7 +367,8 @@ int andes_sbi_free_pma(unsigned long pa)
>                 if (is_pma_entry_disable(pmaxcfg))
>                         continue;
>
> -               decode_pmaaddrx(i, &start, &size);
> +               if (!decode_pmaaddrx(i, &start, &size))
> +                       return SBI_ERR_FAILED;
>                 if (start != pa)
>                         continue;
>
> --
> 2.50.1 (Apple Git-155)
>

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
