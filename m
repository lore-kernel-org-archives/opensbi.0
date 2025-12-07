Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD42D1CDC6
	for <opensbi@archiver.kernel.org>; Sun,  7 Dec 2025 05:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fBy7IrSgEBngLDWNSH9g9+EPbsYzi92TnWjcfi89aZM=; b=da5npZp/nosd5f
	J4e201SLaeSQL5BFNEd1MIMhi6/upJyQYCpDxJM5MQmvYQcV/Ny+NwwIwkWuAu1Ik4WvvhWLFzSyv
	PdrOpywZAm7pMczo39JnbFqEjfGml9O/yYMXPRctK0QWBKh/xhgN0jdxigf190oFSUKqymbE4Nq3i
	84el/wZp8J7TawtQVcu9mb5JUuuBmRkFys44TJNvA1qywdscHDi0c8cxq5Tc1nqsgWE21FcQPvDZf
	5wTMIICgt5JxU51dy4NUr3/qVw2mW4j0BP+OIza4eadedlFxLlQr30+24vZp4TOdon6j+8wI5Xtd6
	pnxbzKHn/uyQGTIJCdrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vS77L-0000000BUIq-31RQ;
	Sun, 07 Dec 2025 05:15:31 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vS77J-0000000BUIA-1kFy
	for opensbi@lists.infradead.org;
	Sun, 07 Dec 2025 05:15:30 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-656d9230cf2so2064746eaf.1
        for <opensbi@lists.infradead.org>; Sat, 06 Dec 2025 21:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1765084528; x=1765689328; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m88+5+RNMAp0nw1v1EzRUhoRShX5x5dFPHTZbJuJYqs=;
        b=cPrRo/MzQ/AiARVrMK1pu7mrrGreO0CGREodLU7gSFA8pGPmMNjoCaBkPdtBX47CTk
         LpiE+2S6gqKfRl76rdn841nDF8fPzT6o/S0SifduEw3lTgpIwc9SgIoFjorvLGqleIUb
         AhndZ7SCeQ1wZm05o/26Ajhl4Jugr3rhjNn1lnCWVQxFS6fENHoY77GGR9A5kvqWXDHX
         FyN50bV7yuxmvnRB6DRcD3DC6g5qoKSHkZfT10FoUPNblRqpsci/IeQToswSvrpmDZgv
         i2sNvh+Gn1I0r+ld0cbOU+lq000TkU2hNjH55RDvnaW6kdZ3BZnRgoiW0UszDEz+mAet
         Vx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765084528; x=1765689328;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m88+5+RNMAp0nw1v1EzRUhoRShX5x5dFPHTZbJuJYqs=;
        b=uth929dKAtyvC8tGVFyn4cmZp/JflOTS/U+Boq01xEVVlThZetT615lc3c6R3e0ZHD
         6/x9J6HWLlFcqwrhQCYlc3PKa1Hgyr0Wc4otEx2eA5CBX31h+cuO0bmeZrRfIW1guoAC
         8dMUCqu5xhkzN5sjp3sZ4472StpW/ntKOROjDT7N9A/9L+Z9rwGC+BUoZ5fRnD54oobF
         33fgiMFXUIBcTHV7ScB9U3EFvKyOtsq5PZmgQYmIZGHIcDoe58I002ChkVlyg+3FcY/f
         sfOb/TbMuq4NMDdQZyRhJRp39E73F3/xragyXXJkQs3r1D+CHq/aImQiZYT3Ml1xzs7B
         KQzg==
X-Gm-Message-State: AOJu0YyAHVziRS4eFOpUE6V/M/6v/wgMIsiwMcOm0ashRN4BxV4Ql68A
	0Iyp4RtTE5eFqmKVNVMOLqV3FYuG//R9dj6GqR87aluSSxdXmVMeLkwU/9ijz5CwE+e4xK3yxPz
	FvTlSHwOfB9gImjmUENAXe1aa5SwR2RfXlKN4hQfDV30Zv9We1aVd
X-Gm-Gg: ASbGncuIIUlvC/KNG2o41pmQvGzW7P0hpwwhNq4ABnSRsZEpeEPKS1RtYGq/Rql4v1I
	BHBvbFKFoE0ON+yWuJI5yRyzwD8Mah+ME7xeNWGsBb9Bdb58w5UJrjQnq0mspHXkGFL+EK0ohFn
	ChG1fcBildF3A3XBtQawYxR0LLj/AAYLC/zLTAvPm4YsteFK/wjh7s8MlLVl8QEfsDy99fl+YuI
	+tnEG8M7ZROmJx5JDs+DGaKqduFJvoHjkQeYW3prnR/37EK714M+3evE4g9eeLlYEnikt1XgRLA
	hQzd2/A=
X-Google-Smtp-Source: AGHT+IGeueyJOy1aKT154lwQu4803/Fr5Ve7HUs4r7826eRYd/VJN2ld10jEf4FvM4R6AOfNavcX566ozx6ODXuXFj0=
X-Received: by 2002:a05:6820:2289:b0:659:9a49:8f99 with SMTP id
 006d021491bc7-6599a8cc335mr1740572eaf.18.1765084528238; Sat, 06 Dec 2025
 21:15:28 -0800 (PST)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Sun, 7 Dec 2025 10:45:17 +0530
X-Gm-Features: AQt7F2rnKUjcXxVQf2br5xcDT6SNUw4KM8I_OrHeRrZ4i85gaQw2TUkndDFH800
Message-ID: <CAAhSdy0tLFGdT-UfFzD7X0=-A7_mrEZ-NgFbCJDKhBUtOUDCRA@mail.gmail.com>
Subject: Upcoming OpenSBI v1.8 release
To: OpenSBI <opensbi@lists.infradead.org>
Cc: Atish Patra <atish.patra@linux.dev>, Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_211529_491423_B958BECB 
X-CRM114-Status: UNSURE (   2.53  )
X-CRM114-Notice: Please train this message.
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

Hi All,

We are close to the OpenSBI v1.8 release. I plan to complete this
release by the end of December (30th or 31st Dec 2025).

Next 3 weeks, I will be mostly merging fixes and some of the
in-flight patches.

I request everyone to test the latest OpenSBI on their RISC-V platforms.

Best Regards,
Anup

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
