Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B76C5DF70
	for <opensbi@archiver.kernel.org>; Mon, 23 Feb 2026 03:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LcuVeucUcOjLiTkKi+z9899DYxxTetFZY6YZNQJt6Xw=; b=4XDUt4/xEzM+aK
	o9rKB4yVrO2iLwucKAif53zXmqFyl7rY4L9tyubKp7/bgjB/qXzGnGcwv3gYTOTHkVrNJF7LC+2qr
	neLzpoj2kXQm4U703laxHoBrsMMMwZ2e4aTps5vwsh+9oOGGuFe9S+ltHDN1Iq7X3+flWnoa2lbSu
	dLbKxLkJ4Ic8E0by9HzSHaSX7vxBAM3KNpjgpk/2GJmjIQglKMgM/m7sIFxKBhqQZg/pJcLhtq4u3
	VRIvekg3tp1GIBDAFp/wze8aEEU8u18CQd7GFduZMU322bXfbgqFiDyROjX7VQY/lrIYn+NU5669s
	c6aYsC3LXb7QnJl8NLlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuN1M-0000000HC9d-2rdD;
	Mon, 23 Feb 2026 03:54:08 +0000
Received: from exmail.andestech.com ([60.248.187.195] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuN1J-0000000HC8x-1gZ1
	for opensbi@lists.infradead.org;
	Mon, 23 Feb 2026 03:54:07 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTP id 61N3rnKQ032598;
	Mon, 23 Feb 2026 11:53:49 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02 (10.0.15.183) by ATCPCS31.andestech.com (10.0.1.89)
 with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 23 Feb 2026 11:53:48
 +0800
Date: Mon, 23 Feb 2026 11:53:47 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
CC: <opensbi@lists.infradead.org>, Leo Yu-Chi Liang <ycliang@andestech.com>
Subject: Re: [PATCH 5/5] lib: utils/suspend: add Andes ATCSMU suspend driver
Message-ID: <aZvPSxOfGExHKOX4@swlinux02>
References: <20251229071914.1451587-1-ben717@andestech.com>
 <20251229071914.1451587-6-ben717@andestech.com>
 <47gaecm2iwnihliide4hfjnp4b5ygmk3edjltvl2mdp4wwaydx@5ggtizp65f2t>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <47gaecm2iwnihliide4hfjnp4b5ygmk3edjltvl2mdp4wwaydx@5ggtizp65f2t>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 61N3rnKQ032598
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_195405_811279_49AEBA28 
X-CRM114-Status: GOOD (  11.38  )
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

> >
> > -     ae350_non_ret_save(sbi_scratch_thishart_ptr());
> >       ae350_disable_coherency();
> >       wfi();
> > -     return 0;
> > +
> > +     /* Light sleep resumes here */
> > +     ae350_enable_coherency();
> > +
> > +     return SBI_ENOTSUPP;
>
> I just skimmed this patch really fast, so I probably missed something,
> but it seems odd to return SBI_ENOTSUPP here.
>
> Thanks,
> drew

Hi Drew,

The reason for returning SBI_ENOTSUPP here is to satisfy the logic in
sbi_hsm_exit(). In sbi_hsm_exit(), there is a specific check:

  if (hsm_device_has_hart_hotplug()) {
    if (hsm_device_hart_stop() != SBI_ENOTSUPP)
      goto fail_exit;
  }

  /**
    * As platform is lacking support for hotplug, directly jump to warmboot
    * and wait for interrupts in warmboot. We do it preemptively in order
    * preserve the hart states and reuse the code path for hotplug.
    */
  jump_warmboot();

If we return 0 (SBI_OK), the condition (0 != SBI_ENOTSUPP) evaluates to
true, and the code jumps to fail_exit, hanging the hart.

Returning SBI_ENOTSUPP allows the execution to fall through to the
jump_warmboot() path, which is the intended behavior for 'light sleep'
on AE350 platform.

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
