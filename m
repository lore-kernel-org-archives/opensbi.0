Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E01CD98E2
	for <opensbi@archiver.kernel.org>; Wed, 17 Jun 2026 16:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5Z2gtmoDa0FFnfMVvsn6OUmEVS/cxziDnwRMQq4aZYQ=; b=jqXecD1+KzmSRS
	OF9S2EW9Ds4QWNVZ1u53RnSY3nxwMx5GBl+UHpicPMw0tLlYGx4YlQvHeG6NgrvEynQaFty1YwysQ
	LzHtMxz7Iq0XiMBlxeUD8wauWY6xz0EmoZ0HdywClcwL/xwFUEj/X05ot9PoH2gk/I4rJ+dDEJS/t
	1vx0KPYPkff4ck/0Z/dOO6Zo85lbD/Z9ru1QHuYOFO+VbOGwbA3LeE+yJhDLeVIaP6NWq5WSYbb4/
	sJj3N5iIWVH9S+cnPF88zMiC9VqO5//w2fC4j8leGErOO3rj3YBZIu9HdW4yhbxS+9cIdtd7Or5r4
	wz3t/dKsCAVH+VpBJplQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZtRv-000000004Sn-2ZtW;
	Wed, 17 Jun 2026 16:49:11 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZtRs-000000004SC-3QSo
	for opensbi@lists.infradead.org;
	Wed, 17 Jun 2026 16:49:10 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-4864ebb6268so3531961b6e.3
        for <opensbi@lists.infradead.org>; Wed, 17 Jun 2026 09:49:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781714947; cv=none;
        d=google.com; s=arc-20240605;
        b=b+h+D0suNFsfETemFGeON4BK75Q8+4V259XyMHrENhvyft2RaeXn2aalK7EnR59Xfu
         fWythqgho6Yxb5ydRir2a8tOxFkPgnVPhH2r4Zh7ttvTEagiaj688BeSSKwNAddvpaeF
         Jtvp+hGo9HbCQzQQy1w8+xCNx3zh9U5mSKM5I2KW2Bh7UcGco6JrTccoEcABL7cnK+aG
         Qz9mOfRSG9k0O15vIWyAs8ke5NjUYZ34pVkNYQdwUb9P34im0dPz5P5t45sc7VuEZpo3
         NvsBQimpLSsA9C6URLUYtqGEimqf1LcgOrb06zM8UI8KIwQLWnIbdk7/bxzADDys9yLn
         yA2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=nZv+wO+sn0pOZwLtBET2AOlBRIxjLcyTrD/66YsLMk0=;
        fh=j6rc51AWEQIduiFDFRDvYgYQBLVmfT3WvNe3z6zEMdM=;
        b=GW6rg7DBWivNAmV9q86UOL+8tQV9BEKFGTKAXOZw62wwcIwujdMdXhTXZ4pEfFnUia
         liv6pLwmHDFaAYoyNtm0mH4lmGtGCA7OG5UkKVYl77cbxS+Yy7gWlw1GJ2Q3WJqk3Zjx
         lBDhvurfz6iPUIsYixqJ6zzUTcDgUIkRUIji4ct/KvNKS83C+A/MiWPtJPaY3bQWffww
         wiOFYs74RWZWAj9o6Dp+uB2yZteKoEWZgwp/ETSzCm69E2MK37v8WDlSm91z7PiC4kF7
         CfNAKGAamkb8QtZNeOITI4F8XWvQcYbL111eQj/b9wJ7vjBKRnA5bvxRgkv154iKKRHM
         MRsQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1781714947; x=1782319747; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nZv+wO+sn0pOZwLtBET2AOlBRIxjLcyTrD/66YsLMk0=;
        b=U/wIcHo0cbv1IJcmt/vxSmKObM+HL0OhKmxt/PwLrbQYUH2X3mbKQhutZgGm3VlzNp
         msdUclkoFTZ4q48Q1Ky7/ho4Np8hHQT+9swWyd1/g6CZitTdZPai8TCBaciKUorT7kQC
         dGkLPUz1ryTcoSRT9b7IX2iiwDDJHy6JUYfiRZDRXUIT9PurSIIxOVa1rHkplng8qMMD
         Q5HFZcqPt+FSN0wjXqpWbgI40UabWVjKh6Fe16UUhFBysOfCcRf8u2+AFZv51ZeeiIDR
         91R6xcVM4mQeyEP/Evta7s5ZepnSoax6Cw8Dh8NY+4PChhXsY7sMoEJRq+TdzbA4/JOx
         4SjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781714947; x=1782319747;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nZv+wO+sn0pOZwLtBET2AOlBRIxjLcyTrD/66YsLMk0=;
        b=eJUNBlT8V0bzWBYBEPGDy+6EY67sSajksbZyJu8kjG3Z4DLLwgJcMcrN9r7iwNZ5KS
         hkiTZILX0JVmCPASUTkcxPknMth29tybvco+YbYtMnTu+VHBDGA5viMOB5HXxeDtQGgf
         X8bdcuhoXoPVThpJR1kMHT4thVL7VALVchgf2RGBKRpv5AcsChWgW3UPcC4oN4Guf27c
         E7JZIx6s5idW8h0xDjwMhEufGZi9Rp6rPZL6mTCoAsCV694jgcMonvdePJ15xNXHqqsB
         FvmOhHwGUqir5/atn6YJHjirgkBprhsRBIeKK3UoOPhZkTuu4MZHkTPSeuC7rrsw2ZvL
         9isw==
X-Gm-Message-State: AOJu0Yx/hna+UHsLczESHcu8NS2K6fYUws6rvX/OUTMOJFhj7kBZiabq
	603+zSLo4mr9N6w5WbAAJnxZ4Px2aZxhS4y6eYGJnmmjxDl4nvj6VjM4Ueg+MhMq90RSeCvni/J
	RS9GTonXrIOH6iT27/p6aC0LrSMjhevC+cmuTV1wLcMx/9oOXSO8lUFKzyg==
X-Gm-Gg: Acq92OGZgIck+FXfz7SI29knEZ3tZjP++6n9ibr5DTGlMulRzON9sJfsxvUp69dZpXO
	v5ZM3m6q1Syo6Rl2BAJ+D5yOkFvPAO7ZWJbXFFvCkMnb569jErbBsMIdhW/qZ8RiVZT0phCPJxP
	ApDqGqDA6hS9gFexQVulSHDf+yWZ5o70aMAUON7rMF//E/nWdNOaKT/ip7+HEDJb7rHhyc9Xx5O
	2J2zyshOaWaPxCwmwitw5wMy7CDanOXHEyZRnisKPNj6JRwoRPjIDr1w/mMVUQYZs3wdsUS/I+6
	zXuYwWGUI8pn/ky2eUCHESPLRom2mZCGtdazGpw+tLSQgBvqfNchA9EJg3jLPWTSTFVIC3FapPS
	o5xL8Fz961dtdO6I=
X-Received: by 2002:a05:6808:19a7:b0:486:49e2:91d8 with SMTP id
 5614622812f47-489445f1e82mr4134048b6e.20.1781714947397; Wed, 17 Jun 2026
 09:49:07 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Wed, 17 Jun 2026 22:18:56 +0530
X-Gm-Features: AVVi8Cc5fcN9A7-ffSlA-CHx8h-ttzw5OghL8OlqhKChwy5CxgkPhjsHLCQI5nQ
Message-ID: <CAAhSdy3gbrLYmRPhD-ABXZUW0SjXk5xpQbZ_vrb1hsaJ0N3qTQ@mail.gmail.com>
Subject: Upcoming OpenSBI v1.9 release
To: OpenSBI <opensbi@lists.infradead.org>
Cc: Atish Patra <atish.patra@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_094909_108063_34054900 
X-CRM114-Status: UNSURE (   3.38  )
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

We are close to the OpenSBI v1.9 release. I plan to complete this
release by the end of June (29th or 30th June 2026).

This week and next week, I will be mostly merging fixes and
few of the in-flight patches.

I request everyone to test the latest OpenSBI on their RISC-V platforms.

Best Regards,
Anup

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
