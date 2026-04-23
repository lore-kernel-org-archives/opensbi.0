Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A93FAD3E1
	for <opensbi@archiver.kernel.org>; Thu, 23 Apr 2026 01:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=337DrQ4UuhQrSfrRPM9xu+AuDcJFcWUjjy/fI/N0Lnk=; b=bdf723i/1t5afq
	Tpcm2wTRl6IPhqVqoheWAIrUG81IFVUKsyTiiWSk+RdNSLzfTwxkQq/e4kKnlCKcKCMAxgV1zfpFA
	qOeGUzrLeVPCxc2e5OdFuv0WhKrY1SyiKF7MRI4UXC08uKRWVpPSjcVR8ADS8rdKdmu4vwdM0cq26
	JcyGXQCivd99fTtByIVqpvhoLRPYwQT/IUNGtVV57dYoz189nO8wPxRPA0F0IjlLflBh52wQZEfL9
	m5JdPB5gS97v/NdGqk0Lon2H+D6zEnAIQqGzUfDlki51feXgnbzeAfrMJcfokHxkfhhj6U99u5XiA
	/18NlcH73VHTFvEXP0YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFiRf-0000000At5S-3HPL;
	Thu, 23 Apr 2026 01:01:31 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFiRd-0000000At57-35hK
	for opensbi@lists.infradead.org;
	Thu, 23 Apr 2026 01:01:30 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-35da1af3e10so5770327a91.3
        for <opensbi@lists.infradead.org>; Wed, 22 Apr 2026 18:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776906089; x=1777510889; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ru04ukFyTNbgsS5jNq4xWYwrPbZQ3XyE6ewhoElABZk=;
        b=arX1j2eeAegzeiHNDMPRywZ76Yl1+DvDMSgvwyyF3AZn6hctTYghhbrMnjhOAjwAiM
         SEyOn03l7bJYkDon4UZH0VWNFAK35rfee8ElsBQ+u10n1q5U1nDEsmWiC/MgGPelvLeB
         W4r1GX6fkA5wnltRE/Z/qhm0Vnv3W0YIk+vtN17TmJJ+WWixvavyJqKE2qOL0RxF0imP
         iKu/hT9yLIJWYvLZxReepoYnP/GBS/qHTgTweLfbrMbwyVilmFh4a9k9+YHNuaUik3zZ
         fDzf7bO5hL8xM2DrLmyj7691T810NvW/WdDQnb6IPL7Eoy0erQqAGP3sl4Iqx2FY16Tv
         iqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776906089; x=1777510889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ru04ukFyTNbgsS5jNq4xWYwrPbZQ3XyE6ewhoElABZk=;
        b=HkYNIJI3MchV6d7xrotuUYBecnENw3DtMXNYbW1iGykk1nCnb+KcNC5JNPhDMCEfCg
         i0iFKymEo2IkD8cL4RoipYOFmBiStUoIjMTOKb8vWaNnijGSztfduWv1FMN60Ua3SI7T
         lHcxoZEqaDFo9f0u0/qW2MzwDSdf29pViFE1q/mK1TDG9WQrbPX0PIp7FObvb7rfK9BB
         m8es0H+aV4XcWXJM4R43JoVa7G09yNfcWv3/aGRgxYAUDSFUL0rUebWMxOES/NYaJeME
         OlHs8pCFPXaoTYACRAFFNuzPhEVoHRNbfTzSq4xb9mRytfuQ3sQOJmq3h3+LwT7A/8Ck
         4cPQ==
X-Gm-Message-State: AOJu0YyUtOCIH5qHM7zkld8/HMoI7fKS3cUx6c9gw779kGXS/s5lsfs3
	eI8IKxtmFix3lzbC/iOOE1tJY8WOn2JvwRSnxcu6AoAPSy3dHBS6UPey+Z2AthH8
X-Gm-Gg: AeBDiesli15jfsnSsVNX83SX6HbEkdB7toVJU+P7z2dzGcp105KPebAzWEvqEW7F45i
	ZQKW8NMB0AAX9xVn94cCSPOpRosiTOOL5EVpqs7WLi26lnvQrm6Y9Ezsn7R8iDw1ZtrkN9KaCOF
	DPsaaLFS4wcyBsz5xHA+5ZmYPjpU2P0nwCfP4xCuRyHmyA2aMbabs5ZKopUB+loqZWsQ0utKuUv
	uqwKSovXr+6a7jM3zzAr7CJ4jTM8ypPc/mAeIJe/SQAVDzyI8AG/I2+1x6HS+XdmfSa45kqVaX3
	vzCtQv1zPmeO3rlX4gcsq/aphiNC9zUSGGBpgawregRFDu4cW1KLqOCG6zF9A/jC2rBzehfUad0
	Pi00oY3YRTuooIwu1xTClGPSxj2J0652stWYZy85/idKfPmYlklDUjmCHqtDXsY9x9OQzhUTTnI
	UOz1xhJiz83/dhoF2i7n2GOYRQ+INyfgXvTJ4=
X-Received: by 2002:a17:90a:e704:b0:35f:ccf6:69a5 with SMTP id 98e67ed59e1d1-36140478a16mr24890606a91.20.1776906088732;
        Wed, 22 Apr 2026 18:01:28 -0700 (PDT)
Received: from localhost ([203.38.38.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f9cabfsm15545214a12.9.2026.04.22.18.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 18:01:28 -0700 (PDT)
Date: Thu, 23 Apr 2026 11:01:24 +1000
From: Nicholas Piggin <npiggin@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: opensbi@lists.infradead.org
Subject: Re: [PATCH 4/4] platform: generic: tenstorrent: Add RISC-V IOMMU
 support
Message-ID: <aelvClhzx8JMr_Ca@lima-default>
References: <20260310005000.3837512-1-npiggin@gmail.com>
 <20260310005000.3837512-4-npiggin@gmail.com>
 <CACPK8Xf4HHF1immMSW632KmAuwRc+7nuvhXnLyuVNPvdO7Lg-w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACPK8Xf4HHF1immMSW632KmAuwRc+7nuvhXnLyuVNPvdO7Lg-w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_180129_774040_F6C7679C 
X-CRM114-Status: GOOD (  12.49  )
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

On Wed, Apr 01, 2026 at 11:21:04PM +1030, Joel Stanley wrote:
> On Tue, 10 Mar 2026 at 11:19, Nicholas Piggin <npiggin@gmail.com> wrote:
> 
> > --- /dev/null
> > +++ b/platform/generic/tenstorrent/iommu.c
> 
> > +int tt_iommu_fdt_configure(const void *fdt)
> > +{
> > +       const char *compatible = "tenstorrent,riscv-iommu";
> > +       bool found_dt = false;
> > +       int offset = -1;
> > +
> > +       for (;;) {
> > +               uint64_t addr, size;
> > +               int rc;
> > +
> > +               offset = fdt_node_offset_by_compatible(fdt, offset, compatible);
> > +               if (offset < 0)
> > +                       break;
> > +
> > +               rc = fdt_get_node_addr_size_by_name(fdt, offset, "machine",
> > +                                                   &addr, &size);
> > +               if (rc < 0 || !size) {
> > +                       sbi_printf("tenstorrent,riscv-iommu did not find "
> > +                                       "machine regs\n");
> > +                       continue;
> > +               }
> > +
> > +               if (size < RISCV_IOMMU_REG_MACHINE_SIZE) {
> > +                       sbi_printf("tenstorrent,riscv-iommu@0x%016lx "
> > +                                  " machine regs region too small\n", addr);
> > +                       continue;
> > +               }
> 
> should this set found_dt = true here?

Yes it should.

Thanks,
Nick

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
