Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4C8F8D76E
	for <opensbi@archiver.kernel.org>; Thu, 16 Apr 2026 20:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pVRedhCSjtgEWixVyLMSfBbcliQZ2T17DElso84Sp30=; b=a46ub6nKdABK7i
	pjxNQFZb8/tE8zJSMSvVNkHb8ZzeoNfiPOYFbYK0j5b0iUvzPdFNEGrdPGWVdQKtYPJF0gYzkslJT
	7OwBUJRndoOJCaO/HSG1IOt0NPNUOz3oUUgdteanyPbZDFNlw2zBVQtSUOQ/53R6xGLjbhpiAtuwn
	D8CovcXP2YrCSK6Wv6ZWAAqiR53lRHGuYkhtw+V1EJUGh+QIHMx3XrtC/RaJXFmNrMTCUgFbnDDSa
	67ftU3AgVYPLV+smTLd1krw7O0FRoPmecMo/W7MMbHiAkra/P71wUpt00o4UcOtFo2qQRydhTAdA7
	xcAkijp/SmdOWq8hpj4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDTIA-00000002zM2-3qmA;
	Thu, 16 Apr 2026 20:26:26 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDTI7-00000002zLG-3SOp
	for opensbi@lists.infradead.org;
	Thu, 16 Apr 2026 20:26:25 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-2d89bbca7b5so152762eec.3
        for <opensbi@lists.infradead.org>; Thu, 16 Apr 2026 13:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1776371182; x=1776975982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfzxBnHhADISw/v0K5TeT/TxEgXT8gF6MljAjIxOuTw=;
        b=GXORw69hOZM5CU6CQe7gNbVSazhnslAWHTi5wEirLAsdzCysda2P34iBp2/VrjuFz6
         SG+j5mFqHc0Y+0v01pT0SzN0GkRmdFPQrVQn6YLiYnmlGUpWoE5YAo4Qr6gNsAkSwWBt
         AMNP0+MjZs2sJ7nz94jigTB76dnZaTgJ1WeMDAFbHk5TaULHVdLkfbLT5ZYXveiJQKCT
         vFCdHTVd80J1RwGLOQZwTdjeoQ3VMP6Yd4xBc4g350FoXY61j/GcjufQH+7TkDzoQU4s
         ZY7ZBPU6CDX6jG5gBHj2xjE5OAFE5kALp/WE5ci88stIPtbSs1zHiRYqTNDxvCT5fx4Q
         W9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776371182; x=1776975982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AfzxBnHhADISw/v0K5TeT/TxEgXT8gF6MljAjIxOuTw=;
        b=JWbJ0HxlcYOddcX/Ham4D/MteAUVjbK698yUcYDqxEgrz/ZXchAPzQAG0EKkPHJJUZ
         zHv/2/5J5z2999bwAm7ZiOBTJWKoK8GahlxrnfTljccLwPCXs6T+nwnxERb2uC0QWBii
         o8BkpNYcCvsK0MhXd6WwoomEAdr9I1SaPwVWU/f7/j+M6yOWFJU9LL1G7v63uohs0wGX
         kDSSArTCZXm6O3lfeadMPrh+TAxa7mfv8j/yp9pz2Q38jhFf2KbwlRoFS+qCP+1kQdEJ
         E9c8DkyoHjO+eBsiYBy4Co9QnOxwHESxxZe1ZjFCzgurQU1xQ9VoXMQHnOn+mQ1y19wc
         FSOQ==
X-Gm-Message-State: AOJu0YzPBHEC0nhnUvSnuh1C/Js8NLPFg1ZH9kwL9znO/2GyszVd9aEX
	znbqlPlgr4RmN3NY6wwUGe6RWd9d5wqnUe+JgBH5ZoPzfnwUzR+8j4OC7Cq9bMa67JiQX/8H2Nz
	bbKwY
X-Gm-Gg: AeBDievABVDwPUKOFTYY9SN1JIUtV35wHGLMdS9SJrQeqeuK6ucgHlt1wtp6ENYecr2
	UMZMETtkqa/CKueHHiOGytLIVgY9+Px6M5rvidvEtbwrODPgK79pLDX7E8WeKvPRI5DWI1ULlyB
	NwqUMLyMusFXhyziy5uKv07Wt6qRn3YtPRQbcDyilXdRoRke5kAsU4ZaMKeLIvUAaCxzxfxFfg3
	IBYmO/+FKOiTW4r+fS3hnhMq0FJKxfnoiDsxSY2+po9z/Fuu60OTx8LApGqswqhljdcQHqK2xHF
	w55yyc+2p1R0LxEcYFn5LL3slSMvFemJc/EF1SBIH2OO1gvVN/KmYcKg3Vnj1RyCDYhrdkE/rz6
	XGCpbb+wNjP9BugrRogrf2H/iZp+fWC/wtptJfvGTmQnvBPKjGL8DrEEY1f71/0q74HcyuB2UGw
	T4O52KHWwPNmLDbbQ3l4aP4HArZzk2Pzgoz1OAxR7rtxXh4LO6Ak9hHU0EICnB
X-Received: by 2002:a05:7301:100b:b0:2d1:9b35:4f03 with SMTP id 5a478bee46e88-2e2e70c3019mr150642eec.5.1776371182170;
        Thu, 16 Apr 2026 13:26:22 -0700 (PDT)
Received: from ausc-rvsw-c-02.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8f65f9bcsm10970513eec.22.2026.04.16.13.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 13:26:21 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org,
	evvoevod@tenstorrent.com
Subject: Re: [PATCH 3/7] firmware: Add RNMI/RNME handler infrastructure
Date: Thu, 16 Apr 2026 20:26:08 +0000
Message-ID: <20260416202608.1125121-1-evvoevod@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAAhSdy2jFkLSH0WThrcEg36LDc+hwiGHRcHGOZ6+FxdO+ok+2Q@mail.gmail.com>
References: <20260310183155.2186463-1-evvoevod@oss.tenstorrent.com> <20260310183155.2186463-4-evvoevod@oss.tenstorrent.com> <CAAhSdy2PHSsMNib5Bscp1mWvdQTii_PG7jDpgR9vf_f=7x04sw@mail.gmail.com> <20260409191943.291207-1-evvoevod@tenstorrent.com> <CAAhSdy2jFkLSH0WThrcEg36LDc+hwiGHRcHGOZ6+FxdO+ok+2Q@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_132623_874416_AE78E5D7 
X-CRM114-Status: GOOD (  12.55  )
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

On Fri, Apr 10, 2026 at 1:09 AM Anup Patel <anup@brainfault.org> wrote:
> > > Drop these platform callbacks from this patch. We will be
> > > extending sbi_irqchip to support NMIs. For NME, we will
> > > can simply crash.
> >
> > Agreed. I'll remove the platform callbacks. For RNMI, I'll
> > route through sbi_irqchip once that support is in place. For
> > RNME, I'll simplify to just print diagnostics and hang.

Hi Anup,

I've been rebasing and reworking the Smrnmi series based on our
discussion. I can remove the platform runtime callbacks
(ops->rnmi_handler / ops->rnme_handler) as agreed, and I can still
have the initial Smrnmi infrastructure in place: platforms install
trap handlers for RNMI/RNME vectors, detect the extension from
device tree, and initialize MNSCRATCH.

However, without irqchip NMI support there's no way for platforms
to actually handle NMIs once they fire. The default RNMI handler
would just log and hang. This means NMIs would need to stay
disabled (NMIE=0) until that support lands, even on platforms that
are otherwise ready for Smrnmi.

I couldn't find ongoing work on irqchip NMI support, so I wanted
to check how you'd like to proceed:

1. Ship the Smrnmi infrastructure with NMIs effectively disabled
   (log and hang). Platforms carry local patches for NMI handling
   until irqchip NMI support lands.

2. Keep ops->rnmi_handler as a temporary bridge, marked for
   migration to irqchip.

3. Include a minimal irqchip NMI extension in this series: a
   standalone registration API (sbi_irqchip_register_nmi_handler /
   sbi_irqchip_process_nmi) with a simple static callback -- not
   tied to a specific irqchip device since NMI is a system-level
   event. Platforms would register their NMI handler during
   irqchip_init, and sbi_trap_rnmi_handler would dispatch
   through it.

Thanks,
Evgeny

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
