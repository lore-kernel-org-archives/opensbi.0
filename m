Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1773D3517B
	for <opensbi@archiver.kernel.org>; Wed,  1 Apr 2026 12:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=elV6gWjeaj4844r1j2bj2FOCf1Ik6KJiNYv33ovRFMw=; b=hrS1JC31HdWTRw
	AP/57L1yqEcjjDpDqk8rYtb3CsJ1Geu4VERtJqEBSFXRalE3BUz6I6SI6f4RmJ4i64EAuTbW3DfY6
	0DG3RrT1VQw6nze0urjvKe+K14g5RQdHH8qQ+yBHiql2Rwzn5VPiclbQlvLDsQq401H+NgKZ8RG6A
	s+MPSbS2BR56dycYDKHlNiWZ2BQ9RxALGaBbK8ljHBUh8LGWeD4lmxmx4ZrRXlsE+lerrHwNk0Vrv
	woLMk/hlgAWlpCBluaO74mLJ/FlJX6UpCvc1cebnO/SB8P48+B3OQSSCtx2WMVXdTKPGDmUC037g6
	/h5H7s39hGB9q9nLbbnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7v2W-0000000FFpE-2HS2;
	Wed, 01 Apr 2026 12:51:20 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7v2S-0000000FFo8-46GP
	for opensbi@lists.infradead.org;
	Wed, 01 Apr 2026 12:51:18 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-794719afcd4so37250057b3.1
        for <opensbi@lists.infradead.org>; Wed, 01 Apr 2026 05:51:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775047876; cv=none;
        d=google.com; s=arc-20240605;
        b=Ma2DEF1JsTCGN3/i7DxII+WKO6Y7Atu5EXzZ6MGtTM1GMJiK6upkQWNeBPCsKc8rK5
         uGO+LfqRTJ91wVDNbvsS/jDLM4msz8l4kj9X3liAPxXXaScuqeX0oFH9hPY2OVyV2aNz
         BuYlbmqa2TvC51x6FnrzEMOJUoqGxcZE/qIYvB5V6mJbAXu+7AlTDPYF6clxlA29dhOc
         EPHTmC3m3HFUbctoChRZ9/hAaVWZLR6CuSvBJtDsH32FjPmLiDrpSnjaP0RaXt+ZngNB
         Vp8C2ya4hPm9llYTPOazBsg2koQjJ781SroZS2L3ofTamYfatqZktHyxEZE57ITWN+I7
         qgXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OtkIw0nefEp8M2bpJiZJ09TC9TRTFPBdGztwDxfDkio=;
        fh=s8r/FTK/68oCjpkCnOc1fK9DCo6TBMvdxlAYkLUYfOI=;
        b=YpJhcbCRdMG+QVsqN/lwQAuLTWcoKQi74Se1Y1GVr0DW5fUIEYPNXqZAmi+ym8sbFP
         WwYv8zOfAOBwZedbw3ETq9cr0hsjUWVax20uJeyBDE/P239KAsXwKRvgTzRE4/WEwLkq
         1XEovQ+xxNTx+t5AOaKmRk+ROkqQ2VfnsCc4p8SVA09+oAmxLvfi3sa9sZ+0va/6sACQ
         4QDbLitxjXlSf5ytDf3BWmsp+athHwCHzBhQWSJJaui4Qs9C0+HE8xpnXhrYO6Yne5Pb
         Q7BnwGqHNC37zuBe8eICn/o4EM8K7g1ZciPYPpokPYa0HJTXfKvuc4hZXJpU1n8zFJkJ
         U1TA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1775047876; x=1775652676; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OtkIw0nefEp8M2bpJiZJ09TC9TRTFPBdGztwDxfDkio=;
        b=fjs34QB+EjRBWQtXVbHx6cVLv4wbW6OOtov0u540EtviM38iHHgSUv1cEnz4QclBLF
         QUoT2aJF/K4unWUc5AFSOaO7cpATxjqvH1q3Wf3q+rmvCO5lIiW5U9/OUDccmY2soRmz
         hk8AkYi3fVWa8cXWvlbGl8+tnyeuHpCT2OzKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775047876; x=1775652676;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OtkIw0nefEp8M2bpJiZJ09TC9TRTFPBdGztwDxfDkio=;
        b=Gw+/tozq4MdFUPBavzeb/1suF3CK6wE/jL69YZACb0Il57DdskxROm2YAESuc0adx/
         VFOzd30I/vo4yKXM1rs7g5RiVwpta1ym9KywWeQM/jFhdWHIVdf16U9sPIjfOuFRsHAG
         E1L8YUbxsd7AfQ1pPKbKbsbxg+3hZ47DZbQ9P4CCfrDfGgfcWf0uin1c/KGMA2OJMnVK
         VOJzMK5yDVTOdgin1wNHUzDnLbLTZpRJ5n5uXr+nxQ3zrOhZTPxzBRrI0u5it+CEANOh
         +wC3lRj58PjxbH3hnQJAFmaa/sdk8syr8ZnxCIQ0Hpae98QfqGIdaVTAqqygyJ0w98wB
         BSWA==
X-Gm-Message-State: AOJu0YyVNuVUvbv9mu0gOuKH5Vw+hjA4AM31IObR14JDVdyO9W18v4NR
	aZGT5HRY2qweXleN46P7gOe1i2IvhlWv+cxNBwuOwq0lKDYdkpCWmmiupwHy3Is6dPu3RuPy6gg
	OMDlhoD5Oj5V/mxKR88Sv+P3MWYmPvgg=
X-Gm-Gg: ATEYQzzdZo4WywkJ6mzEC3Hm1dRUz6CPk+6bjvpEJ3paSObUcqd7nuYe1pXENUZ0sL+
	UgHMiPilZQl9O+Sb/RsI9y621vYbn+oIFlj07dKPfiA2HMneHyVQp3BITEYziQd332+FbL84t/f
	fSSDgc51VNkM9w27TkQtYw1yBqXKHDomPXGetYwDwFwkc83z2n+IIZkZhkeEHCoZmoJ8Tq4Auyh
	S9crqpxyHAlz0AWwCHxU/oNs+PD8HBvT6sYgCqp2ApVON2RDJjPt9hY792fJhLonsSf4B5bJbaL
	k/EOcrzRHNyh4yx/WEVP/PJC9YN9vreijZU/gUlRzModfgf0wFSJLdnQ00ctD244U4/IY5omxV8
	vnec=
X-Received: by 2002:a05:690c:e3cd:b0:79a:3f1c:4afe with SMTP id
 00721157ae682-7a21300c5f5mr35887707b3.56.1775047875828; Wed, 01 Apr 2026
 05:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260310005000.3837512-1-npiggin@gmail.com> <20260310005000.3837512-4-npiggin@gmail.com>
In-Reply-To: <20260310005000.3837512-4-npiggin@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Apr 2026 23:21:04 +1030
X-Gm-Features: AQROBzBOSld3ivBhFUfzJ0HiMavMr-1RQZiZxR5MkCAehc8tnsHXuAhqft7rt9k
Message-ID: <CACPK8Xf4HHF1immMSW632KmAuwRc+7nuvhXnLyuVNPvdO7Lg-w@mail.gmail.com>
Subject: Re: [PATCH 4/4] platform: generic: tenstorrent: Add RISC-V IOMMU support
To: Nicholas Piggin <npiggin@gmail.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_055117_024399_C095409D 
X-CRM114-Status: GOOD (  12.13  )
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

> --- /dev/null
> +++ b/platform/generic/tenstorrent/iommu.c

> +int tt_iommu_fdt_configure(const void *fdt)
> +{
> +       const char *compatible = "tenstorrent,riscv-iommu";
> +       bool found_dt = false;
> +       int offset = -1;
> +
> +       for (;;) {
> +               uint64_t addr, size;
> +               int rc;
> +
> +               offset = fdt_node_offset_by_compatible(fdt, offset, compatible);
> +               if (offset < 0)
> +                       break;
> +
> +               rc = fdt_get_node_addr_size_by_name(fdt, offset, "machine",
> +                                                   &addr, &size);
> +               if (rc < 0 || !size) {
> +                       sbi_printf("tenstorrent,riscv-iommu did not find "
> +                                       "machine regs\n");
> +                       continue;
> +               }
> +
> +               if (size < RISCV_IOMMU_REG_MACHINE_SIZE) {
> +                       sbi_printf("tenstorrent,riscv-iommu@0x%016lx "
> +                                  " machine regs region too small\n", addr);
> +                       continue;
> +               }

should this set found_dt = true here?

> +
> +               sbi_dprintf("tenstorrent,riscv-iommu found machine regs "
> +                           "0x%016lx-0x%016lx\n", addr, addr + size - 1);
> +
> +               rc = tt_iommu_configure(addr);
> +               if (rc)
> +                       sbi_printf("tenstorrent,riscv-iommu@0x%016lx "
> +                                  "init failed\n", addr);
> +       }
> +
> +       if (!found_dt)
> +               return SBI_ENOTSUPP;

because found_dt never gets modified.

> +
> +       return SBI_OK;
> +}

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
